# docs--kind-telecom-timing: translations (da)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-e7273fd2a640 = <b>VALIDATED</b> Den maksimale tidsintervalfejl og tidsafvigelse, som scenarietypen <c1/> rapporterer, på en holdover-registrering i telekomskala: et O(n) monotont kø-glidende. Uafhængig reference (ExternalDataset): allantools { "2024.06" }, et uafhængigt frekvensstabilitetsbibliotek fra tredjepart, mtie() og tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, hvor serien er parset fra den samme tekst med 17 betydende cifre på begge sider; referencen registrerer seriens SHA-256 og kan genskabes offline via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerer ESTIMATORERNE på denne registrering, ikke syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Afskrevne grænser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A-holdover (herunder tabel { "3" }-tidsfejlkuverten. Uafhængig reference (InternalConsistency): Afskrift af de navngivne anbefalinger (frit tilgængelige på itu.int), hvor hver grænse bærer sin tabel eller klausul, opført med alle ubekræftede eller uimplementerede punkter i docs/TELECOM-TIMING.md; de identiteter for kontinuitet i knækpunkter, som tabellerne indebærer, kontrolleres i testene. En afskrift af standarder med interne konsistenskontroller, ikke en overensstemmelsestest og ikke en ekstern validering. { "0.30" } runde { "2" } (præregistrer

seg-5547f1f662d3 = og { "2" } flere i matrixen.

seg-8aee75a55007 = ocxo

seg-9b72d3b3a0ab = Kilde: <c1/>

seg-f4dc88ffe6b5 = <c1/> (scenarietype)

