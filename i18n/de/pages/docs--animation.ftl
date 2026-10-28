# docs--animation: translations (de)

# text
# c1: docs/ANIMATION.md
seg-8428c41646b0 = Quelle: <c1/>

# text
# c1: --animate
seg-a61d094894fd = <c1/> macht aus der Zeitreihe eines Laufs etwas, das sich bewegt: eine animierte Scalable-Vector-Graphics-Datei (SVG), einen einzelnen eigenständigen HyperText-Markup-Language-Player (HTML) oder eine nummerierte Folge von SVG-Einzelbildern für einen Videokodierer. Eine Kampagne läuft als ihre Phasen (jamming, spoofing, holdover, Integritätsalarm) mit markierten Alarmen; ein Spektrumlauf spielt seinen Wasserfall Zeile für Zeile ab; ein Überflug in niedriger Erdumlaufbahn (LEO) spielt seine Verbindung je Band ab und, mit einem Spoofer, die Monitorstatistiken Epoche für Epoche.

# text
# c1: src/animation.rs
# c2: tests/animation.rs
seg-39d69331035d = Code: <c1/>. Tests: <c2/>.

# text
seg-0b708f65d8d3 = Was es ist und was nicht

# text
seg-ad8c12a3b510 = Der Exporter liest das Ergebnisdokument, das der Lauf bereits geschrieben hat. Er führt die Physik nicht erneut aus, er tastet nicht neu ab, glättet nicht und interpoliert nicht zwischen Abtastwerten (abgesehen von dem einen geraden Streckenabschnitt, der eine Kurve am Cursor beendet), und er fügt keine eigene Zahl hinzu. Eine Animation ist daher genau so gut wie der Lauf dahinter. Ihre Stufe ist <b>MODELLED, interne Konsistenz</b>: Sie ist eine Darstellung, nie ein Nachweis, und trägt keine eigene Zeile der Verifikationsmatrix.

# text
seg-f37311ad7ef0 = Ausgaben

# text
# c1: result.json
# c2: chart.svg
# c3: report.html
seg-0c21f772932e = Jedes Format wird neben das Szenario geschrieben, neben die üblichen <c1/>, <c2/> und <c3/>:

# text
seg-f2ce7fc60cdf = Format

# text
seg-51a8df15f356 = Geschrieben als

# text
seg-3ea93ae372ca = Was es enthält

# text
seg-3603593b9799 = Eine SVG, animiert mit Cascading-Style-Sheets-Keyframes (CSS) und ohne Skript: Die Kurven werden hinter einem laufenden Zeitcursor gezeichnet, Ereignisse erscheinen zu ihrem Zeitpunkt, Wasserfallzeilen werden in Zeitreihenfolge aufgedeckt. Sie läuft in Schleife, mit { "1.5" } s Haltezeit auf dem fertigen Bild.

# text
seg-6c91078b434e = Eine Datei mit Inline-Skript und -Stil und ohne externe Ressource: Wiedergabe und Pause, ein Scrubber, Geschwindigkeit (0.25x bis 4x), jedes Feld an einem synchronen Cursor, ein Live-Wert je Kurve, der Phasenstreifen und eine Ereignisliste, die per Klick springt. Die Leertaste startet oder pausiert, die Pfeiltasten schreiten, Home und End springen.

# text
# c1: frame_0000.svg
# c2: frame_0001.svg
# c3: manifest.json
seg-df02d37cd729 = <c1/>, <c2/>, … und <c3/>.

# text
# c1: --animate
# c2: --animate svg,html
# c3: all
# c4: --animate-fps
# c5: --animate-duration
seg-2e5ebd60cad0 = <c1/> ist wiederholbar und nimmt eine kommagetrennte Liste (<c2/>) oder <c3/> entgegen. <c4/> ({ "1" } bis { "60" }, Standard { "12" }) und <c5/> ({ "0.5" } s bis { "600" } s, Standard { "8" } s) legen die Wiedergabe fest; die Einzelbildfolge ist auf { "7,200" } Einzelbilder begrenzt.

