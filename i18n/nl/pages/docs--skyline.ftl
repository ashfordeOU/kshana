# docs--skyline: translations (nl)

seg-2bd2101ce454 = Onderdeel

seg-6c6e7248496f = Hemelgeometrie

seg-379f49bff6fb = Python

seg-f917e7fcac09 = Wat het is

seg-ad856ad710eb = Status

seg-cbf0f9bcd2d8 = Onafhankelijke referentie

seg-6e0cb6acc073 = VALIDATED

seg-c14b8fe46517 = Azimutafhankelijk skylinemasker: zichtbare verzameling, azimut en elevatie, en DOP onder het masker

seg-bbb1828b3db1 = Reducties van straatcanyon, sector en terrein tot een tabel

seg-2c53381d48ae = Horizontale foutellips en cofactor per systeem uit de geometriecovariantie

seg-de6c33774c9c = CLI

seg-d1e9715513b4 = Voorbeeld

seg-587beeccaa11 = Voorinstelling

seg-b03d56f501c3 = Type

seg-4dbf41c0ec3b = Functie

seg-98f4f946a7ac = WASM

seg-2b0d77219437 = Voorinstellingen

seg-7338b6210228 = Rij

seg-6317db731879 = Beschrijving

seg-be2f66de7d07 = Bron: <c1/>

seg-3cb660ef6b03 = Skylinemaskers en hemelgeometrie

seg-724f72bdfa36 = Tot { "0.36" } was elke zichtbaarheidstest voor de aarde in de engine één elevatiegrens, <c1/>: een satelliet telde mee als hij op of boven één getal stond, ongeacht zijn richting. Een straat, een kade, een fjord of een kraan blokkeert een deel van de hemel en laat de rest open. Een <b>skyline</b> is een elevatiegrens die van het azimut afhangt; de <b>hemelgeometriefuncties</b> maken van een locatie, een tijdstip, constellaties en een skyline de zichtbare set, de dilution of precision (DOP), de geometriecovariantie, de horizontale foutellips, een Monte Carlo-wolk en een skyplot. Het ontwerp is <c2/> (items { "1" } en { "2" }).

seg-4c1bc0b37f54 = Bewijs: de beslissing over gemaskeerde zichtbaarheid (geodetische kijkhoeken, het tabelmasker, de zichtbare set en haar DOP) is <b>VALIDATED</b> tegen Orekit { "12.2" } en gnss_lib_py { "1.0.4" } in een vooraf vastgelegde vergelijking, en dat geldt ook voor de foutellips en de cofactor per systeem (numpy, vooraf vastgelegd); de reducties voor canyon, sector en terrein, de voorinstellingen en de overige hemelgeometriefuncties zijn <b>MODELLED</b> (<a1>Bewijs</a1>). Een skyline verwijdert satellieten met zichtlijn en niets meer. De voorinstellingen zijn REPRESENTATIVE geometrieën, geen opmetingen.

seg-6fa3291b70e3 = De skyline

seg-08585dd55bb5 = Een skyline is het puntsgewijze maximum van vier beschrijvingen. Het azimut wordt in graden met de klok mee gemeten vanaf ware noord in het lokale east-north-up-stelsel van de locatie; elevaties liggen in <c1/>.

seg-9d0e2b0a469f = TOML

seg-3dbc7ff9f5ab = Tabel

seg-a67486e7d10e = Elevaties lineair geïnterpoleerd over het azimut, omgeslagen bij { "360" }°. Azimuts strikt oplopend in <c1/>; hoogstens { "3600" } rijen.

seg-bc12ba94381f = Stratenkloof

seg-23066e2eb509 = Twee rechte, evenwijdige wanden (hieronder).

seg-821762272e2f = Sectoren

seg-7387a718a7c3 = Intervallen met scherpe randen, met de klok mee van <c1/> (inbegrepen) tot <c2/> (uitgesloten), die door noord heen kunnen lopen; hoogstens { "360" }.

seg-2768e3772b56 = Terrein

