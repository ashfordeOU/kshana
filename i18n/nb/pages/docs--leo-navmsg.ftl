# docs--leo-navmsg: translations (nb)

seg-cc651d9cef3b = Kode

seg-cbf0f9bcd2d8 = Uavhengig referanse

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Kilde

seg-e305279d5b11 = Innhold

seg-4d208b6c0eb8 = dag

seg-a7d59ba6e225 = rad

seg-02dc0d42fb21 = sfu

seg-0f2d3faa9934 = Kilde: <c1/>

seg-d8aaee95aa44 = Scenariotypen <c1/> bygger den kringkastede efemeride- og klokkemeldingen til en satellitt for posisjonering, navigasjon og tidssynkronisering (PNT) i lav jordbane (LEO), og svarer på spørsmålene en meldingsutvikler stiller: hvor lenge kan én melding dekke, hva gir hver ekstra parameter, hva ser en bruker når meldingen skiftes midt i en overflyging, og hvor mange bit trengs for å bære den ned til centimeteren.

seg-e61283b1e1a5 = Den er systemuavhengig. Enhver bane, enhver bærebølge og hver av fire efemeridemodeller kjører uten noen forhåndsinnstilling i det hele tatt; de navngitte forhåndsinnstillingene er valgfrie data (se <a1>Forhåndsinnstillinger</a1>).

seg-1271cd4ad822 = Skriv ut et medfølgende eksempel med <c1/> (ett navn per kall) og kjør det med <c2/>: <c3/>, <c4/>, <c5/> og <c6/>. Typen er også meldingstrinnet i typen <c7/> (<a1>LEO-PNT.md</a1>) og medlem av kampanjen <c8/>, som setter sammen fire meldingskonfigurasjoner og rapporterer rammelengden for hver ({ "146" }, { "154" }, { "159" } og { "171" } bytes).

seg-51da9ffaa0ec = Kode: <c1/> — <c2/> (poster og brukeralgoritme), <c3/> (referansebane og -klokke), <c4/> (tilpasser), <c5/> (avstandsfeil i signalet i rommet), <c6/> (ionosfære og Coordinated Universal Time (UTC)), <c7/> (binærformat), <c8/> (eksport i Receiver Independent Exchange Format (RINEX)-stil og som kommaseparerte verdier (CSV)), <c9/> (én fil per forhåndsinnstilling), <c10/> (typen).

seg-0505113a62e3 = Hva en melding bærer

seg-6752521002b2 = Del

seg-cf6ae60eea4f = Hjelpedata

seg-00eae74cb1e6 = romfartøyidentifikator (SVID), dataversjon (IOD), båndidentifikator, signalhelsestatus (Galileo-konvensjon: { "0" } OK, { "1" } ute av drift, { "2" } utvidet drift, { "3" } under test)

seg-0bdbdd2c923b = Synkronisering

seg-8120237b02ea = ukenummer, ukesekund (TOW) for sendingen og et andreordens klokkepolynom <c1/>

seg-b09dc4b322d3 = Efemeride

seg-bbb3225e1d19 = én av de fire modellene nedenfor

seg-3a835a49b43f = Andre tjenester

seg-2a13461cb60c = et kringkastet ionosfæresett av Klobuchar-typen, Galileo NeQuick-G-koeffisienter <c1/> med fem stormflagg, og parametere for systemtid til UTC <c2/>

seg-6b899ef63047 = Efemeridemodeller

seg-60cd077d82a7 = Modell

seg-2afa300864a9 = Parametere

seg-3e8a1cf183cc = Kepler-settet fra Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD): <c1/>

seg-b1416ba3472f = det samme, pluss korreksjonspolynomer langs banen, på tvers av banen og radielt (RAC) <c1/>, <c2/>, <c3/> i <c4/>, koeffisienter i meter, <c5/> toerpotensen lik eller over halve tilpasningsintervallet (sendes), grader satt av <c6/> (standard { "7" }, { "5" }, { "6" })

seg-9c0643152bbf = { "16" } + { "21" } som standard, pluss tidsskalaen

seg-e0afd541d64c = modellen med 22 parametere av Liu, Su, Xie, Zhou og Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): de { "16" } pluss <c1/>

seg-a6042071a03f = ATOMIC-modellen (Autonomous Time and Orbit Determination for Microsatellite Constellations) med «nullklokke»: et jordsentrert jordfast (ECEF) polynom per akse i <c1/> (standardgrad { "6" }), ingen klokkeledd fordi satellittklokken styres mot systemtid (<a1>InsideGNSS</a1>)

seg-5869d6f65796 = { "22" } som standard

