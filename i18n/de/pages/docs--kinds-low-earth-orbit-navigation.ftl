# docs--kinds-low-earth-orbit-navigation: translations (de)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Typ

# text
seg-97b8d07150d4 = LEO-PNT-Signalentwürfe: parametrisierte Positions-, Navigations- und Zeitgebungssignale (PNT) auf niedrigen Erdumlaufbahnen (LEO) für beliebige Systeme, Bänder und Strukturen. Ein SIGNAL besteht aus einem Band (Mittenfrequenz, Sendebandbreite, ITU-Zuweisung RNSS/RDSS/MSS/EESS/non-RNSS/other) und Komponenten (Akquisition, Daten, Pilot; jede Teilmenge), jeweils mit einer Modulation (BPSK(n) mit gebrochenem n, BOC(m,n), MBOC({ "6,1" },p) oder ein flaches OFDM-artiges Band), einem Leistungsanteil, optionalen FDMA-Unterträgerversätzen, einer Codelänge und einer Datenrate. Die Signale stammen aus einkompilierten öffentlichen Preset-Dateien (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; jeweils mit ihrer Quell-URL und jedem unveröffentlichten Wert als REPRESENTATIVE gekennzeichnet) oder werden inline geschrieben. JE SIGNAL: die bandbegrenzte spektrale Leistungsdichte und der Anteil der Leistung jeder Komponente, den das Sendeband durchlässt (BPSK-geschlossene Form neben dem numerischen Wert), die effektive (Gabor-)Bandbreite, das thermische Rauschjitter der Code-Nachführung im Delay-Lock-Loop über C/N0 und Early-Late-Abstand aus der bandbegrenzten kohärenten (oder nichtkohärenten) Early-Late-Formel von Betz & Kolodziejski { "2009" } mit ihrer Lehrbuchform für unbegrenzte Bandbreite und ihrer Gabor-Grenze für verschwindenden Abstand, die Entfernungsgenauigkeit in Metern, der Akquisitions-Suchraum (Doppler-Bins aus dem maximalen Doppler der Bahn plus Oszillator- und Nutzeranteilen, mal Code-Bins), die Detektionswahrscheinlichkeit bei quadratischem Detektor und die mittlere serielle und codeparallele Akquisitionszeit, der spektrale Trennungskoeffizient des Signals gegenüber GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b und E5 AltBOC sowie jedes dieser Signale gegenüber dem Signal mit der C/N0-Verschlechterung, und das CW-, Breitband- und angepasste J/S, das die nachgeführte Komponente verträgt, aus der eigenen SSC-Maschinerie der Spektrumart. Ein BANDVERGLEICH: Laufzeitverzögerung der Ionosphäre erster Ordnung ({ "40.3" } TEC/f^{ "2" }), Freiraumdämpfung, Entfernungsgenauigkeit bei gleichem C/N0 und bei gleicher EIRP sowie Störertoleranz. Optionale FORMPRÜFUNGEN halten das Spektrum eines Entwurfs gegen eine beschriebene Messung (MODELLED-Konsistenz). VALIDATED: die geschlossenen Formen für die BPSK-Leistung im Band ({ "90.3" } % im Hauptkeulenbereich) und die Gabor-Bandbreite, das bandbegrenzte Jitter, das sich auf die Lehrbuchform des kohärenten Early-Late-Verfahrens und auf seine Gabor-Grenze zurückführen lässt, der spektrale Trennungskoeffizient des versetzten BPSK gegen seine geschlossene Parseval-Form, die Einheitsfläche des AltBOC-Spektrums und der maximale LEO-Doppler gegen die veröffentlichten Werte von Xona Pulsar (32-34 kHz) und Iridium ({ "36" } kHz). MODELLED: jeder Entwurf, jede Leistungsaufteilung sowie jeder C/N0- und Störerpegel; EFQPSK-, CSK- und OFDM-Spektren sind genähert.

