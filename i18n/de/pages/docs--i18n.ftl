# docs--i18n: translations (de)

seg-c3c260b7063e = Tests

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-26b562e7f535 = Quelle: <c1/>

seg-60b2e78c882e = Lokalisierung der Engine

seg-7f3a6f2932c2 = Der menschenlesbare Text der Engine liegt in { "17" } Sprachen neben Englisch vor: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. Englisch ist die Quelle; <c1/> ist eine Pseudo-Locale, die jede Meldung mit Akzenten, Klammern und Füllzeichen versieht, sodass ein Test erkennen kann, ob Text in den Katalog verlagert wurde. Das Framework ist <a1>Project Fluent</a1> (<c2/>, <c3/>); der Code ist <c4/>.

seg-1ed9fde69630 = Was lokalisiert wird und was nie

seg-1cb6eb25338d = Lokalisiert (ein Mensch liest es)

seg-ab884f59f5f3 = Nie lokalisiert (ein Programm liest es)

seg-dbe9b8a0ed98 = Meldungen und Fehler der Befehlszeile

seg-711a8e63c1de = JSON-Schlüssel und -Werte von <c1/> und <c2/>

seg-a4066ef82152 = die Zusammenfassungszeile jedes Laufs

seg-6fbdf82a22dc = CSV-Kopfzeilen und -Zeilen

seg-8d08a6f5f16f = der Text von SVG-Diagrammen (Titel, Achsen, Legenden, Beschriftungen)

seg-8ad1234dfb18 = Dateinamen

seg-777c2587e0da = <c1/>: Überschriften, Tabellen, Hinweise, Beschriftungen

seg-d5cf8d8abe89 = Fehlercodes (<c1/>)

