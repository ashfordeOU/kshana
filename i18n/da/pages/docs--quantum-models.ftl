# docs--quantum-models: translations (da)

seg-638b8d451550 = Sensor

seg-c35a20fa2529 = Modenhed

seg-2f51722ab9d4 = Kilde: <c1/>

seg-39ab7752d86d = Modeller af kvantesensorer: hvad Kshana modellerer, og hvad den ikke modellerer

seg-daf0e0c0b16f = Kshana er en <b>simulator for PNT-robusthed (PNT: positionering, navigation og tidssynkronisering) med ydeevnemodeller for kvantesensorer</b>. Den er <em>ikke</em> en simulator af kvantefysik ud fra grundlæggende principper. Denne side angiver præcis, hvad det betyder, så rammen "kvante" ikke kan misforstås som mere, end den er.

seg-6e504d97c41e = Hvad der modelleres

seg-7884c9a7d883 = Hver kvantesensor (og klassisk sensor) er en <b>fejlmodel</b>, der drives af offentliggjorte støjbudgetparametre:

seg-cad22f39d579 = <b>Ure</b> — hvid-frekvens- og random-walk-frekvens-PSD'er (power spectral densities), et flicker-gulv (1/f) for Allan og lineær drift, hentet fra datablade og artikler: CSAC'en (chip-scale atomic clock) Microchip SA.45s; Origlia m.fl.'s strontium-optiske gitterur (arXiv:{ "1503.08457" }), et rumrettet mål; og de seks standardværdier for <c1/> (CSAC; USO, ultra-stable oscillator; DSAC, Deep Space Atomic Clock; TCXO, temperature-compensated crystal oscillator; OCXO, oven-controlled crystal oscillator; RAFS, rubidium atomic frequency standard), hver med én kilde. Den Allan-deviation, disse giver, er valideret mod de standardiserede hældninger for støjtyper (se <a1><c2/></a1>). Én kurve for optiske ure er virkelig: Norcia m.fl.'s målte Allan-deviation for ⁸⁸Sr-tweezer-uret (<em>Science</em> { "2019" }) gengives af støjtilpasningen, en VALIDATED række i <a2><c3/></a2>; holdover-tallene, der bygger på den optiske klasse, forbliver MODELLED.

seg-13c3340e773b = <b>Inertialsensorer</b> — i <c1/>- og hybridpakkerne et fejlbudget for accelerometer/gyro med én akse (1-DOF, én frihedsgrad): velocity random walk, angular random walk, acceleration random walk og et Allan-gulv for biasustabilitet. Typerne <c2/> og <c3/> kører i stedet tre-akset strapdown-mekanisering i <c4/> (kvaternionattitude, navigationsligninger i nord-øst-ned, en deterministisk IMU-fejlmodel).

seg-f361d586b348 = Kvantescenarietyperne — <c1/>, <c2/>, <c3/>, <c4/> og <c5/> — er bygget af disse fejlmodeller og er MODELLED; <c6/>, <c7/> og <c8/> rapporterer også en repræsentativitetsregistrering med hullerne til flyvning.

seg-05bbaddd4df6 = Motoren er <b>neutral</b>: "kvante" og "klassisk" er den samme kodesti med forskellige koefficienter. Kontrasten i kvalitetsmålene kommer helt og holdent fra inputstøjparametrene, som hver kan føres tilbage til en citeret kilde.

seg-a1a067588520 = Hvad der IKKE modelleres

seg-49a656243210 = For ure og sensorer til tidsoverførsel simuleres intet af den underliggende kvantefysik — kun det nettobidrag til Allan, der leveres som en koefficient. For <b>kold-atom-accelerometeret</b> findes der nu et lag ud fra grundlæggende principper (se nedenfor); de øvrige systematiske fejl er stadig på koefficientniveau eller modelleres ikke:

seg-844e65d52572 = atom-interferometerets <b>Mach–Zehnder-fase</b> (<c1/>), <b>kvanteprojektions-/skudstøj</b> (<c2/>), henfald af interferometerets <b>kontrast</b>, <b>cyklustid</b> og <b>overføringsfunktionen for vibrationskobling</b> (<c3/>, varians for hvid PSD <c4/>) <em>modelleres nu ud fra grundlæggende principper</em> for CAI-accelerometeret (cold-atom interferometer) (<c5/>), og de udleder den hvide acceleration-PSD <c6/>, som den klassiske model forbruger, sammen med <b>det dynamiske område for frynsemultiplicitet</b> (<c7/>) — se <a1><c8/></a1>;

seg-71a782041b89 = den systematiske <b>Coriolis</b>-fejl (<c1/> / <c2/>, <c3/>-tværkoblingen) og den systematiske <b>AC-Stark (AC: vekselstrøm) / lysforskydnings</b>-fejl (<c4/>, som ophæves ved en symmetrisk to-fotons-detuning) <em>modelleres nu og er enhedstestet</em> i <c5/>;

seg-00c510117abc = yderligere tre CAI-fejlled <em>modelleres nu</em> som biblioteksfunktioner i <c1/> ({ "0.36" }; MODELLED; kan endnu ikke nås fra en scenarietype):

seg-fcaf6ff00974 = <b>Raman-laserfasestøj</b>: vægtningen med følsomhedsfunktionen fra Cheinet m.fl. ({ "2008" }), ligning { "8" }, med den lukkede form for hvid fase <c1/> (ligning { "18" } ved én cyklus) og en numerisk vej for ethvert fasestøjsspektrum, plus den laserfrekvensstøj, som retroreflektionsforsinkelsen <c2/> ikke ophæver (Le Gouët m.fl. { "2007" }, ligning { "9" } til { "11" });

