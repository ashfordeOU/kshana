# docs--compliance-dhs-rpcf: translations (de)

# attr:aria-label, text
seg-d01db1c2710a = Referenz

# text
seg-fdbb9db68f1d = keine

# text
# c1: docs/compliance/dhs-rpcf.md
seg-dbec6a166e56 = Quelle: <c1/>

# text
seg-6e9b601864df = Das Resilient PNT Conformance Framework des US DHS: wofür Kshana Belege liefert

# text
seg-cef4181edf29 = Das Rahmenwerk beschreibt Resilienzstufen { "0" } bis { "4" }, aufgebaut aus acht nummerierten Anforderungen, und einen Bewertungsansatz, der statische Analyse mit dynamischer Analyse kombiniert, bei der Testvektoren für Bedrohungen stehen. Es hat kein eigenes Schema für Anforderungskennungen, sodass die folgenden Verweise seine Stufen- und Anforderungsnummern und seine Abschnittsnummern sind. Es ist ergebnisbasiert und katalogisiert keine Bedrohungen.

# text
# c1: kshana compliance-report
seg-ff0e00610721 = Jede Zeile sagt, welche Ausgaben von Kshana die Anforderung <b>mit Belegen unterlegen</b> und was übrig bleibt. Nichts hier sagt, dass ein Rahmenwerk erfüllt ist oder dass ein Produkt von irgendjemandem bewertet oder zugelassen wurde. Führen Sie <c1/> auf Ihren eigenen Ergebnisdateien aus, um zu sehen, für welche Zeilen Ihre Läufe tatsächlich Belege liefern; siehe <a1>README.md</a1>.

# text
seg-30c8cabb6e90 = Quelldokumente

