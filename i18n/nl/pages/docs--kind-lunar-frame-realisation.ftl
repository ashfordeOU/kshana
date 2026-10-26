# docs--kind-lunar-frame-realisation: translations (nl)

seg-98151954f217 = false

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-49f323360dc3 = <b>VALIDATED</b> Fit van een 7-parameter-Helmert-datum + ICRF-oriëntatiekoppeling uit een netwerk van punten. Onafhankelijke referentie (ExternalDataset): Onafhankelijke gesloten-vorm-solver met gewogen Umeyama (Horn) voor gelijkvormigheidstransformaties (numpy/scipy, op SVD gebaseerd; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — een ander algoritme dan de iteratieve Gauss–Newton-fit van kshana, dat hetzelfde eenduidig gedefinieerde gewogen-kleinste-kwadratenoptimum bereikt op byte-identieke puntnetwerken

seg-0225ace73ba8 = Bron: <c1/>

seg-a092c5795651 = <c1/> (scenariosoort)

seg-0c4c119abfca = Gemodelleerde realisatie van het maanreferentiestelsel: een fit van een 7-parameter-Helmert-datum (gelijkvormigheid) — { "3" } translatie, { "3" } rotatie met kleine hoek, { "1" } schaal — die een geschatte verzameling puntcoördinaten in MCMF, afgeleid van selenografische coördinaten, met gewogen kleinste kwadraten (crate::batch_ls::gauss_newton) aan een datum koppelt, plus een eenvoudige oriëntatiekoppeling die de gerealiseerde kleine rotatie om de ICRF-assen uitdrukt ten opzichte van de lichaamsoriëntatie volgens IAU { "2015" } WGCCRE. Het scenario injecteert een bekende kleine transformatie (translatie ~tientallen m, rotatie ~µrad, schaal ~{ "1e-7" }) in een goed gespreid synthetisch puntnetwerk, voegt geseede gaussische ruis toe, herstelt het datum, en rapporteert de herstelde transformatie, de herstelfout per parameter ten opzichte van de geïnjecteerde referentie en het RMS-residu na de fit. MODELLED zelfconsistentie — herstelt een geïnjecteerde gelijkvormigheidstransformatie (zonder ruis tot ongeveer machineprecisie), GEEN realisatie ten opzichte van echte tracking- of VLBI-gegevens; deterministisch (geseed); geen TRL, geen heritage, geen onderschrijving door een ruimtevaartorganisatie.

seg-32d5e2749e64 = Eén run van <c1/> vat zich samen als: lunar-frame-realisation | { "8" } punten | translatiefout { "3.125e-1" } m, rotatiefout { "3.418e-7" } rad, schaalfout -5.891e2 ppb | rms-residu { "0.887" } m | converged false

seg-e732d2c2ab91 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-29f85024974b = Het voorbeeld <c1/> stelt onder meer in:

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = De grafiek die de engine schrijft voor scenarios/lunar-frame-realisation.toml, soort lunar-frame-realisation

seg-f99a78efa965 = MODELLED zelfconsistentie — herstelt een geïnjecteerde gelijkvormigheidstransformatie (zonder ruis tot ongeveer machineprecisie), GEEN realisatie ten opzichte van echte tracking- of VLBI-gegevens; deterministisch (geseed); geen TRL, geen heritage, geen onderschrijving door een ruimtevaartorganisatie. (soortencatalogus (<c1/>))

seg-238cea087ae0 = Eerlijkheid: MODELLED zelfconsistentie. De onafhankelijke referentie is het herstel van een geïnjecteerde gelijkvormigheidstransformatie met 7 parameters (zonder ruis tot ongeveer machineprecisie) plus de algebraïsche heen-en-terugidentiteit van apply_helmert. Dit is GEEN realisatie van het maanreferentiestelsel ten opzichte van echte tracking- of VLBI-gegevens en claimt geen absolute nauwkeurigheid van het stelsel. Deterministisch (geseed). Er wordt geen TRL, vluchterfgoed of onderschrijving door een ruimtevaartorganisatie geclaimd. (commentaar in het scenariobestand, regels { "23" } tot { "27" })

seg-07550d3d9610 = <s1>Vorige</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>Volgende</s1>lunar-infrastructure
