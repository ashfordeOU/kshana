# docs--kind-lunar-frame-campaign: translations (nl)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-3319b18ac61f = en { "1" } meer in de matrix.

seg-dd57b833cb20 = Bron: <c1/>

seg-120769aba2cc = <c1/> (scenariosoort)

seg-55679aff66db = Zevenparameter-Helmert-datum (gelijkvormigheid) voor een referentiestelsel, aangedreven door een GESIMULEERDE WAARNEMINGSCAMPAGNE in plaats van door een geïnjecteerde transformatie. Een netwerk van aardstations observeert een catalogus van bakens op het maanoppervlak volgens een expliciet schema; de partiële afgeleiden van de lunar-VLBI-vertraging worden over dat schema opgeteld tot een Fisher-informatiematrix van de baakencoördinaten, precies zoals lunar-vlbi-fim dat doet; en die informatie wordt via het Helmert-ontwerp A = [I3 | [p]_x | p] in de cataloguspunten voortgeplant naar de datumcovariantie H = A^T M_b A, gediagnosticeerd door crate::fim::crlb. GEEN transformatie wordt geïnjecteerd en er wordt niets teruggevonden uit een geplant antwoord, dus de gerapporteerde datumnauwkeurigheid volgt uit het waarnemingsprogramma: een gehalveerde vertragingssigma halveert haar exact, en een langere boog verbetert haar omdat de libratie die het rapport MEET (sub_earth_direction_sweep_deg) is wat de baakencoördinaat langs de zichtlijn scheidt van die in het hemelvlak. Rang, datumdefect, conditiegetal, het volledige spectrum, de onwaarneembare richtingen IN DE ZEVENPARAMETERBASIS, de zwakste richting zelfs bij volle rang en het aandeel van elke parameter daarin worden bij elke run uitgegeven; een parameter die de campagne niet beperkt, wordt gepubliceerd als NULL met een status en nooit uit een bijna singuliere inverse afgelezen. Correlatie tussen baakenfouten wordt gemeten, niet aangenomen: met vastgehouden stations raakt geen enkele waarneming twee bakens, zodat de informatiematrix exact blokdiagonaal is (offblock_fraction { "0" }), en met geschatte stations is het Schur-gemarginaliseerde blok gekoppeld, waarbij de geïnduceerde correlatie wordt afgedrukt en de hele voortplanting opnieuw wordt uitgevoerd met die correlatie weggelaten, zodat de prijs van een onafhankelijkheidsaanname een getal is. Dezelfde voortplanting onder een isotrope sigma per coördinaat, en de herstelfout die het scenario lunar-frame-realisation rapporteert, worden hier beide uitgevoerd en naast de campagnewaarde afgedrukt met hun verhoudingen. MODELLED: de baakencatalogus is van bronnen voorzien maar de CAMPAGNE is gesimuleerd — het stationsnetwerk en de vertragingssigma zijn illustratieve invoer, afzonderlijke vertragingswaarnemingen worden als onafhankelijk behandeld, en de efemeride van het maanmiddelpunt, de stationsklokken, de troposfeer en de aardoriëntatieparameters worden VAST gehouden, zodat de datumcovariantie een Cramer-Rao-grens is voor een verkleinde parameterverzameling. Geen geodetisch product.

seg-2e02c1ff8f48 = Eén run van <c1/> vat zich samen als: lunar-frame-campaign | { "4" } bakens x { "3" } basislijnen x { "49" } epochs = { "64" } obs (vertragingssigma { "1.000e-11" } s) | stationsdatum vast | Helmert-rang 7/7 cond { "3.798e5" } | datumtranslatiesigma { "6.397500" } m tegenover herstelfout van de geïnjecteerde transformatie { "0.3125" } m (verhouding { "0.049" })

seg-9c5feacf15ce = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

seg-1d70a5b4a197 = Het voorbeeld <c1/> stelt onder meer in:

seg-df90e5910fb4 = uur

seg-d9523213de9f = Resultaatlabel (dat van de engine): MODELLED door een campagne aangedreven datum van het maanstelsel. De covariantie van de zevenparameter-Helmert wordt voortgeplant uit een informatiematrix van baakencoördinaten die is opgebouwd uit de eigen lunar-VLBI-vertragingspartiëlen van de engine over een expliciet schema van bakens, basislijnen en epochs; GEEN gelijkvormigheidstransformatie wordt geïnjecteerd en

seg-883d94b321b4 = De grafiek die de engine schrijft voor scenarios/lunar-frame-campaign.toml, soort lunar-frame-campaign

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-2595bd629ffb = <b>MODELLED</b> Het zevenparameter-Helmert-datum, voortgeplant uit een GESIMULEERDE WAARNEMINGSCAMPAGNE in plaats van teruggevonden uit een geïnjecteerde transformatie.

