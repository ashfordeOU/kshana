// End to end with the real binary: kshana receiver-trust live --gate | relay | TCP consumer.
// Not part of `npm test` (it needs a built kshana and takes a few seconds):
//   KSHANA_BIN=target/release/kshana [KSHANA_DEMO=<dir with session.toml and the demo .nmea>] npm run e2e
import { spawn } from 'node:child_process'
import net from 'node:net'
import assert from 'node:assert'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { startRelay } from '../nmea-tcp-relay.mjs'

const here = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(here, '../../..')
const bin = process.env.KSHANA_BIN || path.join(root, 'target/release/kshana')
const demo = process.env.KSHANA_DEMO || path.join(root, 'examples/maritime-trust')

const log = fs.readdirSync(demo).filter((f) => f.endsWith('.nmea')).sort()[0]
assert.ok(log, `no .nmea log in ${demo}`)

const relay = startRelay({ port: 0, waitClients: 1 })
const port = await relay.listen()
const got = []
const consumer = new Promise((res) => {
  const s = net.connect(port, '127.0.0.1')
  s.on('data', (d) => got.push(d))
  s.on('end', res)
})
await relay.ready()
const k = spawn(bin, ['receiver-trust', 'live', `${demo}/session.toml`, '--file', `${demo}/${log}`, '--gate'], {
  stdio: ['ignore', 'pipe', 'inherit']
})
k.stdout.on('data', (d) => relay.write(d))
await new Promise((r) => k.on('close', r))
relay.end()
await consumer
const text = Buffer.concat(got).toString()
const gga = text.split('\n').filter((l) => l.startsWith('$GPGGA')).map((l) => Number(l.split(',')[6]))
const pk = text.split('\n').filter((l) => l.startsWith('$PKSHT'))
assert.ok(gga.some((q) => q > 0) && gga.some((q) => q === 0), 'fix valid, then invalid')
assert.ok(pk.length >= 3000, '$PKSHT per epoch')
assert.ok(pk.some((l) => l.includes(',U,W,')), 'untrusted + withheld reported')
console.log(`e2e ok: ${gga.length} fixes, ${gga.filter((q) => q === 0).length} marked invalid, ${pk.length} $PKSHT`)
