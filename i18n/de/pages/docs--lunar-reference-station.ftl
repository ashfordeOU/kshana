# docs--lunar-reference-station: translations (de)

# text
seg-f37311ad7ef0 = Ausgaben

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-9872e31ebd72 = Quellen

# text
# c1: docs/LUNAR-REFERENCE-STATION.md
seg-38afa54b0306 = Quelle: <c1/>

# text
seg-22eb5bd00092 = Zweck

# text
seg-25678ae41147 = Öffentliche Unterlagen beschreiben eine Mond-Südpol-Referenzstation, die einen lunaren Navigationsdienst überwacht, lokale Differenzialkorrekturen berechnet, eine Mondzeitreferenz auf einer Atomuhr führt und einen Laser-Retroreflektor sowie einen VLBI-Sender für das Mond-Bezugssystem trägt (die Klasse, die öffentlich für ESAs Konzept NovaMoon beschrieben ist; Quellen unten). Kshana modelliert jedes Teil bereits einzeln. Diese Studie setzt sie zu einer einzigen reproduzierbaren, offenen Analyse zusammen, was eine solche Station unter öffentlichen Annahmen leisten könnte, und registriert sie vorab, damit sie an veröffentlichten Ergebnissen und schließlich an Flugergebnissen bewertet werden kann.

# text
# c1: run_toml
# c2: run_scenario
# c3: kind = "lunar-station-coverage"
seg-6ac04119fc30 = oder <c1/> aus Python, WebAssembly oder <c2/> des MCP-Servers mit <c3/>.

# text
# c1: lunar-station-coverage
seg-671e68d341fd = Abdeckungs- und Genauigkeitskarte (<c1/>)

# text
# c1: lunar-differential-pnt
seg-f034e2642dab = Für eine Differenzial-Referenzstation an einem bekannten Standort am Südpol: an jedem Nutzerpunkt eines Ringgitters von { "80" }° S bis zum Pol und über die Region, über einen Tag von Epochen und Monte-Carlo-Versuche, der Perzentil-Positionsfehler mit und ohne Korrektur (3D, horizontal, vertikal), die Verfügbarkeit mit einem Grund für jede nicht verfügbare Epoche, die Abdeckung gegenüber einem vor dem Lauf angegebenen Schwellenwert, DO-229E-Schutzgrenzen, der Abdeckungsradius je Azimutsektor sowie das Budget der Korrekturverbindung an der Station und am ungünstigsten Punkt. Keine neue Physik: Es durchläuft die getesteten Funktionen von <c1/> und reduziert sich bei einem Punkt, einer Epoche und einem Versuch genau auf diese Art.

# text
seg-94058315dfe4 = Eingabe

# text
seg-7670cf4ceda3 = Standard

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: ephemeris_path
seg-98b42925ad5c = Konstellation (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) oder <c6/>

# text
seg-bfdd053b2611 = der interne Satz der LCNS-Klasse

# text
# c1: station_lat_deg
# c2: station_lon_deg
# c3: station_height_m
seg-6b9d48431e4b = Station (<c1/>, <c2/>, <c3/>)

# text
seg-fcdb2f3ac330 = { "89" }° S, { "0" }°, { "0" } m

# text
seg-f32dcb376b51 = { "0.30" } m

# text
# c1: orbit_err_m
# c2: clock_err_m
# c3: sise_sigma_m
# c4: sise_orbit_variance_fraction
seg-59286c0377ce = <c1/>, <c2/> oder <c3/> mit <c4/>

# text
seg-fe90a6f490f9 = { "100" } m, { "30" } m (Sichtlinien-SISE { "65" } m)

# text
seg-970357ba3630 = { "0" } m, { "10" } s, { "8" } Bit

# text
# c1: grid_lat_max_deg
# c2: grid_lat_step_deg
# c3: points
seg-311a924e2133 = Gitter (<c1/>, <c2/>) oder <c3/>

