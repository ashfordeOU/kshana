# docs--kind-optical-atmosphere: translations (de)

# text
seg-f42465f7d066 = ns

# text
seg-9fd02351d844 = ms

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
seg-a97755cb13eb = Familienseite: <a1>Optical PNT</a1>

# text
# c1: docs/kinds/by-kind/optical-atmosphere.md
seg-d4e4da22fadb = Quelle: <c1/>

# text
seg-a878d9be65b7 = MODELLED optische PNT durch die Atmosphäre: Für eine optische Strecke und eine Menge von Bodenstandorten mit angegebenem Wolkenklima gibt sie den wellenlängen- und elevationsabhängigen Klarluftverlust (Kim-Sichtweitengesetz plus Rayleigh), den Hufnagel-Valley-Turbulenzzustand (Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Parameter, Aperturmittelung), die wetterbedingte Verfügbarkeit gegen die Streckenreserve (optische Wolkentiefe aus einem lognormalen Flüssigwasser-Klima, geometrisch-optische Extinktion, unabhängiger Turbulenzschwund), die für Zielverfügbarkeiten nötige Streckenreserve, die Verteilung der Ausfalldauer, das Anwachsen des Zeitgebungs- und Entfernungsmessfehlers pro Ausfall über das Uhren-Holdover-Modell, die entfernungskorrelierte Standortdiversitäts-Verfügbarkeit und Was-wäre-wenn-Gewinne für Verbesserungstechniken (Wellenlänge, Empfangsapertur, Szintillationsreduktion durch adaptive Optik, zusätzliche Reserve) aus. VALIDATED als Implementierung der angegebenen Formeln gegen ein unabhängiges mpmath-Referenz: Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Schwundwahrscheinlichkeit, Aperturmittelungsfaktor, optische Tiefe von Wolken und Klarluft. MODELLED: jede Wetter-, Technik- und Uhren-Eingabe sowie die Unabhängigkeits- und Copula-Annahmen; es wurde kein gemessener Verfügbarkeitsnachweis verglichen. Beratende Analyse, kein zertifiziertes Verfügbarkeits- oder Navigationsprodukt.

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-c443d8d3e4ce = Ein Lauf von <c1/> fasst sich zusammen als: optical-atmosphere: { "1550" } nm bei { "30" } deg Elevation, Reserve { "19.2" } dB vor der Atmosphäre; bester Standort südlich { "74.66" } %; 3-Standort-Netz { "92.72" } % unabhängig / { "91.62" } % korreliert Wetter (MODELLED, beratend)

# text
# c1: wavelength_nm
# c2: elevation_deg
# c3: availability_targets_pct
# c4: link
# c5: atmosphere
# c6: site
# c7: network
# c8: technique
# c9: clock
# c10: timeseries
seg-e466ecbd4e6d = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/optical-atmosphere-network.toml
seg-8adae3ea6e60 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-687f2930a40d = downlink

# text
seg-e794d481aed4 = plane

# text
seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

# text
seg-9799bd5f9fdb = nm

# text
seg-7707c45d1d30 = dBm

# text
seg-0fd6a569077f = Ergebnisbezeichnung (die der Engine): MODELLED — optische PNT durch die Atmosphäre: Klarluftextinktion (Kim-Sichtweitengesetz + Rayleigh), optische Wolkentiefe aus einem angegebenen Flüssigwasser-Klima (P.840-Menge, geometrisch-optische Extinktion), Hufnagel-Valley-Turbulenz mit Gamma-Gamma-Schwund und Aperturmittelung, Verfügbarkeit gegen die

# text
seg-a18d144f149e = <b>MODELLED</b> Hufnagel-Valley-Cn2, entlang eines Schrägpfads integriert, für die Rytov-Varianz bei ebener und sphärischer Welle (Uplink und Downlink), den Szintillationsindex nach Andrews-Phillips und die Gamma-Gamma-Parameter, die Gamma-Gamma-Schwundwahrscheinlichkeit und die Schwundreserve, Tests: <a1>optical_atmosphere_reference.rs</a1>.

