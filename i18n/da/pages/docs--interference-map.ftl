# docs--interference-map: translations (da)

seg-6555ff9a6d8e = Output

seg-2247a2344710 = Betydning

seg-c3c260b7063e = Tests

seg-d4a762001549 = Licens

seg-e7b6d071246e = Kilde: <c1/>

seg-143c73287d6c = <c1/> bygger et billede pr. dag af, hvor luftfartøjer og skibe rapporterede forringede navigationsdata, ud fra åbent licenserede sporingsfiler, som du leverer. <c2/> fortæller derefter, hvor stor en del af en planlagt rute der lå inde i de berørte celler hver dag.

seg-158f33f95ec3 = Hvad dette er: en beskrivelse af, hvordan publicerede positionsrapporter så ud på tidligere dage. Hvad det ikke er: en måling af nogen modtager, en prognose eller bevis for interferens. En forringet eller afvigende celle har flere mulige årsager (anført nedenfor), og en celle uden post blev blot ikke observeret.

seg-64d3ee269407 = Alt kører på lokale filer. Standardkommandoerne åbner aldrig en netforbindelse; den ene valgfri downloadhjælper kræver et eksplicit flag.

seg-e251b385ff46 = To syntetiske dage med interferenskort, tegnet ud fra de indcheckede eksempler i examples/interference-map/output, hver med sin egen syntetiske rute og de andele af ruteeksponering, som motoren rapporterer. Til venstre en ADS-B-dag: { "1" } forringet celle, { "6" } ikke forringede, { "4" } uvurderede (skraverede) og celler uden post, tegnet tomme, som ikke blev observeret. Ruten er { "525" } km: { "11.5" }% af dens længde i forringede celler, { "38.3" }% ikke forringet, { "9.1" }% uvurderet og { "41.1" }% ikke observeret. Til højre en AIS-dag: celler markeret af cirkel- og landdetektorerne, ikke-afvigende celler og tomme celler; ruten er { "454" } km med { "10.5" }% i afvigende celler, { "21.2" }% ikke afvigende, { "0.0" }% uvurderet og { "68.3" }% ikke observeret. ADS-B og AIS er separate lag, aldrig kombineret. En markeret celle er ikke et fund af interferens, og en celle uden farve blev ikke observeret, hvilket ikke er det samme som fri. Alle data er opdigtede, i det åbne Atlanterhav, og ikke en måling.

seg-765f43228dc6 = Begge dage er de syntetiske eksempler i <c1/>, hver med en syntetisk rute i <c2/>; andelene for ruteeksponering er det, <c3/> udskriver for dem. Intet i dem er et rigtigt sted, luftfartøj eller skib.

seg-228f39c0305b = Data og licenser

seg-d3336cc18ff7 = Kun de kilder, der er gennemgået i <a1><c1/></a1>, er indbygget og vælges med <c2/>:

seg-b03d56f501c3 = Type

seg-2328672e782f = Licensfelt i outputtet

seg-2319c7a6f6e2 = ODbL { "1.0" }

seg-7464d3c830f3 = AIS

seg-c13f76567536 = Amerikansk public domain (CC0 { "1.0" } ifølge udgiveren)

seg-636c2bb6f29d = public domain

seg-f6f4e431d36d = NLOD { "2.0" }

seg-5621e3a3908f = begge

seg-6b3a1f8ca649 = hvad du angiver

seg-be349e2c455f = <c1/>, <c2/>, <c3/> påkrævet

seg-590344d1eae5 = Hver outputfil indlejrer licensen, licens-URL'en, den krævede kildeangivelse og kildens dækningsbegrænsninger. Der er ingen indbygget post for kilder, hvis vilkår forbyder kommerciel brug eller videredistribution af afledte kort.

seg-2d8eaefab0f8 = <b>ODbL og Kshanas udgaver.</b> En ADS-B-fil pr. celle, lavet af data fra adsb.lol, er en Derived Database og udgives under ODbL { "1.0" }; dens felt <c1/> siger det. Kshanas egen kode forbliver AGPL-3.0. Kommercielle udgaver af Kshana, der skriver sådanne filer, bærer den samme meddelelse, og enhver, der genpublicerer filen, skal beholde den. Resultater for ADS-B og AIS kombineres aldrig i én fil, så ODbL ikke knytter sig til AIS-laget.

seg-bb4932d5d15c = <b>Skævhed i dækningen.</b> Kort arver deres kildes dækning. adsb.lol følger frivillige modtagere, så åbent hav og tyndt dækkede regioner er sparsomme. Kystverkets åbne data udelader fiskerfartøjer under { "15" } m og fritidsfartøjer under { "45" } m, så dets kort afspejler større skibe. MarineCadastre dækker kun amerikanske farvande.

seg-713babc3963b = <b>Identifikatorer.</b> Inputrækker bærer en identifikator for luftfartøj eller skib. Den hashes i hukommelsen med et tilfældigt salt pr. kørsel, bruges kun til at tælle forskellige luftfartøjer eller skibe og skrives, logges eller udskrives aldrig. Outputtet er aggregeret: ingen identifikator optræder noget sted i det.

