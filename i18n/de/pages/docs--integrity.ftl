# docs--integrity: translations (de)

# text
# c1: docs/INTEGRITY.md
seg-668241606715 = Quelle: <c1/>

# text
seg-9a8c218ce054 = Integrität und Sicherheit: was Kshana modelliert und was nicht

# text
seg-52038c93765d = Kshana meldet zwei Gütemaße (FoMs, figures of merit) — <b>Integrität</b> und <b>Sicherheit</b> —, die leicht mit den gleichnamigen Größen aus der Luftfahrt verwechselt werden. Diese Seite legt klar dar, was sie heute sind, was sie <em>nicht</em> sind und was die Roadmap ergänzt. Wenn Sie Kshana für einen sicherheitskritischen oder zertifizierungsbezogenen Kontext bewerten, lesen Sie zuerst dies.

# text
seg-fb6e93a107e7 = Heute ({ "v0.37.0" })

# text
seg-ecd20ae1a05d = Integritäts-FoM — Selbstkonsistenz des Filters

# text
seg-153391e55508 = Das Integritäts-FoM ist der Anteil der Ausfall-Stichproben, deren wahrer Zeitgebungsfehler innerhalb der eigenen k-Sigma-Schutzgrenze des Kalman-Filters bleibt:

# text
seg-ac2413a97a7b = Es misst, ob die <em>selbst gemeldete</em> Unsicherheit des Filters während eines Ausfalls von GNSS (globales Satellitennavigationssystem) ehrlich über seinen <em>eigenen</em> Fehler Auskunft gibt. Es ist eine nützliche interne Konsistenzprüfung.

# text
seg-c9f80760ea53 = Es ist <b>kein</b>:

# text
seg-8899525ad177 = <b>Horizontal-/Vertikal-Schutzniveau (HPL/VPL)</b> — es gibt überhaupt kein Schutzniveau im Positionsbereich (die Uhr-Pakete liegen im Zeitgebungsbereich);

# text
seg-dd9a3e58e10b = <b>Integritätsrisiko / Wahrscheinlichkeit gefährlich irreführender Information (P_HMI)</b>;

# text
seg-31fa92b3271d = Vergleich mit einer <b>Alarmgrenze</b>;

# text
seg-ee998b974e6f = konform mit <b>RTCA DO-229E / DO-316</b> oder <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: Europäische Organisation für Ausrüstung der Zivilluftfahrt) oder einem anderen Zertifizierungsstandard.

# text
seg-f84a56b6fe10 = Sicherheits-FoM — analytische Grenze der Spoof-Erkennbarkeit

# text
seg-e532288ed262 = Das Sicherheits-FoM ist eine <b>auf der Uhrenstabilität beruhende Grenze der Spoof-Erkennbarkeit</b>: Gegeben das Rauschen einer Uhr (Weißfrequenz- und Random-Walk-PSDs (Leistungsspektraldichten)) und ein Überwachungsfenster, ist es die analytische Erkennungsmarge eines Einzeluhr-Konsistenzmonitors gegenüber einem langsam anwachsenden Falschzeit-Spoofing. Eine ruhigere Uhr (z. B. eine optische Uhr) erkennt ein kleineres, langsameres Spoofing als eine rauschbehaftetere (z. B. eine CSAC (Chip-Scale-Atomuhr)) — dieser Kontrast ist der Sinn des Demonstrators.

# text
# c1: spoof
seg-fc718a805b28 = Es ist <b>kein</b> Detektor für Multi-Satelliten-RAIM (Empfänger-autonome Integritätsüberwachung). Es gibt keine satellitenübergreifenden Pseudorange-Residuen, kein Schutzniveau und kein P_HMI. Der Test Innovation gegen Sigma hat dieselbe mathematische Form wie die klassische RAIM-Fehlererkennung (Brown), aber die Zahl ist eine analytische Grenze für eine gegebene Uhr und keine RAIM-Implementierung, und sie ist nur im Rahmen eines konfigurierten Spoofing-Szenarios aussagekräftig (siehe den Szenariotyp <c1/>, der einen tatsächlichen, anwachsenden Angriff einspeist).

