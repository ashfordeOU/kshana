# docs--kinds-constellations-coverage-and-geometry: translations (da)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-e7dad1a1ecba = Positionsbestemmelse omkring ethvert legeme i solsystemet: en orbiter eller en lander på overfladen omkring et centrallegeme valgt ved navn (Mars, Månen, Europa, Ganymedes, Titan og resten af solsystemets katalog), der navigerer med envejs-pseudoafstande fra en lille Walker-navigationskonstellation omkring legemet (tolegemebaner med legemets egen sekulære J2-drift, et ukendt brugerur) og eventuelt en urfri tovejs dybrumsafstand fra Jorden, hvis retning og afstand ved hvert epoke kommer fra den analytiske efemeride for solsystemet. Sigtelinjer spærres af legemets middelkugle, og en bruger på overfladen har også brug for elevationsmasken. Pr. epoke: relæer i sigte, om Jorden er over randen, kun-konstellationens GDOP og PDOP (geometrisk og positionel præcisionsudvanding), den formelle usikkerhed på positionen (én sigma) med og uden Jord-rækken og fejlen på en seedet positionsbestemmelse med mindste kvadraters Gauss-Newton begge veje; over kørslen: tilgængelighed, synlighed af Jorden, median-PDOP, RMS-fejl og median af den formelle sigma, plus lystiden fra Jorden til legemet, rundturen, Shapiro-forsinkelsen og solseparationen ved epoken. MODELLED: relæbanerne, støjniveauerne og den øjeblikkelige målemodel er modelvalg, ikke valideret mod en missions navigationsdata; legemets konstanter er de publicerede værdier, der er angivet i body.rs, og Jord-geometrien arver mærkaterne fra solsystemets efemeride.

seg-6f341acbe994 = Diagrammet, som motoren skriver for scenarios/mars-orbit-pnt.toml, type body-pnt

seg-24266bc264df = Efemeride og jordspor: propager én satellit (TLE→SGP4 eller analytisk bane) og udsend dens TEME/GCRS-tilstand (position + hastighed), ITRF/ECEF-position, WGS-84-subsatellitbredde/-længde/-højde og pr. skridt stationens az/el/afstand + afstandsrate (Doppler). Satellitten kommer fra en <c1/> eller fra en analytisk <c2/> med dens <c3/> (en <c4/> vinder, når begge er angivet); med en <c5/> tilsidesætter en <c6/> TLE'ens egen epoke som t = { "0" }.

seg-0fd3c58fde09 = Diagrammet, som motoren skriver for scenarios/ephemeris.toml, scenarietype ephemeris

seg-cb4262b66b8f = GNSS-tilgængelighed + DOP fra en konstellation i kredsløb (Walker / TLE / RINEX).

seg-3b652c0da6de = Diagrammet, som motoren skriver for scenarios/orbit-rinex.toml, type orbit

seg-a4bdfc291fce = Forudsigelse af overflyv for jordstationer: de tidsdomæne-baserede synlighedsoverflyv (AOS/TCA/LOS, maksimal tilsyneladende elevation, varighed) for en cirkulær bane, som SGP4-middelelementer ved vinduets start, over en station over en elevationsmaske på tværs af et vindue, med den samlede adgangstid. SGP4/SDP4-propagering i det jordfaste system IAU 2006/2000A (valgfri UT1 - UTC og polbevægelse), troposfærisk refraktion efter ITU-R P.834-9 og lystiden for downlink (begge slået til som standard), krydsninger løst til { "1e-7" } s og kulminationen ved gyldensnitssøgning. Overflyvsgeometrien er VALIDATED mod Orekit { "13.1.8" } ved stationer i havets niveau; scenariets bane og station er illustrative input.

seg-a09be8c586e3 = Diagrammet, som motoren skriver for scenarios/passes.toml, type passes
