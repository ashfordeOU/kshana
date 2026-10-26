# docs--integrity: translations (da)

seg-668241606715 = Kilde: <c1/>

seg-9a8c218ce054 = Integritet og sikkerhed: hvad Kshana modellerer, og hvad den ikke gør

seg-52038c93765d = Kshana rapporterer to kvalitetsmål (FoM'er, figures of merit) — <b>Integritet</b> og <b>Sikkerhed</b> — som let forveksles med de størrelser af samme navn, der bruges i luftfarten. Denne side siger klart, hvad de er i dag, hvad de <em>ikke</em> er, og hvad køreplanen tilføjer. Hvis du vurderer Kshana til en sammenhæng, hvor menneskeliv står på spil, eller hvor der kræves certificering, så læs dette først.

seg-fb6e93a107e7 = I dag ({ "v0.37.0" })

seg-ecd20ae1a05d = Integritets-FoM — filterets selvkonsistens

seg-153391e55508 = Integritets-FoM'en er andelen af udfaldsprøver, hvis sande tidsfejl bliver inden for Kalman-filterets egen k-sigma-beskyttelsesgrænse:

seg-ac2413a97a7b = Den måler, om filterets <em>selvrapporterede</em> usikkerhed er ærlig om filterets <em>egen</em> fejl under et udfald af GNSS (globalt navigationssatellitsystem). Det er et nyttigt internt konsistenstjek.

seg-c9f80760ea53 = Den er <b>ikke</b>:

seg-8899525ad177 = et <b>horisontalt/vertikalt beskyttelsesniveau (HPL/VPL)</b> — der findes slet intet beskyttelsesniveau i positionsdomænet (urpakkerne er i tidsdomænet);

seg-dd9a3e58e10b = en <b>integritetsrisiko / sandsynlighed for farligt vildledende information (P_HMI)</b>;

seg-31fa92b3271d = en sammenligning med en <b>alarmgrænse</b>;

seg-ee998b974e6f = i overensstemmelse med <b>RTCA DO-229E / DO-316</b> eller <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) eller nogen anden certificeringsstandard.

seg-f84a56b6fe10 = Sikkerheds-FoM — analytisk grænse for spoof-detekterbarhed

seg-e532288ed262 = Sikkerheds-FoM'en er en <b>grænse for spoof-detekterbarhed, baseret på urets stabilitet</b>: ud fra et urs støj (hvid frekvensstøj og random walk-PSD'er (effektspektraltætheder)) og et overvågningsvindue er den den analytiske detektionsmargen for en konsistensovervågning af ét enkelt ur over for en langsomt rampende spoofing med falsk tid. Et mere støjsvagt ur (f.eks. et optisk ur) opdager en mindre, langsommere spoofing end et mere støjende (f.eks. et CSAC (chip-scale atomur)) — netop den kontrast er demonstratorens pointe.

seg-fc718a805b28 = Den er <b>ikke</b> en RAIM-detektor (receiver autonomous integrity monitoring) med flere satellitter. Der er ingen pseudorange-residualer på tværs af satellitter, intet beskyttelsesniveau og ingen P_HMI. Innovation-mod-sigma-testen har samme matematiske form som klassisk RAIM-fejldetektion (Brown), men tallet er en analytisk grænse for et givet ur og ikke en RAIM-implementering, og det er kun meningsfuldt i forbindelse med et konfigureret spoofing-scenarie (se scenarietypen <c1/>, som indsprøjter et egentligt rampende angreb).

seg-ae770e25031e = Outputtet siger det selv. Typerne <c1/>, <c2/>, <c3/> og <c4/> konfigurerer intet angreb, så deres enlinjes oversigt skriver <c5/> i stedet for et tal, og deres resultatdokument markerer <c6/> som <c7/> med begrundelsen i blokken <c8/>. Selve værdien bliver i dokumentet til dem, der vil have grænsen.

seg-960bd91a2b3a = Ægte snapshot-, solution-separation- og ARAIM-RAIM (<c1/>)

seg-3d31ec251ac0 = En ægte RAIM i positionsdomænet er implementeret i <c1/>, adskilt fra selvkonsistens-FoM'en ovenfor:

seg-0e8240812c16 = <b>Overvågning af residualer fra flere satellitter</b> — den opbygger geometrimatrixen for sigtelinjerne til de synlige satellitter, danner mindste kvadraters løsning for position og ur og tester summen af de kvadrerede residualer.

