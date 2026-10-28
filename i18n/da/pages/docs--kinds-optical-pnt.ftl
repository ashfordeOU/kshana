# docs--kinds-optical-pnt: translations (da)

seg-b03d56f501c3 = Type

seg-e6839b50b560 = MODELLED heterogent optisk + RF PNT-fælleskvalitetsmål (P5): sammensætter et optisk tovejs-linkbudget på { "1550" } nm (fotonbegrænset CRLB for tovejs-afstandsmåling σ_τ/√N og diffraktionsfodaftryk λ/D·afstand), et tværmodalt RAIM-beskyttelsesniveau med løsningsseparation (position OG tidssynkronisering), der fusionerer de løse RF-løsninger og de tætte optiske løsninger med forskellige kovarianser, den optiske klarhimmeltilgængelighed for N stationer (uafhængig forening { "1" }−Π({ "1" }−a_i) og en rumligt korreleret variant), en optisk↔RF-overdragelse af tilstand/kovarians med et BEVIST bitkontinuerligt (spring-frit) middel og en NEES χ²-konsistensport samt en fælles score for P(tilgængelig OG præcisionsklasse OG integritetssikret) med håndtering af korrelation. VALIDATED lukket form: afstandsmålingens CRLB, diffraktionsfodaftrykket, χ²-kvantilen for beskyttelsesniveauet, foreningens kombinatorik, overdragelsens middelkontinuitet + NEES-porten og det fælles uafhængige produkt. MODELLED: de optiske tabsfordelinger, RF-/optiske σ-størrelser, skyklimatologi-input, korrelationer og P_HMI-budgettet. Ikke et certificeret tilgængeligheds-/integritetsprodukt.

seg-5cea5229815e = Diagrammet, som motoren skriver for scenarios/hybrid-optical-rf.toml, scenarietype hybrid-optical-rf

seg-a878d9be65b7 = MODELLED optisk PNT gennem atmosfæren: for en optisk forbindelse og et sæt jordstationer med angivne skyklimaer rapporterer den tabet i klar luft som funktion af bølgelængde og elevation (Kims sigtbarhedslov plus Rayleigh), turbulenstilstanden efter Hufnagel-Valley (Rytov-varians, scintillationsindeks, gamma-gamma-parametre, aperturmiddelværdi), den vejrbestemte tilgængelighed mod linkmargenen (skyers optiske dybde ud fra et lognormalt klima for flydende vand, geometrisk-optisk ekstinktion, uafhængig turbulensfading), den linkmargen, der skal til for målene for tilgængelighed, fordelingen af afbrudsvarigheder, væksten i tidssynkroniserings- og afstandsfejl for hvert afbrud gennem urets holdover-model, afstandskorreleret tilgængelighed med stedsdiversitet og tænkte gevinster ved forbedringsteknikker (bølgelængde, modtageapertur, scintillationsreduktion med adaptiv optik, ekstra margen). VALIDATED som implementering af de angivne formler mod et uafhængigt mpmath-orakel: Rytov-varians, scintillationsindeks, sandsynlighed for gamma-gamma-fading, faktor for aperturmiddelværdi, skyers og klar lufts optiske dybde. MODELLED: alle input om vejr, teknikker og ur samt antagelserne om uafhængighed og copula; ingen målt tilgængelighedsregistrering er sammenlignet. Vejledende analyse, ikke et certificeret tilgængeligheds- eller navigationsprodukt.

seg-4e2b759aff17 = Diagrammet, som motoren skriver for scenarios/optical-atmosphere-network.toml, type optical-atmosphere

seg-4e31c8daf798 = Register

seg-963749981a7c = Kilde: <c1/>

seg-079c8b284c44 = Optisk PNT (scenarietypefamilie)

seg-6dea687b727b = { "2" } scenarietyper i motoren v{ $version }. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en safety-of-life-tjeneste. Hver betegnelse her er motorens eller verifikationsmatricens; en type er MODELLED, medmindre matricen angiver andet (hvordan en betegnelse opnås: afsnittet Evidens i README).

seg-d019c8511f48 = Emnesider: <a1>OPTICAL-ATMOSPHERE</a1>. Kør én: <c1/>. Alle familier: <a2>KINDS.md</a2>.

seg-b8f937411028 = Kontaktark med de diagrammer, som motoren skriver for typerne i familien Optisk PNT

seg-76131e6805e5 = MODELLED optisk PNT gennem atmosfæren: for en optisk forbindelse og et sæt jordsteder med angivne skyklimaer rapporteres det bølgelængde- og elevationsafhængige tab i klar luft (Kim-sigtbarhed

seg-55725043f48e = MODELLED heterogen optisk + RF PNT-fælles kvalitetsmål (P5): sammensætter det optiske tovejsforbindelsesbudget ved { "1550" } nm (fotonbegrænset CRLB for tovejsafstandsmåling σ_τ/√N og diffraktionsfodaftryk λ/D·afstand), a

seg-5e658f01d9f4 = HETEROGENEOUS (resultatbetegnelse)

seg-750466e3188c = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-9e3ce423c0b9 = <b>Register:</b> MODELLED. Fuld side med input, resultater, evidens og begrænsninger: <a1>optical-atmosphere</a1>.

seg-93f5d0527850 = Obligatoriske felter: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

seg-6a6f8eea5767 = <b>Register:</b> ingen matrixrække nævner denne type; motoren betegner selv sit resultat. Fuld side med input, resultater, evidens og begrænsninger: <a1>hybrid-optical-rf</a1>.

seg-a4baaf1fbb8c = <s1>Forrige</s1>Missionsanalyse forbindelser og rumoperationer

seg-48792381ba0b = <s1>Næste</s1>Rumbrugernavigation

seg-22449071fb11 = <s1>Forrige</s1>Missionstråde
