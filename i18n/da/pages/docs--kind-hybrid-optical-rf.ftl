# docs--kind-hybrid-optical-rf: translations (da)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-0482fec5b0f6 = Kilde: <c1/>

seg-830c574e871b = <c1/> (scenarietype)

seg-72ad48275ebe = Scenarietype i motoren v{ $version }, familie <a1>Optisk PNT</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-e6839b50b560 = MODELLED heterogent optisk + RF PNT-fælleskvalitetsmål (P5): sammensætter et optisk tovejs-linkbudget på { "1550" } nm (fotonbegrænset CRLB for tovejs-afstandsmåling σ_τ/√N og diffraktionsfodaftryk λ/D·afstand), et tværmodalt RAIM-beskyttelsesniveau med løsningsseparation (position OG tidssynkronisering), der fusionerer de løse RF-løsninger og de tætte optiske løsninger med forskellige kovarianser, den optiske klarhimmeltilgængelighed for N stationer (uafhængig forening { "1" }−Π({ "1" }−a_i) og en rumligt korreleret variant), en optisk↔RF-overdragelse af tilstand/kovarians med et BEVIST bitkontinuerligt (spring-frit) middel og en NEES χ²-konsistensport samt en fælles score for P(tilgængelig OG præcisionsklasse OG integritetssikret) med håndtering af korrelation. VALIDATED lukket form: afstandsmålingens CRLB, diffraktionsfodaftrykket, χ²-kvantilen for beskyttelsesniveauet, foreningens kombinatorik, overdragelsens middelkontinuitet + NEES-porten og det fælles uafhængige produkt. MODELLED: de optiske tabsfordelinger, RF-/optiske σ-størrelser, skyklimatologi-input, korrelationer og P_HMI-budgettet. Ikke et certificeret tilgængeligheds-/integritetsprodukt.

seg-30904e2367fc = Én kørsel af <c1/> opsummeres sådan: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

seg-73e5cf56c92c = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

seg-27338c8b2e5f = Eksemplet <c1/> angiver blandt andet:

