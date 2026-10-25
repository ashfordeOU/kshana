# docs--kind-telecom-timing: translations (sv)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = Ämnessida: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Scenariotyp i motor v{ $version }, familj <a1>Klockor, tidssynkronisering och holdover</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: ett parserlager som gör om en RINEX-klockfil (AS/AR-poster för en namngiven klocka, versionerna { "2" } och { "3.00" } till { "3.04" }), en ASCII-fas- eller frekvenslogg i TimeLab-stil, eller en TAPR TICC-tidsstämpel- eller intervalllogg till en enhetlig pha Tester: <a1>clock_log_allantools.rs</a1>.

seg-849c08d3ce70 = Familjesida: <a1>Klockor, tidssynkronisering och holdover</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-e7273fd2a640 = <b>VALIDATED</b> Det maximala tidsintervallfelet och tidsavvikelsen som scenariotypen <c1/> redovisar, på en holdover-registrering i telekomskala: ett O(n) glidande fönster med monoton kö. Oracle (ExternalDataset): allantools { "2024.06" } — ett oberoende tredjepartsbibliotek för frekvensstabilitet — mtie() och tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, serien tolkad från samma text med 17 signifikanta siffror på båda sidor; referensen registrerar seriens SHA-256 och kan återskapas offline via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerar ESTIMATORERNA på denna registrering, inte syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Avskrivna gränser från ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst och ePRTC-A holdover (inklusive tidsfelsenveloppen i Table { "3" }. Oracle (InternalConsistency): Avskrift av de namngivna rekommendationerna (fritt nedladdningsbara från itu.int), där varje gräns anger sin tabell eller klausul, förtecknad med varje obekräftat eller oimplementerat moment i docs/TELECOM-TIMING.md; de kontinuitetsidentiteter vid brytpunkterna som tabellerna ger kontrolleras i testerna. En standardavskrift med interna konsistenskontroller, inte ett formatkontrolltest och inte en extern validering. { "0.30" } round { "2" } (pre-register

seg-5547f1f662d3 = och { "2" } till i matrisen.

seg-9b72d3b3a0ab = Källa: <c1/>

seg-f4dc88ffe6b5 = <c1/> (scenariotyp)

seg-a448b24ded2b = Telekomsynkronisering: tidsfel, maximalt tidsintervallfel (MTIE) och tidsavvikelse (TDEV) för en GNSS-holdover, kontrollerade mot ITU-T-masker med PASS eller FAIL och en marginal per mask. Indata är antingen en SYNTETISK HOLDOVER (en oscillatorförinställning -- ocxo, rubidium, caesium eller csac, var och en med stabilitets-, åldrings- och temperaturvärden från ett namngivet offentligt Microchip-datablad -- samt GNSS-bortfallstid, postlängd och samplingsintervall; den fritt löpande klockan har vitt, flimmer- och, där databladsanpassningen kräver det, random-walk-frekvensbrus, linjär åldring och en sinusformad temperaturterm) eller en INLÄST SERIE av par [time_s, time_error_ns] angivna direkt i texten (och, endast i inbyggda byggen, en CSV-fil). Masker: ITU-T G.8272 (07/2025) PRTC-A och PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabell 1-2, TDEV Tabell 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst ({ "30" } ns, Tabell 1-2) och ePRTC-A holdover (tidsfelskuvertet i Tabell { "3" } som stiger från { "30" } ns till { "100" } ns över holdover-perioden H som bestäms av den låsta varaktigheten, MTIE Tabell { "4" }, TDEV Tabell { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC klass A-C (max|TE|, konstant tidsfel, lågpassfiltrerat MTIE och TDEV) och klass D (max|TE_L| { "5" } ns, den enda klass D-siffran som inte lämnats för vidare studier); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referenspunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns med MTIE Tabell 7-1 till 7-3). Varje post som en rekommendation markerar som föremål för vidare studier saknas i stället för att fyllas i, och varje rapport listar vad som inte är implementerat. Redovisar också tiden till dess varje budget för maximalt tidsfel överskrids (standardvärden: { "100" } ns ePRTC max|TE_HO|, { "400" } ns tilldelning för nätverks-holdover, { "1100" } ns punkt C, { "1.5" } us klass { "4" }), MTIE/TDEV-kurvorna som en CSV-tabell med varje masks gräns, och en post för enheter och ursprung per numeriskt fält. VALIDATED: MTIE- och TDEV-skattarna mot paketet allantools på en incheckad holdover-serie. MODELLED: masktabellerna är transkriptioner, och en syntetisk holdover är en modell byggd av databladens maxvärden, inte en mätning av någon enhet. Inte ett test av överensstämmelse.

seg-07f81cfd606a = En körning av <c1/> sammanfattas som: telecom-timing: max|TE| { "488.2" } ns över { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

seg-17f291bfc65d = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-d192feecd4b3 = Exemplet <c1/> anger bland annat:

seg-e7cab30ef039 = [] (inga element)

seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

seg-01b1287f233b = Resultatetikett (motorns egen): MODELLED — tidsfel, MTIE och TDEV kontrollerade mot transkriberade ITU-T-masker. Skattarna är validerade mot allantools; masktabellerna är transkriptioner av de namngivna rekommendationerna; en syntetisk holdover är en modell byggd av offentliga databladsvärden, inte en mätning av någon enhet. Inte ett test av överensstämmelse.

seg-ec7745a09d08 = Diagrammet som motorn skriver för scenarios/telecom-synce-eec.toml, typ telecom-timing

seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-c21ebd79f497 = <b>VALIDATED</b> Det maximala tidsintervallfelet och den tidsavvikelse som scenariotypen <c1/> redovisar, på en holdover-post i telekomskala: ett MTIE med glidande fönster och monoton kö i O(n) (telecom_timing::mtie_sliding, som behövs för att en dag med sekundsamp Tester: <a1>telecom_timing_reference.rs</a1>.

seg-75aa6f7234ae = <b>MODELLED</b> Transkriberade gränser i ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Tester: <a1>telecom_timing_reference.rs</a1>.

seg-d0ab0ca72b80 = <b>MODELLED</b> Sju MTIE- och TDEV-masker för wander-generering vid konstant temperatur för typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) typ I, II och III, G.8262 (10/2024) EEC alternativ { "1" } och { "2" } samt G.8262.1 (11/2025) eEEC (låst

seg-d4bd840708db = <b>MODELLED</b> Fyra förinställningar — OCXO (Microchip OX-208), rubidium (Microchip 8040C), caesium (Microchip 5071A högpresterande rör) och CSAC (Microchip SA.45s) — var och en med . Oberoende referens (InternalConsistency): De fyra namngivna Microchip-databladen (dokumentnummer och URL:er i varje förinställning och i docs/TELECOM-TIMING.md) för indatavärdena; den slutna åldringsrampen och anpassningens kuvertegenskap som interna kontroller. Hur värdena blir en brusmodell — anpassningen, golvregeln, 30-dagarsmånaden, den linjära tolkningen av temperaturen — är ett modellval; ingen förinställning är en mätning av en enhet. { "0.30" } omgång { "2" }, ensidiga trösklar mot

seg-cbb39b4105ac = varje krav som rekommendationerna markerar som 'för vidare studier' (klass D utöver max|TE_L|, ePRTC-B holdover, T-BC/T-TSC holdover när båda ingångarna förlorats, TDEV-nätverksgränser, ePRTC-A holdover MTIE och TDEV bortom { "10 000" } s) (resultat <c1/>)

seg-a70f575aeb21 = högpassfiltrerat dynamiskt tidsfel (dTE_H, G.8273.2 Tabell 7-7 och G.8271.1 avsnitt 7.3.2-7.3.3) (resultat <c1/>)

seg-66446247fc49 = MTIE vid varierande temperatur enligt G.8273.2 Tabell 7-6 och MTIE för holdover med stöd från fysiska lagret enligt G.8273.2 Tabell 7-10 (resultat <c1/>)

seg-c1d601b45182 = relativt tidsfel (cTE_R, dTE_R,L) mellan två utgångar (resultat <c1/>)

seg-6146f857c2df = det glidande medelvärdesfiltret för paket som G.8272 och G.8272.1 anger för PTP-gränssnitt: serien behandlas som ett tidsintervallfel på en puls per sekund (resultat <c1/>)

seg-d5e956023b48 = MODELLED — tidsfel, MTIE och TDEV kontrollerade mot transkriberade ITU-T-masker. Skattarna är validerade mot allantools; masktabellerna är transkriptioner av de namngivna rekommendationerna; en syntetisk holdover är en modell byggd av offentliga databladsvärden, inte en mätning av någon enhet. Inte ett test av överensstämmelse. (resultat <c1/>)

seg-f163ae37b8c7 = MODELLED: masktabellerna är transkriptioner, och en syntetisk holdover är en modell byggd av databladens maxvärden, inte en mätning av någon enhet. (typkatalog (<c1/>))

seg-a0ddb65b00af = Klockan: förinställningen OCXO (Microchip OX-208, datablad Rev 12-1-2021), fritt löpande från första samplet med vitt, flimmer- och (där anpassningen kräver det) random-walk-frekvensbrus anpassat till databladets maxvärden för Allan-deviation, samt dess linjära åldring. Temperaturen hålls konstant (amplitud { "0" } K), såsom maskerna förutsätter. (kommentar i scenariofilen, rad { "12" } till { "15" })

seg-101dbde1c65b = Ämnessida: <a1>CLOCK-LOG-FORMATS.md</a1>

seg-c32dc02f981d = <s1>Föregående</s1>sweep

seg-8aef86c9aa68 = <s1>Nästa</s1>terrain-nav
