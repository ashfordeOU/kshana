# Adding a sensor by description (`kshana.device/1`)

A partner adds a binary sensor to Kshana with two text files and no change to Kshana's code:

1. a **device file** (`kshana.device/1`) that says how the sensor's byte stream is framed and what its
   messages hold; `kshana device decode` turns the stream into JSON Lines, one row per message;
2. a **mapping file** (`kshana.connect/1`, see [CONNECT.md](CONNECT.md)) that says which of those row
   fields are the time, the position, the C/N0, the gain control and so on; it turns the rows into
   `kshana.obs/1`, which every Kshana monitor reads.

A worked example is in `examples/devices/`: a made-up GNSS monitor with its own protocol.

```sh
kshana device check examples/devices/example-monitor.device.toml           # its own test vectors
kshana device decode examples/devices/example-monitor.device.toml --from capture.bin > rows.jsonl
kshana connect map rows.jsonl --mapping examples/devices/example-monitor.connect.toml \
  --station examples/obs/station.toml --out site.obs.jsonl
nc 192.0.2.7 5000 | kshana device decode monitor.device.toml --from -       # live
```

## The device file

```toml
schema = "kshana.device/1"
name = "example-monitor"

[framing]
sync = "A5 5A"                                       # bytes that start every frame, in hex
length = { offset = 2, type = "u16le", add = 7 }     # frame length = value + add  (or fixed_length = N)
checksum = { type = "crc16-ccitt-false", from = 2, endian = "be" }   # in the last bytes of the frame
max_length = 64                                      # longest real frame (default 2048)

[[message]]
name = "fix"
id_offset = 4                                        # where the message id is, and its type
id_type = "u8"
id = 1
field = [
  { name = "t_ms", offset = 5,  type = "u64le", unit = "ms since 1970 (UTC)" },
  { name = "lat",  offset = 13, type = "i32le", scale = 1e-7, unit = "deg" },
  { name = "agc",  offset = 25, type = "u16le", invalid = 65535 },
]

[[test]]                                             # one frame and what it must give
hex = "A5 5A 16 00 01 ..."
message = "fix"
expect = { lat = 59.4375 }
```

- **Field types:** `u8`, `i8`, `u16le`, `u16be`, `i16le`, `i16be`, `u32le`, `u32be`, `i32le`, `i32be`,
  `u64le`, `i64le`, `f32le`, `f32be`, `f64le`, `f64be`. Offsets count from the first sync byte. The value
  is `raw * scale + add`; a raw value equal to `invalid` gives `null`. An integer field with no scale and
  no offset stays an integer. `unit` is for the reader of the file and is not converted: the mapping file
  states units.
- **Checksums:** `xor8`, `sum8`, `fletcher8` (two bytes, `CK_A` then `CK_B`), `crc16-xmodem`,
  `crc16-ccitt-false` and `crc32` (IEEE), computed from byte `from` to just before the checksum, which
  fills the last bytes of the frame (`endian` for its byte order). The CRCs are checked against the CRC
  catalogue's values for `123456789`.
- **Framing:** bytes before a sync are skipped. A frame whose length is impossible or above `max_length`,
  or whose checksum does not match, is counted and the search resumes one byte later, so a sync pattern
  inside the data cannot swallow real frames. Frames of messages the file does not list are counted and
  passed over. The rows do not depend on how the bytes arrive: in one piece or a byte at a time.

## Conformance

`kshana device check` decodes every `[[test]]` frame and compares the stated values (to 1e-9, relative).
Ship at least one vector per message. `tests/device.rs` runs the example end to end: a stream with junk,
false syncs, a corrupted frame and an unlisted message, in pieces from 1 to 500 bytes, decodes to the same
rows, and the mapping file turns them into a `kshana.obs/1` file that `kshana obs check` accepts. A text
sensor (CSV, JSON) needs only the mapping file; see [CONNECT.md](CONNECT.md) and [ADAPTERS.md](ADAPTERS.md)
for registering either kind.

What this does not do: decode variable-length repeated blocks inside a message (one row per repeated
block), bit fields narrower than a byte, or multi-frame messages. Those need a reader in code.
