# Kshana trust: Signal K plugin

Publishes the Kshana receiver-trust score, band and reasons into a Signal K server and raises a
Signal K notification when trust collapses. Full guide, paths and wiring:
[`docs/MARINE-INTEGRATIONS.md`](../../docs/MARINE-INTEGRATIONS.md).

> **Advisory software.** Not type-approved navigation equipment. The operator stays responsible
> for the safe navigation of the vessel.

No npm dependencies. Not published to npm. Install by copying or linking this directory into the
server's `node_modules` (or `~/.signalk/node_modules`) and enabling "Kshana GNSS trust" in the
server's plugin configuration.

```sh
npm test   # node:test, recorded synthetic stream, no network beyond localhost
```

All wire-format knowledge is in `lib/adapter.js`; a change to `kshana receiver-trust live`
output is a one-file edit there.
