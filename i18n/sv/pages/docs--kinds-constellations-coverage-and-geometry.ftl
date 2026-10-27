# docs--kinds-constellations-coverage-and-geometry: translations (sv)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Typ

seg-e7dad1a1ecba = Positionering kring valfri himlakropp i solsystemet: en omloppsfarkost eller en ytlandare kring en centralkropp som väljs med namn (Mars, Månen, Europa, Ganymedes, Titan och resten av solsystemskatalogen), som navigerar med enkelriktade pseudoavstånd från en liten Walker-navigationskonstellation kring kroppen (tvåkroppsbanor med kroppens egen sekulära J2-drift, en okänd användarklocka) och eventuellt ett klockfritt tvåvägsavstånd i djuprymden från jorden, vars riktning och avstånd kommer från den analytiska solsystemsefemeriden vid varje epok. Siktlinjer blockeras av kroppens medelsfär, och en ytanvändare behöver dessutom elevationsmasken. Per epok: reläer i sikte, om jorden är ovanför limben, GDOP och PDOP enbart för konstellationen (geometrisk dilution och positionsdilution av precision), den formella osäkerheten i position på en sigma med och utan jordraden, samt felet i en seedad positionsbestämning med Gauss-Newton minsta kvadrat åt båda hållen; över körningen: tillgänglighet, jordsynlighet, median-PDOP, RMS-fel och formell mediansigma, plus ljustiden jorden–kroppen, tur och retur, Shapiro-fördröjningen och solseparationen vid epoken. MODELLED: reläbanorna, brusnivåerna och den ögonblickliga mätmodellen är modellval, inte validerade mot ett uppdrags navigationsdata; kroppskonstanterna är de publicerade värdena som anges i body.rs, och jordgeometrin ärver etiketterna från solsystemsefemeriden.

seg-6f341acbe994 = Diagrammet som motorn skriver för scenarios/mars-orbit-pnt.toml, typ body-pnt

seg-de173c9f4034 = Konstellationsutformning i stor skala: Walker DELTA- och Walker STAR-mönster i konventionen i: T/P/F (noder utspridda över { "360" } eller { "180" } deg, avstånd i planet { "360" }<em>P/T, fasförskjutning mellan plan { "360" }</em>F/T), explicita elementlistor och utformningar med flera skal, flera konstellationer i en körning, kring jorden, Månen, Mars eller valfri annan planet, Pluto eller större måne med konstanterna i modulen body (samma som typerna solar-system och body-pnt använder). FÖRINSTÄLLNINGAR från publicerade nominella element: gps-baseline och gps-expandable (de { "24" } platserna och de sex expanderbara paren fram/akter i GPS Standard Positioning Service Performance Standard, 5:e utgåvan { "2020" }, tabellerna 3.2-1 till 3.2-3), galileo (Walker 24/3/1 vid { "29 599.801" } km och { "56" } deg, Galileo Open Service Service Definition Document utgåva { "1.1" } tabellerna { "1" } och { "23" }), beidou och beidou-meo (Walker 24/3/1 vid { "21 528" } km och { "55" } deg plus tre geostationära satelliter vid { "80" }, { "110.5" } och { "140" } deg E och tre lutande geosynkrona satelliter vid { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } avsnitt { "4.1" }; MEO-fasen och den lutande geosynkrona korsningen vid { "118" } deg E är modellerade eftersom standarden inte anger dem) och glonass (24/3/1 vid { "19 100" } km och { "64.8" } deg från platsformeln i GLONASS Interface Control Document utgåva { "5.1" } avsnitt { "5.2" }). TÄCKNING OCH DILUTION OF PRECISION: över ett rutnät av latitud/longitud och ett samplat fönster med en elevationsmask, antalet satelliter i sikte, GDOP, PDOP, HDOP och VDOP per cell, tillgängligheten (en positionsbestämning med PDOP vid eller under ett tröskelvärde, { "6" } som standard) per cell, globalt (areaviktat) och på den sämsta platsen, med en mottagarklocka per konstellation om inte clock = "common". Den skalar till tusentals satelliter: synlighet är en skalärprodukt mot varje satellits täckningshalvvinkel, och satelliterna delas in i band efter sub-satellitlatitud vid varje epok så att en rutnätsrad bara testar dem som kan vara i sikte; rapporten räknar de parprov som sparats. JSON innehåller rutnätskartorna och nedsamplade markspår per satellit. VALIDATED: Walker-generatorn mot Galileo OS SDD tabell { "23" } och GLONASS ICD:s platsformel, GPS-förinställningen mot den publicerade kolumnen för ekvatorskorsning i SPS PS tabell 3.2-1, och den globala HDOP-fördelningen för GPS-baslinjen mot SPS PS bilaga B (median { "0.94" }, { "95" }% { "1.25" }, medelvärde { "0.96" }, tolerans { "0.03" }). MODELLED: tvåkroppsbanor med valfri sekulär J2, en sfärisk kropp, enbart geometrisk synlighet (ingen signaleffekt, hälsostatus eller terräng), och den relativa fasen mellan olika system, som inte är en ögonblicksbild av något verkligt datum.

