#!/usr/bin/env node
'use strict'
// Test stand-in for `kshana receiver-trust live`: after it has read one NMEA line on stdin it
// prints the recorded synthetic JSON lines, then exits when stdin closes. Nothing else.
const fs = require('fs')
const path = require('path')
if (process.env.FAKE_ARGS_FILE) fs.writeFileSync(process.env.FAKE_ARGS_FILE, JSON.stringify(process.argv.slice(2)))
if (process.env.FAKE_IGNORE_TERM) {
  process.on('SIGTERM', () => {})
  fs.writeFileSync(process.env.FAKE_IGNORE_TERM, String(process.pid))
}
let done = false
process.stdin.on('data', () => {
  if (done) return
  done = true
  process.stdout.write(fs.readFileSync(path.join(__dirname, 'fixtures', 'trust-excerpt.jsonl')))
})
process.stdin.on('end', () => process.exit(0))
setTimeout(() => process.exit(0), 20000)