# attr:alt
seg-8bf45b6989d1 = Das Diagramm, das die Engine für scenarios/leo-band-trade.toml schreibt, Art leo-signal

# text
seg-867f3e41b5ab = LEO-Navigationsnachricht: die ausgesendete Ephemeride und Uhr eines Satelliten für Positionierung, Navigation und Zeitgebung im niedrigen Erdorbit (LEO), für jede Bahn, jeden Träger und jedes Modell, mit optionalen benannten Voreinstellungen (Xona Pulsar, Iridium, Starlink, CentiSpace, ein repräsentatives C-Band-System, das ATOMIC-Nulluhr-Modell, Celeste IOD). INHALT: Hilfsdaten (SVID, Datenausgabestand, Band, Signalzustand), Synchronisation (Woche, Wochensekunde, ein Uhrenpolynom zweiter Ordnung af0-af2 um toc), Ephemeride in einem von vier Modellen -- dem 16-Parameter-Kepler-Satz des Galileo OS SIS ICD; diesem Satz plus Korrekturpolynomen in Flugrichtung, quer zur Flugrichtung und radial; dem 22-Parameter-Modell nach Liu et al. { "2025" }; einem ECEF-Polynom ohne Uhrenterme (ATOMIC-Nulluhr) -- und weitere Dienste (ein ausgesendeter Klobuchar-Satz, NeQuick-G ai0-ai2 mit dem effektiven Ionisationsniveau und Parameter von Systemzeit zu UTC mit der Schaltsekundenlogik des ICD). FITTER: eine Wahrheitsbahn, integriert mit zonaler J2-J6- oder EGM2008-Schwere bis zum gewählten Grad und mit Luftwiderstand, und eine mit Seed erzeugte freie oder gesteuerte Uhr; Levenberg-Marquardt-Anpassung des Kepler-Satzes auf nichtsingulären Elementen, dann lineare Korrekturpolynome nach kleinsten Quadraten; Uhr angepasst abzüglich des relativistischen Terms, den der Nutzer hinzufügt. ANALYSEN: fit-interval-trade (Signal-in-Space-Entfernungsfehler, SISRE, mit global gemittelten Gewichten für die Bahnhöhe, gegen Anpassungsintervall und Aktualisierungsperiode, nur Bahn und mit Uhr), model-comparison (vier Modelle, Parameterzahl, codierte Bits und die Anpassung von Kshana bei den Höhen von Liu et al. neben den veröffentlichten Werten), midpass-update (der höchste Überflug über einem Nutzer, der Sprung von Position, Uhr und Nutzerentfernung bei jedem Nachrichtenwechsel, der Sprung bei schlechtester Geometrie, PASS/FAIL gegen eine Kontinuitätsschwelle), encode-decode (das eigene dokumentierte Binärframe von Kshana mit CRC-24Q, ein Quantisierungsbudget von je einem halben Schritt pro Feld, eine Prüfung eines beschädigten Frames, ein Export und Import von Datensätzen im RINEX-4-Stil, bezeichnet als Kshana-Erweiterung, und eine CSV-Tabelle). VALIDATED: die SISRE-Gewichte gegen die veröffentlichte MEO/GEO-Tabelle (Montenbruck et al. { "2018" }); der Galileo-Nutzeralgorithmus gegen RTKLIB auf realen Galileo-Broadcast-Ephemeriden; CRC-24Q gegen seinen Katalog-Prüfwert und den RTCM-{ "1005" }-Beispielframe. MODELLED: Jede Anpassungs- und SISRE-Zahl ist ein Darstellungsfehler gegen eine von Kshana integrierte Wahrheit (kein Bahnbestimmungs- oder Vorhersagefehler); der Vergleich mit Liu et al. verwendet andere Bahnen; die Codierungs- und Textformate sind die eigenen von Kshana.

# attr:alt
seg-35e92abc6a23 = Das Diagramm, das die Engine für scenarios/leo-navmsg-celeste-iod.toml schreibt, Kind leo-navmsg