# text
seg-49a2022b83c0 = { "80" }° S, { "1" }° ({ "346" } Punkte)

# text
seg-e945f5407b12 = die Studienregion

# text
# c1: t_start_s
# c2: t_span_s
# c3: t_step_s
# c4: n_trials
seg-fed48a6c31be = Zeit (<c1/>, <c2/>, <c3/>), <c4/>

# text
seg-0fec404c8c7c = { "0" } s, ein Tag, { "600" } s, { "200" }

# text
seg-d35d88b0753b = { "20" } m bei p95 im mitgelieferten Standard ({ "1" } m im Beispiel mit öffentlichen Quellen)

# text
seg-a6ee5e2a8b61 = { "10" } m

# text
seg-422a316b806b = { "5" } m, { "1e-4" }, { "42" }

# text
# c1: units
# c2: tests/field_units_global.rs
# c3: availability
# c4: coverage_fraction
# c5: corrected_p_3d_m
# c6: corrected_p_h_m
# c7: corrected_p_v_m
# c8: uncorrected_p_3d_m
# c9: improvement_factor
# c10: hpl_max_m
# c11: vpl_max_m
# c12: hpl_below_alert_fraction
# c13: worst_point
# c14: coverage_radius_km
# c15: points[]
# c16: budget_at_station_and_at_edge
seg-c530b459b0ef = Jedes numerische Feld trägt eine Einheit und eine Herkunftsklasse im <c1/>-Block des Ergebnisses (geprüft durch <c2/>). Der Regionsblock: <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>; <c14/> je { "30" }°-Azimutsektor; <c15/> je Punkt; und <c16/>.

# text
seg-4aa380258574 = Was die Prüfungen aussagen können und was nicht

# text
# c1: tests/lunar_station_coverage_reference.rs
# c2: lunar-differential-pnt
seg-112cb6bffc03 = <c1/>: die Reduktion auf <c2/>, die Nullbasislinien- und Vermessungs-Untergrenzen, Monotonie, Gründe für Nichtverfügbarkeit, Determinismus, die Arbeitsbegrenzung. Diese zeigen, dass der Durchlauf das Modell ist, das er zu durchlaufen vorgibt.

# text
# c1: tests/lunar_station_numpy_oracle.rs
# c2: tests/fixtures/lunar_station/PREREGISTRATION.md
seg-695ed4f23f3c = <c1/>: eine unabhängige numpy-Neuberechnung der Arithmetik an exportierten Fällen, vor ihrem Lauf vorregistriert. Positionen und Perzentile erreichten ihre Zielwerte; die Stationskorrekturen verfehlten ihre durch Rundung in doppelter Genauigkeit (festgehalten, mit ihren Zahlen, in <c2/>).

# text
seg-d6f194e28401 = Geländehorizont-Masken

# text
# c1: [terrain]
# c2: src/lunar_terrain.rs
# c3: [azimuth_deg, elevation_deg]
# c4: mask_deg
# c5: unavailable.terrain_masked
# c6: user_lt4
seg-9ad9b163a3a0 = MODELLED. Ein optionaler Abschnitt <c1/> (<c2/>) gibt der Station und jedem Nutzerpunkt einen eigenen azimutabhängigen Horizont, im { "0.36" }-Skyline-Tabellenformat (Zeilen <c3/>, linear im Azimut mit Umbruch bei { "360" }°). Ein Satellit zählt an einem Standort, wenn er sowohl <c4/> als auch den Horizont in seinem Azimut überschreitet; eine Epoche, in der der Horizont an einem Punkt weniger als vier Satelliten übrig lässt, wo die flache Maske vier ergibt, wird als <c5/> gemeldet (<c6/> behält seine flache Bedeutung). Zwei Quellen, bei Angabe beider als punktweises Maximum kombiniert:

