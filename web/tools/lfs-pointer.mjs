// SPDX-License-Identifier: AGPL-3.0-only
// Finds Git LFS pointer files: what a checkout holds in place of an LFS-tracked binary when
// `git lfs pull` was not run. The site source keeps the Studio's WebAssembly package, its
// native recordings and its images in Git LFS, so a port from such a checkout would publish
// ~130-byte pointers while every SHA in PORT-MANIFEST.json still matched what was copied.
// web/site.test.mjs runs lfsPointers over web/; web/tools/port_site.py refuses the same files
// (its LFS_POINTER constant must equal LFS_POINTER_HEADER; lfs-pointer.test.mjs checks).
import { readdirSync, openSync, readSync, closeSync } from "node:fs";
import { join } from "node:path";

export const LFS_POINTER_HEADER = "version https://git-lfs.github.com/spec/v1";

const head = (path, n) => {
  const fd = openSync(path, "r");
  try {
    const buf = Buffer.alloc(n);
    const got = readSync(fd, buf, 0, n, 0);
    return buf.subarray(0, got);
  } finally {
    closeSync(fd);
  }
};

/** True when the file at `path` begins with the Git LFS pointer header. */
export const isLfsPointer = (path) => head(path, LFS_POINTER_HEADER.length).toString("latin1") === LFS_POINTER_HEADER;

/** Every file under `root` (relative paths, sorted) that is a Git LFS pointer. */
export function lfsPointers(root) {
  const out = [];
  const walk = (dir, base) => {
    for (const e of readdirSync(dir, { withFileTypes: true })) {
      const rel = base ? `${base}/${e.name}` : e.name;
      if (e.isDirectory()) walk(join(dir, e.name), rel);
      else if (e.isFile() && isLfsPointer(join(dir, e.name))) out.push(rel);
    }
  };
  walk(root, "");
  return out.sort();
}
