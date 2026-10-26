# docs--kind-ins-trn-coast: translations (nl)

seg-bf51947657c0 = navigatie

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-c4ed27a559df = Onderwerppagina: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-7b2721b7588d = Scenariosoort van de engine v{ $version }, familie <a1>Inertiële, fusie- en kwantumsensoren</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-195347c63a8a = m/s^{ "2" }

seg-f7f12029e0ec = Familiepagina: <a1>Inertiële, fusie- en kwantumsensoren</a1>

seg-f7305f3a0b5a = Bron: <c1/>

seg-92b90cb4a839 = <c1/> (scenariosoort)

seg-5b9a6efe6337 = Foutmodel voor INS/TRN-uitloop: positiefout tegen uitloopduur, opgebouwd uit IMU-coëfficiënten in plaats van gesweept als aangenomen driftsnelheid. Vijf groeibijdragen — accelerometerbias, gyrobias-kanteling via de zwaartekracht, velocity random walk, angle random walk en schaalfactor tegen de afgelegde afstand — elk gepropageerd door een inertiaal foutmodel met negen toestanden in het lokale horizontale vlak met Schuler-terugkoppeling op een vermelde breedtegraad en hoogte (de leidende-orde-wetten voor korte uitloop t², t³, t^{ "1.5" }, t^{ "2.5" } en t¹/t² worden ernaast gerapporteerd) en gecombineerd volgens een VERMELDE regel (wortel uit de som van kwadraten als standaard, of lineaire som, of deterministische som met stochastische rss; alle drie worden bij elke run berekend, zodat de keuze zichtbaar is in plaats van begraven). De uitloopduren waarbij door de aanroeper opgegeven positiedrempels worden bereikt ({ "10" } m en { "50" } m als standaard) worden gevonden met de bestaande bisectie van de engine, elk met een uitsplitsing per bijdrage die de dominante bron noemt, en het kruispunt van elke afzonderlijke bijdrage wordt bovendien algebraïsch geïnverteerd zodat beide overeenkomen. Een modus voor terreinrelatieve navigatie begrenst de uitloop met periodieke positiebepalingen en rapporteert het grootste interval tussen positiebepalingen dat elke drempel houdt; een positiebepaling met alleen positie laat snelheidsfout en kanteling over de positiebepaling heen bestaan, dus ze begrenst de uitloop niet altijd bij enige frequentie van positiebepalingen, en het rapport zegt dat in plaats van een nul terug te geven. MODELLED: de coëfficiënten van de IMU-klasse zijn representatieve bandcijfers, geen datasheet, en het residu van de terreinpositiebepaling is een invoer. Een niet bereikte drempel wordt gerapporteerd als null met een status, nooit als nul. Geen gecertificeerd prestatieproduct voor inertiële navigatie.

seg-bbd497aa3ba6 = Eén run van <c1/> vat samen als: ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

seg-e0555ca683b1 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-95887c4551c7 = Het voorbeeld <c1/> stelt onder meer in:

seg-4db5a594afc1 = rss

seg-5868f641c089 = ug

seg-1918189ac2bf = ppm

seg-7eba4c5ee1e4 = Resultaatlabel (van de engine): MODELLED foutbudget voor INS/TRN-uitloop. Elke bijdrage wordt gepropageerd door een inertiaal foutmodel met negen toestanden in het lokale horizontale vlak met Schuler-terugkoppeling (horizontaal platform met koers noord op een vermelde locatie, vrij-inertiaal inclusief het onstabiele verticale kanaal); de leidende-orde-wetten voor korte uitloop (bias t^{ "2" }, gy

seg-134a4c91da3a = De grafiek die de engine schrijft voor scenarios/ins-trn-coast.toml, soort ins-trn-coast

seg-7bb77ec86a0a = <b>VALIDATED</b> Budget van positiefout tegen uitloopduur opgebouwd uit IMU-coëfficiënten, elke foutbron (accelerometerbias, gyrobias, velocity random walk, angle random walk, schaalfactor bij kruisvlucht en onder aanhoudende specifieke kracht) gepropageerd door een n

seg-d69247df315f = <b>VALIDATED</b> Budget van positiefout tegen uitloopduur opgebouwd uit IMU-coëfficiënten, elke foutbron (accelerometerbias, gyrobias, velocity random walk, angle random walk, . Onafhankelijke referentie (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), als afzonderlijk programma uitgevoerd onder GNU Octave { "8.4.0" }: vrij-inertiale uitloopruns met hetzelfde IMU-foutprofiel, met één gecorrigeerde numerieke dode band in zijn quaternion-update (qua_update.m: de bewaking op een snelheid onder { "1e-8" } rad/s vervangen door wnorm == { "0" }, toegepast op een kopie tijdens de run en één keer gecontroleerd op overeenkomst; met de bewaking op zijn plaats bevroor een langzaam driftende platformattitude en kapte de

seg-498cb2f96fa7 = MODELLED foutbudget voor INS/TRN-uitloop. Elke bijdrage wordt gepropageerd door een inertiaal foutmodel met negen toestanden in het lokale horizontale vlak met Schuler-terugkoppeling (horizontaal platform met koers noord op een vermelde locatie, vrij-inertiaal inclusief het onstabiele verticale kanaal); de leidende-orde-wetten voor korte uitloop (bias t^{ "2" }, gyrobias-kanteling t^{ "3" }, velocity random walk t^{ "1.5" }, angle random walk t^{ "2.5" }, schaalfactor x afgelegde afstand) worden gecontroleerd (resultaat <c1/>)

seg-63c221a546f7 = Foutmodel voor INS/TRN-uitloop: positiefout tegen uitloopduur, opgebouwd uit IMU-coëfficiënten in plaats van gesweept als aangenomen driftsnelheid. (soortencatalogus (<c1/>))

seg-164504645f4a = MODELLED: de coëfficiënten van de IMU-klasse zijn representatieve bandcijfers, geen datasheet, en het residu van de terreinpositiebepaling is een invoer. (soortencatalogus (<c1/>))

seg-ee0281a1f401 = De vraag die dit beantwoordt: wanneer een GNSS-studie (of een studie met apertuur-dutycycle) zegt "neem een koppelnavigatiedrift van { "0.001" }–{ "0.050" } m/s aan", waar komt dat getal dan vandaan? Het komt van de IMU, en dit scenario berekent het in plaats van het te sweepen. Vijf groeitermen — accelerometerbias (t^{ "2" }), gyrobias-kanteling via de zwaartekracht (t^{ "3" }), velocity random walk (t^{ "1.5" }), angle random walk (t^{ "2.5" }) en schaalfactor maal de afgelegde afst (opmerking in het scenariobestand, regels { "4" } tot { "11" })

seg-32d4adcfe249 = <s1>Vorige</s1>inertial

seg-47366ab55be3 = <s1>Volgende</s1>integrity
