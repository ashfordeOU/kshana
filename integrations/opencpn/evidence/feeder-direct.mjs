// Drives the real `kshana receiver-trust live --gate --listen tcp:<port>` for the OpenCPN evidence run:
// waits for a go file (OpenCPN has connected), feeds the first <fast> epochs of a raw NMEA log at once
// (the baseline and the lead-up), then one epoch per <ms>. kshana serves the gated stream itself.
//   node feeder-direct.mjs <kshana> <session.toml> <log.nmea> <go-file> <fast_epochs> <ms> [port]
import { spawn } from 'node:child_process'
import fs from 'node:fs'

const [, , bin, session, logFile, goFile, fast, ms, port = '10110'] = process.argv
const text = fs.readFileSync(logFile, 'utf8').split('\n').filter(Boolean)
const epochs = []
for (const l of text) {
  if (/^\$..GGA,/.test(l) || epochs.length === 0) epochs.push([])
  epochs[epochs.length - 1].push(l)
}
const k = spawn(bin, ['receiver-trust', 'live', session, '--gate', '--listen', `tcp:${port}`, '--replay'], {
  stdio: ['pipe', 'ignore', 'pipe']
})
k.stderr.on('data', (d) => String(d).includes('listening on tcp') && console.error('listening'))
await new Promise((r) => {
  const t = setInterval(() => fs.existsSync(goFile) && (clearInterval(t), r()), 200)
})
const send = (e) => k.stdin.write(e.join('\r\n') + '\r\n')
const nFast = Number(fast)
epochs.slice(0, nFast).forEach(send)
console.error('paced')
for (const e of epochs.slice(nFast, nFast + 45)) {
  send(e)
  await new Promise((r) => setTimeout(r, Number(ms)))
}
console.error('done')
await new Promise((r) => setTimeout(r, 4000))
k.stdin.end()
k.kill()
