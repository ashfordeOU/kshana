# docs--kind-launch-window: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-b054c73f22e5 = ingen værdi

seg-8e62cc4af6ea = Emneside: <a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = Kilde: <c1/>

seg-e0990c5f14da = <c1/> (scenarietype)

seg-7a4e6215a488 = Opsendelses- og opstigningsgeometri med tolegemeproblem: opsendelsesazimut(er) (sin Az = cos i / cos lat), mindste opnåelige inklination, cirkulær hastighed, Jordens rotationsbonus mod øst, Δv for dogleg-planændring, når målinklinationen er under stedets breddegrad, og antallet af daglige opsendelsesmuligheder. MODELLED geometri for kugleformet Jord (ingen hastighedstrekantskorrektion for roterende Jord, ingen model for opstignings-/modstandstab).

seg-e24b0ae723c7 = Én kørsel af <c1/> opsummeres sådan: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

seg-6f955816b5c6 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-aaadee0743ee = Eksemplet <c1/> angiver blandt andet:

seg-58d26f083b8f = Resultatmærkat (motorens): MODELLED, opsendelsesgeometri med tolegemeproblem og kugleformet Jord; azimut er den geometriske relation sin(Az)=cos(i)/cos(lat) (ingen hastighedstrekantskorrektion for roterende Jord, ingen model for opstignings-/modstandstab)

seg-9696283a95ae = Diagrammet, som motoren skriver for scenarios/launch-window.toml, scenarietype launch-window

seg-38175030f689 = <b>MODELLED</b> Opsendelsesazimut(er) med tolegemeproblem (sin Az = cos i / cos lat), mindste opnåelige inklination, cirkulær hastighed, Jordens rotationsbonus mod øst, Δv for dogleg-planændring og daglige muligheder, og, givet en epoke og IERS finals2000A-rækker, stedet

seg-53bc589c7ed6 = <b>MODELLED</b> Opsendelsesazimut(er) med tolegemeproblem (sin Az = cos i / cos lat), mindste opnåelige inklination, cirkulær hastighed, Jordens rotationsbonus mod øst, Δv for dogleg-planændring a. Uafhængig reference (InternalConsistency): Sfærisk-trigonometrisk opsendelsesgeometri i lukket form mod offentliggjorte gennemregnede ankre (Vallado, Fundamentals of Astrodynamics 4. udg., Algorithm { "37" } opsendelsesazimut + kap. 6 planændring; tests/launch_window_ascent_geometry_reference.rs). Disse genbruger den samme lukkede form, som kshana implementerer (en paritets-/transskriptionskontrol mod offentliggjort værdi, InternalConsistency); MODELLED tolegemeproblem, ingen hastighedstrekant for roterende Jord / opstigning / modstand

seg-12396619d3e5 = MODELLED, opsendelsesgeometri med tolegemeproblem og kugleformet Jord; azimut er den geometriske relation sin(Az)=cos(i)/cos(lat) (ingen hastighedstrekantskorrektion for roterende Jord, ingen model for opstignings-/modstandstab) (resultat <c1/>)

seg-715f1856bd37 = MODELLED geometri for kugleformet Jord (ingen hastighedstrekantskorrektion for roterende Jord, ingen model for opstignings-/modstandstab). (typekatalog (<c1/>))

seg-4e9a215e3918 = ÆRLIGT OMFANG: MODELLED. Kun geometrisk azimut -- ingen hastighedstrekantskorrektion for roterende Jord (bonussen rapporteres separat, så den kan indregnes), ingen model for opstigningstrajektorie / modstandstab / styring. Geometri før fase A. Kør: kshana scenarios/launch-window.toml (kommentar i scenariefilen, linje { "8" } til { "11" })

seg-12332d181de4 = Opsendelsesvindue og opstigningsgeometri (missionsanalyse) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-1a3841380d88 = <s1>Forrige</s1>jamming

seg-78411b85f301 = <s1>Næste</s1>leo-navmsg
