# docs--kinds-gnss-measurements-positioning-and-integrity: translations (nl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Type

seg-06197409c717 = Gepubliceerde ARAIM-certificeringsreferentievectoren: de ARAIM-horizontale en -verticale beschermingsniveaus van de engine, uitgevoerd tegen de EIGEN uitgewerkte numerieke voorbeelden van de WG-C ARAIM Technical Subgroup, met de tolerantie (TOL_PL = { "5e-2" } m) die die documenten zelf vermelden. Twee vectoren zijn als fixtures vastgelegd, elk met zijn ophaal-URL, ophaaldatum, SHA-256 van het bronbestand en pagina: de Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Appendix D — zelfconsistent, en de acceptatievector — en het Milestone { "3" } Report ({ "2016" }) Annex A section A.IX, de verklaring die de onderzoeksbibliografieën citeren. Elke gepubliceerde invoer (de geometriematrix van 10 satellieten en 2 constellaties, de variantiediagonalen C_int en C_acc, b_nom, P_sat, P_const en de constantenset van LPV-200) en elke gepubliceerde uitvoer (VPL, HPL, EMT, sigma_v_acc, K_fa_3 en sigma_3, sigma_ss_3 en b_3 van de twee constellatiefoutmodi) wordt naast het eigen getal van de engine en hun absolute verschil gerapporteerd. De vergelijking voor het beschermingsniveau wordt hier NIET opnieuw opgelost: de modelijst van de referentie wordt overgedragen aan de bestaande raim::araim_protection_level / araim_integrity_risk van de engine, zodat de bisectie en de gaussiaanse-staartalgebra die worden getest die van de engine zelf zijn; alleen de geometrie, de deeloplossingen, de detectiedrempels en de gepubliceerde budgetverdeling worden ervoor opgebouwd. EXTERN GECONTROLEERD tegen de vector van { "2019" }: VPL { "18.2926" } m tegenover { "18.3" } m gepubliceerd, HPL { "13.4063" } m tegenover { "13.45" } m, EMT { "7.2997" } m tegenover { "7.2998" } m, sigma_v_acc { "1.3694" } m tegenover { "1.3694" } m, en alle zes gepubliceerde tussenwaarden tot op een halve eenheid in hun laatste afgedrukte decimaal. De vector van { "2016" } bevat twee interne gebreken die het rapport vermeldt in plaats van verbergt — een tekenfout in rij { "3" } van G, en een K_fa_3 die is geëvalueerd bij { "57" } foutmodi terwijl het document N_fault_max = { "1" } ({ "12" } modi) vermeldt — zodat de geometrische tussenwaarden exact worden gereproduceerd terwijl de beschermingsniveaus worden gerapporteerd als gemeten afwijkingen en buiten het acceptatiecijfer blijven; de tolerantie wordt nooit verruimd om ze op te vangen. Elk uitgegeven numeriek veld draagt een eenheid en een herkomstklasse, en een overgenomen cijfer wordt gelabeld <c1/> zodat het nooit voor een berekend cijfer kan worden aangezien. REIKWIJDTE: alleen N_fault_max = { "1" } (foutmodi van één satelliet en van één constellatie) is geïmplementeerd, en een geval waarvan de priors gelijktijdige multi-eventfoutdeelverzamelingen vereisen wordt REFUSED in plaats van stilzwijgend afgekapt; foutdetectie, uitsluiting, de chikwadraatconsistentiecontrole en de herallocatiestap tegen dubbeltelling van het referentiealgoritme vallen buiten de reikwijdte. Dit reproduceert het uitgewerkte voorbeeld van een gepubliceerd referentiealgoritme — het is geen certificering, geen luchtwaardigheidsartefact en geen goedkeuring.

seg-693c823c85d1 = De grafiek die de engine schrijft voor scenarios/araim-reference-check.toml, kind araim-reference-check

seg-2ffccc9c1eff = Pseudorangesimulatie in het meetdomein (Klobuchar-iono, Saastamoinen/Niell-tropo) + RAIM.

seg-47ee40d4eb73 = De grafiek die de engine schrijft voor scenarios/gnss-sim-raim.toml, soort gnss-sim

seg-eb7e0c2feb2b = Snapshot-/oplossingsscheidings-/ARAIM-RAIM met HPL/VPL en een Stanford-diagram.

seg-ce7f6130ddee = De grafiek die de engine schrijft voor scenarios/integrity-raim.toml, soort integrity

seg-b7b67e03f125 = Enkelpunts-positiebepaling met echte waarnemingen: bepaal de positie van een ontvanger uit een RINEX { "3" }-waarnemingsbestand en een broadcast-navigatiebestand (codepseudoafstanden, broadcast-efemeride, Klobuchar-ionosfeer, Saastamoinen/Niell-troposfeer), eventueel getoetst aan een opgemeten coördinaat.

seg-d76d59644d84 = De grafiek die de engine schrijft voor scenarios/pvt-abmf.toml, soort pvt

