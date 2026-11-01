# docs--kind-optical-atmosphere: translations (da)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-72ad48275ebe = Scenarietype i motoren v{ $version }, familie <a1>Optisk PNT</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-a97755cb13eb = Familieside: <a1>Optisk PNT</a1>

seg-9fd02351d844 = ms

seg-d4e4da22fadb = Kilde: <c1/>

seg-deb0a932a76f = <c1/> (scenarietype)

seg-a878d9be65b7 = MODELLED optisk PNT gennem atmosfæren: for en optisk forbindelse og et sæt jordstationer med angivne skyklimaer rapporterer den tabet i klar luft som funktion af bølgelængde og elevation (Kims sigtbarhedslov plus Rayleigh), turbulenstilstanden efter Hufnagel-Valley (Rytov-varians, scintillationsindeks, gamma-gamma-parametre, aperturmiddelværdi), den vejrbestemte tilgængelighed mod linkmargenen (skyers optiske dybde ud fra et lognormalt klima for flydende vand, geometrisk-optisk ekstinktion, uafhængig turbulensfading), den linkmargen, der skal til for målene for tilgængelighed, fordelingen af afbrudsvarigheder, væksten i tidssynkroniserings- og afstandsfejl for hvert afbrud gennem urets holdover-model, afstandskorreleret tilgængelighed med stedsdiversitet og tænkte gevinster ved forbedringsteknikker (bølgelængde, modtageapertur, scintillationsreduktion med adaptiv optik, ekstra margen). VALIDATED som implementering af de angivne formler mod et uafhængigt mpmath-orakel: Rytov-varians, scintillationsindeks, sandsynlighed for gamma-gamma-fading, faktor for aperturmiddelværdi, skyers og klar lufts optiske dybde. MODELLED: alle input om vejr, teknikker og ur samt antagelserne om uafhængighed og copula; ingen målt tilgængelighedsregistrering er sammenlignet. Vejledende analyse, ikke et certificeret tilgængeligheds- eller navigationsprodukt.

seg-c443d8d3e4ce = Én kørsel af <c1/> opsummeres som: optical-atmosphere: { "1550" } nm ved { "30" } grader elevation, margen { "19.2" } dB før atmosfæren; bedste sted southern { "74.66" } %; netværk med 3 steder { "92.72" } % uafhængigt / { "91.62" } % korreleret vejr (MODELLED, vejledende)

seg-e466ecbd4e6d = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-8adae3ea6e60 = Eksemplet <c1/> angiver blandt andet:

seg-687f2930a40d = downlink

seg-e794d481aed4 = plane

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = Resultatetiket (motorens egen): MODELLED — optisk PNT gennem atmosfæren: ekstinktion i klar luft (Kims sigtbarhedslov + Rayleigh), skyers optiske dybde ud fra et angivet klima for flydende vand (mængde efter P.840, geometrisk-optisk ekstinktion), turbulens efter Hufnagel-Valley med gamma-gamma-fading og aperturmiddelværdi, tilgængelighed mod

seg-4e2b759aff17 = Diagrammet, som motoren skriver for scenarios/optical-atmosphere-network.toml, type optical-atmosphere

seg-a18d144f149e = <b>MODELLED</b> Hufnagel-Valley Cn2 integreret langs en skrå sti for Rytov-variansen for plan- og kugleformede bølger (uplink og downlink), Andrews-Phillips' scintillationsindeks og gamma-gamma-parametre, sandsynligheden for gamma-gamma-fading og fadingmargenen, Tests: <a1>optical_atmosphere_reference.rs</a1>.

seg-d97535fd4875 = <b>MODELLED</b> Tilgængelighed af en optisk forbindelse mod en angivet linkmargen ud fra et lognormalt klima for skyers flydende vand (mængde efter ITU-R P.840, geometrisk-optisk ekstinktion) og den uafhængige gamma-gamma-turbulensfading, den linkmargen, der skal til for mål Tests: <a1>optical_atmosphere_identities.rs</a1>.

seg-6e2c643df3a6 = <b>MODELLED</b> Fordelingen af afbrudsvarigheder for et optisk sted koblet til den lukkede form for coast-variansen i urets holdover-model: fejl i tidssynkronisering og afstand ved angivne afbrudskvantiler, holdover til en tærskel for tidssynkronisering, andelen af afbrud og Tests: <a1>optical_atmosphere_identities.rs</a1>.

