# docs--kind-leo-pvt: translations (nl)

seg-7f5ad6ab8c23 = GPS

seg-b054c73f22e5 = geen waarde

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Onderwerppagina: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie in een lage baan om de aarde</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-c5478f572d21 = Familiepagina: <a1>Navigatie in een lage baan om de aarde</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Bron: <c1/>

seg-fdba999dab11 = <c1/> (scenariosoort)

seg-093aac4b5ff1 = Gefuseerde positiebepaling, navigatie en tijdsynchronisatie (PNT) met satellieten in een middelhoge baan (MEO) en een lage baan (LEO) over ELKE constellatie: elk [[system]] is een GNSS-voorinstelling van de soort constellation-design, een LEO-voorinstelling (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, het efemeridemodel atomic-zero-clock, of een ander voorinstellingsbestand, elk in een eigen bestand met zijn bronnen gemarkeerd als PUBLIC, WORKSHOP of AFGELEID), Walker-schillen of expliciete elementensets, met een draaggolf, een chipsnelheid, een omhullende van de draaggolf-ruisdichtheid (C/N0) van het elevatiemasker tot het zenit, een signal-in-space-afstandsfout (SISRE), een Doppler-sigma en een klokmodel (zijn eigen klok van de ontvanger, zodat de inter-systeembias wordt geschat, of een bekende uitgezonden offset). Vier modi. DOPPLER: batch-Gauss-Newton-positiebepaling uit afstandssnelheid met analytische partiële afgeleiden, klokdrift- en optionele snelheidstoestanden en een optionele hoogtebeperking, met een of meer satellieten, de fout tegen vensterlengte, de omhullende van Doppler, Doppler-snelheid en jerk van elk LEO-systeem, en de nauwkeurigheid langs en dwars op het spoor bij één pass tegen de offset dwars op het spoor (de fout dwars op het spoor groeit onbegrensd naarmate de pass over het zenit gaat; een enkele pass heeft ook een spiegeloplossing aan de andere kant van het grondspoor). Een Doppler-only signal of opportunity (starlink-sop) draait hier. JOINT: gewogen kleinste-kwadraten-pseudorangebepalingen per epoche met alleen GNSS, alleen LEO en beide, sigma's per meting uit een thermisch-ruismodel van de delay-lock-loop bij C/N0 plus de SISRE (of een vaste sigma, zodat een signaalmodel ze kan voeden), de geschatte inter-systeembiases, en PDOP/HDOP/VDOP tegen het aantal toegevoegde LEO-satellieten. POLAR: satellieten in zicht en DOP tegen breedtegraad voor GNSS, LEO en beide. TIMING: tijdoverdracht naar Coordinated Universal Time (UTC) vanaf LEO-satellieten op een bekende positie met een klokfilter met twee toestanden waarvan de procesruis uit de oscillatorklassen van de engine komt, tegen C/N0 en de oscillator, en de uitdrukking uit IS-GPS-200 voor systeemtijd naar UTC; met [timing] trace = true rapporteert elke rij ook zijn tijdfout en voorspelde sigma bij elke epoche. VALIDATED: de grootste Doppler van een pass van zenit tot horizon tegen de gepubliceerde cijfers van Iridium (tot { "36" } kHz) en Xona Pulsar X1 ({ "32" } tot { "34" } kHz). MODELLED: al het overige; de DOP wordt gecontroleerd tegen een met de hand afgeleid geval, de positiebepalingen tegen hun covariantie, en het Doppler-model tegen de identiteit van de afstandsversnelling.

seg-f34d4bbcac4d = Eén run van <c1/> vat samen als: LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

seg-e271a69236bf = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Het voorbeeld <c1/> stelt onder meer in:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = { "7" } meegeleverde scenario's gebruiken deze soort; de overige staan in <a1><c1/></a1>.

seg-b43a7ee40372 = Resultaatlabel (van de engine): MODELLED gezamenlijke gewogen-kleinste-kwadraten-pseudorangepositiebepaling met één klok per systeem of een bekende offset; ruis uit het delay-lock-loop-model bij de C/N0-omhullende plus de signal-in-space-afstandsfout

