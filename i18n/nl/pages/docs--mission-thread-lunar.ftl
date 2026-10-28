# docs--mission-thread-lunar: translations (nl)

seg-f942b36a11c4 = Nog niet op GitHub

seg-3b01a756c305 = Wat het berekent

seg-b478421b21bb = Bron: <c1/>

seg-dbd59cc01982 = Het maansegment van de missieketen in Artemis-klasse

seg-7b56ed698c30 = Vier scenariosoorten, elk ook een fasesoort van de interface van <c1/> (<c2/>): ze voeren een foutenbudget voor navigatie en tijdsynchronisatie door een maanmissie naar de zuidpool, van rendez-vous in een maanbaan tot de landing, het verblijf op het oppervlak en de opstijging terug naar de baan. <b>Elk getal hier is MODELLED</b>: een vermeld model met ILLUSTRATIVE invoer, niets ervan een uitspraak over enige missie, enig systeem of enige locatie. "Artemis-klasse" benoemt een klasse van missieconcepten, niets meer; er worden geen data, producten of onderschrijving van een agentschap gebruikt of beweerd, en niets hier is aan een agentschap verbonden. Adviserende software, geen gecertificeerde navigatieapparatuur. Kshana zendt niets uit en stuurt geen hardware aan.

seg-5282ad2c498a = Fase en soort

seg-9b927127e042 = Voorbeeldscenario

seg-40f3e1b2d58b = Kern

seg-2cfaaa8be402 = relatieve navigatie tot koppeling, cirkelvormig polair van { "100" } km of elliptisch polair van { "100" } km bij { "3000" } km

seg-9ee09d63fed3 = het budget voor de landingsspreiding bij een locatie bij de zuidpool

seg-c4568984e75c = <c1/>, <c2/> (heeft de DEM nodig, een checkout)

seg-a098e14e6a63 = beschikbaarheid van positiebepaling en tijdsynchronisatie per locatie en seizoen

seg-8278ae655fcc = <c1/>, <c2/> (heeft de DEM nodig, een checkout)

seg-249eff5159d0 = opstijging naar de rendez-vousbaan en de covariantie die terug naar de baan wordt meegenomen

seg-36184e593ade = Elke kern is een functie van <c1/>; een zelfstandige run bouwt de standaardbinnenkomst (een covariantie in het op de maan gecentreerde traagheidsstelsel van { "100" } m en { "0.1" } m/s, een LTC-klok van { "1" } microseconde) en het standaardepoche 2028-01-01, en een run in een keten neemt de binnenkomst over van de vorige fase. De keten, niet een kern, zet referentiestelsels en tijdschalen om en past de overdrachtsregel toe: een faseomhulling zet de binnenkomsttoestand om naar <c2/> (of <c3/> voor de oppervlaktekaart) en een LTC-klok via de omzettingen van de keten, en de omzettingsregels worden aan het budget van de fase toegevoegd. Een referentiestelsel of tijdschaal die de keten niet kan omzetten (bijvoorbeeld ITRF) wordt geweigerd met de melding van de keten; een kern die direct wordt aangeroepen met een referentiestelsel dat hij niet kan gebruiken, weigert het met de reden. Een fase reset nooit een covariantie, maar geeft alleen de covariantie door waarmee ze eindigt.

seg-59f4a1a2684e = Wat elke fase doet

seg-e112a34ef118 = Twee voertuigen, een achtervolger en een doel, vliegen dezelfde baan onder het maankrachtenmodel van de crate (een zwaartekrachtveld en de aarde en de zon als derde lichamen). Een batch-Gauss-Newton-schatting over de boog herstelt beide beginstoestanden uit:

seg-33bb01b1e72a = een absolute positiebepaling per voertuig uit een ILLUSTRATIVE relaisset van LCNS-klasse (relais achter de maan vervallen, vier nodig), waarvan het witte deel de code-trackinggrens op de AFS-piloot is (BPSK({ "5" }), { "5.115" } Mchip/s) bij de vermelde C/N0 maal de DOP-cofactor;

seg-b061f6742a86 = een <b>blijvende</b> fout in het signaal in de ruimte bij elke positiebepaling: relaisfouten middelen niet weg over een boog van uren, dus ze worden meegenomen als constante positiebiassen, een gemeenschappelijk voor beide voertuigen (<c1/> van de variantie, standaard { "0.9" }, ILLUSTRATIVE) en een onafhankelijk per voertuig. Een constante bias geeft geen voordeel van middeling, de conservatieve lezing;

seg-437ac74b1400 = een crosslink-afstand uit hetzelfde signaal bij zijn eigen C/N0.

