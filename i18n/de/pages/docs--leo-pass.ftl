# docs--leo-pass: translations (de)

# text
seg-cae10fb9bff8 = Szenario

# text
seg-cbf0f9bcd2d8 = Unabhängige Referenz

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-587beeccaa11 = Voreinstellung

# text
seg-1ff32b87e030 = Satelliten

# text
seg-a6c63abeb7e6 = Mitgelieferte Szenarien

# text
seg-60cd077d82a7 = Modell

# text
seg-2b0d77219437 = Voreinstellungen

# text
seg-5566e1d71a4f = Bahn

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-c5ce76c91ff7 = Kennzeichnung

# text
# c1: docs/LEO-PASS.md
seg-813d372bda81 = Quelle: <c1/>

# text
# c1: leo-pass
seg-0bd4af67ffdb = LEO-Überflug und Streckenbilanz (<c1/>)

# text
# c1: leo-pass
seg-30417c63c48e = LEO-PNT ist Positionierung, Navigation und Zeitgebung (PNT) mit Satelliten im niedrigen Erdorbit (LEO). Der Typ <c1/> simuliert einen oder mehrere Überflüge von LEO-Satelliten über einem Nutzer und berechnet die Streckenbilanz Band für Band, neben den Satelliten der mittleren Erdumlaufbahn (MEO) der GNSS (globale Satellitennavigationssysteme) in Sicht. Die Engine ist <b>systemunabhängig</b>: jede Konstellation, jeder Signalentwurf und jedes Band, direkt in ein Szenario geschrieben. Benannte Systeme sind optionale Voreinstellungen, jede in einer eigenen Datei mit ihrer Quelle.

# text
# c1: src/leo_pass.rs
# c2: src/leo_link/
seg-242c84daecb0 = Code: <a1><c1/></a1> (der Typ) und <a2><c2/></a2> (öffentliche Bausteine, die andere Module aufrufen können).

# text
# c1: leo-pass-vs-gnss-cn0
# c2: leo-indoor-uhf
# c3: leo-iot-energy
# c4: leo-pass-xona-pulsar
# c5: leo-pass-iridium
# c6: leo-resilience-spoof-doppler
# c7: leo-focus-science-iono-sounding
# c8: leo-pass-celeste-iod-multiband
# c9: leo-resilience-spoof-monitors
# c10: leo-focus-iot-eirp
# c11: leo-focus-indoor-uhf
# c12: leo-vertical-*
# c13: leo-pnt-chain
seg-0e6b09e372f5 = Szenarien: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> und das optionale <c8/> (Ergebnisse unter <a1>Mitgelieferte Szenarien</a1>). Der Typ ist außerdem Mitglied der Kampagnen <c9/>, <c10/>, <c11/> und jedes Szenarios <c12/> sowie die Überflugstufe des Typs <c13/>.

# text
seg-59cebed2f589 = Übersicht über jeden LEO-PNT-Typ und jedes LEO-PNT-Szenario: <a1>LEO-PNT.md</a1>.

# text
# c1: tests/leo_link_reference.rs
# c2: tests/fixtures/leo_link/
seg-9646ce17cddf = Unabhängige Referenzen: <a1><c1/></a1>, Testdaten in <c2/> mit ihren Quell-URLs.

# text
seg-c1020ac47091 = Was ein Lauf berechnet

# text
seg-10dedc607eac = Für jeden LEO-Satelliten, jedes Band und jede Epoche:

# text
seg-35bf9a48e566 = Größe

# text
seg-b0f12ee05fe9 = Elevation, Azimut, Entfernung

# text
seg-24ad909c4fb8 = Nutzer in WGS-84 (World Geodetic System { "1984" }), Satellit in einem inertialen System, das zur Epoche am erdfesten System ausgerichtet ist

# text
seg-c9f61c3348ef = berechnet