seg-fa3c70a8997a = <b>Undertrykkelse.</b> En celle med færre end <c1/> forskellige luftfartøjer eller skibe observeret den dag publiceres slet ikke, og for AIS rapporteres et antal markeringer på ét eller to i en publiceret celle som <c2/>. Ingen publiceret værdi kan udpege et enkelt luftfartøj eller skib.

seg-02dbfcb9c808 = Inputformater

seg-2f291f986a87 = Almindelig CSV med en overskriftsrække, kommasepareret, uden anførselstegn, UTC-tider. Rækkefølgen af kolonner er fri; ukendte kolonner ignoreres. Et tidsstempel er Unix-sekunder eller <c1/>. Rækker, der ikke kan fortolkes, tælles i outputtets metadata og tabes ikke i stilhed.

seg-571365be20a5 = ADS-B (<c1/>):

seg-aaeff8f42699 = Kolonne

seg-b10a51ed96c0 = Påkrævet

seg-357c2320b43a = ja

seg-14ac5d0f109b = rapporttidspunkt

seg-6dbe5595d0be = uigennemsigtig identifikator (hashes, gemmes aldrig)

seg-c5fb6b91dc68 = grader

seg-e283838c85aa = højde i fod; <c1/> eller tom udelukker rækken

seg-9ab90c35bd7d = mindst én

seg-868e5b9c00ab = heltal { "0" } til { "11" }; tom betyder ikke rapporteret

seg-db907db790b1 = nej

seg-5c2ce9f61700 = hvis til stede, bruges kun værdier, der begynder med <c1/> (MLAT, TIS-B og lignende udelukkes)

seg-412f40b8eeb1 = <b>Historik fra adsb.lol readsb, læst direkte.</b> De daglige arkiver er en opdelt tar af readsb-sporfiler. Udpak én, som udgiveren beskriver (sæt delene sammen, <c1/>), og giv så Kshana den udpakkede mappe, en enkelt fil <c2/> eller en CSV:

seg-6e7d378bd89b = En mappe gennemsøges rekursivt efter filer <c1/> (andre filer, såsom <c2/>, ignoreres, og symbolske links følges ikke). Hver fil er gzip-komprimeret eller almindelig JSON, registreret ud fra de første bytes, fordi readsb skriver gzip under et navn <c3/>; dekomprimering er begrænset til { "512" } MiB pr. fil. Fra hver sporpost læser Kshana tidsforskydningen, breddegrad, længdegrad, højde (markøren <c4/> udelukker posten), felterne <c5/> og <c6/> i luftfartøjets detaljeobjekt og strengen for positionskilden (poster fra alt andet end ADS-B udelukkes). En post uden detaljeobjekt har ingen nøjagtighedsfelter og tælles som udelukket. En fil, der ikke kan læses, tælles i <c7/> i outputtets metadata og springes over.

seg-b1502f7f4c98 = AIS (<c1/>):

seg-91395984ddac = grader; AIS' værdier for "ikke tilgængelig" og ({ "0" }, { "0" }) kasseres

seg-34ae94eb1797 = fart over grunden i knob; { "102.3" } (ikke tilgængelig) behandles som manglende

seg-a1e60af5adaa = Detektoren for position på land kræver en landpolygonfil (<c1/>): GeoJSON Polygon eller MultiPolygon. Natural Earths landlag i { "1" }:{ "10" } million (public domain) er den tiltænkte fil. Uden <c2/> er detektoren slået fra, og outputtet siger det. Sådan downloader du den (den eneste netadgang i denne funktion):

seg-cd55a09894c5 = Dette kører systemets <c1/> (som en argumentliste, ikke gennem en shell) over HTTPS, én gang, for én fil på en fast adresse, der nævner en enkelt commit i upstream-repositoriet. Downloaden beholdes kun, hvis dens SHA-256 er lig med den værdi, der er fastlåst i koden; ved uoverensstemmelse slettes den, og kommandoen fejler. Hvis <c2/> ikke er installeret, siger kommandoen det og giver adressen og kontrolsummen, så filen kan hentes i hånden. Intet er medleveret i repositoriet.

seg-95eeaa0033b3 = Én GeoJSON-fil pr. kilde pr. UTC-dag, i mappen <c1/>, med navnet <c2/>, hvor <c3/> er <c4/> eller <c5/>, <c6/> er nøglen <c7/> (<c8/>, <c9/>, <c10/> eller <c11/>), og datoen er UTC-dagen for rapporterne: <c12/>, <c13/>. Datasættet står i navnet, så to datasæt af samme type ikke kan dele en fil, og <b>Kshana overskriver aldrig en fil</b>: hvis et mål findes, fejler kommandoen, før den skriver noget. CLI'en udskriver én linje pr. fil, den skriver. En læser kan udlede de tre dele med <c14/>; den samme information står inde i filen (<c15/>, <c16/>, <c17/>). Syntetiske eksempelfiler, én pr. kilde, ligger i <c18/>, sammen med den kommando, der genskaber dem, til at bygge og teste en viser. Et medlem på øverste niveau, <c19/>, rummer skemanavn, dato, gitter, metode-id og alle parametre, tallene på dagsniveau, datalicensen og kildeangivelsen samt en meddelelse. Hvert feature er en cellepolygon med <c20/>, <c21/>, <c22/>, <c23/> og de aggregerede antal.

