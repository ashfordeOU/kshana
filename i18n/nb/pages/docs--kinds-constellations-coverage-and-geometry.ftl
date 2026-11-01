# docs--kinds-constellations-coverage-and-geometry: translations (nb)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-e7dad1a1ecba = Posisjonsbestemmelse rundt et hvilket som helst legeme i solsystemet: en orbiter eller en landingsfarkost på overflaten rundt et sentrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten av solsystemkatalogen), som navigerer med enveis pseudoavstander fra en liten Walker-navigasjonskonstellasjon rundt legemet (todelslegeme-baner med legemets egen sekulære J2-drift, en ukjent brukerklokke) og eventuelt en klokkefri tovegs dypromsavstand fra jorden, hvis retning og avstand kommer fra den analytiske solsystemefemeriden ved hver epoke. Siktelinjer blokkeres av legemets middelkule, og en overflatebruker trenger også elevasjonsmasken. Per epoke: releer i sikt, om jorden er over limben, GDOP og PDOP for konstellasjonen alene (geometrisk og posisjonsmessig presisjonsfortynning), den formelle énsigma-posisjonsusikkerheten med og uten jordraden, og feilen i en seedet Gauss-Newton minste kvadraters posisjonsbestemmelse begge veier; over kjøringen: tilgjengelighet, jordsikt, median PDOP, RMS-feil og median formell sigma, pluss lystiden fra jorden til legemet, rundturen, Shapiro-forsinkelsen og solseparasjonen ved epoken. MODELLED: relébanene, støynivåene og den øyeblikkelige målemodellen er modelleringsvalg, ikke validert mot et oppdrags navigasjonsdata; legemets konstanter er de publiserte verdiene det vises til i body.rs, og jordgeometrien arver etikettene til solsystemefemeriden.

seg-6f341acbe994 = Diagrammet motoren skriver for scenarios/mars-orbit-pnt.toml, typen body-pnt

seg-de173c9f4034 = Konstellasjonsutforming i stor skala: Walker DELTA- og Walker STAR-mønstre i konvensjonen i: T/P/F (noder spredt over { "360" } eller { "180" } deg, avstand i planet { "360" }<em>P/T, faseforskyvning mellom plan { "360" }</em>F/T), eksplisitte elementlister og design med flere skall, flere konstellasjoner i én kjøring, rundt jorden, Månen, Mars eller en hvilken som helst annen planet, Pluto eller en stor måne med konstantene i body-modulen (de samme som typene solar-system og body-pnt bruker). FORHÅNDSINNSTILLINGER fra publiserte nominelle elementer: gps-baseline og gps-expandable (de { "24" } sporene og de seks forover-/bakover-utvidbare parene i GPS Standard Positioning Service Performance Standard, 5. utgave { "2020" }, tabell 3.2-1 til 3.2-3), galileo (Walker 24/3/1 ved { "29 599.801" } km og { "56" } deg, Galileo Open Service Service Definition Document utgave { "1.1" } tabell { "1" } og { "23" }), beidou og beidou-meo (Walker 24/3/1 ved { "21 528" } km og { "55" } deg pluss tre geostasjonære satellitter ved { "80" }, { "110.5" } og { "140" } deg Ø og tre skråstilte geosynkrone satellitter ved { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } avsnitt { "4.1" }; MEO-fasen og krysningen for skråstilt geosynkron ved { "118" } deg Ø er modellert fordi standarden ikke oppgir dem) og glonass (24/3/1 ved { "19 100" } km og { "64.8" } deg fra sporformelen i GLONASS Interface Control Document utgave { "5.1" } avsnitt { "5.2" }). DEKNING OG PRESISJONSFORTYNNING: over et rutenett av breddegrad/lengdegrad og et samplet vindu med en elevasjonsmaske, antall satellitter i sikt, GDOP, PDOP, HDOP og VDOP per celle, tilgjengeligheten (en posisjonsbestemmelse med PDOP ved eller under en terskel, { "6" } som standard) per celle, globalt (arealvektet) og på det verste stedet, med én mottakerklokke per konstellasjon med mindre clock = "common". Den skalerer til tusenvis av satellitter: synlighet er et skalarprodukt mot hver satellitts dekningshalvvinkel, og satellitter deles i bånd etter breddegraden under satellitten hver epoke, slik at en rutenettrad bare tester de som kan være i sikt; rapporten teller parstestene som er spart. JSON-en inneholder rutenettkartene og nedsamplede bakkespor per satellitt. VALIDATED: Walker-generatoren mot Galileo OS SDD tabell { "23" } og sporformelen i GLONASS ICD, GPS-forhåndsinnstillingen mot den publiserte kolonnen for ekvatorkrysning i SPS PS tabell 3.2-1, og den globale HDOP-fordelingen for GPS-grunnlinjen mot SPS PS vedlegg B (median { "0.94" }, { "95" }% { "1.25" }, gjennomsnitt { "0.96" }, toleranse { "0.03" }). MODELLED: todelslegeme-baner med valgfri sekulær J2, et sfærisk legeme, kun geometrisk synlighet (ingen signaleffekt, helse eller terreng), og den relative fasen mellom ulike systemer, som ikke er et øyeblikksbilde av noen virkelig dato.