seg-7ba47f2644f5 = Urteilswörter (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = die Verifikationsmatrix, Einheitendefinitionen, Herkunftsangaben

seg-122495009a9c = die Beschreibungen der Szenarioarten (<c1/>)

seg-c7bc43c1e848 = Hinweise, Haftungsausschlüsse und Mitteilungen (<c1/>)

seg-dd0fc888e0dc = dieselben Texte innerhalb von JSON, die Englisch bleiben

seg-a236606f1ca1 = <c1/> der iq-Kampagne, die Vergleichsseite der Studie, die Bestenliste des Benchmarks, der Resilienzbericht

seg-4ec45651bd09 = <c1/> eines Nachweispakets und das PNG des Observatoriums: Beide werden in ein Manifest gehasht (das des Pakets ist zusätzlich signiert), daher werden sie unabhängig von der Sprache auf Englisch erstellt

seg-048b6c3a9f0c = Zahlen in Fließtext verwenden das Dezimalzeichen der Sprache (ein Komma in { "15" } der { "18" } Sprachen; einen Punkt in en, ja, zh-Hans und en-XA). Zahlen in maschinenlesbaren Dateien verwenden immer den Punkt. Eine Anzahl (eine Variable namens <c1/>, <c2/>, <c3/>, <c4/> oder <c5/>) erreicht Fluent als Zahl, sodass eine Übersetzung <c6/> schreiben darf.

seg-487d6d38fa39 = Die Sprache wählen

seg-79499bebb806 = Befehlszeile: <c1/>, dann <c2/>, <c3/>, <c4/>, <c5/>, dann Englisch. <c6/> ist pt-BR; nur <c7/> ist das Portugiesisch Portugals. <c8/> ist vereinfacht; Traditionell wird mit der Liste der unterstützten Tags abgelehnt.

seg-079f85726238 = Bibliothek: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> bei <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: ein optionales nachgestelltes <c1/> bei <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> bei <c2/> und <c3/>.

seg-e133ee809c98 = Fehler und ihre Codes

seg-fac73c5cbbc2 = Jede Fehlermeldung hat einen stabilen Code, die Meldungskennung in Großbuchstaben (<c1/> ist <c2/>), in jeder Sprache gleich. Der englische Text der Befehlszeile bleibt unverändert. In einer anderen Sprache lautet die Zeile <c3/>; mit <c4/> folgt in jeder Sprache eine zweite Zeile <c5/>. Die API liefert <c6/> und <c7/> (<c8/>); MCP-Fehler tragen <c9/> als Fehlerdaten. Prüfen Sie auf den Code, nie auf den Text.

seg-7d731dc5f888 = Wie ein Lauf in einer anderen Sprache abläuft (die Regel des doppelten Laufs)

seg-204df30d9ca2 = Eine maschinenlesbare Datei darf nicht von der Sprache abhängen. Ein Lauf in einer anderen Sprache führt das Szenario deshalb zweimal aus: einmal auf Englisch, dessen <c1/>, <c2/> und CSV die maschinenlesbaren Dateien sind, und einmal in der Sprache der Nutzerin oder des Nutzers, für die Zusammenfassung, das Diagramm und <c3/>. Englisch ist ein Lauf, Byte für Byte, wie er vorher war.

seg-b7447d4cd5a8 = Gemessen, nativ, Release-Build, Englisch dann <c1/> (Sekunden): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; jedes andere mitgelieferte Szenario liegt unter { "4" } s; die { "173" } Szenarien, die bei dieser Messung mitgeliefert waren, brauchten auf Englisch zusammen { "64" } s. Der Aufwand ist für eine andere Sprache genau doppelt. WebAssembly wurde nicht gemessen (hier gibt es kein wasm-bindgen); beim Browserfaktor von etwa { "4" } ist es für die langsamste Art eine Minute.

seg-cc148fdec7a2 = Eine Seite vermeidet das Warten, indem sie das englische Ergebnis sofort zeigt und danach <c1/> aufruft: Das ist allein der zweite Lauf, er liefert <c2/>, und das Studio kann „Wird übersetzt …“ anzeigen, bis es eintrifft.

seg-cd0360ad624d = <b>Punkt für { "0.41" }: ein Lauf.</b> Beide aus einer Aufzeichnung von <c1/> rendern. Es wurde beurteilt und nicht gebaut: Die Ergebnisse von <c2/> werden nach ihrer Erzeugung geprüft, gemessen und gehasht (Textbreiten in Diagrammen, Herkunfts-Hashes über Ausgabetext), und <c3/> formatiert an der Aufrufstelle, sodass eine Aufzeichnung Platzhalter-Token in maschinenlesbare Dateien schreiben und deren Bytes von der Wiedergabe abhängig machen würde. Es braucht Token liefernde <c4/>/<c5/>, einen Finalisierer an jedem Schreiber und einen Nachweis der Byte-Identität je Schreiber.

seg-67e04a43cea8 = Der Wasm-Build bettet nur den englischen Katalog ein. Die übrigen sechzehn würden je etwa { "150" } kB gzip hinzufügen. Eine Seite lädt bei einer Sprachwahl <c1/> und ruft <c2/> auf; schlägt das Laden oder die Registrierung fehl, bleibt die Seite auf Englisch. Nativ betten die Befehlszeile und das Python-Wheel alle { "18" } ein.

seg-9a2f85e7e43c = Größe, nicht optimierte <c1/> aus <c2/> (vor wasm-bindgen und wasm-opt), Basis bc04e98f gegenüber diesem Zweig: { "18.71" } MB -> { "19.88" } MB roh, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. Der englische Katalog hat { "521" } kB roh, davon { "153" } kB gzip; der Rest ist <c3/> und seine Abhängigkeiten. Das wird wie gemessen akzeptiert.

seg-3ce9aab4916e = Der Katalog

seg-fdea76581cd8 = <c1/> enthält die Meldungen, Kennungen mit dem Präfix <c2/>. <c3/> ist die Quelle; die anderen Dateien gehören den Übersetzern und können Meldungen vermissen lassen (jede fällt je Meldung auf Englisch zurück). Begleitlisten in <c4/>: <c5/> (Meldungen mit Zählvariablen, für Pluralformen), <c6/> (als Platzhalter übergebene Zahlen), <c7/> (Meldungen, die Teile eines zur Laufzeit zusammengesetzten Satzes sind: in ganze Sätze zusammenzuführen, nie anwachsen zu lassen).

seg-9432bca8a935 = <c1/> beweist Englisch: Jede Meldung hat eine aufgezeichnete ursprüngliche Vorlage und wird genau zu diesem Text gerendert; jede Kennung wird verwendet; die Variablen stimmen überein; die Pseudo-Locale rendert jede Meldung. <c2/>, <c3/>, <c4/> decken die Einstiegspunkte, die Beschreibungen der Arten und die Rechtstexte ab. <c5/> schlägt fehl, wenn ein neues Zeichenkettenliteral, das ein Mensch lesen würde, den Katalog umgeht: Erlaubnis je Datei in <c6/>, die sinken, aber nie steigen darf. <c7/> führt ganze Szenarien mit einer Basis-Binärdatei und der aktuellen aus und vergleicht jede Ausgabedatei.

seg-969a4b12b12c = Wie eine Zeichenkette in den Katalog verschoben wird: <c1/>.

seg-48c3c0ca063d = Abhängigkeiten und Lizenzen

seg-b6c2f08c9a46 = Das Framework fügt <c1/> { "0.16" } (Apache-2.0 OR MIT) und <c2/> { "0.9" } (MIT OR Apache-2.0) hinzu, mit ihren transitiven Crates: <c3/> und <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: Die verwendete Alternative ist Apache-2.0, die <c9/> erlaubt), <c10/> und <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Jede ist permissiv nach der Liste <c16/> in <c17/>; <c18/> erscheint in zwei Versionen ({ "1" } und { "2" }), was <c19/> nur meldet. Die Lizenzliste wurde aus <c20/> gelesen; <c21/> ist in der Autorenumgebung nicht installiert und läuft in der Integrations-CI.

seg-6aa2e78078ae = <s1>Zurück</s1>Glossar

seg-670504be0531 = <s1>Weiter</s1>Studio-Leitfaden
