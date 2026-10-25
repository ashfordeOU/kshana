# docs--validation: translations (de)

# text
seg-70860389903a = Uhr

# text
seg-583dc9ff6178 = Bibliothek

# attr:aria-label, text
seg-d01db1c2710a = Referenz

# text
seg-619f89bf160c = Realisierung des lunaren Bezugssystems

# text
seg-2db69c58f694 = Lunares differenzielles PNT

# text
seg-2eb6d1b0483d = RAIM / ARAIM

# text
seg-da3532b1444d = SBAS / DO-229E

# text
seg-d3af26f389f5 = IONEX / Klobuchar

# text
seg-d6476863f862 = Fähigkeit

# text
seg-ad856ad710eb = Status

# text
seg-4bcec6e2dd9f = Navigationsdienstvolumen am Mond

# text
seg-c04a3591074c = Interoperabilitätsexport für den Mond

# text
seg-20fee61b3107 = Bibliothek von Fehlermodellen für Quantengeräte

# text
seg-eaf341ff4522 = GNSS-freie Quantennavigation

# text
seg-04f69a0edb2f = Typ

# text
seg-b03d56f501c3 = Typ

# text
seg-d12d4565b01d = Geodätische VLBI zum Mond, Kernelpfad

# text
seg-5ed34a5b402e = Gemeinsame Multitechnik-Bahnbestimmung + Uhr am Mond

# text
seg-75636f9419b2 = Bekannte Einschränkungen

# text
seg-9c0eb89a2fbe = Paket

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-638b8d451550 = Sensor

# text
seg-35bf9a48e566 = Größe

# text
seg-f3526b0d95f8 = Gemessen

# text
seg-7634c6f4b32c = Verbindung

# text
seg-b966dd26caa6 = Datensatz

# text
seg-4fe4920a3fa1 = Standard

# text
# c1: docs/VALIDATION.md
seg-84430d202cd4 = Quelle: <c1/>

# text
seg-028f26d1374e = <b>Zu den Toleranzen.</b> „Validiert“ bedeutet unten, dass ein Kalibriertest feststellt, dass die simulierte Statistik mit der Referenzbeziehung innerhalb eines <b>durchgesetzten Gates</b> übereinstimmt, derzeit <b>{ "20" }–{ "25" } % relativer Fehler</b> (über Seeds gemittelt) für die Beziehungen von Allan und Rauschbudget. Die beobachtete mediane Übereinstimmung ist oft deutlich enger (einige Prozent), aber die <em>garantierte</em> Schranke ist das Gate, nicht der Median. Wo eine Zahl wie „~{ "2" } %“ steht, ist sie eine typische Beobachtung, nicht die durchgesetzte Toleranz. Siehe <a1>Behauptung gegen Wirklichkeit</a1>.

# text
seg-94a480ed9ccb = Die Beförderungsregel

# text
# c1: src/verification.rs
seg-a550784412a6 = Eine Zeile der maschinengeprüften Verifikationsmatrix (<c1/>) ist nur dann VALIDATED, wenn eine <b>von Kshana unabhängige</b> Referenz mit der Implementierung <b>innerhalb einer Toleranz übereinstimmt, die vor dem Vergleich festgelegt wurde</b>, in einem Test, der im Gate läuft. Dieser Abschnitt ist die einzige Stelle, an der die Regel niedergeschrieben ist; die Matrix, die Prosa je Zeile und die Release Notes verweisen darauf.

# text
seg-5e14faed9f05 = Die akzeptierten Arten unabhängiger Referenzen

# text
seg-4297b6a1b385 = Was zählt

# text
seg-a42c0c36b37f = Beispiele, die bereits in der Matrix stehen

# text
seg-e39aeb132e03 = Reale Messdaten der Größe, die die Zeile behauptet: eine Beobachtung der physischen Welt, keine Modellausgabe.

# text
seg-e77977db9de1 = Die zurückgehaltenen zwei Drittel einer realen Caesium-Uhr-Aufzeichnung; archivierte Normalpunkte der Mond-Laserentfernungsmessung; die Reihe UTC(k) des Circular T des BIPM (Internationales Büro für Maß und Gewicht); die SRTM-Geländekachel (Shuttle Radar Topography Mission).

# text
seg-6325fe1fafaf = Eine unabhängige Bibliothek oder ein unabhängiges Werkzeug eines Dritten, das eine <b>eindeutig definierte</b> Größe mit denselben Eingaben berechnet, wobei die Bibliothek die Fachberechnung selbst implementiert. Der Vergleich von Bibliothek gegen Bibliothek ist nur deshalb eine echte Prüfung, weil die Größe eine einzige richtige Antwort hat.

# text
seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, die statistischen Verteilungen von SciPy.

# text
seg-056adffae706 = Veröffentlichte Referenzvektoren, Tabellen oder Verifikationsbeispiele: Zahlen, die ein Standard, eine Behörde oder ein Referenztext abdruckt, damit sich Implementierungen daran prüfen lassen.

# text
seg-991fb822e99c = Vektoren von SOFA/ERFA (Standards of Fundamental Astronomy), die SGP4-Verifikationsvektoren der AIAA (American Institute of Aeronautics and Astronautics), die Validierungsbeispiele der ITU-R (International Telecommunication Union, Radiocommunication Sector), das ausgearbeitete ARAIM-Beispiel der Working Group C, JPL (Jet Propulsion Laboratory) Horizons.

# text
seg-2a774e48055a = Zwei weitere Standards entscheiden die Grenzfälle. Beide sind für Release { "0.30" } übernommen.

# text
seg-f5c6cf536ba1 = <b>P1, ein veröffentlichter ausgearbeiteter Wert.</b> Ein veröffentlichter ausgearbeiteter Wert, berechnet aus derselben geschlossenen Form, die die Zeile implementiert, zählt als veröffentlichter Referenzvektor, wenn die Veröffentlichung unabhängig von Kshana ist und der Vergleich eine angegebene Toleranz festschreibt. Der Wert muss in der Veröffentlichung als Zahl abgedruckt sein (ein aus einem Diagramm abgelesener Wert zählt nur, wenn die Ableseunsicherheit innerhalb der angegebenen Toleranz liegt), und der Test muss Kshana den Wert aus den Eingaben der Veröffentlichung berechnen lassen; der Vergleich einer Konstante mit dem Dokument, aus dem sie kopiert wurde, ist eine Transkriptionsprüfung, nicht P1.

# text
seg-0b043b552e76 = <b>P2, eine unabhängige numerische Bibliothek.</b> Eine unabhängige numerische Bibliothek wie numpy oder LAPACK (das Linear Algebra PACKage), die eine eindeutig definierte Größe der linearen Algebra mit angegebenen Eingaben neu berechnet, zählt als unabhängige Bibliothek. Die Bibliothek muss den Schritt der Zerlegung, Inversion, Lösung oder der kleinsten Quadrate mit ihrem eigenen Algorithmus an Eingaben ausführen, die mit dem Fixture eingecheckt sind; die validierte Behauptung ist dann die lineare Algebra an diesen Eingaben, nicht die physikalischen Größen eines repräsentativen Szenarios. Ein Skript, das eine skalare geschlossene Form mit numpy-Arithmetik neu auswertet, ist eine zweite Implementierung unseres eigenen Codes, nicht P2.

# text
seg-b7911d589f7a = Bedingungen, die für jede Art gelten: Die unabhängige Referenz wird nicht von diesem Projekt geschrieben, ausgeführt oder veröffentlicht (die eigene Papierreihe dieses Repositorys ist daher nicht unabhängig davon); die Toleranz steht im Test und wurde vor dem ersten Vergleich festgelegt; ein datengesteuerter Test, der übersprungen wird, wenn seine öffentlichen Daten fehlen, sagt dies beim Überspringen.

# text
seg-7e6057a2cad7 = Was nicht zählt

# text
# c1: ReferenceImpl
seg-80cfbb204767 = <b>Unsere eigene zweite Implementierung</b>: ein zweiter Codepfad in dieser Crate (<c1/>) oder ein Skript in diesem Repository, das dieselbe geschlossene Form neu auswertet.

# text
seg-d6efaf8399f9 = <b>Übereinstimmung mit unserer eigenen früheren Ausgabe</b>: Goldens, Regressionsfixierungen, Snapshots oder eine Tabelle aus den eigenen Papieren dieses Projekts.

# text
seg-4d0365b383e5 = <b>Eine Abschrift der Konstanten einer Quellenangabe</b>: ein Koeffizient, eine Voreinstellung, eine Datenblattangabe oder ein Parameterblatt, geprüft gegen das Dokument, aus dem es kopiert wurde.

# text
seg-3bf8025077fb = <b>Eine Entwurfsentscheidung</b>: eine Zuteilung, Gewichtung, Schwelle, Alarmgrenze oder ein repräsentatives Szenario. Für eine Entscheidung gibt es keine externe Wahrheit.

# text
seg-4f0aafd7166e = <b>Eine interne Identität</b>: ein numerisches Integral gegen seine eigene analytische Form, ein Rundlauf, eine Inversion, ein Eigenschafts- oder Monotonietest.

# text
# c1: IntegrationRun
# c2: IntegrationRun
# c3: integration_run_only_on_modelled_rows
# c4: src/verification.rs
# c5: validated_rows_require_an_external_oracle
# c6: ExternalDataset
seg-4f4408e4ebab = <b>Ein Integrationslauf gegen einen realen Host</b> (<c1/>): ein Plugin in einen realen Signal-K-Server oder OpenCPN laden oder die Ausgabe eines realen Gates an einen TCP-Verbraucher einspeisen und prüfen, dass der Host die Eingabe akzeptiert und den erwarteten Zustand zeigt. Er zeigt, dass die Verkabelung funktioniert. Der Host ist keine unabhängige Referenz für irgendeinen Wert, den die Integration trägt, es gibt also nichts Externes zum Vergleichen, und eine solche Zeile (die Zeile der maritimen Integrationen) ist MODELLED, nicht VALIDATED. <c2/> ist eine eigene Art unabhängiger Referenz, nur auf MODELLED-Zeilen erlaubt: <c3/> in <c4/> scheitert, wenn eine VALIDATED-Zeile sie trägt, und <c5/> verlangt bereits, dass jede VALIDATED-Zeile <c6/> ist.

# text
seg-a39a87c56a16 = <b>Plausibilität an realen Eingaben</b>: reale Daten, die nur als Eingabe dienen, mit Zusicherungen zur Größenordnung statt einem Vergleich mit einem externen Wert.

# text
seg-db6f5d98b4ef = Eine Toleranz, die nach Kenntnis des Vergleichs gewählt wurde.

# text
seg-f4f18b7549df = Wie die Regel durchgesetzt wird

# text
# c1: validated_oracle_basis()
# c2: src/verification.rs
# c3: tests/verification_rows_declare_an_oracle_basis.rs
# c4: #[test]
seg-19a62c7e0aee = Jede VALIDATED-Zeile deklariert in <c1/> in <c2/>, auf welcher Art sie beruht (Measured, Library, Reference, P1 oder P2), die unabhängige Quelle (zitiert aus dem eigenen Referenztext der Zeile) und den einen Test, der den Vergleich trägt. Die Unit-Tests neben der Tabelle scheitern, wenn eine VALIDATED-Zeile nicht deklariert oder doppelt deklariert ist, wenn eine Deklaration eine Zeile nennt, die nicht VALIDATED ist, wenn die deklarierte Quelle nicht die ist, die der Referenztext der Zeile nennt, oder Kshana selbst ist, wenn der deklarierte Test nicht einer ist, den die Zeile zitiert, oder wenn eine P2-Zeile keine unabhängige numerische Bibliothek nennt. <c3/> verlangt dann, dass der deklarierte Test als echtes <c4/> auf der Platte existiert und nicht ignoriert wird. Was die Maschine nicht prüfen kann, ist, ob der genannte Test gegen die deklarierte Quelle vergleicht; das bleibt eine menschliche Lektüre. Zahlen je Art sind hier nicht angegeben: Die Tabelle ist die Quelle.

# text
seg-e8ae3e380f40 = Bestehende VALIDATED-Zeilen, nach der Regel neu geprüft

# text
seg-1dd44545a67a = Die Regel wurde auf die bestehenden Zeilen ebenso angewendet wie auf künftige Beförderungen.

# text
seg-38db7b6e7053 = <b>P1-Zeilen, die die Validierungsstudie { "0.30" } nennt, jeweils gestützt:</b> Einweg-Link-Budget (die Design-Control-Tabelle des JPL Pub 82-76 für Galileo im X-Band, aus ihren Einzelposten bis auf { "4.6e-3" } dB Freiraumdämpfung neu zusammengesetzt); bandbegrenzte geschlossene Formen für jedes Entfernungsmesssignal ({ "90.3" } Prozent der Hauptkeulenleistung und der veröffentlichte kohärente Early-Late-Jitter); maximale Doppler-Verschiebung eines Navigationssatelliten in niedriger Erdumlaufbahn (die veröffentlichten Angaben zu Xona Pulsar X1 und Iridium); maximale Doppler-Verschiebung, die ein ruhender Nutzer von einer LEO- oder MEO-Bahn sieht (Tabelle { "1" } des Pulsar-Papiers, { "20" } Werte); Doppler-Verschiebung, die ein Bodenempfänger von einem LEO-Navigationssatelliten bewältigen muss (dieselben veröffentlichten Angaben aus einer geflogenen Bahn). Jede Veröffentlichung ist unabhängig von Kshana, druckt ihre Zahlen ab, und der Test gibt seine Toleranz an.

# text
seg-8e38103d05d6 = <b>Weitere Zeilen, die auf P1 beruhen, bei der Neuprüfung gefunden, jeweils gestützt:</b> Abwägung beim Entfernungsmesscode-Entwurf (die veröffentlichte Gold-Kreuzkorrelation von −{ "23.9" } dB); Mond-Koordinatenzeit (Ashby und Patla { "2024" }, deren Gegenprüfung der Mondgeschwindigkeit gegen DE440 eine Library-Prüfung ist); geschlossene Formen der spektralen Leistungsdichten von L-Band-Signalen (Q-Werte von Kaplan und Hegarty); ionosphärische Verzögerung erster Ordnung je Band (das Gruppenlaufzeitverhältnis aus IS-GPS-200); global gemittelte Gewichte des Signal-in-Space-Entfernungsfehlers (die Tabelle von Montenbruck, Steigenberger und Hauschild { "2018" }).

# text
# c1: eigh
# c2: inv
seg-0014c53752ac = <b>P2-Zeilen, die die Studie nennt, jeweils gestützt:</b> Fisher-Information und Cramér–Rao-Beobachtbarkeit (numpy <c1/>/<c2/>); Identifizierbarkeit des Mond-Datums; gekoppelte Eichung von Mond-Bezugssystem und Zeitskala; autonome Pipeline für die Fehlerbeobachtbarkeit freier Netze (numpy/SciPy-SVD, Singulärwertzerlegung). Jede berechnet eine eindeutig definierte Größe der linearen Algebra an eingecheckten Eingaben mit einem anderen Algorithmus als dem Jacobi-Eigenlöser von Kshana neu.

# text
# c1: expm
seg-e9d01633d002 = <b>Weitere Zeilen, die auf P2 beruhen, bei der Neuprüfung gefunden, jeweils gestützt:</b> Herleitung von Prioritäten für MCDA (Multikriterielle Entscheidungsanalyse) (der Eigenvektor der AHP, analytic hierarchy process, durch SciPy/LAPACK; die Tabelle des Random Index, die sie ebenfalls reproduziert, ist eine Abschrift und wird nicht gezählt); Coast-Varianz beim Uhren-Holdover (SciPy-<c1/> der erweiterten Matrix nach Van Loan); Realisierung des Mond-Bezugssystems (eine Umeyama-Lösung mit numpy-SVD); CRPA-Beamforming (controlled reception pattern antenna) (komplexe Lösung mit LAPACK); ARAIM-Schutzniveau-Kernel für den Mond (die LU-Inverse von RTKLIB mit SciPy-Quantilen); Konsistenz von Mond-Bezugssystem und -Dynamik über Anbieter hinweg (eine Kleinste-Quadrate-Anpassung mit numpy-SVD an drei veröffentlichte Ephemeriden).

# text
# c1: validated_oracle_basis()
seg-1fd94e94e89d = <b>In der ersten Runde markiert, in Runde { "2" } des Laufs { "0.30" } neu gestützt.</b> Drei Zeilen wurden als von der geschriebenen Regel nicht gestützt markiert. Jede beruht nun auf einem Vergleich, der vorab registriert wurde, bevor sein Fixture abgerufen wurde, sodass keine Zeile markiert ist; ein Unit-Test neben <c1/> schreibt die (nun leere) Liste fest.

# text
# c1: raim_fde
# c2: raim::araim_raim
# c3: raim::araim_dual_raim
seg-3ef9479dea55 = <b>Integrität (RAIM/ARAIM/SBAS).</b> Die zitierten Tests prüften früher nur die Plausibilität an realer Geometrie des IGS (International GNSS Service). Die Zeile beruht nun auf drei Bibliotheksreferenzen: die ARAIM-Solution-Separation mit mehreren Hypothesen aus dem Airborne Design Document v4.2 gegen Stanford MAAST für ARAIM { "2" } ({ "270" } reale Fälle, größte VPL-Differenz { "2.2e-3" } m gegen { "0.05" } m); Snapshot-RAIM-Erkennung und -Ausschluss gegen RTKLIB <c1/> ({ "2016" } von { "2016" } Entscheidungen identisch) mit dem Steigungs-Schutzniveau; und die SBAS-DO-229E-L1-Schutzniveaus gegen Stanford MAAST an realen WAAS-Aussendungen ({ "2868" } Paare innerhalb von { "1.6e-5" } m). Die Zeile sagt klar, dass die Funktionen mit einheitlichem Sigma <c2/> und <c3/> nicht ADD-konform sind und dass der Vergleich für SBAS mit Zweifrequenz-L5 ein Befund ist.

# text
seg-16a4261c77ec = <b>Planetenpositionen im Sonnensystem aus den Standish-Keplerelementen des JPL.</b> Der nachträglich gesetzte Zielwert des Doppelten des nominellen Fehlers wird durch einen vorab registrierten Zielwert ersetzt: RMS höchstens die Angabe aus Tabelle { "8.10.1" } des Explanatory Supplement je Planet und Komponente, gegen JPL Horizons DE441, wobei die Erdaufteilung und die ICRF-Rotation abgedeckt sind.

# text
seg-8d5b51a942e0 = <b>Lichtlaufzeit zwischen Körpern des Sonnensystems.</b> Der Lichtlaufzeit-Löser wird nun mit den Lichtlaufzeiten von Horizons innerhalb von { "1e-6" } s an Positionen aus DE441 verglichen, ein vorab registrierter Zielwert, der den Positionszielwert nicht erbt.

# text
seg-e96900bc322f = <b>MODELLED-Zeilen, die die beiden Richtlinien beförderbar machen</b> (nur durch den zeilenweisen Lauf { "0.30" }, nie durch diesen Text): unter P1 die Schranke der Emitter-Geolokalisierung mit TDOA/FDOA (Zeit- und Frequenzdifferenz der Ankunft), die Kopplung von relativistischer Uhrenrate und Bezugssystem, die Synchronisationsmasken der ITU-T (Telecommunication Standardization Sector) (nur für Maskenwerte, die die Empfehlungen als Zahlen abdrucken; die übertragenen Knickpunkte, gegen sich selbst geprüft, zählen nicht) und die Positionierungsschranke für nichtterrestrische 5G-Netze (nur wenn eine veröffentlichte ausgearbeitete Zahl gefunden wird); unter P2 die Gleichtakt-Integritätsblindheit, das skalare Zeitgebungs-Schutzniveau nach MHSS (multiple-hypothesis solution separation) und die GLS-Weißung (generalised least squares). Die beiden Benchmark-Zeilen zur Zeitgebungsintegrität (der Klassifikator für das Stanford-Integritätsdiagramm und der Bewerter der Integritätsabdeckung) sind regelbasierte Klassifikation, keine lineare Algebra, daher erreicht P2 sie nicht; sie brauchen ein unabhängiges Werkzeug, und das einzige gefundene (gLAB) trägt eine nichtkommerzielle Lizenz.

# text
seg-50a08fe5918b = <b>Konsistenz mit früheren Ablehnungen.</b> Die Vallado-Prüfung der Zeile zum Startfenster würde sich nun unter P1 qualifizieren, wenn ihr Test das abgedruckte ausgearbeitete Beispiel berechnet; der Plan { "0.30" } befördert sie stattdessen über Orekit. Die Übergangstabelle der Mondzeit je Uhrenklasse bleibt MODELLED: Die Tabelle, die sie reproduziert, stammt aus dem eigenen Papier dieses Projekts, das nicht unabhängig ist.

# text
seg-02423542480f = Rauschterm

# text
seg-2bd49b92f14b = Parität der Allan-Schätzer (ADEV/MDEV/TDEV/OHDEV (ADEV: Allan-Abweichung; MDEV: modifizierte Allan-Abweichung; OHDEV: überlappende Hadamard-Abweichung))

# text
# c1: tests/allan_reference.rs
# c2: tests/allan_nist_sp1065_1000point.rs
# c3: tests/nbs14
seg-c429a25d17ae = Zwei Prüfungen gegen die Primärquelle <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), beide mit einer relativen Toleranz von <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: Die Schätzer für überlappende ADEV, modifizierte ADEV, Zeitabweichung und überlappende Hadamard-Abweichung reproduzieren die Abweichungen für den kanonischen Datensatz <b>NBS14</b> mit 10 Punkten (<b>SP { "1065" } Tabelle 29/30, S. { "107" }</b>) bei tau = { "1" }, { "2" } — die Übereinstimmung beträgt tatsächlich ~{ "1e-6" } (z. B. überlappende ADEV (OADEV) bei τ = { "2" }: { "85.952868" } gegen { "85.95287" }). ({ "2" }) <c2/>: Dieselben vier Schätzer reproduzieren den <b>Datensatz mit 1000 Punkten aus SP { "1065" } §{ "12.4" }</b> (<b>Tabelle { "31" }, S. { "108" }</b>) bei den Mittelungsfaktoren { "1" } / { "10" } / { "100" }, wobei der Datensatz im Code aus dem LCG von SP { "1065" } (Gl. { "73" }) neu erzeugt wird — hermetisch, ohne Fixture. Dieselben Daten und die Zahlen aus Tabelle 31 sind das Regressionsziel in aewallin/allantools (<c3/>), hier ohne Code Dritter reproduziert. Dies legt die <em>Schätzer-Mathematik</em> gegen die Referenz fest, getrennt von den Zeilen zur Rausch-<em>Kalibrierung</em> unten.

# text
seg-79e6f7d1e7f0 = Parität der Allan-Schätzer an <b>realer gemessener Hardware</b>

# text
# c1: tests/cs5071a_reference.rs
# c2: allantools
# c3: scripts/fetch_cs5071a.sh
# c4: tests/fixtures/cs5071a/
seg-8c72a9df2547 = <c1/>: Die Schätzer für überlappende Allan- und überlappende Hadamard-Abweichung reproduzieren die Referenzabweichungen von <b>Stable32</b> für ein <b>reales Caesium-Primärnormal 5071A, gemessen gegen einen Wasserstoff-Maser</b> ({ "556 990" } Phasenabtastwerte bei τ₀ = { "1" } s; { "1" } PPS (Puls pro Sekunde) in einen Zähler 53230A, Feb. { "2014" }; erfasst von A. Wallin, verteilt mit <c2/>). Geprüft über die <b>gesamte Dekadenleiter von τ ({ "16" } Mittelungsfaktoren, τ = { "1" } s … { "4" }×10⁴ s)</b>: gut abgetastete Faktoren mit einem relativen Gate von <b>{ "1e-3" }</b> (die beobachtete Übereinstimmung beträgt tatsächlich ≤ { "3e-5" }, z. B. OADEV({ "1" } s) { "3.317111e-10" } gegen Stable32 { "3.3171e-10" }), spärlich besetzte Faktoren bei langem τ müssen innerhalb des gedruckten { "1" }‑σ-Konfidenzbands von Stable32 liegen. Dies ergänzt die synthetische NBS14-Parität oben um eine Prüfung an einer gemessenen Uhr. Die rohe Phasendatei ist Datenmaterial Dritter ohne Weiterverbreitungslizenz und daher von git ausgeschlossen; <c3/> reproduziert sie, und der Test gibt einen Hinweis zum Überspringen aus (CI (kontinuierliche Integration) bleibt grün), wenn sie fehlt. Nur die öffentlichen Referenzzahlen von Stable32 sind eingecheckt (<c4/>); es wird kein Code Dritter verwendet.

# text
seg-1a7f0e741913 = Parität der Allan-Schätzer am <b>kanonischen Stable32-PHASE.DAT</b>

# text
# c1: tests/phasedat_reference.rs
# c2: allantools
# c3: scripts/fetch_phasedat.sh
# c4: tests/fixtures/phasedat/
seg-00e382874a00 = <c1/>: Die Schätzer für überlappende Allan-Abweichung, modifizierte Allan-Abweichung und Zeitabweichung reproduzieren die Referenzabweichungen von <b>Stable32</b> für <b>PHASE.DAT</b> — die Reihe mit 1001 Punkten, die mit Stable32 verteilt wird und die unabhängige Werkzeuge (z. B. <c2/>) als ihr Standard-Regressionsziel verwenden — über die <b>vollständige Leiter der Mittelungsfaktoren ({ "139" } Faktoren)</b> mit einem relativen Gate von <b>{ "1e-3" }</b> (beobachtet ≤ { "5e-5" }). Eine zweite, unabhängige reale Referenzreihe neben der Prüfung am gemessenen Caesium oben. PHASE.DAT wird mit dem kommerziellen Werkzeug Stable32 ausgeliefert, daher ist die Rohreihe von git ausgeschlossen; <c3/> reproduziert sie, und der Test überspringt grün (CI bleibt grün), wenn sie fehlt. Nur die öffentlichen Referenzzahlen von Stable32 sind eingecheckt (<c4/>); es wird kein Code Dritter verwendet.

# text
seg-9dde9e0c8055 = Stabilität optischer Uhren an einer <b>realen gemessenen Kurve</b>

# text
# c1: tests/optical_clock_adev_reference.rs
# c2: quantum_trade::qparams_from_adev_curve
# c3: tests/fixtures/optical_clock_adev/
seg-ea908ba3a79f = <c1/>: Die Inversion der Uhrenrauschparameter (<c2/>) reproduziert das <b>veröffentlichte σ_y(τ) der optischen ⁸⁸Sr-Gitteruhr von Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), Kurve eingebunden unter <c3/>): Der gewonnene Koeffizient des weißen Frequenzrauschens √q_wf ≈ { "4.33e-16" } passt zur Kurzzeitstabilität des Papiers von ≈4.7e-16/√τ (~{ "10" } % RMS (Effektivwert) über die Kurve), und die Anpassung erkennt einen von null verschiedenen gemessenen Boden (q_rw > { "0" }). Dies legt die <b>Inversion von gemessener ADEV zu Rauschparametern an einer realen optischen Uhr</b> fest; der darauf aufbauende Nutzen von Holdover bis zur Schwelle bleibt MODELLED.

# text
seg-e1e930dcd0a1 = ROC (receiver operating characteristic) AUC (Fläche unter der Kurve) der Anomalieerkennung an <b>realer Telemetrie von OPS-SAT der ESA (European Space Agency)</b>

# text
# c1: validated
seg-2b637daa985c = <c1/> (reproduziert die Labels)

# text
# c1: tests/opssat_ad_reference.rs
# c2: impairment_eval::auc
# c3: roc_auc_score
# c4: eval_stats::bootstrap_auc_ci
# c5: tests/fixtures/opssat/
# c6: generate_opssat_oracle.py
seg-c667434b580d = <c1/>: Am Datensatz <b>OPSSAT-AD</b> (Ruszczak et al. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) — reale Housekeeping-Segmente von OPS-SAT mit Anomalie-Labels als Grundwahrheit — reproduziert die Mann–Whitney-ROC-AUC von Kshana (<c2/>) <b>scikit-learn <c3/></b> auf <b>< { "1e-9" }</b> am zurückgehaltenen Testteil ({ "529" } Segmente, { "113" } Anomalien), für zwei deterministische Werte: einen transparenten Detektor mit einem einzelnen Merkmal (Spitzenzahl des Segments, <b>AUC ≈ { "0.851" }</b>) und einen Wert mit 8 Merkmalen aus diagonaler Mahalanobis-Distanz, angepasst an die normalen Trainingssegmente (AUC ≈ { "0.556" }); <c4/> fasst die Punktschätzung mit einer unteren Grenze ein, die den Zufall übertrifft. Dies validiert die <b>AUC-Berechnung an realen ESA-Daten</b> und die <b>gelabelte Trennung</b> eines transparenten Detektors — es reproduziert <b>nicht</b> die beste veröffentlichte Metrik des OPSSAT-AD-Papiers (ein überwachtes FCNN (vollständig verbundenes neuronales Netz), F1 ≈ { "0.95" }), die ihr trainiertes Modell braucht. CC-BY-Daten eingebunden (<c5/>, hermetisch); die unabhängige Referenz wird mit <c6/> neu erzeugt.

# text
seg-5f2d41617fb2 = Synthese von Gravitationsfeld-Funktionalen (gravitationsgestützte / GNSS-freie (GNSS: Global Navigation Satellite System) Navigationskarte)

# text
# c1: tests/icgem_gravity_reference.rs
# c2: gravity_sh::gravity_magnitude
# c3: gravity_disturbance_mgal
# c4: from_gfc
# c5: tests/agency_lro.rs
seg-4c1126137428 = <c1/>: Der Kernel für Gravitations-Funktionale aus Kugelflächenfunktionen (<c2/> / <c3/>) — der „Kartenleser“, mit dem ein gravitationsgestützter Navigator abgleicht — ist gegen den <b>Normalschwere-Standard GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, von der IAG übernommen (IAG: International Association of Geodesy)) validiert. Der Aufbau des Normalfelds GRS80 aus seinen veröffentlichten geraden zonalen Harmonischen J₂…J₈ und die Synthese der Schwere (Gravitation + Zentrifugal) auf dem Ellipsoid reproduziert die geschlossene <b>Somigliana</b>-Normalschwere und die veröffentlichten Äquator-/Polwerte γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s² auf <b>{ "3.5e-12" }</b> relativ über alle Breiten (Gate { "1e-9" }). Derselbe Kernel lädt das <b>reale ICGEM-Erdmodell (International Centre for Global Earth Models) EGM2008 (Earth Gravitational Model { "2008" })</b> (gemeinfrei von der NGA (National Geospatial-Intelligence Agency) über ICGEM; der Leser <c4/> wird auch am Mondfeld von GRAIL (Gravity Recovery and Interior Laboratory) in <c5/> geprüft) und erzeugt eine physikalisch begrenzte Karte der Schwerestörung (RMS ≈ { "26" } mGal, max ≈ { "89" } mGal bei Grad/Ordnung { "70" }). Validiert die <b>Korrektheit des Synthesecodes</b>; die <em>Genauigkeit der Navigationslösung</em> mit Gravitationsstützung bleibt MODELLED (es gibt keine öffentliche Trajektorie eines Gravimeters auf einer Plattform mit Grundwahrheit).

# text
seg-7dc3ff4c6eea = Rauschtyp-spezifische edf (Konfidenzintervalle)

# text
# c1: src/allan.rs
# c2: tests/allan_nist_sp1065_1000point.rs
seg-7e8a93fb2eea = <c1/>: Das χ²-Konfidenzband an jedem Punkt der überlappenden ADEV verwendet die rauschtyp-spezifischen effektiven Freiheitsgrade (die geschlossenen Formen aus NIST SP { "1065" } Tabelle { "5" } für weiße und Flicker-Phasenmodulation, weiße und Flicker-Frequenzmodulation und Random-Walk-Frequenzmodulation (WPM/FPM/WFM/FFM/RWFM) — die einfache Menge von Stable32), wobei der Potenzgesetz-Typ der Aufzeichnung aus ihrer doppelt logarithmischen MDEV-Steigung bestimmt wird. Drei unabhängige Prüfungen: (a) Die fünf Formeln reproduzieren von Hand ausgewertete Werte bei N={ "64" },m={ "4" } auf { "1e-12" }; (b) ein <b>Monte-Carlo-Ensemble mit weißer FM (FM: Frequenzmodulation)</b> ({ "4 000" } Aufzeichnungen) misst die tatsächliche Chi-Quadrat-edf des Schätzers = { "2" }·Mittelwert²/Var(σ²) und stimmt innerhalb von { "20" } % mit der Formel überein (und übertrifft deutlich die konservative nichtüberlappende Zählung); (c) <c2/> reproduziert die gedruckte <b>SP { "1065" } Tabelle { "32" } (S. { "109" })</b> edf = { "146.177" } für den Datensatz mit 1000 Punkten bei m={ "10" } (weiße FM) auf { "5e-3" } und die { "95" }-%-Konfidenzgrenzen der Tabelle ({ "8.223942e-2" } / { "1.035201e-1" }) auf <{ "0.2" } % (das kleine Residuum ist die Wilson-Hilferty-χ²-Näherung gegenüber dem exakten χ² des NIST). Die exportierte ADEV-Kurve trägt den bestimmten Rauschtyp, die edf und das { "95" }-%-Band je τ.

# text
seg-7048ac695b99 = Weiße FM (kurzfristig)

# text
# c1: tests/calibration.rs
seg-b6982cb2ca25 = <c1/>: Die simulierte überlappende ADEV reproduziert das veröffentlichte sigma_y({ "1" } s) — typischerweise innerhalb weniger Prozent, <b>durchgesetztes Gate { "20" } %</b> (CSAC und das Ziel der optischen Gitteruhr) — und die Kurve der weißen FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) über tau = { "1" }, { "10" }, { "100" } s innerhalb eines <b>Gates von { "25" } %</b> (passt zum Datenblatt der CSAC (Chip-Scale-Atomuhr) { "3e-10" } / { "1e-10" } / { "3e-11" }).

# text
seg-11fc7c4b61ff = Random-Walk-FM (langfristig)

# text
# c1: tests/calibration.rs
seg-1e211f342e79 = <c1/>: Die simulierte ADEV passt zu sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley NIST SP { "1065" }) auf ~{ "20" } % (über Seeds gemittelt).

# text
seg-dcfca4041429 = Alterung / linearer Drift

# text
# c1: modeled
seg-2d5c6a44cbdb = <c1/> + herauskalibriert

# text
# c1: src/estimator.rs
# c2: src/models.rs
seg-492f91ba2f79 = Deterministisch; der Holdover-Schätzer entfernt Versatz und Alterung über einen quadratischen Prädiktor, sodass das Residuum die stochastische Grenze ist. Getestet in <c1/> / <c2/>.

# text
seg-2ea6a14cac1c = Kalman-Schätzer + Integritätsschranke

# text
# c1: src/kalman.rs
# c2: q_wf*T + q_rw*T^3/3
# c3: P⁺ = (I−KH)P(I−KH)ᵀ + KRKᵀ
# c4: R=1e-26 / Q≈1e-30
# c5: src/run.rs
seg-8c8f8a5eba5a = <c1/>: ein Filter mit zwei Zuständen (Phase, Frequenz), dessen exaktes Van-Loan-Prozessrauschen zum Wahrheitsmodell passt; das Coasting reproduziert die analytische Holdover-Varianz <c2/> auf { "1e-9" }. Die Kovarianzaktualisierung erfolgt in <b>stabilisierter Joseph-Form</b> <c3/>, die über { "500" } Prädiktions-/Aktualisierungsschritte bei einem extremen Verhältnis <c4/> positiv semidefinit bleibt (per Cholesky geprüft) und mit der naiven Form auf { "1e-9" } übereinstimmt, wo diese gut konditioniert ist. Die Laufschicht berichtet die Integrität als Anteil der Ausfall-Abtastwerte innerhalb der 3-Sigma-Schutzschranke (<c5/>).

# text
seg-f332f06e80f9 = Filter-Selbstkonsistenz (NIS (normalised innovation squared) / NEES (normalised estimation error squared))

