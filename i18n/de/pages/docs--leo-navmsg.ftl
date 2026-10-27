# docs--leo-navmsg: translations (de)

# text
seg-cc651d9cef3b = Code

# text
seg-cbf0f9bcd2d8 = Unabhängige Referenz

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-e305279d5b11 = Inhalt

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-4d208b6c0eb8 = Tag

# text
seg-a7d59ba6e225 = rad

# text
seg-02dc0d42fb21 = sfu

# text
# c1: docs/LEO-NAVMSG.md
seg-0f2d3faa9934 = Quelle: <c1/>

# text
# c1: leo-navmsg
seg-d8aaee95aa44 = Der Szenariotyp <c1/> baut die Rundsende-Nachricht aus Ephemeride und Uhr eines Satelliten für Positionierung, Navigation und Zeitgebung (PNT) im niedrigen Erdorbit (LEO) und beantwortet die Fragen, die sich ein Nachrichtenentwickler stellt: Wie lange kann eine Nachricht gelten, was bringt jeder zusätzliche Parameter, was sieht ein Nutzer, wenn sich die Nachricht mitten in einem Überflug ändert, und wie viele Bit braucht es, um sie auf den Zentimeter genau zu übertragen.

# text
seg-e61283b1e1a5 = Er ist systemunabhängig. Jede Bahn, jeder Träger und jedes der vier Ephemeridenmodelle laufen ganz ohne Voreinstellung; die benannten Voreinstellungen sind optionale Daten (siehe <a1>Voreinstellungen</a1>).

# text
# c1: kshana example <name>
# c2: kshana scenarios/<name>.toml
# c3: leo-navmsg-fit-interval-trade
# c4: leo-navmsg-model-comparison
# c5: leo-navmsg-midpass-update
# c6: leo-navmsg-encode-decode
# c7: leo-pnt-chain
# c8: leo-focus-data-services
seg-1271cd4ad822 = Ein mitgeliefertes Beispiel mit <c1/> ausgeben (ein Name je Aufruf) und mit <c2/> ausführen: <c3/>, <c4/>, <c5/> und <c6/>. Der Typ ist außerdem die Nachrichtenstufe des Typs <c7/> (<a1>LEO-PNT.md</a1>) und ein Mitglied der Kampagne <c8/>, die vier Nachrichtenkonfigurationen zusammensetzt und die Rahmenlänge jeder einzelnen berichtet ({ "146" }, { "154" }, { "159" } und { "171" } Bytes).

# text
# c1: src/leo_navmsg/
# c2: elements.rs
# c3: truth.rs
# c4: fit.rs
# c5: sisre.rs
# c6: services.rs
# c7: codec.rs
# c8: text.rs
# c9: presets/
# c10: mod.rs
seg-51da9ffaa0ec = Code: <c1/> — <c2/> (Datensätze und Nutzeralgorithmus), <c3/> (wahre Bahn und Uhr), <c4/> (Anpassung), <c5/> (Entfernungsfehler im Signal im Raum), <c6/> (Ionosphäre und koordinierte Weltzeit (UTC)), <c7/> (Binärformat), <c8/> (Exporte im Stil von Receiver Independent Exchange Format (RINEX) und als kommagetrennte Werte (CSV)), <c9/> (eine Datei je Voreinstellung), <c10/> (der Typ).

# text
seg-0505113a62e3 = Was eine Nachricht enthält

# text
seg-6752521002b2 = Teil

# text
seg-cf6ae60eea4f = Hilfsdaten

# text
seg-00eae74cb1e6 = Raumfahrzeugkennung (SVID), Datenausgabestand (IOD), Bandkennung, Signalzustand (Galileo-Konvention: { "0" } in Ordnung, { "1" } außer Betrieb, { "2" } erweiterter Betrieb, { "3" } im Test)

# text
seg-0bdbdd2c923b = Synchronisation

# text
# c1: af0 + af1·(t − toc) + af2·(t − toc)²
seg-8120237b02ea = Wochennummer, Wochenzeit (TOW) der Aussendung und ein Uhrenpolynom zweiter Ordnung <c1/>

# text
seg-b09dc4b322d3 = Ephemeride

# text
seg-bbb3225e1d19 = eines der vier folgenden Modelle

# text
seg-3a835a49b43f = Weitere Dienste

# text
# c1: ai0, ai1, ai2
# c2: A0, A1, ΔtLS, t0t, WNot, WNLSF, DN, ΔtLSF
seg-2a13461cb60c = ein rundgesendeter ionosphärischer Klobuchar-Satz, Galileo-NeQuick-G-Koeffizienten <c1/> mit fünf Sturmkennzeichen und Parameter von der Systemzeit zu UTC <c2/>

# text
seg-6b899ef63047 = Ephemeridenmodelle

# text
seg-60cd077d82a7 = Modell

# text
seg-2afa300864a9 = Parameter

# text
# c1: √A, e, i0, Ω0, ω, M0, Δn, Ω̇, i̇, Cuc, Cus, Crc, Crs, Cic, Cis, toe
seg-3e8a1cf183cc = der Kepler-Satz aus dem Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD): <c1/>

# text
# c1: a0…
# c2: c0…
# c3: r0…
# c4: τ = tk / tau_s
# c5: tau_s
# c6: rac_degrees
seg-b1416ba3472f = derselbe Satz, dazu Korrekturpolynome längs der Bahn, quer zur Bahn und radial (RAC) <c1/>, <c2/>, <c3/> in <c4/>, Koeffizienten in Metern, <c5/> die Zweierpotenz bei oder über der Hälfte des Anpassungsintervalls (übertragen), Grade festgelegt durch <c6/> (Standard { "7" }, { "5" }, { "6" })

# text
seg-9c0643152bbf = standardmäßig { "16" } + { "21" }, dazu die Zeitskala

# text
# c1: ȧ, ṅ, Crs3, Crc3, Crs1, Crc1
seg-e0afd541d64c = das 22-Parameter-Modell von Liu, Su, Xie, Zhou und Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): die { "16" } plus <c1/>

# text
# c1: τ = (t − t_ref) / 64 s
seg-a6042071a03f = das „Zero-Clock“-Modell ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations): ein erdzentriertes erdfestes (ECEF) Polynom je Achse in <c1/> (Standardgrad { "6" }), ohne Uhrenterme, weil die Satellitenuhr auf die Systemzeit gesteuert wird (<a1>InsideGNSS</a1>)