seg-69f1535596e0 = <b>χ²-fejldetektion</b> — <c1/> (SSE: summen af kvadrerede residualer) er χ²(n−{ "4" }) under hypotesen om ingen fejl; en fejl erklæres over <c2/>. χ²-tærsklerne kommer fra en afhængighedsfri evaluering af den regulariserede ufuldstændige gammafunktion (eksakt, uden tabeller).

seg-6721779048f5 = <b>Hældningsbaseret HPL / VPL</b> — <c1/>, hvor <c2/> er positionsfejlens følsomhed pr. satellit ud fra hat-matricen, og <c3/> er den ikke-centrale χ²-bias, der opfylder den konfigurerede sandsynlighed for manglende detektion <c4/>.

seg-8dd60e98088d = <b>Solution-separation-RAIM (MHSS: multiple-hypothesis solution separation)</b> — for løsningen med alle synlige satellitter og for hver delløsning, hvor én satellit er udeladt, både <b>detekterer og identificerer</b> separationen <c1/> mellem de indlejrede estimatorer den fejlramte satellit og indgår i grænsen for beskyttelsesniveauet.

seg-719e27fdd2c1 = <b>Budget for integritetsrisiko (P_HMI) i ARAIM (advanced receiver autonomous integrity monitoring)</b> — <c1/> løser det mindste HPL/VPL, hvis samlede sandsynlighed for farligt vildledende information <c2/> (Blanch et al., <em>Baseline ARAIM</em>) opfylder en eksplicit tildeling af integritetsrisiko, og rapporterer den risiko, niveauerne opnår — så integritet direkte kan afvejes mod alarmgrænsen i stedet for at ligge implicit i en fast <c3/>-multiplikator.

seg-2f99acf45203 = <b>Stanford–ESA-integritetsdiagram</b> (ESA: European Space Agency) — en akkumulator pr. epoke klassificerer <c1/> i områderne Tilgængelig / Systemet utilgængeligt / Vildledende / Farligt vildledende til en tilgængelighedsoversigt.

seg-33d01969fb0f = <b>Kan nås fra ende til anden</b> — scenarietypen <c1/> kører ovenstående over en SGP4- (Simplified General Perturbations { "4" }) eller Kepler-konstellation, eller en konstellation læst fra rigtige TLE'er (two-line element sets) eller en RINEX-navigationsfil (Receiver Independent Exchange Format), og udsender et tilgængelighedskort for HPL/VPL pr. epoke mod de konfigurerede alarmgrænser (<c2/>). Den samme kørsel <b>eksporterer et vertikalt Stanford-diagram</b>: i hver beskyttet epoke afbildes et reproducerbart, seedet træk af en fejlfri afstandsfejl gennem geometrien til en faktisk vertikal fejl og klassificeres mod VPL og den vertikale alarmgrænse, så JSON-resultatet (JavaScript Object Notation) og CLI-oversigten (kommandolinjegrænseflade) indeholder antallene i hvert område (integritetshændelser og HMI: hazardously misleading information) — ikke kun en tilgængelighedsandel. På den medfølgende <c3/> rapporterer kørslen { "344" } af { "361" } epoker tilgængelige ({ "95.3" } %) ved en horisontal alarmgrænse på { "40" } m og en vertikal på { "50" } m, med { "0" } integritetshændelser og { "0" } HMI.

seg-54e778eceef4 = <b>ARAIM med to konstellationer og en integritetsstøttemeddelelse</b> — <c1/> tilføjer den <b>fejltilstand, der rammer hele konstellationen</b>: ud over hypoteserne om ingen fejl og om fejl på én satellit bidrager hver konstellation med én hypotese, der fjerner alle dens satellitter, med apriorisandsynligheden <c2/>, til den samme MHSS-sum af integritetsrisiko. <c3/> (ISM) bærer brugerens afstandsnøjagtighed for integritet (<c4/>), nøjagtighedens kvadratiske middelværdi (<c5/>), den maksimale nominelle bias <c6/>, der indgår ensidigt i hver tilstand, og apriorisandsynlighederne <c7/> og <c8/>; dens referencesæt fra WG-C (Working Group C i samarbejdet mellem Den Europæiske Union og USA om satellitnavigation, hvis tekniske undergruppe for ARAIM udgiver referencen) er σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } og P_const = { "1e-4" }. <c9/> gengiver resultatet af enkeltfejl-<c10/> bit for bit. Typen <c11/> tager denne vej med <c12/> (<c13/>: GPS + Galileo, { "48" } satellitter, { "145" } af { "145" } epoker tilgængelige ved de samme alarmgrænser).

