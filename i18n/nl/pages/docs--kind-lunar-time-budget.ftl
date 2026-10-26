# docs--kind-lunar-time-budget: translations (nl)

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-8f8871ac8a0f = Onderwerppagina: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Onderwerppagina: <a1>integrations.md</a1>

seg-11f512367036 = Bron: <c1/>

seg-f7cd4fcfc62d = <c1/> (scenariosoort)

seg-cac3a0bcbfc6 = MODELLED end-to-end tijdfoutbudget voor Coordinated Lunar Time (LTC): de zeven LTC-foutermen samengesteld als tijdfoutcurven x_i(τ) over een heel raster van middelingstijden, kwadratisch opgeteld tot x_Σ(τ), en het OVERGANGS-τ tussen klok en stelsel waarbij de groeiende kloktermijn de constante realtime-term voor de realisatie van het stelsel inhaalt (eronder wordt het budget door het stelsel beperkt, erboven door de klok) — het eerlijke antwoord op het artefact van één enkele τ. De τ-hellingen zijn in gesloten vorm en analytisch controleerbaar (klok τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, ondergrenzen τ^{ "0" }, meting τ^{ "{" }-1/2{ "}" }) en de klokrijen reproduceren de gepubliceerde klokspecificaties voor één dag (crate::clock_specs); de GROOTTEN van de ondergrenzen voor RF-/optische link, realisatie van het stelsel, relativistisch residu en efemeride zijn gemodelleerde budgettoewijzingen (gedocumenteerde standaardwaarden, door de aanroeper te overschrijven), geen metingen. De bijdrage is het reproduceerbare overgangs-τ, niet een gecertificeerd getal per term; niet gecertificeerd voor operationele tijdhouding.

seg-8a5c9e451d4e = Eén run van <c1/> vat zich samen als: lunar-time-budget | klok passive-h-maser | x_Σ(τ) met 7 termen over { "57" } τ-punten ({ "1" }–{ "1e7" } s) | overgangs-τ { "8.689e4" } s (x { "1.001e-9" } s) | stelselondergrens { "1.001e-9" } s | klok x({ "1" } d) { "0.995" } ns (MODELLED)

seg-7cdc521303eb = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-c050033b32c3 = Het voorbeeld <c1/> stelt onder meer in:

seg-eebd3e40d0b9 = Resultaatlabel (dat van de engine): MODELLED end-to-end LTC-tijdfoutbudget. De τ-hellingen zijn in gesloten vorm en analytisch controleerbaar (klok τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, ondergrenzen τ^{ "0" }, meting τ^{ "{" }-1/2{ "}" }) en de klokrijen reproduceren de gepubliceerde klokspecificaties voor één dag; de ondergrenzen voor RF-/optische link, realisatie van het stelsel, relativistisch residu en efemeride

seg-56fe184f2a12 = De grafiek die de engine schrijft voor scenarios/lunar-time-budget.toml, soort lunar-time-budget

seg-b03509dfcb1b = <b>MODELLED</b> Eén run van lunar-time-budget geeft per klokklasse een rij met het overgangspunt tussen klok en stelsel uit, tegenover één gedeelde stelselterm, zodat de klok de enige variabele in de vergelijking is; elke rij draagt het overgangspunt op twee manieren bereikt -- door bisectie uit de gen

seg-fd52e493b6c2 = <b>MODELLED</b> Het optionele blok [time_lab] van het scenario lunar-time-budget modelleert de klok van een referentiestation op de maan (standaard de klasse miniRAFS, of een andere benoemde klasse, of een apparaatkaart gefit aan vermelde stabiliteitspunten) gestuurd naar Coordinated Lunar Time en Tests: <a1>lunar_station_time_lab.rs</a1>.