# text
seg-d97535fd4875 = <b>MODELLED</b> Verfügbarkeit einer optischen Strecke gegen eine angegebene Streckenreserve aus einem lognormalen Wolken-Flüssigwasser-Klima (ITU-R-P.840-Menge, geometrisch-optische Extinktion) und dem unabhängigen Gamma-Gamma-Turbulenzschwund, die für Ziel- Tests: <a1>optical_atmosphere_identities.rs</a1>.

# text
seg-6e2c643df3a6 = <b>MODELLED</b> Die Verteilung der Ausfalldauer eines optischen Standorts, gekoppelt an die geschlossene Auslaufvarianz des Uhren-Holdover-Modells: Zeitgebungs- und Entfernungsmessfehler bei angegebenen Ausfall-Quantilen, das Holdover bis zu einer Zeitgebungsschwelle, der Anteil der Ausfälle und Tests: <a1>optical_atmosphere_identities.rs</a1>.

# text
seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagel-Valley-Cn2, entlang eines Schrägpfads integriert, für die Rytov-Varianz bei ebener und sphärischer Welle (Uplink und Downlink), den Szintillationsindex nach Andrews-Phillips und die. Unabhängige Referenz (ExternalDataset): Die Numerik wird mit einem unabhängigen Programm verglichen (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } bei { "30" } Stellen, Tanh-Sinh-Quadratur über die ursprüngliche Höhenvariable und Bessel-K-Gamma-Gamma-Dichten), das keinen Code mit Kshana teilt, unter Zielwerten, die festgelegt wurden, bevor irgendeine Implementierung existierte (xval/optical-atmosphere/PREREGISTRATION.md). WARUM MODELLED: Diese Referenz wertet dieselben veröffentlichten Formeln aus, es prüft also die Im

# text
seg-4af9bc99ef29 = <b>MODELLED</b> Verfügbarkeit einer optischen Strecke gegen eine angegebene Streckenreserve aus einem lognormalen Wolken-Flüssigwasser-Klima (ITU-R-P.840-Menge, geometrisch-optische Extinktion) und. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: geschlossene Grenzwerte und Monotonie des Diversitätsmodells, die geschlossene Form der Wolkenobergrenze und die lognormalen Ausfallidentitäten. KEINE externe unabhängige Referenz wird beansprucht, und keine wurde verglichen: Es wird kein gemessener Nachweis zur Verfügbarkeit optischer Bodenstationen oder zur wolkenfreien Sichtlinie verwendet. WARUM MODELLED: das Wolkenklima (Wolkenwahrscheinlichkeit, Median und Streuung der Flüssigwassersäule, Ausfalldauern),

# text
seg-b3abf6cbeba4 = <b>MODELLED</b> Die Verteilung der Ausfalldauer eines optischen Standorts, gekoppelt an die geschlossene Auslaufvarianz des Uhren-Holdover-Modells: Zeitgebungs- und Entfernungsmessfehler bei angegebenen Aus. Unabhängige Referenz (InternalConsistency): Interne Konsistenz mit dem Holdover-Modul, Bit für Bit; KEINE externe unabhängige Referenz wird beansprucht. Die Klassen-PSDs sind die synthetisierten Langzeit-Untergrenzen, die das Holdover-Modul bereits trägt, sodass die Zahlen dessen angegebenen Vorbehalt erben, dass das Holdover bis zu einer engen Schwelle vom angenommenen Rotrausch-Boden bestimmt wird und nicht von der zitierten Allan-Abweichung. Die Ausfalldauern sind ein lognormales Modell mit angegebenen Parametern, kein gemessenes c

# text
# c1: label
seg-c4772a9e1a26 = MODELLED — optische PNT durch die Atmosphäre: Klarluftextinktion (Kim-Sichtweitengesetz + Rayleigh), optische Wolkentiefe aus einem angegebenen Flüssigwasser-Klima (P.840-Menge, geometrisch-optische Extinktion), Hufnagel-Valley-Turbulenz mit Gamma-Gamma-Schwund und Aperturmittelung, Verfügbarkeit gegen die Streckenreserve, an Uhren-Holdover gekoppelte Ausfalldauern und entfernungskorrelierte Standortdiversität. Die Numerik wird geprüft (Ergebnis <c1/>)