seg-6e2236c81db8 = <b>bølgefrontens krumning</b> (kun ren defokusering): bias <c1/> for en termisk sky på en stråle med krumningsradius <c2/> og dens reduktion, når kun atomer inden for en detektionsradius tælles med (efter Louchet-Chauvet m.fl. { "2011" } og Schkolnik m.fl. { "2015" }); aberrationer af højere orden modelleres ikke;

seg-92295ad17228 = <b>opløsning af frynsemultiplicitet</b>: sandsynligheden for et forkert frynseindeks, <c1/>, for hjælp fra et klassisk accelerometer (Lautier m.fl. { "2014" }) og for to interrogationstider (efter Bonnin m.fl. { "2018" }), med den inverse, der giver den største klassiske støj for en angivet sandsynlighed for fejl.

seg-f383678fb806 = Hver lukket form er kontrolleret mod en uafhængig numerisk vej (kvadratur i frekvensdomænet eller en Monte Carlo over atomer eller skud) og mod sine grænsetilfælde. Det ene offentliggjorte tal, der gengives, er Cheinet m.fl.'s niveau for hvid fasestøj: −{ "111" } dB·rad²/Hz ved <c1/> = { "20" } µs giver omkring { "1" } mrad pr. skud ({ "0.99" } mrad; artiklen udleder dette niveau med sin ligning { "17" }, flicker plus hvid). Intet af dette er en måling af noget instrument;

seg-150f8b9dfea4 = modelleres stadig <b>ikke</b>: bølgefrontaberrationer af højere orden, fasestøjen fra et bestemt lasersystem og fysik fra grundlæggende principper på urets side;

seg-643109601eba = <c1/>-pakken for kvante mod klassisk har én akse; den tre-aksede strapdown-sti kører kun i <c2/> og <c3/> (se noten om IMU, inertial measurement unit, i README og <a1><c4/></a1>).

seg-1ff01ab9f92d = At fuldføre kvantefysiklaget (at nå CAI-fejlleddene fra en scenarietype, bølgefrontaberrationer af højere orden og fysik fra grundlæggende principper på urets side) er det resterende P2-arbejde i <c1/>.

seg-f09a31b33faa = Tal fra laboratorium på jorden mod tal klar til flyvning

seg-dcef4579d2a9 = Parametertabellerne blander modenhedsniveauer; behandl dem derefter:

seg-4f25895df32f = Kildetal

seg-cef61e912cd0 = CSAC (f.eks. SA.45s)

seg-4a016be9bca9 = datablad σ_y({ "1" } s) ≈ { "3e-10" }

seg-38cc72b2405c = <b>i drift</b>, kommercielt produkt (varianter til rummet, tolerante over for stråling, findes)

seg-d38d20629ed6 = Strontium-optisk gitterur

seg-1f0d3ec00922 = σ_y({ "1" } s) mål ≈ { "1e-15" } (arXiv:{ "1503.08457" })

seg-1496e0c42086 = <b>ground-lab</b> — Kshana kender ingen offentliggjort ydeevne i kredsløb for et sådant

seg-ce1d7994188b = Kold-atom-accelerometer

seg-b07fa6b8cebc = offentliggjorte Allan-tal fra laboratorier

seg-60864f168701 = ground-lab / sounding-rocket

seg-84a68aeb467d = Tal for optiske ure i Kshana er <em>rummål på hardware på jorden</em>. Der findes intet optisk ur, der har fløjet; README og resultatets proveniens siger det udtrykkeligt.

seg-a204c1b854fa = Benchmark: ACES/PHARAO på ISS (i drift siden april { "2025" })

seg-fb88de1257bd = ESA's (European Space Agency) <b>ACES/PHARAO</b>-nyttelast (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — et laserkølet cæsiumur plus en aktiv brintmaser, i drift på ISS (International Space Station) siden april { "2025" } — er den aktuelle benchmark for urstabilitet i kredsløb i drift (mål for relativ stabilitet i størrelsesordenen { "1e-16" } efter nogle få dages integration). Kshanas model for optiske ure repræsenterer et <em>mere ambitiøst</em> mål i laboratorium på jorden end ACES' ydeevne med cæsium/maser under flyvning; når Kshanas optiske tal sammenlignes med "det, der faktisk har fløjet", er ACES/PHARAO det redelige referencepunkt, og det er et mikrobølge-/masersystem, ikke et optisk gitterur.

seg-9d2e850cb986 = De præcise tal for ACES' ydeevne i kredsløb bør citeres fra ESA's offentliggjorte resultater, efterhånden som de frigives; pointen her er <em>modenhedsgabet</em>, ikke et bestemt tal — Kshanas optiske tal er mål, ikke ydeevne under flyvning.

seg-4b373686adf8 = <a1><c1/></a1> — mærker for hver parameter: <c2/> / <c3/>.

seg-3f0c1048aea9 = <a1><c1/></a1> — definitioner af kvalitetsmål (figure of merit, FoM) og hver forkortelse.

seg-a360cd4997e2 = <a1><c1/></a1> — hvad kvalitetsmålene for integritet og sikkerhed er, og hvad de ikke er.

seg-0ac025397b23 = <a1><c1/></a1> — kold-atom-accelerometeret ud fra grundlæggende principper.

seg-41ba2c8f70fe = <s1>Forrige</s1>Udformning af konstellation

seg-136fa589fed5 = <s1>Næste</s1>Kold-atom-interferometer
