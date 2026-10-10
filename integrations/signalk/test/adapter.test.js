'use strict'
const test = require('node:test')
const assert = require('node:assert')
const fs = require('fs')
const path = require('path')
const { parseJsonLine, parsePksht, nmeaChecksum } = require('../lib/adapter')

const fx = (n) => fs.readFileSync(path.join(__dirname, 'fixtures', n), 'utf8').split('\n').filter(Boolean)

test('parses every recorded synthetic JSON line', () => {
  const eps = fx('trust-excerpt.jsonl').map(parseJsonLine)
  assert.ok(eps.every(Boolean))
  assert.strictEqual(eps[0].band, 'calibrating')
  assert.strictEqual(eps[0].score, null)
  const bands = new Set(eps.map((e) => e.band))
  assert.deepStrictEqual([...bands].sort(), ['calibrating', 'degraded', 'nominal', 'untrusted'])
  const u = eps.find((e) => e.band === 'untrusted')
  assert.strictEqual(u.gate, 'withheld')
  assert.ok(u.score < 55)
  assert.strictEqual(u.reasons[0].monitor, 'cn0-spread')
  assert.strictEqual(u.reasons[0].points, 30)
})

test('rejects non-epoch text', () => {
  for (const l of ['', 'kshana live: listening', '{not json', '{"state":"weird"}', '[1]']) assert.strictEqual(parseJsonLine(l), null)
})

test('parses recorded $PKSHT sentences and agrees with the JSON lines', () => {
  const js = fx('trust-excerpt.jsonl').map(parseJsonLine)
  const ps = fx('pksht-excerpt.nmea').map(parsePksht)
  assert.strictEqual(ps.length, js.length)
  ps.forEach((p, i) => {
    assert.ok(p, 'line ' + i)
    assert.strictEqual(p.band, js[i].band)
    assert.strictEqual(p.gate, js[i].gate)
    if (js[i].score !== null) assert.ok(Math.abs(p.score - js[i].score) < 0.06)
    else assert.strictEqual(p.score, null)
  })
})

test('$PKSHT: bad checksum, wrong version and other sentences are rejected', () => {
  const body = 'PKSHT,1,080140.25,23.4,U,W,heading-course:40.0/cn0-spread:30.0'
  const good = `$${body}*${nmeaChecksum(body)}`
  const p = parsePksht(good)
  assert.deepStrictEqual(p.reasons, [
    { monitor: 'heading-course', points: 40 },
    { monitor: 'cn0-spread', points: 30 }
  ])
  assert.strictEqual(parsePksht(good.replace('23.4', '23.5')), null)
  const v2 = 'PKSHT,2,080140.25,23.4,U,W,'
  assert.strictEqual(parsePksht(`$${v2}*${nmeaChecksum(v2)}`), null)
  assert.strictEqual(parsePksht('$GPGGA,1,2*00'), null)
})

test('schema 1.1 position becomes a Signal K position object; absent or malformed stays null', () => {
  const eps = fx('trust-position-excerpt.jsonl').map(parseJsonLine)
  assert.ok(eps.every((e) => e && e.position))
  const p = eps[0].position
  assert.deepStrictEqual(Object.keys(p).sort(), ['altitude', 'latitude', 'longitude'])
  assert.ok(p.latitude > 59 && p.latitude < 60 && p.longitude > 24 && p.longitude < 25)
  // older output (no position key), a null position and a malformed one
  const base = JSON.parse(fx('trust-excerpt.jsonl')[10])
  assert.strictEqual(parseJsonLine(JSON.stringify(base)).position, null)
  assert.strictEqual(parseJsonLine(JSON.stringify({ ...base, position: null })).position, null)
  assert.strictEqual(parseJsonLine(JSON.stringify({ ...base, position: { lat_deg: 'x', lon_deg: 1 } })).position, null)
  assert.deepStrictEqual(parseJsonLine(JSON.stringify({ ...base, position: { lat_deg: 1, lon_deg: 2 } })).position, {
    latitude: 1,
    longitude: 2
  })
})

test('out-of-range or non-numeric scores are rejected, not clamped', () => {
  const base = JSON.parse(fx('trust-excerpt.jsonl')[10])
  for (const bad of [1000, -1, 100.5, 'high']) assert.strictEqual(parseJsonLine(JSON.stringify({ ...base, score: bad })), null, String(bad))
  assert.ok(parseJsonLine(JSON.stringify({ ...base, score: 0 })))
  assert.ok(parseJsonLine(JSON.stringify({ ...base, score: 100 })))
  const mk = (score) => {
    const body = `PKSHT,1,080140.25,${score},U,W,`
    return `$${body}*${nmeaChecksum(body)}`
  }
  for (const bad of ['1e3', '101', '-5', 'NaN']) assert.strictEqual(parsePksht(mk(bad)), null, bad)
  assert.strictEqual(parsePksht(mk('100.0')).score, 100)
  assert.strictEqual(parsePksht(mk('0.0')).score, 0)
})
