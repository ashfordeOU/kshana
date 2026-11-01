# docs--provenance: translations (de)

# text
seg-9a2a5f0a8a02 = Sonnensystem

# attr:aria-label, text
seg-d01db1c2710a = Referenz

# text
seg-28e87f407a10 = Bereich

# text
seg-ad856ad710eb = Status

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-d4a762001549 = Lizenz

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-638b8d451550 = Sensor

# text
seg-60cd077d82a7 = Modell

# text
seg-2afa300864a9 = Parameter

# text
seg-32b620b3574e = Verwendung

# text
# c1: docs/PROVENANCE.md
seg-f3de25879362 = Quelle: <c1/>

# text
seg-257526f1f93f = Herkunft — jeder Parameter auf eine veröffentlichte Quelle zurückführbar

# text
seg-8c12958898a8 = Die zentrale Ehrlichkeitsdisziplin von Kshana ist, dass <b>jeder Sensorparameter, jedes physikalische Modell und jeder Validierungsdatensatz auf eine veröffentlichte Quelle zurückführbar ist</b> — ein Datenblatt, ein begutachtetes Paper, ein Signal-in-Space-ICD (Interface Control Document) oder ein Standard. Dieses Dokument sammelt diese Herkunftsangaben in einer einzigen zitierbaren Referenztabelle.

# text
# c1: [clock_quantum]
# c2: [clock_classical]
# c3: provenance
# c4: ModelSpec
# c5: src/types.rs
# c6: with_provenance
# c7: src/inertial/imu_errors.rs
# c8: quantum.spec.provenance
# c9: classical.spec.provenance
# c10: units
# c11: input
# c12: computed
# c13: closed-form
# c14: internal-consistency
seg-279914171c2e = Die Herkunft ist nicht nur Dokumentation: Jede Sensortabelle in einem Szenario (zum Beispiel <c1/> und <c2/>) trägt einen String <c3/> (<c4/> in <c5/>; <c6/> in <c7/> für das Fehlermodell der Inertialmesseinheit (IMU)), der <b>in das Ergebnis-JSON einfließt</b> (JavaScript Object Notation), als <c8/> und <c9/>, sodass jeder Lauf seine eigenen Parameterbelege mitführt. Der Block <c10/> des Ergebnisses kennzeichnet außerdem jedes numerische Feld mit einer Herkunftsklasse (<c11/>, <c12/>, <c13/>, <c14/>, …). Die Tabellen unten sind der zusammengeführte, menschenlesbare Index dieser Strings, plus die algorithmische Herkunft und die Validierungsherkunft aus den Quellkommentaren.

# text
# c1: VALIDATION.md
# c2: validated
# c3: modelled
# c4: not modeled
# c5: QUANTUM-MODELS.md
seg-683fd369407a = Der Reifegrad ist durchgehend ehrlich gekennzeichnet: <b>flugqualifiziert</b> (ist geflogen), <b>Bodenlabor / Höhenforschungsrakete</b> (demonstriert, nicht geflogen) oder <b>Weltraumziel auf Bodenhardware</b> (eine angestrebte Kennzahl für Hardware, die nicht geflogen ist — insbesondere jede Kennzahl einer optischen Strontium-Gitteruhr). Siehe <a1><c1/></a1> für die Labels <c2/> / <c3/> / <c4/> je Kennzahl und <a2><c5/></a2> für die Diskussion des Reifegrads Bodenlabor gegenüber Flug.

# text
seg-80834864bfdd = { "1" }. Parameter von Uhren & Frequenzreferenzen

# text
seg-305f560d4b08 = Kennzahl

# text
seg-c35a20fa2529 = Reifegrad

# text
seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (chipskalige Atomuhr)

# text
seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

# text
seg-222707a1bde3 = Datenblatt des Herstellers

# text
seg-97709a803dea = <b>flugqualifiziert</b> (im Einsatz befindliches kommerzielles Teil)