seg-1ee702004726 = Gitteret er fast: kvadratiske celler på <c1/> grader (standard { "0.5" }) i bredde og længde, indekseret fra (-90, -180). Bredden øst-vest skrumper med breddegraden: ca. { "55" } km ved ækvator og ca. { "28" } km ved { "60" } grader for standarden. Breddegrad { "90" } hører til den sidste række, og længdegrad { "180" } er den samme meridian som -180. <b>De præregistrerede metoder er defineret på gitteret med { "0.5" } grader.</b> En anden <c2/> kører, men er ikke den præregistrerede metode: CLI'en siger det, og filen registrerer <c3/> og <c4/> (false), så en viser også kan sige det.

seg-6e1e8f2a9082 = <b>Tilbageholdte antal.</b> Hvert antal pr. celle under publiceringsminimum ({ "5" }) er <c1/>, nul medregnet, så <c2/> aldrig betyder "ingen", og intet publiceret tal kan udpege et enkelt luftfartøj eller skib. Felterne <c3/> og <c4/> angives stadig. I ADS-B-filer er <c5/> altid mindst { "5" } for en publiceret celle; <c6/> og <c7/> er <c8/> under { "5" }, og <c9/> er <c10/>, medmindre begge er mindst { "5" } (en andel ville afsløre et tilbageholdt antal). I AIS-filer er hver post i <c11/> <c12/> under { "5" }.

seg-fd929d6ee90b = Formatversion og felter

seg-ff443e9cbd20 = Formatet er fastlagt som <c1/>, <c2/>. En ændring, der fjerner eller omdøber et felt eller ændrer, hvad et felt betyder, hæver versionen; at tilføje et felt gør ikke, så en læser skal ignorere felter, den ikke kender. Et antal, der er <c3/>, er tilbageholdt, ikke nul.

seg-60818bfc3f90 = Værdier af <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> er true kun for <c10/> og <c11/>. Rapporten om ruteeksponering har sit eget skema <c12/>.

seg-ea526ebdd260 = Observatoriet: det daglige produkt

seg-e33f63fe5c0a = <c1/> omdanner én UTC-dag med ADS-B-rapporter til observatoriets tre filer (GeoJSON, PNG og en JSON med hændelsesrapport) og et hashmanifest, og <c2/> afspiller den dag igen under ændringer af de præregistrerede parametre, én ad gangen. Kommandoen håndhæver udgivelsesreglerne: mindst { "24" } t efter dagens slutning (<c3/> kan kun hæves), celler på { "0.5" } grader eller grovere, kun tre tilstande (<c4/>, <c5/>, <c6/>), ingen årsag tillagt og ingen data fra OpenSky. Metodenoten, filformaterne og begrænsningerne står i <a1><c7/></a1>. En regional kørsel (<c8/>) læser kun rapporterne fra boksen og siger det i filen.

seg-31ce42fc05dc = Specifikation af Studios kortside

seg-a9aca2e2d390 = Til Studios kortside, som indlæser en GeoJSON-fil, brugeren leverer (siden bygges i Studios kildekode, ikke i dette repositorium). Intet uploades: filen læses i browseren, og siden sender ingen forespørgsel til nogen datakilde.

seg-064ec5d4c91a = <b>Læsning af en fil.</b> Acceptér kun en fil, hvis <c1/> begynder med <c2/>, og <c3/> er et tal, siden understøtter; ellers skal siden sige, at filen ikke er et understøttet Kshana-interferenskort. Læs de felter, der er anført ovenfor; ignorer ukendte. En fil rummer én kilde og én dag. Flere filer kan indlæses.

seg-5be32f8cff46 = <b>Celler.</b> Tegn hvert features polygon. Farvelæg efter <c1/>, og sig altid, hvad hver farve betyder, i en signaturforklaring. Fire tilstande, hvoraf ingen må skjules eller slås sammen:

seg-b652b86e6b8e = Tilstand

seg-4a511b6a03e3 = Hvor den kommer fra

seg-f92da2236260 = Forringet (eller afvigende for AIS)

seg-591ebe8007cb = en høj andel af luftfartøjer rapporterede lav nøjagtighed, eller skibe viste afvigelser, den dag

seg-bd993c64b6e8 = <c1/> er true

seg-88d43eb1c14a = Fri

seg-af5f7989fd09 = observeret med nok luftfartøjer eller skibe og ikke markeret

seg-2bc810e02210 = <c1/> er <c2/> eller <c3/>

seg-d894eaa21369 = Uvurderet

seg-38c88ed94111 = observeret, men ikke nok udtagne luftfartøjer, dagen var forstyrret, eller dagens baggrund kunne ikke estimeres

seg-e358a8c7903f = <c1/> er <c2/>, <c3/> eller <c4/>

seg-013b7c903426 = Ikke observeret

seg-81bcffa57ec2 = for få luftfartøjer eller skibe, så cellen blev ikke publiceret

seg-6828d71822bd = intet feature for den celle

