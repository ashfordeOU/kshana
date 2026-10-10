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
  assert.match(n[1].value.message, /Advisory, not type-approved navigation equipment/)
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

test('reportedPosition is trust context only: published under the kshana namespace, never navigation.position', () => {
  const t = new AlarmTracker({})
  const withPos = fs
    .readFileSync(path.join(__dirname, 'fixtures', 'trust-position-excerpt.jsonl'), 'utf8')
    .split('\n')
    .filter(Boolean)
    .map(parseJsonLine)
  const paths = []
  for (const e of withPos) paths.push(...deltaFor(e, t).updates[0].values.map((v) => v.path))
  assert.ok(paths.includes(`${NS}.reportedPosition`))
  assert.ok(!paths.some((p) => p === 'navigation.position' || p.startsWith('navigation.position.')))
  // no position in the epoch: the path is not published at all
  const none = deltaFor(epochs[10], new AlarmTracker({})).updates[0].values.map((v) => v.path)
  assert.ok(!none.includes(`${NS}.reportedPosition`))
})

test('after stale, the first epoch republishes the notification (warn stays warn but the stale text is replaced)', () => {
  const t = new AlarmTracker({})
  const degraded = epochs.find((e) => e.band === 'degraded')
  deltaFor(degraded, t) // warn
  assert.ok(staleDelta(t)) // warn again, stale text
  const d = deltaFor(degraded, t)
  const n = d.updates[0].values.find((v) => v.path === NOTIFICATION_PATH)
  assert.ok(n, 'republished')
  assert.strictEqual(n.value.state, 'warn')
  assert.match(n.value.message, /degraded/)
  assert.doesNotMatch(n.value.message, /No Kshana trust data/)
  // the data came back nominal after stale: back to normal at once, not after the hold
  const nominal = epochs.find((e) => e.band === 'nominal')
  const t2 = new AlarmTracker({})
  deltaFor(nominal, t2)
  staleDelta(t2)
  const n2 = deltaFor(nominal, t2).updates[0].values.find((v) => v.path === NOTIFICATION_PATH)
  assert.strictEqual(n2.value.state, 'normal')
})

test('the notification path mirrors the published subtree', () => {
  assert.strictEqual(NOTIFICATION_PATH, 'notifications.navigation.gnss.kshana.trust')
})
