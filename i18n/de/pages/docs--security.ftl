# docs--security: translations (de)

# text
seg-4609cf7fb790 = Sicherheitsrichtlinie

# text
# c1: SECURITY.md
seg-ff991a587e4b = Quelle: <c1/>

# text
seg-7315b27c34f8 = Eine Sicherheitslücke melden

# text
seg-2f06a8b277b7 = Melden Sie sie vertraulich, auf einem der beiden Wege:

# text
seg-31999fe1b838 = <b>Private Meldung von Sicherheitslücken auf GitHub</b> – die Schaltfläche <em>Report a vulnerability</em> auf dem <a1>Security-Tab</a1> des Repositorys. Die Meldung ist nur für die Maintainer sichtbar, und ein Fix kann in einem privaten Fork vorbereitet und als GitHub Security Advisory veröffentlicht werden.

# text
seg-7bdcc2ffe39e = <b>E-Mail</b> – <b><a1>contact@ashforde.org</a1></b>, mit Details und Schritten zur Reproduktion.

# text
seg-fbc3db22c061 = Bitte eröffnen Sie für sicherheitsrelevante Meldungen kein öffentliches Issue. Wir streben an, innerhalb weniger Werktage den Eingang zu bestätigen.

# text
seg-4c11dabdd8f6 = Unterstützte Versionen

# text
seg-19c99cf3a67e = Vor 1.0: Nur der neueste getaggte Release wird unterstützt.

# text
seg-1379eab9a8e3 = Speichersicherheit

# text
# c1: #![forbid(unsafe_code)]
# c2: src/lib.rs
# c3: unsafe
# c4: cfg
# c5: --features python
# c6: --features wasm
seg-cf966fa35408 = Die Bibliothek (Crate) deklariert <c1/> an ihrer Crate-Wurzel (<c2/>), sodass ein <c3/>-Block, eine fn, ein impl oder ein extern irgendwo in der Bibliothek ein Kompilierfehler ist und nicht etwas, das ein Prüfer finden muss. Das Attribut steht nicht hinter einem <c4/>, es gilt also für jede Konfiguration, in der die Bibliothek ausgeliefert wird, und alle drei lassen sich damit fehlerfrei kompilieren: der Standard-Rust-Build, das Python-Erweiterungsmodul (<c5/>) und das WebAssembly-Modul (<c6/>).

# text
# c1: forbid
seg-3f9e707e7d0b = Geltungsbereich, genau angegeben, weil <c1/> je Crate gilt:

# text
# c1: src/main.rs
# c2: src/bin/
# c3: kshana-mcp
# c4: xval/
# c5: unsafe
seg-e7e22e711c53 = Es betrifft nur die Bibliothek. Die CLI-Binärdatei (<c1/>), die Hilfsprogramme unter <c2/>, das separat veröffentlichte Crate <c3/> und die vom Workspace ausgeschlossenen Kreuzvalidierungs-Crates <c4/> sind eigene Crate-Wurzeln und werden davon nicht erfasst. Keines davon enthält heute <c5/>, aber das ist Disziplin und keine vom Compiler durchgesetzte Eigenschaft.

# text
# c1: cargo deny check advisories licenses bans sources
seg-b8f1e374d873 = Es sagt nichts über Abhängigkeiten aus. Diese werden separat durch <c1/> in der CI geprüft – für das Wurzel-Crate und, als eigener Job, für das vom Workspace ausgeschlossene MCP-Server-Crate – und durch Dependabot-Warnungen und Sicherheitsupdates für das Repository überwacht.

# text
seg-df3008a05522 = Hinweis zu Exportkontrolle / doppeltem Verwendungszweck

# text
seg-0782e60d11fa = PNT-Resilienz und Quantensensorik können unter die Exportkontrolle für Güter mit doppeltem Verwendungszweck fallen. Dieses öffentliche Repository beschränkt sich auf generische, veröffentlichte Modelle und Methoden. Tragen Sie hier keine exportsensiblen Details zu Resilienz oder Anti-Spoofing bei; sie gehören in ein privates Overlay. Schreiben Sie im Zweifel zuerst eine E-Mail.

# text
seg-f6bb0582f6f2 = <s1>Zurück</s1>Lizenzierung

# text
seg-834cbd4e96d3 = <s1>Weiter</s1>Mitwirken
