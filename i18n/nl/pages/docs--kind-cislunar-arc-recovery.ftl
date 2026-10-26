# docs--kind-cislunar-arc-recovery: translations (nl)

seg-debc2f07db78 = true

seg-330cbcd04718 = fractie (dimensieloos)

seg-8f21a5462b09 = Bron: <c1/>

seg-e4858b0a33c9 = <c1/> (scenariokind)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-f994c81583bf = MODELLED test met onafhankelijke schatter van de cislunaire waarneembaarheidsdrempel voor booglengte. Die drempel is een RANG-bepaling op de waarneembaarheidsmatrix die is opgebouwd uit de ANALYTISCHE afstandsjacobiaanrijen en de ANALYTISCHE variationele toestandsovergangsmatrix, en zijn kruiscontrole met het square-root-informatiefilter vouwt diezelfde rijen — een consistentiecontrole tussen twee numerieke machines, geen bevestiging. Dit kind levert de ontbrekende scheidsrechter: een batch-kleinstekwadratenschatter die de begintoestand van de chief uit gesimuleerde metingen daadwerkelijk HERSTELT, met de meetpartiëlen genomen als CENTRALE FINITE DIFFERENCES van het samengestelde voorwaartse model. Hij roept geen analytische jacobiaanrij aan, geen variationele STM, geen singulierewaarde- of eigenwaardeontbinding, geen rangtolerantie en geen square-root-informatiefilter — een brontekstbewaking in tests/cislunar_arc_recovery_reference.rs maakt dat afdwingbaar — terwijl de dynamica (dezelfde RK4-CR3BP-stroom), de beginvoorwaarden (dezelfde differentieel gecorrigeerde constellatie), de scalaire waarneembare grootheid en het tijdstipraster bewust worden gedeeld en worden benoemd in het uitgegeven <c1/>-blok, omdat twee analyses van één fysisch probleem het over de fysica eens moeten zijn om vergelijkbaar te zijn. Twee criteria, elk doorgerekend over vijf decaden van zijn eigen grens: RUISVRIJE HERSTELLING (de eindtoestandsfout van elke geseede trial is hoogstens recovery_factor maal zijn a-priori-verplaatsing — het rang-analogon, zonder singulierewaardetolerantie erin) en MONTE-CARLO-SCHATBAARHEID (de gemeten RMS-positiefout over een geseed ruis-ensemble onder een vermelde grens — het schatbaarheidsanalogon, gemeten in plaats van voorspeld). Ondersteunt de vlakke viertoestanden- en de ruimtelijke zestoestandenvariant, de families DRO / L2-halo / L2-NRHO, afstands- en afstandssnelheidswaarnemingen, en een Maan-gecentreerde polaire parametrisering waarin de transformatie op de TOESTAND wordt toegepast en het voorwaartse model daar opnieuw wordt gedifferentieerd. MEASURED op het gepubliceerde vlakke DRO-raster: de schatter herstelt de vier toestanden vanaf { "0.782609" } h tegenover { "2.086957" } h van het rangcriterium bij rel_tol { "1e-6" } (verhouding { "0.375" }) — de rangdrempel is NIET bevestigd als herstelbaarheidsgrens — terwijl de gemeten schatbaarheidsgrens in dezelfde rastercel valt als de formele, { "5.739130" } h, en de gemeten foutcurve de formele 1-sigma over { "21" } booglengtes reproduceert tot een meetkundig-gemiddelde verhouding van { "0.98" }. MODELLED: het constellatieontwerp, het tijdstipraster, de ene gevolgde link, de grootte van de verplaatsing, de meetsigma en de twee vermelde grenzen. Geen gecertificeerd product voor navigatieprestaties.

seg-ada71f37b21b = Eén run van <c1/> vat samen als: cislunar-arc-recovery | dro-familie, 4 toestanden, { "4" } s/c, afstandswaarneembaar, cartesische parametrisering | boog van { "6.0" } h, { "24" } tijdstippen (raster { "0.260870" } h), { "32" } trials, seed { "20260920" } | partiëlen met eindige differenties, geen analytische jacobiaan / STM / SVD / SRIF | ruisvrije herstelling vanaf { "0.782609" } h (factor { "1e-2" }) tegenover Gramian-rangdrempel { "2.086957" } h | Monte-Carlo-schatbaarheid vanaf { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) tegenover Gramian-schatbaarheid { "5.739130" } h | RMS pos aan het einde van de boog { "0.6026" } km

