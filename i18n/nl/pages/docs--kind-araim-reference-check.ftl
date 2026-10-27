# docs--kind-araim-reference-check: translations (nl)

seg-debc2f07db78 = true

seg-c53da0bf140d = Bron: <c1/>

seg-82884391dd77 = <c1/> (scenariokind)

seg-8e845ce908ee = Scenariokind van de engine v{ $version }, familie <a1>GNSS-metingen, positiebepaling en integriteit</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-06197409c717 = Gepubliceerde ARAIM-certificeringsreferentievectoren: de ARAIM-horizontale en -verticale beschermingsniveaus van de engine, uitgevoerd tegen de EIGEN uitgewerkte numerieke voorbeelden van de WG-C ARAIM Technical Subgroup, met de tolerantie (TOL_PL = { "5e-2" } m) die die documenten zelf vermelden. Twee vectoren zijn als fixtures vastgelegd, elk met zijn ophaal-URL, ophaaldatum, SHA-256 van het bronbestand en pagina: de Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Appendix D — zelfconsistent, en de acceptatievector — en het Milestone { "3" } Report ({ "2016" }) Annex A section A.IX, de verklaring die de onderzoeksbibliografieën citeren. Elke gepubliceerde invoer (de geometriematrix van 10 satellieten en 2 constellaties, de variantiediagonalen C_int en C_acc, b_nom, P_sat, P_const en de constantenset van LPV-200) en elke gepubliceerde uitvoer (VPL, HPL, EMT, sigma_v_acc, K_fa_3 en sigma_3, sigma_ss_3 en b_3 van de twee constellatiefoutmodi) wordt naast het eigen getal van de engine en hun absolute verschil gerapporteerd. De vergelijking voor het beschermingsniveau wordt hier NIET opnieuw opgelost: de modelijst van de referentie wordt overgedragen aan de bestaande raim::araim_protection_level / araim_integrity_risk van de engine, zodat de bisectie en de gaussiaanse-staartalgebra die worden getest die van de engine zelf zijn; alleen de geometrie, de deeloplossingen, de detectiedrempels en de gepubliceerde budgetverdeling worden ervoor opgebouwd. EXTERN GECONTROLEERD tegen de vector van { "2019" }: VPL { "18.2926" } m tegenover { "18.3" } m gepubliceerd, HPL { "13.4063" } m tegenover { "13.45" } m, EMT { "7.2997" } m tegenover { "7.2998" } m, sigma_v_acc { "1.3694" } m tegenover { "1.3694" } m, en alle zes gepubliceerde tussenwaarden tot op een halve eenheid in hun laatste afgedrukte decimaal. De vector van { "2016" } bevat twee interne gebreken die het rapport vermeldt in plaats van verbergt — een tekenfout in rij { "3" } van G, en een K_fa_3 die is geëvalueerd bij { "57" } foutmodi terwijl het document N_fault_max = { "1" } ({ "12" } modi) vermeldt — zodat de geometrische tussenwaarden exact worden gereproduceerd terwijl de beschermingsniveaus worden gerapporteerd als gemeten afwijkingen en buiten het acceptatiecijfer blijven; de tolerantie wordt nooit verruimd om ze op te vangen. Elk uitgegeven numeriek veld draagt een eenheid en een herkomstklasse, en een overgenomen cijfer wordt gelabeld <c1/> zodat het nooit voor een berekend cijfer kan worden aangezien. REIKWIJDTE: alleen N_fault_max = { "1" } (foutmodi van één satelliet en van één constellatie) is geïmplementeerd, en een geval waarvan de priors gelijktijdige multi-eventfoutdeelverzamelingen vereisen wordt REFUSED in plaats van stilzwijgend afgekapt; foutdetectie, uitsluiting, de chikwadraatconsistentiecontrole en de herallocatiestap tegen dubbeltelling van het referentiealgoritme vallen buiten de reikwijdte. Dit reproduceert het uitgewerkte voorbeeld van een gepubliceerd referentiealgoritme — het is geen certificering, geen luchtwaardigheidsartefact en geen goedkeuring.

seg-c16de81ec8da = Eén run van <c1/> vat samen als: araim-reference-check: { "2" } gepubliceerde WG-C-referentievector(en); slechtste VPL/HPL-overeenkomst { "0.0437" } m tegenover de eigen TOL_PL = { "0.05" } m van de referentie over { "1" } acceptatievector(en)

seg-b1be6b5632c1 = Optionele velden: <c1/>

seg-3f181d41edb5 = Het voorbeeld <c1/> stelt onder meer in:

seg-9de6e1b3352d = Resultaatlabel (van de engine): EXTERN GECONTROLEERD — de ARAIM-beschermingsniveaus van de engine, uitgevoerd tegen de gepubliceerde uitgewerkte numerieke voorbeelden van het referentie-airborne-algoritme van de EU-U.S. Working Group C ARAIM Technical Subgroup, met de tolerantie (TOL_PL) die die documenten zelf vermelden. Elk gepubliceerd cijfer draagt zijn bron-UR

seg-693c823c85d1 = De grafiek die de engine schrijft voor scenarios/araim-reference-check.toml, kind araim-reference-check

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-c5c966ec3c6a = <b>VALIDATED</b> De vergelijking voor het beschermingsniveau met meervoudige hypothesen en oplossingsscheiding zelf: alles-in-zicht en per-foutmodus gewogen kleinste kwadraten op een East/North/Up-geometrie met één klokstoestand per constellatie, de sigma's van de deeloplossingen, oplossingsscheiding Tests: <a1>araim_reference_vectors.rs</a1>.

seg-a99b9cf4c6e8 = <b>VALIDATED</b> De vergelijking voor het beschermingsniveau met meervoudige hypothesen en oplossingsscheiding zelf: alles-in-zicht en per-foutmodus gewogen kleinste kwadraten op een East/North/Up-geometrie. Onafhankelijke referentie (ExternalDataset): EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } June { "2019" }), Appendix D worked numerical example — gepubliceerde INVOER (geometriematrix van 10 satellieten en 2 constellaties, diagonalen C_int/C_acc, b_nom, P_sat, P_const, LPV-200-constanten) en gepubliceerde UITVOER (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } en zes tussenwaarden van de constellatiefout

seg-f6b7ca020692 = Familiepagina: <a1>GNSS-metingen, positiebepaling en integriteit</a1>

seg-f4cf8b629797 = Onderwerppagina: <a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = Onderwerppagina: <a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>Vorige</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>Volgende</s1>ascent-losses