seg-a448b24ded2b = Tidssynkronisering i telekommunikation: tidsfejl, maksimal tidsintervalfejl (MTIE) og tidsdeviation (TDEV) for en GNSS-holdover, kontrolleret mod ITU-T-masker med en PASS eller FAIL og en margen pr. maske. Input er enten en SYNTETISK HOLDOVER (en forudindstilling for oscillator -- ocxo, rubidium, cæsium eller csac, hver med stabilitets-, aldrings- og temperaturtal fra et navngivet offentligt Microchip-datablad -- plus tidspunktet for GNSS-tab, registreringens længde og sampleintervallet; det frit løbende ur har hvid og flicker-frekvensstøj og, hvor datablads-tilpasningen kræver det, random walk-frekvensstøj, lineær aldring og et sinusformet temperaturled) eller en INDLÆST SERIE af par [time_s, time_error_ns] angivet indlejret (og, kun på native builds, en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A og PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tables 1-2, TDEV Tables 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst ({ "30" } ns, Tables 1-2) og ePRTC-A holdover (tidsfejlens envelope i Table { "3" }, der stiger fra { "30" } ns til { "100" } ns over holdover-perioden H fastsat af den låste varighed, MTIE Table { "4" }, TDEV Table { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) klasserne A-C for T-BC/T-TSC (max|TE|, konstant tidsfejl, lavpasfiltreret MTIE og TDEV) og klasse D (max|TE_L| { "5" } ns, det eneste tal for klasse D, der ikke er overladt til videre undersøgelse); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referencepunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns med MTIE Tables 7-1 til 7-3). Hver post, som en anbefaling markerer til videre undersøgelse, er udeladt og ikke udfyldt, og hver rapport angiver, hvad der ikke er implementeret. Rapporterer også tiden til at overskride hvert budget for maksimal tidsfejl (standarder: { "100" } ns ePRTC max|TE_HO|, { "400" } ns tildeling for holdover i netværket, { "1100" } ns punkt C, { "1.5" } us klasse { "4" }), kurverne for MTIE/TDEV som en CSV-tabel med hver grænse for masken og en post om enheder og proveniens pr. numerisk felt. VALIDATED: estimatorerne for MTIE og TDEV mod pakken allantools på en indsendt holdover-serie. MODELLED: masketabellerne er transskriptioner, og en syntetisk holdover er en model bygget af maksima fra datablade, ikke en måling af nogen enhed. Ikke en overensstemmelsestest.

seg-07f81cfd606a = Én kørsel af <c1/> opsummeres som: telecom-timing: max|TE| { "488.2" } ns over { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

seg-17f291bfc65d = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-d192feecd4b3 = Eksemplet <c1/> angiver blandt andet:

seg-e7cab30ef039 = [] (ingen elementer)

seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

seg-01b1287f233b = Resultatetiket (motorens egen): MODELLED — tidsfejl, MTIE og TDEV kontrolleret mod transskriberede ITU-T-masker. Estimatorerne er valideret mod allantools; masketabellerne er transskriptioner af de navngivne anbefalinger; en syntetisk holdover er en model bygget af offentlige tal fra datablade, ikke en måling af nogen enhed. Ikke en overensstemmelsestest

seg-ec7745a09d08 = Diagrammet, som motoren skriver for scenarios/telecom-synce-eec.toml, type telecom-timing

seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-c21ebd79f497 = <b>VALIDATED</b> Den maksimale tidsintervalfejl og tidsdeviation, som scenarietypen <c1/> rapporterer, på en holdover-registrering i telekommunikationsskala: en MTIE med glidende vindue og monoton kø i O(n) (telecom_timing::mtie_sliding, nødvendig for at et døgn med sekundsamp Tests: <a1>telecom_timing_reference.rs</a1>.

seg-75aa6f7234ae = <b>MODELLED</b> Transskriberede grænser for ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Tests: <a1>telecom_timing_reference.rs</a1>.

seg-d0ab0ca72b80 = <b>MODELLED</b> Syv masker for MTIE og TDEV ved konstant temperatur for generering af wander til typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) Types I, II og III, G.8262 (10/2024) EEC Options { "1" } og { "2" } og G.8262.1 (11/2025) eEEC (låst

seg-d4bd840708db = <b>MODELLED</b> Fire forudindstillinger — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cæsium (Microchip 5071A, højtydende rør) og CSAC (Microchip SA.45s) — hver med . Uafhængig reference (InternalConsistency): de fire navngivne Microchip-datablade (dokumentnumre og URL'er i hver forudindstilling og i docs/TELECOM-TIMING.md) for inputtallene; rampen for aldring i lukket form og tilpasningens egenskab som envelope som interne kontroller. Hvordan tallene bliver til en støjmodel — tilpasningen, reglen for gulvet, måneden på 30 dage, aflæsningen af lineær temperatur — er et modelvalg; ingen forudindstilling er en måling af en enhed. Runde { "0.30" } { "2" }, ensidede tærskler mod

seg-cbb39b4105ac = ethvert krav, som anbefalingerne markerer 'til videre undersøgelse' (klasse D ud over max|TE_L|, ePRTC-B-holdover, holdover for T-BC/T-TSC med begge input tabt, netværksgrænser for TDEV, MTIE og TDEV for ePRTC-A-holdover ud over { "10 000" } s) (resultat <c1/>)

seg-a70f575aeb21 = dynamisk tidsfejl med højpasfilter (dTE_H, G.8273.2 Table 7-7 og G.8271.1 klausul 7.3.2-7.3.3) (resultat <c1/>)

seg-66446247fc49 = MTIE ved variabel temperatur i G.8273.2 Table 7-6 og MTIE for holdover med assistance fra det fysiske lag i G.8273.2 Table 7-10 (resultat <c1/>)

seg-c1d601b45182 = relativ tidsfejl (cTE_R, dTE_R,L) mellem to udgange (resultat <c1/>)

seg-6146f857c2df = pakkefilteret med glidende middelværdi, som G.8272 og G.8272.1 angiver for PTP-grænseflader: serien behandles som ét tidsintervalfejlstal pr. sekund (resultat <c1/>)

seg-d5e956023b48 = MODELLED — tidsfejl, MTIE og TDEV kontrolleret mod transskriberede ITU-T-masker. Estimatorerne er valideret mod allantools; masketabellerne er transskriptioner af de navngivne anbefalinger; en syntetisk holdover er en model bygget af offentlige tal fra datablade, ikke en måling af nogen enhed. Ikke en overensstemmelsestest. (resultat <c1/>)

seg-f163ae37b8c7 = MODELLED: masketabellerne er transskriptioner, og en syntetisk holdover er en model bygget af maksima fra datablade, ikke en måling af nogen enhed. (typekatalog (<c1/>))

seg-a0ddb65b00af = Uret: forudindstillingen for OCXO (Microchip OX-208-datablad, Rev 12-1-2021), frit løbende fra den første sample med hvid og flicker-frekvensstøj og (hvor tilpasningen kræver det) random walk-frekvensstøj tilpasset databladets maksima for Allan-deviation og dets lineære aldring. Temperaturen holdes konstant (amplitude { "0" } K), som masker forudsætter. (kommentar i scenariefilen, linje { "12" } til { "15" })

seg-101dbde1c65b = Emneside: <a1>CLOCK-LOG-FORMATS.md</a1>

seg-c32dc02f981d = <s1>Forrige</s1>sweep

seg-8aef86c9aa68 = <s1>Næste</s1>terrain-nav
