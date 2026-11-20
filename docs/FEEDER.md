# Feeder clients

A feeder runs a GNSS receiver or a receive-only software-defined radio (SDR) and shares what it
observes. `kshana feed` packages a station's own `kshana.obs/1` files ([OBS-SCHEMA.md](OBS-SCHEMA.md))
into a signed **feed bundle**, `kshana.feed/1`, ready to upload. The default privacy mode is safe
to publish: nothing in the bundle names the feeder or traces where it moves. Nothing here
transmits radio signals, and nothing is ever written to a receiver.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| C/N0 | carrier-to-noise density ratio |
| dBFS | decibels relative to full scale |
| GDPR | the EU General Data Protection Regulation |
| HTTP | HyperText Transfer Protocol |
| IQ | in-phase and quadrature samples |
| JSON | JavaScript Object Notation |
| SDR | software-defined radio |
| SHA-256 | the 256-bit Secure Hash Algorithm |
| TLS | Transport Layer Security |

## Commands

```bash
kshana evidence keygen --out feeder.key                     # the feeder's Ed25519 key, once
kshana feed pack station-data/ --key feeder.key --out bundle.json
kshana feed verify bundle.json [--pubkey <hex>] [--json]
kshana feed send bundle.json --url http://collector.example:8080/feed [--token-file token]
kshana feed spectrum capture.cu8 --format cu8 --rate 2048000 --centre 1575420000 \
  --station station.toml --out spectrum.obs.jsonl
kshana feed leaderboard bundles/*.json [--json]
```

### `pack`

Reads `.obs.jsonl` files, or directories of them. A directory is read like a Station's output
(`<dir>/<source>/<sequence>.obs.jsonl`): its files and those one level down. The newest file of each
directory is left out, because a running Station is still writing it; `--include-open` takes it too.
Every file is checked as `kshana.obs/1` first. A bundle holds one station.

| Option | Meaning |
|---|---|
| `--key <file>` | the feeder's signing key (64 hex digits, as `kshana evidence keygen` writes it) |
| `--privacy public\|exact` | default `public` (below) |
| `--grid-deg <deg>` | the location grid of `public`, 0.01 to 10 degrees, default 0.1 |
| `--created <time>` | the time written into the bundle; default the computer's clock, UTC |
| `--out <file>` | default standard output |

### Privacy: what `public` publishes

| In the input | In a `public` bundle |
|---|---|
| station `id` | `feeder-` and 12 hex digits of the SHA-256 of the feeder's public key: stable for one feeder, not its name |
| station latitude and longitude | moved to the nearest point of the grid (0.1 degree: about 11 km north to south) |
| a station whose fixes spread over more than 2 km | no position at all (a moving receiver) |
| station height, operator | removed |
| antenna, receiver, firmware | kept: they describe equipment, not a person |
| per-epoch position fix | removed, so no track can be rebuilt |
| moving-platform records (speed, heading) | removed |
| byte offsets into the local log, IQ recording references | removed |
| alarm notes (free text) | removed; the alarm's kind, severity and time stay |
| C/N0, gain control, jamming indicator, sky, DOP, the receiver's own flags, corrections, spectra | kept: these are the observations |
| local file names | replaced by `part-001.obs.jsonl`, ... |

The bundle's `privacy` block lists the fields that were present and removed. `exact` keeps every
field and the station's own id; choose it only for data that names no person, or with the
consent of the people it describes. These defaults are a design choice: whether a deployment meets
data-protection law depends on its context and is to confirm with its operator.

`verify` checks that a bundle that says `public` really is: the pseudonymous id matches the key,
positions lie on the grid, and no payload carries a fix, a movement record, an IQ reference or a note.

### `kshana.feed/1`

One JSON document:

| Field | Meaning |
|---|---|
| `schema` | `kshana.feed/1` |
| `engine` | the engine version that packed it |
| `created` | when it was packed, as the packing computer states it |
| `signer` | the feeder's Ed25519 public key, hex |
| `station` | the station id every payload carries |
| `privacy` | `mode` (`public` or `exact`), `grid_deg`, `moving`, `removed` |
| `files` | per payload: `name`, `sha256`, `epochs`, `alarms`, `corrections`, `spectra`, `span_s`, `start_label`, and `content` (the `kshana.obs/1` file itself) |
| `signature` | Ed25519 (RFC 8032), hex, over the bytes `kshana.feed/1\n` followed by the bundle's JSON with `signature` empty |

