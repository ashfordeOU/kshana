# docs--kind-telecom-timing: translations (nb)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Scenariotype i motoren v{ $version }, familie <a1>Klokker, tidssynkronisering og holdover</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: ett parserlag som gjør en RINEX-klokkefil (AS/AR-poster for én navngitt klokke, versjoner { "2" } og { "3.00" } til { "3.04" }), en ASCII-fase- eller frekvenslogg i TimeLab-stil, eller en tidsstempel- eller intervalllogg fra TAPR TICC om til en enhetlig pha Tester: <a1>clock_log_allantools.rs</a1>.

seg-849c08d3ce70 = Familieside: <a1>Klokker, tidssynkronisering og holdover</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-e7273fd2a640 = <b>VALIDATED</b> Maksimal tidsintervallfeil og tidsavvik som scenariotypen <c1/> rapporterer, på en holdover-registrering i telekommunikasjonsskala: en O(n) monoton kø-glidende. Uavhengig referanse (ExternalDataset): allantools { "2024.06" }, et uavhengig tredjeparts bibliotek for frekvensstabilitet, mtie() og tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, serien tolket fra den samme teksten med 17 gjeldende sifre på begge sider; referansen registrerer seriens SHA-256 og kan gjenskapes frakoblet via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerer ESTIMATORENE på denne registreringen, ikke syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Avskrevne grenser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A holdover (inkludert tidsfeilenvelopen i tabell { "3" }. Uavhengig referanse (InternalConsistency): Avskrift av de navngitte anbefalingene (fritt tilgjengelige på itu.int), der hver grense bærer sin tabell eller sin klausul, oppført sammen med hvert ubekreftet eller uimplementert punkt i docs/TELECOM-TIMING.md; identitetene for kontinuitet i knekkpunktene som tabellene medfører, kontrolleres i testene. En standardavskrift med interne konsistenskontroller, ikke en test av overensstemmelse og ikke en ekstern validering. { "0.30" } runde { "2" } (forhåndsregistrert

seg-5547f1f662d3 = og { "2" } til i matrisen.

seg-8aee75a55007 = ocxo

seg-9b72d3b3a0ab = Kilde: <c1/>

seg-f4dc88ffe6b5 = <c1/> (scenariotype)

seg-a448b24ded2b = Tidssynkronisering i telekom: tidsfeil, maksimal tidsintervallfeil (MTIE) og tidsavvik (TDEV) for en GNSS-holdover, kontrollert mot ITU-T-masker med PASS eller FAIL og en margin per maske. Inndata er enten en SYNTETISK HOLDOVER (en forhåndsinnstilling for oscillator, ocxo, rubidium, cesium eller csac, hver med tallene for stabilitet, aldring og temperatur fra et navngitt offentlig Microchip-datablad, pluss tidspunktet for GNSS-tap, registreringslengden og samplingsintervallet; den frittløpende klokken bærer hvit, flicker og, der tilpasningen til databladet krever det, random-walk frekvensstøy, lineær aldring og et sinusformet temperaturledd) eller en INNLEST SERIE av par [time_s, time_error_ns] oppgitt innebygd (og, kun i native bygg, en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A og PRTC-B (maks|TE| { "100" } / { "40" } ns, MTIE tabell 1-2, TDEV tabell 3-4); G.8272.1 ({ "2024" }) tillegg { "1" } (07/2025) ePRTC låst ({ "30" } ns, tabell 1-2) og ePRTC-A holdover (tidsfeilomhyllingen i tabell { "3" } som stiger fra { "30" } ns til { "100" } ns over holdover-perioden H bestemt av den låste varigheten, MTIE tabell { "4" }, TDEV tabell { "5" }); G.8273.2 ({ "2023" }) tillegg { "2" } (11/2025) T-BC/T-TSC klassene A-C (maks|TE|, konstant tidsfeil, lavpassfiltrert MTIE og TDEV) og klasse D (maks|TE_L| { "5" } ns, det eneste tallet for klasse D som ikke er overlatt til videre studium); G.8271.1 ({ "2022" }) tillegg { "3" } (05/2025) referansepunkt C (maks|TE_L| { "1100" } / { "600" } / { "100" } ns med MTIE tabell 7-1 til 7-3). Hver post en anbefaling markerer for videre studium er utelatt i stedet for fylt inn, og hver rapport lister hva som ikke er implementert. Rapporterer også tiden til hvert budsjett for maksimal tidsfeil overskrides (standard: { "100" } ns ePRTC maks|TE_HO|, { "400" } ns tildeling for nettverks-holdover, { "1100" } ns punkt C, { "1.5" } us klasse { "4" }), kurvene for MTIE/TDEV som en CSV-tabell med hver maskegrense, og en oppføring for enheter og opphav per numerisk felt. VALIDATED: estimatorene for MTIE og TDEV mot pakken allantools på en innsjekket holdover-serie. MODELLED: masketabellene er transkripsjoner, og en syntetisk holdover er en modell bygget fra maksimalverdier i datablad, ikke en måling av noen enhet. Ikke en overensstemmelsestest.

seg-07f81cfd606a = En kjøring av <c1/> oppsummeres slik: telecom-timing: max|TE| { "488.2" } ns over { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

seg-17f291bfc65d = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-d192feecd4b3 = Eksempelet <c1/> angir blant annet:

seg-e7cab30ef039 = [] (ingen elementer)

seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

seg-01b1287f233b = Resultatetikett (motorens): MODELLED — tidsfeil, MTIE og TDEV kontrollert mot transkriberte ITU-T-masker. Estimatorene er validert mot allantools; masketabellene er transkripsjoner av de navngitte anbefalingene; en syntetisk holdover er en modell bygget fra offentlige tall i datablad, ikke en måling av noen enhet. Ikke en overensst

seg-ec7745a09d08 = Diagrammet motoren skriver for scenarios/telecom-synce-eec.toml, type telecom-timing

seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-c21ebd79f497 = <b>VALIDATED</b> Maksimal tidsintervallfeil og tidsavvik som scenariotypen <c1/> rapporterer, på en holdover-registrering i telekomskala: en O(n) MTIE med glidende vindu og monoton kø (telecom_timing::mtie_sliding, nødvendig for at et døgn med sampler på ett sekund Tester: <a1>telecom_timing_reference.rs</a1>.

seg-75aa6f7234ae = <b>MODELLED</b> Transkriberte grenser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) tillegg. Tester: <a1>telecom_timing_reference.rs</a1>.

seg-d0ab0ca72b80 = <b>MODELLED</b> Sju MTIE- og TDEV-masker for generering av svingninger ved konstant temperatur for typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) typene I, II og III, G.8262 (10/2024) EEC alternativene { "1" } og { "2" } og G.8262.1 (11/2025) eEEC (låst

seg-d4bd840708db = <b>MODELLED</b> Fire forhåndsinnstillinger, OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A høyytelsesrør) og CSAC (Microchip SA.45s), hver med . Uavhengig referanse (InternalConsistency): de fire navngitte Microchip-databladene (dokumentnumre og URL-er i hver forhåndsinnstilling og i docs/TELECOM-TIMING.md) for inndatatallene; den lukkede aldringsrampen og tilpasningens omhyllingsegenskap som interne kontroller. Hvordan tallene blir en støymodell, altså tilpasningen, regelen for gulvet, måneden på 30 dager og den lineære tolkningen av temperatur, er et modelleringsvalg; ingen forhåndsinnstilling er en måling av en enhet. { "0.30" } runde { "2" }, ensidige terskler mot

seg-cbb39b4105ac = hvert krav anbefalingene markerer «for videre studium» (klasse D utover maks|TE_L|, ePRTC-B holdover, T-BC/T-TSC holdover når begge inngangene er tapt, nettverksgrenser for TDEV, MTIE og TDEV for ePRTC-A holdover utover { "10 000" } s) (resultat <c1/>)

seg-a70f575aeb21 = høypassfiltrert dynamisk tidsfeil (dTE_H, G.8273.2 tabell 7-7 og G.8271.1 punktene 7.3.2-7.3.3) (resultat <c1/>)

seg-66446247fc49 = MTIE ved variabel temperatur i G.8273.2 tabell 7-6 og MTIE for holdover med støtte fra fysisk lag i G.8273.2 tabell 7-10 (resultat <c1/>)

seg-c1d601b45182 = relativ tidsfeil (cTE_R, dTE_R,L) mellom to utganger (resultat <c1/>)

seg-6146f857c2df = pakkefilteret med glidende gjennomsnitt som G.8272 og G.8272.1 oppgir for PTP-grensesnitt: serien behandles som ett puls-per-sekund tidsintervallfeil (resultat <c1/>)

seg-d5e956023b48 = MODELLED — tidsfeil, MTIE og TDEV kontrollert mot transkriberte ITU-T-masker. Estimatorene er validert mot allantools; masketabellene er transkripsjoner av de navngitte anbefalingene; en syntetisk holdover er en modell bygget fra offentlige tall i datablad, ikke en måling av noen enhet. Ikke en overensstemmelsestest. (resultat <c1/>)

seg-f163ae37b8c7 = MODELLED: masketabellene er transkripsjoner, og en syntetisk holdover er en modell bygget fra maksimalverdier i datablad, ikke en måling av noen enhet. (typekatalog (<c1/>))

seg-a0ddb65b00af = Klokken: forhåndsinnstillingen OCXO (Microchip OX-208-datablad, Rev 12-1-2021), frittløpende fra første sample med hvit, flicker og (der tilpasningen krever det) random-walk frekvensstøy tilpasset maksimalverdiene for Allan-avvik i databladet, og dens lineære aldring. Temperaturen holdes konstant (amplitude { "0" } K), slik maskene forutsetter. (kommentar i scenariofilen, linje { "12" } til { "15" })

seg-101dbde1c65b = Temaside: <a1>CLOCK-LOG-FORMATS.md</a1>

seg-c32dc02f981d = <s1>Forrige</s1>sweep

seg-8aef86c9aa68 = <s1>Neste</s1>terrain-nav
