# docs--kind-hybrid-optical-rf: translations (nl)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-0482fec5b0f6 = Bron: <c1/>

seg-830c574e871b = <c1/> (scenariosoort)

seg-72ad48275ebe = Scenariosoort van de engine v{ $version }, familie <a1>Optische PNT</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-e6839b50b560 = MODELLED heterogene gezamenlijke kwaliteitsmaat voor optische + RF-PNT (P5): combineert het tweerichtings-optische linkbudget van { "1550" } nm (door fotonen beperkte CRLB voor tweerichtingsafstandsmeting σ_τ/√N en diffractievoetafdruk λ/D·afstand), een RAIM-beschermingsniveau met oplossingsscheiding over modaliteiten heen (positie EN tijd) dat de losse RF- en strakke optische oplossingen met uiteenlopende covarianties samenvoegt, de optische heldere-luchtbeschikbaarheid van N stations (onafhankelijke unie { "1" }−Π({ "1" }−a_i) en een ruimtelijk gecorreleerde variant), een toestands-/covariantieoverdracht optisch↔RF met een BEWEZEN bitcontinu (sprongloos) gemiddelde en een NEES-χ²-consistentiepoort, en een gezamenlijke score P(beschikbaar EN precisieklasse EN integriteit gewaarborgd) met correlatieafhandeling. VALIDATED gesloten vorm: de CRLB voor afstandsmeting, de diffractievoetafdruk, de χ²-kwantiel van het beschermingsniveau, de combinatoriek van de unie, de continuïteit van het gemiddelde bij de overdracht + NEES-poort, en het gezamenlijke onafhankelijke product. MODELLED: de optische verliestoewijzingen, de grootte van de RF-/optische σ, de invoer van de wolkenklimatologie, de correlaties en het P_HMI-budget. Geen gecertificeerd beschikbaarheids-/integriteitsproduct.

seg-30904e2367fc = Eén run van <c1/> vat samen als: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Getoetst: CRLB/χ²-PL/unie/overdracht, gemodelleerd: σ/klimatologie

seg-73e5cf56c92c = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

seg-27338c8b2e5f = Het voorbeeld <c1/> stelt onder meer in:

