# docs--kinds-constellations-coverage-and-geometry: translations (nl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-e7dad1a1ecba = Positiebepaling rond elk lichaam in het zonnestelsel: een orbiter of een lander op het oppervlak rond een centraal lichaam dat bij naam wordt gekozen (Mars, de Maan, Europa, Ganymedes, Titan en de rest van de zonnestelselcatalogus), die navigeert met eenweg-pseudoafstanden van een kleine Walker-navigatieconstellatie rond het lichaam (tweelichamenbanen met de eigen seculaire J2-drift van het lichaam, een onbekende gebruikersklok) en optioneel met een klokvrije deep-space-tweewegafstand vanaf de Aarde, waarvan richting en afstand bij elk tijdstip uit de analytische zonnestelselefemeride komen. Zichtlijnen worden geblokkeerd door de gemiddelde bol van het lichaam, en een gebruiker op het oppervlak heeft ook het elevatiemasker nodig. Per tijdstip: relays in zicht, of de Aarde boven de rand staat, de GDOP en PDOP met alleen de constellatie (geometrische en positionele verdunning van precisie), de formele positieonzekerheid van één sigma met en zonder de Aarderij, en de fout van een geseede Gauss-Newton-kleinstekwadratenpositiebepaling in beide gevallen; over de run: beschikbaarheid, zichtbaarheid van de Aarde, mediane PDOP, RMS-fout en mediane formele sigma, plus de lichttijd Aarde-lichaam, de heen-en-terugreis, de Shapiro-vertraging en de Zonshoek op dat tijdstip. MODELLED: de relaybanen, de ruisniveaus en het instantane meetmodel zijn modelleringskeuzes, niet extern getoetst aan de navigatiedata van een missie; de lichaamsconstanten zijn de gepubliceerde waarden die in body.rs worden aangehaald, en de Aardegeometrie erft de labels van de zonnestelselefemeride.

seg-6f341acbe994 = De grafiek die de engine schrijft voor scenarios/mars-orbit-pnt.toml, kind body-pnt

seg-de173c9f4034 = Constellatieontwerp op schaal: Walker-DELTA- en Walker-STAR-patronen in de i: T/P/F-conventie (knopen verdeeld over { "360" } of { "180" } deg, onderlinge afstand in het baanvlak { "360" }<em>P/T, faseverschuiving tussen vlakken { "360" }</em>F/T), expliciete elementenlijsten en ontwerpen met meerdere schillen, meerdere constellaties in één run, rond de Aarde, de Maan, Mars of een andere planeet, Pluto of een grote maan met de constanten in de module body (dezelfde die de kinds solar-system en body-pnt gebruiken). VOORINSTELLINGEN uit gepubliceerde nominale elementen: gps-baseline en gps-expandable (de { "24" } slots en de zes voor/achter uitbreidbare paren van de GPS Standard Positioning Service Performance Standard, 5th edition { "2020" }, Tables 3.2-1 to 3.2-3), galileo (Walker 24/3/1 op { "29 599.801" } km en { "56" } deg, Galileo Open Service Service Definition Document issue { "1.1" } Tables { "1" } and { "23" }), beidou en beidou-meo (Walker 24/3/1 op { "21 528" } km en { "55" } deg plus drie geostationaire satellieten op { "80" }, { "110.5" } en { "140" } deg E en drie hellende geosynchrone satellieten op { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } section { "4.1" }; de MEO-fase en de doorgang van de hellende geosynchrone baan op { "118" } deg E zijn gemodelleerd omdat de standaard ze niet vermeldt) en glonass (24/3/1 op { "19 100" } km en { "64.8" } deg uit de slotformule van de GLONASS Interface Control Document edition { "5.1" } section { "5.2" }). DEKKING EN VERDUNNING VAN PRECISIE: over een breedte-/lengteraster en een bemonsterd venster met een elevatiemasker, het aantal satellieten in zicht, GDOP, PDOP, HDOP en VDOP per cel, de beschikbaarheid (een positiebepaling met PDOP op of onder een drempel, standaard { "6" }) per cel, globaal (oppervlaktegewogen) en op de slechtste locatie, met één ontvangerklok per constellatie tenzij clock = "common". Het schaalt naar duizenden satellieten: zichtbaarheid is een inwendig product met de dekkingshalfhoek van elke satelliet, en satellieten worden per tijdstip in banden ingedeeld op breedte van het subsatellietpunt zodat een rasterrij alleen die test die in zicht kunnen zijn; het rapport telt de bespaarde paartests. De JSON bevat de rasterkaarten en gedownsamplede grondsporen per satelliet. VALIDATED: de Walker-generator tegen Galileo OS SDD Table { "23" } en de slotformule van de GLONASS ICD, de GPS-voorinstelling tegen de gepubliceerde kolom met equatordoorgangen van SPS PS Table 3.2-1, en de globale HDOP-verdeling van de GPS-basislijn tegen SPS PS Appendix B (mediaan { "0.94" }, { "95" }% { "1.25" }, gemiddelde { "0.96" }, tolerantie { "0.03" }). MODELLED: tweelichamenbanen met optionele seculaire J2, een bolvormig lichaam, alleen geometrische zichtbaarheid (geen signaalvermogen, gezondheid of terrein), en de relatieve fase tussen verschillende systemen, die geen momentopname van een echte datum is.