# text
# c1: ρ̇ = d·Δv/ρ
# c2: ρ̈ = (|Δv|² − ρ̇² + d·Δa)/ρ
seg-ebd800ec3d47 = Entfernungsrate <c1/>, Entfernungsbeschleunigung <c2/>

# text
seg-232b42b71f03 = geschlossene Form; jeder Lauf prüft beide gegen zentrale Differenzen der propagierten Entfernung und berichtet die größte Differenz

# text
seg-b3a55e868346 = geschlossene Form

# text
# c1: −f·ρ̇/c
# c2: −f·ρ̈/c
seg-3f1f90a57c2f = Doppler <c1/>, Dopplerrate <c2/>

# text
seg-852b6c351ce4 = erster Ordnung, je Band

# text
seg-4eb4b779679b = Freiraumdämpfung

# text
# c1: 20·log10(4πRf/c)
seg-31f67bcd2d50 = Friis, <c1/>

# text
seg-fb5f06a91de1 = EIRP des Satelliten (äquivalente isotrope Strahlungsleistung) und Strahlungsdiagramm

# text
# c1: −12(η/θ₃)²
seg-883702244778 = isoflux bis zu einer Randelevation, gaußförmige Hauptkeule <c1/> dB, oder flach

# text
seg-b6e91c5252d3 = Nutzerantenne

# text
# c1: G_z + 10·q·log10(sin el)
seg-ed92a0abf62f = Patch <c1/> dBic, halbkugelförmig oder isotrop

# text
seg-0ac54d232e0a = Dämpfung durch Gase

# text
seg-30fb5b0a0bc7 = vereinfachte Ausdrücke aus ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 Anhang { "2" } (abgelöst durch P.676-13, dessen tabellierte Koeffizienten die Engine nicht trägt)

# text
seg-58d58478e9eb = Regendämpfung

# text
seg-4c1e413d5fc3 = Koeffizienten aus ITU-R P.838-3 und das Verfahren aus P.618-14 § { "2.2.1.1" }, aus einer Regenrate R0.01 und einer Regenhöhe

# text
seg-dab78c0552b6 = Troposphärische Szintillation

# text
seg-8e5ca14cbf08 = ITU-R P.618-14 § { "2.4.1" }; unter { "4" } GHz eine Extrapolation, im Bericht gekennzeichnet

# text
seg-788516420351 = VALIDATED ({ "4" }–{ "55" } GHz)

# text
seg-32dddfdba584 = Gebäudeeindringverlust (Nutzer in Gebäuden)

# text
seg-ef9025622e81 = ITU-R P.2109-2, traditionell oder thermisch effizient, bei der Elevation des Pfades an der Fassade

# text
seg-c7d1bccd4d51 = Polarisationsfehlanpassung

# text
seg-f4aaea269382 = Polarisationsverlustfaktor aus Achsenverhältnissen und Drehsinnen, gemittelt über die Ausrichtung der Ellipse

# text
seg-96601850a9d5 = Systemrauschtemperatur

# text
# c1: 290(10^(NF/10) − 1)
seg-82735c7f3ea5 = Antennenuntergrenze + Himmelsemission des absorbierenden Pfades ({ "275" } K) + kosmisch { "2.7" } K + Empfänger <c1/>

# text
seg-53ce973b0ee7 = C/N0 (Träger-Rausch-Dichte)

# text
seg-fa01d060cf1a = Ionosphärische Gruppenlaufzeit

# text
# c1: 40.3·STEC/f²
seg-33f2113dea70 = <c1/>, STEC (Schräg-Gesamtelektronengehalt) aus dem Klobuchar-Modell oder einem vertikalen Gesamtelektronengehalt (TEC), skaliert mit dem Anteil einer Chapman-Schicht unterhalb des Satelliten

# text
seg-431dfeb5edba = Skalierung VALIDATED, TEC MODELLED