# text
seg-75db01df1aea = Optische Strontium-Gitteruhr (Weltraumziel)

# text
seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

# text
seg-1996a1d92bb1 = Origlia, Schiller, Bongs et al., <a1>arXiv:{ "1503.08457" }</a1>

# text
seg-b8c64caf79f3 = <b>Weltraumziel auf Bodenhardware</b> — keine optische Sr-Uhr ist geflogen

# text
seg-b5a006507475 = Optische Strontium-Gitteruhr (Laborrekord)

# text
seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

# text
seg-b21bb1b6bf40 = Oelker et al., <em>Nature Photonics</em> ({ "2019" })

# text
seg-95fb87b3a118 = nur Bodenlabor

# text
seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; Vergleichsgröße auf der ISS (International Space Station))

# text
seg-9d6acc3191a5 = Größenordnung { "1" }×{ "10" }⁻¹⁶ nach mehrtägiger Integration

# text
seg-1cddc44025d7 = ESA (European Space Agency) ACES/PHARAO, seit April { "2025" } auf der ISS in Betrieb (veröffentlichte ESA-Ergebnisse zitieren)

# text
seg-75b7bb5ca4c8 = <b>flugqualifiziert</b> (Mikrowelle/Maser, nicht optisch)

# text
# c1: q_wf = σ_y(1 s)²
# c2: flicker_floor
# c3: VALIDATION.md
seg-aeb8f189db37 = Der vom Holdover-Modell verwendete Allan-Koeffizient des weißen Frequenzrauschens ist <c1/>; Flicker-Frequenzmodulation (Flicker-FM) und Alterung werden nur dort modelliert, wo ein <c2/> ausdrücklich gesetzt ist (siehe <a1><c3/></a1>), sonst werden sie nicht modelliert.

# text
seg-bfe4524b6664 = { "2" }. Parameter von Inertialsensoren

# text
seg-5cd1984ba399 = Kennzahlen

# text
seg-53ad9ba8cecb = Hybrides Quanten-Beschleunigungsmesser-Triple von Exail

