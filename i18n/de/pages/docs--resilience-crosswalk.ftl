# docs--resilience-crosswalk: translations (de)

# text
seg-88372b30ed79 = Grenze

# text
seg-aab745a65e76 = Modul

# text
seg-ad856ad710eb = Status

# text
seg-b03d56f501c3 = Typ

# text
seg-4dbf41c0ec3b = Funktion

# text
seg-f472e43c1100 = Was es zeigt

# text
seg-fa4468d4cb80 = Verfügbarkeit

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-fe4d868448ef = Quelle: <c1/>

# text
seg-d745715d5332 = Querverweis zu PNT-Resilienz-Rahmenwerken

# text
# c1: VALIDATED
# c2: MODELLED
# c3: resilience::diversity
# c4: resilience::stats
seg-aa1c24d63df5 = <b>Daran ausgerichtet, nicht bewertet oder genehmigt.</b> Dies ordnet die simulierten Fähigkeiten von Kshana den veröffentlichten Rahmenwerken zur PNT-Resilienz (PNT: Positionierung, Navigation und Zeitgebung) zu. Es ist eine <em>aus der Simulation abgeleitete Selbstbewertung, ausgerichtet am</em> Resilient PNT Conformance Framework (RPCF) v2.0 von DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency), am Modell Resist-Detect-Respond-Recover (RDRR) von RethinkPNT/Firesmith und an den Kriterien für resiliente PNT von Yang Yuanxi. Es ist <b>keine</b> Bewertung, keine Genehmigung, keine Akkreditierung und keine Compliance-Aussage, und es trägt keine Billigung von DHS, IEEE (Institute of Electrical and Electronics Engineers) oder irgendeiner Behörde. Jede Zeile ist mit ihrem ehrlichen Verifikationsstatus gekennzeichnet (<c1/> gegen eine externe unabhängige Referenz oder <c2/> aus ersten Prinzipien mit Tests); die Resilienz-Bewertungsebene selbst ist <b>MODELLED</b>. Zwei ihrer Kerne tragen in der Verifikationsmatrix eigene Zeilen VALIDATED, der Kern für die inverse Simpson-Diversität (<c3/>) und der Kern für Rangordnungsstatistik (<c4/>); das validiert die Arithmetik, nicht die darauf aufgebauten Bewertungen.

# text
# c1: src/resilience/
# c2: src/verification.rs
seg-652fcf3ec12d = Die Bewertungs-Engine (<c1/>) verwendet diese Fähigkeiten und gibt Teilbewertungen je Dimension aus, nie eine einzelne Phantomzahl. Siehe <c2/> für die maschinengeprüften Statusinvarianten.

# text
seg-7a71de89a9fd = DHS RPCF v2.0: was das Rahmenwerk definiert, und die eigenen Teilbewertungskategorien von Kshana

# text
seg-1985dbfe351d = Das veröffentlichte Rahmenwerk (Resilient PNT Conformance Framework, Version { "2.0" }, { "26" }. April { "2022" }, DHS Science and Technology Directorate mit CISA) definiert drei <b>Kernfunktionen</b> (Abschnitt { "5.2" }: Prevent, Respond, Recover), <b>Resilienzstufen { "0" } bis { "4" }</b> (Abschnitt { "5.3" }) und <b>acht nummerierte Mindestanforderungen</b>, verteilt auf die Level { "1" } bis { "4" } (Abschnitt { "5.3" }, wiederholt in { "5.5" }), plus einen Bewertungsansatz (Abschnitt { "8" }). Es definiert <b>keine</b> Liste von sieben Technikkategorien. Eine frühere Fassung dieser Seite und die Kommentare des Resilienzmoduls beschrieben sieben „RPCF-Technikkategorien“; die Wörter Obfuscate und Diversify kommen in v2.0 nicht vor. Der Text dieses Dokuments wurde am 2026-10-09 erneut gelesen, und es wurde keine solche Liste gefunden.

# text
seg-178d1e119dce = Die sieben Namen der Teilbewertungen, die die Bewertungs-Engine ausgibt (Obfuscate, Limit, Verify, Isolate, Diversify, Mitigate, Recover; „OLVIDMR“ ist unsere Merkhilfe), sind daher <b>die eigenen Bewertungskategorien von Kshana</b>, aus Gründen der Ausgabestabilität beibehalten. Sie sind keine DHS-Begriffe, und die Zeilen unten sagen nicht, dass DHS sie verlangt. Wo eine Kategorie zu einer Anforderung des Rahmenwerks passt, sagt es die letzte Spalte; wo nicht, steht dort „keine“.