# text
# c1: clock
# c2: orbit
# c3: hybrid
# c4: fusion
# c5: security n/a (no attack)
# c6: fom.security
# c7: applicable: false
# c8: figure_tiers
seg-ae770e25031e = Die Ausgabe sagt dies selbst. Die Typen <c1/>, <c2/>, <c3/> und <c4/> konfigurieren keinen Angriff; ihre einzeilige Zusammenfassung gibt daher <c5/> statt einer Zahl aus, und ihr Ergebnisdokument kennzeichnet <c6/> in seinem Block <c8/> mit <c7/> samt Begründung. Der Wert selbst bleibt im Dokument für alle, die die Grenze wollen.

# text
# c1: src/raim.rs
seg-960bd91a2b3a = Echtes Snapshot-, Solution-Separation- und ARAIM-RAIM (<c1/>)

# text
# c1: src/raim.rs
seg-3d31ec251ac0 = Ein echtes RAIM im Positionsbereich ist in <c1/> implementiert, getrennt vom oben beschriebenen Selbstkonsistenz-FoM:

# text
seg-0e8240812c16 = <b>Residuenüberwachung über mehrere Satelliten</b> — es baut die Sichtlinien-Geometriematrix zu den sichtbaren Satelliten auf, bildet die Kleinste-Quadrate-Lösung für Position und Uhr und prüft die Summe der quadrierten Residuen.

# text
# c1: SSE/σ²
# c2: chi2_{1-P_fa}(n-4)
seg-69f1535596e0 = <b>χ²-Fehlererkennung</b> — <c1/> (SSE: Summe der quadrierten Residuen) ist unter der Hypothese ohne Fehler χ²(n−{ "4" }); oberhalb von <c2/> wird ein Fehler erklärt. Die χ²-Schwellen stammen aus einer abhängigkeitsfreien Auswertung der regularisierten unvollständigen Gammafunktion (exakt, ohne Tabellen).

# text
# c1: max_i(slope_i)·pbias·σ
# c2: slope_i
# c3: pbias
# c4: P_md
seg-6721779048f5 = <b>Steigungsbasiertes HPL / VPL</b> — <c1/>, wobei <c2/> die satellitenbezogene Empfindlichkeit des Positionsfehlers aus der Hat-Matrix ist und <c3/> der nichtzentrale χ²-Bias, der die konfigurierte Wahrscheinlichkeit einer Nichterkennung <c4/> erfüllt.

# text
# c1: Δ_k = x_k − x₀
seg-8dd60e98088d = <b>Solution-Separation-RAIM (MHSS: Multiple-Hypothesis Solution Separation)</b> — für die Lösung mit allen sichtbaren Satelliten und jede Teillösung mit Ausschluss eines einzelnen Satelliten <b>erkennt und identifiziert</b> die Separation der verschachtelten Schätzer <c1/> den fehlerhaften Satelliten und speist die Schutzniveau-Grenze.

# text
# c1: araim_raim
# c2: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c3: K_md
seg-719e27fdd2c1 = <b>Budget für das Integritätsrisiko (P_HMI) von ARAIM (fortgeschrittene Empfänger-autonome Integritätsüberwachung)</b> — <c1/> löst das kleinste HPL/VPL, dessen summierte Wahrscheinlichkeit gefährlich irreführender Information <c2/> (Blanch et al., <em>Baseline ARAIM</em>) eine ausdrückliche Zuteilung des Integritätsrisikos erfüllt, und meldet das Risiko, das die Niveaus erreichen — so lässt sich die Integrität direkt gegen die Alarmgrenze abwägen, statt sie implizit in einem festen Multiplikator <c3/> zu belassen.

