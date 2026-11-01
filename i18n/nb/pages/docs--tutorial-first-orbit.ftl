# docs--tutorial-first-orbit: translations (nb)

seg-51ae9468b92a = Hva dette scenarioet er

seg-08f3fdc9252a = Les oppsummeringen på én linje

seg-def5271a207d = Hva testen fester

seg-e5f926d1055b = Fallgruver og enheter

seg-cb457294fc53 = Veien videre

seg-dcb2d0b170c1 = Kilde: <c1/>

seg-f57d8b38bf08 = Veiledning { "1" } — Min første bane: hvor er GPS-satellittene

seg-1b9e1178555d = <c1/> · <b>Scenario:</b> <c2/> (undervisningskopi: <a1><c3/></a1>) · <b>Vanskelighetsgrad:</b> nybegynner · <b>~{ "15" } min</b>

seg-d065731294a1 = Til slutt har du propagert den <em>virkelige</em> operative GPS-konstellasjonen, lest tilgjengeligheten og geometrien og eksportert en tabell over hvor hver satellitt faktisk er i rommet — og du vet at tabellen er validert mot en ekstern referanse, ikke mot seg selv.

seg-b07bb365235d = GPS-satellitter (Global Positioning System) forteller en bruker <em>hvor den er</em> og <em>hva klokken er</em>. Før noe av det trenger du å vite <b>hvor satellittene er</b> og <b>hvor mange av dem en bruker kan se</b>. Det er geometri, og geometrien setter gulvet for hvor nøyaktig du kan posisjoneres (presisjonsfortynningen, eller DOP). Denne veiledningen:

seg-dec5079e7715 = tar et ekte Celestrak-øyeblikksbilde <c1/> av GPS-konstellasjonen (2021-07-28, { "30" } satellitter, ekte two-line elements, TLE-er),

