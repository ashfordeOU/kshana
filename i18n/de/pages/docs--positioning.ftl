# docs--positioning: translations (de)

# attr:aria-label, text
seg-6555ff9a6d8e = Ausgabe

# text
seg-0be9b5747c00 = Kshana

# text
seg-94058315dfe4 = Eingabe

# text
# c1: docs/POSITIONING.md
seg-09721fbcf7fc = Quelle: <c1/>

# text
seg-5b362d7b0903 = Kshana ist eine offene, reproduzierbare <b>Evidenz-Engine für die Resilienz von PNT (Positionierung, Navigation und Zeitgebung)</b>. Sie beschreiben ein Szenario — die Sensoren oder Uhren, einen GNSS-Ausfall (global navigation satellite system), einen Jamming- oder Spoofing-Angriff, ein Budget — und sie sagt Ihnen, wie gut Zeit und Position standhalten, bewertet anhand betrieblicher Gütemaße (FoMs). Jede Fähigkeit hinter diesen Kennzahlen ist in einer maschinell geprüften Matrix als <b>VALIDATED</b> (gegen eine unabhängige externe Referenz geprüft), <b>MODELLED</b> (in sich konsistent, nicht extern geprüft) oder <b>PARTNER</b> (im Besitz eines Hardware-Partners) gekennzeichnet. Diese Seite sagt, wo sie führend ist, wofür sie da ist und was sie nicht ist.

# text
seg-48d576a345e3 = Wo sie führend ist: Zeitgebung und Holdover für kritische Infrastruktur

# text
seg-f41d8a48ff13 = Der am besten validierte Teil der Engine ist die Zeitgebung. Telekommunikationsnetze, Stromnetze und Finanzplätze beziehen ihre Zeit aus GNSS, und jedes muss <b>Holdover</b> dimensionieren: wie lange eine lokale Uhr durch einen GNSS-Verlust frei laufen kann, bevor ihr Zeitfehler das Budget sprengt.

# text
# c1: allantools
# c2: VERIFICATION-MATRIX.md
seg-70d00c5fe203 = <b>Was VALIDATED ist.</b> Die Schätzer der Frequenzstabilität, aus denen eine Holdover-Antwort aufgebaut ist — Allan-Abweichung (ADEV), modifizierte Allan-Abweichung (MDEV), Zeitabweichung (TDEV), maximaler Zeitintervallfehler (MTIE) und der Schätzer Theo1 mit erweitertem Bereich — sind gegen Stable32-Referenzabweichungen, die unabhängige Bibliothek <c1/> und eine real gemessene Caesium-Uhr geprüft. Die Berechnung der Auslaufvarianz im Holdover und ihre Umkehrung zu einer Holdover-Zeit sind gegen SciPy geprüft. Siehe <a1><c2/></a1> für jede Zeile, ihren Test und ihre unabhängige Referenz.

# text
seg-9fbedc930565 = <b>Was MODELLED bleibt.</b> Die Rauschuntergrenzen je Uhrenklasse (zum Beispiel die Langzeit-Untergrenze einer gegebenen Oszillatorklasse) bestimmen die Antwort für eine stabile Uhr, und sie sind repräsentative Werte, keine Messungen Ihres Geräts. Liefern Sie gemessene Untergrenzen für eine Zahl, die Sie vertreten wollen.

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-700df4898ede = <b>Telecom-Einheiten.</b> Die Szenarioart <c1/> berichtet MTIE und TDEV, prüft sie gegen die Masken des Telecommunication Standardization Sector der International Telecommunication Union (ITU-T) — G.8272 für eine primäre Referenzzeituhr (PRTC), G.8272.1 für eine erweiterte PRTC (ePRTC), G.8273.2 für eine Telecom-Boundary-Clock (T-BC) und G.8271.1 für die Netzgrenzen am Referenzpunkt C — und berichtet, wie lange ein Holdover innerhalb jedes Zeitfehlerbudgets bleibt. Siehe <a1><c2/></a1>.

# text
seg-50421d8247ab = Was sie unterscheidet