seg-7b9ce4689508 = Resultaatlabel (van de engine): Heterogene gezamenlijke kwaliteitsmaat voor beschikbaarheid / precisie / integriteit van optische + RF-PNT (P5). VALIDATED gesloten vorm: de door fotonen beperkte CRLB voor afstandsmeting (σ_τ/√N) en de diffractievoetafdruk (λ/D·afstand), de χ²-kwantiel van het beschermingsniveau over modaliteiten heen, de beschikbaarheid van de onafhankelijke unie van N stations ({ "1" } − Π(

seg-5cea5229815e = De grafiek die de engine schrijft voor scenarios/hybrid-optical-rf.toml, soort hybrid-optical-rf

seg-a8923a682728 = <b>MODELLED</b> Het hybrid-optical-rf-rapport vermeldt de linkconfiguratie waarmee het daadwerkelijk is uitgevoerd (golflengte van de draaggolf, zend- en ontvangstapertuur, afstand, pulsbreedte, integratie. Onafhankelijke referentie (InternalConsistency): Geen externe onafhankelijke referentie, en die is ook niet mogelijk: dit is een zelfbeschrijving, geen meting. Ze wordt vastgelegd omdat het ontbreken ervan een defect was -- P5 moest de golflengte van de draaggolf en de zendapertuur uit standaardwaarden in de broncode halen, en uit een interne consistentiecontrole afleiden dat een kale <c1/> in vierkante meter was. De afleiding klopte, en juist daarom was het van belang: niets zou hebben opgevangen dat ze fout was

seg-28abb5a84eaa = <b>MODELLED</b> Het hybrid-optical-rf-rapport vermeldt een RF-linkbeschikbaarheid, samengesteld uit grootheden die de engine al berekent in plaats van uit een geïmporteerde klimatologie, en . Onafhankelijke referentie (InternalConsistency): Geen externe onafhankelijke referentie, en ExternalDataset wordt afgewezen. De twee invoeren zijn een Eb/N0-marge en een C/N0-drempeldoorgang, beide functies van een MODELLED EIRP, kwaliteitsmaat en samengevoegde verliestoewijzing; er is geen gemeten beschikbaarheidsregistratie voor een hybride optische/RF-dienst Aarde–Maan om het samengestelde cijfer tegen te toetsen. De controles die er zijn, zijn intern en worden ook zo vermeld: de samenstelling wordt opnieuw berekend uit de r

seg-888004543d37 = <b>MODELLED</b> Het hybrid-optical-rf-rapport geeft de verhouding tussen optische en RF-afstandsmeting weer, met de ÉÉN configuratie waarmee beide takken zijn geëvalueerd in hetzelfde object: de sa. Onafhankelijke referentie (InternalConsistency): Geen externe onafhankelijke referentie voor de VERHOUDING, en ExternalDataset wordt bewust afgewezen. De onderliggende RF-keten heeft die wel -- tests/validate_p5_rf_ranging_precision.rs controleert linkbudget::link_budget en navsignal::dll_code_jitter_chips tegen een onafhankelijke Python/NumPy-fixture en tegen de vastgelegde uitgewerkte waarde van Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m bij { "45" } dB-Hz) -- en de optische CRLB heeft zijn eigen gesloten-vormrij

seg-db5ff373b50f = <b>MODELLED</b> Het hybrid-optical-rf-rapport vermeldt wat de chikwadraatmonitor over modaliteiten heen daadwerkelijk kan DETECTEREN, niet alleen dat hij een foutvrij geval doorstaat: de minimaal detecteerbare. Onafhankelijke referentie (InternalConsistency): Twee interne referenties, geen externe dataset. ({ "1" }) Gesloten-vormheen-en-terugrekening: de minimaal detecteerbare bias ontstaat door de niet-centrale chikwadraatstaart op de niet-centraliteit te inverteren (raim::pbias) en wordt geverifieerd door de resulterende niet-centraliteit terug te voeren door raim::noncentral_chi2_cdf bij de eigen drempel van de monitor, wat P_md moet opleveren. ({ "2" }) Injectie tegenover analyse: een bias wordt geschreven in de RF-schatting van één as

seg-24f31f6b353f = Heterogene gezamenlijke kwaliteitsmaat voor beschikbaarheid / precisie / integriteit van optische + RF-PNT (P5). VALIDATED gesloten vorm: de door fotonen beperkte CRLB voor afstandsmeting (σ_τ/√N) en de diffractievoetafdruk (λ/D·afstand), de χ²-kwantiel van het beschermingsniveau over modaliteiten heen, de beschikbaarheid van de onafhankelijke unie van N stations ({ "1" } − Π({ "1" }−a_i)), de invariant van gemiddelde-continuïteit bij de overdracht optisch↔RF (bit-voor-bit sprongloos) en de NEES-χ²-poort, en de gezamenlijke kwaliteitsmaat inde (resultaat <c1/>)

seg-bec90783ad8b = MODELLED heterogene gezamenlijke kwaliteitsmaat voor optische + RF-PNT (P5): combineert het tweerichtings-optische linkbudget van { "1550" } nm (door fotonen beperkte CRLB voor tweerichtingsafstandsmeting σ_τ/√N en diffractievoetafdruk λ/D·afstand), een RAIM-beschermingsniveau met oplossingsscheiding over modaliteiten heen (positie EN tijd) dat de losse RF- en strakke optische oplossingen met uiteenlopende covarianties samenvoegt, de optische heldere-luchtbeschikbaarheid van N stations (independent-un (soortencatalogus (<c1/>))

seg-15abc895e477 = MODELLED: de optische verliestoewijzingen, de grootte van de RF-/optische σ, de invoer van de wolkenklimatologie, de correlaties en het P_HMI-budget. (soortencatalogus (<c1/>))

seg-9fafa5ffb521 = MODELLED. Getoetste gesloten vormen: CRLB voor afstandsmeting (sigma_tau/sqrt(N)), diffractievoetafdruk (lambda/D * afstand), kwantiel van het chikwadraat-beschermingsniveau, combinatoriek van de unie, continuïteit van het gemiddelde bij de overdracht + NEES-poort, en het gezamenlijke onafhankelijke product. De verliestoewijzingen, de grootte van sigma, de invoer van de wolkenklimatologie, de correlaties en het P_HMI-budget zijn gemodelleerde representatieve invoer. Elk veld hieronder is optioneel en wordt getoond op zijn (opmerking in het scenariobestand, regels { "10" } tot { "14" })

seg-e5f964e5d422 = --- G15 bias-/rampfoutinjectie tegen de monitor over modaliteiten heen --- De minimaal detecteerbare bias en de detectievermogenscurve zijn ANALYTISCH (inversie van het niet-centrale chikwadraat), dus ze hebben geen eigen invoer nodig. Deze twee bepalen alleen de rampsnelheid waarvan de gerapporteerde tijd tot detectie een snelheidsomrekening is. Beide MODELLED. (opmerking in het scenariobestand, regels { "56" } tot { "59" })

seg-70f50a62aa12 = --- G17 uitloop na overdracht: procesruis en het overschrijden van de alarmlimiet --- Random walk op het bestaande overdrachtsfilter met 4 toestanden (oost, noord, omhoog, klok). De alarmlimieten zijn die welke hierboven al zijn opgegeven; alleen de procesruis en de dekkingsfactor zijn nieuw. Beide PSD's zijn MODELLED representatieve invoer en de overschrijdingstijden schalen er rechtstreeks mee. (opmerking in het scenariobestand, regels { "63" } tot { "67" })

seg-9fb4240fb0ef = De zelfbeschrijving van het hybride optische/RF-rapport is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-a97755cb13eb = Familiepagina: <a1>Optische PNT</a1>

seg-1586d90cdf1b = <s1>Vorige</s1>holdover-test

seg-211275a00df0 = <s1>Volgende</s1>hybrid-ukf