# text
seg-c3861f7d717c = LEO-Überflug und Link-Budget, Band für Band, für LEO-PNT (Positionierung, Navigation und Zeitgebung aus dem niedrigen Erdorbit), systemunabhängig: ein Nutzer (am Boden, auf See, in der Luft oder in Gebäuden, ruhend oder bewegt) und ein oder mehrere LEO-Satelliten aus einem ENTWORFENEN ÜBERFLUG (eine Kreisbahn, so gelegt, dass der Nutzer zu einer gewählten Zeit einen Überflug mit einer gewählten maximalen Elevation sieht, auf Wunsch sonnensynchron), expliziten ELEMENTEN, einem TLE (Zwei-Zeilen-Elementsatz) über das SGP4 der Engine oder einer WALKER-Konstellation, aufgebaut vom Code zum Konstellationsentwurf (die höchsten Überflüge werden ausgegeben). Die Bänder stammen aus einer benannten Voreinstellung (generisches Multiband UHF/L/S/C, generisches C-Band, Xona Pulsar X1/X5, Iridium STL, Starlink als reines Doppler-Gelegenheitssignal, CentiSpace und eine optionale Celeste-IOD-Voreinstellung, markiert als WORKSHOP) oder werden in das Szenario geschrieben; jede Voreinstellung gibt an, ob ihre Zahlen PUBLIC (mit URL), REPRESENTATIVE oder WORKSHOP sind. Je Satellit, Band und Epoche: Elevation, Azimut, Entfernung, Entfernungsrate und Entfernungsbeschleunigung; Freiraumdämpfung; EIRP und der Antennengewinn des Satelliten (Isoflux, Gauß-Keule oder flach); Antennengewinn des Nutzers gegen die Elevation (Patch, halbkugelförmig oder isotrop); Gasdämpfung (ITU-R P.676-10 Anhang { "2" }), Regendämpfung (ITU-R P.838-3-Koeffizienten und das Verfahren nach P.618-14, aus Regenrate und Regenhöhe), troposphärische Szintillation (ITU-R P.618-14 Abschnitt { "2.4.1" }), Gebäudeeindringdämpfung für einen Nutzer in Gebäuden (ITU-R P.2109-2), Polarisationsfehlanpassung, Systemrauschtemperatur und C/N0 (Träger-Rausch-Dichte); Doppler und Dopplerrate in geschlossener Form aus Entfernungsrate und Entfernungsbeschleunigung, jeweils gegen zentrale Differenzen geprüft; die ionosphärische Verzögerung erster Ordnung { "40.3" } STEC/f^{ "2" } aus einem schrägen TEC nach Klobuchar oder aus vertikalem TEC, skaliert auf den Teil der Ionosphäre unterhalb des Satelliten. Bandpaare erhalten am Überflugmaximum die ionosphärenfreien Koeffizienten, die Rauschverstärkung und das Coderauschen. MEO-GNSS-Satelliten (Galileo- oder GPS-Voreinstellungen) werden mit demselben Antennen- und Rauschmodell aus den Empfangsleistungen ihrer Schnittstellendokumente ausgewertet, sodass der glockenförmige LEO-Überflug und die flachen GNSS-Träger einen gemeinsamen Plot teilen. Ein optionaler Abschnitt [iot] gibt Zeit bis zum ersten Fix, Energie je Fix und Batterielebensdauer gegen das Tastverhältnis für ein angegebenes Leistungsbudget des Empfängers an (MODELLED). Jedes Bandpaar gibt außerdem den schrägen TEC an, den seine geometriefreie Kombination am Maximum wiedergewinnt, sowie das Coderausch-Sigma dieser Schätzung (Ionosphärensondierung). Ein optionaler Abschnitt [spoofer] fälscht die Signale einer behaupteten Position, die nach einem Einsatzzeitpunkt von der wahren abspringt oder weggedrückt wird, und betreibt zwei Monitore mit angegebenen Wahrscheinlichkeiten für Fehlalarm und Nichterkennung: Konsistenz von Doppler und Überfluggeometrie (gemessene Entfernungsraten gegen die aus den Bahnen und einer unabhängigen vorherigen Position und Geschwindigkeit vorhergesagten, ein verallgemeinerter Chi-Quadrat-Test nach kleinsten Quadraten über ein Fenster, auf den GNSS-, LEO- und allen Kanälen) und Konsistenz zwischen den Bändern (der Epoche-zu-Epoche-Schritt der modellkorrigierten geometriefreien Kombination jedes LEO-Bandpaars), wobei Statistiken je Epoche und der Zeitpunkt der Erkennung durch jeden Monitor ausgegeben werden (MODELLED). VALIDATED Komponenten: Freiraumdämpfung, die P.838-3-Koeffizienten gegen ihre Tabelle { "5" }, die Verfahren für Regen und Szintillation nach P.618-14 und die Gebäudeeindringdämpfung nach P.2109 gegen die Validierungsbeispiele der ITU-R Study Group { "3" }, das L1/L2-Gruppenlaufzeitverhältnis aus IS-GPS-200 und der maximale Doppler eines ruhenden Nutzers auf einer Kreisbahn gegen arXiv { "2509.19551" } Tabelle { "1" }. MODELLED: EIRPs, Muster, der Chapman-Anteil des TEC unterhalb des Satelliten und der gesamte Überflug.