# text
# c1: station_horizon
# c2: user_horizon
# c3: source
seg-4d55808bc002 = ein angegebenes Profil, <c1/> oder <c2/> (an jedem Nutzerpunkt angewendet), jeweils mit einer erforderlichen Kennzeichnung <c3/>;

# text
# c1: dem_path
# c2: azimuth_step_deg
# c3: max_range_km
# c4: LDEM_75S_240M
# c5: data/lunar-dem/NOTICE.md
seg-d6fda9939caa = ein Horizont, per Ray-Marching über ein polares DEM (<c1/>) gewonnen: Großkreise der Mondkugel mit exakter Krümmung, von einer angegebenen Masthöhe (Standard { "2" } m), alle <c2/> (Standard { "1" }°), bis <c3/> (Standard { "150" } km) oder zum Gitterrand. Das Repository bindet einen Ausschnitt des gemeinfreien polaren LRO-LOLA-Produkts <c4/> ein, { "5" } × { "5" } blockmittelwert-neuabgetastet auf { "1200" } m und etwa ±{ "420" } km vom Pol (<c5/>: Quell-URL, SHA-256, Lizenz, Schritte für Ausschnitt und Neuabtastung);

# text
# c1: dem_path
# c2: dem_tile_path
# c3: realdata::lola_dem
# c4: lat_min lat_max lon_min lon_max n_lat n_lon
# c5: terrain.dem_tile
# c6: tests/lunar_station_terrain.rs
seg-292c49f3739a = oder, anstelle von <c1/>, eine DEM-Kachel nach Breite und Länge (<c2/>) im Textformat <c3/> (ein Kopf <c4/>, dann die Höhen in Metern über der mittleren Kugel, zeilenweise), auf dieselbe Weise per Ray-Marching ausgewertet, wobei der Breitenabstand die Standardschrittweite bestimmt. Der Bericht gibt Pfad, SHA-256 und Ausdehnung der Kachel wieder (<c5/>). Eine aus dem eingebundenen Ausschnitt neuabgetastete Kachel gibt der Station den eigenen Horizont des Ausschnitts bis auf { "0.22" }° (<c6/>). Es wird keine Kachel eingebunden.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: user_horizon
# c4: dem_path
seg-34ed85bb9ac0 = Dieselben Masken gelten für das Gitter <c1/> (<c2/>, <c3/> und <c4/>; ein Gitterpunkt außerhalb des DEM behält die flache Maske und wird gezählt). Ohne den Abschnitt ist jedes Dokument byteidentisch mit einem Lauf ohne ihn.

# text
# c1: tests/fixtures/lunar_terrain/PREREGISTRATION.md
seg-8d07f0227ab8 = Prüfungen: Das Ray-Marching reproduziert geschlossene Horizonte (die Absenkung der nackten Kugel, ein Krater in einem Plateau vom Zentrum aus und abseits davon, ein gerasterter Kegel gegenüber dem analytischen Kegel); der eingebundene Ausschnitt ist wie die Quelle ausgerichtet (Shackleton- und Haworth-Böden tief, das Malapert-Massiv hoch); ein unabhängiger numpy-Ray-Cast auf dem Ausschnitt, vorregistriert (<c1/>), stimmt an fünf Standorten auf { "5.5e-10" } Grad überein, was die Arithmetik prüft, nicht das Gelände. Es wurde keine veröffentlichte Horizont- oder Beleuchtungszahl für den Pol reproduziert, daher bleibt die Zeile MODELLED (Register-Zeile "Lunar terrain horizon masks from a stated profile or a polar DEM").

