# docs--kind-attitude-budget: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-40ca4197150b = Bron: <c1/>

seg-a271f371a3cf = <c1/> (scenariokind)

seg-62c0dda9fc56 = 3-DOF-stand- en richtfoutbudget: het worstcase-verstoringsmoment van de zwaartekrachtgradiënt ((3/2)(μ/R³)ΔI) en een root-sum-square-richtfoutbudget over benoemde 1σ-bijdragers (sensorruis, reactiewieljitter, thermisch, uitlijning) met de dominante term, voor een baanhoogte + spreiding van het lichaamstraagheidsmoment. MODELLED scalair AOCS-budget — een pre-hardwarecomplement op Basilisk/42, geen simulatie van regellus, 6-DoF of flexibele modi.

seg-9fdc45a8aaa3 = Eén run van <c1/> vat samen als: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> GG-moment { "7.04e-5" } N·m; richting { "10.7" }" RSS (dominant: reaction_wheel_jitter) (MODELLED scalair budget)

seg-7cf112b1bcc3 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-91ebbc89f9bb = Het voorbeeld <c1/> stelt onder meer in:

seg-c33e3cbba749 = arcsec

seg-36df1bc710ab = uitlijning

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = Resultaatlabel (van de engine): MODELLED — scalair 3-DOF-AOCS-foutbudget: worstcase-verstoringsmoment van de zwaartekrachtgradiënt + RSS-richtbudget; GEEN simulatie van regellus, 6-DoF of flexibele modi (een pre-hardwarecomplement op Basilisk/42, geen vervanging)

seg-ad0e72e3b688 = De grafiek die de engine schrijft voor scenarios/attitude-budget.toml, kind attitude-budget

seg-95b159fb5e68 = <b>VALIDATED</b> Worstcase-verstoringsmoment van de zwaartekrachtgradiënt ((3/2)(μ/R³)ΔI) als piek over de stand (de gevalideerde claim), plus een RSS-richtfoutbudget over benoemde 1σ-bijdragers met de dominante term (een kwadratische som van door de aanroeper geleverde getallen Tests: <a1>attitude_gg_torque_reference.rs</a1>.

seg-f7c8d8994896 = <b>VALIDATED</b> Worstcase-verstoringsmoment van de zwaartekrachtgradiënt ((3/2)(μ/R³)ΔI) als piek over de stand (de gevalideerde claim), plus een RSS-richtfoutbudget over benoemde 1σ . Onafhankelijke referentie (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), een onafhankelijke C++-implementatie van het volledige-tensor-zwaartekrachtgradiëntmoment: de piek (3/2)(μ/R³)ΔI van Kshana is gelijk aan het moment van Basilisk bij de stand van { "45" } deg binnen { "1e-12" } relatief (slechtste { "2.1e-15" }) over { "5" } hoogtes en { "8" } traagheidstensoren, en begrenst het moment van Basilisk over { "2000" } willekeurige standen per geval; tolerantie vastgelegd vóór de vergelijking. Gevalideerde claim: de zwaartekracht

seg-d2a6cf813e95 = <b>PARTNER</b> Niet geleverd — Kshana is een simulator voor navigatieprestaties, geen satellietbushuis. Onafhankelijke referentie (NoneKind): geen: een discipline die van de partner is, met opzet zonder module en zonder test

seg-3895121a5466 = MODELLED — scalair 3-DOF-AOCS-foutbudget: worstcase-verstoringsmoment van de zwaartekrachtgradiënt + RSS-richtbudget; GEEN simulatie van regellus, 6-DoF of flexibele modi (een pre-hardwarecomplement op Basilisk/42, geen vervanging) (resultaat <c1/>)

seg-f62458cae23b = MODELLED scalair AOCS-budget — een pre-hardwarecomplement op Basilisk/42, geen simulatie van regellus, 6-DoF of flexibele modi. (kindcatalogus (<c1/>))

seg-333fca11ac0c = EERLIJKE REIKWIJDTE: MODELLED scalair foutbudget -- een pre-hardwarecomplement op Basilisk/42, GEEN simulatie van regellus, 6-DoF of flexibele modi. De zwaartekrachtgradiëntterm wordt als moment gerapporteerd (om die naar richting om te zetten is een regelstijfheid nodig die de aanroeper bezit); het budget is de kwadratische som van de aangeleverde 1-sigma-bijdragers. Run: kshana scenarios/attitude-budget.toml (opmerking in het scenariobestand, regels { "8" } tot { "13" })

seg-0e27fcef1499 = <s1>Vorige</s1>ascent-losses

seg-946c453cbf0f = <s1>Volgende</s1>body-pnt
