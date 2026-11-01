# docs--leo-navmsg: translations (da)

seg-cc651d9cef3b = Kode

seg-cbf0f9bcd2d8 = Uafhængig reference

seg-6e0cb6acc073 = VALIDATED

seg-35f8f623ea28 = { "30" } s

seg-f63dd3d7aad4 = Kilde

seg-e305279d5b11 = Indhold

seg-4d208b6c0eb8 = day

seg-a7d59ba6e225 = rad

seg-02dc0d42fb21 = sfu

seg-0f2d3faa9934 = Kilde: <c1/>

seg-d8aaee95aa44 = Scenarietypen <c1/> bygger den udsendte efemeride- og urmeddelelse for en PNT-satellit (positionering, navigation og tidssynkronisering) i lav jordbane (LEO) og besvarer de spørgsmål, en meddelelsesudformer stiller: hvor længe kan én meddelelse dække, hvad køber hver ekstra parameter, hvad ser en bruger, når meddelelsen skifter midt i en passage, og hvor mange bits kræver det at bære den til centimeteren.

seg-e61283b1e1a5 = Den er systemuafhængig. Enhver bane, enhver bærebølge og enhver af fire efemeridemodeller kører helt uden forudindstilling; de navngivne forudindstillinger er valgfrie data (se <a1>Presets</a1>).

seg-1271cd4ad822 = Udskriv et medfølgende eksempel med <c1/> (ét navn pr. kald) og kør det med <c2/>: <c3/>, <c4/>, <c5/> og <c6/>. Typen er også meddelelsestrinnet i typen <c7/> (<a1>LEO-PNT.md</a1>) og medlem af kampagnen <c8/>, som sammensætter fire meddelelseskonfigurationer og rapporterer hver ens rammelængde ({ "146" }, { "154" }, { "159" } og { "171" } bytes).

seg-51da9ffaa0ec = Kode: <c1/> — <c2/> (poster og brugeralgoritme), <c3/> (sand bane og sandt ur), <c4/> (tilpasningsrutine), <c5/> (afstandsfejl for signal i rummet), <c6/> (ionosfære og Coordinated Universal Time (UTC)), <c7/> (binært format), <c8/> (eksport i Receiver Independent Exchange Format (RINEX)-stil og kommasepareret (CSV) form), <c9/> (én fil pr. forudindstilling), <c10/> (selve typen).

seg-0505113a62e3 = Hvad en meddelelse indeholder

seg-6752521002b2 = Del

seg-cf6ae60eea4f = Hjælpedata

seg-00eae74cb1e6 = rumfartøjsidentifikator (SVID), dataudgave (IOD), båndidentifikator, signalets sundhedsstatus (Galileo-konvention: { "0" } OK, { "1" } ude af drift, { "2" } udvidet drift, { "3" } under test)

seg-0bdbdd2c923b = Synkronisering

seg-8120237b02ea = ugenummer, ugetid (TOW) for afsendelsen og et andenordens urpolynomium <c1/>

seg-b09dc4b322d3 = Efemeride

seg-bbb3225e1d19 = én af de fire modeller nedenfor

seg-3a835a49b43f = Andre tjenester

seg-2a13461cb60c = et udsendt Klobuchar-ionosfærisk sæt, Galileo NeQuick-G-koefficienter <c1/> med fem stormflag og parametre fra systemtid til UTC <c2/>

seg-6b899ef63047 = Efemeridemodeller

seg-60cd077d82a7 = Model

seg-2afa300864a9 = Parametre

seg-3e8a1cf183cc = Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) Keplerske sæt: <c1/>

seg-b1416ba3472f = det samme plus polynomier for korrektion langs banen, på tværs af banen og radialt (RAC) <c1/>, <c2/>, <c3/> i <c4/>, koefficienter i meter, <c5/> toerpotensen ved eller over halvdelen af tilpasningsintervallet (udsendt), grader fastsat af <c6/> (standard { "7" }, { "5" }, { "6" })

seg-9c0643152bbf = { "16" } + { "21" } som standard, plus tidsskalaen

seg-e0afd541d64c = 22-parametermodellen af Liu, Su, Xie, Zhou og Qu ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): de { "16" } plus <c1/>