# text
# c1: validated
seg-333e1701b6d0 = <c1/> (Modell)

# text
# c1: src/filter_health.rs
# c2: consistent=true
# c3: consistent=false
# c4: filter_health
# c5: detection::chi2_inv_cdf
seg-c1304de95180 = <c1/>: eine Monte-Carlo-Konsistenzbewertung (Bar-Shalom §{ "5.4" }). Das zusammengefasste <b>NIS → { "1" }</b> und <b>NEES → { "2" }</b> des angepassten Filters liegen innerhalb ihrer { "95" }-%-χ²-Bänder (das NIS-Band verwendet die zusammengefasste Zahl weißer Innovationen; das NEES-Band verwendet die Zahl unabhängiger Läufe, da Schätzfehler zeitlich korreliert sind). Ein Test mit <b>Q/R-Fehlanpassungs-Sweep</b> prüft, dass der Monitor <c2/> nur bei Einheitsabstimmung und <c3/> bei Fehlabstimmung um ×0.1/×0.5/×2/×{ "10" } meldet, wobei NIS wie abgeleitet ≈1/q_factor skaliert. Als <c4/> im Uhren-Ergebnis im JSON-Format (JavaScript Object Notation) und in einer Karte im Playground bereitgestellt. Die χ²-Bänder verwenden das Wilson-Hilferty-Quantil (<c5/>, mit Tabelle geprüft).

# text
seg-078c4009b24f = Modell der Zweiweg-Zeitübertragung

# text
# c1: src/timetransfer.rs
# c2: (m_AB - m_BA)/2
# c3: 1/sqrt(2)
# c4: sigma_y^2(tau) = q_rw*tau/3
# c5: step()
# c6: sigma_j
# c7: q_rw
seg-22f8cdeda335 = <c1/>: Die reziproke Gleichtakt-Verzögerung hebt sich in der Schätzung <c2/> exakt auf (von Hand abgeleitet, exakt), und zwei Einweg-Messungen mitteln auf <c3/> (über Seeds gemittelt); die nichtreziproke Differenzverzögerung ist ein farbiger Prozess aus weißer FM + Random-Walk-FM, dessen Allan-Abweichung <c4/> folgt (über Seeds gemittelt, ~{ "20" } %, über das eigene <c5/> der Strecke). Die <em>Parameter</em> (je Strecke <c6/>, <c7/>) sind repräsentative TWSTFT-/optische (TWSTFT: Zweiweg-Satelliten-Zeit- und -Frequenzübertragung) Werte, nicht an ein bestimmtes Terminal angepasst.

# text
seg-6ab219622143 = Sicherheit (Spoof-Erkennungswert)

# text
# c1: src/security.rs
# c2: sqrt(r/m + q_wf*tau + q_rw*tau^3/3)
# c3: k
# c4: [0,1]
# c5: tau
# c6: k
# c7: r
seg-29dd10011ed1 = <c1/>: Die 1-Sigma-Untergrenze des Monitors <c2/> und der daraus folgende minimal erkennbare Versatz bei <c3/>-Sigma sowie der Wert <c4/> sind von Hand abgeleitet und per Unit-Test geprüft. Das Modell (Innovations- bzw. RAIM-artige (RAIM: receiver autonomous integrity monitoring) uhrengestützte Erkennung) ist stimmig; die <em>Parameter</em> (Überwachungsfenster <c5/>, Erkennungsmultiplikator <c6/>, Messrauschen <c7/>) sind repräsentativ, nicht an einen bestimmten Empfänger angepasst.

# text
seg-ca51e4f1e19c = Erkennung von Spoofing-Angriffen

# text
# c1: src/spoof.rs
# c2: start + bound/rate
# c3: representative-parameters
seg-e991f5b2fdb2 = <c1/>: Ein ansteigender Zeit-Spoof wird gemeldet, wenn sein Versatz die Erkennungsschranke der Uhr überschreitet; die Erkennungszeit stimmt mit dem von Hand abgeleiteten <c2/> auf einen Rasterschritt überein, und eine Uhr, deren Schranke die Vorgabe überschreitet, lässt den Spoof die Schwelle unentdeckt erreichen. Derselbe Vorbehalt <c3/> wie beim Sicherheitswert.

# text
seg-3d2f6d2b7722 = Flicker-FM (Boden)

# text
# c1: modeled
seg-55697d598918 = <c1/> (standardmäßig aus)

# text
# c1: src/models.rs
# c2: flicker_floor
seg-55000870c060 = Synthetisiert als Summe logarithmisch verteilter Ornstein-Uhlenbeck-Prozesse (OU), kalibriert auf einen konfigurierbaren flachen ADEV-Boden; <c1/> validiert, dass der Boden über die Mittelungszeit flach ist und auf dem konfigurierten Niveau liegt (über Seeds gemittelt). Je Uhr über <c2/> aktivierbar. Die zitierten Referenzszenarien lassen ihn aus: Die CSAC wird über ihren Datenblattbereich (1-1000 s) von weißer FM dominiert, und der systematische Boden der optischen Uhr (~{ "5e-17" }) wird durch ihre Genauigkeitsangabe dargestellt.

# text
seg-e2e3de9a61a4 = Statistik des Monte-Carlo-Ensembles

# text
# c1: validated
seg-9785d05ec5a7 = <c1/> (Aggregation)

# text
# c1: src/ensemble.rs
# c2: runs
# c3: p05 <= p50 <= p95
seg-cc6c6bb5eb83 = <c1/>: Nearest-Rank-Perzentile und Mittelwert über <c2/> reproduzierbare Realisierungen; ein einzelner Lauf lässt die Streuung zusammenfallen, das Band je Zeitschritt ist geordnet nach <c3/>, und Wiederholungen sind bitidentisch. Dies ist statistische Aggregation über den bereits validierten Einzellauf, kein neues physikalisches Modell.

# text
seg-72a9d5de61f5 = sigma_y({ "1" } s)

# text
seg-ebbe708d9cbc = csac-sa45s (CSAC)

# text
seg-c43fe67d4200 = Datenblatt Microchip SA65 / SA.45s

# text
seg-e3bde4355d78 = optical-sr-lattice (Sr-Gitter)

# text
seg-87793f684233 = optische Strontium-Gitteruhr, weltraumorientiertes Ziel, arXiv:{ "1503.08457" }

# text
seg-b03f5856d451 = Status: weiße FM und Random-Walk-FM validiert; Alterung modelliert und herauskalibriert; Flicker-FM modelliert und validiert (in den zitierten Szenarien standardmäßig aus).

# text
seg-c5ff448dcb88 = Reifegrad: Die Angaben zur optischen Uhr sind das <em>weltraumorientierte Ziel</em> auf Bodenhardware -- keine optische Strontium-Uhr ist je geflogen. Sr-Uhren im Labor erreichen { "4.8e-17" } (Oelker et al. { "2019" }, Nature Photonics). Die CSAC-Angaben stammen von einem im Einsatz befindlichen kommerziellen Bauteil.

# text
seg-b59a4b8e6d88 = Beziehungen: Riley, NIST SP { "1065" }, Gl. { "67" } -- weiße FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); Random-Walk-FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, äquivalent q_rw*tau/3 für einen Frequenz-Wiener-Prozess mit der Diffusion q_rw.

# text
seg-dca7ee671d91 = Paket { "2" } — inertiale Koppelnavigation (Quantum-Inertialmesseinheit)

# text
seg-98452a081241 = Konstanter/Rest-Bias -> Position

# text
# c1: src/inertial/mod.rs
seg-6aa386251acf = Positionsfehler = { "0.5" }<em>b</em>T^{ "2" } (Familie; Groves AESS (Aerospace and Electronic Systems Society) Tutorial); von Hand abgeleiteter diskreter Test in <c1/>.

# text
seg-c60c0b54c485 = Geschwindigkeits-Random-Walk (weiße Beschleunigung)

# text
# c1: src/inertial/mod.rs
seg-7ce1f40566cf = <c1/>: Die simulierte Standardabweichung (SD) des Positionsfehlers passt zu sigma_x(T)=sqrt(S_a*T^3/3) (Groves Gl. 54) auf ~{ "12" } % beobachtet (über Seeds gemittelt; durchgesetztes Gate { "20" } %).

# text
seg-8ac776795d40 = Physik des Beschleunigungsmessers mit Kaltatom-Interferometer (CAI) (aus ersten Prinzipien)

# text
# c1: src/inertial/quantum_imu.rs
# c2: k_eff = 4pi/lambda ~ 1.611e7 rad/m
# c3: Phi = k_eff*a*T^2 ~ 1.580e4 rad
# c4: T = 10 ms
# c5: sigma_Phi = 1/(C*sqrt(N)) = 2e-3 rad
# c6: C = 0.5
# c7: N = 1e6
# c8: sigma_a ~ 1.24e-6 m/s^2
# c9: 1/T^2
# c10: 1/sqrt(N)
# c11: q_va()
# c12: AccelModel
# c13: QUANTUM.md
seg-4eafc81873ed = <c1/>: ein Kaltatom-Interferometer nach Mach-Zehnder mit drei Pulsen. Von Hand gegen die Lehrbuchgeometrie geprüft — Rb-87 <c2/>; <c3/> bei { "1" } g, <c4/>; Projektionsrauschen <c5/> bei <c6/>, <c7/>; je Schuss <c8/>; die Skalierungsgesetze <c9/> und <c10/>; exponentieller Kontrastzerfall. <c11/> <b>leitet</b> die weiße Beschleunigungs-PSD (spektrale Leistungsdichte) ab, die das klassische <c12/> verbraucht. Ehrlicher Geltungsbereich: nur der <b>Boden des Quantenprojektionsrauschens</b> (hier ~{ "0.09" } ug/sqrtHz) — weit unter realen, durch Vibration begrenzten Geräten (1-50 ug/sqrtHz); der Vibrationstensor sowie Coriolis- und Lichtverschiebungs-Systematiken sind noch nicht modelliert (siehe <a1><c13/></a1>).

# text
seg-ed78f40a8d80 = Gyro-Bias + Winkel-Random-Walk (ARW) -> Neigung -> Schwerekopplung

# text
# c1: g*theta
# c2: src/inertial/mod.rs
# c3: gyro_bias
# c4: q_arw
seg-a73e97ac4a0e = Ein verbleibender Gyro-Bias und ARW treiben einen Lagefehler; die Neigung koppelt die Schwere (<c1/>) in den horizontalen Fehler der spezifischen Kraft ein. <c2/> validiert das kubische Positionswachstum bei reinem Bias exakt und das ARW-Lagewachstum als Wiener-Prozess (über Seeds gemittelt). Je Sensor über <c3/> und <c4/> aktivierbar; in den zitierten Szenarien nur mit Beschleunigungsmesser aus.

# text
seg-e68d093e952a = Bias-Instabilität (1/f-Flicker-Boden)

# text
# c1: src/inertial/mod.rs
# c2: bias_instability
seg-5ad1e7d55d07 = <c1/>: ein 1/f-Flicker-Prozess (dieselbe OU-Synthese, die für die Uhr validiert ist), dessen flacher Boden der Allan-Abweichung beim Koeffizienten der Bias-Instabilität liegt; null ist ein No-op, ein von null verschiedener Boden verändert die Trajektorie, beides reproduzierbar. Je Sensor über <c2/> aktivierbar.

# text
seg-b631c1bfce05 = Beschleunigungs-Random-Walk (Raten-Random-Walk)

# text
# c1: src/inertial/mod.rs
# c2: Var(bias_rw(T)) = q_aa*T
# c3: q_aa
seg-4a4a70363412 = <c1/>: Der Bias ist ein Wiener-Prozess mit <c2/>, über Seeds gemittelt auf ~{ "20" } % geprüft. Je Sensor über <c3/> aktivierbar.

# text
seg-49c4a2532dca = Kreuzvalidierung mit NaveGo (Rauschkoeffizienten der IMU (Inertialmesseinheit))

# text
# c1: tests/navego_imu_crossval.rs
# c2: github.com/rodralez/NaveGo
# c3: navego_example_allan.m
# c4: ADEV(1 s) = σ·√dt
# c5: < 5%
# c6: .mat
seg-e558aa705560 = <c1/>: eine externe Gegenprüfung gegen <b>NaveGo</b> (R. Gonzalez, Open-Source-Toolbox für INS/GNSS (INS: Inertialnavigationssystem), <c2/>). Reproduziert den synthetischen Rundlauf von <c3/> von NaveGo an dessen <b>veröffentlichtem Referenzprofil Microstrain 3DM-GX3-35</b>: Wird unser (mit NBS14/Stable32 validierter) Schätzer für die überlappende ADEV mit weißem Sensorrauschen auf den 1-σ-Niveaus von NaveGo betrieben, gewinnt er die Koeffizienten von Geschwindigkeits- und Winkel-Random-Walk (VRW, ARW) (<c4/>) auf <c5/> zurück (tatsächlich ~{ "0.4" } %), wobei der Zweig des weißen Rauschens bei der Steigung −1/2 liegt. Bestätigt, dass unsere Allan-Pipeline und die VRW/ARW-Definitionen von NaveGo übereinstimmen. Das aufgezeichnete STIM300-Protokoll <c6/> mit { "40" } MB wird nicht eingelesen (durch das Binärformat gesperrt).

# text
seg-171b215f0526 = Skalenfaktor, feinere Kreuzachsenterme

# text
# c1: not modeled
seg-b690ed87f493 = <c1/> in diesem 1-DOF-Paket (ein Freiheitsgrad)

# text
# c1: gnss-ins
# c2: src/inertial/imu_errors.rs
seg-c1bd4e24c091 = Das ältere einachsige Paket hat keinen Skalenfaktor- oder Kreuzkopplungsfehler. Die dreiachsige Strapdown-Bibliothek und das Paket <c1/> modellieren Skalenfaktor, Fehlausrichtung, g-Empfindlichkeit, Quantisierung und Ratenrampe (<c2/>; siehe die Tabelle der Behauptungen unten).

# text
seg-ce2b3237acfe = Bias-Stabilität

# text
seg-129dc6af8f10 = Rauschen, Wurzel der PSD

# text
seg-7109e60b8c9b = cold-atom-quat (Quantum)

# text
seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

# text
seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-b52686064c43 = Templier et al. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

# text
seg-09b42bed82c9 = nav-grade-quartz (Classical)

# text
seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

# text
seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

# text
seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

# text
seg-79fc524162b5 = Ehrliche Einordnung: Der Vorteil des Kaltatoms ist die <b>langfristige Bias-Stabilität</b> (~2600-fach niedriger), die einen langen GNSS-Ausfall über { "0.5" }<em>b</em>T^{ "2" } dominiert. Das Kurzzeitrauschen ist vergleichbar (Quantum ~{ "22" } gegen Classical ~{ "20" } ug/sqrtHz) — der Quantum-Sensor gewinnt den Marathon, nicht den Sprint. Reifegrad: Kaltatom-Beschleunigungsmesser sind im Labor-/Frühstadium (JRC122785), Quarz der Navigationsklasse ist im Einsatz.

# text
seg-e02e93f4f30a = Paket { "3" } — Zeitübertragung (optisch gegen Hochfrequenz (HF), optische Verbindung zwischen Satelliten)

# text
seg-2b87e5f0ba7e = Weißer Zeitjitter -> Synchronisationspräzision

# text
# c1: src/timetransfer.rs
seg-229295aa1f70 = <c1/>: Der simulierte Synchronisations-RMS reproduziert den Streckenjitter sigma_j; der Stichprobenmittelwert mittelt sich als sigma/sqrt(N) auf <{ "20" } % (über Seeds gemittelt).

# text
seg-4325ec478bca = Zeitgebung -> Einweg-Entfernungsmessung

# text
seg-aa7a1f463683 = Entfernung = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (exakt, von Hand abgeleiteter Test).

# text
seg-7ad8bb95bf35 = Flicker-/TDEV-Boden, Residuum der Zweiweg-Reziprozität

# text
# c1: src/twstft_budget.rs
# c2: time-transfer-budget
# c3: timetransfer
seg-5bf72778b6c2 = <c1/> (Art <c2/>): Flicker-Phasenrauschen (Kasdin–Walter, flache TDEV), eine tageszeitliche Nichtreziprozität und ein konstantes Reziprozitätsresiduum auf der Zweiweg-Reihe; das Paket <c3/> mit weißem Jitter bleibt unverändert.

# text
seg-dae3fa0375fe = Jitter je Einzelabtastwert

# text
seg-4a141a45a8ff = Quelle

# text
seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

# text
seg-c78abd60ec97 = im Orbit glaubwürdiges Ziel

# text
seg-9dfc1d4334a3 = optische Verbindung zwischen Satelliten, Synchronisationsziel im Pikosekundenbereich; O-TWTFT im Labor (TWTFT: Zweiweg-Zeit- und -Frequenzübertragung) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

# text
seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

# text
seg-0e730e8e2237 = gemessen, einzelne Sitzung

# text
seg-b9faad47d802 = TWSTFT von BIPM/PTB/NIST (BIPM: Internationales Büro für Maß und Gewicht; PTB: Physikalisch-Technische Bundesanstalt, das deutsche nationale Metrologieinstitut)

# text
seg-51e2e5782c96 = Ehrliche Einordnung: Die optische Angabe ist ein Synchronisationsziel im Orbit auf Pikosekundenniveau (nicht geflogen). Der terrestrische optische Laborboden liegt bei ~{ "1" } fs (weit besser); eine gut entwickelte Mikrowellenstrecke (die Mikrowellenstrecke (MWL) von ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) kann mit optisch gleichziehen, sodass die Basislinie „HF = { "0.5" } ns“ speziell gewöhnliche TWSTFT ist. Die Umrechnung in eine Entfernung gilt für einen Weg (Entfernung = c<em>dt); Zweiweg/Hin- und Rückweg halbiert sie (Entfernung = c</em>dt/2).

# text
seg-5fa72f18f983 = Paket { "4" } — hybride Fusion (Abschluss)

# text
# c1: pnt_holdover_s
seg-3de12b094504 = Setzt Paket { "1" } (Uhr), Paket { "2" } (inertial) und Paket { "3" } (Zeitübertragung) zu einer PNT-Suite (Positionierung, Navigation und Zeitgebung) zusammen. Die Suite muss SOWOHL die Zeitgebung (< Zeitgebungsvorgabe) ALS AUCH die Position (< Positionsvorgabe) innerhalb der Grenzen halten; <c1/> ist die Zeit, bis eines von beiden sie verletzt. Die optionale optische Zeitübertragung über die Verbindung zwischen Satelliten (ISL) synchronisiert die Uhr während des Ausfalls neu (nur Zeitstützung — die Position wird nicht neu synchronisiert, da die Zeitübertragung Zeit liefert, nicht Position).

# text
seg-4f7cd8f86565 = Aspekt

# text
seg-19deb2a3537c = Kombinierte PNT-Bewertung (Zeitgebung UND Position)

# text
# c1: src/hybrid.rs
# c2: score_hybrid
seg-77a7595ffad7 = <c1/> von Hand abgeleiteter Test <c2/> (pnt_holdover = Erstes von Zeitgebung/Position, das verletzt).

# text
seg-d0e39bf123d8 = Integrität + Sicherheit für das Hybrid-Paket

# text
# c1: src/hybrid.rs
seg-3fb63eb2b6b8 = <c1/>: ein Kalman-Zeitgebungsschätzer, auf die Wahrheit nachgeführt (nominal) und bei jeder optischen Neusynchronisation neu verankert; die Integrität ist die Einschließung durch die Schutzschranke (die Schranke enthält den Boden des Streckenjitters), die Sicherheit der Wert der Spoof-Erkennung. Für beide Suiten getestet, einschließlich des Falls mit Streckenstützung.

# text
seg-c3be96b7cb41 = Gemeinsamer Fusionsschätzer

# text
# c1: src/fusion/mod.rs
seg-e9d5448ea06c = <c1/>: ein einziger gemeinsamer Kalman-Filter ([Phase, Frequenz] ⊕ [Position, Geschwindigkeit]) ist der Navigator, durch GNSS nachgeführt (die Versätze werden aus der von null verschiedenen Anfangskovarianz gelernt) und durch Zeitübertragung gestützt; die gemeinsame Kovarianz liefert eine gemeinsame Integrität, die für beide Suiten mit rauschkonsistenten Sensoren als zuverlässig getestet ist (≥{ "0.9" }). Das Paket beobachtet Position und Zeit <b>getrennt</b>, wofür der optimale Filter blockdiagonal ist; die Schätzung eines konstanten Bias im erweiterten Zustand und die dynamische Kreuzstützung sind künftige Arbeit.

# text
seg-915ec766439f = Gekoppelter Filter für Uhr + Position (Kreuzblock-Kovarianz)

# text
# c1: CoupledPntFilter
# c2: [pos, vel, phase, freq]
# c3: ρ = g·pos + c·phase + noise
# c4: P[pos,phase]
seg-fd718a51859a = <c1/>: ein einziger gestapelter Kalman-Filter mit <c2/> (Aktualisierungen in Joseph-Form), dessen <b>Pseudoentfernungs</b>-Messung <c3/> die Positions- und Uhrenblöcke koppelt. Tests: Eine gemeinsame Pseudoentfernung treibt <c4/> auf einen von null verschiedenen Wert (entkoppelte Filter halten ihn exakt bei { "0" }); zwei verschiedene Geometrien lösen gemeinsam eingespeiste Positions- und Uhrenversätze auf, die eine einzelne Entfernung nicht trennen kann; eine Lösung <b>nur der Uhr</b> schärft die <b>Position</b> über die Kreuzkovarianz (der Gewinn, den die Kopplung liefert und entkoppelte Filter nicht); und ein Monte-Carlo-<b>NEES ist χ²({ "4" })-konsistent</b> (Bar-Shalom §{ "5.4" }, laufbasiertes Band). 1-DOF (die Dimensionalität des Pakets); noch nicht in das lauffähige Paket eingebunden, und die 3D-Erweiterung mit 8 Zuständen ist künftige Arbeit.

# text
seg-31ecf062b941 = Zusammensetzung validierter Teilmodelle

# text
seg-9b849cb4fe8d = erbt

# text
seg-4e1c8b6791f3 = Terme für Uhr/Inertial/Zeitübertragung sind in ihren eigenen Paketen validiert.

# text
# c1: gnss-ins
seg-b672e5499976 = Lose gekoppeltes GNSS/INS (Paket <c1/>)

# text
# c1: src/fusion/{gnss_ins_ekf,closed_loop,pack}.rs
# c2: closed_loop::tests::gyro_bias_coupling_predicts_the_strapdown_attitude_error
seg-277425f2cbcf = <c1/>: ein Error-State-EKF mit 15 Zuständen (δp, δv, ψ, Bias von Beschleunigungsmesser/Gyro; Groves §{ "14" }) treibt den dreiachsigen Strapdown-Navigator mit Rückführung. Tests: Ein eingespeister Positionsfehler wird bei Stützung mit perfekter Wahrheit zu null; die gestützte Lösung bleibt auf Meter begrenzt, während ein freilaufendes INS über { "100" } m hinaus divergiert; und der fusionierte Positions-RMS über einen Ausfall von { "60" } s schlägt die ungestützte Koppelnavigation um die Schranke des Ensemble-Tests (~{ "4" }× bei Messung vor { "0.27.3" }; der Abstand ist nach der unten genannten Korrektur größer). Die Gyro-Bias-Kopplung wird am Strapdown selbst geprüft: Ein bekannter verbleibender Gyro-Bias muss den Lagefehler erzeugen, den der Filter vorhersagt (<c2/>), und ein weites Prior muss einen Gyro-Bias der Klasse eines Flugcontrollers lernen und dabei begrenzt bleiben; beides scheitert mit dem Vorzeichen vor 0.27.3. <b>Überarbeitet in { "0.27.3" }:</b> Diese Kopplung hatte das falsche Vorzeichen, sodass Gyro-Bias-Schätzungen in die falsche Richtung drückten und nur ein enges Prior das Paket stabil hielt; die veröffentlichten Ausfallangaben änderten sich (CHANGELOG, Fixed). Ehrliche Grenze: Bei lose gekoppeltem Bias des Beschleunigungsmessers und Neigung sind beide kaum trennbar, daher wird keine Kalibrierung je Bias behauptet.

# text
seg-1c9a9f76a432 = Eng gekoppeltes GNSS/INS (Pseudoentfernung)

# text
# c1: update_tightly_coupled
# c2: closed_loop.rs
# c3: fuse_tightly_coupled
seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: Die Innovation wird im Entfernungsbereich gebildet (Sichtlinien-Jacobi-Matrix auf δp). Tests: Vier Satelliten bringen einen eingespeisten horizontalen Fehler von { "8" } m/−{ "5" } m auf < { "0.1" } m zu null; <b>zwei Satelliten</b> (keine Lösung für Position, Geschwindigkeit und Zeit (PVT) möglich) senken den horizontalen Fehler dennoch um mehr als das { "5" }-Fache; ein einzelner Satellit im Zenit beobachtet nur die Komponente entlang der Sichtlinie (vertikal) und lässt die horizontale unberührt; fehlerhafte Eingaben werden abgelehnt. Nur Pseudoentfernung — Trägerphase und ein expliziter Zustand der Empfängeruhr stehen auf der Roadmap.

# text
seg-240b681b6021 = Treue der Sensor-Kreuzstützung (vollständige Fusion mit Kalman/Faktorgraph)

# text
# c1: not modeled
# c2: hybrid
seg-efe7e288276b = <c1/> im Paket <c2/>

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-e5371874c57d = Das Hybrid-Paket ist eine Zusammensetzung auf Systemebene plus Zeitstützung, kein optimaler Schätzer. Filter gibt es anderswo: den lose und eng gekoppelten EKF (erweiterter Kalman-Filter) des Pakets <c1/> (Zeilen oben) und den UKF (Unscented-Kalman-Filter) mit 17 Zuständen der Art <c2/>. Ein Faktorgraph-Glätter wird nicht modelliert.

# text
seg-189758709fd2 = Ergebnis: Die reine Quantum-Suite hält volles PNT durch einen Ausfall von { "1.8" } h; die reine Classical-Suite ist <b>positionsbegrenzt</b> (die IMU der Navigationsklasse verletzt zuerst). Die optische ISL-Zeitübertragung hält sogar die klassische UHR synchronisiert und isoliert so den Inertialsensor als schwaches Glied der Classical-Suite — das Kernargument für Quantum-Inertial und optische Zeitgebung zusammen.

# text
seg-a4c5b45ea8a5 = Geometrie — GNSS-Verfügbarkeit aus Bahnen

# text
seg-d347bb63c1fd = Kreisförmige Zweikörper-Propagation

# text
# c1: src/orbit.rs
# c2: T=2 pi sqrt(r^3/mu)
seg-60c369fbbd97 = <c1/>: Periode <c2/> (mu = { "3.986004418e14" }), die Position kehrt nach einer Periode zurück, Planarität bei äquatorialen/polaren Bahnen — von Hand abgeleitete Tests.

# text
seg-1260a2fef95f = Exzentrische (Kepler-)Propagation

# text
# c1: src/orbit.rs
# c2: M = E - e sin E
# c3: a(1∓e)
seg-49df9d526f9c = <c1/>: Die Kepler-Gleichung <c2/> wird mit Newton gelöst (Residuum < { "1e-12" }); Radien von Perigäum/Apogäum <c3/>; der kreisförmige Fall stimmt mit dem Pfad in geschlossener Form auf { "1e-9" } überein.

# text
seg-958f03424508 = Säkulare J2-Drift von Knoten und Apsiden

# text
# c1: src/orbit.rs
# c2: Omega_dot = -1.5 n J2 (Re/p)^2 cos i
# c3: argp_dot = 0.75 n J2 (Re/p)^2 (5cos^2 i - 1)
seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); der Knoten regrediert (prograd) / schreitet fort (retrograd) / ist stationär (polar), und die Apsiden frieren bei der kritischen Inklination { "63.4" } Grad ein — von Hand abgeleitete Tests auf Vorzeichen und Null. Nur Zweikörper + säkular, nicht oskulierend.

# text
seg-dcba8d368326 = Sichtlinien-Sichtbarkeit (Erdverdeckung + Elevationsmaske)

# text
seg-2eee9a8f894b = Antipodaler Satellit verdeckt, radial nach außen stehender Satellit bei { "90" } Grad Elevation, tangentialer Satellit am Horizont — exakte, von Hand abgeleitete Tests.

# text
seg-f251c75eb367 = Sichtbarkeit -> GNSS-Zustand -> Zeitleiste

# text
# c1: >=4
seg-70fbb9f3cc2b = <c1/> sichtbar = nominal, 1-3 verschlechtert, { "0" } verweigert; Walker-Delta-Generator; ein Integrationstest treibt einen Uhren-Holdover-Lauf aus der abgeleiteten Zeitleiste.

# text
seg-988d3fedb7f5 = Optimierer für Konstellationsdesign + Geometrie der Abdeckungsstreifen (streets of coverage)

# text
# c1: src/walker.rs
# c2: optimize_walker_design
# c3: {planes × sats × inclination}
# c4: DesignObjective
# c5: coverage_half_angle_rad
# c6: λ = arccos(Re/r·cos ε) − ε
# c7: street_half_width_rad
# c8: cos c = cos λ / cos(π/s)
# c9: λ < π/s ⇒ None
seg-2a636487a4e6 = <c1/>: <c2/> durchsucht das Raster <c3/> und liefert die Zelle, die ein <c4/> am besten erfüllt (minimale Satellitenzahl für ein Abdeckungsziel / maximale Abdeckung / minimaler schlechtester PDOP (PDOP: Positions-DOP)) — ein Test stellt fest, dass die Wahl einem unabhängigen Brute-Force-Scan desselben Sweeps entspricht, und ein ausgearbeitetes Beispiel bestätigt, dass ein Walker-24/6/1-Design des GPS (Global Positioning System) mindestens so gut abdeckt wie ein ausgedünntes mit 18 Satelliten. Die analytischen geschlossenen Formen der <b>Abdeckungsstreifen</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) sind von Hand gegen die Lehrbuchgeometrie geprüft (GPS bei einer Maske von { "5" }°: λ ≈ { "71.16" }°, halbe Streifenbreite mit 4 Satelliten ≈ { "62.83" }°) und erkennen die Lücke bei zu geringer Besetzung (<c9/>). Der vollständige Löser von Rider für die minimale Satellitenzahl bei <em>globaler</em> Abdeckung (die nahtempfindliche Zahl der Ebenen) ist noch nicht implementiert.

# text
seg-a1c1364cc45a = Verdünnung der Genauigkeit (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometrisches DOP; HDOP: horizontales DOP; VDOP: vertikales DOP; TDOP: Zeit-DOP)) -> Positionsgenauigkeit

# text
# c1: src/orbit.rs
# c2: Q=(HᵀH)⁻¹
# c3: tests/dop_reference.rs
# c4: tests/fixtures/dop/
seg-a1706d47f895 = <c1/>: <c2/> aus der Entwurfsmatrix der Sichtlinien. <b>Externe unabhängige Referenz</b> (<c3/>): Die fünf DOP-Faktoren reproduzieren die von <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab — eine unabhängige, begutachtete GNSS-Bibliothek, hier so verwendet wie ERFA (Essential Routines for Fundamental Astronomy) für die Bezugssysteme) berechneten über <b>{ "8" } Geometrien</b>, von gut konditioniert bis nahezu singulär (DOP im Hunderterbereich), auf <b>{ "1e-6" }</b> relativ; Herkunft und Neuerzeugung in <c4/>. Als zusätzliche Prüfung in geschlossener Form reproduziert eine Geometrie mit regulärem Tetraeder die analytischen DOP-Werte (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) auf { "1e-9" }. Positions-Sigma = PDOP × äquivalenter Nutzer-Entfernungsfehler.

# text
seg-504d5aa92cbc = Positionsfehler = σ_UERE × DOP für die eigene Kleinste-Quadrate-Lösung der Engine

# text
# c1: src/dop_error_mc.rs
# c2: tests/uere_dop_monte_carlo.rs
# c3: pvt::solve_spp
# c4: tests/fixtures/dop/dop_reference.csv
# c5: orbit::dop
# c6: orbit::dop_cofactor
# c7: src/dop_error_ci.rs
# c8: tests/position_error_dop_ci.rs
seg-fc3443210358 = <c1/>, <c2/>: eine Monte-Carlo-Simulation mit Seed (N = { "20,000" } Epochen je Geometrie, σ = { "1.5" } m, ChaCha8-Seed { "36" } + i) von <c3/> mit Einheitsgewichten, ausgehend von der wahren Position, an den <b>{ "8" } Geometrien von <c4/></b> (jene, deren DOP mit gnss_lib_py abgeglichen ist), gegen σ²·Q, wobei Q der Kovarianzfaktor des Kernels <c5/> selbst ist (<c6/>, dieselbe Arithmetik). <b>Toleranzen vorab registriert</b> (Commit e50c88d2, vor dem ersten Lauf, gemäß der Entwurfsnotiz zur Geometrie von { "0.36" }, Abschnitt { "5.2" }), jede als Anzahl von Standardfehlern: Varianzen von Ost, Nord, Oben und Uhr innerhalb von { "5" } %; H/V/P-RMS innerhalb von { "2.5" } %; Ost-Nord-Korrelation innerhalb von { "0.035" }; Mittelwerte innerhalb von { "5" } Standardfehlern; der Anteil der horizontalen { "95" }-%-Ellipse innerhalb von { "0.95" } ± { "0.0077" }. Erster Lauf: alle { "104" } Prüfungen bestanden (schlechteste Varianz { "3.2" } %, RMS { "1.6" } %, Korrelation { "0.012" }, Mittelwert { "2.2" } Standardfehler, Ellipse { "0.0039" }). <b>Negativkontrollen</b> scheitern wie verlangt: ein verdoppelter PDOP scheitert bei jeder Geometrie; Fehler, die mit 1/sin(Elevation) gegen das ungewichtete Q wachsen, scheitern an einer Varianzprüfung bei jeder Geometrie, deren niedrigster Satellit unter { "20" }° steht. <b>Wie sich das mit der Zeile darüber zusammensetzt:</b> Jene Zeile validiert den DOP dieser Geometrien gegen gnss_lib_py; diese ergänzt den Schritt von diesen Faktoren zu Metern über den Löser der Engine. <b>Eine erste, getrennte Prüfung steht daneben</b> (<c7/>, <c8/>, vor der Vorregistrierung gelaufen und als solche berichtet): vier von Hand gewählte Himmel (offen, gehäuft, Schlucht, halber Himmel; σ { "1" } m) mit Chi-Quadrat-Konfidenzintervallen bei { "1e-6" } insgesamt über { "20" } Prüfungen; Verhältnisse { "0.987" } bis { "1.009" }, und ihre eigenen Negativkontrollen (ein DOP-Fehler von { "10" } %, Fehler mit 1/sin(Elevation)) scheitern wie verlangt. <b>Warum MODELLED:</b> kein externer Datensatz; sie zeigt nicht, dass der Fehler eines realen Empfängers dem Modell folgt, und σ_UERE ist eine Eingabe.

# text
seg-94bffbd8385b = Verfügbarkeit mit mehreren Konstellationen

# text
# c1: src/orbit.rs
# c2: [[constellations]]
seg-a40eab03bbbe = <c1/>: Zusätzliche <c2/> werden für Sichtbarkeit/DOP zu einer Satellitenmenge zusammengeführt; ein Test mit kombinierter Anzahl bestätigt die Vereinigung.