# text
seg-7ec913b140ed = Die Physik und die Standards sind nicht der Unterschied: Propagation mit Simplified General Perturbations { "4" } (SGP4), Allan-Abweichung, Bezugssysteme und Dilution of Precision gibt es in anderen Bibliotheken frei und korrekt, und Kshana prüft sich gegen mehrere davon. Der Unterschied ist die Evidenz-Disziplin:

# text
seg-f7d466d5215b = <b>Offen.</b> Die Engine steht unter der GNU Affero General Public License (AGPL), sodass jeder sie lesen und erneut ausführen kann. Für geschlossene Integration gibt es eine kommerzielle Lizenz.

# text
# c1: scenario + seed + engine version
seg-76ff24c1939b = <b>Reproduzierbar.</b> Ein Ergebnis ist durch <c1/> Bit für Bit bestimmt, und ein Lauf lässt sich als Link zum Browser-Playground teilen.

# text
# c1: PROVENANCE.md
seg-6df34e089b53 = <b>Mit Herkunftsangabe.</b> Jeder Sensorparameter ist auf eine veröffentlichte Quelle zurückgeführt (<a1><c1/></a1>), und jede Fähigkeit trägt ihre Stufe VALIDATED / MODELLED / PARTNER. Eine Absicherung in der Continuous Integration (CI) weist eine Zeile VALIDATED ohne unabhängige externe Referenz zurück, sodass eine interne Selbstprüfung nicht als Validierung ausgegeben werden kann.

# text
seg-8bccfe110f4c = Wir haben kein anderes offenes Werkzeug gefunden, das diese Dinge über Holdover, Integrität, Inertial-Auslauf und Quantensensoren hinweg verbindet, aber eine Suche, die nichts findet, ist kein Beweis, dass nichts existiert; wir behaupten nicht, die einzigen zu sein.

# text
seg-e942b2474960 = Quanten: eine neutrale Trade-Methode, Ergebnisse als MODELLED gekennzeichnet

# text
# c1: quantum-trade
# c2: QUANTUM.md
# c3: QUANTUM-MODELS.md
seg-655769464447 = Kshana vergleicht Quanten- und klassische Uhren und Inertialsensoren im selben Szenario mit demselben Code: Jedes Gerät ist ein Fehlermodell, und die Engine weiß nicht, welches davon „Quanten“ ist. Betrachten Sie es als <b>eine neutrale Trade-Methode Quanten gegen klassisch, deren Ergebnisse als MODELLED gekennzeichnet sind</b>. Die meisten Eingaben sind veröffentlichte Koeffizienten für Allan/Rauschbudget; der Beschleunigungsmesser mit Kaltatom-Interferometer hat eine Schicht aus ersten Prinzipien, die seinen Rauschkoeffizienten herleitet. Gemessene Daten der Allan-Abweichung eines Partners können über die Art <c1/> eingespeist werden, was der Weg ist, die Kennzahlen eines bestimmten Geräts heraufzustufen. Siehe <a1><c2/></a1> und <a2><c3/></a2>.

# text
seg-eb5d247b42aa = Mond, cislunarer Raum und Deep Space: gepflegt, nicht das Aushängeschild

# text
seg-4b9bd68b7fb1 = Die Suite für Mond / cislunaren Raum (Integritätsüberwachung am Mond, der Drei-Körper-Kern Erde–Mond, Mond-Zeitskalen, Analyse des Service-Volume) und die radiometrische Navigations-Engine für Deep Space sind gepflegte Fähigkeiten. Die meisten ihrer Zeilen sind MODELLED, und für die Mondnavigation gibt es bereits spezialisierte Werkzeuge; sie werden daher als Fähigkeiten derselben Engine mit jeweils eigener Stufe angeboten und nicht als Aushängeschild.

# text
seg-26f242f1bef8 = Der Rest der Engine

# text
seg-b9b2e29e51d9 = Dieselbe Engine mit denselben Stufen deckt außerdem ab:

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-89d1923b3ed9 = <b>PNT in niedriger Erdumlaufbahn (LEO), Ende zu Ende.</b> Signalentwurf (<c1/>), Überflug und Link-Budget je Band (<c2/>), Broadcast-Navigationsnachricht (<c3/>), fusionierte Positionierung in mittlerer und niedriger Erdumlaufbahn (<c4/>), Konvergenz der präzisen Punktbestimmung (PPP) mit LEO-Augmentation (<c5/>), Positionierung aus einem nichtterrestrischen 5G-Netz (<c6/>) und <c7/>, das die Ausgabe jeder Stufe für ein System an die nächste übergibt.