# text
seg-5869d6f65796 = standardmäßig { "22" }

# text
# c1: elements::sat_state
# c2: kepler-rac
# c3: F·e·√A·sin E
# c4: ecef-poly
# c5: −2 r·v / c²
seg-6663aa3eeebc = Der Nutzeralgorithmus (<c1/>) ist die Abfolge des Galileo-ICD (Kepler-Gleichung, Korrekturen zweiter Harmonischer, erdfester Knoten), gefolgt, für <c2/>, von den drei Polynomen im eigenen Bezugssystem der Kepler-Bahn: radial entlang der ausgewerteten Position, quer zur Bahn entlang der Bahnnormalen aus korrigierter Inklination und korrigiertem Knoten, längs der Bahn als Ergänzung zum Dreibein. Die Uhr fügt den relativistischen Term des ICD <c3/> hinzu; für <c4/> ist es die allgemeine Form <c5/> aus dem Polynom und seiner Ableitung.

# text
# c1: A = A0 + ȧ·tk
# c2: n = √(μ/A0³) + Δn + ṅ·tk
# c3: ½·ṅ·tk
# c4: ṅ
# c5: Crs1·sin Φ + Crc1·cos Φ + Crs3·sin 3Φ + Crc3·cos 3Φ
# c6: Φ
# c7: ṅ
# c8: ṅ
# c9: nDot
seg-b3935a85a7b2 = Die Terme nach Liu et al. folgen dem Nutzeralgorithmus der Veröffentlichung (Abschnitt { "2.2" }, Gl. 1-7): <c1/>, <c2/> (Versionen vor { "0.30" } verwendeten die Konvention der zivilen Navigation des Global Positioning System (GPS) <c3/>, sodass ein von ihnen geschriebenes <c4/> das Doppelte desjenigen der Veröffentlichung ist), und <c5/>, zum Radius addiert, <c6/> ist das unkorrigierte Breitenargument. Die Skalierungskonvention von <c7/> ist aus Gl. { "1" } der Veröffentlichung übernommen; der Vergleich mit der Veröffentlichung an realen Bahnen hängt nicht davon ab (ein Faktor ½ auf <c8/> lässt jede angepasste Zahl unverändert), sodass die Bedeutung eines übertragenen <c9/>-Wertes dort nicht validiert ist.

# text
seg-9a83292bffcf = Zwei Auslegungen stammen von Kshana selbst und sind als solche angegeben:

# text
# c1: τ = tk / tau_s
seg-0e42fd0d5cf9 = Das RAC-Bezugssystem und die Normierung <c1/>. Kein öffentliches Dokument definiert ein LEO-Korrekturbezugssystem für eine Rundsende-Nachricht.

# text
seg-1b8aaed09de8 = Die Uhr einer Zero-Clock-Nachricht ist insgesamt null: Es wird angenommen, dass die Steuerschleife die scheinbare Uhr, einschließlich des relativistischen Terms, auf der Systemzeit hält.

# text
seg-3472ce139588 = Die Anpassung

# text
# c1: truth.rs
# c2: θ(t) = θ0 + Ω̇e·t
# c3: gravity_degree = 0
seg-4404a677d185 = <c1/> integriert die Bahn mit einem Runge-Kutta vierter Ordnung fester Schrittweite in einem Bezugssystem, das durch eine einzige Drehung in erdfeste Achsen übergeht, <c2/>, dieselbe einzelne Drehung, die ein Rundsende-Nutzeralgorithmus anwendet. Die Gravitation ist Zweikörper (<c3/>), die zonalen Harmonischen J2 bis J6 ({ "2" } bis { "6" }) oder das Feld des Earth Gravitational Model { "2008" } (EGM2008) bis Grad und Ordnung { "7" } bis { "70" }, dessen tesserale Terme die kurzperiodische Signatur tragen, die eine LEO-Anpassung schwer macht. Der Luftwiderstand ist optional (statische exponentielle Dichte). Die Uhr ist freilaufend (Versatz, Drift, Driftrate und weißes Frequenzrauschen bei einer angegebenen Allan-Abweichung von einer Sekunde, dazu der periodische relativistische Term) oder gesteuert (ein Gauß-Markov-Rest erster Ordnung).

# text
# c1: fit.rs
# c2: e·cos ω
# c3: e·sin ω
# c4: λ0 = M0 + ω
# c5: ω
# c6: M0
# c7: toe
# c8: liu22
seg-ae3052e66b2a = <c1/> passt den Kepler-Satz mit Levenberg–Marquardt an nichtsinguläre Elemente an (<c2/>, <c3/>, <c4/>): Eine LEO-Bahn ist nahezu kreisförmig, sodass <c5/> und <c6/> allein kaum zu unterscheiden sind. Sie beginnt beim oskulierenden Zustand bei <c7/> mit der J2-Knotenrate. Schwache, auf null zentrierte A-priori-Werte begrenzen die Raten und Harmonischen, die ein kurzer Bogen nicht auflösen kann; mit einem Beobachtungsgewicht von { "1" } cm wirken sie nur in diesen Nullrichtungen. Die Anpassung <c8/> übernimmt stattdessen Start und Schätzer aus Abschnitt { "2.3" } der Veröffentlichung: Sie beginnt mit allen Korrekturtermen null, hat keine A-priori-Werte (einfache Methode der kleinsten Quadrate) und behält die Obergrenze von 100 Iterationen der Veröffentlichung. Sie endet nach Kshanas eigener Regel zur Parameterkonvergenz, wenn jeder Parameterschritt unter { "1e-3" } seiner formalen Standardabweichung liegt; die Veröffentlichung endet stattdessen, wenn sich der RMS um weniger als { "0.1" } mm ändert. Die RAC-Polynome werden dann durch lineare Methode der kleinsten Quadrate an die Residuen längs/quer/radial angepasst, und das Uhrenpolynom an die wahre Uhr abzüglich des relativistischen Terms, den der Nutzer wieder hinzufügt.