# text
seg-b40c95a6bea5 = Bias-Stabilität { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); Rauschen { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

# text
seg-fdb8f1d648ba = Templier et al., <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

# text
seg-570f41ff76c9 = Quarz-Beschleunigungsmesser Honeywell QA-2000 in Navigationsqualität

# text
seg-a7dbc9a9705e = Bias-Stabilität ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; Rauschen ~{ "20" } µg/√Hz; Bias-Instabilität ~{ "1" } µg

# text
seg-3ad7ce01c6e2 = Hersteller / Groves <em>AESS (Aerospace and Electronic Systems Society) Tutorial</em>

# text
seg-37c841945d3e = IMU-Fehlermodell (Skalenfaktor, Fehlausrichtung, g-Empfindlichkeit, Quantisierung, Ratenrampe)

# text
seg-b7547264e608 = fünf systematische Kategorien

# text
seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabelle { "4.1" }

# text
seg-c24b9890cf3b = Modell

# text
seg-67a38b3fe143 = Strapdown-Mechanisierung (NED, Nord-Ost-Unten; Coning/Sculling)

# text
seg-832b3645b515 = Quaternionen-Lage §{ "2.2" }, §{ "5.5" }; NED-Mechanisierung §{ "5.4" }; Schwere §{ "2.4" }

# text
seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2. Aufl.

# text
seg-ac7ef2be17e0 = { "3" }. Parameter der Zeit- & Frequenzübertragung

# text
seg-7634c6f4b32c = Verbindung

# text
seg-dddf65bbb231 = Optisch im freien Raum, Zwei-Wege (zwischen Satelliten)

# text
seg-e3a8990e650a = Laboruntergrenze ~{ "1" } fs; { "1" } ps als im Orbit glaubwürdiges Ziel

# text
seg-1adf3425eda9 = Giorgetta et al. ({ "2013" }, <em>Nature Photonics</em>); Deschênes et al. ({ "2016" }, <em>Physical Review X</em>)

# text
seg-9ab60d7ed2a9 = TWSTFT (Zwei-Wege-Satelliten-Zeit- und Frequenzübertragung, Ku-Band)

# text
seg-543939310789 = einzelne Sitzung ~{ "0.5" } ns

# text
seg-7f6127bdb4d9 = BIPM (Internationales Büro für Maß und Gewicht) / PTB (Physikalisch-Technische Bundesanstalt, das deutsche nationale Metrologieinstitut) / NIST (National Institute of Standards and Technology)

# text
seg-d1f0ed9c0323 = { "4" }. Modelle für Bahn, Zeitsysteme & Bezugssysteme

# text
seg-2ad53ecbee02 = Gleichung / Standard

# text
seg-7ed15b9389e0 = Referenz (Quellkommentar)

# text
seg-4d6989c7153e = SGP4/SDP4-Propagation (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" })

# text
seg-0d46975247cc = das WGS-72-SGP4-Modell (WGS: World Geodetic System)

# text
seg-6dcfe89aeb8f = Vallado et al., <em>"Revisiting Spacetrack Report #3"</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

# text
seg-e46bf46a4d35 = Schaltsekunden / Zeitsysteme (UTC/TAI/TT/UT1 (UTC: Koordinierte Weltzeit; TAI: Internationale Atomzeit; TT: Terrestrische Zeit; UT1: Weltzeit { "1" }, Erdrotationszeit))

# text
seg-7505e93b9bf8 = Regime ganzzahliger Schaltsekunden ab 1972-01-01

# text
seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); Schaltsekunden-Historie aus IERS Bulletin C

# text
seg-d25f68665f8e = Erdrotationswinkel

# text
seg-a3a803bdc8a0 = IAU (International Astronomical Union) Resolution B1.8 von { "2000" }

# text
seg-049ad81ff5e8 = Position/Uhr des SV (space vehicle, also eines Satelliten) aus der Broadcast-Ephemeride

# text
# c1: F·e·√A·sin Eₖ
# c2: TGD
seg-a1a595008b2a = Nutzeralgorithmus, relativistisch <c1/>, <c2/>

# text
seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

# text
seg-8e14a54b1f09 = Ephemeridenkonstanten von Galileo / QZSS (Quasi-Zenith Satellite System Japans) / BeiDou (μ, Ω̇ₑ, C̄₂₀)

# text
seg-93b03e3b3e43 = SIS-ICDs je System (Interface Control Documents)

# text
seg-c7c6759c0373 = Galileo OS (Open Service) SIS-ICD; BeiDou OS SIS-ICD (CGCS2000, das China Geodetic Coordinate System { "2000" }); GLONASS-ICD (Global Navigation Satellite System Russlands) (PZ-90 (PZ: Parametry Zemli, das russische geodätische Datum))

# text
seg-7d59b9c3dabc = { "5" }. GNSS-Modelle im Messungsbereich & für Resilienz

# text
seg-dd7e88cfd703 = Einfrequenz-Ionosphäre nach Klobuchar

# text
seg-9920eb06b90c = Semicircle-Algorithmus

# text
seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

# text
seg-0358759614c5 = Zenit-Troposphäre nach Saastamoinen

# text
seg-b4b7f91f6112 = hydrostatische + feuchte Zenitverzögerung

# text
seg-ba06204996b7 = Davis et al. ({ "1985" }); Groves §{ "9.4" }

# text
seg-9fc988ebf2aa = Abbildungsfunktionen nach Niell

# text
seg-8eb79ff7faaa = hydrostatisch & feucht, Elevationsabbildung

# text
seg-ca4642e37561 = Niell ({ "1996" })

# text
seg-7876aa9fc732 = Anti-Jam-Link-Budget

# text
# c1: [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹
seg-75e1c40bdc0f = <c1/> (C/N₀ das Träger-zu-Rauschleistungsdichte-Verhältnis, J/S das Störer-zu-Signal-Verhältnis, Q der spektrale Trennfaktor, Rc die Chiprate) → effektives C/N₀ → Verlust der Nachführung

# text
seg-7afcd0de9ae8 = Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. Aufl., §{ "9.4" }

# text
seg-c6e2f2ee16cb = Spoof- / Energieerkennung

# text
seg-15390c9b849c = Neyman–Pearson- / zweiseitiger χ²₁-Energietest; Φ⁻¹ über Acklam; erf über Abramowitz & Stegun { "7.1.26" }

# text
seg-1c30c0b6a81f = klassische Detektionstheorie

# text
seg-023867611249 = Stabilität der Allan-Familie (ADEV/MDEV/TDEV/HDEV (ADEV: Allan-Abweichung; MDEV: modifizierte Allan-Abweichung; TDEV: Zeitabweichung; HDEV: Hadamard-Abweichung))

# text
seg-478bb58f8a7f = mit Konfidenzintervallen

# text
seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

# text
seg-a958238e3d1c = RAIM (receiver autonomous integrity monitoring) / Integrität (HPL/VPL (HPL: horizontaler Schutzradius; VPL: vertikaler Schutzradius), ARAIM (advanced receiver autonomous integrity monitoring) Solution Separation)

# text
seg-41b219635fbe = Snapshot & Solution Separation

# text
# c1: INTEGRITY.md
seg-b971eeb2bf2b = siehe <a1><c1/></a1>

# text
seg-926261321371 = { "6" }. Validierungsdatensätze

# text
# c1: scripts/fetch_*.sh
# c2: realdata-cache/
seg-04863ce407e7 = <b>Vendoring-Richtlinie.</b> Wir committen eine wörtliche Kopie jedes Validierungsdatensatzes, dessen Lizenz die Weiterverbreitung erlaubt <em>und</em> dessen Größe bequem in git passt, sodass ein Klon die Validierung offline ohne Netzwerk und ohne Link-Verfall reproduzieren kann. Ein Datensatz ist <b>abrufgebunden</b> (von einem Helfer <c1/> in das von git ignorierte <c2/> heruntergeladen, wobei nur die kleinen <em>abgeleiteten</em> Referenzwerte committet werden) nur, wenn seine Lizenz die Weiterverbreitung nicht klar erlaubt oder wenn er für git zu groß ist. Jeder gebundene Datensatz nennt unten seinen konkreten Grund; nichts wird aus Bequemlichkeit gebunden.

# text
seg-b966dd26caa6 = Datensatz

# text
seg-e0351f9b83fc = Status im Repository

# text
seg-ea1ad9965f74 = AIAA-2006-6753-SGP4-Testvektoren (alle { "666" })

# text
seg-cb7efe21070c = Numerische Validierung von SGP4 — schlechtester Wert { "4.12" } mm

# text
seg-a624c6877c48 = Veröffentlichte Referenzvektoren (Vallado, AIAA)

# text
seg-d90675af2816 = Eingebunden

# text
seg-c1cee31c42df = ⁸⁸Sr-Uhr (optisch), ADEV σ_y(τ) (Norcia et al., Science { "366" }:{ "93" }, { "2019" })

# text
seg-232e54a0e396 = Validierung der Anpassung an die gemessene Stabilität optischer Uhren

# text
seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

# text
seg-2bb00a0c58ef = NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM-v3-(Shuttle Radar Topography Mission-)Höhenkachel N36W117 (Death Valley, auf 6 Bogensekunden dezimiert, { "722" } KB)

# text
# c1: .hgt
seg-088a57c3a5b1 = Validierung des <c1/>-Lesers für Gelände-DEM (DEM: digitales Höhenmodell) an realem Relief (Badwater Basin ≈ −{ "86" } m)

# text
# c1: elevation-tiles-prod
seg-ed90325543c8 = <b>Gemeinfrei</b> (NASA/USGS SRTM v3; über AWS (Amazon Web Services) Open Data <c1/>)

# text
seg-9607b2318cf5 = Beispiele aus dem CCSDS 502.0/503.0 Blue Book zu OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message)

