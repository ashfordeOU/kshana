# docs--kind-body-pnt: translations (nb)

seg-5b561b4fd201 = Mars

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-02b8d1f1b7df = Kilde: <c1/>

seg-e28ba749a2a1 = <c1/> (scenariotype)

seg-11e8c29ecb45 = Scenariotype i motoren v{ $version }, familie <a1>Konstellasjoner, dekning og geometri</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-e7dad1a1ecba = Posisjonsbestemmelse rundt et hvilket som helst legeme i solsystemet: en orbiter eller en landingsfarkost på overflaten rundt et sentrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten av solsystemkatalogen), som navigerer med enveis pseudoavstander fra en liten Walker-navigasjonskonstellasjon rundt legemet (todelslegeme-baner med legemets egen sekulære J2-drift, en ukjent brukerklokke) og eventuelt en klokkefri tovegs dypromsavstand fra jorden, hvis retning og avstand kommer fra den analytiske solsystemefemeriden ved hver epoke. Siktelinjer blokkeres av legemets middelkule, og en overflatebruker trenger også elevasjonsmasken. Per epoke: releer i sikt, om jorden er over limben, GDOP og PDOP for konstellasjonen alene (geometrisk og posisjonsmessig presisjonsfortynning), den formelle énsigma-posisjonsusikkerheten med og uten jordraden, og feilen i en seedet Gauss-Newton minste kvadraters posisjonsbestemmelse begge veier; over kjøringen: tilgjengelighet, jordsikt, median PDOP, RMS-feil og median formell sigma, pluss lystiden fra jorden til legemet, rundturen, Shapiro-forsinkelsen og solseparasjonen ved epoken. MODELLED: relébanene, støynivåene og den øyeblikkelige målemodellen er modelleringsvalg, ikke validert mot et oppdrags navigasjonsdata; legemets konstanter er de publiserte verdiene det vises til i body.rs, og jordgeometrien arver etikettene til solsystemefemeriden.

seg-c90c1a79f88b = Én kjøring av <c1/> oppsummeres som: Positioning around Mars — orbiter user, { "12" } relays at { "10000" } km, { "296" } epochs Earth light time { "338.3" } s one-way, { "676.6" } s round trip; Sun-Earth-body angle { "175.4" } deg availability: { "1.000" } constellation only, { "1.000" } with the Earth range (Earth in view { "0.811" }) median PDOP { "1.375" } ; RMS error { "1.883" } m constellation only, { "1.629" } m with the Earth range median formal sigma { "1.375" } m constellation only, { "1.304" } m with the Earth range

seg-31bacf177d9c = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3f1989254167 = Eksempelet <c1/> setter blant annet:

seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

seg-753b1683fb7b = m^3/s^{ "2" }

seg-81d4cd54bd62 = Resultatetikett (motorens): MODELLED: two-body relay orbits with J2 secular drift, geometric visibility, Gaussian range noise and an instantaneous measurement model around a body from the published constants; not validated against a mission's navigation data. The Earth-to-body geometry inherits the solar-system ephemeris label

seg-6f341acbe994 = Diagrammet motoren skriver for scenarios/mars-orbit-pnt.toml, typen body-pnt

seg-dae4184bb004 = <b>VALIDATED</b> Den newtonske enveis lystiden fra et hvilket som helst legeme til et annet, mottatt ved en epoke, løst av den radiometriske fikspunkts-lystidsløseren (radiometric::light_time_solution, sender ved sin retarderte posisjon) gjennom solar_system::link_o Tester: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-45259ad33a01 = <b>MODELLED</b> Typen <c1/>: en orbiter eller en landingsfarkost på overflaten rundt et legeme valgt ved navn navigerer med enveis pseudoavstander fra en Walker-navigasjonskonstellasjon rundt legemet (todelslegeme-baner med legemets sekulære J2-drift, en ukjent bruker-c

seg-5c3f8ac041d3 = <b>MODELLED</b> Typen <c1/>: en orbiter eller en landingsfarkost på overflaten rundt et legeme valgt ved navn navigerer med enveis pseudoavstander fra en Walker-navigasjonskonstellasjon arou. Uavhengig referanse (InternalConsistency): Lukkede former og selvkonsistens: Keplers tredje lov for reléperioden, banens radius og overflateradiusen holdt konstant gjennom kjøringen, at en ekstra måling aldri øker den formelle usikkerheten, og at de seedede feilene stemmer med kovariansen. Relébanene ignorerer tredjelegemer (Jupiters trekk på reléer rundt Europa er ikke modellert), støyen er gaussisk ved oppgitte nivåer og målemodellen er øyeblikkelig

seg-64920deda9cd = MODELLED: two-body relay orbits with J2 secular drift, geometric visibility, Gaussian range noise and an instantaneous measurement model around a body from the published constants; not validated against a mission's navigation data. The Earth-to-body geometry inherits the solar-system ephemeris labels. (resultat <c1/>)

seg-bcb5cbf9cbe3 = MODELLED: relébanene, støynivåene og den øyeblikkelige målemodellen er modelleringsvalg, ikke validert mot et oppdrags navigasjonsdata; legemets konstanter er de publiserte verdiene det vises til i body.rs, og jordgeometrien arver etikettene til solsystemefemeriden. (typekatalog (<c1/>))

seg-04cd882741e2 = MODELLED. Relébanene, støyen på { "1" } m i avstandsmålingen og den øyeblikkelige målemodellen er modelleringsvalg; ingenting her er validert mot et oppdrags navigasjonsdata. Marskonstantene er de publiserte verdiene det vises til i src/body.rs. (kommentar i scenariofilen, linje { "20" } til { "22" })

seg-df6bae4c422e = Posisjonsbestemmelse rundt et hvilket som helst legeme i solsystemet med en lokal konstellasjon og en dypromslink fra jorden er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-a4f1e7d2041e = Familieside: <a1>Konstellasjoner, dekning og geometri</a1>

seg-670191cf797f = Temaside: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Temaside: <a1>CONSTELLATION-DESIGN.md</a1>

seg-a4c650a0eb7a = <s1>Forrige</s1>attitude-budget

seg-96170e5c8e3f = <s1>Neste</s1>campaign
