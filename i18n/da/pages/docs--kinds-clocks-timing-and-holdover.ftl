# docs--kinds-clocks-timing-and-holdover: translations (da)

seg-b03d56f501c3 = Type

seg-78cba87823f7 = Ur-holdover mod specifikation; valgfrit Monte Carlo-ensemble (runs > { "1" }).

seg-cb0b7da83f5c = Diagrammet, som motoren skriver for scenarios/clock-ensemble.toml, type clock

seg-c0924aa36e64 = MODELLED holdover-test af et tidssynkroniseringssystem, bedømt ud fra en tidsfejlregistrering, som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-log, en chrony-tracking- eller statistiklog, en TICC-, TimeLab- eller RINEX-urlog eller time_s,time_error_ns-par). Testen har fire trin, og Kshana udfører ingen af dem: en låst BASELINE, GNSS FJERNET af operatøren (antennekablet eller simulatorens output; Kshana udsender og styrer intet) på et angivet tidspunkt, HOLDOVER på systemets egen oscillator og RECOVERY, efter at operatøren genopretter GNSS på et andet angivet tidspunkt. Registreringen deles ved disse to tidspunkter. Baseline: tidsfejlsstatistik og de ITU-T-masker, der er skrevet til et låst ur. Holdover: statistik, den fraktionelle frekvensoffset, som systemet holdt (en mindste kvadraters linje), de masker, der er skrevet til holdover eller et autonomt ur, ePRTC-A-holdover-kuverten ud fra den angivne låste varighed og tiden til at overskride hvert tidsfejlbudget. Recovery: om og hvornår |TE| kom inden for et angivet bånd og blev der, toppen og det største trin. Hver grænse er afskrevet fra en offentlig ITU-T-tabel (masker for telekommunikationstidssynkronisering); ordene er 'målt mod masken', og de to tidspunkter er operatørens udsagn, ikke verificeret. En registrering, der er for kort til en maske, er INCOMPLETE og aldrig ekstrapoleret. Se docs/TIMING-HIL.md.

seg-8ce93392747b = Diagrammet, som motoren skriver for scenarios/holdover-test-ptp4l.toml, scenarietype holdover-test

seg-540545e6f846 = MODELLED kæde for troværdig kvantetidssynkronisering: et budget for tidsoverførsel fra ende til ende med kvante (optisk gitterur + sammenfiltrings-/enkeltfotonforbindelse) mod klassisk (CSAC + RF tovejs), et genbrugt beskyttelsesniveau for tidssynkronisering + et kvalitetsmål for sikkerhed mod forsinkelses- og genafspilningsangreb (1-P_md), en sandsynlighed for detektion af uranomalier + CUSUM-latens og afvejningen mellem kvante og klassisk som ærlig TradeEvidence med en repræsentativitets- og gaps-to-flight-registrering. Illustrative parametre for enhed og forbindelse fra offentlige kilder; modellerer klassen, ingen TRL/flyvning/certificering påstås.

seg-09760f892c7b = Diagrammet, som motoren skriver for scenarios/quantum-time-transfer.toml, type quantum-time-transfer

seg-1b61962464c5 = Slottidssynkronisering: sekunder, indtil et frit løbende ur forlader beskyttelsesintervallet for en tidsindekseret routing- eller opgaveslot (den største absolutte tidsfejl, slotten tåler), bidraget fra hvert led på det tidspunkt med det dominerende led nævnt (usikkerhed i tidsfixet, hvid fasestøj, hvid, flicker, random walk og random run i frekvensstøj, resterende frekvensforskydning, temperatur, aldring), den tid, der er tilbage siden det sidste tidsfix, og det største interval mellem tidsfix, der holder uret inden for, netto af latens for tidsfixet. Oscillatoren er en KLASSESTANDARD (csac, uso, dsac, tcxo, ocxo eller rafs: én citeret Allan-deviation ved ét sekund og et antaget gulv med rød støj), en FORUDINDSTILLING FRA ET DATABLAD for telekommunikationstidssynkronisering eller et indlejret DATABLAD (maksima for Allan-deviation tilpasset som en envelope, plus aldring og en temperaturkoefficient) eller en indlejret MEASURED FASEREGISTRERING (dens overlappende Allan-deviation tilpasset ved vægtede mindste kvadrater i basen af hvid fase og IEEE Std { "1139" }-frekvensmodulation, så gulvet med rød støj er målt og ikke antaget). Et brud ud over den længste middelværdiperiode, som databladet eller registreringen understøtter, markeres som ekstrapoleret. Et valgfrit afsnit om spoofing tilføjer beskyttelsesniveauet for tidssynkronisering for en modtager i kredsløb: banehastighed og omløbstid, hvor længe en enkelt spoofer på jorden kan nå satellitten pr. overflyv, gulvet for den urstøttede monitor og CUSUM-detektionslatens, den betingede grænse, det træk, en spoofer ved en angivet maksimal rampehastighed samler, før satellitten forlader dens rækkevidde, eller en uafhængig kontrol kører, og om hver kontrol ved jordkontakt eller krydsforbindelse er uafhængig af den spoofer. VALIDATED: inversionen af holdover ud fra en tilpasset registrering, holdt ude (held out) på et reelt cæsiumur målt mod en brintmaser (tests/slot_timing_cs5071a_holdout.rs, datastyret); på en målt krystaloscillator er den tilbageholdte forudsigelse konservativ, men ikke inden for tærsklen, så krystaltilfældet er MODELLED. MODELLED: klasse- og databladskilder, de deterministiske led og vurderingen af spoofing.