seg-693859c435d8 = propagerer hver satellitt med den validerte SGP4/SDP4-modellen (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

seg-74b73260c7bc = regner ut ved hvert tidssteg hvilke satellitter en bruker i lav jordbane kan se (siktlinje, jordokkultasjon og en elevasjonsmaske på { "5" }°),

seg-605c40b73e96 = gjør geometrien om til en <b>PDOP</b> (presisjonsfortynning for posisjon) og en <b>posisjonsnøyaktighet</b>, og

seg-356e96d219b5 = eksporterer satellittenes faktiske jordsentrerte, jordfaste (ECEF) posisjoner til en SP3-fil (Standard Product { "3" }, det presise baneformatet til International GNSS Service, IGS; GNSS er Global Navigation Satellite System).

seg-ff1666fe175e = Ryggraden er: <b>TLE → SGP4-propagering → ECEF per epoke → synlighet → antall synlige satellitter → PDOP → posisjons-sigma = PDOP · σ_UERE</b>, der σ_UERE er brukerens tilsvarende avstandsfeil (1-σ-avstandsfeilen per satellitt).

seg-379da723ae57 = Eller åpne <a1>Studio i nettleseren</a1> og velg bane-scenarioet.

seg-441743833f1e = Den deterministiske kjøringen (seed = { "17" }) skriver ut:

seg-918a30fea48a = Felt for felt:

seg-375fad797dcf = <b><c1/></b> — scenariohashen på 12 tegn. Den er et fingeravtrykk av de nøyaktige inndataene (seed, terskler, modellparametere, TLE-blokken). Endrer du en inndata, endres den; holder du dem like, gjengir du kjøringen bit for bit. Den samme hashen stemples i diagrammets bunntekst og i resultatfilen i JSON (JavaScript Object Notation).

seg-133711d1ad9f = <b><c1/></b> — av de { "361" } tidsstegene har brukeren en brukbar posisjonsbestemmelse i { "345" } av dem ({ "95.6" } %). Kjøringen er en passering på { "12" } h ({ "43,200" } s) med et steg på { "120" } s.

seg-a500c0473784 = <b><c1/></b> — den beste (laveste) presisjonsfortynningen for posisjon over passeringen. PDOP nær { "1" } er utmerket geometri; jo lavere, desto bedre.

seg-98a24f0170d2 = <b><c1/></b> — den beste posisjonsnøyaktigheten: <b>posisjons-sigma = PDOP · σ_UERE</b>. I dette scenarioet er <c2/>, så de to tallene er <em>numerisk like</em> her — men regelen er PDOP × UERE, <b>ikke</b> «posisjon = PDOP». Med en UERE på { "3" } m ville posisjons-sigma vært ~{ "3.2" } m. (Se fallgruven på slutten.)

seg-410081c6dcab = Klokketallene (<c1/>, <c2/>, <c3/>, <c4/>) følger med fordi baneskjemaet også har en klokke gjennom passeringen; de er hovedsaken i <a1>veiledning { "2" }</a1>, ikke i denne. (<c5/> viser <c6/> fordi ingen angrep er satt opp.)

seg-95ccef0d94ae = Geometriblokken i JSON-en har de underliggende tallene:

seg-89cb7db9b9eb = Hvor er satellittene? (gevinsten)

seg-81678afa0cee = Geometrien er god <em>fordi</em> satellittene virkelig ligger i GPS-skallet. Bevis det — eksporter de jordfaste posisjonene deres:

seg-1452dfac9e06 = De tre første satellittene ved første samplingssteg, ECEF i km (SP3-filen har en fjerde kolonne, klokken, skrevet som «ingen verdi»-markøren { "999999.999999" }):

seg-4fd0f95da0cf = Ta PG01s geosentriske radius:

seg-cb02d7c01561 = Den ikke-sirkulære referansen: er dette virkelig en GPS-bane?

seg-a7c478360464 = En veiledning som kontrollerer motoren mot seg selv, beviser ingenting. Her er det eksterne, <em>ikke-sirkulære</em> ankeret for hver påstand ovenfor.

seg-eec62069a957 = <b>{ "1" }. Satellittene ligger på det virkelige GPS-skallet i middels høy jordbane (MEO).</b> GPS-ens nominelle store halvakse er <b>a = { "26,560" } km</b>, høyde ≈ { "20,180" } km over jordens middelradius på { "6,378" } km (IS-GPS-200, GPS-grensesnittspesifikasjonen; GPS Standard Positioning Service (SPS) Performance Standard, det amerikanske forsvarsdepartementet (DoD); Misra & Enge, <em>Global Positioning System</em>, 2. utg.). PG01s øyeblikkelige radius på <b>{ "26,480.9" } km</b> ligger noen hundre km fra <c1/> — nøyaktig det virkelig GPS-eksentrisitet (~{ "0.005" }–{ "0.02" }) gir. Testen <c2/> krever <c3/> mot dette publiserte <c4/>, som er <b>eksternt for Kshana</b>.

seg-a052774de08f = <b>{ "2" }. Passeringens lengde er én GPS-omdreining.</b> Keplers tredje lov gir perioden <c1/> med <c2/> og <c3/> (World Geodetic System { "1984" }, WGS-84; teknisk rapport NIMA TR8350.2 fra National Imagery and Mapping Agency): <c4/>, et halvt siderisk døgn. Scenariets varighet på { "43,200" } s («~én GPS-omdreining») stemmer med det innenfor { "0.3" } %, og GPS-ens sporing på bakken gjentas hvert siderisk døgn (to omdreininger), ifølge IS-GPS-200.

seg-067fb466e396 = <b>{ "3" }. De propagerte posisjonene er validert, ikke bare selvkonsistente.</b> SGP4/SDP4-propagatoren som lagde denne ECEF-tabellen stemmer med <b>alle { "666" } verifikasjonsvektorene i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 med et verste tilfelle på { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) og stemmer med den uavhengige craten <c3/> til under en mikrometer. Så tabellen du eksporterte, er kontrollert mot en ekstern referanseimplementasjon, ikke mot Kshanas egen aritmetikk.

seg-652ec3b3d3b8 = <b>En merknad om SP3-datoene.</b> SP3-epokehodet viser en plassholder for kalenderdato (2000-01-01); propageringen går faktisk fra hver TLEs egen epoke ({ "2021" }). Les tabellen som «ECEF-posisjoner ved første samplingssteg», ikke «den { "1" }. januar { "2000" }».

seg-74dcb96a27a9 = <c1/> gjør hvert tall ovenfor til en CI-kontrakt:

seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (fordi <c4/>), <c5/>, og oppsummeringen inneholder <c6/>.

seg-241d75b1502b = <c1/> — PG01s radius ligger i GPS-skallets bånd, kontrollert mot det publiserte <c2/>.

seg-34328f4f148b = Hvis motoren noen gang slutter å lage et virkelig GPS-skall, blir bygget rødt.

seg-3c23c11911cb = <b>Posisjons-sigma er PDOP × UERE, ikke PDOP.</b> De to er like <em>bare fordi</em> <c1/> her. Endre UERE, og de skilles.

seg-6bb2f31c15dc = <b>Tidstallene er i nanosekunder</b>, posisjonstallet i meter. Ikke bland dem.

seg-5bc68d0c144d = <b><c1/> er kvantisert til rutenettet</b> (en nedre grense ved tidsrutenettets steg). I denne passeringen har brukeren i praksis alltid posisjonsbestemmelse, så holdover er { "0" } s (intet utfall å seile gjennom) — det er det <em>gode</em> tilfellet.

seg-9c36a5c64af5 = Stram inn eller utvid elevasjonsmasken (<c1/>) og se tilgjengeligheten endre seg — det er en øvelse på nivå 2.

seg-b0222934237e = Bytt inn et ferskt TLE-øyeblikksbilde med <c1/> (nivå 2, «bruk ferske data»).

seg-e487166204f8 = Gå videre til <a1>veiledning { "2" } — Klokkens holdover</a1>, der GNSS-signalet <em>tas bort</em> og klokken om bord må seile på egen kraft.

seg-795315608752 = <s1>Forrige</s1>Veiledninger

seg-97ca5a3cc77e = <s1>Neste</s1>{ "2" } · Klokkens holdover