# text
# c1: scenarios/lunar-station-coverage-terrain.toml
seg-10a1d62ab5cc = <c1/> lässt die mitgelieferten Eingaben auf einem { "2" }°-Gitter mit { "100" } Versuchen und dem DEM-Horizont an jedem Standort laufen. Der Stationsstandort ({ "89" }° S, { "0" }° E) hat einen höchsten Horizont von etwa { "4.0" }°, unterhalb der { "5" }°-Maske, sodass das Gelände an der Station nicht bindet; an den Nutzerpunkten beträgt der flächengewichtete Mittelwert des höchsten Horizonts jedes Punkts { "9.7" }° und der größte { "26.3" }°. Gegenüber denselben Eingaben mit der flachen Maske steigt der korrigierte p95-3D-Fehler der Region von { "16.3" } m auf { "18.6" } m und die größte HPL von { "480" } m auf { "62" } km. Die Verfügbarkeit der Region steigt von { "91.9" } % auf { "93.0" } %: Eine Epoche ist nicht verfügbar, wenn ein Punkt einen Satelliten verwendet, den die Station nicht sieht, und ein Horizont, der diesen Satelliten vor dem Punkt verbirgt, kann die Epoche verfügbar machen.

# text
# c1: moonlight-service-volume
# c2: terrain
# c3: clears_terrain
# c4: export_site_terrain
seg-6d18d8a8dc78 = <b>Gelände und Horizontmaskierung: in { "0.36" } behandelt, mit Grenzen.</b> Horizontmasken je Standort aus einem angegebenen Profil oder dem eingebundenen LOLA-DEM-Ausschnitt sind modelliert (oben). Was bleibt: Der eingebundene Ausschnitt hat { "1200" } m je Pixel, sodass Relief unterhalb von etwa einem Kilometer geglättet wird und Blockmittelwerte scharfe Gipfel senken; ein Strahl, der den Ausschnitt verlässt (etwa { "420" } km vom Pol), endet dort; es gibt keine Beugung, keinen Gelände-Mehrwegeempfang und keine teilweise Verdeckung; Standortpositionen für die Entfernungsmessung bleiben auf der mittleren Kugel bei den angegebenen Höhen (das DEM legt nur den Horizont fest); der Horizont ist nicht gegen eine externe Zahl validiert. Der Export-Standort je Satellit von <c1/> wird wie ein Gitterpunkt maskiert: Mit einem Abschnitt <c2/> trägt jede Exportzeile <c3/> und der Bericht den Horizont des Standorts (<c4/>); die Antennen-In-Beam-Zählungen zählen weiterhin jede Verbindung, die die flache Maske überschreitet.

# text
seg-677252c2d3e5 = Wachstum des Ephemeridenfehlers über die Latenz: in { "0.36" } als Opt-in behandelt, mit Grenzen.

# text
seg-4f8274f839a7 = Vergleich mit veröffentlichten Behauptungen

# text
seg-82391b00e1bc = MODELLED. Ein Vergleich dieses Modells, unter den öffentlichen Annahmen ausgeführt, mit den Behauptungen der Quellen. Es ist keine Aussage über die Leistung eines realen Systems.

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-fc27b4012f02 = Quellen S1 bis S5 (Titel, URL, Abrufdatum, SHA-256, Lizenz): <c1/>.

# text
# c1: tests/fixtures/lunar_station_published/CLAIMS.md
seg-d866653008e1 = Jede numerische Behauptung, mit ihrer Seite und den angegebenen Annahmen zitiert und als vergleichbar, teilweise vergleichbar oder nicht vergleichbar eingestuft: <c1/>. Keine Behauptung ist vollständig vergleichbar, weil keine Quelle ein Perzentil oder die Bahnelemente der Satelliten angibt.

# text
# c1: tests/fixtures/lunar_station_published/PREREGISTRATION.md
# c2: tests/lunar_station_published_oracle.rs
seg-50535c58d3cf = Zielwerte, Fälle und Eingaben, vor dem Lauf allein eingecheckt (Revision { "2" }, 05bf9a19), und der aufgezeichnete Lauf: <c1/>. Der Befund ist in <c2/> festgeschrieben.

# text
seg-069a652c402e = Zielwert

# text
seg-d6120708c062 = Behauptung (Quellen)

# text
seg-5b480535b54b = dieses Modell

