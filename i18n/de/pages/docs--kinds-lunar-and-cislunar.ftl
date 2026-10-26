# docs--kinds-lunar-and-cislunar: translations (de)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Typ

# attr:alt
seg-f15bbf30b0dd = Das Diagramm, das die Engine für scenarios/cislunar-observability.toml schreibt, Typ cislunar-observability

# attr:alt
seg-de295af20c55 = Das Diagramm, das die Engine für scenarios/lunar-attack-surface.toml schreibt, Art lunar-attack-surface

# text
seg-142ad48fe422 = Oberflächenbaken-Ergänzung eines lunaren orbitalen Navigationsdienstes als lauffähige Vorher-Nachher-Tabelle. Ein Nutzer am Südpol sieht eine spärliche Orbitalmenge in einem schmalen Himmelsausschnitt, daher ist die Entfernungsmessgeometrie schlecht konditioniert; einige VERMESSENE OBERFLÄCHENBAKEN liefern die Sichtlinienzeilen mit niedriger Elevation und großem Azimutbereich, die einer rein im Zenit stehenden Menge fehlen, und der horizontale Dilution-of-Precision-Wert bricht ein. Das Szenario berichtet drei Konfigurationen zu einer Epoche — nur Satelliten, Satelliten plus die sichtbaren Baken und eine größere Konstellation als alternativer Weg zur selben Geometrie — jeweils mit ihren Zahlen sichtbarer Quellen, ihrem vollständigen DOP und der erzielten 1-Sigma-Genauigkeit in METERN, gewonnen durch Multiplikation mit einem Nutzer-äquivalenten Entfernungsfehler je Bake, der als Wurzel aus der Quadratsumme von Uhrensynchronisations-, Mehrwege- und Vermessungstermen zusammengesetzt ist. Die Sichtbarkeit der Baken ist der geometrische Horizont für zwei Höhen auf dem Mond ohne Atmosphäre (keine Atmosphäre, daher ist die Grenze exakt), und die DOP-Zusammensetzung ist derselbe Kern, der in tests/dop_reference.rs gegen gnss_lib_py gegengeprüft wird. WARUM ES DIESE ART GIBT: Das Modul dahinter ist seit L08/L09 in der Engine und wird gegen einen unabhängigen DOP-Pfad geprüft, war aber aus einem Lauf nicht erreichbar — keine Art, kein Dispatch-Zweig, keine mitgelieferte Datei. Die README warb mit der Fähigkeit, und die Verifikationsmatrix führte KEINE Zeile dafür, sodass sie zugleich in der Prosa behauptet und im Register nicht beansprucht wurde, während sie in der Engine unerreichbar war. Die Standardwerte sind die Geometrie, die bereits ein eingechecktes Golden trägt (ein Nutzer bei -80 deg mit einer Antenne von { "2" } m, drei Baken bei -80/0, -79/+{ "60" } und -79/-60 auf { "2" } km, ein illustrativer LCNS-Schnappschuss mit sechs Satelliten bei t={ "0" }, eine Maske von { "5" } deg), sodass ein bloßer Lauf eine Tabelle reproduziert, die eine Referenz bereits abdeckt, statt neue Zahlen zu erfinden. MODELLED: der Konstellationsentwurf, die Bakenplatzierung und jede Größe des Fehlerbudgets sind illustrative Eingaben, keine im Feld erfolgte Vermessung und keine gemessene Strecke; nur die DOP-Arithmetik, die geschlossene Form des Horizonts und die Beziehung Sigma = DOP x sigma_URE sind extern verankert. Keine Zusage einer Dienstleistung.

# attr:alt
seg-a53e353706f6 = Das Diagramm, das die Engine für scenarios/lunar-beacon.toml schreibt, Art lunar-beacon

# text
# c1: independence
seg-f994c81583bf = MODELLED Test mit unabhängigem Schätzer für die Beobachtbarkeitsschwelle der cislunaren Bogenlänge. Diese Schwelle ist ein RANG, gelesen an der Beobachtbarkeitsmatrix, die aus den ANALYTISCHEN Entfernungs-Jacobi-Zeilen und der ANALYTISCHEN variationalen Zustandsübergangsmatrix zusammengesetzt wird, und ihre Gegenprüfung mit dem Square-Root-Information-Filter faltet dieselben Zeilen — eine Konsistenzprüfung zwischen zwei numerischen Maschinen, keine Bestätigung. Diese Art liefert den fehlenden Schiedsrichter: einen Batch-Kleinste-Quadrate-Schätzer, der den Anfangszustand des Chiefs aus simulierten Messungen tatsächlich WIEDERHERSTELLT, wobei die Messpartialableitungen als ZENTRALE FINITE DIFFERENZEN des zusammengesetzten Vorwärtsmodells genommen werden. Er ruft keine analytische Jacobi-Zeile, keine variationale STM, keine Singulärwert- oder Eigenwertzerlegung, keine Rangtoleranz und keinen Square-Root-Information-Filter auf — eine Quelltext-Wache in tests/cislunar_arc_recovery_reference.rs macht das durchsetzbar —, während die Dynamik (derselbe RK4-CR3BP-Fluss), die Anfangsbedingungen (dieselbe differenzialkorrigierte Konstellation), die skalare Observable und das Epochenraster bewusst geteilt und im ausgegebenen Block <c1/> benannt werden, weil zwei Analysen desselben physikalischen Problems sich über die Physik einig sein müssen, um vergleichbar zu sein. Zwei Kriterien, jedes über fünf Dekaden seiner eigenen Grenze durchfahren: RAUSCHFREIE WIEDERHERSTELLUNG (der Endzustandsfehler jedes Versuchs mit Seed höchstens recovery_factor mal seine A-priori-Auslenkung — das Rang-Analogon, ohne Singulärwerttoleranz darin) und MONTE-CARLO-SCHÄTZBARKEIT (der gemessene RMS-Positionsfehler über ein Rauschensemble mit Seed unterhalb einer genannten Grenze — das Schätzbarkeits-Analogon, gemessen statt vorhergesagt). Unterstützt den ebenen Vierzustand und den räumlichen Sechszustand, die Familien DRO / L2-Halo / L2-NRHO, Entfernungs- und Entfernungsraten-Observablen und eine mondzentrierte Polarparametrisierung, in der die Transformation auf den ZUSTAND angewendet und das Vorwärtsmodell dort neu differenziert wird. GEMESSEN am veröffentlichten ebenen DRO-Gitter: Der Schätzer stellt den Vierzustand ab { "0.782609" } h wieder her, gegenüber { "2.086957" } h beim Rangkriterium bei rel_tol { "1e-6" } (Verhältnis { "0.375" }) — die Rangschwelle ist als Wiederherstellbarkeitsgrenze NICHT bestätigt —, während die gemessene Schätzbarkeitsgrenze in derselben Gitterzelle landet wie die formale, { "5.739130" } h, und die gemessene Fehlerkurve das formale 1-Sigma über { "21" } Bogenlängen mit einem geometrischen Mittel des Verhältnisses von { "0.98" } reproduziert. MODELLED: der Konstellationsentwurf, das Epochenraster, die eine verfolgte Verbindung, die Größe der Auslenkung, das Messsigma und die zwei genannten Grenzen. Kein zertifiziertes Navigationsleistungsprodukt.

# attr:alt
seg-2fe411ae2153 = Das Diagramm, das die Engine für scenarios/cislunar-arc-recovery.toml schreibt, Art cislunar-arc-recovery

