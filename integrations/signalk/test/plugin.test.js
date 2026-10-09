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
const alarmStates = (app) =>
  app.deltas.flatMap((d) => d.updates[0].values).filter((v) => v.path === NOTIFICATION_PATH).map((v) => v.value.state)

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
  await waitFor(() => app.deltas.length >= N)
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
  await waitFor(() => app.deltas.length >= N)
  p.stop()
  srv.close()
  assert.strictEqual(app.deltas.length, N)
  assert.deepStrictEqual(alarmStates(app).slice(0, 2), ['warn', 'alarm'])
})

test('spawn-signalk-nmea: server NMEA goes to the child, its JSON comes back', async () => {
  const app = mockApp()
  const p = makePlugin(app)
  p.start({ source: 'spawn-signalk-nmea', command: path.join(__dirname, 'fake-kshana.js'), sessionFile: 'unused.toml', staleAfterS: 0 })
  app.signalk.emit('nmea0183', '$GPGGA,082640.00,5432.46891,N,01846.38384,E,1,12,1.1,18.1,M,26.5,M,,*5B')
  await waitFor(() => app.deltas.length >= N)
  p.stop()
  assert.deepStrictEqual(alarmStates(app).slice(0, 2), ['warn', 'alarm'])
  assert.strictEqual(app.signalk.listenerCount('nmea0183'), 0)
})