seg-3513a55e44e5 = Het rapporteert de formele en Monte Carlo-fout in relatieve positie en snelheid in de lokale assen van het doel, het aandeel epochen met positiebepalingen op beide voertuigen, de gemiddelde genormaliseerde gekwadrateerde schattingsfout (NEES) van de relatieve toestand tegenover de verwachte waarde van { "6" }, de relatieve drift door het negeren van de zwaartekrachtharmonischen, een Hill-controle (Clohessy-Wiltshire) in gesloten vorm voor het cirkelvormige geval, de modellen voor relatieve eindsensoren van <c1/> van de keten (ILLUSTRATIVE parameters) naast het cijfer met alleen signalen, en de 6x6-covariantie van de achtervolger aan het einde.

seg-5d3fa3e8486c = <b>Wat het resultaat zegt.</b> Met alleen signalen legt de crosslink-afstand de relatieve positie langs de zichtlijn vast, maar de relatieve positie dwars daarop wordt begrensd door de onafhankelijke fout in het signaal in de ruimte en door wat de dynamica geeft; koppelen vraagt een relatieve sensor, en de rijen van <c1/> tonen op welke afstand elk van de sensormodellen van de keten de signalen verslaat. Het resultaat hangt er ook van af dat de referentie en de schatter een krachtenmodel delen; de schatteroptie <c2/> toont de kosten van het negeren van de harmonischen, en van die run wordt geen consistentie verwacht.

seg-66c4eb27641b = De fase vliegt haar eigen nominale baan (de velden van <c1/>), dus de positie- en snelheidsvector bij binnenkomst wordt niet gebruikt, alleen de covariantie, het referentiestelsel en de klok ervan; een gebeurtenis in de keten zegt dat.

seg-751f29ab7a35 = Per horizontale as een traagheidsfoutenmodel met vijf toestanden (positie, snelheid, bias van de versnellingsmeter, standshoek, gyrobias, aangedreven door de specifieke kracht van de afdaling) uit de covariantie bij binnenkomst en de IMU, daarna een sequentieel filter over de ingeschakelde hulpmiddelen:

seg-c2eae4508a2f = <b>AFS-positiebepaling</b>: uit de relais die boven een vlak masker zichtbaar zijn, met de ENU-DOP-cofactor maal een gebruikersafstandsfout. <c1/> gebruikt de fout in het signaal in de ruimte; <c2/> gebruikt het residu van de correctieverbinding van <c3/>. Met precies drie relais in zicht wordt de klok ondersteund, niet geschat, en de positiebepaling draagt dan <c4/>: hier komt maantijd in de positiebepaling binnen.

seg-39c938fb24e9 = <b>Terreinrelatieve positiebepaling</b>: <c1/> voert de TERCOM/SITAN-matcher van de crate uit op zijn synthetische reliëf en een aardse meterschaal (een plaatsvervanger, geen reliëf van de zuidpool); <c2/> neemt de Cramér-Rao-grens van het matchen van een hoogtevenster van de echte LOLA-DEM op de locatie, <c3/>, en beweert geen positiebepaling waar het reliëf slechts één richting beperkt (het aperture-probleem).

seg-795ef82edc61 = <b>Maantijd</b>: de klokfout bij de positiebepaling combineert de klok bij binnenkomst, zijn groei sinds de synchronisatie en de LTC-TT-term van <c1/>. Met <c2/> tikt het voertuig TT en is de opgebouwde offset een ongecorrigeerde bias; met <c3/> blijft alleen de onzekerheid van de gepubliceerde band van { "56" } tot { "59" } microseconden per dag over de horizon over. Een tijdstempelfout verplaatst een positiebepaling langs het pad met <c4/>.

seg-d655c932abbf = De landingsspreiding is de navigatiefout bij het neerkomen plus een onafhankelijke geleidingsterm (<c1/>, ILLUSTRATIVE, standaard { "20" } m per as). De tabel <c2/> voert elke combinatie van de hulpmiddelen uit. De ellips is gekalibreerd met Monte Carlo (het aandeel gesimuleerde landingen binnen de 3-sigma-contour tegenover de { "98.9" } % die een 2D-gaussiaan geeft).

seg-82b71e26bc89 = <b>Lees het met zorg.</b> De standaardspreiding wordt gedomineerd door de aangenomen geleidingsterm, en op elke locatie bij de zuidpool is de relaisgeometrie vrijwel gelijk, dus de locaties verschillen weinig. Maantijd doet er via tijdstempels weinig toe ({ "150" } m/s maal enkele microseconden is minder dan een millimeter); hij doet ertoe wanneer de geometrie tot drie relais verslechtert.