seg-a6042071a03f = ATOMIC-modellen (Autonomous Time and Orbit Determination for Microsatellite Constellations) med "nul-ur": et jordcentreret jordfast (ECEF) polynomium pr. akse i <c1/> (standardgrad { "6" }), ingen urled, fordi satellitens ur styres mod systemtid (<a1>InsideGNSS</a1>)

seg-5869d6f65796 = { "22" } som standard

seg-6663aa3eeebc = Brugeralgoritmen (<c1/>) er Galileo-ICD-sekvensen (Keplers ligning, andenharmoniske korrektioner, jordfast knude) efterfulgt, for <c2/>, af de tre polynomier langs den Keplerske banes eget system: radialt langs den evaluerede position, på tværs af banen langs banenormalen ud fra den korrigerede inklinering og knude, langs banen, så triaden fuldføres. Uret tilføjer ICD'ets relativistiske led <c3/>; for <c4/> er det den generelle form <c5/> ud fra polynomiet og dets afledede.

seg-b3935a85a7b2 = Leddene fra Liu et al. følger artiklens brugeralgoritme (Section { "2.2" }, Eq. 1-7): <c1/>, <c2/> (udgivelser før { "0.30" } brugte konventionen for Global Positioning System (GPS) civil navigation <c3/>, så en <c4/>, de skrev, er det dobbelte af artiklens), og <c5/> lagt til radius, <c6/> det ukorrigerede breddegradsargument. Skalakonventionen for <c7/> er afskrevet fra artiklens Eq. { "1" }; sammenligningen med artiklen på reelle baner afhænger ikke af den (en faktor ½ på <c8/> lader alle tilpassede tal være uændrede), så betydningen af en udsendt <c9/>-værdi er ikke valideret dér.

seg-9a83292bffcf = To aflæsninger er Kshanas egne og angives som sådan:

seg-0e42fd0d5cf9 = RAC-systemet og normaliseringen <c1/>. Intet offentligt dokument definerer et korrektionssystem for LEO til en udsendt meddelelse.

seg-1b8aaed09de8 = Et nul-urs meddelelse har i alt nul ur: styresløjfen antages at holde det tilsyneladende ur, relativistisk led inklusive, på systemtid.

seg-3472ce139588 = Tilpasningsrutinen

seg-4404a677d185 = <c1/> integrerer banen med en fjerdeordens Runge–Kutta med fast trin i et system, der drejes over i jordfaste akser ved én rotation, <c2/>, den samme enkelte rotation, som en udsendt brugeralgoritme anvender. Tyngdekraften er tolegeme (<c3/>), de zonale harmoniske J2 til J6 ({ "2" } til { "6" }), eller feltet Earth Gravitational Model { "2008" } (EGM2008) til grad og orden { "7" } til { "70" }, hvis tesserale led bærer det kortperiodiske aftryk, der gør en LEO-tilpasning svær. Luftmodstand er valgfri (statisk eksponentiel massefylde). Uret er frit løbende (bias, drift, driftrate og hvid frekvensstøj ved en angiven Allan-deviation på ét sekund, plus det periodiske relativistiske led) eller styret (en førsteordens Gauss–Markov-residual).

seg-ae3052e66b2a = <c1/> tilpasser det Keplerske sæt med Levenberg–Marquardt på ikke-singulære elementer (<c2/>, <c3/>, <c4/>): en LEO-bane er næsten cirkulær, så <c5/> og <c6/> hver for sig er næsten umulige at skelne. Den starter fra den oskulerende tilstand ved <c7/> med J2-knuderaten. Svage nul-centrerede apriorier begrænser de rater og harmoniske, som en kort bue ikke kan opløse; med en observationsvægt på { "1" } cm virker de kun i disse nulretninger. Tilpasningen <c8/> tager i stedet artiklens Section { "2.3" } start og estimator: den starter med alle korrektionsled lig nul, har ingen apriorier (almindelig mindste kvadraters metode) og beholder artiklens loft på 100 iterationer. Den stopper efter Kshanas egen konvergensregel for parametre, når hvert parametertrin er under { "1e-3" } af dets formelle standardafvigelse; artiklen stopper i stedet, når RMS ændrer sig med mindre end { "0.1" } mm. RAC-polynomierne tilpasses derefter til residualerne langs/på tværs/radialt med lineær mindste kvadraters metode, og urpolynomiet til det sande ur minus det relativistiske led, som brugeren lægger til igen.