# text
seg-0b905100d91c = Broadcast-Ionosphäre (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → schräge L1-Verzögerung

# text
# c1: src/gnss_sim.rs
# c2: klobuchar_delay_m
# c3: tests/klobuchar_reference.rs
# c4: ionmodel
# c5: src/rtkcmn.c
# c6: src/ionex.rs
# c7: parse_ionex
seg-05e278f04770 = <c1/>: <c2/>, das Broadcast-Einfrequenzmodell mit acht Koeffizienten. <b>Externe unabhängige Referenz</b> (<c3/>): Die schräge L1-Verzögerung reproduziert <b><c4/> von RTKLIB (einer Open-Source-Bibliothek für Echtzeit-kinematische Positionierung)</b> (tomojitakasu/RTKLIB, <c5/> — die De-facto-offene GNSS-Referenz, aus dem Quellcode gebaut und unabhängig betrieben) über <b>{ "10" } Fälle</b> mit Elevation, Azimut, Ortszeit und zwei Koeffizientensätzen (dem Standard von kshana und dem von RTKLIB), auf <b>< { "1e-4" } m</b>. Der Leser für TEC-Karten (TEC: Gesamtelektronengehalt) im IONEX-Format (IONosphere map EXchange format) für GIM-Dateien (globale Ionosphärenkarten) existiert nun (<c6/>, <c7/> mit bilinearer räumlicher und zeitlicher Interpolation und einer Schrägabbildung, in der Crate per Unit-Test geprüft); eine Gegenprüfung dieser Interpolation gegen ein reales GIM-Produkt von CODE (Center for Orbit Determination in Europe) steht noch als Folgearbeit aus. Das Broadcast-Modell selbst ist extern validiert.

# text
seg-39e235557ecc = Erkennungskernel für RAIM/ARAIM (ARAIM: advanced receiver autonomous integrity monitoring) (χ² / nichtzentrales χ² / Normalverteilung) → Schwellen und Multiplikatoren

# text
# c1: src/raim.rs
# c2: chi2_quantile
# c3: pbias=√λ
# c4: noncentral_chi2_cdf
# c5: normal_quantile
# c6: tests/raim_reference.rs
# c7: scipy.stats.chi2
# c8: .ncx2
# c9: .norm
# c10: optimize.brentq
# c11: (GᵀG)⁻¹
# c12: tests/araim_reference_vectors.rs
# c13: ARAIM_REFERENCE.md
seg-8906f922b9b9 = <c1/>: Die Erkennungsschwelle für Snapshot / Solution-Separation / ARAIM (<c2/>), die Nichtzentralität <c3/> der verpassten Erkennung (<c4/>) und die Multiplikatoren K_fa/K_md/K_V (<c5/>) werden alle aus einer abhängigkeitsfreien regularisierten unvollständigen Gammafunktion ausgewertet. <b>Externe unabhängige Referenz</b> (<c6/>): <b>{ "171" } Fälle</b> reproduzieren <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> — eine unabhängige Cephes/Boost-Implementierung, ein anderer Algorithmus) über die Betriebsbereiche von P_fa / P_md / Redundanz auf <b>≤ { "1e-6" } relativ</b>. Die Geometrie, die den Kernel umhüllt (die Steigung/Kovarianz aus <c11/>), ist der mit gnss_lib_py validierte DOP-Kernel. <b>Geltungsbereich:</b> Diese Zeile legt den <em>statistischen Kernel</em> fest. Der <em>Wert</em> des Schutzniveaus der ARAIM-MHSS-Zuteilung (multiple-hypothesis solution separation) wird getrennt gegen das veröffentlichte ausgearbeitete Beispiel der ARAIM Technical Subgroup der WG-C (Working Group C) festgeschrieben (<c12/>, VPL (vertikales Schutzniveau) { "18.2926" } m gegen { "18.3" } m, HPL (horizontales Schutzniveau) { "13.4063" } m gegen { "13.45" } m, innerhalb der eigenen Toleranz der Referenz von { "0.05" } m; siehe den Hinweis zu Standards unten und <a1><c13/></a1>).

# text
seg-b17f1501a267 = Schutzniveau für SBAS (satellitengestütztes Ergänzungssystem) (DO-229E Anhang J) → horizontales / vertikales Schutzniveau (HPL / VPL)

# text
# c1: src/sbas.rs
# c2: sbas_protection_level
# c3: D=(GᵀWG)⁻¹
# c4: tests/sbas_reference.rs
# c5: zsiki/rtklib_ws
# c6: waasprotlevels()
# c7: rnx2rtkp -ws
# c8: core/filter.c
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-abe00b67e4cb = <c1/>: <c2/>, das gewichtete <c3/> nach kleinsten Quadraten (LS) → Hauptachse der horizontalen Fehlerellipse + vertikales σ, skaliert mit den K-Faktoren aus DO-229E. <b>Externe unabhängige Referenz</b> (<c4/>): Das HPL von kshana reproduziert den <b>RTKLIB-Fork für SBAS-PL</b> (<c5/> <c6/>, die Implementierung „DO-229D Anhang J“ von Siki & Takács { "2017" }), betrieben mit <c7/> an <b>realen EGNOS-Daten (European Geostationary Navigation Overlay Service)</b> (Broadcast-Nachrichten des GEO (geostationäre Bahn) PRN120 + reale RINEX-Daten (Receiver Independent Exchange Format) von BUTE/Budapest, 2017-02-19), über <b>{ "6" } Epochen</b> auf <b>< { "2e-3" } m</b>. Das σ je Satellit ist das eigene vollständige SBAS-Budget der Referenz (UDRE (user differential range error) + GIVE (grid ionospheric vertical error), Iono + Tropo + Flugzeug). ESA gLAB { "v6.0.0" } (<c8/>) wurde gebaut und bestätigt dieselbe Konvention. <b>Hinweis zu K_V:</b> Beide Referenzen runden den K_V aus MOPS (minimum operational performance standards) auf { "5.33" }; kshana verwendet das exakte <c9/> (~{ "0.06" } % kleineres VPL), sodass das Vertikale als das K-Faktor-freie <c10/> (= VPL der Referenz / { "5.33" }) validiert wird. Das HPL wird direkt abgeglichen (K_H = { "6.0" } auf beiden Seiten).

# text
seg-fd16d642cafd = Reale Konstellationsgeometrie aus TLEs (Zeile 2 / Kepler)

# text
# c1: validated
seg-1311ef1cb4bb = <c1/> (Parsen)

# text
# c1: src/tle.rs
seg-5117debbce89 = <c1/>: liest die mittleren Kepler-Elemente aus Zeile 2 (große Halbachse aus der mittleren Bewegung); ein bekannter Elementsatz der ISS (International Space Station) durchläuft den Rundlauf zu den richtigen Elementen und der richtigen Periode. Bei einem Block nur mit Zeile 2 ist die Propagation das Zweikörpermodell (+ optional J2) der Engine mit den <em>mittleren</em> Elementen — brauchbar für einen Schnappschuss von einer gemeinsamen Epoche, mit der Zeit von SGP4 (Simplified General Perturbations { "4" }) abweichend.

# text
seg-26d22e76e28d = Propagation mit SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (vollständige TLEs)

# text
# c1: src/sgp4.rs
# c2: tests/sgp4_verification.rs
seg-1099f1bffa01 = <c1/>: vollständiges SGP4 für Erdnähe + SDP4 für den tiefen Raum (säkulare/periodische Mond-Sonne-Terme + geopotenzielle Resonanz bei { "12" } h / { "24" } h). Validiert in <c2/> gegen die offiziellen Vektoren AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 („Revisiting Spacetrack Report #3“) — alle { "666" } Referenzzustände (erdnah, tiefer Raum, resonant, Fehlercode-Fälle) stimmen auf einen Positionsfehler von höchstens ≈ { "4.1" } mm überein. Ein vollständiger Zweizeilensatz (Zeile { "1" } + Zeile { "2" }) wird mit SGP4 propagiert; nur Zeile 2 bleibt Kepler; beides kann gemischt werden. Das Bezugssystem ist TEME (true equator, mean equinox), einheitlich für Nutzer und Satelliten verwendet (keine Reduktion TEME→ECEF (ECEF: erdzentriert, erdfest) — ausreichend für die Geometrie von Verfügbarkeit/DOP).

# text
seg-c8fc6a49d249 = IAU-Nutation (International Astronomical Union) 2000A / 2000B + Reduktion TEME→GCRS (GCRS: Geocentric Celestial Reference System)

# text
# c1: src/nutation.rs
# c2: nutation_iau2000a
# c3: nutation_iau2000b
# c4: eraNut00a
# c5: eraNut00b
# c6: nut00a
# c7: tools/gen_nut00a.py
# c8: nutation_iau2000a_data.rs
# c9: iauNumat
# c10: teme_to_gcrs
# c11: numat
# c12: tests/frame_reference_vectors.rs
seg-b31c49596100 = <c1/>: Die <b>vollständige IAU-Reihe 2000A</b> ({ "678" } lunisolare + { "687" } planetare Terme, <c2/>) und die Kürzung 2000B mit 77 Termen (<c3/>) sind jeweils <b>bitgenau</b> gegen die veröffentlichten Referenzvektoren von SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) bei JD_TT { "2453736.5" } validiert — <c4/> liefert Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> liefert Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } — beide auf <b>{ "1e-13" } rad</b>. Die Tabelle 2000A ist maschinell aus der ERFA-Quelle <c6/> durch <c7/> erzeugt (reproduziert das eingecheckte <c8/> bitgenau). Die Nutationsmatrix (<c9/>), die Gleichung der Äquinoktien und die vollständige Kette TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) (<c10/>, Vallado AIAA-2006-6980) werden auf Eigenschaften der echten Drehung, des Rundlaufs und von Präzession plus Nutation getestet, die Nutationsmatrix gegen ERFA <c11/> Element für Element auf { "1e-14" }, und die gesamte Kette TEME→GCRS gegen das veröffentlichte Beispiel TEME→GCRF von Vallado (AIAA 2006-6753, 2004-04-06) auf <b>{ "0.11" } m</b> (<c12/>); bis diese Ende-zu-Ende-Prüfung hinzukam, trug die Nutationsmatrix Δψ mit falschem Vorzeichen, eine Drehung um { "2" }·Δψ (etwa { "25" }″), die die Eigenschaftstests nicht sehen konnten (siehe CHANGELOG, Unreleased, Fixed); 2000A und 2000B stimmen wie verlangt auf < { "1" } mas überein. Die Kette beruht auf Äquinoktium/GMST (GMST: mittlere Greenwich-Sternzeit); die äquinoktiumfreie Reduktion CIO (X,Y,s) und ihre unabhängige numerische Gegenprüfung mit ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — ein Planetengeometrie-Werkzeug in reinem Rust; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m in GNSS-Bahnhöhe, weit innerhalb des Ziels von < { "10" } m) stehen in der CIO-Zeile unten.

# text
seg-0be3c40cc81a = Geomagnetisches Hauptfeldmodell IGRF-14 (IGRF: International Geomagnetic Reference Field)

# text
# c1: src/igrf.rs
# c2: igrf14coeffs.txt
# c3: tools/gen_igrf.py
# c4: igrf_data.rs
# c5: (B_r,B_θ,B_φ)
# c6: < 0.02°
# c7: synthesis_matches_the_official_bgs_igrf14_values_at_2025
seg-9dbb3b1b18a1 = <c1/>: das Kugelflächenfeld der IAGA (International Association of Geomagnetism and Aeronomy) mit Schmidt-Normierung (Grad/Ordnung { "13" }, { "2025.0" } + säkulare Variation; Koeffizienten maschinell aus der offiziellen <c2/> durch <c3/> erzeugt, <c4/> bitgenau reproduziert). An fünf unabhängigen Fronten validiert: ({ "1" }) exakte Stichproben der Koeffizienten gegen die IAGA-Datei (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) die Synthese vom Grad 1 reproduziert das <b>exakte geneigte Dipolfeld in geschlossener Form</b> <c5/> auf { "1e-6" }; ({ "3" }) das <b>vollständige analytische Feld vom Grad 13 ist gleich −∇V</b> des skalaren Potenzials (finite Differenzen, auf { "1e-4" }) — wobei die Ableitungen der Legendre-Funktionen und der Term 1/sinθ Ende zu Ende geprüft werden; ({ "4" }) die Dipolachse reproduziert den bekannten <b>geomagnetischen Nordpol</b> (~{ "80.7" }°N, −{ "72.7" }°E) und die <b>Dipolstärke</b> (~{ "29.7" } µT), und das globale Feld liegt im physikalischen Band von { "22" }–{ "67" } µT mit dem richtigen Vorzeichen der Inklination je Hemisphäre; und ({ "5" }) <b>externe unabhängige Referenz</b> — die vollständige Synthese reproduziert die Werte des offiziellen <b>Webdienstes IGRF-14 des British Geological Survey</b> bei { "2025.0" } (geodätische Höhe nach WGS-84 (WGS: World Geodetic System)) auf <b>< { "2" } nT</b> bei X/Y/Z/F und <c6/> bei D/I an vier Punkten, darunter { "400" } km Höhe (<c7/>).

# text
seg-c1027d5ffc44 = CIO-basierte IAU-2006/2000A-Reduktion GCRS↔ITRS (ITRS: International Terrestrial Reference System)

# text
# c1: src/cio.rs
# c2: (X, Y)
# c3: s
# c4: eraXys06a
# c5: eraC2ixys
# c6: eraEra00(2400000.5, 54388.0)
# c7: s
# c8: s06.c
# c9: tools/gen_s06.py
# c10: cio_s06_data.rs
# c11: gcrs_to_itrs_matrix
# c12: eraC2tcio
# c13: xval/anise-frames/
# c14: gcrs_to_itrs_matrix
# c15: earth_latest_high_prec.bpc
# c16: finals2000A
# c17: kshana
seg-aad81285e8cf = <c1/>: die äquinoktiumsfreie Kette vom himmelsfesten zum erdfesten System. Die Koordinaten des CIP (Celestial Intermediate Pole) <c2/> und die 66-Term-Reihe des CIO-Locators <c3/> sind <b>bitgenau</b> gegen den veröffentlichten SOFA/ERFA-Vektor <c4/> bei JD_TT { "2453736.5" } validiert — X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); die GCRS→CIRS-Matrix (CIRS: Celestial Intermediate Reference System) gegen <c5/> (alle neun Elemente auf { "1e-12" }); der Erdrotationswinkel (ERA) gegen <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Die Tabelle <c7/> wird maschinell aus der ERFA-Referenz <c8/> durch <c9/> erzeugt (reproduziert <c10/> bitgenau). Die vollständige <c11/> (CIO <c12/> = Polbewegung · ERA · GCRS→CIRS) wird auf eigentliche Rotation und Rundlauf getestet und stimmt nachweislich mit der älteren Äquinoktium/GMST-1982-TEME-Reduktion auf { "1" } m bei einem Radius von { "7 000" } km überein (die Konventionen unterscheiden sich dort um etwa { "5" } cm). <b>Unabhängiger Gegenvergleich durch Dritte (<c13/>):</b> dieselbe <c14/> wird mit <b>ANISE</b> verglichen (der reinen Rust-Neuimplementierung von NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)), das GCRF→ITRF93 rotiert (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }), aus <c15/> des JPL (Jet Propulsion Laboratory), mit <b>identischen Erdorientierungsparametern des IERS (International Earth Rotation and Reference Systems Service) aus <c16/> für beide Seiten</b>, über acht Quartalsepochen { "2020" }–{ "2023" }. Die beiden unabhängigen Realisierungen des Bezugssystems stimmen bis auf eine <b>maximale relative Rotation von { "0.028" }″ überein — ≤ { "0.86" } m am Boden, ≤ { "0.93" } m in LEO (low Earth orbit), ≤ { "3.6" } m in der GNSS-Bahn</b> (mittlerer Winkel { "0.023" }″). Dies ist der ROADMAP-Gegenvergleich der Bezugssysteme mit „< { "10" } m“, <b>geliefert</b>; der Rest ist der erwartete Modell-/Datumsunterschied zwischen ITRF93 und IERS-2010-CIO, kein Defekt (der bitgenaue Anker bleiben die obigen SOFA/ERFA-Vektoren). ANISE ist ein Crate unter MPL-2.0 (MPL: Mozilla Public License) / Edition 2024, daher liegt die Prüfung in einem eigenständigen, vom Workspace ausgeschlossenen Unter-Crate, das weder den veröffentlichten Abhängigkeitsgraphen von <c17/> noch ein Standard-CI-Gate berührt.

# text
seg-fa5889f379d2 = SP3-Export-Rundlauf (Standard Product { "3" }, das Format für präzise Bahnen) (Konstellation → SP3-c → erneutes Einlesen)

# text
# c1: tests/sp3_export_roundtrip.rs
# c2: gps-ops
# c3: Sp3File::from_propagators
# c4: to_sp3_string
# c5: parse_sp3
# c6: --export-sp3
seg-cd53434eba3a = <c1/>: der echte Celestrak-<c2/>-Schnappschuss ({ "30" } GPS-Satelliten) wird mit SGP4 propagiert, nach SP3-c exportiert (<c3/> → <c4/>), erneut eingelesen (<c5/>), und die zurückgewonnenen ECEF-Positionen werden zu jeder Epoche über { "24" } h mit der SGP4-Wahrheit verglichen — schlechtestes Residuum <b>< { "0.5" } m</b> (die Millimeter-Serialisierung des Schreibers; die TLE-Toleranz (TLE: two-line element set) des Meilensteins von { "10" } m wird mit großem Abstand erreicht). Auch der Pfad <c6/> der Kommandozeile (CLI) ist abgedeckt: Das mitgelieferte Bahnszenario exportiert ein erneut einlesbares SP3 mit 30 Satelliten, und ein Szenario ohne Bahn wird abgewiesen.

# text
seg-fa5ee52e59aa = Reale GPS-Konstellationsgeometrie aus TLEs (SGP4 → ECEF)

# text
# c1: tests/igs_real_data.rs
# c2: gps-ops
# c3: tests/fixtures/celestrak/NOTICE
seg-1329a53ca94c = <c1/>: ein echter <b>Celestrak-<c2/>-Schnappschuss</b> (2021-07-28, { "30" } betriebsbereite GPS-Satelliten; Herkunft in <c3/>) wird eingelesen, und jeder Satellit wird über den validierten SGP4-Kern auf einen gemeinsamen Zeitpunkt propagiert und von TEME nach ECEF gedreht. Es wird behauptet, dass die gesamte Konstellation innerhalb von { "1" } % auf der GPS-MEO-Schale (medium Earth orbit) liegt und dass vom Standort in mittlerer Breite bei freier Sicht die reale Gesamtsicht (neun Satelliten) einen PDOP von { "1.64" } ergibt, wobei die vertikale Verdünnung die horizontale übersteigt (wie es für einen Nutzer am Boden sein muss). Dies übt SGP4 an einer realen Konstellation, neben den realen Datenpfaden SP3 (präzise) und RINEX (Broadcast).

# text
seg-a1b7d74bbe02 = SGP4-Generator für mittlere Elemente nach Walker

# text
# c1: src/walker.rs
seg-01f1635b75e4 = <c1/>: ein entworfenes Walker-Delta-Muster wird als mittlere SGP4-Elemente ausgegeben (die mittlere Bewegung nach Kozai so gewählt, dass die große Halbachse nach SGP4 auf der Zielschale liegt) und über den validierten Kern propagiert. Tests: Ein GPS-ähnlicher Walker mit 24 Satelliten liegt innerhalb von { "1" } % auf der MEO-Schale, die Ebenen sind in der RAAN (right ascension of the ascending node), aus den Bahnnormalen zurückgewonnen, genau { "90" }° voneinander beabstandet, und die mittlere Bewegung reproduziert die Umlaufzeit der GPS-Schale von ~{ "718" } min.

# text
seg-6e8c472ec9fa = Konstellations-PDOP-Durchlauf + Kennzahlen (figures of merit) für Abdeckung und Wiederkehr

# text
# c1: validated
seg-dcdbf9c78ca5 = <c1/> (Monotonie)

# text
# c1: src/walker.rs
# c2: pdop_sweep
# c3: {planes × sats × inclination}
# c4: coverage_revisit
seg-5a70f090db45 = <c1/>: <c2/> tabelliert Abdeckung und mittleren/schlechtesten PDOP über ein Gitter <c3/>; <c4/> gibt den Abdeckungsanteil und die Wiederkehrlücken an einem Bodenpunkt an. Validiert anhand der physikalischen Monotonien, die ein Entwurfs-Trade einhalten muss: Zusätzliche Satelliten senken die Abdeckung nie und senken den mittleren PDOP strikt (ein vollständiger Entwurf mit 24 Satelliten deckt durchgehend bei einem PDOP von ~{ "1.7" } ab), und das Verdichten einer ausgedünnten Konstellation verkleinert die schlechteste Wiederkehrlücke strikt. Die mittlere Wiederkehrlücke übersteigt nie das Maximum. Dies sind Geometrie-Trade-Tabellen, kein zertifiziertes Link-/Abdeckungsbudget.

# text
# c1: orbit-gnss-challenged.toml
seg-9f0747d71ecc = Ehrliche Einordnung: Dies ist eine deterministische Geometrieschicht (Kreisbahnen, kugelförmige Erde mit mittlerem Radius { "6371" } km, reine Sichtlinie). Sie stellt aus realer Geometrie die <em>Verfügbarkeit</em> und die <em>geometrische</em> Positionsgenauigkeit fest (Verdünnung der Genauigkeit × ein repräsentatives Entfernungsfehlerbudget), keine Navigationslösung mit präziser Ephemeride. Die Referenz <c1/> setzt ein Raumfahrzeug in die GNSS-Schale: Es hält nur ~{ "59" } % des Tages eine Lösung, die Quantenuhr hält durch jede Lücke eine Zeitlösung von { "5" } ns (Verfügbarkeit { "1.0" }), während die chipskalige Uhr ~{ "0.73" } hält.

# text
seg-e2c433c35ba8 = Numerischer Propagator (Cowell) und Kraftmodell

# text
# c1: src/propagator.rs
# c2: src/forces.rs
# c3: src/integrator.rs
# c4: tests/numerical_cowell_propagator_reference.rs
seg-20ace4e0a710 = Der numerische Propagator (<c1/>) integriert ein hierarchisches Kraftmodell (<c2/>) mit den adaptiven Integratoren (<c3/>). Jeder Term unten ist gegen analytische Wahrheit oder eine von Hand hergeleitete geschlossene Form validiert; die Störungen sind <b>standardmäßig aus</b>, daher bleiben die veröffentlichten Goldens unberührt. Das zusammengesetzte Modell wird zudem gegen ein anderes Werkzeug gegengeprüft: <c4/> führt { "11" } LEO- und GTO-Fälle (geostationary transfer orbit) mit { "275" } stündlichen Epochen gegen den DormandPrince853-Propagator von Orekit { "12.2" } aus, und die konservativen Stufen (Zweikörper → J2–J6 → Sonne/Mond → Kanonenkugel-SRP) stimmen über { "24" } h auf höchstens { "0.08" } m überein (VALIDATED in der Matrix); die Luftwiderstandsstufe ist nur charakterisiert ({ "333" } m) und bleibt MODELLED.

# text
seg-ec74e57ff801 = Cowell-Propagator gegen analytische Kepler-Wahrheit

# text
# c1: src/propagator.rs
# c2: j2_secular_rates
# c3: solve_kepler_checked
# c4: Err
# c5: solve_kepler_robust
# c6: src/kepler.rs
# c7: tests/kepler_mpmath_oracle.rs
seg-8d773778ff0e = <c1/>: die ungestörte (Zweikörper-)Bahn reproduziert die <b>exakte Kepler-Lösung in universellen Variablen auf unter einen Meter über eine LEO-Bahn von { "24" } h</b> (ein engeres Kriterium als „gegen eine numerische Referenz < { "10" } m“); spezifische Energie und Drehimpuls bleiben auf ~{ "1e-9" } relativ erhalten; die J2-Knotenregression reproduziert das geschlossene <c2/> nach der Theorie erster Ordnung (innerhalb von { "2" } %, dem Residuum der Ordnung O(J2²)). <c3/> gibt <c4/> zurück statt einer stillschweigend falschen Antwort, wenn Newton nicht konvergiert (nahe dem Perigäum, e = { "0.999" }). Das robuste <c5/> (Starter nach Markley { "1995" }, <c6/>) konvergiert dort und über { "0" } ≤ e ≤ { "0.999999" } innerhalb von { "0.9" } ε·|E| von 50-stelligen mpmath-Wurzeln (<c7/>).

# text
seg-549d15780f79 = Adaptive Integratoren (RK4 (Runge–Kutta vierter Ordnung) mit Schrittverdopplung + das eingebettete Paar RK5({ "4" }) nach Dormand–Prince, unten DP5({ "4" }))

# text
# c1: src/integrator.rs
# c2: y' = y → e
# c3: propagate_dopri
# c4: integrate_dop853
# c5: tests/dop853_scipy_oracle.rs
seg-1fcc7553c627 = <c1/>: RK4 integriert <c2/> auf < { "1e-9" }, zeigt den Fehlerabfall um ~{ "16" }× je halbiertem Schritt (Konvergenz 4. Ordnung) und erhält den harmonischen Oszillator über eine Periode. Die eingebettete Fehlerschätzung von DP5({ "4" }) ist <b>O(h⁵)</b> (Halbieren des Schritts senkt sie um ~{ "32" }×), integriert den Oszillator über { "50" } Perioden bei Energieerhaltung auf < { "1e-6" } und erreicht denselben Endpunkt bei derselben Toleranz mit <b>weniger Funktionsauswertungen</b> als die Schrittverdopplung; <c3/> erfüllt dasselbe Kepler-Kriterium unter einem Meter und stimmt mit dem RK4-Pfad auf < { "1" } m auf einer J2..J6-Bahn überein. <b>DOP853</b> (<c4/>): Hairers Paar { "8" }({ "5,3" }) mit dichter Ausgabe reproduziert den DOP853 von SciPy { "1.18.1" } Schritt für Schritt (einzelner Schritt innerhalb von { "5.6e-15" }; identische Schrittzahlen bei den Läufen mit e = { "0.7" } und Arenstorf, ein Wechsel zwischen Annahme und Ablehnung in { "501" } Schritten beim LEO-Lauf; Endzustände innerhalb von { "1.6e-12" }) und trifft die exakte Kepler-Lösung ebenso genau wie SciPy (<c5/>).

# text
seg-345ae1eb05ec = Zonales Harmonikenfeld J2–J6

# text
# c1: src/forces.rs
# c2: zonal_accel
# c3: j2_accel
# c4: [J2]
# c5: J3
# c6: J2
# c7: J4..J6
# c8: z → −z
seg-a88e67186e69 = <c1/>: <c2/> wird auf drei Arten geprüft — es <b>reduziert sich auf Maschinengenauigkeit auf das mit 666 Vektoren validierte <c3/></b>, wenn es auf <c4/> beschränkt wird; es <b>stimmt mit dem numerischen Gradienten seines eigenen zonalen Potenzials überein</b> über das gesamte J2..J6-Feld (der Goldstandard für konservative Felder); und die ungeraden Terme <c5/> gegenüber den geraden Termen <c6/>/<c7/> zeigen die charakteristische Nord-Süd-(Anti-)Symmetrie unter <c8/>. Eine propagierte J2..J6-Bahn erhält die Gesamtenergie über einen Tag auf ~{ "1e-8" }.

# text
seg-5536986d9c8f = Gravitation dritter Körper (Sonne und Mond)

# text
# c1: src/forces.rs
# c2: src/ephem.rs
# c3: third_body_accel
# c4: third_body_accel
seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>stimmt mit dem exakten Gradienten seines Störpotenzials überein</b>, verschwindet im Geozentrum und trifft die Lehrbuchgrößen für LEO (~{ "5e-7" } m/s² Sonne, ~{ "1.1e-6" } m/s² Mond). Die Sonnenephemeride mit geringer Genauigkeit nach Montenbruck–Gill trifft von Hand hergeleitete J2000-Anker (Perihelabstand ≈ { "1.471e11" } m, ~−{ "23" }° Deklination zur Sonnenwende, ~{ "1" }°/Tag Bewegung); die Mondephemeride bleibt innerhalb ihrer Perigäums-/Apogäumshülle, gewinnt die mittlere Entfernung von ~{ "384 400" } km zurück, überschreitet die Inklination von { "5.3" }° nie und kehrt nach einem siderischen Monat auf { "1" }° genau zurück. Die epochengesteuerte Verdrahtung der rechten Seite (RHS, right-hand side) ist <b>bitgenau</b> (der RHS-Term entspricht <c4/> an der abgetasteten Position bei t = { "0" } und t = { "1" } Tag), und eine Epochenverschiebung um ein Vierteljahr ergibt eine andere Trajektorie.

# text
seg-9c8756f9d534 = Strahlungsdruck der Sonne (SRP) + konischer Schatten

# text
# c1: src/forces.rs
# c2: srp_accel
# c3: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c4: conical_shadow
# c5: ν = 1
# c6: ν = 0
# c7: [b−a, b+a]
seg-e6110e015204 = <c1/>: <c2/> (Kanonenkugel <c3/>) ist bei voller Sonne <b>bitidentisch</b> mit der geschlossenen Form, legt den <b>Strahlungsdruck bei 1 AU (AU: astronomische Einheit) auf ≈ { "4.5398e-6" } N/m²</b> fest, liegt im LEO-Band von ~{ "1.36e-7" } m/s² und drückt von der Sonne weg, viertelt sich bei doppeltem Sonnenabstand (umgekehrt quadratisch) und ist tief im Kernschatten <b>exakt null</b>. <c4/> liefert <c5/> bei voller Sonne und <c6/> im totalen Kernschatten (exakt), einen glatten monotonen Halbschatten, der im Band <c7/> von { "0" } → { "1" } ansteigt und <b>über den Kernschattenzylinder hinausreicht</b>.

# text
seg-17b48db4038b = Atmosphärischer Luftwiderstand (erster geschwindigkeitsabhängiger Term)

# text
# c1: src/forces.rs
# c2: atmospheric_density
# c3: drag_accel
seg-4e6c2d0fff55 = <c1/>: <c2/> (stückweise exponentiell nach Vallado, Tabelle 8-4) <b>verankert bei { "1.225" } kg/m³ auf Meereshöhe</b>, begrenzt unterhalb der Oberfläche, nimmt durch LEO monoton ab, liegt im Band von ~{ "1e-12" } kg/m³ bei { "400" } km mit einer physikalisch zurückgewonnenen Skalenhöhe von ~{ "58" } km; <c3/> wirkt der mitrotierenden Relativgeschwindigkeit mit der LEO-Größe von ~{ "2e-6" } m/s² entgegen. Die kennzeichnende Prüfung: Eine Bahn in { "300" } km verliert spezifische Energie <b>monoton</b>, und ihre große Halbachse nimmt um begrenzte ~km/Tag ab, wo die Vakuum-Basislinie die Energie auf < { "1e-9" } erhält.

# text
seg-133eed361425 = Post-Newtonsche (Schwarzschild-)relativistische Korrektur

# text
# c1: src/forces.rs
# c2: relativistic_accel
# c3: β = γ = 1
# c4: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c5: 3μ²/(c²r³)·r̂
# c6: ≈1.9e-9
# c7: μ(4μ + 3v²r)/(c²r³)
seg-c8e26480f148 = <c1/>: <c2/> (IERS-Form <c3/> <c4/>) fällt auf einer Kreisbahn auf die geschlossene Form <c5/> zusammen (radial, <b>nach außen</b>, außeraxiale Komponenten exakt null), zeigt das Lehrbuch-<b>Verhältnis <c6/> zum Zweikörperterm in LEO</b>, stimmt auf < { "1e-12" } mit der von Hand vereinfachten Form <c7/> für die Radialgeschwindigkeit überein und <b>stört im Propagator die Bahn, während die große Halbachse auf unter einen Meter/Tag gehalten wird</b> — das konservative Gegenstück zum Zerfall durch Luftwiderstand.

# text
# c1: ForceModel
# c2: src/gravity_sh.rs
# c3: src/tides.rs
# c4: src/precise_od.rs
# c5: ForceModel
# c6: propagator::Geopotential
# c7: HolmesFeatherstoneAttractionModel
# c8: tests/cowell_tesseral_orekit_oracle.rs
# c9: acceleration
# c10: acceleration_hf
# c11: from_gfc_file
# c12: scripts/fetch_egm2008.sh
# c13: acceleration_hf
# c14: xval/high-degree-gravity/
# c15: xval/cowell-tesseral-200-orekit/
# c16: src/nrlmsise00.rs
# c17: tests/nrlmsise00_reference.rs
# c18: forces::DensityModel
# c19: ForceModel::drag_density
# c20: ForceModel::with_ephemeris
# c21: ForceModel::srp_shadow
# c22: tests/srp_oblate_shadow_orekit_oracle.rs
# c23: tests/drag_tier_orekit_oracle.rs
seg-d39e75019595 = Ehrlicher Geltungsbereich: Die veröffentlichten Standardwerte von <c1/> integrieren das zonale Feld. Das hochgradige tesserale <b>Feld</b> EGM2008 (<c2/>, Grad/Ordnung { "70" }), die festen/ozeanischen/atmosphärischen <b>Gezeiten</b> (<c3/>) und der <b>Lense–Thirring</b>-Term der Rahmenmitnahme sind jetzt implementiert und in das Kraftmodell für die präzise Ephemeridenanpassung eingebunden (<c4/> — siehe unten). Das tesserale Feld ist auch ein zuschaltbarer Term des Cowell-<c5/> (<c6/>, standardmäßig aus), validiert gegen Orekit { "12.2" } <c7/> bis Grad/Ordnung { "70" } ({ "6" } Fälle über { "24" } h, schlechtestes |Δr| { "0.036" } m; <c8/>). Es gibt zwei Feldauswerter: das historische <c9/> (sphärische Partielle; gültig bis Grad ~{ "180" } abseits der Pole; Ausgaben festgelegt) und <c10/> (modifizierte Vorwärts-Spaltenrekursion nach Holmes–Featherstone { "2002" }, Gradient ohne 1/cos φ; gültig bis Grad { "2190" } auf jeder Breite). EGM2008 bis { "2190" } wird zur Laufzeit geladen (<c11/>, <c12/>, nicht mitgeliefert). <c13/> stimmt mit Orekit { "12.2" } auf { "7.3e-17" } m/s² an acht Punkten bis Grad { "2190" } überein; es bleibt MODELLED, weil pyshtools den vorab festgelegten Zielwert nahe dem Pol verfehlt hat (eine mpmath-Prüfung verortet den Fehler in pyshtools; <c14/>). Eine Bahn { "200" }×{ "200" } über { "24" } h stimmt mit Orekit auf { "0.13" } m überein, aber ihre vorab festgelegte Sensitivitätskontrolle bei Grad 70 wurde verfehlt ({ "0.73" } m < { "1" } m), daher sind die Grade { "71" }–{ "200" } in der Bahn charakterisiert, nicht validiert (<c15/>). Die thermosphärische Dichte NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) ist portiert (<c16/>: bitidentisch mit dem gemeinfreien C-Port auf { "720" } Punkten, innerhalb von { "1.9e-6" } relativ zu pymsis, die { "17" } veröffentlichten Testfälle reproduziert; <c17/>) und ist eine zuschaltbare Luftwiderstands-Dichtestufe (<c18/>, <c19/>; der Standard bleibt das statische Vallado-Modell). Dies validiert den Port, nicht die Genauigkeit des Modells gegenüber gemessener Dichte. DE440 (DE: Development Ephemeris) für Sonne und Mond ist eine zuschaltbare Ephemeridenstufe (<c20/>). Der Schatten des WGS-84-Erdellipsoids für SRP ist zuschaltbar (<c21/>) und stimmt mit dem Beleuchtungsverhältnis von Orekit { "12.2" } innerhalb von { "7.4e-9" } über { "2400" } Geometrien überein (<c22/>); seine Variante mit Randverdunkelung hat keine externe unabhängige Referenz (MODELLED). Die NRLMSISE-00-Luftwiderstandsstufe stimmt mit dem eigenen NRLMSISE-00-Luftwiderstand von Orekit { "12.2" } über { "24" } h auf { "0.03" } m überein, bei einer Luftwiderstandsverschiebung von bis zu { "142" } km (<c23/>, VALIDATED unter den gemeinsamen Konventionen). Ein Gegenvergleich mit GMAT (General Mission Analysis Tool) bleibt ein Folgeschritt.

# text
# c1: src/tides.rs
seg-46d06796e0e4 = Gezeiten auf dem Geopotenzial (<c1/>)

