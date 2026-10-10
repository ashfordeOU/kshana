#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# The JetBrains plugin shows the engine's compliance statement word for word. This compares the
# Kotlin copy (KshanaCli.COMPLIANCE_STATEMENT) with the engine's constant (compliance::STATEMENT in
# src/compliance/mod.rs) and fails if they differ by a single character.
#
# Skips, with a message and exit 0, while src/compliance/mod.rs is not in the tree (the compliance
# module arrives with its own branch); it runs for real the moment the module is merged. It does not
# skip when the module exists but the constant cannot be read: that is a failure.
set -euo pipefail

rust="src/compliance/mod.rs"
kotlin="ide/jetbrains/src/main/kotlin/dev/kshana/ide/KshanaCli.kt"
if [ ! -f "$rust" ]; then
  echo "SKIP: $rust is not in this tree (the compliance module is not merged yet); the JetBrains statement is not compared."
  exit 0
fi
[ -f "$kotlin" ] || { echo "FAIL: $kotlin is missing" >&2; exit 1; }

python3 -I - "$rust" "$kotlin" <<'PY'
import re, sys

rust_src = open(sys.argv[1], encoding="utf-8").read()
kt_src = open(sys.argv[2], encoding="utf-8").read()

m = re.search(r'pub const STATEMENT: &str =\s*(.*?);', rust_src, re.S)
if not m:
    sys.exit("FAIL: could not find `pub const STATEMENT` in " + sys.argv[1])
# One or more "..." literals; in Rust a backslash at the end of a line removes the newline and the
# leading whitespace of the next line.
body = m.group(1)
lits = re.findall(r'"((?:[^"\\]|\\.)*)"', body, re.S)
if not lits:
    sys.exit("FAIL: no string literal in the engine's STATEMENT")
raw = "".join(lits)
rust = re.sub(r'\\\n\s*', '', raw).replace('\\"', '"').replace("\\\\", "\\")

k = re.search(r'const val COMPLIANCE_STATEMENT: String =\s*((?:"(?:[^"\\]|\\.)*"\s*\+?\s*)+)', kt_src, re.S)
if not k:
    sys.exit("FAIL: could not find COMPLIANCE_STATEMENT in " + sys.argv[2])
parts = re.findall(r'"((?:[^"\\]|\\.)*)"', k.group(1), re.S)
kt = "".join(parts).replace('\\"', '"').replace("\\\\", "\\")

if rust != kt:
    print("FAIL: the JetBrains COMPLIANCE_STATEMENT differs from compliance::STATEMENT", file=sys.stderr)
    print("  engine : " + repr(rust), file=sys.stderr)
    print("  plugin : " + repr(kt), file=sys.stderr)
    sys.exit(1)
print(f"OK: the JetBrains compliance statement matches compliance::STATEMENT ({len(rust)} characters)")
PY