seg-1f06bc1976bd = <b>Beskyttelsesniveauer mod publicerede referencevektorer</b> — typen <c1/> kører motorens <c2/> og <c3/> på ARAIM-undergruppen under WG-C's egne gennemregnede eksempler (Reference Airborne Algorithm Description Document v3.1, { "2019" }, bilag D, og Milestone { "3" } Report, { "2016" }, annex A). Den største forskel i vertikalt/horisontalt beskyttelsesniveau på acceptvektoren er { "0.0437" } m mod dokumenternes egen tolerance på { "0.05" } m. Denne række er VALIDATED i <a1><c4/></a1>: den kontrollerer ligningen for beskyttelsesniveauet, ikke en operationel ISM eller en modtager.

seg-1dda7b318c5f = Det, der mangler (køreplan)

seg-e27215296e1a = Hvad <c1/> endnu <b>ikke</b> gør:

seg-964c0634eae0 = den er <b>ikke indarbejdet i FoM'en for ur-/holdover-scenarier</b> — de pakker rapporterer stadig filterets selvkonsistens-integritetstal ovenfor, ikke et HPL/VPL;

seg-eecf2f9f181e = fejlhypoteserne er den fejlfri situation, <b>enkelte satellitter</b> og <b>hele konstellationer</b> — samtidige fejl på <b>delmængder af to eller flere satellitter (SV: space vehicle, altså en satellit)</b> er ikke modelleret;

seg-fd0f9fb2de83 = ISM er et konfigurerbart parametersæt (med referenceværdierne fra WG-C), ikke en udsendt operationel meddelelse eller en valideret trusselsmodel;

seg-88f5242b0809 = <b>fejldetektion og -udelukkelse (FDE)</b> er kun for enkelte satellitter og kun for snapshots: solution separation udpeger den fejlramte satellit, og <c1/> løser på ny hver udeladelse af én satellit og returnerer den udeladte satellit sammen med χ²-testen og beskyttelsesniveauerne for den resterende delmængde, men der rapporteres ingen position beskyttet mod udelukkelse, og scenarietypen <c2/> kører ikke udelukkelsestrinnet.

seg-c85aa5dedc86 = Kernerne for snapshot, solution separation og ARAIM afprøves på <b>rigtig geometri fra IGS (International GNSS Service) med præcise baner (SP3: Standard Product { "3" })</b>, ikke kun på syntetiske konstellationer: <c1/> danner sigtelinjegeometrien ud fra første epoke i et ægte IGS SP3-produkt ved en rigtig jordstation og kontrollerer, at beskyttelsesniveauerne er endelige og inden for alarmgrænserne for APV-I (approach with vertical guidance) på { "40" } m horisontalt og { "50" } m vertikalt, at en pseudorange-bias på { "60" } m udløser χ²-overvågningen, at solution separation <b>identificerer</b> den fejlramte satellit, og at ARAIM's niveauer opfylder den tildelte <c2/>. <c3/> kører vejen med to konstellationer på de rigtige Celestrak-kataloger for GPS og Galileo fra 2026-06-07, propageret til én fælles epoke (se <a1><c4/></a1> §{ "3" }). En dybere krydskontrol — sammenligning af beskyttelsesniveauer epoke for epoke med gLAB (GNSS-Lab Tool, en suite til GNSS-databehandling, der distribueres af ESA) over en hel RINEX-observationsbue — ville tilføje paritet i modtagerdomænet. Den er ikke udført: typen <c5/> beregner en kode-enkeltpunktsposition ud fra rigtige RINEX-observationer, men intet beskyttelsesniveau fra den løsning er sammenlignet med gLAB's.

seg-f5fac2e836a6 = <c1/> er altså en ægte kerne for beskyttelsesniveau og integritetsrisiko, der kan nås fra scenarietyperne <c2/> og <c3/>, er afprøvet på rigtig referencebanegeometri og kontrolleret mod referencevektorerne fra WG-C. Fejl på delmængder af flere satellitter, paritet med gLAB i modtagerdomænet og integration i ur-FoM'en er fortsat punkter på køreplanen, og intet af dette er certificeringsevidens.

seg-487f24ed92d8 = <a1><c1/></a1> — definitioner på én linje af hver FoM og forkortelse.

seg-7d3c12cf802e = <a1><c1/></a1> — ISM-parametrene og referencevektorerne fra WG-C.

seg-04532ba5288f = <a1><c1/></a1> — tidsbeskyttelsesniveauet (TPL) for et ur i coasting, som er betinget af detektion.