# text
seg-81b18c4caad3 = Zeitabhängige Korrekturen ΔC̄_nm, ΔS̄_nm an den Stokes-Koeffizienten (IERS Conventions { "2010" }, Kapitel { "6" }), validiert gegen die in den Konventionen selbst veröffentlichten Zahlen — nicht gegen ein anderes Werkzeug.

# text
seg-78dc5baf4d9d = Beitrag

# text
seg-7c6c910bbf89 = Feste Erdgezeit (IERS Gl. { "6.6" } / 6.8b / { "6.14" })

# text
# c1: tests/tides_iers.rs
seg-ac1dbcc895f0 = <c1/>: die permanente (Nullfrequenz-)Gezeit ΔC̄₂₀ liegt innerhalb von { "1" } % des vom IERS veröffentlichten −{ "4.1736" }×{ "10" }⁻⁹ (anelastische Love-Zahlen); das <b>Rechenbeispiel K1 aus Schritt 2 wird bitgenau reproduziert</b> (Sinus-/Kosinus-Amplituden { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² auf { "0.1" }×{ "10" }⁻¹²); der Pfad der normierten Legendre-Funktionen ist durch geschlossene Handwerte unabhängig von der Rekursion festgelegt.

# text
seg-f2e2c5334721 = Ozeangezeit (IERS Gl. { "6.15" }, FES2004 (Finite Element Solution { "2004" }, Gezeitenatlas), { "8" } Konstituenten)

# text
# c1: tools/gen_fes2004.py
# c2: src/fes2004_data.rs
seg-0369f153806f = Die eingebundene FES2004-Teilmenge (<c1/> → <c2/>, Einlesen Doodson→Multiplikator) reproduziert die Koeffizienten der Quelle für M2 ({ "2,2" }) exakt; die Doodson-Phase von K1 ist gleich θ_g + π; die sektorielle Größe vom Grad 2 ist physikalisch und eine Größenordnung unter der festen Gezeit.

# text
seg-52a19a291a41 = Atmosphärische Luftgezeit S2 (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

# text
seg-86b3d3a39bc7 = Die eingebundenen Harmonischen nach Ray werden über die Oberflächenlastbeziehung (Gl. { "6.21" }) in einen Spitzenwert ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ umgerechnet (~{ "10" } % des ozeanischen M2-Terms). Ehrlicher Vorbehalt: <b>Für die Luftgezeit gibt es keine veröffentlichte unabhängige Referenz für Geopotenzialkoeffizienten</b>, daher wird sie über Quellenintegrität + Größenordnung validiert, ein schwächeres Kriterium als bei den festen und ozeanischen Gezeiten.

# text
# c1: src/maneuver.rs
seg-63ac45ba51dc = Manöver und Trajektorienentwurf (<c1/>)

# text
seg-a2ff4b0619d4 = Impulsives ΔV + Kovarianzpropagation

# text
seg-12f469864d28 = Eine Geschwindigkeitsunstetigkeit mit mitgeführter Kovarianz { "6" }×{ "6" } (deterministischer Brennvorgang ⇒ Identitäts-STM (Zustandsübergangsmatrix); die Kovarianz des Ausführungsfehlers wird aus dem Brennsystem — ECI (Earth-centred inertial) oder LVLH (local vertical, local horizontal) — in den Geschwindigkeitsblock gedreht).

# text
seg-f3f0e4a7ec05 = Integration endlicher Brennvorgänge gegen Tsiolkovsky

# text
seg-f7b35b7acdba = Integration mit konstantem Schub über einen Brennbogen (Masse als Zustand), deren erreichtes ΔV mit der geschlossenen <b>Tsiolkovsky</b>-Raketengleichung auf <b>besser als { "0.01" } %</b> übereinstimmt.

# text
seg-46ae334a0604 = Rundlauf des Lambert-Lösers (Izzo { "2015" })

# text
# c1: r1
# c2: r2
# c3: v1
# c4: v2
# c5: r2
seg-3e2b483cd1b7 = Die Lambert-Ausgabe für eine Umdrehung (<c1/>, <c2/>, Flugzeit ⇒ <c3/>, <c4/>) wird <b>durch den exakten Kepler-Propagator in universellen Variablen im Rundlauf geführt</b> — sie muss wieder auf <c5/> landen.

# text
seg-04d69337acb3 = Porkchop-Durchlauf gegen die Hohmann-Untergrenze

# text
seg-fb5298b7983c = Das Minimum des Gitters C3 / Ankunfts-V∞ über Start × Ankunft wird gegen die <b>analytische Hohmann-Transfer-Untergrenze von C3</b> für zwei koplanare Kreisbahnen geprüft.

# text
seg-bf2eb36e3eb6 = Lambert-Löser gegen eine unabhängige Bibliothek

# text
# c1: tests/lambert_reference.rs
# c2: izzo2015
seg-40511ea76e12 = <c1/>: { "13" } Transfers mit einer Umdrehung von LEO über GEO bis heliozentrisch, prograd und retrograd, gegen lamberthub { "1.0.0" } <c2/>; schlechteste Differenz der Randgeschwindigkeit { "7e-12" } m/s.

# text
seg-164d7ea14d4e = Ehrlicher Geltungsbereich: kein Trajektorienoptimierer, keine Lambert-Zweige mit mehreren Umdrehungen und ein synthetisches koplanar-kreisförmiges heliozentrisches Modell (keine planetare DE-Ephemeride, daher wurde kein GMAT-Gegenvergleich für C3 Erde–Mars durchgeführt).

# text
# c1: src/orbit_determination.rs
# c2: src/batch_ls.rs
seg-9d2d78ad22c4 = Bahnbestimmung (OD) (<c1/>, <c2/>)

# text
seg-95d5ac7f6c29 = Gauss–Newton-Batch-Korrektor

# text
# c1: gauss_newton
# c2: a·exp(b·t)
seg-3fe29c4621b2 = Der generische Löser <c1/> erreicht bei einer linearen Anpassung die exakte gewichtete Kleinste-Quadrate-Lösung, gewinnt bei einer nichtlinearen Anpassung <c2/> die wahren Parameter zurück und löst eine räumliche 3-D-Entfernungsmultilateration aus rauschfreien Entfernungen.

# text
seg-b31d1ffa99b1 = Batch-Bahnbestimmung aus Entfernungen

# text
# c1: determine_orbit_batch
# c2: [r, v]
seg-0b37139dffa9 = <c1/> gewinnt <c2/> aus Entfernungsmessungen von Bodenstationen (propagiert über das Kraftmodell Zweikörper + J2) auf <b>unter einen Meter / mm·s⁻¹ aus rauschfreien Entfernungen</b> und auf <b>~{ "2" } m mit einem Post-Fit-Residuum am Rauschboden von { "5" } m</b> zurück — das Kennzeichen einer konsistenten Kleinste-Quadrate-Anpassung.

# text
seg-fb29199bf8bd = Sequenzielle OD (Unscented-Filter)

# text
# c1: determine_orbit_sequential
seg-3c1f33052d48 = <c1/> gewinnt rekursiv den Zustand auf einige zehn Meter genau zurück, bei derselben Dynamik und demselben Entfernungsmodell.

# text
seg-7a636cc9eef0 = Batch- und sequenzielle OD gegen einen unabhängigen Schätzer

# text
# c1: tests/batch_sequential_orbit_determination_reference.rs
seg-68bf6e73c582 = <c1/>: { "8" } Szenarien ({ "6" } rauschfreie LEO/MEO/exzentrische mit { "3" }–{ "4" } Stationen, { "2" } mit σ = { "5" } m) gegen die Batch-Kleinste-Quadrate- und Kalman-Schätzer von Orekit { "12.2" } bei angepasstem Kraftmodell; schlechtester Batch { "1e-3" } m / { "1e-6" } m/s, sequenziell { "0.9" } m.

# text
# c1: modelled
# c2: tests/od_tracking_measurements_reference.rs
# c3: xval/od-measurements-orekit/RESULTS.md
seg-55a86bc79831 = | Batch-OD mit Entfernungsrate / Az-El und Elevationsmaske | <c1/> (externer Vergleich, ein vorab festgelegter Zielwert verfehlt) | <c2/>: { "8" } Szenarien gegen die Batch-Kleinste-Quadrate-Schätzung von Orekit { "12.2" } mit benutzerdefinierten momentanen geometrischen Messungen; sichtbare Mengen identisch, Messwerte innerhalb von { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, Zustandsübergangsmatrix innerhalb von { "1.2e-14" }, verrauschte Zustände innerhalb von { "1.74" } cm und RMS je Typ innerhalb von { "2.7e-4" }; der vorab festgelegte Zielwert für rauschfreie Zustände ≤ { "1" } cm wird bei { "2" } von { "4" } Szenarien verfehlt ({ "1.46" } und { "1.74" } cm; die eigene Schätzung von Orekit liegt so weit von ihrer simulierten Wahrheit entfernt, die von kshana innerhalb von { "1e-8" } m). Siehe <c3/>. |

# text
seg-35a85fb744cd = Ehrlicher Geltungsbereich: Die Lehr-OD verwendet feste inertiale Stationen, ein topozentrisches System mit kugelförmiger Erde und momentane geometrische Messungen (keine Lichtlaufzeit, Aberration, Refraktion oder Erdrotation); die Zustandsübergangsmatrix des Pfads für Entfernungsrate/Winkel ist variationell (RK4-integriert mit analytischen Partiellen für Zweikörper + J2), nicht in geschlossener Form; es gibt keinen sequenziellen Filter für Entfernungsrate oder Winkel. Der Pfad nur mit Entfernung behält seine Jacobi-Matrix aus finiten Differenzen. (Die unten beschriebene Ephemeridenanpassung mit vollem Kraftmodell trägt ihre eigene variationelle Zustandsübergangsmatrix.)

# text
# c1: src/precise_od.rs
seg-8f425e278f7c = Validierung des Kraftmodells durch Ephemeridenanpassung (<c1/>)

# text
seg-9207d7139b87 = Ein präziser Batch-Kleinste-Quadrate-Schätzer für Positionsbeobachtungen mit vollem Kraftmodell: das tesserale Geopotenzial EGM2008 (im erdfesten System über die CIO-Reduktion ausgewertet), zusammengesetzt mit dem dritten Körper Sonne/Mond, SRP, Luftwiderstand, der Relativität nach Schwarzschild/Lense–Thirring (GR, general relativity) und den obigen Gezeiten, angepasst an eine Folge inertialer Positionsfixe mit einer Jacobi-Matrix aus der variationellen Zustandsübergangsmatrix. Validiert an <b>synthetischen</b> Daten, bei denen die Wahrheit Kshanas eigener Integrator ist, sodass jedes Residuum dem Schätzer und nicht der Dynamik zuzuschreiben ist.

# text
seg-fc676106563e = Zusammensetzung des präzisen Kraftmodells

# text
# c1: tests/precise_od_synth.rs
seg-57726d970436 = <c1/>: das Feld vom Grad 0 ist zu jeder Epoche die exakte Punktmasse (der zentrale Term ist rotationsinvariant); Grad 8 fügt die Abplattung des J2-Bands hinzu; die Sonne als dritter Körper und der Gezeitenterm werden bitgetreu eingebunden; eine konstante radiale empirische Beschleunigung ist in RTN (radial, transversal, normal) rein radial.

# text
seg-98b036354077 = Variationelle Zustandsübergangsmatrix

# text
seg-71787d9334db = Jede Spalte von Φ über eine halbe LEO-Bahn (Geopotenzial Grad 8 + Sonne + Mond) stimmt mit einer unabhängigen erneuten Propagation mit <b>zentralen finiten Differenzen (FD) über den ganzen Bogen</b> überein, auf <b>< { "1" }×{ "10" }⁻⁶ relativ</b> sowohl in der Positions- als auch in der Geschwindigkeitsantwort — der dokumentierte Gegenvergleich STM↔FD. Φ({ "0" }) = I; der erweiterte und der einfache Propagator stimmen auf unter einen Millimeter überein.

# text
seg-0b453776136b = Selbstrückgewinnung der Batch-KQ

# text
seg-c651db308332 = Ein Kshana-Bogen von 1 Stunde (Grad 6 + Sonne + Mond), rauschfrei beobachtet, wird aus einem Versatz von { "150" } m / { "0.1" } m·s⁻¹ auf den <b>Epochenzustand innerhalb von { "1" }×{ "10" }⁻² m</b> zurückgewonnen, mit nahezu null Post-Fit-RMS; bei weißem Rauschen von { "5" } m pendelt sich der Post-Fit-RMS in 3-D am <b>Rauschboden von ~σ</b> ein, unverzerrt. Der SRP-Wert <b>C_R wird von { "1.0" } auf innerhalb von { "1" } %</b> der Wahrheit von { "1.4" } zurückgewonnen.

# text
seg-06bd2857f832 = Ausreißerbereinigung und RTN-Berichte

# text
seg-8b9dea5c0727 = Ein grober Fehler von { "500" } m wird durch die 5-σ-Post-Fit-Bereinigung abgewiesen (genau eine Beobachtung), sodass eine saubere Anpassung im Millimeterbereich bleibt; Residuen werden zerlegt in radial/transversal/normal sowie in 3-D berichtet.

# text
seg-e3969a15df96 = Stufe der empirischen Beschleunigung (RTN konstant + 1-CPR (CPR: cycle-per-revolution))

# text
seg-c46af7926511 = Die neun a priori beschränkten empirischen Parameter bleiben bei empirikfreier Wahrheit unter { "1" }×{ "10" }⁻⁸ m·s⁻², ohne die Anpassung zu stören; eine in die Wahrheit eingespeiste konstante Querbahnbeschleunigung von { "3" }×{ "10" }⁻⁸ m·s⁻² wird auf innerhalb von { "20" } % zurückgewonnen.

# text
# c1: src/eop.rs
# c2: tests/agency_galileo.rs
# c3: tests/agency_swarm.rs
# c4: tests/agency_lro.rs
seg-fd79199b52d1 = Ehrlicher Geltungsbereich: Die synthetische Welle verwendet nominelle Erdorientierungsparameter (EOP: UT1 (Universal Time { "1" }, Erdrotationszeit) ≈ TT (Terrestrial Time), keine Polbewegung) — exakt für die Selbstrückgewinnung, da dasselbe Modell den Bogen erzeugt und anpasst. Die Validierungen mit Agenturdatensätzen legen <b>reale</b> EOP aus finals2000A und die Wahrheit aus SP3/SPK (SPK: Kernel für planetare Ephemeriden) über die CIO-Rahmenkette auf diese Engine (<c1/>, <c2/>, <c3/>, <c4/>).

# text
# c1: tests/agency_galileo.rs
# c2: tests/agency_swarm.rs
# c3: tests/agency_lro.rs
seg-934f0f8e4f5f = Reale präzise Bahnen der Agenturen (<c1/>, <c2/>, <c3/>)

# text
seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

# text
# c1: ESA0MGNFIN
# c2: C_R
# c3: C_R
# c4: workflow_dispatch
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-14a2999d0739 = Kshanas Engine mit vollem Kraftmodell, angepasst an einen unveränderten Ausschnitt der <b>eigenen Endbahn von ESA/ESOC (ESOC: European Space Operations Centre)</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) für Galileo <b>E11</b> über { "8" } h, wobei jeder ITRF-Fix mit realen EOP aus finals2000A nach GCRS gedreht wird: Post-Fit-<b>3-D-RMS { "0.133" } m</b> bei reiner Kraft + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> mit der empirischen Stufe, aus einer rohen Überlappung von { "78.7" } km. Der volle Bogen von { "24" } h liegt bei <b>{ "0.611" } m</b>. Alles weit innerhalb des Zielwerts von { "5" } m. Feldgravitation durch d/o-8 konvergiert (identisch bei d/o 8/10/12); der Job <c4/> führt das volle d/o-70 aus. Herkunft + SHA-256 (SHA: Secure Hash Algorithm) in <c5/>; vollständiger Nachweis in <c6/>.

# text
seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: C_R
# c3: 2.522
# c4: tests/fixtures/agency/NOTICE.md
# c5: docs/AGENCY-ORBIT-VALIDATION.md
seg-403b15ec1b9b = Engine mit vollem Kraftmodell (+ atmosphärischer Luftwiderstand), angepasst an einen unveränderten Ausschnitt der <b>eigenen reduziert-dynamischen präzisen Bahn von Swarm-A der ESA</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) über { "3" } h bei d/o-70, reale EOP aus finals2000A über die CIO-Kette: Stufe <b>dynamisch</b> (nur Zustand, statische Dichte, <c2/>={ "1" }) Post-Fit-<b>3-D-RMS { "2.687" } m</b> (RTN 0.925/<c3/>/0.045 m — Residuum ≈ reiner Luftwiderstand entlang der Bahn), Stufe <b>reduziert-dynamisch</b> (+ empirische CPR-Beschleunigungen) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm gegenüber der Bahn der ESA mit ~{ "2" } cm. Herkunft + SHA-256 in <c4/>; vollständiger Nachweis in <c5/>.

# text
seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter), Mond — validiert, über { "5" } m (ehrlich)

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: atol
# c4: xval/anise-lunar-od
# c5: tests/fixtures/agency/NOTICE.md
# c6: docs/AGENCY-ORBIT-VALIDATION.md
seg-d2be90186a89 = <b>Mondzentrierte</b> Anpassung des Kraftmodells (<c1/>): das GRAIL-Schwerefeld <b>GRGM660PRIM</b> (d/o { "100" }) im mondfesten Hauptachsensystem (<c2/>, IAU { "2015" } Mean-Earth + der feste Versatz DE421 (Development Ephemeris { "421" }) Mean-Earth → Hauptachsen (ME→PA), angewandt, wie SPICE ihn definiert, seit { "0.36" }: bis dahin wurde er in der falschen Richtung angewandt, um etwa { "208" }″ daneben), + Erde/Sonne als dritter Körper, angepasst durch <em>denselben</em> generischen Gauss–Newton-Schätzer wie die Erddatensätze an die reale <b>JPL-Horizons-LRO</b>-Bahn (NAIF −{ "85" }), rekonstruiert, { "4" } h / { "241" } Epochen, ~{ "98" } km. Ehrliches Post-Fit ({ "0.36" }): <b>dynamisch { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>reduziert-dynamisch { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2 empirische Terme je Umlauf), aus einer rohen Überlappung von { "39.9" } m (vor der ME→PA-Korrektur: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>über</b> dem Zielwert von < { "5" } m, nicht der Schätzer (identisch bei d/o 100/150 und <c3/> 1e-6/1e-9). Eine <b>Kreuzvalidierung in DE-Güte</b> (<c4/>: Mond-PA-Orientierung aus DE440 (Development Ephemeris { "440" }) + Ephemeride DE440 über ANISE) <b>korrigierte</b> die Aussage zum begrenzenden Faktor — sie ergab { "12.0" } m dynamisch und { "6.67" } m reduziert-dynamisch, was der korrigierte analytische Stapel nun in beiden Stufen erreicht (die frühere dynamische Lücke, { "12.6" } → { "12.0" } m, war der Fehler im ME→PA-Versatz), sodass die operative Untergrenze <b>nicht</b> die analytische Orientierung/Ephemeride ist, sondern ein in der empirischen Stufe nicht reduzierbares Residuum (am ehesten vereinbar mit nicht modellierter nichtgravitativer LRO-Dynamik über den kurzen Bogen); der schlanke analytische Stapel erreicht für die reduziert-dynamische Bahn bereits DE-Güte. Herkunft + SHA-256 in <c5/>; vollständiger Nachweis in <c6/>. <b>Gegen reale Wahrheit der Agenturen validiert: { "3" } von { "3" }; Zielwert < { "5" } m erreicht: { "2" } von { "3" }.</b>

# text
# c1: src/gravimeter.rs
# c2: src/mapmatch.rs
# c3: src/particle_filter.rs
# c4: src/altpnt/terrain.rs
seg-3d3cbf5f043d = Navigation mit Schwerekarte / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

# text
seg-89f2cbf55842 = Kugelflächenfunktions-Feld der Schwereanomalie

# text
# c1: src/gravimeter.rs
# c2: P̄₁₁ = √3·cosφ
# c3: P̄₂₀ = (√5/2)(3sin²φ−1)
# c4: P̄₂₂ = (√15/2)cos²φ
seg-76cae5c530f2 = <c1/>: ein vollständig normiertes Feld niedrigen Grades, geprüft gegen die geschlossenen Legendre-Funktionen (<c2/>, <c3/>, <c4/>) und eine von Hand hergeleitete Anomalie eines einzelnen Terms von { "1.897" } mGal.

# text
seg-f00f82b70e6e = Messmodell des Kaltatom-Gravimeters

# text
# c1: σ = ASD/√τ
seg-49090598c525 = Der Boden des weißen Rauschens wird aus der ASD des CAI-Beschleunigungsmessers (<c1/>) abgeleitet und als deterministische, mit Seed erzeugte Folge eingespeist (dem Matcher wird nie rauschfreie Wahrheit übergeben, dennoch ist der Lauf bitgenau reproduzierbar).

# text
seg-0556db62c45f = Partikelfilter mit sequenziellem Importance-Resampling

# text
# c1: src/particle_filter.rs
seg-3df4251aedbd = <c1/>: der deterministische Kern ist exakt festgelegt — ESS (effective sample size) von { "1" } bis N, systematisches Resampling, das Indizes proportional zum Gewicht wählt, die konvexe Kombination des gewichteten Mittels, eine Gauß-Likelihood, die die Schätzung auf die Messung zieht, und der Determinismus der Vorhersage mit Seed.

# text
seg-7dca80b16a00 = Likelihood des Kartenabgleichs + Wiederfinden

# text
# c1: src/mapmatch.rs
# c2: field_likelihood
# c3: e^(−½)
seg-eb40ab2607ae = <c1/>: <c2/> hat bei perfekter Übereinstimmung sein Maximum (= { "1" }) und fällt bei einer Sigma auf <c3/>; ein Partikelfilter über einem markanten synthetischen Geländeausschnitt gewinnt die wahre Position auf { "0.1" } genau zurück.

# text
seg-446d9f03a860 = Benchmark von 60 Minuten ohne GPS

# text
# c1: run_gps_denied_gravity_nav
# c2: scenarios/gps-denied-gravity-nav.toml
seg-ed29fb24d9d5 = <c1/> (<c2/>): ein Ausfall von ~{ "700" } km / einer Stunde, bei dem die Inertiallösung auf <b>≈ { "70" } km</b> abdriftet, wird von einem hierarchischen Matcher von grob zu fein auf <b>≈ { "145" } m (< { "500" } m)</b> zurückgeholt — bitgenau reproduzierbar, stabil über Rauschrealisierungen und nachweislich durch die Verfeinerung begrenzt (ein einzelnes grobes Gitter bleibt bei ~{ "2" } km stehen).

# text
# c1: .hgt
seg-81a2963c26cc = Lader für SRTM-<c1/>-DGM (SRTM: Shuttle Radar Topography Mission; DGM: digitales Geländemodell) + bilineare Abtastung (ORACLE A)

# text
# c1: src/altpnt/terrain.rs
# c2: tests/terrain_nav_validation.rs
# c3: .hgt
# c4: tools/gen_terrain_fixture.py
# c5: tests/fixtures/terrain/N36W117_sub6.hgt
# c6: real_srtm_committed_badwater_tile_reads_real_relief
# c7: #[ignore]
seg-5e7bbf951faf = <c1/> / <c2/>: ein von Hand gebauter <c3/>-Puffer { "2" }×{ "2" } mit den Ecken [{ "100,200" };{ "300,400" }] wird bilinear zu <b>genau { "250.0" }</b> in der Zellmitte interpoliert (geschlossene unabhängige Referenz), der Rundlauf in 16-Bit-Big-Endian ist exakt, und die Zeilenspiegelung legt die nördlichste Dateizeile auf die höchste gespeicherte Breite — alles gegen die <b>Treiberspezifikation SRTMHGT (Shuttle Radar Topography Mission, Höhendateiformat) von GDAL (Geospatial Data Abstraction Library)</b> (16 Bit vorzeichenbehaftet Big-Endian, zeilenweise, Nordzeile zuerst, Lücke -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). Ein eingecheckter Prüfkörper { "11" }×{ "11" } (<c4/>) übt den Parser in CI; und eine <b>eingecheckte reale gemeinfreie SRTM-v3-Kachel von NASA/USGS (USGS: United States Geological Survey)</b> (N36W117, Death Valley, auf 6 Bogensekunden dezimiert, { "722" } KB, <c5/>) wird in CI gelesen (nicht ignoriert, <c6/>) und setzt das <b>Badwater-Becken auf ≈ −{ "78" } m innerhalb des dokumentierten Bandes [−{ "95" },−{ "70" }] m</b> (Vermessung von NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m), mit dem Kachelmaximum bei ≈ { "2161" } m — Quelle der Wahrheit ist die Vermessung, das DGM wird geprüft (nicht zirkulär). Größere veröffentlichte Punkthöhen (Mount Whitney { "4421" } m) bleiben in den mit <c7/> gesperrten Tests ganzer Kacheln.

# text
seg-80f985ea3e11 = Konvergenz der geländegestützten Navigation (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) (ORACLE B)

# text
# c1: run_terrain_nav
# c2: scenarios/terrain-nav.toml
# c3: search_step/factor² ≈ 140 m
seg-9ad7bf3a8c3e = <c1/> (<c2/>): eine <b>von Hand hergeleitete</b> eingespeiste INS-Drift ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km bei ~{ "12" }° Breite, berechnet als Drift° × M_pro_Grad × cos Breite) wird auf <b>< { "500" } m</b> zurückgewonnen (innerhalb der Untergrenze durch die Gitterauflösung <c3/>), ein Rückgang um > { "100" }× gegenüber frei laufender Inertialnavigation — geprüft gegen die <em>eingespeiste</em> Zahl, nie gegen das DGM (nicht zirkulär), bitgenau reproduzierbar und stabil über Rauschseeds.

# text
seg-5b7c1dc72436 = Fusionsgewinn aus kombinierter Schwere+Magnetik+Gelände (ORACLE C)

# text
# c1: run_combined_altpnt
# c2: scenarios/combined-altpnt.toml
seg-7e3818f2ee2b = <c1/> (<c2/>): drei skalare Kanäle (Δg · |B| Krustenanomalie · Höhe), als Produkt-Likelihood fusioniert, ergeben ein <b>beschränktes Residuum < { "500" } m</b> über den Ausfall von 60 min, das, über Seeds gemittelt, <b>nicht schlechter als der beste Einzelkanal</b> ist (Additivität der Information / niedrigere CRLB (Cramér–Rao lower bound)). Liegt im veröffentlichten Bereich „einige zehn Meter“ CEP (circular error probable) von TERCOM / geländegestützter Navigation (TRN) (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

# text
# c1: .hgt
# c2: #[ignore]
# c3: kind=
# c4: gravity-map
# c5: terrain-nav
# c6: combined-altpnt
seg-fe23ff839bce = Ehrlicher Geltungsbereich: Das Schwerefeld ist von niedrigem Grad + synthetische Massenkonzentrationen, <b>nicht</b> der volle Koeffizientensatz von EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); der Magnetkanal sitzt auf dem glatten IGRF-Hauptfeld plus <b>synthetischen</b> Krustenanomalie-Massenkonzentrationen (eine reale hochfrequente Krustenkarte ist ein Folgeschritt); das CI-Geländefeld für die Benchmarks der <em>Navigationsfixes</em> ist das in sich geschlossene synthetische DGM, während der Leser <c1/> selbst nun in CI gegen eine eingecheckte reale SRTM-v3-Kachel validiert wird (oben); die realen Kacheln in voller Auflösung bleiben mit <c2/> gesperrt. Eine Monte-Carlo-Untersuchung des Fehlers der Kartendarstellung bleibt ein Folgeschritt. Alle drei Navigatoren sind nun in die Szenario-Engine mit <c3/> eingebunden (<c4/>, <c5/>, <c6/>).

# text
# c1: src/inertial/
seg-d9f7e199e5d0 = Fehlermodell von INS / IMU — Validierung gegen Datenblätter (<c1/>)

# text
# c1: N
# c2: tests/imu_allan_spec.rs
seg-48266c2faaed = Das stochastische Fehlermodell der IMU wird gegen <b>veröffentlichte Datenblatt-/Datensatzspezifikationen der Hersteller</b> validiert — nie gegen einen Wert, den Kshana selbst erzeugt hat. Die Brücke von einer Spezifikation in Feldeinheiten zum Rauschmodell im SI (International System of Units) ist die übliche Identifikation über die Allan-Abweichung (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): Der Random-Walk-Koeffizient <c1/> ist die überlappende ADEV, abgelesen bei τ = { "1" } s auf der Steigung τ⁻¹ᐟ², und der Bias-Instabilitäts-Koeffizient ist das flache Allan-Plateau (<c2/>, hermetisch — kein Download).

# text
seg-702de63000d2 = Nachweis / unabhängige Referenz

# text
seg-c3fed48b98b1 = Schicht zur Einheitenumrechnung (das größte Risiko der Zirkularität: Nr. 1)

# text
seg-6cdc88d36bfd = Von Hand geprüft: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

# text
seg-75afa5abcd08 = Winkel-Random-Walk des Gyros

# text
seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (Datenblatt von Analog Devices), aus ADEV({ "1" } s) auf < { "5" }% zurückgewonnen.

# text
seg-c5e2d361b83f = Geschwindigkeits-Random-Walk des Beschleunigungsmessers

# text
seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr auf < { "5" }% zurückgewonnen.

# text
seg-ebeb0bb0e0fb = Allan-Steigung des weißen Rauschens

# text
seg-f674ce82dc2c = ADIS16460, Steigung des weißen Zweigs im Log-Log-Diagramm −{ "0.5" } ± { "0.05" }.

# text
seg-40afd130f31d = Plateau der Bias-Instabilität im Lauf

# text
seg-94acb18a94cb = ADIS16465, Bias-Instabilität (BI) des Gyros { "2.0" } deg/hr, als flaches Allan-Minimum auf < { "15" }% zurückgewonnen.

# text
seg-b359e0e92e20 = Zweites IMU-Profil

# text
seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr), beide auf < { "5" }% zurückgewonnen.

# text
# c1: KSHANA_KFGINS_DIR
seg-fea9287d6533 = Ehrlicher Geltungsbereich: Dies validiert das <b>stochastische Fehlermodell</b> gegen Allan-Koeffizienten aus Datenblättern. Der Fahrzeugdatensatz <b>KF-GINS</b> von i2Nav-WHU (WHU: Wuhan University) wird als separate, datengesteuerte Prüfung verwendet: Der lose gekoppelte EKF mit geschlossener Schleife und Fehlerzustand mit dem GNSS-Hebelarmmodell ist eine VALIDATED-Zeile der <a1>Verifikationsmatrix</a1> (<em>Lose gekoppelter GNSS/INS-EKF mit Hebelarm auf dem Datensatz KF-GINS</em>), verglichen mit der C++-Referenztrajektorie von KF-GINS unter Zielwerten, die vor dem Lauf registriert wurden. Er läuft nur dort, wo der Datensatz bereitgestellt wird (<c1/>); ohne ihn laufen die synthetischen Lader- und Hebelarmtests. Die eng gekoppelten Varianten und die Trägerphasenvarianten werden von dieser Zeile nicht abgedeckt (die Zeile für eng gekoppeltes GNSS/INS mit Trägerphase ist MODELLED).

# text
# c1: src/body.rs
# c2: src/mars_frame.rs
# c3: src/ephem_provider.rs
# c4: src/radiometric.rs
# c5: src/timescales.rs
seg-f0ab98c1a79d = Deep-Space- und Mars-PNT — D0-Fundament (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-bd222b27949c = Der erste Meilenstein der Deep-Space-Navigations-Engine: Verallgemeinerung des fest auf die Erde verdrahteten Kerns auf einen beliebigen Zentralkörper, Hinzufügen der Marsdynamik, einer Schnittstelle für Ephemeriden-Anbieter, einer Zeit im Submikrosekundenbereich sowie der Primitive für Lichtlaufzeit / relativistische Verzögerung. <b>Jedes bestehende Erdszenario ist byte-identisch</b> — die plattformübergreifenden Reproduzierbarkeits-Goldens (<c1/>, <c2/>) laufen unverändert und ohne Neuerzeugung durch, bei jedem Commit erzwungen.

# text
seg-e0cdbfcbb28a = Abstraktion des Zentralkörpers (Erde byte-identisch)

# text
# c1: src/body.rs
# c2: Body{mu,re,zonals,gravity,rotation,IAU-pole}
# c3: earth()/mars()/moon()/sun()
# c4: tests/mars_dynamics.rs
# c5: two_body_accel_body(r,&Body::earth())
# c6: zonal_accel_body
# c7: assert_eq!
# c8: ForceModel
seg-7d20649189fa = <c1/>: <c2/> mit <c3/>. <c4/> stellt sicher, dass <c5/> und <c6/> den älteren Erdfunktionen mit <b>exakter Bitgleichheit</b> entsprechen (<c7/>), und ein Erdbogen mit <c8/> im Standard ist byte-identisch — die Reproduzierbarkeits-Goldens sind unverändert (gleicher SHA, keine Neuerzeugung).

# text
seg-658acc8112e3 = Marsgravitation (GMM-3 (GMM: Goddard Mars Model) tesseral, körperfest)

# text
# c1: Body::mars_gmm3(nmax)
# c2: C̄n0=−Jn/√(2n+1)
# c3: tests/mars_dynamics.rs
# c4: .gfc
# c5: gravity_sh::from_gfc
seg-9b058665cf4b = <c1/>: Zonale Terme C̄20/C̄30/C̄{ "40" } aus J2/J3/J4 von MRO110 (Schwerefeldlösung des Mars Reconnaissance Orbiter) (<c2/>, J2 läuft im Rundlauf auf { "1.9604e-3" }) + sektorielle/tesserale Terme C̄22/S̄{ "22" }, C̄32/S̄{ "32" } aus MRO110B2 (Konopliv et al. { "2011" }; tabelliert in Liu, Baoyin & Ma { "2012" }), ausgewertet im körperfesten IAU-Marssystem. <c3/> prüft den Rundlauf, die Abweichung von der Punktmasse in der Größenordnung von J2 und dass das Feld tatsächlich körperfest ist (eine Neuausrichtung um einen Viertel-Marstag ändert die inertiale Beschleunigung). Höherer Grad/Ordnung wird aus einer eingebundenen Datei <c4/> über <c5/> geladen.

# text
seg-1dcbee768418 = Körperfestes Marssystem (IAU-Pol)

# text
# c1: src/mars_frame.rs
# c2: R3(W)·R1(90°−δ0)·R3(90°+α0)
# c3: lunar_frame.rs
# c4: prime_w_dot
seg-0708e5b37d69 = <c1/>: die IAU-Rotation 3-1-3 <c2/> (Konvention WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), dieselbe wie in <c3/>). Tests: orthonormal auf { "1e-12" } mit det +{ "1" }, Rundlauf-Identität, der Nullmeridian schreitet mit <c4/> pro Tag fort.

# text
seg-5b6355a143c7 = Propagation um den Mars / um die Sonne

# text
# c1: validated
seg-4ab87f666765 = <c1/> (Selbstkonsistenz)

# text
# c1: tests/mars_propagation.rs
seg-12e3d173340b = <c1/>: eine niedrige Marsumlaufbahn kehrt nach einer Keplerschen Periode zum Start zurück (Schließung); die spezifische Energie ε=v²/2−μ/r driftet über den Bogen um <{ "1e-9" }; die säkulare Knotenregression durch Mars-J2 entspricht der analytischen Rate nach Vallado (unabhängig berechnet ≈ −{ "5.15" } °/Tag bei { "60" }° Inklination) auf { "3" }%; eine heliozentrische Bahn gewinnt das Marsjahr von ~687 Tagen zurück (Vis-Viva + unabhängige Periodenrückgewinnung aus dem Bogen). Keine externen Daten.

# text
seg-acff4c016089 = Kreuzvalidierung mit DE440 (heliozentrischer Mars)

