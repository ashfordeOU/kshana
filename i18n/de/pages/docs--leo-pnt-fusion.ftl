# docs--leo-pnt-fusion: translations (de)

# text
seg-cae10fb9bff8 = Szenario

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-587beeccaa11 = Voreinstellung

# text
seg-a6c63abeb7e6 = Mitgelieferte Szenarien

# text
seg-354b42e3a5d0 = RNTF

# text
seg-c5ce76c91ff7 = Kennzeichnung

# text
# c1: docs/LEO-PNT-FUSION.md
seg-9673ca8c2705 = Quelle: <c1/>

# text
seg-989faf40651b = Fusionierte Positionierung, Navigation und Zeitgebung mit MEO und LEO

# text
# c1: leo-pvt
# c2: leo-ppp
# c3: ntn-positioning
# c4: src/leo_fusion/
seg-c14c586a29e7 = Drei Szenariotypen liefern Positionierung, Navigation und Zeitgebung (PNT) mit Satelliten im niedrigen Erdorbit (LEO) allein oder fusioniert mit den globalen Satellitennavigationssystemen (GNSS) der mittleren Erdumlaufbahn (MEO): <c1/> (Position, Geschwindigkeit und Zeit), <c2/> (präzise Punktpositionierung) und <c3/> (ein nichtterrestrisches 5G-Netz). Quelle: <c4/>.

# text
# c1: constellation-design
seg-351652fa0e42 = Die Engine ist <b>systemunabhängig</b>. Jede Konstellation besteht aus Walker-Schalen, ausdrücklichen Bahnelementen oder einer GNSS-Voreinstellung des Typs <c1/>; jedes Signal ist ein Träger, eine Chiprate und eine Hüllkurve der Träger-Rausch-Dichte (C/N0); jedes Fehlerbudget ist eine ausdrückliche Ein-Sigma. Benannte Systeme sind optionale <b>Voreinstellungen</b>, je eine Datei, und jede Fähigkeit, jeder Test und jedes mitgelieferte Szenario läuft ohne ein bestimmtes davon.

# text
seg-3e7c6608d5c4 = Systeme und Voreinstellungen

# text
# c1: [[system]]
# c2: kshana <file>.toml
seg-1031746214ab = Ein Szenario führt seine Systeme als Tabellen <c1/> auf. Dieses vollständige Szenario verbindet die GPS-Basiskonstellation mit einer generischen LEO-Schicht und läuft wie geschrieben (<c2/>; die Engine { $version } ergibt eine mediane Positions-Dilution-of-Precision von { "2.43" } für GPS allein und { "1.17" } fusioniert sowie einen quadratischen Mittelwert des 3D-Fehlers von { "2.06" } m und { "0.47" } m):

# text
# c1: preset = "gps-baseline"
# c2: galileo
# c3: beidou-meo
# c4: glonass
# c5: leo_preset = "..."
# c6: navsignal::dll_code_jitter_chips
# c7: sigma_pr_m
# c8: sigma_doppler_hz
seg-6168fdca9b54 = <c1/> (das Global Positioning System, GPS; oder <c2/>, <c3/>, <c4/>) übernimmt eine veröffentlichte GNSS-Konstellation; <c5/> füllt alles, was die Tabelle offen lässt, aus einer LEO-Voreinstellung. Das C/N0 verläuft linear im Sinus der Elevation von der Maske bis zum Zenit (eine Modellierungsentscheidung: Die Hüllkurve eines realen Überflugs hängt vom Strahlungsdiagramm der Sendeantenne ab). Die Ein-Sigma der Pseudoentfernung ist das thermische Rauschen der Delay-Lock-Loop (DLL) der Engine (<c6/>) bei diesem C/N0, kombiniert mit dem Entfernungsfehler im Signal im Raum (SISRE), sofern <c7/> es nicht festlegt; die Ein-Sigma der Entfernungsrate ist die Wellenlänge mal <c8/>. Weil die Sigma eine Eingabe ist, kann ein getrenntes Signalmodell sie speisen, ohne dass der Positionierungscode weiß, woher sie kam.

