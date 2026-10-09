'use strict'
const test = require('node:test')
const assert = require('node:assert')
const fs = require('fs')
const path = require('path')
const { parseJsonLine } = require('../lib/adapter')
const { AlarmTracker, deltaFor, staleDelta, NOTIFICATION_PATH, NS } = require('../lib/model')

const epochs = fs
  .readFileSync(path.join(__dirname, 'fixtures', 'trust-excerpt.jsonl'), 'utf8')
  .split('\n')
  .filter(Boolean)
  .map(parseJsonLine)

const notes = (ds) => ds.map((d) => d.updates[0].values.find((v) => v.path === NOTIFICATION_PATH)).filter(Boolean)

test('every epoch publishes band, score, reasons, alarms and gate under the documented namespace', () => {
  const t = new AlarmTracker({})
  const d = deltaFor(epochs[10], t, '2025-01-01T00:00:00Z')
  const paths = d.updates[0].values.map((v) => v.path)
  for (const k of ['band', 'score', 'reasons', 'alarms', 'gate']) assert.ok(paths.includes(`${NS}.${k}`), k)
})

test('default (band mode): warn on degraded, alarm on untrusted', () => {
  const t = new AlarmTracker({})
  const n = notes(epochs.map((e) => deltaFor(e, t)))
  assert.deepStrictEqual(n.map((v) => v.value.state), ['warn', 'alarm'])
  assert.deepStrictEqual(n[1].value.method, ['visual', 'sound'])
  assert.match(n[1].value.message, /untrusted/)
  assert.match(n[1].value.message, /Advisory only/)
})

test('raiseAfterEpochs delays the alarm; clearAfterEpochs holds it', () => {
  const t = new AlarmTracker({ degradedState: 'normal', raiseAfterEpochs: 3 })
  const idx = []
  epochs.forEach((e, i) => {
    if (deltaFor(e, t).updates[0].values.some((v) => v.path === NOTIFICATION_PATH)) idx.push(i)
  })
  const firstU = epochs.findIndex((e) => e.band === 'untrusted')
  assert.deepStrictEqual(idx, [firstU + 2])
  const nominal = { band: 'nominal', score: 100, reasons: [], alarms: [], gate: 'passed' }
  let cleared = -1
  for (let i = 1; i <= 12; i++) {
    if (t.update(nominal).changed) {
      cleared = i
      break
    }
  }
  assert.strictEqual(cleared, 10)
  assert.strictEqual(t.state, 'normal')
})

test('score mode uses the configured thresholds, not the reported band', () => {
  const t = new AlarmTracker({ thresholdMode: 'score', warnBelowScore: 95, alarmBelowScore: 40 })
  const mk = (score, band) => ({ band, score, reasons: [], alarms: [], gate: null })
  assert.strictEqual(t.update(mk(60, 'untrusted')).state, 'warn')
  assert.strictEqual(t.update(mk(30, 'degraded')).state, 'alarm')
})

test('calibrating never alarms; stale data warns once', () => {
  const t = new AlarmTracker({})
  assert.strictEqual(t.update(epochs[0]).changed, false)
  assert.ok(staleDelta(t))
  assert.strictEqual(staleDelta(t), null)
})
