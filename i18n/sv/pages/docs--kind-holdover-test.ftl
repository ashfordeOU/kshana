# docs--kind-holdover-test: translations (sv)

seg-f42465f7d066 = ns

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-c61e88721556 = Scenariotyp i motor v{ $version }, familj <a1>Klockor, tidssynkronisering och holdover</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-849c08d3ce70 = Familjesida: <a1>Klockor, tidssynkronisering och holdover</a1>

seg-73929aeded02 = Källa: <c1/>

seg-218f00012d0e = <c1/> (scenario kind)

seg-c0924aa36e64 = MODELLED holdover-test av ett tidssynkroniseringssystem, poängsatt utifrån en tidsfelsregistrering som OPERATÖREN lämnar (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistics-logg, en TICC-, TimeLab- eller RINEX-klockslogg, eller time_s,time_error_ns-par). Testet har fyra steg och Kshana utför inget av dem: en låst BASLINJE, GNSS BORTTAGET av operatören (antennkabeln eller simulatorns utgång; Kshana sänder och styr ingenting) vid en angiven tidpunkt, HOLDOVER på systemets egen oscillator, och ÅTERHÄMTNING efter att operatören återställt GNSS vid en andra angiven tidpunkt. Registreringen delas vid dessa två tidpunkter. Baslinje: tidsfelsstatistik och de ITU-T-masker som är skrivna för en låst klocka. Holdover: statistik, den fraktionella frekvensavvikelse som systemet höll (en minstakvadratlinje), de masker som är skrivna för holdover eller en autonom klocka, ePRTC-A-holdoverenveloppen utifrån den angivna låsta varaktigheten, och tiden tills varje tidsfelsbudget överskrids. Återhämtning: om och när |TE| kom inom ett angivet band och stannade där, toppen och det största steget. Varje gräns är avskriven från en offentlig ITU-T-tabell (telekomtidsmaskerna); orden är 'uppmätt mot masken', och de två tidpunkterna är operatörens uppgift, inte verifierade. En registrering som är för kort för en mask är INCOMPLETE och extrapoleras aldrig. Se docs/TIMING-HIL.md.

seg-cd6d840a1382 = En körning av <c1/> sammanfattas som: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = Obligatoriska fält: <c1/>, <c2/>

seg-4792040e4773 = Valfria fält: <c1/>, <c2/>

seg-ad4f9c40e317 = Exemplet <c1/> anger bland annat:

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = Resultatetikett (motorns egen): MODELLED — ett holdover-test poängsatt utifrån en tidsfelsregistrering som operatören lämnat. Varje gräns är avskriven från den namngivna offentliga ITU-T-rekommendationen och resultatet är uppmätt mot masken; det säger ingenting om huruvida någon klocka eller något system uppfyller en rekommendation, och ingen har betygsatt eller godkänt

seg-8ce93392747b = Diagrammet som motorn skriver för scenarios/holdover-test-ptp4l.toml, kind holdover-test

seg-3361819ae321 = <b>MODELLED</b> Kind <c1/>: en tidsfelsregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-klockslogg, eller time_s,time_error_ns-par) delas vid de två tidpunkter som operatören anger för borttagning och återställning av GNSS i en baslinje, en holdover a

seg-e7273fd2a640 = <b>VALIDATED</b> Det maximala tidsintervallfelet och tidsavvikelsen som scenariotypen <c1/> redovisar, på en holdover-registrering i telekomskala: ett O(n) glidande fönster med monoton kö. Oracle (ExternalDataset): allantools { "2024.06" } — ett oberoende tredjepartsbibliotek för frekvensstabilitet — mtie() och tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, serien tolkad från samma text med 17 signifikanta siffror på båda sidor; referensen registrerar seriens SHA-256 och kan återskapas offline via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerar ESTIMATORERNA på denna registrering, inte syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Avskrivna gränser från ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst och ePRTC-A holdover (inklusive tidsfelsenveloppen i Table { "3" }. Oracle (InternalConsistency): Avskrift av de namngivna rekommendationerna (fritt nedladdningsbara från itu.int), där varje gräns anger sin tabell eller klausul, förtecknad med varje obekräftat eller oimplementerat moment i docs/TELECOM-TIMING.md; de kontinuitetsidentiteter vid brytpunkterna som tabellerna ger kontrolleras i testerna. En standardavskrift med interna konsistenskontroller, inte ett formatkontrolltest och inte en extern validering. { "0.30" } round { "2" } (pre-register

seg-142528f34e66 = <b>MODELLED</b> Kind <c1/>: en tidsfelsregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-klockslogg, eller time_s,time_error_ns-par) delas vid de två tidpunkter som. Oracle (InternalConsistency): Handberäkning på registreringar byggda av formler vars lutning, steg, extremvärde och återhämtningstid är kända före körningen (testerna anger dem), samt masker, envelopper och budgetar i telekomtidsraderna ovan. Ingen laboratoriemätning av en verklig holdover har poängsatts och ingen extern oberoende referens har jämförts, så kind gör inget påstående om någon klocka eller något system; en tidslabbpartner behövs innan någon fi

seg-59ff0b0e3d2d = MODELLED — ett holdover-test poängsatt utifrån en tidsfelsregistrering som operatören lämnat. Varje gräns är avskriven från den namngivna offentliga ITU-T-rekommendationen och resultatet är uppmätt mot masken; det säger ingenting om huruvida någon klocka eller något system uppfyller en rekommendation, och ingen har betygsatt eller godkänt det. Tidpunkterna då GNSS togs bort och återställdes är operatörens uppgift och är inte verifierade. Advisory sof (result <c1/>)

seg-daeb4ad7aa35 = MODELLED holdover-test av ett tidssynkroniseringssystem, poängsatt utifrån en tidsfelsregistrering som OPERATÖREN lämnar (en linuxptp ptp4l-, phc2sys- eller ts2phc-logg, en chrony tracking- eller statistics-logg, en TICC-, TimeLab- eller RINEX-klockslogg, eller time_s,time_error_ns-par). (kind catalogue (<c1/>))

seg-ff3008c250cc = ITU-T-masker för telekomsynkronisering med PASS/FAIL och marginal är MODELLED, inte validerade: kontrollerade mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-8ccd0f911626 = Holdover-test poängsatt utifrån en tidsfelsregistrering som operatören lämnat är MODELLED, inte validerat: kontrollerat mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-72bad5444282 = Ämnessida: <a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = Ämnessida: <a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>Föregående</s1>gravity-map

seg-e7665ee5e30e = <s1>Nästa</s1>hybrid-optical-rf