seg-5a5c08a77b86 = Punten teruggebracht tot een tabel: elevatie <c1/>, met de krommingsdaling voor <c2/> (een gekozen, vermelde constante). <c3/> ligt boven de antenne.

seg-fb86c0db0c90 = <c1/> start vanuit een benoemde geometrie; de velden van de kloof overschrijven daarna veld voor veld de kloof van de voorinstelling, en <c2/>, <c3/> en <c4/> komen erbij.

seg-0d76504a1d74 = De <c1/> van de ontvanger behoudt zijn betekenis: het is een vlakke skyline. De effectieve grens bij azimut <c2/> is <c3/>, en een satelliet is zichtbaar als zijn elevatie er <b>op of boven</b> ligt: dezelfde <c4/> die het vlakke masker altijd gebruikte. Een satelliet boven <c5/> maar onder de skyline is <b>door de skyline gemaskeerd</b>.

seg-f7fd13e569e3 = De stratenkloof

seg-290f563c1ff7 = Een straat loopt langs azimut <c1/>, <c2/> meter tussen de wanden, met de antenne <c3/> meter hoog op de hartlijn. Langs azimut <c4/>, met <c5/>, bereikt de straal na <c6/> een wand, dus een wand met hoogte <c7/> snijdt op

seg-8662708f4f32 = De open strook ligt langs de straat. Met <c1/> (de antenne in het midden) verlaat een straal de kloof via een open uiteinde, en snijdt de wand niets, wanneer <c2/>. Een wand die niet hoger is dan de antenne snijdt niets. <c3/> is standaard { "1.5" } m (een autodak of een handontvanger, een vermelde keuze); een nieuwe kloof heeft <c4/> nodig.

seg-1eeff52ea5a5 = Gekozen en vermelde afmetingen (die van de ontwerpnotitie), geen opmetingen van een bestaande plek. <c1/> toont er een met zijn herkomst en zijn grens per graad.

seg-13e8e5460280 = Geometrie

seg-6d71c5cbe104 = Kloof: straat { "0" }°, breedte { "20" } m, wanden { "30" } m en { "30" } m, antenne { "1.5" } m. { "70.7" }° dwars op de straat, open langs de straat.

seg-ab3415ff8811 = Verhouding hoogte tot breedte { "1.5" }, binnen de band van { "0.5" }–{ "2" } voor de beeldverhoudingen van stratenkloven bij Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

seg-e331f02251f8 = Sectoren: open naar zee over { "090" }–{ "270" } ({ "180" }°); kadegebouwen { "8" }° over { "315" }–{ "045" } ({ "90" }°); de golfbreker en zijn licht { "3" }° over { "045" }–{ "090" } en { "270" }–{ "315" }.

seg-6926e1bfc55d = Vermelde keuzes (bijvoorbeeld pakhuizen van { "40" } m op ongeveer { "285" } m afstand).

seg-f13d4df9a42c = Terrein: wanden { "600" } m boven de antenne op { "1500" } m aan weerszijden van een noord-zuidkanaal, één punt per graad (op <c1/> m), met krommingsdaling toegepast. { "21.8" }° dwars, onder { "1" }° langs de as.

