# docs--agency-orbit-validation: translations (de)

# text
seg-31d58f23c0a2 = Ausführen

# text
# c1: docs/AGENCY-ORBIT-VALIDATION.md
seg-fbe4b3eb7310 = Quelle: <c1/>

# text
seg-87910a33b87b = Validierung des Kraftmodells durch Ephemeridenanpassung: Methodik und validierte Residuen

# text
# c1: src/precise_od.rs
seg-09a1b1b673fb = Die Vollkraft-Engine von Kshana (<c1/>), angepasst an <b>reale präzise Bahnprodukte von Raumfahrtagenturen</b>, mit ehrlichen, zitierbaren, mit dem Commit-Hash versehenen Residuen. Dies ist der Validierungsnachweis für den Roadmap-Meilenstein P4 („Präzise Astrodynamik: Gravitation hoher Ordnung, SRP (Strahlungsdruck der Sonne), Validierung gegen Datensätze von Agenturen“).

# text
seg-90f366667f78 = Was ein validiertes Residuum hier bedeutet

# text
# c1: docs/design/2026-06-09-precise-astrodynamics-design.md
seg-3861b68a03e2 = Ein Residuum wird nur angegeben, wenn alles Folgende zutrifft (Entwurf <c1/>):

# text
# c1: src/tides.rs
# c2: C_R
# c3: src/forces.rs
seg-954f4f934461 = Das <b>Kraftmodell</b> enthält jede Störung, die bei der Zielgenauigkeit zählt: das hochgradige Geopotential EGM2008 (Earth Gravitational Model { "2008" }) (bei einem angegebenen Grad/einer angegebenen Ordnung abgeschnitten, d/o), feste, ozeanische und atmosphärische <b>Gezeiten</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } Kap. { "6" }), Sonne/Mond als dritte Körper, Kanonenkugel-SRP mit konischem Schatten + geschätztem <c2/>, Luftwiderstand (nur LEO (niedrige Erdumlaufbahn)), Terme der Allgemeinen Relativitätstheorie (ART) nach Schwarzschild + Lense–Thirring (<c3/>).

# text
# c1: 1/σ²
seg-710f89c088cc = Der <b>Schätzer</b> ist eine echte Gauß-Newton-Batch-Methode der kleinsten Quadrate mit einer variationellen <b>Zustandsübergangsmatrix</b> (gegen finite Differenzen über den ganzen Bogen auf < { "1e-6" } gegengeprüft), Beobachtungsgewichtung mit <c1/> und n-Sigma-Ausreißerbereinigung.

# text
# c1: src/eop.rs
# c2: src/cio.rs
# c3: timescales::gps_to_tt
seg-dd5dcc66ed22 = <b>Bezugssysteme und Zeit</b> verwenden <b>reale IERS-finals2000A-Erdorientierungsparameter (EOP)</b> (UT1 (Universal Time { "1" }, Erdrotationszeit)−UTC (koordinierte Weltzeit), Polbewegung; <c1/>) über die validierte IAU-Kette (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) (<c2/>). SP3-GPS-Zeit (Standard Product { "3" }, das Format für präzise Bahnen) (Global Positioning System) → TT (Terrestrial Time) über den festen Versatz von { "51.184" } s (<c3/>).

# text
seg-665bb53b81fb = <b>Residuen</b> werden in <b>RTN</b> (radial/Flugrichtung/quer zur Bahn) und 3D angegeben, <b>mit und ohne</b> empirische Beschleunigungen, neben der rohen Überlappung (ohne Anpassung).

# text
seg-fea4515ba842 = Jede Zahl ist <b>reproduzierbar</b> (offenes Datentor der CI (Continuous Integration)) und <b>zitierbar</b> (Commit-Hash + Datensatzverweis + SHA-256 der Fixture (SHA: Secure Hash Algorithm)).

# text
seg-fa98a174e799 = Methode, je Datensatz

# text
seg-a98b098e815a = Die präzise SP3-Bahn parsen; für den gewählten Satelliten jede ITRF-Positionslösung (International Terrestrial Reference Frame) nehmen.

# text
# c1: (UT1, xₚ, yₚ)
seg-a25f69a48b5a = Die SP3-GPS-Epoche → TT umrechnen; <c1/> aus finals2000A zu dieser Epoche auflösen.