seg-6663aa3eeebc = Brukeralgoritmen (<c1/>) er Galileo ICD-sekvensen (Keplers ligning, andreharmoniske korreksjoner, jordfast node), etterfulgt, for <c2/>, av de tre polynomene langs Kepler-banens eget referansesystem: radielt langs den evaluerte posisjonen, på tvers av banen langs banenormalen fra den korrigerte inklinasjonen og noden, og langs banen som fullfører treleddet. Klokken legger til ICD-ens relativistiske ledd <c3/>; for <c4/> er det den generelle formen <c5/> fra polynomet og dets deriverte.

seg-b3935a85a7b2 = Leddene fra Liu et al. følger artikkelens brukeralgoritme (seksjon { "2.2" }, ligning 1-7): <c1/>, <c2/> (utgivelser før { "0.30" } brukte sivilnavigasjonskonvensjonen i Global Positioning System (GPS) <c3/>, så en <c4/> de skrev er det dobbelte av artikkelens), og <c5/> lagt til radiusen, der <c6/> er det ukorrigerte breddeargumentet. Skalakonvensjonen for <c7/> er overført fra artikkelens ligning { "1" }; sammenligningen med artikkelen på reelle baner avhenger ikke av den (en faktor ½ på <c8/> lar alle tilpassede tall være uendret), så meningen med verdien av en sendt <c9/> er ikke validert der.

seg-9a83292bffcf = To tolkninger er Kshanas egne og oppgis som sådan:

seg-0e42fd0d5cf9 = RAC-referansesystemet og normaliseringen <c1/>. Intet offentlig dokument definerer et korreksjonsreferansesystem for LEO for en kringkastet melding.

seg-1b8aaed09de8 = Klokken i en nullklokkemelding er null i sum: styringssløyfen antas å holde den tilsynelatende klokken, inkludert det relativistiske leddet, mot systemtid.

seg-3472ce139588 = Tilpasseren

seg-4404a677d185 = <c1/> integrerer banen med en fjerdeordens Runge–Kutta med fast steg i et referansesystem som dreies til jordfaste akser med én rotasjon, <c2/>, den samme ene rotasjonen en kringkastet brukeralgoritme anvender. Tyngdekraften er tolegemeproblemet (<c3/>), de sonale harmoniske J2 til J6 ({ "2" } til { "6" }), eller feltet Earth Gravitational Model { "2008" } (EGM2008) til grad og orden { "7" } til { "70" }, hvis tesserale ledd bærer den kortperiodiske signaturen som gjør en LEO-tilpasning vanskelig. Luftmotstand er valgfritt (statisk eksponentiell tetthet). Klokken er enten fritt gående (bias, drift, driftrate og hvit frekvensstøy ved en oppgitt Allan-deviasjon på ett sekund, pluss det periodiske relativistiske leddet) eller styrt (en førsteordens Gauss–Markov-rest).

seg-ae3052e66b2a = <c1/> tilpasser Kepler-settet med Levenberg–Marquardt på ikke-singulære elementer (<c2/>, <c3/>, <c4/>): en LEO-bane er nesten sirkulær, så <c5/> og <c6/> alene er nesten umulige å skille. Den starter fra den oskulerende tilstanden ved <c7/> med J2-noderaten. Svake nullsentrerte priorer begrenser ratene og harmoniske som en kort bue ikke kan oppløse; med en observasjonsvekt på { "1" } cm virker de bare i disse nullretningene. Tilpasningen <c8/> bruker i stedet artikkelens start og estimator fra seksjon { "2.3" }: den starter med at alle korreksjonsledd er null, har ingen priorer (ren minste kvadraters metode) og beholder artikkelens grense på 100 iterasjoner. Den stopper etter Kshanas egen regel for parameterkonvergens, når hvert parametersteg er under { "1e-3" } av sitt formelle standardavvik; artikkelen stopper i stedet når RMS endres med mindre enn { "0.1" } mm. RAC-polynomene tilpasses deretter til residualene langs/på tvers/radielt med lineær minste kvadraters metode, og klokkepolynomet til referanseklokken minus det relativistiske leddet brukeren legger til igjen.

