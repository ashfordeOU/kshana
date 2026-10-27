# docs--kind-solar-system: translations (nb)

seg-e27476e37522 = Jorden

seg-5b561b4fd201 = Mars

seg-59f1f277012b = Jupiter

seg-e6e209ad07e0 = Europa

seg-6f12259c6ec4 = Saturn

seg-11e8c29ecb45 = Scenariotype i motoren v{ $version }, familie <a1>Konstellasjoner, dekning og geometri</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-dae4184bb004 = <b>VALIDATED</b> Den newtonske enveis lystiden fra et hvilket som helst legeme til et annet, mottatt ved en epoke, løst av den radiometriske fikspunkts-lystidsløseren (radiometric::light_time_solution, sender ved sin retarderte posisjon) gjennom solar_system::link_o Tester: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-a4f1e7d2041e = Familieside: <a1>Konstellasjoner, dekning og geometri</a1>

seg-670191cf797f = Temaside: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Temaside: <a1>CONSTELLATION-DESIGN.md</a1>

seg-4d208b6c0eb8 = dag

seg-3319b18ac61f = og { "1" } til i matrisen.

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-028ac545e52e = Kilde: <c1/>

seg-934e7998420c = <c1/> (scenariotype)

seg-0549bc926a9b = Hele solsystemet ved én epoke, for PNT (posisjonering, navigasjon og tidssynkronisering) rundt et hvilket som helst legeme. For Solen, de åtte planetene, Pluto, Månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan rapporterer den heliosentrisk posisjon og hastighet i ICRF (International Celestial Reference Frame, ekvatorial J2000), heliosentrisk avstand og ekliptisk lengde- og breddegrad i J2000, gravitasjonsparameteren, ekvatorial og middels radius, J2 der den er publisert og dens referanseradius, den siderale rotasjonsperioden, IAU-polen og nullmeridianen ved epoken, et banespor samplet over én omløpstid (heliosentrisk for planeter, sentrert på moderlegemet for måner), og lystiden, enveis og toveis avstand, Shapiro-forsinkelsen fra Solen og separasjonen fra Solen sett fra et observatørlegeme (standard Jorden); ekstra lenker fra/til får samme behandling. Posisjoner: JPL Kepler-elementene til Standish og Williams (tabell { "1" } for { "1800" } e.Kr. til { "2050" } e.Kr., tabellene 2a/2b for { "3000" } f.Kr. til { "3000" } e.Kr.) med hver planets nominelle feil, Montenbruck & Gills måneserie for oppdelingen Jorden–Månen, JPL-middelelementer med IAUs synkrone rotasjonshastighet for Mars-månene og de galileiske månene, og IAUs rotasjonsmodell for Titan. Lystid: radiometrisk fastpunktsløsning, sender ved sin forsinkede posisjon; newtonsk, med Shapiro-forsinkelsen rapportert separat. VALIDATED mot JPL Horizons (DE441) innenfor to ganger den nominelle feilen: Merkur til Saturn og Jorden fra tabell { "1" } (verst { "1.87" } ganger nominell) og alle åtte planetene fra tabellene 2a/2b (verst { "1.71" } ganger), og lystiden fra Jorden til Mars og Jupiter. MODELLED, hver rad merket: Uranus og Neptun fra tabell { "1" } ({ "2.0" } og { "5.2" } ganger den nominelle feilen mot DE441), Pluto (raden fra { "1992" }; ingen oppgitt feil), Månen og de sju månene (målt mot Horizons, ingen publisert grense).

