# docs--kinds-constellations-coverage-and-geometry: translations (da)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-e7dad1a1ecba = Positionsbestemmelse omkring ethvert legeme i solsystemet: en orbiter eller en lander på overfladen omkring et centrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten af solsystemets katalog), der navigerer med envejs-pseudoafstande fra en lille Walker-navigationskonstellation omkring legemet (tolegemebaner med legemets egen sekulære J2-drift, et ukendt brugerur) og eventuelt en urfri tovejs dybrumsafstand fra Jorden, hvis retning og afstand ved hvert epoke kommer fra den analytiske efemeride for solsystemet. Sigtelinjer spærres af legemets middelkugle, og en bruger på overfladen har også brug for elevationsmasken. Pr. epoke: relæer i sigte, om Jorden er over randen, kun-konstellationens GDOP og PDOP (geometrisk og positionel præcisionsudvanding), den formelle usikkerhed på positionen (én sigma) med og uden Jord-rækken og fejlen på en seedet positionsbestemmelse med mindste kvadraters Gauss-Newton begge veje; over kørslen: tilgængelighed, synlighed af Jorden, median-PDOP, RMS-fejl og median af den formelle sigma, plus lystiden fra Jorden til legemet, rundturen, Shapiro-forsinkelsen og solseparationen ved epoken. MODELLED: relæbanerne, støjniveauerne og den øjeblikkelige målemodel er modelvalg, ikke valideret mod en missions navigationsdata; legemets konstanter er de publicerede værdier, der er angivet i body.rs, og Jord-geometrien arver mærkaterne fra solsystemets efemeride.

seg-6f341acbe994 = Diagrammet, som motoren skriver for scenarios/mars-orbit-pnt.toml, type body-pnt

seg-de173c9f4034 = Konstellationsdesign i stor skala: Walker DELTA- og Walker STAR-mønstre i konventionen i: T/P/F (knuder fordelt over { "360" } eller { "180" } deg, afstand i planet { "360" }<em>P/T, faseforskydning mellem planer { "360" }</em>F/T), eksplicitte elementlister og designs med flere skaller, flere konstellationer i én kørsel, omkring Jorden, Månen, Mars eller enhver anden planet, Pluto eller større måne med konstanterne i body-modulet (de samme, som solsystem- og body-pnt-typerne bruger). FORUDINDSTILLINGER ud fra publicerede nominelle elementer: gps-baseline og gps-expandable (de { "24" } pladser og de seks forreste/bageste udvidelsespar i GPS Standard Positioning Service Performance Standard, 5th edition { "2020" }, Tables 3.2-1 til 3.2-3), galileo (Walker 24/3/1 ved { "29 599.801" } km og { "56" } deg, Galileo Open Service Service Definition Document issue { "1.1" } Tables { "1" } og { "23" }), beidou og beidou-meo (Walker 24/3/1 ved { "21 528" } km og { "55" } deg plus tre geostationære satellitter ved { "80" }, { "110.5" } og { "140" } deg E og tre skrå geosynkrone satellitter ved { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } section { "4.1" }; MEO-fasen og den skrå geosynkrone krydsning ved { "118" } deg E er modelleret, fordi standarden ikke angiver dem) og glonass (24/3/1 ved { "19 100" } km og { "64.8" } deg ud fra slotformlen i GLONASS Interface Control Document edition { "5.1" } section { "5.2" }). DÆKNING OG PRÆCISIONSUDVANDING: over et breddegrads-/længdegradsgitter og et samplet vindue med en elevationsmaske, antal satellitter i sigte, GDOP, PDOP, HDOP og VDOP pr. celle, tilgængeligheden (en positionsbestemmelse med PDOP ved eller under en tærskel, { "6" } som standard) pr. celle, globalt (arealvægtet) og på det værste sted, med ét modtagerur pr. konstellation, medmindre clock = "common". Den skalerer til tusindvis af satellitter: synlighed er et skalarprodukt mod hver satellits halve dækningsvinkel, og satellitter opdeles i bånd efter sub-satellitbredde hver epoke, så en gitterrække kun afprøver dem, der kan være i sigte; rapporten tæller de sparede par-tests. JSON'en indeholder gitterkortene og nedsamplede jordspor pr. satellit. VALIDATED: Walker-generatoren mod Galileo OS SDD Table { "23" } og GLONASS ICD's slotformel, GPS-forudindstillingen mod den publicerede kolonne for ækvatorkrydsning i SPS PS Table 3.2-1, og den globale HDOP-fordeling for GPS-baseline mod SPS PS Appendix B (median { "0.94" }, { "95" }% { "1.25" }, middel { "0.96" }, tolerance { "0.03" }). MODELLED: tolegemebaner med valgfri sekulær J2, et kugleformet legeme, kun geometrisk synlighed (ingen signaleffekt, tilstand eller terræn), og den relative fase mellem forskellige systemer, som ikke er et øjebliksbillede af nogen reel dato.

