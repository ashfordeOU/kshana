# docs--kind-telecom-timing: translations (de)

# text
seg-f42465f7d066 = ns

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: eine Parser-Schicht, die eine RINEX-Uhrendatei (AS/AR-Einträge einer benannten Uhr, Versionen { "2" } und { "3.00" } bis { "3.04" }), ein ASCII-Phasen- oder Frequenzprotokoll im TimeLab-Stil oder ein TAPR-TICC-Zeitstempel- oder Intervallprotokoll in eine einheitliche Pha Tests: <a1>clock_log_allantools.rs</a1>.

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-8aee75a55007 = ocxo

# text
seg-98151954f217 = false

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Übertragene Grenzwerte von ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC eingerastet und ePRTC-A-Holdover (einschließlich der Zeitfehler-Hüllkurve nach Tabelle { "3" }. Orakel (InternalConsistency): Übertragung der benannten Empfehlungen (frei herunterladbar von itu.int), wobei jeder Grenzwert seine Tabelle oder Klausel trägt, aufgelistet zusammen mit jedem unbestätigten oder nicht implementierten Punkt in docs/TELECOM-TIMING.md; die Stetigkeitsidentitäten an den Knickpunkten, die die Tabellen implizieren, werden in den Tests geprüft. Eine Normübertragung mit Prüfungen auf interne Konsistenz, kein Konformitätstest und keine externe Validierung. { "0.30" } round { "2" } (pre-register

# text
seg-5547f1f662d3 = und { "2" } weitere in der Matrix.

# text
# c1: docs/kinds/by-kind/telecom-timing.md
seg-9b72d3b3a0ab = Quelle: <c1/>

# text
seg-a448b24ded2b = Telekom-Zeitgebung: Zeitfehler, maximaler Zeitintervallfehler (MTIE) und Zeitabweichung (TDEV) eines GNSS-Holdovers, geprüft gegen ITU-T-Masken mit PASS oder FAIL und einer Marge pro Maske. Eingabe ist entweder ein SYNTHETISCHES HOLDOVER (ein Oszillator-Preset -- ocxo, rubidium, caesium oder csac, jeweils mit den Stabilitäts-, Alterungs- und Temperaturwerten eines benannten öffentlichen Microchip-Datenblatts -- plus GNSS-Verlustzeit, Aufzeichnungslänge und Abtastintervall; die freilaufende Uhr trägt weißes, Flicker- und, wo die Datenblattanpassung es braucht, Random-Walk-Frequenzrauschen, lineare Alterung und einen sinusförmigen Temperaturterm) oder eine EINGELESENE REIHE aus Paaren [time_s, time_error_ns], inline angegeben (und, nur bei nativen Builds, eine CSV-Datei). Masken: ITU-T G.8272 (07/2025) PRTC-A und PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabellen 1-2, TDEV Tabellen 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC gelockt ({ "30" } ns, Tabellen 1-2) und ePRTC-A-Holdover (die Zeitfehler-Hüllkurve aus Tabelle { "3" }, die über die durch die gelockte Dauer festgelegte Holdover-Periode H von { "30" } ns auf { "100" } ns ansteigt, MTIE Tabelle { "4" }, TDEV Tabelle { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-Klassen A-C (max|TE|, konstanter Zeitfehler, tiefpassgefilterter MTIE und TDEV) und Klasse D (max|TE_L| { "5" } ns, die einzige Zahl der Klasse D, die nicht für weitere Studien offengelassen ist); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Referenzpunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns mit MTIE Tabellen 7-1 bis 7-3). Jeder Eintrag, den eine Empfehlung für weitere Studien markiert, fehlt, statt ergänzt zu werden, und jeder Bericht listet auf, was nicht implementiert ist. Gibt außerdem die Zeit bis zur Überschreitung jedes Budgets für den maximalen Zeitfehler aus (Standardwerte: { "100" } ns ePRTC max|TE_HO|, { "400" } ns Netz-Holdover-Zuteilung, { "1100" } ns Punkt C, { "1.5" } us Klasse { "4" }), die MTIE/TDEV-Kurven als CSV-Tabelle mit jeder Maskengrenze und pro numerischem Feld einen Eintrag zu Einheiten und Herkunft. VALIDATED: die MTIE- und TDEV-Schätzer gegen das Paket allantools an einer eingecheckten Holdover-Reihe. MODELLED: die Maskentabellen sind Abschriften, und ein synthetisches Holdover ist ein aus Datenblatt-Maximalwerten gebautes Modell, keine Messung irgendeiner Einheit. Kein Konformitätstest.

# text
# c1: scenarios/telecom-synce-eec.toml
seg-07f81cfd606a = Ein Lauf von <c1/> fasst sich zusammen als: telecom-timing: max|TE| { "488.2" } ns über { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-17f291bfc65d = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/telecom-synce-eec.toml
seg-d192feecd4b3 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-e7cab30ef039 = [] (keine Elemente)

# text
seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

# text
seg-01b1287f233b = Ergebnisbezeichnung (die der Engine): MODELLED — Zeitfehler, MTIE und TDEV, geprüft gegen abgeschriebene ITU-T-Masken. Die Schätzer sind gegen allantools validiert; die Maskentabellen sind Abschriften der genannten Empfehlungen; ein synthetisches Holdover ist ein aus öffentlichen Datenblattwerten gebautes Modell, keine Messung irgendeiner Einheit. Kein Ko

# text
seg-75aa6f7234ae = <b>MODELLED</b> Abgeschriebene Grenzwerte von ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Tests: <a1>telecom_timing_reference.rs</a1>.

# text
seg-d4bd840708db = <b>MODELLED</b> Vier Presets — OCXO (Microchip OX-208), Rubidium (Microchip 8040C), Caesium (Microchip 5071A Hochleistungsröhre) und CSAC (Microchip SA.45s) — jedes mit. Unabhängige Referenz (InternalConsistency): Die vier genannten Microchip-Datenblätter (Dokumentnummern und URLs in jedem Preset und in docs/TELECOM-TIMING.md) für die Eingabewerte; die Alterungsrampe in geschlossener Form und die Hüllkurveneigenschaft der Anpassung als interne Prüfungen. Wie aus den Werten ein Rauschmodell wird — die Anpassung, die Untergrenzenregel, der 30-Tage-Monat, die lineare Temperaturlesart — ist eine Modellierungsentscheidung; kein Preset ist die Messung einer Einheit. { "0.30" } Runde { "2" }, einseitige Zielwerte gegen

# text
# c1: not_implemented[0]
seg-cbb39b4105ac = jede Anforderung, die die Empfehlungen als 'für weitere Studien' markieren (Klasse D jenseits von max|TE_L|, ePRTC-B-Holdover, T-BC/T-TSC-Holdover bei Verlust beider Eingänge, TDEV-Netzgrenzen, ePRTC-A-Holdover-MTIE und -TDEV jenseits von { "10 000" } s) (Ergebnis <c1/>)

# text
# c1: not_implemented[1]
seg-a70f575aeb21 = hochpassgefilterter dynamischer Zeitfehler (dTE_H, G.8273.2 Tabelle 7-7 und G.8271.1 Klauseln 7.3.2-7.3.3) (Ergebnis <c1/>)

# text
# c1: not_implemented[2]
seg-66446247fc49 = der MTIE bei veränderlicher Temperatur aus G.8273.2 Tabelle 7-6 und der physical-layer-gestützte Holdover-MTIE aus G.8273.2 Tabelle 7-10 (Ergebnis <c1/>)

# text
# c1: not_implemented[3]
seg-c1d601b45182 = relativer Zeitfehler (cTE_R, dTE_R,L) zwischen zwei Ausgängen (Ergebnis <c1/>)

# text
# c1: not_implemented[4]
seg-6146f857c2df = der Paketfilter mit gleitendem Mittelwert, den G.8272 und G.8272.1 für PTP-Schnittstellen angeben: die Reihe wird als ein Zeitintervallfehler pro Sekunde mit einem Puls behandelt (Ergebnis <c1/>)

# text
# c1: label
seg-d5e956023b48 = MODELLED — Zeitfehler, MTIE und TDEV, geprüft gegen abgeschriebene ITU-T-Masken. Die Schätzer sind gegen allantools validiert; die Maskentabellen sind Abschriften der genannten Empfehlungen; ein synthetisches Holdover ist ein aus öffentlichen Datenblattwerten gebautes Modell, keine Messung irgendeiner Einheit. Kein Konformitätstest. (Ergebnis <c1/>)

# text
seg-a0ddb65b00af = Die Uhr: das OCXO-Preset (Microchip-OX-208-Datenblatt, Rev 12-1-2021), freilaufend ab dem ersten Sample, mit weißem, Flicker- und (wo die Anpassung es braucht) Random-Walk-Frequenzrauschen, angepasst an die Maximalwerte der Allan-Abweichung des Datenblatts, und seiner linearen Alterung. Die Temperatur wird konstant gehalten (Amplitude { "0" } K), wie die Masken es annehmen. (Kommentar der Szenariodatei, Zeilen { "12" } bis { "15" })

# text
seg-101dbde1c65b = Themenseite: <a1>CLOCK-LOG-FORMATS.md</a1>

# text
seg-c32dc02f981d = <s1>Zurück</s1>sweep

# text
seg-8aef86c9aa68 = <s1>Weiter</s1>terrain-nav

# text
seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Szenarioart nennen.

# text
# c1: telecom-timing
seg-c21ebd79f497 = <b>VALIDATED</b> Der maximale Zeitintervallfehler und die Zeitabweichung, die die Szenarioart <c1/> ausgibt, an einer Holdover-Aufzeichnung im Telekom-Maßstab: ein O(n)-MTIE mit monotoner Warteschlange und gleitendem Fenster (telecom_timing::mtie_sliding, nötig, damit ein Tag an Ein-Sekunden-Samp Tests: <a1>telecom_timing_reference.rs</a1>.

# text
# c1: telecom-timing
seg-d0ab0ca72b80 = <b>MODELLED</b> Sieben MTIE- und TDEV-Wander-Erzeugungsmasken bei konstanter Temperatur für die Szenarioart <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) Typen I, II und III, G.8262 (10/2024) EEC Optionen { "1" } und { "2" } und G.8262.1 (11/2025) eEEC (gelockt

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> Das maximale Zeitintervallfehler- und Zeitabweichungsmaß, das die Szenarioart <c1/> auf einem Holdover-Protokoll im Telekom-Maßstab meldet: ein O(n) monotones Warteschlangen-Schiebefenster. Orakel (ExternalDataset): allantools { "2024.06" } — eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters — mtie() und tdev() auf tests/fixtures/telecom_timing/holdover_te_series.csv, wobei die Reihe auf beiden Seiten aus demselben Text mit 17 signifikanten Stellen geparst wird; die Referenz zeichnet das SHA-256 der Reihe auf und ist offline über tests/fixtures/telecom_timing/generate_telecom_timing_reference.py neu erzeugbar. Validiert die SCHÄTZER auf diesem Protokoll, nicht die syn

# attr:alt
seg-ec7745a09d08 = Das Diagramm, das die Engine für scenarios/telecom-synce-eec.toml schreibt, Art telecom-timing

# text
# c1: kshana kinds --json
seg-f163ae37b8c7 = MODELLED: die Maskentabellen sind Abschriften, und ein synthetisches Holdover ist ein aus Datenblatt-Maximalwerten gebautes Modell, keine Messung irgendeiner Einheit. (Szenarioarten-Katalog (<c1/>))

# text
# c1: telecom-timing
seg-f4dc88ffe6b5 = <c1/> (Szenarioart)