seg-020f45edcae1 = Et fund, som standardværdierne afspejler: efter en Keplersk tilpasning med mindste kvadrater er residualen pr. konstruktion det, som de { "16" } parametre ikke kan spænde over, så den svinger hen over vinduet (flere nulgennemgange i hver komponent) frem for at drive. Et korrektionspolynomium fjerner den kun, når dets grad overstiger det, det Keplerske sæt allerede spænder over: langs banen { "7" }, på tværs af banen { "5" } og radialt { "6" } bringer en 15-minutters residual fra centimeter til omkring en millimeter, mens lavere grader på tværs af banen fjerner næsten intet (residualen på tværs af banen er ulige om vinduets midte). Et system, der udleder sin Keplerske del på anden vis, efterlader en residual af en anden form, og de grader, det kræver, følger heraf. Forudindstillingen Celestes egne korrektionsgrader (lavere end disse; de findes kun i forudindstillingsfilen, <c1/>) kører her på Kshanas mindste-kvadraters-grundlag, hvorfor dens led på tværs af banen bidrager lidt i denne motor: en udtalelse om Kshanas tilpasningsrutine, ikke om noget reelt system. <c2/> og <c3/> er hele sekunder, som det binære format bærer dem.

seg-f3538e6651fa = Hver meddelelse bruges over en periode centreret i sit tilpasningsvindue (den første afvejningstabel bruger hele vinduet). Det, tallene for signal-i-rummet-afstandsfejl (SISRE) måler, er meddelelsens <b>repræsentationsfejl</b> mod den sandhed, den blev tilpasset til, som root mean square (RMS) og et maksimum over spændet. Fejlen ved banebestemmelse og baneprædiktion, som et reelt jord- eller ombordsegment tilføjer ovenpå, er ikke modelleret.

seg-c2b181269367 = Afstandsfejl for signal i rummet

seg-63462a1abc95 = <c1/> bruger den globale gennemsnitlige SISRE fra Montenbruck, Steigenberger og Hauschild ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

seg-c4f654264c42 = Vægtene er gennemsnittene over brugere jævnt fordelt på den synlige jordkalot af <c1/> og <c2/>, hvor <c3/> er synslinjens nadirvinkel ved satellitten, beregnet for banens egen radius og elevationsmaske. Ved en maske på { "0" }° gengiver beregningen artiklens tabel for mellemhøj jordbane (GPS { "0.98" } og 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) og geostationær bane ({ "0.99" } og 1/126): det er den <b>VALIDATED</b> kontrol. I LEO giver det samme gennemsnit

seg-66b488889b10 = Højde

seg-c07128592d7b = nadirvinkel ved horisonten

seg-a4e04d9a23a5 = { "320" } km

seg-002adc24471f = { "510" } km

seg-fe2f70c29806 = { "550" } km

seg-4dee38ff0811 = { "786" } km

seg-cfc3c6939861 = { "1080" } km

seg-102de0413553 = { "1336" } km

seg-1b11819c8b2f = så en LEO-bruger, der ser satellitten langt fra nadir, mærker fejl langs og på tværs af banen langt mere end en bruger i mellemhøj bane.

seg-b7a844ab6135 = Analyser

seg-17111fe25e04 = <c1/> vælger en hvilken som helst af de fire (standard alle).

seg-d0c1b335af73 = Afvejning af tilpasningsinterval

seg-f65e99c0d8b2 = <c1/> angiver spændet, tilpasningsintervallerne, opdateringsperioderne og modellerne. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 til grad { "20" } og luftmodstand, { "30" } minutters meddelelser) giver, med brugsperioden lig tilpasningsintervallet:

seg-f1a94c795c18 = Tilpasningsinterval

seg-c6b034712788 = SISRE bane-RMS

seg-55c287c93940 = SISRE bane-maks.

seg-ad604a608329 = SISRE med ur-RMS

seg-28723ab60ae0 = radial / langs / på tværs RMS

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

seg-4e19f776d1b7 = Og med en tilpasning på { "300" } s, idet det varieres, hvor ofte en ny meddelelse overtager:

seg-89810ffbeff3 = Opdateringsperiode