# text
seg-a3f63252bd1b = Was es trägt

# text
seg-9872e31ebd72 = Quellen

# text
seg-e20c823f36f3 = X1 bei { "1593.3225" } MHz, { "1.023" } Mchip/s, Empfangsleistung −{ "148.2" } bis −{ "139.1" } dBW; X5 bei { "1190.51625" } MHz, { "10.23" } Mchip/s, −{ "144.9" } bis −{ "136.2" } dBW; { "258" } Satelliten in { "18" } Ebenen in { "1080" } km, { "53" } und { "97" } Grad

# text
seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Repräsentativ: die Aufteilung auf die beiden Inklinationen, die Phasierung, der Entfernungsfehler

# text
seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } Satelliten, sechs nahezu polare Ebenen in { "780" } km und { "86.4" } Grad; Bursts bei { "1616" } bis { "1626" } MHz, Quadratur-Phasenumtastung (QPSK) mit { "25 000" } Symbol/s; Empfangsleistung das { "300" }- bis { "2400" }-Fache des GPS-Minimums

# text
seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>Konstellation</a3>. DERIVED: die Leistung in dBW. Repräsentativ: Träger in der Bandmitte, Entfernungsfehler

# text
seg-36771f73c21f = Nur Doppler: { "11.325" } GHz, { "240" } MHz orthogonales Frequenzmultiplex-Bake (OFDM), C/N0 bis { "57.07" } dB-Hz, Dopplerfehler { "30" } Hz; erste Schale mit { "1584" } Satelliten in { "550" } km und { "53" } Grad

# text
seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim und Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Repräsentativ: Phasierung, C/N0 am Horizont

# text
seg-2e13de07f9e9 = Binäre Phasenumtastung (BPSK) mit { "2.046" } Mchip/s nahe L1 und L5; Bahnbestimmung im Zentimeterbereich

# text
seg-dd94a3839cb3 = PUBLIC: <a1>erste Bewertung</a1>, <a2>GPS Solutions</a2>. Repräsentativ: Träger, Leistung, die gesamte Betriebskonstellation

# text
seg-a34d6a186a36 = Ein C-Band-System in der Zuweisung { "5010" } bis { "5030" } MHz für den Funknavigationssatellitendienst (RNSS), für Systeme, deren Parameter nicht öffentlich sind

# text
seg-7712896ff69a = PUBLIC: die Zuweisung der <a1>Radio Regulations der International Telecommunication Union (ITU)</a1>. Alles andere <b>repräsentativ</b>

# text
seg-89ebc32469d9 = Ein Ephemeriden-und-Uhr-Modell: Ephemeride als Polynom sechster Ordnung, { "30" } s Auffrischung, Uhr auf GNSS-Zeit gesteuert; SISRE { "0.26" } m

# text
# c1: ephemeris_preset
seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. DERIVED: der SISRE. Mit jeder Konstellation kombinierbar über <c1/>

# text
seg-6389c92e07d4 = Celeste-Demonstration im Orbit (IOD) der Europäischen Weltraumorganisation (ESA), eine Konfiguration eines parametrisierten Signalentwurfs

# text
seg-b8bd6e76aeb2 = PUBLIC Bahn (<a1>ESA</a1>, <a2>Institute of Navigation (ION) Abstract { "16907" }</a2>); WORKSHOP Signalparameter, vorgestellt auf dem LEO-PNT-Workshop des Navigation Innovation and Support Programme (NAVISP) der ESA, { "2026" }