seg-020f45edcae1 = Et funn som standardverdiene koder: etter en Kepler-tilpasning med minste kvadrater er residualet per konstruksjon det de { "16" } parameterne ikke kan spenne over, så det oscillerer over vinduet (flere nullgjennomganger i hver komponent) i stedet for å drive. Et korreksjonspolynom fjerner det bare når graden overstiger det Kepler-settet allerede spenner over: langs banen { "7" }, på tvers { "5" } og radielt { "6" } tar et residual på 15 minutter fra centimeter til omtrent én millimeter, mens lavere grader på tvers nesten ikke fjerner noe (residualet på tvers er odde om vindussenteret). Et system som utleder sin Kepler-del på en annen måte, etterlater et residual med en annen form, og gradene det trenger følger av det. Celeste-forhåndsinnstillingens egne korreksjonsgrader (lavere enn disse; de finnes bare i forhåndsinnstillingsfilen, <c1/>) kjører her på Kshanas minste kvadraters grunnlag, og det er grunnen til at leddene på tvers bidrar lite i denne motoren: en uttalelse om Kshanas tilpasser, ikke om noe reelt system. <c2/> og <c3/> er hele sekunder, slik binærformatet bærer dem.

seg-f3538e6651fa = Hver melding brukes over en periode sentrert i sitt tilpasningsvindu (den første avveiningstabellen bruker hele vinduet). Det tallene for avstandsfeil i signalet i rommet (SISRE) måler, er meldingens <b>representasjonsfeil</b> mot referansen den ble tilpasset, som rotmiddelkvadrat (RMS) og et maksimum over spennet. Feilen i banebestemmelse og banepredikering, som et reelt bakke- eller ombordsegment legger til ovenpå, er ikke modellert.

seg-c2b181269367 = Avstandsfeil i signalet i rommet

seg-63462a1abc95 = <c1/> bruker den globalt midlede SISRE-verdien til Montenbruck, Steigenberger og Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

seg-c4f654264c42 = Vektene er gjennomsnittene over brukere jevnt fordelt på den synlige jordkalotten av <c1/> og <c2/>, der <c3/> er nadirvinkelen til siktelinjen ved satellitten, beregnet for banens egen radius og elevasjonsmaske. Ved en maske på { "0" }° gjengir beregningen artikkelens tabell for middels jordbane (GPS { "0.98" } og 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) og geostasjonær bane ({ "0.99" } og 1/126): det er den <b>VALIDATED</b> kontrollen. I LEO gir det samme gjennomsnittet

seg-66b488889b10 = Høyde

seg-c07128592d7b = nadirvinkel til horisonten

seg-a4e04d9a23a5 = { "320" } km

seg-002adc24471f = { "510" } km

seg-fe2f70c29806 = { "550" } km

seg-4dee38ff0811 = { "786" } km

seg-cfc3c6939861 = { "1080" } km

seg-102de0413553 = { "1336" } km

seg-1b11819c8b2f = så en LEO-bruker, som ser satellitten langt fra nadir, merker feil langs og på tvers av banen mye mer enn en bruker i middels bane.

seg-b7a844ab6135 = Analyser

seg-17111fe25e04 = <c1/> velger en vilkårlig av de fire (standard alle).

seg-d0c1b335af73 = Avveining av tilpasningsintervall

seg-f65e99c0d8b2 = <c1/> setter spennet, tilpasningsintervallene, oppdateringsperiodene og modellene. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 til grad { "20" } og luftmotstand, { "30" } minutter med meldinger) gir, med bruksperioden lik tilpasningsintervallet:

seg-f1a94c795c18 = Tilpasningsintervall

seg-c6b034712788 = SISRE bane RMS

seg-55c287c93940 = SISRE bane maks

seg-ad604a608329 = SISRE med klokke RMS

seg-28723ab60ae0 = radielt / langs / på tvers RMS

seg-911a62245e80 = { "60" } s

seg-1a35a89c1a34 = { "0.041" } cm

seg-7cf9e6e3178f = { "0.179" } cm

seg-d8a7f4c080dd = { "0.069" } cm

seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

seg-64015edf42d8 = { "120" } s

seg-a1070c338686 = { "0.032" } cm

seg-cdacf90f8ce8 = { "0.160" } cm

seg-29aeee696ad2 = { "0.079" } cm

seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

seg-8fa4e4ccc5cc = { "180" } s

seg-13182ae6d536 = { "0.093" } cm

seg-fc692062aaa8 = { "0.540" } cm

seg-9ef760f0777c = { "0.134" } cm

seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

seg-bbd4f2685bee = { "300" } s

seg-93410318239b = { "0.310" } cm

seg-4af8f1c977eb = { "1.033" } cm

seg-0921a535896a = { "0.329" } cm

seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

seg-8de43db30454 = { "450" } s

seg-ec7f9ca7654b = { "1.690" } cm

seg-1ad55674fab9 = { "7.542" } cm

seg-a022913c956d = { "1.696" } cm

seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

seg-21b0c99fbda4 = { "600" } s

seg-6840aea9ff12 = { "2.875" } cm

seg-798c8c1d0190 = { "10.219" } cm

seg-6b3b442069d8 = { "2.866" } cm

seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

