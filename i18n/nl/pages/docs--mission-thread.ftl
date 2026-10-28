# docs--mission-thread: translations (nl)

seg-e27476e37522 = Aarde

seg-34bdcfd66ded = In de repositorytak waaruit deze documentatie komt; nog niet op GitHub

seg-092dd691ca17 = Het rapport

seg-f942b36a11c4 = Nog niet op GitHub

seg-b03d56f501c3 = Soort

seg-2afa300864a9 = Parameters

seg-b7cf72949a21 = Bron: <c1/>

seg-32755afa0f78 = De missieketen

seg-d4af67363efc = Adviserende software, geen gecertificeerde navigatieapparatuur. Alleen openbare bronnen; niet verbonden aan of onderschreven door enig agentschap, en niets hier beweert conformiteit met de eisen van enig programma.

seg-816770c97995 = <c1/> koppelt fasen van een missie aan elkaar, elk een van acht geregistreerde soorten met eigen sensoren en filter, en rapporteert het <b>foutenbudget voor navigatie en tijdsynchronisatie</b> van de hele keten: voor elke fase de 1-sigma van positie, snelheid en klokbias bij binnenkomst, op het hoogtepunt en bij uitgang; elke bijdrage daaraan, met zijn eenheid; de marge ten opzichte van een eis die u vermeldt; de zwakste schakel; de gedateerde gebeurtenissen; en een tijdlijnfiguur. Elk getal is <b>MODELLED</b>: een vermelde invoer of een model daarvan. De enige rijen met een externe onafhankelijke referentie staan in <s1><c2/></s1> en zeggen wat ze testen.

seg-c29a19879c84 = Voer het voorbeeld uit vanuit een checkout (het leest een vastgelegde snede van een maankernel):

seg-00f84b734853 = Het document

seg-9979b2c873df = <b>Een document wordt geweigerd, niet geraden,</b> wanneer een fase-id zich herhaalt, een lijst <c1/> leeg is, een naam onbekend is, een modelsleutel er een is die de soort niet kent, een lengtesleutel afwijkt van <c2/>, of een fase een bron vermeldt waarvoor haar model geen getallen geeft.

seg-9b1e6ac618b5 = Wat een overdracht doet

seg-0e965f3e30fa = De doorgegeven toestand is de volledige 6x6-covariantie van <c1/> in SI-eenheden, de klok (bias, drift en hun covariantie, met een tijdschaal gemarkeerd), het referentiestelsel, de missietijd en een bewijslabel. Een overdracht reset nooit een covariantie.

seg-47599d03571d = Regel

seg-023113cc5afb = geeft de toestand ongewijzigd door

seg-43967d0b6dd8 = witte versnellingsruis met PSD <c1/> over <c2/> op een model met rechte lijn; de rij vermeldt beide

seg-2c791ab0fd0f = koppelnavigatie gedurende <c1/>, daarna wordt een as alleen op de bronvloer gezet waar de vloer kleiner is; nooit eronder, nooit een reset

seg-36b9117f5379 = Referentiestelsels en tijdschalen

seg-5853aaba827f = De keten zet bij de overdracht om, nooit binnen een fase, en elke omzetting is een eigen budgetrij. Referentiestelsels: GCRF, MCI, MCMF (ITRF en LVLH worden met de reden geweigerd). <c1/> verschuift de oorsprong met de geocentrische toestand van de maan: de toestand van DE440-klasse uit de kernel waar die de epoche dekt (plaatsvervanger { "5" } m en { "1" } mm/s; gemeten slechtste { "2.6" } m tegen vastgezette JPL Horizons), anders de analytische reeks met zijn gemeten { "195.7" } km RMS, die de rij vermeldt; een maanvoorbeeld moet dus een kernel bevatten die zijn epoche dekt. <c2/> is de gemiddelde siderische rotatie met de assen op de epoche uitgelijnd en zonder libratie. Tijdschalen lopen via TT: <c3/> exact, <c4/> voegt { "14" } us toe, <c5/> gebruikt de seculiere snelheid van <c6/> met zijn band van { "56" } tot { "59" } us/dag als onzekerheid van de snelheid.

seg-5ee610d8ab89 = De acht fasesoorten

seg-70b73f1acebf = Segment

seg-0e39a468de1d = aangedreven opstijging naar een parkeerbaan: covariantie bij constante snelheid met witte versnellingsruis, GNSS-acquisitie en signaalverlies, klokholdover

seg-d359ae5982a6 = <c1/>-sleutels in <c2/>

seg-57c44fd6e061 = relatieve navigatie over sensortrajecten: Clohessy-Wiltshire-overgang in LVLH, 6x6-Kalman-covariantie, koppelvenster

seg-7dce961e2c67 = hieronder

seg-4b233c6cdf8b = TLI-brand en cislunaire vlucht: Cowell-voortplanting, toestandsovergangsmatrix met eindige differenties, gnss-ssv- en grondtrackingupdates

seg-352e27d02c86 = terugvlucht naar het terugkeerinterface; sigma van de baanhoek, corridorkans, piekvertraging, voetafdruk

seg-95eb34012fe8 = maan

seg-cc72d2fc8a43 = relatieve navigatie tot koppeling in een maanbaan

seg-2cfa6846c937 = budget voor landingsspreiding bij een poollocatie

seg-e9f5fc58fe12 = idem

seg-ba3c65a210dd = beschikbaarheid van PNT en tijdsynchronisatie op het oppervlak per locatie en seizoen

seg-8b9c5124dd3c = aangedreven opstijging naar een insertiebaan

seg-4ce0fa85457c = De maansoorten zijn ook zelfstandige scenariosoorten; het ontwerp en het bewijs staan in <a1><c1/></a1>.