seg-4d3dedbe4491 = Van de orde van grootte van de breedte en het reliëf van de diepe West-Noorse fjorden (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

seg-51f5219cb050 = Sectoren: containerstapels { "12" }° over de landzijde { "000" }–{ "180" }; kraanbomen { "35" }° over { "245" }–{ "255" } en { "25" }° over { "285" }–{ "295" }; elders open naar het water.

seg-a568ae949c3b = Vijf ISO { "668" }-high-cubecontainers ({ "14.5" } m) op ongeveer { "60" } m afstand van een antenne op { "2" } m hoogte; een giek op ongeveer { "50" } m boven de kade op { "70" } m en { "100" } m, van de orde van een post-Panamaxkraan. Een kraansector is ondoorzichtig.

seg-65b1b45c787f = In een scenario

seg-e489759bbd65 = Een optionele sectie <c1/>, boven de eigen elevatiegrens van de soort:

seg-f98345079e70 = Wat de skyline verandert

seg-cbe2f5ae721f = Per sample

seg-7368ea5c4b79 = <c1/> (met <c2/>)

seg-fde216d940fb = De zichtbaarheidstijdlijn (GNSS-beschikbaarheid) en de DOP-samenvatting.

seg-7f6b2fcda681 = <c1/> (met <c2/>)

seg-8fafdb892253 = De satellieten die RAIM en ARAIM (<c1/>) gebruiken.

seg-c0156fd1c895 = De satellieten waarvan de pseudoranges worden gesimuleerd en door RAIM worden gebruikt.

seg-d7fa5e5cf33d = De satellieten die de ontvanger kan volgen, vóór de jammer.

seg-86caf3ae19ad = De set in zicht van elke modus boven het eigen masker van elk systeem, inclusief de polaire sweep (dezelfde skyline op elke locatie). De Doppler-modusenvelop en de ontworpen enkele passage zijn grenzen aan wat een ontvanger moet kunnen verwerken en behouden het masker van elk systeem.

seg-20d2e86d17bc = Welke epochs boven het masker tellen, de tijd erboven, de satellieten van de GNSS-vergelijking.

seg-ed5bbd6b2c46 = <c1/> (training-NMEA)

seg-d0eb9fd84d24 = De satellieten in GSV en in de positiebepaling. Azimuts zijn ware peilingen, vast aan de grond, niet de koers van het vaartuig.

seg-56cc8ae30218 = <b>De grondlocatie van <c1/> en <c2/>.</b> Beide soorten modelleren een gebruiker in een baan met een geocentrische elevatie en zonder aardvast azimut, dus ze nemen een skyline alleen aan met de grondlocatiemodus van de ontwerpnotitie: <c3/> in plaats van <c4/> (precies één van beide). Elk sample is één absoluut tijdstip, <c5/>: elke satelliet wordt ernaartoe gepropageerd (een elementenset, broadcast-efemeride of SP3-bestand wordt vanaf zijn eigen epoch voortgezet, een Walker-satelliet telt <c6/> vanaf <c7/>) en erop geroteerd naar aardvast, zodat de locatie één consistente hemel ziet. <c8/> is die van het baanscenario zelf; zonder (en altijd voor <c9/>, dat er geen heeft) is het de nieuwste epoch onder de satellieten die er een hebben, of J2000 voor alleen Walker-patronen. Elevatie en azimut zijn geodetisch (WGS-84). De horizontale en verticale splitsing van de ARAIM-beschermingsniveaus van de integriteitssoort en van de Stanford-verticale fout gebruikt dezelfde geodetische omhoogrichting (de normaal op de WGS-84-ellipsoïde, ongeveer { "0.19" }° van de geocentrische radiaal op { "45" }° breedte); snapshot-RAIM gebruikte die al. Een <c10/> zonder skyline is een gewone grondgebruiker; het pad van de <c11/> in een baan is ongewijzigd.

seg-fae979b3b96f = <b>Achterwaartse compatibiliteit.</b> Zonder sectie <c1/> is een scenario byte-identiek aan wat dezelfde engine gaf vóór er skylinecode bestond: <c2/> controleert de JSON, de grafiek en de samenvatting van elk meegeleverd scenario dat een van deze soorten uitvoert, en de NMEA-tekst van elk trainingsscenario, tegen SHA-256-digests van de "{ "0.36" } portable"-basislijn (de digests van de releasecommit { "0.35.0" }, opnieuw vastgesteld toen de engine overging op draagbare wiskunde en als vastlegging in de test bewaard: <c3/>). Een lege sectie <c4/> snijdt niets; het resultaat is dan gelijk aan de run zonder haar, behalve het toegevoegde blok <c5/> en de nul-aantallen <c6/>.

seg-fe88e0ad01e9 = <b>Wat wordt geweigerd</b>, met de reden in de melding: een skyline op een <c1/> in een baan; <c2/> en <c3/> samen; een onbekende voorinstelling; een kloof zonder <c4/>; een tabel die niet strikt oplopend is in <c5/>; een elevatie buiten <c6/>; een lege sector; een niet-positieve terreinafstand; invoer boven de limieten; elke onbekende sleutel.

seg-d1b10a0c833f = <b>Het resultaat</b> krijgt <c1/> erbij wanneer de sectie aanwezig is: <c2/> is <c3/>, <c4/> of <c5/>; <c6/> is het aandeel van de ruimtehoek van het bovenste halfrond boven <c7/> (het gemiddelde van <c8/> over het azimut: { "1" } voor een nulmasker, { "0.5" } voor een vlakke grens van { "30" }°); <c9/> is de regel van de voorinstelling of de eigen regel van het scenario. Eenheden en herkomstklassen staan in het blok <c10/>.

seg-0842c1133eb5 = Meegeleverde voorbeelden (<c1/>):

seg-5f77a52314c7 = Wat het toont (verwijder de sectie <c1/> om te vergelijken)

seg-523f8c1a7912 = GPS + Galileo onderaan <c1/>: { "17" } van { "289" } samples houden een positiebepaling, mediane PDOP { "70.5" } ({ "1.14" } onder open hemel).

seg-6c5618dce8ab = ARAIM met twee constellaties bij het binnenvaren van een haven: { "70" } satelliet-epochs verborgen, beschikbaarheid ongewijzigd ({ "145" } van { "145" }).

seg-36254db521fd = Pseudoranges en RAIM op een kade: { "44" } satelliet-epochs verborgen; RAIM-beschikbaarheid { "0.59" } ({ "0.85" } onder open hemel).

seg-6b0f8b4c700f = Een jammer van { "2" } W in een haven: { "83" } satelliet-epochs verborgen, tracking ongewijzigd (de jammer had ze al overgenomen).

seg-22ceab915271 = GPS + Galileo + een LEO-laag in een fjord: mediane gefuseerde PDOP { "1.14" } ({ "0.93" } onder open hemel).

seg-f940e764e244 = De kloof van <c1/> als vlakke grens van { "35" }° en als <c2/> gedraaid langs de koers van de auto: { "8" } tegen { "4" } tot { "5" } GPS- en Galileo-satellieten; gefuseerde gemiddelde fout { "2.1" } m in beide; het alarm van { "1.5" } m bij { "51" } % en { "59" } % van de epochs.

seg-6aa4ec7e4058 = Vijf enginefuncties (<c1/>), op elk oppervlak dezelfde:

seg-4d6a793b2794 = Invoer → uitvoer

seg-c99f58f1ccd2 = per satelliet <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (eenheidsvariantie), <c15/>; <c16/> en <c17/> bij het gevraagde betrouwbaarheidsniveau; <c18/>, <c19/>, <c20/>

seg-a5b914aac404 = <c1/> (hoogstens { "5000" }, een invoerlimiet) kleinstekwadratenfouten onder onafhankelijke Gauss-bereikfouten van <c2/> uit een ChaCha8-stroom met seed <c3/>: <c4/>, de empirische covariantie, horizontale en 3D-RMS naast <c5/> en <c6/>, het aandeel binnen de ellips van { "95" } %

seg-f435ee3b8709 = de voorinstellingen met label, beschrijving, herkomst, de grens per graad en <c1/>

seg-1937af5fa347 = een skylinesectie teruggebracht tot de tabel met 360 items die de engine gebruikt, met <c1/>, <c2/>, <c3/>

seg-f16a1f2de329 = de skyplot als statische SVG (geen script, geen externe verwijzing, elke invoerstring ge-escaped)

seg-c802cf2a2e30 = Een verzoek:

seg-c3c44c1967ba = <c1/> zijn de constellatievoorinstellingen van de engine (<c2/> met <c3/>, <c4/>, <c5/>, <c6/>, ...; de LEO-voorinstellingen <c7/>, <c8/>, ...) of een volledige <c9/>-tabel <c10/>, gepropageerd naar <c11/> (Kepler met seculiere J2, de gezamenlijkemodusbanen van <c12/>). Hun relatieve fasen komen uit verschillende referentie-epochs, dus de hemel is <b>een representatieve geometrie, niet de hemel van die datum op die plek</b>. Satellieten kunnen ook (of aanvullend) rechtstreeks worden opgegeven: <c13/>, of met <c14/> en een <c15/> of <c16/>. Standaardwaarden: het eigen masker van elk systeem ({ "5" }° GNSS, { "10" }° LEO; { "5" }° voor rechtstreeks opgegeven satellieten), één ontvangerklok per systeem (<c17/> voor één gedeelde klok), <c18/> { "1" } m (een representatieve begrotingsregel voor twee frequenties), betrouwbaarheid { "0.95" }. Invoerlimieten: hoogstens { "2000" } satellieten boven de horizon (een systeemtabel die er meer vraagt wordt geweigerd voordat hij wordt opgebouwd) en { "16" } ontvangerklokken.

seg-6408f9b02ccb = Een gedateerde hemel uit elementensets.

seg-7724e4ecafee = <c1/> neemt tekst van two-line element sets aan (een naamregel vóór elke set is optioneel; hoogstens { "4" } MiB, een invoerlimiet), gepropageerd door de SGP4 van de engine (WGS-72, de propagator die <c2/> gebruikt) naar <c3/> plus <c4/>, geroteerd naar aardvast met UT1 gelijkgesteld aan UTC en zonder poolbeweging, en gezien vanaf <c5/>. <c6/> is UTC ISO { "8601" } (<c7/>) en dateert alleen de elementensets (de voorinstellingen dragen geen datum, dus een <c8/> zonder <c9/> wordt geweigerd); <c10/> labelt ze voor de klok per systeem (standaard <c11/>). Elk resultaat zegt welke hemel het is in <c12/> en <c13/>:

seg-13a8b4ac40f9 = De hemel

seg-c0bde35f9442 = de constellatievoorinstellingen van de engine: een representatieve geometrie

seg-d368b50280cc = de elementensets gepropageerd naar het vermelde epoch: de hemel die die elementensets op dat epoch geven, geen meting ervan (hun eigen nauwkeurigheid is die van SGP4 en de ouderdom van de sets)

seg-0bc07825a9b5 = geen <c1/>: de elementensets gepropageerd naar het eigen epoch van de nieuwste set plus <c2/>, een representatieve hemel

seg-1230388da233 = rechtstreeks opgegeven satellieten, zoals vermeld

seg-1a30004a7f9e = Een mix voegt ze samen met <c1/>. <c2/> is het tijdstip waarnaar de elementensets zijn gepropageerd, en <c3/> noemt wat van de tekst niet is gebruikt, met de reden: misvormde of verweesde regels van elementensets (met hun regelnummers), sets die de parser heeft geweigerd, en sets die SGP4 niet naar dat tijdstip kon propageren (vervallen, of voorbij hun grenzen); in totaal hoogstens { "100" } items, plus één laatste item dat de rest telt. Een lege lijst <c4/> voegt geen voorinstellingen toe. De skyplot vermeldt de grondslag in zijn voettekst.

seg-8560c13c7ea3 = <b>Eén kernel.</b> De cofactormatrix is <c1/>, de opbouw van de ontwerpmatrix en de Gauss-Jordan-inverse achter <c2/>. <c3/> maakt de covariantie beschikbaar en <c4/> is de reductie ervan, dus de VALIDATED scalairen zijn ongewijzigd en worden nog steeds vastgepind door <c5/>. Er is geen tweede DOP-implementatie.

seg-cb1be3e04419 = <b>De ellips.</b> Halve assen <c1/> voor de eigenwaarden <c2/> van het oost-noordblok, met <c3/> (<c4/> bij { "95" } %, { "1" } bij { "39.35" } %), en het azimut van de hoofdas <c5/> in <c6/> vanaf noord.

seg-96062e2cfed1 = Toegangspunten

seg-f8dc86bd9da2 = <c1/> of <c2/>, met <c3/> of <c4/>; <c5/>

seg-d5b5bdf6081c = Rust

seg-8d0f99ed4837 = <c1/>, <c2/> met dezelfde namen

seg-40a7552d2ba9 = MCP

seg-42f0fe3b42ab = <c1/> (<c2/>, of <c3/>); geen Monte Carlo via MCP (bulksamples die een agent moet samenvatten en niet moet meedragen)

seg-9d04c658b37a = Elk resultaat draagt <c1/> (MODELLED), de <c2/> (geometrie onder een vermeld foutmodel: onafhankelijke, gelijke Gauss-bereikfouten met gemiddelde nul; geen voorspelling van de werkelijke fout van een ontvanger, die ook biases, multipath en non-line-of-sight-fouten heeft; geen integriteitsgrens) en de adviserende melding: <em>Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.</em>

seg-0e1285fdfe52 = Vijf registerrijen (<c1/>), zoals de ontwerpnotitie ze afbakent:

seg-1aa76286f152 = Orekit { "12.2" } (<c1/>-kijkhoeken, <c2/>) met gnss_lib_py { "1.0.4" } (<c3/> en de DOP-matrix), vooraf vastgelegd in <c4/> (commit e4b9d912) voordat een van beide was uitgevoerd: { "1173" } kijkhoeken op zes locaties en vier epochs, zes tabellen, { "142" } zichtbare sets; ongunstigste elevatie { "1.3e-13" }°, azimut { "2.3e-13" }°, masker { "1.1e-12" }° tegen { "1e-9" }°; identieke zichtbare sets, geen in de grensband; DOP { "3.3e-13" } relatief en cofactor { "6.6e-13" } van de matrixschaal tegen { "1e-9" }. Bereik: tabelmaskers, geodetische kijkhoeken, de gemaskeerde set en haar DOP en cofactor met gemeenschappelijke klok.

seg-b33828edbe2f = met de hand berekende waarden; de vergelijking hierboven leest hun tabellen als invoer en controleert ze niet

seg-ca950752be62 = Skyline-voorinstellingen

seg-83946f66ca78 = geen: gekozen, vermelde afmetingen (alleen aan zichzelf getoetst)

seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> en <c2/> (standaard P2) op de { "142" } vastgelegde zichtbare sets, gemeenschappelijke klok en één klok per systeem, vooraf vastgelegd in <c3/> (commit 0bbeeaee): { "270" } gevallen, assen { "5.1e-13" } relatief, oriëntatie { "5.3e-12" }°, cofactor { "1.0e-12" } van de matrixschaal, tegen { "1e-9" } en { "1e-6" }°

seg-44e5f9ca28f7 = Hemelgeometriefuncties

seg-8e3953481bbf = de samenstelling: propagatie van de voorinstelling naar een representatieve hemel, de Monte Carlo-wolk (gecontroleerd tegen de geometrie die hij bemonstert), de oppervlakken

seg-e8eec007c6b9 = De afwezigheid van een sectie <c1/> wordt byte voor byte gecontroleerd tegen de uitvoer van { "0.35.0" }, wat achterwaartse compatibiliteit aantoont en niets aan een externe referentie toetst. gnss_lib_py past alleen één elevatiemasker toe, dus het is hier de onafhankelijke referentie voor DOP, niet voor het masker.

seg-d5894e54715b = Wat een skyline niet modelleert: diffractie over een wandrand, reflecties en non-line-of-sight-signalen die een echte ontvanger nog kan tracken (ze worden verwijderd, niet verslechterd), gedeeltelijke doorzichtigheid (een traliekraan is ondoorzichtig over zijn sector), terrein voorbij de opgegeven punten, en de aardkromming binnen de vormen kloof en sector.

seg-745d19d6b35d = <s1>Vorige</s1>Maritieme integraties

seg-bbe8dd07d33b = <s1>Volgende</s1>Vertrouwen als beveiligingstelemetrie