seg-97a91c8a60cd = Diagrammet, som motoren skriver for scenarios/slot-timing-ocxo-leo.toml, type slot-timing

seg-4f19d4fb1341 = Generisk N-D-sweep over en vilkårlig pakke via punkterede TOML-nøgler / JSON-metrikstier.

seg-621a18c07044 = Diagrammet, som motoren skriver for scenarios/sweep-nd-inertial.toml, type sweep-nd

seg-e7ab7b55c969 = 1-D-sweep til afvejningsstudie over en parameter for en urpakke.

seg-c784b8f22f12 = Diagrammet, som motoren skriver for scenarios/sweep-clock-stability.toml, type sweep

seg-a448b24ded2b = Tidssynkronisering i telekommunikation: tidsfejl, maksimal tidsintervalfejl (MTIE) og tidsdeviation (TDEV) for en GNSS-holdover, kontrolleret mod ITU-T-masker med en PASS eller FAIL og en margen pr. maske. Input er enten en SYNTETISK HOLDOVER (en forudindstilling for oscillator -- ocxo, rubidium, cæsium eller csac, hver med stabilitets-, aldrings- og temperaturtal fra et navngivet offentligt Microchip-datablad -- plus tidspunktet for GNSS-tab, registreringens længde og sampleintervallet; det frit løbende ur har hvid og flicker-frekvensstøj og, hvor datablads-tilpasningen kræver det, random walk-frekvensstøj, lineær aldring og et sinusformet temperaturled) eller en INDLÆST SERIE af par [time_s, time_error_ns] angivet indlejret (og, kun på native builds, en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A og PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tables 1-2, TDEV Tables 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst ({ "30" } ns, Tables 1-2) og ePRTC-A holdover (tidsfejlens envelope i Table { "3" }, der stiger fra { "30" } ns til { "100" } ns over holdover-perioden H fastsat af den låste varighed, MTIE Table { "4" }, TDEV Table { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) klasserne A-C for T-BC/T-TSC (max|TE|, konstant tidsfejl, lavpasfiltreret MTIE og TDEV) og klasse D (max|TE_L| { "5" } ns, det eneste tal for klasse D, der ikke er overladt til videre undersøgelse); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referencepunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns med MTIE Tables 7-1 til 7-3). Hver post, som en anbefaling markerer til videre undersøgelse, er udeladt og ikke udfyldt, og hver rapport angiver, hvad der ikke er implementeret. Rapporterer også tiden til at overskride hvert budget for maksimal tidsfejl (standarder: { "100" } ns ePRTC max|TE_HO|, { "400" } ns tildeling for holdover i netværket, { "1100" } ns punkt C, { "1.5" } us klasse { "4" }), kurverne for MTIE/TDEV som en CSV-tabel med hver grænse for masken og en post om enheder og proveniens pr. numerisk felt. VALIDATED: estimatorerne for MTIE og TDEV mod pakken allantools på en indsendt holdover-serie. MODELLED: masketabellerne er transskriptioner, og en syntetisk holdover er en model bygget af maksima fra datablade, ikke en måling af nogen enhed. Ikke en overensstemmelsestest.

seg-ec7745a09d08 = Diagrammet, som motoren skriver for scenarios/telecom-synce-eec.toml, type telecom-timing

seg-9a2bb9809aed = Tovejs tids- og frekvensoverførsel via satellit mellem to stationer gennem et geostationært relæ: tovejsligningen løst for T_A - T_B med hvert ikke-reciprokt led (stationsudstyrets forsinkelser, Ku-bånds-ionosfære, transponder, Sagnac), et usikkerhedsbudget i kvadratur, hvis type A-led er den simulerede forbindelses TDEV ved middelværditiden, en simuleret forbindelse med hvid og flicker-fasestøj og en døgnvariabel ikke-reciprocitet, samt stabiliteten (rate, residual-RMS, TDEV, ADEV) af alle leverede serier fra BIPM Circular T Section { "1" }, MJD,ns CSV eller IGS RINEX-stationsurposter. MODELLED.

seg-92d3c84024d7 = Diagrammet, som motoren skriver for scenarios/time-transfer-budget.toml, type time-transfer-budget

seg-ccb244e60d60 = Optisk mod RF tovejs tids-/frekvensoverførsel.

seg-bd76bd68eab3 = Diagrammet, som motoren skriver for scenarios/timetransfer.toml, type timetransfer

seg-4e31c8daf798 = Register

seg-45a59bc9ac90 = Kilde: <c1/>

seg-3b549536beed = Ure, tidssynkronisering og holdover (scenarietypefamilie)

seg-9095869ec445 = { "9" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-59c2beac56b5 = Emnesider: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Kør én: <c1/>. Alle familier: <a5>KINDS.md</a5>.

seg-b333618375db = Kontaktark med de diagrammer, som motoren skriver for typerne i familien Ure, tidssynkronisering og holdover

seg-efd15cff3d32 = MODELLED (resultatbetegnelse)

seg-ff7dca09f0f2 = Telekommunikationstidssynkronisering: tidsfejl, maksimal tidsintervalfejl (MTIE) og tidsdeviation (TDEV) for en GNSS-holdover, kontrolleret mod ITU-T-masker med PASS eller FAIL og en margin pr. maske.

seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

seg-413edbab9fa9 = Slot-tidssynkronisering: sekunder, før et frit løbende ur forlader beskyttelsesintervallet for et tidsindekseret rutings- eller opgaveslot (den største absolutte tidsfejl, slottet tåler), bidraget fra hvert led på det

seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

seg-d425ce2b9f9c = Tovejs tids- og frekvensoverførsel via satellit mellem to stationer gennem et geostationært relæ: tovejsligningen løst for T_A - T_B med hvert ikke-reciprokt led (stationsudstyrets forsinkelser, Ku

seg-a2a710b3204f = MODELLED holdover-test af et tidssynkroniseringssystem, bedømt ud fra en tidsfejlregistrering, som OPERATØREN leverer (en linuxptp ptp4l-, phc2sys- eller ts2phc-log, en chrony tracking- eller statistics-log, en TICC, TimeLab eller RINEX

seg-1da440dd525c = MODELLED kæde til pålidelig kvantetidssynkronisering: et end-to-end-budget for kvante- (optisk gitterur + sammenfiltring/enkeltfoton-forbindelse) mod klassisk (CSAC + RF tovejs) tidsoverførsel, en genbrugt tidssynkroniseringsbeskyttelse

seg-50d75d48ed43 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>, <c8/>.

seg-3273244f755c = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>clock</a1>.

seg-ee8d6e20c844 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valgfrie: <c7/>.

seg-e359cc42506e = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>sweep</a1>.

seg-616716b33732 = Obligatoriske felter: <c1/>, <c2/>, <c3/>.

seg-6f282be980ca = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>sweep-nd</a1>.

seg-79c3d3cd6c7d = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-c23e498daa3d = <b>Register:</b> MODELLED { "5" } · VALIDATED { "1" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>telecom-timing</a1>.

seg-248e1686fddc = Obligatoriske felter: <c1/>, <c2/>. Valgfrie: <c3/>.

seg-cc04bc2d43c5 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "1" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>slot-timing</a1>.

seg-50273a29deec = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-adf570e18299 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>timetransfer</a1>.

seg-5134a01b60a0 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Valgfrie: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-09b554a74d49 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>time-transfer-budget</a1>.

seg-58952681ea9d = Obligatoriske felter: <c1/>, <c2/>. Valgfrie: <c3/>, <c4/>.

seg-635ec95c2e86 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>holdover-test</a1>.

seg-76bb4110ea36 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-bb6d7df61e2f = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>quantum-time-transfer</a1>.

seg-245adc6e6766 = <s1>Forrige</s1>Kampagner

seg-960d5c757310 = <s1>Næste</s1>Konstellationer dækning og geometri
