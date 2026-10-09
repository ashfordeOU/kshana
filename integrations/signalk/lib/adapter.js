'use strict'
// The ONLY file that knows Kshana's wire formats. If `kshana receiver-trust live` changes its
// JSON line or its $PKSHT sentence, edit this file; everything else reads the normalised epoch:
//   { seq, t, time, band, score, reasons:[{monitor, points}], alarms:[string], gate, note }
// band: 'calibrating' | 'nominal' | 'degraded' | 'untrusted'
// gate: 'off' | 'passed' | 'withheld' | null

const BANDS = ['calibrating', 'nominal', 'degraded', 'untrusted']
const PKSHT_BAND = { C: 'calibrating', N: 'nominal', D: 'degraded', U: 'untrusted' }
const PKSHT_GATE = { '-': 'off', P: 'passed', W: 'withheld' }

function num(x) {
  return typeof x === 'number' && Number.isFinite(x) ? x : null
}

// One JSON line as written by `kshana receiver-trust live` (stdout or --json). Returns null for
// anything that is not an epoch report (blank line, log text, malformed JSON).
function parseJsonLine(line) {
  const s = String(line).trim()
  if (!s.startsWith('{')) return null
  let o
  try {
    o = JSON.parse(s)
  } catch (e) {
    return null
  }
  if (!o || typeof o !== 'object' || !BANDS.includes(o.state)) return null
  return {
    seq: num(o.seq),
    t: num(o.t_s),
    time: typeof o.time === 'string' ? o.time : null,
    band: o.state,
    score: num(o.score),
    reasons: Array.isArray(o.deductions)
      ? o.deductions
          .filter((d) => d && typeof d.monitor === 'string')
          .map((d) => ({ monitor: d.monitor, points: num(d.points) }))
      : [],
    alarms: Array.isArray(o.alarms) ? o.alarms.filter((a) => typeof a === 'string') : [],
    gate: typeof o.gate === 'string' ? o.gate : null,
    note: typeof o.note === 'string' ? o.note : null
  }
}

function nmeaChecksum(body) {
  let c = 0
  for (let i = 0; i < body.length; i++) c ^= body.charCodeAt(i)
  return c.toString(16).toUpperCase().padStart(2, '0')
}

// A `$PKSHT,<ver>,<hhmmss.ss>,<score>,<band>,<gate>,<reasons>*CS` sentence. Null when it is not
// one, the checksum is wrong, or the format version is not 1. Only the top two reasons are in the
// sentence (monitor:points joined by '/').
function parsePksht(sentence) {
  const s = String(sentence).trim()
  const m = /^\$PKSHT,([^*]*)\*([0-9A-Fa-f]{2})$/.exec(s)
  if (!m) return null
  if (nmeaChecksum('PKSHT,' + m[1]) !== m[2].toUpperCase()) return null
  const f = m[1].split(',')
  if (f.length < 5 || f[0] !== '1') return null
  const band = PKSHT_BAND[f[3]]
  if (!band) return null
  const score = f[2] === '' ? null : Number(f[2])
  const reasons = (f[5] || '')
    .split('/')
    .filter(Boolean)
    .map((r) => {
      const i = r.lastIndexOf(':')
      return { monitor: r.slice(0, i), points: Number(r.slice(i + 1)) }
    })
  return {
    seq: null,
    t: null,
    time: f[1] === '' ? null : f[1],
    band,
    score: score !== null && Number.isFinite(score) ? score : null,
    reasons,
    alarms: [],
    gate: PKSHT_GATE[f[4]] || null,
    note: null
  }
}

module.exports = { parseJsonLine, parsePksht, nmeaChecksum, BANDS }