# text
# c1: fusion
# c2: src/celeste_iod.rs
# c3: scenarios/celeste-iod-fused-pvt.toml
# c4: tests/workshop_preset_isolation.rs
# c5: src/celeste_iod.rs
# c6: build.rs
# c7: scenarios/*celeste-iod*.toml
seg-bd7fb6eb444a = Jede aus dem Workshop abgeleitete Zahl steht im Modul <c1/> von <c2/>, verwendet von <c3/> (<c4/> erzwingt, wo sie erscheinen dürfen). So wird die Voreinstellung zurückgehalten: Jede aus dem Workshop abgeleitete Zahl der Engine steht in einer Datei, <c5/>, die <c6/> nur einkompiliert, wenn sie existiert, und in den nur im Repository vorhandenen Szenarien <c7/>. Das Löschen dieser Datei und dieser Szenarien hält die Voreinstellung ohne Quelltextänderung zurück; jeder andere Test, jede andere unabhängige Referenz und jedes andere Szenario läuft ohne sie, und die Zählung der Szenariodateien in der README zählt die zurückgehaltenen Dateien weiterhin mit.

# text
# c1: mode = "doppler" | "joint" | "polar" | "timing"
seg-12cdcc633ae0 = Ein Typ, vier Modi (<c1/>).

# text
# c1: f_D
# c2: λ
# c3: ρ̇ = −λ f_D = u·(v_s − v_u) + ḋ
# c4: u
# c5: ḋ
# c6: ∂ρ̇/∂r = −(I − u uᵀ)(v_s − v_u)/ρ
# c7: doppler_only = true
# c8: starlink-sop
seg-72b5d8cc82ea = <b>Doppler.</b> Ein Empfänger, der den Doppler <c1/> bei der Wellenlänge <c2/> misst, beobachtet die Entfernungsrate <c3/>, mit <c4/> als Sichtlinie und <c5/> als Uhrendrift des Empfängers. Eine Gauß-Newton-Anpassung im Stapel löst die Position, die Drift und optional eine konstante Geschwindigkeit, mit analytischen partiellen Ableitungen <c6/>: Nur die Satellitengeschwindigkeit quer zur Sichtlinie trägt Positionsinformation, die Geometrie ist also, wie sich die Sichtlinien während des Fensters drehen. Der Bericht gibt den Fehler gegen die Fensterlänge an, die Hüllkurve von Doppler, Dopplerrate und Ruck jedes Systems und eine Tabelle für einen einzelnen Überflug. Ein Überflug ortet den Nutzer entlang der Spur (der Zeitpunkt des Doppler null) und quer dazu (die Steilheit der Dopplerkurve); der Fehler quer zur Spur wächst unbegrenzt, wenn der Überflug über den Nutzer führt, und das Spiegelbild über die Bodenspur passt fast genauso gut (nur die Erdrotation trennt sie). Ein System nur mit Doppler (<c7/>, die Voreinstellung <c8/>) läuft in diesem Modus.

# text
seg-007d143c7fb4 = <b>Joint.</b> In jeder Epoche eine gewichtete Methode der kleinsten Quadrate über die Pseudoentfernungen der GNSS-Systeme allein, der LEO-Systeme allein und aller zusammen, eine Empfängeruhr je System (der Zwischensystemversatz, ISB, wird geschätzt) oder ein bekannter Rundsende-Versatz auf der Referenzzeitskala. Berichtet werden die Dilution of Precision für Geometrie, Position, horizontal, vertikal und Zeit (GDOP, PDOP, HDOP, VDOP, TDOP), die Fehler, die geschätzten Versätze und der DOP gegen die Zahl der LEO-Satelliten, die der GNSS-Geometrie hinzugefügt werden.

# text
seg-22f136a0c96f = <b>Polar.</b> Satelliten in Sicht, medianer DOP und Verfügbarkeit gegen die Breite für MEO-GNSS, LEO und beide.