# text
# c1: √(a₁² + a₂²)
# c2: [iot]
seg-56df31449434 = Je Bandpaar: die ionosphärenfreien Koeffizienten, die Rauschverstärkung <c1/> und das thermische Coderauschen jedes Bandes und der Kombination im Überflugmaximum. Der Vergleich mit MEO-GNSS verwendet dieselbe Nutzerantenne und denselben Empfänger, mit der Mindest-Empfangsleistung des Schnittstellendokuments jedes Signals (Galileo Open Service Signal-in-Space Interface Control Document, OS SIS ICD, Ausgabe { "2.1" } Tabelle { "12" }; GPS aus IS-GPS-200 und IS-GPS-705), plus einem angegebenen Überschuss, mit der Entfernung skaliert. Der optionale Abschnitt <c2/> (Internet der Dinge) gibt Zeit bis zur ersten Positionslösung, Energie je Positionslösung und Batterielebensdauer gegen das Tastverhältnis für ein angegebenes Leistungsbudget des Empfängers an (MODELLED, jede Annahme ist eine Eingabe und im Bericht aufgeführt).

# text
# c1: orbit = "pass"
seg-7132ede02109 = <c1/> (Standard): eine Kreisbahn, so gelegt, dass der Nutzer einen Überflug mit gewählter Maximalelevation zu einer gewählten Zeit sieht, aufsteigend oder absteigend, östlich oder westlich des Nutzers; die Inklination kann sonnensynchron sein.

# text
# c1: orbit = "elements"
seg-688307acbf0d = <c1/>: ausdrückliche Kepler-Elemente.

# text
# c1: orbit = "tle"
seg-e9085739bcb8 = <c1/>: ein Zweizeilen-Elementsatz (TLE) über den Propagator Simplified General Perturbations { "4" } (SGP4) der Engine.

# text
# c1: [[leo_constellation]]
# c2: constellation-design
# c3: ConstellationCfg
seg-7dcc5fdbc249 = <c1/>: eine Walker-Konstellation, aufgebaut vom Code <c2/> (sein <c3/> oder die Schalen der Voreinstellung); die höchsten Überflüge im Fenster werden berichtet.

# text
seg-ec7e163dd073 = Bänder und Signalentwürfe

# text
# c1: system = "<preset>"
# c2: bands
# c3: [[satellite.band]]
# c4: system = "none"
# c5: [[satellite.band]]
seg-4d49743b3544 = Bänder: <c1/> mit einer optionalen Teilmenge <c2/> und Einträgen <c3/>, die ein Band hinzufügen oder ein beliebiges Feld eines Voreinstellungsbandes überschreiben. <c4/> mit nur Einträgen <c5/> verwendet gar keine Voreinstellung.

# text
# c1: leo-signal
# c2: signal = "xona-x5"
# c3: data/leo-signals/
# c4: leo-pnt-chain
# c5: frequency_mhz
# c6: leo-signal
seg-bd1e114aaea6 = Ein Band kann auch einen Entwurf <c1/> benennen (<c2/>, ein beliebiger Entwurf unter <c3/> oder einer, den der Typ <c4/> übergibt; siehe <a1>LEO-SIGNAL.md</a1>). Das Band übernimmt dann die Mittenfrequenz des Entwurfs (sofern <c5/> nicht angegeben ist), die Sendebandbreite und die Chiprate der verfolgten Komponente, verteilt seine EIRP nach deren Leistungsanteilen auf die Komponenten des Entwurfs und berichtet in jeder Epoche das C/N0 der verfolgten Komponente und ihr bandbegrenztes Early-Late-Codeverfolgungsjitter (Betz und Kolodziejski { "2009" }, die Formel des Typs <c6/>) als Entfernungsmessfehler.

# text
seg-1d96501bb12d = Jede Voreinstellung kennzeichnet ihre Zahlen als PUBLIC (mit URL), REPRESENTATIVE (eine dokumentierte Entwurfsentscheidung, nie eine Aussage über ein reales System) oder WORKSHOP.

# text
seg-f708914fed48 = Bänder

# text
# c1: generic-leo
seg-6459abcaeebe = <c1/> (Standard)