# text
seg-b53475918422 = Validierung des CCSDS-Parsers per Round-Trip

# text
seg-25d9f396b539 = Veröffentlichte Standardbeispiele (CCSDS)

# text
seg-35dfb14360e3 = Präzise IGS-Bahn (International GNSS Service) im Format SP3 (Standard Product { "3" }, das Präzisionsbahn-Format) + RINEX-Navigationsbeispiele (Receiver Independent Exchange Format)

# text
seg-5e321b8b5287 = Validierung von Bahnanpassung + Integrität

# text
seg-ec0b6ff10fc5 = Offene IGS-Daten (frei für jede Nutzung, Namensnennung)

# text
# c1: gps-ops
# c2: galileo
seg-00db9583ce55 = Celestrak-TLE-Snapshots (Zweizeilen-Elementesätze) (<c1/>, <c2/>)

# text
seg-4dabd0f62f90 = Szenarien mit realen Konstellationen

# text
seg-6e7c8deb24b6 = Celestrak-Bedingungen (Namensnennung; TLEs (Zweizeilen-Elementesätze) mit Ursprung in der US-Regierung (US: United States))

# text
# c1: tests/fixtures/celestrak/
# c2: scripts/fetch_tles.sh
seg-2827577f7008 = <c1/> + live <c2/>