seg-899e728ad9bd = Diagrammet motoren skriver for scenarios/leo-pnt-mega-shell.toml, typen constellation-design

seg-24266bc264df = Efemeride og bakkespor: propager én satellitt (TLE→SGP4 eller analytisk bane) og send ut dens TEME/GCRS-tilstand (posisjon + hastighet), ITRF/ECEF-posisjon, WGS-84-subsatellittens bredde/lengde/høyde, og per steg stasjonens az/el/avstand + avstandshastighet (Doppler). Satellitten kommer fra en <c1/> eller fra en analytisk <c2/> med sin <c3/> (en <c4/> vinner når begge er oppgitt); med en <c5/> overstyrer en <c6/> TLE-ens egen epoke som t = { "0" }.

seg-0fd3c58fde09 = Diagrammet motoren skriver for scenarios/ephemeris.toml, typen ephemeris

seg-3f749aef8d89 = PNT for Mars i dypt rom: en simulert MARCONI-relékonstellasjon (areostasjonære + inklinerte releer som sender énveis + videresender toveis til en stasjon i dypt rom) navigerer en referansebruker (transfer | lmo | surface) gjennom den felles estimatoren for énveis/toveis radiometrisk fusjon. Rapporterer geometri/synlighet per epoke, oppnådd RMS mot referansen og den formelle kovariansen (1σ / 3σ posisjon) — et ærlig simulert kvalitetsmål, IKKE et sertifisert beskyttelsesnivå.

seg-c564dca90854 = Diagrammet motoren skriver for scenarios/mars-pnt-lmo.toml, type mars-pnt

seg-cb4262b66b8f = GNSS-tilgjengelighet og DOP fra en banekonstellasjon (Walker / TLE / RINEX).

seg-3b652c0da6de = Diagrammet motoren skriver for scenarios/orbit-rinex.toml, type orbit

seg-a4bdfc291fce = Prediksjon av passeringer over en bakkestasjon: synlighetspasseringene i tidsdomenet (AOS/TCA/LOS, maksimal tilsynelatende elevasjon, varighet) for en sirkulær bane, som SGP4-middelelementer ved vinduets start, over en stasjon over en elevasjonsmaske i et vindu, med samlet tilgangstid. SGP4/SDP4-propagering i det jordfaste referansesystemet IAU 2006/2000A (valgfri UT1 - UTC og polbevegelse), troposfærisk refraksjon etter ITU-R P.834-9 og lystiden for nedlenken (begge på som standard), kryssinger løst til { "1e-7" } s og kulminasjonen med gyllent snitt-søk. Passeringsgeometrien er VALIDATED mot Orekit { "13.1.8" } ved stasjoner på havnivå; scenarioets bane og stasjon er illustrative inndata.

seg-a09be8c586e3 = Diagrammet motoren skriver for scenarios/passes.toml, type passes

