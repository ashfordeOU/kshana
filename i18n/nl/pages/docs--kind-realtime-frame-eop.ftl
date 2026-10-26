# docs--kind-realtime-frame-eop: translations (nl)

seg-8e845ce908ee = Scenariokind van de engine v{ $version }, familie <a1>GNSS-metingen, positiebepaling en integriteit</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-f6b7ca020692 = Familiepagina: <a1>GNSS-metingen, positiebepaling en integriteit</a1>

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-1ad013ffb9d1 = Bron: <c1/>

seg-54620502f0dd = <c1/> (scenariosoort)

seg-edfcb546d9de = Budget voor de voorspelling van het lunaire referentiestelsel / de aardoriëntatie in realtime: P4 Tabel { "1" } (de consistentiecontrole van de referentiestelselfout — nabewerkt ~{ "0.27" } m ↔ ~{ "0.010" } ms en realtime ~{ "15" } m ↔ ~{ "0.5" } ms, elke positie in het referentiestelsel uitgedrukt als de equivalente UT1-fout via de hefboomarm L19 Δr = D_EM·ω⊕·ΔUT1) en Tabel { "2" } (gemeten UT1-voorspelfout tegenover horizon — de L18-curve rechtstreeks afgelezen uit de echte IERS finals2000A-reeks: de eindondergrens Bulletin A − Bulletin B en de voorspelfout van de persistentievoorspeller over meerdere dagen, elk via L19 afgebeeld op een positie in het Maanstelsel), plus het kwadratische-sombudget L21 voor de realtime referentiestelselfout (EOP + efemeride + realisatieondergrens). VALIDATED gesloten vorm (de hefboomarm L19, ω⊕ gecontroleerd tegen de CIO-aardrotatiehoek) en VALIDATED echte data (de L18-curve uit de echte rijen van finals2000A); MODELLED zijn de groottes van de covariantie van baanbepaling voor het lunaire relais en de realisatieondergrens van het referentiestelsel (representatieve toewijzingen) en de persistentievoorspeller (niet het operationele Bulletin A-algoritme van de IERS). Geen gecertificeerd realtime referentiestelselproduct.

seg-488039e4240f = Eén run van <c1/> vat samen als: realtime-frame-eop | Tabel { "1" }: nabewerkt { "0.27" } m ({ "0.0096" } ms UT1) ↔ realtime { "14.4" } m ({ "0.514" } ms UT1) | Tabel { "2" }: eindondergrens { "0.0171" } ms → 3 dagen { "1.6644" } ms | totaalbudget { "20.1" } m ({ "67.0" } ns) | hefboomarm L19 + echte data L18 (getoetst), OD-cov (gemodelleerd)

seg-66264ec78a4c = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-45a4ed476311 = Het voorbeeld <c1/> stelt onder meer in:

seg-c39a26aa1f1e = bundled fixture finals2000A_20260930

seg-9ef8a2b4c144 = Resultaatlabel (van de engine): Budget voor de voorspelling van het lunaire referentiestelsel / de aardoriëntatie in realtime. VALIDATED gesloten vorm: de hefboomarm L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ gecontroleerd tegen de CIO-aardrotatiehoek. VALIDATED echte data: de L18-voorspelfoutcurves voor UT1 en poolbeweging, rechtstreeks afgelezen uit de echte IERS finals200

seg-2721ed7727bb = De grafiek die de engine schrijft voor scenarios/realtime-frame-eop.toml, soort realtime-frame-eop

seg-72a1fc2f5c90 = <b>VALIDATED</b> Eén tabel rapporteert de UT1-voorspelfout, de poolfout van de poolbeweging en hun kwadratische combinatie bij de Maan over een IDENTIEKE epochset per horizon, en geeft de epochs af waarop elke component is gemeten. Tests: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

seg-b1d90bf98ac3 = <b>VALIDATED</b> De standaard tijdens runtime van <c1/> is de eigen ingebedde kopie van de bibliotheek van een letterlijk uittreksel van IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } opeenvolgende dagrijen, MJD 61224-61397, geknipt uit de finals2000A.all van 2026-09-30) met Tests: <a1>operational_eop_predictor_reference.rs</a1>.

seg-0298bd40d72f = <b>MODELLED</b> Een kleinste-kwadratenfit van bias plus helling over een achterliggend venster plus de voornaamste periodieke termen — jaarlijks, halfjaarlijks en de twee voornaamste zonale getijden voor UT1; Chandler, jaarlijks en halfjaarlijks voor de pool — geëxtrapoleerd met de laatste in-venster Tests: <a1>operational_eop_predictor_reference.rs</a1>.

