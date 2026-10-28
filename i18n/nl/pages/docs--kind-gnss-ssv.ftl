# docs--kind-gnss-ssv: translations (nl)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = Bron: <c1/>

seg-ee3ecc6e0330 = <c1/> (scenariosoort)

seg-d07af7221334 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie voor ruimtegebruikers</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-d6d7bca305dc = MODELLED GNSS-beschikbaarheid en linksterkte in het Space Service Volume en daarbuiten: voor een gebruiker op een bol (de globale schil van het ICG-boekje) of op een Kepler-traject (LEO tot maanoverdracht) telt het, per constellatie (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) en voor alle samen, de signalen die bruikbaar zijn boven een C/N0-drempel - beschikbaarheid van ten minste één en van vier signalen, maximale uitvalduur, ontvangen C/N0, dilution of precision, hoofdlobverbindingen tegenover zijlobverbindingen - met een zendpatroon uit het boekje, een parametrisch of door de gebruiker geleverd zendpatroon, optionele limb-ray-effecten van ionosfeer, plasmasfeer en atmosfeer en een optioneel ontwerp van een ontvanger voor zwakke signalen; ook een GNSS-extended-Kalman-filter aan boord voor HEO- en maanoverdrachtsvaartuigen (baandynamica, zonnestralingsdruk, derde lichamen, klok) en relatieve navigatie van een formatie van meerdere vaartuigen met enkelvoudig gedifferentieerde pseudoranges. Gecontroleerd tegen de tabellen van het ICG-SSV-boekje onder een preregistratie (xval/gnss-ssv)

seg-d739ae994bf0 = Eén run van <c1/> vat samen als: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = Verplichte velden: <c1/>

seg-7fc75803140d = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-cebc76420d69 = Het voorbeeld <c1/> stelt onder meer in:

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO, nadir- en patch-zenitantennes met hoge versterking, parametrisch s

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = { "5" } meegeleverde scenario's gebruiken deze soort; de overige staan in <a1><c1/></a1>.

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = Resultaatlabel (van de engine): MODELLED: een meetkundige sweep en sweep van het linkbudget. Het patroon uit het boekje is een hoofdlob met constant vermogen, het parametrische patroon een representatieve vervanger, en het limb-ray-medium een eenvoudig, vermeld model; niets hier is een meting van een signaal in de ruimte. De cijfers voor beschikbaarheid en uitval volgen de methode o

seg-7dae5e291c8b = De grafiek die de engine schrijft voor scenarios/gnss-ssv-heo.toml, soort gnss-ssv

seg-0aae0574c5e6 = <b>MODELLED</b> De beschikbaarheidssweeps van de soort <c1/>: per constellatie (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) en gecombineerd, het aandeel (gebruiker, epoche)-paren met ten minste één en ten minste vier signalen en de langste uitval, voor een gebruiker op een bol

seg-07c94d5ad15c = <b>MODELLED</b> De modus <c2/> van de soort <c1/>: een extended Kalman-filter met negen toestanden (positie, snelheid, klokbias en klokdrift van de ontvanger, een schaal voor zonnestralingsdruk) op pseudoranges waarvan beschikbaarheid, ruis en C/N0 uit dezelfde link

seg-41bfe74c6f6f = <b>MODELLED</b> De modus <c2/> van de soort <c1/>: een chief en deputies voeren elk het absolute filter uit; de positie van de deputy ten opzichte van de chief wordt geschat door de absolute schattingen af te trekken en met een relatief filter op enkelvoudig gedifferentieerde pseud

seg-de9a2a5b5f04 = <b>MODELLED</b> De beschikbaarheidssweeps van de soort <c1/>: per constellatie (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) en gecombineerd, het aandeel (gebruiker, epoche)-paren met ten minste. Onafhankelijke referentie (ExternalDataset): Het ICG Space Service Volume-boekje (UN OOSA ST/SPACE/75, { "2018" }), zelf een simulatie, vergeleken onder een preregistratie die voor de run is vastgelegd (xval/gnss-ssv/PREREGISTRATION.md; resultaten in xval/gnss-ssv/RESULTS.md, vastgezet door tests/ssv_booklet_results.rs, missers inbegrepen). Run { "1" } op de vooraf vastgelegde lezing: de constanten voor minimaal uitgestraald vermogen en de maandrempel komen overeen (S0, S6 gehaald); de bovenste en onderste SSV, RF-drempel