# text
seg-e5338b713d88 = Jede ITRF-Positionslösung mit diesen EOP über die CIO-Kette ins GCRS (Geocentric Celestial Reference System) drehen — das sind die inertialen Positionsbeobachtungen. Die Dynamik verwendet für die erdfeste Rotation des Geopotentials die <em>selben</em> EOP, sodass Beobachtungen und Kräfte ein Bezugssystem teilen.

# text
# c1: [r, v, C_R]
seg-ce987e4dda40 = Den Zustand zur Epoche initialisieren (Position = erste Positionslösung; Geschwindigkeit = finite Differenz 2. Ordnung) und <c1/> im Batch anpassen (Stufe { "1" }), dann zusätzlich die { "9" } empirischen RTN-Beschleunigungen mit einem Zyklus pro Umlauf (CPR) (Stufe { "2" }, a priori eingeschränkt).

# text
seg-22f839d05292 = Das RTN- und 3D-RMS (Effektivwert) nach der Anpassung für beide Stufen und die rohe Überlappung angeben.

# text
seg-64e2c3662a27 = Galileo, mittlere Erdumlaufbahn — <b>GREEN</b> (< { "5" } m Zielwert)

# text
# c1: ESA0MGNFIN
seg-e77e8e35ba80 = <b>Datensatz:</b> endgültige Multi-GNSS-Bahn <c1/> von ESA/ESOC (ESA: Europäische Weltraumorganisation; ESOC: Europäisches Raumflugkontrollzentrum) (GNSS: globales Satellitennavigationssystem), ITRF, 5-Minuten-Abtastung, Satellit <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominelle MEO (mittlere Erdumlaufbahn)), 2022-01-01.

# text
# c1: navigation-office.esa.int/products/gnss-products/2190/
# c2: datacenter.iers.org/data/9/finals2000A.all
seg-f90d848e7a46 = <b>Offene Quelle (ohne Anmeldung):</b> Spiegel des ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

# text
seg-ec7195b80bad = Validierungs-Commit:

