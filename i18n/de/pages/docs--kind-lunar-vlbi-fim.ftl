# docs--kind-lunar-vlbi-fim: translations (de)

# text
seg-b054c73f22e5 = kein Wert

# text
seg-98151954f217 = false

# text
seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunarer Raum</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunarer Raum</a1>

# text
seg-3319b18ac61f = und { "1" } weitere in der Matrix.

# text
seg-2595bd629ffb = <b>MODELLED</b> Das Helmert-Datum mit sieben Parametern, fortgepflanzt aus einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE statt wiedergewonnen aus einer eingespeisten Transformation.

# text
# c1: docs/kinds/by-kind/lunar-vlbi-fim.md
seg-7ecec8d27f50 = Quelle: <c1/>

# text
seg-1bc37634ba9f = Kovarianz der Stationskoordinaten bei lunarer VLBI: die Verzögerungspartiellen der Observablen lunar-vlbi, über einen expliziten ZEITPLAN (Basislinien x Epochen) zu einer Fisher-Informationsmatrix akkumuliert, invertiert und als Kovarianz der Stationskoordinaten und als Stations-Sigma je Koordinate ausgegeben — eine berechnete Engine-Ausgabe statt einer skalaren Verzögerungspräzision, die durch einen angenommenen isotropen Gleichverteilungsfaktor g = { "3" } geschoben wird. Der Zustand trägt erdFESTE (ITRS) Stationskoordinaten, sodass die Jacobi-Matrix die inertiale Partielle ist, gedreht mit der GCRS->ITRS-Matrix jeder Epoche: Die Erdrotation macht diese Koordinaten beobachtbar, und der Bericht MISST den erdfesten Sichtliniendurchlauf und die Deklination der Bake, statt sie anzunehmen. Eine Beobachtung ist ein Paar (Basislinie, Epoche) mit BEIDEN Stationen oberhalb der Elevationsmaske, gewichtet mit 1/delay_sigma_s^{ "2" }. Gibt bei jedem Lauf Rang, Datumsdefekt, Konditionszahl, das gesamte Informationsspektrum, die Kovarianzmatrix, Sigmas je Station und Achse sowie in 3D und den Nullraum des freien Netzes aus; bei einem Rangdefizit wird das Haupt-Sigma als NULL mit einem Status veröffentlicht, nie aus einer fast singulären Inversen abgelesen. Der Gleichverteilungswert c<em>delay_sigma_s</em>sqrt(g/N) für DENSELBEN Zeitplan wird mit dem Verhältnis neben dem berechneten Wert ausgegeben, zusammen mit der isotropen Spurschranke sqrt(p/trace(M)), die AM-HM zu einer harten Untergrenze macht — das Verhältnis ist also die Anisotropie, die die Annahme verworfen hat. Die Verzögerungsschließung tau_ik = tau_ij + tau_jk macht nur n-1 der n(n-1)/2 Basislinien geometrisch unabhängig; der Bericht nennt beide Zahlen. MODELLED: Die Ephemeride des Mondzentrums, die Stationsuhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten, und Beobachtungen werden als unabhängig behandelt, sodass die Kovarianz eine Cramér-Rao-Schranke für einen reduzierten Parametersatz ist, kein vorhergesagtes Sitzungsergebnis; das Verzögerungs-Sigma, die Stationskoordinaten und der Zeitplan sind Eingaben. Die Partielle, die die Jacobi-Matrix der geometrischen Verzögerung auslässt (der differenzierte Shapiro-Term), wird durch finite Differenz gemessen und ausgegeben. Kein geodätisches Produkt.

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-4df72c1b921e = Ein Lauf von <c1/> fasst sich so zusammen: lunar-vlbi-fim | { "3" } stations / { "3" } baselines x { "49" } epochs = { "16" } obs (mask { "10.0" } deg) | datum anchor-first-station | rank 6/6 cond { "2.209e4" } | station sigma { "0.0926" } m vs equipartition g={ "3" } { "0.0013" } m (ratio { "71.360" })

# text
# c1: stations
# c2: beacon_lat_deg
# c3: beacon_lon_deg
# c4: beacon_alt_m
# c5: epoch_year
# c6: epoch_month
# c7: epoch_day
# c8: arc_hours
# c9: step_min
# c10: delay_sigma_s
# c11: elevation_mask_deg
# c12: datum
# c13: estimate_beacon
# c14: rel_tol
# c15: equipartition_g
# c16: planetary_kernel_path
seg-f0dabe1b061b = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/lunar-vlbi-fim.toml
seg-fabf305ae1de = Das Beispiel <c1/> setzt unter anderem:

