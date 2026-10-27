# docs--kind-spectrum: translations (nb)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Ikke levert — Kshana modellerer signalytelse, ikke nyttelast- eller antennemaskinvare. Uavhengig referanse (NoneKind): ingen: en disiplin som eies av partneren, uten modul og uten test etter utforming

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenariotype i motoren v{ $version }, familie <a1>Jamming, spoofing og spekteret</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-5d23d7f8f872 = Familieside: <a1>Jamming, spoofing og spekteret</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-3319b18ac61f = og { "1" } til i matrisen.

seg-9ca82c79430e = <b>MODELLED</b> Typen <c1/> utvidet utover L-båndet: bånd gitt som en preset-signalutforming (tegnet med hver komponent, båndbegrenset til sendebåndbredden, C/N0 og J/S referert til den sporede komponenten) eller som en egendefinert bærebølge og modulasjon Tester: <a1>leo_signal_reference.rs</a1>.

seg-ab8fe1c3cb79 = Kilde: <c1/>

seg-10a4479141b5 = <c1/> (scenariotype)

seg-fef00c827c6a = Spektrummodell og fossefall for L-båndet: hele GNSS L-båndet som én effekttetthet (PSD), frekvens på tvers, tid nedover, over en skriptet tidslinje for jammere. SIGNALER: GPS L1 C/A og L2C (BPSK({ "1" })), Galileo E1 åpen tjeneste (MBOC(6,1,1/11) eller BOC({ "1,1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), hver ved sin bærebølge med minste mottatte effekt fra grensesnittspesifikasjonen (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD) med mindre den overstyres; GLONASS, BeiDou og Galileo E6 er ikke modellert. JAMMERE: tone med kontinuerlig bølge, flatt smalbåndsstøy, lineær sagtannchirp og bredbåndsstøy tilpasset et bånds egen modulasjon, hver med et senter, en båndbredde, en mottatt effekt (direkte, eller EIRP og avstand gjennom frirommstapet til jamming-typen) og tidspunkter for på og av. Hver jammer vurderes mot hvert bånd med sin spektrale separasjonskoeffisient kappa over mottakerens båndbredde, og (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; for én jammer er dette lik anti-jam-ligningen til jamming-typen med Q = 1/(R_c kappa), og rapporten bærer den kontrollen (og tallet for representativ Q i jamming-typen ved siden av). Støygulvet er k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }). Fossefallet midler hver celle over sin bin og sin rad (chirper eksakt, hele sveip pluss det delvise; jammere som slår om midt i raden etter sin driftssyklus), slik at C/N0-tidslinjen og bildet kommer fra de samme tallene; result.json bærer nettet blokkmidlet i effekt, C/N0 og J/S per bånd per rad, og per jammer per bånd SSC, Q, J/S, J/S i båndet og stabil C/N0. Valgfri [iq]: modellen tegnet som kompleks IQ ved ett tidspunkt, skrevet til og lest tilbake fra en SigMF-opptaking (cf32_le eller ci16_le), og sammenlignet med et Welch-estimat. Valgfri [recording] (native bygg): Welch-PSD-en til en virkelig SigMF-opptaking ved siden av modellen. VALIDATED: signalenes PSD-er mot lærebokens bredder på hovedloben (BPSK(n) 2n x { "1.023" } MHz null til null; BOC({ "1,1" })-lober sentrert ved +/-1.023 MHz) og de spektrale separasjonskoeffisientene mot sine lukkede former etter Parseval og Kaplan & Hegartys Q = { "1" } (CW) og { "1.5" } (tilpasset). MODELLED: jammereffekter, tidslinje, båndbredder i frontenden, behandlingen av kontinuerlig spektrum (ingen kodelinjer) og fraværet av AGC, blanking og antennediagram.

seg-92f1d6d2c0f2 = En kjøring av <c1/> oppsummeres slik: scenario spectrum | { "5" } bands | { "3" } jammers | noise floor -202.0 dBW/Hz | worst band gps-l1ca min C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

seg-ed3a383d6f1e = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-fb332c77fd0e = Eksempelet <c1/> angir blant annet:

seg-df78607f9cdb = Resultatetikett (motorens): MODELLED: en effekttetthet for L-båndet bygget fra spektre for signaler i lukket form (VALIDATED mot lærebokens bredder på hovedloben og spektrale separasjonskoeffisienter), spektre for jammere og et kT-støygulv, redusert til J/S og effektiv C/N0 med den spektrale separasjonskoeffisienten. Jammereffektene, t

seg-ea1678eb9e84 = Diagrammet motoren skriver for scenarios/l-band-waterfall-jamming.toml, type spectrum

seg-ce0afea7b030 = <b>VALIDATED</b> Effekttettheter med enhetsareal for GPS L1 C/A og L2C (BPSK({ "1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) og Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, med en MBOC-variant lagt til), deres numerisk lokaliserte nullpunkter og

seg-7e315c5675d0 = <b>MODELLED</b> Typen <c1/>: et nett av frekvens mot tid for effekttettheten i L-båndet (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalene ved sine minste mottatte effekter fra grensesnittspesifikasjonen, og kontinuerlig bølge, smalbånd

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: les og skriv opptak i Signal Metadata Format (JSON .sigmf-meta med kjernefeltene global, captures og annotations; rå .sigmf-data som cf32_le, ci16_le eller ci8, heltallsdekoderne delt med realdata::iqif::load_iq), alt på s

seg-4e35cc861b15 = <b>VALIDATED</b> Effekttettheter med enhetsareal for GPS L1 C/A og L2C (BPSK({ "1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) og Galileo E1 MBOC(6,1,1/11) (navsignal::M. Uavhengig referanse (ExternalDataset): publiserte lærebokverdier: hovedloben til BPSK(n) på 2n x { "1.023" } MHz null til null og anti-jam-koeffisientene Q = { "1" } for en smalbåndsjammer (CW) og Q = { "1.5" } for en spredtspektrum-jammer tilpasset C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3. utg., avsnitt { "9.4" }); hovedlobene til BOC(m,n) sentrert ved pluss eller minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); den

seg-287de49e90a8 = <b>MODELLED</b> Typen <c1/>: et nett av frekvens mot tid for effekttettheten i L-båndet (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalene ved de. Uavhengig referanse (InternalConsistency): reduksjon til anti-jam-ligningen og lenkebudsjettet i den eksisterende typen <c2/> (den samme koden, kalt med de samme inndataene), og den lukkede formen for støygulvet k T0 F. Signalspektrene under er den validerte raden ovenfor; jammereffektene, tidslinjen og båndbreddene i frontenden er inndata i scenarioet, spektrene er kontinuerlige (ingen spredningskodelinjer), og ingen automatisk forsterkningsstyring, blanking eller antennediagram virker på jam

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: les og skriv opptak i Signal Metadata Format (JSON .sigmf-meta med kjernefeltene global, captures og annotations; rå .sigmf-data som cf32_le, ci1. Uavhengig referanse (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) med samme periodiske Hann-vindu, overlapp, tetthetsskalering, uten detrend og toveis middelverdi: hver bin innenfor { "1e-12" } relativt (observert { "6.0e-14" }) over { "27" } tilfeller, med antall segmenter hentet fra scipys eget spektrogram. sigmf-python { "1.13.0" } (LGPL-3.0, kjørt som verktøy) skriver fem tredjepartsopptak (cf32_le, ci16_le, ci8, to opptak med annotasjoner, en ikke-null fir

seg-0cbbe567f1c8 = linjestruktur i spredningskoden (for eksempel linjene på { "1" } kHz i C/A): toner vurderes mot den glatte omhyllingen (resultat <c1/>)

seg-2efdae3f5764 = automatisk forsterkningsstyring, kvantisering, pulsblanking og hakkfiltrering (resultat <c1/>)

seg-f3e58705c9a2 = mottaksantennens diagram mot jammeren utover ett forsterkningstall (resultat <c1/>)

seg-c0d379cb1ab3 = flerbrukerinterferens innad i systemet mellom satellitter i ett bånd (resultat <c1/>)

seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 og Galileo E6 (resultat <c1/>)

seg-249d8a46f95a = utstrålinger fra et konstruert signal utenfor sendebåndbredden: spekteret er avkortet der, så ingen utstråling utenfor båndet når et nabobånd (resultat <c1/>)

seg-cc83c047f02a = effekten av en chirp på sløyfen ved sveiphastigheter som kan sammenlignes med sløyfens båndbredde: dens C/N0 bruker spekteret midlet over raden (resultat <c1/>)

seg-7155706bc289 = MODELLED: en effekttetthet for L-båndet bygget fra spektre for signaler i lukket form (VALIDATED mot lærebokens bredder på hovedloben og spektrale separasjonskoeffisienter), spektre for jammere og et kT-støygulv, redusert til J/S og effektiv C/N0 med den spektrale separasjonskoeffisienten. Jammereffektene, tidslinjen og båndbreddene i frontenden er inndata i scenarioet, ikke målinger. (resultat <c1/>)

seg-95879767c438 = Temaside: <a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>Forrige</s1>space-weather

seg-ac2c9c25fbb6 = <s1>Neste</s1>spoof-detect
