# Industrial and grid control: Modbus TCP, DNP3, OPC UA (0.42 I7)

Kshana reads timing and status points from industrial control systems so a clock's alarms and
offsets can sit beside the GNSS trust stream. Every client here only reads.

| Command | Protocol | What is sent | What is never sent |
|---|---|---|---|
| `kshana connect modbus <host:port>` | Modbus TCP | function code 1, 2, 3 or 4 (read coils, discrete inputs, holding or input registers) | any write code (5, 6, 15, 16, 22, 23): refused before a byte leaves |
| `kshana connect dnp3 <host:port>` | DNP3 over TCP | READ of class 0 (group 60 variation 1), and the application confirm the outstation asks for | control, write, freeze, restart, time sync |
| `kshana connect opcua <opc.tcp://host:port>` | OPC UA binary | Hello, OpenSecureChannel, CreateSession, ActivateSession (anonymous), Read of the Value attribute, CloseSecureChannel | Write, Call, subscriptions |

Each prints one JSON document.

```sh
kshana connect modbus 192.0.2.30:502 --unit 1 --fc 4 --start 100 --count 4
kshana connect dnp3 192.0.2.31:20000 --master 1 --outstation 10
kshana connect opcua opc.tcp://192.0.2.32:4840 --node "ns=2;s=Clock.Offset" --node "ns=2;s=Clock.Holdover"
```

## Modbus TCP

Follows the Modbus Application Protocol V1.1b3 and the Messaging on TCP/IP Implementation Guide
V1.0b (Modbus Organization, public). Registers are printed as unsigned 16-bit words, coils and
discrete inputs as 0 or 1; how the words combine (32-bit, float, scale) is the device's register
map. An exception response is reported with its code. Limits: 125 registers or 2000 bits a request.

## DNP3

Follows IEEE 1815-2012 for the link frame and its CRC, the transport header and the object
variations decoded: binary input (g1v1, g1v2), double-bit input (g3v2), binary output status
(g10v2), counters (g20v1, v2, v5, v6), analog input (g30v1 to v6) and analog output status (g40v1
to v4), with range (0x00, 0x01) and index-prefixed (0x17, 0x28) qualifiers. Decoding stops at the
first object it does not decode and says which (`stopped_at`), so the points before it are still
reported. Responses split over several transport segments are reassembled. Secure Authentication
is not implemented.

## OPC UA

Follows OPC 10000-6 (UA TCP, UA Secure Conversation, binary encoding) and OPC 10000-4 (services).
Security policy None only, with an anonymous identity: the server must offer an endpoint with an
anonymous token policy. Everything travels in clear, so use it on a trusted network or through a
tunnel. Node ids are `i=<n>`, `ns=<n>;i=<n>` or `ns=<n>;s=<name>`. Each value is printed with its
status code and the source and server timestamps (UNIX seconds) when the server sends them;
scalars and one-dimensional arrays of the numeric, Boolean, String, DateTime, ByteString,
StatusCode and LocalizedText types are decoded.

## Tests

`tests/connect_042_w2.rs` runs each client against an in-process fake written from the public
specifications: a Modbus server (registers and an exception), a DNP3 outstation (a response over two
transport segments, the confirm checked) and an OPC UA server (anonymous policy chosen from the
endpoints, Read with Double, Int32 array and String values, and an `ERR` message). The DNP3 CRC is
checked against the CRC-16/DNP catalogue check value. Testing against open62541 and pymodbus is an
optional extra, not part of CI.

## Not built yet

- An OPC UA server (read-only by default) exposing the trust stream.
- OPC UA signed and encrypted security policies and user-name or certificate identities.
- DNP3 Secure Authentication, unsolicited-response subscriptions and DNP3 over serial.
- IEC 61850 MMS and GOOSE.
