# docs--kind-aperture-duty-cycle: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-4b695c0dfc9f = Bron: <c1/>

seg-632c0a545845 = <c1/> (scenariokind)

seg-0cef33b41040 = Aperture duty cycle: het tijdsaandeel navigatie versus communicatie dat een contactplan impliceert voor een pool van stuurbare aperturen. Neemt een contactplan (een lijst van <c1/> aos_s/los_s-vensters, elk met een verzoek om navigatie of communicatie — dezelfde aos_s/los_s-woordenschat die de <c2/>-voorspeller uitgeeft), een aantal aperturen en een ARBITRAGEBELEID (standaard navigatieprioriteit, of communicatieprioriteit, of niet-preëmptief first-come-first-served) en rapporteert de navigatieduty, de communicatieduty, de idle duty en de uitval per sessie — de contacttijd die een sessie vroeg en die geen apertuur bediende. Een exacte intervalsweep over de venstergrenzen, zodat aansluitende vensters nooit concurreren en geen apertuurseconde dubbel wordt geteld; navigatie-, communicatie- en idle-apertuurseconden worden onafhankelijk opgeteld en sluiten tegen apertures*horizon_s. Het rapport vermeldt het opgeloste beleid, de volledige definitie ervan en de definities van duty en uitval, omdat een duty-cijfer dat zonder zijn arbitragebeleid wordt genoemd niet reproduceerbaar is. MODELLED planningsrekenwerk: er wordt geen slew-, hertuning- of omschakeltijd gerekend wanneer een apertuur van dienst of sessie wisselt, er is geen datavolume, bufferstatus, energiebudget of linksluiting die in de beslissing meespeelt, en de contactvensters zijn invoer — hun geometrie is wat ze ook heeft voortgebracht. Geen planningsproduct voor het grondsegment.

seg-a8d79b8a96bc = Eén run van <c1/> vat samen als: aperture-duty-cycle: { "6" } sessie(s) op { "2" } apertuur/aperturen onder navigatieprioriteit -> navigatieduty { "0.1167" }, communicatieduty { "0.2667" }, idle { "0.6167" }; { "0" } s van { "6900" } s gevraagd verloren door contentie (MODELLED)

seg-67c665d5c8c0 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-60f25ccdab6e = Het voorbeeld <c1/> stelt onder meer in:

seg-bf51947657c0 = navigatie

seg-b4ff1d640bdf = communicatie

seg-2e78730d0737 = aperture*s

seg-330cbcd04718 = fractie (dimensieloos)

seg-0ef5875db338 = Resultaatlabel (van de engine): MODELLED — planningsrekenwerk voor aperturen over een aangeleverd contactplan: een exacte intervalsweep van het tijdsaandeel navigatie versus communicatie en het contentieverlies per sessie onder een benoemd arbitragebeleid. Er wordt geen slew-, hertuning- of omschakeltijd gerekend wanneer een apertuur van dienst of sessie wisselt,

seg-a8b38ed8e029 = De grafiek die de engine schrijft voor scenarios/aperture-duty-cycle.toml, kind aperture-duty-cycle

seg-4636d450ef60 = <b>MODELLED</b> Eén run neemt een contactplan (een lijst van aos_s/los_s-vensters, elk met een verzoek aan de apertuur om navigatie of communicatie — dezelfde vensterwoordenschat die <c1/> uitgeeft, omgezet door <c2/>), een apert

seg-7a5aa78533d3 = <b>MODELLED</b> Eén run neemt een contactplan (een lijst van aos_s/los_s-vensters, elk met een verzoek aan de apertuur om navigatie of communicatie — dezelfde vensterwoordenschat die `passes::pre. Onafhankelijke referentie (InternalConsistency): Interne consistentie, uit drie grootheden die door verschillende uitdrukkingen in dezelfde sweep worden berekend en daarna moeten sluiten. Navigatie-apertuurseconden, communicatie-apertuurseconden en idle-apertuurseconden worden afzonderlijk opgeteld — idle uit (apertures − |served|) per elementair interval, nooit als restwaarde — en hun som wordt getoetst tegen apertures × horizon_s, wat een verkeerd begrensde grens, een dubbel getelde

seg-a388c24fec99 = MODELLED — planningsrekenwerk voor aperturen over een aangeleverd contactplan: een exacte intervalsweep van het tijdsaandeel navigatie versus communicatie en het contentieverlies per sessie onder een benoemd arbitragebeleid. Er wordt geen slew-, hertuning- of omschakeltijd gerekend wanneer een apertuur van dienst of sessie wisselt, er is geen datavolume, bufferstatus, energiebudget of linksluiting die in de beslissing meespeelt, en de contactvensters zijn invoer — th (resultaat <c1/>)

seg-e689f30b268a = MODELLED planningsrekenwerk: er wordt geen slew-, hertuning- of omschakeltijd gerekend wanneer een apertuur van dienst of sessie wisselt, er is geen datavolume, bufferstatus, energiebudget of linksluiting die in de beslissing meespeelt, en de contactvensters zijn invoer — hun geometrie is wat ze ook heeft voortgebracht. (kindcatalogus (<c1/>))

seg-4aa40af30bd2 = EERLIJKE REIKWIJDTE: MODELLED planningsrekenwerk over de aangeleverde vensters. Er wordt geen slew-, hertuning- of omschakeltijd gerekend wanneer een apertuur van dienst of sessie wisselt; er is geen datavolume, bufferstatus, energiebudget of linksluiting die in de beslissing meespeelt; en de contactvensters zijn invoer -- hun geometrie is wat ze ook heeft voortgebracht (het scenario <c1/> geeft dezelfde aos_s / los_s-woordenschat uit). Geen planningsproduct voor het grondsegment (opmerking in het scenariobestand, regels { "18" } tot { "24" })

seg-0b7f8d86e5d5 = Het tijdsaandeel navigatie versus communicatie van een apertuur is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-dbbefaba93dc = <s1>Vorige</s1>aocs

seg-5b4fd889fdff = <s1>Volgende</s1>araim-reference-check