seg-0549bc926a9b = Hele solsystemet ved én epoke, for PNT (posisjonering, navigasjon og tidssynkronisering) rundt et hvilket som helst legeme. For Solen, de åtte planetene, Pluto, Månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan rapporterer den heliosentrisk posisjon og hastighet i ICRF (International Celestial Reference Frame, ekvatorial J2000), heliosentrisk avstand og ekliptisk lengde- og breddegrad i J2000, gravitasjonsparameteren, ekvatorial og middels radius, J2 der den er publisert og dens referanseradius, den siderale rotasjonsperioden, IAU-polen og nullmeridianen ved epoken, et banespor samplet over én omløpstid (heliosentrisk for planeter, sentrert på moderlegemet for måner), og lystiden, enveis og toveis avstand, Shapiro-forsinkelsen fra Solen og separasjonen fra Solen sett fra et observatørlegeme (standard Jorden); ekstra lenker fra/til får samme behandling. Posisjoner: JPL Kepler-elementene til Standish og Williams (tabell { "1" } for { "1800" } e.Kr. til { "2050" } e.Kr., tabellene 2a/2b for { "3000" } f.Kr. til { "3000" } e.Kr.) med hver planets nominelle feil, Montenbruck & Gills måneserie for oppdelingen Jorden–Månen, JPL-middelelementer med IAUs synkrone rotasjonshastighet for Mars-månene og de galileiske månene, og IAUs rotasjonsmodell for Titan. Lystid: radiometrisk fastpunktsløsning, sender ved sin forsinkede posisjon; newtonsk, med Shapiro-forsinkelsen rapportert separat. VALIDATED mot JPL Horizons (DE441) innenfor to ganger den nominelle feilen: Merkur til Saturn og Jorden fra tabell { "1" } (verst { "1.87" } ganger nominell) og alle åtte planetene fra tabellene 2a/2b (verst { "1.71" } ganger), og lystiden fra Jorden til Mars og Jupiter. MODELLED, hver rad merket: Uranus og Neptun fra tabell { "1" } ({ "2.0" } og { "5.2" } ganger den nominelle feilen mot DE441), Pluto (raden fra { "1992" }; ingen oppgitt feil), Månen og de sju månene (målt mot Horizons, ingen publisert grense).

seg-537aa8010e50 = Diagrammet motoren skriver for scenarios/solar-system-tour.toml, type solar-system

seg-4e31c8daf798 = Register

seg-44bbec836934 = Kilde: <c1/>

seg-34a6079984a7 = Konstellasjoner, dekning og geometri (scenariotypefamilie)

seg-6800289a282d = { "7" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-d95cc2c1e798 = Temasider: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Kjør én: <c1/>. Alle familier: <a5>KINDS.md</a5>.

seg-f044822c2fab = Kontaktark over diagrammene motoren skriver for typene i familien Konstellasjoner, dekning og geometri

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-e2450f89bcc6 = Efemeride og bakkespor: propager én satellitt (TLE→SGP4 eller analytisk bane) og gi ut tilstanden i TEME/GCRS (posisjon + hastighet), ITRF/ECEF-posisjon, WGS-84 subsatellittbreddegrad/lengdegrad/høyde og per steg st

seg-d021c1b23dbc = Konstellasjonsutforming i stor skala: Walker DELTA- og Walker STAR-mønstre i i: T/P/F-konvensjonen (noder fordelt over { "360" } eller { "180" } grader, avstand i planet { "360" }<em>P/T, faseforskyvning mellom plan { "360" }</em>F/T), eksplisitt

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-f6914ea43dba = Hele solsystemet ved én epoke, for PNT (posisjonering, navigasjon og tidssynkronisering) rundt et hvilket som helst legeme.

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-d71a07d8a59e = Posisjonsbestemmelse rundt et hvilket som helst legeme i solsystemet: en orbiter eller en overflatelander rundt et sentrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten av solsystemkatalogen), navi

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-f6b22521b4a4 = PNT for Mars i dypt rom: en simulert MARCONI-relékonstellasjon (areostasjonære + skråstilte reléer som sender enveis + videresender toveis til en dypromsstasjon) navigerer en referansebruker (overføring / l

seg-cc85d9962c25 = Prediksjon av overflyginger for en bakkestasjon: synlighetsovergangene i tidsdomenet (AOS/TCA/LOS, maksimal tilsynelatende elevasjon, varighet) for en sirkulær bane, som SGP4-middelelementer ved vindusstart, over en stasjon abo

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-a7bd3325080c = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Valgfrie: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-5e8a5e611ba9 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>orbit</a1>.

seg-968c1512151e = Obligatoriske felt: <c1/>. Valgfrie: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-8c5e41cef6fd = <b>Register:</b> VALIDATED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>ephemeris</a1>.

seg-47aaf1afd6ec = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-bacf2a133146 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>constellation-design</a1>.

seg-e99c2a83034e = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-d91ded1df3a2 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "3" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>solar-system</a1>.

seg-fe02605b130e = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-12bc4b4b4631 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>body-pnt</a1>.

seg-bee590b4c9e7 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-c0394ad71cfe = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>mars-pnt</a1>.

seg-352823f8c5ac = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-bb4fa18e50a6 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "2" }. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>passes</a1>.

seg-490ec99e2a38 = <s1>Forrige</s1>Klokker, tidssynkronisering og holdover

seg-90ff7426b999 = <s1>Neste</s1>GNSS-målinger, posisjonsbestemmelse og integritet