seg-f5af0aef6649 = Voor elke locatie en elk seizoen (een epoche en een venster daarna): positiebepaling met relais (vier of meer relais in zicht boven het masker en de terreinhorizon van de locatie met PDOP onder de drempel, uit dezelfde functies en constellatie als <c1/>; het resultaat voor één locatie is bitgelijk aan zijn cijfer), of de aarde en de zon boven de horizon staan (analytische zon, maan en maanoriëntatie, libratie inbegrepen), en de beschikbaarheid van tijdsynchronisatie (een relais of de aarde in zicht) met de langste periode van geen van beide. Het cijfer voor de relais verandert in dit model niet met het seizoen (Kepler-set, gemiddelde rotatie); de cijfers voor aarde en zon wel. De fase geeft de covariantie ongewijzigd door en stuurt de klok naar een tijdsynchronisatiebodem (ILLUSTRATIVE, { "50" } ns), waardoor alleen het langste gat in tijdsynchronisatie overbrugd hoeft te worden met holdover.

seg-0890ec65a04e = Het model met vijf toestanden van de afdaling op alle drie de locatie-assen vanuit de oppervlaktetoestand, een AFS-positiebepaling met een vermeld interval met dezelfde behandeling van maantijd, en de volledige 6x6-covariantie van positie en snelheid bij insertie doorgegeven, met de correlatie tussen positie en snelheid van elke as behouden. De spreiding bij motoruitschakeling verplaatst waar het voertuig is en wordt naast de navigatiecovariantie gerapporteerd, niet meegenomen. De fouten worden aangehouden in de assen van de lanceerlocatie (geen kromming in de richting van de vlucht) en de nominale uittredetoestand is een plaatsvervanger; alleen de covariantie is het resultaat.

seg-f60b576fabcd = Hoe een document een fase vermeldt

seg-be8e0001ed0c = In een keten is de tabel <c1/> van een fase de eigen tabel van het zelfstandige scenario. De duur van de fase is de <c2/> van de keten: een model dat ook een eigen lengtesleutel vermeldt (<c3/>, <c4/>, <c5/>, <c6/>) moet daarmee overeenkomen of de fase wordt geweigerd, en een model dat de sleutel weglaat neemt die van de keten. De seed is de op id gebaseerde fase-seed van de keten, dus een fase die op zichzelf onder dezelfde id en keten-seed wordt uitgevoerd geeft de getallen die zij in de keten geeft. Een verkeerd gespelde modelsleutel wordt geweigerd, niet genegeerd. De overdracht tussen fasen, en de omzettingen van referentiestelsel en tijdschaal die zij nodig heeft (op de maan gecentreerd traagheidsstelsel en maanvast, aarde naar maan, de LTC-paren), behoren tot de keten.

seg-52a6e2ec0a99 = De ontwerpen, invoer en drempels zijn vóór elke run vastgelegd in <c1/>, met zes gedateerde amendementen, elk in het bestand vermeld; het oordeel over elke drempel, de missers en de geschiedenis van de schatter inbegrepen, staat in <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (de propagator tegen het gereconstrueerde traject van LRO, { "24" } uur): MET, { "33" } m maximaal 3D-verschil tegen { "500" } m, { "2.4" } m RMS radiaal tegen { "60" } m.

seg-25464238f6bd = <b>A2</b> (dezelfde propagator tegen de bijna rechtlijnige halobaan van CAPSTONE over één omloop van 6.5 dagen): <b>NOT MET</b>, { "136.8" } km eindpositieverschil tegen { "25" } km, en { "28.4" } km verschil in osculerende periapsisstraal tegen { "10" } km. De oorzaken zijn niet afgezonderd (kandidaten zijn de weggelaten stralingsdruk en albedo, de gevoeligheid van de baan voor de beginstoestand, en de analytische reeksen voor aarde en zon); de rij blijft MODELLED.

seg-e1099ad81a5d = Deze twee rijen testen de propagator die de maansoorten delen. <b>Ze testen geen navigatiefilter, signaal of budget, en niets anders hier heeft een externe onafhankelijke referentie.</b>

seg-9a4b2392aa92 = Al het andere is MODELLED, en de consistentiecontroles van de soorten (B1 tot en met B8 van de preregistratie) testen een implementatie tegen haar eigen vermelde model, niet tegen de maan.

seg-3365490b59b7 = <s1>Vorige</s1>Missieketen: van lancering tot terugkeer

seg-90932eed0074 = <s1>Volgende</s1>LEO-positiebepaling, -navigatie en -tijdsynchronisatie