# text
# c1: src/celeste_iod.rs
# c2: toe
# c3: toc
seg-020f45edcae1 = Ein Befund, den die Standardwerte abbilden: Nach einer Kepler-Anpassung nach der Methode der kleinsten Quadrate ist das Residuum konstruktionsbedingt das, was die { "16" } Parameter nicht abdecken können; es schwingt daher über das Fenster (mehrere Nulldurchgänge in jeder Komponente), statt zu driften. Ein Korrekturpolynom beseitigt es nur, wenn sein Grad höher ist als das, was der Kepler-Satz bereits abdeckt: Längs der Bahn { "7" }, quer zur Bahn { "5" } und radial { "6" } bringen ein 15-Minuten-Residuum von Zentimetern auf etwa einen Millimeter, während niedrigere Grade quer zur Bahn fast nichts beseitigen (das Residuum quer zur Bahn ist ungerade um die Fenstermitte). Ein System, das seinen Kepler-Anteil auf andere Weise ableitet, hinterlässt ein Residuum anderer Form, und die Grade, die es braucht, ergeben sich daraus. Die eigenen Korrekturgrade der Voreinstellung Celeste (niedriger als diese; sie stehen nur in der Voreinstellungsdatei <c1/>) laufen hier auf Kshanas Basis nach der Methode der kleinsten Quadrate, weshalb ihre Terme quer zur Bahn in dieser Engine wenig beitragen: eine Aussage über Kshanas Anpassung, nicht über irgendein reales System. <c2/> und <c3/> sind ganze Sekunden, so wie das Binärformat sie trägt.

# text
seg-f3538e6651fa = Jede Nachricht wird über einen Zeitraum verwendet, der in ihrem Anpassungsfenster zentriert ist (die erste Abwägungstabelle verwendet das ganze Fenster). Die Zahlen zum Entfernungsfehler im Signal im Raum (SISRE) messen den <b>Darstellungsfehler</b> der Nachricht gegenüber der Wahrheit, an die sie angepasst wurde, als quadratischen Mittelwert (RMS) und als Maximum über die Spanne. Der Fehler von Bahnbestimmung und Bahnvorhersage, den ein reales Boden- oder Bordsegment zusätzlich hinzufügt, ist nicht modelliert.

# text
seg-c2b181269367 = Entfernungsfehler im Signal im Raum

# text
# c1: sisre.rs
seg-63462a1abc95 = <c1/> verwendet den global gemittelten SISRE von Montenbruck, Steigenberger und Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

# text
# c1: cos² η
# c2: ½ sin² η
# c3: η
seg-c4f654264c42 = Die Gewichte sind die Mittelwerte über Nutzer, die gleichmäßig auf der sichtbaren Erdkappe verteilt sind, von <c1/> und <c2/>, wobei <c3/> der Nadirwinkel der Sichtlinie am Satelliten ist, berechnet für den eigenen Radius und die eigene Elevationsmaske der Bahn. Bei einer Maske von { "0" }° reproduziert die Berechnung die Tabelle der Veröffentlichung für die mittlere Erdumlaufbahn (GPS { "0.98" } und 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) und die geostationäre Bahn ({ "0.99" } und 1/126): Das ist die <b>VALIDATED</b>-Prüfung. Im LEO ergibt derselbe Mittelwert

# text
seg-66b488889b10 = Höhe

# text
seg-c07128592d7b = Nadirwinkel am Horizont

# text
seg-a4e04d9a23a5 = { "320" } km

# text
seg-002adc24471f = { "510" } km

# text
seg-fe2f70c29806 = { "550" } km

# text
seg-4dee38ff0811 = { "786" } km

# text
seg-cfc3c6939861 = { "1080" } km

# text
seg-102de0413553 = { "1336" } km

# text
seg-1b11819c8b2f = sodass ein LEO-Nutzer, der den Satelliten weit vom Nadir entfernt sieht, Fehler längs und quer zur Bahn viel stärker spürt als ein Nutzer in mittlerer Umlaufbahn.

# text
seg-b7a844ab6135 = Analysen

# text
# c1: analysis = [...]
seg-17111fe25e04 = <c1/> wählt beliebige der vier aus (Standard: alle).

# text
seg-d0c1b335af73 = Abwägung des Anpassungsintervalls

# text
# c1: [trade]
# c2: scenarios/leo-navmsg-fit-interval-trade.toml
seg-f65e99c0d8b2 = <c1/> legt die Spanne, die Anpassungsintervalle, die Aktualisierungsperioden und die Modelle fest. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 bis Grad { "20" } und Luftwiderstand, { "30" } Minuten Nachrichten) ergibt, bei einer Nutzungsdauer gleich dem Anpassungsintervall:

# text
seg-f1a94c795c18 = Anpassungsintervall

# text
seg-c6b034712788 = SISRE Bahn RMS

# text
seg-55c287c93940 = SISRE Bahn Maximum

# text
seg-ad604a608329 = SISRE mit Uhr RMS

# text
seg-28723ab60ae0 = radial / längs / quer RMS

# text
seg-911a62245e80 = { "60" } s

# text
seg-1a35a89c1a34 = { "0.041" } cm

# text
seg-7cf9e6e3178f = { "0.179" } cm

# text
seg-d8a7f4c080dd = { "0.069" } cm

# text
seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

# text
seg-64015edf42d8 = { "120" } s

# text
seg-a1070c338686 = { "0.032" } cm

# text
seg-cdacf90f8ce8 = { "0.160" } cm

# text
seg-29aeee696ad2 = { "0.079" } cm

# text
seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

# text
seg-8fa4e4ccc5cc = { "180" } s

# text
seg-13182ae6d536 = { "0.093" } cm

# text
seg-fc692062aaa8 = { "0.540" } cm

# text
seg-9ef760f0777c = { "0.134" } cm

# text
seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

# text
seg-bbd4f2685bee = { "300" } s

# text
seg-93410318239b = { "0.310" } cm

# text
seg-4af8f1c977eb = { "1.033" } cm

# text
seg-0921a535896a = { "0.329" } cm

# text
seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

# text
seg-8de43db30454 = { "450" } s

# text
seg-ec7f9ca7654b = { "1.690" } cm

# text
seg-1ad55674fab9 = { "7.542" } cm

# text
seg-a022913c956d = { "1.696" } cm

# text
seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

# text
seg-21b0c99fbda4 = { "600" } s

