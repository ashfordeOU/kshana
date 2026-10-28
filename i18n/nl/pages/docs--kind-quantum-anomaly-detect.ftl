# docs--kind-quantum-anomaly-detect: translations (nl)

seg-29e58493fdd4 = Berekend uit een model

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-7b2721b7588d = Scenariosoort van de engine v{ $version }, familie <a1>Inertiële, fusie- en kwantumsensoren</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-f7f12029e0ec = Familiepagina: <a1>Inertiële, fusie- en kwantumsensoren</a1>

seg-496b17a8d3b9 = Onderwerppagina: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Niet geleverd: alleen prestatiemodellen; koudeatoom-/klokhardware is van een partner. Onafhankelijke referentie (NoneKind): geen: een discipline van een partner, bewust zonder module en zonder test

seg-836d5102f0d1 = Bron: <c1/>

seg-ad4ce0110e8d = <c1/> (scenariosoort)

seg-04310cd6cbec = MODELLED detectie van storingen/anomalieën voor kwantum-PNT-systemen: een gelabelde storingencatalogus (klokfrequentiesprong/-drift/-lockverlies; sensorbiasstap/-uitval), een ROC AUC van de detectiestatistiek (met een bootstrap-betrouwbaarheidsinterval uit de extern getoetste eval_stats) en een minimaal detecteerbare storing bij een vaste valse-alarmkans, waarbij de door een kwantumklok ondersteunde monitor (minder ruis) kleinere storingen detecteert — als eerlijke TradeEvidence + representativiteit. Gaussiaans model van de detectiestatistiek (AUC = Phi(mu/(sigma*sqrt2))); modelleert de klasse, illustratieve parameters uit openbare bronnen, geen TRL, geen vluchtervaring, geen certificering.

seg-442310afbb13 = Eén run van <c1/> vat samen als: quantum-anomaly-detect | AUC quantum { "0.9908" } tegenover klassiek { "0.7603" } | minimaal detecteerbare storing quantum { "1.312" } tegenover klassiek { "4.372" } | { "5" } storingsklassen | afweging: quantum wint 2/2 | MODELLED

seg-335b8d87e27d = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-c2b10c0bdaf8 = Het voorbeeld <c1/> stelt onder meer in:

seg-f44afe581836 = { $version }

seg-2f1d14239d1a = De grafiek die de engine schrijft voor scenarios/quantum-anomaly-detect.toml, soort quantum-anomaly-detect

seg-af9aaf95d4f8 = <b>VALIDATED</b> Analytische binormale ROC AUC = Φ(μ/(σ√{ "2" })) en de minimaal detecteerbare storing σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) die ten grondslag liggen aan de kwantumstoringsdetectoren en anomaliedetectoren. Onafhankelijke referentie (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), beide BSD-3-Clause — onafhankelijke bibliotheken die dezelfde eenduidig gedefinieerde Gauss-staart-/AUC-grootheden berekenen, overeenkomend tot op de A&S-erf-ondergrens (~{ "7e-8" }). Het daarop voortbouwende voordeel van quantum ten opzichte van klassiek blijft MODELLED

seg-c37642bb24fe = <b>MODELLED</b> Eén reproduceerbaar TradeEvidence-object (vast kader: scenario+seed+engine; gemeenschappelijke waarden per kwaliteitsmaat voor quantum tegenover klassiek met polariteitscorrect voordeel, optioneel { "95" }%. Onafhankelijke referentie (InternalConsistency): identiteiten in gesloten vorm voor voordeel/winnaar + een getrouwe omhulling van het bestaande quantum_trade::TradeResult; eerlijkheid gekoppeld aan het representativiteitsregister en de verificatielabels

seg-b854cedc8a51 = <b>MODELLED</b> Gelabelde catalogus van kwantumstoringen (klokfrequentiesprong/-drift/-lockverlies; sensorbiasstap/-uitval), een ROC AUC van de detectiestatistiek met een bootstrap-betrouwbaarheidsinterval, en een minimaal. Onafhankelijke referentie (InternalConsistency): Gaussische AUC in gesloten vorm = Phi(mu/(sigma*sqrt2)), gecontroleerd tegen de extern getoetste eval_stats::bootstrap_auc_ci (tegenover scikit-learn) + analytische detectiedrempels

seg-7b465c2bb7cf = MODELLED detectie van storingen/anomalieën voor kwantum-PNT-systemen: een gelabelde storingencatalogus (klokfrequentiesprong/-drift/-lockverlies; sensorbiasstap/-uitval), een ROC AUC van de detectiestatistiek (met een bootstrap-betrouwbaarheidsinterval uit de extern getoetste eval_stats) en een minimaal detecteerbare storing bij een vaste valse-alarmkans, waarbij de door een kwantumklok ondersteunde monitor (minder ruis) kleinere storingen detecteert — als eerlijke TradeEvidence + representatief (soortencatalogus (<c1/>))

seg-7f43972b246d = Detectie van storingen/anomalieën voor kwantum-PNT-systemen — gelabelde storingencatalogus + ROC AUC + minimaal detecteerbare storing, monitor met kwantumklok tegenover klassiek. MODELLED; illustratieve parameters uit openbare bronnen; modelleert de klasse, geen TRL- of vluchtclaim. (opmerking in het scenariobestand, regels { "1" } tot { "3" })

seg-eb75c6a4dcec = Het afwegingsbewijs quantum tegenover klassiek (gemeenschappelijke vorm) is MODELLED, niet getoetst: gecontroleerd aan de hand van de eigen gesloten-vormidentiteit of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = Detectie van storingen/anomalieën voor kwantum-PNT-systemen is MODELLED, niet getoetst: gecontroleerd aan de hand van de eigen gesloten-vormidentiteit of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>Vorige</s1>pvt

seg-aa689568cf84 = <s1>Volgende</s1>quantum-gnss-free-nav