seg-d4d1fa05e1a8 = { "0.314" } cm

seg-828b7488993b = { "0.850" } cm

seg-edb934c1419f = { "0.288" } cm

seg-52c8f821a7d2 = { "0.859" } cm

seg-e135107af135 = { "150" } s

seg-e7ce46d74f3e = { "0.219" } cm

seg-3391df1cf909 = { "0.830" } cm

seg-d6eb4f554461 = { "0.009" } cm

seg-22c68874002b = { "0.010" } cm

seg-2172d9ea618e = Det Keplerske sæt med 16 parametre forringes fra { "0.04" } cm ved { "60" } s til { "9.35" } cm ved { "900" } s: ét Kepler-sæt med harmoniske to gange pr. omløb kan ikke følge tyngdekraftens højfrekvente led og luftmodstanden på en LEO-bue i mere end nogle få minutter, og dets residual efter mindste kvadrater svinger hen over vinduet. Polynomierne langs/på tværs/radialt (grader { "7" }, { "5" }, { "6" }) optager det, der er tilbage: { "1.01" } cm ved { "900" } s, { "0.21" } cm ved { "600" } s. Ved de korteste intervaller er de Keplerske tal under en millimeter og ikke længere strengt ordnede (tilpasningen er da begrænset af kondition, ikke af modellen).

seg-aca262796570 = Modelsammenligning

seg-fdf2368d0210 = <c1/> kører de fire modeller ved { "1" }, { "5" } og { "10" } minutter på samme bane, med antallet af parametre og efemeride- og urbits i Kshanas kodning:

seg-7d3c6c43390d = Efemeride- og urbits

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

seg-f157ff5b40b1 = <c1/> (nul-ur)

seg-9474a775dc5e = { "28.784" } cm

seg-5098c8b6f813 = { "0.561" } cm

seg-5e7fdc441b03 = { "28.774" } cm

seg-82d3fa2e27ef = Rækken med nul-ur bedømmes mod et ur styret med en residual på { "0.24" } m (ATOMIC-tallet), de øvrige mod det frit løbende ur, de tilpasser.

seg-769db176020f = <b>Liu et al. { "2025" }, SISRE som funktion af højde (MODELLED).</b> Det samme scenarie tilpasser Kshanas 22-parametermodel over 20-minutters buer i artiklens fem højder, ved hver satellits inklinering:

seg-01e587427a7e = Satellit

seg-f6bbd3d5d75c = Inklinering

seg-c54d0bd7d498 = Liu et al. { "2025" }

seg-16c489b75f44 = Kshana (kun bane-RMS)

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

seg-0376cf5f98f0 = Dette er <b>ikke</b> en validering. Artiklen tilpassede reelle præcise videnskabelige baner for de nævnte satellitter (med deres fulde tyngde-, luftmodstands- og ikke-gravitationelle historik); Kshana tilpasser sin egen integrerede bane, evaluerer de seks tilføjede parametre som beskrevet ovenfor og bruger sine egne SISRE-vægte. Sammenligningen viser tendensen og størrelsesordenen. Sammenligningen på de samme reelle baner, som artiklen tilpassede, er <c1/> (siden { "0.30" } stemmer 22-parametertilpasningen dér inden for den på forhånd fastsatte faktor { "1.5" }, på artiklens dage og på otte tilbageholdte dage).

seg-d82887c766e3 = Opdatering midt i passagen

seg-d1104b6ea7fa = <c1/> placerer en bruger (standard { "45" }° N, { "10" }° E), finder den højeste passage over masken inden for <c2/> og planlægger meddelelser hver <c3/>. Ved hvert skift inden i passagen rapporterer den positionsspringet, urspringet, brugerens pseudoafstandsspring (ny meddelelse minus gammel), det største spring, en synlig bruger kunne se (lukket form over nadirkeglen), afstandsfejlen før og efter, og PASS eller FAIL mod <c4/>. <c5/> ({ "300" } s tilpasninger opdateret hver { "150" } s):

seg-7d91304c87e3 = Den højeste passage på et døgn når { "43.7" }° og varer { "455" } s. Dens skift:

seg-289e8da49cc8 = Skift

seg-e80d12ee2259 = Elevation

seg-b16789d14338 = Positionsspring

