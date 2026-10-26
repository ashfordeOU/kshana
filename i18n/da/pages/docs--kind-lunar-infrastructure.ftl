# docs--kind-lunar-infrastructure: translations (da)

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-d1beb62cf742 = { "6" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-e821670a8b55 = Kilde: <c1/>

seg-56953faa67ae = <c1/> (scenarietype)

seg-d0fb90f506c9 = MODELLED studier af Månens bane og overflade som navigations- og geodætisk infrastruktur, fem studier bag én type, valgt med <c1/>: od-consistency (banebestemmelse om bord med Earth-GNSS i en NRHO eller ELFO mod uafhængig radiometrisk banebestemmelse fra jorden, bedømt efter deres egne kovarianser over en seedet Monte Carlo), carrier-phase (fælles dobbeltdifferentieret bærebølgefase mellem overflade og orbiter og opløsning af heltalsmultiplicitet med LAMBDA), frame-coestimation (en overfladestation og orbitere føjet til afstandsmåling fra jordstationer for det lunare referencesystem med syv parametre), space-tie (GNSS, VLBI og laserafstandsmåling på ét rumfartøj, præcisionen af referencesystemets forbindelse mod fejlen i den lokale forbindelse) og geodesy-sensitivity (Fisher-information om de lunare Love-tal h2, k2, l2 og den fysiske libration fra laserafstandsmåling, sporing af orbitere, et gravimeter på overfladen og et ur på overfladen). En begrænset trelegemsmodel med angivne forenklinger; tallene er kontrolleret mod uafhængige programmer, og intet sammenlignes med en måling af en lunar størrelse.

seg-5753b7552559 = Én kørsel af <c1/> opsummeres som: lunar-infrastructure space-tie: { "4" } sweep points on { "1" } arcs; laser-vs-GNSS x translation sigma { "1.0363" } m at the registered local tie

seg-f2594b18e718 = Påkrævede felter: <c1/>

seg-4875c29c517c = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-7b33bdb70a30 = Eksemplet <c1/> sætter blandt andet:

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = Resultatmærkat (motorens egen): MODELLED — en begrænset trelegemsmodel (Jorden og Månen som punktmasser, ingen Sol, ingen lunare tyngdeharmoniske) med angivne forenklinger og ILLUSTRATIVE input mærket med deres offentlige kilder. Tallene er kontrolleret mod uafhængige programmer; intet sammenlignes med en måling af en lunar størrelse

seg-f3b4a80a739b = intet plot: eksemplet skriver intet diagram

seg-35a4a7a25561 = <b>MODELLED</b> Banebestemmelse i en næsten retlinet halobane (eller en elliptisk frossen bane) ud fra to uafhængige datatyper: Earth-GNSS-pseudoafstande modtaget om bord. Uafhængig reference (ReferenceImpl): Et uafhængigt scipy/numpy-program integrerer de samme variationsligninger (tærskel O1). Intet sammenlignes med en måling af en lunar bane. Den uafhængige reference kontrollerer tallene i de angivne formler, ikke fysikken, så rækken forbliver MODELLED. Begrænset trelegemsmodel: ingen Sol, ingen lunare harmoniske, Jordens rotationsakse langs banenormalen, ILLUSTRATIVE modtager- og stationsinput.

seg-32455bf5f804 = <b>MODELLED</b> Single-differenced Earth-GNSS-bærebølgefase og -kode mellem modtagere ved en station på månens overflade og en orbiter, med differencen mellem urene pr. epoke profileret ud. Uafhængig reference (ReferenceImpl): En uafhængig numpy-løsning af de samme normalligninger ud fra de eksporterede rækker (Q3) og en brute-force-opregning af heltal (Q4). Ingen GNSS- eller lunar bærebølgefasemåling sammenlignes med. MODELLED.

seg-b20c412516b6 = <b>MODELLED</b> Fisher-information for det lunare referencesystem med syv parametre fra laserafstandsmåling fra jordstationer til de fem reflektorer alene og med orbiter-til-overfladestation ra. Uafhængig reference (ReferenceImpl): En uafhængig numpy-differenskvotient af fremadmodellen (F2). Intet sammenlignes med reelle løsninger af det lunare referencesystem. Faktoren afhænger af den antagne kendte bane og afstandssigma på { "1" } m. MODELLED.

seg-151c96b1f882 = <b>MODELLED</b> Cramer-Rao-præcision for forskydningerne i translation, skala og rotation mellem teknikkerne GNSS, VLBI og laserafstandsmåling, når ét rumfartøj bærer alle. Uafhængig reference (ReferenceImpl): Et uafhængigt numpy-stakket system, hvor positionsubekendte er elimineret ved eksplicitte Schur-komplementer (T3). Ingen data fra GRASP, Genesis eller andre missioner sammenlignes med. MODELLED.

seg-743d78806f6a = MODELLED — en begrænset trelegemsmodel (Jorden og Månen som punktmasser, ingen Sol, ingen lunare tyngdeharmoniske) med angivne forenklinger og ILLUSTRATIVE input mærket med deres offentlige kilder. Tallene er kontrolleret mod uafhængige programmer; intet sammenlignes med en måling af en lunar størrelse, og intet her er en udtalelse om nogen mission eller noget system. Ikke tilknyttet eller støttet af nogen myndighed. Adviso (resultat <c1/>)

seg-da35c5298311 = MODELLED studier af Månens bane og overflade som navigations- og geodætisk infrastruktur, fem studier bag én type, valgt med <c1/>: od-consistency (banebestemmelse om bord med Earth-GNSS i en NRHO eller ELFO mod uafhængig radiometrisk banebestemmelse fra jorden, bedømt efter deres egne kovarianser over en seedet Monte Carlo), carrier-phase (fælles dobbeltdifferentieret bærebølgefase mellem overflade og orbiter og opløsning af heltalsmultiplicitet (kategori-katalog (<c2/>))

seg-4658f67623b5 = Kshana lunar-infrastructure-scenarie: space-tie. MODELLED; udformningen, inputtene og tærsklerne er fastlagt i xval/lunar-infra/PREREGISTRATION.md (committet før nogen kørsel). ILLUSTRATIVE input er mærket med deres offentlige kilder dér. (kommentar i scenariefilen, linje { "1" } til { "3" })

seg-f7257c25f137 = Lunar banebestemmelse: Earth-GNSS mod radiometrisk fra jorden er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-a3988ca0b8ea = Lunar opløsning af bærebølgefasemultiplicitet: overflade og orbiter er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-b2e4ab7b6e60 = Lunar samestimering af referencesystemet: overfladestationer og orbitere er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-6eedb30a58c5 = Præcision af space-tie-forbindelsen mellem referencesystemer: samplaceret GNSS, VLBI og laserafstandsmåling er MODELLED, ikke valideret: kontrolleret mod en separat implementering i selve denne kodebase — uafhængig af enheden under test, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-cd5f729c9622 = Emneside: <a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>Forrige</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>Næste</s1>lunar-integrity
