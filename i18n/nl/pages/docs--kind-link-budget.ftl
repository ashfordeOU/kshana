# docs--kind-link-budget: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-a3697ad561db = Hz

seg-cec5c06d38af = <b>MODELLED</b> Maanspecifieke jammer-tot-signaalverhouding, effectieve C/N₀ en verlies van lock voor een selenografische oppervlaktegebruiker onder een jammer op het maanoppervlak (of verhoogd), over de illustratieve constellatie van het type Moonlight/LCNS uit openbare bronnen.

seg-120fcc840b87 = Bron: <c1/>

seg-738aa7d45efb = <c1/> (scenariosoort)

seg-953188c11165 = Eenrichtings-linkbudget volgens de linkvergelijking van CCSDS { "401" } / DSN 810-005: vrije-ruimtepadverlies, C/N₀, Eb/N₀, marge en sluiting voor een zend-EIRP, ontvangst-G/T, afstand, datasnelheid en band (s|x|ka) ten opzichte van een vereiste Eb/N₀. Een deterministische technische berekening op basis van de aangeleverde invoer (geen gekalibreerd terminaldatablad).

seg-6697c741d09c = Eén run van <c1/> vat zich samen als: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, marge { "92.1" } dB (sluit)

seg-2305502051b6 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-588476f4ae75 = Het voorbeeld <c1/> stelt onder meer in:

seg-ebb923e1a3b5 = Resultaatlabel (dat van de engine): Eenrichtings-linkbudget volgens de linkvergelijking van CCSDS { "401" } / DSN 810-005 (EIRP − FSPL − L_other + G/T − k); een deterministische technische berekening op basis van de aangeleverde invoer, GEEN gekalibreerd terminaldatablad

seg-bd375631bc7e = De grafiek die de engine schrijft voor scenarios/link-budget.toml, soort link-budget

seg-4f92669c3946 = <b>VALIDATED</b> Vrije-ruimtepadverlies, C/N₀, Eb/N₀, marge en sluiting volgens de linkvergelijking van CCSDS { "401" } / DSN 810-005 voor EIRP/G·T/afstand/snelheid/band ten opzichte van een vereiste Eb/N₀. Tests: <a1>one_way_link_budget_reference.rs</a1>.

seg-bfaeb6f1cc5a = <b>VALIDATED</b> Vrije-ruimtepadverlies, C/N₀, Eb/N₀, marge en sluiting volgens de linkvergelijking van CCSDS { "401" } / DSN 810-005 voor EIRP/G·T/afstand/snelheid/band ten opzichte van een vereiste Eb/N₀. Runn. Onafhankelijke referentie (ExternalDataset): Gepubliceerde ontwerpcontroletabel voor telecommunicatie in de diepe ruimte als vastgepinde numerieke vectoren: DESCANSO / J. H. Yuen (ed.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo X-band) — kshana stelt de regelposten van de tabel opnieuw samen en reproduceert de gepubliceerde end-to-end L_fs { "290.54" } dB en Pr/N0 { "54.6" } dB-Hz; het vrije-ruimteverlies is ook gecontroleerd aan ITU-R P.525

seg-2598c2360113 = <b>MODELLED</b> Het linkbudgetrapport vermeldt elke absolute constante waaruit zijn eigen marge is berekend -- de draaggolffrequentie die het vrije-ruimteverlies gebruikte, de EIRP, het cijfer o. Onafhankelijke referentie (InternalConsistency): Geen externe onafhankelijke referentie: dit is een zelfbeschrijving over een vergelijking die al is getoetst aan een gepubliceerde ontwerpcontroletabel (zie de rij over het eenrichtings-linkbudget). Ze wordt vastgelegd omdat het ontbreken ervan een gemeten gebrek was -- het reproduceren van de vrijgegeven d1_rate_gain_beamwidth.csv vereiste dat één effectieve constante uit alle dertig rijen terug werd opgelost tot { "0.0034" } dB, en de engine benoemt die combinatie nu en bewijst, met een test

seg-c779823e860c = Optioneel: de systeemruistemperatuur van de ontvanger (K). Ze is GEEN invoer van de linkvergelijking -- die heeft alleen de verhouding G/T nodig -- maar door haar op te geven kan het rapport ook de ontvangstantennewinst geven die de kwaliteitsfactor impliceert (G = G/T + { "10" }*log10(T_sys)). Als ze wordt weggelaten, ontbreekt de winstsplitsing in het rapport in plaats van te worden aangenomen. tsys_k = { "300.0" } (commentaar in het scenariobestand, regels { "21" } tot { "25" })

seg-d717412c4f06 = De zelfbeschrijving van het linkbudgetrapport is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-ffbc9de75306 = <s1>Vorige</s1>leo-signal

seg-59d4cb995cb9 = <s1>Volgende</s1>lunar-attack-surface
