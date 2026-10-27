# docs--kind-conflict-resilience: translations (nl)

seg-c4ed27a559df = Onderwerppagina: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = Scenariokind van de engine v{ $version }, familie <a1>GPS-denied alternatieve PNT</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-98133e74f88a = Familiepagina: <a1>GPS-denied alternatieve PNT</a1>

seg-34f14aa2ee0b = Bron: <c1/>

seg-a80556cfe1a9 = <c1/> (scenariokind)

seg-c8f93431680a = MODELLED conflictveerkracht van gelaagde PNT (P7): een gebruiker in een betwiste omgeving zet meerdere PNT-lagen in (open-service-GNSS, breedband-GNSS, een geauthenticeerde constellatie, een augmentatierelay), elk met een basisbeschikbaarheid, een 1σ-nauwkeurigheid en een kwetsbaarheid voor uitval per vector voor de gedeelde jamming-/spoofingdreiging. Een op intensiteit gesweepte GESEEDE Monte-Carlo laat elke laag uitvallen met kans clamp(vulnerability·intensity·vector_weight,{ "0,1" }), fuseert de overlevenden volgens de gesloten-vorm-inverse-variantieregel σ_fused=(Σ 1/σ_i²)^(−1/2), en rapporteert de kans op totaal verlies (alle lagen uitgevallen), de mediane gefuseerde fout en statistieken per laag voor bruikbaarheid/uitval tegenover intensiteit. De kopveerkrachtverhouding (kans op totaal verlies bij één laag tegenover gelaagd) komt uit op ~7x onder de aanname van ONAFHANKELIJKHEID; een gaussiaanse-copula-sweep met één factor en gecorreleerde uitval toont daarna dat die ~7x naar { "1" } instort naarmate de uitvalcorrelatie toeneemt (correlatie ondermijnt gelaagdheid). Een blok met priorgevoeligheid laat de kopwaarde variëren over de BEGRONDE kwetsbaarheidspriors via de mcda-tornado + een Dirichlet-herverdeling van dreigingsinspanning + percentielbetrouwbaarheidsintervallen. VALIDATED kern: het totale verlies uit Monte-Carlo convergeert naar het gesloten-vorm-onafhankelijke product Π_i p_deny_i (binnen de Monte-Carlo-standaardfout bij vaste seed en grote N); de inverse-variantiefusie is een gesloten-vorm-identiteit; bij ρ={ "0" } reduceert de copula tot het onafhankelijke model en behoudt elke ρ de marginale uitvalfrequentie van elke laag. MODELLED: de groottes van kwetsbaarheid/beschikbaarheid/nauwkeurigheid per laag zijn begronde maar gemodelleerde invoer (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — zie conflict_threat_params), en de specifieke grootte van ~7x en de vorm van de curve verhouding-versus-correlatie volgen uit die parametrisering. Een uitsplitsing van overleving per vector in § { "4.2" } splitst daarna de gedeelde RF-dreiging in de vier benoemde vectoren (jamming/spoofing/kinetisch/cyber) en rapporteert van elke vector de curve van geleidelijke achteruitgang van bruikbare PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: de geseede Monte-Carlo per laag convergeert naar die gesloten vorm; jamming is de scherpste vector voor de gecorreleerde RF-basislijn en de RF-immune inertiële laag is de beslissende overlever. Geen gecertificeerd product voor navigatiebeschikbaarheid.

seg-dd10a00edc2f = Eén run van <c1/> vat samen als: conflict-resilience | { "4" } lagen ({ "0" } basislijn) | referentie-intensiteit { "1.00" } | veerkrachtverhouding gesloten vorm 6.73x MC 6.19x (gelaagd tegenover één laag) | correlatie ondermijnt gelaagdheid: verhouding 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | prior-BI [5.51-8.48]x | overleving per vector @ ref jam { "26" }% spoof { "80" }% kinetisch { "100" }% cyber { "99" }% (scherpst jamming) | ~7x kopwaarde MODELLED, VALIDATED MC->gesloten vorm / fusie-identiteit / copula-marginalen / overleving per vector

seg-674bafccbaf7 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-71fcff68edaf = Het voorbeeld <c1/> stelt onder meer in:

seg-4e3b5bb5a5e7 = GNSS L1 C/A (open service)