seg-899e728ad9bd = Diagrammet, som motoren skriver for scenarios/leo-pnt-mega-shell.toml, type constellation-design

seg-24266bc264df = Efemeride og jordspor: propager én satellit (TLE→SGP4 eller analytisk bane) og udsend dens TEME/GCRS-tilstand (position + hastighed), ITRF/ECEF-position, WGS-84-subsatellitbredde/-længde/-højde og pr. skridt stationens az/el/afstand + afstandsrate (Doppler). Satellitten kommer fra en <c1/> eller fra en analytisk <c2/> med dens <c3/> (en <c4/> vinder, når begge er angivet); med en <c5/> tilsidesætter en <c6/> TLE'ens egen epoke som t = { "0" }.

seg-0fd3c58fde09 = Diagrammet, som motoren skriver for scenarios/ephemeris.toml, scenarietype ephemeris

seg-3f749aef8d89 = PNT til Mars i dybt rum: en simuleret MARCONI-relækonstellation (areostationære + skrå relæer, der udsender enkeltvejs + videresender tovejs til en station i dybt rum) navigerer en referencebruger (transfer | lmo | surface) gennem den fælles estimator med fusion af enkeltvejs/tovejs radiometri. Rapporterer geometri/synlighed pr. epoke, opnået RMS mod referencen og den formelle kovarians (1σ / 3σ position) — et ærligt simuleret kvalitetsmål, IKKE et certificeret beskyttelsesniveau.

seg-c564dca90854 = Diagrammet, som motoren skriver for scenarios/mars-pnt-lmo.toml, type mars-pnt

seg-cb4262b66b8f = GNSS-tilgængelighed + DOP fra en konstellation i kredsløb (Walker / TLE / RINEX).

seg-3b652c0da6de = Diagrammet, som motoren skriver for scenarios/orbit-rinex.toml, type orbit

seg-a4bdfc291fce = Forudsigelse af overflyv for jordstationer: de tidsdomæne-baserede synlighedsoverflyv (AOS/TCA/LOS, maksimal tilsyneladende elevation, varighed) for en cirkulær bane, som SGP4-middelelementer ved vinduets start, over en station over en elevationsmaske på tværs af et vindue, med den samlede adgangstid. SGP4/SDP4-propagering i det jordfaste system IAU 2006/2000A (valgfri UT1 - UTC og polbevægelse), troposfærisk refraktion efter ITU-R P.834-9 og lystiden for downlink (begge slået til som standard), krydsninger løst til { "1e-7" } s og kulminationen ved gyldensnitssøgning. Overflyvsgeometrien er VALIDATED mod Orekit { "13.1.8" } ved stationer i havets niveau; scenariets bane og station er illustrative input.

seg-a09be8c586e3 = Diagrammet, som motoren skriver for scenarios/passes.toml, type passes

