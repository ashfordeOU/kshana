# Galileo E1-B / E1-C primary memory codes: provenance

These two files are the Galileo E1 primary codes exactly as the European Union publishes
them in Annex C of the Galileo Open Service Signal-In-Space Interface Control Document.
They were extracted byte for byte from the PDF's embedded attachments (`pdfdetach
-saveall`); nothing was retyped or edited. The library embeds them with `include_str!`
(`src/iq/signals/galileo.rs`).

| File | ICD section | Codes | Length |
|---|---|---|---|
| `C7_E1B.txt` | Annex C.7, E1-B primary codes | 50 | 4092 chips (1023 hex symbols) |
| `C8_E1C.txt` | Annex C.8, E1-C primary codes | 50 | 4092 chips (1023 hex symbols) |

Format (ICD Annex C.2): one line per code, `<label>_<number>;<hex>`, the first chip in time
in the most significant bit of the first hex symbol. Logic 1 is signal level -1.0 and logic
0 is +1.0 (ICD Table 11).

## Source

* Document: Galileo OS SIS ICD, **Issue 2.0, January 2021**
* URL: <https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.0.pdf>
* Retrieved: 2026-10-04
* SHA-256 of the PDF: `ce97057a9e9d74cc41a6b986c6e9ef03ce420eda474787b4f8f0456b369a81c0`

Why Issue 2.0 rather than the current Issue 2.1 (November 2023): Issue 2.1 §3.4.2 still
defines the E1 codes by reference to Annex C "provided only in the electronic version",
and its Annex C §C.3-C.8 says the codes are in the PDF's attachments panel, but the Issue
2.1 PDF currently served at
<https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.1.pdf>
(SHA-256 `15b09498518c3c3c802606c26a35fef26d72de8b5941f27f58d8f26d0ca47fc0`, retrieved
2026-10-04) carries no embedded files. Issue 2.1's change record lists no change to the E1
codes, and Table 106 still gives 50 codes of 4092 chips per component.

## Hashes

| File | SHA-256 (bytes as extracted, CRLF line ends) | SHA-256 with `\r` removed |
|---|---|---|
| `C7_E1B.txt` | `26ce97a6a76b579f003f2ad6cbd7715c32768c1cb25afcfa9af38c30fe0a0df2` | `31573a17c451e319a69c30fe6dcdfd949ebda8e3e77c96665981ff5b866ed247` |
| `C8_E1C.txt` | `4151184f12d536ba0fedccb041406ff5480ce4e919547c94196bad3f1a5b0875` | `37a0f71b49af0c03b8530e2376bcf244b0ef0e76027026f23aebf9611ca4a4a6` |

`tests/iq_signals.rs` checks the CR-stripped hash, so a checkout that converts line ends
still verifies.

## Cross-check against an earlier issue

The same attachments in **Issue 1.3 (December 2016)**,
<https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v1.3.pdf>
(SHA-256 `6e57a6fd8f9d5dc4b1d2b58c2d696df91a9ac36e33a58a6b714d1e49bd7f09ac`), were compared:
`C7_E1B.txt` is byte-identical (same SHA-256); `C8_E1C.txt` differs only by one trailing
empty line (identical code lines). Two issues five years apart publish the same codes.

## Terms: these files are not under the repository's licence

The E1 memory codes are "Technical Data of the OS SIS ICD", which the ICD states are
subject to intellectual-property rights of the European Union. They are **not** covered by
Kshana's AGPL-3.0 or commercial licence and neither licence grants anything over them.
Their use rests on the EU's own Authorisation in Annex H of the ICD (Issue 2.1, "Authorisation
Concerning the OS SIS ICD IPRs"): a non-exclusive, royalty-free covenant issued directly to
every person worldwide, covering (H.3 a) the use of the Technical Data including their
incorporation into software products that make use of the OS Signal, and (H.3 b) their
storage provided the source is acknowledged. The source is acknowledged above. The
Authorisation is non-transferable and non-licensable, so each user of this repository
relies on it directly; read the ICD's "Terms of Use and Disclaimers" and Annex H before
redistributing these files. Nothing here states or implies that Kshana is developed,
used, approved or endorsed by the EU (H.3).

This note records how the files are used; it is not legal advice, and the repository owner
should confirm it fits the dual-licensing model before a release.