seg-d16877f38793 = Het budget draagt de <b>relatieve</b> sigma's; de absolute covariantie van de achtervolger wordt ongewijzigd doorgegeven en een rij zegt dat, omdat deze fase de voertuigen ten opzichte van elkaar meet, niet ten opzichte van de aarde. De relatieve startcovariantie is de absolute covariantie van de achtervolger plus de vermelde sigma's van het doel, opgeteld alsof ze onafhankelijk zijn (conservatief). Sleutels: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, optioneel <c6/> en <c7/>, en een of meer <c8/> met <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> of <c15/>, ILLUSTRATIVE parameters in <c16/>) en <c17/>; de duren van de trajecten tellen op tot die van de fase. Het koppelvenster is de tijd vanaf het moment waarop de relatieve sigma binnen de vangenvelop blijft tot het einde van de fase. Herhalingen zijn afzonderlijke fasen met eigen id's.

seg-088b78574ab4 = De gemiddelde toestand is de Cowell-propagator van de engine met aardzwaartekracht en J2 en zon en maan als derde lichamen. De covariantie gaat door elk segment van <c1/> met een toestandsovergangsmatrix met voorwaartse differenties (de nominale run en zes verstoorde runs) en een witte versnellingsruis. De brand ligt langs de binnenkomstsnelheid met een vermelde grootte-fractie en richtingsfout. <b>Genoemde beperking:</b> de vastgelegde maankernelsneden bevatten de maan maar niet de zon, dus de propagator neemt de maan uit de kernel en de zon uit de analytische reeks (de term van de zon als derde lichaam is ongevoelig voor de fout van die reeks); de fase zegt in een gebeurtenis welke ze heeft gebruikt, en waar geen kernel een segment dekt gebruikt ze de analytische reeks voor beide. De brand is <b>niet gericht</b>: de nominale toestand is waar de vermelde brand ook heen gaat, en de maanfasen nemen alleen de covariantie over.

seg-e5a67295a5ae = Updates, alleen gebruikt wanneer het document de bron vermeldt: <c1/> (positiebepalingen met beschikbaarheid en PDOP uit de sweep van het ruimteservicevolume van de engine langs een osculerende baan om de aarde die de boog vervangt, een sweep per <c2/>; sigma van de positiebepaling = mediaan van PDOP maal <c3/>; de vorm met verwachte informatie houdt de run deterministisch) en <c4/> (afstand en afstandssnelheid langs de geocentrische richting, dus het hemelvlak wordt niet waargenomen; de variantie van de update wordt gedeeld door de trackingbezetting). Sleutels: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, optioneel <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = De vlucht is de vlucht van <c1/> zonder brand, eindigend bij het terugkeerinterface; de sleutels ervan zijn de vluchtsleutels hierboven. Bij het interface leest de fase de baanhoek en zijn sigma uit de volledige covariantie, de kans dat de hoek binnen een vermelde corridor ligt, de piekvertraging bij de nominale hoek en bij beide corridorranden (de vlakke ballistische terugkeer van de engine naast de gesloten vorm van Allen-Eggers) tegen een optionele limiet, en de voetafdruk: afstand in vliegrichting uit een vermelde gevoeligheid, dwarsafstand uit de covariantie bij het interface dwars op het baanvlak. Sleutels: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, optioneel <c8/>, <c9/> en <c10/> (de nominale terugkeertoestand, zes getallen, wanneer de keten geen brand naar de aarde heeft om er een te maken). Niets hier modelleert de lift, geleiding of verhitting van een capsule.

seg-352783ef7181 = De overlay van het grondnetwerk

seg-69d6ab8e93bc = Een optionele tabel <c1/> geeft stations en de laagste trackingelevatie; voor elke fase die ze noemt berekent de keten het deel van de fase dat een station kan volgen en geeft dat aan de fase door als de bezetting die de updatefrequentie van haar grondtracking schaalt. Geometrieën: <c2/> (de binnenkomsttoestand tweelichamen gevlogen met J2, voor fasen in een lage baan), <c3/> (het voertuig op de positie van de maan, voor de cislunaire vlucht) en <c4/> (een bezetting die u opgeeft). Een stationswissel verliest <c5/>; het budget van de fase krijgt het langste interval zonder station in zicht en een gebeurtenis geeft de bezetting. Niets modelleert de antennes of schema's van een netwerk.

seg-467b14d7ef59 = <c1/>: <c2/> (index, id, soort, tijden, label, navigatie- en tijdbronnen, beperkende bron, sigma's bij binnenkomst, piek en uitgang, eis, marge, <c3/> met een eenheid per rij, <c4/>), de <c5/> (kleinste marge ten opzichte van een vermelde eis, anders de grootste piekpositie), de <c6/>, het <c7/> van de keten (het label van de zwakste fase) en een blok <c8/>. De figuur is de 1-sigma van positie en klokbias tegen de missietijd, een band per fase.

seg-a3c40c51c2ff = Wat het bewijs is

seg-1168810d4407 = Het label van de keten is het label van de zwakste fase, en elke fase is MODELLED. De maanpropagator wordt vergeleken met LRO en CAPSTONE (<s1><c1/></s1>); de cislunaire boog wordt vergeleken met een openbaar Horizons-traject (<s2><c2/></s2>). Een rij haalt een drempel die vóór de run in een vastgelegd bestand is vastgezet, of mist hem, en een misser wordt als misser vastgelegd. Niets is VALIDATED tenzij het register dat zegt.

seg-ee3c5b58e6fa = <s1>Vorige</s1>Maanbaan en maanoppervlak als infrastructuur

seg-b963f8a02aed = <s1>Volgende</s1>Missieketen: het maansegment

seg-af81a8087ca7 = entry
