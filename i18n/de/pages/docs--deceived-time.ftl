# docs--deceived-time: translations (de)

# text
# c1: docs/DECEIVED-TIME.md
seg-d46702617926 = Quelle: <c1/>

# text
seg-f44d01df7b1c = Ein signierter Befehl, der zu einer getäuschten Zeit angewandt wird, führt trotzdem fehl

# text
seg-6497012e401e = Eine technische Notiz für Betreiber zeitindizierter Netze: Konstellationen, die nach einem Plan routen, Aufgaben verteilen oder übergeben, wobei jeder Knoten handelt, wenn seine eigene Uhr einen geplanten Zeitpunkt erreicht.

# text
seg-714bce435435 = Abkürzungen: GNSS, globales Satellitennavigationssystem; TPL, Zeitschutzniveau; PNT, Positionierung, Navigation und Zeitgebung.

# text
seg-a7208323de1c = Die Behauptung

# text
# c1: δ
# c2: T
# c3: T + δ
# c4: |δ|
seg-246715a1c559 = Steuernachrichten zu authentifizieren, auch mit Post-Quanten-Signaturen, beweist, wer eine Nachricht gesendet hat und dass sie nicht verändert wurde. Es beweist nicht, <b>wann der Empfänger sie ausführt</b>. Ein Knoten führt einen zeitindizierten Befehl gegen seine eigene Uhr aus. Ist diese Uhr um <c1/> verzogen worden, läuft ein für den Zeitpunkt <c2/> gültiger Befehl zur wahren Zeit <c3/>, bei vollständig intakten Signaturen. Sobald <c4/> die Slot-Schutzzeit übersteigt, landet Verkehr im falschen Slot, eine Verbindung schaltet um, während die Gegenstelle noch anderswohin zeigt, oder eine Übergabe erfolgt zu früh. Das Netz routet falsch, und jede Integritätsprüfung im Befehlsweg meldet Erfolg.

# text
seg-8683f0749042 = Warum die Uhr das weiche Ziel ist

# text
seg-1af5aea2ef5b = <b>GNSS-Zeit ist die übliche Referenz, und sie lässt sich spoofen.</b> Ein Knoten, der seine Uhr an GNSS nachführt, übernimmt jede Zeit, die der Empfänger liefert. Ein spoofer, der die eigenen Qualitätsflags des Empfängers grün hält, kann diese Zeit langsam verziehen.

# text
# c1: T + w
seg-354a4c706264 = <b>Frischeprüfungen verwenden dieselbe Uhr.</b> Ein Gültigkeitsfenster („diesen Befehl bis <c1/> akzeptieren“) oder ein an die Zeit gebundener Wiederholungszähler wird gegen die lokale Uhr beurteilt; eine verzogene Uhr kann also auch das Fenster erweitern, in dem ein abgefangener signierter Befehl akzeptiert wird.

# text
seg-a4b8a5db0975 = <b>Der Angriff braucht keinen Schlüssel.</b> Am signierten Kanal wird nichts angetastet. Stärkere Kryptografie erhöht den Aufwand, einen Befehl zu fälschen, und lässt diesen Aufwand unverändert.

# text
seg-e514b03fbae3 = Das steht neben der Post-Quanten-Arbeit, nicht gegen sie: Beide schließen unterschiedliche Lücken. Signaturen stoppen einen gefälschten Befehl. Zeitintegrität verhindert, dass ein echter Befehl im falschen Moment ausgeführt wird.

# text
seg-09f493386dbc = Was es begrenzt

# text
# c1: slot-timing
# c2: SLOT-TIMING.md
seg-750bd90b0ee1 = Vier Maßnahmen, jede quantifiziert durch die Szenarioart <c1/> (<a1><c2/></a1>):

# text
seg-77cf39b434b5 = <b>Ein uhrgestützter Monitor.</b> GNSS-Zeit mit der eigenen, über ein Fenster überbrückenden Uhr des Knotens vergleichen und alarmieren, wenn die Differenz zu groß ist, um Uhrenrauschen zu sein. Das bedingte TPL begrenzt den Fehler, der vor dem Alarm unbemerkt bleiben kann.

# text
seg-e58f7fb94ac5 = <b>Unabhängige Prüfungen, geplant.</b> Eine Zwei-Wege-Zeitübertragung einer Bodenstation oder ein Crosslink-Vergleich mit einem Nachbarn außerhalb der Reichweite des spoofers begrenzt, wie lange ein langsames Verziehen laufen kann. Ihr Wiederholintervall ist ein Sicherheitsparameter, nicht nur ein betrieblicher.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-69590f56817c = <b>Geometrie.</b> Ein bodengestützter spoofer erreicht einen Satelliten im niedrigen Erdorbit nur, solange dieser über dem Horizont des spoofers steht; das Verziehen ist also durch die Rampenrate des spoofers mal dieses Fenster begrenzt. Als Rechnung: Eine Rampe von { "10" } ns/s über { "600" } s ergibt { "6" } µs. Das mitgelieferte Beispiel (<c1/>: Bahn in { "550" } km, maximale Rampe { "10" } ns/s) meldet eine Exposition gegenüber dem spoofer von { "732" } s und ein rampenbegrenztes Verziehen von { "7 321" } ns.

# text
seg-e8e52ce05943 = <b>Eine aus der Schranke bemessene Schutzzeit und eine sichere Aktion bei Alarm.</b> Die Slot-Schutzzeit sollte den größten unentdeckten Fehler abdecken, den Monitor und Prüfungen zulassen, nicht nur das freilaufende Rauschen der Uhr. Bei Alarm sollte ein Knoten seinen letzten guten Plan auf seiner überbrückenden Uhr halten, statt GNSS zu folgen.

# text
seg-c11b66f214ac = Was diese Notiz nicht behauptet

# text
seg-8b0ed39ead25 = Sie behauptet nicht, dass ein gespoofter Satellit beim Fehlrouten beobachtet wurde; sie schätzt die Exposition keines Betreibers; und die Schranken, auf die sie verweist, sind MODELLED, bedingt durch Erkennung und durch die angegebenen Annahmen zur Bedrohung. Sie argumentiert eine Zusammensetzung: Eine gültige Signatur und ein richtiger Ausführungszeitpunkt sind getrennte Eigenschaften, und ein zeitindiziertes Netz braucht beide.

# text
seg-c1bf6467e3c9 = <s1>Zurück</s1>Telekom-Zeitgebung

# text
seg-d4e9bfd42982 = <s1>Weiter</s1>Holdover-Test und Zeitgebungshardware in der Schleife