seg-bd2d27e1f91d = En kjøring av <c1/> oppsummeres slik: Solar system at 2026-09-28T00:{ "00" }:{ "00" } (JD { "2461311.50080" } TDB), { "18" } bodies, observer Earth Standish Table { "1" } ({ "1800" } AD to { "2050" } AD) Sun { "0.0000" } au lon { "0.00" } deg light time { "500.1" } s [origin] Mercury { "0.4666" } au lon { "259.05" } deg light time { "605.3" } s [VALIDATED] Venus { "0.7272" } au lon { "348.72" } deg light time { "182.1" } s [VALIDATED] Earth { "1.0022" } au lon { "4.52" } deg observer [VALIDATED] Moon { "1.0046" } au lon { "4.56" } deg light time { "1.3" } s [MODELLED] Mars { "1.5544" } au lon { "83.81" } deg light time { "841.1" } s [VALIDATED] Phobos { "1.5545" } au lon { "83.81" } deg light time { "841.2" } s [MODELLED] Deimos { "1.5545" } au lon { "83.80" } deg light time { "841.1" } s [MODELLED] Jupiter { "5.3036" } au lon { "130.91" } deg light time { "2970.6" } s [VALIDATED] Io { "5.3049" } au lon { "130.94" } deg light time { "2971.5" } s [MODELLED] Europa { "5.2995" } au lon { "130.93" } deg light time { "2968.7" } s [MODELLED] Ganymede { "5.3005" } au lon { "130.98" } deg light time { "2969.6" } s [MODELLED] Callisto { "5.3153" } au lon { "130.96" } deg light time { "2976.7" } s [MODELLED] Saturn { "9.4356" } au lon { "10.77" } deg light time { "4212.2" } s [VALIDATED] Titan { "9.4401" } au lon { "10.74" } deg light time { "4214.3" } s [MODELLED] Uranus { "19.4363" } au lon { "62.62" } deg light time { "9444.1" } s [MODELLED] Neptune { "29.8775" } au lon { "2.62" } deg light time { "14409.3" } s [MODELLED] Pluto { "35.6122" } au lon { "304.19" } deg light time { "17529.1" } s [MODELLED] link Mars -> Jupiter: one-way { "2193.539" } s, two-way { "4386.919" } s, Shapiro { "15.0" } us, Sun { "15.0" } deg link Saturn -> Earth: one-way { "4212.176" } s, two-way { "8424.347" } s, Shapiro { "22.1" } us, Sun { "172.5" } deg link Europa -> Jupiter: one-way { "2.218" } s, two-way { "4.437" } s, Shapiro { "0.0" } us, Sun { "22.0" } deg

seg-26ecec1af8af = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-13de19567146 = Eksempelet <c1/> angir blant annet:

seg-6081077a5c63 = 2026-09-28T00:{ "00" }:{ "00" }

seg-c4b64eb26210 = ICRF (ekvatorial J2000), heliosentrisk; m

seg-6096a0ab243b = Standish tabell { "1" } ({ "1800" } e.Kr. til { "2050" } e.Kr.)

seg-5c9a8d4716f5 = Resultatetikett (motorens): MIXED: hvert legeme bærer sin egen etikett. Planetposisjoner er VALIDATED mot JPL Horizons innenfor to ganger Standishs nominelle feil (Merkur til Saturn og Jorden fra tabell { "1" }; alle åtte planetene fra tabellene 2a/2b); Uranus og Neptun fra tabell { "1" }, Pluto, Månen og de sju månene er MODELLED.

seg-537aa8010e50 = Diagrammet motoren skriver for scenarios/solar-system-tour.toml, type solar-system

seg-7432155d5fec = <b>VALIDATED</b> Typen <c1/> med planetary_kernel_path: hvert rapportert legeme hvis egen NAIF-kode SPK-en inneholder, henter sin heliosentriske J2000-posisjon og -hastighet fra kjernen gjennom motorens egen leser (etikett KERNEL), en lenke hvis to ende