# text
seg-7ccd0a3babb8 = MODELLED Beobachtbarkeit einer ebenen cislunaren Konstellation (P6): verfolgt eine differenzialkorrigierte ebene DRO-Konstellation aus vier Raumfahrzeugen mit Entfernungsmessung zwischen den Satelliten und meldet, wie viel vom Vierzustand [x,y,ẋ,ẏ] eines Raumfahrzeugs der Bogen beobachtbar macht. Gibt aus ({ "1" }) die Tabelle Rang gegen Bogenlänge für eine einzelne reine Entfernungsverbindung — momentan Rang 1, wachsend zum vollen Vierzustand, wenn sich der Bogen verlängert (P6 Tabelle { "1" }); ({ "2" }) das Eigenspektrum der Beobachtbarkeits-Gram-Matrix + Konditionszahl über den Bogen; ({ "3" }) den Vergleich des momentanen Rangs von reiner Entfernung gegenüber Entfernung + Entfernungsrate (der Doppler-Entwurfshebel) plus die Meldung von GDOP bei reiner Entfernung singulär / bei Entfernung + Rate definiert; und ({ "4" }) eine unabhängige SRIF-Gegenprüfung, deren Posteriori-Kovarianz genau an dem Bogen endlich bzw. gut konditioniert wird, an dem der beobachtbare Rang vier erreicht. VALIDATED Kern: Der beobachtbare Rang ist eine rangaufdeckende Singulärwertschwelle, gegengeprüft mit dem Eigenrang der Gram-Matrix; das Eigenspektrum gehorcht den spektralen Invarianten (Spur=Σλ, Det=Πλ, Frobenius²=Σλ²); die variationale STM ist die durch finite Differenzen validierte CR3BP-STM; die Jacobi-Zeilen für Entfernung/Entfernungsrate sind durch finite Differenzen validierte analytische Partialableitungen (gegengeprüft mit der 3-D-Entfernungsraten-Observablen des Crates); die vier Anfangsbedingungen sind differenzialkorrigierte ebene DROs, die sich bis auf ein enges Periodizitätsresiduum schließen und retrograd sind; der Rangübergang ist gegen den Square-Root-Information-Filter des Crates gegengeprüft (Posteriori-Kovarianz genau bei vollem Rang endlich, cond(P)=cond(OᵀO)); ein rangdefizienter Schnappschuss wird als GDOP-undefiniert markiert (fim condition=inf), nie als ein falscher endlicher Wert — derselbe Schutz vor singulärer Geometrie, den pvt::solve_spp anwendet. MODELLED: der Konstellationsentwurf (Perilunamplituden und -phasen der DRO) und die konkrete Rangfolge, die er erzeugt. Kein zertifiziertes Navigationsleistungsprodukt.

# text
seg-c8a8be4b8894 = Erd-GNSS-Empfang in Monddistanz, die Schwachsignalschicht, die das Papier zur Konfliktresilienz nennt und für die die Engine kein Modell hatte. Ein GNSS-Satellit richtet seine Antenne auf die Erde; ein Empfänger nahe dem Mond sitzt etwa das Fünfzehnfache des Bahnradius entfernt, sodass drei Dinge zugleich zuschlagen. Die Erde VERDECKT DIE HAUPTSTRAHLRICHTUNG: Aus { "26,560" } km spannt sie einen Halbwinkel von { "13.9" } deg auf, sodass jeder zum Mond gerichtete Strahl den Sender mindestens so weit vom Nadir entfernt verlassen muss, was die Spitze der Keule beseitigt, bevor irgendeine Leistung berechnet wird. Was bleibt, sind der HAUPTKEULENRAND UND DIE NEBENKEULEN, das Regime, in dem die LuGRE-Nutzlast { "2025" } tatsächlich arbeitete. Und die Freiraumdämpfung beträgt etwa { "208" } dB bei L1, grob { "25" } dB mehr, als ein terrestrischer Nutzer zahlt. Der Bericht gibt eine Zeile je Satellit aus (Winkel zur Hauptstrahlrichtung, Erdverdeckung, Entfernung, Pfaddämpfung, Sendegewinn bei diesem Winkel, empfangene Leistung, Träger-Rausch-Dichte) und aggregiert nur die Verbindungen, die die Tracking-Schwelle erfüllen. ER MELDET AUCH DIE KONDITIONIERUNG, denn sie definiert diese Schicht: Jeder sichtbare Satellit liegt vom Mond aus gesehen in einem Kegel von wenigen Grad Breite, sodass die Sichtlinien nahezu parallel sind, die Verdünnung der Genauigkeit enorm ist und eine Erd-GNSS-Lösung in Monddistanz weit eher eine Beobachtung auf ZEITGEBUNGS-Niveau als auf Positionsniveau ist. MODELLED, und das Sendediagramm ist der Grund: Der Gewinn über den Winkel ist eine gleichförmige Kreisapertur (Airy), während eine reale GPS-L1-Antenne ein Wendelantennen-Array aus zwölf Elementen mit geformter Hauptkeule und Nicht-Airy-Nebenkeulen ist. Gemessene Diagramme existieren und werden hier nicht mitgeliefert, sodass Reihenfolgen und Größenordnungen aussagekräftig sind, das dB eines einzelnen Satelliten aber nicht. Bewusst NICHT ENTHALTEN, jeweils mit der Folge, dass das Budget optimistisch ist: keine ionosphärische oder troposphärische Dämpfung auf den den Limb streifenden Strahlen, keine Polarisations-, Zeige- oder Implementierungsverluste und eine kugelförmige Erde ohne refraktive Erweiterung. Die Mondposition ist eine EINGABE (Entfernung plus inertiale Richtung) statt eines Ephemeriden-Nachschlagens, weil die geprüfte Größe die Verbindung und die Strahlgeometrie ist. Diese Zeile auf validiert hochzustufen, braucht ein gemessenes Sendediagramm und LuGRE-Normalpunkte; keines von beiden ist im Repository, und keines wird hier erfunden.

# attr:alt
seg-cf1dce5fc824 = Das Diagramm, das die Engine für scenarios/earth-gnss-lunar.toml schreibt, Art earth-gnss-lunar

# text
seg-55679aff66db = Helmert-Bezugssystemdatum (Ähnlichkeit) mit sieben Parametern, angetrieben von einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE statt von einer eingespeisten Transformation. Ein Netz von Erdstationen beobachtet einen Katalog von Baken auf der Mondoberfläche nach einem expliziten Zeitplan; die Partiellen der lunaren VLBI-Verzögerung werden über diesen Zeitplan zu einer Fisher-Informationsmatrix der Bakenkoordinaten akkumuliert, genau wie es lunar-vlbi-fim tut; und diese Information wird über den Helmert-Entwurf A = [I3 | [p]_x | p] an den Katalogpunkten in die Datumskovarianz H = A^T M_b A fortgepflanzt, diagnostiziert durch crate::fim::crlb. KEINE Transformation wird eingespeist, und nichts wird aus einer untergeschobenen Antwort wiedergewonnen, sodass die ausgegebene Datumsgenauigkeit aus dem Beobachtungsprogramm folgt: Eine Halbierung des Verzögerungs-Sigmas halbiert sie exakt, und eine Verlängerung des Bogens verbessert sie, weil die Libration, die der Bericht MISST (sub_earth_direction_sweep_deg), das ist, was die Bakenkoordinate in Sichtlinienrichtung von denen in der Himmelsebene trennt. Rang, Datumsdefekt, Konditionszahl, das gesamte Spektrum, die nicht beobachtbaren Richtungen IN DER SIEBENPARAMETER-BASIS, die schwächste Richtung auch bei vollem Rang und der Anteil jedes Parameters daran werden bei jedem Lauf ausgegeben; ein Parameter, den die Kampagne nicht beschränkt, wird als NULL mit einem Status veröffentlicht, nie aus einer fast singulären Inversen abgelesen. Die Korrelation der Bakenfehler wird gemessen, nicht angenommen: Bei festgehaltenen Stationen berührt keine Beobachtung zwei Baken, sodass die Informationsmatrix exakt blockdiagonal ist (offblock_fraction { "0" }), und bei geschätzten Stationen ist der Schur-marginalisierte Block gekoppelt, wobei die induzierte Korrelation ausgegeben und die gesamte Fortpflanzung ohne sie erneut ausgeführt wird, sodass der Preis einer Unabhängigkeitsannahme eine Zahl ist. Dieselbe Fortpflanzung unter einem isotropen Sigma je Koordinate und der Wiedergewinnungsfehler, den das Szenario lunar-frame-realisation ausgibt, werden beide hier ausgeführt und mit ihren Verhältnissen neben dem Kampagnenwert ausgegeben. MODELLED: Der Bakenkatalog hat Quellen, aber die KAMPAGNE ist simuliert — das Stationsnetz und das Verzögerungs-Sigma sind illustrative Eingaben, einzelne Verzögerungsbeobachtungen werden als unabhängig behandelt, und die Ephemeride des Mondzentrums, die Stationsuhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten, sodass die Datumskovarianz eine Cramér-Rao-Schranke für einen reduzierten Parametersatz ist. Kein geodätisches Produkt.