# attr:alt
seg-02ae51cfada6 = Das Diagramm, das die Engine für scenarios/leo-pass-iridium.toml schreibt, Kind leo-pass

# text
seg-81d1604171a5 = Ein LEO-PNT-System (Positionierung, Navigation und Zeitgebung aus dem niedrigen Erdorbit) von Anfang bis Ende, für jede Konstellation und jedes Signal: Das mit signal_design benannte leo-signal-Design (eine öffentliche Voreinstellung oder ein Inline-Design [signal]) legt Mitte, Bandbreite, Chiprate und EIRP-Aufteilung eines Bandes [pass] fest, das Link-Budget von leo-pass liefert das verfolgte C/N0 und den bandbegrenzten Codejitter über den Überflug, eine C/N0-Gerade in sin(Elevation) und das ausgesendete SISRE der Nachricht [navmsg] (angepasst in der Höhe des Überflugsatelliten) speisen jedes LEO-System des gemeinsamen Fixes leo-pvt unter [fusion] und optional die Fälle leo-ppp unter [ppp]; jede Übergabe wird mit Wert und Einheit aufgelistet. MODELLED.

# attr:alt
seg-abe0599498c9 = Das Diagramm, das die Engine für scenarios/leo-pnt-end-to-end.toml schreibt, Kind leo-pnt-chain