seg-4dabf1faddfc = { "900" } s

seg-d733d3fdac02 = { "9.345" } cm

seg-3334d120521b = { "34.032" } cm

seg-4d4a2cc180d0 = { "9.349" } cm

seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

seg-f1d733b03f45 = { "0.000" } cm

seg-81a60d921ce9 = { "0.057" } cm

seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

seg-c8a720a6f160 = { "0.074" } cm

seg-b13f5539e4b1 = { "0.001" } cm

seg-1c9d3ee30ac7 = { "0.090" } cm

seg-7dd08c671dc7 = { "0.004" } cm

seg-740e69fcd85e = { "0.014" } cm

seg-c0db4312d8a0 = { "0.106" } cm

seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

seg-f3bda174cbef = { "0.037" } cm

seg-5a5bb868e8ff = { "0.176" } cm

seg-02b99fcb9fee = { "0.127" } cm

seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

seg-ec1e77bc5be9 = { "0.214" } cm

seg-d3c1ed834802 = { "0.643" } cm

seg-23482e7c028f = { "0.229" } cm

seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

seg-bfec9407ffae = { "1.015" } cm

seg-f295ad6efcf4 = { "3.695" } cm

seg-2cd92d16edfc = { "1.062" } cm

seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

seg-4e19f776d1b7 = Og med en tilpasning på { "300" } s, der det varieres hvor ofte en ny melding tar over:

seg-89810ffbeff3 = Oppdateringsperiode

seg-d4d1fa05e1a8 = { "0.314" } cm

seg-828b7488993b = { "0.850" } cm

seg-edb934c1419f = { "0.288" } cm

seg-52c8f821a7d2 = { "0.859" } cm

seg-e135107af135 = { "150" } s

seg-e7ce46d74f3e = { "0.219" } cm

seg-3391df1cf909 = { "0.830" } cm

seg-d6eb4f554461 = { "0.009" } cm

seg-22c68874002b = { "0.010" } cm

seg-2172d9ea618e = Kepler-settet med 16 parametere forringes fra { "0.04" } cm ved { "60" } s til { "9.35" } cm ved { "900" } s: ett Kepler-sett med harmoniske to ganger per omløp kan ikke følge de høyfrekvente gravitasjonsleddene og luftmotstanden til en LEO-bue i mer enn noen få minutter, og dets minste kvadraters residual oscillerer over vinduet. Polynomene langs/på tvers/radielt (grader { "7" }, { "5" }, { "6" }) absorberer det som er igjen: { "1.01" } cm ved { "900" } s, { "0.21" } cm ved { "600" } s. Ved de korteste intervallene er Kepler-tallene under en millimeter og ikke lenger strengt ordnet (tilpasningen er da begrenset av kondisjoneringen, ikke av modellen).

seg-aca262796570 = Modellsammenligning

seg-fdf2368d0210 = <c1/> kjører de fire modellene ved { "1" }, { "5" } og { "10" } minutter på samme bane, med antall parametere og efemeride- og klokkebitene i Kshanas koding:

seg-7d3c6c43390d = Efemeride- + klokkebit

seg-f7f60c66d89e = { "0.022" } cm

seg-f7bcb8a44fde = { "0.049" } cm

seg-2972b631701e = { "0.230" } cm

seg-cc42e8dc7238 = { "0.260" } cm

seg-67e50069c6f7 = { "3.061" } cm

seg-780954ab9d7f = { "3.071" } cm

seg-de81d6550264 = { "0.044" } cm

seg-fb171bf75f27 = { "0.005" } cm

seg-c8c067631f7a = { "0.120" } cm

seg-2dc41855c245 = { "0.208" } cm

seg-6ef79938dd22 = { "0.046" } cm

seg-7e96d7e34e63 = { "0.142" } cm

seg-c43199891163 = { "0.258" } cm

seg-f9a9fdebc114 = { "0.290" } cm

seg-f157ff5b40b1 = <c1/> (nullklokke)

seg-9474a775dc5e = { "28.784" } cm

seg-5098c8b6f813 = { "0.561" } cm

seg-5e7fdc441b03 = { "28.774" } cm

seg-82d3fa2e27ef = Nullklokke-raden vurderes mot en klokke styrt med en rest på { "0.24" } m (ATOMIC-tallet), de andre mot den fritt gående klokken de tilpasser.

seg-769db176020f = <b>Liu et al. { "2025" }, SISRE mot høyde (MODELLED).</b> Det samme scenarioet tilpasser Kshanas modell med 22 parametere over buer på 20 minutter ved artikkelens fem høyder, ved hver satellitts inklinasjon:

seg-01e587427a7e = Satellitt

