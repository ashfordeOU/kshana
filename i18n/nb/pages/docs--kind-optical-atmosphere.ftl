# docs--kind-optical-atmosphere: translations (nb)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-72ad48275ebe = Scenariotype i motoren v{ $version }, familie <a1>Optisk PNT</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-a97755cb13eb = Familieside: <a1>Optisk PNT</a1>

seg-9fd02351d844 = ms

seg-d4e4da22fadb = Kilde: <c1/>

seg-deb0a932a76f = <c1/> (scenariotype)

seg-a878d9be65b7 = MODELLED optisk PNT gjennom atmosfæren: for en optisk lenke og et sett bakkesteder med oppgitt skyklima rapporterer den tapet i klar luft som avhenger av bølgelengde og elevasjon (Kims sikttelov pluss Rayleigh), turbulenstilstanden etter Hufnagel-Valley (Rytov-varians, scintillasjonsindeks, gamma-gamma-parametere, aperturmiddelverdi), den værdrevne tilgjengeligheten mot lenkemarginen (skyens optiske dybde fra et log-normalt klima for flytende vann, ekstinksjon i geometrisk optikk, uavhengig turbulensfading), lenkemarginen som trengs for målrettede tilgjengeligheter, fordelingen av utfallsvarighet, veksten i tids- og avstandsfeil per utfall gjennom klokkens holdover-modell, avstandskorrelert tilgjengelighet med stedsdiversitet, og hva-hvis-gevinster for forbedringsteknikker (bølgelengde, mottaksapertur, reduksjon av scintillasjon med adaptiv optikk, ekstra margin). VALIDATED som implementasjon av de oppgitte formlene mot en uavhengig mpmath-referanse: Rytov-varians, scintillasjonsindeks, sannsynlighet for gamma-gamma-fading, aperturmiddelverdifaktor, optisk dybde for sky og klar luft. MODELLED: alle inndata for vær, teknikk og klokke, samt antakelsene om uavhengighet og copula; ingen målt tilgjengelighetsregistrering er sammenlignet. Veiledende analyse, ikke et sertifisert tilgjengelighets- eller navigasjonsprodukt.

seg-c443d8d3e4ce = En kjøring av <c1/> oppsummeres slik: optical-atmosphere: { "1550" } nm at { "30" } deg elevation, margin { "19.2" } dB before the atmosphere; best site southern { "74.66" } %; 3-site network { "92.72" } % independent / { "91.62" } % correlated weather (MODELLED, advisory)

seg-e466ecbd4e6d = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-8adae3ea6e60 = Eksempelet <c1/> angir blant annet:

seg-687f2930a40d = downlink

seg-e794d481aed4 = plane

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = Resultatetikett (motorens): MODELLED — optisk PNT gjennom atmosfæren: ekstinksjon i klar luft (Kims sikttelov + Rayleigh), skyens optiske dybde fra et oppgitt klima for flytende vann (P.840-mengde, ekstinksjon i geometrisk optikk), Hufnagel-Valley-turbulens med gamma-gamma-fading og aperturmiddelverdi, tilgjengelighet mot

seg-4e2b759aff17 = Diagrammet motoren skriver for scenarios/optical-atmosphere-network.toml, type optical-atmosphere

seg-a18d144f149e = <b>MODELLED</b> Hufnagel-Valley Cn2 integrert langs en skrå bane for Rytov-variansen for plan- og kulebølger (opplenke og nedlenke), Andrews-Phillips' scintillasjonsindeks og gamma-gamma-parametere, sannsynligheten for gamma-gamma-fading og fadingmarginen, Tester: <a1>optical_atmosphere_reference.rs</a1>.

seg-d97535fd4875 = <b>MODELLED</b> Tilgjengeligheten til en optisk lenke mot en oppgitt lenkemargin fra et log-normalt klima for flytende vann i skyer (ITU-R P.840-mengde, ekstinksjon i geometrisk optikk) og den uavhengige gamma-gamma-turbulensfadingen, lenkemarginen som trengs for målrettede t Tester: <a1>optical_atmosphere_identities.rs</a1>.

seg-6e2c643df3a6 = <b>MODELLED</b> Fordelingen av utfallsvarighet for et optisk sted koblet til den lukkede kystvariansen i klokkens holdover-modell: tids- og avstandsfeil ved oppgitte kvantiler for utfall, holdover til en tidsterskel, andelen utfall og Tester: <a1>optical_atmosphere_identities.rs</a1>.