# text
seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

# text
seg-8b098bf1df6b = Ergebnisbezeichnung (der Engine): MODELLED Kovarianz der Stationskoordinaten bei lunarer VLBI. Die Kovarianz wird aus den eigenen analytischen Verzögerungspartiellen der Engine über einen expliziten Zeitplan aus Basislinien und Epochen akkumuliert und invertiert; sie wird NICHT durch einen angenommenen Geometriefaktor aus einer skalaren Verzögerungspräzision umgerechnet. Das Verzögerungs-Sigma je Beobachtung

# text
seg-d1a6a5086102 = <b>VALIDATED</b> Verzögerungspartielle, über einen Zeitplan aus Basislinien × Epochen zu einer Fisher-Informationsmatrix akkumuliert, invertiert zur Kovarianz der Stationskoordinaten und zum Stations-Sigma je Koordinate, wodurch eine angenommene isotrope Gleichverteilungsverknüpfung aus einer

# text
# c1: all-stations-fixed
seg-55ce02ad5dd5 = <b>MODELLED</b> Eine dritte Datumswahl, <c1/>, die jede Erdstation festhält und allein die mondfesten Koordinaten des BEACON schätzt — die Konfiguration, für die eine Unsicherheit eines Punktes auf der Mondoberfläche tatsächlich angegeben wird, da die Koordinaten der Erdstation

# text
seg-811a412b40b6 = <b>VALIDATED</b> Die Beacon-Kovarianz des lunar-vlbi-fim-Szenarios bei festgehaltenen Stationen (jede Erdstation festgehalten, allein die mondfesten Koordinaten des Beacons geschätzt), wobei das Beacon auf dem JPL-DE440-Mond platziert ist, gelesen vom eigenen Kernel-Reader der Engine

# text
seg-a731b913bdf0 = <b>VALIDATED</b> Über einen Plan aus Basislinien × Epochen akkumulierte Laufzeitpartialableitungen zu einer Fisher-Informationsmatrix, invertiert zur Stationskoordinaten-Kovarianz und der pro Koordinate. Unabhängige Referenz (ExternalDataset): Ein unabhängiger Weg innerhalb des Repositorys. Jede Jacobi-Zeile wird durch zentrale finite Differenz von lunar_vlbi::vlbi_delay_s neu hergeleitet, ausgewertet aus den eigenen erdfesten und mondfesten Koordinaten des Zustands, die durch die Bezugssystemkette vorwärts gedreht werden — ein Weg, der keine Ableitung berechnet und keinen Ausdruck mit den analytischen Partialableitungen teilt — und die Informationsmatrizen, die beide Wege aufbauen, stimmen auf < { "1e-6" } des größten Diagonalelements überein. Die

# text
# c1: all-stations-fixed
seg-2300ffd9fc4e = <b>MODELLED</b> Eine dritte Datumswahl, <c1/>, die jede Erdstation festhält und allein die mondfesten Koordinaten des BEACON schätzt — die Konfiguration, für die eine. Unabhängige Referenz (ReferenceImpl): Geschlossene Identitäten, ohne dass eine externe unabhängige Referenz beansprucht wird oder verfügbar ist. Der Hebelarm wird gegen ρ/B und die beiden Äquipartitionsformen gegeneinander auf { "1e-15" } geprüft — algebraische Identitäten, die also einen Verdrahtungsfehler und sonst nichts aufdecken und als solche gekennzeichnet sind. Das wesentliche Ergebnis wird MEASURED statt behauptet: Eine Laufzeit aus einer festen Basislinie beschränkt die RICHTUNG des Beacons, sodass die Sichtlinienkomponente rea

# text
# c1: label
seg-2cbf700a234e = MODELLED Lunar-VLBI-Stationskoordinaten-Kovarianz. Die Kovarianz wird aus den eigenen analytischen Laufzeitpartialableitungen der Engine über einen expliziten Plan aus Basislinien und Epochen akkumuliert und invertiert; sie wird NICHT durch einen angenommenen Geometriefaktor aus einer skalaren Laufzeitpräzision umgerechnet. Die Laufzeit-Sigma pro Beobachtung, die Stationskoordinaten, der Beacon-Standort und der Plan sind Eingaben. Die Ephemeride des Mondzentrums, die Stationsuhren (Ergebnis <c1/>)

