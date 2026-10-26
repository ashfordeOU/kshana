# docs--kind-lunar-infrastructure: translations (nb)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-d1beb62cf742 = { "6" } medfølgende scenarioer bruker denne typen; de andre ligger i <a1><c1/></a1>.

seg-e821670a8b55 = Kilde: <c1/>

seg-56953faa67ae = <c1/> (scenariotype)

seg-d0fb90f506c9 = MODELLED studier av Månens bane og overflate som navigasjons- og geodetisk infrastruktur, fem studier bak én type valgt med <c1/>: od-consistency (banebestemmelse om bord med jord-GNSS i en NRHO eller ELFO mot uavhengig radiometrisk banebestemmelse fra bakken, vurdert etter sine egne kovarianser over en seedet Monte Carlo), carrier-phase (felles dobbeltdifferensiert bærebølgefase mellom overflate og orbiter og løsning av heltallsflertydighet med LAMBDA), frame-coestimation (en overflatestasjon og orbitere lagt til avstandsmåling fra jordstasjoner for det lunare referansesystemets datum med sju parametere), space-tie (GNSS, VLBI og laseravstandsmåling på ett romfartøy, presisjon i referansesystembindingen mot feilen i den lokale bindingen) og geodesy-sensitivity (Fisher-informasjon om Love-tallene h2, k2, l2 og den fysiske librasjonen fra laseravstandsmåling, sporing av orbitere, et gravimeter på overflaten og en klokke på overflaten). En begrenset tre-legeme-modell med oppgitte forenklinger; tallbehandlingen er kontrollert mot uavhengige programmer, og ingenting er sammenlignet med en måling av en månestørrelse.

seg-5753b7552559 = Én kjøring av <c1/> oppsummeres slik: lunar-infrastructure space-tie: { "4" } sveippunkter på { "1" } buer; laser-vs-GNSS x translasjon-sigma { "1.0363" } m ved den registrerte lokale bindingen

seg-f2594b18e718 = Obligatoriske felt: <c1/>

seg-4875c29c517c = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-7b33bdb70a30 = Eksempelet <c1/> setter blant annet:

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = Resultatetikett (motorens egen): MODELLED — en begrenset tre-legeme-modell (Jorden og Månen som punktmasser, ingen Sol, ingen harmoniske i månens gravitasjon) med oppgitte forenklinger og ILLUSTRATIVE inngangsverdier merket med sine offentlige kilder. Tallbehandlingen er kontrollert mot uavhengige programmer; ingenting er sammenlignet med en måling av en månestørrelse

seg-f3b4a80a739b = ingen figur: eksempelet skriver ikke noe diagram

seg-35a4a7a25561 = <b>MODELLED</b> Banebestemmelse i en nesten rettlinjet haloomløpsbane (eller en elliptisk frossen bane) fra to uavhengige datatyper: jord-GNSS-pseudoavstander mottatt om bord. Uavhengig referanse (ReferenceImpl): Et uavhengig scipy/numpy-program integrerer de samme variasjonsligningene (terskel O1). Ingenting er sammenlignet med en måling av en månebane. Den uavhengige referansen kontrollerer tallbehandlingen i de oppgitte formlene, ikke fysikken, så raden forblir MODELLED. Begrenset tre-legeme-modell: ingen Sol, ingen månens harmoniske, jordens rotasjonsakse langs banenormalen, ILLUSTRATIVE inngangsverdier for mottaker og stasjon.

seg-32455bf5f804 = <b>MODELLED</b> Enkeltdifferensiert jord-GNSS-bærebølgefase og kode mellom mottakere ved en stasjon på månens overflate og en orbiter, med klokkedifferansen per epoke profilert ut. Uavhengig referanse (ReferenceImpl): En uavhengig numpy-løsning av de samme normalligningene fra de eksporterte radene (Q3) og en brute-force-opptelling av heltall (Q4). Ingen GNSS- eller månebærebølgefasemåling er sammenlignet med. MODELLED.

seg-b20c412516b6 = <b>MODELLED</b> Fisher-informasjon om referansesystemdatumet på månen med sju parametere fra laseravstandsmåling fra jordstasjoner til de fem reflektorene alene og med avstandsmåling fra orbiter til overflatestasjon. Uavhengig referanse (ReferenceImpl): En uavhengig numpy-finite differanse av foroverrettede modellen (F2). Ingenting er sammenlignet med virkelige løsninger for månens referansesystem. Faktoren er betinget av den antatt kjente banen og avstandssigma på { "1" } m. MODELLED.

seg-151c96b1f882 = <b>MODELLED</b> Cramer-Rao-presisjon for translasjons-, skala- og rotasjonsforskjellene mellom GNSS-, VLBI- og laseravstandsmålingsreferansesystemer når ett romfartøy bærer alle. Uavhengig referanse (ReferenceImpl): Et uavhengig numpy-stablet system med posisjonsukjente eliminert ved eksplisitte Schur-komplementer (T3). Ingen data fra GRASP, Genesis eller andre oppdrag er sammenlignet med. MODELLED.

seg-743d78806f6a = MODELLED — en begrenset tre-legeme-modell (Jorden og Månen som punktmasser, ingen Sol, ingen harmoniske i månens gravitasjon) med oppgitte forenklinger og ILLUSTRATIVE inngangsverdier merket med sine offentlige kilder. Tallbehandlingen er kontrollert mot uavhengige programmer; ingenting er sammenlignet med en måling av en månestørrelse, og ingenting her er en påstand om noe oppdrag eller system. Ikke tilknyttet eller støttet av noe byrå. Adviso (resultat <c1/>)

seg-da35c5298311 = MODELLED studier av Månens bane og overflate som navigasjons- og geodetisk infrastruktur, fem studier bak én type valgt med <c1/>: od-consistency (banebestemmelse om bord med jord-GNSS i en NRHO eller ELFO mot uavhengig radiometrisk banebestemmelse fra bakken, vurdert etter sine egne kovarianser over en seedet Monte Carlo), carrier-phase (felles dobbeltdifferensiert bærebølgefase mellom overflate og orbiter og heltallsfler (typekatalog (<c2/>))

seg-4658f67623b5 = Kshana lunar-infrastructure-scenario: space-tie. MODELLED; utformingen, inngangsverdiene og tersklene er fastsatt i xval/lunar-infra/PREREGISTRATION.md (innsjekket før noen kjøring). ILLUSTRATIVE inngangsverdier er merket med sine offentlige kilder der. (kommentar i scenariofilen, linje { "1" } til { "3" })

seg-f7257c25f137 = Banebestemmelse på månen: jord-GNSS mot radiometri fra bakken er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-a3988ca0b8ea = Løsning av bærebølgefaseflertydighet på månen: overflate og orbiter er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-b2e4ab7b6e60 = Samestimering av referansesystemet på månen: overflatestasjoner og orbitere er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-6eedb30a58c5 = Presisjon i space-tie-referansesystembindingen: samlokalisert GNSS, VLBI og laseravstandsmåling er MODELLED, ikke validert: kontrollert mot en separat implementasjon i samme kodebase, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-cd5f729c9622 = Temaside: <a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>Forrige</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>Neste</s1>lunar-integrity