seg-3d4a2773c32f = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-eb621f41dfbb = Het voorbeeld <c1/> stelt onder meer in:

seg-6d584e86deba = verhouding (dimensieloos)

seg-f7f4d06e661f = cislunar-observability op de identieke

seg-a6cb7ed2ff6d = Resultaatlabel (van de engine): MODELLED cislunaire test voor herstel van de booglengte (corroboratie met onafhankelijke schatter van de P6-waarneembaarheidsdrempel). VALIDATED kern: de schatter is de reeds bestaande gewogen Gauss-Newton-batchcorrector van de crate (crate::batch_ls), waarvan de ontwerpmatrix een CENTRALE FINITE DIFFERENCE is van het samengestelde fo

seg-2fe411ae2153 = De grafiek die de engine schrijft voor scenarios/cislunar-arc-recovery.toml, kind cislunar-arc-recovery

seg-99dd8cc0e3ef = <b>MODELLED</b> Een batch-kleinstekwadratenschatter die de begintoestand van de chief uit gesimuleerde meetwaarden tussen satellieten HERSTELT over groeiende prefixen van hetzelfde tijdstipraster dat de tabel rang-versus-boog gebruikt, met de meetpartiëlen genomen als centrale fini Tests: <a1>cislunar_arc_recovery_reference.rs</a1>.

seg-67aab2162719 = <b>MODELLED</b> Een batch-kleinstekwadratenschatter die de begintoestand van de chief uit gesimuleerde meetwaarden tussen satellieten HERSTELT over groeiende prefixen van hetzelfde tijdstipraster. Onafhankelijke referentie (ReferenceImpl): Een afzonderlijke schatter in deze codebase op een ander algoritme en een disjunct codepad: niet-lineaire gewogen Gauss-Newton met partiëlen met eindige differenties, waarvan het oordeel wordt gelezen als een gemeten toestandsherstelfout in km en mm/s. Hij heeft geen enkele uitdrukking gemeen met de rang-en-covariantieroute van de Gramian, en de scheiding wordt AFGEDWONGEN door een brontekstbewaking in plaats van beweerd. MEASURED op het gepubliceerde vlakke DRO-raster: th

seg-7be582874f98 = MODELLED cislunaire test voor herstel van de booglengte (corroboratie met onafhankelijke schatter van de P6-waarneembaarheidsdrempel). VALIDATED kern: de schatter is de reeds bestaande gewogen Gauss-Newton-batchcorrector van de crate (crate::batch_ls), waarvan de ontwerpmatrix een CENTRALE FINITE DIFFERENCE is van het samengestelde voorwaartse model - hij roept geen analytische meetjacobiaanrij aan, geen variationele toestandsovergangsmatrix, geen singulierewaarde- o (resultaat <c1/>)

seg-52fe686b1fdf = MODELLED test met onafhankelijke schatter van de cislunaire waarneembaarheidsdrempel voor booglengte. (kindcatalogus (<c1/>))

seg-48e6e57a0b40 = MODELLED: het constellatieontwerp, het tijdstipraster, de ene gevolgde link, de grootte van de verplaatsing, de meetsigma en de twee vermelde grenzen. (kindcatalogus (<c1/>))

seg-75f275dcb2d2 = MODELLED: het constellatieontwerp, het tijdstipraster, de ene gevolgde link, de grootte van de verplaatsing, de meetsigma en de twee vermelde grenzen. Geen gecertificeerd product voor navigatieprestaties. (opmerking in het scenariobestand, regels { "33" } tot { "35" })

seg-ea82d9fd6506 = Corroboratie van de cislunaire booglengtedrempel met een onafhankelijke schatter is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-53d57e6dafa6 = <s1>Vorige</s1>campaign

seg-fe3ecf4b55fe = <s1>Volgende</s1>cislunar-observability