# text
seg-a0dab2ebeb1b = REPRESENTATIVE; L-, S- und C-Träger aus öffentlichen Dokumenten

# text
seg-cd0075385395 = UHF { "450" } MHz (repräsentativ), L { "1191.795" } MHz (Galileo-E5-Mitte), S { "2492.028" } MHz (NavIC S, der S-Band-Träger von Navigation with Indian Constellation), C { "5020" } MHz (Mitte der Zuweisung { "5010" }–{ "5030" } MHz für RNSS (Funknavigationssatellitendienst)), jeweils { "0" } dBW

# text
seg-3f0de4312fcb = { "550" } km sonnensynchron, Walker 240/12/1

# text
seg-486f17197d4d = REPRESENTATIVE, für C-Band-Systeme, deren Parameter nicht öffentlich sind (zum Beispiel TrustPoint)

# text
seg-f6696b70591c = C { "5020" } MHz, BPSK({ "10" }) (binäre Phasenumtastung bei { "10" } × { "1.023" } Mchip/s), isoflux

# text
seg-4ae6741795f9 = PUBLIC, <a1>arXiv { "2509.19551" }</a1> Tabellen { "1" }–{ "2" }

# text
seg-a1be637cda63 = X1 { "1593.3225" } MHz, X5 { "1190.51625" } MHz; EIRP aus der veröffentlichten Mindest-Empfangsleistung bei { "10" }°

# text
seg-cb74283148d7 = { "1080" } km, { "53" }° ({ "192" }) and { "97" }° ({ "66" })

# text
seg-5ae1331b91f8 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF)</a1> und die veröffentlichte Bahn

# text
seg-c995dade5aa6 = Satellite Time and Location (STL) bei { "1621" } MHz (Mitte von { "1616" }–{ "1626" } MHz); EIRP aus „{ "300" }-mal GPS“

# text
seg-dd6322466888 = { "781" } km, { "86.4" }°, { "66" } in { "6" } Ebenen

# text
seg-ad0ba129439b = PUBLIC Signalzahlen (<a1>NAVIGATION { "72" }({ "1" })</a1>), REPRESENTATIVE Bahn und EIRP

# text
seg-1931203a036c = Ku-Bake bei { "240" } MHz, nur Doppler

# text
seg-0533710bbbe1 = PUBLIC Signalstruktur (<a1>PMC10301026</a1>), REPRESENTATIVE Bahn und EIRP

# text
seg-cee286338f01 = BPSK { "2.046" } Mchip/s nahe L1 und L5

# text
seg-fe3cdce92b31 = { "1000" } km, { "55" }°

# text
# c1: celeste-iod
seg-03d5ae448705 = <c1/> (optional)

# text
seg-800f173f2b20 = WORKSHOP Signalparameter, PUBLIC Bahn

# text
seg-e8626249e708 = sieben Bänder der Konfiguration #1

# text
seg-cb29553176c7 = { "510" } km sonnensynchron

# text
# c1: link
# c2: src/celeste_iod.rs
# c3: scenarios/leo-pass-celeste-iod-multiband.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-10f79909a5bc = <b>Die Voreinstellung Celeste IOD (Demonstration im Orbit) ist optional.</b> Ihre Signalparameter wurden auf dem LEO-PNT-Workshop des Navigation Innovation and Support Programme (NAVISP) der Europäischen Weltraumorganisation (ESA), { "2026" }, vorgestellt und haben noch keine öffentliche Quelle; sie stehen im Modul <c1/> von <c2/>, verwendet von <c3/>. So wird die Voreinstellung zurückgehalten: Jede aus dem Workshop abgeleitete Zahl der Engine steht in einer Datei, <c4/>, die <c5/> nur einkompiliert, wenn sie existiert, und in den nur im Repository vorhandenen Szenarien <c6/>. Das Löschen dieser Datei und dieser Szenarien hält die Voreinstellung ohne Quelltextänderung zurück; jeder andere Test, jede andere unabhängige Referenz und jedes andere Szenario läuft ohne sie, und die Zählung der Szenariodateien in der README zählt die zurückgehaltenen Dateien weiterhin mit. Ihre EIRP und ihre Keule sind auf eine auf dem Workshop gezeigte C/N0-Kurve kalibriert, sodass dieses Szenario die Kurve konstruktionsbedingt reproduziert.