`verify` checks the schema, the signature (against `--pubkey` when given), every payload's SHA-256,
every payload as `kshana.obs/1` of the bundle's station with the stated counts, and the `public`
claim. It exits 2 on the first problem.

### `send`

Verifies the bundle, then posts it as `application/json` to an `http://` address, with
`Authorization: Bearer <token>` when `--token-file` is given. Like the Station's fleet report it is
plain HTTP: across a network, put a TLS tunnel in front of it. What a collector answers (a receipt,
for example) is the collector's own format and is not defined here.

### `spectrum`: an SDR spectrum snapshot (receive only)

Reads a raw IQ capture and writes an observation file with one `spectrum` record: Welch's averaged
periodogram (Hann window, half overlap; [`kshana::spectrum::welch_psd`](../src/spectrum.rs)) of the
first `--max-samples` samples (default 2,097,152), averaged into `--bins` equal bins (default 256)
from −rate/2 to +rate/2, in dBFS per hertz.

| Front end | Capture | `--format` |
|---|---|---|
| RTL-SDR | `rtl_sdr -f 1575420000 -s 2048000 -n 4194304 capture.cu8` | `cu8` (unsigned 8-bit, offset binary) |
| HackRF | `hackrf_transfer -r capture.cs8 -f 1575420000 -s 8000000 -n 8000000` | `ci8` (signed 8-bit) |
| others | interleaved signed 16-bit little-endian | `ci16_le` |

The levels are relative to the decoded samples (full scale 1), not calibrated power, and depend on
the front end's gain setting: MODELLED. `--time` records the capture's absolute time when the operator
knows it; `--front-end` names the device (default `rtl-sdr` for `cu8`, `hackrf` for `ci8`). The
capture tools above only receive; Kshana reads their files and never drives a radio.

### `leaderboard`

Ranks bundles by feeder: verified bundles only, each payload counted once however often it is
submitted (by its SHA-256), ordered by epochs, then hours covered, then spectra. Bundles that fail
verification are listed with the reason and not ranked. `--json` writes `kshana.feed-leaderboard/1`.

## From a Kshana Station

The Station ([STATION.md](STATION.md)) writes the files a feeder packs. A timer that packs and
sends the closed files every hour:

```ini
# /etc/systemd/system/kshana-feed.service
[Service]
Type=oneshot
WorkingDirectory=/var/lib/kshana-station
ExecStart=/bin/sh -c 'kshana feed pack station-data --key feeder.key --out bundle.json && kshana feed send bundle.json --url http://127.0.0.1:8080/feed --token-file token'

# /etc/systemd/system/kshana-feed.timer
[Timer]
OnCalendar=hourly
[Install]
WantedBy=timers.target
```

Keep the key readable by the service user only (`chmod 600 feeder.key`); `pack` warns when it is not.

## Android phones: the client specification

There is no Android application in this repository. This section specifies one, so that a phone's
observations become the same bundles. The Rust side exists: `kshana obs convert --format android`
reads the GnssLogger text format, and `kshana feed pack` packs the result.

1. **Collect.** Record raw GNSS measurements (`GnssMeasurement`: C/N0, AGC where the phone gives it)
   and the satellite status, as the GnssLogger app's text format does, through the platform's
   location service. Do not record the phone's position by default.
2. **Convert.** Turn each session into `kshana.obs/1` with the same reader as
   `kshana obs convert --format android` (shared code through the crate's C or WebAssembly build, or
   on a computer afterwards).
3. **Coarsen.** Apply the `public` rules above on the phone, before anything leaves it. A phone is a
   moving receiver: publish no station position unless the user sets a fixed one, which is then put
   on the grid.
4. **Sign.** Keep the Ed25519 key in the platform's key store where it supports Ed25519 (the
   Android version that does is to confirm); otherwise in app-private storage. Sign exactly as
   `kshana.feed/1` above, so `kshana feed verify` accepts the bundle.
5. **Consent and control.** Feeding is opt-in; the user sees what a bundle holds before it is sent,
   can stop at any time, and can delete the key, which ends the pseudonym.
6. **Upload.** Over HTTPS to the collector the user chose, on an unmetered network by default.

## Limits

- One station per bundle; a feeder with several stations packs each separately.
- A Station configuration names one fixed position: a moving receiver is detected from its fixes
  only, and a log with no fixes is treated as fixed.
- `send` speaks plain HTTP and reads only the reply's status code.
- The leaderboard ranks what it is given; it cannot know that two keys belong to one feeder.