# text
# c1: e7297f4c…d3a24a3
# c2: 6b781d36…cb2ed00f
# c3: tests/fixtures/agency/NOTICE.md
seg-c2ad9f9cc050 = <b>Fixtures (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

# text
seg-de3df1639939 = Bogen

# text
seg-7db37f753fc1 = 3D-RMS

# text
seg-d39e59df38c0 = RTN (R, T, N)

# text
seg-5ad814c7ef9e = Hinweise

# text
# c1: C_R
seg-bced8a114852 = CI-Fixture, Stufe { "1" } (Kraft + <c1/>)

# text
seg-f040df9ee966 = { "8" } h

# text
seg-459900054e0e = { "0.133" } m

# text
seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

# text
seg-d15ea658058b = rohe Überlappung { "78.7" } km

# text
seg-1ce1bc363541 = CI-Fixture, Stufe { "2" } (+ empirisches CPR)

# text
seg-461105b5c2f3 = { "0.070" } m

# text
seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

# text
seg-224a7fc75354 = halbiert das Residuum

# text
seg-1b422bc76914 = Vollbogen-Dispatch, Stufe { "1" } (vor der Korrektur†)

# text
seg-f57ee3b36d92 = { "24" } h

# text
seg-5fee750a5e30 = { "0.611" } m

# text
seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

# text
# c1: xval/s2-air-tide-fix/
# c2: workflow_dispatch
seg-95879df86618 = Die obigen Zahlen der CI-Fixture wurden in { "0.36" } nach der S2-Korrektur der Luftgezeiten (<c1/>) neu aufgezeichnet: Galileo Stufe { "1" } wanderte von { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), die N-Komponenten von Swarm-A um { "1" }–{ "2" } mm; die Zahlen des Vollbogen-Dispatch wurden nicht neu ausgeführt. † <b>Vor der Korrektur:</b> Die Zahl des Vollbogen-Dispatch wurde vor der S2-Korrektur der Luftgezeiten in { "0.36" } aufgezeichnet und mit dem korrigierten Code nicht neu ausgeführt (die ganztägigen Produkte holt der Dispatch-Workflow ab; sie standen in der Sitzung, die die Korrektur vornahm, nicht zur Verfügung). Bei den CI-Fixtures verschob die Korrektur das 3D-RMS von Galileo um weniger als { "1" } mm und die Komponenten von Swarm-A um { "1" }–{ "2" } mm, sodass eine Änderung derselben Größenordnung zu erwarten ist; der nächste <c2/>-Lauf zeichnet sie neu auf.

# text
seg-5141c1811e35 = Das MEO-Feld ist ab Grad { "8" } gravitativ konvergiert (das Stufe-1-Ergebnis über { "8" } h ist bei d/o { "8" }, { "10" } und { "12" } auf den Millimeter identisch), sodass die d/o-12-Abschneidung der CI-Fixture vernachlässigbar ist; der Dispatch-Job läuft mit dem vollen d/o-70. Die Anpassung über { "8" } h erreicht <b>{ "13" } cm</b> rein kraftbasiert und <b>{ "7" } cm</b> mit der empirischen Stufe; der volle Bogen über { "24" } h (mehr SRP-/Eklipsenbelastung, längere dynamische Spanne) liegt bei <b>{ "61" } cm</b> — alles weit innerhalb des Zielwerts von { "5" } m.

# text
seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (< { "5" } m Zielwert)

# text
# c1: SW_OPER_SP3ACOM_2_
# c2: RDOD_AR
# c3: L47
seg-cba2e4a9b9b1 = <b>Datensatz:</b> präzise reduziert-dynamische wissenschaftliche Bahn <c1/> der ESA Swarm Level-2 (<c2/>, GPS-abgeleitet, ITRF / IGb14, ~{ "2" } cm, Verarbeitung der Technischen Universität Delft), Satellit <b>Swarm-A</b> (SP3-Kennung <c3/>, ~{ "430" } km LEO), 2022-01-01.

# text
# c1: https://swarm-diss.eo.esa.int/
# c2: Level2daily/Latest_baselines/POD/RD/Sat_A/
# c3: finals2000A
seg-f66ad1515550 = <b>Offene Quelle (ohne Anmeldung):</b> Verbreitungsserver der ESA Swarm <c1/> → <c2/> (offen unter der ESA Data Policy). EOP: dieselbe IERS-<c3/>-Reihe 2022-001.

# text
# c1: 6cd84b78…acb733e
# c2: tests/fixtures/agency/NOTICE.md
seg-4de8b64c0bf0 = <b>Fixture (SHA-256):</b> SP3 <c1/> (<c2/>).

# text
# c1: C_R
seg-b46c7e1d476d = Ein LEO-Bogen fügt dem Kraftmodell den <b>atmosphärischen Luftwiderstand</b> hinzu. Weil das Dichtemodell ein <em>statisches</em> stückweise exponentielles ist, wird die Bahn in zwei Stufen angepasst: eine <b>dynamische</b> Stufe (nur den Zustand zur Epoche schätzen; <c1/> bei { "1" } festgehalten, da im LEO der Luftwiderstand dominiert und SRP über einen kurzen Bogen schlecht trennbar ist) und eine <b>reduziert-dynamische</b> Stufe, die die empirischen Beschleunigungen mit einem Zyklus pro Umlauf hinzufügt, die den nicht modellierten Luftwiderstand tragen — die operativ aussagekräftige LEO-Bahn.

# text
# c1: C_R
seg-dac35ad223dd = CI-Fixture, dynamisch (<c1/>={ "1" })

# text
seg-0652aa62d459 = { "3" } h

# text
seg-cc0a14ba2b40 = { "2.687" } m

# text
seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

# text
seg-555712268929 = Residuum ≈ rein in Flugrichtung (Luftwiderstand)

# text
seg-4f8e7956aa78 = CI-Fixture, reduziert-dynamisch (+empirisch)

# text
seg-aa5f651bcfab = { "0.098" } m

# text
seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

# text
seg-82a3e25da2bf = das Empirische absorbiert den Luftwiderstand

# text
# c1: swarm_full_arc_dispatch
# c2: KSHANA_SWARM_SP3
seg-ff834d33ae70 = Die dynamische Anpassung unterschreitet den Zielwert von { "5" } m, wobei das Residuum fast ganz in Flugrichtung liegt — die Lehrbuchsignatur des Luftwiderstands bei ~{ "430" } km. Die empirische Stufe absorbiert diesen Fehler in Flugrichtung ({ "2.52" } → { "0.09" } m) und ergibt eine reduziert-dynamische Anpassung von <b>~{ "10" } cm</b> gegenüber der eigenen ~{ "2" }-cm-Bahn der ESA. Der ganztägige Lauf mit vollem Grad ist der ignorierte <c1/> (der Verbreitungsserver liefert das Produkt über seine Dateibrowser-Sitzung aus, sodass der Gründer die SP3 des Tages herunterlädt und <c2/> darauf zeigen lässt). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended, Atmosphärenmodell) mit Weltraumwetter-Treibern ist das genannte Upgrade, das die <em>dynamische</em> Stufe weiter verbessern würde.

