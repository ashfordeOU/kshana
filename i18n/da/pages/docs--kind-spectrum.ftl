# docs--kind-spectrum: translations (da)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Ikke leveret — Kshana modellerer signalydelse, ikke nyttelast- eller antennehardware. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test, af design

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-304496607bd7 = Scenarietype i motoren v{ $version }, familie <a1>Jamming, spoofing og spektret</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-5d23d7f8f872 = Familieside: <a1>Jamming, spoofing og spektret</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-3319b18ac61f = og { "1" } flere i matrixen.

seg-9ca82c79430e = <b>MODELLED</b> Typen <c1/> udvidet ud over L-båndet: bånd angivet som en forudindstillet signaludformning (tegnet med hver komponent, båndbegrænset til sendebåndbredden, C/N0 og J/S henført til den sporede komponent) eller som en brugerdefineret bærebølge og modulation. Tests: <a1>leo_signal_reference.rs</a1>.

seg-ab8fe1c3cb79 = Kilde: <c1/>

seg-10a4479141b5 = <c1/> (scenarietype)

seg-fef00c827c6a = Spektrummodel og vandfald for L-båndet: hele GNSS-L-båndet som én effektspektraltæthed (PSD), frekvens på tværs og tid nedad, over en scriptet tidslinje for jammere. SIGNALER: GPS L1 C/A og L2C (BPSK({ "1" })), Galileo E1 open service (MBOC(6,1,1/11) eller BOC({ "1,1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), hver på sin bærebølge med den mindste modtagne effekt fra grænsefladespecifikationen (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), medmindre den tilsidesættes; GLONASS, BeiDou og Galileo E6 er ikke modelleret. JAMMERE: tone med kontinuert bølge, flad smalbåndsstøj, lineær savtands-chirp og bredbåndsstøj afstemt efter et bånds egen modulation, hver med en centerfrekvens, en båndbredde, en modtaget effekt (direkte eller EIRP og afstand gennem frirumsdæmpningen i jamming-typen) og tidspunkter for til og fra. Hver jammer vurderes mod hvert bånd ved sin spektrale separationskoefficient kappa over modtagerens båndbredde, og (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; for én jammer er dette lig med ligningen for anti-jam i jamming-typen med Q = 1/(R_c kappa), og rapporten bærer den krydskontrol (og tallet for repræsentativ Q fra jamming-typen ved siden af). Støjgulvet er k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }). Vandfaldet middelværdisætter hver celle over dens bin og dens række (chirps nøjagtigt, hele sweeps plus det delvise; jammere, der skifter midt i en række, efter deres duty), så tidslinjen for C/N0 og billedet kommer fra de samme tal; result.json bærer gitteret blokmiddelværdisat i effekt, C/N0 og J/S pr. række for hvert bånd og pr. jammer pr. bånd SSC, Q, J/S, J/S i båndet og stationær C/N0. Valgfri [iq]: modellen tegnet som kompleks IQ på ét tidspunkt, skrevet til og læst tilbage fra en SigMF-optagelse (cf32_le eller ci16_le) og sammenlignet med et Welch-estimat. Valgfri [recording] (native builds): Welch-PSD'en for en reel SigMF-optagelse ved siden af modellen. VALIDATED: signalernes PSD'er mod lærebogens bredder af hovedlap (BPSK(n) 2n x { "1.023" } MHz nul til nul; BOC({ "1,1" })-lapper centreret ved +/-1.023 MHz) og de spektrale separationskoefficienter mod deres lukkede former efter Parseval og Kaplan & Hegartys Q = { "1" } (CW) og { "1.5" } (afstemt). MODELLED: jammernes effekter, tidslinjen, båndbredderne i front-enden, behandlingen med kontinuert spektrum (ingen kodelinjer) og fraværet af AGC, blanking og antennediagram.

seg-92f1d6d2c0f2 = Én kørsel af <c1/> opsummeres som: scenarie spectrum | { "5" } bånd | { "3" } jammere | støjgulv -202.0 dBW/Hz | dårligste bånd gps-l1ca min. C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

seg-ed3a383d6f1e = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-fb332c77fd0e = Eksemplet <c1/> angiver blandt andet:

seg-df78607f9cdb = Resultatetiket (motorens egen): MODELLED: en effektspektraltæthed i L-båndet bygget af signalspektre i lukket form (VALIDATED mod lærebogens bredder af hovedlap og spektrale separationskoefficienter), jammerspektre og et kT-støjgulv, reduceret til J/S og effektiv C/N0 ved den spektrale separationskoefficient. Jammernes effekter, t

seg-ea1678eb9e84 = Diagrammet, som motoren skriver for scenarios/l-band-waterfall-jamming.toml, type spectrum

seg-ce0afea7b030 = <b>VALIDATED</b> Effektspektraltætheder med enhedsareal for GPS L1 C/A og L2C (BPSK({ "1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) og Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, med en MBOC-variant tilføjet), deres numerisk lokaliserede nuller og

seg-7e315c5675d0 = <b>MODELLED</b> Typen <c1/>: et gitter af frekvens efter tid for effektspektraltætheden i L-båndet (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalerne ved deres mindste modtagne effekter fra grænsefladespecifikationen og kontinuert bølge, smalb

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: læs og skriv optagelser i Signal Metadata Format (JSON .sigmf-meta med felterne core global, captures og annotations; rå .sigmf-data som cf32_le, ci16_le eller ci8, heltalsafkoderne delt med realdata::iqif::load_iq), alle på s

seg-4e35cc861b15 = <b>VALIDATED</b> Effektspektraltætheder med enhedsareal for GPS L1 C/A og L2C (BPSK({ "1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) og Galileo E1 MBOC(6,1,1/11) (navsignal::M. Uafhængig reference (ExternalDataset): offentliggjorte lærebogsværdier: hovedlappen for BPSK(n) på 2n x { "1.023" } MHz nul til nul og anti-jam-koefficienterne Q = { "1" } for en smalbåndsjammer (CW) og Q = { "1.5" } for en spread spectrum-jammer afstemt til C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3. udg., afsnit { "9.4" }); hovedlapperne for BOC(m,n) centreret ved plus eller minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); de

seg-287de49e90a8 = <b>MODELLED</b> Typen <c1/>: et gitter af frekvens efter tid for effektspektraltætheden i L-båndet (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalerne ved de. Uafhængig reference (InternalConsistency): reduktion til ligningen for anti-jam og linkbudgettet i den eksisterende type <c2/> (den samme kode, kaldt med de samme input) og den lukkede form for støjgulvet k T0 F. Signalspektrene nedenunder er den validerede række ovenfor; jammernes effekter, tidslinje og båndbredder i front-enden er input til scenariet, spektrene er kontinuerte (ingen linjer fra spredningskoden), og ingen automatisk forstærkningsregulering, blanking eller antennediagram virker på j

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: læs og skriv optagelser i Signal Metadata Format (JSON .sigmf-meta med felterne core global, captures og annotations; rå .sigmf-data som cf32_le, ci1. Uafhængig reference (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) med det samme periodiske Hann-vindue, overlap, tæthedsskalering, ingen detrend og tosidet middelværdi: hver bin inden for { "1e-12" } relativt (observeret { "6.0e-14" }) over { "27" } tilfælde, med antal segmenter taget fra scipys eget spektrogram. sigmf-python { "1.13.0" } (LGPL-3.0, kørt som værktøj) skriver fem tredjepartsoptagelser (cf32_le, ci16_le, ci8, to captures med annotations, en ikke-nul fir

seg-0cbbe567f1c8 = linjestrukturen i spredningskoden (for eksempel linjerne på { "1" } kHz i C/A): toner vurderes mod den glatte envelope (resultat <c1/>)

seg-2efdae3f5764 = automatisk forstærkningsregulering, kvantisering, pulsblanking og notchfiltrering (resultat <c1/>)

seg-f3e58705c9a2 = modtageantennens diagram mod jammeren ud over ét forstærkningstal (resultat <c1/>)

seg-c0d379cb1ab3 = flerbrugsinterferens inden for systemet mellem satellitter i ét bånd (resultat <c1/>)

seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 og Galileo E6 (resultat <c1/>)

seg-249d8a46f95a = et designet signals emissioner uden for dets sendebåndbredde: dets spektrum afskæres der, så ingen emission uden for båndet når et nabobånd (resultat <c1/>)

seg-cc83c047f02a = en chirps virkning på sløjfen ved sweep-hastigheder, der kan sammenlignes med sløjfens båndbredde: dens C/N0 bruger det rækkemiddelværdisatte spektrum (resultat <c1/>)

seg-7155706bc289 = MODELLED: en effektspektraltæthed i L-båndet bygget af signalspektre i lukket form (VALIDATED mod lærebogens bredder af hovedlap og spektrale separationskoefficienter), jammerspektre og et kT-støjgulv, reduceret til J/S og effektiv C/N0 ved den spektrale separationskoefficient. Jammernes effekter, tidslinje og båndbredder i front-enden er input til scenariet, ikke målinger. (resultat <c1/>)

seg-95879767c438 = Emneside: <a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>Forrige</s1>space-weather

seg-ac2c9c25fbb6 = <s1>Næste</s1>spoof-detect