# text
# c1: spectrum
seg-2e5b57ccd454 = <b>Spektrum.</b> Ein Wasserfalldiagramm der spektralen Leistungsdichte im L-Band (und im Ultrahochfrequenz-(UHF-), S- und C-Band) unter einer skriptgesteuerten Störsender-Zeitleiste, mit Störer-zu-Signal-Verhältnis je Band und effektiver Träger-zu-Rauschleistungsdichte (<c1/>) sowie Ein- und Ausgabe von Aufzeichnungen im Signal Metadata Format (SigMF).

# text
# c1: solar-system
# c2: body-pnt
# c3: constellation-design
seg-0e7fd993a838 = <b>Das Sonnensystem und jeder Zentralkörper.</b> Positionen und physikalische Konstanten der Planeten und großen Monde (<c1/>), Positionierung um jeden dieser Körper (<c2/>) sowie der Entwurf von Walker- und Konstellationen mit veröffentlichten Slots, mit Abdeckungs- und Dilution-of-Precision-Karten um jeden von ihnen (<c3/>).

# text
# c1: campaign
seg-9d993a356eb0 = <b>Kampagnen.</b> Bestehende Arten, verkettet auf einer gemeinsamen Zeitleiste, durchgesweept, als Monte-Carlo-Ensembles mit Seed ausgeführt oder nebeneinander unter gemeinsamen Bedingungen ausgeführt (<c1/>).

# text
# c1: --animate
# c2: --export
# c3: spectrum
seg-905a9aa8c47c = <b>Ausgaben.</b> Jeder Lauf schreibt ein Ergebnisdokument, ein Diagramm und einen Bericht in HTML (HyperText Markup Language) und JSON (JavaScript Object Notation); <c1/> schreibt eine Animation als SVG (Scalable Vector Graphics), HTML oder Bildfolge; <c2/> schreibt CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON oder STK-Ephemeriden (Systems Tool Kit) für die Arten, die Dinge auf der Erde platzieren, und SigMF für <c3/>.

# text
seg-75206591a52a = Die meisten dieser Zeilen sind MODELLED; die Verifikationsmatrix nennt die wenigen, die VALIDATED sind (zum Beispiel die Empfehlungen der International Telecommunication Union zu Regen und Szintillation, der Algorithmus der Galileo-Broadcast-Ephemeride, die Rahmenprüfung CRC-24Q (zyklische Redundanzprüfung mit 24 Bit) und der Löser für die planetare Lichtlaufzeit).

# text
seg-785218a0ea66 = Was Kshana nicht ist

# text
# c1: iq
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
seg-fae54ec38477 = <b>Kein Hochfrequenz-(HF-)Signalsimulator und kein Hardware-in-the-Loop-(HIL-)Aufbau.</b> Kshana steuert keine Funkhardware an und sendet nichts. Der größte Teil arbeitet auf der Ebene von Fehlermodellen und Link-Budgets, bevor Hardware oder Laborzeit gekauft wird. Auf Signalebene ist es reine Software: Die GNSS-IQ-Schicht (<c1/>) schreibt Basisband-IQ-Sample-Dateien (In-Phase/Quadratur) legitimer GNSS-Signale für Software-Empfänger und führt darauf ihren eigenen Software-Empfänger aus; der Abschnitt <c3/> der Art <c2/> (seit { "0.29.0" }) schreibt einen SigMF-Snapshot (Signal Metadata Format) seines analytischen Modells, der die konfigurierten Störsender enthält (rauschartige Störsender Bin für Bin, Töne und Chirps als Wellenformen); und <c4/> summiert ein authentisches und ein Spoofer-Replikasignal im Speicher, um die Schleifenerfassung zu testen, ohne es auszugeben. Einen Hardware-Empfänger gegen reale HF-Stimuli zu testen, ist Aufgabe eines HF-Simulators.