seg-84ce0dd8daef = <b>VALIDATED</b> Heliosentriske posisjoner for Merkur, Venus, barysenteret Jorden–Månen, Jorden, Mars, Jupiter og Saturn fra Standish tabell { "1" } ({ "1800" } e.Kr. til { "2050" } e.Kr.), og for alle åtte planetene fra tabellene 2a/2b ({ "3000" } f.Kr. til { "3000" } e.Kr., med middelanomalileddene b, c, s, f Tester: <a1>solar_system_standish_earth_icrf_preregistered.rs</a1>.

seg-cc5bd76ec542 = <b>MODELLED</b> Posisjoner for Uranus og Neptun fra Standish tabell { "1" } (standard innenfor { "1800" } e.Kr. til { "2050" } e.Kr.), Pluto fra raden i tabell { "1" } fra { "1992" } som den gjeldende JPL-siden ikke lenger oppgir, og den heliosentriske hastigheten til hver planet: den todelte derivatet med Tester: <a1>solar_system_horizons_reference.rs</a1>.

seg-ad3da7fe8e46 = <b>VALIDATED</b> Typen <c1/> med planetary_kernel_path: hvert rapportert legeme hvis egen NAIF-kode SPK-en inneholder, henter sin heliosentriske J2000-posisjon og -hastighet fra. Uavhengig referanse (ExternalDataset): NAIF SPICE Toolkit (CSPICE N0067 gjennom spiceypy { "8.3.0" }) spkezr heliosentriske tilstander på hele de440s.bsp, et separat program som ikke kaller noen Kshana-kode (tests/fixtures/solar_system_kernel/, NOTICE.md); motoren leser de440s-utsnitt bit for bit. Forhåndsregistrert f8e946ea. En bibliotekskontroll av koblingen: DE440 selv og de analytiske legemene er ikke validert her. Resultater: docs/design/evidence/cap31-solar-system-kernel/RE

seg-735fb0bc1705 = <b>VALIDATED</b> Heliosentriske posisjoner for Merkur, Venus, barysenteret Jorden–Månen, Jorden, Mars, Jupiter og Saturn fra Standish tabell { "1" } ({ "1800" } e.Kr. til { "2050" } e.Kr.), og for alle . Uavhengig referanse (ExternalDataset): JPL Horizons DE441 geometriske heliosentriske vektorer (ekliptikk og ICRF), hentet etter at forhåndsregistreringene ble innsjekket { "80451866" }, 8d38a28b og 558cc807. Terskel: per planet og komponent, RMS høyst 1.0x de omtrentlige feilene i Explanatory Supplement 3. utg. tabell { "8.10.1" } (EMB-raden for Jorden); splittingen Jorden–EMB kontrolleres direkte mot DE441 { "399" } minus { "3" }, høyst { "0.3" } deg og { "8.1" } km i hver epoke 1950-2050 (th

seg-ab1192de28f5 = <b>VALIDATED</b> Den newtonske enveis lystiden fra et hvilket som helst legeme til et annet, mottatt ved en epoke, løst med den radiometriske fastpunkts-lystidsløseren (radiometric::light_t. Uavhengig referanse (ExternalDataset): JPL Horizons DE441 enveis newtonsk lystid på nedleggen LT (VEC_CORR=LT, observatør i jordens sentrum), forhåndsregistrert (480037d3, endring 54d5c86f som kun endret avstanden mellom interpolasjonsnodene etter at det første uttaket feilet sin forutsetning om { "10" } m interpolasjonspresisjon, før noen lystid ble sammenlignet) med en terskel på { "1e-6" } s per lystid, løseren matet med barysentriske posisjoner fra DE441 slik at iterasjonen for forsinket sender er synlig

seg-5a2e745828ea = <b>MODELLED</b> Posisjoner for Uranus og Neptun fra Standish tabell { "1" } (standard innenfor { "1800" } e.Kr. til { "2050" } e.Kr.), Pluto fra raden fra { "1992" } i tabell { "1" } som den gjeldende JPL-siden ikke lenger op. Uavhengig referanse (ExternalDataset): målt mot JPL Horizons DE441 (de samme innsjekkede testdataene), men ikke validert: de oppgitte tallene i tabell { "1" } for Uranus og Neptun overskrides med opptil { "2.0" } og { "5.2" } ganger mot heliosentriske posisjoner fra DE441 (Neptun holder dem mot barysentriske posisjoner, noe som antyder at tilpasningen ikke var heliosentrisk), siden oppgir ingen feil for Pluto, og ingen publisert grense finnes for hastighetene. Tabellene 2a/2b holder sine egn

seg-0131b082906b = MIXED: hvert legeme bærer sin egen etikett. Planetposisjoner er VALIDATED mot JPL Horizons innenfor to ganger Standishs nominelle feil (Merkur til Saturn og Jorden fra tabell { "1" }; alle åtte planetene fra tabellene 2a/2b); Uranus og Neptun fra tabell { "1" }, Pluto, Månen og de sju månene er MODELLED. Lystidene er newtonske, fra de samme posisjonene. (resultat <c1/>)

seg-3e24f0bf9ccd = MODELLED, hver rad merket: Uranus og Neptun fra tabell { "1" } ({ "2.0" } og { "5.2" } ganger den nominelle feilen mot DE441), Pluto (raden fra { "1992" }; ingen oppgitt feil), Månen og de sju månene (målt mot Horizons, ingen publisert grense). (typekatalog (<c1/>))

seg-62b2e925233a = HVA SOM ER VALIDATED, OG HVA SOM IKKE ER Hvert legeme bærer sin egen etikett. Merkur til Saturn og Jorden er VALIDATED mot JPL Horizons (Development Ephemeris DE441) innenfor to ganger den nominelle feilen på Standish-siden. Uranus og Neptun fra tabell { "1" } overskrider sidens tall mot DE441 (med { "2.0" } og { "5.2" } ganger) og er MODELLED; det samme er Pluto, Månen og de sju månene, som ble målt mot Horizons men ikke har noen p (kommentar i scenariofilen, linje { "20" } til { "25" })

seg-2b36ac40e457 = Uranus og Neptun fra Standish tabell { "1" }, Pluto og planetenes hastigheter er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-c19e6d035b7e = Posisjoner for Månen og sju store måner (Phobos, Deimos, de galileiske månene, Titan) er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-ce15aaa5453c = Fysiske konstanter for alle legemer i solsystemet og rapporten for hele systemet er MODELLED, ikke validert: kontrollert mot sin egen lukkede eller analytiske identitet, som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-ceadf891b1e2 = <s1>Forrige</s1>slot-timing

seg-0493962a6937 = <s1>Neste</s1>space-packet