# text
# c1: --export
# c2: report.html
# c3: --animate
seg-7e012ab53f45 = Wenn <c1/> im selben Befehl läuft, listet der HTML-Player die daneben geschriebenen Exportdateien (CZML, KML, GeoJSON, STK, SigMF) als relative Links zu diesen Nachbardateien auf; ein Link wird nur für einen reinen Dateinamen geschrieben, sodass keiner den Ordner verlassen oder das Netz erreichen kann. Der erweiterte Bericht (<c2/>) bettet die animierte Zeichnung ein, sobald das Ergebnis eine Zeitreihe hat, gleich ob <c3/> lief oder nicht.

# text
# c1: --animate
# c2: result.json
# c3: animation
# c4: sources
# c5: omitted
# c6: --animate
seg-9c1d2204edab = Wenn <c1/> läuft, erhält <c2/> einen <c3/>-Block: die Formate, Bilder pro Sekunde (fps), Dauer, Einzelbildzahl, die Zeitspanne, die Feldtitel, die JSON-Pfade, aus denen jede Kurve gelesen wurde (<c4/>), und jede gefundene, aber nicht gezeichnete Reihe (<c5/>). Ohne <c6/> ist das Ergebnis byteidentisch mit einem einfachen Lauf.

# text
seg-fa8388ae976e = Die Einzelbildfolge

# text
# c1: round(duration × fps)
# c2: t_start + (t_end − t_start) × i / (n − 1)
# c3: manifest.json
# c4: fps
# c5: duration_s
# c6: frame_count
# c7: frame_pattern
# c8: frame_%04d.svg
# c9: t_start
# c10: t_end
# c11: frame_times
# c12: frame_NNNN.svg
seg-db4b53abe7d6 = Die Folge hat genau <c1/> Einzelbilder. Einzelbild <em>i</em> zeigt die Zeitleiste bis <c2/>, sodass das erste Einzelbild der Anfang und das letzte das fertige Bild ist. <c3/> hält <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), die Pixelgröße, <c9/>, <c10/>, die Missionszeit jedes Einzelbilds (<c11/>), die Phasen, die Ereignisse und die Quellen fest. Ein erneuter Export in dasselbe Verzeichnis entfernt zuerst jedes dort bereits vorhandene <c12/> (und sonst nichts), sodass eine kürzere Folge nie Einzelbilder einer längeren zurücklässt, die der Kodierer lesen könnte.

# text
# c1: ffmpeg
# c2: librsvg
# c3: fps
seg-13b57b6d3c14 = Die Einzelbilder sind SVG, nicht Portable Network Graphics (PNG). Ein mit der Bibliothek <c2/> gebautes <c1/> liest sie direkt, mit der Rate, mit der die Folge geschrieben wurde ({ "24" } im Beispiel oben; das <c3/> des Manifests):

# text
# c1: ffmpeg
# c2: librsvg
# c3: rsvg-convert
seg-b20beeb45fac = Ein <c1/> ohne <c2/> bricht mit „no decoder found for: svg“ ab. Rastern Sie die Einzelbilder zuerst, zum Beispiel mit <c3/>, und kodieren Sie die PNGs:

# text
seg-fc61f546f605 = Barrierefreiheit und Farbschema

# text
# c1: prefers-color-scheme
seg-7015f7ed77dc = <b>Farbschema.</b> Der Player folgt <c1/> und zeichnet neu, wenn es sich ändert; die animierte SVG trägt unter derselben Media Query eine helle Variante ihrer Palette. Die Einzelbilder verwenden die dunkle Palette der statischen Diagramme, weil ein Video kein Schema hat.