# text
seg-0c4c119abfca = Modellierte Realisierung des lunaren Bezugssystems: eine Anpassung eines Helmert-Datums (Ähnlichkeit) mit 7 Parametern — { "3" } Translationen, { "3" } Kleinwinkel-Rotationen, { "1" } Maßstab —, die einen geschätzten Satz von aus der Selenographie abgeleiteten MCMF-Punktkoordinaten durch gewichtete kleinste Quadrate (crate::batch_ls::gauss_newton) an ein Datum bindet, plus eine einfache Orientierungsanbindung, die die realisierte kleine Rotation um die ICRF-Achsen relativ zur Körperorientierung IAU { "2015" } WGCCRE ausdrückt. Das Szenario speist eine bekannte kleine Transformation (Translation ~einige zehn m, Rotation ~µrad, Maßstab ~{ "1e-7" }) in ein gut verteiltes synthetisches Punktnetz ein, fügt Gaußsches Rauschen mit Seed hinzu, gewinnt das Datum zurück und gibt die zurückgewonnene Transformation, den Wiedergewinnungsfehler je Parameter gegen die eingespeiste Wahrheit und das RMS-Residuum nach der Anpassung aus. MODELLED Selbstkonsistenz — gewinnt eine eingespeiste Ähnlichkeitstransformation zurück (rauschfrei bis auf ~Maschinengenauigkeit), KEINE Realisierung gegen echte Verfolgungs-/VLBI-Daten; deterministisch (mit Seed); kein TRL/Flugerbe/keine Billigung durch eine Agentur.

# text
seg-f3b4a80a739b = kein Plot: Das Beispiel schreibt kein Diagramm

# text
seg-4b6daea39f5c = ARAIM-Schutzniveau-Überflug am lunaren Südpol gegen einen repräsentativen Satz von LunaNet-Relais. sigma_ure_m legt die Genauigkeit der Signal-in-Space-Entfernungsmessung offen (Schutzniveaus skalieren linear damit, sodass ein Durchfahren die Frage beantwortet, welche Entfernungsmessgenauigkeit ein Alarmgrenzwert verlangt). Standardmäßig der historische Südpolfall der Klasse LNIS.

# text
seg-200e58e189c2 = Modellierter gemeinsamer Batch-Schätzer für lunare Bahnbestimmung (OD) + Uhren mit mehreren Techniken auf einem SIMULIERTEN Netz: eine Gauss-Newton-Momentaufnahmeanpassung, die geodätische VLBI-Verzögerungen auf Erdbasislinien, lunar-lokale Entfernungen zwischen Station und Satellit und Entfernungen zwischen Satelliten fusioniert, um gemeinsam die 3D-Position einer lunaren Oberflächenstation, die Positionen einer kleinen Konstellation und den Uhrenversatz jedes Assets aus einer eingespeisten Wahrheit zurückzugewinnen. Das ehrliche Hauptergebnis — VLBI macht die volle 3D-Position der Station beobachtbar, wo die lunar-lokale Entfernungsmessung allein eine schwach beobachtete Richtung lässt — wird als Kontrast des Stationsfehlers mit gegenüber ohne VLBI ausgegeben. MODELLED simulierte Wiedergewinnung im geschlossenen Regelkreis (die Wahrheit teilt das Beobachtungsmodell), deterministisch (mit Seed), NICHT mit realen Daten validiert; keine Kraftmodell-Propagation im Löser; kein TRL/Flugerbe/keine Billigung durch eine Agentur.

# text
seg-f7ea776e70c9 = Modellierte Abdeckung einer lunaren Referenzstation: ein Monte-Carlo-Durchlauf des Modells für lunares differentielles PNT über ein Nutzergitter am Südpol und einen Tag an Epochen. Eine differentielle Referenzstation an einem bekannten Standort am Südpol korrigiert eine angegebene Konstellation (illustrativ keplersch oder eine tabellierte Ephemeride) mit einem angegebenen Signal-in-Space-Fehler, Vermessungsfehler, einer Korrekturlatenz und Quantisierung der Verbindung; je Punkt und über die Region gibt es den Perzentilwert des korrigierten und des unkorrigierten Positionsfehlers (3D, horizontal, vertikal), die Verfügbarkeit, die Abdeckung gegen eine angegebene Schwelle, Schutzniveaus nach DO-229E, den Abdeckungsradius je Azimut und das Link-Budget der Korrekturstrecke an der Station und am ungünstigsten Punkt an. Keine Aussage über die Leistung irgendeines realen Systems; nicht mit einer Agentur verbunden oder von ihr gebilligt. MODELLED.

# text
seg-cac3a0bcbfc6 = MODELLED durchgängiges Zeitfehlerbudget der koordinierten Mondzeit (LTC): die sieben LTC-Fehlerterme, zusammengestellt als Zeitfehlerkurven x_i(τ) über ein ganzes Gitter von Mittelungszeiten, per Wurzelsumme zu x_Σ(τ) zusammengefasst, und der ÜBERGANG τ zwischen Uhr und Bezugssystem, bei dem der wachsende Uhrenterm den konstanten Echtzeit-Term der Bezugssystemrealisierung überholt (darunter ist das Budget vom Bezugssystem begrenzt, darüber von der Uhr) — die ehrliche Antwort auf das Artefakt eines einzelnen τ. Die τ-Steigungen sind in geschlossener Form und analytisch prüfbar (Uhr τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, Böden τ^{ "0" }, Messung τ^{ "{" }-1/2{ "}" }), und die Uhrenzeilen reproduzieren die veröffentlichten Eintages-Spezifikationen der Uhren (crate::clock_specs); die GRÖSSEN der Böden für HF-/optischen Link, Bezugssystemrealisierung, relativistisches Residuum und Ephemeride sind modellierte Budgetzuweisungen (dokumentierte Standardwerte, vom Aufrufer überschreibbar), keine Messungen. Der Beitrag ist das reproduzierbare Übergangs-τ, keine zertifizierte Zahl je Term; nicht zertifiziert für den operativen Zeithaltebetrieb.

# text
seg-7f3e13712f10 = Modellierte relativistische Uhrenrate Erde–Mond (Lunar Coordinate Time, LTC/TCL): die säkulare Rate LTC−TT aus der Differenz der Eigenpotenziale und dem kinetischen Term des Mondes, ausgegeben mit dem veröffentlichten Band von { "56" }–{ "59" } µs/Tag, plus der über einen Horizont akkumulierte Versatz.