seg-0549bc926a9b = Hele solsystemet ved én epoke, til PNT (positionering, navigation og tidssynkronisering) omkring et vilkårligt legeme. For Solen, de otte planeter, Pluto, Månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan rapporterer den den heliocentriske position og hastighed i ICRF (International Celestial Reference Frame, ækvatorial J2000), den heliocentriske afstand og den ekliptikale længde og bredde i J2000, gravitationsparameteren, ækvatorial og middelradius, J2 hvor den er offentliggjort og dens referenceradius, den sideriske rotationsperiode, IAU-polen og begyndelsesmeridianen ved epoken, et banespor samplet over ét omløb (heliocentrisk for planeter, moderlegemecentreret for måner) og lystiden, envejs- og tovejsafstanden, Shapiro-forsinkelsen fra Solen og afstanden til Solen fra et observatørlegeme (standard Jorden); ekstra forbindelser fra/til får den samme behandling. Positioner: JPL's Kepler-elementer fra Standish og Williams (Table { "1" } for { "1800" } AD til { "2050" } AD, Tables 2a/2b for { "3000" } BC til { "3000" } AD) med hver planets nominelle fejl, månens række fra Montenbruck & Gill til opdelingen af Jord og Måne, JPL's middelelementer med IAU's synkrone rotationshastighed for Mars' og Jupiters galileiske måner og IAU's rotationsmodel for Titan. Lystid: den radiometriske fikspunktsløsning, senderen ved dens forsinkede position; newtonsk, med Shapiro-forsinkelsen rapporteret separat. VALIDATED mod JPL Horizons (DE441) inden for det dobbelte af den nominelle fejl: Merkur til Saturn og Jorden fra Table { "1" } (værst { "1.87" } gange nominel) og alle otte planeter fra Tables 2a/2b (værst { "1.71" } gange), og lystiden fra Jorden til Mars og Jupiter. MODELLED, hver række mærket: Uranus og Neptun fra Table { "1" } ({ "2.0" } og { "5.2" } gange den nominelle fejl mod DE441), Pluto (rækken fra { "1992" }; ingen angiven fejl), Månen og de syv måner (målt mod Horizons, ingen offentliggjort grænse).

seg-537aa8010e50 = Diagrammet, som motoren skriver for scenarios/solar-system-tour.toml, type solar-system

seg-4e31c8daf798 = Register

seg-44bbec836934 = Kilde: <c1/>

seg-34a6079984a7 = Konstellationer, dækning og geometri (scenarietypefamilie)

seg-6800289a282d = { "7" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-d95cc2c1e798 = Emnesider: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Kør én: <c1/>. Alle familier: <a5>KINDS.md</a5>.

seg-f044822c2fab = Kontaktark med de diagrammer, som motoren skriver for typerne i familien Konstellationer, dækning og geometri

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-e2450f89bcc6 = Efemeride og jordspor: propager én satellit (TLE→SGP4 eller analytisk bane) og udsend dens TEME/GCRS-tilstand (position + hastighed), ITRF/ECEF-position, WGS-84-undersatellitbreddegrad/-længdegrad/-højde og pr. trin

seg-d021c1b23dbc = Konstellationsudformning i stor skala: Walker DELTA- og Walker STAR-mønstre i i: T/P/F-konventionen (knuder spredt over { "360" } eller { "180" } deg, spacing i planet { "360" }<em>P/T, faseforskydning mellem planer { "360" }</em>F/T), eksplicit

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-f6914ea43dba = Hele solsystemet ved én epoke, til PNT (positionering, navigation og tidssynkronisering) omkring ethvert legeme.

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-d71a07d8a59e = Positionering omkring ethvert legeme i solsystemet: en orbiter eller en landingsfarkost på overfladen omkring et centrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten af solsystemkataloget), navi

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-f6b22521b4a4 = PNT i det dybe rum ved Mars: en simuleret MARCONI-relækonstellation (areostationære + skrå relæer, der udsender envejs + relayerer tovejs til en dybrumsstation) navigerer en referencebruger (transfer / l

seg-cc85d9962c25 = Forudsigelse af passager over jordstation: de tidsdomæne-baserede synlighedspassager (AOS/TCA/LOS, maksimal tilsyneladende elevation, varighed) for en cirkulær bane, som SGP4-middelelementer ved vinduets start, over en station ove

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-a7bd3325080c = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Valgfrie: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-5e8a5e611ba9 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>orbit</a1>.

seg-968c1512151e = Obligatoriske felter: <c1/>. Valgfrie: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-8c5e41cef6fd = <b>Register:</b> VALIDATED. Fuld side med input, resultater, evidens og begrænsninger: <a1>ephemeris</a1>.

seg-47aaf1afd6ec = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-bacf2a133146 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>constellation-design</a1>.

seg-e99c2a83034e = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-d91ded1df3a2 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "3" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>solar-system</a1>.

seg-fe02605b130e = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-12bc4b4b4631 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>body-pnt</a1>.

seg-bee590b4c9e7 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-c0394ad71cfe = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>mars-pnt</a1>.

seg-352823f8c5ac = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-bb4fa18e50a6 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "2" }. Fuld side med input, resultater, evidens og begrænsninger: <a1>passes</a1>.

seg-490ec99e2a38 = <s1>Forrige</s1>Ure tidssynkronisering og holdover

seg-90ff7426b999 = <s1>Næste</s1>GNSS-målinger positionering og integritet