seg-f0b778c4922a = <b>MODELLED</b> Een Chapman-ionosfeer, een plasmasfeer van het Gallagher-type en een neutrale atmosfeer (breking door refractiviteit, zuurstofabsorptie, defocussering) geïntegreerd langs de rechte. Onafhankelijke referentie (InternalConsistency): Gesloten vormen en gepubliceerde ordegroottes in de tests (de piek van een Chapman-laag en de buiging van de oppervlaktelimb, enkele TECU plasmasfeer op een GPS-naar-GEO-straal); het ontwerp van de ontvanger hergebruikt de acquisitie- en trackinglusmodellen en hun tests. Er worden geen gemeten limb-sounding- of zwaksignaalontvangstgegevens mee vergeleken

seg-77cef183420e = <b>MODELLED</b> De modus <c2/> van de soort <c1/>: een extended Kalman-filter met negen toestanden (positie, snelheid, klokbias en klokdrift van de ontvanger, een schaal voor zonnestralingsdruk. Onafhankelijke referentie (InternalConsistency): Gesimuleerde referentiewaarheid tegen de eigen schatting van het filter (de gemiddelde genormaliseerde geschatte kwadratische fout van een consistent filter is ongeveer { "3" } voor de positie) en determinisme bij een vaste seed. Er worden geen vlucht- of opgenomen GNSS-gegevens uit hoge banen mee vergeleken; Zon en Maan zijn circulaire vervangers met lage precisie

seg-429e154cd691 = <b>MODELLED</b> De modus <c2/> van de soort <c1/>: een chief en deputies voeren elk het absolute filter uit; de positie van de deputy ten opzichte van de chief wordt geschat door de absolute schattingen af te trekken en door. Onafhankelijke referentie (InternalConsistency): Dezelfde gesimuleerde referentiewaarheid als het absolute filter: de fout van het relatieve filter tegen de ware relatieve toestand, en de controle dat het ten minste even goed presteert als het aftrekken van twee onafhankelijke absolute positiebepalingen. Er worden geen vluchtgegevens van formaties mee vergeleken

seg-1dd1beb01075 = MODELLED: een meetkundige sweep en sweep van het linkbudget. Het patroon uit het boekje is een hoofdlob met constant vermogen, het parametrische patroon een representatieve vervanger, en het limb-ray-medium een eenvoudig, vermeld model; niets hier is een meting van een signaal in de ruimte. De cijfers voor beschikbaarheid en uitval volgen de methode van het ICG Space Service Volume-boekje (UN ST/SPACE/75) en worden gecontroleerd tegen de tabellen ervan in xval/gnss-ssv/. (resultaat <c1/>)

seg-e9c2dedbc971 = MODELLED GNSS-beschikbaarheid en linksterkte in het Space Service Volume en daarbuiten: voor een gebruiker op een bol (de globale schil van het ICG-boekje) of op een Kepler-traject (LEO tot maanoverdracht) telt het, per constellatie (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) en voor alle samen, de signalen die bruikbaar zijn boven een C/N0-drempel - beschikbaarheid van ten minste één en van vier signalen, maximale uitvalduur, ontvangen C/N0, (soortencatalogus (<c1/>))

seg-3add0e744c54 = MODELLED: het patroon is representatief, niet gemeten; het medium is een vermeld eenvoudig model (docs/SSV.md). (opmerking in het scenariobestand, regel { "14" })

seg-6b4655dd5270 = GNSS-signaalbeschikbaarheid in het Space Service Volume en daarbuiten, vergeleken met het ICG-SSV-boekje, is MODELLED, niet getoetst aan een onafhankelijke externe referentie: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-a9e1798308df = Effecten van limb-ray-ionosfeer, plasmasfeer en atmosfeer op scherend invallende GNSS-signalen, en het ontwerp van de ontvanger voor zwakke signalen, in de soort <c1/> zijn MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-132be2813c10 = Het GNSS-navigatiefilter aan boord voor ruimtevaartuigen in hoge banen en maanoverdrachtsbanen is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-f9405de9adb8 = Relatieve navigatie van een formatie van meerdere ruimtevaartuigen in een sterk elliptische baan met GNSS is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-4881f925ea7f = Familiepagina: <a1>Navigatie voor ruimtegebruikers</a1>

seg-4b72df59b3f9 = Onderwerppagina: <a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>Vorige</s1>gnss-sim

seg-9df48482a140 = <s1>Volgende</s1>gravity-map

seg-795e0409fa5a = <b>MODELLED</b> De fase <c1/>: de gemiddelde toestand met de Cowell-propagator van de engine (aarde als puntmassa en J2, zon en maan als derde lichamen, de maan uit de DE440-kernel van de keten waar die het segment dekt en de zon uit de analytische serie

seg-6a26b9ab59fe = Onderwerppagina: <a1>MISSION-THREAD.md</a1>