# text
# c1: slot-timing
# c2: Δt_UTC = Δt_LS + A0 + A1 (t_E − t_ot + 604800 (WN − WN_t))
seg-1034557258d1 = <b>Timing.</b> An einer bekannten Position ist jede LEO-Pseudoentfernung eine Uhrenmessung. Der Empfänger betreibt ein Kalman-Filter mit zwei Zuständen (Phase, Frequenz), dessen Prozessrauschen das weiße Frequenzrauschen und das Random-Walk-Frequenzrauschen der Oszillatorklasse ist (der <c1/> und die Uhrenmodelle), hält die Zeit zwischen Überflügen und rechnet die Systemzeit mit dem Ausdruck <c2/> aus IS-GPS-200 in die koordinierte Weltzeit (UTC) um; die Unsicherheit des Rundsende-Versatzes ist ein Versatz je Lauf.

# text
seg-0d76fcc05e7d = Ein erweitertes Kalman-Filter (EKF) für präzise Punktpositionierung (PPP) mit Gleitkomma-Mehrdeutigkeiten auf ionosphärenfreiem Code und ionosphärenfreier Phase: statische Koordinaten, eine weiße Empfängeruhr, ein Zwischensystemversatz je zusätzlichem System, eine zenitale feuchte Verzögerung als Random Walk und eine Gleitkomma-Mehrdeutigkeit je Satellitenbogen. Der Fehler von präziser Bahn und Uhr ist Code und Phase eines Satelliten gemeinsam, daher ist jeder Satellit eine korrelierte Aktualisierung mit zwei Zeilen, in einer Joseph-stabilisierten Form, die die Kovarianz über Tausende Phasenaktualisierungen im Millimeterbereich positiv definit hält. Die Messungen werden aus demselben Modell simuliert, daher muss der normierte quadrierte Schätzfehler (NEES) der Position einem Chi-Quadrat-Gesetz mit drei Freiheitsgraden folgen; der Test prüft das über Monte-Carlo-Startwerte. Konvergenz ist die erste Epoche, nach der die horizontalen und vertikalen Fehler bis zum Ende des Laufs unter den Schwellen ({ "10" } cm) bleiben.

# text
seg-630384148ec7 = Ein LEO-Satellit quert den Himmel in etwa zehn Minuten, ein MEO-Satellit bewegt sich einige Grad, daher trennen LEO-Bögen die Mehrdeutigkeiten viel früher von der Position.

# text
# c1: c / (2π β sqrt(2 (C/N0) T))
# c2: β
# c3: B/√12
# c4: sqrt(3 / (2π² (C/N0) T³))
seg-17f9cf9cc24d = Eine Abwärtsstrecke eines nichtterrestrischen 5G-Netzes (NTN) im S-Band des mobilen Satellitendienstes (MSS), Band n256 des 3rd Generation Partnership Project (3GPP) ({ "2170" } bis { "2200" } MHz). Die Cramér-Rao-Schranke (CRB) für die Ankunftszeit ist <c1/>, mit <c2/> als Effektivwert-(Gabor-)Bandbreite (<c3/> für ein flaches OFDM-Spektrum), und für die Frequenz eines Tons <c4/>. Der Typ vergleicht Kanäle (standardmäßig einen New-Radio-Kanal mit { "5" } MHz und einen Schmalbandkanal mit { "200" } kHz) anhand von Positionslösungen aus der Ankunftszeit der Abwärtsstrecke bei unbekannter Empfängeruhr und einer Doppler-Positionslösung mit einem einzelnen Satelliten über einen Überflug.

# text
seg-516afd013d38 = Typ, Modus

# text
seg-529a5aeea10a = Was er zeigt (mit festem Startwert, deterministisch)

# text
# c1: leo-pvt
seg-6cd0b721006a = <c1/>, doppler

# text
seg-c3c51264f12a = Xona-Pulsar-X1-Schicht ({ "258" } Satelliten), { "1" } Hz Dopplerrauschen: 3D-Fehler { "7.5" } m nach zehn Minuten ({ "26" } Satelliten); bei einem einzelnen Überflug beträgt die Ein-Sigma quer zur Spur { "303" } m, wenn der Überflug nahezu über den Nutzer führt ({ "25" } km neben der Spur), gegen { "43" } m bei { "250" } km neben der Spur

