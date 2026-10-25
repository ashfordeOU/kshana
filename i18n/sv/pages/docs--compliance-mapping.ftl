# docs--compliance-mapping: translations (sv)

seg-6555ff9a6d8e = Utdata

seg-2247a2344710 = Betydelse

seg-d6476863f862 = Förmåga

seg-ad856ad710eb = Status

seg-8d216d42c776 = Bedömning av förtroende i mottagarloggar

seg-ff808ce8ec48 = Alternativa och diversifierade PNT-källor

seg-3621a68a508c = Reproducerbart ursprung för körningar

seg-50fe2a3ff712 = Integritetsövervakning och skyddsnivåer

seg-554a16dc7965 = Källa: <c1/>

seg-76db63e8d2de = Köpare och mottagartillverkare svarar inför offentliga ramverk för resiliens. Den här mappen kartlägger vad Kshana beräknar och registrerar mot dessa ramverk, rad för rad, och <c1/> fyller i kartläggningen utifrån de körningar du faktiskt har.

seg-e22a3aca9550 = <b>Ordval.</b> Kshanas utdata <em>ger belägg för</em> ett krav. De är inte ett betyg på eller ett godkännande av någon produkt, och ingen av dessa filer är ett uttalande från ett bedömningsorgan; Kshana är inget sådant. Kravtexten är omskriven, aldrig återgiven.

seg-2602c3f5aff6 = Ramverk

seg-245fe1f87b08 = Fil

seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

seg-0f7279ffb619 = IMO:s vägledning om GNSS-störning för fartyg

seg-f318176b86de = EASA:s vägledning om GNSS-störning för luftfart

seg-7939ac1eea3b = EU:s NIS2-direktiv, artikel { "21" }

seg-f2eccc9b815f = EN { "16803" } (avgiftsbelagd standard; endast per del och katalogsynliga klausulnummer)

seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (januari { "2023" })

seg-499fc17fb83a = <b>Standardpaket</b> ({ "0.38" }) omvandlar ett ramverk till poängsatta scenarier: varje paket har scenarier, trösklar som fastställts före körningen och rader det ger belägg för. <c1/> visar dem.

seg-9c0eb89a2fbe = Paket

seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, testprofiler för nivåerna { "1" } till { "4" }

seg-13e63b993f26 = IMO MSC.1/Circ.1575, databehandling för PNT ombord på fartyg: noggrannhetsnivåer och integritet

seg-aa77ffe0acbf = ICAO Doc { "9849" } Appendix F, övervaka, bedöma och begränsa GNSS-störning

seg-b9387be0e4f1 = Varje fil listar sina källdokument med version, URL, datum för läsning och vad som kontrollerades och inte kontrollerades. Källorna lästes den 2026-10-09 (NIST-profilen den 2026-10-18; EASA-bulletinen och katalogsidorna för EN { "16803" } kontrollerades på nytt den 2026-10-10). Där en källa bara kunde läsas via en spegel eller en katalogsida anges det i filen.

seg-e98e25897176 = Varje test i de tre poängsatta standardpaketen, från verkliga körningar av motor v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } uppfyllda, { "1" } inte uppfylld, { "2" } kräver indata; imo-circ-1575: { "1" } uppfylld, { "4" } inte uppfyllda, { "2" } kräver indata; icao-doc9849-appf: { "6" } uppfyllda, { "0" } inte uppfyllda, { "2" } kräver indata. Totalt { "13" } uppfyllda, { "5" } inte uppfyllda och { "6" } kräver indata som motorn inte har (en mottagarlogg eller utrustningsdokumentation). Varje tröskel fastställdes före körningen; en miss behålls som en miss. En uppnådd tröskel säger att ett modellerat scenario nådde en angiven tröskel, inget om en produkt. Paketen ger belägg för de rader de hänvisar till; de är inte en bedömning. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande tjänst; det får inte vara den enda grunden för något navigerings- eller säkerhetsbeslut.

seg-092dd691ca17 = Rapporten

