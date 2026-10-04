# Galileo E5a-I / E5a-Q primary codes (test fixtures): provenance

`C3_E5aI.txt` and `C4_E5aQ.txt` are Annex C.3 and C.4 of the Galileo OS SIS ICD, extracted
byte for byte from the embedded attachments of Issue 2.0 (January 2021),
<https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.0.pdf>
(PDF SHA-256 `ce97057a9e9d74cc41a6b986c6e9ef03ce420eda474787b4f8f0456b369a81c0`, retrieved
2026-10-04). Both are byte-identical to the same attachments in Issue 1.3 (December 2016).

| File | SHA-256 (as extracted) |
|---|---|
| `C3_E5aI.txt` | `25fcb39faa46a076130eaab38e3ff94f2600473bb5572ba9f0b490be7f6b85fb` |
| `C4_E5aQ.txt` | `6aec5395e48d352ff7ae198587e7d59ba0315bf5a6e21201aa30e0c0b6353f95` |

They are the independent oracle for the E5a LFSR generator in `src/iq/signals/galileo.rs`:
`tests/iq_signals.rs` compares all 10230 chips of all 50 codes of each component. They are
test-only (the crate generates E5a codes by LFSR and does not ship these files). The same
EU terms as in `data/galileo-os-sis-icd/PROVENANCE.md` apply.