seg-753192a770ac = "Ikke observeret" er fraværet af et feature: tegn det neutralt (ingen udfyldning, eller en skravering), aldrig i farven for "fri". Brug et farveskema, der ikke alene bygger på rød mod grøn. Celledetaljer ved hover eller markering viser antallene i <c1/> som angivet, og hvert antal <c2/> som "tilbageholdt (færre end { "5" })", aldrig som nul. En viser bør også sige, når <c3/> er false, at filen bruger en cellestørrelse uden for den præregistrerede metode.

seg-e90fedf7ad89 = <b>Lag.</b> ADS-B og AIS er separate lag med deres egne til- og frakoblere, signaturforklaringer og licenslinjer. Slå dem aldrig sammen til ét farvefelt eller ét antal, tegn dem aldrig som én kombineret celle, og læg aldrig deres celler sammen. Forskellige dage er forskellige filer: vis én dag ad gangen, med en datovælger, i stedet for at lægge dage oven på hinanden.

seg-6d500d3c0baa = <b>Licens og kildeangivelse.</b> For hvert synligt lag vises på kortet og i enhver eksport eller skærmbillede teksten i <c1/> ordret, <c2/> med et link til <c3/> samt <c4/>. Hvis et ADS-B-lag vises, gælder dets ODbL-licens kun for det lag. Tilbyd ikke at eksportere en kombineret fil.

seg-6f786153ef8e = <b>Metode.</b> Tilbyd metode-id og parametre (<c1/>, <c2/>) og tallene for <c3/> i et detaljepanel, herunder <c4/> (sig klart, at ingen celle blev kaldt forringet på grund af dagens baggrund) og <c5/>.

seg-905348837439 = <b>Forbehold, der skal bevares</b> (vis filens egne <c1/> og <c2/>, og hold denne formulering eller en tilsvarende synlig sammen med kortet):

seg-1f70e308010a = En forringet eller afvigende celle er ikke et fund af interferens. Der findes andre årsager.

seg-7cde0ddadb73 = En celle uden farve blev ikke observeret. Det er ikke belæg for, at området var frit.

seg-1135dfeadb8f = Dette er en beskrivelse af tidligere positionsrapporter, ikke en prognose og ikke en måling af nogen modtager.

seg-3ad1216bf3ed = Dækningen følger datakilden; læs noterne om dækning.

seg-046f6af48349 = Siden må ikke nævne eller vise noget enkelt luftfartøj eller skib, og filerne indeholder ingen.

seg-ae79b67c3b98 = <b>Ruteeksponering.</b> Hvis siden også indlæser en rapport <c1/>, vis dens rækker pr. dag og kilde med de fire andele (forringet, fri, uvurderet, ikke observeret) sammen, aldrig kun den forringede andel, samt rapportens <c2/> og hver rækkes <c3/> og <c4/>.

seg-98131acf49d8 = ADS-B-metode (<c1/>)

seg-83b660b0bfa6 = Hver ADS-B-rapport fra et luftfartøj i luften bærer to selvvurderede felter for navigationskvalitet: NIC (positionens indeslutningsradius) og NACp (nøjagtighedsgrænsen på { "95" }%, EPU). Når modtageren om bord mister eller mistror sin satellitposition, falder begge, hvorfor de bærer en signatur af interferens. De falder også af andre grunde.

seg-4b9020a68db6 = <b>Præregistrerede parametre</b> (konstanter i koden, skrevet ind i hver fil; en ændring betyder en ny metodeversion):

seg-e73ea9921fcf = Parameter

seg-8650fa804f14 = Højdegrænse

seg-25056ee5a36c = barometrisk højde på mindst { "5000" } ft

seg-17322eff480a = Rapport med lav nøjagtighed

seg-48ab6ed5eedd = NACp højst { "6" } (den rapporterede EPU-grænse er { "556" } m, { "0.3" } NM, eller større, eller ukendt) eller NIC højst { "5" } (den rapporterede grænse for indeslutningsradius er { "1852" } m, { "1" } NM, eller større, eller ukendt)

seg-84beb488319d = God rapport

seg-2595055d9593 = NACp mindst { "8" } og NIC mindst { "7" }; bedømt på de felter, inputtet har (begge, når begge er til stede, ellers det ene, der er til stede)

seg-b4bbce695b2d = Baseline for udstyr

seg-4986ed51f600 = et luftfartøj tæller kun i en celle med mindst { "5" } gode rapporter uden for den celle samme dag

seg-42859d1d785b = Luftfartøjer udtaget i en celle

seg-1ae26d6d99a9 = mindst { "3" } rapporter i cellen

seg-48bba15e2e0e = Luftfartøjer berørt i en celle

seg-1fe9c3ab930c = mindst { "50" }% af dets rapporter i cellen har lav nøjagtighed

seg-b147473d133c = Minimumsstikprøve

seg-33060cda8536 = mindst { "10" } udtagne luftfartøjer

seg-009ca23b9cd6 = Forringet

seg-afef85ae2a25 = mindst { "5" } berørte luftfartøjer, en andel af berørte blandt udtagne luftfartøjer på mindst { "0.30" } og mindst { "0.15" } over dagens median for cellernes andel

seg-890dcc56fa5c = Forstyrret dag

seg-b27768e64d62 = median for cellernes andel (over mindst { "5" } celler med fuld stikprøve) mindst { "0.15" }: ingen celle erklæres forringet

