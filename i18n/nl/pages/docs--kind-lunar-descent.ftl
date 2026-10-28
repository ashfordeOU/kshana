# docs--kind-lunar-descent: translations (nl)

seg-f942b36a11c4 = Nog niet op GitHub

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken deze soort; de andere staan in <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariosoort van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Bewijs van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-6a26b9ab59fe = Onderwerppagina: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differential

seg-2d84b341a41f = Resultaatlabel (van de engine): MODELLED

seg-626ab55f0424 = MODELLED (resultaat <c1/>)

seg-e66e2ca31e54 = Onderwerppagina: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Bron: <c1/>

seg-d4df5aa9b7b0 = <c1/> (scenariosoort)

seg-2cd0d5385530 = MODELLED budget voor de landingsspreiding bij een aangedreven afdaling naar een locatie bij de zuidpool (Artemis-klasse). Per horizontale as wordt een traagheidsfoutenmodel met vijf toestanden (positie, snelheid, bias van de versnellingsmeter, standshoek, gyrobias) aangedreven door de specifieke kracht van de afdaling; een sequentieel filter neemt positiebepalingen van de ingeschakelde hulpmiddelen: een AFS-positiebepaling uit de zichtbare relais van een ILLUSTRATIVE constellatie van LCNS-klasse (zelfstandig, of differentieel met het residu van de correctieverbinding van lunar-differential-pnt, met ondersteuning van de klok wanneer slechts drie relais zichtbaar zijn) en een terreinrelatieve positiebepaling (de TERCOM/SITAN-matcher van de crate op een synthetisch reliëf, of de Cramér-Rao-grens van het matchen van een hoogtevenster van de echte LOLA-DEM van de zuidpool). Maantijd komt bij de positiebepalingen via de voertuigklok binnen (de LTC-TT-offset van lunar-time-offset, of de onzekerheid van zijn gepubliceerde band) en als tijdstempelfout langs het pad. Rapporteert de 3-sigma-landingsellips, R95, de traagheidsbronnen in gesloten vorm, de bijdrage van elk hulpmiddel, de ablatie van elke combinatie van hulpmiddelen, een Monte Carlo-kalibratie van de ellips en de doorgegeven covariantie. MODELLED: illustratieve IMU-klasse, relaisset, afdalingsprofiel en geleidingsterm; terreinnavigatie gebruikt een synthetisch reliëf op een aardse meterschaal; de beschikbaarheid van AFS is één epoche op een vlak masker. Niet door een ruimtevaartorganisatie onderschreven; adviserende software, geen gecertificeerde navigatieapparatuur.

seg-c6c1a8f184ed = Eén run van <c1/> vat samen als: lunar-descent | -89.50 deg | alleen inertiaal 517/517 m (O/N) | met hulpmiddelen 7.6/4.8 m | spreiding R95 { "51" } m | 3-sigma-ellips { "64" } x { "62" } m | { "99.1" }% erbinnen (verwacht { "98.9" }%) (MODELLED)

seg-dfdb7de68515 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = Het voorbeeld <c1/> stelt onder meer in:

seg-8073ece4c900 = De grafiek die de engine schrijft voor scenarios/lunar-descent.toml, soort lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> De soort en fase <c1/>: een traagheidsfoutenmodel met vijf toestanden per as (positie, snelheid, bias van de versnellingsmeter, kanteling, gyrobias) over een aangedreven afdaling, ondersteund door AFS-positiebepalingen (zelfstandig of differentieel, met het klokondersteunde geval met drie relais

seg-bfe4c0a04288 = <b>MODELLED</b> De soort en fase <c1/>: een traagheidsfoutenmodel met vijf toestanden per as (positie, snelheid, bias van de versnellingsmeter, kanteling, gyrobias) over een aangedreven afdaling,. Onafhankelijke referentie (InternalConsistency): De traagheidsdrift in gesloten vorm, de eigen resultaten van de hergebruikte soorten en de kalibratie van de 3-sigma-ellips (het deel erbinnen komt overeen met de verwachting) in de tests. Er wordt geen gevlogen of beproefde landing vergeleken

seg-ed286f215c96 = MODELLED budget voor de landingsspreiding bij een aangedreven afdaling naar een locatie bij de zuidpool (Artemis-klasse). (soortencatalogus (<c1/>))

seg-c1bd92ba429b = MODELLED: illustratieve IMU-klasse, relaisset, afdalingsprofiel en geleidingsterm; terreinnavigatie gebruikt een synthetisch reliëf op een aardse meterschaal; de beschikbaarheid van AFS is één epoche op een vlak masker. (soortencatalogus (<c1/>))

seg-85714bc3cf2a = EERLIJKHEID: MODELLED. De IMU-klasse, het afdalingsprofiel, de relaisset, de fout in het signaal in de ruimte en de geleidingsterm zijn ILLUSTRATIVE invoer, geen metingen. De modus voor terreinnavigatie gebruikt het op zichzelf staande synthetische reliëf en een aardse meterschaal, dus de terreinterm hier is het gedrag van de matcher op een plaatsvervanger, geen uitspraak over het reliëf van de zuidpool: de variant lola-crlb (lunar-descent-lola.toml) gebruikt de echte (commentaar in het scenariobestand, regels { "14" } tot { "20" })

seg-3eb1b3b03600 = Budget voor landingsspreiding bij een maanpoollocatie (<c1/>) is MODELLED, niet gevalideerd: gecontroleerd tegen zijn eigen identiteit in gesloten vorm of analytisch — vangt transcriptie- en coëfficiëntfouten, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Vorige</s1>lunar-beacon

seg-ca9b68783354 = <s1>Volgende</s1>lunar-differential-pnt