# text
seg-9f9ff4fe18f8 = Das Broadcast-Ephemeridenmodell mit dem Polynom „Zero-Clock“ von ATOMIC ist eine Voreinstellung für Navigationsnachrichten und nicht Teil dieses Typs.

# text
seg-dc496b16046b = Die Beobachtung LEO gegenüber GNSS

# text
# c1: scenarios/leo-pass-vs-gnss-cn0.toml
seg-6be559b1ac29 = <c1/> reproduziert qualitativ, was LEO-PNT-Demonstrationen zeigen: Das LEO-C/N0 steigt und fällt in einer Glockenkurve, die { "590" } s über der Maske bleibt und bei { "56.8" } dB-Hz ihr Maximum erreicht, { "8.9" } dB über dem Median der flachen MEO-GNSS-Träger (Galileo E1, { "40.5" } bis { "52.0" } dB-Hz, Median { "47.8" } dB-Hz). Der Abstand kommt von der Entfernung, nicht von einem stärkeren Sender: Im Überflugmaximum ist der Satellit { "569" } km entfernt, etwa { "40" }-mal näher als ein Galileo-Satellit im Zenit ({ "23 222" } km), was { "32" } dB weniger Freiraumdämpfung bedeutet; die generische Voreinstellung strahlt { "0" } dBW ({ "1" } W) ab.

# text
# c1: kshana scenarios/<name>.toml
seg-08debab7c94a = Jede Zeile ist ein Lauf von <c1/> (Engine { $version }):

# text
seg-9a60f0bf803e = Aufbau

# text
seg-fde146239f5d = Ergebnis eines Laufs

# text
# c1: generic-leo
seg-41455a3f15b6 = <c1/> L-Band, { "550" } km, { "80" }°-Überflug über München

# text
seg-9d5c154eceb1 = L-Maximum { "56.8" } dB-Hz, Median { "42.2" } dB-Hz; Galileo-E1-Median { "47.8" } dB-Hz

# text
# c1: xona-pulsar
seg-9423b1184fb0 = <c1/>, ein entworfener { "70" }°-Überflug und vier Satelliten einer geneigten Schale, maritimer Nutzer

# text
seg-63bf0b8f7f3a = X1-Maximum { "65.6" } dB-Hz und X5 { "68.9" } dB-Hz beim entworfenen Überflug; größter X1-Doppler { "31.4" } kHz

# text
# c1: iridium-stl
seg-8a3383072765 = <c1/>, { "65" }°-Überflug, Nutzer im Flugzeug

# text
seg-d2fea8542638 = STL-Maximum { "80.5" } dB-Hz, { "34.3" } dB über dem GPS-L1-Median; größter Doppler { "35.4" } kHz

# text
# c1: generic-leo
seg-d837a8a7648b = <c1/>, Nutzer in Gebäuden in Rom (traditionelles Gebäude)

# text
seg-4fbead0588d2 = Maximum UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "8.5" } dB-Hz; Galileo-E1-Median { "22.4" } dB-Hz

# text
# c1: generic-leo
# c2: [iot]
seg-954e16842d59 = <c1/> UHF und L mit dem Abschnitt <c2/>

# text
seg-9aa81f6f4929 = Warmstart { "0.90" } s und { "18.0" } mJ bei jedem Signal; Kaltstart UHF { "19.0" } s ({ "381" } mJ), L { "47.0" } s ({ "939" } mJ), GPS L1 { "38.1" } s ({ "762" } mJ)

# text
# c1: generic-leo
seg-97476f9d4212 = <c1/>, vier Bänder, { "70" }°-Überflug über Tromsø

