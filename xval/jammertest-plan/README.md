# Jammertest test catalogue and transmission plan (fetch only)

Source: <https://github.com/NPRA/jammertest-plan>, published by the Norwegian Public Roads
Administration, pinned to commit `75c0b2ceea10e470c3799d14a8ef18842d8375a7`.

Licence: MIT, "Copyright (c) 2024 Norwegian Public Roads Administration (Statens Vegvesen)" (the
`LICENSE` row of `MANIFEST.tsv` is the checked copy of that text). The files are small and MIT, but
Kshana still does not vendor them: `fetch.sh` downloads them to a directory outside the repository
and refuses any file whose SHA-256 differs from `MANIFEST.tsv`. Cite the source when using results.

The plan files carry a test-contact field with a person's name; `kshana jammertest import` does not
read it and nothing derived from it is written.

No endorsement by the Norwegian Public Roads Administration, Nkom or the event organisers is
claimed or implied.

Use: `kshana jammertest import|score` (docs/JAMMERTEST.md).