seg-899e728ad9bd = De grafiek die de engine schrijft voor scenarios/leo-pnt-mega-shell.toml, kind constellation-design

seg-24266bc264df = Efemeride en grondspoor: propageer één satelliet (TLE→SGP4 of analytische baan) en geef zijn TEME/GCRS-toestand (positie + snelheid), ITRF/ECEF-positie, WGS-84-subsatellietbreedte/-lengte/-hoogte en per stap de az/el/afstand + afstandssnelheid (Doppler) van het station uit. De satelliet komt uit een <c1/> of uit een analytische <c2/> met zijn <c3/> (een <c4/> wint wanneer beide zijn gegeven); met een <c5/> overschrijft een <c6/> de eigen epoch van de TLE als t = { "0" }.

seg-0fd3c58fde09 = De grafiek die de engine schrijft voor scenarios/ephemeris.toml, soort ephemeris

seg-cb4262b66b8f = GNSS-beschikbaarheid + DOP uit een baanconstellatie (Walker / TLE / RINEX).

seg-3b652c0da6de = De grafiek die de engine schrijft voor scenarios/orbit-rinex.toml, soort orbit

seg-a4bdfc291fce = Voorspelling van grondstationpassages: de passages in het tijddomein (AOS/TCA/LOS, maximale schijnbare elevatie, duur) van een cirkelvormige baan, als gemiddelde SGP4-elementen aan het begin van het venster, boven een station boven een elevatiemasker gedurende een venster, met totale toegangstijd. SGP4/SDP4-propagatie in het aardvaste IAU 2006/2000A-referentiestelsel (optioneel UT1 - UTC en poolbeweging), troposferische refractie volgens ITU-R P.834-9 en de lichttijd van de downlink (beide standaard aan), doorgangen opgelost tot { "1e-7" } s en de culminatie met gulden-snede-zoeken. De passagegeometrie is VALIDATED ten opzichte van Orekit { "13.1.8" } op stations op zeeniveau; de baan en het station van het scenario zijn illustratieve invoer.

seg-a09be8c586e3 = De grafiek die de engine schrijft voor scenarios/passes.toml, soort passes

seg-0549bc926a9b = Het hele zonnestelsel op één epoch, voor PNT (positiebepaling, navigatie en tijdsynchronisatie) rond elk hemellichaam. Voor de Zon, de acht planeten, Pluto, de Maan, Phobos, Deimos, Io, Europa, Ganymedes, Callisto en Titan rapporteert zij de heliocentrische positie en snelheid in de ICRF (International Celestial Reference Frame, equatoriaal J2000), de heliocentrische afstand en de ecliptische lengte en breedte in J2000, de gravitatieparameter, equatoriale en gemiddelde straal, J2 waar gepubliceerd en de bijbehorende referentiestraal, de siderische rotatieperiode, de IAU-pool en de nulmeridiaan op de epoch, een baanspoor bemonsterd over één omloop (heliocentrisch voor planeten, ouder-gecentreerd voor manen), en de lichttijd, enkele en dubbele afstand, de Shapiro-vertraging van de Zon en de scheiding met de Zon vanaf een waarnemerslichaam (standaard de Aarde); extra from/to-verbindingen krijgen dezelfde behandeling. Posities: de Kepler-elementen van JPL volgens Standish en Williams (Tabel { "1" } voor { "1800" } AD tot { "2050" } AD, Tabellen 2a/2b voor { "3000" } BC tot { "3000" } AD) met de nominale fout van elke planeet, de lunaire reeks van Montenbruck & Gill voor de splitsing Aarde-Maan, gemiddelde JPL-elementen met de synchrone IAU-rotatiesnelheid voor de manen van Mars en de Galileïsche manen, en het IAU-rotatiemodel voor Titan. Lichttijd: de radiometrische vastepuntsoplossing, met de zender op zijn vertraagde positie; Newtoniaans, met de Shapiro-vertraging apart gerapporteerd. VALIDATED tegen JPL Horizons (DE441) binnen tweemaal de nominale fout: Mercurius tot Saturnus en de Aarde uit Tabel { "1" } (slechtste { "1.87" } maal nominaal) en alle acht planeten uit Tabellen 2a/2b (slechtste { "1.71" } maal), en de lichttijd van de Aarde naar Mars en Jupiter. MODELLED, elke rij gelabeld: Uranus en Neptunus uit Tabel { "1" } ({ "2.0" } en { "5.2" } maal de nominale fout tegen DE441), Pluto (de rij van { "1992" }; geen vermelde fout), de Maan en de zeven manen (gemeten tegen Horizons, geen gepubliceerde grens).