# text
seg-c0945969860a = Referenzausgaben von scipy / scikit-learn / filterpy

# text
seg-61546d769e23 = Validierung numerischer Kerne + Schätzer

# text
seg-b74e03fddbca = Lokal erzeugt aus BSD/MIT-Bibliotheken (BSD: Berkeley Software Distribution licence)

# text
# c1: tests/fixtures/scipy/
seg-9d818fc79012 = <c1/> (+ Generatorskripte)

# text
seg-4d6c3069b01f = Stable32-Referenzabweichungen (ADEV/HDEV-Stufenleitern je Dekade)

# text
seg-0a7b677330a6 = Gleichstand der Allan-Schätzer

# text
seg-3c91f9ae6473 = Abgeleitete Zusammenfassungswerte (klein)

# text
seg-14aecb331164 = <b>Roh</b>-Phasenreihe einer 5071A-Caesium-Uhr ({ "556 990" } Punkte, { "12" } MB)

# text
seg-9d43f399613b = überlappende ADEV/HDEV an einer realen Cs-Uhr

# text
# c1: allantools
seg-87b53409bedb = <b>Unklar</b> — <c1/> steht unter LGPL-3.0 (der GNU Lesser General Public License, einer Softwarelizenz) <em>ohne ausdrückliche Erlaubnis zur Weiterverbreitung von Daten</em>; die Datei ist aus der PyPI-Distribution (Python Package Index) ausgeschlossen

# text
# c1: scripts/fetch_cs5071a.sh
seg-b741be74c8ad = <c1/>; abgeleitete Stufenleitern committet

# text
seg-5e07eabcfe78 = <b>Roh</b>-PHASE.DAT (Regressionsreihe mit 1000 Punkten)

# text
seg-d9f61f4b985c = Reihe für den Gleichstand mit dem Stable32-Schätzer

# text
seg-df8e0a135895 = <b>Unklar</b> — mit dem kommerziellen Stable32 (Hamilton Technical Services) verteilt; NIST SP { "1065" } ist gemeinfrei, druckt die Werte aber nicht

# text
# c1: scripts/fetch_phasedat.sh
seg-332b36d2b91f = <c1/>; abgeleitete Stufenleitern committet

# text
seg-dd2ee7a9f1fa = JammerTest-{ "2024" }-Aufzeichnung von GNSS-Jamming/Spoofing ({ "1.4" } GB)

