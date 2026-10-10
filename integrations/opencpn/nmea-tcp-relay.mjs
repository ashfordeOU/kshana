#!/usr/bin/env node
// Fan a line stream (Kshana gate-mode NMEA on stdin) out to every TCP client that connects, so a
// consumer such as OpenCPN can add it as a TCP network connection. Bytes are forwarded
// unchanged, whole lines only. No dependencies: node:net only.
//
//   kshana receiver-trust live session.toml --gate --json trust.jsonl | node nmea-tcp-relay.mjs --listen 10110
//
// Advisory software, not type-approved equipment: the operator stays responsible.
import net from 'node:net'
import fs from 'node:fs'
import { fileURLToPath } from 'node:url'

export const MAX_LINE_BYTES = 65536 // a held partial line longer than this is dropped, as in the Signal K plugin's line splitter

export function startRelay({ port = 10110, host = '127.0.0.1', waitClients = 0, maxQueueBytes = 1 << 20 } = {}) {
  const clients = new Set()
  const waiters = []
  const server = net.createServer((sock) => {
    sock.setNoDelay(true)
    clients.add(sock)
    sock.on('error', () => {})
    sock.on('close', () => clients.delete(sock))
    sock.on('data', () => {}) // consumers may talk back; ignored
    if (clients.size >= waitClients) while (waiters.length) waiters.shift()()
  })
  let tail = Buffer.alloc(0)
  return {
    server,
    clients,
    listen: () => new Promise((r) => server.listen(port, host, () => r(server.address().port))),
    // resolves once `waitClients` consumers are connected
    ready: () => (clients.size >= waitClients ? Promise.resolve() : new Promise((r) => waiters.push(r))),
    // Forward complete lines only; a partial last line is held until its newline arrives.
    write(chunk) {
      tail = Buffer.concat([tail, chunk])
      const i = tail.lastIndexOf(0x0a)
      if (i < 0) {
        // input with no newline must not grow the buffer without bound
        if (tail.length > MAX_LINE_BYTES) tail = Buffer.alloc(0)
        return
      }
      const out = tail.subarray(0, i + 1)
      tail = tail.subarray(i + 1)
      for (const c of clients) {
        // a consumer that does not read must not stall the others or grow memory without bound
        if (c.writableLength > maxQueueBytes) c.destroy()
        else c.write(out)
      }
    },
    end() {
      for (const c of clients) c.end()
      server.close()
    }
  }
}

// run as a script only when this file is the entry point (symlinks and paths with special characters resolved)
const isMain = (() => {
  try {
    return process.argv[1] && fs.realpathSync(process.argv[1]) === fs.realpathSync(fileURLToPath(import.meta.url))
  } catch (e) {
    return false
  }
})()
if (isMain) {
  const arg = (n, d) => {
    const i = process.argv.indexOf(n)
    return i > 0 ? process.argv[i + 1] : d
  }
  const relay = startRelay({
    port: Number(arg('--listen', 10110)),
    host: arg('--host', '127.0.0.1'),
    waitClients: Number(arg('--wait-clients', 0))
  })
  const p = await relay.listen()
  console.error(`nmea-tcp-relay: listening on ${arg('--host', '127.0.0.1')}:${p}. Advisory software, not type-approved equipment.`)
  await relay.ready()
  process.stdin.on('data', (d) => relay.write(d))
  process.stdin.on('end', () => relay.end())
}