seg-537aa8010e50 = De grafiek die de engine schrijft voor scenarios/solar-system-tour.toml, soort solar-system

seg-3f749aef8d89 = PNT op Mars in de diepe ruimte: een gesimuleerde MARCONI-relayconstellatie (areostationaire + hellende relays die eenrichting uitzenden + tweerichting doorgeven aan een station in de diepe ruimte) navigeert een referentiegebruiker (transfer | lmo | surface) via de gezamenlijke radiometrische fusieschatter voor eenrichting en tweerichting. Rapporteert per epoch geometrie en zichtbaarheid, de behaalde RMS ten opzichte van de referentie en de formele covariantie (1σ / 3σ positie) — een eerlijke gesimuleerde kwaliteitsmaat, GEEN gecertificeerd beschermingsniveau.

seg-c564dca90854 = De grafiek die de engine schrijft voor scenarios/mars-pnt-lmo.toml, soort mars-pnt

seg-4e31c8daf798 = Register

seg-44bbec836934 = Bron: <c1/>

seg-34a6079984a7 = Constellaties, dekking en geometrie (familie van scenariosoorten)

seg-6800289a282d = { "7" } scenariosoorten van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-d95cc2c1e798 = Themapagina's: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Voer er een uit: <c1/>. Alle families: <a5>KINDS.md</a5>.

seg-f044822c2fab = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie Constellaties, dekking en geometrie

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-e2450f89bcc6 = Efemeride en grondspoor: propageer één satelliet (TLE→SGP4 of analytische baan) en lever de TEME/GCRS-toestand (positie + snelheid), ITRF/ECEF-positie, WGS-84-sub-satellietbreedte/-lengte/-hoogte en per stap

seg-d021c1b23dbc = Constellatieontwerp op schaal: Walker-DELTA- en Walker-STAR-patronen in de i: T/P/F-conventie (knopen verdeeld over { "360" } of { "180" } deg, onderlinge afstand in het baanvlak { "360" }<em>P/T, fase-offset tussen banen { "360" }</em>F/T), expliciet

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-f6914ea43dba = Het hele zonnestelsel op één epoch, voor PNT (positiebepaling, navigatie en tijdsynchronisatie) rond elk hemellichaam.

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-d71a07d8a59e = Positiebepaling rond elk lichaam van het zonnestelsel: een orbiter of een landingsvoertuig op het oppervlak rond een centraal lichaam dat bij naam wordt gekozen (Mars, de Maan, Europa, Ganymedes, Titan en de rest van de catalogus van het zonnestelsel), navi

seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-f6b22521b4a4 = PNT in de diepe ruimte bij Mars: een gesimuleerde MARCONI-relaisconstellatie (areostationaire + hellende relais die eenweg uitzenden + tweewegs doorgeven aan een diepruimtestation) navigeert een referentiegebruiker (transfer / l

seg-cc85d9962c25 = Voorspelling van grondstationpassages: de zichtbaarheidspassages in het tijddomein (AOS/TCA/LOS, maximale schijnbare elevatie, duur) van een cirkelvormige baan, als SGP4-gemiddelde elementen aan het begin van het venster, boven een station boven

seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

seg-a7bd3325080c = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Optioneel: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-5e8a5e611ba9 = <b>Register:</b> MODELLED { "4" } · VALIDATED { "4" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>orbit</a1>.

seg-968c1512151e = Verplichte velden: <c1/>. Optioneel: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-8c5e41cef6fd = <b>Register:</b> VALIDATED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>ephemeris</a1>.

seg-47aaf1afd6ec = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-bacf2a133146 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>constellation-design</a1>.

seg-e99c2a83034e = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-d91ded1df3a2 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "3" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>solar-system</a1>.

seg-fe02605b130e = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-12bc4b4b4631 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "1" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>body-pnt</a1>.

seg-bee590b4c9e7 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-c0394ad71cfe = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>mars-pnt</a1>.

seg-352823f8c5ac = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-bb4fa18e50a6 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "2" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>passes</a1>.

seg-490ec99e2a38 = <s1>Vorige</s1>Klokken, tijdsynchronisatie en holdover

seg-90ff7426b999 = <s1>Volgende</s1>GNSS-metingen, positiebepaling en integriteit