# text
seg-6840aea9ff12 = { "2.875" } cm

# text
seg-798c8c1d0190 = { "10.219" } cm

# text
seg-6b3b442069d8 = { "2.866" } cm

# text
seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

# text
seg-4dabf1faddfc = { "900" } s

# text
seg-d733d3fdac02 = { "9.345" } cm

# text
seg-3334d120521b = { "34.032" } cm

# text
seg-4d4a2cc180d0 = { "9.349" } cm

# text
seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

# text
seg-f1d733b03f45 = { "0.000" } cm

# text
seg-81a60d921ce9 = { "0.057" } cm

# text
seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

# text
seg-c8a720a6f160 = { "0.074" } cm

# text
seg-b13f5539e4b1 = { "0.001" } cm

# text
seg-1c9d3ee30ac7 = { "0.090" } cm

# text
seg-7dd08c671dc7 = { "0.004" } cm

# text
seg-740e69fcd85e = { "0.014" } cm

# text
seg-c0db4312d8a0 = { "0.106" } cm

# text
seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

# text
seg-f3bda174cbef = { "0.037" } cm

# text
seg-5a5bb868e8ff = { "0.176" } cm

# text
seg-02b99fcb9fee = { "0.127" } cm

# text
seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

# text
seg-ec1e77bc5be9 = { "0.214" } cm

# text
seg-d3c1ed834802 = { "0.643" } cm

# text
seg-23482e7c028f = { "0.229" } cm

# text
seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

# text
seg-bfec9407ffae = { "1.015" } cm

# text
seg-f295ad6efcf4 = { "3.695" } cm

# text
seg-2cd92d16edfc = { "1.062" } cm

# text
seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

# text
seg-4e19f776d1b7 = Und bei einer Anpassung von { "300" } s, wobei variiert wird, wie oft eine neue Nachricht übernimmt:

# text
seg-89810ffbeff3 = Aktualisierungsperiode

# text
seg-d4d1fa05e1a8 = { "0.314" } cm

# text
seg-828b7488993b = { "0.850" } cm

# text
seg-edb934c1419f = { "0.288" } cm

# text
seg-52c8f821a7d2 = { "0.859" } cm

# text
seg-e135107af135 = { "150" } s

# text
seg-e7ce46d74f3e = { "0.219" } cm

# text
seg-3391df1cf909 = { "0.830" } cm

# text
seg-d6eb4f554461 = { "0.009" } cm

# text
seg-22c68874002b = { "0.010" } cm

# text
seg-2172d9ea618e = Der 16-Parameter-Kepler-Satz verschlechtert sich von { "0.04" } cm bei { "60" } s auf { "9.35" } cm bei { "900" } s: Ein Kepler-Satz mit Harmonischen zweimal je Umlauf kann den höherfrequenten Gravitationstermen und dem Luftwiderstand eines LEO-Bogens nicht länger als wenige Minuten folgen, und sein Residuum nach der Methode der kleinsten Quadrate schwingt über das Fenster. Die Polynome längs/quer/radial (Grade { "7" }, { "5" }, { "6" }) nehmen auf, was übrig bleibt: { "1.01" } cm bei { "900" } s, { "0.21" } cm bei { "600" } s. Bei den kürzesten Intervallen liegen die Kepler-Zahlen im Submillimeterbereich und sind nicht mehr streng geordnet (die Anpassung ist dann durch die Konditionierung begrenzt, nicht durch das Modell).

# text
seg-aca262796570 = Modellvergleich

# text
# c1: scenarios/leo-navmsg-model-comparison.toml
seg-fdf2368d0210 = <c1/> lässt die vier Modelle bei { "1" }, { "5" } und { "10" } Minuten auf derselben Bahn laufen, mit der Zahl der Parameter und den Bits für Ephemeride und Uhr in Kshanas Kodierung:

# text
seg-7d3c6c43390d = Bits für Ephemeride + Uhr

# text
seg-f7f60c66d89e = { "0.022" } cm

# text
seg-f7bcb8a44fde = { "0.049" } cm

# text
seg-2972b631701e = { "0.230" } cm

# text
seg-cc42e8dc7238 = { "0.260" } cm

# text
seg-67e50069c6f7 = { "3.061" } cm

# text
seg-780954ab9d7f = { "3.071" } cm

# text
seg-de81d6550264 = { "0.044" } cm

# text
seg-fb171bf75f27 = { "0.005" } cm

# text
seg-c8c067631f7a = { "0.120" } cm

# text
seg-2dc41855c245 = { "0.208" } cm

# text
seg-6ef79938dd22 = { "0.046" } cm

# text
seg-7e96d7e34e63 = { "0.142" } cm

# text
seg-c43199891163 = { "0.258" } cm

# text
seg-f9a9fdebc114 = { "0.290" } cm

# text
# c1: ecef-poly
seg-f157ff5b40b1 = <c1/> (Zero-Clock)

# text
seg-9474a775dc5e = { "28.784" } cm

# text
seg-5098c8b6f813 = { "0.561" } cm

# text
seg-5e7fdc441b03 = { "28.774" } cm

# text
seg-82d3fa2e27ef = Die Zeile mit Zero-Clock wird gegen eine Uhr bewertet, die mit einem Residuum von { "0.24" } m gesteuert wird (die ATOMIC-Zahl), die anderen gegen die freilaufende Uhr, die sie anpassen.

# text
seg-769db176020f = <b>Liu et al. { "2025" }, SISRE gegenüber der Höhe (MODELLED).</b> Dasselbe Szenario passt Kshanas 22-Parameter-Modell über 20-Minuten-Bögen in den fünf Höhen der Veröffentlichung an, jeweils bei der Inklination des Satelliten:

# text
seg-01e587427a7e = Satellit

# text
seg-f6bbd3d5d75c = Inklination

# text
seg-c54d0bd7d498 = Liu et al. { "2025" }

# text
seg-16c489b75f44 = Kshana (nur Bahn, RMS)

# text
seg-ee4816ca13c1 = Verhältnis

# text
seg-510349500d23 = { "8.88" } cm

# text
seg-a97bde451ec2 = { "4.25" } cm

# text
seg-b6c1d48847d9 = { "475" } km

# text
seg-f79249e9bd75 = { "6.21" } cm