# text
seg-fd1463da9965 = siehe <a1>Ionosphärensondierung</a1>

# text
seg-1ad5bde12b4f = { "16" } Satelliten einer generischen Schicht in { "1080" } km, L und C, ein Sprung von { "30" } m

# text
seg-25cf36cf0de3 = siehe <a1>Spoofing-Monitore</a1>

# text
# c1: kshana scenarios/<name>.toml --animate html --export all
# c2: .animation.html
seg-6cdf9830433e = <c1/> schreibt außerdem den interaktiven Player (<c2/>, die Überflugepochen) sowie CZML (die Cesium Language), KML (Keyhole Markup Language), GeoJSON und STK-Ephemeridendateien (Systems Tool Kit) der Überfluggeometrie (<a1>ANIMATION.md</a1>, <a2>INTEROP.md</a2>).

# text
seg-d3a0fc36329a = Ionosphärensondierung

# text
# c1: STEC = (P₂ − P₁)·f₁²f₂² / (40.3·(f₁² − f₂²))
# c2: geometry_free_stec_tecu
# c3: geometry_free_stec_sigma_tecu
# c4: scenarios/leo-focus-science-iono-sounding.toml
seg-1e64715af2ff = Jedes Bandpaar liefert außerdem den Schräg-TEC, den seine geometriefreie Codekombination im Überflugmaximum wiedergewinnt, <c1/>, und die 1-Sigma dieser Schätzung aus dem Coderauschen der beiden Bänder im Maximum (<c2/>, <c3/>). Die Schätzung ist konstruktionsbedingt gleich dem Schräg-TEC des Modells: Die Kombination ist in erster Ordnung exakt. Die Sigma entscheidet, ob ein Bandplan ein besserer oder schlechterer Sondierer ist: <c4/> (vier Bänder über Tromsø) gewinnt aus jedem Paar { "18.85" } TEC-Einheiten wieder, mit einer 1-Sigma von { "0.017" } TEC-Einheiten für UHF mit L und { "2.9" } für S mit C. Nur thermisches Coderauschen; weder Mehrwegeausbreitung noch Zwischenfrequenzversatz. MODELLED.

# text
# c1: [spoofer]
seg-8f59acefb2b3 = Spoofing-Monitore (<c1/>)

# text
# c1: [spoofer]
# c2: onset_s
# c3: offset_m
# c4: push_rate_m_s
# c5: push_azimuth_deg
# c6: bands
# c7: gnss = false
# c8: simulate_iono
seg-91941393400a = Der optionale Abschnitt <c1/> fälscht die Signale, die ein Empfänger an einer behaupteten Position sehen würde. Ab <c2/> springt die behauptete Position um <c3/> und bewegt sich dann horizontal mit <c4/> in Richtung <c5/>; die gefälschte Entfernung und Entfernungsrate sind genau die der behaupteten Position, auf den in <c6/> genannten LEO-Bändern (Standard alle) und auf dem MEO-GNSS-Signal, außer bei <c7/>. <c8/> gibt an, ob die gefälschten Pseudoentfernungen die ionosphärische Laufzeit tragen (die eines Bodensenders tun das nicht).

# text
# c1: src/leo_link/spoof.rs
# c2: p_fa
# c3: 1 − p_md
seg-845f6840d92d = Der Empfänger betreibt zwei Monitore (<a1><c1/></a1>), jeden mit einer angegebenen Falschalarmwahrscheinlichkeit je Epoche (<c2/>, Standard { "1e-5" }), und erklärt Detektion in der ersten Epoche, in der seine Detektionswahrscheinlichkeit <c3/> erreicht (Standard { "0.999" }). Die Detektionswahrscheinlichkeiten sind für das angegebene gaußsche Rauschen exakt, ausgewertet am rauschfreien mittleren Residuum; es wird kein Rauschen gezogen.

# text
seg-cc38b40eb7a5 = Monitor