# text
# c1: (error, PL)
seg-2f99acf45203 = <b>Stanford-ESA-Integritätsdiagramm</b> (ESA: Europäische Weltraumorganisation) — ein Akkumulator je Epoche ordnet <c1/> den Bereichen Verfügbar / System nicht verfügbar / Irreführend / Gefährlich irreführend zu und liefert so eine Verfügbarkeitszusammenfassung.

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: scenarios/integrity-raim.toml
seg-33d01969fb0f = <b>Durchgängig erreichbar</b> — der Szenariotyp <c1/> führt das Obige über eine SGP4- (Simplified General Perturbations { "4" }) oder Kepler-Konstellation aus, oder über eine aus echten TLEs (Zwei-Zeilen-Elementsätzen) oder einer RINEX-Navigationsdatei (Receiver Independent Exchange Format) gelesene, und gibt gegen die konfigurierten Alarmgrenzen eine Verfügbarkeitskarte von HPL/VPL je Epoche aus (<c2/>). Derselbe Lauf <b>exportiert ein vertikales Stanford-Diagramm</b>: In jeder geschützten Epoche wird eine gesetzte, reproduzierbare Ziehung eines fehlerfreien Entfernungsfehlers über die Geometrie auf einen tatsächlichen Vertikalfehler abgebildet und gegen das VPL und die vertikale Alarmgrenze eingeordnet, sodass das JSON-Ergebnis (JavaScript Object Notation) und die CLI-Zusammenfassung (Kommandozeilenschnittstelle) die Zahlen je Bereich enthalten (Integritätsereignisse und HMI: gefährlich irreführende Information) — nicht nur einen Verfügbarkeitsanteil. Auf dem mitgelieferten <c3/> meldet der Lauf { "344" } von { "361" } Epochen verfügbar ({ "95.3" } %) bei einer horizontalen Alarmgrenze von { "40" } m und einer vertikalen von { "50" } m, mit { "0" } Integritätsereignissen und { "0" } HMI.

# text
# c1: araim_dual_raim
# c2: P_const
# c3: IntegritySupportMessage
# c4: σ_URA
# c5: σ_URE
# c6: b_nom
# c7: P_sat
# c8: P_const
# c9: P_const = 0
# c10: araim_raim
# c11: integrity
# c12: araim_dual = true
# c13: scenarios/araim-gps-galileo.toml
seg-54e778eceef4 = <b>ARAIM mit zwei Konstellationen und Integrity Support Message</b> — <c1/> ergänzt den <b>konstellationsweiten Fehlermodus</b>: Neben den Hypothesen fehlerfrei und einzelner Satellit trägt jede Konstellation eine Hypothese bei, die alle ihre Satelliten entfernt, mit der A-priori-Wahrscheinlichkeit <c2/>, zur selben MHSS-Summe des Integritätsrisikos. Die <c3/> (ISM) trägt die Nutzer-Entfernungsgenauigkeit für die Integrität (<c4/>), den Effektivwert der Genauigkeit (<c5/>), den maximalen nominalen Bias <c6/>, der einseitig in jeden Modus einfließt, sowie die A-priori-Wahrscheinlichkeiten <c7/> und <c8/>; ihr Referenzsatz der WG-C (Working Group C der Kooperation zwischen der Europäischen Union und den Vereinigten Staaten zur Satellitennavigation, deren ARAIM-Untergruppe die Referenz veröffentlicht) lautet σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } und P_const = { "1e-4" }. <c9/> reproduziert das Ergebnis von <c10/> mit einem einzelnen Fehler bitgenau. Der Typ <c11/> nimmt diesen Pfad mit <c12/> (<c13/>: GPS + Galileo, { "48" } Satelliten, { "145" } von { "145" } Epochen verfügbar bei denselben Alarmgrenzen).

