// Serves a recorded gated NMEA stream to OpenCPN (which connects as a TCP client), one cycle
// (up to and including each $PKSHT) per interval. Used by run-in-opencpn.sh.
//   node feeder.mjs <stream.nmea> <interval_ms> [port]
import fs from 'node:fs'
import { startRelay } from '../nmea-tcp-relay.mjs'

const [, , file, ms = '1000', port = '10110'] = process.argv
const lines = fs.readFileSync(file, 'utf8').split('\n').filter(Boolean)
const relay = startRelay({ port: Number(port), waitClients: 1 })
await relay.listen()
console.error('listening')
await relay.ready()
console.error('client connected')
let cycle = []
for (const l of lines) {
  cycle.push(l)
  if (l.startsWith('$PKSHT')) {
    relay.write(Buffer.from(cycle.join('\r\n') + '\r\n'))
    cycle = []
    await new Promise((r) => setTimeout(r, Number(ms)))
  }
}
console.error('done')
await new Promise((r) => setTimeout(r, 4000))
relay.end()
