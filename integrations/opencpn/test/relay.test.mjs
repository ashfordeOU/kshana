import test from 'node:test'
import assert from 'node:assert'
import net from 'node:net'
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import { startRelay } from '../nmea-tcp-relay.mjs'

const here = path.dirname(fileURLToPath(import.meta.url))
const stream = fs.readFileSync(path.join(here, 'fixtures', 'gated-excerpt.nmea'))

const checksum = (b) => [...b].reduce((c, ch) => c ^ ch.charCodeAt(0), 0).toString(16).toUpperCase().padStart(2, '0')
const sentenceOk = (l) => {
  const m = /^\$([^*]+)\*([0-9A-F]{2})$/.exec(l)
  return !!m && checksum(m[1]) === m[2]
}

function consume(port) {
  return new Promise((resolve, reject) => {
    const chunks = []
    const s = net.connect(port, '127.0.0.1')
    s.on('data', (d) => chunks.push(d))
    s.on('end', () => resolve(Buffer.concat(chunks)))
    s.on('error', reject)
  })
}

// What a chart plotter does with a fix: valid only while GGA quality > 0 and RMC status is A.
function fixValidity(text) {
  const out = []
  for (const l of text.split(/\r?\n/)) {
    const f = l.split(',')
    if (l.startsWith('$GPGGA')) out.push({ t: f[1], gga: Number(f[6]) })
    if (l.startsWith('$GPRMC')) out[out.length - 1].rmc = f[2]
  }
  return out
}

async function replay(nClients, chunkSize) {
  const relay = startRelay({ port: 0, waitClients: nClients })
  const port = await relay.listen()
  const consumers = Array.from({ length: nClients }, () => consume(port))
  await relay.ready()
  for (let i = 0; i < stream.length; i += chunkSize) relay.write(stream.subarray(i, i + chunkSize))
  relay.end()
  return Promise.all(consumers)
}

test('consumer receives the gated stream byte-for-byte, even with arbitrary chunking', async () => {
  const [got] = await replay(1, 97)
  assert.ok(got.equals(stream))
})

test('consumer sees the fix go invalid when trust collapses, and a $PKSHT for every cycle', async () => {
  const [got] = await replay(1, 4096)
  const text = got.toString('utf8')
  const lines = text.split(/\r?\n/).filter(Boolean)
  assert.ok(lines.every(sentenceOk), 'every sentence has a valid checksum, including the rewritten ones')
  const fixes = fixValidity(text)
  const valid = fixes.filter((f) => f.gga > 0 && f.rmc === 'A')
  const invalid = fixes.filter((f) => f.gga === 0 && f.rmc === 'V')
  assert.strictEqual(valid.length + invalid.length, fixes.length, 'GGA and RMC always agree')
  assert.ok(valid.length > 0 && invalid.length > 0)
  // valid first, then invalid: no flicker in this excerpt
  const firstInvalid = fixes.findIndex((f) => f.gga === 0)
  assert.ok(fixes.slice(firstInvalid).every((f) => f.gga === 0))
  // $PKSHT: one per cycle, and the gate field says W exactly where the fix is invalid
  const pk = lines.filter((l) => l.startsWith('$PKSHT'))
  assert.strictEqual(pk.length, fixes.length)
  pk.forEach((l, i) => assert.strictEqual(l.split('*')[0].split(',')[5] === 'W', fixes[i].gga === 0))
  // the first withheld epoch is the band edge: untrusted
  assert.strictEqual(pk[firstInvalid].split(',')[4], 'U')
})

test('two consumers get identical streams; a held partial line is not forwarded early', async () => {
  const [a, b] = await replay(2, 7)
  assert.ok(a.equals(b) && a.equals(stream))
  const relay = startRelay({ port: 0, waitClients: 1 })
  const port = await relay.listen()
  const c = consume(port)
  await relay.ready()
  relay.write(Buffer.from('$GPGGA,partial'))
  relay.end()
  assert.strictEqual((await c).length, 0)
})