seg-fd34d760edb1 = <b>VALIDATED</b> De datumcovariantie van de zevenparameter-Helmert, met haar twee gesimuleerde invoeren vervangen door gemeten invoeren: het schema is de zendepochs vanaf de grond van { "337" } gearchiveerde ILRS-normaalpunten van lunar laser ranging (2015-04-08 tot 2015-06-27, Grasse MeO { "7" } Tests: <a1>lunar_llr_real_data.rs</a1>.

seg-055864084843 = <b>MODELLED</b> Optionele invoeren extra_reflectors en extra_beacons bij het scenario lunar-llr-datum voegen een blok station_geodesy toe: de Helmert-informatie met vijf arrays uit de gearchiveerde lunar-laser-rangingreeks plus de informatie die een toegevoegde retroreflector (ran Tests: <a1>lunar_station_geodesy.rs</a1>.

seg-23bd763c32d8 = <b>VALIDATED</b> De datumcovariantie van de zevenparameter-Helmert van het scenario lunar-frame-campaign met de aardstations geschat (station { "1" } verankerd), zoals lunar_frame_campaign haar berekent in binary64: de gezamenlijke Fisher-informatie van stations en bakens, opgebouwd Tests: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

seg-49f323360dc3 = <b>VALIDATED</b> Fit van een 7-parameter-Helmert-datum + ICRF-oriëntatiekoppeling uit een netwerk van punten. Onafhankelijke referentie (ExternalDataset): Onafhankelijke gesloten-vorm-solver met gewogen Umeyama (Horn) voor gelijkvormigheidstransformaties (numpy/scipy, op SVD gebaseerd; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — een ander algoritme dan de iteratieve Gauss–Newton-fit van kshana, dat hetzelfde eenduidig gedefinieerde gewogen-kleinste-kwadratenoptimum bereikt op byte-identieke puntnetwerken

seg-d024abcfd87c = <b>MODELLED</b> Het zevenparameter-Helmert-datum, voortgeplant uit een GESIMULEERDE WAARNEMINGSCAMPAGNE in plaats van teruggevonden uit een geïnjecteerde transformatie. Aardstations observeren een van bronnen voorziene. Onafhankelijke referentie (ReferenceImpl): Identiteiten in gesloten vorm en een onafhankelijke route binnen de repository, zonder dat een externe onafhankelijke referentie wordt geclaimd. Het Helmert-ontwerp — de enige nieuwe afgeleide in de module — wordt opnieuw afgeleid via een centraal eindig verschil van lunar_frame_realise::apply_helmert, een pad dat geen enkele uitdrukking deelt met de analytische vorm. De accumulatie die het samenstelt is die van lunar-vlbi-fim, waarvan de Jacobiaan daar via eindige verschillen wordt vergeleken met lunar_vlbi::vlbi_delay_s, en die

seg-0abd7b181f21 = MODELLED door een campagne aangedreven datum van het maanstelsel. De covariantie van de zevenparameter-Helmert wordt voortgeplant uit een informatiematrix van baakencoördinaten die is opgebouwd uit de eigen lunar-VLBI-vertragingspartiëlen van de engine over een expliciet schema van bakens, basislijnen en epochs; GEEN gelijkvormigheidstransformatie wordt geïnjecteerd en er wordt niets teruggevonden uit een geplant antwoord. De baakencatalogus is de van bronnen voorziene tabel met benoemde locaties van de crate, maar de CAMPA (resultaat <c1/>)

seg-f92d22c06cd5 = Correlatie tussen baakenfouten wordt gemeten, niet aangenomen: met vastgehouden stations raakt geen enkele waarneming twee bakens, zodat de informatiematrix exact blokdiagonaal is (offblock_fraction { "0" }), en met geschatte stations is het Schur-gemarginaliseerde blok gekoppeld, waarbij de geïnduceerde correlatie wordt afgedrukt en de hele voortplanting opnieuw wordt uitgevoerd met die correlatie weggelaten, zodat de prijs van een onafhankelijkheidsaanname een getal is. (soortencatalogus (<c1/>))

seg-534cea416496 = MODELLED: de baakencatalogus is van bronnen voorzien maar de CAMPAGNE is gesimuleerd — het stationsnetwerk en de vertragingssigma zijn illustratieve invoer, afzonderlijke vertragingswaarnemingen worden als onafhankelijk behandeld, en de efemeride van het maanmiddelpunt, de stationsklokken, de troposfeer en de aardoriëntatieparameters worden VAST gehouden, zodat de datumcovariantie een Cramer-Rao-grens is voor een verkleinde parameterverzameling. (soortencatalogus (<c1/>))

seg-ec67b9d3adbb = Correlatie tussen baakenfouten is MEASURED, niet aangenomen. Met vastgehouden stations raakt geen enkele waarneming twee bakens, dus de informatiematrix is exact blokdiagonaal (offblock_fraction { "0" }); met geschatte stations is het Schur-gemarginaliseerde blok gekoppeld, wordt de geïnduceerde correlatie afgedrukt en wordt de hele voortplanting opnieuw uitgevoerd met die correlatie weggelaten, zodat de prijs van een onafhankelijkheidsaanname een getal is in plaats van een c (commentaar in het scenariobestand, regels { "17" } tot { "21" })

seg-a2bb557da7ba = MODELLED: de baakencatalogus is van bronnen voorzien maar de CAMPAGNE is gesimuleerd — het stationsnetwerk en de vertragingssigma zijn illustratieve invoer, afzonderlijke vertragingswaarnemingen worden als onafhankelijk behandeld, en de efemeride van het maanmiddelpunt, de stationsklokken, de troposfeer en de aardoriëntatieparameters worden VAST gehouden. Geen geodetisch product. (commentaar in het scenariobestand, regels { "27" } tot { "30" })

seg-57a371bca2c7 = Het maandatum uit een waarnemingscampagne is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-7b56c979b2c9 = <s1>Vorige</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>Volgende</s1>lunar-frame-realisation