# text
seg-e8f5c385de62 = LRO Mond — validiert, <b>über</b> dem Zielwert von { "5" } m (ehrlich) (P4 W4b)

# text
seg-8a22ef5d3765 = <b>Datensatz:</b> die reale rekonstruierte Trajektorie des <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) von NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) aus JPL Horizons, geometrische mondzentrierte Zustandsvektoren im ICRF (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km Höhe, 1-Minuten-Abtastung ({ "241" } Epochen, { "4" } h, ~{ "2" } Umläufe). Horizons-Textvektoren zu verwenden braucht <b>keinen SPK/SPICE-Leser (SPK: Planeten-Ephemeriden-Kernel; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

# text
seg-2bcf078de340 = <b>Gravitation:</b> das <b>GRGM660PRIM</b>-Feld von GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, Grad { "660" }), auf d/o { "150" } abgeschnitten und bei d/o { "100" } angepasst, ausgewertet im mondfesten <b>Hauptachsen</b>-Bezugssystem.

# text
# c1: ssd.jpl.nasa.gov/api/horizons.api
# c2: icgem.gfz-potsdam.de
seg-1454f78e9ca4 = <b>Offene Quelle (ohne Anmeldung):</b> Horizons-API (Programmierschnittstelle) <c1/>; Gravitation über ICGEM (International Centre for Global Earth Models) <c2/>.

# text
# c1: 574e3518…d100f0
# c2: 0ff04184…f029977ae
# c3: tests/fixtures/agency/NOTICE.md
seg-306ffeb843a9 = <b>Fixtures (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

# text
# c1: src/lunar_od.rs
# c2: src/lunar_frame.rs
# c3: precise_od::ForceModel
seg-65ff0c37dd74 = Dies ist <b>mondzentrierte</b> Dynamik — ein eigenes Kraftmodell (<c1/>): das GRGM-Feld im mondfesten Bezugssystem (die mittlere Erdorientierung des Mondes nach IAU { "2015" } <c2/>, zusammengesetzt mit dem festen DE421-Versatz (Development Ephemeris { "421" }) mittlere Erdachse → Hauptachse (ME→PA)), dazu Erde (die dominante Störung einer Mondumlaufbahn) und Sonne als dritte Körper, angepasst mit dem <em>selben</em> generischen präzisen Gauß-Newton-Schätzer, den auch die Erddatensätze verwenden (der Trait <c3/>).

# text
seg-68f1894a1fa5 = CI-Fixture, dynamisch (nur Zustand)

# text
seg-0f055118d77a = { "4" } h

# text
seg-c94fc5bf792b = { "12.05" } m

# text
seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

# text
seg-af395226ca52 = rohe Überlappung { "39.9" } m

# text
seg-2923b4d58878 = CI-Fixture, reduziert-dynamisch (+empirisch { "1" }+2/Umlauf)

# text
seg-19167d54b4ad = { "6.67" } m

# text
seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

# text
seg-706a4d52f6c5 = das 1- und 2-pro-Umlauf-Empirische absorbiert die Flugrichtung

# text
# c1: pxform('MOON_ME','MOON_PA')
# c2: tests/lunar_me_pa_offset_spice_oracle.rs
# c3: docs/design/evidence/fut05b-me-pa-offset-sign/
seg-3f33d99fd643 = Korrektur in { "0.36" }: Bis { "0.36" } wurde der DE421-ME→PA-Versatz in der falschen Richtung (und mit der falschen Euler-Reihenfolge) angewandt, was das analytische PA-Bezugssystem etwa { "208" }″ neben PA statt auf PA legte. Er ist nun so übertragen, wie SPICE ihn definiert (auf { "2.6e-16" } rad gegen <c1/> geprüft, <c2/>; <c3/>). Die obigen Zahlen gelten nach der Korrektur; davor waren sie { "53.8" } m roh, <b>{ "12.6" } m</b> dynamisch ({ "3.07" }, { "10.19" }, { "6.81" } m) und <b>{ "6.65" } m</b> reduziert-dynamisch ({ "3.49" }, { "4.56" }, { "3.35" } m).

# text
seg-925d1445fccb = Diese Residuen liegen <b>über</b> dem Zielwert von { "5" } m, den Galileo ({ "0.13" } m) und Swarm-A ({ "0.10" } m) unterschreiten, und werden ehrlich angegeben.

# text
seg-c414e14eaaea = Was die Untergrenze tatsächlich bestimmt — eine Kreuzvalidierung auf DE-Niveau (und eine Korrektur)

# text
# c1: MOON_PA
# c2: xval/anise-lunar-od
# c3: moon_pa_de440_200625.bpc
# c4: de440s.bsp
# c5: ae96a29
# c6: c1c7fee…
# c7: 60cd55a…
seg-72b06bac7f6b = Wir vermuteten, dass der begrenzende Faktor die Güte der <b>analytischen Mondorientierung und Ephemeride</b> war (die IAU-Librationsreihe, auf einige zehn Bogensekunden genau gegenüber dem numerisch integrierten <c1/> der JPL DE (Development Ephemeris), und die Erde/Sonne-Ephemeride nach Montenbruck–Gill, ~{ "0.3" }° gegenüber einem DE/SPICE-Kernel). Um das direkt zu prüfen, ersetzt die vom Workspace ausgeschlossene Kreuzvalidierungs-Crate <c2/> <b>nur</b> diese zwei Eingaben durch solche auf <b>DE-Niveau</b> — die DE440-Mond-Hauptachsenorientierung (Development Ephemeris { "440" }) (<c3/>) und die DE440-Ephemeride (<c4/>), gelesen über ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — ein reiner Rust-Leser für SPICE-Kernel) — und führt den <em>selben</em> Schätzer erneut aus (Commit <c5/>, Kernel-SHA-256 <c6/> / <c7/>):

# text
seg-3a0e724a8a2b = Stufe

# text
seg-c1ce24cd6008 = analytisch

# text
seg-7d04fb530a3a = rohe Überlappung

# text
seg-d9ce88edb49e = { "53.8" } m

# text
seg-55dc7c7d84f0 = { "41.5" } m

# text
seg-7def7880e134 = dynamisch

# text
seg-83e37e5e9b3e = { "12.6" } m

# text
seg-c421a0a20278 = { "12.0" } m

# text
seg-f70309824f25 = reduziert-dynamisch ({ "1" }+2/Umlauf)

# text
seg-b8ada0c5fab3 = { "6.65" } m

# text
seg-b6d3daff2f23 = <b>Hinweis zu { "0.36" }: Der größte Teil des Gewinns der dynamischen Stufe unten war der Versatzfehler, nicht die Eingaben auf DE-Niveau.</b> Mit korrigiertem ME→PA-Versatz ergibt der analytische Stapel { "39.9" } m roh, { "12.05" } m dynamisch und { "6.67" } m reduziert-dynamisch, gegenüber { "41.5" }, { "12.0" } und { "6.67" } m auf DE-Niveau: Die analytische und die DE-Anpassung stimmen nun in jeder Stufe überein. Die Lesart von { "0.30" } der Tabelle unten folgt daraus und bleibt, wie sie geschrieben wurde.

# text
# c1: atol
seg-691df96321d8 = <b>Die Hypothese stimmt nur zur Hälfte, und die Hauptaussage musste korrigiert werden.</b> Orientierung und Ephemeride auf DE-Niveau verbessern die rohe Überlappung ({ "53.8" } → { "41.5" } m) und die <b>dynamische</b> Anpassung ({ "12.6" } → { "12.0" } m) <em>tatsächlich</em> — der Fehler der analytischen Orientierung/Ephemeride ist also real und begrenzt diese Stufen. Aber sie lassen das <b>reduziert-dynamische</b> Residuum im Wesentlichen <b>unverändert</b> ({ "6.65" } → { "6.67" } m): Die empirische Stufe mit { "1" }+2 pro Umlauf absorbierte den Orientierungs-/Ephemeridenfehler <em>bereits</em>, sodass die operative Untergrenze von ~{ "6.6" } m durch etwas anderes bestimmt wird — ein Residuum, das die Basis mit Zyklen pro Umlauf nicht absorbieren kann und das Bezugssysteme auf DE-Niveau nicht entfernen. Die konsistenteste Erklärung ist <b>nicht modellierte nichtgravitative LRO-Dynamik</b> (thermische Rückstrahlung, Ausgasung) über den kurzen Bogen von { "4" } h; der Feldgrad ist ausgeschlossen (identisch bei d/o { "100" } und { "150" }), und die Integratortoleranz ist ausgeschlossen (identisch bei <c1/> { "1e-6" } gegenüber { "1e-9" }). Der konstruktive Schluss: <b>Der schlanke, kernelfreie analytische Mondstapel von Kshana erreicht für die reduziert-dynamische (operative) Mondbahn bereits die Güte des DE-Niveaus</b> — die reine Koeffizienten-Voreinstellung lässt dort nichts liegen. Um { "5" } m zu unterschreiten, müsste man die nichtgravitativen Kräfte des LRO modellieren (ein raumfahrzeugspezifisches Box-Wing-/Thermalmodell und eine längere Anpassung über mehrere Bögen), nicht bessere Bezugssysteme.

# text
seg-4211fbd25380 = Ehrlichkeitsverpflichtung

# text
seg-f3b0a26ff5b3 = Der „grüne“ Zielwert < { "5" } m ist für <b>Galileo MEO</b> ({ "0.13" } m dynamisch) und <b>Swarm-A LEO</b> ({ "2.69" } m dynamisch / { "0.10" } m reduziert-dynamisch) erreicht. <b>LRO Mond wird unverändert mit { "12.05" } m dynamisch / { "6.67" } m reduziert-dynamisch ({ "1" }+2 pro Umlauf empirisch) veröffentlicht — über dem Zielwert</b> ({ "0.36" }, nach der Korrektur des ME→PA-Versatzes; davor { "12.6" } / { "6.65" } m). Eine Kreuzvalidierung auf DE-Niveau (oben) hat die Aussage zum begrenzenden Faktor <b>geprüft und korrigiert</b>: Die reduziert-dynamische Untergrenze ist <b>nicht</b> die analytische Orientierung/Ephemeride (DE440-Kernel lassen sie bei { "6.67" } m unverändert), sie wird also nicht durch bessere Bezugssysteme geschlossen, sondern durch Modellierung der nichtgravitativen Dynamik des LRO — der ehrliche, aktualisierte Weg zum Meterbereich.

# text
seg-559a269152ae = Für LEO werden die <b>dynamische</b> (nur Zustand, statische Dichte) und die <b>reduziert-dynamische</b> Stufe (mit empirischen Beschleunigungen) immer <b>getrennt</b> angegeben, damit der Leser sieht, was die empirischen Terme absorbieren; die reduziert-dynamische Stufe ist die operative Bahn. Dieselbe Trennung gilt für die empirischen und rein kraftbasierten Stufen bei MEO.

# text
seg-d20c7ef90250 = Jedes Residuum trägt oben seinen Commit-Hash, Datensatzverweis und die Fixture-Prüfsumme.

# text
seg-733d96129fca = <b>Gegen reale Agenturwahrheit validierte Datensätze: { "3" } von { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO Mond). <b>Den Zielwert < { "5" } m erreichen: { "2" } von { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO bei { "6.67" } m, ehrlich darüber).

# text
seg-d7c77076c9c6 = <s1>Zurück</s1>SGP4-Validierung

# text
seg-d661003da754 = <s1>Weiter</s1>Sonnensystem und andere Himmelskörper

# text
seg-36a3b8105d4b = Galileo, mittlere Erdumlaufbahn — GREEN (< { "5" } m Zielwert)

# text
seg-b6f96cf0d55a = Swarm-A LEO — GREEN (< { "5" } m Zielwert)

# text
seg-9e739bda7f20 = LRO Mond — validiert, über dem Zielwert von { "5" } m (ehrlich) (P4 W4b)
