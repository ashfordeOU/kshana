# docs--kinds-campaigns: translations (de)

# text
seg-b03d56f501c3 = Typ

# text
seg-a07990e776cb = Kampagne: bestehende Szenarioarten, zu einem Lauf zusammengesetzt, wobei jede Zahl aus einem echten Lauf der genannten Art gelesen wird. Vier Abschnitte, in beliebiger Kombination. PHASES: eine verkettete Mission auf einer gemeinsamen Zeitachse -- jede Phase führt ein oder mehrere Szenarien aus (zum Beispiel Jamming, dann Spoofing, dann eine Uhr im Holdover mit einem daneben auslaufenden Inertialnavigationssystem, dann ein Integritätsalarm, dann Erholung), ihre Ausgaben werden durch eine Voreinstellung je Art oder durch ausdrückliche Ergebnispfade in benannte Kanäle gelesen (Uhrenzeitfehler gegen seine Schutzgrenze, Träger-Rausch-Dichte-Verhältnis gegen die Tracking-Untergrenze, Schutzniveau gegen die Alarmgrenze, Positionsfehler, trackende Satelliten, Alarmflags) und durch Halteglied nullter Ordnung auf ein gemeinsames Raster umgetastet, mit Phasengrenzen und Ereignissen; der Zustand wird durch carry (ein Kanal setzt sich vom Endwert der vorigen Phase fort), handoff (eine Zahl der vorigen Phase, in das Szenario dieser Phase geschrieben) und end_at (eine Phase endet zu einer Zeit, die ein Lauf berechnet hat, etwa der Erkennungszeit eines Spoofing-Monitors) weitergereicht. SWEEP: ein Gitter über ein bis drei gepunktete Szenarioschlüssel einer beliebigen Art (ein ganzzahliges Segment indiziert ein Array von Tabellen, wie in system.2.sisre_m), mit Metriken, die über den Ergebnispfad gelesen werden, und, bei mehr als einem Lauf, einem Monte-Carlo-Ensemble mit Seed an jedem Knoten. MONTE_CARLO: Realisierung k läuft bei base_seed + k; jede Metrik meldet Mittelwert, Standardabweichung, Perzentile 5./50./95. nach dem Nearest-Rank-Verfahren und ein Bootstrap-Konfidenzintervall von { "95" } % mit festem Seed für den Mittelwert. COMPOSE: mehrere Szenarien unter gemeinsamen Werten (Leistung und Position eines Jammers, in einen maritimen und einen Straßenempfänger geschrieben), mit einer kombinierten Zusammenfassung von bestem und schlechtestem Fall. Das Ergebnis trägt einen Kampagnen-Hash, einen Digest über jedes Mitgliedsergebnis und einen Einheiteneintrag für jede ausgegebene Zahl; die Interoperabilitätsexporte schreiben jedes Mitgliedsszenario mit Geometrie als eigenen Dateisatz. Kompositionsidentitäten werden getestet: Eine Ein-Phasen-Kampagne reproduziert den eigenständigen Lauf bitgenau, ein Ensemble mit festem Seed ist byte-stabil, und bei einer Uhr mit weißem Frequenzrauschen fällt der Ensemblemittelwert in das gemeldete Intervall, wobei die Streuung zu sqrt(q_wf * tau) passt. MODELLED: der additive Übertrag und das Halteglied nullter Ordnung sind Modellierungsentscheidungen, und jede Phase trägt die Bezeichnung der Art, die sie ausgeführt hat.

# attr:alt
seg-b2c7cd1f9712 = Das Diagramm, das die Engine für scenarios/campaign-sweep-jammer-power.toml schreibt, Art campaign

# text
# c1: docs/kinds/campaigns.md
seg-ea93f81fa08b = Quelle: <c1/>

# text
seg-7f8e8af56bc0 = Kampagnen (Szenario-Kind-Familie)

# text
seg-c8012ee549ea = { "1" } Szenario-Kind der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
# c1: kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-09ed7c4e175c = Themenseiten: <a1>CAMPAIGNS</a1>. Einen ausführen: <c1/>. Alle Familien: <a2>KINDS.md</a2>.

# attr:alt
seg-b49ec180e810 = Kontaktbogen der Diagramme, die die Engine für die Kinds der Familie Kampagnen schreibt

# text
seg-4e31c8daf798 = Register

# text
seg-b2016159c9d0 = Kampagne: bestehende Szenario-Kinds, zu einem Lauf zusammengesetzt, wobei jede Zahl aus einem realen Lauf des benannten Kinds gelesen wird.

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-25148644a262 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-e0334a6899b6 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>campaign</a1>.

# text
seg-906f63ffbc30 = <s1>Zurück</s1>Verhaltenskodex

# text
seg-cdf23ced49bd = <s1>Weiter</s1>Uhren, Zeitgebung und Holdover