seg-f6bbd3d5d75c = Inklinasjon

seg-c54d0bd7d498 = Liu et al. { "2025" }

seg-16c489b75f44 = Kshana (RMS bare for bane)

seg-ee4816ca13c1 = forhold

seg-510349500d23 = { "8.88" } cm

seg-a97bde451ec2 = { "4.25" } cm

seg-b6c1d48847d9 = { "475" } km

seg-f79249e9bd75 = { "6.21" } cm

seg-9b6757a674a5 = { "2.87" } cm

seg-62008169ca69 = { "2.20" } cm

seg-06a4bcde0ea3 = { "966" } km

seg-9e5e06ec23c3 = { "2.11" } cm

seg-41ce80bc0b62 = { "1.25" } cm

seg-c9f63cd8bd07 = { "0.75" } cm

seg-f11a960a1d52 = { "0.51" } cm

seg-0376cf5f98f0 = Dette er <b>ikke</b> en validering. Artikkelen tilpasset reelle presise vitenskapelige baner for de navngitte satellittene (med full gravitasjons-, luftmotstands- og ikke-gravitasjonshistorikk); Kshana tilpasser sin egen integrerte bane, evaluerer de seks tilføyde parameterne som beskrevet ovenfor, og bruker egne SISRE-vekter. Sammenligningen viser trenden og størrelsesordenen. Sammenligningen på de samme reelle banene artikkelen tilpasset er <c1/> (siden { "0.30" } stemmer tilpasningen med 22 parametere der innenfor den forhåndsregistrerte faktoren { "1.5" }, på artikkelens dager og på åtte tilbakeholdte dager).

seg-d82887c766e3 = Oppdatering midt i overflygingen

seg-d1104b6ea7fa = <c1/> plasserer en bruker (standard { "45" }° N, { "10" }° Ø), finner den høyeste overflygingen over masken innenfor <c2/>, og planlegger meldinger hver <c3/>. Ved hvert skifte inne i overflygingen rapporterer den posisjonshoppet, klokkehoppet, brukerens pseudoavstandshopp (ny melding minus gammel), det største hoppet en synlig bruker kan se (lukket form over nadirkjeglen), avstandsfeilen før og etter, og PASS eller FAIL mot <c4/>. <c5/> (tilpasninger på { "300" } s oppdatert hver { "150" } s):

seg-7d91304c87e3 = Den høyeste overflygingen i løpet av et døgn når { "43.7" }° og varer { "455" } s. Skiftene:

seg-289e8da49cc8 = Bytte

seg-e80d12ee2259 = Elevasjon

seg-b16789d14338 = Posisjonshopp

seg-b3c252609532 = Klokkehopp

seg-8239a390ec71 = Hopp i brukeravstand

seg-4153faf7969d = Hopp ved dårligste geometri

seg-14402c7fb332 = IOD { "270" } → { "271" }

seg-7862a97ac55f = { "0.07" } mm

seg-4cfe934c881f = { "0.19" } mm

seg-9e9752920165 = -0.17 mm

seg-4267557786be = { "0.27" } mm

seg-46872e8925b2 = IOD { "271" } → { "272" }

seg-4c803fd2ccc9 = { "0.14" } mm

seg-cc9a8388f6bc = -0.24 mm

seg-0549f7fd0633 = IOD { "272" } → { "273" }

seg-ad1afcf9a466 = -0.22 mm

seg-c1b30171b4f0 = { "0.35" } mm

seg-f93647402fa9 = { "0.48" } mm

