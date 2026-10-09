// End to end with the real binary. Not part of `npm test` (it needs a built kshana and takes a few seconds):
//   KSHANA_BIN=target/release/kshana [KSHANA_DEMO=<dir with session.toml and the demo .nmea>] npm run e2e [direct|relay]
// direct (default): kshana --gate --listen tcp:<port> | TCP consumer, and the consumer's bytes must equal what the same
//                   gate writes to stdout.
// relay:            kshana --gate | nmea-tcp-relay | TCP consumer.
import { spawn } from 'node:child_process'
import net from 'node:net'
import fs from 'node:fs'
import assert from 'node:assert'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { startRelay } from '../nmea-tcp-relay.mjs'

const here = path.dirname(fileURLToPath(import.meta.url))
const root = path.resolve(here, '../../..')
const bin = process.env.KSHANA_BIN || path.join(root, 'target/release/kshana')
const demo = process.env.KSHANA_DEMO || path.join(root, 'examples/maritime-trust')
const mode = process.argv[2] || 'direct'
const log = fs.readdirSync(demo).filter((f) => f.endsWith('.nmea')).sort()[0]
assert.ok(log, `no .nmea log in ${demo}`)
const input = fs.readFileSync(path.join(demo, log))
const session = path.join(demo, 'session.toml')
const base = ['receiver-trust', 'live', session, '--gate', '--replay']

const freePort = () =>
  new Promise((res) => {
    const s = net.createServer().listen(0, '127.0.0.1', () => {
      const p = s.address().port
      s.close(() => res(p))
    })
  })
const connect = (port) =>
  new Promise((res, rej) => {
    const chunks = []
    const s = net.connect(port, '127.0.0.1')
    const done = new Promise((r) => s.on('end', r))
    s.on('connect', () => res({ chunks, done }))
    s.on('data', (d) => chunks.push(d))
    s.on('error', rej)
  })

// the gate's own stdout, for comparison and for relay mode
function runStdout(onData) {
  return new Promise((res) => {
    const k = spawn(bin, base, { stdio: ['pipe', 'pipe', 'ignore'] })
    k.stdout.on('data', onData)
    k.on('close', res)
    k.stdin.end(input)
  })
}

let text
if (mode === 'relay') {
  const relay = startRelay({ port: 0, waitClients: 1 })
  const port = await relay.listen()
  const c = await connect(port)
  await relay.ready()
  await runStdout((d) => relay.write(d))
  relay.end()
  await c.done
  text = Buffer.concat(c.chunks).toString()
} else {
  const port = await freePort()
  const k = spawn(bin, [...base, '--listen', `tcp:${port}`], { stdio: ['pipe', 'ignore', 'pipe'] })
  await new Promise((res, rej) => {
    k.stderr.on('data', (d) => String(d).includes('listening on tcp') && res())
    k.on('close', () => rej(new Error('kshana exited before listening')))
  })
  const c = await connect(port)
  k.stdin.end(input)
  await c.done
  const got = Buffer.concat(c.chunks)
  const chunks = []
  await runStdout((d) => chunks.push(d))
  const want = Buffer.concat(chunks)
  assert.ok(got.length > 0 && got.equals(want), `listen output (${got.length} B) differs from the gate's stdout (${want.length} B)`)
  text = got.toString()
}
const gga = text.split('\n').filter((l) => l.startsWith('$GPGGA')).map((l) => Number(l.split(',')[6]))
const pk = text.split('\n').filter((l) => l.startsWith('$PKSHT'))
assert.ok(gga.some((q) => q > 0) && gga.some((q) => q === 0), 'fix valid, then invalid')
assert.ok(pk.length >= 3000, '$PKSHT per epoch')
assert.ok(pk.some((l) => l.includes(',U,W,')), 'untrusted + withheld reported')
console.log(`e2e ${mode} ok: ${gga.length} fixes, ${gga.filter((q) => q === 0).length} marked invalid, ${pk.length} $PKSHT`)