# text
seg-ca243f3f8e8d = <b>Kein Ersatz für MATLAB/Simulink, STK oder Orekit.</b> Es steht neben ihnen. Es liest und schreibt die Austauschformate, die sie verwenden — CCSDS-Orbit-Ephemeris-Messages (Consultative Committee for Space Data Systems), präzise SP3-Bahnen (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format) —, schreibt CZML, KML, GeoJSON und STK-Ephemeriden für deren Viewer, und sein numerisches Kräftemodell wird gegen Orekit gegengeprüft, statt an dessen Stelle angeboten zu werden.

# text
seg-8fa4e93c3d0e = <b>Keine GNSS-Verarbeitungs-Engine mit Trägerphase und kein Positionierungsdienst</b> (siehe unten).

# text
seg-8ba4b67bc813 = <b>Keine Zertifizierungsstelle.</b> Ein Label VALIDATED bedeutet, dass eine Fähigkeit mit einer externen unabhängigen Referenz übereinstimmt; es ist keine Zertifizierung irgendeines Produkts oder Betreibers.

# text
seg-362b857140b9 = Was Kshana neben einer GNSS-Verarbeitungs-Engine ist und was nicht

# text
# c1: leo-ppp
# c2: pvt
seg-f50951b2e9c8 = Kshana ist <b>keine</b> <em>verarbeitende</em> GNSS-Engine mit Trägerphase, und keine Szenarioart ist ein Positionierungsdienst. Es hat aber einen Fuß im Messungsbereich, als Bibliothekscode, auf den sich die Leistungsstudie stützt und der gegen unabhängige Referenzen geprüft ist. Echtzeit-kinematische (RTK) Positionierung über kurze Basislinien mit ganzzahliger Festlegung nach LAMBDA (least-squares ambiguity decorrelation adjustment) läuft auf realen Zweifrequenz-RINEX-Beobachtungen, ebenso ein statischer Float-Filter für die präzise Punktbestimmung (PPP) mit endgültigen IGS-Bahnen und -Uhren, und die Empfängeruhr, die dieser Filter schätzt, ist eine Zeitlösung gegenüber der endgültigen IGS-Stationsuhr. Jede der drei ist eine Zeile VALIDATED der <a1>Verifikationsmatrix</a1>, gegen die dort genannten IGS-Stationsdaten, und jede läuft auf statischen, kurzen Beobachtungsfenstern, nicht als Streaming-Dienst mit Mehrdeutigkeitsfestlegung über lange Basislinien, Trägerglättung oder einem kinematischen Rover. Die Art <c1/> führt einen Float-PPP-Filter auf Code und Trägerphase aus, aber auf Messungen, die sie selbst simuliert, um die Konvergenzzeit mit und ohne LEO-Augmentation zu untersuchen; sie verarbeitet keine Beobachtungsdatei. Die Art <c2/> (Position, Geschwindigkeit und Zeit) löst eine Empfängerposition aus realen RINEX-Code-Pseudoranges plus Broadcast-Ephemeride, validiert gegen eine vermessene Koordinate des International GNSS Service (IGS) (Station ABMF, 2018-05-13) auf <b>{ "5.7" } m 3D-RMS (Effektivwert) / { "1.1" } m horizontal</b>. Das Produkt ist aber die Leistungsstudie, nicht der Positionierungsdienst, und die Einordnung unten soll einem möglichen Nutzer die Enttäuschung über das falsche Werkzeug ersparen.

# text
seg-169dd778c45f = Eine GNSS-Verarbeitungs-Engine (RTKLIB, eine quelloffene Bibliothek für Echtzeit-kinematische Positionierung; gLAB, die GNSS-Laborwerkzeugsammlung der Gruppe gAGE an der Technischen Universität Katalonien)

# text
# c1: pvt
seg-4faa1de0ef70 = ein Szenario: Sensor-Fehlermodelle, Ausfallfenster, Geometrie — oder, für <c1/>, eine reale RINEX-Beobachtungsdatei plus Broadcast-Navigation

# text
seg-ae60d0def8af = reale GNSS-Beobachtungen (RINEX), Ephemeriden, Korrekturen

