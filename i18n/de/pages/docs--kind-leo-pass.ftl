# docs--kind-leo-pass: translations (de)

# text
seg-ad20a7bebf23 = STL

# text
seg-37d16b499bc5 = dB

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Szenario-Kind der Engine v{ $version }, Familie <a1>Low-Earth-orbit navigation</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
seg-c5478f572d21 = Familienseite: <a1>Low-Earth-orbit navigation</a1>

# text
# c1: docs/kinds/by-kind/leo-pass.md
seg-fad0b45fd9c2 = Quelle: <c1/>

# text
# c1: leo-pass
seg-f0433f09f033 = <c1/> (Szenario-Kind)

# text
# c1: scenarios/leo-pass-iridium.toml
seg-04509d8245b7 = Ein Lauf von <c1/> fasst sich so zusammen: LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

# text
# c1: epoch
# c2: duration_s
# c3: step_s
# c4: user
# c5: atmosphere
# c6: ionosphere
# c7: satellite
# c8: leo_constellation
# c9: gnss
# c10: iono_free_pairs
# c11: iot
# c12: spoofer
# c13: name
# c14: description
# c15: skyline
seg-e6f4e5c502d7 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/leo-pass-iridium.toml
seg-e12426a79a2f = Das Beispiel <c1/> setzt unter anderem:

# text
seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

# text
seg-7cd17bf1ac74 = Iridium STL von einem Flugzeug aus

# text
seg-f4d857403ae0 = descending

# text
# c1: scenarios/
seg-08bc462d676c = { "8" } mitgelieferte Szenarien verwenden dieses Kind; die übrigen stehen in <a1><c1/></a1>.

# text
seg-ee6d9e6d9556 = Ergebnisbezeichnung (der Engine): MODELLED: Geometrie des LEO-Überflugs und Link-Budget je Band aus angegebenen EIRPs und idealisierten Antennenmustern mit ITU-R-Ausbreitungstermen; die Komponentenmodelle tragen in der Verifikationsmatrix ihre eigenen Bezeichnungen. Keine Messung irgendeines Satelliten.

# attr:alt
seg-02ae51cfada6 = Das Diagramm, das die Engine für scenarios/leo-pass-iridium.toml schreibt, Kind leo-pass

# text
seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die dieses Kind nennen.

# text
seg-69ed19957592 = <b>VALIDATED</b> ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 Gleichungen ({ "1" }) bis ({ "5" }): k_H, alpha_H, k_V, alpha_V aus den Kurvenanpassungen der Tabellen { "1" } bis { "4" }, die pfad- und polarisationsabhängigen (k, alpha) und die spezifische Dämpfung Tests: <a1>leo_link_reference.rs</a1>.

# text
seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 Abschnitt { "2.2.1.1" } Schritte { "2" } bis { "10" } (schräger und horizontaler Pfad unterhalb der Regenhöhe, Faktoren für horizontale Reduktion und vertikale Anpassung, A0.01 und seine Skalierung auf { "0.001" } % bis { "5" } % eines durchschnittlichen Jahres), mit der Regenhöhe (P.839) a Tests: <a1>leo_link_reference.rs</a1>.

# text
seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 Abschnitt { "2.4.1" } Schritte { "3" } bis { "9" } (Referenz-Sigma aus N_wet, effektive Weglänge, Antennenmittelungsfaktor, Schwundtiefe für { "0.01" } % bis { "50" } % der Zeit), wobei N_wet eine Eingabe ist oder aus Temperatur, Luftfeuchte und Druck berechnet wird durch t Tests: <a1>leo_link_reference.rs</a1>.

# text
seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 Anhang { "1" } Gleichungen ({ "1" }) bis ({ "10" }) mit Tabelle { "1" }: die Dämpfung, die mit der Wahrscheinlichkeit P nicht überschritten wird, für traditionelle und thermisch effiziente Gebäude bei der Elevation des Pfads an der Fassade, { "80" } MHz bis { "100" } GHz; angewandt je Band und Epoche Tests: <a1>leo_link_reference.rs</a1>.