# text
seg-6231a005ccc9 = Urteil

# text
seg-45dc6ff5d546 = eine Station liefert Submeter-Genauigkeit über den gesamten Kreis von { "300" } km um den Südpol (S1, S2, S3)

# text
seg-4da98cf6180b = Abdeckung { "0.00" }

# text
seg-70a79ec95bf4 = nicht bestanden

# text
seg-cd0e9021aaa3 = dasselbe, Kreis von { "600" } km (S2 S. 10, S3 S. 23)

# text
seg-ef9f2ee31c52 = Submeter mit Codekorrekturen (S1, S2)

# text
seg-9f4e2b6991e8 = korrigiert p95 3D { "280.6" } m

# text
seg-ac3c99ec0d15 = <= { "1.5" } m

# text
seg-1b720f1677cc = "Dezimeterniveau" aus Pseudorange-Korrekturen (S3 S. 22, S5 S. 5)

# text
seg-ffa1c831a14f = { "280.6" } m

# text
seg-70368d910820 = <= { "0.15" } m

# text
seg-786f940b345e = nicht bestanden (konnte beim Coderauschen von { "0.30" } m der Quellen nicht bestehen)

# text
seg-da761dde1cae = Submeter bleibt bei einer Latenz von { "600" } s erhalten (S2 S. 16)

# text
seg-2a9db96bd87f = { "293.0" } m

# text
seg-021336eb5623 = dieselbe Genauigkeit bei einer Basislinie von { "10" } km bis { "500" } km (S2 S. 17)

# text
seg-62190343777c = Verhältnis { "1.39" }

# text
seg-7a33a168b020 = bestanden

# text
seg-1da5fcf7bbf5 = Vorregistrierte Vorhersage

# text
seg-e6aef34d5023 = Zeitlabor der Station

# text
# c1: [time_lab]
# c2: lunar-time-budget
# c3: scenarios/lunar-station-time-lab.toml
# c4: docs/lunar-station/time-lab.md
seg-4ef12bffa7c4 = Ob das miniRAFS der Station, auf LTC gesteuert und dann freilaufend oder neu gesteuert, innerhalb von { "1" }, { "10" } und { "100" } ns bleibt: der optionale Block <c1/> von <c2/> (<c3/>). Das miniRAFS erreicht { "1" } ns nach { "2.8" } s, { "10" } ns nach { "377" } s und { "100" } ns nach { "10.5" } h; das Ziel der Quelle im Nanosekundenbereich wird zitiert, nicht übernommen. MODELLED. Modell, Ausgaben, die Tabelle der Zeit bis zum Schwellenwert für vier Uhrenklassen und der Vergleich mit den Quellen: <a1><c4/></a1>.

# text
seg-69ddf7ea8fcb = Stationsgeodäsie

# text
# c1: tests/fixtures/lunar_station/SOURCES.md
seg-8a873848459b = Jede Quelle nach Titel, Kennung und Herausgeber, mit Abrufdatum und Lizenz. URLs, SHA-256-Hashes und Hinweise, wo die Quellen voneinander abweichen, stehen im Register, <a1><c1/></a1>. Es wird keine Quelldatei weiterverbreitet. Personennamen sind absichtlich weggelassen.

# text
seg-b1f1e1efa042 = ID

# text
seg-02071a726f21 = Titel

# text
seg-0634af374469 = Kennung

# text
seg-fd875b5fb817 = Herausgeber

# text
seg-a6f8ef268fcc = abgerufen

# text
seg-d04709ddc97d = Lizenz

# text
seg-1d4174e911c1 = Whitepaper zu einer Mond-Referenzstation für Positionierung, Zeitgebung und Wissenschaft, Version { "3" }

# text
seg-e09e1cc11921 = arXiv (Whitepaper der Autoren)

# text
seg-c91720d34bd3 = arXiv non-exclusive licence to distribute { "1.0" } (gewährt nur arXiv)