seg-899e728ad9bd = Diagrammet som motorn skriver för scenarios/leo-pnt-mega-shell.toml, typ constellation-design

seg-24266bc264df = Efemerid och markspår: propagera en satellit (TLE→SGP4 eller analytisk bana) och ge dess TEME/GCRS-tillstånd (position + hastighet), ITRF/ECEF-position, WGS-84 sub-satellitens lat/lon/höjd samt stationens az/el/avstånd + avståndshastighet (Doppler) per steg. Satelliten kommer från en <c1/> eller från en analytisk <c2/> med dess <c3/> (en <c4/> har företräde när båda anges); med en <c5/> åsidosätter en <c6/> TLE:ns egen epok som t = { "0" }.

seg-0fd3c58fde09 = Diagrammet som motorn skriver för scenarios/ephemeris.toml, kind ephemeris

seg-3f749aef8d89 = PNT i djupa rymden vid Mars: en simulerad MARCONI-relästjärnbild (areostationära + inklinerade reläer som sänder enkelriktat + vidarebefordrar tvåvägs till en djuprymdsstation) navigerar en referensanvändare (transfer | lmo | surface) genom den gemensamma radiometriska fusionsestimatorn för enkelriktat/tvåvägs. Redovisar geometri/sikt per epok, uppnådd RMS mot referens och den formella kovariansen (1σ / 3σ position) — ett ärligt simulerat kvalitetsmått, INTE en certifierad skyddsnivå.

seg-c564dca90854 = Diagrammet som motorn skriver för scenarios/mars-pnt-lmo.toml, typ mars-pnt

seg-cb4262b66b8f = GNSS-tillgänglighet + DOP från en konstellation i omloppsbana (Walker / TLE / RINEX).

seg-3b652c0da6de = Diagrammet som motorn skriver för scenarios/orbit-rinex.toml, typ orbit

seg-a4bdfc291fce = Prediktion av passager över en markstation: passagerna med sikt i tidsdomänen (AOS/TCA/LOS, maximal skenbar elevation, varaktighet) för en cirkulär bana, som SGP4-medelelement vid fönstrets start, över en station ovanför en elevationsmask under ett fönster, med total åtkomsttid. SGP4/SDP4-propagering i det jordfasta systemet IAU 2006/2000A (valfritt UT1 - UTC och polrörelse), troposfärisk refraktion enligt ITU-R P.834-9 och nedlänkens ljustid (båda på som standard), korsningar lösta till { "1e-7" } s och kulminationen med gyllene snittet-sökning. Passagegeometrin är VALIDATED mot Orekit { "13.1.8" } vid stationer på havsnivå; scenariots bana och station är illustrativa indata.

seg-a09be8c586e3 = Diagrammet som motorn skriver för scenarios/passes.toml, typ passes