# text
# c1: araim-reference-check
# c2: araim_protection_level
# c3: araim_integrity_risk
# c4: VERIFICATION-MATRIX.md
seg-1f06bc1976bd = <b>Schutzniveaus gegen veröffentlichte Referenzvektoren</b> — der Typ <c1/> führt <c2/> und <c3/> der Engine auf den eigenen durchgerechneten Beispielen der ARAIM-Untergruppe der WG-C aus (das Reference Airborne Algorithm Description Document v3.1, { "2019" }, Anhang D, und der Milestone-{ "3" }-Bericht, { "2016" }, Anhang A). Die größte Differenz der vertikalen/horizontalen Schutzniveaus am Abnahmevektor beträgt { "0.0437" } m gegenüber der eigenen Toleranz der Dokumente von { "0.05" } m. Diese Zeile ist in <a1><c4/></a1> VALIDATED: Sie prüft die Schutzniveau-Gleichung, keine operative ISM und keinen Empfänger.

# text
seg-1dda7b318c5f = Die verbleibende Lücke (Roadmap)

# text
# c1: raim.rs
seg-e27215296e1a = Was <c1/> noch <b>nicht</b> leistet:

# text
seg-964c0634eae0 = es ist <b>nicht in das FoM der Uhr-/Holdover-Szenarien eingebunden</b> — diese Pakete melden weiterhin die oben beschriebene Integritätsgröße der Filter-Selbstkonsistenz, kein HPL/VPL;

# text
seg-eecf2f9f181e = die Fehlerhypothesen sind der fehlerfreie Fall, <b>einzelne Satelliten</b> und <b>ganze Konstellationen</b> — gleichzeitige Fehler auf <b>Teilmengen von zwei oder mehr Satelliten (SV: Space Vehicle, also ein Satellit)</b> werden nicht modelliert;

# text
seg-fd0f9fb2de83 = die ISM ist ein konfigurierbarer Parametersatz (mit den Referenzwerten der WG-C), keine ausgestrahlte operative Nachricht und kein validiertes Bedrohungsmodell;

# text
# c1: snapshot_raim_fde
# c2: integrity
seg-88f5242b0809 = <b>Fehlererkennung und -ausschluss (FDE)</b> gibt es nur für einzelne Satelliten und nur als Snapshot: Die Solution Separation benennt den fehlerhaften Satelliten, und <c1/> löst jeden Ausschluss eines einzelnen Satelliten neu und gibt den ausgeschlossenen Satelliten mit dem Chi-Quadrat-Test und den Schutzniveaus der verbleibenden Teilmenge zurück, aber es wird keine ausschlussgeschützte Position gemeldet, und der Szenariotyp <c2/> führt den Ausschlussschritt nicht aus.

# text
# c1: tests/igs_real_data.rs
# c2: P_HMI
# c3: tests/araim_dual_real_data.rs
# c4: REAL_TLE_GUIDE.md
# c5: pvt
seg-c85aa5dedc86 = Die Kerne für Snapshot, Solution Separation und ARAIM werden an <b>echter Geometrie aus präzisen Bahnen des IGS (International GNSS Service) (SP3: Standard Product { "3" })</b> erprobt, nicht allein an synthetischen Konstellationen: <c1/> bildet die Sichtlinien-Geometrie aus der ersten Epoche eines echten IGS-SP3-Produkts an einer realen Bodenstation und prüft, dass die Schutzniveaus endlich sind und innerhalb der APV-I-Alarmgrenzen (Anflug mit vertikaler Führung) von { "40" } m horizontal und { "50" } m vertikal liegen, dass ein Pseudorange-Bias von { "60" } m den χ²-Monitor auslöst, dass die Solution Separation den fehlerhaften Satelliten <b>identifiziert</b> und dass die Niveaus von ARAIM das zugeteilte <c2/> erfüllen. <c3/> führt den Pfad mit zwei Konstellationen auf den echten Celestrak-Katalogen für GPS und Galileo vom 2026-06-07 aus, propagiert auf eine gemeinsame Epoche (siehe <a1><c4/></a1> §{ "3" }). Ein tiefergehender Gegenvergleich — Schutzniveaus Epoche für Epoche gegen gLAB (das GNSS-Lab Tool, eine von der ESA verbreitete Software-Suite zur Verarbeitung von GNSS-Daten) über einen vollständigen RINEX-Beobachtungsbogen zu diffen — würde Parität im Empfängerbereich ergänzen. Das ist nicht erledigt: Der Typ <c5/> berechnet aus echten RINEX-Beobachtungen eine Code-Einzelpunktposition, aber kein Schutzniveau aus dieser Lösung wurde mit dem von gLAB verglichen.