# text
# c1: xval/anise-mars-od/
# c2: xval/anise-lunar-od
# c3: de440s.bsp
# c4: c1c7fee…b260a49f2
# c5: $KSHANA_ANISE_DE440S
# c6: workflow_dispatch
seg-ed164e298754 = <c1/> (vom Workspace AUSGESCHLOSSEN; ANISE unter MPL-2.0 auf sein eigenes Cargo.lock beschränkt; spiegelt <c2/>): vergleicht Kshanas sonnenzentrierte Marspropagation mit JPL DE440 (über ANISE), Horizons-Wahrheit wörtlich zitiert (Herkunft + SHA-256). <b>Reproduziertes Ergebnis</b> (Start-JD (Julianisches Datum) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): Positionsresiduum <b>{ "137" } m @ Bogen von 1 Tag</b> ({ "5.97" }×{ "10" }⁻¹⁰ des heliozentrischen Abstands von { "2.299" }×10¹¹ m), wachsend auf { "3.3" } km @ { "5" } d, { "87.9" } km @ { "30" } d, { "1.71" } Mm @ { "90" } d — das Residuum <em>wächst</em> mit der Bogenlänge, weil ein sonnenzentriertes Zweikörpermodell die planetaren Störungen (vor allem durch Jupiter) und die interne Bewegung des Marssystems, die die Schwerpunktsephemeride DE440 enthält, bewusst weglässt; das Wachstum ist also die ehrliche Signatur der nicht modellierten n-Körper-Dynamik, kein Integratorfehler; ein kurzer Bogen, der ein winziger Bruchteil des heliozentrischen Abstands bleibt, bestätigt, dass die sonnenzentrierte Mechanik korrekt ist. Läuft nur, wenn der DE440-Kernel vorhanden ist (<c5/> oder automatisch geladen, ~{ "32" } MB) — eine manuelle Prüfung / Prüfung über <c6/> in DE-Güte, <b>kein</b> Standard-CI-Gate, sodass das veröffentlichte Crate und jedes Standard-Gate byteweise unberührt bleiben.

# text
seg-a7d79066a53b = Lichtlaufzeit + Shapiro-Verzögerung

# text
# c1: src/radiometric.rs
seg-798148171dab = <c1/>: die iterative Lösung der Lichtlaufzeit zur retardierten Epoche (konvergiert |Δτ|<{ "1e-12" } s, begrenzt) und die Shapiro-Verzögerung Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Tests: Erde–Sonne ≈ { "499" } s und Erde–Mond ≈ { "1.28" } s über die eingebaute Ephemeride; ein synthetischer Sender mit konstanter Geschwindigkeit gewinnt die analytische retardierte Lösung auf <{ "1e-9" } s zurück (Löser nachweislich unabhängig von jeder realen Ephemeride); Shapiro trifft einen von Hand berechneten Wert exakt und ergibt ~{ "100" }–{ "250" } µs für einen streifenden Strahl bei oberer Konjunktion Erde–Mars.

# text
seg-1bc28f6bdc8f = Schnittstelle für Ephemeriden-Anbieter

# text
# c1: src/ephem_provider.rs
# c2: trait EphemerisProvider
# c3: BuiltinEphemeris
# c4: None
# c5: LunarEnvironment
# c6: AniseLunarEnvironment
seg-34d6a07ad252 = <c1/>: <c2/> + kernelfreies <c3/> (Montenbruck–Gill Sonne/Mond, geozentrisch); gibt <c4/> für Körper zurück, für die es keine Reihe hat (z. B. Mars), für die der ANISE-Anbieter in DE-Güte der Weg ist — dieselbe Trennung zwischen eingebaut und ANISE wie bei <c5/>/<c6/>.

# text
seg-5e1fed7a98c0 = Zeit in zwei Teilen + TT↔TDB

# text
# c1: src/timescales.rs
# c2: TwoPartJd{day,frac}
# c3: tt_to_tdb
# c4: tdb_to_tt
seg-5ebca9b5f2db = <c1/>: ein <c2/> mit Knuth-Two-Sum-Akkumulation gewinnt Intervalle im Submikrosekundenbereich zurück, die das einzelne f64-JD nahe J2000 verliert (>{ "1000" }× besser, getestet); <c3/>/<c4/> verwenden die dominante periodische Reihe nach Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, von Hand bei J2000 verifiziert). Additiv — der bestehende Zeitpfad mit einzelnem f64 ist unverändert.

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
seg-d2da2e1d1711 = Radiometrische Observablen im Deep Space & CCSDS Tracking Data Message — D1 (<c1/>, <c2/>)

# text
# c1: sigma
seg-b98f508f2375 = Der zweite Meilenstein der Deep-Space-Navigations-Engine: das <b>Observablenmodell</b>, das den Kernel für Lichtlaufzeit/relativistische Verzögerung aus D0 in die tatsächlichen Größen überführt, die ein Tracking-Durchgang des Deep Space Network (DSN) oder von ESTRACK (European Space Tracking network) meldet — Entfernung, Doppler in Ein-/Zwei-/Dreiwegeausführung, kohärente Transponder-Umsetzung, regenerative/PN-Entfernungsmessung (PN: pseudo-noise), Δ-DOR (DOR: differential one-way ranging) und die Ausbreitungsmedien — sowie die Ein-/Ausgabe der <b>Tracking Data Message (TDM) nach CCSDS (Consultative Committee for Space Data Systems) 503.0-B</b>, die eine standardisierte Tracking-Datei der Agenturen einliest/ausgibt. <b>Ehrlicher Geltungsbereich:</b> Dies sind <b>exakte geometrische Modelle</b> nach den Konventionen von Moyer / CCSDS; das <em>Messrauschen</em> ist das vom Aufrufer gelieferte <c1/> je Beobachtung und nicht im Modell eingebaut. Einen <em>bestimmten realen Tracking-Durchgang</em> zu reproduzieren, erfordert reale TDM-Daten plus den Löser für die Deep-Space-Bahnbestimmung — das ist <b>D2</b>, nicht D1. Alles Folgende ist additiv (die Reproduzierbarkeits-Goldens sind unverändert; gleicher SHA, keine Neuerzeugung).

# text
seg-d1d2dc7906c8 = Entfernung & Doppler in 1/2/3 Wegen (Zwei-Strecken-Lösung nach Moyer)

# text
# c1: src/radiometric.rs
# c2: one_way_range
# c3: two_way_range
# c4: ρ₂ = c·(τ_up + τ_down)
# c5: one_way_doppler
# c6: two_way_doppler
# c7: three_way_doppler
# c8: f_D = −(M·f_ul/c)·(ρ̇_up + ρ̇_down)
# c9: c·τ
# c10: −(f/c)·ρ̇
seg-e2176b844df8 = <c1/>: <c2/>/<c3/> setzen die retardierte (Abwärtsstrecke) und die vorgezogene (Aufwärtsstrecke) Lichtlaufzeitlösung aus D0 zusammen; die Konvention für den vollen Hin- und Rückweg ist <c4/> (m), dokumentiert und konsistent. <c5/>/<c6/>/<c7/> bilden die Trägerverschiebung <c8/> (Hz) aus der Entfernungsrate in Sichtlinie, <b>Vorzeichenkonvention: Ein sich näherndes Raumfahrzeug ergibt eine positive (blaue) Verschiebung</b>. Tests: Zweiwege-Entfernung = Summe der Strecken auf <{ "1" } mm (~{ "2" } AU Hin- und Rückweg Erde–Sonne); Einwege-Entfernung = <c9/> exakt; der Einwege-Doppler entspricht dem analytischen <c10/> für einen radialen Sender mit konstanter Geschwindigkeit auf ppt; Dreiwege mit am selben Ort liegenden Stationen fällt byteweise auf Zweiwege zusammen.

# text
seg-638697be5b5b = Kohärente Transponder-Umsetzung (exakte DSN-Verhältnisse)

# text
# c1: turnaround_ratio
# c2: M = f_down/f_up
# c3: two_way_doppler_coherent
# c4: two_way_doppler
seg-781aa4041c58 = <c1/>: die exakten rationalen Umsetzungszahlen von DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 Modul 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Auf exakte Gleichheit getestet; ein nicht definiertes Bandpaar <b>löst Panic aus</b> (laut fehlschlagend, erfindet nie ein Verhältnis). <c3/> wendet Bandträger + Verhältnis durchgängig an und entspricht dem expliziten <c4/> auf Maschinengenauigkeit.

# text
seg-f24f9da1570c = Regenerative / PN-Entfernungsmessung (CCSDS { "414" }; Mehrdeutigkeit)

# text
# c1: src/radiometric.rs
# c2: regenerative_range_ambiguity
# c3: c/(2·chip_rate)
# c4: pn_range_ambiguity
# c5: c·L/(2·f_chip)
seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (die eindeutige Entfernung in der Größenordnung der Auflösung je Chip) und <c4/> = diese × Codelänge (die eindeutige Entfernung des vollen PN-Codes <c5/>), nach CCSDS 414.1-B. Getestet: Eine Entfernungsuhr von { "1" } MHz ergibt ~{ "149.9" } m; der gewichtete Abstimmungs-PN-Code nach CCSDS-414.1 ({ "1 009 470" } Chips) bei { "1" } Mchip/s ergibt die eindeutige Entfernung des Entwurfs von ~{ "151 000" } km; eine Verdopplung der Chiprate halbiert die Mehrdeutigkeit je Chip.

# text
seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, Himmelsebene)

# text
# c1: delta_dor
# c2: Δτ = −B⃗·(ŝ_sc − ŝ_quasar)/c
# c3: B⃗
# c4: −B·sin(Δθ)/c
# c5: |Δτ| ≈ B·Δθ/c
seg-93055e944306 = <c1/>: die differenzielle Verzögerung in der Himmelsebene <c2/> (s) für eine Interferometer-Basislinie <c3/> (CCSDS 506.1-B). Getestet: stimmt mit der exakten analytischen Projektion <c4/> für einen bekannten, an der Basislinie ausgerichteten Versatz auf { "1e-15" } s überein, ebenso mit der Größe bei kleinen Winkeln <c5/> und dem <b>Nullfall</b> (ein mit dem Quasar gleich ausgerichtetes Raumfahrzeug ergibt genau null differenzielle Verzögerung).

# text
seg-4e5258bb04d5 = Plasma-Kalibrierung 1/f² mit zwei Frequenzen

# text
# c1: src/radiometric.rs
# c2: solar_plasma_delay
# c3: K_PLASMA·TEC/(c·f²)
# c4: 1/f²
# c5: K_PLASMA = 40.3 m·Hz²·TECU⁻¹
# c6: coronal_tec_from_sep
# c7: TEC ∝ 1/sin(SEP)
# c8: dual_freq_plasma_calibration
# c9: K_disp = (Δt_X−Δt_Ka)/(1/f_X²−1/f_Ka²)
# c10: d_X/d_Ka = (f_Ka/f_X)²
# c11: dual_frequency_recovers_injected_plasma
seg-e3b340103825 = <c1/>: <c2/> = <c3/> (die dispersive Gruppenlaufzeit geladener Teilchen <c4/>, <c5/>); <c6/> die Koronasäule <c7/> der Klasse Cassini (analytischer Ersatz, keine kalibrierte Korona); <c8/> die Dispersionsinversion <c9/>, mit der das DSN Plasma entfernt. Getestet: das 1/f²-Gesetz <c10/>; die Korona steigt zur Konjunktion hin an; und ein <b>eingespeistes TEC wird auf <{ "1" } % zurückgewonnen</b> (tatsächlich ≪ { "1e-9" } rauschfrei) — <c11/>.

# text
seg-e1e265ab499a = Tropo-/Ionosphären-Medien (Wiederverwendung der GNSS-Modelle)

# text
# c1: tropo_delay
# c2: iono_delay
# c3: gnss_sim::tropo_delay_m
# c4: gnss_sim::klobuchar_delay_m
seg-2d9aa52f318b = <c1/>/<c2/>: das Bodenstationssegment im Deep Space durchquert dieselbe Erdatmosphäre, die das GNSS-Paket bereits modelliert, daher delegieren diese an <c3/> (Saastamoinen-Zenit + Niell-Abbildung, nicht dispersiv) und <c4/> (Broadcast-Ionosphäre). Getestet verdrahtet + physikalisch mit richtigem Vorzeichen: Tropo positiv und bei niedriger Elevation größer als im Zenit; Iono eine nicht negative Schrägverzögerung (die numerische Treue liefern die eigenen, auf Datenblätter bezogenen Tests des GNSS-Pakets).

# text
seg-44ba6e0411fd = CCSDS-TDM { "503" } Einlesen / Ausgeben + radiometrische Brücke

# text
# c1: src/ccsds_tdm.rs
# c2: META_START…META_STOP
# c3: DATA_START…DATA_STOP
# c4: RANGE
# c5: DOPPLER_*
# c6: ANGLE_*
# c7: *_FREQ
# c8: #[cfg(test)]
# c9: tests/fixtures/deepspace/reference.tdm
# c10: to_radiometric_obs
# c11: RANGE
# c12: DOPPLER_*
# c13: RadiometricObs
# c14: PATH
# c15: 1,2
# c16: 1,2,1
# c17: 1,2,3
# c18: TRANSMIT_BAND
# c19: sigma
# c20: 0.0
seg-18eafe936dcb = <c1/>: ein Leser <b>und</b> Schreiber für CCSDS 503.0-B-2 KVN (keyword-value notation) (Header + Segmente <c2/> / <c3/>; Datensätze <c4/>/<c5/>/<c6/>/<c7/>). Tests (<c8/> + <c9/>): Der Referenz-Prüfkörper wird zu den erwarteten benannten Feldern eingelesen; <b>Einlesen→Ausgeben→Einlesen ist eine gleiche Struktur</b> (semantischer Rundlauf); die Brücke <c10/> bildet die eindeutigen Datensätze <c11/>/<c12/> auf <c13/> ab (Weg aus <c14/> <c15/>/<c16/>/<c17/>, Band aus <c18/>, km→m); eine Datei mit mehreren Segmenten setzt den Zustandsautomaten zurück. <b>Ehrlich überspringen statt raten:</b> Winkel/Frequenzen, unbekannte Bänder, Epochen als Tag des Jahres und nicht erkannte Zeitsysteme werden <b>übersprungen</b>, nie falsch abgebildet, und <c19/> bleibt <c20/>, damit der Aufrufer gewichten kann.

# text
seg-e8ca55dd29b1 = DSN/ESTRACK-Benchmark (Modellpräzision ≫ veröffentlichter Boden)

# text
# c1: tests/radiometric_benchmark.rs
# c2: v/(1+v/c)
seg-247b9e7b2be8 = <c1/>: die Observablen sind exakte geometrische Berechnungen, daher ist der ehrliche Benchmark, dass der <b>eigene numerische Fehler des Modells weit unter dem veröffentlichten Messboden von DSN/ESTRACK liegt</b> — das Modell ist nicht der Engpass der Genauigkeit, das ist das vom Aufrufer gelieferte σ. Jeder Test berechnet eine Observable auf zwei unabhängigen Wegen (oder gewinnt eine eingespeiste Wahrheit zurück) und stellt sicher, dass das Residuum unter dem Boden liegt: <b>Entfernung</b> läuft im Rundlauf auf <{ "1" } mm ≪ den Boden der PN-Entfernungsmessung von ~{ "1" } m (DSN 810-005 Mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> stimmt mit der exakten geschlossenen retardierten Entfernungsrate <c2/> auf ~{ "10" }⁻⁶ m/s überein, mehrfach unter dem Boden im X-Band von ~{ "0.05" } mm/s (DSN 810-005 Mod. { "203" } / Moyer) — das Residuum ist der Boden der f64-Entfernungsdifferenzbildung bei ~{ "1" } AU, eine numerische Eigenschaft, kein Modellierungsfehler; <b>Δ-DOR</b> reproduziert die geschlossene Projektion auf einen äquivalenten Winkel in der Himmelsebene ≪ { "1" } nrad ≪ den Boden von ~{ "1" }–{ "10" } nrad (DSN 810-005 Mod. { "210" } / CCSDS 506.1-B); die Zwei-Frequenz-Messung von <b>Plasma</b> gewinnt die eingespeiste Verzögerung auf ≪ { "1" } % zurück; und die <b>Shapiro</b>-Verzögerung liegt im veröffentlichten Band von ~{ "100" }–{ "250" } µs bei Konjunktion Erde–Mars. Die veröffentlichten Zahlen sind als <b>Größenordnungen</b> der DSN-Spezifikationen angegeben und bezeichnet, nicht als erfundene exakte Zahlen, und die Moduldokumentation stellt ausdrücklich klar, dass dies die MODELLPRÄZISION prüft, nicht die Reproduktion eines realen Durchgangs (das ist D2 + reale TDM).

# text
# c1: src/deepspace_od.rs
# c2: src/clock_state.rs
# c3: src/mars_atmos.rs
seg-2a25e6a8a5b1 = Reduziert-dynamische Bahnbestimmung im Deep Space — D2 (<c1/>, <c2/>, <c3/>)

# text
# c1: xval/anise-mars-od
seg-0d7a1b75a0ea = Der dritte Meilenstein der Deep-Space-Navigations-Engine: der <b>Schätzer</b>, der die radiometrischen Observablen aus D1 in eine zurückgewonnene Trajektorie überführt — ein numerisch robuster Square-Root Information Filter (SRIF) mit reduziert-dynamischen empirischen Beschleunigungen, einer Bordzeituhr mit drei Zuständen, einem Mars-Luftwiderstandsmodell und den radiometrischen Messpartiellen, die Entfernung/Doppler mit dem Filterzustand verbinden, durchgängig geschlossen durch eine synthetische Rückgewinnung der Bahnbestimmung in einer niedrigen Marsumlaufbahn (LMO). <b>Ehrlicher Geltungsbereich:</b> Die Rückgewinnung ist ein <b>synthetischer geschlossener Regelkreis</b> (Wahrheit und Filter teilen denselben Mars-Propagator, und die Beobachtungen sind dasselbe geometrische Observablenmodell, das der Filter invertiert, plus eingespeistes Gauß-Rauschen) — sie validiert die <b>Mechanik des Schätzers</b>, nicht die absolute Treue des Kraftmodells des Mars; der externe Gegenvergleich in DE-Güte ist das durch Kernel gesperrte Crate <c1/> (D0.8b). Alles Folgende ist additiv (die Reproduzierbarkeits-Goldens sind unverändert; gleicher SHA, keine Neuerzeugung).

# text
seg-51f203291066 = SRIF-Kern (Square-Root-Informationsfilter)

# text
# c1: Srif
# c2: R
# c3: Λ = RᵀR
# c4: b
# c5: Vec<f64>
# c6: gauss_newton
# c7: srif_matches_batch_on_linear
# c8: P = R⁻¹R⁻ᵀ
# c9: srif_covariance_is_spd
# c10: P
seg-9d5fd8c1d37d = <c1/>: ein selbstgebauter Square-Root-Informationsfilter nach Bierman — obere Dreiecksmatrix <c2/> mit <c3/>, Informationsvektor <c4/>, Householder-Mess-/Zeitupdates, reine <c5/>-Arithmetik (kein nalgebra). Tests: der sequenzielle SRIF stimmt mit der Lösung der Batch-Kleinste-Quadrate-Methode mit Gewichten (<c6/>) <b>in Zustand und Kovarianz auf { "1e-9" }</b> bei einem entworfenen linear-gaußschen Problem überein (<c7/>); die zurückgewonnene Kovarianz <c8/> ist nach einer langen Folge aus Mess-/Zeitupdates <b>konstruktionsbedingt symmetrisch ({ "1e-12" }) und positiv definit</b> (<c9/>, Cholesky gelingt); und Information akkumuliert sich (die Spur von <c10/> sinkt monoton, wenn Messungen identischer Geometrie eingerechnet werden).

# text
seg-f9ffa1ef4688 = Reduziert-dynamische empirische Beschleunigungen (Abstimmung zwischen Cruise und LMO)

# text
# c1: ReducedDynamicOd
# c2: [r; v; a_emp]
# c3: dynamic_tightness
# c4: reduced_dynamic_tracks_maneuver
# c5: tuning_is_a_continuum
seg-b0612a7140c3 = <c1/>: der Filter mit neun Zuständen <c2/> mit empirischen RTN-Beschleunigungen als Zuständen von Gauss–Markov-Prozessen erster Ordnung, die reduziert-dynamische Technik von JPL/ESOC, bereitgestellt als ein einziger Regler <c3/> (nahezu dynamisch ⇒ glättet Rauschen auf einem ballistischen Bogen; nahezu kinematisch ⇒ die empirische Stufe nimmt ein nicht modelliertes Manöver bzw. den Luftwiderstand auf). Tests: Ein nahezu kinematischer Filter verfolgt ein <b>stufenförmiges (Triebwerks-)Manöver</b> mit <½ des Residuums des nahezu dynamischen, während der nahezu dynamische Filter <b>einen verrauschten ballistischen Bogen besser glättet</b> (<c4/>); ein Durchfahren der Straffheit bewegt das Post-Fit-Residuum <b>monoton</b>, ein Kontinuum und kein Schalter (<c5/>).

# text
seg-9d5db4d63990 = Bordzeituhr mit 3 Zuständen (Phase/Frequenz/Drift, van-Loan-Q, Allan)

# text
# c1: ClockState3
# c2: Q
# c3: T⁵
# c4: Q/R
# c5: ClockClass
# c6: σ_y(1 s)
# c7: Δv = c·σ_y
seg-fe5beef74e24 = <c1/>: Fehlerzustand aus Phase + relativer Frequenz + Frequenzdrift mit dem <b>exakten diskreten Prozessrauschen nach van Loan</b> und einem Update mit Joseph-Stabilisierung. Tests: das diskretisierte <c2/> stimmt mit dem von Hand hergeleiteten Polynom nach van Loan <b>auf { "1e-12" }</b> überein und <b>reduziert sich genau auf das Q der KalmanClock mit zwei Zuständen, wenn die Drift = { "0" } ist</b> (eine strikte Obermenge); ein Auslaufen über mehrere Schritte lässt die Phasenvarianz über den Term des Random Runs <c3/> bis zur analytischen Holdover-Beziehung nach NIST SP { "1065" } wachsen; der Driftzustand <b>gewinnt eine wahre Alterungsrampe auf <{ "5" } % zurück</b>; ein <b>Allan-Profil der Klasse USO wird zurückgewonnen</b> (überlappende ADEV bei τ={ "1" } s innerhalb des Kalibrierkriteriums), und der Schätzer bleibt NEES-konsistent (>{ "95" } % innerhalb von 3σ) und PSD über einen Lauf mit hartem <c4/>. <c5/> trägt die zitierten Zahlen <c6/> für CSAC/USO/DSAC (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) und den Doppler-Boden <c7/>.

# text
seg-8666d18daa2b = Luftwiderstand am Mars (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

# text
# c1: src/mars_atmos.rs
# c2: ..._scaled
seg-6a64c2b9e553 = <c1/>: ein stückweise exponentielles Profil der neutralen Dichte am Mars (Oberfläche ~{ "0.020" } kg/m³, oberflächennahe Skalenhöhe ~{ "11" } km, das Mittel mit wenig Staub aus Mars-GRAM { "2010" } / MCD (Mars Climate Database)) und die quadratische Luftwiderstandsbeschleunigung relativ zur <b>mitrotierenden</b> Marsatmosphäre, plus eine Variante <c2/>, die der SRIF multiplizieren kann. Tests: die Dichte nimmt über die Bänder monoton und stetig ab, die zurückgewonnene oberflächennahe Skalenhöhe ist die physikalische von ~{ "11" } km, der Luftwiderstand ist <b>streng antiparallel zur Relativgeschwindigkeit</b> (Kreuzprodukt verschwindet auf { "1e-12" }) mit einer plausiblen LMO-Größe von ~{ "3e-4" } m/s², und er ist linear im ballistischen Term. <b>Ehrlicher Geltungsbereich:</b> eine repräsentative Ingenieursatmosphäre, kein flugvalidiertes Mars-GRAM/MCD mit Abhängigkeit von Staub/Jahreszeit/Ortszeit.

# text
seg-452f32dace80 = Radiometrische Messpartielle (Entfernung/Doppler) für den SRIF

# text
# c1: range_observable
# c2: range_rate_observable
# c3: ρ = |r_sc − r_sta|
# c4: ρ̇ = û·(v_sc − v_sta)
# c5: ∂ρ̇_obs/∂y = c
# c6: range_partial_matches_finite_difference
# c7: range_rate_partials_match_finite_difference
# c8: radiometric_update_reduces_covariance_in_observed_direction
# c9: range_rate_update_observes_velocity
seg-6661d241cdaf = <c1/> / <c2/>: die Partiellen der Entfernung in Sichtlinie <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) und der Entfernungsrate <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ), die die Observablen aus D1 mit dem Filterzustand verbinden, plus die Partielle der Uhrfrequenz für Einweg-Doppler <c5/>. Tests: beide Partiellen stimmen mit einer <b>zentralen finiten Differenz der Observablen auf { "1e-6" }</b> überein (<c6/>, <c7/>); ein einzelnes Entfernungsupdate <b>verkleinert die Kovarianz in der beobachteten Richtung (Sichtlinie, LOS) um ≫{ "1000" }×</b> und hält sie positiv definit (PD), und ein Doppler-Update verkleinert die <b>Geschwindigkeits</b>varianz in der LOS (<c8/>, <c9/>).

# text
seg-9a2cb6292477 = Durchgängige Mars-LMO-Bahnbestimmung aus radiometrischen Daten

# text
# c1: tests/mars_lmo_od.rs
# c2: Body::mars_gmm3(4)
# c3: xval/anise-mars-od
seg-6318968b683a = <c1/>: ein Wahrheitsbogen einer niedrigen Marsumlaufbahn, propagiert unter der Gravitation <c2/>, erzeugt verrauschte Zweiwege-<b>Entfernung (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> gegenüber zwei Tracking-Stationen; der reduziert-dynamische SRIF gewinnt sie aus einem <b>um ~{ "2.7" } km gestörten</b> Anfangszustand zurück. Erreicht: konvergierter Positions-<b>RMS ≈ { "0.2" } m</b> (unter einem Meter, weit innerhalb des Erfolgskriteriums von Metern bis einigen zehn Metern) über einen Bogen von 3 Umläufen mit einer Taktung von { "30" } s, mit <b>faktorisierter Kovarianz, die zu jeder Epoche positiv definit ist</b> (die SRIF-Garantie, durchgehend geprüft). Das <b>Abstimmungskontinuum zwischen Cruise und LMO</b> wird durchgängig geübt: Bei einer Wahrheit mit nicht modelliertem Luftwiderstand, den die Filtervorlage nicht hat, gewinnt der reduziert-dynamische Regler (Straffheit { "1" }) auf ~{ "14" } m zurück, gegenüber ~{ "677" } m beim nahezu dynamischen Lauf (Straffheit { "0" }) — eine Verbesserung um das { "48" }-Fache, weil die empirische Stufe den Luftwiderstand aufnimmt. <b>Ehrlicher Geltungsbereich:</b> synthetischer geschlossener Regelkreis (Wahrheit = derselbe Propagator, den der Filter verwendet); der externe Gegenvergleich in DE-Güte ist das durch Kernel gesperrte <c3/> (D0.8b), hier nie ausgeführt, kein Netzwerk.

# text
# c1: src/mars_pnt.rs
# c2: src/deepspace_od.rs
seg-559176eb1a82 = Deep-Space-PNT-Szenario & Fusion von Einweg+Zweiweg — D3 (<c1/>, <c2/>)

# text
# c1: mars-pnt
seg-bdb5da496071 = Der vierte Meilenstein der Deep-Space-Navigations-Engine: ein lauffähiges <b>Produktszenario Mars-PNT</b>, das den Marskörper / das Bezugssystem aus D0, die radiometrischen Observablen aus D1 und die reduziert-dynamische Bahnbestimmung aus D2 in einer einzigen Szenarioart <c1/> zusammenführt. Es modelliert eine kleine <b>Relaiskonstellation im Stil von MARCONI</b>, die ein Einweg-Signal im Raum (uhrgekoppelt) sendet und zusätzlich eine Zweiweg-Verbindung (kohärent, uhrfrei) zu einer Deep-Space-Station weiterleitet, und navigiert drei Referenznutzer (Marstransfer, Orbiter in niedriger Marsumlaufbahn, fester Oberflächenpunkt) mit dem <b>gemeinsamen Fusionsschätzer D3.1 aus Einweg + Zweiweg</b> — einem SRIF mit zwölf Zuständen, der den reduziert-dynamischen Bahn-/empirischen Block aus D2 um eine Bordzeituhr mit drei Zuständen erweitert. <b>Ehrlicher Geltungsbereich:</b> Jede Kennzahl ist die <b>formale Kovarianzschranke</b> des Schätzers (1σ / 3σ Position je Epoche) und der erreichte RMS gegenüber einer <b>synthetischen geschlossenen Regelkreis</b>-Wahrheit (Wahrheit und Filter teilen dieselbe Marsdynamik und dasselbe geometrische Observablenmodell, plus eingespeistes Gauß-Rauschen) — eine simulierte Navigationskennzahl, <b>KEIN</b> luftfahrtzertifiziertes Schutzniveau und <b>KEINE</b> Flugaussage (kein zertifiziertes Fehlermodell, kein Integritätsmonitor, keine realen Tracking-Daten). Alles Folgende ist additiv (die Reproduzierbarkeits-Goldens sind unverändert; gleicher SHA, keine Neuerzeugung).

# text
seg-b81920d2df82 = Gemeinsame radiometrische Fusion aus Einweg + Zweiweg (die Fusion schlägt jede für sich)

# text
# c1: FusionOd
# c2: ClockState3
# c3: ∂ρ̇_obs/∂y = c
# c4: fused_observable
# c5: src/deepspace_od.rs
# c6: #[cfg(test)]
seg-cd9d2a7dd08f = <c1/>: der reduziert-dynamische SRIF aus D2.2, erweitert um die drei Bordzeituhr-Zustände (<c2/>), der über <c4/> eine gemischte Zeitreihe aus <b>Zweiweg</b> (uhrfrei, bahnfixierend — null Uhrspalten in der Partiellen) und <b>Einweg</b> (uhrgekoppelt — die Frequenzpartielle <c3/>) Entfernung/Doppler aufnimmt. Die Struktur aus Kalibrieren und anschließendem Auslaufen: Zweiweg-Durchgänge fixieren die Bahn, Einweg-Daten kalibrieren dann die Uhr und lassen die Bahn zwischen den Durchgängen auslaufen, mit einem durch die Allan-Stabilität der Uhr begrenzten Fehler. Getestet in <c5/> <c6/>: die <b>fusionierte</b> Lösung schlägt <b>jede der beiden Verbindungsarten allein</b>; der Auslauffehler eines reinen Einweg-Laufs wächst mit der Lücke zwischen den Zweiweg-Durchgängen im Einklang mit der Allan-Schranke der Uhrklasse; die gemeinsame Kovarianz bleibt durchgehend SPD (symmetrisch positiv definit).

# text
seg-26a4bfa8e6ad = MARCONI-Konstellation (areostationärer Radius, Okkultation)

# text
# c1: MarconiConstellation
# c2: r = (μ/ω²)^{1/3} ≈ 20 428 km
# c3: mars_gmm3
# c4: chord_clears_sphere
seg-f2c2e1b83411 = <c1/>: ein Satz aus fünf Relais — drei <b>areostationäre</b> Relais bei <c2/> (der marssynchrone Radius aus dem veröffentlichten μ/der Drehrate; getestet im Band <b>{ "20 400" }–{ "20 500" } km</b>), in der Länge gleichmäßig um { "120" }° versetzt, mit { "5" }° Inklination, plus zwei Relais auf einer höheren ({ "1.4" }× areostationär) kreisförmigen Bahn mit { "60" }° Inklination für die Abdeckung in der Himmelsebene. Die Relaiszustände je Epoche werden unter der Gravitation <c3/> vorwärts integriert; der Sichtbarkeitstest der <b>Marsokkultation</b> ist die Geometrie, bei der die Sehne die Kugel freigibt (<c4/>, getestet: ein diametral gegenüberliegendes Relais ist verdeckt, ein Relais im Zenit ist sichtbar). <b>Ehrlicher Geltungsbereich:</b> eine minimale repräsentative Geometrie aus Broadcast plus Relais, aus veröffentlichten Marskonstanten aufgebaut — kein bestimmter Entwurf einer Flugkonstellation.

# text
# c1: mars-pnt
seg-b53ea4dd9f7d = Szenario <c1/> erreichbar über CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

# text
# c1: MarsScenario
# c2: run_mars_pnt
# c3: kind = "mars-pnt"
# c4: src/api.rs
# c5: mars_pnt_kind_round_trips_through_the_dispatch
# c6: scenarios/mars-pnt-lmo.toml
# c7: scenarios/mars-pnt-surface.toml
# c8: scenarios/mars-pnt-transfer.toml
# c9: fom_note
# c10: summary
# c11: to_svg
seg-3a01d13ad2e7 = <c1/> / <c2/> ist als Szenario <c3/> auf allen Oberflächen eingebunden (D3.3): der CLI-Runner, die Python-Anbindung, der WASM-/Playground-Build und der Dispatch des MCP-Servers leiten alle dorthin (<c4/> Rundlauftest <c5/>). Mitgelieferte Referenzszenarien: <c6/>, <c7/>, <c8/>. Das Ergebnis trägt ein ausdrückliches <c9/>, das die Kennzahl als Kovarianzschranke (nicht als zertifiziertes PL) kennzeichnet, und die Ausgaben <c10/> / <c11/> wiederholen den Ehrlichkeitshinweis.

# text
seg-28a49a455a74 = Ziele von MARCONI / LightShip reproduziert: <b>< { "100" } m Orbiter</b>, <b>< { "15" } m Rover</b>

# text
# c1: tests/mars_pnt_targets.rs
seg-28da71940857 = <c1/>: die veröffentlichten Programmziele von MARCONI / LightShip (Orbiter < { "100" } m, Oberfläche/Rover < { "15" } m) in der Simulation reproduziert. <b>Gemeinsame Annahmen:</b> die Standardkonstellation MARCONI aus fünf Relais; jedes sichtbare Relais liefert je Epoche Einweg-Entfernung+Doppler; alle <b>{ "30" } min</b> ein kohärenter Zweiweg-Stationsdurchgang; Rauschen der DSN-Klasse (<b>Entfernung σ = { "1" } m, Doppler σ = { "0.1" } mm/s</b>); der gemeinsame Fusionsfilter aus reduziert-dynamischer Bahn + Uhr mit 3 Zuständen, gestartet aus einem um <b>~{ "2.7" } km</b> gestörten A-priori-Zustand (Straffheit { "0.1" }); Kennzahl = konvergierter 3-D-Positions-RMS der hinteren Bogenhälfte gegenüber der synthetischen Wahrheit. <b>Orbiter</b> (LMO ~{ "400" } km / { "60" }° Inklination, Uhr <b>USO</b>, Taktung { "60" } s, ~{ "2" } h ≈ Bogen eines Umlaufs): erreichter konvergierter RMS <b>≈ { "0.40" } m</b> ≪ dem Ziel von { "100" } m (im Mittel { "3.1" } Relais in Sicht, Kovarianz durchgehend SPD). <b>Rover</b> (fester äquatorialer Oberflächenpunkt, Uhr <b>USO</b>, Taktung { "30" } s, Bogen von ~{ "2" } h): erreichter konvergierter RMS <b>≈ { "5.1" } m</b> < dem Ziel von { "15" } m (im Mittel { "3.0" } Relais in Sicht, Kovarianz SPD). <b>Beide Ziele erreicht, ohne eine Prüfbedingung zu lockern</b> — der USO ist die <em>weniger</em> leistungsfähige der realistischen Bordzeituhrklassen (eine DSAC würde nur helfen), und die Zweiweg-Taktung von 30 min ist für einen routinemäßigen Zeitplan eines Relaisnetzes konservativ, daher sind die Annahmen für ein System der MARCONI-Klasse physikalisch fair und nicht auf das Bestehen zugeschnitten. <b>Ehrlicher Geltungsbereich:</b> simulierte Reproduktion unter den genannten Annahmen, KEINE Flugaussage und kein zertifiziertes Schutzniveau; die synthetische Wahrheit im geschlossenen Regelkreis teilt die Marsdynamik und das Observablenmodell des Filters.

# text
# c1: src/lunar_time.rs
seg-37b2bad62854 = Mondkoordinatenzeit — relativistische Uhrrate Erde–Mond (<c1/>)

# text
# c1: src/lunar_time.rs
# c2: L_G
# c3: W0 = L_G·c² ≈ 6.26369e7 m²/s²
# c4: GM_moon/R_moon ≈ 2.822e6 m²/s²
# c5: −<v²>/2c²
# c6: src/ephem.rs
# c7: lunar-time-offset
seg-787705fa0fac = Eine Zeitskala der Mondkoordinatenzeit (LTC/TCL (TCL: Temps-Coordonnée Lunaire, der französische Name der Mondkoordinatenzeit)) erfordert die säkulare Rate, mit der eine Uhr auf der Mondoberfläche relativ zu einer Uhr auf dem Erdgeoid (TT) läuft. <c1/> berechnet sie aus ersten Prinzipien: eine erste post-newtonsche Identität, die die <b>Differenz der Eigenpotenziale</b> (das konventionelle Geoidpotenzial <c2/> der IAU <c3/> minus das Eigenpotenzial der Mondoberfläche <c4/>) und den <b>kinetischen Term (Doppler zweiter Ordnung)</b> <c5/> aus der geozentrischen Mondgeschwindigkeit aufsummiert (finite Differenzen aus der Mondreihe nach Montenbruck–Gill in <c6/>). Der dominante Term des Eigenpotenzials ergibt <b>≈ { "57.5" } µs/Tag</b>, der kinetische Term <b>≈ −{ "0.5" } µs/Tag</b>, zusammen <b>≈ { "57" } µs/Tag</b>. Das Szenario <c7/> meldet diese Rate, den über einen Horizont akkumulierten Versatz LTC−TT und unterstützt ein minimales Ensemble mit inverser Varianz (eine Mond-Papieruhr); Umrechnungen TT↔LTC laufen im Rundlauf auf < { "1" } ns/Tag.

# text
seg-beeb6561ef6b = Unabhängige Referenz / ehrlicher Geltungsbereich

# text
seg-4500e65ede97 = Relativistische Uhrrate Erde–Mond (LTC/TCL)

# text
# c1: lunar_rate_breakdown
# c2: tt_to_ltc
# c3: ltc_to_tt
# c4: lunar_ensemble
# c5: LunarTimeScenario
# c6: L_G
# c7: lunar_time::tests
# c8: W0
# c9: Modelled
seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Unabhängige Referenz: eine interne relativistische Identität in geschlossener Form</b> (<c6/> der IAU / Geopotenzial nach den IERS-Konventionen und das Eigenpotenzial GM/r (GM: Gravitationsparameter, G mal Masse)), <b>gegengeprüft gegen das veröffentlichte Band der Mond-Uhrrate [{ "56" }, { "59" }] µs/Tag</b>. Tests (<c7/>): der Term des Eigenpotenzials ≈ { "57.5" } µs/Tag, die Mondgeschwindigkeit ≈ { "1" } km/s, der kinetische Term ein kleiner negativer Wert, die Summe im Band, wobei die benannten Terme sich zu ihr aufsummieren, der Versatz LTC−TT nach 1 Tag ≈ { "57" } µs, und ein Rundlauf TT↔LTC auf < { "1" } ns/Tag. <b>Ehrlicher Geltungsbereich:</b> die Hauptzahl in µs/Tag ist <b>vom Bezug abhängig</b> — sie hängt von den gewählten Bezugsflächen (Erdgeoid <c8/> gegenüber einem Selenoid), vom Mittelungsfenster und von den vernachlässigten Zentrifugal-/J₂-Korrekturen unter µs/Tag ab —, weshalb ein <b>Band</b> und nicht eine einzelne zertifizierte Zahl die veröffentlichte Ausgabe ist. Dies ist eine Selbstkonsistenzprüfung vom Typ <c9/>, <b>KEINE</b> externe Validierung, <b>KEINE</b> absolute Genauigkeit unter einer Nanosekunde und <b>NICHT</b> für den operativen Zeitdienst zertifiziert.

# text
# c1: src/lunar_vlbi.rs
seg-b4e3228c84b8 = Geodätisches VLBI am Mond — Nahfeldverzögerung für eine Erdbasislinie, die ein Mondbaken beobachtet (<c1/>)

# text
# c1: tau_geom = (|r2 − r_B| − |r1 − r_B|)/c
# c2: src/radiometric.rs
# c3: src/frames.rs
# c4: src/cio.rs
# c5: src/ephem.rs
# c6: src/lunar.rs
# c7: src/lunar_frame.rs
# c8: lunar-vlbi
seg-bbb634953ebf = Eine geodätische VLBI-Observable (very-long-baseline interferometry) für zwei Bodenstationen auf der Erde (eine Basislinie), die ein Einwegsignal eines Senders der Klasse NovaMoon auf der Mondoberfläche beobachten. Der Mond liegt im <b>Nahfeld</b>, nicht in einer ebenen Welle, daher ist die geometrische Verzögerung die exakte Differenz zweier Entfernungen <c1/> und nicht die Projektion auf die Himmelsebene. Die vollständige Observable fügt die Differenz der Uhrversätze der Stationen und einen differenzierten Shapiro-Term des Erdpotenzials hinzu (aus <c2/> wiederverwendet). Die Stationen werden über <c3/> + <c4/> in geozentrischen inertialen Koordinaten (GCRS) platziert; die Bake über <c5/> (geozentrischer Mond) + <c6/> (selenographisch→MCMF (MCMF: Moon-centred, Moon-fixed)) + <c7/> (körperfest nach IAU-2015 ME→inertial). Das Szenario <c8/> tastet über einen Durchgang die Verzögerung, ihre Rate aus finiten Differenzen und die Nahfeldkorrektur ab.

# text
# c1: delta_dor
# c2: src/radiometric.rs
# c3: −(B·ŝ_B)/c = delta_dor(r_B, [0,0,0], B)
# c4: dtau/dr_B = ((r_B−r2)/|r_B−r2| − (r_B−r1)/|r_B−r1|)/c
seg-b2b758337ebc = Die <b>unabhängige Referenz</b> ist die Δ-DOR-Observable der ebenen Welle <c1/> aus derselben Codebasis in <c2/>: im Fernfeldgrenzfall (eine synthetische Bake bei { "1e15" } m) muss die geometrische Verzögerung auf Maschinengenauigkeit auf <c3/> zusammenfallen; in der wahren Monddistanz ist die Nahfeldkorrektur durch die Wellenfrontkrümmung ungleich null (einige zehn bis hundert µs). Die Partiellen der Bake <c4/> (und die Partiellen der Stationen) werden durch zentrale finite Differenz verifiziert (relativer Fehler < { "1e-5" }).

# text
seg-107b9d328f69 = Geodätische VLBI-Verzögerung am Mond + Partielle

# text
# c1: geometric_delay_s
# c2: vlbi_delay_s
# c3: delay_partials_beacon
# c4: _station1
# c5: _station2
# c6: near_field_correction_s
# c7: LunarVlbiScenario
# c8: ReferenceImpl
# c9: delta_dor
# c10: src/radiometric.rs
# c11: lunar_vlbi::tests
# c12: delta_dor
# c13: run_toml
# c14: Modelled
# c15: xp = yp = 0
# c16: jd_tdb ≈ jd_tt
seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Unabhängige Referenz: <c8/></b> — das <c9/> der ebenen Welle aus derselben Codebasis (<c10/>) im Fernfeldgrenzfall, plus <b>Partielle aus finiten Differenzen</b>. Tests (<c11/>): Betrag der Station ≈ Erdradius, Entfernung der Bake in der Monddistanz ({ "356" }–{ "407" } Mm), die geometrische Verzögerung im Fernfeld stimmt mit <c12/> auf < { "1e-9" } s überein, eine Nahfeldkorrektur ungleich null in der Monddistanz, FD-Partielle von Bake/Station innerhalb von { "1e-5" } relativ, ein exakter Uhrterm und ein endlicher Szenariolauf, der über <c13/> abgesetzt wird. <b>Ehrlicher Geltungsbereich:</b> <c14/>, <b>NICHT</b> gegen reale VLBI-Daten validiert. Die Polbewegung wird weggelassen (<c15/>), daher tragen die inertialen Positionen der Stationen einen Bezugssystemfehler von einigen Metern; die Bake mischt eine Mondreihe des mittleren Äquators des Datums mit einem körperfesten Versatz im ICRF (International Celestial Reference Frame) (<c16/>), eine Unstimmigkeit der Bezugssystemkonsistenz unterhalb der Modelltreue, aber nicht streng; und es gibt keine Lichtlaufzeititeration, keine Erdrotation während der Lichtlaufzeit, keine Medien- (Tropo/Iono/Plasma) oder Aberrationsterme über den differenzierten Shapiro hinaus. Es wird kein TRL (technology readiness level), keine Flugerfahrung und keine Billigung durch eine Agentur beansprucht. { "0.30" }: Gegenüber den Lichtlaufzeiten von ANISE über DE440 liegt keine Verzögerung dieses analytischen Pfads innerhalb von { "1" } ps (größte Lücke { "24" } µs); der Befund ist festgeschrieben.

# text
# c1: KernelGeometry
# c2: lunar-vlbi
seg-d90c67f098f7 = <c1/> (Erde und Mond aus DE440, Mondhauptachsen aus DE440, Erdorientierung ITRF93, jede Lichtlaufzeit im baryzentrischen System konvergiert), ausgeführt vom Szenario <c2/>, wenn die drei Kernelpfade gesetzt sind. <b>Unabhängige Referenz: Library</b> — die konvergierten Lichtlaufzeiten des NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) zu DSS-14/43/63, vorab festgelegt: { "75" } Verzögerungen innerhalb von { "1" } ps (schlechtester Wert { "0.06" } ps), Partielle von Bake und Station innerhalb von { "1e-6" }, bei { "25" } Epochen nahe J2000 (eine Änderung, nachdem die { "2024" } Epochen an der Emissionsepoche von SPICE selbst in doppelter Genauigkeit scheiterten, etwa { "6" } ps, offengelegt und festgeschrieben). Der differenzierte Shapiro-Term, die Verzögerungsrate und die Nahfeldkorrektur des Szenarios werden nicht verglichen.