# text
seg-20065daf2305 = Kalibrierung von Resilienz-/Anomalieszenarien

# text
seg-a4410133d410 = GPL-3.0-or-later (die GNU General Public License; Zenodo 10.5281/zenodo.15910563) — Weiterverbreitung erlaubt, aber die <b>Größe überschreitet das Dateilimit von { "100" } MB bei GitHub</b> und das GPL-Copyleft steht im Konflikt mit dem AGPL-Baum (Affero General Public License)

# text
seg-d4c7d2f9ea0d = <b>Abrufgebunden</b>; den DOI (digital object identifier) angeben

# text
seg-c0e39f83efcd = Der Lizenzstatus jedes abrufgebundenen Datensatzes wurde bei der ursprünglichen Autorität recherchiert; die beiden „unklaren“ Uhrendatensätze bleiben gebunden, bis eine ausdrückliche Erlaubnis zur Weiterverbreitung vorliegt (die Werte, die wir veröffentlichen <em>dürfen</em>, committen wir bereits), und der JammerTest-Satz ist trotz seiner offenen Lizenz aus Gründen von Größe/Copyleft gebunden.

# text
seg-e104e19931d4 = { "7" }. Neuere Domänen — woher ihre Parameter stammen

# text
# c1: VERIFICATION-MATRIX.md
seg-c11f7c73d10b = Die seit den obigen Tabellen hinzugekommenen Arten folgen derselben Regel. Jede Zeile nennt die Quelle und den Status der darauf aufbauenden Fähigkeit in der Verifikationsmatrix (<a1><c1/></a1> enthält die vollständige Zeile).

# text
# c1: telecom-timing
seg-5d2c25dd2ff3 = Telecom-Zeitgebung (<c1/>)

# text
seg-c2ae6b1fe666 = Synchronisationsmasken

# text
# c1: TELECOM-TIMING.md
seg-e247606fe749 = Empfehlungen der ITU-T (Telecommunication Standardization Sector der International Telecommunication Union), jede Grenze mit ihrer Tabelle oder Klausel, aufgelistet in <a1><c1/></a1>

# text
seg-1150ab344107 = MODELLED (Transkription)

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-01d31590ca44 = Oszillator-Presets <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: TELECOM-TIMING.md
seg-9a4c0c214c54 = vier Datenblätter von Microchip, Dokumentnummern in <a1><c1/></a1>

# text
seg-a03ea8950ab0 = Schätzer für MTIE (maximaler Zeitintervallfehler) und TDEV (Zeitabweichung)

# text
# c1: tests/fixtures/telecom_timing/
seg-389e18e1a900 = allantools { "2024.06" } auf <c1/>

# text
# c1: solar-system
# c2: body-pnt
seg-29edfc0f6a6d = Sonnensystem (<c1/>, <c2/>)

# text
seg-df22756e5209 = Planetenpositionen aus den Kepler-Elementen von Standish des JPL (Jet Propulsion Laboratory)

# text
# c1: tests/fixtures/solar_system/
seg-194e3a13d51a = geprüft gegen Zustandsvektoren von JPL Horizons DE441 (Development Ephemeris { "441" }) in <c1/>

# text
seg-6d23934b3cb7 = VALIDATED; Uranus, Neptun, Pluto und die Monde MODELLED

# text
seg-a2624ce2e89a = Gravitationsparameter, Radien und Rotation jedes Körpers

# text
seg-4d501821b508 = JPL-Horizons-Körperdatensätze und die Tabelle der physikalischen Parameter von Satelliten des JPL

# text
# c1: constellation-design
seg-f2715a76f0ec = Konstellationsentwurf (<c1/>)

# text
seg-784e471cdada = nominelle Slots von GPS, Galileo und GLONASS

# text
seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5. Ausgabe

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
seg-b5e3dc8605b1 = LEO-PNT (niedrige Erdumlaufbahn) (<c1/>, <c2/>, <c3/>)

