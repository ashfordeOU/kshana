# docs--kind-cislunar-observability: translations (da)

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-6d584e86deba = forhold (dimensionsløst)

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-258f128cea60 = Kilde: <c1/>

seg-f0c7758e472f = <c1/> (scenarietype)

seg-7ccd0a3babb8 = MODELLED observerbarhed for en plan cislunar konstellation (P6): sporer en differentialkorrigeret konstellation af fire rumfartøjer i plane DRO'er med afstandsmåling mellem satellitter og rapporterer, hvor stor en del af et rumfartøjs firetilstand [x,y,ẋ,ẏ] buen gør observerbar. Udsender ({ "1" }) tabellen rang-mod-buelængde for et enkelt link med kun afstand — øjeblikkeligt rang 1, voksende mod den fulde firetilstand, efterhånden som buen forlænges (P6 Table { "1" }); ({ "2" }) observerbarhedsgramianens egenspektrum + konditionstal over buen; ({ "3" }) sammenligningen af øjeblikkelig rang for kun afstand mod afstand+afstandsrate (Doppler-designgrebet) plus rapporteringen af GDOP, der er singulær for kun afstand og defineret for afstand+rate; og ({ "4" }) en uafhængig SRIF-krydsvalidering, hvis posteriore kovarians bliver endelig / velkonditioneret netop ved den bue, hvor den observerbare rang når fire. VALIDATED kerne: den observerbare rang er en rangafslørende tærskel på singulærværdier, krydskontrolleret mod Gramianens egenrang; egenspektret overholder de spektrale invarianter (trace=Σλ, det=Πλ, Frobenius²=Σλ²); den variationelle STM er den STM for CR3BP, der er valideret med differenskvotienter; rækkerne i jacobianen for afstand/afstandsrate er analytiske partielle afledede valideret med differenskvotienter (krydskontrolleret mod crate'ens 3D-observabel for afstandsrate); de fire begyndelsesbetingelser er differentialkorrigerede plane DRO'er, der lukker til et snævert periodicitetsresidual og er retrograde; rangovergangen er krydsvalideret mod crate'ens kvadratrodsinformationsfilter (posterior kovarians endelig netop ved fuld rang, cond(P)=cond(OᵀO)); et rangdefekt snapshot markeres som GDOP-udefineret (fim condition=inf), aldrig som en falsk endelig værdi — den samme singulære-geometri-vagt som pvt::solve_spp anvender. MODELLED: konstellationsdesignet (DRO-perilune-amplituder og -faser) og det specifikke rangforløb, det frembringer. Ikke et certificeret navigationsydelsesprodukt.

seg-a59f2fa9efb9 = Én kørsel af <c1/> opsummeres som: cislunar-observability | { "4" } s/c ({ "3" } refs) | { "6.0" } h bue, { "24" } epoker | rang { "1" } → { "4" } af { "4" } over buen | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | øjeblikkelig rang kun afstand { "2" } → afstand+rate { "4" } ({ "3" } links) | GDOP kun afstand udefineret afstand+rate { "6.353" } | DRO-begyndelsesbetingelser (maks. periodicitetsresidual { "4.7e-9" }) | SRIF posterior endelig ved rang-4-epoke { "8" } (valideret rang/STM/DRO-lukning/SRIF, modelleret design)

seg-fb1601eda130 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-f3b5cc590c78 = Eksemplet <c1/> angiver blandt andet:

seg-0cc8ab10786b = tidsenheder i roterende system

seg-84781b6fff48 = GDOP udefineret (rangdefekt / singula

seg-856eb311f24b = “udefineret” (tekst som dokumentet angiver

seg-fc5d34345fdd = Resultatmærkat (motorens egen): MODELLED observerbarhed for en plan cislunar konstellation (P6). VALIDATED kerne: den observerbare RANG er en rangafslørende tærskel på singulærværdier, krydskontrolleret mod Gramianens egenrang; Gramianens egenspektrum overholder de spektrale invarianter (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }

seg-f15bbf30b0dd = Diagrammet, som motoren skriver for scenarios/cislunar-observability.toml, type cislunar-observability

seg-4564ad90378b = <b>MODELLED</b> Tærsklen for observerbarhed ved cislunar buelængde i den RUMLIGE seks-tilstands-CR3BP i stedet for den plane firetilstand, på tværs af familierne DRO, L2-halo og L2 næsten retlinet halo, med målestøj, der indgår i Gramianen, og TO kriterier, der rapporterer

seg-9f857ff85800 = <b>MODELLED</b> Tærsklen for observerbarhed ved cislunar buelængde i den RUMLIGE seks-tilstands-CR3BP i stedet for den plane firetilstand, på tværs af familierne DRO, L2-halo og L2 næsten retlinet ha. Uafhængig reference (InternalConsistency): En uafhængig rækkeechelon-rang ved Gauss-elimination med partiel pivotering bekræfter hvert seks-tilstands-rangudfald — en anden algoritme, der ikke deler kode med den egen-/SVD-vej, der afprøves. Den { "6" }×{ "6" } tilstandsovergangsmatrix for CR3BP, som dette sammensætter, har sin egen ReferenceImpl-uafhængige reference mod variationel integration i SciPy, og halo-/NRHO-begyndelsesbetingelserne kommer fra en korrektor, der gengiver den publicerede sydlige L2

seg-53c183035bde = MODELLED observerbarhed for en plan cislunar konstellation (P6). VALIDATED kerne: den observerbare RANG er en rangafslørende tærskel på singulærværdier, krydskontrolleret mod Gramianens egenrang; Gramianens egenspektrum overholder de spektrale invarianter (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }); den variationelle STM er den STM for CR3BP, der er valideret med differenskvotienter (crate::cr3bp); rækkerne i jacobianen for afstand / afstandsrate (resultat <c1/>)

seg-f6a217f57bec = MODELLED observerbarhed for en plan cislunar konstellation (P6): sporer en differentialkorrigeret konstellation af fire rumfartøjer i plane DRO'er med afstandsmåling mellem satellitter og rapporterer, hvor stor en del af et rumfartøjs firetilstand [x,y,ẋ,ẏ] buen gør observerbar. (typekatalog (<c1/>))

seg-e5182743fd40 = MODELLED: konstellationsdesignet (DRO-perilune-amplituder og -faser) og det specifikke rangforløb, det frembringer. (typekatalog (<c1/>))

seg-5d3a370f1295 = Ærlighed: MODELLED. VALIDATED kerne -- den observerbare RANG er en rangafslørende tærskel på singulærværdier, krydskontrolleret mod Gramianens egenrang; egenspektret overholder de spektrale invarianter (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }); den variationelle STM er den STM for CR3BP, der er valideret med differenskvotienter; rækkerne i jacobianen for afstand / afstandsrate er analytiske partielle afledede valideret med differenskvotienter (krydskontrol (kommentar i scenariefilen, linje { "16" } til { "25" })

seg-c68bc1df8975 = Rumlig, støjfyldt cislunar buelængde-observerbarhed på tværs af flere familier er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-ba3c2a8f0e28 = <s1>Forrige</s1>cislunar-arc-recovery

seg-3adfb78b1f34 = <s1>Næste</s1>clock
