# Rules for translating Kshana engine messages (Fluent .ftl)

Input /tmp/claude-0/i18n/batches/en_NN.ftl (English, ~370 messages). Output /tmp/claude-0/i18n/out/<lang>_NN.ftl with EXACTLY the same structure: the same `## section` comment lines, the same ids in the same order, the same number of lines per message (multi-line messages keep line breaks and 4-space indentation), one blank line between messages. Only the English words of the VALUE change.
Read the language glossary /workspace/kshana-pro/site/i18n-0.40/i18n/glossary/<lang>.json first (terms, terms kept in English, register, forbidden_translations, linguistic_notes) and use its renderings consistently. If /tmp/claude-0/i18n/out/<lang>_00.ftl exists, it is a finished sample of this language: match its style and term choices.

HARD RULES (a script rejects the file if one is broken):
1. Keep every id. Keep every placeable `{ ... }` exactly, including `{ $var }`, `{ " " }`, `{ "\u000A" }`, `{ "{" }`, `{ "}" }`. You may move a placeable within the sentence for word order, never add, drop or edit one.
2. Never change a number, a code span in backticks, a file name, path, command or flag, a scenario-kind name, a unit symbol (m, s, ns, dB-Hz, km, deg, ppm, rpm ...), an error code like E-CLOCK-VERSION, a URL, JSON/CSV keys or markdown table syntax. Keep these verdict/tier words in English, in capitals, exactly as many times as the English has them: MODELLED, VALIDATED, PARTNER, NOT MET, MET, EXPLORATORY, CORROBORATED, NOT CORROBORATED. If the English has lowercase or capitalised 'validated'/'modelled', use the glossary rendering and do NOT write the capitalised tier word. Keep acronyms (GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC ...).
3. If a message is not human language (CSS, code, only placeables and punctuation, a separator line like `|---|---|`), copy it unchanged.
4. Markdown table header cells and labels ARE translated (keep the pipes and the same cell count).
5. Never use the words in forbidden_translations as a claim. Where the English says 'not type-approved', 'not a certification' etc., keep the negation and its exact scope. For 'supports evidence for' use the glossary phrase.
6. Register as in the glossary. Neutral, precise technical language; add nothing; keep sentences as short as the English. English plural hints like 'session(s)' become the natural parenthetical form in the language (numbers are pre-formatted strings, no selectors).
7. Keep leading `{ " " }` placeables and leading spaces where the English has them.

Workflow: read the English file in full, translate, write the whole output (Write, then Bash `cat >>` for further parts if needed; the final file must be complete), then run `python3 /tmp/claude-0/i18n/tools.py check <en file> <out file>` and fix every problem until it prints OK. Report in one or two lines: OK and ids you were unsure about.

8. Exception to the forbidden list: an X.509 / TLS / PEM *certificate* (a cryptographic object, English 'certificate', 'TSA certificate', 'cert') is not a claim of certification: translate it with the normal word of the language (Zertifikat, certificat, certificado/certificate, certificaat, certifikat, sertifikat), never an abbreviation. The forbidden words remain forbidden as claims about Kshana or a result.