# text
seg-8b34ac584c3d = Statistik

# text
seg-7b158594c4d9 = Was er sieht

# text
seg-89756d80bc29 = Konsistenz von Doppler und Überfluggeometrie

# text
# c1: prior_sigma_m
# c2: prior_velocity_sigma_m_s
# c3: window_s
# c4: drift_sigma_m_s
seg-2174c7725e48 = gemessene Entfernungsraten gegen die aus den Bahnen und einer unabhängigen A-priori-Position und -Geschwindigkeit vorhergesagten (<c1/>, <c2/>); ein verallgemeinertes Chi-Quadrat nach der Methode der kleinsten Quadrate über ein Fenster von <c3/> (Standard ein Schritt), wobei die Uhrendrift eine Störgröße ist (oder mit <c4/> vorgegeben wird); Rauschen der Frequenzregelschleife aus C/N0 (Kaplan & Hegarty { "2006" }, § { "5.6.2" }), auf den GNSS-Kanälen, den LEO-Kanälen und allen Kanälen

# text
# c1: δx
# c2: g·δx
# c3: g = −(Δv − ρ̇u)/ρ
seg-14eab06a47d5 = ein Positionsfehler <c1/> verschiebt eine Entfernungsrate um <c2/>, <c3/>: Die Quergeschwindigkeit eines LEO-Satelliten im Verhältnis zu seiner Entfernung ist etwa { "25" }-mal so groß wie die eines MEO-Satelliten, daher ist derselbe Fehler im LEO-Doppler etwa { "25" }-mal größer

# text
seg-390ac49b3c09 = Konsistenz zwischen den Bändern

# text
# c1: √(2(σ₁² + σ₂²))
# c2: iono_rate_bound_m_s
seg-986d501c2b01 = der Schritt von Epoche zu Epoche der geometriefreien Pseudoentfernungskombination jedes LEO-Bandpaares, bereinigt um das ionosphärische Modell des Empfängers, gegen das Coderauschen <c1/> und eine tolerierte nicht modellierte ionosphärische Rate (<c2/>)

# text
seg-389187df55d7 = ein Spoofer, der einige Bänder fälscht und andere nicht, oder jedes Band ohne die Ionosphäre, bei seinem Einsetzen; nicht einer, der jedes Band fälscht und die Ionosphäre simuliert

# text
# c1: scenarios/leo-resilience-spoof-doppler.toml
# c2: scenarios/leo-resilience-spoof-monitors.toml
seg-4dd44d7fa566 = <c1/>: Ein Sprung von { "30" } m an einem vermessenen Standort in Frankfurt ändert die GNSS-Entfernungsraten um etwa { "4" } mm/s und die LEO-Raten um etwa { "10" } cm/s (mediane Gradienten { "1.4e-4" } und { "3.5e-3" } je Sekunde). Der Test nur mit GNSS erkennt ihn nie (größte Nichtzentralität { "0.06" }); der Test über alle Kanäle erkennt ihn { "105" } s nach dem Einsetzen. <c2/> lässt vier Spoofer gegen beide Monitore laufen.

# text
seg-1b64098e01f3 = Einschränkungen, in jedem Ergebnis angegeben: Der Spoofer ist ein idealisierter, in sich konsistenter Positionsschub, der seinen eigenen Pfad ausgleicht (keine Signatur in Leistung, Einfallswinkel oder Korrelationsspitze); das A-priori ist von den gespooften Positionslösungen unabhängig; das ionosphärische Modell des Empfängers ist das der Engine, sodass das echte Residuum zwischen den Bändern im Mittel null ist. MODELLED (zwei Zeilen in <a1>VERIFICATION-MATRIX.md</a1>).

# text
seg-edb7b16b6c0e = Validierung

# text
seg-051b8cd1849d = Test

# text
seg-609c537a9dfd = ITU-R P.838-3 Tabelle { "5" }, { "115" } Frequenzen