seg-69b35182807c = Største hopp i brukeravstand { "0.35" } mm mot en terskel på { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Koding og dekoding

seg-1b3674a0e041 = <c1/> koder den første av tre meldinger, dekoder den, kontrollerer CRC-en og avviser en ødelagt kopi, skriver ut kvantiseringsbudsjettet, og skriver og leser tilbake RINEX-lignende blokken og CSV-tabellen:

seg-480eb9ffc333 = ramme: { "171" } bytes ({ "1310" } nyttelastbiter, hvorav { "1045" } er efemeride og klokke), 24-bits syklisk redundanskontroll (CRC-24Q) <c1/>;

seg-0e2a64a063fd = største halvtrinnseffekt av et enkelt felt: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = hele meldingen etter kvantisering: posisjon innenfor { "1.126" } mm og klokke innenfor { "0.185" } mm av den eksakte meldingen; SISRE { "0.113" } cm eksakt, { "0.129" } cm dekodet;

seg-6e818708b695 = en ramme med én snudd bit avvises: true;

seg-31fe0f6b133d = RINEX-lignende rundtur innenfor { "5.0e-06" } m, CSV-rundtur innenfor { "0.0e+00" } m.

seg-405cf34090cc = Plattformuavhengighet

seg-7f2193f6ff06 = En ramme er sendte heltall, så det må være de samme heltallene uansett hvor og hvordan scenarioet kjøres: den native binærfilen på et hvilket som helst operativsystem, et debug- eller et release-bygg, og WebAssembly-bygget (WASM) i en nettleser. Tre ting sto i veien. Sinus, cosinus, arcustangens og eksponentialfunksjon i en verts matematikkbibliotek er ikke pålagt å være korrekt avrundet, og de er forskjellige mellom verter i siste siffer. Et optimalisert bygg på macOS henter sinus og cosinus av ett argument fra systemets kombinerte rutine, som ikke alltid gir samme verdi som sinus alene, så et debug- og et release-bygg avvek også fra hverandre. Og den vanlige normalfordelingssampleren kaller vertens eksponential- og logaritmefunksjon i sine sjeldne grener. Tilpasningen gjør en så liten forskjell om til andre kvantiserte felt. Hele scenariotypen (referansebane og -klokke, tilpasning, brukeralgoritme, avstandsfeil i signal i rommet (SISRE), kodek) beregner derfor hver slik funksjon med den rene Rust-biblioteket <c1/> via <c2/>, heltallspotenser som eksplisitte produkter, og normalfordelte avvik med polarmetoden på generatorens rå utdata. <c3/> låser den 171 byte lange rammen i kode-og-dekode-scenarioet nedenfor og én kontrollverdi per efemeridemodell; et debug-bygg, et release-bygg og WASM-bygget gir byte-identiske resultatdokumenter for alle fem medfølgende <c4/>-scenarioer.

seg-1ef00467df17 = Binærformat

seg-af2dae9e9e7c = <b>Dette er Kshanas egen dokumenterte koding.</b> Den bærer komponentene som de publiserte beskrivelsene av LEO-navigasjonsmeldinger nevner, modellert etter Galileo ICD-feltsettet. Den er <b>ikke</b> bitoppsettet til Celeste eller noe annet system: ingen av dem er offentlige.

seg-6a730c01ad1c = Ramme: preamble <c1/> ({ "8" } biter), versjon { "1" } ({ "4" }), modell ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), nyttelastlengde i bytes ({ "12" }), nyttelast nullutfylt til en byte, CRC-24Q (en 24-bits syklisk redundanskontroll, { "24" } biter) over hver foregående byte. CRC-24Q er kontrollen i standarden RTCM { "10403" } fra Radio Technical Commission for Maritime Services og i Galileo ICD (polynom <c6/>, startverdi { "0" }); koden gjengir katalogens kontrollverdi <c7/> for <c8/> og kontrollbytene i RTCM { "10403" }-eksempelrammen for meldingstype { "1005" } (<b>VALIDATED</b>).

seg-a31d899eb435 = Galileo ICD-trinnene ble valgt for middels høy jordbane og er for grove for en LEO-melding på centimeternivå: <c1/> i trinn på { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm ved LEO-radius), vinklene { "2" }⁻³¹ semisirkler ({ "1.0" } cm) og <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana beholder ICD-enhetene og semisirkelkonvensjonen, forfiner trinnene slik at halvtrinnsfeilen i hvert felt holder seg under { "1" } mm i posisjon eller avstand over et 15-minutters vindu, og utvider feltene for å dekke områdene en LEO-tilpasning trenger:

seg-caddc6f5b9a7 = Blokk

seg-b548b723c201 = Biter

seg-d00b65801e9b = Trinn

seg-2085d172bec3 = hjelpe- og synkroniseringsdata

seg-7e9018f82811 = uke