seg-18fbf3c348c9 = Ingen baggrund

seg-534111e0c6ad = færre end { "5" } celler med fuld stikprøve, så medianen kan ikke estimeres: en celle, der opfylder tærsklerne, er <c1/>, ikke forringet

seg-b571f127c595 = Publiceringsminimum

seg-60621ffc5bcf = mindst { "5" } forskellige luftfartøjer observeret

seg-f36389caf81b = Disse værdier blev fastsat ud fra definitionerne af kodene NIC og NACp og ud fra privatlivsreglen, før nogen data blev set. De blev ikke indstillet på rigtige data, og testene bruger kun syntetiske data. Cellestatusser: <c1/>, <c2/>, <c3/> (publiceret, men færre end { "10" } udtagne luftfartøjer), <c4/> og <c5/>.

seg-c89afc07989b = <b>Version { "2" }.</b> Version { "1" } erklærede en celle forringet fra så få som { "3" } berørte luftfartøjer, færre end publiceringsminimum på 5 luftfartøjer, og sprang tjekket af dagens baggrund over uden at sige det, når færre end { "5" } celler var fuldt udtaget. Version { "2" } kræver mindst { "5" } berørte luftfartøjer og tilbageholder vurderingen (<c1/>), når baggrunden ikke kan estimeres. Begge ændringer strammer metoden (intet, der ikke var forringet i version { "1" }, er forringet i version { "2" }); begrundelsen er, at en publiceret vurdering aldrig må hvile på færre luftfartøjer end det antal, under hvilket antal tilbageholdes. Filer i version { "1" } blev ikke udgivet.

seg-ffd0e5175548 = Hvorfor nøjagtighedsfelter falder af andre grunde end interferens, og værnet mod hver af dem:

seg-12b613a77f64 = Årsag

seg-e30479c3e5d8 = Værn

seg-ecac3d226210 = Ældre transpondere, der aldrig rapporterer NIC eller NACp eller rapporterer dem med en fast lav værdi

seg-8b504b60fcc0 = baseline for udstyr: et luftfartøj uden gode rapporter andre steder den dag tælles ikke

seg-1df45f128708 = Lav højde og operationer på jorden (terrænafskærmning, andre positionsformater)

seg-cc5f23f0da05 = højdegrænse; rækker markeret <c1/> udelukkes

seg-ddf6aeb47dbe = MLAT eller andre positioner, der ikke er fra GNSS

seg-51162a1835d1 = filter <c1/>, når kolonnen er til stede

seg-08196503a657 = Ét luftfartøj, der sender mange rapporter

seg-bf13dfa85dbe = der tælles forskellige luftfartøjer, ikke rapporter

seg-bbcb809624bc = Et udfald i en konstellation eller augmentation eller en rumvejrshændelse, der sænker nøjagtigheden over et stort område

seg-5f428bb7ad4a = cellen skal overstige dagens median for cellernes andel med en margin, og en dag, hvis median selv er høj, markeres som forstyrret og erklærer ingen celle

seg-30290253a95d = En fejl i ét luftfartøjs udstyr

seg-b673195405ff = kræver en andel af mange forskellige luftfartøjer med en minimumsstikprøve

seg-aeebeded71be = Få luftfartøjer i cellen

seg-c33c60b49b17 = minimumsstikprøve; under { "5" } observerede publiceres cellen ikke

seg-dc8abb9b411f = Hvad der er tilbage: metoden kan ikke skelne interferens fra en regional årsag, der er lokal frem for udbredt (en lokal effekt af satellitgeometri eller et udfald i et jordbaseret augmentationssystem ville se ens ud), og den er konservativ i én retning: et luftfartøj, der hele dagen kun flyver inde i en berørt region, har ingen baseline og tælles ikke, så vedvarende store områder underrapporteres.

seg-41d725eeaba9 = AIS-metode (<c1/>)

seg-7fd53079dccf = Pr. skib pr. dag, fem detektorer. En detektor <b>kvalificerer</b> i en celle, når den markerer mindst { "5" } forskellige skibe, som udgør mindst { "20" }% af de skibe, der er observeret dér; cellen er <c1/>, hvis en detektor kvalificerer.

seg-6d599353e8e1 = Detektor

seg-551f38a9061c = Regel (præregistreret)

seg-295e8a28a5b9 = mindst { "3" } rapporter i cellen mere end { "2000" } m inde i landet fra den leverede kystlinje

seg-fd21160e6685 = et vindue på { "20" } på hinanden følgende rapporter (skridt { "10" }, huller højst { "30" } min), hvis gennemsnitlige radius fra tyngdepunktet er { "500" } m til { "20" } km, radiussens variationskoefficient højst { "0.15" }, én bevægelsesretning med en samlet drejning på mindst { "270" } grader (trin højst { "90" } grader, netto mindst { "80" }% af totalen) og en gennemsnitsfart på mindst { "2" } kn

seg-1aa30db06794 = mindst { "2" } spring, der ankommer i cellen: på hinanden følgende rapporter mindst { "1000" } m fra hinanden, højst { "1" } t fra hinanden, hvilket indebærer mere end { "70" } kn (den indebårne fart bruger mindst { "1" } s mellem rapporterne, så to rapporter med samme tidsstempel og positioner { "1" } km eller mere fra hinanden tæller som et spring)