# text
seg-5bf24bec38f2 = jeder Koeffizient innerhalb von { "0.6" } seiner letzten gedruckten Stelle (schlechtester beobachteter Wert { "0.51" })

# text
seg-86204b023d44 = Validierungsbeispiele der ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0), P.618-14 Regen

# text
seg-13180d4097d1 = { "56" } Fälle innerhalb von { "1e-4" } dB (beobachtet { "5e-6" } dB)

# text
seg-84161e5f97f8 = Dieselben Beispiele, P.618-14 Szintillation

# text
seg-0a4305c867ff = { "42" } Fälle innerhalb von { "1e-5" } dB

# text
seg-054f8dbe2792 = Arbeitsmappe Clutter and BEL der ITU-R Study Group { "3" }, P.2109

# text
seg-8ae2eeed4be4 = { "568" } Werte innerhalb von { "0.001" } dB

# text
# c1: γ = (77/60)²
seg-6df2eded9f19 = Gruppenlaufzeitverhältnis <c1/> aus IS-GPS-200

# text
seg-d0b293230f91 = auf { "1e-12" }; Verstärkung L1/L2 und L1/L5 { "2.978" } und { "2.588" }

# text
seg-f9a0e24c00a7 = Friis in der Form Kilometer–Megahertz

# text
seg-4e94a67f40f6 = auf { "1e-4" } dB

# text
seg-ee59b4c520eb = arXiv { "2509.19551" } Tabelle { "1" } (Pulsar In-Orbit-Validierung (IOV), volle Betriebsfähigkeit (FOC) polar, FOC geneigt, GPS)

# text
seg-345998ca457c = { "20" } Geschwindigkeiten und Doppler-Maxima innerhalb von { "0.05" } %

# text
seg-30e34076f4a7 = Die unabhängigen Referenzen für Regen und Szintillation übernehmen die Regenhöhe und die feuchte Refraktivität so, wie die Validierungsbeispiele sie angeben: Die Engine trägt weder die Karte nach ITU-R P.839 noch die nach P.453.

# text
seg-d2d1075a0b67 = EIRP und Strahlungsdiagramme sind veröffentlichte Empfangsleistungen, in eine EIRP umgerechnet, oder repräsentative Entscheidungen; es wird kein gemessenes Strahlungsdiagramm eines Satelliten verwendet, und kein LEO-C/N0 wird mit einer Messung verglichen.

# text
seg-915a9564608d = Der Gasterm ist das abgelöste vereinfachte Verfahren P.676-10; unter { "1" } GHz ist er der mit f² skalierte Wert bei { "1" } GHz, und Regen wird dort als null angenommen.

# text
seg-cdd9faf5b61d = Der Anteil des TEC unterhalb eines LEO-Satelliten stammt aus einer einzelnen Chapman-Schicht (ohne Plasmasphäre) und ist durch einen angegebenen Anteil überschreibbar.

# text
seg-4b72218497e7 = Die entworfenen Überflug- und Walker-Bahnen sind Zweikörperbahnen mit einem optionalen säkularen J2 (der zweiten zonalen Harmonischen der Erde); der TLE-Pfad verwendet SGP4. Die eigene Beschleunigung des Nutzers bleibt in der Dopplerrate in geschlossener Form unberücksichtigt (die numerische Prüfung berichtet, was das für einen bewegten Nutzer kostet).

# text
seg-9fc2cd6d38e9 = RINEX (Receiver Independent Exchange Format) { "4.02" } hat keine LEO-Navigationsdatensätze; jeder LEO-Export im RINEX-Stil gehört zum Code der Navigationsnachricht und ist eine dokumentierte Kshana-Erweiterung (Vorarbeiten: arXiv { "2401.17767" }).

# text
seg-593081243d8c = <s1>Zurück</s1>LEO-Signalentwürfe

# text
seg-468e70f9a669 = <s1>Weiter</s1>LEO-Navigationsnachricht

# text
seg-072d0d8f618c = Spoofing-Monitore ([spoofer])
