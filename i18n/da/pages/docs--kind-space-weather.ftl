# docs--kind-space-weather: translations (da)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenarietype i motoren v{ $version }, familie <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>

seg-95f8bd8e0078 = Kilde: <c1/>

seg-24c21b5b0cc3 = <c1/> (scenarietype)

seg-5f25c5b71f0c = Model af rumvejrsmiljøet: indekser for solaktivitet (F10.7/F10.7a) og geomagnetisk aktivitet (Kp, med den definitoriske tabel Kp↔ap), den eksosfæriske temperatur efter Jacchia-1971, som de driver (valideret mod offentliggjort solminimum/middel/solmaksimum), og den termosfæriske neutrale tæthed efter Jacchia-1971 ved den eksosfæriske middeltemperatur over døgnet mod den aktivitetsfrie statiske profil ved et sæt højder — den afhængighed af solcyklussen i tætheden, som den statiske atmosfære udelader. MODELLED: tætheden stemmer med accelerometerafledte tætheder (TOLEOS CHAMP og GRACE) inden for en faktor { "2" } ved solmaksimum, men er omkring 1.7x for høj i solminimum { "2008" }.

seg-f2c2860db799 = Én kørsel af <c1/> opsummeres som: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; tæthed x1.49 ved { "300" } km (MODELLED)

seg-6bb05c41eba2 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-c367f1aacd0b = Eksemplet <c1/> angiver blandt andet:

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = Resultatetiket (motorens egen): MODELLED — indekser for sol og geomagnetisme, eksosfærisk temperatur efter Jacchia-71 og statisk tæthed efter Jacchia-71 ved middeltemperaturen over døgnet

seg-c1c6f2f73fb5 = Diagrammet, som motoren skriver for scenarios/space-weather.toml, type space-weather

seg-15587da59e8e = <b>MODELLED</b> Indekser for sol og geomagnetisme (definitorisk tabel Kp↔ap), den eksosfæriske temperatur efter Jacchia-1971 og den termosfæriske tæthed efter Jacchia { "1971" } (SAO Special Report { "332" }: statiske diffusionsprofiler, der gengiver dens Table { "7" }, med de døgnlige, geomagne

seg-f8eef6eabfb2 = <b>MODELLED</b> Indekser for sol og geomagnetisme (definitorisk tabel Kp↔ap), den eksosfæriske temperatur efter Jacchia-1971 og den termosfæriske tæthed efter Jacchia { "1971" } (SAO Special Report { "33" }. Uafhængig reference (ExternalDataset): definitorisk tabel Kp↔ap + lukket form for eksosfærisk temperatur efter Jacchia-1971 (afstemt til <{ "1" } K mod de offentliggjorte ankerpunkter, tests/space_weather_reference.rs); tætheden er karakteriseret mod pymsis NRLMSISE-00 (en uafhængig NRL-model): udsvinget over solcyklussen ved { "800" } km er 10.4x mod NRLMSISE-00 13.6x. Revision { "0.30" }: den kalibrerede førsteordens aktivitetsfaktor blev erstattet af Jacchia { "1971" } (tæthed i standardscenariet ved { "40" }

seg-72979b637644 = MODELLED — indekser for sol og geomagnetisme, eksosfærisk temperatur efter Jacchia-71 og statisk tæthed efter Jacchia-71 ved middeltemperaturen over døgnet (resultat <c1/>)

seg-0306ee022298 = MODELLED: tætheden stemmer med accelerometerafledte tætheder (TOLEOS CHAMP og GRACE) inden for en faktor { "2" } ved solmaksimum, men er omkring 1.7x for høj i solminimum { "2008" }. (typekatalog (<c1/>))

seg-b86a312077b5 = ÆRLIG AFGRÆNSNING: MODELLED. Konverteringen Kp<->ap er den definitoriske IAGA-tabel, og den eksosfæriske temperatur er valideret mod offentliggjorte størrelser for solminimum/middel/solmaksimum, men tæthedskorrektionen er en KALIBRERET FØRSTEORDENS kobling af skalahøjden — den fanger det rigtige fortegn, den rigtige monotoni og den rigtige størrelsesorden, IKKE den absolutte nøjagtighed af en datavalideret (NRLMSISE-00) atmosfære. Kør: kshana scenarios/space-weath (kommentar i scenariefilen, linje { "10" } til { "15" })

seg-10cf16c12a2a = Rumvejrsmiljø og aktivitetsdreven termosfærisk tæthed er MODELLED, ikke valideret: et delkrav er kontrolleret eksternt, men hele funktionen sammensætter modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-3dd29f8fba14 = <s1>Forrige</s1>space-packet

seg-ff9d9a41692b = <s1>Næste</s1>spectrum
