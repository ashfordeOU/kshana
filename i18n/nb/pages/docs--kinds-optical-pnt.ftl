# docs--kinds-optical-pnt: translations (nb)

seg-b03d56f501c3 = Type

seg-e6839b50b560 = MODELLED heterogent optisk + RF PNT, felles kvalitetsmål (P5): setter sammen det toveis optiske linkbudsjettet på { "1550" } nm (fotonbegrenset toveis avstandsmåling med CRLB σ_τ/√N og diffraksjonsavtrykk λ/D·avstand), et RAIM-beskyttelsesnivå med løsningsseparasjon på tvers av modaliteter (posisjon OG tid) som fusjonerer den løse RF-løsningen og den tette optiske løsningen med ulike kovarianser, den optiske klarværstilgjengeligheten for N stasjoner (uavhengig union { "1" }−Π({ "1" }−a_i) og en romlig korrelert variant), en overlevering av tilstand/kovarians optisk↔RF med en BEVIST bit-kontinuerlig (uten hopp) middelverdi og en NEES χ²-konsistensgrind, og en felles score for P(tilgjengelig OG presisjonsklasse OG integritetssikret) med korrelasjonshåndtering. VALIDATED lukket form: avstandsmåling med CRLB, diffraksjonsavtrykk, χ²-kvantil for beskyttelsesnivå, unionskombinatorikk, middelverdikontinuitet i overleveringen + NEES-grind og det felles uavhengige produktet. MODELLED: de optiske tapsfordelingene, RF-/optiske σ-størrelsene, klimatologiinndata for skyer, korrelasjonene og P_HMI-budsjettet. Ikke et sertifisert tilgjengelighets-/integritetsprodukt.

seg-5cea5229815e = Diagrammet motoren skriver for scenarios/hybrid-optical-rf.toml, typen hybrid-optical-rf

seg-a878d9be65b7 = MODELLED optisk PNT gjennom atmosfæren: for en optisk lenke og et sett bakkesteder med oppgitt skyklima rapporterer den tapet i klar luft som avhenger av bølgelengde og elevasjon (Kims sikttelov pluss Rayleigh), turbulenstilstanden etter Hufnagel-Valley (Rytov-varians, scintillasjonsindeks, gamma-gamma-parametere, aperturmiddelverdi), den værdrevne tilgjengeligheten mot lenkemarginen (skyens optiske dybde fra et log-normalt klima for flytende vann, ekstinksjon i geometrisk optikk, uavhengig turbulensfading), lenkemarginen som trengs for målrettede tilgjengeligheter, fordelingen av utfallsvarighet, veksten i tids- og avstandsfeil per utfall gjennom klokkens holdover-modell, avstandskorrelert tilgjengelighet med stedsdiversitet, og hva-hvis-gevinster for forbedringsteknikker (bølgelengde, mottaksapertur, reduksjon av scintillasjon med adaptiv optikk, ekstra margin). VALIDATED som implementasjon av de oppgitte formlene mot en uavhengig mpmath-referanse: Rytov-varians, scintillasjonsindeks, sannsynlighet for gamma-gamma-fading, aperturmiddelverdifaktor, optisk dybde for sky og klar luft. MODELLED: alle inndata for vær, teknikk og klokke, samt antakelsene om uavhengighet og copula; ingen målt tilgjengelighetsregistrering er sammenlignet. Veiledende analyse, ikke et sertifisert tilgjengelighets- eller navigasjonsprodukt.

seg-4e2b759aff17 = Diagrammet motoren skriver for scenarios/optical-atmosphere-network.toml, type optical-atmosphere

seg-4e31c8daf798 = Register

seg-963749981a7c = Kilde: <c1/>

seg-079c8b284c44 = Optisk PNT (scenariotypefamilie)

seg-6dea687b727b = { "2" } scenariotyper i motoren v{ $version }. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: README-ens Evidence-avsnitt).

seg-d019c8511f48 = Temasider: <a1>OPTICAL-ATMOSPHERE</a1>. Kjør én: <c1/>. Alle familier: <a2>KINDS.md</a2>.

seg-b8f937411028 = Kontaktark over diagrammene motoren skriver for typene i familien Optisk PNT

seg-76131e6805e5 = MODELLED optisk PNT gjennom atmosfæren: for en optisk lenke og et sett med bakkesteder med oppgitte skyklimaer rapporterer den det bølgelengde- og elevasjonsavhengige tapet i klar luft (Kim-sikt

seg-55725043f48e = MODELLED heterogen optisk + RF PNT, felles kvalitetsmål (P5): setter sammen lenkebudsjettet for toveis optisk lenke på { "1550" } nm (fotonbegrenset toveis avstandsmåling med CRLB σ_τ/√N og diffraksjonsfotavtrykk λ/D·avstand), a

seg-5e658f01d9f4 = HETEROGENEOUS (resultatetikett)

seg-750466e3188c = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-9e3ce423c0b9 = <b>Register:</b> MODELLED. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>optical-atmosphere</a1>.

seg-93f5d0527850 = Obligatoriske felt: ingen. Valgfrie: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

seg-6a6f8eea5767 = <b>Register:</b> ingen rad i matrisen nevner denne typen; motoren merker selv resultatet sitt. Fullstendig side, med inndata, resultater, evidens og begrensninger: <a1>hybrid-optical-rf</a1>.

seg-a4baaf1fbb8c = <s1>Forrige</s1>Oppdragsanalyse, lenker og romoperasjoner

seg-48792381ba0b = <s1>Neste</s1>Navigasjon for rombrukere
