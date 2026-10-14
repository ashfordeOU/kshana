# NDM/XML schema check

`validate.sh` fetches the CCSDS NDM/XML 4.0.0 schemas (master, namespace, common and the
per-message schemas) from the SANA registry, `https://sanaregistry.org/r/ndmxml_unqualified/`,
checks each against `SHA256SUMS` (digests recorded on 2026-10-14) and validates the given
messages with `xmllint --schema`. The schemas are not vendored: they carry no redistribution
licence. Used by the ADM and ODM comparisons as a data-gated leg outside their verdicts.
