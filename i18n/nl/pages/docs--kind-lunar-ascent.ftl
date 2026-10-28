# docs--kind-lunar-ascent: translations (nl)

seg-f942b36a11c4 = Nog niet op GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariosoort van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Bewijs van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-6a26b9ab59fe = Onderwerppagina: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Bron: <c1/>

seg-b8ef47331221 = <c1/> (scenariosoort)

seg-ae3053a1f6c8 = MODELLED aangedreven opstijging vanaf een locatie op het maanoppervlak bij de zuidpool naar de rendez-vousbaan, en de covariantie van positie en snelheid die het terug naar de baan meeneemt (Artemis-klasse). Het traagheidsfoutenmodel met vijf toestanden per as van lunar-descent (positie, snelheid, bias van de versnellingsmeter, standshoek, gyrobias, aangedreven door de specifieke kracht) loopt op alle drie de locatie-assen vanuit de oppervlaktetoestand waarmee de fase begint; een AFS-positiebepaling uit de zichtbare relais van een ILLUSTRATIVE constellatie van LCNS-klasse (zelfstandig, of differentieel met het residu van de correctieverbinding van lunar-differential-pnt, met ondersteuning van de klok wanneer slechts drie relais zichtbaar zijn) wordt met een vermeld interval genomen, waarbij maantijd via de voertuigklok binnenkomt en een tijdstempelfout langs het pad. Rapporteert de traagheidsbronnen in gesloten vorm, de bijdrage van de ondersteuning, de ablatie, de navigatie-1-sigma's over de opstijging, de spreiding bij motoruitschakeling naast de navigatiekennis, en de volledige 6x6-MCI-covariantie bij insertie met de correlatie tussen positie en snelheid behouden. MODELLED: illustratieve IMU-klasse, specifieke kracht, relaisset en spreiding bij motoruitschakeling; fouten aangehouden in de assen van de lanceerlocatie; de nominale uittredetoestand is een plaatsvervanger. Niet door een ruimtevaartorganisatie onderschreven; adviserende software, geen gecertificeerde navigatieapparatuur.

seg-fc4d2ba3f99e = Eén run van <c1/> vat samen als: lunar-ascent | -89.50 deg | alleen inertiaal { "785" } m / { "3.49" } m/s | met AFS { "11.4" } m / { "0.071" } m/s | spreiding bij insertie { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = Het voorbeeld <c1/> stelt onder meer in:

seg-ebc18c9bcbac = differential

seg-3843825d0733 = us

seg-2d84b341a41f = Resultaatlabel (van de engine): MODELLED

seg-463a919e84d5 = De grafiek die de engine schrijft voor scenarios/lunar-ascent.toml, soort lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> De soort en fase <c1/>: het traagheidsfoutenmodel met vijf toestanden per as, uitgevoerd over een aangedreven opstijging met specifieke kracht langs het pad, ondersteund door AFS-positiebepalingen en maantijd, dat de covariantie van positie en snelheid bij insertie rapporteert die naar de baan wordt meegenomen

seg-4e0c4b02eac0 = <b>MODELLED</b> De soort en fase <c1/>: het traagheidsfoutenmodel met vijf toestanden per as, uitgevoerd over een aangedreven opstijging met specifieke kracht langs het pad, ondersteund door AFS-positiebepalingen. Onafhankelijke referentie (InternalConsistency): De traagheidsdrift in gesloten vorm en monotoniciteitscontroles in de tests. Er wordt geen gevlogen opstijging vergeleken

seg-8732ad9f7e07 = <b>MODELLED</b> De propagator die de maansoorten delen (GRAIL GL0660B graad en orde { "150" }, aarde en zon als derde lichamen, relativiteit, DE440-maanoriëntatie) vergeleken met de openb. Onafhankelijke referentie (ExternalDataset): JPL Horizons-ephemeriden van ruimtevaartuigen voor LRO en CAPSTONE, tegen drempels die vooraf zijn vastgelegd in xval/mission-thread-lunar/PREREGISTRATION.md (Amendementen { "1" } tot { "6" }). LRO: MET, { "33" } m grootste 3D-verschil en { "2.4" } m RMS radiaal tegen { "500" } m en { "60" } m. CAPSTONE: NOT MET, een eindpositieverschil van { "136.8" } km tegen { "25" } km en een periapsisverschil van { "28.4" } km tegen { "10" } km, de oorzaken niet afgezonderd. De rij is gemodelleerd omdat de CAPSTON

seg-626ab55f0424 = MODELLED (resultaat <c1/>)

seg-745dfc03a929 = MODELLED aangedreven opstijging vanaf een locatie op het maanoppervlak bij de zuidpool naar de rendez-vousbaan, en de covariantie van positie en snelheid die het terug naar de baan meeneemt (Artemis-klasse). (soortencatalogus (<c1/>))

seg-3fd0cca78937 = MODELLED: illustratieve IMU-klasse, specifieke kracht, relaisset en spreiding bij motoruitschakeling; fouten aangehouden in de assen van de lanceerlocatie; de nominale uittredetoestand is een plaatsvervanger. (soortencatalogus (<c1/>))

seg-2cfb37d39847 = EERLIJKHEID: MODELLED. De IMU-klasse, de uitlijning, de specifieke kracht en de spreiding bij motoruitschakeling zijn ILLUSTRATIVE invoer, geen metingen. De fouten worden aangehouden in de oost-noord-omhoog-assen van de lanceerlocatie, zonder de kromming van het pad in de richting van de vlucht, en de nominale uittredetoestand is een plaatsvervanger in de lokale verticaal van de locatie: alleen de covariantie is het resultaat. Er wordt geen overeenstemming met enig echt voertuig beweerd. Adviserende software, geen c (commentaar in het scenariobestand, regels { "11" } tot { "15" })

seg-6faf49cac41a = Opstijging met aandrijving vanaf een maanpoollocatie naar een insertiebaan (<c1/>) is MODELLED, niet gevalideerd: gecontroleerd tegen zijn eigen identiteit in gesloten vorm of analytisch — vangt transcriptie- en coëfficiëntfouten, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = De voortplanting met het maankrachtenmodel tegen openbare gereconstrueerde trajecten van maanorbiters en cislunaire trajecten is MODELLED, niet gevalideerd: een deelbewering wordt extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Onderwerppagina: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Vorige</s1>link-budget

seg-59d4cb995cb9 = <s1>Volgende</s1>lunar-attack-surface
