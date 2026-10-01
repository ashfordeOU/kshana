// SPDX-License-Identifier: AGPL-3.0-only
// The validation counts the capability explorer leads with. They are read from
// data/verification-matrix.json, which `cargo run --bin gen_validation_artifacts`
// generates from src/verification.rs and tests/verification_artifacts_doc_sync.rs pins
// to it. The README counts are pinned to the same matrix by
// tests/readme_validation_counts_doc_sync.rs, so the site and the READMEs state one
// set of numbers from one source.
//
// The explorer used to lead with its own card tally ("46 capability cards … 17 backed
// by an external oracle"), a curated summary layer counted a different way, which read
// as a contradiction of the READMEs' "64 of 168". The card count is still shown, but
// named as what it is and placed after the matrix figures. Pure logic; app.js puts the
// strings into the page with textContent.

/// `{total, validated, modelled, partner}` counted from the ledger's rows. Throws when
/// the file's own `summary` block disagrees with its rows, so a hand-edited or
/// half-regenerated file cannot put a wrong number on the page.
export function matrixCounts(ledger) {
  const rows = ledger && Array.isArray(ledger.rows) ? ledger.rows : [];
  const n = (status) => rows.filter((r) => r && r.status === status).length;
  const counts = {
    total: rows.length,
    validated: n("VALIDATED"),
    modelled: n("MODELLED"),
    partner: n("PARTNER"),
  };
  const s = ledger && ledger.summary;
  if (s) {
    const want = { total: s.total, validated: s.validated, modelled: s.modelled, partner: s.partner_owned };
    for (const k of Object.keys(counts)) {
      if (want[k] !== counts[k]) {
        throw new Error(`verification-matrix.json summary.${k}=${want[k]} but its rows count ${counts[k]}`);
      }
    }
  }
  if (counts.validated + counts.modelled + counts.partner !== counts.total) {
    throw new Error("verification-matrix.json has rows with an unknown status");
  }
  return counts;
}

/// The headline tally: the verification matrix first, in the same terms as the
/// READMEs, then the capability cards named as a summary of it.
export function explorerTally(m, cards) {
  const matrix = `${m.validated} of ${m.total} capabilities validated against an external oracle · ${m.modelled} modelled · ${m.partner} partner-owned`;
  const layer = `shown here as ${cards.total} capability cards in ${cards.domains} domains, ${cards.evidence} evidence claims`;
  return `${matrix} — ${layer}`;
}

/// The tally when the "Validated only" filter is on.
export function explorerValidatedTally(m, cards) {
  return `${m.validated} of ${m.total} capabilities validated against an external oracle — shown here as ${cards.validated} capability cards and ${cards.evidenceValidated} evidence claims`;
}
