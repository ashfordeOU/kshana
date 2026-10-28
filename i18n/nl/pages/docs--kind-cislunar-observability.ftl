# docs--kind-cislunar-observability: translations (nl)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-6d584e86deba = verhouding (dimensieloos)

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-258f128cea60 = Bron: <c1/>

seg-f0c7758e472f = <c1/> (scenariokind)

seg-7ccd0a3babb8 = MODELLED waarneembaarheid van een vlakke cislunaire constellatie (P6): volgt een vierspacecraft-constellatie van differentieel gecorrigeerde vlakke DRO's met inter-satellietafstandsmeting en rapporteert hoeveel van de vier toestanden [x,y,ẋ,ẏ] van een ruimtevaartuig de boog waarneembaar maakt. Geeft uit ({ "1" }) de tabel rang-versus-booglengte voor één link met alleen afstand — instantaan rang 1, groeiend naar de volledige vier toestanden naarmate de boog langer wordt (P6 Table { "1" }); ({ "2" }) het eigenwaardenspectrum + conditiegetal van de waarneembaarheidsgramiaan over de boog; ({ "3" }) de vergelijking van de instantane rang tussen alleen-afstand en afstand+afstandssnelheid (de Doppler-ontwerphefboom) plus de rapportage van GDOP die voor alleen-afstand singulier en voor afstand+snelheid gedefinieerd is; en ({ "4" }) een onafhankelijke SRIF-kruisvalidatie waarvan de posteriori-covariantie eindig / goed geconditioneerd wordt precies bij de boog waar de waarneembare rang vier bereikt. VALIDATED kern: de waarneembare rang is een rangonthullende singulierewaardedrempel die is gecontroleerd tegen de eigenrang van de gramiaan; het eigenwaardenspectrum voldoet aan de spectrale invarianten (trace=Σλ, det=Πλ, Frobenius²=Σλ²); de variationele STM is de met eindige differenties getoetste CR3BP-STM; de rijen van de afstands-/afstandssnelheidsjacobiaan zijn met eindige differenties getoetste analytische partiëlen (gecontroleerd tegen de 3D-afstandssnelheidswaarneembare van de crate); de vier beginvoorwaarden zijn differentieel gecorrigeerde vlakke DRO's die sluiten tot een strak periodiciteitsresidu en retrograad zijn; de rangovergang is kruisgevalideerd tegen het square-root-informatiefilter van de crate (posteriori-covariantie eindig precies bij volle rang, cond(P)=cond(OᵀO)); een rangdeficiënte momentopname wordt gemarkeerd als GDOP-niet-gedefinieerd (fim condition=inf), nooit als een valse eindige waarde — dezelfde bewaking voor singuliere geometrie die pvt::solve_spp toepast. MODELLED: het constellatieontwerp (DRO-perilunamplitudes en -fasen) en de specifieke rangprogressie die het oplevert. Geen gecertificeerd product voor navigatieprestaties.

seg-a59f2fa9efb9 = Eén run van <c1/> vat samen als: cislunar-observability | { "4" } s/c ({ "3" } refs) | boog van { "6.0" } h, { "24" } tijdstippen | rang { "1" } → { "4" } van { "4" } over de boog | Gramian λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | instantane rang alleen-afstand { "2" } → afstand+snelheid { "4" } ({ "3" } links) | GDOP alleen-afstand niet gedefinieerd afstand+snelheid { "6.353" } | DRO-beginvoorwaarden (maximaal periodiciteitsresidu { "4.7e-9" }) | SRIF posteriori eindig bij rang-4-tijdstip { "8" } (extern getoetste rang/STM/DRO-sluiting/SRIF, gemodelleerd ontwerp)

seg-fb1601eda130 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-f3b5cc590c78 = Het voorbeeld <c1/> stelt onder meer in:

seg-0cc8ab10786b = tijdseenheden van het roterende frame