seg-43cea496da93 = <a1><c1/></a1> — hvilke størrelser der er valideret mod en reference, og hvilke der er selvkonsistenstjek.

seg-3037dde8135f = <c1/> — udledningen af grænsen for spoof-detekterbarhed.

seg-04d63778ca7f = RAIM ved siden af kvalitetsmålene for urets holdover ({ "0.36" }, til tilvalg)

seg-744e95749978 = Et urscenarie kan have en sektion <c1/> (<c2/>): et sted (<c3/>, <c4/>, <c5/>), forudindstillinger for konstellationer (<c6/>, standard <c7/>), en maske, en sigma for afstandsresidualer, sandsynlighederne for falsk alarm og manglende detektion, de horisontale og vertikale alarmgrænser, en epokeafstand og en valgfri angivet bias på én satellit. Kørslen rapporterer så en separat blok <c8/>: pr. epoke de synlige satellitter, beskyttelsesniveauerne fra snapshot-RAIM og en dom (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>) samt antal og tilgængelighed over kørslen. Så længe tidslinjen siger, at GNSS er nægtet, er RAIM utilgængelig, og intet ekstrapoleres; et forringet vindue evalueres som nominelt. Kvalitetsmålene for holdover er uændrede, og uden sektionen er outputtet byte-identisk. MODELLED: en repræsentativ forudindstillet himmel, syntetiske residualer og angivne grænser. Den kræver <c14/>.

seg-139639263c90 = Gengivelsen af maksimal URA i EU-US WG-C ARAIM Milestone { "3" } (CAP-05c)

seg-97906754d4c8 = En tidligere plan lovede en sammenligning med "Table A-3" i en teknisk note om EU-ARAIM. Der kunne ikke findes nogen offentlig kilde til den tabel (de offentlige rapporter Milestone { "1" } til { "3" } fra ARAIM's tekniske undergruppe under EU-US Working Group C har ingen Table A-3), så den sammenligning er <b>trukket tilbage</b>, og intet lovnes under det navn.

seg-b61607c477f2 = I stedet forsøges den rapport, der er offentlig: <b>Milestone { "3" } Report</b> ({ "25" } februar { "2016" }, kopi fra GPS.gov, SHA-256 <c1/>), Tables { "5" }, { "6" } og { "7" }, som for hver konstellationskonfiguration og for både RNP { "0.1" } og RNP { "0.3" } angiver den største <c2/>, for hvilken { "90" } % af brugerne har { "99.5" } % tilgængelighed. Tolv trykte poster (rækkerne Depleted og Baseline i tabellerne for dobbelt frekvens) kontrolleres under tærskler, der er præregistreret i <a1><c3/></a1> før nogen bedømt kørsel, med de afvigelser, der ikke kan fjernes, anført dér: ingen almanakfiler, Walker-skaller i stedet for de rigtige pladser, et grovere gitter og trin, og motorens horisontale vej fra ADD v4.2 i stedet for rapportens egen tekst. Tables { "8" } til { "13" } (enkelt frekvens) og rækkerne Optimistic forsøges ikke, med begrundelserne anført dér. <b>Resultat: { "8" } af { "12" } poster gengivet, { "4" } NOT MET (fastholdt):</b> posterne for to konstellationer og alle poster kun for Galileo stemmer (også rækkerne med N/A), posten Depleted RNP { "0.1" } for to konstellationer når dækning { "0.847" } ved { "9" } m mod de trykte { "9" } m (kræver { "0.90" }), og tre poster kun for GPS rammer langt ved siden af (dækning { "0.70" } ved { "4" } m, { "0.58" } ved { "6" } m, { "0.65" } ved { "10" } m mod trykte { "4" } m, { "6" } m og ">{ "10" } m"). Misserne for kun GPS kan skyldes den ensartede Walker-skal, der står i stedet for de rigtige GPS-pladser (D1); det er en hypotese, ikke et fund. Resultatet forbliver MODELLED, uanset hvad det er. Undersøgelsen er <c4/>; dens målte dækninger står i <c5/> og bedømmes af <c6/>. Selve rapporten er citeret, ikke medleveret.

seg-0e98826cedcc = <s1>Forrige</s1>Hardwaresikkerhed

seg-e6f1e38977b7 = <s1>Næste</s1>Spektrum og waterfall

seg-38ab3bb65327 = Ægte snapshot-, solution-separation- og ARAIM-RAIM (src/raim.rs)