# text
# c1: prefers-reduced-motion: reduce
seg-c3b1f19f191b = <b>Reduzierte Bewegung.</b> Unter <c1/> schaltet die animierte SVG jede Animation ab und zeigt das fertige Bild (ihre Basisstile sind der Endzustand, sodass nichts verborgen ist), und der Player öffnet pausiert auf dem fertigen Bild, statt zu spielen; der Benutzer kann weiterhin scrubben oder Play drücken.

# text
# c1: <title>
# c2: <desc>
seg-f8dd26194eec = Die SVG hat ein <c1/> und ein <c2/>; die Bedienelemente des Players sind beschriftete Schaltflächen, ein Bereichseingabefeld mit gesprochenem Zeitwert und eine Auswahl.

# text
seg-f5356cbf3675 = Was als Zeitreihe zählt

# text
seg-ba43cf36ac20 = Die Ergebnisdokumente unterscheiden sich von Art zu Art, sodass der Exporter die Formen erkennt, die die Engine ausgibt, statt einer Liste von Arten:

# text
# c1: t
# c2: t_s
# c3: t_hours
# c4: t_min
# c5: t_days
# c6: k
# c7: epochs
# c8: quantum.series[].error_ns
# c9: classical.series[].error_ns
seg-952d09156712 = <b>Ein Array von Datensätzen mit einem Zeitfeld</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> oder <c6/> in einem <c7/>-Array), das entlang des Arrays streng ansteigt. Jedes andere numerische Feld wird zu einer Kurve; dasselbe Feld unter zwei Wurzeln (<c8/> und <c9/>) teilt sich ein Feld.

# text
# c1: t_s
# c2: t
# c3: times_s
# c4: channels
# c5: {unit, values}
# c6: campaign
# c7: spectrum
# c8: *_hz
# c9: spectrum
seg-2c3abce3f70a = <b>Ein Objekt mit einem streng ansteigenden Zeit-Array</b> (<c1/>, <c2/>, <c3/>, …) neben Arrays gleicher Länge: benachbarte numerische Arrays, eine <c4/>-Map aus <c5/>-Datensätzen (die <c6/>-Zeitleiste), ein Array von Datensätzen, die solche Arrays enthalten (die <c7/>-Bänder, die Satellitenspuren einer Konstellation), und ein zweidimensionales Array, dessen Zeilen zur Zeitachse passen, mit einer benachbarten <c8/>-Frequenzachse (der <c9/>-Wasserfall).

# text
# c1: phases
# c2: name
# c3: t0_s
# c4: t1_s
# c5: events
# c6: t_s
# c7: label
# c8: alarm
# c9: *_t_s
seg-0edf8c38f9eb = Neben diesem Zeit-Array werden <c1/> (<c2/>, <c3/>, <c4/>) zum Phasenstreifen und <c5/> (<c6/>, <c7/>, <c8/>) zu den Markierungen. Auch die <c9/>-Skalare eines Bandes (sein erster Verlust der Signalverfolgung, sein niedrigstes Verhältnis von Trägerleistung zu Rauschdichte) werden markiert.

# text
# c1: omitted
seg-608c4fed9e98 = Kurven mit einer Einheit teilen sich ein Feld, wenn ihre Größenordnungen innerhalb eines Faktors von { "100" } liegen, sodass ein Schutzintervall von { "50" } ns einen Fehler von { "2" } ns nicht einebnet. Es werden höchstens { "6" } Felder mit je { "6" } Kurven gezeichnet; der Rest wird unter <c1/> aufgeführt. Kurven mit mehr als { "2,400" } Abtastwerten werden mit einer gleichmäßigen Schrittweite ausgedünnt, die den letzten Abtastwert erhält, und ein Wasserfall mit mehr als { "96" } × { "120" } Zellen wird herunter gemittelt (in Leistung, bei Dezibelzellen, sodass ein schmalbandiger Störer nicht verdünnt wird).

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: leo-ppp
# c4: leo-pvt
# c5: trace = true
# c6: leo-navmsg
# c7: leo-signal
# c8: ntn-positioning
seg-c386389e4f1d = Unter den LEO-Arten lässt sich jedes mitgelieferte <c1/>-, <c2/>- und <c3/>-Szenario animieren. <c4/> lässt sich in seinen Modi Doppler, gemeinsame Positionierung und Zeitgebung animieren (ein Zeitgebungslauf braucht <c5/>, wodurch jede Zeile ihren Zeitfehler und ihr vorhergesagtes Sigma in jeder Epoche meldet) und wird in seinem Polarabdeckungsmodus abgelehnt. <c6/> lässt sich in seinem Update mitten im Überflug animieren und wird für die Analysen zu Kodierung, Anpassungsintervall und Modellvergleich abgelehnt. Ergebnisse von <c7/> und <c8/> tragen keine Zeitachse und werden abgelehnt.

