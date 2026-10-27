You are improving part of the Kshana engine's Fluent (.ftl) catalogue in LANGNAME (code LANG): the messages whose variables are COUNTS now reach Fluent as NUMBERS, so a message may use a plural selector instead of the number-independent "label: N" workaround.

Read the language guide first: GUIDE (terms, register, plural categories, case notes). Plural categories for LANG: CATS. The `*[other]` variant is mandatory and carries the `*`.

Files
- English messages (186; a `# count variables (numbers): ...` comment names the numeric variables of each): CD/en.ftl
- Your current translation of the same ids (some may be missing = currently shown in English): CD/cur-LANG.ftl
- Write your improved messages to: CD/out-LANG.ftl  -- only the messages you CHANGE or newly translate (the rest stay as they are). Each message keeps its id.
- Validate: `python3 VALIDATE CD/en.ftl CD/out-LANG.ftl` until it prints `0 problems` (it prints how many of the 186 you did not include; that is fine).

What to do, per message
1. If a noun, verb or adjective in the sentence has to agree with a count variable (e.g. "{ $n } satellites", "has { $n_epochs } epochs", "needs at least { $n } rows"), write a selector on that variable with every plural category of LANG, each variant a complete natural phrase, for example
```
engine-x =
    { $n ->
        [one] { $n } satelita widoczny
       *[other] { $n } satelitów widocznych
    }
```
Keep all other variables, literals, backtick spans, tier words and numbers exactly as in the English. If two count variables each need agreement, nest the selectors or restructure the sentence so that only one needs it.
2. If the "count" variable is not really a count in that sentence (it is a name, a column, a label, an index, a value shown after an equals sign, or the sentence reads correctly for any value as it is), do NOT add a selector: leave that message out of your output file (the current translation stays).
3. If a message is missing from the current file, translate it (omit it only if it has no human words), using a selector where agreement needs one.
4. Keep the register of the guide, glossary terms and the rules of the earlier translation: tier and verdict words (VALIDATED, MODELLED, PARTNER, MET, NOT MET, EXPLORATORY, PREDICTION, CORROBORATED, NOT CORROBORATED, REFUSED, DEGRADED, DEFICIENT, OBSERVED, LOST, MISMATCH) stay English capitals; never certified/conformant/compliant claims; no digits that English does not have.
5. Layout: a message written with a selector uses the multi-line form shown above (message id and ` =` on the first line, the selector indented 4 spaces, variants indented, closing brace on its own line). Messages that stay single-line when they have no selector stay single-line. Trailing/leading `{ " " }` literals and other string-literal placeables are kept.
6. No explanations in the file; UTF-8, LF, no tabs.

When the validator prints `0 problems`, reply with ONE short paragraph: how many messages you changed or added with selectors, how many you left as they were, and any message you were unsure about (ids and a few words why).