# text
# c1: pvt
seg-5fce99bb803d = Leistungs-Gütemaße: Holdover, Zeitgebungs-/Positionsfehler, Verfügbarkeit, Integritäts-/Sicherheitsschranken — plus eine Positionslösung per Code-Einzelpunktbestimmung (SPP) aus der Art <c1/>

# text
seg-b752bb5c3f64 = eine <b>Lösung</b> für Position/Geschwindigkeit/Zeit (SPP, PPP, RTK)

# text
seg-dd8a47d4f618 = Frage, die es beantwortet

# text
seg-b52fd8e0c856 = „Wie gut <em>wäre</em> diese Architektur, und wo versagt sie?“

# text
seg-09672ca004ac = „Wo bin ich <em>jetzt</em>, ausgehend von diesen Messungen?“

# text
seg-00d5ebd56088 = Quanten- / optische Sensoren

# text
seg-a55f2bd6c1bf = als Fehlermodelle modelliert (optische Uhren, Kaltatom-Inertialmesseinheit (IMU), optische Zeitübertragung), Ergebnisse als MODELLED gekennzeichnet

# text
seg-7ccfb3395d84 = nicht modelliert

# text
seg-ec21dbf4b910 = Verarbeitung realer Beobachtungen

# text
# c1: pvt
seg-324ef9a933d5 = Code-SPP aus realen RINEX-Beobachtungen (<c1/>, Meterbereich); RTK über kurze Basislinien mit LAMBDA und statisches Float-PPP auf realer Trägerphase, als Bibliothekscode gegen IGS-Stationen geprüft (VALIDATED, statisch und kurze Fenster, kein Streaming-Dienst); plus Geometrie / Dilution of Precision (DOP) / Verfügbarkeit

# text
seg-e15db8a33a9a = die Kernkompetenz, bis hin zu PPP/RTK mit Trägerphase

# text
seg-e6df7ccdba96 = null — läuft in einem Browser-Tab (WebAssembly)

# text
seg-812c1c70ce63 = nativer Build / Toolchain

# text
seg-58df67617e1a = Ergänzend, nicht konkurrierend — RTKLIB und gLAB

# text
# c1: pvt
# c2: pvt
seg-29aeb97bd509 = <a1>RTKLIB</a1> und <a2>gLAB</a2> sind ausgereifte, weit verbreitete GNSS-Verarbeitungssuiten. Sie nehmen reale Messungen und erzeugen eine Positionslösung (SPP/PPP/RTK; gLAB ist außerdem ein hervorragendes Lehrwerkzeug mit starker Tradition bei der Europäischen Weltraumorganisation (ESA) und dem European Geostationary Navigation Overlay Service (EGNOS)). Kshana ersetzt sie <b>nicht</b> und versucht es auch nicht. Sein Beobachtungspfad ist schmal: Code-Einzelpunktbestimmung (<c1/>) und, als geprüfter Bibliothekscode, RTK über kurze Basislinien mit ganzzahliger Festlegung nach LAMBDA und ein statischer Float-PPP-Filter auf realen Zweifrequenz-Beobachtungen, jeweils VALIDATED gegen IGS-Stationsdaten (der PPP-Filter auch gegen einen RTKLIB-Lauf mit denselben Eingaben). Es hat keine Trägerglättung, keine kinematische oder Streaming-Verarbeitung und keine Mehrdeutigkeitsfestlegung über lange Basislinien, und <c2/> schätzt weder Troposphäre noch Ionosphäre — es wendet die Troposphärenmodelle nach Saastamoinen/Niell und die ionosphärenfreie L1/L2-Kombination an, löst aber nicht als Zustände danach auf.

# text
seg-9c4e70ce8a55 = Die Pipeline ist ergänzend:

# text
seg-01f43da4858c = <b>RTKLIB / gLAB</b> beantworten <em>„Wo bin ich, ausgehend von diesen Signalen?“</em>

# text
seg-f5370894cdd1 = <b>Kshana</b> beantwortet <em>„Wie lange behalte ich eine gute Antwort, wenn diese Signale aussetzen — und was bringt mir eine bessere Uhr oder ein besserer Inertialsensor, klassisch oder Quanten?“</em>

