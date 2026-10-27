# docs--tutorial-quantum-vs-classical: translations (da)

seg-501d3a72ea43 = Integritet

seg-8980b5ae869b = Tal

seg-e5f926d1055b = Faldgruber og enheder

seg-cb457294fc53 = Hvad så

seg-a3686dd6817d = Kilde: <c1/>

seg-0c2365600795 = Tutorial { "3" } — Kvante mod klassisk GNSS-modstandsdygtighed (slutsten)

seg-cc4017642043 = <c1/> + <c2/> · <b>Scenarier:</b> <c3/>, <c4/> (undervisningskopier: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Sværhedsgrad:</b> mellem · <b>~{ "35" } min</b>

seg-5de2e6656527 = Slutstenen. Du kører et scenarie med en spoofing-detektor og en komplet fusioneret suite til positionering, navigation og tidssynkronisering (PNT), og lærer at aflæse <b>sikkerhed</b>, <b>integritet</b> og <b>dødregning</b> sammen — hele teserne: kvanteinertialsensorer og optisk tidssynkronisering giver en modstandsdygtighed, som afbrydelse af GNSS (Global Navigation Satellite System) ellers ville tage fra os.

seg-ffa5242638c2 = Del A — Sikkerhed: at fange en tids-spoofing

seg-23c18da1415f = En angriber injicerer en langsomt stigende falsk GNSS-tid ({ "0.1" } ns/s, startende ved t = { "60" } s). Modtageren sammenholder den påståede tid med sit eget urs fremskrevne forudsigelse og melder spoofing, når afvigelsen overskrider detektionsgrænsen. Detektoren er en tosidet <b>χ²₁ / Neyman–Pearson-energitest</b> ved en falsk-alarm-sandsynlighed P_fa = { "0.01" }; kvalitetsmålet for sikkerhed er <b><c1/></b> (én minus sandsynligheden for en overset detektion) ved en spoofing af den størrelse, specifikationen kræver ({ "20" } ns).

seg-46aa0e01b330 = <b>Kvante: <c1/>, detekteret ved { "70" } s.</b> Det optiske urs detektionsgulv er en brøkdel af en nanosekund, så det melder spoofingen næsten med det samme — langt under specifikationen på { "20" } ns.

seg-022573b3dcc4 = <b>Klassisk: <c1/>, detekteret ved { "430" } s.</b> Det chipskala-atomurs (CSAC'ens) egen støj under fremskrivningen i vinduet er sammenlignelig med { "20" } ns, så det ofte ikke kan skelne spoofingen fra sin egen drift — det overser den i { "44" } % af tilfældene.

seg-27b2b715efcb = Den ikke-cirkulære uafhængige reference: analytisk mod Monte Carlo-P_md

seg-c85651eebd32 = Detektorens sandsynlighed for oversete detektioner beregnes på <b>to uafhængige måder</b>, som skal stemme overens: en <b>lukket χ²₁-hale</b> (Neyman–Pearson-resultatet) og et <b>Monte Carlo</b>-estimat (MC). For CSAC er den analytiske P_md <c1/>, og MC-P_md er <c2/> — de stemmer på { "0.002" }, godt inden for stikprøvefejlen <c3/>. For det optiske ur er begge { "0.000" }. At to adskilte beregninger af den <em>samme</em> sandsynlighed stemmer, er den ikke-cirkulære krydskontrol (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; standard NP-/χ²-detektion). <c4/> hævder <c5/> for begge ure og <c6/>.

seg-5cf0d909bac7 = Del B — Hybrid PNT: den fulde fusionerede suite

seg-498a57aae11d = Nu fusionerer slutstenens scenarie et optisk ur + en inertimåleenhed (IMU) med kolde atomer (kvantesuiten) over for et CSAC + en IMU af navigationsklasse (den klassiske suite), gennem det samme GNSS-udfald på { "6600" } s ({ "1.83" } t), mod en tidsspecifikation på { "20" } ns og en positionsspecifikation på { "100" } m. Begge suiter genforankrer deres ure hvert { "60" } s over det samme optiske tidsoverførselslink mellem satellitter, modelleret med en jitter på { "1" } ps pr. resync (<c1/> i scenariet; <c2/> bygger ét <c3/>-link til begge suiter).

seg-61934559c7a0 = Læs opdelingen <c1/> — holdover for tid mod holdover for position:

seg-dee5b1a35bdd = <b>Kvante: PNT-holdover { "6600" } s</b> — holder både tid (t { "6600" } s) og position (p { "6600" } s) under hele udfaldet.

seg-6441dfa026dc = <b>Klassisk: PNT-holdover { "350" } s</b> — <em>tiden</em> holder hele { "6600" } s (t { "6600" } s), fordi den optiske tidsoverførsel holder selv det <em>klassiske ur</em> låst. Suiten er <b>begrænset af positionen ved p { "350" } s</b>: IMU'en af navigationsklasse er det svage led. Det er fusionstesen — isolér den klassiske suites svigt til dens inertialsensor.

seg-12e9b7192733 = <b><c1/> for kvantesuiten er ægte og er ikke en fejl.</b> Det er filterets selvkonsistens over støjende resync — <b>ikke</b> et integritetsmål i luftfartsforstand (horisontalt eller vertikalt beskyttelsesniveau, HPL/VPL). Læs ikke for meget i ordet “integritet” her; se <a1><c2/></a1>.

seg-587efcdcbc13 = Den ikke-cirkulære uafhængige reference: positions-holdover på { "350" } s

seg-a70ad8fc122f = Tallet { "350" } s er dødregningsfysik, ikke et tilpasset tal. En konstant accelerometerbias <c1/> driver positionsfejlen som <b>½·b·T²</b>. Krydsning af specifikationen på { "100" } m:

seg-778e817e3e9b = Motoren melder { "350" } s, det sidste gitterpunkt på { "10" } s før krydsningen og { "2" } % under de { "357" } s, der gælder for bias alene: scenariets accelerometre har også støj fra hastighedens random walk (<c1/>), som lægges til biasdriften, så den modellerede fejl når { "100" } m lidt før.

seg-e105a8ab605b = Autoritativ lov: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2. udg.), fejlvækst ved dødregning. Disse to ½bT²-værdier forklarer motorens opdeling på { "350" } s / { "6600" } s: en fysikkontrol i lukket form, ekstern i forhold til filteret.

seg-c2515e55dffa = Du kan se det inertiale svage led direkte i dødregningsscenariet (<a1><c1/></a1>, kind <c2/>): <c3/>: sensoren af navigationsklasse divergerer til titusindvis af kilometer.

seg-6c688f2e7136 = Sådan læser du de tre tal sammen

seg-4f1a49d61cee = Hvad det betyder her

seg-2e91989b1a89 = Hvad det <b>ikke</b> betyder

seg-b403ce86b14d = analytisk grænse for spoofing-<em>detekterbarhed</em> (<c1/>) for et konfigureret angreb; opsummeringen for <c2/> udskriver <c3/>, fordi scenariet ikke konfigurerer noget

seg-e04c25dd278d = ikke en RAIM-detektor (receiver autonomous integrity monitoring) med flere satellitter

seg-7e678dd4409e = filterets selvkonsistens (sampler inden for k-σ-grænsen)

seg-1643e7e71209 = ikke integritet i luftfartsforstand (HPL/VPL/RAIM)

seg-4095f7ab4b14 = tid inden for specifikationen efter tab af GNSS, opdelt i tid og position

seg-5b90536cdfd5 = ikke en 2-D-nøjagtighed som CEP (circular error probable) eller 2DRMS (twice the distance root mean square)

seg-4b11ef3b6dba = Den ægte modtagerautonome integritet — rigtige HPL/VPL med alarmgrænser og et Stanford-diagram — findes i pakken <c1/> (<a1><c2/></a1>); det er læseøvelsen på niveau 3.

seg-28cddec341ed = Hvad testene fastlåser

seg-a27c3195acf3 = <c1/> — analytisk mod MC-P_md stemmer på < { "0.05" } for begge ure; <c2/>.

seg-78a5a0066e09 = Opsummeringen for hybrid ({ "6600" } s / { "350" } s) og den inertiale opdeling er fastlåst gennem deres undervisningsscenarier (<a1><c1/></a1>, <a2><c2/></a2>) af <c3/>, som sammenligner hver motoropsummering med linjen <c4/>, som filen optager. Den uafhængige ½bT²-reference ovenfor er fysikkontrollen af de tal.

seg-a4371822e379 = <b>Kvalitetsmålet for tid (FoM) er i nanosekunder; kvalitetsmålet for position er i meter og 1-DOF</b> (én frihedsgrad: enkelt akse, ikke CEP/2DRMS).

seg-1331ea80a427 = <c1/> er selvkonsistens, ikke integritet i luftfartsforstand.

seg-87c49084032c = Den klassiske suites <em>tid</em> overlever kun på grund af den optiske tidsoverførsels resync; læs opdelingen <c1/>, ikke kun overskriften PNT-holdover.

seg-1c93115bf118 = Kør det ærlige fejltilfælde: <c1/> (kind <c2/>) melder et ARAIM-gennemløb (advanced RAIM) ved sydpolen, hvor beskyttelsesniveauerne <em>overskrider</em> alarmgrænsen (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } af { "24" } epoker tilgængelige), så systemet meldes som <b>utilgængeligt</b>: en egenskab, ikke en fejl.

seg-ac70d3131064 = Før historien ind i lav jordbane (LEO): <c1/> (kind <c2/>) kæder en fase med GNSS-jamming, et LEO-positioneringslag, der bærer brugeren igennem den, og en integritetskontrol sammen på én tidslinje. Se <a1>de nyere funktioner</a1> for de øvrige scenarier for modstandsdygtighed og vertikaler.

seg-063422d3c70b = Forsvar et resultat: lav <a1>øvelsen på niveau 3</a1> — Monte Carlo-bånd, reproducerbarhed og aflæsning af et beskyttelsesniveau.

seg-4f7275a21f44 = <s1>Forrige</s1>{ "2" } · Ur-holdover

seg-8b0c90f82aab = <s1>Næste</s1>Gennemarbejdet eksempel: pipeline med flere værktøjer