# text
seg-1bc37634ba9f = Kovarianz der Stationskoordinaten bei lunarer VLBI: die Verzögerungspartiellen der Observablen lunar-vlbi, über einen expliziten ZEITPLAN (Basislinien x Epochen) zu einer Fisher-Informationsmatrix akkumuliert, invertiert und als Kovarianz der Stationskoordinaten und als Stations-Sigma je Koordinate ausgegeben — eine berechnete Engine-Ausgabe statt einer skalaren Verzögerungspräzision, die durch einen angenommenen isotropen Gleichverteilungsfaktor g = { "3" } geschoben wird. Der Zustand trägt erdFESTE (ITRS) Stationskoordinaten, sodass die Jacobi-Matrix die inertiale Partielle ist, gedreht mit der GCRS->ITRS-Matrix jeder Epoche: Die Erdrotation macht diese Koordinaten beobachtbar, und der Bericht MISST den erdfesten Sichtliniendurchlauf und die Deklination der Bake, statt sie anzunehmen. Eine Beobachtung ist ein Paar (Basislinie, Epoche) mit BEIDEN Stationen oberhalb der Elevationsmaske, gewichtet mit 1/delay_sigma_s^{ "2" }. Gibt bei jedem Lauf Rang, Datumsdefekt, Konditionszahl, das gesamte Informationsspektrum, die Kovarianzmatrix, Sigmas je Station und Achse sowie in 3D und den Nullraum des freien Netzes aus; bei einem Rangdefizit wird das Haupt-Sigma als NULL mit einem Status veröffentlicht, nie aus einer fast singulären Inversen abgelesen. Der Gleichverteilungswert c<em>delay_sigma_s</em>sqrt(g/N) für DENSELBEN Zeitplan wird mit dem Verhältnis neben dem berechneten Wert ausgegeben, zusammen mit der isotropen Spurschranke sqrt(p/trace(M)), die AM-HM zu einer harten Untergrenze macht — das Verhältnis ist also die Anisotropie, die die Annahme verworfen hat. Die Verzögerungsschließung tau_ik = tau_ij + tau_jk macht nur n-1 der n(n-1)/2 Basislinien geometrisch unabhängig; der Bericht nennt beide Zahlen. MODELLED: Die Ephemeride des Mondzentrums, die Stationsuhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten, und Beobachtungen werden als unabhängig behandelt, sodass die Kovarianz eine Cramér-Rao-Schranke für einen reduzierten Parametersatz ist, kein vorhergesagtes Sitzungsergebnis; das Verzögerungs-Sigma, die Stationskoordinaten und der Zeitplan sind Eingaben. Die Partielle, die die Jacobi-Matrix der geometrischen Verzögerung auslässt (der differenzierte Shapiro-Term), wird durch finite Differenz gemessen und ausgegeben. Kein geodätisches Produkt.

# text
seg-e01f77d493a0 = Modellierte geodätische Lunar-VLBI-Laufzeitobservable: Eine Erdbasislinie (zwei Bodenstationen, GCRS) beobachtet ein Einweg-Signal eines Beacons der NovaMoon-Klasse auf der Mondoberfläche. Sie liefert die Nahfeld-Laufzeit als Zwei-Entfernungs-Differenz, ihre Rate und die Wellenfrontkrümmungs-Nahfeldkorrektur über einen Durchgang — gegengeprüft gegen die Ebene-Welle-Δ-DOR-Observable derselben Codebasis im Fernfeldgrenzfall, mit durch finite Differenzen verifizierten Partialableitungen. Der analytische Standardpfad ist MODELLED und trägt die Vorbehalte zu Bezugssystemkonsistenz, Polbewegung xp=yp={ "0" } und Ebene-Welle-gegen-Nahfeld. Wird planetary_kernel_path, earth_orientation_kernel_path und moon_orientation_kernel_path gesetzt, läuft stattdessen der Kernel-Pfad (DE440, MOON_PA_DE440, ITRF93; konvergierte baryzentrische Lichtlaufzeiten; ergänzt die Beacon- und Stationspartialableitungen der Epoche), dessen newtonsche Laufzeit und Partialableitungen mit den konvergierten Lichtlaufzeiten von NAIF SPICE auf { "0.06" } ps und { "7.4e-9" } übereinstimmen. Nicht gegen reale VLBI-Daten validiert.

# text
seg-4e31c8daf798 = Register

# text
seg-efd15cff3d32 = MODELLED (Ergebnisbezeichnung)

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/lunar-and-cislunar.md
seg-a240ef37dc6d = Quelle: <c1/>

# text
# c1: kshana scenarios/lunar-infrastructure-od-consistency.toml
seg-369e7cfcc1d3 = Themenseiten: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Einen ausführen: <c1/>. Alle Familien: <a4>KINDS.md</a4>.

# text
seg-fd2a12be04c2 = Durchlauf der lunaren Südpol-ARAIM-Schutzniveaus gegen einen repräsentativen LunaNet-Relaissatz.

# text
seg-240eb5858113 = Modellierte relativistische Uhrenrate Erde–Mond (Lunar Coordinate Time, LTC/TCL): die säkulare Rate LTC−TT aus der Differenz des Eigenpotentials und dem kinetischen Term des Mondes, ausgegeben mit den veröffentlichten { "56" }–{ "59" }

# text
seg-177bff8d753e = MODELLED durchgängiges Zeitfehlerbudget der Coordinated Lunar Time (LTC): die sieben LTC-Fehlerterme, zusammengesetzt als Zeitfehlerkurven x_i(τ) über ein ganzes Mittelungszeitgitter, per Wurzel aus der Summe zu x_Σ(τ) zusammengefasst, und die c

# text
seg-df0437ef8324 = Modellierte geodätische Lunar-VLBI-Laufzeitobservable: Eine Erdbasislinie (zwei Bodenstationen, GCRS) beobachtet ein Einweg-Signal eines Beacons der NovaMoon-Klasse auf der Mondoberfläche.

# text
seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

# text
seg-38254487fb7f = Lunar-VLBI-Stationskoordinaten-Kovarianz: die Laufzeitpartialableitungen der lunar-vlbi-Observable, akkumuliert über einen expliziten PLAN (Basislinien x Epochen) zu einer Fisher-Informationsmatrix, invertiert und aus

# text
seg-23706714da99 = Modellierter gemeinsamer lunarer Multitechnik-Bahnbestimmungs- + Uhren-Batch-Schätzer auf einem SIMULIERTEN Netz: eine Gauß-Newton-Schnappschussanpassung, die Erdbasislinien-Laufzeiten der geodätischen VLBI, mondlokale Entfernungen Station↔Satellit fusioniert

# text
seg-2359450b3967 = Modellierte Realisierung des lunaren Bezugssystems: eine Datumsanpassung nach Helmert (Ähnlichkeit) mit 7 Parametern — { "3" } Translationen, { "3" } Kleinwinkelrotationen, { "1" } Maßstab —, die einen geschätzten Satz selenographisch abgeleiteter MCMF-Punkt-c

# text
seg-2a5af9961e99 = Bezugssystem-Datum nach Helmert (Ähnlichkeit) mit sieben Parametern, getrieben von einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE statt von einer eingespeisten Transformation.

# text
seg-3615bea1ea75 = Lunares Bezugssystem-Datum nach Helmert mit sieben Parametern, getrieben von einer REALEN, ARCHIVIERTEN Beobachtungskampagne statt von einer simulierten.

# text
seg-ed4ec8b6378c = Modellierte Abdeckung einer lunaren Referenzstation: ein Monte-Carlo-Sweep des Modells des lunaren differenziellen PNT über ein südpolares Nutzergitter und einen Tag von Epochen.

# text
seg-aeec32be6092 = Oberflächen-Beacon-Augmentation eines lunaren Orbit-Navigationsdienstes, als lauffähige Vorher/Nachher-Tabelle.

# text
seg-b28693368acd = Modellierter lunarer Interoperabilitätsexport: gibt das lunare Bezugssystem, die lunare Zeitskala und die lunare Ephemeride in LunaNet/IOAG-ausgerichteten, CCSDS-basierten Austauschformen aus, mit Rundlauf- / Feld-Übereinstimmung

