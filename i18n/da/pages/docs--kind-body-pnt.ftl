# docs--kind-body-pnt: translations (da)

seg-5b561b4fd201 = Mars

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-02b8d1f1b7df = Kilde: <c1/>

seg-e28ba749a2a1 = <c1/> (scenarietype)

seg-11e8c29ecb45 = Scenarietype i motoren v{ $version }, familie <a1>Konstellationer, dækning og geometri</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-e7dad1a1ecba = Positionsbestemmelse omkring ethvert legeme i solsystemet: en orbiter eller en lander på overfladen omkring et centrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten af solsystemets katalog), der navigerer med envejs-pseudoafstande fra en lille Walker-navigationskonstellation omkring legemet (tolegemebaner med legemets egen sekulære J2-drift, et ukendt brugerur) og eventuelt en urfri tovejs dybrumsafstand fra Jorden, hvis retning og afstand ved hvert epoke kommer fra den analytiske efemeride for solsystemet. Sigtelinjer spærres af legemets middelkugle, og en bruger på overfladen har også brug for elevationsmasken. Pr. epoke: relæer i sigte, om Jorden er over randen, kun-konstellationens GDOP og PDOP (geometrisk og positionel præcisionsudvanding), den formelle usikkerhed på positionen (én sigma) med og uden Jord-rækken og fejlen på en seedet positionsbestemmelse med mindste kvadraters Gauss-Newton begge veje; over kørslen: tilgængelighed, synlighed af Jorden, median-PDOP, RMS-fejl og median af den formelle sigma, plus lystiden fra Jorden til legemet, rundturen, Shapiro-forsinkelsen og solseparationen ved epoken. MODELLED: relæbanerne, støjniveauerne og den øjeblikkelige målemodel er modelvalg, ikke valideret mod en missions navigationsdata; legemets konstanter er de publicerede værdier, der er angivet i body.rs, og Jord-geometrien arver mærkaterne fra solsystemets efemeride.

seg-c90c1a79f88b = Én kørsel af <c1/> opsummeres som: Positionsbestemmelse omkring Mars — orbiterbruger, { "12" } relæer på { "10000" } km, { "296" } epoker Jordens lystid { "338.3" } s envejs, { "676.6" } s rundtur; vinklen Sol-Jord-legeme { "175.4" } deg tilgængelighed: { "1.000" } kun konstellation, { "1.000" } med Jord-afstanden (Jorden i sigte { "0.811" }) median-PDOP { "1.375" } ; RMS-fejl { "1.883" } m kun konstellation, { "1.629" } m med Jord-afstanden median formel sigma { "1.375" } m kun konstellation, { "1.304" } m med Jord-afstanden

seg-31bacf177d9c = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3f1989254167 = Eksemplet <c1/> angiver blandt andet:

seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

seg-753b1683fb7b = m^3/s^{ "2" }

seg-81d4cd54bd62 = Resultatmærkat (motorens egen): MODELLED: tolegemerelæbaner med sekulær J2-drift, geometrisk synlighed, gaussisk afstandsstøj og en øjeblikkelig målemodel omkring et legeme ud fra de publicerede konstanter; ikke valideret mod en missions navigationsdata. Geometrien fra Jorden til legemet arver mærkaten fra solsystemets efemeride

seg-6f341acbe994 = Diagrammet, som motoren skriver for scenarios/mars-orbit-pnt.toml, type body-pnt

seg-dae4184bb004 = <b>VALIDATED</b> Den newtonske envejs lystid fra et vilkårligt legeme til et andet, modtaget ved en epoke, løst af den radiometriske fikspunkts-lystidsløser (radiometric::light_time_solution, sender i sin retarderede position) gennem solar_system::link_o Tests: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-45259ad33a01 = <b>MODELLED</b> Typen <c1/>: en orbiter eller en lander på overfladen omkring et legeme valgt ved navn navigerer med envejs-pseudoafstande fra en Walker-navigationskonstellation omkring legemet (tolegemebaner med legemets sekulære J2-drift, et ukendt bruger-u

seg-5c3f8ac041d3 = <b>MODELLED</b> Typen <c1/>: en orbiter eller en lander på overfladen omkring et legeme valgt ved navn navigerer med envejs-pseudoafstande fra en Walker-navigationskonstellation omkring. Uafhængig reference (InternalConsistency): Lukkede former og selvkonsistens: Keplers tredje lov for relæperioden, baneradius og overfladeradius holdt konstante over kørslen, at tilføjelse af en måling aldrig øger den formelle usikkerhed, og at de seedede fejl stemmer med kovariansen. Relæbanerne ser bort fra tredjelegemer (Jupiters træk i relæer omkring Europa er ikke modelleret), støjen er gaussisk ved angivne niveauer, og målemodellen er øjeblikkelig

seg-64920deda9cd = MODELLED: tolegemerelæbaner med sekulær J2-drift, geometrisk synlighed, gaussisk afstandsstøj og en øjeblikkelig målemodel omkring et legeme ud fra de publicerede konstanter; ikke valideret mod en missions navigationsdata. Geometrien fra Jorden til legemet arver mærkaterne fra solsystemets efemeride. (resultat <c1/>)

seg-bcb5cbf9cbe3 = MODELLED: relæbanerne, støjniveauerne og den øjeblikkelige målemodel er modelvalg, ikke valideret mod en missions navigationsdata; legemets konstanter er de publicerede værdier, der er angivet i body.rs, og Jord-geometrien arver mærkaterne fra solsystemets efemeride. (typekatalog (<c1/>))

seg-04cd882741e2 = MODELLED. Relæbanerne, afstandsstøjen på { "1" } m og den øjeblikkelige målemodel er modelvalg; intet her er valideret mod en missions navigationsdata. Marskonstanterne er de publicerede værdier, der er angivet i src/body.rs. (kommentar i scenariefilen, linje { "20" } til { "22" })

seg-df6bae4c422e = Positionsbestemmelse omkring ethvert legeme i solsystemet med en lokal konstellation og en dybrumsforbindelse fra Jorden er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-a4f1e7d2041e = Familieside: <a1>Konstellationer, dækning og geometri</a1>

seg-670191cf797f = Emneside: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Emneside: <a1>CONSTELLATION-DESIGN.md</a1>

seg-a4c650a0eb7a = <s1>Forrige</s1>attitude-budget

seg-96170e5c8e3f = <s1>Næste</s1>campaign
