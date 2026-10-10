// SPDX-License-Identifier: AGPL-3.0-only
// Plants a Git LFS pointer and checks that both guards fire: the scanner web/site.test.mjs
// runs over web/, and the refusal web/tools/port_site.py applies to every file it would
// write. Also keeps the two header constants equal. Run with `node web/tools/lfs-pointer.test.mjs`.
import { mkdtempSync, mkdirSync, writeFileSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { execFileSync } from "node:child_process";
import assert from "node:assert/strict";
import { LFS_POINTER_HEADER, lfsPointers, isLfsPointer } from "./lfs-pointer.mjs";

const TOOLS = dirname(fileURLToPath(import.meta.url));
// What `git lfs` leaves in a checkout that never pulled: the spec line, the object id, the size.
const POINTER = `${LFS_POINTER_HEADER}\noid sha256:${"ab".repeat(32)}\nsize 9176866\n`;

// 1. The scanner (web/site.test.mjs check 0).
const root = mkdtempSync(join(tmpdir(), "kshana-lfs-"));
try {
  mkdirSync(join(root, "studio", "pkg"), { recursive: true });
  writeFileSync(join(root, "index.html"), "<!doctype html><title>ok</title>\n");
  writeFileSync(join(root, "studio", "pkg", "kshana_bg.wasm"), Buffer.from([0x00, 0x61, 0x73, 0x6d, 1, 0, 0, 0]));
  writeFileSync(join(root, "tiny.txt"), "v");
  assert.deepEqual(lfsPointers(root), [], "a tree with no pointer is clean");
  writeFileSync(join(root, "studio", "pkg", "kshana_bg.wasm"), POINTER);
  writeFileSync(join(root, "assets.png"), POINTER);
  assert.deepEqual(lfsPointers(root), ["assets.png", "studio/pkg/kshana_bg.wasm"], "both planted pointers are found");
  assert.equal(isLfsPointer(join(root, "index.html")), false);
  // Text that merely mentions LFS further in is not a pointer.
  writeFileSync(join(root, "doc.md"), `see ${LFS_POINTER_HEADER}\n`);
  assert.equal(isLfsPointer(join(root, "doc.md")), false, "only a file that begins with the header is a pointer");
} finally {
  rmSync(root, { recursive: true, force: true });
}

// 2. The port's refusal (web/tools/port_site.py refuse_lfs_pointers, called before anything is written).
const py = `
import json, sys
sys.path.insert(0, ${JSON.stringify(TOOLS)})
import port_site as p
assert p.LFS_POINTER.decode() == ${JSON.stringify(LFS_POINTER_HEADER)}, "header constants differ"
out = {"index.html": b"<!doctype html>", "studio/pkg/kshana_bg.wasm": ${JSON.stringify(POINTER)}.encode(), "a.png": ${JSON.stringify(POINTER)}.encode()}
bad = p.refuse_lfs_pointers(out)
print(json.dumps({"bad": bad, "errors": p.errors}))
`;
const res = JSON.parse(execFileSync("python3", ["-c", py], { encoding: "utf8" }));
assert.deepEqual(res.bad, ["a.png", "studio/pkg/kshana_bg.wasm"], "the port refuses both planted pointers");
assert.equal(res.errors.length, 2, "one failure per pointer");
for (const [i, rel] of ["a.png", "studio/pkg/kshana_bg.wasm"].entries()) {
  assert.ok(res.errors[i].startsWith(`${rel}: is a Git LFS pointer`), `the failure names ${rel}: ${res.errors[i]}`);
}
// And main() calls it before the manifest is written.
const src = readFileSync(join(TOOLS, "port_site.py"), "utf8");
const main = src.slice(src.indexOf("def main():"));
assert.ok(main.indexOf("refuse_lfs_pointers(out)") > 0 && main.indexOf("refuse_lfs_pointers(out)") < main.indexOf("manifest = {"),
  "port_site.py main() refuses LFS pointers before it writes the manifest");

console.log("lfs-pointer: OK (scanner and port refusal both fire on a planted pointer)");