# text
seg-d88605893c05 = MODELLED planare cislunare Konstellations-Beobachtbarkeit (P6): verfolgt eine differenzialkorrigierte planare DRO-Konstellation aus vier Raumfahrzeugen mit Inter-Satelliten-Entfernungsmessung und gibt aus, wie viel der eines Raumfahrzeugs

# text
seg-8eaec90d1df5 = MODELLED Test des unabhängigen Schätzers für die Bogenlängen-Beobachtbarkeitsschwelle von cislunar.

# text
seg-9619b3d699c6 = Angriffsfläche der Signalsicherheit der lunaren Oberflächennavigation (P1): setzt die offenen Signalsicherheitsanalysen zu einem binär erreichbaren Lauf zusammen.

# text
seg-64c78e211181 = Mondeigenes HF-Jamming: Jammer-zu-Signal-Verhältnis pro Satellit, effektives C/N₀ und Lock-Verlust für einen selenographischen Oberflächennutzer unter einem Jammer auf der Mondoberfläche (oder erhöht), über die illustrative öffentliche Quellen

# text
seg-df68720ee7a5 = Erd-GNSS-Empfang in lunarer Entfernung, die Schwachsignalschicht, die die Arbeit zur Konfliktresilienz nennt und für die die Engine kein Modell hatte.

# text
# c1: step_s
# c2: duration_s
# c3: alert_limit_m
# c4: p_hmi
# c5: sigma_ure_m
seg-ca4fac406beb = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
# c1: epoch_year
# c2: epoch_month
# c3: epoch_day
# c4: horizon_days
seg-564b491c4bb8 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>.

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-128bf57a76d1 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-d6aa5d645fb7 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-time-budget</a1>.

# text
# c1: station1_lat_deg
# c2: station1_lon_deg
# c3: station1_alt_m
# c4: station2_lat_deg
# c5: station2_lon_deg
# c6: station2_alt_m
# c7: beacon_lat_deg
# c8: beacon_lon_deg
# c9: beacon_alt_m
# c10: epoch_year
# c11: epoch_month
# c12: epoch_day
# c13: horizon_hours
# c14: step_min
# c15: planetary_kernel_path
# c16: earth_orientation_kernel_path
# c17: moon_orientation_kernel_path
seg-79140f2544ea = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

# text
seg-de468e4d4b46 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "3" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-vlbi</a1>.

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
seg-7da3c3ff2386 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-3119d4005897 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-vlbi-fim</a1>.

# text
# c1: n_sat
# c2: n_earth
# c3: seed
# c4: sigma_vlbi_s
# c5: sigma_range_m
# c6: sigma_isl_m
# c7: station_lat_deg
# c8: station_lon_deg
# c9: station_alt_m
# c10: orbit_radius_km
# c11: sigma_clock_s
# c12: orbit_ecc
# c13: orbit_inc_deg
# c14: orbit_argp_deg
# c15: orbit_planes
# c16: epoch_year
# c17: epoch_month
# c18: epoch_day
seg-6f59a33a35b3 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
# c1: n_points
# c2: tx_m
# c3: ty_m
# c4: tz_m
# c5: rot_x_urad
# c6: rot_y_urad
# c7: rot_z_urad
# c8: scale_ppb
# c9: noise_sigma_m
# c10: seed
# c11: epoch_year
# c12: epoch_month
# c13: epoch_day
seg-32c31af24e1b = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
# c1: stations
# c2: beacons
# c3: epoch_year
# c4: epoch_month
# c5: epoch_day
# c6: arc_hours
# c7: step_min
# c8: delay_sigma_s
# c9: elevation_mask_deg
# c10: earth_elevation_mask_deg
# c11: station_datum
# c12: rel_tol
# c13: assumed_coordinate_sigma_m
# c14: solver
seg-96efcb8d55d1 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-ce2f0f85dda4 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "3" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-frame-campaign</a1>.

# text
# c1: data_dir
# c2: normal_points_dir
# c3: reflectors_path
# c4: stations_path
# c5: dut1_s
# c6: rel_tol
# c7: compare_simulated_campaign
# c8: sensitivity_tilt_deg
# c9: planetary_kernel_path
# c10: extra_reflectors
# c11: extra_beacons
# c12: extra_earth_elevation_mask_deg
# c13: beacon_campaign
seg-d9e24a9a8c0c = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-4f05fad4b146 = <b>Register:</b> VALIDATED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-llr-datum</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: lat_min_deg
# c7: lat_max_deg
# c8: lat_step_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: lon_step_deg
# c12: horizon_hours
# c13: step_min
# c14: elev_mask_deg
# c15: pdop_threshold
# c16: alert_limit_m
# c17: p_hmi
# c18: perturbed
# c19: sigma_ure_m
# c20: export_site_lat_deg
# c21: export_site_lon_deg
# c22: export_antenna
# c23: ephemeris_path
# c24: planetary_kernel_path
# c25: epoch_utc
# c26: terrain
seg-8d9e0277303e = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ref_lat_deg
# c7: ref_lon_deg
# c8: baseline_km
# c9: orbit_err_m
# c10: clock_err_m
# c11: noise_m
# c12: seed
# c13: t_s
# c14: residual_sigma_m
# c15: p_hmi
# c16: survey_sigma_m
# c17: latency_s
# c18: quantization_bits
seg-6fe67fa619d0 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
# c7: mask_deg
# c8: station_lat_deg
# c9: station_lon_deg
# c10: station_height_m
# c11: survey_sigma_m
# c12: orbit_err_m
# c13: clock_err_m
# c14: sise_sigma_m
# c15: sise_orbit_variance_fraction
# c16: noise_m
# c17: latency_s
# c18: quantization_bits
# c19: grid_lat_max_deg
# c20: grid_lat_step_deg
# c21: points
# c22: t_start_s
# c23: t_span_s
# c24: t_step_s
# c25: n_trials
# c26: accuracy_threshold_m
# c27: percentile
# c28: alert_limit_m
# c29: residual_sigma_m
# c30: p_hmi
# c31: seed
# c32: terrain
# c33: orbit_err_growth_m_per_s
# c34: receiver
# c35: solution
seg-facc442295f1 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

# text
seg-8a2f6f535c4a = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-station-coverage</a1>.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-a790c54ac1aa = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-4efffcd615df = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-beacon</a1>.

# text
# c1: frame
# c2: time_system
# c3: n_states
# c4: epoch
# c5: step_min
# c6: object
seg-720d0bbeaf6e = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: rel_tol
# c6: spatial
# c7: sigma_range_m
# c8: family
# c9: n_spacecraft
# c10: sigma_pos_threshold_km
seg-28695dd2ecc3 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-af5d871bc69e = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>cislunar-observability</a1>.

# text
# c1: mu
# c2: arc_hours
# c3: epochs
# c4: steps
# c5: spatial
# c6: family
# c7: n_spacecraft
# c8: observable
# c9: coordinates
# c10: trials
# c11: seed
# c12: displacement_nd
# c13: recovery_factor
# c14: sigma_range_m
# c15: sigma_range_rate_mm_s
# c16: error_bound_km
# c17: max_iterations
# c18: rel_tol
seg-f646e9fd7553 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-5e7bd8bb1adf = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>cislunar-arc-recovery</a1>.

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-3c514f3acc78 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

# text
seg-00b06a4fc0e0 = <b>Register:</b> Keine Matrixzeile nennt diesen Typ; die Engine kennzeichnet ihr Ergebnis selbst. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>lunar-attack-surface</a1>.

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-079d2bb805f1 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-63d4157e2294 = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>lunar-jamming</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-7bb977529f30 = Pflichtfelder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-287f89e6bf6b = <b>Register:</b> MODELLED. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>earth-gnss-lunar</a1>.