# text
seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: Version { "2.0" }, { "26" }. April { "2022" } (DHS Science and Technology Directorate, mit CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Gelesen am 2026-10-09: Dokument vollständig gelesen; die Landingpage der Veröffentlichung wurde nicht abgerufen.

# text
seg-955191e0baab = Zuordnung

# text
seg-6ba8f74126ee = Was verlangt wird (sinngemäß)

# text
seg-0438151025da = Ausgaben von Kshana, die dafür Belege liefern

# text
seg-3f265e18f56c = Lücke

# text
seg-4263435e702a = Abschnitt { "5.2" } (Prevent, Respond, Recover)

# text
seg-e7b721f6e216 = Resilienz wird als drei Funktionen beschrieben: Schaden verhindern, reagieren (erkennen, melden, abmildern, eindämmen) und sich erholen. Die Erkennung ist probabilistisch, sodass sowohl Fehlalarme als auch Fehlerkennungen zählen.

# text
seg-3447d3b53fe8 = Vertrauensbewertung von Empfänger-Logs; Erkennung von Spoofing und Meaconing; Holdover und Überbrückung

# text
seg-ab055a50e16e = Prävention ist eine Eigenschaft des Produktentwurfs, die keine Simulationsausgabe zeigt. Erkennungsstatistiken aus einem synthetischen Lauf oder einem Lauf in einer einzigen Sitzung sind keine gemessene Rate von Fehlalarmen oder Fehlerkennungen für ein im Feld eingesetztes Produkt.

# text
seg-501badd6a436 = Stufe { "1" }, Anforderung { "1" }

# text
seg-e8cfbe121084 = Prüfen, dass gespeicherte Daten, die aus externen Quellen eintreffen, den Formaten und Wertebereichen der einschlägigen Standards entsprechen.

# text
seg-7d7196aefa05 = Eine Eigenschaft von Software-Assurance und Eingabevalidierung des geprüften Produkts. Kshana untersucht die Eingabeverarbeitung eines Produkts nicht.

# text
seg-6085030de980 = Stufe { "1" }, Anforderung { "2" }

# text
seg-e8cd6fb732ad = Vollständige manuelle Wiederherstellung durch Löschen oder Zurücksetzen des Speichers ermöglichen, sodass das System nach Wegfall der Bedrohung auf definierte Leistung zurückkehrt.

# text
seg-8d216d42c776 = Vertrauensbewertung von Empfänger-Logs

# text
seg-e3ca721d9d2e = Ein Empfänger-Log zeigt, wann eine Positionslösung nicht mehr vertrauenswürdig war und wann sie sich erholt hat; es zeigt nicht, dass ein manuelles Zurücksetzen jeden gespeicherten Zustand löscht.

# text
seg-2c78c15cea96 = Stufe { "1" }, Anforderung { "3" }

# text
seg-ab9458f8b8fc = Firmware sicher neu laden oder aktualisieren.

# text
seg-3a50eceb47f5 = Die Sicherheit von Firmware-Updates liegt außerhalb dessen, was irgendeine Ausgabe von Kshana beobachtet.

# text
seg-752a194674f6 = Stufe { "2" }, Anforderung { "4" }

# text
seg-a5f263a083c7 = Kompromittierte PNT-Quellen erkennen und verhindern, dass sie die Lösung verfälschen.

# text
seg-4e7034acccc0 = Erkennung von Spoofing und Meaconing; Vertrauensbewertung von Empfänger-Logs; Integritätsüberwachung und Schutzniveaus

# text
seg-d5fdef2a78f2 = Kshana bewertet Detektoren und Monitore, die es modelliert oder über ein Log laufen lässt; ob der eigene Ausschluss von Quellen eines Produkts funktioniert, erfordert den internen Zustand des Produkts, nicht nur sein Log.

# text
seg-e3ea1208fac9 = Stufe { "2" }, Anforderung { "5" }

# text
seg-c0219254fe8e = Quellen und das System automatisch wiederherstellen, ohne die Ausgabe zu unterbrechen; während der Bedrohung wird weiterhin eine Lösung geliefert, möglicherweise mit unbeschränkter Verschlechterung.

# text
seg-3dd48cb65cb4 = Holdover und Überbrückung; Vertrauensbewertung von Empfänger-Logs

# text
seg-0c36c4a3eb4e = Holdover-Läufe begrenzen die modellierte Drift für ein angegebenes Uhren- oder Inertialmodell, nicht das eigene Wiederherstellungsverhalten des Produkts.

# text
seg-befbf4b94876 = Stufe { "3" }, Anforderung { "6" }

# text
seg-45410d1675be = Fehlerhafte Daten aus einer Quelle dürfen eine andere Quelle nicht verunreinigen.

# text
seg-ff808ce8ec48 = Alternative und diverse PNT-Quellen

# text
seg-ccf628643110 = Kshana lässt Quellen nebeneinander laufen; die Isolation von Quellen innerhalb eines Produkts erfordert eine Entwurfsprüfung oder Fehlerinjektion in das Produkt.

# text
seg-a1d5a3125697 = Stufe { "3" }, Anforderung { "7" }

# text
seg-db149ea618dd = Die Lösungen aller Quellen gegenseitig verifizieren und die Verschlechterung während einer Bedrohung beschränkt halten.

# text
seg-4afa05ef42fa = Integritätsüberwachung und Schutzniveaus; Holdover und Überbrückung; Alternative und diverse PNT-Quellen

# text
seg-8b1f938c0175 = Eine beschränkte Verschlechterung wird für die modellierten Sensoren gezeigt; die eigene gegenseitige Prüfung des Produkts wird nicht beobachtet.

# text
seg-772244881e5b = Stufe { "4" }, Anforderung { "8" }

# text
seg-aff5161e6363 = Quellen unterschiedlicher Technologien gegen Bedrohungen mit gemeinsamer Ursache einsetzen, ohne Verschlechterung während der Bedrohung.

# text
seg-587889f9881c = Alternative und diverse PNT-Quellen; Auswirkungen auf das Link-Budget durch Jamming

# text
seg-65b96caf8d6b = Ein Argument zur gemeinsamen Ursache braucht den Quellensatz des realen Produkts und eine Bedrohung, die ihn überspannt; ein Szenario legt eine fest, es beweist nicht, dass das Produkt keine gemeinsame Schwäche hat.

# text
seg-3c4cc0793454 = Abschnitt { "5.5" } (gemeinsame Ursache)

# text
seg-a87c9808dd99 = Diverse Mechanismen dürfen keine Schwäche teilen: Zum Beispiel setzt ein Jammer, der zwei Bänder abdeckt, die Diversität der Bänder außer Kraft.

# text
seg-c10ba3bb01be = Auswirkungen auf das Link-Budget durch Jamming; Resilienzbewertung über Bedrohungsensembles; Alternative und diverse PNT-Quellen

# text
seg-843fe2fc9e33 = Die Bewertung verwendet ein synthetisches Bedrohungsensemble, als solches angegeben; es sind keine Felddaten.

# text
seg-3158e7efd1a5 = Abschnitte { "8.1" } bis { "8.3" } (Bewertung)

# text
seg-3942d9cdc64b = Die Bewertung kombiniert statische Analyse mit dynamischer Analyse, bei der Testvektoren für Bedrohungen stehen; die Testklassen sind Quellenausfall, Störung und interne Fehler. Simulatoren werden als Testmethode genannt.

# text
seg-9d5c297c1ab9 = Vertrauensbewertung von Empfänger-Logs; Auswirkungen auf das Link-Budget durch Jamming; Erkennung von Spoofing und Meaconing

# text
seg-bb02568e8f8f = Exportierte Bewegung und Ereignisse können einen Simulator im Labor ansteuern (docs/TEST-BENCH.md). Kshana schreibt kein Signal, sodass der Simulator und sein befugter Betreiber die Bedrohung liefern.

# text
seg-b81625e9e071 = Abschnitt { "8.6" } (Elemente des Testplans)

# text
seg-27d645a79672 = Ein Testplan nennt Stufe, Anforderung, Eingaben, Referenzen, benötigten Datenzugriff, Verfahren mit Kriterien für Bestehen oder Nichtbestehen, Ergebnisse und Anmerkungen.

# text
seg-1f2898855ccc = Reproduzierbare Herkunft des Laufs; Vertrauensbewertung von Empfänger-Logs

# text
seg-d8b08da48cb2 = Kriterien für Bestehen oder Nichtbestehen werden vom Prüfer gewählt; Kshana hält die Eingaben, Schwellen und Hashes fest, mit denen es gelaufen ist.

# text
seg-ccfdf53a1e54 = <s1>Zurück</s1>Compliance-Zuordnung

# text
seg-260ba950eb89 = <s1>Weiter</s1>IMO-Leitlinien für Schiffe