seg-b3c252609532 = Urspring

seg-8239a390ec71 = Spring i brugerafstand

seg-4153faf7969d = Spring ved dårligste geometri

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

seg-69b35182807c = Største spring i brugerafstand { "0.35" } mm mod en tærskel på { "5" } cm: <b>PASS</b>.

seg-96dcb456600d = Kodning og afkodning

seg-1b3674a0e041 = <c1/> koder den første af tre meddelelser, afkoder den, kontrollerer CRC'en og afviser en beskadiget kopi, udskriver kvantiseringsbudgettet og skriver og indlæser igen RINEX-lignende blok og CSV-tabel:

seg-480eb9ffc333 = ramme: { "171" } bytes ({ "1310" } nyttelastbits, heraf { "1045" } efemeride og ur), 24-bit cyklisk redundanskontrol (CRC-24Q) <c1/>;

seg-0e2a64a063fd = største halvtrinseffekt for et enkelt felt: <c1/>, { "0.545" } mm;

seg-a1875f7088b0 = hele meddelelsen efter kvantisering: position inden for { "1.126" } mm og ur inden for { "0.185" } mm af den nøjagtige meddelelse; SISRE { "0.113" } cm nøjagtig, { "0.129" } cm afkodet;

seg-6e818708b695 = en ramme med én vendt bit afvises: sandt;

seg-31fe0f6b133d = RINEX-lignende rundtur inden for { "5.0e-06" } m, CSV-rundtur inden for { "0.0e+00" } m.

seg-405cf34090cc = Platformsuafhængighed

seg-7f2193f6ff06 = En ramme er transmitterede heltal, så den skal være de samme heltal, uanset hvor og hvordan scenariet køres: den native binære fil på ethvert operativsystem, et debug- eller et release-build og WebAssembly-buildet (WASM) i en browser. Tre ting stod i vejen. Sinus, cosinus, arcustangens og eksponentialfunktion i en værts matematikbibliotek skal ikke være korrekt afrundede og afviger mellem værter i sidste decimal. Et optimeret build på macOS henter sinus og cosinus af ét argument fra systemets kombinerede rutine, som ikke altid returnerer samme værdi som den enkelte sinus, så et debug- og et release-build afveg også fra hinanden. Og den sædvanlige normalfordelingssampler kalder værtens eksponential- og logaritmefunktion i sine sjældne grene. Tilpasningen gør en så lille forskel til forskellige kvantiserede felter. Hele typen (sand bane og sandt ur, tilpasning, brugeralgoritme, signal-i-rummet-afstandsfejl (SISRE), kodek) beregner derfor alle sådanne funktioner med den rene Rust-kasse <c1/> via <c2/>, heltalspotenser som eksplicitte produkter og normalfordelte afvigelser med polarmetoden på generatorens rå output. <c3/> fastlåser rammen på 171 bytes fra scenariet med kodning og afkodning nedenfor og én kontrolværdi pr. efemeridemodel; et debug-build, et release-build og WASM-buildet giver byte-identiske resultatdokumenter for alle fem medfølgende <c4/>-scenarier.

seg-1ef00467df17 = Binært format

seg-af2dae9e9e7c = <b>Dette er Kshanas egen dokumenterede kodning.</b> Den bærer de komponenter, som de offentliggjorte beskrivelser af LEO-navigationsmeddelelser nævner, modelleret efter Galileo ICD's feltsæt. Den er <b>ikke</b> bitlayoutet for Celeste eller noget andet system: ingen er offentlige.

seg-6a730c01ad1c = Ramme: præambel <c1/> ({ "8" } bits), version { "1" } ({ "4" }), model ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), nyttelastlængde i bytes ({ "12" }), nyttelast udfyldt med nuller til en hel byte, CRC-24Q (en 24-bit cyklisk redundanskontrol, { "24" } bits) over alle foregående bytes. CRC-24Q er kontrollen i standarden RTCM { "10403" } fra Radio Technical Commission for Maritime Services og i Galileo ICD (polynomium <c6/>, startværdi { "0" }); koden gengiver katalogets kontrolværdi <c7/> for <c8/> og kontrolbytes i eksempelrammen af RTCM { "10403" } meddelelsestype { "1005" } (<b>VALIDATED</b>).