# text
# c1: raim.rs
# c2: integrity
# c3: araim-reference-check
seg-f5fac2e836a6 = <c1/> ist also ein echter Kern für Schutzniveau und Integritätsrisiko, erreichbar über die Szenariotypen <c2/> und <c3/>, erprobt an echter Referenzbahn-Geometrie und gegen die Referenzvektoren der WG-C geprüft. Fehler auf Teilmengen mehrerer Satelliten, Parität mit gLAB im Empfängerbereich und die Einbindung in das Uhr-FoM bleiben Roadmap-Punkte, und nichts davon ist ein Zertifizierungsnachweis.

# text
# c1: GLOSSARY.md
seg-487f24ed92d8 = <a1><c1/></a1> — einzeilige Definitionen jedes FoM und jeder Abkürzung.

# text
# c1: ARAIM_REFERENCE.md
seg-7d3c12cf802e = <a1><c1/></a1> — die ISM-Parameter und die Referenzvektoren der WG-C.

# text
# c1: SLOT-TIMING.md
seg-04532ba5288f = <a1><c1/></a1> — das Zeitgebungs-Schutzniveau (TPL) einer im Holdover laufenden Uhr, das an die Erkennung gebunden ist.

# text
# c1: VALIDATION.md
seg-43cea496da93 = <a1><c1/></a1> — welche Größen referenzvalidiert sind und welche Selbstkonsistenzprüfungen.

# text
# c1: src/security.rs
seg-3037dde8135f = <c1/> — die Herleitung der Grenze der Spoof-Erkennbarkeit.

# text
seg-04d63778ca7f = RAIM neben den Gütemaßen für Uhr-Holdover ({ "0.36" }, optional)

# text
# c1: [integrity]
# c2: src/clock_integrity.rs
# c3: lat_deg
# c4: lon_deg
# c5: height_m
# c6: systems
# c7: gps-baseline
# c8: integrity_fom
# c9: available
# c10: alarm
# c11: unavailable-pl-above-al
# c12: unavailable-too-few-satellites
# c13: unavailable-gnss-denied
# c14: runs = 1
seg-744e95749978 = Ein Uhr-Szenario kann einen Abschnitt <c1/> (<c2/>) enthalten: einen Standort (<c3/>, <c4/>, <c5/>), Konstellations-Voreinstellungen (<c6/>, Standard <c7/>), eine Maske, ein Sigma der Entfernungsresiduen, die Wahrscheinlichkeiten für Fehlalarm und Nichterkennung, die horizontalen und vertikalen Alarmgrenzen, einen Epochenabstand und einen optionalen angegebenen Bias auf einem Satelliten. Der Lauf meldet dann einen eigenen Block <c8/>: je Epoche die sichtbaren Satelliten, die Snapshot-RAIM-Schutzniveaus und ein Urteil (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>) sowie die Zählwerte und die Verfügbarkeit über den Lauf. Solange der Zeitverlauf GNSS als verwehrt ausweist, ist RAIM nicht verfügbar und es wird nichts extrapoliert; ein degradiertes Fenster wird als nominal ausgewertet. Die Gütemaße für Holdover bleiben unverändert, und ohne den Abschnitt ist die Ausgabe byte-identisch. MODELLED: ein repräsentativer Voreinstellungshimmel, synthetische Residuen und angegebene Grenzen. Es braucht <c14/>.

