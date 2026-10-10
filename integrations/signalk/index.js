'use strict'
const net = require('net')
const { spawn } = require('child_process')
const { parseJsonLine, parsePksht } = require('./lib/adapter')
const { lineSplitter } = require('./lib/lines')
const { AlarmTracker, deltaFor, staleDelta, metaDelta, DEFAULTS, NS, NOTIFICATION_PATH } = require('./lib/model')

const PLUGIN_ID = 'kshana-trust'

// Arguments the plugin must own: it reads kshana's JSON lines on standard output, so a gate, a listener, or a JSON or
// $PKSHT destination would break (or empty) that stream. For spawn-signalk-nmea the input is the server's own NMEA on
// standard input, so an input flag would replace it.
const FORBIDDEN_ARGS = ['--gate', '--listen', '--json', '--pksht']
const INPUT_ARGS = ['--stdin', '--file', '--tcp', '--udp', '--follow', '--from-end']
function badInputArg(source, args) {
  const bad = (args || []).find((a) => FORBIDDEN_ARGS.includes(a) || (source === 'spawn-signalk-nmea' && INPUT_ARGS.includes(a)))
  return bad
}

module.exports = function (app) {
  const plugin = { id: PLUGIN_ID, name: 'Kshana GNSS trust', started: false }
  let stops = []

  plugin.description =
    'Publishes the Kshana receiver-trust score, band and reasons and raises a notification when trust ' +
    'collapses. Advisory software, not type-approved equipment: the operator stays responsible.'

  plugin.schema = {
    type: 'object',
    title: 'Kshana GNSS trust (advisory software, not type-approved equipment)',
    properties: {
      source: {
        type: 'string',
        title: 'Where the trust epochs come from',
        description:
          'spawn-signalk-nmea: run kshana and feed it this server\'s own NMEA 0183 input. ' +
          'spawn-args: run kshana with your own input arguments (--tcp, --udp, --file). ' +
          'tcp-json: connect to a JSON-lines feed already produced by kshana. ' +
          'tcp-pksht: connect to an NMEA stream (e.g. the gate output) and read only its $PKSHT sentences.',
        enum: ['spawn-signalk-nmea', 'spawn-args', 'tcp-json', 'tcp-pksht'],
        default: 'spawn-signalk-nmea'
      },
      command: { type: 'string', title: 'kshana executable (spawn modes)', default: 'kshana' },
      sessionFile: {
        type: 'string',
        title: 'Session file (spawn modes): vessel limits, thresholds and score weights',
        default: '/etc/kshana/session.toml'
      },
      inputArgs: {
        type: 'array',
        title: 'Input arguments for kshana (spawn modes): the input for spawn-args, e.g. ["--tcp","192.0.2.10:10110"]; extra flags for spawn-signalk-nmea, e.g. ["--replay"] for a stored log fed faster than real time',
        items: { type: 'string' },
        default: []
      },
      host: { type: 'string', title: 'TCP host (tcp modes)', default: '127.0.0.1' },
      port: { type: 'integer', title: 'TCP port (tcp modes)', default: 10111, minimum: 1, maximum: 65535 },
      thresholdMode: {
        type: 'string',
        title: 'What decides the notification state',
        description: 'band: the band Kshana reports (its edges are in the session file). score: the two scores below.',
        enum: ['band', 'score'],
        default: DEFAULTS.thresholdMode
      },
      warnBelowScore: {
        type: 'number',
        title: 'score mode: warn below this score',
        default: DEFAULTS.warnBelowScore,
        minimum: 0,
        maximum: 100
      },
      alarmBelowScore: {
        type: 'number',
        title: 'score mode: alarm below this score',
        default: DEFAULTS.alarmBelowScore,
        minimum: 0,
        maximum: 100
      },
      degradedState: {
        type: 'string',
        title: 'Notification state for the degraded band',
        enum: ['normal', 'alert', 'warn'],
        default: DEFAULTS.degradedState
      },
      raiseAfterEpochs: {
        type: 'integer',
        title: 'Epochs at a worse state before the notification is raised',
        default: DEFAULTS.raiseAfterEpochs,
        minimum: 1
      },
      clearAfterEpochs: {
        type: 'integer',
        title: 'Epochs at a better state before the notification is lowered',
        default: DEFAULTS.clearAfterEpochs,
        minimum: 1
      },
      staleAfterS: {
        type: 'number',
        title: 'Warn when no epoch arrives for this many seconds (0 = off)',
        default: DEFAULTS.staleAfterS,
        minimum: 0
      },
      method: {
        type: 'array',
        title: 'Notification methods',
        items: { type: 'string', enum: ['visual', 'sound'] },
        default: DEFAULTS.method
      }
    }
  }

  function start(options) {
    const o = Object.assign({ source: 'spawn-signalk-nmea', command: 'kshana', host: '127.0.0.1', port: 10111 }, options || {})
    if (o.source === 'spawn-signalk-nmea' || o.source === 'spawn-args') {
      const bad = badInputArg(o.source, o.inputArgs)
      if (bad) {
        app.setPluginError(`inputArgs must not contain ${bad} (the plugin owns kshana's output${o.source === 'spawn-signalk-nmea' ? ' and input' : ''})`)
        return
      }
    }
    const tracker = new AlarmTracker(o)
    app.handleMessage(plugin.id, metaDelta(o))
    let lastEpochMs = Date.now()
    let stopped = false
    let onFirstEpoch = () => {}
    stops.push(() => {
      stopped = true
    })

    function onEpoch(epoch) {
      if (!epoch) return
      lastEpochMs = Date.now()
      onFirstEpoch()
      app.handleMessage(plugin.id, deltaFor(epoch, tracker))
      app.setPluginStatus(`trust ${epoch.band}${epoch.score === null ? '' : ' ' + epoch.score.toFixed(1)}`)
    }

    const jsonSplitter = () => lineSplitter((l) => onEpoch(parseJsonLine(l)))
    const pkshtSplitter = () => lineSplitter((l) => (l.startsWith('$PKSHT') ? onEpoch(parsePksht(l)) : null))

    function connectTcp(splitterFactory) {
      let sock = null
      let timer = null
      let delay = 1000
      const open = () => {
        if (stopped) return
        sock = net.connect(o.port, o.host)
        const sp = splitterFactory()
        sock.on('connect', () => {
          delay = 1000
          app.setPluginStatus(`connected ${o.host}:${o.port}`)
        })
        sock.on('data', (d) => sp.push(d))
        sock.on('error', (e) => app.debug('tcp error: ' + e.message))
        sock.on('close', () => {
          if (stopped) return
          app.setPluginStatus(`reconnecting ${o.host}:${o.port}`)
          timer = setTimeout(open, delay)
          delay = Math.min(delay * 2, 30000)
        })
      }
      open()
      return () => {
        clearTimeout(timer)
        if (sock) sock.destroy()
      }
    }

    function runChild() {
      let child = null
      let timer = null
      let delay = 1000
      let detach = () => {}
      let spawnError = null
      onFirstEpoch = () => {
        delay = 1000 // a child that produced data is healthy: the next restart starts from the short back-off
      }
      const launch = () => {
        if (stopped) return
        spawnError = null
        const args = ['receiver-trust', 'live', o.sessionFile || '/etc/kshana/session.toml']
        args.push(...(o.inputArgs || []))
        const me = spawn(o.command, args, { stdio: ['pipe', 'pipe', 'pipe'] })
        child = me
        me.exited = false
        const sp = jsonSplitter()
        me.stdout.on('data', (d) => sp.push(d))
        me.stderr.on('data', (d) => app.debug('kshana: ' + String(d).trim()))
        me.stdin.on('error', () => {})
        me.on('error', (e) => {
          spawnError = `cannot run ${o.command}: ${e.message}`
          app.setPluginError(spawnError)
        })
        me.on('close', (code) => {
          me.exited = true
          detach()
          if (stopped) return
          // keep the real reason (for example ENOENT) on screen; only a clean spawn that later exits gets the exit text
          if (!spawnError) app.setPluginError(`kshana exited (${code}); restarting`)
          timer = setTimeout(launch, delay)
          delay = Math.min(delay * 2, 30000)
        })
        if (o.source === 'spawn-signalk-nmea') {
          // The server emits each raw NMEA 0183 sentence it receives on app.signalk as 'nmea0183'.
          const feed = (s) => {
            if (me.stdin.writable) me.stdin.write(String(s).replace(/\r?\n?$/, '\n'))
          }
          app.signalk.on('nmea0183', feed)
          detach = () => app.signalk.removeListener('nmea0183', feed)
        }
      }
      launch()
      return () => {
        clearTimeout(timer)
        detach()
        const c = child
        if (c && !c.exited) {
          c.kill('SIGTERM')
          // a child that ignores SIGTERM is killed, not left running
          const k = setTimeout(() => {
            if (!c.exited) c.kill('SIGKILL')
          }, 2000)
          k.unref()
        }
      }
    }

    if (o.source === 'tcp-json') stops.push(connectTcp(jsonSplitter))
    else if (o.source === 'tcp-pksht') stops.push(connectTcp(pkshtSplitter))
    else stops.push(runChild())

    if (o.staleAfterS > 0) {
      const iv = setInterval(() => {
        if (Date.now() - lastEpochMs > o.staleAfterS * 1000) {
          const d = staleDelta(tracker)
          if (d) app.handleMessage(plugin.id, d)
        }
      }, Math.max(1000, (o.staleAfterS * 1000) / 2))
      stops.push(() => clearInterval(iv))
    }
    plugin.started = true
  }

  function stop() {
    const s = stops
    stops = []
    s.forEach((f) => f())
    plugin.started = false
  }

  plugin.start = start
  plugin.stop = stop
  return plugin
}
module.exports.PLUGIN_ID = PLUGIN_ID
module.exports.NS = NS
module.exports.NOTIFICATION_PATH = NOTIFICATION_PATH