seg-7f9b22254009 = mindst { "3" } rapporterede farter over { "70" } kn i cellen

seg-e0d0968e8751 = mindst { "5" } forskellige skibe, der rapporterer samme position (afrundet til { "1e-4" } grader, ca. { "11" } m) i samme vindue på 10 minutter

seg-1bf4c460672c = Celler med færre end { "5" } forskellige skibe publiceres ikke; hvert antal markeringer under { "5" }, nul medregnet, rapporteres som <c1/>.

seg-b2ea2ec6bad1 = <b>Version { "2" }.</b> Version { "1" } lod en detektor kvalificere fra { "3" } markerede skibe og publicerede antal på { "3" } og { "4" }. Version { "2" } hæver minimum for markerede skibe til { "5" }, publiceringsminimum, så en vurdering <c1/> aldrig hviler på færre skibe end det antal, under hvilket antal tilbageholdes. Det strammer metoden, og ingen fil i version { "1" } blev udgivet.

seg-25593339aeb0 = <b>Kendte årsager til falske positive</b>, som andelsreglen og tærsklerne mindsker, men ikke fjerner: skibe i floder, kanaler og havne tæt på en grov kystlinje (bufferen på { "2" } km inde i landet findes af denne grund); to skibe, der deler én identifikator, hvilket ligner spring; transpondere med dårlig positionsbestemmelse eller testudstyr; og omkredsende lodsbåde og eftersøgningsfartøjer, som kan ligne cirkler. En kystlinjefil i { "1" }:{ "10" } million er nøjagtig til ca. en kilometer.

seg-ac661440a29a = Detektorerne for spring og fart sammenligner rapporter inden for én inputfil; et spor, der er delt over flere filer eller dage, sys ikke sammen.

seg-05f789b26904 = <b>Hukommelse.</b> Input læses linje for linje og holdes aldrig samlet. ADS-B beholder kun tællere pr. luftfartøj pr. celle. AIS beholder hver accepteret rapport i en kompakt post (ca. { "40" } bytes), indtil dens dag er evalueret, så hukommelsen vokser med antallet af AIS-rapporter i inputtet; del et meget stort AIS-input op efter dag.

seg-206c78a69ded = Ruteeksponering

seg-0d8832796ab7 = <c1/> er en GeoJSON LineString (ren, i et Feature eller i en FeatureCollection) eller en CSV med linjer <c2/>. <c3/> tager kortfiler eller mapper med dem og kan gentages. Waypoints forbindes med rette linjer i bredde og længde, så fortæt lange etaper; en etape tager den korte vej rundt i længde, så en, der krydser antimeridianen ({ "179.5" } Ø til { "179.5" } V), krydser den. Ruten deles i stykker på ca. { "250" } m. Hvert stykke måles mellem sine to egne endepunkter på en kugle med radius { "6371.0088" } km (den samme vej, som afgør, hvilken celle det ligger i) og tildeles den celle, der rummer dets midtpunkt.

seg-cc5e2553700b = Pr. dag og pr. kilde giver rapporten rutelængden og fire andele, der summerer til { "1" }: <c1/>, <c2/>, <c3/> (celle til stede, men uden vurdering) og <c4/> (celle fraværende på kortet). Læs de to sidste sammen med den første: en rute med en lav andel forringet og en høj andel ikke observeret er ikke vist at være fri. Rækker for ADS-B og AIS rapporteres hver for sig og kombineres aldrig. Hver række bærer kortets licens og kildeangivelse.

seg-3a087d90e317 = Biblioteksfunktioner

seg-67ea1ff00bb8 = Til kaldere, der har data i hukommelsen (bindinger, MCP-serveren, browserbuilden), udstiller modulet <c1/> de samme metoder med tekst eller bytes ind og JSON ud, uden at røre nogen fil og intet netværk:

seg-4dbf41c0ec3b = Funktion

seg-95f87a38a522 = Ind

seg-0fe8ff25f4a1 = Ud

seg-9e99af2c1f84 = ADS-B CSV-tekst

seg-e144f449c5b4 = ét byte-udsnit pr. readsb-sporfil (gzip eller almindelig)

seg-7effd7110c4c = AIS CSV-tekst, valgfri GeoJSON-tekst for land

seg-10c5e0c0a9c8 = rutetekst, GeoJSON-tekster for kort, valgfrie grænser <c1/>

seg-be00d23d96e9 = <c1/> JSON

seg-20a842d675c2 = Et <c1/> har <c2/> (<c3/>), <c4/> og <c5/> (v1-dokumentet). <c6/> er <c7/> eller <c8/>; <c9/> er { "0.5" }. Fejl er <c10/>. Reglerne for datasæt (godkendte forudindstillinger, licenstekst påkrævet, typen skal passe) gælder nøjagtigt som på kommandolinjen.

seg-1195686de09b = Ekstern validering