# text
# c1: src/lunar_combination.rs
seg-8bed75c5402d = Gemeinsame Multitechnik-Bahnbestimmung + Uhr am Mond — simulierte Rückgewinnung im geschlossenen Regelkreis (<c1/>)

# text
# c1: crate::batch_ls::gauss_newton_qr
# c2: src/lunar_vlbi.rs
# c3: [station_pos(3), {sat_pos(3)}×N_sat, station_clk, {sat_clk}×N_sat]
# c4: lunar-joint-od-clock
seg-d518eead07c4 = Eine Batch-Kleinste-Quadrate-Anpassung für eine einzelne Epoche (Schnappschuss) (<c1/>, ein Householder-QR-Schritt seit { "0.30" }), die <b>die Techniken geodätisches VLBI, Radiometrie/lunare lokale Entfernungsmessung und Entfernungsmessung zwischen Satelliten fusioniert</b>, in einem SIMULIERTEN Mondnetz, um <em>zusammen</em> die 3-D-Position einer Oberflächenstation auf dem Mond, die Positionen der einzelnen Satelliten einer kleinen Konstellation und den Uhrversatz jedes Assets zurückzugewinnen. Die Observablen sind: ({ "1" }) geodätische VLBI-Verzögerungen der Erdbasislinie zur Mondstation, die als Bake behandelt wird (<c2/> wiederverwendet, geozentrisch inertial) — die Haupttechnik; ({ "2" }) geozentrische radiometrische Entfernungen von Erdstationen zu Satelliten (die die Konstellation aus den weit verteilten Erdstationen multilaterieren) und lunare lokale Entfernungen zwischen Station und Satellit (euklidischer Abstand im MCI (Moon-centred inertial) plus der differenzierte Uhrterm); ({ "3" }) Entfernungen zwischen Satelliten (gleiche Form); plus eine einzelne Pseudobeobachtung zur Synchronisation der Stationsuhr, die den sonst nicht beobachtbaren gemeinsamen Uhrversatz verankert. Der Zustandsvektor ist <c3/>. Es gibt <b>keine Propagation mit Kraftmodell innerhalb des Lösers</b> — die Satelliten sind feste, verschiedene, illustrative Punkte auf einer repräsentativen Mondumlaufbahn; dies ist bewusst eine saubere Schnappschuss-Anpassung. Intern werden Positionen skaliert und Uhren in entfernungsäquivalenten Metern geschätzt, damit die Normalmatrix in f64 gut konditioniert bleibt; die Entfernungen aus VLBI und Monddistanz werden um die nominelle Geometrie mittelwertbereinigt, damit die Jacobi-Matrix aus finiten Differenzen nicht unter katastrophaler Auslöschung leidet. Das Szenario <c4/> führt die Lösung mit und ohne die VLBI-Zweige auf demselben Seed/derselben Wahrheit aus und meldet beide Lösungen plus den Verbesserungsfaktor der Beobachtbarkeit der Station.

# text
# c1: vlbi_restores_station_observability
seg-f634e976b583 = Das <b>ehrliche Kernergebnis</b>: Eine lunare lokale Entfernungsmessung von einer Polstation zu einer Handvoll Satelliten, die alle auf einer Seite des Himmels stehen, lässt die Position der Station <b>entlang einer Richtung nur schwach beobachtet</b>, daher ist die Lösung nur mit Entfernungen schlecht konditioniert und der zurückgewonnene 3-D-Fehler der Station groß (oder die Lösung konvergiert nicht). <b>Das Hinzufügen der VLBI-Verzögerungen der Erdbasislinie macht die volle 3-D-Position der Station beobachtbar</b>, und der zurückgewonnene Stationsfehler fällt auf Meterniveau. Der Test <c1/> stellt sicher, dass der Stationsfehler mit VLBI deutlich (≥{ "5" }×) kleiner ist als der Fehler nur mit Entfernungen bei identischer eingespeister Wahrheit — dass VLBI die sonst nicht beobachtbare Richtung der Station wiederherstellt, ist der Sinn dieser Phase.

# text
# c1: 1/σ²
# c2: Δxᵀ(HᵀWH)Δx
# c3: formal_covariance_nees
# c4: n_params
seg-d5feea2381b7 = Die <b>unabhängige Referenz</b> ist interne Konsistenz: Ein eingespeister Wahrheitszustand (Station ~{ "50" } m/Achse, Satelliten ~{ "30" } m/Achse, Uhren ~{ "1e-7" } s, mit einem Jitter je Komponente mit Seed) wird durch <em>dasselbe</em> Geometriemodell, das der Löser invertiert, auf synthetische Observablen abgebildet, es wird Gauß-Rauschen mit Seed hinzugefügt (illustrative Standardwerte: VLBI σ ≈ { "1e-11" } s, Entfernung σ ≈ { "0.1" } m, ISL σ ≈ { "0.1" } m; Gewichte <c1/>), und der Schätzer muss die eingespeiste Wahrheit innerhalb des Rauschens aus einer Anfangsschätzung aus Nullen zurückgewinnen. Ein Monte-Carlo-Mittel des NEES <c2/> über Seeds (<c3/>) liegt in einem lockeren Band um <c4/>, eine Prüfung des Kovarianzrealismus.

# text
# c1: validated
seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: die lineare Algebra der Lösung)

# text
# c1: estimate
# c2: formal_covariance_nees
# c3: LunarCombinationScenario
# c4: tests/lunar_joint_od_numpy_oracle.rs
# c5: InternalConsistency
# c6: lunar_combination::tests
# c7: n_params
# c8: run_toml
seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Unabhängige Referenz { "0.30" }: P2</b> — numpy { "2.4.6" } (LAPACK gelsd und inv) berechnet jeden Gauss-Newton-Schritt, die konvergierte gewichtete Lösung, die formalen Sigmas und den Stationsfehler auf den eingecheckten Jacobi-Matrizen von sechs Netzen neu (<c4/>, Schritte innerhalb von { "2.4e-11" }, Sigmas innerhalb von { "1.3e-11" }); die physikalischen Beobachtungsmodelle und Größenordnungen bleiben MODELLED. <b>Frühere unabhängige Referenz: <c5/></b> — Rückgewinnung einer eingespeisten simulierten Wahrheit + Konsistenz der NEES-Kovarianz. Tests (<c6/>): Die volle Fusion gewinnt die Wahrheit zurück (Station < { "5" } m, Satelliten-RMS < { "5" } m, Uhren < { "1e-8" } s, konvergiert); VLBI stellt die dreidimensionale Beobachtbarkeit der Station wieder her (Stationsfehler ≥{ "5" }× kleiner mit VLBI als nur mit Entfernungen bei derselben Wahrheit); deterministisch (gleicher Seed → bitidentische Lösung, anderer Seed → andere, aber zurückgewonnene); mittleres NEES innerhalb eines lockeren Bandes um <c7/>; endliche/abgesicherte gemeldete Zahlen, selbst wenn die Lösung nur mit Entfernungen schlecht konditioniert ist; Szenario über <c8/> abgesetzt. <b>Ehrlicher Geltungsbereich:</b> Dies ist eine <b>simulierte Rückgewinnung im geschlossenen Regelkreis</b> — die Wahrheit teilt das Beobachtungsmodell — <b>KEINE</b> Validierung mit realen Daten; keine Propagation mit Kraftmodell innerhalb des Lösers; die Positionen der Satelliten und die Geometrie von Erd-/Mondstation sind illustrativ. Es wird kein TRL, keine Flugerfahrung und keine Billigung durch eine Agentur beansprucht.

# text
# c1: src/lunar_frame_realise.rs
seg-7620f3a821f6 = Realisierung des lunaren Bezugssystems — Datumsanpassung mit 7 Helmert-Parametern (<c1/>)

# text
# c1: src/lunar_frame.rs
# c2: p_i
# c3: q_i
# c4: q_i = t + (1 + s)·R(θ)·p_i
# c5: R(θ) = rz(θz)·ry(θy)·rx(θx)
# c6: crate::precession::{rx, ry, rz, matmul, mat_vec}
# c7: [tx, ty, tz, θx, θy, θz, s]
# c8: crate::batch_ls::gauss_newton
# c9: q_i
# c10: p_i
# c11: z
# c12: 1/σ²
# c13: x0 = zeros
# c14: icrf_orientation_tie
# c15: transpose(crate::lunar_frame::icrf_to_iau_moon(jd_tdb))
seg-240271b9d7de = Während <c1/> die Orientierung des Mondkörpers nach IAU { "2015" } WGCCRE <em>anwendet</em> (ein Vorwärtsmodell), <em>schätzt</em> (realisiert) dieses Modul ein lunares Bezugssystem aus einem Netz geschätzter Punktkoordinaten, die an ein Datum gebunden sind. Der Schätzkern ist eine klassische <b>Ähnlichkeitstransformation mit 7 Parametern (Helmert)</b> — drei Translations-, drei Kleinwinkel-Rotations- und ein Maßstabsparameter —, die Punkte <c2/> (geschätztes System) auf <c3/> (Datumssystem) als <c4/> abbildet, mit <c5/>, aufgebaut aus <c6/>. Die sieben Parameter <c7/> werden aus ≥ { "3" } nicht kollinearen Punktpaaren durch gewichtete Kleinste Quadrate über <c8/> geschätzt: Das Vorwärtsmodell sagt jedes <c9/> aus seinem <c10/> voraus und flacht alle drei Komponenten aller Punkte zum Observablenvektor ab, die beobachteten Datumskoordinaten bilden <c11/>, die Gewichte sind <c12/>, und die Lösung startet bei <c13/>. Rotationswinkel werden in µrad und der Maßstab in ppb geschätzt, damit die Jacobi-Matrix aus finiten Differenzen bei der Koordinatengröße der Mondoberfläche (~{ "1.7e6" } m) gut skaliert bleibt. Ein kleines <c14/> setzt die realisierte kleine Rotation über die Orientierung IAU-Körper→ICRF (<c15/>) zusammen und gibt den verbleibenden Kleinwinkelversatz des realisierten Systems um die ICRF-Achsen zurück — eine bewusst einfache Änderung des Ausdrucksbezugs, <b>keine</b> unabhängige Schätzung des Mondpols.

# text
# c1: lunar-frame-realisation
seg-75769fc9671c = Die <b>unabhängige Referenz</b> ist interne Konsistenz: Eine bekannte Helmert-Transformation (Translation ~einige zehn m, Rotation ~µrad, Maßstab ~{ "1e-7" }) wird in ein gut verteiltes synthetisches Punktnetz <em>eingespeist</em> (verschiedene selenographische Breiten/Längen → MCMF, einige Punkte in der Höhe), es wird Gauß-Rauschen mit Seed hinzugefügt, und die Anpassung muss die eingespeisten Parameter zurückgewinnen. Bei rauschfreien Daten erfolgt die Rückgewinnung auf ~Maschinengenauigkeit (Translation < { "1e-6" } m, Rotation < { "1e-9" } rad, Maßstab < { "1e-12" }); bei Rauschen von einem Meter liegen die zurückgewonnenen Parameter innerhalb weniger × des formalen σ, und das Post-Fit-RMS-Residuum liegt nahe dem Rauschniveau. Das Szenario <c1/> meldet das zurückgewonnene Datum, den Rückgewinnungsfehler je Parameter gegenüber der eingespeisten Wahrheit, das Post-Fit-RMS-Residuum und die ICRF-Orientierungsanbindung der realisierten Rotation.

# text
# c1: helmert_fit
# c2: apply_helmert
# c3: realise_frame
# c4: icrf_orientation_tie
# c5: LunarFrameRealiseScenario
# c6: InternalConsistency
# c7: apply_helmert
# c8: lunar_frame_realise::tests
# c9: run_toml
seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Unabhängige Referenz: <c6/></b> — Rückgewinnung einer eingespeisten Ähnlichkeitstransformation mit 7 Parametern plus die algebraische Rundlauf-Identität von <c7/>. Tests (<c8/>): rauschfreie Rückgewinnung der eingespeisten Transformation (Translation < { "1e-6" } m, Rotation < { "1e-9" } rad, Maßstab < { "1e-12" }); Rückgewinnung mit Rauschen innerhalb weniger × σ und RMS-Residuum nahe dem Rauschniveau; Rundlauf aus Anwenden und anschließendem Invertieren; deterministisch (gleicher Seed → bitidentisch, anderer Seed → anders, aber zurückgewonnen); die ICRF-Anbindung bei null Rotation ist null, und die Anbindung erhält den Betrag der Rotation; Szenario über <c9/> abgesetzt. <b>Ehrlicher Geltungsbereich:</b> Dies ist eine <b>Selbstkonsistenzprüfung</b> — sie gewinnt eine <em>eingespeiste</em> Transformation auf einem <em>synthetischen</em> Netz zurück — <b>KEINE</b> Realisierung des lunaren Bezugssystems gegen reale Tracking-/VLBI-Daten, und sie erhebt keinen Anspruch auf absolute Genauigkeit des Bezugssystems. Die ICRF-Orientierungsanbindung ist eine einfache Änderung des Ausdrucks, keine unabhängige Polschätzung. Es wird kein TRL, keine Flugerfahrung und keine Billigung durch eine Agentur beansprucht.

# text
# c1: src/lunar_service.rs
seg-f14930d33f47 = Servicevolumen des lunaren Navigationsdienstes — DOP / Abdeckung / Verfügbarkeit + verallgemeinertes lunares ARAIM-PL (<c1/>)

# text
# c1: crate::orbit::dop
# c2: service_dop
# c3: service_dop
# c4: orbit::dop
# c5: crate::lunar::lunar_araim
# c6: P_sat
# c7: lunar_protection_level
# c8: lunar::lunar_araim
seg-9b4f13e138e4 = Dieses Modul <em>setzt</em> bereits gebaute Teile zu einer Analyse des lunaren Navigations-<b>Servicevolumens</b> zusammen: Es durchläuft ein selenographisches Breiten-/Längengitter über einen Zeithorizont gegen eine <b>illustrative, aus öffentlichen Quellen stammende lunare Umlaufbahn-Konstellation der Klasse Moonlight / LCNS</b> (LCNS: Lunar Communications and Navigation Services) und meldet DOP / Abdeckung / Verfügbarkeit sowie eine verallgemeinerte Hülle des lunaren ARAIM-Schutzniveaus. Die beiden Wiederverwendungen sind tragend und ausdrücklich. Die <b>DOP-Geometrie</b> ist der <b>VALIDATED</b> (gegenüber gnss_lib_py) Kernel <c1/> — <c2/> ist ein dünner Filter mit Elevationsmaske plus dieser Kernel, und ein Test stellt die Identität sicher (<c3/> entspricht einem direkten <c4/> auf denselben sichtbaren Positionen). Die <b>Integrität</b> verwendet die LunaNet-LNIS-Mechanik (LunaNet Interoperability Specification) des lunaren ARAIM <c5/> wieder (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> verallgemeinert das bestehende Schutzniveau am Südpol auf einen beliebigen Oberflächenpunkt, und ein Test stellt sicher, dass es sich <b>auf den Fall des Südpols reduziert</b> (am Südpol mit derselben Geometrie/demselben Budget liefert es genau das bestehende Ergebnis von <c8/> auf < { "1e-9" }).

# text
# c1: moonlight-service-volume.toml
# c2: moonlight-service-volume
seg-456bf257f689 = Die Konstellationsparameter sind eine <b>illustrative Näherung öffentlicher Beschreibungen der ESA</b> der Systemklasse (≈ { "4" } Satelliten auf elliptischen eingefrorenen Mondbahnen, die die Abdeckung am Südpol begünstigen — Apolune über der Südhalbkugel; { "4" } ist der Standard der Bibliothek, und das mitgelieferte <c1/> setzt { "8" }, weil das Schutzniveau mindestens { "6" } in Sicht braucht). Sie sind <b>nicht</b> die reale Ephemeride von Moonlight/LCNS und implizieren <b>keine</b> Zugehörigkeit, Billigung, Flugerfahrung, Zertifizierung oder TRL. Die Zusammensetzung (Abdeckung / Verfügbarkeit / Integrität) ist <b>MODELLED</b>: ein kreis-/ellipsenförmiger Keplerscher Relaissatz (keine differenziell korrigierte Ephemeride von LCNS / { "9" }:{ "2" } NRHO (near-rectilinear halo orbit)), ein Mond mit mittlerer Rotation (keine physikalische Libration / präzedierender Pol) und veröffentlichte Integritätsparameter von LunaNet LNIS. Sie zeigt die <em>Methode</em> des Servicevolumens, keine operative Verfügbarkeitszahl. Deterministisch (reine Geometrie; kein Zufall). Das Szenario <c2/> meldet den Abdeckungsprozentsatz, die Hüllen der Anzahl sichtbarer Satelliten und des PDOP, die HPL/VPL-Hülle über das Volumen und die Verfügbarkeit des Schutzniveaus gegenüber der Alarmgrenze.

# text
# c1: LunarConstellation
# c2: visible_sats
# c3: service_dop
# c4: coverage
# c5: lunar_protection_level
# c6: LunarServiceScenario
# c7: crate::orbit::dop
# c8: crate::lunar::lunar_araim
# c9: lunar_service::tests
# c10: service_dop
# c11: lunar_protection_level
# c12: lunar::lunar_araim
# c13: run_toml
seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>DOP-Geometrie durch Wiederverwendung validiert</b> des mit gnss_lib_py validierten Kernels <c7/>; die Integrität verwendet das ARAIM des Mondes nach veröffentlichtem LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m) wieder. Tests (<c9/>): <c10/> ist eine Identität auf dem validierten Kernel; <c11/> am Südpol entspricht dem bestehenden PL von <c12/> auf < { "1e-9" } (reduziert sich auf den Fall des Südpols); die Abdeckung nimmt mit der Größe der Konstellation nicht ab; die Sichtbarkeit beachtet die Elevationsmaske; das Szenario ist deterministisch und wird über <c13/> abgesetzt. <b>Ehrlicher Geltungsbereich:</b> Die Konstellation ist <b>illustrativ, aus öffentlichen Quellen, NICHT mit der ESA verbunden</b> — nicht die reale Ephemeride von Moonlight/LCNS; die Zusammensetzung aus Abdeckung/Verfügbarkeit/Integrität ist <b>MODELLED</b> (kreis-/ellipsenförmige Keplersche Relais, Mond mit mittlerer Rotation, veröffentlichte Parameter von LNIS), <b>KEINE</b> operative Verfügbarkeitszahl von Moonlight. Es wird kein TRL, keine Flugerfahrung und keine Billigung durch eine Agentur beansprucht.

# text
# c1: src/lunar_dpnt.rs
seg-4ff4929f71df = Differenzielles PNT am Mond — Aufhebung des Gleichtakts + mit der Basislinie wachsendes Residuum + DGNSS-Schutzniveaus (<c1/>)

# text
# c1: i
# c2: e_i
# c3: c_i
# c4: −e_i · û_ref,i + c_i
# c5: −e_i · û_user,i + c_i
# c6: −e_i · (û_user,i − û_ref,i)
# c7: c_i
# c8: [x, y, z, clock]
# c9: crate::orbit::invert4
# c10: crate::sbas::sbas_protection_level
seg-8f94c4bf3fe6 = Ein lunares Analogon zu DGNSS (differenzielle Satellitennavigation) / SBAS: Eine <b>Referenzstation der Klasse NovaMoon</b> an einem <em>bekannten</em> selenographischen Ort berechnet je Satellit differenzielle Korrekturen aus einer <b>illustrativen, aus öffentlichen Quellen stammenden Konstellation der Klasse Moonlight / LCNS</b>, und ein bewegter Nutzer, der um eine Basislinie davon versetzt ist, wendet sie an, sodass sich die <b>Gleichtakt</b>-Fehler der Broadcast-Ephemeride aufheben. Jeder Satellit <c1/> trägt einen eingespeisten gemeinsamen 3-D-Bahnfehlervektor <c2/> und einen gemeinsamen Uhrfehler <c3/>. Das Pseudorange-Residuum der Referenzstation ist die Korrektur <c4/>; der Rohfehler des Nutzers ist <c5/>; der korrigierte Nutzerfehler ist ihre Differenz <c6/>. Der <b>Uhrterm <c7/> hebt sich exakt auf</b> (er ist in beiden Beobachtungen identisch), und der <b>Bahnterm fällt auf die Projektion auf die Differenz der beiden Einheitsvektoren der Sichtlinie zusammen</b>, die → { "0" } geht, wenn die Basislinie → { "0" } (der Boden der räumlichen Dekorrelation), und ≈ linear mit der Basislinie wächst. Die korrigierten Entfernungsfehler je Satellit werden durch die Nutzergeometrie über eine kleine, abhängigkeitsarme Schnappschuss-Lösung mit gewichteten Kleinsten Quadraten abgebildet (Zustand <c8/> über <c9/>; ein konstanter Entfernungsbias wird von der Uhrunbekannten aufgenommen, statt die Lösung zu verfälschen), um den <b>Positions</b>fehler des Nutzers zu erhalten. Das <b>Schutzniveau des Nutzers verwendet die SBAS-Schutzniveau-Mechanik nach DO-229E wieder</b> (<c10/>, K-Faktoren für Präzisionsanflug), mit dem differenziellen Residuum σ als 1-σ-Fehlerbudget jedes Satelliten.

# text
# c1: crate::lunar_service::LunarConstellation
# c2: lunar-differential-pnt
seg-06978cfaebe3 = NovaMoon wird <b>nur als Systemklasse</b> referenziert (eine öffentliche Beschreibung einer lunaren Referenzstation); die Konstellation verwendet das illustrative <c1/> aus öffentlichen Quellen wieder. Dies sind illustrative Parameter, um die differenzielle <em>Methode</em> zu üben, <b>keine</b> reale Ephemeride, und sie implizieren <b>keine</b> Zugehörigkeit, Billigung, Flugerfahrung, Zertifizierung oder TRL. Das Szenario <c2/> meldet den Positionsfehler des Nutzers mit und ohne Korrekturen, den Verringerungsfaktor, die Kurve Fehler gegenüber Basislinie und das Schutzniveau. In der Standardkonfiguration beträgt der korrigierte Nutzerfehler bei einer Basislinie von { "50" } km ≈ { "0.008" } m gegenüber ≈ { "24" } m unkorrigiert (eine Verringerung um ~{ "3000" }×), und ≈ { "0" } bei der Basislinie null.

# text
# c1: noise = 0
seg-6bb4dbe998f9 = Die <b>unabhängige Referenz</b> ist interne Konsistenz: Die Aufhebung des Gleichtakts ist eine <b>exakte algebraische Identität</b> (mit <c1/> beträgt der korrigierte Fehler bei der Basislinie null < { "1e-6" } m; der Uhrterm hebt sich bei jeder Basislinie auf Maschinengenauigkeit auf), das Residuum <b>wächst monoton mit der Basislinie</b>, und das Schutzniveau ist <b>derselbe Algorithmus nach DO-229E</b>, gegen den der SBAS-Stack festgelegt ist. Das Residuum der räumlichen Dekorrelation ist ein geometrisches Modell <b>erster Ordnung</b>, <b>kein</b> angepasstes Dekorrelationsmodell aus realem Mond-Tracking.

# text
# c1: differential_corrections
# c2: corrected_user_range_errors
# c3: user_position_error_m
# c4: lunar_dgnss_protection_level
# c5: LunarDpntScenario
# c6: InternalConsistency
# c7: crate::sbas
# c8: lunar_dpnt::tests
# c9: sbas::sbas_protection_level
# c10: None
# c11: run_toml
seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Unabhängige Referenz: <c6/></b> — die Identität der differenziellen Fehleraufhebung plus Wiederverwendung der SBAS-Schutzniveau-Mechanik nach DO-229E (<c7/>). Tests (<c8/>): Bei der Basislinie null sind der korrigierte Nutzerfehler und jeder korrigierte Entfernungsfehler je Satellit ~{ "0" } (< { "1e-6" } m) und ≪ dem unkorrigierten Fehler; der Uhrterm hebt sich bei jeder Basislinie exakt auf (Fall mit Bahnfehler null); der korrigierte Fehler wächst monoton mit der Basislinie und bleibt bei mäßigen Basislinien ≪ dem unkorrigierten; differenziell schlägt eigenständig mit deutlichem Abstand (> { "2" }×); das Schutzniveau entspricht einem direkten Aufruf von <c9/> und skaliert mit dem Residuum σ; eine unterbestimmte Geometrie gibt <c10/> zurück; das Szenario ist deterministisch (mit Seed) und wird über <c11/> abgesetzt. <b>Ehrlicher Geltungsbereich:</b> <b>MODELLED</b> — die Aufhebung des Gleichtakts ist eine exakte Identität, aber das Residuum der räumlichen Dekorrelation ist ein geometrisches Modell <b>erster Ordnung</b>, <b>kein</b> angepasstes Dekorrelationsmodell aus realem Mond-Tracking, und dies ist <b>NICHT</b> mit realen Daten validiert. NovaMoon wird <b>nur als Systemklasse</b> referenziert (illustrativ, aus öffentlichen Quellen, <b>nicht mit der ESA verbunden</b>). Es wird kein TRL, keine Flugerfahrung und keine Billigung durch eine Agentur beansprucht.

# text
# c1: src/lunar_interop.rs
seg-08e8a73f3426 = Lunarer Interoperabilitätsexport — an LunaNet/IOAG ausgerichtete CCSDS-OEM + KIF mit Rundlauf-Übereinstimmung (<c1/>)

