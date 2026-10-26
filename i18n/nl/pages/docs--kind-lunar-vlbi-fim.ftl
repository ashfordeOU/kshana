# docs--kind-lunar-vlbi-fim: translations (nl)

seg-b054c73f22e5 = geen waarde

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-3319b18ac61f = en { "1" } meer in de matrix.

seg-2595bd629ffb = <b>MODELLED</b> Het zevenparameter-Helmert-datum, voortgeplant uit een GESIMULEERDE WAARNEMINGSCAMPAGNE in plaats van teruggevonden uit een geïnjecteerde transformatie.

seg-7ecec8d27f50 = Bron: <c1/>

seg-d54e29b7bc80 = <c1/> (scenariosoort)

seg-1bc37634ba9f = Covariantie van de stationscoördinaten bij lunar VLBI: de vertragingspartiëlen van de waarneembare grootheid lunar-vlbi, opgeteld over een expliciet SCHEMA (basislijnen x epochs) tot een Fisher-informatiematrix, geïnverteerd, en gerapporteerd als de covariantie van de stationscoördinaten en de sigma van het station per coördinaat — een berekende uitvoer van de engine in plaats van een scalaire vertragingsprecisie die door een aangenomen isotrope equipartitiefactor g = { "3" } wordt geduwd. De toestand draagt VASTE aardstationscoördinaten (ITRS), zodat de Jacobiaan de inertiale partiële is, gedraaid met de GCRS->ITRS-matrix van elke epoch: de aardrotatie maakt die coördinaten waarneembaar, en het rapport MEET de aardvaste zichtlijnsweep en de declinatie van het baken in plaats van ze aan te nemen. Eén waarneming is één paar (basislijn, epoch) met BEIDE stations boven het hoogtemasker, gewogen met 1/delay_sigma_s^{ "2" }. Rapporteert rang, datumdefect, conditiegetal, het volledige informatiespectrum, de covariantiematrix, sigma's per station per as en in 3D, en de nulruimte van het vrije netwerk bij elke run; bij een rangdeficiëntie wordt de kernsigma gepubliceerd als NULL met een status en nooit uit een bijna singuliere inverse afgelezen. De equipartitiewaarde c<em>delay_sigma_s</em>sqrt(g/N) voor HETZELFDE schema wordt naast de berekende waarde uitgegeven met de verhouding, samen met de isotrope sporengrens sqrt(p/trace(M)) die AM-HM tot een harde ondergrens maakt — zodat de verhouding de anisotropie is die de aanname heeft weggegooid. De vertragingssluiting tau_ik = tau_ij + tau_jk maakt slechts n-1 van de n(n-1)/2 basislijnen geometrisch onafhankelijk; het rapport vermeldt beide aantallen. MODELLED: de efemeride van het maanmiddelpunt, stationsklokken, troposfeer en aardoriëntatieparameters worden VAST gehouden en waarnemingen worden als onafhankelijk behandeld, zodat de covariantie een Cramer-Rao-grens is voor een verkleinde parameterverzameling, geen voorspeld sessieresultaat; de vertragingssigma, de stationscoördinaten en het schema zijn invoer. De partiële die de Jacobiaan van de geometrische vertraging weglaat (de gedifferentieerde Shapiro-term) wordt via een eindig verschil gemeten en uitgegeven. Geen geodetisch product.

seg-4df72c1b921e = Eén run van <c1/> vat zich samen als: lunar-vlbi-fim | { "3" } stations / { "3" } basislijnen x { "49" } epochs = { "16" } obs (masker { "10.0" } deg) | datum anchor-first-station | rang 6/6 cond { "2.209e4" } | stationssigma { "0.0926" } m tegenover equipartitie g={ "3" } { "0.0013" } m (verhouding { "71.360" })

seg-f0dabe1b061b = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-fabf305ae1de = Het voorbeeld <c1/> stelt onder meer in:

seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

