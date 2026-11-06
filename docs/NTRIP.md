# NTRIP client

`kshana ntrip` fetches a stream from an NTRIP caster: RTCM 3 corrections for a receiver, or a
reference station's observations for Kshana to read. It passes the bytes on unchanged and counts the
RTCM 3 frames that arrive intact.

```sh
kshana ntrip caster.example:2101                                  # the caster's source table
kshana ntrip caster.example:2101 --mount TLL00EST0 \
  --user rover --password-env NTRIP_PASSWORD --gga 59.44,24.75,30 \
  --out tallinn.rtcm3 --seconds 3600
kshana obs convert tallinn.rtcm3 --format rtcm3 --station station.toml --out tallinn.obs.jsonl
```

- **Request.** One HTTP request for the mountpoint, with `Ntrip-Version: Ntrip/2.0`, Basic
  authentication when `--user` is given (the password is read from the environment variable named by
  `--password-env`, never from the command line) and, with `--gga`, the position as a GGA sentence: in
  an `Ntrip-GGA` header, and again after the request for an NTRIP 1 caster.
- **Answers.** `ICY 200 OK` (NTRIP 1) and `HTTP/1.1 200 OK` (NTRIP 2, with or without chunked transfer
  encoding) both give the stream. A refusal (for example 401) is reported. An unknown mountpoint,
  answered with the source table, is reported as such.
- **Output.** The bytes go to `--out` or to standard output, unchanged. At the end, standard error
  shows the byte count, the RTCM 3 frames with a valid CRC-24Q, those with a bad one, and the message
  numbers seen. `--max-bytes` and `--seconds` end the run.
- **Limits.** Plain TCP only: for a caster on HTTPS, use a local TLS relay. Kshana does not send the
  corrections on to a receiver itself; write them to a file or pipe standard output to the receiver's
  port.

Checked against a loopback caster (`tests/ntrip.rs`): an NTRIP 2 chunked stream cut in the middle of
frames and an NTRIP 1 stream both arrive byte for byte, the credentials and the position reach the
caster as each protocol carries them, a refusal and an unknown mountpoint are reported, and the frame
count does not depend on where the stream is cut.