seg-edfcb546d9de = Budget voor de voorspelling van het lunaire referentiestelsel / de aardoriëntatie in realtime: P4 Tabel { "1" } (de consistentiecontrole van de referentiestelselfout — nabewerkt ~{ "0.27" } m ↔ ~{ "0.010" } ms en realtime ~{ "15" } m ↔ ~{ "0.5" } ms, elke positie in het referentiestelsel uitgedrukt als de equivalente UT1-fout via de hefboomarm L19 Δr = D_EM·ω⊕·ΔUT1) en Tabel { "2" } (gemeten UT1-voorspelfout tegenover horizon — de L18-curve rechtstreeks afgelezen uit de echte IERS finals2000A-reeks: de eindondergrens Bulletin A − Bulletin B en de voorspelfout van de persistentievoorspeller over meerdere dagen, elk via L19 afgebeeld op een positie in het Maanstelsel), plus het kwadratische-sombudget L21 voor de realtime referentiestelselfout (EOP + efemeride + realisatieondergrens). VALIDATED gesloten vorm (de hefboomarm L19, ω⊕ gecontroleerd tegen de CIO-aardrotatiehoek) en VALIDATED echte data (de L18-curve uit de echte rijen van finals2000A); MODELLED zijn de groottes van de covariantie van baanbepaling voor het lunaire relais en de realisatieondergrens van het referentiestelsel (representatieve toewijzingen) en de persistentievoorspeller (niet het operationele Bulletin A-algoritme van de IERS). Geen gecertificeerd realtime referentiestelselproduct.

seg-2721ed7727bb = De grafiek die de engine schrijft voor scenarios/realtime-frame-eop.toml, soort realtime-frame-eop

seg-5f25c5b71f0c = Ruimteweermodel van de omgeving: zonne- (F10.7/F10.7a) en geomagnetische (Kp, met de definitionele tabel Kp↔ap) activiteitsindices, de exosferische temperatuur volgens Jacchia-1971 die zij aansturen (getoetst tegen gepubliceerde waarden voor zonneminimum/gemiddelde/zonnemaximum), en de neutrale thermosferische dichtheid volgens Jacchia-1971 bij de dagelijks gemiddelde exosferische temperatuur tegenover het activiteitsvrije statische profiel op een reeks hoogten — de afhankelijkheid van de dichtheid van de zonnecyclus die de statische atmosfeer weglaat. MODELLED: de dichtheid komt overeen met uit accelerometers afgeleide dichtheden (TOLEOS CHAMP en GRACE) binnen een factor { "2" } bij zonnemaximum, maar is ongeveer 1.7x te dicht in het zonneminimum van { "2008" }.

seg-c1c6f2f73fb5 = De grafiek die de engine schrijft voor scenarios/space-weather.toml, soort space-weather

seg-4e31c8daf798 = Register

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = Bron: <c1/>

seg-569fac649b5d = GNSS-metingen, positiebepaling en integriteit (familie van scenariosoorten)

seg-63c3a7483268 = { "6" } scenariosoorten van de engine v{ $version }. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidsdienst voor mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders aangeeft (hoe een label wordt verdiend: het onderdeel Bewijs van de README).

seg-33a602147cc2 = Themapagina's: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Voer er een uit: <c1/>. Alle families: <a5>KINDS.md</a5>.

seg-9c60c8803b6b = Contactblad met de grafieken die de engine schrijft voor de soorten van de familie GNSS-metingen, positiebepaling en integriteit

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = Positiebepaling met één punt uit echte waarnemingen: los de positie van een ontvanger op uit een RINEX-{ "3" }-waarnemingsbestand en een broadcast-navigatiebestand (code-pseudoranges, broadcast-efemeride, Klobuchar-iono, Saastamo

seg-da89c260b1a3 = Gepubliceerde ARAIM-referentievectoren voor certificering: de horizontale en verticale beschermingsniveaus van ARAIM van de engine, uitgevoerd tegen de EIGEN uitgewerkte numerieke voorbeelden van de WG-C ARAIM Technical Subgroup, bij de tole

seg-7a750a89c9c4 = Ruimteweermodel: zonne- (F10.7/F10.7a) en geomagnetische (Kp, met de definitorische Kp↔ap-tabel) activiteitsindices, de exosferische Jacchia-1971-temperatuur die zij aansturen (getoetst aan publ

seg-d79d4d58275b = Budget voor realtime voorspelling van het maanreferentiestelsel en de aardoriëntatie: P4 Table { "1" } (de consistentiecontrole van de referentiestelselfout — nabewerkt ~{ "0.27" } m ↔ ~{ "0.010" } ms en realtime ~{ "15" } m ↔ ~{ "0.5" } ms, elke referentiestelselpositie uitgedrukt

seg-dc783268156c = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Optioneel: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-7b110aacdb27 = <b>Register:</b> MODELLED { "6" } · VALIDATED { "4" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>integrity</a1>.

seg-d444fb35cae9 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>. Optioneel: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-b651ec58bcba = <b>Register:</b> VALIDATED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>gnss-sim</a1>.

seg-b9a21187317d = Verplichte velden: <c1/>, <c2/>. Optioneel: <c3/>, <c4/>, <c5/>, <c6/>.

seg-143dc4fd1d44 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>pvt</a1>.

seg-9ca1f6783e8e = Verplichte velden: geen. Optioneel: <c1/>.

seg-415f1fa78518 = <b>Register:</b> VALIDATED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>araim-reference-check</a1>.

seg-6c4655b35c65 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>.

seg-1e5052c0bce7 = <b>Register:</b> MODELLED. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>space-weather</a1>.

seg-64c512530ee6 = Verplichte velden: geen. Optioneel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-1c244958d3c4 = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Volledige pagina, met de invoer, resultaten, bewijs en beperkingen: <a1>realtime-frame-eop</a1>.

seg-d4adf4283480 = <s1>Vorige</s1>Constellaties, dekking en geometrie

seg-2cdfd7f8bfb3 = <s1>Volgende</s1>Alternatieve PNT bij GPS-uitval
