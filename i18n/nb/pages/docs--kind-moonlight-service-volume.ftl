# docs--kind-moonlight-service-volume: translations (nb)

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-8f8871ac8a0f = Temaside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Temaside: <a1>integrations.md</a1>

seg-eb9f9a422d38 = Kilde: <c1/>

seg-f8988314faf2 = <c1/> (scenariotype)

seg-28c6a5644152 = Modellert analyse av tjenestevolumet for månenavigasjon fra en ILLUSTRATIVE konstellasjon i månebane av typen Moonlight/LCNS, bygget på offentlige kilder (ikke tilknyttet ESA): den sveiper over et selenografisk bredde-/lengdegradsnett over en tidshorisont og rapporterer DOP, dekning og tilgjengelighet (≥{ "4" } satellitter OG PDOP < terskel) samt en generalisert månebasert ARAIM-beskyttelsesnivå-omhylling (HPL/VPL) over volumet. DOP-geometrien GJENBRUKER kjernen som er VALIDATED mot gnss_lib_py (crate::orbit::dop); beskyttelsesnivået GJENBRUKER LunaNet LNIS' månebaserte ARAIM-maskineri (crate::lunar, σ_URE≈{ "30" } m) og reduseres til det eksisterende beskyttelsesnivået ved sørpolen som et spesialtilfelle. MODELLED sammensetning: et reléssett i sirkulære eller elliptiske Kepler-baner (ikke den virkelige differensialkorrigerte LCNS/NRHO-efemeriden) og en måne med middels rotasjon (ingen librasjon og ingen presesjon av polen). Deterministisk (ren geometri). Ingen TRL, flytradisjon eller byråstøtte.

seg-8516d1ded5dd = En kjøring av <c1/> oppsummeres slik: moonlight-service-volume | { "8" } sats (illustrative LCNS-class, not affiliated) | { "24" } pts × { "12" } epochs | coverage { "37.8" }% (PDOP<{ "6.0" }) | sats { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL avail { "0.0" }% | MODELLED

seg-b59e8773bcb9 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

seg-0d935e7c43da = Eksempelet <c1/> angir blant annet:

seg-edb738273a3a = Diagrammet motoren skriver for scenarios/moonlight-service-volume.toml, type moonlight-service-volume

seg-1974d1d64c9c = <b>VALIDATED</b> DOP, dekning og tilgjengelighet for Moonlight-lignende månekonstellasjoner, samt generaliserte månebaserte ARAIM-beskyttelsesnivåer over et tjenestevolum. Uavhengig referanse (ExternalDataset): den uavhengige tredjeparts Kepler-propagatoren ANISE { "0.10.2" } astro::Orbit (Nyx Space, MPL-2.0), en ekvinoktial totrekrops-kodebane som er forskjellig fra kshanas Newton-Raphson-Kepler; posisjonen i MCI per satellitt stemmer til <{ "1e-3" } m, og det avledede antallet og settet av synlige satellitter samsvarer nøyaktig i hvert rutenettpunkt. DOP-kjernen er validert mot gnss_lib_py; integriteten bruker publiserte LunaNet/LCNS-parametere

seg-47f496c1d603 = <b>VALIDATED</b> Topocentriske siktevinkler per satellitt (azimut med klokken fra nord, elevasjon) og skrå avstand ved et navngitt selenografisk sted, gitt satellitten i stedets. Uavhengig referanse (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, kjørt som verktøy fra xval/anise-service-geometry, binærfilen lunar-look-angles-xval, som ikke kaller noen Kshana-kode): ANISEs egen rutine for azimut, elevasjon og avstand (azimuth_elevation_range_sez) fra steder bygget med dens konstruktør for breddegrad, lengdegrad og høyde på pck00011-månen (kule { "1737.4" } km), med satellittene rotert inn i MOON_PA_DE440 via moon_pa_de440_200625.bpc. { "768" } utvalg o

seg-1f12671176ad = MODELLED sammensetning: et reléssett i sirkulære eller elliptiske Kepler-baner (ikke den virkelige differensialkorrigerte LCNS/NRHO-efemeriden) og en måne med middels rotasjon (ingen librasjon og ingen presesjon av polen). (typekatalog (<c1/>))

seg-2ff91fe31123 = ÆRLIGHET: MODELLED sammensetning. DOP-geometrien er validert VED GJENBRUK av den validerte kjernen; sammensetningen av dekning, tilgjengelighet og integritet er MODELLED: et reléssett i sirkulære eller elliptiske Kepler-baner (ikke en differensialkorrigert LCNS-/{ "9" }:{ "2" }-NRHO-efemeride), en måne med middels rotasjon (ingen fysisk librasjon og ingen presesjon av polen) og publiserte LunaNet LNIS-integritetsparametere. Dette demonstrerer tjenestevolumet for månen M (kommentar i scenariofilen, linje { "27" } til { "32" })

seg-f3279128de3b = <s1>Forrige</s1>mars-pnt

seg-92cd937a3fb7 = <s1>Neste</s1>ntn-positioning

seg-e66e2ca31e54 = Temaside: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-25040e105bf7 = <b>MODELLED</b> Typen og fasen <c1/>: relétilgjengelighet og PDOP, synlighet av Jorden og Solen og en disiplinert overflateklokke for hvert sted og hver årstid, med terrengskylinen fra <c2/>; en kjøring for ett sted er lik den typens

seg-6730fa1b9820 = <s1>Forrige</s1>mission-thread