seg-12efcd20ca62 = <b>VALIDATED</b> Eén tabel rapporteert de UT1-voorspelfout, de poolfout van de poolbeweging en hun kwadratische combinatie bij de Maan over een IDENTIEKE epochset per horizon, en geeft. Onafhankelijke referentie (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) dat het IERS-product finals2000A leest met zijn eigen regel Bulletin B anders A, en volledige hemels-naar-terrestrische rotaties van pyerfa { "2.0.1.5" } (SOFA) (c2i06a, sp00, pom00, c2tcio; de aardrotatiehoek volgens IERS { "2010" } vgl. { "5.15" } in exacte rekenkunde), gedraaid als afzonderlijke programma's op letterlijke rijen van de bevroren finals2000A.all van 2026-09-30; gepreregistreerd (455b8fb5) met amendementen A1 en A2 die alleen vastleggen

seg-020e5919c8fd = <b>VALIDATED</b> De standaard tijdens runtime van <c1/> is de eigen ingebedde kopie van de bibliotheek van een letterlijk uittreksel van IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } opeenvolgende. Onafhankelijke referentie (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), dat dezelfde bytes leest met zijn eigen lezer, en de tabel van IERS Bulletin A Vol. XXXIX No. { "039" }, getal voor getal overgenomen; gepreregistreerd (6fdae01b) met zes exacte criteria voordat astropy werd gedraaid. Alle zes gelden: { "30" } definitieve, { "54" } snelle en { "90" } voorspelde rijen met gelijke MJD-lijsten, elke voorspelde rij met vlag P, de telling van de standaardrun gelijk, en de voorspellingen gelijk aan Bullet

seg-530c87bbff78 = <b>MODELLED</b> Een kleinste-kwadratenfit van bias plus helling over een achterliggend venster plus de voornaamste periodieke termen — jaarlijks, halfjaarlijks en de twee voornaamste zonale getijden voor UT1; Cha. Onafhankelijke referentie (ReferenceImpl): drie onafhankelijke routes, geen van hen een gepubliceerd cijfer voor voorspelnauwkeurigheid. ({ "1" }) Een analytisch signaal met bekende coëfficiënten — de enige manier om de periodieke machinerie te beproeven, omdat geen enkele vastgelegde reeks lang genoeg is voor een jaarlijkse term. ({ "2" }) De gangbare kleinste-kwadratenoplossing in gesloten vorm, andere algebra dan de matrixoplossing die wordt getest, op echte rijen. ({ "3" }) De echte gearchiveerde voorspelrijen van Bulletin A die de

seg-a233df86be95 = Budget voor de voorspelling van het lunaire referentiestelsel / de aardoriëntatie in realtime. VALIDATED gesloten vorm: de hefboomarm L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ gecontroleerd tegen de CIO-aardrotatiehoek. VALIDATED echte data: de L18-voorspelfoutcurves voor UT1 en poolbeweging, rechtstreeks afgelezen uit de echte IERS finals2000A-reeks (Bulletin A snel tegenover Bulletin B definitief, en persistentie over meerdere dagen over de echte dagrijen). AFGELEID: het referentiestelsel (resultaat <c1/>)

seg-60e7ee7e6e3e = VALIDATED gesloten vorm (de hefboomarm L19, ω⊕ gecontroleerd tegen de CIO-aardrotatiehoek) en VALIDATED echte data (de L18-curve uit de echte rijen van finals2000A); MODELLED zijn de groottes van de covariantie van baanbepaling voor het lunaire relais en de realisatieondergrens van het referentiestelsel (representatieve toewijzingen) en de persistentievoorspeller (niet het operationele Bulletin A-algoritme van de IERS). (soortencatalogus (<c1/>))

seg-ddf4702f78e5 = Eerlijkheid: VALIDATED gesloten vorm (de hefboomarm L19, omega_earth gecontroleerd tegen de CIO-aardrotatiehoek) en VALIDATED echte data (de L18-curven voor UT1 en poolbeweging uit de echte rijen van finals2000A). AFGELEIDE realisatieondergrens van het referentiestelsel (het Helmert-restant na de fit). MODELLED zijn de groottes van de covariantie van baanbepaling voor het lunaire relais ({ "0.27" } m nabewerkt, ~{ "14.4" } m realtime bij een latentie van een uur — een afgeronde, niet teruggerekende, al (opmerking in het scenariobestand, regels { "27" } tot { "32" })

seg-bc51b666d070 = De voorspelfout van de aardoriëntatie in operationele stijl, gemeten als voorspeld tegenover definitief, is MODELLED, niet getoetst: gecontroleerd aan de hand van een afzonderlijke implementatie in dezelfde codebasis — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-653fad5e0afe = <s1>Vorige</s1>quantum-trade

seg-5abe534d4ef1 = <s1>Volgende</s1>reentry

seg-a2889fb2b42a = Onderwerppagina: <a1>integrations.md</a1>