# text
seg-eb31ec7a07b7 = Determinismus

# text
seg-82bcf8a5b042 = Die Ausgabe ist eine reine Funktion des Ergebnisdokuments und der Optionen: keine Uhr, keine Zufallszahl, keine Hash-Map-Iteration, kein Datei- oder Netzzugriff in der Bibliothek und nirgends ein Zeitstempel, sodass dasselbe Szenario mit demselben Seed und denselben Optionen byteidentische Dateien ergibt. Das Modul wird unverändert für WebAssembly gebaut; nur die Befehlszeilenschnittstelle schreibt Dateien.

# text
seg-77e1f459f3d3 = Nutzung als Bibliothek

# text
# c1: kshana::animation::animate_result
# c2: extract_timeline
seg-b3fa41e48ea5 = <c1/> animiert ein Ergebnisdokument, das Sie bereits haben, und <c2/> gibt zurück, was gezeichnet würde, ohne es darzustellen.

# text
seg-0857a94a948e = Grenzen

# text
# c1: animate_scenario
seg-02f0f03af2fb = Das Python-Wheel und das WebAssembly-Modul stellen den Exporter noch nicht bereit; er ist von der Befehlszeile, von der Rust-Bibliothek und vom Werkzeug <c1/> des Model-Context-Protocol-Servers (MCP) erreichbar (das höchstens { "120" } Einzelbilder in einer Antwort zurückgibt).

# text
seg-cd3ec7b403ba = Die Achsen sind linear. Eine Reihe, die viele Dekaden überspannt (das Fehlerwachstum einer Uhr von { "0.1" } ns auf eine Mikrosekunde), erscheint flach bis spät im Lauf.

# text
seg-ed21d370a73c = Die animierte SVG beruht auf CSS-Animation eines Clip-Rechtecks; aktuelle Chromium-, Firefox- und Safari-Engines spielen sie ab, während ein Betrachter ohne CSS-Animation das fertige Bild zeigt.

# text
seg-9dfb9596ecf3 = Sweep-, Monte-Carlo- und Compose-Kampagnen tragen keine Zeitachse und werden abgelehnt; die zusammenfassenden Statistiken eines Sweeps oder Ensembles sind keine Zeitreihe. Eine verkettete Kampagne lässt sich animieren.

# text
seg-be1f1afe7424 = <s1>Zurück</s1>Laufberichte

# text
seg-6817433f69f6 = <s1>Weiter</s1>Interoperabilitäts-Exporte und -Importe

seg-5366f477e688 = Eine Art, deren Ergebnis keine dieser Formen enthält (ein Linkbudget, eine Geometrie für eine einzelne Epoche, eine reine Monte-Carlo-Statistikzusammenfassung oder der Telekom-holdover, dessen Ergebnis den Hash der Aufzeichnung veröffentlicht, nicht die Aufzeichnung selbst), wird mit <c1/> abgelehnt, und es wird nichts geschrieben. Mit kshana { $version } lassen sich { "94" } der { "192" } ausführbaren Szenariodateien (jede Datei außer einer Studiensuite) animieren, und { "98" } werden abgelehnt. <c2/> gibt die Zählung aus.
