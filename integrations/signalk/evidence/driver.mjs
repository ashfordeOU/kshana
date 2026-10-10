// Drives a real Signal K server that has this plugin loaded and records what the server's own REST and
// WebSocket APIs show. Everything is on 127.0.0.1 inside the run-with-signalk-server.sh network namespace.
//   node driver.mjs <scenario: pksht|spawn> <out_dir> <server_dir> [kshana_bin demo_dir]
import fs from 'node:fs'
import net from 'node:net'
import path from 'node:path'
import http from 'node:http'
import { createRequire } from 'node:module'

const [, , scenario, out, serverDir, kbin, demo] = process.argv
const require = createRequire(path.join(serverDir, 'node_modules', 'x.js'))
const WebSocket = require('ws')
const PORT = 3010
const FEED = 10120
const NS = '/signalk/v1/api/vessels/self'
fs.mkdirSync(out, { recursive: true })

const cs = (b) => [...b].reduce((c, ch) => c ^ ch.charCodeAt(0), 0).toString(16).toUpperCase().padStart(2, '0')
const pksht = (n, score, band, gate, reasons) => {
  const body = `PKSHT,1,${String(80000 + n).padStart(6, '0')}.00,${score},${band},${gate},${reasons}`
  return `$${body}*${cs(body)}`
}
const get = (p) =>
  new Promise((res) => {
    http.get({ host: '127.0.0.1', port: PORT, path: p }, (r) => {
      let b = ''
      r.on('data', (d) => (b += d))
      r.on('end', () => res({ status: r.statusCode, body: b }))
    }).on('error', () => res({ status: 0, body: '' }))
  })
const sleep = (ms) => new Promise((r) => setTimeout(r, ms))

// the feed: a TCP server the plugin (pksht) or the server's NMEA provider (spawn) connects to
let lines
if (scenario === 'pksht') {
  // synthetic $PKSHT text only: nominal, degraded, untrusted, then a long recovery
  const seq = [
    ...Array(8).fill(['100.0', 'N', 'P', '']),
    ...Array(4).fill(['70.0', 'D', 'P', 'cn0-spread:20.0']),
    ...Array(6).fill(['40.0', 'U', 'W', 'cn0-spread:30.0/speed-log:30.0']),
    ...Array(14).fill(['100.0', 'N', 'P', ''])
  ]
  lines = seq.map((s, i) => [`$GPGGA,${80000 + i}.00,5432.46891,N,01846.38384,E,1,12,1.1,18.1,M,26.5,M,,*00`, pksht(i, ...s)])
} else {
  const f = fs.readdirSync(demo).filter((x) => x.endsWith('.nmea')).sort()[0]
  const all = fs.readFileSync(path.join(demo, f), 'utf8').split('\n').filter(Boolean)
  lines = []
  for (const l of all) {
    if (/^\$..GGA,/.test(l) || lines.length === 0) lines.push([])
    lines[lines.length - 1].push(l)
  }
}
const nFast = scenario === 'spawn' ? 1600 : 0
const nTotal = scenario === 'spawn' ? 1600 + 45 : lines.length
const intervalMs = scenario === 'spawn' ? 1000 : 400
let clientCount = 0
const feed = net.createServer(async (sock) => {
  clientCount++
  sock.on('error', () => {})
  if (clientCount > 1) return
  for (let i = 0; i < nTotal && !sock.destroyed; i++) {
    sock.write(lines[i].join('\r\n') + '\r\n')
    if (i >= nFast) await sleep(intervalMs)
  }
  fed = true
})
let fed = false
await new Promise((r) => feed.listen(FEED, '127.0.0.1', r))
console.error('feed listening')

// wait for the server
for (let i = 0; i < 120; i++) {
  const r = await get('/signalk')
  if (r.status === 200) break
  await sleep(500)
}

// WebSocket: every delta whose path is under navigation.gnss.kshana or notifications...kshanaTrust
const deltas = []
const ws = new WebSocket(`ws://127.0.0.1:${PORT}/signalk/v1/stream?subscribe=none`)
await new Promise((r) => ws.on('open', r))
ws.send(JSON.stringify({ context: 'vessels.self', subscribe: [{ path: 'navigation.gnss.kshana.*' }, { path: 'notifications.navigation.gnss.kshana.trust' }] }))
ws.on('message', (m) => {
  let d
  try {
    d = JSON.parse(String(m))
  } catch (e) {
    return
  }
  for (const u of d.updates || [])
    for (const v of u.values || []) deltas.push({ t: Date.now(), path: v.path, value: v.value, source: u.$source })
})

// poll REST for the notification, record changes
const timeline = []
let last = ''
const t0 = Date.now()
const deadline = t0 + (scenario === 'spawn' ? 150000 : 60000)
let doneAt = 0
while (Date.now() < deadline) {
  const n = await get(`${NS}/notifications/navigation/gnss/kshana/trust`)
  let st = 'absent'
  try {
    st = JSON.parse(n.body).value.state
  } catch (e) {}
  if (st !== last) {
    timeline.push({ t_s: +((Date.now() - t0) / 1000).toFixed(1), notification_state: st })
    last = st
  }
  if (fed && !doneAt) doneAt = Date.now()
  if (doneAt && Date.now() - doneAt > (scenario === 'spawn' ? 8000 : 9000)) break
  await sleep(300)
}
const api = {}
for (const p of ['navigation/gnss/kshana/band', 'navigation/gnss/kshana/score', 'navigation/gnss/kshana/reasons', 'navigation/gnss/kshana/gate', 'navigation/gnss/kshana/reportedPosition', 'notifications/navigation/gnss/kshana/trust', 'navigation/position']) {
  const r = await get(`${NS}/${p}`)
  api[p] = { status: r.status, body: r.body.length > 1500 ? '(long)' : (() => { try { return JSON.parse(r.body) } catch (e) { return r.body } })() }
}
ws.close()
feed.close()
fs.writeFileSync(path.join(out, `${scenario}-notification-timeline.json`), JSON.stringify(timeline, null, 2))
fs.writeFileSync(path.join(out, `${scenario}-rest-final.json`), JSON.stringify(api, null, 2))
const bandChanges = []
for (const d of deltas) if (d.path === 'navigation.gnss.kshana.band' && (!bandChanges.length || bandChanges.at(-1).value !== d.value)) bandChanges.push({ path: d.path, value: d.value })
fs.writeFileSync(path.join(out, `${scenario}-ws-summary.json`), JSON.stringify({ delta_values_seen: deltas.length, paths: [...new Set(deltas.map((d) => d.path))].sort(), band_sequence: bandChanges.map((b) => b.value), notification_values: deltas.filter((d) => d.path.startsWith('notifications')).map((d) => d.value) }, null, 2))
console.log(JSON.stringify({ timeline }, null, 0))
process.exit(0)