# text
seg-df12c861db1e = "Lunar local Differential PNT and Selenodetic Reference Station" ({ "27" } Folien)

# text
seg-03f689a0ba49 = ioag.org/meetings/cislunar, Abschnitt { "6" }, Punkt { "07" }

# text
seg-406990fe43a8 = ICG-IOAG Workshop on Cislunar PNT, Februar { "2025" }; Folien der Europäischen Weltraumorganisation

# text
seg-58579c3faf2f = keine angegeben; ab Folie { "3" } als für die Öffentlichkeit freigegeben gekennzeichnet

# text
seg-57df0ef791e6 = "Moonlight: LCNS, and Lunar Pathfinder" ({ "28" } Folien)

# text
# c1: LunarPNT_Jun24_01_04.pdf
seg-7e18a15e0d16 = unoosa.org, <c1/>

# text
seg-23aee49b1347 = UNOOSA, ICG Joint Working Group Session on Lunar PNT, Juni { "2024" }; Folien der Europäischen Weltraumorganisation

# text
seg-f4e53e44f0b5 = keine angegeben; als für die Öffentlichkeit freigegeben gekennzeichnet

# text
seg-b22a694c481d = "Moonlight Programme Development Status" ({ "16" } Folien)

# text
seg-3fd0ab93507d = 2nd ICG-IOAG Cislunar PNT Workshop, Februar { "2026" }; Folien der Europäischen Weltraumorganisation und von Telespazio

# text
seg-472771298df7 = "Lunar Reference Time: ESA's Views" ({ "9" } Folien)

# text
seg-6229db9cb23d = Workshop on Cislunar PNT, Februar { "2026" }; Folien der Europäischen Weltraumorganisation

# text
# c1: LUNAR_SIGMA_URE_M
seg-6b626a2abd0f = LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS) V1.0 und das interne <c1/>

# text
# c1: lunar_afs
seg-4e07c500e353 = wie mit <c1/> festgehalten

# text
seg-28f8d886c4e5 = bereits im Baum

# text
seg-2006c194fef6 = wie dort festgehalten

# text
seg-68db6a17b4e7 = <s1>Zurück</s1>Sonnensystem und andere Körper

# text
seg-79d53edd2374 = <s1>Weiter</s1>Navigation für Raumnutzer (gnss-ssv)

# text
seg-9c59637f0666 = Abdeckungs- und Genauigkeitskarte (lunar-station-coverage)

# text
seg-329ad585cd9b = ILLUSTRATIV: Es existiert kein öffentlicher Wert

# text
seg-389db26524b4 = ILLUSTRATIV im mitgelieferten Standard; das Beispiel mit öffentlichen Quellen setzt vier Satelliten und die Periode von { "24" } h aus S2 und S4, wobei der Elementesatz ILLUSTRATIV bleibt (keine Quelle gibt ihn an)

# text
# c1: orbit_err_growth_m_per_s
# c2: rate x latency / sqrt(3)
# c3: tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md
seg-3af08edab1cc = <c1/> fügt dem Bahnfehler der Rundsendung ein lineares Wachstum mit dem Alter hinzu (Entfernung 1-Sigma <c2/>), zusätzlich zur Reprojektion des eingefrorenen Fehlers; lineares Wachstum ist der Term erster Ordnung eines propagierten Zustandsfehlers (bei { "600" } s auf { "1" } % gegen die interne Zweikörperpropagation geprüft). Was bleibt: Keine öffentliche Quelle gibt eine Mond-Wachstumsrate an (ILLUSTRATIV); keine Struktur in Flugrichtung/radial; der Budgetblock der Korrekturverbindung verwendet das eingefrorene Modell. Der K5-Nachtrag (<c3/>, allein vorregistriert) lässt K5 bei { "0.001" }, { "0.01" } und { "0.1" } m/s laufen: Er schlägt in jedem Fall fehl ({ "369.8" } m, { "2315" } m, { "22797" } m gegenüber einem Zielwert von { "1.5" } m), wie vor dem Lauf angegeben.