seg-0de37085f544 = <c1/> sammenligner Kshana med uafhængige implementeringer på syntetiske input, med tolerancer præregistreret i <c2/>: betydningen af kodene NIC og NACp mod pyModeS' afkodning af syntetiske ADS-B-rammer, AIS' værdier for ikke tilgængelig mod pyais' afkodning af syntetiske AIVDM-sætninger, tildeling af gitterceller mod shapely, rutelængde pr. celletilstand mod shapely og GeographicLib samt maskering af land mod shapely og pyproj. Fixtures laves af <c3/>; CI behøver ikke Python. Dette validerer, hvordan koderne og feltværdierne læses, og geometrien. Det validerer ikke, at en markeret celle er interferens.

seg-56a3e955cbcc = Alle tests bruger syntetisk genererede data og intet netværk: enhedstests i <c1/> og <c2/> for kommandoerne fra ende til anden, herunder at ingen identifikator når et output, og at afvisninger ikke efterlader filer.

seg-212c43d1a41c = <s1>Forrige</s1>NMEA-træningsstrømme

seg-7f13ee5d254e = <s1>Næste</s1>Interferenskort: datakilder og licenser

seg-1fc1794d9388 = ADS-B-metode (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = AIS-metode (kshana-interference-map/ais/v2)

seg-e3949a1e6082 = Senderområde (<c1/>)

seg-34bdcfd66ded = I den repository-gren, disse dokumenter kommer fra; endnu ikke på GitHub

seg-4fc5a1dcc963 = <c1/> estimerer, <b>hvor en interferenskilde kan være</b>, ud fra de samme åbne ADS-B- eller AIS-rapporter: et område ved angivne konfidensniveauer, et tyngdepunkt med en usikkerhedsellipse og sessionerne i tid. Den returnerer aldrig et bart punkt. <b>MODELLED</b> (registerrække <c2/>): fysikken er lærebogens radiosigtlinje, områdernes troværdighed er betinget af modellen, og den eneste eksterne kontrol er Jammertest-sammenligningen, der er præregistreret i <s1><c3/></s1>. Offentliggørelse af senderområder i det offentlige observatorium er en særskilt beslutning for ejeren og er <b>slået fra</b>: observatoriet læser ikke dette modul, og en test fastholder det.

seg-194d573cb817 = Indstillinger: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> (AIS), <c6/> (fusionér en TDOA-positionsbestemmelse; se nedenfor). Enhver indstilling, der afviger fra den præregistrerede værdi, meddeles som "ikke den præregistrerede metode". Filer overskrives aldrig.

seg-5767c749117a = <b>Model.</b> Rapporter samles i <em>enheder</em> (ét fly eller skib i én 2-minutters bin), hver <em>berørt</em> (ADS-B: mindst halvdelen af dens rapporter har lav NIC eller NACp efter kortets egen regel; AIS: en usandsynlig fart eller et spring eller en position inde i landet fra kystlinjen) eller ikke. Et fly eller skib tæller kun med mindst { "5" } gode rapporter i inputtet (den samme beskyttelse af udstyrsbaseline som i kortet). Berørte enheder grupperes i <em>sessioner</em>: et hul på mere end { "30" } minutter deler i tid, og inden for en tidsklynge hører to enheder sammen, når én sender kunne være inden for rækkevidde af begge. For én session får hver kandidatposition på et gitter en sandsynlighed:

seg-0e3abeb21526 = <b>Sigtlinje.</b> Et fly i højden <c1/> og en senderantenne ved <c2/> ser hinanden ud til <c3/> km på en 4/3-jordradius. <c4/> er marginaliseret over { "2" } til { "100" } m ({ "8" } logaritmisk fordelte værdier).

seg-75f5afea310e = <b>Effekt.</b> Senderens effekt er ukendt, så en effektiv rækkevidde fra { "12" } km til { "426" } km (trin på { "1.25" }) eller "kun sigtlinje" begrænser rækkevidden, marginaliseret med lige vægt. Rækkeviddens kant er blød: en enhed tæller som inden for rækkevidde med en vægt, der falder lineært over { "15" }% af rækkevidden på hver side (mindst tre fjerdedele af en gittercelle), fordi terræn, antennemønster og vej ikke er kendt bedre end det.

seg-ff9cf5fc9fbe = <b>Berørt og uberørt.</b> Et fly eller skib er <em>modtageligt</em> med sandsynlighed { "0.6" } (modtagerudstyr, antenne og signalvej er forskellige), en enhed af et modtageligt inden for rækkevidde er berørt med sandsynlighed { "0.9" }, og enhver anden enhed er berørt med baggrundssandsynligheden { "0.03" } (andre årsager). Modtagelighed er en skjult egenskab ved flyet, summeret ud pr. fly, ligesom en vedvarende udstyrsfejl (sandsynlighed { "0.03" }: alle flyets enheder er berørt, uanset hvor det er), hvilket forhindrer en defekt transponder i at trække området med sig. Så et <b>berørt</b> fly trækker posterioren mod positioner, der når det, og et <b>uberørt fly med sigtlinje</b> skubber imod positioner, der ville have nået det, med højst ét flys vægt, uanset hvor mange rapporter det sendte, mens et uberørt fly uden sigtlinje intet siger.

seg-51e09cf3944c = <b>Uden terræn.</b> Terræn, ducting og diffraktion modelleres ikke (terræn kan kun fjerne sigtlinje).

seg-b966c198786a = <b>Temperering.</b> Log-sandsynligheden ganges med { "0.3" } (en potensposterior). Modellens evidens er mere afhængig og dens kanter mindre skarpe end den uafhængighed, som sandsynligheden antager, og på syntetiske data med de fejl rummede de utempererede områder den sande kilde langt under deres angivne rate; { "0.3" } blev valgt kun på syntetiske data (udledningen findes i <c1/>, afsnit { "8" }).

seg-4488bddfd8da = Posterioren giver <b>områder med højeste tæthed</b> ved de angivne niveauer (indlejrede; polygoner med huller, hvor det er nødvendigt), det posterior-vægtede <b>tyngdepunkt</b> og dets <b>momentellipse</b> (skaleret til { "95" }% under en gaussisk fordeling; polygonerne, ikke ellipsen, er de kalibrerede niveauer). Gitteret er groft (omkring { "5" } til { "10" } km) over hele domænet, og hver grov celle med masse deles { "4" } gange { "4" }. <b>Dækningsbias</b> håndteres ved at betinge på, hvor der findes rapporter: et område er bredt, hvor få fly var til stede, og en session, hvis { "95" }%-område fylder mere end { "80" }% af dens søgedomæne, rapporteres som <c1/> uden tyngdepunkt.

seg-2ee93e45c01e = <b>Sessioner og profil.</b> Hver offentliggjort session har start, slut, varighed, arealet af de 0,5-graders celler, der rummer en berørt enhed og mindst { "5" } forskellige fly eller skibe, antallet af forskellige berørte og observerede samt modbeviset (forskellige uberørte med sigtlinje til tyngdepunktet; tilbageholdt under { "5" }). En session med færre end <c1/> forskellige berørte fly eller skibe tilbageholdes og tælles. Profilen giver pr. UTC-time på dagen de forskellige berørte fly (<c2/> under { "5" }) og minutterne af sessionstid samt timer af sessionstid pr. UTC-dag.

seg-857aad210cde = Valgfri TDOA-fusion.

seg-fcfc554b4f3d = <c1/> tager <c2/> (mindst tre modtagere; <c3/> er modtager <c4/> minus modtager { "0" }). Positionen løses på Jordens overflade ved Gauss-Newton på <c5/>, dens kovarians er <c6/>, og den gaussiske fordeling ganges ind i posterioren. Cramer-Rao-grænsen er en nedre grænse på en model, ikke en målt nøjagtighed.

seg-55c1c9c80601 = <b>Output</b> (<c1/>): <c2/> (MultiPolygon-område pr. niveau og session, ellipsepolygonen, tyngdepunktet med sin ellipse), <c3/>, <c4/>, <c5/>. Hver indlejrer datasættets licens, licens-URL og kildeangivelse, metode-id'et <c6/>, hver parameter, antagelserne og begrænsningerne og bærer sin <b>evidensetiket</b> (niveau MODELLED, id'er på registerrækker; strimlen under figuren, <c7/>-linjer i tabellen, et medlem <c8/> i JSON). Maskinfiler er engelske uanset sprog; figurteksten og linjerne på kommandolinjen er lokaliseret. Et syntetisk eksempel findes i <c9/> (<c10/>).