seg-10fac3e641e0 = skriver <c1/> och <c2/> (<c3/> ändrar namnet). Indata är resultatfiler från tidigare körningar: en scenariokörning skriver <c4/> bredvid <c5/>, och <c6/> skriver sin egen. Varje körnings sort läses från scenariofilen bredvid resultatet, från innehållet i ett receiver-trust-resultat eller från ett <c7/> på toppnivå, och måste vara en sort som motorn känner till. Ett resultat listas som oanvänt, med skälet, och räknas inte alls när dess sort inte kan hittas, inte är en känd sort, eller när den intilliggande scenariofilen och resultatets eget <c8/> inte stämmer överens. (Resultatets <c9/> och ett hashvärde av scenariofilen jämförs inte: motorn beräknar det förra över sitt tolkade scenario och ett filhashvärde avser texten, så de är olika storheter.)

seg-464351dcdcc3 = <b>Enbart en sortsetikett är inget belägg.</b> En körning räknas för en förmåga först när dess resultat också innehåller de fält som sorten skriver (till exempel behöver ett <c1/>-resultat sina kvalitetsmått och rader per epok; ett <c2/>-resultat behöver sina provantal). Fälten listas i <c3/> (<c4/>) och ett resultat som saknar ett räknas inte. Ett hashvärde som inte är hexadecimalt rapporteras inte som ett hashvärde. Ett receiver-trust-resultat vars antal inte är heltal, eller vars antal detekterade eller överensstämmande överstiger antalet utvärderingsbara, utesluts och listas som oanvänt.

seg-5a316d97f37b = För varje rad anger rapporten ett av följande:

seg-2243532bd26b = varje förmåga som raden nämner har minst en körning i uppsättningen

seg-e905ae20cec1 = vissa har det

seg-e23d6dfc4a00 = ingen har det

seg-cf223ce076ce = inga Kshana-utdata gäller raden

seg-ec76997fb4d4 = Kolumnen för luckor skrivs ut för varje rad, även de med belägg: en körning som ger belägg för en förmåga lämnar ändå större delen av ett krav åt annat belägg. Rapporten upprepar ordvalsregeln i sin början. <c1/> skriver ut de statiska tabellerna och <c2/> källistan.

seg-f1c508a908ad = Receiver-trust-körningar bidrar också med de antal de anger (detekterade händelser av de utvärderingsbara, överensstämmande förutsägelser av de utvärderingsbara). Dessa beskriver den loggen, poängsatt mot händelser och toleranser som angavs före körningen, och rapporteras så som körningen anger dem.

seg-662b717575e0 = Körningssorter

seg-4377e24c36f5 = förtroendetillstånd per epok i en verklig mottagares egen logg, larmtider och överensstämmelse med händelser som angavs före körningen

seg-766182e85848 = Effekter av jamming på länkbudgeten

seg-6bee09017be6 = bärvågs-brus-täthet och låstillstånd per satellit under en angiven jammer-geometri

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = Detektering av spoofing och meaconing

seg-2e4a3355a936 = detektorbeslut och detektorns förmåga att skilja åt under en angiven spoofing-attack

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = skyddsnivåer, tillgänglighet mot larmgränser och resultat av feldetektering

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = Holdover och fortsatt färd utan GNSS

seg-a643345646c3 = tillväxt av positions- eller tidsfel medan GNSS är nekat, mot en angiven tröskel

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = navigerings- eller tidsprestanda från källor som är oberoende av det primära GNSS-bandet

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = Resiliensbedömning över hotuppsättningar

seg-9eef8dd0d9b9 = överlevnads- och resiliensandelar per hotvektor över en angiven uppsättning, med antagandena angivna

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = scenariots hashvärde, motorversion och frö som följer med i varje resultat så att en körning kan upprepas

seg-89edc36c3560 = varje körning vars resultat innehåller ett <c1/>

seg-488aeabdc552 = <s1>Föregående</s1>Köra en mottagare mot ett scenario

seg-53a872636d5a = <s1>Nästa</s1>US DHS ramverk för resilient PNT
