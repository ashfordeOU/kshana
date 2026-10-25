# docs--kinds-clocks-timing-and-holdover: translations (sv)

seg-b03d56f501c3 = Typ

seg-78cba87823f7 = Klockans holdover mot specifikation; valfri Monte Carlo-ensemble (runs > { "1" }).

seg-cb0b7da83f5c = Diagrammet som motorn skriver för scenarios/clock-ensemble.toml, typ clock

seg-c0924aa36e64 = MODELLED holdover-test av ett tidssynkroniseringssystem, poängsatt utifrån en tidsfelsregistrering som OPERATÖREN lämnar (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistics-logg, en TICC-, TimeLab- eller RINEX-klockslogg, eller time_s,time_error_ns-par). Testet har fyra steg och Kshana utför inget av dem: en låst BASLINJE, GNSS BORTTAGET av operatören (antennkabeln eller simulatorns utgång; Kshana sänder och styr ingenting) vid en angiven tidpunkt, HOLDOVER på systemets egen oscillator, och ÅTERHÄMTNING efter att operatören återställt GNSS vid en andra angiven tidpunkt. Registreringen delas vid dessa två tidpunkter. Baslinje: tidsfelsstatistik och de ITU-T-masker som är skrivna för en låst klocka. Holdover: statistik, den fraktionella frekvensavvikelse som systemet höll (en minstakvadratlinje), de masker som är skrivna för holdover eller en autonom klocka, ePRTC-A-holdoverenveloppen utifrån den angivna låsta varaktigheten, och tiden tills varje tidsfelsbudget överskrids. Återhämtning: om och när |TE| kom inom ett angivet band och stannade där, toppen och det största steget. Varje gräns är avskriven från en offentlig ITU-T-tabell (telekomtidsmaskerna); orden är 'uppmätt mot masken', och de två tidpunkterna är operatörens uppgift, inte verifierade. En registrering som är för kort för en mask är INCOMPLETE och extrapoleras aldrig. Se docs/TIMING-HIL.md.

seg-8ce93392747b = Diagrammet som motorn skriver för scenarios/holdover-test-ptp4l.toml, kind holdover-test

seg-540545e6f846 = MODELLED kedja för betrodd kvanttidssynkronisering: en heltäckande budget för tidsöverföring med kvant (optisk gitterklocka + intrasslings-/enfotonslänk) mot klassisk (CSAC + RF tvåvägs), en återanvänd skyddsnivå för tidssynkronisering + ett säkerhetskvalitetsmått för fördröjnings-/återuppspelningsattacker (1-P_md), en detektionssannolikhet för klockanomalier + CUSUM-latens, och avvägningen kvant mot klassisk som ärlig TradeEvidence med en representativitets- och gap-till-flyg-post. Illustrativa parametrar för enhet/länk från offentliga källor; modellerar klassen, inget TRL/flygerfarenhet/certifiering görs gällande.

seg-09760f892c7b = Diagrammet som motorn skriver för scenarios/quantum-time-transfer.toml, typ quantum-time-transfer

seg-4f19d4fb1341 = Generellt N-dimensionellt svep över valfritt paket via punktseparerade TOML-nycklar / JSON-mätvärdessökvägar.

seg-621a18c07044 = Diagrammet som motorn skriver för scenarios/sweep-nd-inertial.toml, typ sweep-nd

seg-e7ab7b55c969 = 1-D-svep för en avvägningsstudie över en parameter i klockpaketet.

seg-c784b8f22f12 = Diagrammet som motorn skriver för scenarios/sweep-clock-stability.toml, typ sweep

