# docs--kind-lunar-descent: translations (da)

seg-f942b36a11c4 = Endnu ikke på GitHub

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-6a26b9ab59fe = Emneside: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differentiel

seg-2d84b341a41f = Resultatetiket (motorens): MODELLED

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-e66e2ca31e54 = Emneside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Kilde: <c1/>

seg-d4df5aa9b7b0 = <c1/> (scenarietype)

seg-2cd0d5385530 = MODELLED budget for landingsspredning ved en drevet nedstigning til et sted ved sydpolen (Artemis-klassen). Pr. vandret akse drives en inertiel fejlmodel med fem tilstande (position, hastighed, accelerometerbias, attitudehældning, gyrobias) af nedstigningens specifikke kraft; et sekventielt filter tager positionsbestemmelser fra de aktiverede støtter: en AFS-positionsbestemmelse fra de synlige relæer i en ILLUSTRATIVE konstellation i LCNS-klassen (selvstændig eller differentiel med korrektionslinkets residual fra lunar-differential-pnt, med uret støttet, når kun tre relæer er synlige) og en terrænrelativ positionsbestemmelse (cratens TERCOM/SITAN-matcher på et syntetisk relief eller Cramer-Rao-grænsen for matchning af et højdevindue i den virkelige LOLA-DEM for sydpolen). Månetid indgår gennem køretøjets ur ved positionsbestemmelserne (LTC-TT-offsettet fra lunar-time-offset eller usikkerheden i dets offentliggjorte bånd) og som en tidsmærkefejl langs banen. Rapporterer 3-sigma-landingsellipsen, R95, de lukkede inertielle kilder, hver støttes bidrag, ablationen af hver kombination af støtter, en Monte Carlo-kalibrering af ellipsen og den kovarians, der gives videre. MODELLED: illustrativ IMU-klasse, relæsæt, nedstigningsprofil og styringsled; terrain-nav bruger et syntetisk relief på en jordisk meterskala; AFS-tilgængeligheden er én epoke på en flad maske. Ikke støttet af nogen rumfartsorganisation; vejledende software, ikke certificeret navigationsudstyr.

seg-c6c1a8f184ed = Én kørsel af <c1/> opsummeres som: lunar-descent | -89.50 deg | kun inertiel 517/517 m (E/N) | med støtter 7.6/4.8 m | spredning R95 { "51" } m | 3-sigma-ellipse { "64" } x { "62" } m | { "99.1" }% inden for (forventet { "98.9" }%) (MODELLED)

seg-dfdb7de68515 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = Eksemplet <c1/> sætter blandt andet:

seg-8073ece4c900 = Diagrammet, motoren skriver for scenarios/lunar-descent.toml, type lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> Typen og fasen <c1/>: en inertiel fejlmodel med fem tilstande pr. akse (position, hastighed, accelerometerbias, hældning, gyrobias) over en drevet nedstigning, støttet af AFS-positionsbestemmelser (selvstændige eller differentielle, med det urstøttede tilfælde med tre relæ

seg-bfe4c0a04288 = <b>MODELLED</b> Typen og fasen <c1/>: en inertiel fejlmodel med fem tilstande pr. akse (position, hastighed, accelerometerbias, hældning, gyrobias) over en drevet nedstigning,. Uafhængig reference (InternalConsistency): Den lukkede inertielle drift, de genbrugte typers egne resultater og kalibreringen af 3-sigma-ellipsen (andelen inden for stemmer overens med forventningen) i testene. Ingen fløjet eller afprøvet landing sammenlignes

seg-ed286f215c96 = MODELLED budget for landingsspredning ved en drevet nedstigning til et sted ved sydpolen (Artemis-klassen). (typekatalog (<c1/>))

seg-c1bd92ba429b = MODELLED: illustrativ IMU-klasse, relæsæt, nedstigningsprofil og styringsled; terrain-nav bruger et syntetisk relief på en jordisk meterskala; AFS-tilgængeligheden er én epoke på en flad maske. (typekatalog (<c1/>))

seg-85714bc3cf2a = ÆRLIGHED: MODELLED. IMU-klassen, nedstigningsprofilen, relæsættet, fejlen i signal i rummet og styringsleddet er ILLUSTRATIVE input, ikke målinger. Tilstanden terrain-nav bruger det selvstændige syntetiske relief og en jordisk meterskala, så terrænleddet her er matcherens adfærd på en stand-in, ikke en påstand om relieffet ved sydpolen: varianten lola-crlb (lunar-descent-lola.toml) bruger det virkelige (kommentar i scenariefilen, linje { "14" } til { "20" })

seg-3eb1b3b03600 = Budget for landingsspredning ved et polart sted på Månen (<c1/>) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede / analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Forrige</s1>lunar-beacon

seg-ca9b68783354 = <s1>Næste</s1>lunar-differential-pnt