seg-8b098bf1df6b = Resultaatlabel (dat van de engine): MODELLED covariantie van de stationscoördinaten bij lunar VLBI. De covariantie wordt opgebouwd uit de eigen analytische vertragingspartiëlen van de engine over een expliciet schema van basislijnen en epochs en geïnverteerd; ze wordt NIET omgerekend uit een scalaire vertragingsprecisie met een aangenomen geometriefactor. De vertragingssi

seg-19c383444296 = De grafiek die de engine schrijft voor scenarios/lunar-vlbi-fim.toml, soort lunar-vlbi-fim

seg-d1a6a5086102 = <b>VALIDATED</b> Vertragingspartiëlen, opgeteld over een schema van basislijnen × epochs tot een Fisher-informatiematrix, geïnverteerd tot de covariantie van de stationscoördinaten en de sigma van het station per coördinaat, ter vervanging van een aangenomen isotrope equipartitieschakel uit een

seg-55ce02ad5dd5 = <b>MODELLED</b> Een derde datumkeuze, <c1/>, die elk aardstation vasthoudt en alleen de maanlichaamsvaste coördinaten van het BAKEN schat — de configuratie waarvoor een onzekerheid van een punt op het maanoppervlak daadwerkelijk wordt opgegeven, aangezien de coördinaten van aardstations

seg-811a412b40b6 = <b>VALIDATED</b> De covariantie van het baken met alle stations vast, uit het scenario lunar-vlbi-fim (elk aardstation vastgehouden, de maanlichaamsvaste coördinaten van het baken alleen geschat), met het baken geplaatst op de maan van JPL DE440 zoals gelezen door de eigen kernellezer van de engine

seg-a731b913bdf0 = <b>VALIDATED</b> Vertragingspartiëlen, opgeteld over een schema van basislijnen × epochs tot een Fisher-informatiematrix, geïnverteerd tot de covariantie van de stationscoördinaten en de sigma van het station per coörd. Onafhankelijke referentie (ExternalDataset): Een onafhankelijke route binnen de repository. Elke Jacobiaanrij wordt opnieuw afgeleid via een centraal eindig verschil van lunar_vlbi::vlbi_delay_s, geëvalueerd uit de eigen aardvaste en maanlichaamsvaste coördinaten van de toestand, vooruit geroteerd door de stelselketen — een pad dat geen afgeleide berekent en geen uitdrukking deelt met de analytische partiëlen — en de informatiematrices die de twee routes opbouwen komen overeen tot < { "1e-6" } van de grootste diagonaal. De

seg-2300ffd9fc4e = <b>MODELLED</b> Een derde datumkeuze, <c1/>, die elk aardstation vasthoudt en alleen de maanlichaamsvaste coördinaten van het BAKEN schat — de configuratie waarvoor een. Onafhankelijke referentie (ReferenceImpl): Identiteiten in gesloten vorm, zonder dat een externe onafhankelijke referentie wordt geclaimd of beschikbaar is. De hefboomarm wordt gecontroleerd aan ρ/B en de twee equipartitievormen onderling tot { "1e-15" } — algebraïsche identiteiten, dus ze vangen een bedradingsfout op en niets anders, en worden ook zo genoemd. Het inhoudelijke resultaat is MEASURED in plaats van beweerd: een vertraging uit een vaste basislijn legt de RICHTING van het baken vast, zodat de component langs de zichtlijn rea

seg-2cbf700a234e = MODELLED covariantie van de stationscoördinaten bij lunar VLBI. De covariantie wordt opgebouwd uit de eigen analytische vertragingspartiëlen van de engine over een expliciet schema van basislijnen en epochs en geïnverteerd; ze wordt NIET omgerekend uit een scalaire vertragingsprecisie met een aangenomen geometriefactor. De vertragingssigma per waarneming, de stationscoördinaten, de locatie van het baken en het schema zijn invoer. De efemeride van het maanmiddelpunt, de stationsklokken (resultaat <c1/>)