# text
seg-5a9eb11bb965 = Teilbewertungskategorie von Kshana

# text
seg-e117e6f71845 = Fähigkeit von Kshana als Treiber

# text
seg-7677dafa7016 = Nächste Referenz in RPCF v2.0

# text
seg-27e0f6b39605 = Obfuscate

# text
seg-7327b9cbc106 = Deklarierte Technik × Quellenqualität (kein direkter Verhaltenstreiber)

# text
seg-b63e61fa5fa2 = keine (eine Präventionstechnik; Abschnitt { "5.2" }, Prevent)

# text
seg-7ed4f2e21189 = Deklarierte Technik × Quellenqualität

# text
seg-8579207ae2e5 = Verify

# text
seg-30b8cb030965 = AUC (Fläche unter der Kurve) des Beeinträchtigungsdetektors unter dem Szenario (Spoofing-/Jamming-/Meaconing-Monitore)

# text
seg-3d358c029f50 = Level { "2" } Anforderung { "4" }; Level { "3" } Anforderung { "7" }

# text
seg-fcb8cb7d4c97 = Isolate

# text
seg-b3cd355743da = Level { "3" } Anforderung { "6" }

# text
seg-ffa87d149a20 = Diversify

# text
seg-1282685a888b = Zahl unabhängiger Gruppen → effektive Diversität nach inverser Simpson-Formel

# text
seg-f0dd4c4ef1c5 = Level { "4" } Anforderung { "8" }; Abschnitt { "5.5" } (gemeinsame Ursache)

# text
seg-2d91b12a9e56 = Mitigate

# text
seg-d183b552df76 = Verfügbarkeit unter Störung

# text
seg-c337df73e231 = Abschnitt { "5.2" }, Respond

# text
seg-2da4df22d35d = Recover

# text
seg-85d7e3292549 = Holdover-Überbrückung × Gate für begrenzte Verschlechterung

# text
seg-3aec9f076902 = Level { "2" } Anforderung { "5" }; Abschnitt { "5.2" }, Recover

# text
seg-36958650abc0 = Die Zuordnung je Anforderung zum realen Rahmenwerk, mit dem, wofür die Ausgaben von Kshana Belege liefern, und dem, was übrig bleibt, steht in <a1>compliance/dhs-rpcf.md</a1>.

# text
seg-a085dd81c769 = Funktionen RDRR von RethinkPNT / Firesmith

# text
seg-1b972717180b = Treiber

# text
seg-6eaf161f8871 = Resist

# text
seg-6046a8914dc7 = Mittel der Teilbewertungen Obfuscate/Limit/Isolate/Diversify

# text
seg-242e2c01ebc2 = Detect

# text
seg-45c8da13581f = Teilbewertung Verify (AUC des Detektors)

# text
seg-d29232baaaa6 = Respond

# text
seg-36ab7ce187e6 = Teilbewertung Mitigate (Verfügbarkeit)

# text
seg-f98dc190541c = Holdover × begrenztes Gate; Leistungskennzahlen (KPIs: Erkennen/Reagieren/Erholen/Verlust) der Resilienz-Zeitleiste

# text
seg-e7190928bed6 = Kriterien von Yang Yuanxi (die Teilmenge, zu der die Gütemaße für Zeitgebung/Erkennung etwas aussagen)

# text
seg-52836e247425 = Kriterium

# text
seg-cbbe4c0baf3f = Zuverlässigkeit

# text
seg-32d64f865b21 = Anteil der Filterintegrität

# text
seg-214372f29bd1 = Kontinuität

# text
seg-ad5e76a596b8 = Holdover × begrenztes Gate

# text
seg-d92fb15e6dfa = Genauigkeit

# text
# c1: fom::positioning_performance
seg-0de1f9119e0f = Stellvertreter für Zeitgebung/Qualität — <b>die Genauigkeit im Positionsbereich ist nicht Teil der Bewertung</b>. <c1/> macht aus einer gelieferten Positionskovarianz und HPL (horizontales Schutzniveau) CEP/SEP/2DRMS (circular error probable, spherical error probable, twice the distance root mean square), aber kein Szenario speist es in die Resilienzbewertung ein

# text
seg-0aa925a09499 = MODELLED (nur Zeitbereich)

# text
seg-6b661e6e4399 = Was dieser Querverweis nicht behauptet

