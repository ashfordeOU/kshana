# docs--kind-space-weather: translations (nb)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenariotype i motoren v{ $version }, familie <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>

seg-95f8bd8e0078 = Kilde: <c1/>

seg-24c21b5b0cc3 = <c1/> (scenariotype)

seg-5f25c5b71f0c = Modell av romværmiljøet: indekser for solaktivitet (F10.7/F10.7a) og geomagnetisk aktivitet (Kp, med den definisjonsmessige tabellen Kp↔ap), eksosfærisk temperatur etter Jacchia-1971 som de driver (validert mot publiserte verdier for solminimum, middels og solmaksimum), og termosfærisk nøytral tetthet etter Jacchia-1971 ved den eksosfæriske døgnmiddeltemperaturen mot den aktivitetsfrie statiske profilen ved et sett høyder: avhengigheten av solsyklusen i tettheten som den statiske atmosfæren utelater. MODELLED: tettheten stemmer med tettheter avledet fra akselerometre (TOLEOS CHAMP og GRACE) innenfor en faktor { "2" } ved solmaksimum, men er omtrent 1.7x for tett i solminimum { "2008" }.

seg-f2c2860db799 = En kjøring av <c1/> oppsummeres slik: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; density x1.49 at { "300" } km (MODELLED)

seg-6bb05c41eba2 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-c367f1aacd0b = Eksempelet <c1/> angir blant annet:

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = Resultatetikett (motorens): MODELLED — sol- og geomagnetiske indekser, eksosfærisk temperatur etter Jacchia-71 og statisk tetthet etter Jacchia-71 ved døgnmiddeltemperaturen

seg-c1c6f2f73fb5 = Diagrammet motoren skriver for scenarios/space-weather.toml, type space-weather

seg-15587da59e8e = <b>MODELLED</b> Sol- og geomagnetiske indekser (definisjonsmessig tabell Kp↔ap), eksosfærisk temperatur etter Jacchia-1971 og termosfærisk tetthet etter Jacchia { "1971" } (SAO Special Report { "332" }: statiske diffusjonsprofiler som gjengir dens tabell { "7" }, med døgn-, geomagnetiske

seg-f8eef6eabfb2 = <b>MODELLED</b> Sol- og geomagnetiske indekser (definisjonsmessig tabell Kp↔ap), eksosfærisk temperatur etter Jacchia-1971 og termosfærisk tetthet etter Jacchia { "1971" } (SAO Special Report { "33" }. Uavhengig referanse (ExternalDataset): definisjonsmessig tabell Kp↔ap + lukket form for eksosfærisk temperatur etter Jacchia-1971 (stemt til <{ "1" } K mot de publiserte ankerpunktene, tests/space_weather_reference.rs); tettheten er karakterisert mot pymsis NRLMSISE-00 (en uavhengig NRL-modell): solsyklussvingningen ved { "800" } km er 10.4x mot 13.6x i NRLMSISE-00. Revisjon { "0.30" }: den kalibrerte førsteordens aktivitetsfaktoren ble erstattet av Jacchia { "1971" } (tetthet i standardscenarioet ved { "40" }

seg-72979b637644 = MODELLED — sol- og geomagnetiske indekser, eksosfærisk temperatur etter Jacchia-71 og statisk tetthet etter Jacchia-71 ved døgnmiddeltemperaturen (resultat <c1/>)

seg-0306ee022298 = MODELLED: tettheten stemmer med tettheter avledet fra akselerometre (TOLEOS CHAMP og GRACE) innenfor en faktor { "2" } ved solmaksimum, men er omtrent 1.7x for tett i solminimum { "2008" }. (typekatalog (<c1/>))

seg-b86a312077b5 = ÆRLIG AVGRENSNING: MODELLED. Omregningen Kp<->ap er den definisjonsmessige IAGA-tabellen, og den eksosfæriske temperaturen er validert mot publiserte størrelser for solminimum, middels og solmaksimum, men tetthetskorreksjonen er en KALIBRERT FØRSTEORDENS kobling av skalahøyde: den fanger riktig fortegn, monotonitet og størrelsesorden, IKKE den absolutte nøyaktigheten til en datavalidert atmosfære (NRLMSISE-00). Kjør: kshana scenarios/space-weath (kommentar i scenariofilen, linje { "10" } til { "15" })

seg-10cf16c12a2a = Romværmiljø og aktivitetsdrevet termosfærisk tetthet er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-3dd29f8fba14 = <s1>Forrige</s1>space-packet

seg-ff9d9a41692b = <s1>Neste</s1>spectrum