# text
# c1: crate::oem::OemFile::to_oem_string
# c2: crate::oem::parse_oem
# c3: crate::interchange::Envelope
# c4: export_lunar_oem
# c5: REF_FRAME
# c6: MOON_ME
# c7: MOON_PA
# c8: TIME_SYSTEM
# c9: LTC
# c10: TCL
# c11: UTC
# c12: CENTER_NAME
# c13: MOON
# c14: crate::lunar_service::LunarSat::position_mci
# c15: export_lunar_time_metadata
# c16: crate::lunar_time::lunar_rate_breakdown
# c17: export_kif_lunar
seg-39b875078d27 = Das lunare Bezugssystem, die lunare Zeitskala und die lunare Ephemeride werden in <b>an LunaNet/IOAG (IOAG: Interagency Operations Advisory Group) ausgerichteten, auf CCSDS beruhenden Austauschformen</b> exportiert. Diese Phase erfindet <b>kein</b> Übertragungsformat: Sie <b>verwendet</b> den bestehenden Emitter und Parser für CCSDS OEM (Orbit Ephemeris Message) { "2.0" } des Crates (<c1/> / <c2/>) und die Hülle des Kshana Interchange Format (<c3/>) wieder, neu etikettiert für den lunaren Kontext. <c4/> setzt das <c5/> des OEM auf das <b>mondfeste Bezugssystem nach IAU { "2015" } WGCCRE</b> (<c6/> Mean-Earth oder <c7/> Hauptachsen), <c8/> auf die <b>lunare Zeitskala</b> (<c9/> / <c10/> / <c11/>) und <c12/> auf <c13/>, über eine beispielhafte <b>illustrative, aus öffentlichen Quellen stammende Ephemeride der Klasse LCNS</b> (Positionen aus <c14/>, Geschwindigkeit durch zentrale finite Differenz). <c15/> gibt einen an LunaNet/IOAG ausgerichteten Deskriptor der Mondzeit aus (Skalen-ID, säkulare Rate µs/Tag aus <c16/>, das veröffentlichte Band { "56" }–{ "59" } µs/Tag, Bezugsfläche), der über serde_json im Rundlauf geführt wird. <c17/> packt OEM + Deskriptor + Bezugssystembezeichnung in die bestehende KIF-Hülle mit dem Ehrlichkeitshinweis MODELLED.

# text
# c1: oem.rs
# c2: crate::oem::parse_oem
# c3: oem_conformance
# c4: REF_FRAME
# c5: MOON_*
# c6: TIME_SYSTEM
# c7: META_START … META_STOP
# c8: TIME_SYSTEM
# c9: parse_lunar_time_metadata
# c10: Envelope::parse
seg-bbfce5323abb = Die <b>unabhängige Referenz</b> ist Rundlauf / Übereinstimmung der Felder. Da <c1/> <em>beide</em> Richtungen mitliefert, wird das OEM über <c2/> im Rundlauf geführt (zurück zu einem gleichen Segment, wobei lunares System/lunare Zeit und Zustandsanzahl erhalten bleiben) <b>und</b> unabhängig durch <c3/> geprüft, das verifiziert, dass jedes erforderliche Header-Schlüsselwort von CCSDS/LunaNet vorhanden ist, dass <c4/> ein lunares <c5/>-Token trägt und <c6/> nicht leer ist, dass die Rahmung <c7/> hält und dass die Datenzeilen für Position+Geschwindigkeit wohlgeformt sind — und eine strukturierte Bestanden-Aussage plus die Liste der vorhandenen/fehlenden Felder zurückgibt, sodass ein fehlerhafter Export (z. B. ein fehlendes <c8/>) erkannt und benannt wird. Die Zeitmetadaten laufen über <c9/> im Rundlauf, und die KIF-Hülle läuft über <c10/> im Rundlauf zu gleichen Artefakten, die den Hinweis MODELLED tragen.

# text
# c1: export_lunar_oem
# c2: export_lunar_time_metadata
# c3: parse_lunar_time_metadata
# c4: export_kif_lunar
# c5: oem_conformance
# c6: LunarInteropScenario
# c7: InternalConsistency
# c8: crate::oem::parse_oem
# c9: crate::interchange::Envelope::parse
# c10: lunar_interop::tests
# c11: REF_FRAME
# c12: MOON_ME
# c13: MOON_PA
# c14: TIME_SYSTEM
# c15: LTC
# c16: TCL
# c17: CENTER_NAME = MOON
# c18: TIME_SYSTEM
# c19: oem_conformance
# c20: run_toml
seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Unabhängige Referenz: <c7/></b> — deterministischer Rundlauf (CCSDS OEM über <c8/>; KIF über <c9/>; Zeitmetadaten über serde_json) plus Übereinstimmung der Feldnamen mit der veröffentlichten Feldsemantik von CCSDS OEM + LunaNet/IOAG. Tests (<c10/>): Das exportierte OEM trägt die lunaren Token <c11/> (<c12/>/<c13/>) und <c14/> (<c15/>/<c16/>), <c17/>, das Objekt und wohlgeformte Datenzeilen; die Metadaten der Mondzeit laufen im Rundlauf (Rate/Band/Bezug) und weisen Müll zurück; die KIF-Hülle wird serialisiert und deserialisiert zu einem gleichen Wert, wobei der Ehrlichkeitshinweis MODELLED vorhanden ist; ein absichtlich fehlerhaftes OEM (ohne <c18/>) fällt bei <c19/> durch und wird als fehlend gemeldet; das Szenario wird über <c20/> abgesetzt. <b>Ehrlicher Geltungsbereich:</b> Die <b>Namen/Einheiten</b> der Felder sind an <b>öffentliche</b> Standards ausgerichtet (CCSDS 502.0-B OEM, mondfeste Bezugssysteme nach IAU WGCCRE { "2015" }, die LunaNet Interoperability Specification / die lunare Architektur der IOAG); der Export ist <b>MODELLED</b> — deterministischer Rundlauf + Übereinstimmung der Feldnamen ist die unabhängige Referenz, dies ist <b>KEIN</b> zertifizierter Test der Interoperabilität auf Übereinstimmung mit Standards, die Ephemeride ist <b>illustrativ, aus öffentlichen Quellen, nicht mit der ESA verbunden</b>, und es wird kein TRL, keine Flugerfahrung und keine Billigung durch eine Agentur beansprucht.

# text
seg-69a214b7236d = Vorab registrierte Vorhersagen

# text
# c1: docs/predictions/
# c2: tests/prediction_frozen.rs
seg-343fe86f6a50 = Eine vorab registrierte Vorhersage ist ein MODELLED-Ergebnis, das eingefroren wird, bevor Daten existieren, mit denen es bewertet werden kann, wobei das Bewertungsprotokoll zugleich festgelegt wird. Sie ist keine Validierung und fügt keine Zeile im Register hinzu. Jede liegt in <c1/>, mit ihren eingefrorenen Eingaben, ihrem Ergebnis und deren SHA-256-Hashes, und <c2/> schlägt fehl, wenn sich ein eingefrorenes Byte bewegt; auf eine geänderte Annahme wird mit einer neuen, datierten Vorhersage neben der alten geantwortet, nie durch deren Änderung.

# text
seg-e65d79893e2c = Vorhersage

# text
seg-f9e2d4b52b79 = Eingefroren

# text
seg-dd68891f75e2 = Bewertet gegen

# text
seg-d5a09f26a028 = Abdeckung durch lunare Referenzstationen

# text
seg-c68f124a16e7 = c05dac1d, 2026-10-12

# text
seg-293404a9cb92 = veröffentlichte Genauigkeit, Verfügbarkeit, Abdeckung und Schutzniveaus einer differenziellen lunaren Station am Südpol, von beliebiger Seite

# text
seg-4e7d9449a880 = noch nicht bewertet (keine veröffentlichten Ergebnisse)

# text
# c1: src/representativeness.rs
seg-ad1995b3ed17 = Repräsentativität der Demonstration & Register der Lücken bis zum Flug (<c1/>)

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: verification
seg-86b70551c37f = Ein Simulationsergebnis ist als Nachweis nur dann nützlich, wenn es auf seiner Vorderseite angibt, woran es verankert ist, was es annimmt und was es noch von einem Flugsystem trennt. Das Register der Repräsentativität macht dies zu einer erstklassigen, maschinell geprüften Ausgabe: Ein Eintrag <c1/> trägt die externen <c2/> der Demonstration, ihre modellierten Annahmen, ihre <c3/> bis zum Flug (jede mit der Phase/Aktivität, die sie schließen würde) und das TRL-Band, für das sie repräsentativ ist. Es ist das Gegenstück je Ergebnis zur Matrix <c4/> auf Ebene der Fähigkeiten.

# text
# c1: representativeness::tests
# c2: Validated
# c3: ExternalDataset
# c4: Modelled
# c5: PartnerOwned
seg-ccd039d5e6a4 = Die <b>unabhängige Referenz</b> ist ein Satz geschlossener Invarianten, durchgesetzt durch <c1/>: Ein Eintrag <c2/> muss mindestens einen Anker <c3/> auflisten (eine Simulation kann nicht gegen sich selbst validiert werden); ein Eintrag <c4/> muss mindestens eine Lücke bis zum Flug auflisten und darf kein repräsentatives TRL-Band über { "4" } beanspruchen (eine Reifung darüber hinaus braucht Hardware-/Flugnachweise, was eine Lücke ist, keine Ausgabe einer Simulation); das TRL-Band muss wohlgeformt sein; und ein Eintrag <c5/> darf nichts behaupten. Diese Invarianten setzen die Disziplin „Repräsentativität begründet + verbleibende Lücken bis zum Flug klar benannt“ operativ um.

# text
seg-6b29111096ca = Register der Repräsentativität & der Lücken bis zum Flug

# text
# c1: Representativeness
# c2: Anchor
# c3: Gap
# c4: check
# c5: is_valid
# c6: report
# c7: to_json
# c8: InternalConsistency
# c9: verification
# c10: representativeness::tests
# c11: verification
seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Unabhängige Referenz: <c8/></b> — geschlossene Invarianten der Ehrlichkeit, gebunden an die Grenze zwischen Status und Art der unabhängigen Referenz in <c9/>. Tests (<c10/>): Ein Eintrag mit Status validiert ohne externen Anker fällt durch; ein interner Anker (ReferenceImpl) erfüllt „validiert“ nicht; ein Eintrag mit Status modelliert ohne Lücke fällt durch; ein Eintrag mit Status modelliert über TRL { "4" } fällt durch; fehlerhafte TRL-Bänder werden erkannt; der Eintrag wird mit den erwarteten Feldern nach JSON serialisiert und ergibt einen lesbaren Bericht. <b>Ehrlicher Geltungsbereich:</b> Das Register prüft die <em>Einordnung</em> der Nachweise eines Ergebnisses — es beweist nicht, dass die benannten Anker zu laufenden Tests führen (diese werden kuratiert, genau wie die Matrix <c11/>); die Aussage „maschinell geprüft“ beschränkt sich auf die Invarianten zu Status/Anker/Lücke/TRL.

# text
# c1: src/qtrade.rs
seg-7e9190395eb6 = Einheitlicher Nachweis des Vergleichs Quanten gegen klassisch (<c1/>)

# text
# c1: TradeEvidence
# c2: quantum_trade
# c3: crossover
seg-534e48755e2c = Jeder Anwendungsbereich des Quanten-PNT beantwortet dieselbe Frage auf dieselbe Weise: Man legt einen Vergleichsrahmen fest (Szenario + Seed + Engine-Version), führt einen Quantenkandidaten und eine klassische Basislinie über einen neutralen Codepfad, bewertet beide an gemeinsamen Kennzahlen und berichtet — mit einem Konfidenzintervall und einer ehrlichen Kennzeichnung validiert/modelliert —, wo die Quanten gewinnen und wo nicht. <c1/> gibt dieser Antwort eine einzige Form, sodass die Bereiche Zeitgebung, Navigation und Anomalieerkennung alle <b>dasselbe</b> reproduzierbare, ehrlich gekennzeichnete Objekt ausgeben. Es implementiert keinen Vergleich neu: Die Zahlen je Kennzahl stammen aus den bestehenden Engines (<c2/>, <c3/> und den Modulen der Bereiche); dies ist der Vertrag plus die Hülle für Reproduzierbarkeit/Repräsentativität, aufgebaut auf dem Register der Repräsentativität und den Kennzeichnungen der Verifikation.

# text
# c1: qtrade::tests
# c2: >1
# c3: quantum_trade::TradeResult
# c4: Validated
seg-5a52fb6670d1 = Die <b>unabhängige Referenz</b> sind Identitäten für Nutzen/Gewinner in geschlossener Form plus eine getreue Hülle um die bestehende Ausgabe des Vergleichs. <c1/>: Das Nutzenverhältnis ist polaritätsrichtig (so ausgerichtet, dass <c2/> immer bedeutet, dass die Quantenseite besser ist, sowohl für Kennzahlen, bei denen mehr besser ist wie Holdover, als auch für solche, bei denen weniger besser ist wie Fehler); ein aus einem realen <c3/> gebautes Nachweisobjekt reproduziert seine Nutzenverhältnisse; unehrliche Nachweise werden abgewiesen (eine modellierte Repräsentativität ohne Lücke oder eine Kennzahl <c4/>, deren Vergleichseintrag keinen externen Anker trägt); JSON ist deterministisch und trägt die Felder Rahmen/Seed/Engine/Kennzahl/Repräsentativität.

# text
seg-ae87cea429ba = Nachweis des Vergleichs Quanten gegen klassisch

# text
# c1: TradeEvidence
# c2: TradeFom
# c3: TradeFrame
# c4: Winner
# c5: InternalConsistency
# c6: quantum_trade::TradeResult
# c7: qtrade::tests
# c8: TradeEvidence
seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Unabhängige Referenz: <c5/></b> — Identitäten für Nutzen/Gewinner in geschlossener Form + getreue Hülle um <c6/>; Ehrlichkeit gebunden an das Register der Repräsentativität und an die Grenze zwischen Status und Art der unabhängigen Referenz in der Verifikation. Tests (<c7/>) wie oben. <b>Ehrlicher Geltungsbereich:</b> Das Gerüst vereinheitlicht, <em>wie</em> ein Vergleich berichtet und reproduziert wird; die zugrunde liegende Physik je Kennzahl ist das, was die beitragende Engine liefert, mit ihrer eigenen Kennzeichnung validiert/modelliert — <c8/> stuft eine modellierte Kennzahl nicht zu einer validierten hoch.

# text
# c1: src/quantum_devices.rs
seg-ce13223e04d0 = Bibliothek von Fehlermodellen für Quantengeräte (<c1/>)

# text
# c1: DeviceCard
# c2: holdover::QuantumClockClass
# c3: clock_state::ClockClass
# c4: quantum_trade
# c5: crossover
# c6: timetransfer_adv
# c7: σ_t ≈ jitter/√(R·τ)
# c8: R
# c9: τ
# c10: √(1 + dark/R)
seg-c206fc7d58d6 = Ein einziger Ort, der die Quanten-PNT-Geräte bereitstellt, zwischen denen der Demonstrator abwägt — optische Uhren / Uhren mit gespeicherten Ionen / Quecksilberionenuhren, klassische Referenzuhren, das Kaltatom-Interferometer und Zeitübertragungsstrecken —, jeweils als <c1/> mit ihrer Hauptspezifikation und einem Eintrag zur Repräsentativität. Der Großteil der Gerätephysik wird <b>wiederverwendet</b> (Uhrenstabilitäten aus <c2/> und <c3/>; das Kaltatom-Interferometer aus <c4/>/<c5/>; klassische optische/HF-Strecken aus <c6/>). Das einzige wirklich neue Modell ist die <b>Zeitübertragungsstrecke mit Verschränkung / Einzelphotonen</b>, deren Zeitgebungspräzision durch das Schrotrauschen begrenzt ist: <c7/> in der detektierten Koinzidenzrate <c8/> und der Integration <c9/>, verschlechtert durch einen Dunkelzählungsaufschlag <c10/> und nach unten durch eine nicht reduzierbare Systematik begrenzt.

# text
# c1: quantum_devices::tests
# c2: 1/√τ
seg-7e8f4f3a5442 = Die <b>unabhängige Referenz</b> sind die wiederverwendeten veröffentlichten Koeffizienten von Uhr/CAI plus Identitäten für Schrotrauschen/Verlust in geschlossener Form. <c1/>: Die Rangfolge der wiederverwendeten Uhrenstabilitäten ist plausibel (optisches Gitter < Quecksilberion < CSAC in σ_y({ "1" } s)); die Präzision der Verschränkung verbessert sich bei Begrenzung durch Schrotrauschen wie <c2/> ({ "4" }× Integration halbiert σ); die detektierte Koinzidenzrate fällt um { "10" }× je { "10" } dB Streckenverlust; Dunkelzählungen verschlechtern die Präzision monoton; der Boden der Systematik begrenzt die Präzision nach unten; jede Gerätekarte ist ein gültiger, modellierter Repräsentativitätseintrag.

# text
# c1: DeviceCard
# c2: quantum_clock_card
# c3: classical_clock_card
# c4: EntanglementTimeLink
# c5: InternalConsistency
# c6: quantum_devices::tests
seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Unabhängige Referenz: <c5/></b> — wiederverwendete veröffentlichte Koeffizienten von Uhr/CAI + Identitäten für Schrotrauschen/Verlust in geschlossener Form für die Verschränkungsstrecke. Tests (<c6/>) wie oben. <b>Ehrlicher Geltungsbereich:</b> Die Geräteparameter von Uhr/CAI werden aus den bestehenden Modellen mit veröffentlichten Koeffizienten der Engine wiederverwendet; das Modell der Verschränkungsstrecke ist MODELLED aus dem veröffentlichten Verhalten der Quanten-Uhrensynchronisation mit illustrativen Werten für Paarrate/Effizienz/Verlust aus öffentlichen Quellen — es ist <b>nicht</b> gegen eine gemessene Strecke validiert, und reale Hardware für Quelle/Kanal/Detektor ist eine benannte Lücke bis zum Flug.

# text
# c1: src/timetransfer_chain.rs
seg-f6d8e7ad6bec = Vertrauenswürdige Quantenzeitgebung — durchgängige Kette, sichere Verteilung, Anomalie + Vergleich (<c1/>)

# text
# c1: quantum-time-transfer
# c2: tpl
# c3: 1 − P_md
# c4: detection
# c5: qtrade::TradeEvidence
seg-3160cfec0d1f = Das Szenario <c1/> setzt die Zeitgebungskette zusammen, die ein Quanten-PNT-Demonstrator braucht: ein durchgängiges Nutzerzeitbudget (Auslauffehler der Referenzuhr und Zeitgebungspräzision der Strecke quadratisch kombiniert) für eine <b>Quanten</b>kette (optische Gitteruhr + Strecke mit Verschränkung/Einzelphotonen) gegenüber einer <b>klassischen</b> Kette (CSAC + HF-Zweiwegestrecke); ein <b>Zeitgebungs-Schutzniveau</b> (TPL, aus <c2/> wiederverwendet), das den unentdeckten Zeitfehler begrenzt; eine <b>Sicherheitskennzahl gegen Verzögerungs-/Wiederholungsangriffe</b> <c3/> bei einer genannten Fehlalarmrate (aus <c4/> wiederverwendet); eine <b>Detektionswahrscheinlichkeit für Uhranomalien + Latenz der Änderungserkennung mit CUSUM (cumulative sum)</b>; und der Vergleich Quanten gegen klassisch als ehrliches <c5/> mit einem Eintrag zu Repräsentativität + Lücken bis zum Flug.

# text
# c1: detection::analytic_pd
# c2: analytic_pmd
# c3: timetransfer_chain::tests
# c4: is_honest()
seg-6fa095264bdc = Die <b>unabhängige Referenz</b> ist ein quadratisches Budget in geschlossener Form über wiederverwendete, getrennt validierte Kernel (ADEV gegenüber Stable32/NIST; die TPL-Schranke; <c1/>/<c2/>). <c3/>: Die Quantenpräzision verbessert sich mit der Integrationszeit; die Quantenkette kann die Präzisionskennzahl gewinnen <em>und</em> verlieren (ehrlich — kein universeller Sieg; eine sehr verlustbehaftete Strecke kehrt das Ergebnis um); das Schutzniveau ist endlich und positiv; die Sicherheitskennzahl liegt in [{ "0,1" }] und wächst mit der Angriffsverzögerung; die Detektionswahrscheinlichkeit der Anomalie ist monoton in der Fehlergröße; und der Nachweis des Vergleichs ist in sich ehrlich (<c4/>).

# text
seg-42a7d1170cc3 = Vertrauenswürdige Quantenzeitgebung (Kette + sichere Verteilung + Anomalie + Vergleich)

# text
# c1: QuantumTimeTransferScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-time-transfer"
# c5: InternalConsistency
# c6: timetransfer_chain::tests
# c7: quantum_devices
seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Unabhängige Referenz: <c5/></b> — quadratisches Budget in geschlossener Form über wiederverwendete validierte Kernel (ADEV/Stable32-NIST, TPL-Schranke, analytisches Pd/Pmd der Detektion); Ehrlichkeit gebunden an das Register der Repräsentativität. Tests (<c6/>) wie oben. <b>Ehrlicher Geltungsbereich:</b> Die Parameter von Uhr/Strecke sind illustrativ, aus öffentlichen Quellen; die Verschränkungsstrecke ist das durch Schrotrauschen begrenzte Modell MODELLED aus <c7/>; dies modelliert die <em>Klasse</em> eines Systems für vertrauenswürdige Zeitgebung — es ist <b>nicht</b> gegen eine gemessene durchgängige Strecke validiert, und reale Hardware für Uhr/Strecke/Weltraumkanal ist eine benannte Lücke bis zum Flug; es wird kein TRL, keine Flugerfahrung und keine Zertifizierung beansprucht.

# text
# c1: src/quantum_nav_od.rs
seg-c6ae292a6331 = GNSS-freie Quantennavigation (<c1/>)

# text
# c1: quantum-gnss-free-nav
# c2: inertial::quantum_imu
# c3: quantum_trade
# c4: qtrade::TradeEvidence
seg-f34f784e928c = Das Szenario <c1/> vergleicht die Koppelnavigation während eines GNSS-Ausfalls mit einem <b>Quanten</b>-Inertialbudget (ein Beschleunigungsmesser als Kaltatom-Interferometer, aus <c2/>/<c3/> wiederverwendet, dessen CAI-Boden des weißen Rauschens auf innerhalb von ~{ "2" } Größenordnungen von Freier et al. { "2016" } validiert ist) gegenüber einem <b>klassischen</b> INS der Navigationsklasse. Es meldet das Wachstum des Positionsfehlers über den Auslauf, die Holdover-Zeit bis zu einer Positionsschwelle und den Vergleich Quanten gegen klassisch als ehrliches <c4/>. Die Beobachtbarkeit wird ehrlich benannt: Ohne externen Fix während des Ausfalls ist der Bias des Beschleunigungsmessers nicht beobachtbar, sodass der Positionsfehler unbegrenzt wächst (≈ ½·Bias·t² plus ein Term des Geschwindigkeits-Random-Walks); ein Quantensensor mit geringerem Bias <em>verlangsamt</em> dieses Wachstum, schließt die Lücke aber nicht — das tut nur ein externer Fix.

# text
# c1: QuantumNavBudget
# c2: ClassicalInsBudget
# c3: PositionDrift
# c4: quantum_nav_od::tests
seg-4cfde3de8f94 = Die <b>unabhängige Referenz</b> sind die wiederverwendeten Inertialbudgets (<c1/>/<c2/>, beide implementieren den Trait <c3/>) plus Identitäten der Drift in geschlossener Form. <c4/>: Das Quantenbudget schlägt das klassische über einen langen Ausfall (geringerer Fehler, längerer Holdover); der Fehler wächst bei beiden mit der Ausfalldauer (die Lücke der Beobachtbarkeit); der Vorteil hängt vom Ausfall ab und ist kein konstanter Gewinnfaktor (die Quantenkurve wird bei kurzem Auslauf vom Rauschen dominiert, bei langem vom Bias); der Nachweis des Vergleichs ist in sich ehrlich.

# text
# c1: QuantumNavOdScenario
# c2: Report
# c3: to_svg
# c4: kind="quantum-gnss-free-nav"
# c5: InternalConsistency
# c6: quantum_nav_od::tests
seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Unabhängige Referenz: <c5/></b> — wiederverwendete Inertialbudgets (CAI durch Wiederverwendung validiert, ~{ "2" } Größenordnungen gegenüber Freier { "2016" }; klassische Drift in geschlossener Form); Ehrlichkeit gebunden an das Register der Repräsentativität. Tests (<c6/>) wie oben. <b>Ehrlicher Geltungsbereich:</b> ein statischer Budgetvergleich der Koppelnavigation, kein dynamischer Filter auf realen Trajektorien; der ohne Fix nicht beobachtbare Bias wird benannt; die Geräteparameter sind illustrativ, aus öffentlichen Quellen; modelliert die <em>Klasse</em> der GNSS-freien Quantennavigation — reale Kaltatom-IMU-Hardware, eine dynamische Plattform und die Flugumgebung sind benannte Lücken bis zum Flug; kein Anspruch auf TRL/Flug/Zertifizierung.

# text
# c1: src/quantum_faults.rs
seg-e23e583ecf21 = Fehler-/Anomalieerkennung für Quanten-PNT-Systeme (<c1/>)

# text
# c1: quantum-anomaly-detect
# c2: qtrade::TradeEvidence
seg-6e6df91ae779 = Das Szenario <c1/> definiert einen gekennzeichneten Katalog von Quanten-PNT-Fehlern (Frequenzsprung der Uhr, Drift, Verlust der Verriegelung; Bias-Stufe des Sensors, Aussetzer), bewertet eine Detektionsstatistik auf nominellen gegenüber fehlerbehafteten Fenstern und meldet die Trennschärfe des Detektors als ROC-AUC und als minimal detektierbaren Fehler bei einer festen Fehlalarmrate. Der Blickwinkel Quanten gegen klassisch: Eine stabilere Quantenuhr als Referenz senkt das Rauschen σ des Monitors, sodass sie kleinere Fehler detektiert — ausgegeben als ehrliches <c2/> mit einem Eintrag zur Repräsentativität.

# text
# c1: N(0,σ)
# c2: N(μ,σ)
# c3: AUC = Φ(μ/(σ√2))
# c4: eval_stats::bootstrap_auc_ci
# c5: detection
# c6: quantum_faults::tests
seg-eeb3c7d1f507 = Die <b>unabhängige Referenz</b> ist eine AUC in geschlossener Form für die gaußsche Detektionsstatistik (nominell <c1/>, Fehler <c2/> ⇒ <c3/>), gegengeprüft gegen das extern validierte <c4/> (validiert gegenüber scikit-learn) und die analytischen Schwellen von <c5/>. <c6/>: Die analytische AUC stimmt mit bekannten Werten überein ({ "0.5" } bei μ={ "0" }, →{ "1" } für großes μ/σ, monoton); das empirische Bootstrap-Konfidenzintervall der AUC schließt die geschlossene Form ein; der Quantenmonitor hat eine höhere AUC und einen kleineren minimal detektierbaren Fehler; der Vorteil verschwindet bei riesigen Fehlern (beide detektieren perfekt — kein universeller Abstand); der Katalog hat fünf gekennzeichnete Klassen; der Vergleich ist in sich ehrlich.

# text
seg-9dda4ab0647a = Fehler-/Anomalieerkennung für Quanten-PNT

# text
# c1: FaultKind
# c2: QuantumAnomalyScenario
# c3: Report
# c4: analytic_auc
# c5: min_detectable_fault
# c6: kind="quantum-anomaly-detect"
# c7: InternalConsistency
# c8: eval_stats
# c9: detection
# c10: quantum_faults::tests
seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Unabhängige Referenz: <c7/></b> — gaußsche AUC in geschlossener Form, gegengeprüft gegen die extern validierte Bootstrap-AUC von <c8/> (gegenüber scikit-learn) und die analytischen Schwellen von <c9/>. Tests (<c10/>) wie oben. <b>Ehrlicher Geltungsbereich:</b> Die Detektionsstatistik ist ein gaußsches Modell, keine reale Telemetrie; der Fehlerkatalog ist gekennzeichnet-synthetisch; die Rauschniveaus des Quanten-/klassischen Monitors sind illustrativ, aus öffentlichen Quellen; modelliert die <em>Klasse</em> der Anomalieerkennung für Quanten-PNT — reale Hardware-Telemetrie mit Wahrheitskennzeichnungen ist eine benannte Lücke bis zum Flug; kein Anspruch auf TRL/Flug/Zertifizierung.

# text
seg-24ad75143bed = Übereinstimmung mit Standards — Austauschformate, Link-Budget & Integrität (Prüfungen gegen externe unabhängige Referenzen)

# text
seg-9d31773e0ecd = Diese Standards werden validiert, indem die <b>wörtlichen Rechenbeispiele / Referenzwerte, die in den Standards selbst veröffentlicht sind</b> (oder in einer unabhängigen Referenzimplementierung), zurückgewonnen werden, nicht durch Kshanas eigenen Rundlauf. Das Beispiel im Anhang eines Standards zurückzugewinnen, ist die stärkste verfügbare Prüfung der Übereinstimmung für einen Parser eines Austauschformats.

# text
seg-7ec3d508c64f = Externe unabhängige Referenz

# text
seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

# text
# c1: tests/ccsds_reference.rs
# c2: parse_oem
# c3: -063.042
# c4: tests/fixtures/ccsds/oem_502_b3_figG11.oem
seg-65de0a1335d6 = <c1/>: <c2/> gewinnt die exakten Epochen und die Zustandsvektoren X/Y/Z/Ẋ/Ẏ/Ż des KVN-OEM-Beispiels in <b>CCSDS 502.0-B-3, Anhang G §G6, Abbildung G-11</b> („OEM Example with No Acceleration, No Covariance“, S. G-10) zurück — beide Ephemeridensegmente, einschließlich der Quellwerte mit führender Null (<c3/>). Der Prüfkörper <c4/> ist zeichengenau aus dem offiziellen Blue Book reproduziert (die redaktionellen Markierungen „< intervening data records omitted here >“, die keine gültigen OEM-Datensätze sind, sind nicht enthalten).

# text
seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

# text
# c1: tests/ccsds_reference.rs
# c2: TdmFile::parse
# c3: tests/fixtures/ccsds/tdm_503_b2_figE9.tdm
# c4: reference.tdm
# c5: src/ccsds_tdm.rs
seg-a5c6b58e0053 = <c1/>: <c2/> gewinnt alle { "41" } RANGE-Datensätze (erster { "3198.03679519614" } km, letzter { "3270.46440460551" } km) und die Metadaten des KVN-TDM-Beispiels in <b>CCSDS 503.0-B-2, Anhang E, Abbildung E-9</b> („Range Data with TIMETAG_REF=TRANSMIT“, S. E-9) zurück. Der Prüfkörper <c3/> ist wörtlich aus dem Blue Book. (Dies ist die unabhängige Referenz aus dem veröffentlichten Blue Book neben dem bereits vorhandenen, von Hand verfassten Rundlauf <c4/> in <c5/>.)

# text
seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

# text
# c1: primary_header_matches_published_independent_test_vectors
# c2: spacepackets
# c3: tests/ccsds/test_space_packet.py
# c4: 18 02 40 34 00 16
# c5: 1F FF FF FF FF FF
seg-aaffd3d25c5f = <c1/>: Der Encoder reproduziert die Testvektoren des Primär-Headers auf Byte-Ebene der unabhängigen <b>Bibliothek <c2/></b> (us-irs/spacepackets-py, <c3/>) — z. B. <c4/> und das Maximum in allen Bits <c5/> — plus den kanonischen Telemetriefall (TM) mit lauter Einsen, jeweils im Rundlauf durch das Dekodieren geführt. Breiten/Reihenfolge der Bitfelder nach <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

# text
seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (Link-Budget, DSN 810-005)

# text
# c1: link_equation_reproduces_descanso_galileo_dct
seg-c6caa639e1c6 = <c1/>: Die Kette aus FSPL (Freiraumdämpfung) und C/N₀ reproduziert die veröffentlichte Entwurfs-/Kontrolltabelle der Deep-Space-Telemetrie aus <b>J. H. Yuen (Hrsg.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), Tabelle 1-1</b> — den Downlink von Galileo im X-Band ({ "8420.43" } MHz) bei { "6.37" } AU: Freiraumdämpfung <b>{ "290.54" } dB</b> (<{ "0.05" } dB) und empfangenes <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Die Bandmitten liegen innerhalb der Downlink-Zuweisungen für den Deep Space nach DSN/CCSDS-401 (DSN 810-005 Modul { "201" }). Die <em>Standard-Missionsparameter</em> bleiben repräsentativ (kein kalibrierter Transponder); festgelegt wird die Link-<em>Gleichung</em>.

# text
seg-c2cee7d5c7b1 = GNSS-Standards — Status der externen unabhängigen Referenz und die ehrlichen verbleibenden Lücken:

# text
seg-d8f653b3c955 = Status & ehrlicher Vorbehalt

# text
# c1: tests/raim_reference.rs
# c2: src/araim_reference.rs
# c3: tests/araim_reference_vectors.rs
# c4: TOL_PL
# c5: araim-reference-check
# c6: N_fault,max = 1
# c7: ARAIM_REFERENCE.md
seg-fff735bd32a1 = <b>Kernel, Geometrie und das ARAIM-Schutzniveau extern validiert.</b> Der <em>Kernel</em> der Detektion — die χ²-Schwelle der Fehlerdetektion, die Nichtzentralität der nicht zentralen χ²-Verteilung für die verpasste Detektion und die K-Multiplikatoren des Normalgesetzes — reproduziert <b>SciPy</b> (<c1/>, { "171" } Fälle, ≤ { "1e-6" } rel), und die umgebende Geometrie reproduziert <b>gnss_lib_py</b> (DOP). Auch der <em>Wert</em> des ARAIM-Schutzniveaus (PL) ist nun festgelegt: gegen das „numerische Beispiel LPV-200 (LPV: localizer performance with vertical guidance)“ des ARAIM Reference ADD (Algorithm Description Document) v3.1 von WG-C (WG: Working Group) liefern <c2/> / <c3/> VPL { "18.2926" } m gegenüber { "18.3" } m, HPL { "13.4063" } m gegenüber { "13.45" } m und σ_v,acc { "1.3694" } m gegenüber { "1.3694" } m, innerhalb des eigenen <c4/> = { "0.05" } m der Referenz (die Art <c5/>). Geltungsbereich: Fehlermodi bis zu einem Satelliten oder einer Konstellation (<c6/>); Fehlerteilmengen mit mehreren Ereignissen und der Ausschluss sind nicht implementiert, und für klassisches RAIM gibt es weiterhin <b>keinen kanonischen veröffentlichten Testvektor von der Eingabe zum HPL</b>. Siehe <a1><c7/></a1>.

# text
# c1: sbas_protection_level
# c2: zsiki/rtklib_ws
# c3: waasprotlevels()
# c4: tests/sbas_reference.rs
# c5: core/filter.c
# c6: K_H,PA=6.0
# c7: K_V=5.33
# c8: K_H,NPA≈6.18
# c9: Φ⁻¹(1−5e-8)=5.3267
# c10: d_U
seg-e6a47dfb7e54 = <b>Algorithmus des Schutzniveaus nun extern validiert.</b> Bei gegebenem (el, az, σ) je Satellit reproduziert <c1/> von kshana den <b>RTKLIB-SBAS-PL-Fork</b> (<c2/> <c3/>, Siki & Takács { "2017" }, „DO-229D Appendix J“) — gespeist mit dem <b>eigenen</b> σ dieses Werkzeugs, berechnet aus <b>realen EGNOS</b>-Broadcast-Nachrichten + realen BUTE-RINEX — auf <b>< { "2e-3" } m HPL</b> über { "6" } Epochen (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) bestätigte dieselbe Konvention. Die K-Faktoren (<c6/>, <c7/>, <c8/>) entsprechen DO-229E Appendix J. <b>Was validiert ist und was nicht:</b> Dies legt den <em>Algorithmus</em> des PL fest (σ hinein → HPL/VPL heraus); die vorgelagerte <em>Modellierung</em> von σ aus rohen UDRE/GIVE-Nachrichten liegt außerhalb des Geltungsbereichs von kshana — dort weichen unabhängige <em>Werkzeuge der vollen Pipeline</em> bei realen Daten weiterhin um Meter voneinander ab. K_V stimmte beim gerundeten Wert der unabhängigen Referenz von { "5.33" } überein (das exakte <c9/> von kshana → VPL ~{ "0.06" } % kleiner; die Vertikale ist K-Faktor-frei als <c10/> validiert).