# text
seg-32a570f1a4fa = Konvergenz der präzisen Punktpositionierung (PPP) nur mit GNSS und mit LEO-Stützung: ein erweitertes Kalman-Filter mit Float-Lösung auf ionosphärenfreiem Code und ionosphärenfreier Trägerphase mit den statischen Stationskoordinaten, einer weißen Empfängeruhr, einem Inter-System-Bias je zusätzlichem System, einer als Random Walk modellierten zenitalen feuchten Verzögerung, abgebildet mit 1/sin(Elevation), und einer Float-Mehrdeutigkeit je Satellitenbogen; der präzise Bahn-und-Uhr-Fehler ist weiß und für Code und Phase eines Satelliten gemeinsam, sodass jeder Satellit eine korrelierte Zweizeilen-Aktualisierung in Joseph-stabilisierter Form ist. Die Messungen werden aus demselben Modell mit Seed-Rauschen über mehrere Standorte und Seeds simuliert, und jeder Fall (zuerst nur GNSS, dann jedes [[case]] von LEO-Systemen, beliebige Konstellation oder Voreinstellung) gibt die mediane Konvergenzzeit an (die erste Epoche, nach der die horizontalen und vertikalen Fehler unter den Schwellen bleiben, standardmäßig { "10" } cm), den konvergierten Anteil, die medianen Fehlerkurven und die Konsistenz des Filters (das über die Läufe gemittelte Positions-NEES gegen das zweiseitige { "95" }-%-Chi-Quadrat-Band). Optional neben den veröffentlichten Zahlen für mittlere Breiten von Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2): { "9.6" } min für Multi-GNSS, verkürzt auf { "7.0" }, { "3.2" }, { "2.1" } und { "1.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten. MODELLED: ein Konsistenzvergleich des Trends, keine Reproduktion der Konstellationen, des Rauschens oder der Stationen jener Studie; keine Auflösung der Mehrdeutigkeit, keine Cycle Slips, kein Phase-Wind-up, keine Gezeiten und keine zeitkorrelierten Produktfehler.

# attr:alt
seg-225ef04c64af = Das Diagramm, das die Engine für scenarios/leo-ppp-convergence.toml schreibt, Kind leo-ppp

# text
seg-093aac4b5ff1 = Fusionierte Positionierung, Navigation und Zeitgebung (PNT) aus dem mittleren Erdorbit (MEO) und dem niedrigen Erdorbit (LEO) über BELIEBIGE Konstellationen: Jedes [[system]] ist eine GNSS-Voreinstellung des Kinds constellation-design, eine LEO-Voreinstellung (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, das Ephemeridenmodell atomic-zero-clock oder eine andere Voreinstellungsdatei, jeweils in einer eigenen Datei mit ihren als PUBLIC, WORKSHOP oder DERIVED markierten Quellen), Walker-Schalen oder explizite Elementsätze, mit einem Träger, einer Chiprate, einer Hüllkurve der Träger-Rausch-Dichte (C/N0) von der Elevationsmaske bis zum Zenit, einem Signal-in-Space-Entfernungsfehler (SISRE), einem Doppler-Sigma und einem Uhrenmodell (die eigene Empfängeruhr, sodass der Inter-System-Bias geschätzt wird, oder ein bekannter ausgesendeter Versatz). Vier Modi. DOPPLER: Batch-Gauss-Newton-Positionierung aus der Entfernungsrate mit analytischen Partiellen, Uhrendrift und optionalen Geschwindigkeitszuständen und einer optionalen Höhenbedingung, mit einem oder mehreren Satelliten, der Fehler gegen die Fensterlänge, die Hüllkurve von Doppler, Dopplerrate und Ruck jedes LEO-Systems und die Genauigkeit in und quer zur Flugrichtung bei einem einzelnen Überflug gegen den Querversatz (der Querfehler wächst unbegrenzt, wenn der Überflug über den Zenit geht; ein einzelner Überflug hat außerdem eine Spiegellösung über der Bodenspur). Ein reines Doppler-Gelegenheitssignal (starlink-sop) läuft hier. GEMEINSAM: Pseudorange-Fixes je Epoche nach gewichteten kleinsten Quadraten aus GNSS allein, LEO allein und beiden, Sigmas je Messung aus einem Thermalrauschmodell der Delay-Lock-Loop bei C/N0 plus dem SISRE (oder einem festen Sigma, sodass ein Signalmodell sie speisen kann), die geschätzten Inter-System-Biases und PDOP/HDOP/VDOP gegen die Zahl der hinzugefügten LEO-Satelliten. POLAR: sichtbare Satelliten und DOP gegen die Breite für GNSS, LEO und beide. ZEITGEBUNG: Zeitübertragung auf die koordinierte Weltzeit (UTC) von LEO-Satelliten an bekannter Position mit einem Uhrenfilter mit zwei Zuständen, dessen Prozessrauschen aus den Oszillatorklassen der Engine stammt, gegen C/N0 und den Oszillator, und der Ausdruck von IS-GPS-200 für Systemzeit zu UTC; mit [timing] trace = true gibt jede Zeile außerdem ihren Zeitfehler und ihr vorhergesagtes Sigma in jeder Epoche an. VALIDATED: der größte Doppler eines Überflugs vom Zenit bis zum Horizont gegen die veröffentlichten Zahlen von Iridium (bis zu { "36" } kHz) und Xona Pulsar X1 ({ "32" } bis { "34" } kHz). MODELLED: alles andere; der DOP wird gegen einen von Hand abgeleiteten Fall geprüft, die Fixes gegen ihre Kovarianz und das Dopplermodell gegen die Identität der Entfernungsbeschleunigung.

# attr:alt
seg-90361a6f4e3c = Das Diagramm, das die Engine für scenarios/leo-pvt-fjord-skyline.toml schreibt, Kind leo-pvt

# text
seg-4f0edb786a35 = Positionierung aus einem 5G-Downlink eines nicht-terrestrischen Netzes (NTN) im S-Band des mobilen Satellitendienstes (MSS) (3GPP-Band n256, Downlink { "2170" } bis { "2200" } MHz; Standardträger { "2172.5" } MHz): die Cramér-Rao-Schranke (CRB) für die Ankunftszeit, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), mit beta als quadratisch gemittelter (Gabor-)Bandbreite des flachen OFDM-Spektrums (B/sqrt({ "12" })), und für die Doppler-Verschiebung eines komplexen Tons, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), für jedes Signal (standardmäßig ein New-Radio-Kanal von { "5" } MHz mit { "4.5" } MHz belegt und ein Schmalbandkanal von { "200" } kHz mit { "180" } kHz belegt); dann, über jede LEO-Konstellation, Downlink-Ankunftszeit-Fixes mit unbekannter Empfängeruhr (mit Seed, mit der Schranke plus einem Netzwerksynchronisationsfehler als Sigma), deren PDOP und formales 3D-Sigma sowie ein Ein-Satelliten-Doppler-Fix über den längsten Durchgang bei festgehaltener Höhe. MODELLED: Der Schritt von der Bandbreite zur Schranke ist die Lehrbuch-Formel in geschlossener Form, geprüft gegen numerische Integration der flachen und bandbegrenzten BPSK-Spektren (interne Konsistenz, kein veröffentlichter Rechenwert festgelegt), und die Positionierungsgenauigkeit ist eine Schranke auf einem mehrwegefreien Kanal mit einem angegebenen Synchronisationsfehler, kein erzieltes Ergebnis.

