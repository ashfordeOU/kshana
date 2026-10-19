#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Run the external-oracle comparison tests on THIS host and say, for every failure, which
# kind it is. For issue #36 (the tests that pass on CI Linux and fail on a local macOS
# checkout): CI's only macOS job runs four platform-independent targets, so these
# comparisons have never run on Apple silicon anywhere but a developer's machine, and until
# a failing list is captured from one the cause of each cannot be told.
#
# Usage:   scripts/oracle-triage.sh [--all] [--release] [--log <file>] [-- <extra cargo test args>]
#          --all    run the whole suite (`cargo test --all`, no fail-fast) instead of only the
#                   oracle and reference targets: the byte-pin guards are in other targets
# Output:  a log (default oracle-triage.log), a summary on stdout (and in
#          $GITHUB_STEP_SUMMARY when set), and exit status 0 when every test passed, 1 when
#          one failed, 2 when the host or toolchain is not set up.
#
# It runs every integration target named `*_oracle` or `*_reference` with --no-fail-fast, in
# the debug profile unless --release is given (the profile changes floating-point results on
# macOS: an optimised build merges a sine and a cosine into one library call, see
# src/portable_math.rs). Written for bash 3.2 (macOS) and GNU bash alike: no mapfile, no
# associative arrays, no GNU-only flags.
set -u

profile=""
scope_all=0
summarise_only=""
log="oracle-triage.log"
extra=()
while [ $# -gt 0 ]; do
  case "$1" in
    --release) profile="--release"; shift ;;
    --all) scope_all=1; shift ;;
    --log) log="${2:?--log needs a file}"; shift 2 ;;
    --summarise) summarise_only="${2:?--summarise needs a log file}"; shift 2 ;;
    --) shift; extra=("$@"); break ;;
    -h|--help) sed -n 2,21p "$0"; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
done

case "$log" in /*) ;; *) log="$PWD/$log" ;; esac
case "$summarise_only" in ""|/*) ;; *) summarise_only="$PWD/$summarise_only" ;; esac
cd "$(dirname "$0")/.." || exit 2
have="$(rustc --version 2>/dev/null | awk '{print $2}')"
status=0

if [ -z "$summarise_only" ]; then
# ---- preflight: what this host is, and what the run needs -------------------------------
echo "== host =="
echo "uname: $(uname -srm)"
want="$(sed -n 's/^channel *= *"\(.*\)"/\1/p' rust-toolchain.toml)"
have="$(rustc --version 2>/dev/null | awk '{print $2}')"
echo "rustc: ${have:-not found} (pinned: ${want:-unknown})"
if [ -z "$have" ]; then echo "rustc is not on PATH; install the pinned toolchain with rustup" >&2; exit 2; fi
if [ -n "$want" ] && [ "$have" != "$want" ]; then
  echo "WARNING: rustc $have is not the pinned $want; floating-point results can differ between releases. rustup honours rust-toolchain.toml inside the checkout." >&2
fi
arch="$(uname -m)"; os="$(uname -s)"
if [ "$os" = "Darwin" ]; then
  echo "note: macOS ($arch). The system libm rounds sin, cos, exp, ln and pow differently from glibc, so a comparison that is tighter than that noise can fail here and pass on Linux; see docs/LOCAL-ORACLE-TESTS.md."
fi
if [ ! -d tests/fixtures ]; then echo "tests/fixtures is missing: is this a full checkout (git lfs, sparse checkout)?" >&2; exit 2; fi
if git rev-parse --is-shallow-repository >/dev/null 2>&1 && [ "$(git rev-parse --is-shallow-repository)" = "true" ]; then
  echo "note: shallow clone. Tests that read history (the attribution check) need full history; the oracle tests do not."
fi

# ---- the targets -------------------------------------------------------------------------
targets=""
n=0
for f in tests/*_oracle.rs tests/*_reference.rs; do
  [ -e "$f" ] || continue
  t="$(basename "$f" .rs)"
  targets="$targets --test $t"
  n=$((n + 1))
done
if [ "$scope_all" -eq 1 ]; then targets="--all"; n="all"; fi
echo "== running $n targets ($([ -n "$profile" ] && echo release || echo debug)) =="

# shellcheck disable=SC2086
cargo test --locked --no-fail-fast $profile $targets ${extra[@]+"${extra[@]}"} 2>&1 | tee "$log"
status=${PIPESTATUS[0]}
fi

# ---- summary -------------------------------------------------------------------------------
summary() {
  echo "## Oracle tests on $(uname -srm), rustc ${have}"
  echo
  passed="$(grep -E '^test result: ' "$log" | sed -n 's/.* \([0-9][0-9]*\) passed.*/\1/p' | awk '{s+=$1} END {print s+0}')"
  failed="$(grep -E '^test result: ' "$log" | sed -n 's/.* \([0-9][0-9]*\) failed.*/\1/p' | awk '{s+=$1} END {print s+0}')"
  echo "passed: $passed, failed: $failed"
  echo
  if [ "$failed" -gt 0 ] || [ "$status" -ne 0 ]; then
    echo "| failing test | kind | first line of its message |"
    echo "|---|---|---|"
    # Each failure prints "---- <name> stdout ----" then its panic message.
    awk '
      /^---- .* stdout ----$/ { name=$2; capture=1; next }
      capture && /panicked at/ { getline m; print name "\t" m; capture=0 }
    ' "$log" | while IFS="$(printf '\t')" read -r name msg; do
      kind="other: read the message"
      case "$msg" in
        *"No such file"*|*"cannot read"*|*"not found"*|*"missing"*|*"fetch_"*) kind="(a) a missing or different local data file: run the fetch script it names" ;;
        *"left == right"*|*"drifted"*|*"differs"*|*"rel "*|*"tolerance"*|*"< 1e"*|*"<= 1e"*) kind="(b) a comparison tighter than the host's libm noise, or (c) a real defect: compare the two values" ;;
      esac
      echo "| \`$name\` | $kind | $(printf '%s' "$msg" | cut -c1-160 | tr '|' '/') |"
    done
    echo
    echo "A failure whose two values agree to about 1e-12 of their scale is (b); one that differs in the third digit is (c). Never loosen a pre-registered bar to make it pass: change what is compared (for example evaluate the graded comparison on the committed inputs) and say why. Full log: $log"
  fi
}
if [ -n "$summarise_only" ]; then
  log="$summarise_only"
  if grep -qE '^test result: FAILED' "$log"; then status=1; fi
fi
summary | tee "${log%.log}.summary.md"
if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then cp "${log%.log}.summary.md" "$GITHUB_STEP_SUMMARY"; fi
[ "$status" -eq 0 ] && exit 0 || exit 1