seg-7b9ce4689508 = Resultatmærkat (motorens): Heterogent optisk + RF PNT-fælleskvalitetsmål for tilgængelighed / præcision / integritet (P5). VALIDATED lukket form: den fotonbegrænsede CRLB for afstandsmåling (σ_τ/√N) og diffraktionsfodaftrykket (λ/D·afstand), χ²-kvantilen for det tværmodale beskyttelsesniveau, den uafhængige forenings tilgængelighed for N stationer ({ "1" } − Π(

seg-5cea5229815e = Diagrammet, som motoren skriver for scenarios/hybrid-optical-rf.toml, scenarietype hybrid-optical-rf

seg-a8923a682728 = <b>MODELLED</b> Rapporten hybrid-optical-rf angiver den linkkonfiguration, den faktisk kørte med (bærebølgelængde, send- og modtageapertur, afstand, pulsbredde, integratio. Uafhængig reference (InternalConsistency): Ingen ekstern uafhængig reference, og ingen er mulig: dette er selvbeskrivelse, ikke en måling. Det registreres, fordi manglen på det var en defekt -- P5 måtte citere bærebølgelængden og sendeaperturen fra kildens standardværdier og udlede, at en bar <c1/> var i kvadratmeter, ud fra en intern konsistenskontrol. Udledningen var korrekt, hvilket netop er grunden til, at det betød noget: intet ville have fanget, hvis den havde været forkert

seg-28abb5a84eaa = <b>MODELLED</b> Rapporten hybrid-optical-rf angiver en RF-linktilgængelighed, sammensat af størrelser, som motoren allerede beregner, frem for af en importeret klimatologi, og . Uafhængig reference (InternalConsistency): Ingen ekstern uafhængig reference, og ExternalDataset er fravalgt. De to input er en Eb/N0-margin og en C/N0-tærskelkrydsning, begge funktioner af en MODELLED EIRP, et kvalitetsmål og en samlet tabsfordeling; der findes ingen målt tilgængelighedsregistrering for en hybrid optisk/RF-tjeneste mellem Jorden og Månen at kontrollere det sammensatte tal mod. De kontroller, der findes, er interne og angivet som sådanne: sammensætningen genberegnes ud fra r

seg-888004543d37 = <b>MODELLED</b> Rapporten hybrid-optical-rf udsender forholdet mellem optisk og RF-afstandsmåling med den ENE konfiguration, som begge ben blev evalueret ved, båret i samme objekt: den sa. Uafhængig reference (InternalConsistency): Ingen ekstern uafhængig reference for FORHOLDET, og ExternalDataset er fravalgt bevidst. Den underliggende RF-kæde har en -- tests/validate_p5_rf_ranging_precision.rs kontrollerer linkbudget::link_budget og navsignal::dll_code_jitter_chips mod en uafhængig Python/NumPy-fixture og mod den hårdkodede gennemregnede værdi fra Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m ved { "45" } dB-Hz) -- og den optiske CRLB har sin egen lukkede form-række

seg-db5ff373b50f = <b>MODELLED</b> Rapporten hybrid-optical-rf angiver, hvad den tværmodale chi-i-anden-monitor faktisk kan DETEKTERE, ikke blot at den består et fejlfrit tilfælde: den minimale detekterbare. Uafhængig reference (InternalConsistency): To interne uafhængige referencer, intet eksternt datasæt. ({ "1" }) Rundtur i lukket form: den minimale detekterbare bias fremkommer ved at invertere halen af den ikke-centrale chi-i-anden på ikke-centraliteten (raim::pbias) og verificeres ved at føre den resulterende ikke-centralitet tilbage gennem raim::noncentral_chi2_cdf ved monitorens egen tærskel, hvilket skal give P_md. ({ "2" }) Injektion mod analyse: en bias skrives ind i RF-estimatet for én akse

seg-24f31f6b353f = Heterogent optisk + RF PNT-fælleskvalitetsmål for tilgængelighed / præcision / integritet (P5). VALIDATED lukket form: den fotonbegrænsede CRLB for afstandsmåling (σ_τ/√N) og diffraktionsfodaftrykket (λ/D·afstand), χ²-kvantilen for det tværmodale beskyttelsesniveau, den uafhængige forenings tilgængelighed for N stationer ({ "1" } − Π({ "1" }−a_i)), invarianten for optisk↔RF-overdragelsens middelkontinuitet (bit for bit uden spring) og NEES χ²-porten samt den fælles FoM-inde (resultat <c1/>)

seg-bec90783ad8b = MODELLED heterogent optisk + RF PNT-fælleskvalitetsmål (P5): sammensætter et optisk tovejs-linkbudget på { "1550" } nm (fotonbegrænset CRLB for tovejs-afstandsmåling σ_τ/√N og diffraktionsfodaftryk λ/D·afstand), et tværmodalt RAIM-beskyttelsesniveau med løsningsseparation (position OG tidssynkronisering), der fusionerer de løse RF-løsninger og de tætte optiske løsninger med forskellige kovarianser, den optiske klarhimmeltilgængelighed for N stationer (uafhængig for (typekatalog (<c1/>))

seg-15abc895e477 = MODELLED: de optiske tabsfordelinger, RF-/optiske σ-størrelser, skyklimatologi-input, korrelationer og P_HMI-budgettet. (typekatalog (<c1/>))

seg-9fafa5ffb521 = MODELLED. Validerede lukkede former: CRLB for afstandsmåling (sigma_tau/sqrt(N)), diffraktionsfodaftryk (lambda/D * afstand), kvantil for chi-i-anden-beskyttelsesniveau, foreningens kombinatorik, overdragelsens middelkontinuitet + NEES-port og det fælles uafhængige produkt. Tabsfordelingerne, sigma-størrelserne, skyklimatologi-input, korrelationerne og P_HMI-budgettet er modellerede repræsentative input. Hvert felt nedenfor er valgfrit og vist ved sin (kommentar i scenariefilen, linje { "10" } til { "14" })

seg-e5f964e5d422 = --- G15 bias / ramp fault injection against the cross-modality monitor --- Den minimale detekterbare bias og detektionskraftkurven er ANALYTISKE (inversion af ikke-central chi-i-anden), så de behøver ingen egne input. Disse to fastsætter kun den rampehastighed, som den rapporterede tid til detektion er en hastighedsomregning af. Begge MODELLED. (kommentar i scenariefilen, linje { "56" } til { "59" })

seg-70f50a62aa12 = --- G17 post-handover coast: process noise and the alert-limit crossing --- Random walk på det eksisterende handoff-filter med 4 tilstande (øst, nord, op, ur). Alarmgrænserne er dem, der allerede er angivet ovenfor; kun procesnøjen og dækningsfaktoren er nye. Begge PSD'er er MODELLED repræsentative input, og krydsningstiderne skalerer direkte med dem. (kommentar i scenariefilen, linje { "63" } til { "67" })

seg-9fb4240fb0ef = Selvbeskrivelsen i hybrid optisk/RF-rapporten er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-a97755cb13eb = Familieside: <a1>Optisk PNT</a1>

seg-1586d90cdf1b = <s1>Forrige</s1>holdover-test

seg-211275a00df0 = <s1>Næste</s1>hybrid-ukf