# text
# c1: c05dac1d
# c2: docs/predictions/lunar-reference-station.md
# c3: tests/prediction_frozen.rs
seg-4ea806a57380 = Eine vorregistrierte Vorhersage, eingefroren bei Commit <c1/> auf den Eingaben der öffentlichen Quellen, mit ihrem Bewertungsprotokoll: <a1><c2/></a1>. Sie ist eine Vorhersage, keine Validierung, und jede Zahl darin wird vom unveröffentlichten Elementesatz der Konstellation aus vier Satelliten dominiert (die verwendeten Elemente sind ILLUSTRATIV): über die Region ab { "80" } Grad S Verfügbarkeit { "8.2" } %, korrigiert p95 3D { "280" } m, unkorrigiert { "3.8" } km. MODELLED; <c3/> schlägt fehl, wenn sich ein eingefrorenes Byte bewegt.

# text
# c1: [solution]
# c2: src/lunar_solution.rs
# c3: trace_case
# c4: tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md
seg-5bba9be34cad = <b>Lösungsstil (Filter, Höhenbedingung, drei Satelliten): ein Opt-in in { "0.36" }, mit Grenzen.</b> Ein Abschnitt <c1/> (<c2/>) fügt eine Höhen-Pseudomessung, damit ein Minimum von drei Satelliten und ein gewichtetes Kleinste-Quadrate-Fenster für statische Nutzer über Epochen (eine gemeinsame Position, eine Uhr je Epoche) hinzu, das an die Stelle eines Filters tritt. Was bleibt: Es behandelt die Fehler der Epochen als unabhängig und mittelt daher schneller herunter als zeitlich korrelierte Fehler es täten; es gilt nur für statische Nutzer; es gibt keinen dynamischen Filter, keine Trägerphase und keine Auflösung der Mehrdeutigkeit; die Fallspur (<c3/>) zeigt die Momentaufnahme-Arithmetik. Der Nachtrag zu veröffentlichten Behauptungen mit diesem Modus ist <c4/> (allein vorregistriert). Mit einer Höhenbedingung von { "1" } m, drei Satelliten und einem Fenster von 6 Epochen (ILLUSTRATIVE Einstellungen) sinkt der korrigierte p95-3D-Fehler von R300 von { "280.6" } m auf { "2.11" } m (horizontal { "0.90" } m, nicht bewertet); K1 bis K5 schlagen weiterhin fehl und K6 besteht, { "1" } von { "6" } wie im aufgezeichneten Lauf. Die Unabhängigkeitsannahme des Fensters begünstigt es.

# text
# c1: extra_reflectors
# c2: extra_beacons
# c3: lunar-llr-datum
# c4: scenarios/lunar-station-geodesy-baseline.toml
# c5: -with-station.toml
# c6: docs/lunar-station/geodesy.md
seg-717a5c91387b = Wie stark ein Retroreflektor und ein VLBI-Funkfeuer am Stationsstandort das Mond-Bezugsdatum über die fünf archivierten Retroreflektor-Anordnungen hinaus verengen: die optionalen Eingaben <c1/> und <c2/> von <c3/> (<c4/> und <c5/>). Cramér-Rao-Schranken für einen reduzierten Parametersatz auf einem ILLUSTRATIVEN Zeitplan und Standort: Das 1-Sigma der Translationsnorm sinkt von { "0.0185" } m auf { "0.0102" } m (Verhältnis { "0.551" }), der Maßstab von { "0.00178" } auf { "0.00063" } ppm. MODELLED. Methode, Vorbehalte (ein Standort am Südpol sieht die Erde tief oder gar nicht) und die vollständige Helmert-Tabelle: <a1><c6/></a1>.

# text
seg-91231bdcc599 = ILLUSTRATIV