seg-a448b24ded2b = Telekomsynkronisering: tidsfel, maximalt tidsintervallfel (MTIE) och tidsavvikelse (TDEV) för en GNSS-holdover, kontrollerade mot ITU-T-masker med PASS eller FAIL och en marginal per mask. Indata är antingen en SYNTETISK HOLDOVER (en oscillatorförinställning -- ocxo, rubidium, caesium eller csac, var och en med stabilitets-, åldrings- och temperaturvärden från ett namngivet offentligt Microchip-datablad -- samt GNSS-bortfallstid, postlängd och samplingsintervall; den fritt löpande klockan har vitt, flimmer- och, där databladsanpassningen kräver det, random-walk-frekvensbrus, linjär åldring och en sinusformad temperaturterm) eller en INLÄST SERIE av par [time_s, time_error_ns] angivna direkt i texten (och, endast i inbyggda byggen, en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A och PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabell 1-2, TDEV Tabell 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst ({ "30" } ns, Tabell 1-2) och ePRTC-A holdover (tidsfelskuvertet i Tabell { "3" } som stiger från { "30" } ns till { "100" } ns över holdover-perioden H som bestäms av den låsta varaktigheten, MTIE Tabell { "4" }, TDEV Tabell { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC klass A-C (max|TE|, konstant tidsfel, lågpassfiltrerat MTIE och TDEV) och klass D (max|TE_L| { "5" } ns, den enda klass D-siffran som inte lämnats för vidare studier); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referenspunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns med MTIE Tabell 7-1 till 7-3). Varje post som en rekommendation markerar som föremål för vidare studier saknas i stället för att fyllas i, och varje rapport listar vad som inte är implementerat. Redovisar också tiden till dess varje budget för maximalt tidsfel överskrids (standardvärden: { "100" } ns ePRTC max|TE_HO|, { "400" } ns tilldelning för nätverks-holdover, { "1100" } ns punkt C, { "1.5" } us klass { "4" }), MTIE/TDEV-kurvorna som en CSV-tabell med varje masks gräns, och en post för enheter och ursprung per numeriskt fält. VALIDATED: MTIE- och TDEV-skattarna mot paketet allantools på en incheckad holdover-serie. MODELLED: masktabellerna är transkriptioner, och en syntetisk holdover är en modell byggd av databladens maxvärden, inte en mätning av någon enhet. Inte ett test av överensstämmelse.

seg-ec7745a09d08 = Diagrammet som motorn skriver för scenarios/telecom-synce-eec.toml, typ telecom-timing

seg-9a2bb9809aed = Tvåvägs tids- och frekvensöverföring via satellit mellan två stationer genom ett geostationärt relä: tvåvägsekvationen löst för T_A - T_B med varje icke-reciprok term (stationsutrustningens fördröjningar, Ku-bandets jonosfär, transponder, Sagnac), en osäkerhetsbudget i kvadratur vars typ A-term är den simulerade länkens TDEV vid medelvärdesbildningstiden, en simulerad länk med vitt brus och flimmerbrus i fas samt en dygnsvarierande icke-reciprocitet, och stabiliteten (hastighet, residual-RMS, TDEV, ADEV) hos en medföljande BIPM Circular T Section { "1" }-serie, MJD,ns-CSV eller IGS RINEX-stationsklockposter. MODELLED.

seg-92d3c84024d7 = Diagrammet som motorn skriver för scenarios/time-transfer-budget.toml, typ time-transfer-budget

seg-ccb244e60d60 = Optisk jämfört med RF tvåvägs tids- och frekvensöverföring.

seg-bd76bd68eab3 = Diagrammet som motorn skriver för scenarios/timetransfer.toml, typ timetransfer

seg-4e31c8daf798 = Register

seg-45a59bc9ac90 = Källa: <c1/>

seg-3b549536beed = Klockor, tidssynkronisering och holdover (familj av scenariotyper)

seg-9095869ec445 = { "9" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-59c2beac56b5 = Ämnessidor: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Kör en: <c1/>. Alla familjer: <a5>KINDS.md</a5>.

seg-b333618375db = Kontaktark med diagrammen som motorn skriver för typerna i familjen Klockor, tidssynkronisering och holdover

seg-efd15cff3d32 = MODELLED (resultatetikett)

seg-ff7dca09f0f2 = Telekomsynkronisering: tidsfel, maximalt tidsintervallfel (MTIE) och tidsavvikelse (TDEV) för en GNSS-holdover, kontrollerade mot ITU-T-masker med PASS eller FAIL och en marginal per mask.

seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

seg-413edbab9fa9 = Slot-synkronisering: sekunder tills en fritt löpande klocka lämnar skyddsintervallet för en tidsindexerad routing- eller tilldelningsslot (det största absoluta tidsfel som sloten tolererar), bidraget från varje term vid det

seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

seg-d425ce2b9f9c = Tvåvägs tids- och frekvensöverföring via satellit mellan två stationer genom ett geostationärt relä: tvåvägsekvationen löst för T_A - T_B med varje icke-reciprok term (stationsutrustningens fördröjningar, Ku

seg-a2a710b3204f = MODELLED holdover-test av ett tidssynkroniseringssystem, poängsatt utifrån en tidsfelspost som OPERATÖREN tillhandahåller (en logg från linuxptp ptp4l, phc2sys eller ts2phc, en tracking- eller statistics-logg från chrony, en TICC, TimeLab eller RINEX

seg-1da440dd525c = MODELLED kedja för betrodd kvanttidssynkronisering: en helhetsbudget för tidsöverföring med kvant (optisk gitterklocka + intrasslings- eller enfotonslänk) mot klassisk (CSAC + RF tvåväg), ett återanvänt tidsskydd

seg-50d75d48ed43 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valfria: <c7/>, <c8/>.

seg-3273244f755c = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>clock</a1>.

seg-ee8d6e20c844 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valfria: <c7/>.

seg-e359cc42506e = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>sweep</a1>.

seg-616716b33732 = Obligatoriska fält: <c1/>, <c2/>, <c3/>.

seg-6f282be980ca = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>sweep-nd</a1>.

seg-79c3d3cd6c7d = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-c23e498daa3d = <b>Register:</b> MODELLED { "5" } · VALIDATED { "1" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>telecom-timing</a1>.

seg-248e1686fddc = Obligatoriska fält: <c1/>, <c2/>. Valfria: <c3/>.

seg-cc04bc2d43c5 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "1" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>slot-timing</a1>.

seg-50273a29deec = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-adf570e18299 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>timetransfer</a1>.

seg-5134a01b60a0 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Valfria: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-09b554a74d49 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>time-transfer-budget</a1>.

seg-58952681ea9d = Obligatoriska fält: <c1/>, <c2/>. Valfria: <c3/>, <c4/>.

seg-635ec95c2e86 = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>holdover-test</a1>.

seg-76bb4110ea36 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-bb6d7df61e2f = <b>Register:</b> ingen matrisrad nämner den här typen; motorn sätter själv etiketten på sitt resultat. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>quantum-time-transfer</a1>.

seg-245adc6e6766 = <s1>Föregående</s1>Kampanjer

seg-960d5c757310 = <s1>Nästa</s1>Konstellationer täckning och geometri
