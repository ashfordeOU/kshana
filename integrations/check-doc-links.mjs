// Checks that every relative link in this workstream's markdown resolves to a file or directory in the repository.
// No network, no dependencies. Usage: node integrations/check-doc-links.mjs   (from anywhere)
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..')
const files = ['docs/MARINE-INTEGRATIONS.md', 'deploy/reference-build/README.md']
const walk = (d) => {
  for (const e of fs.readdirSync(path.join(root, d), { withFileTypes: true })) {
    const rel = path.join(d, e.name)
    if (e.isDirectory()) {
      if (e.name !== 'node_modules' && e.name !== 'third_party') walk(rel)
    } else if (e.name.endsWith('.md')) files.push(rel)
  }
}
walk('integrations')
let bad = 0
for (const f of files) {
  const text = fs.readFileSync(path.join(root, f), 'utf8').replace(/```[\s\S]*?```/g, '') // links inside code blocks are examples
  for (const m of text.matchAll(/\]\(([^)\s]+)\)/g)) {
    const target = m[1]
    if (/^[a-z][a-z0-9+.-]*:/i.test(target) || target.startsWith('#')) continue
    const file = decodeURIComponent(target.split('#')[0])
    if (!file) continue
    if (!fs.existsSync(path.resolve(root, path.dirname(f), file))) {
      console.error(`DEAD LINK ${f}: ${target}`)
      bad++
    }
  }
}
if (bad) process.exit(1)
console.log(`link check ok: ${files.length} files`)
