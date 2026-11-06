---
name: Integration request
about: Ask for Kshana to read a device, a feed or a system it does not read yet
labels: integration
---

**What should Kshana read or feed?**
(The device, protocol or system, and its version.)

**How does the data arrive?**
(A file export, a serial port, TCP/UDP, MQTT, NATS, a WebSocket, an HTTP API...)

**A sample** you can share (no customer data, no personal data), or a link to the public format description.

**What do you need out?**
(Observations, trust scores, alerts, metrics.)

Many formats need no code: a mapping file (docs/CONNECT.md) reads most CSV and JSON exports. If yours
does, consider sending it as an adapter (docs/ADAPTERS.md).