seg-d8807d5308d4 = <b>MODELLED</b> Eén run van lunar-time-budget geeft per klokklasse een rij met het overgangspunt tussen klok en stelsel uit, tegenover één gedeelde stelselterm, zodat de klok de enige variabele in de verg. Onafhankelijke referentie (InternalConsistency): Twee verschillende berekeningen binnen de codebase van dezelfde grootheid, niet één die wordt herhaald: bisectie op de machtswetcurve van IEEE-1139 weet niets van het ruistype, terwijl de gesloten vorm het overheersende type algebraïsch inverteert, zodat een verkeerd geclassificeerd ruistype of een slechte omsluiting zich toont als een niet-verwaarloosbaar klein relatief verschil. De vier waarden reproduceren ook de gepubliceerde tabel van de paper tot de helft van haar laatste afgedrukte cijfer -- maar die tabel was zelf

seg-4c0d7da4f7f6 = <b>MODELLED</b> Het scenario lunar-time-budget publiceert zijn uitvoer met array-waarden als een tabel in lange vorm (rasterindex, middelingstijd, term) naast het rapport, zodat de zeven per. Onafhankelijke referentie (InternalConsistency): Alleen zelfconsistentie: het gepubliceerde totaal wordt gecontroleerd aan de wortel uit de som van de kwadraten van de termen in hetzelfde bestand, en de uitgegeven curve reproduceert de vrijgegeven p3_time_budget_curve.csv over alle { "57" } punten. Beide controles delen de eigen termdefinities van deze engine, dus geen van beide is onafhankelijk. De kloktermijn rust op gepubliceerde klokspecificaties, maar de GROOTTEN van de ondergrenzen voor link, stelsel, relativistisch effect en efemeride zijn gedocumenteerd

seg-8abdeb1a36e1 = MODELLED end-to-end LTC-tijdfoutbudget. De τ-hellingen zijn in gesloten vorm en analytisch controleerbaar (klok τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, ondergrenzen τ^{ "0" }, meting τ^{ "{" }-1/2{ "}" }) en de klokrijen reproduceren de gepubliceerde klokspecificaties voor één dag; de GROOTTEN van de ondergrenzen voor RF-/optische link, realisatie van het stelsel, relativistisch residu en efemeride zijn gemodelleerde budgettoewijzingen (gedocumenteerde standaardwaarden, door de aanroeper te overschrijven), geen metingen. De bijdrage (resultaat <c1/>)

seg-66a794432751 = MODELLED end-to-end tijdfoutbudget voor Coordinated Lunar Time (LTC): de zeven LTC-foutermen samengesteld als tijdfoutcurven x_i(τ) over een heel raster van middelingstijden, kwadratisch opgeteld tot x_Σ(τ), en het OVERGANGS-τ tussen klok en stelsel waarbij de groeiende kloktermijn de constante realtime-term voor de realisatie van het stelsel inhaalt (eronder wordt het budget door het stelsel beperkt, erboven door de klok) — het eerlijke antwoord op het artefa (soortencatalogus (<c1/>))

seg-ca1763d4a416 = Eerlijkheid: MODELLED. De tau-hellingen zijn in gesloten vorm en analytisch controleerbaar (klok tau^{ "{" }+1/2{ "}" } of tau^{ "{" }+{ "1" }{ "}" }, ondergrenzen tau^{ "0" }, meting tau^{ "{" }-1/2{ "}" }) en de klokrijen reproduceren de gepubliceerde klokspecificaties voor één dag; maar de GROOTTEN van de ondergrenzen voor RF-/optische link, realisatie van het stelsel, relativistisch residu en efemeride zijn gemodelleerde budgettoewijzingen (gedocumenteerde standaardwaarden, door de aanroeper te overschrijven), geen metingen. De bijdrage is (commentaar in het scenariobestand, regels { "13" } tot { "18" })

seg-8f884949bdf1 = De overgangstabel voor maantijd per klokklasse is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-5eaed32490ca = De reproduceerbaarheid van het tijdfoutbudget voor de maan is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Vorige</s1>lunar-station-coverage

seg-a0992d394960 = <s1>Volgende</s1>lunar-time-offset