# text
seg-9b6757a674a5 = { "2.87" } cm

# text
seg-62008169ca69 = { "2.20" } cm

# text
seg-06a4bcde0ea3 = { "966" } km

# text
seg-9e5e06ec23c3 = { "2.11" } cm

# text
seg-41ce80bc0b62 = { "1.25" } cm

# text
seg-c9f63cd8bd07 = { "0.75" } cm

# text
seg-f11a960a1d52 = { "0.51" } cm

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-0376cf5f98f0 = Das ist <b>keine</b> Validierung. Die Veröffentlichung hat reale präzise wissenschaftliche Bahnen der genannten Satelliten angepasst (mit ihrer vollen Gravitations-, Luftwiderstands- und nichtgravitativen Vorgeschichte); Kshana passt seine eigene integrierte Bahn an, wertet die sechs hinzugefügten Parameter wie oben beschrieben aus und verwendet seine eigenen SISRE-Gewichte. Der Vergleich zeigt den Trend und die Größenordnung. Der Vergleich an denselben realen Bahnen, die die Veröffentlichung angepasst hat, ist <c1/> (seit { "0.30" } stimmt die 22-Parameter-Anpassung dort innerhalb des vorab festgelegten Faktors { "1.5" } überein, an den Tagen der Veröffentlichung und an acht zurückgehaltenen Tagen).

# text
seg-d82887c766e3 = Aktualisierung mitten im Überflug

# text
# c1: [midpass]
# c2: search_s
# c3: update_period_s
# c4: threshold_m
# c5: scenarios/leo-navmsg-midpass-update.toml
seg-d1104b6ea7fa = <c1/> platziert einen Nutzer (Standard { "45" }° N, { "10" }° O), findet den höchsten Überflug über der Maske innerhalb von <c2/> und plant Nachrichten alle <c3/>. Bei jedem Wechsel innerhalb des Überflugs berichtet es den Positionssprung, den Uhrensprung, den Pseudoentfernungssprung des Nutzers (neue Nachricht minus alte), den größten Sprung, den ein sichtbarer Nutzer sehen könnte (geschlossene Form über den Nadirkegel), den Entfernungsfehler davor und danach sowie PASS oder FAIL gegen <c4/>. <c5/> ({ "300" }-s-Anpassungen, alle { "150" } s aktualisiert):

# text
seg-7d91304c87e3 = Der höchste Überflug eines Tages erreicht { "43.7" }° und dauert { "455" } s. Seine Wechsel:

# text
seg-289e8da49cc8 = Wechsel

# text
seg-e80d12ee2259 = Elevation

# text
seg-b16789d14338 = Positionssprung

# text
seg-b3c252609532 = Uhrensprung

# text
seg-8239a390ec71 = Entfernungssprung des Nutzers

# text
seg-4153faf7969d = Sprung bei ungünstigster Geometrie

# text
seg-14402c7fb332 = IOD { "270" } → { "271" }

# text
seg-7862a97ac55f = { "0.07" } mm

# text
seg-4cfe934c881f = { "0.19" } mm

# text
seg-9e9752920165 = -0.17 mm

# text
seg-4267557786be = { "0.27" } mm

# text
seg-46872e8925b2 = IOD { "271" } → { "272" }

# text
seg-4c803fd2ccc9 = { "0.14" } mm

# text
seg-cc9a8388f6bc = -0.24 mm

# text
seg-0549f7fd0633 = IOD { "272" } → { "273" }

# text
seg-ad1afcf9a466 = -0.22 mm

# text
seg-c1b30171b4f0 = { "0.35" } mm

# text
seg-f93647402fa9 = { "0.48" } mm

# text
seg-69b35182807c = Größter Entfernungssprung des Nutzers { "0.35" } mm gegen eine Schwelle von { "5" } cm: <b>PASS</b>.

# text
seg-96dcb456600d = Kodieren und Dekodieren

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
seg-1b3674a0e041 = <c1/> kodiert die erste von drei Nachrichten, dekodiert sie, prüft die CRC und weist eine beschädigte Kopie zurück, gibt das Quantisierungsbudget aus und schreibt und liest den Block im RINEX-Stil sowie die CSV-Tabelle zurück:

# text
# c1: 0x19105F
seg-480eb9ffc333 = Rahmen: { "171" } Bytes ({ "1310" } Nutzdatenbits, davon { "1045" } für Ephemeride und Uhr), 24-Bit-Prüfsumme (zyklische Redundanzprüfung, CRC-24Q) <c1/>;

# text
# c1: af0
seg-0e2a64a063fd = größte Halbschrittwirkung eines einzelnen Feldes: <c1/>, { "0.545" } mm;

# text
seg-a1875f7088b0 = ganze Nachricht nach der Quantisierung: Position innerhalb von { "1.126" } mm und Uhr innerhalb von { "0.185" } mm der exakten Nachricht; SISRE { "0.113" } cm exakt, { "0.129" } cm dekodiert;

# text
seg-6e818708b695 = ein Rahmen mit einem gekippten Bit wird zurückgewiesen: true;

# text
seg-31fe0f6b133d = Hin-und-zurück-Lauf im RINEX-Stil innerhalb von { "5.0e-06" } m, Hin-und-zurück-Lauf der CSV innerhalb von { "0.0e+00" } m.

# text
seg-405cf34090cc = Plattformunabhängigkeit