# text
seg-384f5c73cdf9 = Eine mit Seed erzeugte Realisierung der Strecke jedes Standorts über die Zeit (MODELLED; eine Ziehung aus dem obigen Modell, nicht das Klima). Fehlt sie, wird keine Reihe geschrieben, und das Ergebnis ist das Dokument { "0.37" }. (Kommentar der Szenariodatei, Zeilen { "78" } bis { "79" })

# text
seg-c75fa5787bd4 = Numerik der optischen Schrägpfad-Atmosphäre: Rytov-Varianz, Szintillation, Gamma-Gamma-Schwundwahrscheinlichkeit, Aperturmittelung, optische Tiefe von Wolken und Klarluft ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, sodass die Fähigkeit modelliert bleibt. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e5013bdf86bb = Wettergetriebene Verfügbarkeit optischer Bodenstandorte und entfernungskorrelierte Standortdiversität ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-dc1132147318 = Themenseite: <a1>OPTICAL-ATMOSPHERE.md</a1>

# text
seg-bd5b1654b3ed = <s1>Zurück</s1>oem-interop

# text
seg-ef0a779c300c = <s1>Weiter</s1>orbit

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-00c76aeadb90 = <b>MODELLED</b> Eine optionale Tabelle <c1/> (Dauer, Schritt, Seed) lässt die Szenarioart <c2/> zusätzlich pro Standort eine mit Seed erzeugte Realisierung des angegebenen Standortmodells über die Zeit schreiben: Wolkenepisoden (klare Phasen exponentiell, Wolkenausfälle lognormal Tests: <a1>optical_atmosphere_timeseries.rs</a1>.

# text
# c1: kshana kinds --json
seg-2c7493ee5042 = MODELLED: jede Wetter-, Technik- und Uhren-Eingabe sowie die Unabhängigkeits- und Copula-Annahmen; es wurde kein gemessener Verfügbarkeitsnachweis verglichen. (Szenarioarten-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-32c6524b0baf = MODELLED optische PNT durch die Atmosphäre: Für eine optische Strecke und eine Menge von Bodenstandorten mit angegebenem Wolkenklima gibt sie den wellenlängen- und elevationsabhängigen Klarluftverlust (Kim-Sichtweitengesetz plus Rayleigh), den Hufnagel-Valley-Turbulenzzustand (Rytov-Varianz, Szintillationsindex, Gamma-Gamma-Parameter, Aperturmittelung), die wetterbedingte Verfügbarkeit gegen die Streckenreserve (optische Wolkentiefe aus (Szenarioarten-Katalog (<c1/>))

# attr:alt
seg-4e2b759aff17 = Das Diagramm, das die Engine für scenarios/optical-atmosphere-network.toml schreibt, Szenarioart optical-atmosphere

# text
seg-72ad48275ebe = Szenarioart der Engine v{ $version }, Familie <a1>Optical PNT</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
# c1: optical-atmosphere
seg-deb0a932a76f = <c1/> (Szenarioart)

# text
seg-b4402211e3fe = Optische PNT durch die Atmosphäre: drei ILLUSTRATIVE Bodenstandorte (ein bewölkterer nördlicher Standort, ein mittlerer zentraler Standort und ein klarerer südlicher Standort), die ein optisches LEO-Terminal unter { "30" } Grad Elevation bei { "1550" } nm betrachten. Die Wolkenklimata sind angegebene Eingaben, keine Messungen oder Werte irgendeines Datensatzes, sodass jede unten genannte Verfügbarkeit MODELLED ist. Der Lauf gibt pro Standort den Klarluftverlust, den Hufnagel-Valley-Turbulenzzustand, t (Kommentar der Szenariodatei, Zeilen { "1" } bis { "8" })