seg-bd3832c8215d = Resultaatlabel (van de engine): MODELLED conflictveerkracht van gelaagde PNT (P7). VALIDATED kern: de kans op totaal verlies uit Monte-Carlo convergeert naar het gesloten-vorm-onafhankelijke product Pi_i p_deny_i (getoetst binnen de Monte-Carlo-standaardfout bij vaste seed en grote N); de inverse-variantiepositiefusie sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = De grafiek die de engine schrijft voor scenarios/conflict-resilience.toml, kind conflict-resilience

seg-c0e69524f05d = <b>MODELLED</b> Deelscores per dimensie over de zeven eigen veerkrachtcategorieën van Kshana (geen DHS-termen), RethinkPNT-RDRR-functies en Yang-criteria, elk gelabeld als gemodelleerd met i. Onafhankelijke referentie (InternalConsistency): Met de hand afgeleide formules per metriek: inverse-Simpson-diversiteit, gewogen-gemiddelde samenstelling, begrensde/onbegrensde tijdlijnduren, zwakste-schakel-niveauladder

seg-2ca37a78e899 = MODELLED conflictveerkracht van gelaagde PNT (P7). VALIDATED kern: de kans op totaal verlies uit Monte-Carlo convergeert naar het gesloten-vorm-onafhankelijke product Pi_i p_deny_i (getoetst binnen de Monte-Carlo-standaardfout bij vaste seed en grote N); de inverse-variantiepositiefusie sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) is een gesloten-vorm-identiteit; bij correlatie rho={ "0" } reduceert de gaussiaanse copula exact tot het onafhankelijke mo (resultaat <c1/>)

seg-d0d834e377ee = MODELLED conflictveerkracht van gelaagde PNT (P7): een gebruiker in een betwiste omgeving zet meerdere PNT-lagen in (open-service-GNSS, breedband-GNSS, een geauthenticeerde constellatie, een augmentatierelay), elk met een basisbeschikbaarheid, een 1σ-nauwkeurigheid en een kwetsbaarheid voor uitval per vector voor de gedeelde jamming-/spoofingdreiging. (kindcatalogus (<c1/>))

seg-3ca12700b54c = De kopveerkrachtverhouding (kans op totaal verlies bij één laag tegenover gelaagd) komt uit op ~7x onder de aanname van ONAFHANKELIJKHEID; een gaussiaanse-copula-sweep met één factor en gecorreleerde uitval toont daarna dat die ~7x naar { "1" } instort naarmate de uitvalcorrelatie toeneemt (correlatie ondermijnt gelaagdheid). (kindcatalogus (<c1/>))

seg-70e4fdff099f = MODELLED: de groottes van kwetsbaarheid/beschikbaarheid/nauwkeurigheid per laag zijn begronde maar gemodelleerde invoer (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — zie conflict_threat_params), en de specifieke grootte van ~7x en de vorm van de curve verhouding-versus-correlatie volgen uit die parametrisering. (kindcatalogus (<c1/>))

seg-33541cca61b6 = Een gebruiker in een betwiste omgeving zet vier RF-PNT-lagen in die allemaal op dezelfde band meeliften en daarom de uitvalvector van jamming/spoofing delen — het kwetsbare, gecorreleerde geval. Het scenario rapporteert: * kans op totaal verlies tegenover dreigingsintensiteit (Monte-Carlo tegenover het gesloten-vorm-onafhankelijke product waarnaar het convergeert), * de ~7x veerkrachtverhouding gelaagd tegenover één laag onder de onafhankelijkheidsaanname, * hoe die ~7x instort naar (opmerking in het scenariobestand, regels { "3" } tot { "15" })

seg-83badfe4784d = Elke grootte per laag is een MODELLED invoer met herkomst; zie src/conflict_threat_params.rs voor de begronde [min, nominaal, max]-priors en de gevoeligheidsprofielen per vector (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Als <c1/> wordt weggelaten, draait dezelfde begronde basislijn met vier lagen; hij is hier uitgeschreven — inclusief het vector_profile van elke laag — voor de transparantie. (opmerking in het scenariobestand, regels { "17" } tot { "22" })

seg-bb182ed41520 = Scoring volgens een PNT-veerkrachtraamwerk is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-6a42653a8a0f = <s1>Vorige</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>Volgende</s1>constellation-design