# text
# c1: libm
# c2: src/portable_math.rs
# c3: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c4: leo-navmsg
seg-7f2193f6ff06 = Ein Rahmen besteht aus übertragenen ganzen Zahlen, also müssen es dieselben ganzen Zahlen sein, wo und wie auch immer das Szenario läuft: das native Binärprogramm auf jedem Betriebssystem, ein Debug- oder ein Release-Build und der WebAssembly-Build (WASM) in einem Browser. Drei Dinge standen im Weg. Sinus, Kosinus, Arkustangens und Exponentialfunktion der Mathematikbibliothek eines Rechners müssen nicht korrekt gerundet sein und unterscheiden sich zwischen Rechnern in der letzten Stelle. Ein optimierter Build auf macOS nimmt Sinus und Kosinus eines Arguments aus der kombinierten Routine des Systems, die nicht immer den Wert des einzelnen Sinus liefert, sodass sich auch ein Debug- und ein Release-Build unterschieden. Und der übliche Normalverteilungs-Sampler ruft in seinen seltenen Zweigen die Exponential- und Logarithmusfunktion des Rechners auf. Die Anpassung macht aus einem so kleinen Unterschied andere quantisierte Felder. Der gesamte Typ (wahre Bahn und Uhr, Anpassung, Nutzeralgorithmus, Entfernungsfehler im Signal im Raum (SISRE), Codec) berechnet daher jede solche Funktion mit der reinen Rust-Bibliothek <c1/> über <c2/>, ganzzahlige Potenzen als ausdrückliche Produkte und normalverteilte Abweichungen nach dem Polarverfahren aus der Rohausgabe des Generators. <c3/> legt den 171-Byte-Rahmen des unten stehenden Szenarios zum Kodieren und Dekodieren fest, dazu einen Prüfwert je Ephemeridenmodell; ein Debug-Build, ein Release-Build und der WASM-Build liefern für alle fünf mitgelieferten <c4/>-Szenarien byteidentische Ergebnisdokumente.

# text
seg-1ef00467df17 = Binärformat

# text
seg-af2dae9e9e7c = <b>Dies ist Kshanas eigene dokumentierte Kodierung.</b> Sie trägt die Komponenten, die die veröffentlichten Beschreibungen von LEO-Navigationsnachrichten nennen, nach dem Vorbild des Galileo-ICD-Feldsatzes. Sie ist <b>nicht</b> das Bitlayout von Celeste oder eines anderen Systems: keines ist öffentlich.

# text
# c1: 0xA7
# c2: kepler16
# c3: kepler-rac
# c4: liu22
# c5: ecef-poly
# c6: 0x1864CFB
# c7: 0xCDE703
# c8: 123456789
seg-6a730c01ad1c = Rahmen: Präambel <c1/> ({ "8" } Bits), Version { "1" } ({ "4" }), Modell ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), Nutzdatenlänge in Bytes ({ "12" }), auf ein Byte mit Nullen aufgefüllte Nutzdaten, CRC-24Q (eine 24-Bit-zyklische Redundanzprüfung, { "24" } Bits) über jedes vorangehende Byte. CRC-24Q ist die Prüfung des Standards RTCM { "10403" } der Radio Technical Commission for Maritime Services und des Galileo-ICD (Polynom <c6/>, Anfangswert { "0" }); der Code reproduziert den Katalog-Prüfwert <c7/> für <c8/> und die Prüfbytes des Beispielrahmens RTCM { "10403" } Nachrichtentyp { "1005" } (<b>VALIDATED</b>).

# text
# c1: Crs
# c2: Cuc
# c3: af0
seg-a31d899eb435 = Die Schritte des Galileo-ICD wurden für die mittlere Erdumlaufbahn gewählt und sind für eine LEO-Nachricht im Zentimeterbereich zu grob: <c1/> in Schritten von { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm beim LEO-Radius), die Winkel { "2" }⁻³¹ Halbkreise ({ "1.0" } cm) und <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana behält die Einheiten des ICD und die Halbkreiskonvention bei, verfeinert die Schritte so, dass der Halbschrittfehler jedes Feldes über ein 15-Minuten-Fenster unter { "1" } mm Position oder Entfernung bleibt, und erweitert die Felder, um die Bereiche zu halten, die eine LEO-Anpassung braucht:

# text
seg-caddc6f5b9a7 = Block

# text
seg-b548b723c201 = Bits

# text
seg-d00b65801e9b = Schritt

# text
seg-2085d172bec3 = Hilfsdaten und Synchronisation

# text
seg-7e9018f82811 = Woche

# text
seg-45cbfedb6f0e = Uhr (Kennzeichenbit { "0" })

# text
seg-05d274f5ce99 = s/s^{ "2" }

# text
seg-9d6d5136e12a = Kepler (Modelle 1-3)

# text
seg-3fb59c8238cb = Halbkreis

# text
seg-d173e8d7026c = m^{ "0.5" }

# text
seg-48c8bfb6e914 = Korrekturen längs/quer/radial (Modell { "2" })

# text
seg-131652f53721 = Zusätze nach Liu et al. { "2025" } (Modell { "3" })

# text
seg-fccf37a24fc4 = semicircle/s^{ "2" }

# text
seg-ebde561c17ab = ECEF-Polynom (Modell { "4" })

# text
seg-822c7482547c = Klobuchar (Kennzeichenbit { "1" })

# text
seg-7dd6e8bcaf43 = s/semicircle^{ "2" }

# text
seg-09408b08c481 = s/semicircle^{ "3" }

# text
seg-734162101b2d = NeQuick-G (Kennzeichenbit { "2" })

# text
seg-ddbb363f4593 = sfu/deg^{ "2" }

# text
seg-e2744b31e5d3 = UTC (Kennzeichenbit { "3" })

# text
# c1: deltaN
# c2: OmegaDot
# c3: aDot
# c4: nDot
# c5: nDot
# c6: kepler-rac
# c7: quantisation_budget
seg-545755e7b26f = Ein Wert außerhalb des Bereichs seines Feldes wird zurückgewiesen, nicht umgebrochen. Die Bereiche wurden durch Kodieren von Anpassungen bei { "300" } bis { "2000" } km, Inklinationen von { "0" }° bis { "140" }° und Anpassungsintervallen bis { "20" } Minuten geprüft: <c1/> und <c2/> sind breit, weil auf einer nahezu äquatorialen Bahn der Knoten schlecht definiert ist und die Anpassung die J2-Drift des Breitenarguments zwischen ihnen aufteilt, und <c3/> und <c4/>, weil die 22-Parameter-Anpassung über { "20" } Minuten einen Teil der kurzperiodischen Schwingung der großen Halbachse aufnimmt. Seit { "0.30" } ist die 22-Parameter-Anpassung die einfache Methode der kleinsten Quadrate der Veröffentlichung ohne A-priori-Werte, und eine äquatoriale Anpassung bei { "800" } km braucht dann <c5/> von etwa { "6.3e-10" } Halbkreis/s^{ "2" }, sodass ihre Skala von { "2" }^-60 auf { "2" }^-58 ging. Die Längs-Korrekturen vom Grad 7 von <c6/> passen in den 22-Bit-Koeffizientenbereich bis { "15" } Minuten; eine längere Anpassung kann ihn überschreiten und wird dann zurückgewiesen. <c7/> berichtet für jedes Ephemeriden- und Uhrenfeld die größte Positions- und Entfernungsänderung, die eine Halbschrittänderung über die Nutzungsdauer bewirkt, sowie die Änderung der ganzen Nachricht nach der Quantisierung.