# text
# c1: study
# c2: seed
# c3: orbit
# c4: gnss
# c5: ground
# c6: monte_carlo
# c7: surface
# c8: llr
# c9: orbiter
# c10: gravimeter
# c11: clock
# c12: techniques
# c13: nominal
seg-f7ed8b60e7d1 = Pflichtfelder: <c1/>. Optional: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-41e50e49da99 = <b>Register:</b> Keine Matrixzeile nennt diesen Typ; die Engine kennzeichnet ihr Ergebnis selbst. Vollständige Seite mit Eingaben, Ergebnissen, Nachweisen und Einschränkungen: <a1>lunar-infrastructure</a1>.

# text
seg-09f7f99d04a6 = <s1>Zurück</s1>Navigation im niedrigen Erdorbit

# text
seg-74c6bf83988e = <s1>Weiter</s1>Missionsanalyse, Funkstrecken und Raumfahrtbetrieb

# text
seg-004c56ded47f = Angriffsfläche der Signalsicherheit für die Oberflächennavigation auf dem Mond (P1): fasst die offenen Signalsicherheitsanalysen zu einem über die Binärdatei erreichbaren Lauf zusammen. Berichtet ({ "1" }) die empfangene AFS-Leistung und ihren Leistungs-ÜBERSCHUSS gegenüber einer terrestrischen GPS-Referenz, dazu das Empfindlichkeitsband von 12-18 dB als echten mehrachsigen Sweep über die Streckeneingaben (Referenzpegel x EIRP x Schrägentfernung) mit dem Abgleich der linearen Faktoren 25x gerundet / 28x ungerundet. ÜBERARBEITET (Regel R4): Dieser Bericht wies ein Leistungs-DEFIZIT von { "15.6" } dB und einen Faktor von 32x/36x aus, bis die GPS-Referenz von -125 / -128.5 (das sind die dBm-Werte) auf -155 / -158.5 dBW korrigiert wurde, die Werte aus ICD-GPS-200, die das Jamming-Modul schon immer geführt hat. Das Vorzeichen kehrt sich um: Das modellierte AFS-Signal des Mondes ist { "14.4" } dB STÄRKER als terrestrisches GPS L1 C/A, nicht schwächer. Die empfangene Leistung selbst hat sich um kein Bit bewegt, und der lineare Faktor ist der alte, geteilt durch genau { "1000" }, und das ist genau der Versatz von { "30" } dB zwischen dBm und dBW; ({ "2" }) die erforderliche Sendeleistung des Angreifers zum Spoofen (J/S = { "3" } dB) und zum Verweigern (J/S = { "30" } dB) bei jedem Abstand, die Umkehrung der J/S-Strecke; ({ "3" }) der orbitale Erfassungsfußabdruck unter einem realen Antennendiagramm einer gleichförmigen Apertur (Airy [{ "2" } J1(x)/x]^{ "2" }), eine höhenbegrenzte, subhemisphärische Kappe, deren Rand NICHT erfasst wird; ({ "4" }) ein berechnetes Ergebnis des Spoof-Capture-Pull-in der Tracking-Schleife (zieht ein Spoofer mit passendem Code bei gegebenem Leistungsvorteil und Codeversatz die DLL/PLL tatsächlich mit) statt der behaupteten Schwelle von { "3" } dB; ({ "5" }) die geometrische Horizontreichweite eines erhöhten Oberflächensenders auf einem Körper ohne Atmosphäre; und ({ "6" }) das Authentifizierungsbudget von OSNMA/TESLA ({ "20" } bit/s Overhead = ~{ "40" } % einer AFS-Navigationsnachricht mit { "50" } bit/s, Latenz der Schlüsselfreigabe, { "2" }^-40 Fälschung). Ein leerer Rumpf reproduziert die P1-Basislinie; jede Eingabe hat einen Standardwert und ist überschreibbar. Teilergebnisse der Stufe VALIDATED tragen die unabhängige Referenz ihres Quellmoduls (geschlossene dB-Radiometrie; J/S-Umkehr im Rundlauf; Airy-Diagramm gegen A&S-Bessel und Kugelkappengeometrie; DLL/PLL-Pull-in gegen Kaplan & Hegarty; Identität des sphärischen Tangentenhorizonts gegen eo_payload; Feldgrößen nach OSNMA SIS-ICD). MODELLED: die repräsentativen Geometrie- und Leistungsgrößen und die konkreten Werte der Zellen der Capture-Map. Kein zertifiziertes Sicherheitsprodukt.

# text
seg-5a4dcb93a643 = Modellierter lunarer Interoperabilitätsexport: gibt das lunare Bezugssystem, die lunare Zeitskala und die lunare Ephemeride in an LunaNet/IOAG angelehnten, auf CCSDS basierenden Austauschformen mit Rundlauf-/Feldkonformität aus. WIEDERVERWENDET den CCSDS-OEM-{ "2.0" }-Emitter und -Parser des Crates (crate::oem), für den lunaren Kontext neu etikettiert — REF_FRAME trägt das lunare Körperbezugssystem IAU { "2015" } WGCCRE (MOON_ME / MOON_PA), TIME_SYSTEM die lunare Zeitskala (LTC / TCL / UTC), CENTER_NAME = MOON — über eine beispielhafte illustrative Ephemeride der Klasse LCNS (Positionen aus crate::lunar_service, Geschwindigkeit per finiter Differenz). Gibt außerdem einen an LunaNet/IOAG angelehnten Deskriptor der Mondzeit aus (Skalen-ID, säkulare Rate µs/Tag aus crate::lunar_time, veröffentlichtes Band, Bezugsfläche), der über serde_json einen Rundlauf besteht, und verpackt die Artefakte in den bestehenden KIF-Umschlag (crate::interchange) mit der Ehrlichkeitsbezeichnung MODELLED. Meldet ausgegebene Artefakte, OEM-Zeilenzahl, Feldkonformitätsprüfung (bestanden) samt Liste vorhandener/fehlender Felder, OEM-Rundlauf in Ordnung, Zeitmetadaten-Rundlauf in Ordnung und KIF-Bytegröße. MODELLED — deterministischer Rundlauf und Feldnamenkonformität gegenüber dem veröffentlichten CCSDS-OEM und der Feldsemantik von LunaNet/IOAG sind die unabhängige Referenz; KEIN zertifizierter Test der Interoperabilitätskonformität; illustrative Ephemeride aus öffentlichen Quellen, nicht mit der ESA verbunden; keine TRL-/Heritage-/Behördenbestätigung.

# text
seg-019ca0f1051e = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-interop-export</a1>.

# attr:alt
seg-07d97fc1abac = Das Diagramm, das die Engine für scenarios/lunar-vlbi.toml schreibt, Szenarioart lunar-vlbi

# attr:alt
seg-0e86ff364c17 = Das Diagramm, das die Engine für scenarios/lunar-interop-export.toml schreibt, Szenarioart lunar-interop-export

# text
seg-0f0b2d0ca0b4 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-time-offset</a1>.

# text
seg-142f2253e4d6 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-joint-od-clock</a1>.

# attr:alt
seg-15b8e26dc24b = Kontaktbogen der Diagramme, die die Engine für die Szenarioarten der Familie Mond und cislunar schreibt

# attr:alt
seg-19c383444296 = Das Diagramm, das die Engine für scenarios/lunar-vlbi-fim.toml schreibt, Szenarioart lunar-vlbi-fim

# text
seg-204901ae3684 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>moonlight-service-volume</a1>.

# attr:alt
seg-56fe184f2a12 = Das Diagramm, das die Engine für scenarios/lunar-time-budget.toml schreibt, Szenarioart lunar-time-budget

# attr:alt
seg-610fa190a393 = Das Diagramm, das die Engine für scenarios/lunanet-araim.toml schreibt, Szenarioart lunar-integrity