seg-84781b6fff48 = GDOP niet gedefinieerd (rangdeficiënt / singula

seg-856eb311f24b = “niet gedefinieerd” (tekst zoals het document het stelt

seg-fc5d34345fdd = Resultaatlabel (van de engine): MODELLED waarneembaarheid van een vlakke cislunaire constellatie (P6). VALIDATED kern: de waarneembare RANG is een rangonthullende singulierewaardedrempel die is gecontroleerd tegen de eigenrang van de gramiaan; het eigenwaardenspectrum van de gramiaan voldoet aan de spectrale invarianten (trace = som eig, det = product eig, Frobenius^{ "2" } = som eig^{ "2" }

seg-f15bbf30b0dd = De grafiek die de engine schrijft voor scenarios/cislunar-observability.toml, kind cislunar-observability

seg-4564ad90378b = <b>MODELLED</b> De cislunaire waarneembaarheidsdrempel voor booglengte in de RUIMTELIJKE zestoestanden-CR3BP in plaats van de vlakke viertoestanden, over de families DRO, L2-halo en L2-bijna-rechtlijnige halo, met meetruis die in de gramiaan doorwerkt en TWEE criteria die rapporteren

seg-9f857ff85800 = <b>MODELLED</b> De cislunaire waarneembaarheidsdrempel voor booglengte in de RUIMTELIJKE zestoestanden-CR3BP in plaats van de vlakke viertoestanden, over de families DRO, L2-halo en L2-bijna-rechtlijnige ha. Onafhankelijke referentie (InternalConsistency): Een onafhankelijke rij-echelonrang via gaussiaanse eliminatie met partiële pivotering bevestigt elk rangoordeel voor zes toestanden — een ander algoritme dat geen code deelt met de te testen eigenwaarde-/SVD-route. De { "6" }×{ "6" }-toestandsovergangsmatrix van de CR3BP die dit samenstelt, draagt haar eigen ReferenceImpl-referentie tegen variationele integratie met SciPy, en de beginvoorwaarden van halo/NRHO komen van een corrector die de gepubliceerde zuidelijke L2

seg-53c183035bde = MODELLED waarneembaarheid van een vlakke cislunaire constellatie (P6). VALIDATED kern: de waarneembare RANG is een rangonthullende singulierewaardedrempel die is gecontroleerd tegen de eigenrang van de gramiaan; het eigenwaardenspectrum van de gramiaan voldoet aan de spectrale invarianten (trace = som eig, det = product eig, Frobenius^{ "2" } = som eig^{ "2" }); de variationele STM is de met eindige differenties getoetste CR3BP-STM (crate::cr3bp); de rijen van de afstands- / afstandssnelheidsjacobiaan (resultaat <c1/>)

seg-f6a217f57bec = MODELLED waarneembaarheid van een vlakke cislunaire constellatie (P6): volgt een vierspacecraft-constellatie van differentieel gecorrigeerde vlakke DRO's met inter-satellietafstandsmeting en rapporteert hoeveel van de vier toestanden [x,y,ẋ,ẏ] van een ruimtevaartuig de boog waarneembaar maakt. (kindcatalogus (<c1/>))

seg-e5182743fd40 = MODELLED: het constellatieontwerp (DRO-perilunamplitudes en -fasen) en de specifieke rangprogressie die het oplevert. (kindcatalogus (<c1/>))

seg-5d3a370f1295 = Eerlijkheid: MODELLED. VALIDATED kern -- de waarneembare RANG is een rangonthullende singulierewaardedrempel die is gecontroleerd tegen de eigenrang van de gramiaan; het eigenwaardenspectrum voldoet aan de spectrale invarianten (trace = som eig, det = product eig, Frobenius^{ "2" } = som eig^{ "2" }); de variationele STM is de met eindige differenties getoetste CR3BP-STM; de rijen van de afstands- / afstandssnelheidsjacobiaan zijn met eindige differenties getoetste analytische partiëlen (gecontroleerd tegen (opmerking in het scenariobestand, regels { "16" } tot { "25" })

seg-c68bc1df8975 = Ruimtelijke, ruisgevoelige cislunaire booglengtewaarneembaarheid over meerdere families is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-ba3c2a8f0e28 = <s1>Vorige</s1>cislunar-arc-recovery

seg-3adfb78b1f34 = <s1>Volgende</s1>clock