seg-90361a6f4e3c = De grafiek die de engine schrijft voor scenarios/leo-pvt-fjord-skyline.toml, soort leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-68aa305e05a4 = <b>VALIDATED</b> Exacte afstandssnelheid van een satelliet waarvan de aardvaste positie en snelheid uit een baan met twee lichamen komen met de seculiere J2-drift en de rotatie van de aarde (leo_fusion::geom::EarthOrbit::state, snelheid de exacte tijdsafgeleide van de positie), Tests: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Batch-Gauss-Newton-positiebepaling uit afstandssnelheid met analytische partiële afgeleiden (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), optioneel een constante gebruikerssnelheid, een hoogtepseudometing voor een gebruiker aan het oppervlak, gedempte s Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Gewogen-kleinste-kwadraten-Gauss-Newton-positiebepalingen over elke combinatie van systemen, één klok van de ontvanger per systeem (de inter-systeembias geschat samen met de positie) of een bekende uitgezonden offset op de referentietijdschaal; sigma's per meting geleverd door Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Klokmetingen van elke LEO-satelliet in zicht op een bekende positie, gecombineerd met inverse variantie uit het pseudorange-ruismodel, gefilterd door een Kalman-filter met twee toestanden (fase, frequentie) waarvan de procesruis die van de oscillatorklasse is w Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = en { "1" } meer in de matrix.

seg-f6bd93155e41 = <b>MODELLED</b> Gewogen-kleinste-kwadraten-Gauss-Newton-positiebepalingen over elke combinatie van systemen, één klok van de ontvanger per systeem (de inter-systeembias geschat samen met de positie) of een bekende. Onafhankelijke referentie (InternalConsistency): Een met de hand afgeleide DOP met vier satellieten (één satelliet in het zenit en drie op de horizon, { "120" } deg uit elkaar, waarvan de normaalmatrix met de hand te inverteren is), de structurele identiteit dat een systeem met een eigen klok en één satelliet geen geometrie toevoegt, ruisvrij herstel van positie, klok en bias, en geseede fouten tegen de covariantie. Alleen interne controles; niet vergeleken met de uitvoer van een ontvanger. { "0.30" } externe vergelijking, een bevinding

seg-4056b0470099 = <b>MODELLED</b> Systeemonafhankelijke invoer: elk systeem is Walker-schillen, expliciete elementen of een GNSS-voorinstelling, een signaal (draaggolf, chipsnelheid, bandbreedte, ontvangen vermogen of C/N0-bereik. Onafhankelijke referentie (InternalConsistency): Transcriptie van de aangehaalde openbare waarden, gecontroleerd op structuur (elke openbare bron heeft een URL, Walker-patronen delen gelijkmatig, de C/N0 uit ontvangen vermogen over kT bij { "290" } K), niet tegen een externe onafhankelijke referentie. Representatieve waarden worden in elke voorinstelling benoemd en zijn illustratief

seg-df745ccdaceb = MODELLED gezamenlijke gewogen kleinste-kwadraten-positiebepaling op pseudoafstanden met één klok per systeem of een bekende offset; ruis uit het model van de delay-lock-loop bij de C/N0-omhullende plus de signal-in-space-afstandsfout (resultaat <c1/>)

seg-c988291eb41d = MODELLED: al het overige; de DOP wordt gecontroleerd aan de hand van een met de hand afgeleid geval, de positiebepalingen aan hun covariantie en het dopplermodel aan de identiteit voor afstandsversnelling. (soortencatalogus (<c1/>))

seg-be908356ad19 = De skyline-voorinstelling is REPRESENTATIVE (herkomst in docs/SKYLINE.md en <c1/>): in de orde van grootte van de breedte en het reliëf van de diepe West-Noorse fjorden, geen opmeting van enig fjord. Alleen zichtlijn: geen diffractie, reflectie of ontvangst zonder zichtlijn. Verwijder de sectie [skyline] om met open lucht te vergelijken. MODELLED. (commentaar in het scenariobestand, regels { "15" } tot { "18" })

seg-1d0ab26930e1 = Gezamenlijke GNSS- en LEO-pseudoafstandspositiebepaling met intersysteembiases en foutmodellen per signaal is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Benoemde LEO-PNT-systemen als optionele gegevensvoorinstellingen, elk met zijn bron, is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Vorige</s1>leo-ppp

seg-458b3eda3250 = <s1>Volgende</s1>leo-signal