# attr:alt
seg-6fe8b3c6c584 = Das Diagramm, das die Engine für scenarios/lunar-jamming.toml schreibt, Szenarioart lunar-jamming

# text
seg-73c0415efd2f = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-frame-realisation</a1>.

# attr:alt
seg-883d94b321b4 = Das Diagramm, das die Engine für scenarios/lunar-frame-campaign.toml schreibt, Szenarioart lunar-frame-campaign

# attr:alt
seg-8e67df89448a = Das Diagramm, das die Engine für scenarios/lunar-differential-pnt.toml schreibt, Szenarioart lunar-differential-pnt

# attr:alt
seg-922b8656fcae = Das Diagramm, das die Engine für scenarios/lunar-station-coverage.toml schreibt, Szenarioart lunar-station-coverage

# text
# c1: jamming
seg-a91a9ad5d8d1 = Mondeigenes HF-Jamming: Störer-zu-Signal-Verhältnis je Satellit, effektives C/N₀ und Verlust der Aufschaltung für einen selenographischen Oberflächennutzer unter einem Störer an der Mondoberfläche (oder erhöht), über der illustrativen Konstellation im Mondorbit der Klasse Moonlight/LCNS aus öffentlichen Quellen. Setzt die vorhandene offene Jamming-Physik zusammen (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) mit der vorhandenen lunaren Himmelsgeometrie (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); weder Geometrie noch Radiometrie werden neu abgeleitet. Anders als bei der Erd-Szenarioart <c1/> ist der Signalzweig NICHT eine feste Empfangsleistung: Die isotrope Empfangsleistung jedes Satelliten ist sein eigenes Link-Budget EIRP − FSPL(Schrägentfernung), sodass das J/S von Satellit zu Satellit mit lunarer Entfernung und Elevation variiert. Gibt EINE ZEILE JE SICHTBAREM (Epoche, Satellit) LINK aus — Azimut, Elevation, Schrägentfernung, beide Empfangsleistungen, deren Differenz das J/S ist, das J/S, das nominelle und das effektive C/N₀ und den Aufschaltstatus — sowie aggregierte Gütezahlen neben (nie anstelle von) dieser Tabelle und dieselbe Tabelle als CSV-Artefakt. Jedes ausgegebene numerische Feld trägt eine Einheit und eine Herkunftsklasse. VALIDATED Teilergebnisse tragen die Referenz ihres Quellmoduls (die Anti-Jam-Gleichung und das J/S-Link von Kaplan & Hegarty §{ "9.4" }, extern referenziert in tests/gnss_denied_jamming_resilience_reference.rs; die lunare Geometrie von lunar_service). Die Zusammensetzung selbst wird gegen einen unabhängigen Pfad mit zwei Link-Budgets (linkbudget::received_signal_power_dbw, ein anderer Ausdruck für die Freiraumdämpfung) bis auf { "1e-9" } dB gegengeprüft. MODELLED: die illustrative Konstellation, die repräsentative EIRP / Störerleistung / Antennengewinne / Rauschtemperatur und das Fehlen von Geländeabschattung, Mehrwegeausbreitung, AGC-Dynamik und adaptiver Nullung. Kein zertifiziertes Produkt zur Dienstverweigerung. Ist ein Störer konfiguriert, enthält der Bericht außerdem eine VERWEIGERUNGSKONTUR MIT EINEM UNSICHERHEITSBAND statt einer von einem einzigen Skalar abgelesenen Kontur: die vollständige gemessene Verteilung des C/N₀ des Nutzsignals über die Tabelle je Satellit (n, min, p05, p25, Median, p75, p95, max, Mittelwert, Stichproben-Standardabweichung und die eigene Asymmetrie der Stichprobe) und die Kontur, ausgewertet an jeder dieser Ordnungsstatistiken unter BEIDEN Verweigerungskriterien, die die Engine kennt — dem bisherigen Leistungsverhältnis (J/S = { "30" } dB, wie in attack-surface und tracking-loop) und dem Verlust der Aufschaltung (effektives C/N₀ fällt auf tracking_threshold_dbhz, das Kriterium, das die eigene Statusspalte dieses Berichts verwendet) — auf beiden Achsen der Verweigerungsebene (erforderliche Störer-EIRP beim Abstand des Szenarios, Verweigerungsabstand bei der EIRP des Szenarios). Die Bandgrenzen SIND contour(p05) und contour(p95), dieselbe Abbildung in geschlossener Form, angewandt auf die eigenen Quantile der Stichprobe: kein an die Stichprobe angepasstes Sigma und nicht Median ± k·Standardabweichung, wobei die Standardabweichung der Kontinuität halber ausgegeben und von nichts verwendet wird. Ein Quantil, das bereits an oder unter der Tracking-Schwelle liegt, hat kein endliches verweigerndes J/S, und seine Spalten zum Verlust der Aufschaltung sind null mit einem gezählten Grund, nie ein auf einen Wert begrenzter Radius.

# text
seg-befef5f2f8dd = Mond und cislunar (Szenarioarten-Familie)

# text
seg-c83350735643 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-differential-pnt</a1>.

# attr:alt
seg-cfa051b87e59 = Das Diagramm, das die Engine für scenarios/lunar-joint-od-clock.toml schreibt, Art lunar-joint-od-clock

# text
# c1: study
seg-d0fb90f506c9 = MODELLED Studien zu Umlaufbahn und Oberfläche des Mondes als Navigations- und Geodäsie-Infrastruktur, fünf Studien hinter einer Szenarioart, ausgewählt durch <c1/>: od-consistency (Bahnbestimmung an Bord mit Erd-GNSS in einer NRHO oder ELFO gegen eine unabhängige radiometrische Bahnbestimmung vom Boden, beurteilt an ihren eigenen Kovarianzen über eine Monte-Carlo-Simulation mit Seed), carrier-phase (gemeinsame doppeltdifferenzierte Trägerphase von Oberfläche und Orbiter und Auflösung der ganzzahligen Mehrdeutigkeit mit LAMBDA), frame-coestimation (eine Oberflächenstation und Orbiter, die der Entfernungsmessung von Erdstationen für das Helmert-Bezugssystemdatum des Mondes mit sieben Parametern hinzugefügt werden), space-tie (GNSS, VLBI und Laserentfernungsmessung auf einem Raumfahrzeug, Präzision der Bezugssystemanbindung gegen den Fehler der lokalen Anbindung) und geodesy-sensitivity (Fisher-Information der Love-Zahlen h2, k2, l2 des Mondes und der physikalischen Libration aus Laserentfernungsmessung, Orbiter-Verfolgung, einem Oberflächengravimeter und einer Oberflächenuhr). Ein eingeschränktes Dreikörpermodell mit angegebenen Vereinfachungen; die Numerik wird gegen unabhängige Programme geprüft, und nichts wird mit einer Messung einer lunaren Größe verglichen.

# text
seg-da20b48985b9 = <b>Register:</b> keine Matrixzeile nennt diese Szenarioart; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>lunar-integrity</a1>.

# attr:alt
seg-e4da113cbe18 = Das Diagramm, das die Engine für scenarios/lunar-llr-datum.toml schreibt, Art lunar-llr-datum

