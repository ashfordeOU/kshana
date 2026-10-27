# docs--kind-lunar-vlbi: translations (nl)

seg-c1ce24cd6008 = analytisch

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-df90e5910fb4 = uur

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b> Vertragingspartiëlen, opgeteld over een schema van basislijnen × epochs tot een Fisher-informatiematrix, geïnverteerd tot de covariantie van de stationscoördinaten en de sigma van het station per coördinaat, ter vervanging van een aangenomen isotrope equipartitieschakel uit een

seg-55ce02ad5dd5 = <b>MODELLED</b> Een derde datumkeuze, <c1/>, die elk aardstation vasthoudt en alleen de maanlichaamsvaste coördinaten van het BAKEN schat — de configuratie waarvoor een onzekerheid van een punt op het maanoppervlak daadwerkelijk wordt opgegeven, aangezien de coördinaten van aardstations

seg-afeb6e26c5ad = Bron: <c1/>

seg-6d1a32afd780 = <c1/> (scenariosoort)

seg-e01f77d493a0 = Gemodelleerde geodetische VLBI-vertraging op de maan als waarneembare grootheid: een aardbasislijn (twee grondstations, GCRS) observeert een eenrichtingssignaal van een baken van het type NovaMoon op het maanoppervlak. Geeft de nabijeveld-vertraging als verschil van twee afstanden uit, haar snelheid en de nabijeveldcorrectie voor golffrontkromming over een passage — gecontroleerd aan de vlakke-golf-Δ-DOR-waarneembare uit dezelfde codebase in de verre-veldlimiet, met partiëlen die via eindige verschillen zijn geverifieerd. Het standaard analytische pad is MODELLED en draagt de kanttekeningen over stelselconsistentie, poolbeweging xp=yp={ "0" } en vlakke golf tegenover nabij veld. Door planetary_kernel_path, earth_orientation_kernel_path en moon_orientation_kernel_path in te stellen, loopt in plaats daarvan het kernelpad (DE440, MOON_PA_DE440, ITRF93; geconvergeerde barycentrische looptijden van het licht; voegt de partiëlen van baken en station van de epoch toe), waarvan de newtoniaanse vertraging en partiëlen overeenkomen met de geconvergeerde looptijden van het licht van NAIF SPICE tot { "0.06" } ps en { "7.4e-9" }. Niet getoetst aan echte VLBI-gegevens.

seg-92227c085867 = Eén run van <c1/> vat zich samen als: lunar-vlbi | basislijn { "10727" } km | bakenafstand { "402900" } km | vertraging -10049.126 µs (snelheid { "1.312e-6" } s/s) | nabij veld { "58.9" } µs | { "13" } samples over { "6.0" } h

seg-1a38a07a0d70 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

seg-11450a55fc9d = Het voorbeeld <c1/> stelt onder meer in:

seg-07d97fc1abac = De grafiek die de engine schrijft voor scenarios/lunar-vlbi.toml, soort lunar-vlbi

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-61f431e422e5 = <b>MODELLED</b> Nabijeveld-VLBI-vertraging voor een aardbasislijn die een maanbaken waarneemt + partiëlen

seg-7342b50d34e4 = <b>VALIDATED</b> Nabijeveld-VLBI-vertraging voor een aardbasislijn die een maanbaken waarneemt, met partiëlen van baken en station, op het kernelpad (lunar_vlbi::KernelGeometry): DE440 aarde en maan, DE440 hoofdassen van de maan, ITRF93-aardoriëntatie met UT1 en Tests: <a1>naif_kernel_reader_check.rs</a1>.

seg-5547f1f662d3 = en { "2" } meer in de matrix.

seg-1461c84350d8 = <b>MODELLED</b> Nabijeveld-VLBI-vertraging voor een aardbasislijn die een maanbaken waarneemt + partiëlen. Onafhankelijke referentie (ReferenceImpl): Vlakke-golf-delta_dor (zelfde codebase) in de verre-veldlimiet; partiëlen via eindige verschillen. { "0.30" } externe vergelijking, een bevinding (blijft MODELLED): tegenover de geconvergeerde looptijden van het licht van ANISE { "0.10" } via DE440 ({ "75" } vertragingen op 2024-01-01 over drie DSN-basislijnen, gegenereerd door xval/anise-lunar-od zonder Kshana-code) valt geen enkele vertraging binnen de tolerantie van { "1" } ps. Het grootste verschil is { "24" } µs, door het analytische maanmiddelpunt (ongeveer { "200" } km van DE

seg-b41c162b015f = Het standaard analytische pad is MODELLED en draagt de kanttekeningen over stelselconsistentie, poolbeweging xp=yp={ "0" } en vlakke golf tegenover nabij veld. (soortencatalogus (<c1/>))

seg-0beac99bb095 = Eerlijkheid: MODELLED, NIET getoetst aan echte VLBI-gegevens. De poolbeweging is weggelaten (xp = yp = { "0" }), zodat de inertiale stationsposities een stelselfout van enkele meters dragen; het baken combineert een reeks voor de gemiddelde maanevenaar van de datum met een ICRF-lichaamsvaste offset (jd_tdb ~ jd_tt), een stelselinconsistentie onder de modelnauwkeurigheid; geen iteratie van de looptijd van het licht, geen media of aberratie voorbij de gedifferentieerde Shapiro. Geen TRL, vluchtheritage of onderschrijving door een ruimtevaartorg (commentaar in het scenariobestand, regels { "17" } tot { "21" })

seg-58b64e5ff3db = Geodetische VLBI op de maan is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-04089c4d6fbe = <s1>Vorige</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>Volgende</s1>mars-pnt