seg-8f63c3e774e2 = Covariantie van de stationscoördinaten bij lunar VLBI: de vertragingspartiëlen van de waarneembare grootheid lunar-vlbi, opgeteld over een expliciet SCHEMA (basislijnen x epochs) tot een Fisher-informatiematrix, geïnverteerd, en gerapporteerd als de covariantie van de stationscoördinaten en de sigma van het station per coördinaat — een berekende uitvoer van de engine in plaats van een scalaire vertragingsprecisie die door een aangenomen isotrope equipartitiefactor g = { "3" } wordt geduwd. (soortencatalogus (<c1/>))

seg-d09b166842d5 = De toestand draagt VASTE aardstationscoördinaten (ITRS), zodat de Jacobiaan de inertiale partiële is, gedraaid met de GCRS->ITRS-matrix van elke epoch: de aardrotatie maakt die coördinaten waarneembaar, en het rapport MEET de aardvaste zichtlijnsweep en de declinatie van het baken in plaats van ze aan te nemen. (soortencatalogus (<c1/>))

seg-bb7ff1e5d99f = De equipartitiewaarde c<em>delay_sigma_s</em>sqrt(g/N) voor HETZELFDE schema wordt naast de berekende waarde uitgegeven met de verhouding, samen met de isotrope sporengrens sqrt(p/trace(M)) die AM-HM tot een harde ondergrens maakt — zodat de verhouding de anisotropie is die de aanname heeft weggegooid. (soortencatalogus (<c1/>))

seg-0ed4495d4488 = MODELLED: de efemeride van het maanmiddelpunt, stationsklokken, troposfeer en aardoriëntatieparameters worden VAST gehouden en waarnemingen worden als onafhankelijk behandeld, zodat de covariantie een Cramer-Rao-grens is voor een verkleinde parameterverzameling, geen voorspeld sessieresultaat; de vertragingssigma, de stationscoördinaten en het schema zijn invoer. (soortencatalogus (<c1/>))

seg-4df6e3981cc4 = De gepubliceerde keten van D3 gaat van een vertragingsprecisie per waarneming naar een onzekerheid van de stationscoördinaten via een aangenomen ISOTROPE equipartitiefactor g = { "3" }. Die stap noemt het eigen abstract van de paper gemodelleerd in plaats van gemeten. Dit scenario verwijdert hem: de lunar-VLBI-vertragingspartiëlen worden over een echt schema van paren (basislijn x epoch) opgeteld tot een Fisher-informatiematrix, geïnverteerd, en gerapporteerd a (commentaar in het scenariobestand, regels { "3" } tot { "8" })

seg-489b93ca0f7f = De toestand draagt VASTE aardcoördinaten (ITRS), zodat de Jacobiaan de inertiale partiële is, gedraaid met de GCRS->ITRS-matrix van elke epoch: de aardrotatie maakt die coördinaten überhaupt waarneembaar, en het rapport MEET de aardvaste zichtlijnsweep en de declinatie van het baken in plaats van ze aan te nemen. Eén waarneming is één paar (basislijn, epoch) met BEIDE stations boven het hoogtemasker, gewogen met 1/delay (commentaar in het scenariobestand, regels { "10" } tot { "14" })

seg-efb5719364af = Wat u in het rapport moet lezen * sigma's per station per as en in 3D — het berekende antwoord; * de equipartitiewaarde c<em>delay_sigma_s</em>sqrt(g/N) voor HETZELFDE schema, ernaast afgedrukt met de verhouding. Die verhouding IS de anisotropie die de aanname heeft weggegooid, en de isotrope sporengrens sqrt(p/trace(M)) maakt AM-HM tot een harde ondergrens, zodat de aanname alleen maar kan onderschatten; * rang, datumdefect, conditiegetal, het volledige sp (commentaar in het scenariobestand, regels { "16" } tot { "26" })

seg-96c1a129aeae = <s1>Vorige</s1>lunar-time-offset

seg-199d98630271 = <s1>Volgende</s1>lunar-vlbi
