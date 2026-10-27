# docs--kind-entry-heating: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = Onderwerppagina: <a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = Bron: <c1/>

seg-3a3f732cc2dd = <c1/> (scenariokind)

seg-b843e2e0a4ee = 3-DoF-puntmassa-atmosferische-intrede boven een roterende bolvormige Aarde of Mars (ballistisch of liftend bij constante rolhoek), RK4, door US76, een exponentiële of de Mars-atmosfeer, met convectieve verwarming van het stuwpunt volgens Sutton-Graves (NASA TR R-376): piekvertraging, warmteflux en dynamische druk, warmtelast, downrange, een energiecontrole in het roterende frame en de gesloten vorm van Allen-Eggers ernaast. De piekvertraging wordt gecontroleerd tegen de gepubliceerde nominale waarde van Stardust; de verwarming is MODELLED.

seg-05c8dac8d411 = Eén run van <c1/> vat samen als: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> piek { "35.4" } g op { "54.2" } km, piek q { "746" } W/cm² op { "62.0" } km, warmtelast { "20970" } J/cm², piek q_dyn { "20.8" } kPa; eindhoogte bij { "317" } s (gesloten vorm { "60.2" } g; MODELLED 3-DoF, geen straling/TPS)

seg-96504cafb034 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-1b68d973fd30 = Het voorbeeld <c1/> stelt onder meer in:

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistische consta

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = Resultaatlabel (van de engine): MODELLED — 3-DoF-puntmassa-intrede boven een roterende bolvormige planeet (centrale zwaartekracht, geen J2), meeroterende windloze atmosfeer, constante C_D, L/D en rolhoek, RK4; convectieve verwarming van het stuwpunt volgens NASA TR R-376 ({ "1971" }), koude wand, GEEN stralingsverwarming, GEEN TPS-/ablatierespons, GEEN 6-DoF

seg-dbb618cd6357 = De grafiek die de engine schrijft voor scenarios/entry-heating-stardust.toml, kind entry-heating

seg-e73b339df97b = <b>VALIDATED</b> Een 3-DoF-puntmassa-intrede boven een roterende bolvormige Aarde door de US Standard Atmosphere { "1976" }, met RK4 geïntegreerd vanuit een inertiële intredetoestand, met rapportage van de piekvertraging en haar hoogte; de planeetrelatieve intredetoestand uit de i Tests: <a1>entry_stardust_published.rs</a1>.

seg-10124432b79b = <b>MODELLED</b> Convectieve warmteflux in het stuwpunt q = k sqrt(rho/R_n) V^{ "3" } met de Sutton-Graves-constanten voor Aardlucht en de Mars-atmosfeer (NASA TR R-376, { "1971" }), haar piek en de geïntegreerde warmtelast langs een 3-DoF-intrede, ballistisch of liftend bij c Tests: <a1>entry_stardust_published.rs</a1>.

seg-54d133781215 = <b>VALIDATED</b> Een 3-DoF-puntmassa-intrede boven een roterende bolvormige Aarde door de US Standard Atmosphere { "1976" }, met RK4 geïntegreerd vanuit een inertiële intredetoestand, met rapportage van de. Onafhankelijke referentie (ExternalDataset): Het nominale Stardust-traject van Desai, Mitcheltree en Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximale vertraging { "33.4" } g vanaf { "12.6" } km/s planeetrelatief met de lanceermassa van { "45.8" } kg, een 6-DoF-POST-traject met de volledige aerodynamische database; intredeinterface van Desai, Lyons, Tooley en Kangas (NTRS { "20090004445" }): straal { "6503.14" } km, inertiaal { "12.9" } km/s bij -8.2 deg. Drempels vooraf vastgelegd in xval/entry-stardust/PREREGISTRATION.

seg-03878684f9a1 = <b>MODELLED</b> Convectieve warmteflux in het stuwpunt q = k sqrt(rho/R_n) V^{ "3" } met de Sutton-Graves-constanten voor Aardlucht en de Mars-atmosfeer (NASA TR R-376, { "1971" }), haar . Onafhankelijke referentie (InternalConsistency): Interne consistentie: de relatie en constanten zoals afgedrukt in NASA TR R-376, een convergentiecontrole met halve stap, en de verwachte rangorde van de pieken in verwarming en vertraging. WAT NIET: er is geen gepubliceerde verwarmingswaarde vergeleken (de Stardust-papers geven een ontwerplimiet en een schatting van convectief plus straling van ongeveer { "1200" } W/cm2, die een uitsluitend convectieve relatie niet kan evenaren); geen stralingsverwarming, wandtemperatuur of

seg-a0f300b2ce78 = MODELLED — 3-DoF-puntmassa-intrede boven een roterende bolvormige planeet (centrale zwaartekracht, geen J2), meeroterende windloze atmosfeer, constante C_D, L/D en rolhoek, RK4; convectieve verwarming van het stuwpunt volgens NASA TR R-376 ({ "1971" }), koude wand, GEEN stralingsverwarming, GEEN TPS-/ablatierespons, GEEN 6-DoF (resultaat <c1/>)

seg-47f81ab160cc = De piekvertraging wordt gecontroleerd tegen de gepubliceerde nominale waarde van Stardust; de verwarming is MODELLED. (kindcatalogus (<c1/>))

seg-47cda83af127 = Intredeinterface op een straal van { "6503.14" } km, inertiaal { "12.9" } km/s bij -8.2 deg, { "45.8" } kg, { "0.811" } m diameter, { "0.2202" } m neusstraal (Desai et al., NASA NTRS { "20050042027" } en { "20090004445" }). De breedte en de koers zijn een aangenomen benaderende intrede boven de Stille Oceaan; C_D is de standaardwaarde van de module voor een bolkegel van { "60" } deg. Gepubliceerde nominale piekvertraging in 6-DoF: { "33.4" } g. De verwarming is uitsluitend convectief volgens Sutton-Graves, MODELLED. (opmerking in het scenariobestand, regels { "4" } tot { "8" })

seg-98af076be1ac = Convectieve intreeverwarming van het stuwpunt (Sutton-Graves) bij een 3-DoF-intrede is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-77c073cd5d67 = <s1>Vorige</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>Volgende</s1>eo-coverage