seg-7f93e7987855 = <b>Privatliv og formulering.</b> Intet identifikationsmærke for fly eller skib optræder i noget output; ingen rapportposition tegnes; en session kræver mindst { "5" } forskellige fly eller skibe; antal under { "5" } er <c1/>. Formuleringen er neutral: "estimeret senderområde", "interferenskildeområde". Et område er ikke nogens position, er ikke en konstatering af årsagen og siger intet om, hvem eller hvad der står bag en kilde; den udvidede formuleringstest kontrollerer outputtet for ord om aktører, hensigt og konflikt.

seg-5298b30a7857 = <b>Begrænsninger.</b> Troværdigheden er betinget af modellen. På syntetiske data (en generator, der deler modellen, med rækkeviddekanter usikre med { "15" }% pr. fly, vedvarende udstyrsfejl, ukendt effekt og ukendt antennehøjde) rummede { "95" }%-området den sande kilde i { "0.99" } (flygeometri) og { "1.00" } (skibsgeometri) af sessionerne og { "50" }%-området i omkring { "0.77" }: niveauerne er konservative på grund af sandsynlighedseksponenten på { "0.3" }, og tyngdepunktsfejlen for en session har en median på { "23" } km (fly) og { "12" } km (skibe). Kalibreringen er kun kontrolleret på syntetiske data; Jammertest-sammenligningen blev præregistreret (<c1/>) og kørt én gang: NOT ASSESSABLE for begge kilder (<c2/>). Én kilde pr. session; flere tætte kilder ligner én. En regional årsag (et udfald af en konstellation, rumvejr) giver et område, der ikke er en kilde. ADS-B giver få rapporter uden for travlt luftrum, og kun omkring en fjerdedel af readsb-sporpunkterne bærer NIC og NACp, så tyndt dækkede områder giver brede eller ingen områder ({ "31" }% af skibsgeometriens sessioner var <c3/>).

seg-d8eb178ef226 = Senderområde (interference-map locate)