seg-45cbfedb6f0e = klokke (flaggbit { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = Kepler (modell 1-3)

seg-3fb59c8238cb = semisirkel

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = korreksjoner langs/på tvers/radielt (modell { "2" })

seg-131652f53721 = tilleggsledd fra Liu et al. { "2025" } (modell { "3" })

seg-fccf37a24fc4 = semisirkel/s^{ "2" }

seg-ebde561c17ab = ECEF-polynom (modell { "4" })

seg-822c7482547c = Klobuchar (flaggbit { "1" })

seg-7dd6e8bcaf43 = s/semisirkel^{ "2" }

seg-09408b08c481 = s/semisirkel^{ "3" }

seg-734162101b2d = NeQuick-G (flaggbit { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (flaggbit { "3" })

seg-545755e7b26f = En verdi utenfor feltets område avvises, den bretter seg ikke rundt. Områdene ble kontrollert ved å kode tilpasninger på { "300" } til { "2000" } km, banehellinger fra { "0" }° til { "140" }° og tilpasningsintervaller på opptil { "20" } minutter: <c1/> og <c2/> er brede fordi knutepunktet er dårlig definert i en bane nær ekvator og tilpasningen fordeler J2-driften i breddeargumentet mellom dem, og <c3/> og <c4/> fordi 22-parametertilpasningen over { "20" } minutter tar opp en del av den korte perioden i svingningen av store halvakse. Siden { "0.30" } er 22-parametertilpasningen artikkelens rene minste kvadraters metode uten forhåndsinformasjon, og en ekvatorial tilpasning på { "800" } km trenger da <c5/> på omtrent { "6.3e-10" } semisirkel/s^{ "2" }, så skalaen gikk fra { "2" }^-60 til { "2" }^-58. De langsgående korreksjonene av grad 7 i <c6/> passer inn i 22-biters koeffisientområdet opptil { "15" } minutter; en lengre tilpasning kan overskride det og avvises da. <c7/> rapporterer, for hvert efemeride- og klokkefelt, den største endringen i posisjon og avstand som en halvtrinnsendring gir over bruksperioden, og endringen i hele meldingen etter kvantisering.

seg-1ad17f3d3643 = Teksteksport

seg-81fb376aa1e1 = <b>RINEX { "4.02" } definerer ingen LEO-navigasjonsposter</b> (systembokstavene er G, R, E, J, C, I og S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Blokken som <c1/> skriver låner RINEX { "4" }-formen — en <c2/>-posthode, en linje med satellitt og epoke med tre klokkeledd, linjer med kringkastet bane på fire <c3/>-felt — og er en <b>dokumentert Kshana-utvidelse</b>: systembokstav <c4/>, posttypene <c5/>, <c6/>, <c7/>, <c8/>, og tre hodekommentarer som sier det. Tidligere arbeid om LEO-baner i navigasjonsposter i RINEX-4-stil: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = CSV-tabellen bærer meldingene <c1/> og <c2/>, én per rad. Standardkolonnene bruker Galileo ICD-navnene (<c3/>); <c4/> velger i stedet stavemåten til en forhåndsinnstilling. Begge formatene kan leses tilbake.

seg-4a26902d2771 = Ionosfære og UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: motorens L1-modell (<c1/>, kontrollert mot RTKLIB) skalert til bærebølgen med førsteordens-loven <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: koeffisientene følger med i meldingen, og <c1/> returnerer <c2/> for en modifisert dip-breddegrad <c3/>, med algoritmens regler (koeffisienter som alle er null gir { "63.7" } solfluksenheter, sfu; resultatet begrenses til [{ "0" }, { "400" }] sfu). NeQuick-elektrontetthetsmodellen og dens integrasjon langs siktlinjen, som gjør <c4/> om til en forsinkelse, er <b>ikke</b> implementert.

seg-66dbd447dfeb = En satellitt på noen hundre kilometers høyde flyr inne i ionosfæren. Ingen av de to kringkastede modellene tar hensyn til elektroninnholdet over satellitten, og det anvendes ingen korreksjon for det.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> anvender de tre tilfellene i Galileo ICD §{ "5.1.7" } (før, innen seks timer av og etter en skuddsekundhendelse); et innsatt sekund leses som { "86400" }.

seg-2b0d77219437 = Forhåndsinnstillinger

seg-d2908020db08 = Forhåndsinnstillinger er data, én fil hver under <c1/>, med kildene sine. Motoren og alle medfølgende scenarioer unntatt Celeste-scenarioet kjører uten dem.

seg-c353e7bec219 = Nøkkel

seg-5566e1d71a4f = Bane

seg-33f4c7af9c53 = Bærebølge

seg-f4510e898031 = Meldingsmodell

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = ikke publisert

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>RNTF-rapport</a1>, beskrivelse av konstellasjonen

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz ({ "1616" }–{ "1626" } MHz-bånd)

seg-3f5de7f74502 = ingen kringkasting

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, beskrivelse av konstellasjonen

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = Ku-bånd, verdi midt i båndet (representativ)

seg-567fab40bd24 = ingen (mulighetssignaler)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = nær B1 (maskert i kilden; L1 som stedfortreder)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (RNSS C-bånd, senter)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (representativ)

seg-522c85402d84 = L1 (representativ)

seg-064b03765e4d = <c1/>, grad { "6" }, { "60" } s, oppdatert hvert { "30" } s, null klokke, { "0.24" } m styringsrest

seg-5619bc61b958 = WORKSHOP and PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, grader og postavstand i forhåndsinnstillingsfilen

seg-e881ffc4e14b = RNSS er radionavigasjonssatellitttjenesten; RNTF er Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> Forhåndsinnstillingen for Celeste-demonstrasjonen i bane (IOD) fra Den europeiske romorganisasjonen (ESA) er den eneste som bruker materiale presentert på ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT-workshopen, { "2026" }: meldingsstrukturen (Galileos Kepler-sett pluss korreksjonspolynomer langs/på tvers/radielt, klokkepolynom, SVID, helse, IOD, ionosfære- og UTC-parametere), postavstanden og CSV-kolonnenavnene. Banen ({ "510" } km, nesten polar solsynkron) og bærebølgen kommer fra offentlige kilder som er oppgitt i filen. Celestes bitoppsett er ikke offentlig og gjengis ikke; senere Celeste-faser og EUs LEO-PNT-system kan avvike. Hver verdi som stammer fra workshopen ligger i modulen <c1/> i <c2/>, brukt av <c3/>. Slik holdes forhåndsinnstillingen tilbake: hvert tall fra workshopen i motoren ligger i én fil, <c4/>, som <c5/> bare kompilerer inn når den finnes, og i scenarioene <c6/> som bare finnes i repositoriet. Når den filen og de scenarioene slettes, holdes forhåndsinnstillingen tilbake uten kildeendring; alle andre tester, uavhengige referanser og scenarioer kjører uten den, og antallet scenariofiler i README teller fortsatt de tilbakeholdte filene.

seg-906da2752f76 = Verifikasjon

seg-7338b6210228 = Rad

seg-c5ce76c91ff7 = Merkelapp

seg-cfe0d596296e = SISRE-vekter

seg-3e0059048a0d = tabellen til Montenbruck et al. { "2018" } (GPS, GLONASS, Galileo, BeiDou, geostasjonær)

seg-0f5e73171fe0 = Galileo ICD-brukeralgoritmen

seg-29ad977ef423 = RTKLIB <c1/> på fire virkelige kringkastede Galileo-efemerider, { "1" } mm per akse (<c2/>)

seg-ecec254e8219 = katalogens kontrollverdi <c1/>; RTCM { "10403" } { "1005" }-eksempelramme

seg-388633e4e785 = Tilpasning og SISRE-avveining

seg-8b85c3277e66 = totrekkslegemets referanse gjenfunnet til { "1" } mm; korrigert J2–J6-tilpasning til { "1" } mm; monoton vekst med intervallet

seg-4de7f2b173c5 = Kontinuitet midt i passeringen

seg-bdbd2771c7f5 = hoppidentitet; lukket kjeglegrense mot sampling

seg-468a92a2caf7 = Binærformat og budsjett

seg-ba26f5f63172 = rundturer; halvtrinnet i hvert felt under { "1" } mm

seg-9be43cbef131 = RINEX-lignende og CSV

seg-a7748156fd6e = rundturer

seg-88b5cda10923 = 22-parametermodellen og tilpasningen til Liu et al. { "2025" }

seg-7272ebdc1fec = presise TU Graz ITSG-baner for fire satellitter mot tabellene { "4" }, { "5" }, { "6" } og { "8" } i artikkelen: forholdstall for langs, på tvers, radielt og SISRE { "0.755" } til { "1.138" } på artikkelens dager og { "0.683" } til { "1.186" } på åtte tilbakeholdte dager, innenfor 1.5x (<c1/>)

seg-94066142a642 = ATOMIC-polynomet med null klokke og tabellen for fem høyder

seg-205cdc6a3696 = ATOMIC-fakta fra InsideGNSS; den publiserte Liu-tabellen skrevet ut ved siden av Kshanas tilpasning til den integrerte banen, ikke låst

seg-8c00ed11609c = lukkede former fra ICD; den Klobuchar-modellen som er kontrollert mot RTKLIB

seg-d5653e0958b5 = SISRE er bare representasjonsfeil: ingen feil fra banebestemmelse eller prediksjon.

seg-4968d9fcbc19 = Referansen er en Kshana-integrasjon (uten tredjelegeme, solstrålingstrykk eller tidevann), ikke den presise banen til en virkelig satellitt.

seg-6a4a1bf21b50 = Binærformatet og den RINEX-lignende blokken er Kshanas egne.

seg-26c0a2693081 = NeQuick-G bæres med, men integreres ikke til en forsinkelse; ingen korreksjon for en satellitt inne i ionosfæren.

seg-2a0c8190c38e = Sammenligningen med Liu et al. avviker i baner, tolkning av parametere og vekter.

seg-4abe216f987a = <s1>Forrige</s1>LEO-passering og linkbudsjett

seg-59d9bf4735d8 = <s1>Neste</s1>Fusjonert MEO- og LEO-posisjonering