# text
seg-ac1927b760d5 = und { "8" } weitere in der Matrix.

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 Abschnitt { "2.4.1" } Schritte { "3" } bis { "9" } (Referenz-Sigma aus N_wet, effektive Weglänge, Antennenmittelungsfaktor, Schwundtiefe für { "0.01" } % bis { "50" } % der Zei. Orakel (ExternalDataset): Validierungsbeispiele der ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) für die Szintillation nach P.618-14, wobei das N_wet nach P.453-14 jedes Standorts aus denselben Beispielen stammt; eingecheckt in tests/fixtures/leo_link/p618_14_scintillation.csv mit den URLs und dem Abrufdatum. Der Ausdruck für die feuchte Refraktivität aus Temperatur und Feuchte wird von dieser Zeile nicht abgedeckt

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Gruppenlaufzeit { "40.3" } STEC/f^{ "2" } je Band; die ionosphärenfreien Koeffizienten f1^2/(f1^{ "2" } - f2^{ "2" }) und -f2^2/(f1^{ "2" } - f2^{ "2" }) und die Rauschverstärkung sqrt(a1^{ "2" } s1^{ "2" } + a2^. Orakel (ExternalDataset): IS-GPS-200 Abschnitt { "20.3.3.3.3.2" }, der das L1/L2-Gruppenlaufzeitverhältnis gamma = (77/60)^{ "2" } nennt, das aus der Skalierung erster Ordnung mit 1/f^{ "2" } folgt, und die Friis-Übertragungsformel (Proc. IRE, { "1946" }). Validiert die Skalierungsgesetze, kein schräger TEC

# text
seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: eine Suche über jede Bahnposition und jeden Nutzer am Horizont des Satelliten auf einer Kreisbahn, wobei die Erde. Orakel (ExternalDataset): Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabelle { "1" } (ruhender Empfänger auf einer Kugel von { "6371" } km, Erdrotation als einziger weiterer Effekt): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz auf L1. Deckt kreisförmige Zweikörperbahnen ab

# text
# c1: leo-pass
seg-b952b2928bbe = <b>MODELLED</b> Das Kind <c1/>: Satelliten aus einem entworfenen Überflug, Elementen, einem TLE über SGP4 oder einer Walker-Konstellation aus constellation-design; je Band und Epoche die. Orakel (InternalConsistency): Geschlossene Formen und Selbstkonsistenz: die Identitäten von Entfernungsrate und Entfernungsbeschleunigung gegen numerische Ableitungen, der Isoflux-Gewinn, der das Entfernungswachstum aufhebt, die Lehrbuchgrenzwerte des Polarisationsverlusts, die qualitative Beobachtung LEO gegenüber GNSS (ein glockenförmiger Überflug von Minuten, der einige dB über flachen GNSS-Trägern mit 44-51 dB-Hz gipfelt). Die EIRPs und Muster sind veröffentlichte Empfangsleistungen, umgerechnet in eine EIRP oder repräsentativ

# text
# c1: label
seg-65a0444ca451 = MODELLED: Geometrie des LEO-Überflugs und Link-Budget je Band aus angegebenen EIRPs und idealisierten Antennenmustern mit ITU-R-Ausbreitungstermen; die Komponentenmodelle tragen in der Verifikationsmatrix ihre eigenen Bezeichnungen. Keine Messung irgendeines Satelliten. (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-8b3ffb30c23c = Ein optionaler Abschnitt [iot] gibt Zeit bis zum ersten Fix, Energie je Fix und Batterielebensdauer gegen das Tastverhältnis für ein angegebenes Leistungsbudget des Empfängers an (MODELLED). (Kind-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-597be3a6eb96 = Ein optionaler Abschnitt [spoofer] fälscht die Signale einer behaupteten Position, die nach einem Einsatzzeitpunkt von der wahren abspringt oder weggedrückt wird, und betreibt zwei Monitore mit angegebenen Wahrscheinlichkeiten für Fehlalarm und Nichterkennung: Konsistenz von Doppler und Überfluggeometrie (gemessene Entfernungsraten gegen die aus den Bahnen und einer unabhängigen vorherigen Position und Geschwindigkeit vorhergesagten, ein verallgemeinerter Chi-Quadrat-Test nach kleinsten Quadraten über ein Fens (Kind-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-dbcc7b9c9b9b = MODELLED: EIRPs, Muster, der Chapman-Anteil des TEC unterhalb des Satelliten und der gesamte Überflug. (Kind-Katalog (<c1/>))

# text
seg-e675c999f303 = MODELLED. Die Spot-Beams, der Burst-Zeitplan und die STL-Wellenform werden nicht modelliert. (Kommentar in der Szenariodatei, Zeile { "14" })

# text
seg-c3665ac09bf6 = Ein LEO-PNT-Überflug und sein Link-Budget je Band gegenüber den sichtbaren MEO-GNSS-Satelliten ist MODELLED, nicht validiert: Er wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ab0fc0d88556 = Benannte LEO-PNT-Systemvoreinstellungen mit angegebenen Quellen und eine systemunabhängige Engine sind MODELLED, nicht validiert: Sie werden gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ae15d15bf151 = Themenseite: <a1>LEO-PASS.md</a1>

# text
seg-3ddcc0ea097f = <s1>Zurück</s1>leo-navmsg

# text
seg-7c0d4c0f536d = <s1>Weiter</s1>leo-pnt-chain

# text
seg-c3861f7d717c = LEO-Überflug und Link-Budget, Band für Band, für LEO-PNT (Positionierung, Navigation und Zeitgebung aus dem niedrigen Erdorbit), systemunabhängig: ein Nutzer (am Boden, auf See, in der Luft oder in Gebäuden, ruhend oder bewegt) und ein oder mehrere LEO-Satelliten aus einem DESIGNED PASS (eine Kreisbahn, so gelegt, dass der Nutzer zu einer gewählten Zeit einen Überflug mit einer gewählten maximalen Elevation sieht, auf Wunsch sonnensynchron), expliziten ELEMENTS, einem TLE (Zwei-Zeilen-Elementsatz) über das SGP4 der Engine oder einer WALKER-Konstellation, aufgebaut vom Code für den Konstellationsentwurf (die höchsten Überflüge werden berichtet). Bänder stammen aus einer benannten Voreinstellung (generisches Multiband UHF/L/S/C, generisches C-Band, Xona Pulsar X1/X5, Iridium STL, Starlink als reines Doppler-Gelegenheitssignal, CentiSpace und eine optionale Celeste-IOD-Voreinstellung mit der Kennzeichnung WORKSHOP) oder werden im Szenario selbst angegeben; jede Voreinstellung gibt an, ob ihre Zahlen PUBLIC (mit URL), REPRESENTATIVE oder WORKSHOP sind. Je Satellit, Band und Epoche: Elevation, Azimut, Entfernung, Entfernungsrate und Entfernungsbeschleunigung; Freiraumdämpfung; EIRP und der Antennengewinn des Satelliten (isoflux, Gauß-Keule oder flach); Antennengewinn des Nutzers über der Elevation (Patch, halbkugelförmig oder isotrop); Gasdämpfung (ITU-R P.676-10 Anhang { "2" }), Regendämpfung (Koeffizienten nach ITU-R P.838-3 und das Verfahren nach P.618-14, aus Regenrate und Regenhöhe), troposphärische Szintillation (ITU-R P.618-14 Abschnitt { "2.4.1" }), Gebäudeeindringdämpfung für einen Nutzer in Gebäuden (ITU-R P.2109-2), Polarisationsfehlanpassung, Systemrauschtemperatur und C/N0 (Träger-Rauschleistungsdichte-Verhältnis); Doppler und Dopplerrate in geschlossener Form aus Entfernungsrate und Entfernungsbeschleunigung, jeweils gegen zentrale Differenzen geprüft; die Ionosphärenverzögerung erster Ordnung { "40.3" } STEC/f^{ "2" } aus einem Klobuchar- oder Vertical-TEC-Schräg-TEC, skaliert auf den Teil der Ionosphäre unterhalb des Satelliten. Bandpaare erhalten die ionosphärenfreien Koeffizienten, die Rauschverstärkung und das Coderauschen am Maximum des Überflugs. MEO-GNSS-Satelliten (Galileo- oder GPS-Voreinstellungen) werden mit demselben Antennen- und Rauschmodell aus den Empfangsleistungen ihrer Schnittstellendokumente ausgewertet, sodass der glockenförmige LEO-Überflug und die flachen GNSS-Träger in einem Diagramm liegen. Ein optionaler Abschnitt [iot] liefert Zeit bis zur ersten Positionslösung, Energie je Lösung und Batterielebensdauer über dem Tastverhältnis für ein angegebenes Leistungsbudget des Empfängers (MODELLED). Jedes Bandpaar liefert außerdem das Schräg-TEC, das seine geometriefreie Kombination am Maximum zurückgewinnt, und das Code-Rausch-Sigma dieser Schätzung (Ionosphärensondierung). Ein optionaler Abschnitt [spoofer] fälscht die Signale einer behaupteten Position, die nach einem Einsatzzeitpunkt von der wahren Position springt oder weggeschoben wird, und führt zwei Monitore mit angegebenen Wahrscheinlichkeiten für Fehlalarm und Nichterkennung aus: Doppler- und Überflug-Geometrie-Konsistenz (gemessene Entfernungsraten gegen die aus den Bahnen und einer unabhängigen Vorabposition und -geschwindigkeit vorhergesagten, ein verallgemeinerter Kleinste-Quadrate-Chi-Quadrat-Test über ein Fenster, auf den GNSS-, LEO- und allen Kanälen) und Konsistenz zwischen den Bändern (der Schritt von Epoche zu Epoche der modellkorrigierten geometriefreien Kombination jedes LEO-Bandpaars), mit Statistiken je Epoche und dem Zeitpunkt, zu dem jeder Monitor erkennt (MODELLED). Komponenten, die VALIDATED sind: Freiraumdämpfung, die Koeffizienten von P.838-3 gegen ihre Tabelle { "5" }, die Verfahren P.618-14 für Regen und Szintillation und die Gebäudeeindringdämpfung nach P.2109 gegen die Validierungsbeispiele der ITU-R Study Group { "3" }, das Gruppenlaufzeitverhältnis L1/L2 aus IS-GPS-200 und das maximale Doppler eines ruhenden Nutzers auf einer Kreisbahn gegen arXiv { "2509.19551" } Tabelle { "1" }. MODELLED: EIRPs, Antennendiagramme, der Chapman-Anteil des TEC unterhalb des Satelliten und der gesamte Überflug.
