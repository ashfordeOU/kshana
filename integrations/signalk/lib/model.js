'use strict'
// Normalised epoch -> Signal K deltas, and the alarm state machine. No I/O, no timers.

const NS = 'navigation.gnss.kshana'
const NOTIFICATION_PATH = 'notifications.navigation.gnss.kshanaTrust'

const DEFAULTS = {
  thresholdMode: 'band', // 'band': use the band Kshana reports; 'score': use the two scores below
  warnBelowScore: 90, // score mode: below this -> state 'warn'   (Kshana default band edge: nominal >= 90)
  alarmBelowScore: 55, // score mode: below this -> state 'alarm'  (Kshana default band edge: degraded >= 55)
  degradedState: 'warn', // Signal K state raised for the degraded band: 'normal' | 'alert' | 'warn'
  raiseAfterEpochs: 1, // consecutive epochs at a worse state before the notification is raised
  clearAfterEpochs: 10, // consecutive epochs at a better state before it is lowered
  staleAfterS: 10, // no epoch for this long -> 'warn' (stale); 0 disables
  method: ['visual', 'sound']
}

const SEVERITY = { normal: 0, alert: 1, warn: 2, alarm: 3, emergency: 4 }

function withDefaults(opts) {
  const o = Object.assign({}, DEFAULTS, opts || {})
  if (!Array.isArray(o.method)) o.method = DEFAULTS.method
  return o
}

// The Signal K state this single epoch asks for (before hold/hysteresis).
function wantedState(epoch, o) {
  if (epoch.band === 'calibrating') return 'normal'
  if (o.thresholdMode === 'score' && epoch.score !== null) {
    if (epoch.score < o.alarmBelowScore) return 'alarm'
    if (epoch.score < o.warnBelowScore) return o.degradedState
    return 'normal'
  }
  if (epoch.band === 'untrusted') return 'alarm'
  if (epoch.band === 'degraded') return o.degradedState
  return 'normal'
}

function reasonText(reasons) {
  return reasons
    .slice(0, 3)
    .map((r) => (r.points === null ? r.monitor : `${r.monitor} -${r.points.toFixed(1)}`))
    .join(', ')
}

function messageFor(state, epoch) {
  const sc = epoch.score === null ? 'n/a' : epoch.score.toFixed(1)
  if (state === 'normal') return `GNSS trust ${sc} (${epoch.band})`
  const why = reasonText(epoch.reasons)
  return `GNSS fix trust ${epoch.band} (score ${sc})${why ? ': ' + why : ''}. Advisory only; check position by other means.`
}

class AlarmTracker {
  constructor(opts) {
    this.o = withDefaults(opts)
    this.state = 'normal' // the state currently published
    this.pending = null // candidate state and how many epochs it has held
    this.pendingCount = 0
  }

  // Feed an epoch; returns { state, changed } where changed means a notification delta is due.
  update(epoch) {
    const want = wantedState(epoch, this.o)
    if (want === this.state) {
      this.pending = null
      this.pendingCount = 0
      return { state: this.state, changed: false }
    }
    if (this.pending === want) this.pendingCount++
    else {
      this.pending = want
      this.pendingCount = 1
    }
    const worse = SEVERITY[want] > SEVERITY[this.state]
    const need = worse ? this.o.raiseAfterEpochs : this.o.clearAfterEpochs
    if (this.pendingCount >= need) {
      this.state = want
      this.pending = null
      this.pendingCount = 0
      return { state: this.state, changed: true }
    }
    return { state: this.state, changed: false }
  }

  // The stream went quiet (see staleAfterS).
  stale() {
    if (SEVERITY[this.state] >= SEVERITY.warn) return { state: this.state, changed: false }
    this.state = 'warn'
    this.pending = null
    this.pendingCount = 0
    return { state: this.state, changed: true }
  }
}

function valuesFor(epoch) {
  const v = [
    { path: `${NS}.band`, value: epoch.band },
    { path: `${NS}.score`, value: epoch.score },
    { path: `${NS}.reasons`, value: epoch.reasons.map((r) => ({ monitor: r.monitor, points: r.points })) },
    { path: `${NS}.alarms`, value: epoch.alarms },
    { path: `${NS}.gate`, value: epoch.gate }
  ]
  // Context only: the position the receiver under test reported, NOT the vessel's navigation.position,
  // which this plugin never writes. Published only when the stream carries one.
  if (epoch.position) v.push({ path: `${NS}.reportedPosition`, value: epoch.position })
  return v
}

function notificationValue(state, epoch, o) {
  if (state === 'normal') return { state: 'normal', message: messageFor('normal', epoch) }
  return { state, method: o.method, message: messageFor(state, epoch) }
}

// Build the delta for an epoch. `tracker` decides whether the notification changes.
function deltaFor(epoch, tracker, now) {
  const r = tracker.update(epoch)
  const values = valuesFor(epoch)
  if (r.changed) values.push({ path: NOTIFICATION_PATH, value: notificationValue(r.state, epoch, tracker.o) })
  return { updates: [{ timestamp: now || new Date().toISOString(), values }] }
}

function staleDelta(tracker, now) {
  const r = tracker.stale()
  if (!r.changed) return null
  const value = {
    state: 'warn',
    method: tracker.o.method,
    message: 'No Kshana trust data received; the trust score is not being updated.'
  }
  return {
    updates: [{ timestamp: now || new Date().toISOString(), values: [{ path: NOTIFICATION_PATH, value }] }]
  }
}

module.exports = {
  NS,
  NOTIFICATION_PATH,
  DEFAULTS,
  AlarmTracker,
  deltaFor,
  staleDelta,
  wantedState,
  withDefaults
}