# text
seg-1ad17f3d3643 = Textexporte

# text
# c1: text.rs
# c2: > EPH
# c3: D19.12
# c4: L
# c5: KP16
# c6: KRAC
# c7: LU22
# c8: APOL
seg-81fb376aa1e1 = <b>RINEX { "4.02" } definiert keine LEO-Navigationsdatensätze</b> (seine Systembuchstaben sind G, R, E, J, C, I und S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Der Block, den <c1/> schreibt, entlehnt die Form von RINEX { "4" } — einen Datensatzkopf <c2/>, eine Zeile zu Satellit und Epoche mit drei Uhrentermen, Zeilen der Rundsende-Bahn mit je vier <c3/>-Feldern — und ist eine <b>dokumentierte Kshana-Erweiterung</b>: Systembuchstabe <c4/>, Datensatztypen <c5/>, <c6/>, <c7/>, <c8/> und drei Kopfkommentare, die das sagen. Vorarbeiten zu LEO-Bahnen in Navigationsdatensätzen im Stil von RINEX 4: <a2>arXiv { "2401.17767" }</a2>.

# text
# c1: kepler16
# c2: kepler-rac
# c3: SVID, IOD, Band, WeekNumber, ToW, Health, toc, af0, af1, af2, toe, M0, sqrtA, e, deltaN, Omega0, OmegaDot, iDot, i0, omega, Crc, Crs, Cic, Cis, Cuc, Cus, a0…, c0…, r0…, racTau
# c4: csv_schema
seg-9a3016441bce = Die CSV-Tabelle trägt Nachrichten der Modelle <c1/> und <c2/>, eine je Zeile. Die Standardspalten verwenden die Namen des Galileo-ICD (<c3/>); <c4/> wählt stattdessen die Schreibweise einer Voreinstellung. Beide Formate lassen sich zurücklesen.

# text
seg-4a26902d2771 = Ionosphäre und UTC

# text
# c1: gnss_sim::klobuchar_delay_m
# c2: (f_L1 / f)²
seg-c4d4dd2bac45 = <b>Klobuchar</b>: das L1-Modell der Engine (<c1/>, gegen RTKLIB geprüft), durch das Gesetz erster Ordnung <c2/> auf den Träger skaliert.

# text
# c1: effective_ionisation_level
# c2: Az = ai0 + ai1·μ + ai2·μ²
# c3: μ
# c4: Az
seg-0d3973f04ee5 = <b>NeQuick-G</b>: Die Koeffizienten reisen in der Nachricht, und <c1/> liefert <c2/> für eine modifizierte Neigungsbreite <c3/>, mit den Regeln des Algorithmus (Koeffizienten, die alle null sind, ergeben { "63.7" } Solarflusseinheiten, sfu; das Ergebnis wird auf [{ "0" }, { "400" }] sfu begrenzt). Das NeQuick-Elektronendichtemodell und seine Schrägintegration, die <c4/> in eine Verzögerung umsetzen, sind <b>nicht</b> implementiert.

# text
seg-66dbd447dfeb = Ein Satellit in wenigen hundert Kilometern Höhe fliegt innerhalb der Ionosphäre. Keines der beiden Rundsende-Modelle berücksichtigt den Elektronengehalt oberhalb des Satelliten, und es wird keine Korrektur dafür angewendet.

# text
# c1: system_to_utc
seg-7befd59b2ac6 = <b>UTC</b>: <c1/> wendet die drei Fälle des Galileo-ICD §{ "5.1.7" } an (vor, innerhalb von sechs Stunden um und nach einem Schaltsekundenereignis); eine eingefügte Sekunde liest { "86400" }.

# text
seg-2b0d77219437 = Voreinstellungen

# text
# c1: src/leo_navmsg/presets/
seg-d2908020db08 = Voreinstellungen sind Daten, je eine Datei unter <c1/>, mit ihren Quellen. Die Engine und jedes mitgelieferte Szenario außer dem von Celeste laufen ohne sie.

# text
seg-c353e7bec219 = Schlüssel

# text
seg-5566e1d71a4f = Bahn

# text
seg-33f4c7af9c53 = Träger

# text
seg-f4510e898031 = Nachrichtenmodell

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-890aa92157e4 = { "1080" } km, { "53" }°

# text
seg-1eca13ba2309 = X1 { "1593.3225" } MHz

# text
seg-ee9947222a30 = nicht veröffentlicht

# text
seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

# text
seg-f016786d7755 = { "520" } km, { "97" }°

# text
seg-780e931bf88d = PUBLIC, <a1>RNTF-Bericht</a1>, Beschreibung der Konstellation

# text
seg-d5df094a5f89 = { "781" } km, { "86.4" }°

# text
seg-94bc78cee128 = { "1621" } MHz (Band { "1616" }–{ "1626" } MHz)

# text
seg-3f5de7f74502 = nichts rundgesendet

# text
seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, Beschreibung der Konstellation

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-2ef501f97eff = Ku-Band, Wert aus der Bandmitte (repräsentativ)

# text
seg-567fab40bd24 = keines (Gelegenheitssignale)

# text
seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

# text
seg-f5dd5086eedd = { "700" } km, { "55" }°

# text
seg-5fa6b60f66b4 = nahe B1 (in der Quelle maskiert; L1 als Ersatz)

# text
seg-5ebbf0042d7c = REPRESENTATIVE

# text
seg-4f3e5a683682 = { "600" } km, { "97.8" }°

# text
seg-c06f62ca5173 = { "5020" } MHz (RNSS-C-Band-Mitte)

# text
seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

# text
seg-3b1fd041f9ba = { "500" } km (repräsentativ)

# text
seg-522c85402d84 = L1 (repräsentativ)

# text
# c1: ecef-poly
seg-064b03765e4d = <c1/>, Grad { "6" }, { "60" } s, alle { "30" } s aufgefrischt, Zero-Clock, { "0.24" } m Steuerresiduum

# text
seg-5619bc61b958 = WORKSHOP und PUBLIC

# text
seg-20572d7e348d = { "510" } km, { "97.4" }°

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
# c1: kepler-rac
seg-fad0950a2d67 = <c1/>, Grade und Datensatzabstand in der Voreinstellungsdatei

# text
seg-e881ffc4e14b = RNSS ist der Funknavigationssatellitendienst; RNTF die Resilient Navigation and Timing Foundation.

# text
# c1: navmsg
# c2: src/celeste_iod.rs
# c3: scenarios/leo-navmsg-celeste-iod.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-e9524c71636d = <b>Celeste IOD.</b> Die Voreinstellung für die Celeste-Demonstration im Orbit (IOD) der Europäischen Weltraumorganisation (ESA) ist die einzige, die Material verwendet, das auf dem LEO-PNT-Workshop des ESA-Programms Navigation Innovation and Support Programme (NAVISP), { "2026" }, vorgestellt wurde: die Nachrichtenstruktur (Galileo-Kepler-Satz plus Korrekturpolynome längs/quer/radial, Uhrenpolynom, SVID, Zustand, IOD, ionosphärische und UTC-Parameter), der Datensatzabstand und die CSV-Spaltennamen. Die Bahn ({ "510" } km, nahezu polar sonnensynchron) und der Träger stammen aus öffentlichen Quellen, die in der Datei genannt sind. Das Celeste-Bitlayout ist nicht öffentlich und wird nicht wiedergegeben; spätere Celeste-Phasen und das LEO-PNT-System der Europäischen Union (EU) können abweichen. Jeder aus dem Workshop abgeleitete Wert steht im Modul <c1/> von <c2/>, verwendet von <c3/>. So wird die Voreinstellung zurückgehalten: Jede aus dem Workshop abgeleitete Zahl der Engine steht in einer Datei, <c4/>, die <c5/> nur einkompiliert, wenn sie existiert, und in den nur im Repository vorhandenen Szenarien <c6/>. Das Löschen dieser Datei und dieser Szenarien hält die Voreinstellung ohne Quelltextänderung zurück; jeder andere Test, jede andere unabhängige Referenz und jedes andere Szenario läuft ohne sie, und die Zählung der Szenariodateien in der README zählt die zurückgehaltenen Dateien weiterhin mit.

# text
seg-906da2752f76 = Verifikation

# text
seg-7338b6210228 = Zeile

# text
seg-c5ce76c91ff7 = Kennzeichnung

# text
seg-cfe0d596296e = SISRE-Gewichte

# text
seg-3e0059048a0d = Tabelle von Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geostationär)