# text
seg-139639263c90 = Die Reproduktion der maximalen URA aus Milestone { "3" } der ARAIM der WG-C von EU und USA (CAP-05c)

# text
seg-97906754d4c8 = Ein früherer Plan versprach einen Vergleich mit „Table A-3“ einer technischen Notiz zu EU-ARAIM. Für diese Tabelle konnte keine öffentliche Quelle gefunden werden (die öffentlichen Berichte der Milestones { "1" } bis { "3" } der ARAIM-Technical-Subgroup der Working Group C von EU und USA haben keine Table A-3); dieser Vergleich ist daher <b>zurückgezogen</b>, und unter diesem Namen wird nichts versprochen.

# text
# c1: 156147e1...13d8
# c2: sigma_URA
# c3: xval/araim-m3/PREREGISTRATION.md
# c4: src/bin/gen_araim_m3_study.rs
# c5: xval/araim-m3/results.json
# c6: tests/araim_m3_reproduction.rs
seg-b61607c477f2 = Stattdessen wird der öffentliche Bericht versucht: der <b>Milestone-{ "3" }-Bericht</b> ({ "25" }. Februar { "2016" }, Kopie von GPS.gov, SHA-256 <c1/>), Tabellen { "5" }, { "6" } und { "7" }, die für jede Konstellationskonfiguration und für RNP { "0.1" } und RNP { "0.3" } das größte <c2/> ausweisen, für das { "90" } % der Nutzer eine Verfügbarkeit von { "99.5" } % haben. Zwölf gedruckte Einträge (die Zeilen Depleted und Baseline der Dualfrequenz-Tabellen) werden geprüft, und zwar unter Zielwerten, die in <a1><c3/></a1> vor jedem gewerteten Lauf vorab festgelegt wurden, mit den Abweichungen, die sich nicht beseitigen lassen und dort angegeben sind: keine Almanach-Dateien, Walker-Schalen statt der realen Slots, ein gröberes Gitter und ein gröberer Schritt sowie der horizontale Pfad nach ADD v4.2 der Engine anstelle des eigenen Textes des Berichts. Die Tabellen { "8" } bis { "13" } (Einzelfrequenz) und die Optimistic-Zeilen werden nicht versucht, mit den dort genannten Gründen. <b>Ergebnis: { "8" } von { "12" } Einträgen reproduziert, { "4" } NOT MET (festgeschrieben):</b> die Einträge mit zwei Konstellationen und alle Einträge nur mit Galileo stimmen überein (einschließlich der N/A-Zeilen), der Eintrag Dual Depleted RNP { "0.1" } erreicht eine Abdeckung von { "0.847" } bei { "9" } m gegenüber den gedruckten { "9" } m (nötig wären { "0.90" }), und drei Einträge nur mit GPS verfehlen weit (Abdeckung { "0.70" } bei { "4" } m, { "0.58" } bei { "6" } m, { "0.65" } bei { "10" } m gegenüber gedruckten { "4" } m, { "6" } m und „>{ "10" } m“). Die Fehlschläge nur mit GPS können daher rühren, dass die gleichförmige Walker-Schale für die realen GPS-Slots steht (D1); das ist eine Hypothese, kein Befund. Das Ergebnis bleibt MODELLED, wie auch immer es ausfällt. Die Studie ist <c4/>; ihre gemessenen Abdeckungen stehen in <c5/> und werden von <c6/> gewertet. Der Bericht selbst wird zitiert, nicht mitgeliefert.

# text
seg-0e98826cedcc = <s1>Zurück</s1>Hardware-Sicherheit

# text
seg-e6f1e38977b7 = <s1>Weiter</s1>Spektrum und Wasserfall

# text
seg-38ab3bb65327 = Echtes Snapshot-, Solution-Separation- und ARAIM-RAIM (src/raim.rs)
