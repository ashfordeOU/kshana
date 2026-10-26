# docs--kind-moonlight-service-volume: translations (da)

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-8f8871ac8a0f = Emneside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Emneside: <a1>integrations.md</a1>

seg-eb9f9a422d38 = Kilde: <c1/>

seg-f8988314faf2 = <c1/> (scenarietype)

seg-28c6a5644152 = Modelleret analyse af servicevolumen for månenavigation ud fra en ILLUSTRATIVE konstellation i månebane af typen Moonlight/LCNS baseret på offentlige kilder (ikke tilknyttet ESA): den gennemløber et selenografisk bredde-/længdegradsgitter over en tidshorisont og rapporterer DOP, dækning og tilgængelighed (≥{ "4" } sat. OG PDOP < tærskel) samt en generaliseret ARAIM-beskyttelsesniveau-envelope (HPL/VPL) for månen over volumenen. DOP-geometrien GENBRUGER den VALIDATED kerne fra gnss_lib_py (crate::orbit::dop); beskyttelsesniveauet GENBRUGER LunaNets LNIS-maskineri til ARAIM på månen (crate::lunar, σ_URE≈{ "30" } m) og reduceres til det eksisterende PL ved sydpolen som et specialtilfælde. MODELLED sammensætning: et relæsæt med cirkulære/elliptiske Kepler-baner (ikke den reelle differentialkorrigerede LCNS/NRHO-efemeride), en måne med middelrotation (ingen libration og ingen præcederende pol). Deterministisk (ren geometri). Ingen TRL, flyvehistorik eller anbefaling fra en rumfartsorganisation.

seg-8516d1ded5dd = Én kørsel af <c1/> opsummeres som: moonlight-service-volume | { "8" } sat. (illustrativ, af typen LCNS, ikke tilknyttet) | { "24" } punkter × { "12" } epoker | dækning { "37.8" }% (PDOP<{ "6.0" }) | sat. { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL-tilgængelighed { "0.0" }% | MODELLED

seg-b59e8773bcb9 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

seg-0d935e7c43da = Eksemplet <c1/> angiver blandt andet:

seg-edb738273a3a = Diagrammet, som motoren skriver for scenarios/moonlight-service-volume.toml, type moonlight-service-volume

seg-1974d1d64c9c = <b>VALIDATED</b> DOP, dækning og tilgængelighed for månen af typen Moonlight samt generaliserede ARAIM-beskyttelsesniveauer for månen over en servicevolumen. Uafhængig reference (ExternalDataset): uafhængig tredjepartsautoritet ANISE { "0.10.2" } astro::Orbit, en Kepler-propagator (Nyx Space, MPL-2.0) — en ækvinoktial totlegemekodevej, der adskiller sig fra kshanas Newton-Raphson-Kepler; MCI-positionen for hver satellit stemmer overens inden for <{ "1e-3" } m, og det afledte antal og den afledte mængde af synlige satellitter stemmer nøjagtigt i hvert gitterpunkt. DOP-kernen er valideret mod gnss_lib_py; integriteten bruger offentliggjorte LunaNet/LCNS-parametre

seg-47f496c1d603 = <b>VALIDATED</b> Topocentriske sigtevinkler (azimut med uret fra nord, elevation) og skråafstand til hver satellit fra et navngivet selenografisk sted, givet satellitten i stedets. Uafhængig reference (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, kørt som værktøj fra xval/anise-service-geometry, binærfilen lunar-look-angles-xval, som ikke kalder nogen Kshana-kode): ANISEs egen rutine for azimut, elevation og afstand (azimuth_elevation_range_sez) fra steder bygget med dens konstruktør for bredde, længde og højde på pck00011-månen (kugle { "1737.4" } km), hvor satellitterne er roteret ind i MOON_PA_DE440 via moon_pa_de440_200625.bpc. { "768" } prøver o

seg-1f12671176ad = MODELLED sammensætning: et relæsæt med cirkulære/elliptiske Kepler-baner (ikke den reelle differentialkorrigerede LCNS/NRHO-efemeride), en måne med middelrotation (ingen libration og ingen præcederende pol). (typekatalog (<c1/>))

seg-2ff91fe31123 = ÆRLIGHED: MODELLED sammensætning. DOP-geometrien er valideret VED GENBRUG af den validerede kerne; sammensætningen af dækning, tilgængelighed og integritet er MODELLED — et relæsæt med cirkulære/elliptiske Kepler-baner (ikke en differentialkorrigeret LCNS/{ "9" }:{ "2" }-NRHO-efemeride), en måne med middelrotation (ingen fysisk libration og ingen præcederende pol) og offentliggjorte integritetsparametre fra LunaNet LNIS. Dette viser servicevolumen for månen M (kommentar i scenariefilen, linje { "27" } til { "32" })

seg-f3279128de3b = <s1>Forrige</s1>mars-pnt

seg-92cd937a3fb7 = <s1>Næste</s1>ntn-positioning