seg-00c76aeadb90 = <b>MODELLED</b> En valgfri tabell <c1/> (varighet, steg, seed) får typen <c2/> til også å skrive, per sted, én realisering med seed av den oppgitte stedsmodellen gjennom tid: skyepisoder (klare perioder eksponentielle, skyutfall log-normale Tester: <a1>optical_atmosphere_timeseries.rs</a1>.

seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagel-Valley Cn2 integrert langs en skrå bane for Rytov-variansen for plan- og kulebølger (opplenke og nedlenke), Andrews-Phillips' scintillasjonsind. Uavhengig referanse (ExternalDataset): tallene er sammenlignet med et uavhengig program (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } med { "30" } sifre, tanh-sinh-kvadratur på den opprinnelige høydevariabelen og Bessel-K-gamma-gamma-tettheter) som ikke deler kode med Kshana, under terskler fastsatt før noen implementasjon fantes (xval/optical-atmosphere/PREREGISTRATION.md). HVORFOR MODELLED: den referansen evaluerer de samme publiserte formlene, så den kontrollerer im

seg-4af9bc99ef29 = <b>MODELLED</b> Tilgjengeligheten til en optisk lenke mot en oppgitt lenkemargin fra et log-normalt klima for flytende vann i skyer (ITU-R P.840-mengde, ekstinksjon i geometrisk optikk) og . Uavhengig referanse (InternalConsistency): intern konsistens: lukkede grenser og monotonitet i diversitetsmodellen, den lukkede formen for skytaket og de log-normale identitetene for utfall. INGEN ekstern uavhengig referanse påstås, og ingen er sammenlignet: ingen målt tilgjengelighet for optiske bakkestasjoner eller registrering av skyfri sikt brukes. HVORFOR MODELLED: skyklimaet (sannsynlighet for sky, median og spredning av vannkolonnen, utfallsvarigheter),

seg-b3abf6cbeba4 = <b>MODELLED</b> Fordelingen av utfallsvarighet for et optisk sted koblet til den lukkede kystvariansen i klokkens holdover-modell: tids- og avstandsfeil ved oppgitte ut. Uavhengig referanse (InternalConsistency): intern konsistens med holdover-modulen, bit for bit; INGEN ekstern uavhengig referanse påstås. Klassens PSD-er er de syntetiserte langtids-gulvene (long-tau) som holdover-modulen allerede bærer, så tallene arver dens oppgitte forbehold om at holdover til en stram terskel styres av det antatte rødstøygulvet og ikke av det siterte Allan-avviket. Utfallsvarighetene er en log-normal modell med oppgitte parametere, ikke en målt c

seg-c4772a9e1a26 = MODELLED — optisk PNT gjennom atmosfæren: ekstinksjon i klar luft (Kims sikttelov + Rayleigh), skyens optiske dybde fra et oppgitt klima for flytende vann (P.840-mengde, ekstinksjon i geometrisk optikk), Hufnagel-Valley-turbulens med gamma-gamma-fading og aperturmiddelverdi, tilgjengelighet mot lenkemarginen, utfallsvarigheter koblet til klokkens holdover og avstandskorrelert stedsdiversitet. Tallene er kontroll (resultat <c1/>)

seg-32c6524b0baf = MODELLED optisk PNT gjennom atmosfæren: for en optisk lenke og et sett bakkesteder med oppgitt skyklima rapporterer den tapet i klar luft som avhenger av bølgelengde og elevasjon (Kims sikttelov pluss Rayleigh), turbulenstilstanden etter Hufnagel-Valley (Rytov-varians, scintillasjonsindeks, gamma-gamma-parametere, aperturmiddelverdi), den værdrevne tilgjengeligheten mot lenkemarginen (skyens optiske dybde fra (typekatalog (<c1/>))

seg-2c7493ee5042 = MODELLED: alle inndata for vær, teknikk og klokke, samt antakelsene om uavhengighet og copula; ingen målt tilgjengelighetsregistrering er sammenlignet. (typekatalog (<c1/>))

seg-b4402211e3fe = Optisk PNT gjennom atmosfæren: tre ILLUSTRATIVE bakkesteder (et skyrikere nordlig sted, et middels sentralt sted og et klarere sørlig sted) som ser en optisk LEO-terminal ved { "30" } graders elevasjon ved { "1550" } nm. Skyklimaene er oppgitte inndata, ikke målinger eller verdier fra noe datasett, så all tilgjengelighet nedenfor er MODELLED. Kjøringen rapporterer per sted tapet i klar luft, turbulenstilstanden etter Hufnagel-Valley, t (kommentar i scenariofilen, linje { "1" } til { "8" })

seg-384f5c73cdf9 = Én realisering med seed av hvert steds lenke gjennom tid (MODELLED; et trekk fra modellen ovenfor, ikke klimaet). Uten denne skrives ingen serie, og resultatet er dokumentet fra { "0.37" }. (kommentar i scenariofilen, linje { "78" } til { "79" })

seg-c75fa5787bd4 = Numerikk for atmosfæren langs optisk skrå bane: Rytov-varians, scintillasjon, sannsynlighet for gamma-gamma-fading, aperturmiddelverdi, optisk dybde for sky og klar luft er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e5013bdf86bb = Værdrevet tilgjengelighet for optiske bakkesteder og avstandskorrelert stedsdiversitet er MODELLED, ikke validert: kontrollert mot sin egen lukkede eller analytiske identitet, som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-dc1132147318 = Temaside: <a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>Forrige</s1>oem-interop

seg-ef0a779c300c = <s1>Neste</s1>orbit