seg-0549bc926a9b = Hela solsystemet vid en epok, för PNT (positionering, navigering och tidssynkronisering) kring vilken kropp som helst. För solen, de åtta planeterna, Pluto, månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto och Titan redovisas den heliocentriska positionen och hastigheten i ICRF (International Celestial Reference Frame, ekvatoriellt J2000), det heliocentriska avståndet och den ekliptiska longituden och latituden i J2000, gravitationsparametern, ekvatorial- och medelradien, J2 där den är publicerad och dess referensradie, den sideriska rotationsperioden, IAU-polen och nollmeridianen vid epoken, ett banspår samplat över ett varv (heliocentriskt för planeter, moderkroppscentrerat för månar), samt ljustiden, enkelriktat och tvåvägs avstånd, solens Shapiro-fördröjning och solavstånd från en observatörskropp (standard jorden); extra från/till-länkar får samma behandling. Positioner: JPL:s Kepler-element av Standish och Williams (tabell { "1" } för { "1800" } e.Kr. till { "2050" } e.Kr., tabellerna 2a/2b för { "3000" } f.Kr. till { "3000" } e.Kr.) med varje planets nominella fel, Montenbruck & Gills lunara serie för uppdelningen jord-måne, JPL:s medelelement med IAU:s synkrona rotationstakt för Mars- och Galileimånarna, och IAU:s rotationsmodell för Titan. Ljustid: den radiometriska fixpunktslösningen, sändaren vid sin fördröjda position; newtonsk, med Shapiro-fördröjningen redovisad separat. VALIDATED mot JPL Horizons (DE441) inom två gånger det nominella felet: Merkurius till Saturnus och jorden från tabell { "1" } (sämst { "1.87" } gånger nominellt) och alla åtta planeterna från tabellerna 2a/2b (sämst { "1.71" } gånger), samt ljustiden från jorden till Mars och Jupiter. MODELLED, varje rad märkt: Uranus och Neptunus från tabell { "1" } ({ "2.0" } och { "5.2" } gånger det nominella felet mot DE441), Pluto (raden från { "1992" }; inget angivet fel), månen och de sju månarna (uppmätta mot Horizons, ingen publicerad gräns).

seg-537aa8010e50 = Diagrammet som motorn skriver för scenarios/solar-system-tour.toml, typ solar-system

seg-4e31c8daf798 = Register

seg-44bbec836934 = Källa: <c1/>

seg-34a6079984a7 = Konstellationer, täckning och geometri (familj av scenariotyper)

seg-6800289a282d = { "7" } scenariotyper i motorn v{ $version }. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen anger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-d95cc2c1e798 = Ämnessidor: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Kör en: <c1/>. Alla familjer: <a5>KINDS.md</a5>.

seg-f044822c2fab = Kontaktark med diagrammen som motorn skriver för typerna i familjen Konstellationer, täckning och geometri

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-e2450f89bcc6 = Efemerid och markspår: propagera en satellit (TLE→SGP4 eller analytisk bana) och ge dess TEME/GCRS-tillstånd (position + hastighet), ITRF/ECEF-position, WGS-84-subsatellitens lat/lon/höjd, och per steg

seg-d021c1b23dbc = Konstellationsdesign i stor skala: Walker DELTA- och Walker STAR-mönster i konventionen i: T/P/F (noder fördelade över { "360" } eller { "180" } grader, avstånd i planet { "360" }<em>P/T, fasförskjutning mellan plan { "360" }</em>F/T), explicit

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-f6914ea43dba = Hela solsystemet vid en epok, för PNT (positionering, navigering och tidssynkronisering) kring vilken kropp som helst.

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-d71a07d8a59e = Positionsbestämning kring vilken solsystemskropp som helst: en omloppsbana eller en landare på ytan kring en centralkropp vald med namn (Mars, månen, Europa, Ganymedes, Titan och resten av solsystemskatalogen), navi

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-f6b22521b4a4 = PNT i djuprymden vid Mars: en simulerad MARCONI-relästjärnbild (areostationära + lutande relän som sänder envägs + vidarebefordrar tvåvägs till en djuprymdsstation) navigerar en referensanvändare (transfer / l

seg-cc85d9962c25 = Passprediktion för markstationer: de tidsdomänbaserade synlighetspassen (AOS/TCA/LOS, maximal skenbar elevation, varaktighet) för en cirkulär bana, som SGP4-medelelement vid fönstrets början, över en station ovan

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-a7bd3325080c = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Valfria: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-5e8a5e611ba9 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>orbit</a1>.

seg-968c1512151e = Obligatoriska fält: <c1/>. Valfria: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-8c5e41cef6fd = <b>Register:</b> VALIDATED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>ephemeris</a1>.

seg-47aaf1afd6ec = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-bacf2a133146 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>constellation-design</a1>.

seg-e99c2a83034e = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-d91ded1df3a2 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "3" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>solar-system</a1>.

seg-fe02605b130e = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-12bc4b4b4631 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>body-pnt</a1>.

seg-bee590b4c9e7 = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-c0394ad71cfe = <b>Register:</b> MODELLED. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>mars-pnt</a1>.

seg-352823f8c5ac = Obligatoriska fält: inga. Valfria: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-bb4fa18e50a6 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "2" }. Hela sidan, med indata, resultat, evidens och begränsningar: <a1>passes</a1>.

seg-490ec99e2a38 = <s1>Föregående</s1>Klockor tidssynkronisering och holdover

seg-90ff7426b999 = <s1>Nästa</s1>GNSS-mätningar positionsbestämning och integritet