# text
# c1: study
seg-e6475fe9f443 = MODELLED Studien zur Mondbahn und -oberfläche als Navigations- und geodätische Infrastruktur, fünf Studien hinter einer Szenarioart, ausgewählt durch <c1/>: od-consistency (Bordbahnbestimmung mit Erd-GNSS in

# attr:alt
seg-e9deb6ed41c1 = Das Diagramm, das die Engine für scenarios/lunar-time-offset.toml schreibt, Art lunar-time-offset

# attr:alt
seg-edb738273a3a = Das Diagramm, das die Engine für scenarios/moonlight-service-volume.toml schreibt, Art moonlight-service-volume

# attr:alt
seg-f3a6d69d0225 = Das Diagramm, das die Engine für scenarios/lunar-frame-realisation.toml schreibt, Art lunar-frame-realisation

# text
seg-f964724ea446 = { "20" } Szenarioarten der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
seg-25455a33523c = Helmert-Bezugssystemdatum des Mondes mit sieben Parametern, angetrieben von einer ECHTEN, ARCHIVIERTEN Beobachtungskampagne statt von einer simulierten. Wo lunar-frame-campaign die eingespeiste Transformation entfernte, aber sein Stationsnetz, seinen Zeitplan und sein Sigma je Beobachtung weiterhin als ILLUSTRATIVE Eingaben angab, entnimmt diese Szenarioart alle drei der Messung: Die Epochen sind die Sendezeiten vom Boden archivierter Normalpunkte der ILRS Consolidated Laser Ranging Data, die Beobachtungen sind die tatsächlich auf die fünf Retroreflektor-Arrays auf dem Mond abgefeuerten Laserentfernungen, und jedes Beobachtungsgewicht ist die eigene archivierte Präzision bin_rms/sqrt(n_raw) dieses Normalpunkts, aus der Datei ausgelesen. Die Stationskoordinaten stammen aus der SLR-Lösung IERS ITRF2020 (mit ihren veröffentlichten Geschwindigkeiten auf die Epoche fortgeschrieben) und die Reflektorkoordinaten aus JPL DE430 Tabelle { "7" } in dem Mean-Earth/Mean-Rotation-Bezugssystem, das das Modell IAU { "2015" } WGCCRE realisiert. Entfernungspartielle werden zur gemeinsamen Fisher-Informationsmatrix der Reflektorkoordinaten akkumuliert und über denselben Helmert-Entwurf in die Datumskovarianz fortgepflanzt, diagnostiziert durch crate::fim::crlb. Rang, Defekt, Kondition, Spektrum, nicht beobachtbare Richtungen in der Basis mit sieben Parametern, die schwächste Richtung bei vollem Rang und der Anteil jedes Parameters daran werden bei jedem Lauf ausgegeben, und ein nicht beschränkter Parameter wird als NULL mit einem Status veröffentlicht. Die Korrelation zwischen den Arrays wird bei genau null GEMESSEN statt angenommen, weil eine Laserentfernung ein Array berührt. Ein Datensatz, den die Kataloge nicht platzieren können — eine Station ohne veröffentlichte ITRF-Position — wird ÜBERSPRUNGEN UND GEZÄHLT, nie mit einer ersatzweisen Koordinate versehen. WELCHE VERBINDUNGEN GEMESSEN UND WELCHE MODELLED SIND, IST DER BERICHT, KEINE FUSSNOTE: Die Ephemeride des Mondzentrums und die Orientierung des IAU-Körpers bleiben modelliert, und ihre gemeinsame Größe wird als Residuum der Einwegentfernung beobachtet minus berechnet über jeden verwendeten Punkt ausgegeben; Troposphäre, Festkörpergezeiten, Stationsexzentrizität, Polbewegung, UT1-UTC, relativistische Verzögerung und Stationsuhren fehlen und stecken in diesem Residuum. Weil ein Ephemeridenfehler eine Kovarianz nur über die Richtung jeder Sichtlinie erreicht, löst jeder Lauf außerdem das gesamte Datum mit allen um sensitivity_tilt_deg gekippten Partiellen (mit wechselndem Vorzeichen) erneut und gibt das Verhältnis aus, sodass die Unempfindlichkeit der Kovarianz gegenüber der modellierten Ephemeride eine Zahl ist statt eines Arguments. Die Zahlen der simulierten Kampagne werden AUSGEFÜHRT und neben den gemessenen ausgegeben, nicht übertragen. MODELLED: Die Zahlen mit sieben Parametern sind eine Cramér-Rao-Schranke für einen reduzierten Parametersatz auf einem realen Zeitplan — kein gelöstes Datum, keine LLR-Analyse und kein geodätisches Produkt. Der eingecheckte Ausschnitt realer Daten wird mit dem Repository ausgeliefert, aber nicht mit dem veröffentlichten Crate; richten Sie data_dir auf eine Kopie davon.

# text
seg-28c6a5644152 = Modellierte Analyse des lunaren Navigations-Service-Volumens aus einer ILLUSTRATIVEN Mondorbit-Konstellation der Moonlight/LCNS-Klasse aus öffentlichen Quellen (nicht mit der ESA verbunden): Sie überstreicht ein selenographisches Breiten-/Längengitter über einen Zeithorizont und gibt DOP / Abdeckung / Verfügbarkeit (≥{ "4" } Satelliten UND PDOP < Schwellwert) sowie eine verallgemeinerte lunare ARAIM-Schutzniveau-Hüllkurve (HPL/VPL) über das Volumen aus. Die DOP-Geometrie VERWENDET den gnss_lib_py-VALIDATED-Kern (crate::orbit::dop) wieder; das Schutzniveau VERWENDET die lunare ARAIM-Maschinerie LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) wieder und reduziert sich als Sonderfall auf das bestehende Südpol-Schutzniveau. Zusammensetzung der Stufe MODELLED: ein kreisförmiger/elliptischer Kepler-Relaissatz (nicht die reale differenzialkorrigierte LCNS/NRHO-Ephemeride), ein Mond mit mittlerer Rotation (keine Libration/kein präzedierender Pol). Deterministisch (reine Geometrie). Kein TRL, keine Flugerfahrung, keine Billigung durch eine Agentur.

# text
seg-5413116b8b42 = Modellierte Analyse des lunaren Navigations-Service-Volumens aus einer ILLUSTRATIVEN Mondorbit-Konstellation der Moonlight/LCNS-Klasse aus öffentlichen Quellen (nicht mit der ESA verbunden): Sie überstreicht ein selenographisches Breiten-/Längengitter über

# text
seg-8ac5ac006ae7 = Modelliertes lunares DIFFERENTIELLES PNT (ein lunares Analogon zu DGNSS/SBAS): Eine Referenzstation der Klasse NovaMoon an einem BEKANNTEN selenographischen Ort berechnet differentielle Korrekturen je Satellit aus einer ILLUSTRATIVEN Konstellation der Klasse Moonlight/LCNS aus öffentlichen Quellen (NovaMoon nur als Systemklasse genannt, ohne Verbindung zur ESA), und ein um baseline_km versetzter Nutzer wendet sie an, sodass sich die gleichtaktigen Bahn- + Uhrenfehler aufheben. Der Uhrenterm hebt sich EXAKT auf (eine algebraische Identität); der Bahnterm hinterlässt nur die Projektion der Sichtliniendifferenz, die für Basislinie → { "0" } gegen { "0" } geht (die Untergrenze der räumlichen Dekorrelation) und etwa linear mit der Basislinie wächst. Es werden der 3D-Positionsfehler des Nutzers MIT gegenüber OHNE Korrekturen, der Reduktionsfaktor, die Kurve Fehler gegen Basislinie und ein Schutzniveau des Nutzers ausgegeben, das die SBAS-Maschinerie nach DO-229E (crate::sbas) MIT dem differentiellen Restfehler σ WIEDERVERWENDET. MODELLED — exakte Aufhebungsidentität + Dekorrelationsmodell erster Ordnung; nicht mit realen Daten validiert; kein TRL/Flugerbe/keine Billigung durch eine Agentur. Deterministisch, wenn mit Seed erzeugt.

# text
seg-a0e202b3566c = Modelliertes lunares DIFFERENZIELLES PNT (ein lunares Analogon zu DGNSS/SBAS): Eine Referenzstation der NovaMoon-Klasse an einem BEKANNTEN selenographischen Ort berechnet Differenzialkorrekturen pro Satellit aus einem ILLUSTRATIVEN