# text
seg-da85037a6691 = Gelegenheitssignale nur mit Doppler, { "30" } Hz Dopplerfehler bei { "10" } Hz: formale horizontale Ein-Sigma von etwa { "10" } m nach { "20" } s mit { "12" } Satelliten und { "6" } m nach { "60" } s

# text
# c1: leo-pvt
seg-4dbb00da5310 = <c1/>, joint

# text
seg-553e8f4df276 = GPS und Galileo medianer PDOP { "1.47" } und quadratischer Mittelwert (RMS) des 3D-Fehlers { "1.06" } m; Xona X5 allein { "1.73" } und { "0.49" } m; fusioniert { "1.06" } und { "0.41" } m; der LEO-Versatz von { "40" } ns ({ "11.99" } m) als { "12.06" } m geschätzt

# text
seg-83378a120e0d = Konvergenz { "7.4" } min (nur MEO-GNSS), { "4.8" }, { "3.2" }, { "2.7" } und { "2.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten

# text
seg-4aadc3b41822 = Entfernungsschranke { "0.26" } bis { "1.03" } m für { "4.5" } MHz und { "6.5" } bis { "26" } m für { "180" } kHz; Positionslösungen bei etwa { "2" } m gegen { "26" } m

# text
# c1: leo-pvt
seg-5b1019210ca7 = <c1/>, polar

# text
seg-108488f6cc6c = GPS und Galileo VDOP { "1.20" } am Äquator, { "1.51" } bei { "89.9" } Grad; mit Iridium { "1.14" } am Pol

# text
# c1: leo-pvt
seg-bcdbe0796127 = <c1/>, timing

# text
seg-94ab83c05f50 = Zeitübertragung mit Iridium über { "6" } Stunden in Boulder: { "9.9" } bis { "11.4" } ns RMS bei nominalem C/N0 über vier Oszillatorklassen, { "15.1" } bis { "25.0" } ns bei { "30" } dB weniger

# text
# c1: celeste-iod-fused-pvt
seg-3007f5930dfd = <c1/> (optional)

# text
seg-f6ff187a00aa = GNSS, ergänzt um die beiden IOD-Satelliten auf der Referenzzeitskala (nur im Repository, zusammen mit der Voreinstellung zurückgehalten)

# text
# c1: leo-pvt
# c2: leo-focus-fused-pnt-sisre
# c3: leo-vertical-autonomous-vehicle
# c4: leo-vertical-polar-arctic
# c5: leo-vertical-critical-infrastructure-timing
# c6: leo-vertical-5g-network-timing
# c7: leo-ppp
# c8: leo-focus-ppp-altitude
# c9: ntn-positioning
# c10: leo-focus-ntn-bandwidth
# c11: leo-pvt
# c12: leo-ppp
# c13: leo-pnt-chain
seg-98710204278b = Die Typen laufen auch innerhalb anderer Szenarien: <c1/> ist Mitglied des Durchlaufs <c2/> und der Kampagnen <c3/>, <c4/>, <c5/> und <c6/>; <c7/> des Durchlaufs <c8/>; <c9/> des Durchlaufs <c10/>; und <c11/> und <c12/> sind die Stufen für die fusionierte Positionslösung und PPP des Typs <c13/>. Ihre Ergebnisse stehen auf <a1>LEO-PNT.md</a1>.

# text
seg-2f3086178d0b = Veröffentlichte Zahlen und Kennzeichnungen

# text
seg-8980b5ae869b = Zahl

# text
seg-0be9b5747c00 = Kshana

# text
seg-3d2d01038419 = Iridium-Doppler bis zu ±{ "36" } kHz

# text
seg-a88258961299 = { "35.9" } kHz, das Maximum über einen Tag von Überflügen, innerhalb von { "5" } %

# text
# c1: tests/leo_doppler_reference.rs
seg-5bc3150b53f6 = VALIDATED (<c1/>)

# text
seg-35a3ec8ee073 = Xona-Pulsar-X1-Maximaldoppler { "32" } bis { "34" } kHz

# text
seg-499acd31a8f8 = arXiv:{ "2509.19551" }

# text
seg-e8c9c880a3eb = { "33.6" } kHz von einem Satelliten jeder veröffentlichten Schale ({ "1080" } km, { "53" } und { "97" } Grad), innerhalb des Intervalls ohne Aufweitung; die Schale mit { "53" } Grad allein erreicht ihr Maximum bei { "31.8" } kHz, da die Erdrotation eine prograde Bahn relativ zum Boden verlangsamt

# text
seg-e12713d5019f = VALIDATED (derselbe Test)

# text
seg-370ca62e7fc7 = Xona-Pulsar-X1-Ruck ±{ "1.26" } Hz/s²

# text
seg-4de9b0895288 = etwa { "1.0" } Hz/s² bei einem Überflug über den Nutzer

# text
seg-5019322f4669 = berichtet, nicht validiert

# text
seg-7fcb83027ff4 = PPP-Konvergenz { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min mit 60/96/192/288 LEO

# text
seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

# text
seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monoton

# text
seg-0a1133c16dce = MODELLED Konsistenz des Trends (Konstellationen, Rauschen und Stationen nicht reproduziert)

# text
seg-7c5292729f36 = Starlink etwa { "2" } m in { "20" } s mit drei Satelliten

# text
seg-6a54a7c58ade = Kozhaya, Saroufim und Kassas { "2025" }

# text
seg-13fc5fc4f69f = formale horizontale Ein-Sigma von etwa { "10" } m nach { "20" } s mit { "12" } Satelliten, bei perfekter Ephemeride und mit jedem Fehler in einer Doppler-Sigma von { "30" } Hz bei { "10" } Hz

# text
seg-4fc80a02ed6c = MODELLED Vergleich (Empfänger und Messrate nicht reproduziert)

# text
seg-5d0ae24eb74c = Iridium-Zeitgebung unter { "40" } ns von UTC(NIST)

# text
seg-fa4467605bc4 = NIST

# text
seg-b910bf5135dd = etwa { "10" } ns RMS modelliert

# text
seg-9025f3c376c5 = MODELLED Vergleich

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-4434b0ff1caa = Alles Übrige ist MODELLED, mit seiner Begründung in der Verifikationsmatrix (<c1/>): Der DOP wird gegen einen von Hand abgeleiteten Fall mit vier Satelliten geprüft, die Positionslösungen gegen ihre Kovarianz, das Dopplermodell gegen die Identität der Entfernungsbeschleunigung, das PPP-Filter gegen das Chi-Quadrat-Band des NEES und die Schranken gegen die Quadratur.

# text
seg-aa5482ac34ff = Grenzen, offen benannt

# text
seg-0b4564367dcd = Zweikörperbahnen mit der säkularen Drift durch J2, die zweite zonale Harmonische der Erde; kein Anpassungsfehler der Rundsende-Ephemeride über die Ein-Sigma des SISRE hinaus, kein Strahlungsdiagramm der Satellitenantenne.

# text
# c1: leo-pvt
seg-b51ccfee4ab8 = Keine ionosphärische oder troposphärische Verzögerung in <c1/> (das PPP-Filter trägt einen Zustand für die feuchte Verzögerung; seine ionosphärenfreie Kombination beseitigt die Ionosphäre erster Ordnung), keine Szintillation, keine Mehrwegeausbreitung, keine Cycle Slips und keine Auflösung ganzzahliger Mehrdeutigkeiten.

# text
seg-a719ccac19c0 = Die NTN-Genauigkeit ist eine Schranke, kein erzieltes Ergebnis.

# text
seg-19ba6cc0ca75 = Als repräsentativ gekennzeichnete Voreinstellungswerte sind veranschaulichend und beschreiben den Entwurf keines Betreibers.

# text
seg-f9f335d67ff8 = <s1>Zurück</s1>LEO-Navigationsnachricht

# text
seg-062138bbb73c = <s1>Weiter</s1>Konstellationsentwurf