# text
seg-0f5e73171fe0 = Nutzeralgorithmus des Galileo-ICD

# text
# c1: eph2pos
# c2: tests/leo_navmsg_reference.rs
seg-29ad977ef423 = RTKLIB <c1/> an vier realen Galileo-Rundsende-Ephemeriden, { "1" } mm je Achse (<c2/>)

# text
# c1: 0xCDE703
seg-ecec254e8219 = Katalog-Prüfwert <c1/>; Beispielrahmen RTCM { "10403" } { "1005" }

# text
seg-388633e4e785 = Anpassung und SISRE-Abwägung

# text
seg-8b85c3277e66 = Zweikörper-Wahrheit auf { "1" } mm wiedergewonnen; korrigierte J2–J6-Anpassung auf { "1" } mm; monotones Wachstum mit dem Intervall

# text
seg-4de7f2b173c5 = Kontinuität mitten im Überflug

# text
seg-bdbd2771c7f5 = Sprungidentität; Kegelschranke in geschlossener Form gegen Abtastung

# text
seg-468a92a2caf7 = Binärformat und Budget

# text
seg-ba26f5f63172 = Hin-und-zurück-Läufe; Halbschritt jedes Feldes unter { "1" } mm

# text
seg-9be43cbef131 = RINEX-Stil und CSV

# text
seg-a7748156fd6e = Hin-und-zurück-Läufe

# text
seg-88b5cda10923 = 22-Parameter-Modell und Anpassung nach Liu et al. { "2025" }

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-7272ebdc1fec = präzise Bahnen von TU Graz ITSG von vier Satelliten gegen die Tabellen { "4" }, { "5" }, { "6" } und { "8" } der Veröffentlichung: Verhältnisse für längs, quer, radial und SISRE von { "0.755" } bis { "1.138" } an den Tagen der Veröffentlichung und von { "0.683" } bis { "1.186" } an acht zurückgehaltenen Tagen, innerhalb von 1.5x (<c1/>)

# text
seg-94066142a642 = ATOMIC-Zero-Clock-Polynom und die Tabelle für fünf Höhen

# text
seg-205cdc6a3696 = ATOMIC-Fakten aus InsideGNSS; die veröffentlichte Tabelle von Liu neben Kshanas Anpassung der integrierten Bahn gedruckt, nicht festgelegt

# text
seg-8c00ed11609c = geschlossene Formen des ICD; das gegen RTKLIB geprüfte Klobuchar-Modell

# text
seg-d5653e0958b5 = SISRE ist nur der Darstellungsfehler: kein Fehler aus Bahnbestimmung oder Bahnvorhersage.

# text
seg-4968d9fcbc19 = Die Wahrheit ist eine Kshana-Integration (ohne dritten Körper, Strahlungsdruck der Sonne oder Gezeiten), nicht die präzise Bahn eines realen Satelliten.

# text
seg-6a4a1bf21b50 = Das Binärformat und der Block im RINEX-Stil sind Kshanas eigene.

# text
seg-26c0a2693081 = NeQuick-G wird getragen, nicht zu einer Verzögerung integriert; keine Korrektur für einen Satelliten innerhalb der Ionosphäre.

# text
seg-2a0c8190c38e = Der Vergleich mit Liu et al. unterscheidet sich in Bahnen, Parameterdeutung und Gewichten.

# text
seg-4abe216f987a = <s1>Zurück</s1>LEO-Überflug und Streckenbilanz

# text
seg-59d9bf4735d8 = <s1>Weiter</s1>Fusionierte MEO- und LEO-Positionierung