seg-a31d899eb435 = Galileo ICD's trin blev valgt til middelhøj jordbane og er for grove til en LEO-meddelelse på centimeterniveau: <c1/> i trin på { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm ved LEO-radius), vinklerne { "2" }⁻³¹ halvcirkler ({ "1.0" } cm) og <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana beholder ICD-enhederne og halvcirkelkonventionen, forfiner trinnene, så hvert felts halvtrinsfejl holdes under { "1" } mm i position eller afstand over et 15-minutters vindue, og udvider felterne, så de dækker de intervaller, en LEO-tilpasning har brug for:

seg-caddc6f5b9a7 = Blok

seg-b548b723c201 = Bits

seg-d00b65801e9b = Trin

seg-2085d172bec3 = hjælpe- og synkroniseringsdata

seg-7e9018f82811 = uge

seg-45cbfedb6f0e = ur (flagbit { "0" })

seg-05d274f5ce99 = s/s^{ "2" }

seg-9d6d5136e12a = Kepler (modeller 1-3)

seg-3fb59c8238cb = halvcirkel

seg-d173e8d7026c = m^{ "0.5" }

seg-48c8bfb6e914 = langs-/tværs-/radiale korrektioner (model { "2" })

seg-131652f53721 = Liu et al. { "2025" } ekstra led (model { "3" })

seg-fccf37a24fc4 = halvcirkel/s^{ "2" }

seg-ebde561c17ab = ECEF-polynomium (model { "4" })

seg-822c7482547c = Klobuchar (flagbit { "1" })

seg-7dd6e8bcaf43 = s/halvcirkel^{ "2" }

seg-09408b08c481 = s/halvcirkel^{ "3" }

seg-734162101b2d = NeQuick-G (flagbit { "2" })

seg-ddbb363f4593 = sfu/deg^{ "2" }

seg-e2744b31e5d3 = UTC (flagbit { "3" })

seg-545755e7b26f = En værdi uden for sit felts interval afvises og ombrydes ikke. Intervallerne blev kontrolleret ved at kode tilpasninger ved { "300" } til { "2000" } km, banehældninger fra { "0" }° til { "140" }° og tilpasningsintervaller op til { "20" } minutter: <c1/> og <c2/> er brede, fordi knuden er dårligt defineret på en næsten ækvatorial bane, og tilpasningen fordeler argumentets J2-drift for breddevinklen mellem dem, og <c3/> og <c4/> er det, fordi 22-parametertilpasningen over { "20" } minutter optager en del af den kortperiodiske svingning i den halve storakse. Siden { "0.30" } er 22-parametertilpasningen artiklens almindelige mindste kvadraters metode uden apriori-værdier, og en ækvatorial tilpasning ved { "800" } km har da brug for <c5/> på omkring { "6.3e-10" } halvcirkel/s^{ "2" }, så dens skala gik fra { "2" }^-60 til { "2" }^-58. De langsgående korrektioner af grad 7 for <c6/> passer i koefficientintervallet på 22 bit op til { "15" } minutter; en længere tilpasning kan overskride det og afvises da. <c7/> rapporterer for hvert efemeride- og urfelt den største ændring i position og afstand, som en ændring på et halvt trin giver over brugsperioden, samt ændringen i hele meddelelsen efter kvantisering.

seg-1ad17f3d3643 = Teksteksport

