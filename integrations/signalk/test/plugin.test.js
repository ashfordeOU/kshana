'use strict'
const test = require('node:test')
const assert = require('node:assert')
const net = require('net')
const fs = require('fs')
const path = require('path')
const EventEmitter = require('events')
const makePlugin = require('../index')
const { NOTIFICATION_PATH } = require('../lib/model')

const fixture = path.join(__dirname, 'fixtures', 'trust-excerpt.jsonl')
const N = fs.readFileSync(fixture, 'utf8').split('\n').filter(Boolean).length

function mockApp() {
  const app = { deltas: [], status: [], errors: [], signalk: new EventEmitter() }
  app.handleMessage = (id, d) => app.deltas.push(d)
  app.setPluginStatus = (s) => app.status.push(s)
  app.setPluginError = (s) => app.errors.push(s)
  app.debug = () => {}
  return app
}
const waitFor = async (f, ms = 5000) => {
  const t0 = Date.now()
  while (!f()) {
    if (Date.now() - t0 > ms) throw new Error('timeout')
    await new Promise((r) => setTimeout(r, 10))
  }
}
const epochDeltas = (app) => app.deltas.filter((d) => d.updates[0].values)
const alarmStates = (app) =>
  epochDeltas(app).flatMap((d) => d.updates[0].values).filter((v) => v.path === NOTIFICATION_PATH).map((v) => v.value.state)

test('schema shows every threshold with a default', () => {
  const p = makePlugin(mockApp())
  const props = p.schema.properties
  for (const k of ['thresholdMode', 'warnBelowScore', 'alarmBelowScore', 'degradedState', 'raiseAfterEpochs', 'clearAfterEpochs', 'staleAfterS']) {
    assert.ok(k in props && 'default' in props[k], k)
  }
  assert.match(p.description, /not type-approved/)
})

test('tcp-json: replays the recorded stream from a local feed and raises the alarm', async () => {
  const srv = net.createServer((s) => s.end(fs.readFileSync(fixture)))
  await new Promise((r) => srv.listen(0, '127.0.0.1', r))
  const app = mockApp()
  const p = makePlugin(app)
  p.start({ source: 'tcp-json', host: '127.0.0.1', port: srv.address().port, staleAfterS: 0 })
  await waitFor(() => epochDeltas(app).length >= N)
  p.stop()
  srv.close()
  assert.deepStrictEqual(alarmStates(app).slice(0, 2), ['warn', 'alarm'])
})

test('tcp-pksht: reads only $PKSHT from a mixed NMEA stream', async () => {
  const pk = fs.readFileSync(path.join(__dirname, 'fixtures', 'pksht-excerpt.nmea'), 'utf8').split('\n').filter(Boolean)
  const mixed = pk.map((l) => '$GPGGA,082640.00,5432.46891,N,01846.38384,E,0,12,1.1,18.1,M,26.5,M,,*5A\r\n' + l + '\r\n').join('')
  const srv = net.createServer((s) => s.end(mixed))
  await new Promise((r) => srv.listen(0, '127.0.0.1', r))
  const app = mockApp()
  const p = makePlugin(app)
  p.start({ source: 'tcp-pksht', host: '127.0.0.1', port: srv.address().port, staleAfterS: 0 })
  await waitFor(() => epochDeltas(app).length >= N)
  p.stop()
  srv.close()
  assert.strictEqual(epochDeltas(app).length, N)
  assert.deepStrictEqual(alarmStates(app).slice(0, 2), ['warn', 'alarm'])
})

test('spawn-signalk-nmea: server NMEA goes to the child, its JSON comes back', async () => {
  const app = mockApp()
  const p = makePlugin(app)
  p.start({ source: 'spawn-signalk-nmea', command: path.join(__dirname, 'fake-kshana.js'), sessionFile: 'unused.toml', staleAfterS: 0 })
  app.signalk.emit('nmea0183', '$GPGGA,082640.00,5432.46891,N,01846.38384,E,1,12,1.1,18.1,M,26.5,M,,*5B')
  await waitFor(() => epochDeltas(app).length >= N)
  p.stop()
  assert.deepStrictEqual(alarmStates(app).slice(0, 2), ['warn', 'alarm'])
  assert.strictEqual(app.signalk.listenerCount('nmea0183'), 0)
})