# text
seg-93d78578585f = ILLUSTRATIV (die interne Zuteilung der Systemrealisierung, selbst MODELLED)

# text
# c1: sise_sigma_m
seg-9a432ef35cac = ILLUSTRATIV im mitgelieferten Standard; das Beispiel mit öffentlichen Quellen setzt <c1/> = { "10" } / { "1.96" } m aus S4 S. 8

# text
# c1: [receiver]
# c2: src/lunar_receiver.rs
# c3: a + b exp(-el / el0)
seg-b58b3ff1ef20 = <b>Mehrwegeempfang und Empfängerhardware: in { "0.36" } als Opt-in behandelt, mit Grenzen.</b> Ein Abschnitt <c1/> (<c2/>) fügt am Nutzer und an der Station elevationsabhängigen Mehrwegeempfang <c3/> hinzu (die Funktionsform von DO-229; auf dem Mond ist jeder Wert ILLUSTRATIV), wobei der Mehrwegeempfang der Station optional ein Gauß-Markov-Prozess erster Ordnung über die Epochen ist, dazu Early-minus-Late-DLL-Coderauschen aus C/N0 und kanalweise Zwischenkanal-Biases. Was bleibt: Variationen von Antennenphasenzentrum und Gruppenlaufzeit sind nicht modelliert; keine Mondmessung legt die Mehrwegewerte fest; der Budgetblock der Korrekturverbindung enthält die Empfängerterme nicht.

# text
seg-be6ecf79d22c = Keine von beiden prüft das Modell. Das Fehlermodell, die Dekorrelation erster Ordnung, die Modelle für Vermessung, Alterung und Quantisierung und jeder Schwellenwert sind die eigenen dieses Projekts oder ILLUSTRATIV.

# text
seg-e666f1eb7a59 = { "1" } von { "6" } Zielwerten wird bestanden. Die Ursache ist die Geometrie. Keine Quelle veröffentlicht die Bahnelemente der Konstellation. Mit den internen ILLUSTRATIVEN Elementen teilen sich ein Nutzer und die Station vier Satelliten oberhalb von { "5" } Grad nur in { "8" } % ({ "300" } km) und { "6" } % ({ "600" } km) der Epochen, bei nahezu singulärer Geometrie: Das unkorrigierte p95 beträgt { "3.8" } km, wo die Quellen < { "10" } m nennen. Die eigenen Simulationen der Quellen verwendeten einen Filter, eine Höhenbedingung und drei Satelliten in gemeinsamer Sicht, die dieses Momentaufnahme-Modell nicht hat. Der Lauf reproduziert die Behauptungen auf diesen Elementen daher nicht, und er ist kein Beleg dafür, dass die Behauptungen falsch sind. Das Bestehen von K6 ist ein Verhältnis zweier von der Geometrie dominierter Zahlen und sagt nichts über die Dekorrelation aus. Ein veröffentlichter Satz der Elemente der Konstellation würde unter denselben Zielwerten als zweiter, datierter Lauf bewertet.

# text
seg-e8ee3794bac6 = <b>MODELLED.</b> Unter den angegebenen Annahmen (die Konstellation, ihr Signal-in-Space-Fehler, die Vermessungsgenauigkeit der Station, die Korrekturlatenz und die Quantisierung der Verbindung, jeweils eine Eingabe, die mit ihrer öffentlichen Quelle oder als ILLUSTRATIV gekennzeichnet ist) liefert das Modell die unten stehenden Werte. Sie sind <b>keine</b> Aussage über die Leistung eines realen Systems. Kshana ist <b>nicht</b> mit einer Behörde verbunden und von keiner unterstützt und erhebt keinen TRL- oder Heritage-Anspruch. Nur beratend.

# text
seg-fa7858b14f89 = vor dem Lauf angegeben; { "20" } m ist ILLUSTRATIV, bemessen nach den illustrativen Fehlern des Standards