# text
seg-0a535468ad51 = benannte Systempresets

# text
seg-aae7fe16f69a = die zitierten öffentlichen Zahlen, jedes Preset mit seiner Quelle

# text
# c1: leo-navmsg
seg-a72c37136e3a = LEO-Navigationsnachricht (<c1/>)

# text
seg-ac50550a250f = Gewichte des Signal-in-Space-Entfernungsfehlers

# text
seg-5dae296d5484 = Montenbruck, Steigenberger und Hauschild ({ "2018" }), <em>Advances in Space Research</em>

# text
seg-9148986e8610 = Ephemeridenmodell mit 22 Parametern

# text
seg-5b82ad0bd2c9 = Liu et al. ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

# text
seg-2080b4fc31a8 = Herkunfts-Fußzeile der Diagramme

# text
# c1: *.chart.svg
# c2: *.report.html
seg-22d0b06d5df4 = Jedes Diagramm, das Kshana rendert — im Browser-Playground, im Export <c1/> der CLI (command-line interface) und im Diagramm im druckbaren Bericht <c2/> (HTML, HyperText Markup Language) —, wird unten rechts versehen mit:

# text
# c1: scenario <hash>
# c2: scenario_hash
# c3: scenario_hash
seg-d8b4de856202 = Das <c1/> sind die ersten { "12" } Hex-Zeichen des <b>Szenario-Hashs</b> des Laufs: ein SHA-256 (SHA: Secure Hash Algorithm) über die <em>kanonische</em> Szenariodefinition (Seed, Schwellen, Modellparameter, GNSS-Fenster und so weiter). Es ist derselbe Fingerabdruck, der in der einzeiligen Zusammenfassung des Laufs und im Feld <c2/> des Ergebnis-JSON erscheint. (Arten, deren Ergebnisdokument kein <c3/> trägt, wie die Integritäts- und Mondberichte, greifen auf ein SHA-256 des Szenario-Quelltexts in TOML (Tom's Obvious, Minimal Language) zurück, sodass jedes Diagramm weiterhin einen stabilen Fingerabdruck hat.)

# text
seg-8d218131da01 = Weil der Hash deterministisch und eingabeempfindlich ist, identifiziert sich ein gespeichertes oder eingefügtes Diagrammbild selbst: Es hält die Engine-Version, das genaue Szenario, das es erzeugt hat (für die bitgenaue Reproduktion), und die Quelle fest — und jeder geänderte Parameter ergibt einen anderen Hash, sodass ein falsch beschriftetes Diagramm erkennbar ist.

# text
seg-89c9b001868f = Zitieren & Reproduzieren

# text
# c1: scenario + seed + engine version
# c2: CITATION.cff
# c3: provenance
seg-6eca19b7978c = Jedes Ergebnis ist aus <c1/> reproduzierbar. Zitieren Sie die Engine über <a1><c2/></a1> / den Zenodo-Konzept-DOI <a2>10.5281/zenodo.20528627</a2> und zitieren Sie die oben genannten <em>Parameter</em>-Quellen für die Kennzahlen, von denen ein gegebener Lauf abhängt — sie reisen in den Feldern <c3/> des Ergebnis-JSON mit, sodass ein veröffentlichtes Ergebnis sich selbst dokumentiert.

# text
seg-c5c58ef3771c = Wo eine Kennzahl ein Weltraumziel auf Bodenhardware ist (jede Zahl einer optischen Strontiumuhr) oder eine Demonstration im Bodenlabor (Kaltatom-Beschleunigungsmesser), sagen dieses Dokument und die Ergebnisherkunft das ausdrücklich. Kshana stellt Labor- oder Zielwerte nicht als geflogene Leistung dar.

# text
seg-925d456df88c = <s1>Zurück</s1>Behauptungen und Wirklichkeit

# text
seg-19e8fefd1ceb = <s1>Weiter</s1>Reproduzierbarkeit