test('inputArgs are passed to kshana in both spawn modes', async () => {
  const argsFile = path.join(require('os').tmpdir(), `kshana-args-${process.pid}.json`)
  process.env.FAKE_ARGS_FILE = argsFile
  try {
    for (const [source, extra] of [['spawn-signalk-nmea', ['--replay']], ['spawn-args', ['--udp', '10110']]]) {
      fs.rmSync(argsFile, { force: true })
      const app = mockApp()
      const p = makePlugin(app)
      p.start({ source, command: path.join(__dirname, 'fake-kshana.js'), sessionFile: 's.toml', inputArgs: extra, staleAfterS: 0 })
      await waitFor(() => fs.existsSync(argsFile))
      p.stop()
      assert.deepStrictEqual(JSON.parse(fs.readFileSync(argsFile, 'utf8')), ['receiver-trust', 'live', 's.toml', ...extra])
    }
  } finally {
    delete process.env.FAKE_ARGS_FILE
    fs.rmSync(argsFile, { force: true })
  }
})

test('meta for the published paths is sent once at start, with zones from the thresholds', () => {
  const app = mockApp()
  const p = makePlugin(app)
  p.start({ source: 'tcp-json', host: '127.0.0.1', port: 9, staleAfterS: 0, warnBelowScore: 80, alarmBelowScore: 30 })
  p.stop()
  const metas = app.deltas.filter((d) => d.updates[0].meta)
  assert.strictEqual(metas.length, 1)
  const byPath = Object.fromEntries(metas[0].updates[0].meta.map((m) => [m.path, m.value]))
  const score = byPath['navigation.gnss.kshana.score']
  assert.match(score.description, /0 \(no trust\) to 100/)
  assert.deepStrictEqual(score.displayScale, { lower: 0, upper: 100 })
  assert.deepStrictEqual(score.zones.map((z) => [z.lower, z.upper, z.state]), [[0, 30, 'alarm'], [30, 80, 'warn'], [80, 100, 'nominal']])
  assert.match(byPath['navigation.gnss.kshana.reasons'].description, /points/)
})

test('inputArgs that would break the JSON stream, or replace the server NMEA, are refused', () => {
  for (const [source, bad] of [['spawn-args', '--gate'], ['spawn-args', '--json'], ['spawn-args', '--pksht'], ['spawn-args', '--listen'], ['spawn-signalk-nmea', '--tcp'], ['spawn-signalk-nmea', '--gate']]) {
    const app = mockApp()
    const p = makePlugin(app)
    p.start({ source, command: path.join(__dirname, 'fake-kshana.js'), inputArgs: [bad, 'x'], staleAfterS: 0 })
    assert.match(app.errors[0], new RegExp(`must not contain ${bad}`))
    assert.strictEqual(app.deltas.length, 0, `${source} ${bad} must not start`)
    p.stop()
  }
})

test('a spawn error keeps its message (not overwritten by the exit text) and the child is not left running', async () => {
  const app = mockApp()
  const p = makePlugin(app)
  p.start({ source: 'spawn-args', command: path.join(__dirname, 'no-such-kshana'), staleAfterS: 0 })
  await waitFor(() => app.errors.length > 0)
  await new Promise((r) => setTimeout(r, 200))
  p.stop()
  assert.ok(app.errors.length >= 1 && app.errors.every((e) => /cannot run .*no-such-kshana.*ENOENT/.test(e)), app.errors.join(' | '))
})

test('stop() escalates to SIGKILL for a child that ignores SIGTERM', async () => {
  const pidFile = path.join(require('os').tmpdir(), `kshana-pid-${process.pid}`)
  process.env.FAKE_IGNORE_TERM = pidFile
  const app = mockApp()
  const p = makePlugin(app)
  p.start({ source: 'spawn-args', command: path.join(__dirname, 'fake-kshana.js'), staleAfterS: 0 })
  await waitFor(() => fs.existsSync(pidFile))
  const pid = Number(fs.readFileSync(pidFile, 'utf8'))
  p.stop()
  const alive = () => { try { process.kill(pid, 0); return true } catch (e) { return false } }
  await waitFor(() => !alive(), 6000)
  delete process.env.FAKE_IGNORE_TERM
  fs.rmSync(pidFile, { force: true })
})
