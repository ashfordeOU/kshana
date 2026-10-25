You are translating parts of the Kshana engine's message catalogue (Project Fluent, .ftl) from English into LANGNAME (code LANG). Kshana is a deterministic GNSS/PNT-resilience engine; the text is what its command line, reports and charts print for people.

First read the language guide: GUIDE (terms, register, punctuation, forbidden renderings, advisory sentences) and follow it.

Do these chunks in order, one at a time. For each NN in: CHUNKS
- Input (English chunk): CH/en-NN.ftl
- Write your translation to: OUT/LANG-NN.ftl   (one message per English message, ids unchanged; `## section` comment lines may be kept or dropped)
- Then run `python3 VALIDATE CH/en-NN.ftl OUT/LANG-NN.ftl` and repeat fixing until it prints `0 problems` before starting the next chunk.

Rules
1. Translate every message that contains human-language text. A message with NO human words (CSS, TOML or JSON fragments, identifiers, paths, format scaffolding) is omitted from your output entirely (English is then shown). When in doubt, translate the human words and copy the rest exactly.
2. Keep exactly: the message id; every `{ $variable }` placeable (name and count); every string-literal placeable such as `{ "{" }`, `{ "}" }`, `{ " " }`, `{ "\u000A" }` (do not edit them; keep them at the same logical position, e.g. a leading `{ " " }` stays at the start of its line); text inside backticks; all numbers and digits; Kshana, command and flag names (`--lang`, `kshana ...`), file names and extensions, scenario kind names, unit symbols (dB-Hz, m/s, ns ...), identifiers with underscores or digits (tau0_s, P_fa), acronyms (GNSS, PNT, DOP, PDOP, RMS, ROC, TOML, JSON), error codes (E-...), config keys and literal values shown in code style, and URLs.
3. Tier and verdict words stay in English capitals, never translated or inflected: VALIDATED, MODELLED, PARTNER, MET, NOT MET, EXPLORATORY, PREDICTION, CORROBORATED, NOT CORROBORATED, REFUSED, DEGRADED, DEFICIENT, OBSERVED, LOST, MISMATCH (all-caps status words are verdicts: keep them exactly). Never write that Kshana is certified, conformant or compliant (see the guide); "supports evidence for" has its fixed rendering in the guide's terms. A lowercase English word such as "validated" in running text is ordinary prose: translate it with a plain word, not the tier word.
4. Keep the line structure: the same number of lines as English, the same blank lines, the same 4-space indentation of continuation lines, markdown (`#`, `###`, `**`, `|` tables, lists), HTML tags and attributes. Translate only the words between them.
5. Most variables are pre-formatted strings, so a sentence must not depend on their grammatical number: use a construction that works for any value (a colon form such as "label: value", or the neutral "(s)" style the English already uses), and make the sentence read correctly with a variable in that slot. EXCEPTION: the message ids listed in $REPO/i18n/en/engine-counts.txt (the id there lacks the `engine-` prefix) receive their count variables as NUMBERS. For those, write a proper Fluent selector with every plural category of your language (see the guide; the `*[other]` variant is mandatory and marked with `*`), e.g.
```
engine-x =
    { $n ->
        [one] { $n } satellite
       *[other] { $n } satellites
    }
```
and keep the other variables in the variants. For a language with only `other` (ja, zh-Hans) write no selector, just a counter word if natural. Numbers and decimal marks are formatted by the program; do not change them.
6. Register as in the guide: technical, neutral, concise; glossary terms used consistently; a term marked * stays English.
7. If an English message embeds one of the guide's advisory sentences, use its translation exactly.
8. Do not add or drop sentences, do not explain, do not add comments inside messages. Write plain .ftl text with the Write tool, messages separated by one blank line, UTF-8, LF, no trailing spaces, no tabs.

When all chunks validate with `0 problems`, reply with ONE short paragraph: per chunk the translated/omitted counts, then any messages you were unsure about (ids and a few words why). Do not paste translations in the reply.