seg-00c76aeadb90 = <b>MODELLED</b> En valgfri tabel <c1/> (varighed, trin, seed) får typen <c2/> til også at skrive en seedet realisering af den angivne stedsmodel over tid for hvert sted: skyepisoder (klare perioder eksponentielle, skyafbrud lognormale Tests: <a1>optical_atmosphere_timeseries.rs</a1>.

seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagel-Valley Cn2 integreret langs en skrå sti for Rytov-variansen for plan- og kugleformede bølger (uplink og downlink), Andrews-Phillips' scintillationsind. Uafhængig reference (ExternalDataset): Beregningerne sammenlignes med et uafhængigt program (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } med { "30" } cifre, tanh-sinh-kvadratur over den oprindelige højdevariabel og gamma-gamma-tætheder med Bessel-K), der ikke deler kode med Kshana, under tærskler fastsat på forhånd, før der fandtes nogen implementering (xval/optical-atmosphere/PREREGISTRATION.md). HVORFOR MODELLED: dette orakel beregner de samme offentliggjorte formler, så det kontrollerer im

seg-4af9bc99ef29 = <b>MODELLED</b> Tilgængelighed af en optisk forbindelse mod en angivet linkmargen ud fra et lognormalt klima for skyers flydende vand (mængde efter ITU-R P.840, geometrisk-optisk ekstinktion) og . Uafhængig reference (InternalConsistency): intern konsistens: grænser i lukket form og monotoni i diversitetsmodellen, den lukkede form for skyloftet og de lognormale identiteter for afbrud. INGEN ekstern uafhængig reference påstås, og ingen er sammenlignet: ingen målt tilgængelighed for optiske jordstationer og ingen registrering af skyfri sigtelinje bruges. HVORFOR MODELLED: skyklimaet (sandsynlighed for skyer, median og spredning af søjlen af flydende vand, afbrudsvarigheder),

seg-b3abf6cbeba4 = <b>MODELLED</b> Fordelingen af afbrudsvarigheder for et optisk sted koblet til den lukkede form for coast-variansen i urets holdover-model: fejl i tidssynkronisering og afstand ved angivne afbr. Uafhængig reference (InternalConsistency): intern konsistens med holdover-modulet, bit for bit; INGEN ekstern uafhængig reference påstås. Klassernes PSD'er er de syntetiserede gulve ved lang tau, som holdover-modulet allerede bærer, så tallene arver dets angivne forbehold om, at holdover til en stram tærskel styres af det antagne gulv for rød støj og ikke af den citerede Allan-deviation. Afbrudsvarighederne er en lognormal model med angivne parametre, ikke en målt c

seg-c4772a9e1a26 = MODELLED — optisk PNT gennem atmosfæren: ekstinktion i klar luft (Kims sigtbarhedslov + Rayleigh), skyers optiske dybde ud fra et angivet klima for flydende vand (mængde efter P.840, geometrisk-optisk ekstinktion), turbulens efter Hufnagel-Valley med gamma-gamma-fading og aperturmiddelværdi, tilgængelighed mod linkmargenen, afbrudsvarigheder koblet til urets holdover og afstandskorreleret stedsdiversitet. Beregningerne er kontrolleret (resultat <c1/>)

seg-32c6524b0baf = MODELLED optisk PNT gennem atmosfæren: for en optisk forbindelse og et sæt jordstationer med angivne skyklimaer rapporterer den tabet i klar luft som funktion af bølgelængde og elevation (Kims sigtbarhedslov plus Rayleigh), turbulenstilstanden efter Hufnagel-Valley (Rytov-varians, scintillationsindeks, gamma-gamma-parametre, aperturmiddelværdi), den vejrbestemte tilgængelighed mod linkmargenen (skyers optiske dybde ud (typekatalog (<c1/>))

seg-2c7493ee5042 = MODELLED: alle input om vejr, teknikker og ur samt antagelserne om uafhængighed og copula; ingen målt tilgængelighedsregistrering er sammenlignet. (typekatalog (<c1/>))

seg-b4402211e3fe = Optisk PNT gennem atmosfæren: tre ILLUSTRATIVE jordstationer (et skyeligere nordligt sted, et middelmådigt centralt sted og et klarere sydligt sted), der ser en optisk LEO-terminal ved { "30" } graders elevation ved { "1550" } nm. Skyklimaerne er angivne input, ikke målinger og ikke værdier fra noget datasæt, så al tilgængelighed nedenfor er MODELLED. Kørslen rapporterer for hvert sted tabet i klar luft, turbulenstilstanden efter Hufnagel-Valley, t (kommentar i scenariefilen, linje { "1" } til { "8" })

seg-384f5c73cdf9 = Én seedet realisering af hvert steds forbindelse over tid (MODELLED; et træk fra modellen ovenfor, ikke klimaet). Hvis den mangler, skrives ingen serie, og resultatet er dokumentet { "0.37" }. (kommentar i scenariefilen, linje { "78" } til { "79" })

seg-c75fa5787bd4 = Numerik for atmosfæren langs en optisk skrå sti: Rytov-varians, scintillation, sandsynlighed for gamma-gamma-fading, aperturmiddelværdi, skyers og klar lufts optiske dybde er MODELLED, ikke valideret: et delkrav er kontrolleret eksternt, men hele funktionen sammensætter modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e5013bdf86bb = Vejrbestemt tilgængelighed for optiske jordstationer og afstandskorreleret stedsdiversitet er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-dc1132147318 = Emneside: <a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>Forrige</s1>oem-interop

seg-ef0a779c300c = <s1>Næste</s1>orbit
