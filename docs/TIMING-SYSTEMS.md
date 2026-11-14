# Timing systems: PTP management, SNMP and NTP (0.42, I2)

Kshana reads the state of the clocks a timing network depends on: a PTP clock through its
management interface, a grandmaster or time server through SNMP, and chrony or ntpd through what
their own tools print or, for ntpd, the NTP control protocol. Everything here **only reads**. No
command sends a PTP SET or COMMAND, an SNMP SetRequest, or an NTP write, configuration or trap
request; the encoders refuse to build them (unit tests `set_and_command_are_never_built`,
`a_set_request_is_never_encoded`, `write_and_other_opcodes_are_never_encoded`). Nothing here
configures a device.

```sh
kshana connect timing pmc pmc-output.txt            # linuxptp pmc text  -> JSON (blocks + status)
kshana connect timing ptp-mgmt response.bin         # one binary management message
kshana connect timing chrony-tracking tracking.txt  # chronyc tracking   -> JSON (+ health)
kshana connect timing chrony-sources sources.txt    # chronyc sources
kshana connect timing ntpq-peers peers.txt          # ntpq -p
kshana connect timing ntpq-rv rv.txt                # ntpq -c rv          -> JSON (+ health)
kshana connect snmp 192.0.2.10:161 --map generic    # SNMPv2c GET/GETNEXT poll through an OID map
kshana connect ntp 192.0.2.20:123                   # NTP mode 6 read variables (association 0)
kshana connect timing check conformance/timing      # the timing vectors; --bless rewrites them
```

`-` reads standard input, so `pmc -u -b 0 'GET CURRENT_DATA_SET' | kshana connect timing pmc -`
works. Each command prints one JSON document; a parse failure names the line.

## PTP management (`src/ptp_mgmt.rs`)

**Text.** `pmc` prints each response as a header line
(`<portIdentity> seq <n> RESPONSE MANAGEMENT <DATA_SET>`) and tab-indented `name value` lines; the
`sending:` echo lines are passed over. Every block is kept (`blocks`), and `status` gathers what a
monitor wants, the last value of each winning: port state, offset from master and mean path delay
(ns), steps removed, `TIME_STATUS_NP` master offset and `gmPresent`, the grandmaster identity, clock
class, accuracy and variance, this clock's class, the UTC offset and its validity, the leap flags,
PTP timescale, time and frequency traceability, and the time source. A `MANAGEMENT_ERROR_STATUS`
response is counted under `errors`.

**Binary.** `ptp_mgmt::decode` reads a management message (the UDP payload) and the data sets
`DEFAULT_DATA_SET`, `CURRENT_DATA_SET`, `PARENT_DATA_SET`, `TIME_PROPERTIES_DATA_SET`,
`PORT_DATA_SET` and linuxptp's `TIME_STATUS_NP`; `get_request` builds the GET that `pmc` sends;
`render_pmc` writes a response the way `pmc` prints it. The layouts are IEEE 1588-2008 clause 15 as
linuxptp implements them (`msg.h`, `ds.h`, `tlv.h`); the text form is `pmc_show` in linuxptp's
`pmc.c` (checked against the sources on 14 November 2026). The round trip binary → `pmc` text →
parser → status is tested for five data sets (`ptp_binary_to_pmc_text_and_back`). This release does
not open a PTP socket: pipe `pmc` (which runs on the host with the clock) into the parser.

## SNMP (`src/snmp.rs`)

A minimal SNMPv2c client: BER encoding and decoding (X.690) of the messages it needs, GetRequest and
GetNextRequest over UDP with a timeout and retries, a walk built on GETNEXT that stops at the end of
the subtree or an exception, and no external crate. An SNMPv2-Trap PDU is decoded by
`decode_message`; no trap listener is opened.

An **OID map** (`kshana.snmp-map/1`, TOML) names what to read: scalars by one GET each (so one
missing object does not fail the rest), columns by a walk, with optional labels for enumerated
values. What the agent lacks is listed under `missing`. Built in:

| `--map` | MIBs | Source |
|---|---|---|
| `generic` | SNMPv2-MIB `system`; NTPv4-MIB `ntpEntInfo`, `ntpEntStatus` (mode, stratum, active source, offset, dispersion, leap direction); PTPBASE-MIB current, parent, default, running and time-properties data sets (offset, mean path delay, grandmaster identity and quality, clock state `freerunning`..`phaseAligned`, UTC offset, traceability, time source) | RFC 3418, RFC 5907, RFC 8173 |
| `meinberg-ltng` | Meinberg LANTIME: NTP state, stratum, selected reference clock and its offset, and per reference clock the type, usage, state and substate (`gpsSync`, `gpsAntennaDisconnected`, ...) and the status values | Meinberg MBG-SNMP-LTNG-MIB, revision 2022-12-08 (shipped on LANTIME devices; mirrored by LibreNMS) |

Microchip TimeProvider and Oscilloquartz maps are not included: their MIBs were not obtained from a
public source. A map for any other device is a TOML file passed to `--map`, in the layout of
`src/snmp_maps/generic.toml`. The community string comes from an environment variable
(`--community-env <VAR>`; `public` when not given), never from the command line.

Tested against a loopback agent on 127.0.0.1 that serves a table (`snmp_poll_of_a_loopback_agent_with_the_meinberg_map`),
and with a GetResponse built by an independent encoder (`conformance/timing/snmp-message/`).

## chrony and ntpd (`src/time_server.rs`)

- `chronyc tracking`: reference, stratum, system offset (signed: positive when the system clock is
  fast of NTP time), last and RMS offset, frequency (positive when fast), residual frequency, skew,
  root delay and dispersion, update interval, leap status.
- `chronyc sources`: mode and state, name, stratum, poll, reach, last RX age, adjusted and measured
  offset and error (units `ns`, `us`, `ms`, `s` converted to seconds).
- `ntpq -p`: tally code, remote (a long remote printed alone on its line is joined with the next),
  refid, stratum, type, when, poll, reach, delay, offset and jitter (ms).
- `ntpq -c rv` and NTP mode 6 read variables: the variable list (quoted values kept whole; an
  unquoted value with commas, such as `reftime`, kept whole), and the system status word split into
  leap, clock source, event count and event code (RFC 9327 section 3.1).
- `kshana connect ntp <host:port>` sends one read-variables request (opcode 2) and reassembles the
  response fragments by offset. Tested against a loopback server that sends its two fragments out
  of order.

`health` puts either daemon into the same terms: synchronised (chrony: leap status other than
`Not synchronised` and stratum below 16; ntpd: leap indicator other than 11 and stratum below 16),
stratum, reference, offset (s), root delay and dispersion (s), leap state, and with a source list
the number listed, the number reachable and the selected one. It reports what the daemon says; it
does not judge the clock. For holdover, MTIE and time-to-breach, feed the daemon's logs to the clock
readers ([CLOCK-LOG-FORMATS.md](CLOCK-LOG-FORMATS.md)).

## Vectors

`conformance/timing/<name>/` holds a `vector.toml` (`parser`, `input`, `expected`), the input, the
expected JSON and a `SOURCE.md` naming where the input came from: the chrony documentation's
example output for `chronyc tracking` and `sources`; hand-built text in the layouts `pmc` and `ntpq`
print; binary PTP, SNMP, NTP mode 6 and RTCM inputs written by `conformance/tools/gen_042_vectors.py`
from the public documents. `tests/connect_042_i2_i3.rs` runs them byte for byte. No capture from a
real device is included yet: the vectors show that the parsers read the documented layouts, not
that every firmware prints them the same way.