seg-81fb376aa1e1 = <b>RINEX { "4.02" } definerer ingen LEO-navigationsposter</b> (dets systembogstaver er G, R, E, J, C, I og S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Blokken, som <c1/> skriver, låner formen fra RINEX { "4" } — en postoverskrift <c2/>, en linje med satellit og epoke med tre urled, broadcast-banelinjer med fire <c3/>-felter — og er en <b>dokumenteret Kshana-udvidelse</b>: systembogstav <c4/>, posttyper <c5/>, <c6/>, <c7/>, <c8/> og tre overskriftskommentarer, der siger det. Tidligere arbejde om LEO-baner i navigationsposter i RINEX-4-stil: <a2>arXiv { "2401.17767" }</a2>.

seg-9a3016441bce = CSV-tabellen bærer <c1/>- og <c2/>-meddelelser, én pr. række. Standardkolonnerne bruger Galileo ICD's navne (<c3/>); <c4/> vælger i stedet en forudindstillings stavemåde. Begge formater kan læses tilbage.

seg-4a26902d2771 = Ionosfære og UTC

seg-c4d4dd2bac45 = <b>Klobuchar</b>: motorens L1-model (<c1/>, kontrolleret mod RTKLIB) skaleret til bærebølgen med førsteordens-loven <c2/>.

seg-0d3973f04ee5 = <b>NeQuick-G</b>: koefficienterne følger med i meddelelsen, og <c1/> returnerer <c2/> for en modificeret dip-breddegrad <c3/> efter algoritmens regler (koefficienter, der alle er nul, giver { "63.7" } solar flux units, sfu; resultatet begrænses til [{ "0" }, { "400" }] sfu). NeQuick-elektrontæthedsmodellen og dens integration langs skråvejen, som omsætter <c4/> til en forsinkelse, er <b>ikke</b> implementeret.

seg-66dbd447dfeb = En satellit i nogle hundrede kilometers højde flyver inde i ionosfæren. Ingen af de to broadcast-modeller tager højde for elektronindholdet over satellitten, og der anvendes ingen korrektion for det.

seg-7befd59b2ac6 = <b>UTC</b>: <c1/> anvender de tre tilfælde i Galileo ICD §{ "5.1.7" } (før, inden for seks timer af og efter en skudsekundshændelse); et indskudt sekund læses som { "86400" }.

seg-2b0d77219437 = Forudindstillinger

seg-d2908020db08 = Forudindstillinger er data, én fil hver under <c1/>, med deres kilder. Motoren og alle medfølgende scenarier undtagen Celeste-scenariet kører uden dem.

seg-c353e7bec219 = Nøgle

seg-5566e1d71a4f = Bane

seg-33f4c7af9c53 = Bærebølge

seg-f4510e898031 = Meddelelsesmodel

seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

seg-890aa92157e4 = { "1080" } km, { "53" }°

seg-1eca13ba2309 = X1 { "1593.3225" } MHz

seg-ee9947222a30 = ikke offentliggjort

seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

seg-f016786d7755 = { "520" } km, { "97" }°

seg-780e931bf88d = PUBLIC, <a1>RNTF-rapport</a1>, beskrivelse af konstellationen

seg-d5df094a5f89 = { "781" } km, { "86.4" }°

seg-94bc78cee128 = { "1621" } MHz ({ "1616" }–{ "1626" } MHz-bånd)

seg-3f5de7f74502 = ingen udsendes

seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, beskrivelse af konstellationen

seg-c2a2761f73b1 = { "550" } km, { "53" }°

seg-2ef501f97eff = Ku-bånd, værdi midt i båndet (repræsentativ)

seg-567fab40bd24 = ingen (opportunistiske signaler)

seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

seg-f5dd5086eedd = { "700" } km, { "55" }°

seg-5fa6b60f66b4 = nær B1 (skjult i kilden; L1 som stedfortræder)

seg-5ebbf0042d7c = REPRESENTATIVE

seg-4f3e5a683682 = { "600" } km, { "97.8" }°

seg-c06f62ca5173 = { "5020" } MHz (RNSS C-bånds centrum)

seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

seg-3b1fd041f9ba = { "500" } km (repræsentativ)

seg-522c85402d84 = L1 (repræsentativ)

seg-064b03765e4d = <c1/>, grad { "6" }, { "60" } s, opdateret hvert { "30" } s, intet ur, { "0.24" } m styringsresidual

seg-5619bc61b958 = WORKSHOP og PUBLIC

seg-20572d7e348d = { "510" } km, { "97.4" }°

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-fad0950a2d67 = <c1/>, grader og postafstand i forudindstillingsfilen

seg-e881ffc4e14b = RNSS er radionavigationssatellittjenesten; RNTF er Resilient Navigation and Timing Foundation.

seg-e9524c71636d = <b>Celeste IOD.</b> Forudindstillingen for Den Europæiske Rumorganisations (ESA's) Celeste-demonstration i kredsløb (IOD) er den eneste, der bruger materiale fremlagt på ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT-workshoppen, { "2026" }: meddelelsesstrukturen (Galileos Kepler-sæt plus korrektionspolynomier langs/på tværs/radialt, urpolynomium, SVID, helbred, IOD, ionosfære- og UTC-parametre), postafstanden og CSV-kolonnenavnene. Banen ({ "510" } km, næsten polær solsynkron) og bærebølgen stammer fra offentlige kilder, der er nævnt i filen. Celestes bitlayout er ikke offentligt og gengives ikke; senere Celeste-faser og Den Europæiske Unions (EU's) LEO-PNT-system kan afvige. Hver værdi afledt af workshoppen findes i modulet <c1/> i <c2/>, som bruges af <c3/>. Sådan holdes forudindstillingen tilbage: hvert tal i motoren, der stammer fra workshoppen, ligger i én fil, <c4/>, som <c5/> kun kompilerer med, når den findes, og i de scenarier, der kun findes i repositoriet, <c6/>. Sletter man den fil og de scenarier, holdes forudindstillingen tilbage uden nogen ændring af kildekoden; alle andre tests, uafhængige referencer og scenarier kører uden den, og READMEs antal scenariefiler tæller stadig de tilbageholdte filer med.

seg-906da2752f76 = Verifikation

seg-7338b6210228 = Række

seg-c5ce76c91ff7 = Mærkat

seg-cfe0d596296e = SISRE-vægte

seg-3e0059048a0d = Montenbruck et al. { "2018" } tabel (GPS, GLONASS, Galileo, BeiDou, geostationær)

seg-0f5e73171fe0 = Galileo ICD's brugeralgoritme

seg-29ad977ef423 = RTKLIB <c1/> på fire virkelige Galileo-broadcast-efemerider, { "1" } mm pr. akse (<c2/>)

seg-ecec254e8219 = katalogets kontrolværdi <c1/>; eksempelramme RTCM { "10403" } { "1005" }

seg-388633e4e785 = Tilpasning og SISRE-afvejning

seg-8b85c3277e66 = totlegemesreference genfundet til { "1" } mm; korrigeret J2–J6-tilpasning til { "1" } mm; monoton vækst med intervallet

seg-4de7f2b173c5 = Kontinuitet midt i passagen

seg-bdbd2771c7f5 = springidentitet; lukket kegleformel som grænse mod stikprøvetagning

seg-468a92a2caf7 = Binært format og budget

seg-ba26f5f63172 = rundture; hvert felts halve trin under { "1" } mm

seg-9be43cbef131 = RINEX-lignende og CSV

seg-a7748156fd6e = rundture

seg-88b5cda10923 = Liu et al. { "2025" } 22-parametermodel og tilpasning

seg-7272ebdc1fec = Præcise TU Graz ITSG-baner for fire satellitter mod artiklens tabeller { "4" }, { "5" }, { "6" } og { "8" }: forhold for langs, på tværs, radialt og SISRE fra { "0.755" } til { "1.138" } på artiklens dage og fra { "0.683" } til { "1.186" } på otte tilbageholdte dage, inden for 1,5x (<c1/>)

seg-94066142a642 = ATOMIC-polynomium uden ur og tabellen med fem højder

seg-205cdc6a3696 = ATOMIC-fakta fra InsideGNSS; den offentliggjorte Liu-tabel trykt ved siden af Kshanas tilpasning til integreret bane, ikke fastlåst

seg-8c00ed11609c = ICD's lukkede formler; den mod RTKLIB kontrollerede Klobuchar-model

seg-d5653e0958b5 = SISRE er kun repræsentationsfejl: ingen fejl fra banebestemmelse eller prædiktion.

seg-4968d9fcbc19 = Referencen er en Kshana-integration (uden tredjelegeme, solstrålingstryk eller tidevand), ikke en virkelig satellits præcise bane.

seg-6a4a1bf21b50 = Det binære format og den RINEX-lignende blok er Kshanas egne.

seg-26c0a2693081 = NeQuick-G bæres med, men integreres ikke til en forsinkelse; ingen korrektion for en satellit inde i ionosfæren.

seg-2a0c8190c38e = Sammenligningen med Liu et al. afviger i baner, parameterlæsning og vægte.

seg-4abe216f987a = <s1>Forrige</s1>LEO-passage og linkbudget

seg-59d9bf4735d8 = <s1>Næste</s1>Fusioneret MEO- og LEO-positionering