# text
seg-51a48d0c718d = Kein verliehenes RPCF-Level. Das zugewiesene Level ist eine <em>vorläufige, aus der Simulation abgeleitete</em> Lesart mit einem ausdrücklichen Gate für begrenzte Verschlechterung, kein verliehener Reifegrad.

# text
# c1: pvt
# c2: gnss-ins
# c3: leo-pvt
# c4: integrity
seg-df73b7c76ae5 = Keine Genauigkeit im Positionsbereich in der Bewertung. Die Resilienz-Teilbewertungen werden aus Metriken des Zeitbereichs und der Erkennung aufgebaut. Die Engine berechnet an anderer Stelle durchaus Positionen (die Arten <c1/>, <c2/> und <c3/>) und Schutzniveaus (die Art <c4/>), aber die Bewertungsebene verwendet sie nicht.

# text
# c1: resilience::panel
seg-30a1b1a4dfea = Keine Felderprobung. Das Referenzpanel und das Bedrohungsensemble sind synthetische, durch Parameter begründete Reduktionen (<c1/>), als erstrangige Einschränkung ausgewiesen.

# text
# c1: resilience::study
seg-83c465cd78b0 = Die Begleitstudie (<c1/>) existiert genau deshalb, um zu zeigen, dass das Zusammenfassen dieser Dimensionen zu einer Gesamtbewertung oder einem Level eine Bewertung ergibt, deren Rangfolge der Architekturen unter vertretbaren Gewichtungs- und Bedrohungsannahmen instabil ist — dieser Querverweis ist also eine Messebene, die je Dimension zu lesen ist, keine einzelne Note, an der ein Produkt bewertet wird.

# text
seg-32bd45dc031d = Resilienz- und Vertikal-Szenarien, die diese Ebenen ausüben

# text
seg-4e36adba1c55 = Die untenstehenden mitgelieferten Szenarien führen die Bedrohungs- und Erholungsmechanik aus, auf die die Zeilen des Querverweises zeigen. Jedes ist ein realer Lauf der genannten Art; jedes ist <b>MODELLED</b> (keine Felddaten).

# text
# c1: scenarios/
seg-44664e49d449 = Szenario (<c1/>)

# text
seg-44b8d7435bfd = Geschichtete PNT unter einer gemeinsamen Jamming-/Spoofing-Bedrohung: ein gesäter Monte Carlo des Ausfalls von Schichten, inverse-Varianz-Fusion der Überlebenden, das Verhältnis des Gesamtverlusts bei einer einzelnen Schicht gegenüber geschichtet, und wie korrelierter Ausfall dieses Verhältnis zusammenbrechen lässt. Seine Identitäten Monte Carlo zu geschlossener Form und der Fusion werden von Crate-internen Tests geprüft; die Art hat keine Zeile in der Verifikationsmatrix, daher wird sie hier mit MODELLED eingestuft.

# text
seg-1734506ad287 = GNSS (globales Satellitennavigationssystem) gestört, eine PNT-Schicht in niedriger Erdumlaufbahn (LEO) trägt den Nutzer, Integrität gewahrt (drei Phasen auf einer Zeitleiste).

# text
seg-ff8cc090bdce = Ein Jammer gegen einen Empfänger mit vier Bändern; welcher Spoofing-Monitor welchen Spoofer sieht.

# text
seg-0a93502a4a19 = Die Marge des Störer-zu-Signal-Verhältnisses (J/S) aus der Empfangsleistung.

# text
seg-f2230253bdff = Spoofing-Erkennung durch Konsistenz von Doppler und Überflug-Geometrie.

# text
seg-d8ca900a8c14 = Zeitgebung von Basisstationen und kritischer Infrastruktur im Holdover, mit LEO-Zeit.

# text
seg-2a61d07bf177 = Straßen-, Schienen-, See-, Polar- und Internet-der-Dinge-(IoT-)Nutzer mit einer LEO-Schicht.

# text
seg-8723073167ad = GNSS/INS-Koppelnavigation (INS: Inertialnavigationssystem) durch eine Straßenschlucht und durch Jamming auf einem kleinen unbemannten Luftfahrzeug.

# text
seg-6ee1ef707b20 = Wie lange ein INS ein Schiff oder einen Zug bei verwehrtem GNSS innerhalb seiner Grenze hält.

# text
seg-7ca913e1729b = Ein maritimer Jammer; Erkennung eines Spoofers, der die gemeldete Position eines Schiffs wegzieht.

# text
seg-c49548e8393b = <s1>Zurück</s1>Karte DO-316 / DO-229E

# text
seg-dedf3b53d31f = <s1>Weiter</s1>Empfängervertrauen