# text
seg-4df6e3981cc4 = Die veröffentlichte Kette von D3 geht von einer Laufzeitpräzision pro Beobachtung über einen angenommenen ISOTROPEN Äquipartitionsfaktor g = { "3" } zu einer Unsicherheit der Stationskoordinaten. Dieser Schritt ist derjenige, den das Abstract der Arbeit selbst als modelliert statt gemessen bezeichnet. Dieses Szenario beseitigt ihn: Die Lunar-VLBI-Laufzeitpartialableitungen werden über einen realen Plan aus (Basislinie x Epoche)-Paaren zu einer Fisher-Informationsmatrix akkumuliert, invertiert und als (Kommentar der Szenariodatei, Zeilen { "3" } bis { "8" })

# text
seg-489b93ca0f7f = Der Zustand enthält erdFESTE (ITRS) Koordinaten, sodass die Jacobi-Matrix die inertiale Partialableitung ist, gedreht durch die GCRS->ITRS-Matrix jeder Epoche: Die Erdrotation macht diese Koordinaten überhaupt erst beobachtbar, und der Bericht MISST den erdfesten Sichtlinien-Überstrich und die Beacon-Deklination, statt sie anzunehmen. Eine Beobachtung ist ein (Basislinie, Epoche)-Paar mit BEIDEN Stationen über der Elevationsmaske, gewichtet mit 1/delay (Kommentar der Szenariodatei, Zeilen { "10" } bis { "14" })

# text
seg-efb5719364af = Was im Bericht zu lesen ist * Sigma pro Station und Achse sowie 3-D-Sigma — die berechnete Antwort; * der Äquipartitionswert c<em>delay_sigma_s</em>sqrt(g/N) für denselben Plan, daneben mit dem Verhältnis ausgegeben. Dieses Verhältnis IST die Anisotropie, die die Annahme verworfen hat, und die isotrope Spurschranke sqrt(p/trace(M)) macht AM-HM zu einer harten Untergrenze, sodass die Annahme nur unterschätzen kann; * Rang, Datumsdefekt, Konditionszahl, das vollständige sp (Kommentar der Szenariodatei, Zeilen { "16" } bis { "26" })

# text
seg-96c1a129aeae = <s1>Zurück</s1>lunar-time-offset

# text
seg-199d98630271 = <s1>Weiter</s1>lunar-vlbi

# text
# c1: kshana kinds --json
seg-0ed4495d4488 = MODELLED: Die Ephemeride des Mondzentrums, die Stationsuhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten, und Beobachtungen werden als unabhängig behandelt, sodass die Kovarianz eine Cramér-Rao-Schranke für einen reduzierten Parametersatz ist und kein vorhergesagtes Sitzungsergebnis; die Laufzeit-Sigma, die Stationskoordinaten und der Plan sind Eingaben. (Szenarioarten-Katalog (<c1/>))

# attr:alt
seg-19c383444296 = Das Diagramm, das die Engine für scenarios/lunar-vlbi-fim.toml schreibt, Szenarioart lunar-vlbi-fim

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Szenarioart nennen.

# text
# c1: kshana kinds --json
seg-8f63c3e774e2 = Lunar-VLBI-Stationskoordinaten-Kovarianz: die Laufzeitpartialableitungen der lunar-vlbi-Observable, akkumuliert über einen expliziten PLAN (Basislinien x Epochen) zu einer Fisher-Informationsmatrix, invertiert und als Stationskoordinaten-Kovarianz und als Stations-Sigma pro Koordinate ausgegeben — eine berechnete Engine-Ausgabe statt einer skalaren Laufzeitpräzision, die durch einen angenommenen isotropen Äquipartitionsfaktor g = { "3" } geschickt wird. (Szenarioarten-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-bb7ff1e5d99f = Der Äquipartitionswert c<em>delay_sigma_s</em>sqrt(g/N) für denselben Plan wird neben dem berechneten Wert mit dem Verhältnis ausgegeben, zusammen mit der isotropen Spurschranke sqrt(p/trace(M)), die AM-HM zu einer harten Untergrenze macht — das Verhältnis ist also die Anisotropie, die die Annahme verworfen hat. (Szenarioarten-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-d09b166842d5 = Der Zustand enthält erdFESTE (ITRS) Stationskoordinaten, sodass die Jacobi-Matrix die inertiale Partialableitung ist, gedreht durch die GCRS->ITRS-Matrix jeder Epoche: Die Erdrotation macht diese Koordinaten beobachtbar, und der Bericht MISST den erdfesten Sichtlinien-Überstrich und die Beacon-Deklination, statt sie anzunehmen. (Szenarioarten-Katalog (<c1/>))

# text
# c1: lunar-vlbi-fim
seg-d54e29b7bc80 = <c1/> (Szenarioart)