# attr:alt
seg-c200240dd65e = Das Diagramm, das die Engine für scenarios/ntn-5g-positioning.toml schreibt, Kind ntn-positioning

# text
seg-4e31c8daf798 = Register

# text
seg-6800289a282d = { "7" } Szenario-Kinds der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
# c1: docs/kinds/low-earth-orbit-navigation.md
seg-22eb3a688624 = Quelle: <c1/>

# text
seg-561a783e9516 = Navigation im niedrigen Erdorbit (Szenario-Kind-Familie)

# text
# c1: kshana scenarios/leo-pnt-end-to-end.toml
seg-47751d798019 = Themenseiten: <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>. Einen ausführen: <c1/>. Alle Familien: <a5>KINDS.md</a5>.

# attr:alt
seg-4867ae5d108b = Kontaktbogen der Diagramme, die die Engine für die Kinds der Familie Navigation im niedrigen Erdorbit schreibt

# text
seg-1e724b481e67 = LEO-PNT-Signalentwürfe: parametrierte Signale für Positionierung, Navigation und Zeitgebung (PNT) im niedrigen Erdorbit (LEO) für jedes System, Band und jede Struktur.

# text
seg-82ad7da67939 = LEO-Überflug und Streckenbudget, Band für Band, für LEO-PNT (Positionierung, Navigation und Zeitgebung aus dem niedrigen Erdorbit), systemunabhängig: ein Nutzer (am Boden, maritim, in der Luft oder in Gebäuden, statisch oder bewegt) und ein oder meh