# text
# c1: ionmodel
# c2: tests/klobuchar_reference.rs
# c3: src/ionex.rs
seg-4ef39e8ea75c = <b>Broadcast-Modell extern validiert.</b> Das Klobuchar-Modell L1 reproduziert <b><c1/> von RTKLIB</b> (<c2/>, < { "1e-4" } m) — <em>Implementierungsparität</em> mit der De-facto-Referenz als offene Quelle, da es kein offizielles Rechenbeispiel mit <em>gemessener Wahrheit</em> gibt. Der Leser für TEC-Karten im IONEX-Format existiert nun (<c3/>, mit Unit-Tests); die verbleibende Lücke ist ein Gegenvergleich mit einem realen GIM-Produkt, nicht das Broadcast-Modell. Siehe die Zeilen zu Klobuchar unter <a1>Aussagen gegenüber der Realität</a1>.

# text
seg-fa3058dffb2a = GPS-L1-C/A-Spreizcode (IS-GPS-200)

# text
seg-53ac231770fb = Codeerzeugung extern validiert.

# text
# c1: src/sdr.rs
# c2: ca_first_ten_chips_match_is_gps_200_octal
# c3: navsignal
seg-04db7c613bd5 = <c1/> (<c2/>): Der LFSR-Generator (linear-feedback shift register) G1/G2 für den C/A-Code reproduziert die <b>veröffentlichten Codephasenzuordnungen in IS-GPS-200 Tabelle 3-Ia</b> — das Oktal der ersten zehn Chips für PRN (pseudo-random noise) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }) — exakt. Dies legt die <b>Chipfolge des Spreizcodes</b> gegen die GPS-Schnittstellenspezifikation fest; die umgebenden Teile für Modulation, spektrale Trennung und Code-Tracking mit DLL (delay-locked loop) (<c3/>) bleiben MODELLED.

# text
seg-e5f1b960777a = Zeitgebung für Netze, Spektrum, das Sonnensystem, Konstellationen, Kampagnen und LEO-PNT

# text
# c1: VERIFICATION-MATRIX.md
seg-c5bf3b23d688 = Die in der Linie { "0.28" } hinzugefügten Fähigkeiten werden Zeile für Zeile in der erzeugten Datei <a1><c1/></a1> bewertet; dieser Abschnitt fasst zusammen, welche davon eine externe unabhängige Referenz tragen. Eine Zeile ist nur mit einer unabhängigen externen Referenz VALIDATED; alles andere ist MODELLED.

# text
seg-d791a48b3895 = Fähigkeit (Art)

# text
seg-d4779be2efd8 = Externe unabhängige Referenz, oder warum sie MODELLED bleibt

# text
# c1: telecom-timing
seg-0d7bb0fc1c5e = MTIE (maximum time interval error) und TDEV (time deviation) der Telekommunikation auf einer Holdover-Reihe (<c1/>)

# text
# c1: tests/telecom_timing_reference.rs
# c2: TELECOM-TIMING.md
seg-18894b55b6c1 = <c1/>: { "17" } Mittelungsfaktoren für MTIE und { "12" } für TDEV auf einer eingecheckten Holdover-Reihe einer chipskaligen Uhr mit { "2" } 048 Abtastwerten gegen allantools { "2024.06" }, auf < { "1e-12" } / < { "1e-9" } relativ. Die Urteile PASS/FAIL der ITU-T-Maske (International Telecommunication Union Telecommunication Standardization Sector) und die Oszillator-Voreinstellungen aus Datenblättern bleiben MODELLED. Siehe <a1><c2/></a1>.

# text
# c1: slot-timing
seg-ff9cb967ae08 = Holdover-Vorhersage aus einer gemessenen Uhraufzeichnung (<c1/>)

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
seg-7821227795d8 = <c1/>: Anpassung auf dem ersten Drittel der realen Aufzeichnung der Cäsiumuhr 5071A, Vorhersage der Zeit der Überschreitung von einem Sigma bei sechs Schwellen, Messung auf den zurückgehaltenen zwei Dritteln; Zielwert (vorab festgelegt) ein Faktor von { "1.5" } in beide Richtungen, beobachtete Verhältnisse { "0.84" } bis { "1.03" }. Das darauf aufbauende Budget für den Slot-Schutz und die Fixrate bleiben MODELLED.

# text
# c1: spectrum
seg-2667e3ddf829 = Spektrale Leistungsdichten im L-Band in geschlossener Form und spektrale Trennung (<c1/>)

# text
# c1: navsignal
seg-1a0c6ef49f98 = <c1/> geschlossene Formen gegen veröffentlichte Werte (Matrixzeile „Closed-form L-band signal power spectral densities…“). Das Wasserfalldiagramm mit J/S je Band (jammer-to-signal ratio) und effektivem C/N0 (carrier-to-noise density) sowie die Ein-/Ausgabe von SigMF (Signal Metadata Format) bleiben MODELLED.

# text
# c1: solar-system
seg-46278e9c03c1 = Planetenpositionen aus den Standish-Elementen des JPL (Jet Propulsion Laboratory) und Lichtlaufzeit zwischen Körpern (<c1/>)

# text
# c1: tests/solar_system_standish_preregistered.rs
# c2: tests/solar_system_standish_earth_icrf_preregistered.rs
# c3: tests/solar_system_light_time_solver_preregistered.rs
# c4: tests/solar_system_horizons_reference.rs
# c5: body-pnt
seg-43cfeb9f2403 = { "0.30" }, vorab registriert gegen JPL Horizons (DE441): <c1/> und <c2/>, RMS je Planet und Komponente höchstens der Wert aus Tabelle { "8.10.1" } des Explanatory Supplement (schlechtester { "0.778" }), einschließlich der Aufteilung der Erde und der ICRF-Rotation; <c3/>, der Löser der Lichtlaufzeit auf Positionen aus DE441 innerhalb von { "1e-6" } s der Lichtlaufzeit von Horizons (schlechtester Wert { "6.7e-9" } s). Der frühere Vergleich mit der doppelten Nominalgröße (<c4/>), dessen Zielwert nach dem ersten Vergleich festgelegt wurde, wird als nicht maßgebliche Regression beibehalten. Uranus/Neptun aus Tabelle { "1" }, Pluto, die Monde, die Körperkonstanten und <c5/> bleiben MODELLED.

# text
# c1: constellation-design
seg-b96d8ea13c87 = Walker-Geometrie und die veröffentlichten Slots von GPS, Galileo und GLONASS (GLObal NAvigation Satellite System); globale Verdünnung der Genauigkeit bei GPS (<c1/>)

# text
# c1: constellation::tests
seg-85c293b8d235 = <c1/>: Walker 24/3/1 reproduziert die Definitionstabelle des Open Service von Galileo auf { "1e-9" }°, die Slot-Formel der Schnittstellenkontrolle von GLONASS, die Äquatordurchgänge von GPS; der Median des HDOP der GPS-Basislinie { "0.940" } gegenüber { "0.94" } aus dem Leistungsstandard des Standard Positioning Service. Beliebige Abdeckungskarten für mehrere Konstellationen um einen beliebigen Körper bleiben MODELLED.

# text
# c1: campaign
seg-f0187be4b97f = Kampagnen: verkettete Missionen, Durchläufe, Monte-Carlo-Ensembles, Läufe unter gemeinsamen Bedingungen (<c1/>)

# text
# c1: tests/campaign_composition_reference.rs
seg-b5c45fc12e5f = <c1/> ({ "11" } Tests): Eine Kampagne mit einer Phase reproduziert den eigenständigen Lauf Byte für Byte, ein Durchlauf mit einem Knoten liest dieselbe Zahl, ein Ensemble mit Seed ist byte-stabil. Identitäten der Zusammensetzung, keine externe unabhängige Referenz.

# text
seg-bc25d20125e7 = Linkphysik für LEO (low Earth orbit): Regenkoeffizienten nach ITU-R (ITU Radiocommunication Sector) P.838, Regendämpfung und Szintillation nach P.618, Gebäudeeindringdämpfung nach P.2109, Ionosphäre erster Ordnung, maximaler Doppler

# text
# c1: tests/leo_link_reference.rs
# c2: tests/leo_doppler_reference.rs
seg-b1f3bd37d169 = <c1/>, <c2/>: die eigenen Tabellen der ITU-R-Empfehlungen und die Validierungsbeispiele der Study Group { "3" } (eingecheckt mit ihrer Quelle und dem Abrufdatum), das Gruppenlaufzeitverhältnis nach IS-GPS-200 für die Ionosphäre und die veröffentlichte Tabelle des maximalen Dopplers von Leclere, Marathe und Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

# text
# c1: leo-navmsg
seg-492917f11386 = Navigationsnachricht für LEO: der Nutzeralgorithmus der Broadcast-Ephemeride nach dem Galileo-ICD (interface control document), CRC-24Q (24-bit cyclic redundancy check), global gemittelte Gewichte für SISRE (signal-in-space range error) (<c1/>)

# text
# c1: tests/leo_navmsg_reference.rs
seg-514a7da01582 = <c1/>: Der Nutzeralgorithmus von Galileo reproduziert RTKLIB (eine quelloffene Bibliothek für Real-Time-Kinematic-Positionierung) auf { "1" } mm bei vier realen Broadcast-Ephemeriden von Galileo; CRC-24Q ergibt den Prüfwert 0xCDE703 des Katalogs und die Prüfbytes des Beispielrahmens RTCM (Radio Technical Commission for Maritime Services) { "1005" }; die Gewichte für SISRE reproduzieren die veröffentlichte Tabelle für MEO/GEO. Der Fitter, das Update während des Durchgangs, die binäre Kodierung, der Text im Stil von RINEX 4 / CSV (comma-separated values) und die wählbaren Ephemeridenmodelle bleiben MODELLED.

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
# c4: leo-ppp
# c5: ntn-positioning
seg-94bbcd43e03a = LEO-Signalentwurf, Durchgang und Link-Budget, Doppler und gemeinsame Positionierung mit GNSS+LEO, Konvergenz von PPP (precise point positioning), Positionierung mit 5G NTN (non-terrestrial network), Zeitübertragung über LEO (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

# text
# c1: tests/leo_signal_reference.rs
# c2: tests/leo_fusion_scenarios.rs
seg-4c37a8cfac87 = <c1/>, <c2/>: geschlossene Formen, Filterkonsistenz (zum Beispiel das über den Lauf gemittelte NEES des PPP-Filters innerhalb seines Bandes von { "95" }%) und Vergleiche mit veröffentlichten Trends; keine Felddaten.

# text
# c1: leo-pnt-chain
seg-91cf4e399f0a = Ein LEO-PNT-System durchgängig (<c1/>)

# text
# c1: tests/leo_pnt_chain.rs
seg-fb947da2e8b4 = <c1/>: Jeder weitergereichte Wert entspricht der eigenen Ausgabe der vorgelagerten Stufe, und die Änderung einer vorgelagerten Eingabe bewegt jede nachgelagerte Zahl, die von ihr abhängt.

# text
seg-7e230aa73770 = LEO-Resilienz und Vertikalen (Spoofing per Doppler und per bandübergreifender Konsistenz, Sondierung der Ionosphäre)

# text
# c1: tests/leo_resilience_verticals.rs
# c2: RESILIENCE-CROSSWALK.md
seg-ab2542cfc295 = <c1/> ({ "10" } Tests). Die Szenarien zu Resilienz und Vertikalen sind in <a1><c2/></a1> aufgeführt.

# text
# c1: tests/interop_formats.rs
# c2: INTEROP.md
# c3: tests/animation.rs
# c4: tests/advanced_report.rs
# c5: tests/advanced_report_cli.rs
# c6: result.json
seg-2d3ead293658 = Ausgaben, die Darstellungen und keine Nachweise sind, haben Tests, aber keine Matrixzeile: die Austauschexporte (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-Ephemeride (Systems Tool Kit), SigMF (Signal Metadata Format)), jeweils durch einen nach der Spezifikation des Formats geschriebenen Validator wieder eingelesen (<c1/>, { "13" } Tests; siehe <a1><c2/></a1>); die Animationen (<c3/>: byte-identische erneute Läufe, exakte Bildanzahlen, wohlgeformtes SVG (Scalable Vector Graphics), keine externe Adresse im HTML-Player (HyperText Markup Language)); und der Laufbericht (<c4/>, <c5/>: Jedes mitgelieferte Szenario berichtet ohne leeren Abschnitt oder Platzhalterwert, die Kennzeichnungen stimmen mit der Matrix überein, und der aufgezeichnete Befehl reproduziert <c6/> und den Bericht Byte für Byte).

# text
seg-903e4e51dda1 = Betriebshülle

# text
# c1: tests/scenario_coverage.rs
seg-e226ad523a3d = Jedes Paket wird über seine angegebene Eingabehülle hinweg von <c1/> geprüft, das sicherstellt, dass jede numerische Ausgabe endlich (kein NaN/Inf (NaN: not a number)) und beschränkt ist. Die Tabelle listet je Paket den getesteten Eingabebereich, das erwartete Ausgabeverhalten und den abdeckenden Test auf.

# text
seg-8bd4f586f3c7 = Durchlaufene Eingabe

# text
seg-3ebc1201a545 = Getesteter Bereich

# text
seg-a1198518d667 = Erwartete Ausgabe

# text
seg-7bf563f5420a = Abdeckender Test

# text
# c1: threshold_ns
seg-4906c027a805 = <c1/> (Zeitgebungsvorgabe)

# text
seg-d91e18ce3773 = { "1" } – { "500" } ns

# text
seg-10cf765fdd75 = endliche Kennzahlen zu Holdover/Zeitgebung/Sicherheit

# text
seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (Kaltatom → grobes MEMS (micro-electro-mechanical systems))

# text
seg-456c32a126a2 = endlicher, beschränkter Positions-RMS/p95

# text
# c1: mask_deg
seg-dae96fd3a01b = <c1/> (Elevationsmaske)

# text
seg-a54c3c8933c6 = endliches DOP/endliche Verfügbarkeit; beschränkt

# text
seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

# text
seg-b6d0d587046e = endliche P_md / Sicherheit, beschränkt

# text
seg-fda0b32d7784 = { "10" } – { "1000" } m

# text
seg-132fdea2270f = endlicher Holdover für Zeit/Position

# text
seg-c9099375b99f = Bahn (real)

# text
# c1: gps-ops
seg-952b94eda0ff = reale Celestrak-<c1/>-TLEs

# text
seg-60009932477c = Schnappschuss mit 30 Satelliten, Prüfsumme streng

# text
seg-deb16d50741e = wird nur mit gültigen Prüfsummen geladen; beschränkte Geometrie

# text
seg-c46d726e35b3 = Uhr (Flicker)

# text
# c1: flicker_floor
seg-15939085bf3a = <c1/> ein/aus

# text
seg-504a95f55b88 = { "0" } gegenüber { "1e-12" }

# text
seg-e1cce0c2028e = das Einschalten des 1/f-Bodens <b>verschlechtert</b> den Auslauf des p95 der Zeitgebung

# text
seg-bdd4e56bdef9 = Fusion (Realismus)

# text
# c1: accel.bias
seg-09af9dd78fe3 = <c1/> { "0" } gegenüber { "5.88e-7" } m/s²

# text
seg-0a6723be642c = null gegenüber realistisch ungleich null

# text
seg-a9eb04be2b9f = der Filter konvergiert weiterhin, innerhalb des { "3" }-Fachen des Fehlers bei Bias null

# text
seg-2a839953aa6a = Die Zeilen zu Flicker-FM und Fusions-Bias schließen zwei bestimmte Lücken im Realismus: Die Rauschterme sind <b>standardmäßig aus, beeinflussen die Ausgabe aber nachweislich, wenn sie eingeschaltet sind</b>, und der gemeinsame Fusionsfilter <b>hängt nicht davon ab, dass Biases null gesetzt sind</b> — er konvergiert auch mit einem realistischen Rest-Bias in der Güte eines Kaltatoms.

# text
seg-4f0e9f9d4cdf = Quanten- und klassische Läufe verwenden nun unabhängige Seeds des RNG (random-number generator) (klassischer Seed = seed + 0x9e3779b97f4a7c15), sodass ihre Rauschrealisierungen unkorreliert sind — nach einer Durchsicht behoben.

# text
# c1: holdover_s
seg-3b6b785f401a = <c1/> ist segmentbewusst: Ausfallzeitlinien werden bei der erneuten Erfassung von GNSS in zusammenhängende Segmente geteilt, und der gemeldete Wert ist der schlechteste (kürzeste) Auslauf über sie. Er bleibt durch die Auflösung des Zeitgitters begrenzt (eine untere Schranke).

# text
seg-4a830113b13d = Die erneute Synchronisation der Zeitübertragung über ISL modelliert die verbleibende Unsicherheit der Strecke als frischen mittelwertfreien Jitter je Messschritt plus erneute Verankerung im konfigurierten Intervall.

# text
seg-30c4d89aa433 = Aussagen gegenüber der Realität — Kurzreferenz

# text
seg-27a22de7b8c0 = Eine Checkliste für einen feindlich gesinnten Prüfer. Für jeden Begriff, der als mehr gelesen werden könnte, als er ist: was Kshana heute tut und wo die reale Version auf der Roadmap steht.

# text
seg-759eb0cfafe4 = Begriff, dem Sie begegnen können

# text
seg-6a2d3691d642 = Was es heute tatsächlich ist

# text
seg-bbd0145bfb95 = Was es (noch) <b>nicht</b> ist

# text
seg-a6fdb038b003 = „hybrider Quanten-/klassischer PNT-Simulator“

# text
seg-4421f8bd0967 = ein klassischer stochastischer Simulator, angetrieben durch veröffentlichte Allan-/Rauschkoeffizienten von Quantensensoren

# text
# c1: QUANTUM-MODELS.md
seg-3885661aafff = Quantenphysik aus ersten Prinzipien (Mach–Zehnder-Phase, Projektionsrauschen, Systematiken) — siehe <a1><c1/></a1>

# text
seg-1d28debd0302 = „gemeinsame Kalman-Fusion“ / Fusionspaket

# text
# c1: fusion
seg-d13beba21ba7 = das lauffähige Paket <c1/> beobachtet die Uhr und die Position <b>getrennt</b> (ein direkter Zeitfix und ein direkter Positionsfix), wofür der optimale Schätzer tatsächlich blockdiagonal ist — zwei Filter mit zwei Zuständen mit einer kombinierten Kennzahl

# text
# c1: fusion::coupled::CoupledPntFilter
# c2: [pos,vel,phase,freq]
seg-25c2fe6fa6d3 = ein <em>gekoppelter</em> Filter für den Fall der <b>Pseudorange</b> <b>existiert</b> nun als <c1/> (gestapelt mit 4 Zuständen <c2/>, Kreuzblock-Kovarianz ungleich null, NEES-validiert), ist aber <b>noch nicht in das lauffähige Paket eingebunden</b>, und das Paket ist <b>1-DOF (ein Freiheitsgrad)</b> — die Erweiterung auf 3-D mit 8 Zuständen ist künftige Arbeit

# text
# c1: spoof
seg-5cce1ca5b86f = Sicherheitskennzahl (Art <c1/>)

# text
# c1: 1 − P_md
# c2: P_fa
# c3: P_md
seg-d55c30f63023 = <c1/> eines <b>stochastischen Detektors für Zeit-Spoofing</b>: ein zweiseitiger Test χ²₁ / Neyman–Pearson auf einer uhrgestützten Monitorstatistik, Schwelle aus einem Ziel-<c2/>, <c3/> ausgewertet <b>bei der Größe der Vorgabe</b>, sowohl in geschlossener Form als auch per Monte-Carlo (die auf wenige ×1/√N übereinstimmen)

# text
# c1: INTEGRITY.md
seg-dbf2039a4a8e = ein RAIM/ARAIM-Detektor mit mehreren Satelliten — siehe <a1><c1/></a1>; die Monitorstatistik ist ein gaußsches Modell mit dem aus der PSD der Uhr abgeleiteten σ, keine Korrelation auf Signalebene

# text
seg-32bcb801e49c = „uhrgestützte Spoofing-Erkennung“

# text
seg-58e4d22075e9 = ein Monitor für die Zeitabweichung <b>einer einzelnen Uhr</b> (gaußsche Statistik, σ aus der PSD der Uhr), KEIN RAIM mit mehreren SV (SV: space vehicle, also ein Satellit)

# text
seg-f3f6f95bc559 = RAIM mit mehreren SV im Entfernungsbereich mit Schutzniveaus

# text
seg-a5faedaab13e = P_md des Spoofing-Detektors (geschlossene Form gegenüber Monte-Carlo)

# text
# c1: Φ
# c2: P_md
# c3: mc_runs
# c4: src/spoof.rs
# c5: src/detection.rs
seg-0362489c341a = das analytische, auf <c1/> beruhende <c2/> und die empirische Schätzung aus <c3/> Versuchen stimmen innerhalb des Stichprobenfehlers überein (≈ 1/√N); validiert in den Tests von <c4/> / <c5/> bei einer belasteten Auslenkung (μ/σ = { "2" })

# text
seg-8fa5c9468ff5 = eine gemessene ROC des Detektors gegen aufgezeichnete Spoofing-Daten

# text
# c1: gnss-sim
seg-8f895aa1c657 = Pseudorange-Modell <c1/>

# text
# c1: ρ = geometric + clocks + Klobuchar iono + Saastamoinen·Niell tropo + noise + multipath
# c2: ionmodel()
# c3: klobuchar_agrees_with_rtklib_reference_implementation
seg-a5e5e1e7a0e9 = eine <b>Vorwärtssimulation</b>: <c1/>. Jedes Atmosphärenmodell wird mit Unit-Tests gegen Handwerte geprüft (ZHD (zenith hydrostatic delay) ≈ { "2.3" } m, Niell = { "1" } im Zenit, Schiefe von Klobuchar), und das vollständige Broadcast-Modell von Klobuchar wird <b>gegen die Referenzimplementierung <c2/> von RTKLIB gegengeprüft</b>, auf unter einen Millimeter (<c3/>, { "6.1278" } m für den Fall mit den Standardkoeffizienten von RTKLIB — es gibt keinen offiziellen veröffentlichten Testvektor für Klobuchar, daher ist dies Implementierungsparität, keine gemessene Wahrheit); ein <b>Lauf ohne Rauschen reproduziert Geometrie + Korrekturen auf unter einen Millimeter</b> (RAIM-Residuum ≈ { "0" })

# text
seg-adc8a5d89cbd = eine Positions<b>lösung</b> aus realen Signalen (PPP/RTK (PPP: precise point positioning)), eine ionosphärenfreie Kombination aus zwei Frequenzen oder eine Auflösung der Trägerphasen-Mehrdeutigkeit — nicht modelliert

# text
# c1: jamming
seg-a56533528c6e = Jamming-Modell (Art <c1/>)

# text
# c1: Q
seg-0a4a28fcd53a = eine Kette für das <b>Link-Budget</b>: J/S aus der Freiraumdämpfung + Antennengewinn je Richtung → effektives C/N₀ über die Anti-Jam-Gleichung (Entspreizungsgewinn × spektrale Trennung <c1/>) → Verlust der Verriegelung an einer Schwelle (Kaplan & Hegarty §{ "9.4" })

# text
# c1: [acquisition]
# c2: [front_end]
# c3: [crpa]
# c4: [terrain]
# c5: Q
seg-b53e210487fb = Mehrwegeausbreitung, Dynamik der AGC (automatic gain control) in der Zeit, die Akquisitionssuche selbst (die optionale Hysterese <c1/> ist ein Schwellenpaar); der Quantisierungsverlust des optionalen <c2/> ist der einer gaußschen Eingabe, nicht gültig für einen CW-Störer; das optionale Feld <c3/> ist schmalbandig und ideal (keine Kopplung oder Fehlanpassung), und die optionale Abschattung <c4/> ist eine Messerkante auf einer SRTM-Kachel; <c5/> ist eine repräsentative Konstante je Typ, nicht aus der gemessenen PSD des Störers abgeleitet

# text
seg-523d66d56f97 = Integritätskennzahl (Pakete für Uhr/Holdover)

# text
seg-d0702ee52d37 = <b>Selbstkonsistenz</b> des Filters (Anteil der Ausfallproben innerhalb seiner eigenen Schranke k·σ)

# text
# c1: integrity
seg-b4b68065e521 = HPL/VPL, Integritätsrisiko / P_HMI, Alarmgrenzen, DO-229E/316/ED-259A — diese werden getrennt von der Art <c1/> (RAIM / ARAIM) und den SBAS-Funktionen gemeldet und nie in diese Kennzahl eingerechnet

# text
# c1: inertial
seg-d5b1f858f0e3 = Kennzahl des älteren Szenario-<b>Pakets</b> <c1/>

# text
seg-e9fe365d7318 = ein <b>einachsiges (1-DOF)</b> Fehlerbudget von Beschleunigungsmesser/Gyro (VRW/ARW, Bias-Instabilität) mit einem Rücksetzen auf die Wahrheit

# text
# c1: gnss-ins
seg-604e8d96c2c2 = das <em>ältere</em> Paket ist 1-DOF; der <b>Pfad mit 3 Achsen wird im Paket <c1/> geliefert</b> (nächste Zeile)

# text
# c1: gnss-ins
# c2: src/inertial/
# c3: src/fusion/pack.rs
seg-e2a4a1c47f2c = <b>Bibliothek</b> für Strapdown mit 3 Achsen + <b>Paket</b> <c1/> (<c2/>, <c3/>)

# text
# c1: gnss-ins
# c2: [imu_*.error_model]
seg-01e5672a37a4 = ein verifizierter Navigator mit Quaternionen/NED (NED: north-east-down) mit einem deterministischen Fehlermodell der IMU — <b>Skalenfaktor, Fehlausrichtung, g-Empfindlichkeit, Quantisierung, Ratenrampe</b> modelliert (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — nun <b>vom Szenariopaket <c1/> angesteuert</b> und <b>je Sensor aus TOML (Tom's Obvious Minimal Language, das Szenarioformat) konfigurierbar</b> (<c2/>)

# text
seg-acecd6b81859 = <b>nicht modelliert:</b> Fehler durch Vibrationsgleichrichtung, Drift durch Temperaturgradienten. Der Fehler des fusionierten Auslaufs ist durch den Lagefehler bei der Übergabe nach unten begrenzt (Neigung/Beschleunigungs-Bias nur schwach trennbar), daher wird keine Kalibrierung je Bias beansprucht

# text
# c1: hybrid
seg-6b04fc376c0d = „Hybride PNT-Integration“ (Paket <c1/>)

# text
seg-cd3125081b5c = offene Koppelnavigation, eingerahmt von Rücksetzungen auf die Wahrheit durch GNSS

# text
# c1: gnss-ins
# c2: hybrid-ukf
seg-578c93c67ae7 = eine gekoppelte (lose/eng) Kalman-Mischung aus GNSS und INS — das ist das getrennte Paket <c1/> (EKF) und die Art <c2/>

# text
seg-57f603da0331 = „Positioning Performance“ (Uhrenpakete)

# text
# c1: timing_rms_ns
seg-278aafe7fadf = RMS der <b>Zeitgebung</b> der Uhrphase in ns (<c1/>)

# text
seg-a6af364cbcdc = eine Genauigkeit im Positionsbereich nach RMS/CEP/SEP/DOP-gewichtet (SEP: spherical error probable)

# text
# c1: pos_rms_m
seg-b68c5a4363a5 = Kennzahl der inertialen Position (<c1/>)

# text
# c1: runs = N
seg-850e030bb5e3 = ein <b>einachsiger</b> Positions-RMS/p95 in Metern, aus einem Seed, sofern <c1/> kein Ensemble verlangt (dann Mittel, Streuung und ein Bootstrap-Konfidenzintervall von { "95" }% je Metrik)

# text
seg-be77929afa2c = eine Verteilung von CEP / 2DRMS (doppelter RMS des Abstands) im Ensemble (Roadmap: Monte-Carlo-CEP)

# text
seg-75f239679dc2 = „validiert auf ~{ "2" }%“

# text
seg-2d593a99a2b1 = eine <em>typische</em> beobachtete Übereinstimmung; das <b>durchgesetzte Kriterium liegt bei { "20" }–{ "25" }%</b> relativem Fehler

# text
seg-34cfd0e08235 = eine garantierte Genauigkeitsschranke von { "2" }%

# text
seg-d3402cc1ebd5 = „reproduzierbar / bitidentisch“

# text
# c1: tests/cross_platform_golden.rs
# c2: tests/golden.rs
seg-46ea210bcdad = bitidentischer erneuter Lauf auf <b>demselben Betriebssystem (OS) + festgelegter Toolchain</b>; über Linux, macOS und Windows hinweg prüft die CI einen eingecheckten SHA-256 des Fingerabdrucks der Eingabe und der Form jedes Ergebnisses (<c1/>) und die numerischen Werte auf { "1e-6" } (<c2/>)

# text
seg-38c6528122a8 = ein byte-identisches vollständiges Ergebnis über Betriebssysteme hinweg (Unterschiede in der letzten Stelle von libm)

# text
# c1: orbit-sgp4-gps.toml
seg-b0e21aea4ccd = SGP4-GPS-Szenario (<c1/>)

# text
# c1: gps-ops
seg-1131aa869f1d = ein echter Celestrak-<c1/>-Schnappschuss (2021-07-28, { "30" } Satelliten, strenge Prüfsummen), jeder Satellit ab seiner eigenen TLE-Epoche propagiert

# text
# c1: scripts/fetch_tles.sh
# c2: REAL_TLE_GUIDE.md
seg-21c2f1b5d7e2 = eine aktuelle Konstellation — den Schnappschuss mit <c1/> auffrischen (siehe <a1><c2/></a1>); die Katalognummern des NORAD (North American Aerospace Defense Command) sind die realen

# text
seg-6948bd06c7e5 = Gegenvergleiche mit Veröffentlichungen zum Mond-PNT (Nachweis durch Regression, keine Matrixzeilen)

# text
# c1: tests/validate_p*.rs
seg-9ee0faf0b359 = Die Suite zu Mond/cislunar (die Fähigkeiten „Lunar & cislunar“ und „Lunar PNT suite“ in der README) hat ihre Aussagen aus veröffentlichten Arbeiten in <c1/> unabhängig gegengeprüft, jeweils gegen eine unabhängige Referenz aus einer <em>anderen</em> Implementierung:

# text
# c1: scipy.special.j1
seg-b4edbf832fe6 = <b>Footprint von Senden/Empfang im Orbit</b> gegenüber <c1/> (Bessel J1 aus Cephes);

# text
# c1: (HᵀH)⁻¹
seg-c856d319a46e = <b>DOP der Geometrie einer Oberflächenbake</b> gegenüber einer unabhängigen Lösung <c1/> mit NumPy;

# text
# c1: finals2000A
seg-33ee672d98d7 = <b>Wachstum des Vorhersagefehlers der UT1/EOP-Persistenz</b> gegenüber einem erneuten Einlesen derselben wörtlichen IERS-Zeilen <c1/> mit NumPy;

# text
seg-9b6e59789117 = <b>ebene Familie von Distant-Retrograde-Orbits</b> gegenüber der Three-Body Periodic Orbit Database von NASA/JPL;

# text
seg-c77384abd1cc = <b>Budget der Präzision der HF-Entfernungsmessung</b> gegenüber einer Referenz aus ersten Prinzipien.

# text
# c1: tests/fixtures/{p1_footprint,lunar_service,eop_prediction,rf_ranging_precision,dro_family_jpl,p2_independent_dop}/
# c2: src/verification.rs
# c3: VERIFICATION-MATRIX.md
# c4: gen_validation_artifacts
# c5: verification_matrix()
# c6: tests/verification_artifacts_doc_sync.rs
seg-a451dbe09e10 = Prüfkörper und Skripte zur Erzeugung der unabhängigen Referenz liegen unter <c1/>. Sie stärken die Nachweise hinter Fähigkeiten, die in der maschinell geprüften Matrix (<c2/>) <b>MODELLED</b> bleiben; es sind Regressionsprüfungen, <b>keine</b> neuen VALIDATED-Zeilen der Matrix, sodass sie die Anzahl der maschinell geprüften Matrix nicht selbst ändern. Diese Anzahl wird hier nicht wiederholt, weil eine von Hand getippte Kopie davon abdriftet: Die aktuelle Aufteilung steht im erzeugten Kopf von <a1><c3/></a1>, den <c4/> aus <c5/> schreibt und <c6/> festlegt.

# text
seg-a353a63661de = <s1>Zurück</s1>Exporte und Importe zur Interoperabilität

# text
seg-fdae3b73ab67 = <s1>Weiter</s1>Verifikationsmatrix

# text
seg-59c12422e6e7 = Gezeiten auf dem Geopotenzial (src/tides.rs)

# text
seg-10f0b4616abe = Manöver und Trajektorienentwurf (src/maneuver.rs)

# text
seg-56cdbd59ce5d = Bahnbestimmung (OD) (src/orbit_determination.rs, src/batch_ls.rs)

# text
seg-3a2c69fcbb86 = Validierung des Kraftmodells durch Ephemeridenanpassung (src/precise_od.rs)

# text
seg-05a25c6ef750 = Reale präzise Bahnen der Agenturen (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

# text
seg-279f4619bc2d = Navigation mit Schwerekarte / alt-PNT (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

# text
seg-7b512df70323 = Fehlermodell von INS / IMU — Validierung gegen Datenblätter (src/inertial/)

# text
seg-b385e665cfff = Deep-Space- und Mars-PNT — D0-Fundament (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

# text
seg-5887e7e1a218 = Radiometrische Observablen im Deep Space & CCSDS Tracking Data Message — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

# text
seg-a9cf84a14301 = Reduziert-dynamische Bahnbestimmung im Deep Space — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

# text
seg-dc406cb825db = Deep-Space-PNT-Szenario & Fusion von Einweg+Zweiweg — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

# text
seg-7784f9436dd2 = Mondkoordinatenzeit — relativistische Uhrrate Erde–Mond (src/lunar_time.rs)

# text
seg-8a34cb900611 = Geodätisches VLBI am Mond — Nahfeldverzögerung für eine Erdbasislinie, die ein Mondbaken beobachtet (src/lunar_vlbi.rs)

# text
seg-d47906a347b3 = Gemeinsame Multitechnik-Bahnbestimmung + Uhr am Mond — simulierte Rückgewinnung im geschlossenen Regelkreis (src/lunar_combination.rs)

# text
seg-17b9f0ae9dee = Realisierung des lunaren Bezugssystems — Datumsanpassung mit 7 Helmert-Parametern (src/lunar_frame_realise.rs)

# text
seg-3cfffa3eeb79 = Servicevolumen des lunaren Navigationsdienstes — DOP / Abdeckung / Verfügbarkeit + verallgemeinertes lunares ARAIM-PL (src/lunar_service.rs)

# text
seg-d80bf3320a15 = Differenzielles PNT am Mond — Aufhebung des Gleichtakts + mit der Basislinie wachsendes Residuum + DGNSS-Schutzniveaus (src/lunar_dpnt.rs)

# text
seg-23c3d8a79acf = Lunarer Interoperabilitätsexport — an LunaNet/IOAG ausgerichtete CCSDS-OEM + KIF mit Rundlauf-Übereinstimmung (src/lunar_interop.rs)

# text
seg-a697f4f424b8 = Repräsentativität der Demonstration & Register der Lücken bis zum Flug (src/representativeness.rs)

# text
seg-4c924153299d = Einheitlicher Nachweis des Vergleichs Quanten gegen klassisch (src/qtrade.rs)

# text
seg-bd1a5835c5db = Bibliothek von Fehlermodellen für Quantengeräte (src/quantum_devices.rs)

# text
seg-6b1bb731f966 = Vertrauenswürdige Quantenzeitgebung — durchgängige Kette, sichere Verteilung, Anomalie + Vergleich (src/timetransfer_chain.rs)

# text
seg-3332c6c1ae86 = GNSS-freie Quantennavigation (src/quantum_nav_od.rs)

# text
seg-9b46a5add4ab = Fehler-/Anomalieerkennung für Quanten-PNT-Systeme (src/quantum_faults.rs)