# text
seg-2403d6b115de = Ein natürlicher Arbeitsablauf nutzt eine Verarbeitungs-Engine für das Segment mit verfügbarem GNSS und Kshana, um das <b>Holdover</b>-Verhalten und den Sensor-Trade-Raum darum herum zu untersuchen. Wenn Sie einen Positionierungsdienst mit Trägerphase brauchen — kinematisches PPP oder RTK, lange Basislinien, Netz-Mehrdeutigkeitsfestlegung —, verwenden Sie RTKLIB oder gLAB; wenn Sie reproduzierbare, gekennzeichnete Evidenz über Resilienz und Holdover brauchen, ist das die Aufgabe, für die Kshana gebaut ist.

# text
seg-21631e5c6be3 = Eine Browser-Stufe ohne Installation

# text
seg-9b01dd6721ed = Die meisten Simulationswerkzeuge in diesem Feld (RTKLIB, gLAB, das General Mission Analysis Tool (GMAT), Orekit, STK) erfordern eine native Installation oder eine Lizenz und eine Einarbeitung vor dem ersten Ergebnis. Kshana wird nach WebAssembly kompiliert und läuft <b>vollständig im Browser</b> — der <a1>Playground</a1> lädt ein durchgerechnetes Szenario, führt die echte Engine auf der Clientseite aus (nichts wird hochgeladen) und zeigt das Ergebnis in Sekunden. Geführte Schieberegler und Ein-Klick-Szenarien bedeuten, dass das erste brauchbare Ergebnis weder TOML (Tom's Obvious Minimal Language, das Dateiformat der Szenarien) noch eine Toolchain braucht.

# text
seg-b1cb4b8f0ef1 = Diese Stufe ohne Installation ist eine bewusste Positionierung:

# text
seg-33b361bde50d = <b>Reichweite</b> — ein Prüfer, Student oder Einkäufer kann die tatsächliche Engine über einen Link auf jedem Gerät ohne Einrichtung ausprobieren.

# text
# c1: scenario + seed + engine version
seg-a4a4ebf89cee = <b>Reproduzierbarkeit</b> — dieselbe Engine, die im Browser ausgeliefert wird, ist die Bibliothek, die auf crates.io, dem Python Package Index (PyPI) und npm ausgeliefert wird; ein Ergebnis ist aus <c1/> reproduzierbar, und ein Lauf lässt sich als URL (Webadresse) teilen.

# text
seg-3d3d4bda606c = <b>Ehrlichkeit</b> — die Engine selbst offen auszuführen ist das stärkste Gegenargument zu „vertraue den Zahlen“: Die Browser-Stufe <em>ist</em> die Prüfoberfläche.

# text
seg-6095bcacb725 = Die Browser-Stufe macht Kshana nicht zum Ersatz für eine Desktop-Verarbeitungssuite — sie macht die Frage nach Trade-Studien zur Leistung für Menschen zugänglich, die nie eine installieren würden.

# text
# c1: CAPABILITY.md
# c2: pvt
seg-938ca8eab04c = <a1><c1/></a1> — die Umfangskarte Zeile für Zeile (der volle Umfang und die Residuen des Lösers <c2/> stehen in der Zeile <b>GNSS- / PNT-Verarbeitung</b>).

# text
# c1: VALIDATION.md
seg-9e94b1740386 = <a1><c1/></a1> — was validiert ist, mit Evidenz.

# text
# c1: TELECOM-TIMING.md
seg-3a02f39bd90a = <a1><c1/></a1> — die Art für Telecom-Zeitgebung und ihre Masken.

# text
# c1: GLOSSARY.md
seg-c5aa08e4ca55 = <a1><c1/></a1> — Definitionen der hier verwendeten Begriffe in einfacher Sprache.

# text
# c1: web/README.md
seg-85aaaa34ea7c = <a1><c1/></a1> — der Browser-Playground.

# text
seg-54e2deeffc7d = <s1>Zurück</s1>Architektur

# text
seg-b2f93c49d5c6 = <s1>Weiter</s1>Changelog