# text
seg-3f28c23605a4 = MODELLED { "7" } · VALIDATED { "5" }

# text
seg-c20a76308fb3 = LEO-Navigationsnachricht: die Broadcast-Ephemeride und -Uhr eines PNT-Satelliten (Positionierung, Navigation und Zeitgebung) im niedrigen Erdorbit (LEO), für jede Bahn, jeden Träger und jedes Modell, mit optionalen benannten Presets (Xona P

# text
seg-04fdaadf1cba = MODELLED { "5" } · VALIDATED { "6" }

# text
seg-06236b581684 = Fusionierte Positionierung, Navigation und Zeitgebung (PNT) im mittleren Erdorbit (MEO) und im niedrigen Erdorbit (LEO) über BELIEBIGE Konstellationen: Jedes [[system]] ist ein GNSS-Preset des Kinds constellation-design, ein LEO-Preset

# text
seg-d9e5f4726bbb = Konvergenz der präzisen Punktpositionierung (PPP) mit nur GNSS und mit LEO-Augmentation: ein Float-Extended-Kalman-Filter auf ionosphärenfreiem Code und ionosphärenfreier Trägerphase mit den statischen Stationskoordinaten, ein ganz

# text
seg-44f4148f4a5f = Positionierung aus einem 5G-Downlink eines nicht-terrestrischen Netzes (NTN) im S-Band des mobilen Satellitendienstes (MSS) (3GPP-Band n256, Downlink { "2170" } bis { "2200" } MHz; Standardträger { "2172.5" } MHz): die Cramér-Rao-Schranke

# text
seg-1ee838a551ef = Ein LEO-PNT-System (Positionierung, Navigation und Zeitgebung aus dem niedrigen Erdorbit) durchgängig, für jede Konstellation und jedes Signal: der durch signal_design benannte leo-signal-Entwurf (ein öffentliches Preset oder ein Inline-[s

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-70d1ac6ddc95 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-472d9e86ee20 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>leo-signal</a1>.

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
seg-17d1c06ba5c5 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-9a7671c30d7e = <b>Register:</b> MODELLED { "7" } · VALIDATED { "5" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>leo-pass</a1>.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-cba2c7f7050a = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-7ba3e667487d = <b>Register:</b> MODELLED { "5" } · VALIDATED { "6" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>leo-navmsg</a1>.

# text
# c1: mode
# c2: seed
# c3: duration_s
# c4: step_s
# c5: user
# c6: dll
# c7: doppler
# c8: joint
# c9: polar
# c10: timing
# c11: system
# c12: skyline
seg-8ca53a87d092 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-389c67090de1 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>leo-pvt</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: runs
# c5: criterion_horizontal_m
# c6: criterion_vertical_m
# c7: compare_li_2019
# c8: noise
# c9: site
# c10: gnss
# c11: case
seg-e004092d6056 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e485df9372e6 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>leo-ppp</a1>.

# text
# c1: seed
# c2: carrier_hz
# c3: signal
# c4: integration_s
# c5: doppler_integration_s
# c6: cn0_dbhz
# c7: sync_error_m
# c8: user
# c9: duration_s
# c10: step_s
# c11: system
seg-089266c42199 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

# text
seg-e0a3133f468f = <b>Register:</b> VALIDATED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>ntn-positioning</a1>.

# text
# c1: signal_design
# c2: pass
# c3: fusion
# c4: name
# c5: description
# c6: seed
# c7: signal
# c8: navmsg
# c9: od_sisre_m
# c10: ppp
seg-ea759d0040db = Erforderliche Felder: <c1/>, <c2/>, <c3/>. Optional: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-db08b7916378 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>leo-pnt-chain</a1>.

# text
seg-534d13455a76 = <s1>Zurück</s1>Jamming, Spoofing und das Spektrum

# text
seg-ec3fb19fb5bd = <s1>Weiter</s1>Mond und cislunar
