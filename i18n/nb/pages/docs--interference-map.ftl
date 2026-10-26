# docs--interference-map: translations (nb)

seg-c3c260b7063e = Tester

seg-d4a762001549 = Lisens

seg-e7b6d071246e = Kilde: <c1/>

seg-143c73287d6c = <c1/> bygger et bilde per dag av hvor fly og skip rapporterte degraderte navigasjonsdata, fra åpent lisensierte sporingsfiler du selv oppgir. <c2/> forteller deretter hvor mye av en planlagt rute som lå innenfor de berørte cellene hver dag.

seg-158f33f95ec3 = Hva dette er: en beskrivelse av hvordan publiserte posisjonsrapporter så ut på tidligere dager. Hva det ikke er: en måling av noen mottaker, en prognose eller et bevis på interferens. En degradert eller avvikende celle har flere mulige årsaker (oppført nedenfor), og en celle uten oppføring ble rett og slett ikke observert.

seg-64d3ee269407 = Alt kjører på lokale filer. Standardkommandoene åpner aldri en nettverksforbindelse; den ene valgfrie nedlastingshjelperen krever et eksplisitt flagg.

seg-e251b385ff46 = To syntetiske dager i interferenskartet, tegnet fra de innsjekkede eksemplene i examples/interference-map/output, hver med sin egen syntetiske rute og eksponeringsandelene motoren rapporterer. Til venstre en ADS-B-dag: { "1" } degradert celle, { "6" } ikke degradert, { "4" } uvurdert (skravert) og celler uten oppføring, tegnet tomme, som ikke ble observert. Ruten er { "525" } km: { "11.5" } % av lengden i degraderte celler, { "38.3" } % ikke degradert, { "9.1" } % uvurdert og { "41.1" } % ikke observert. Til høyre en AIS-dag: celler flagget av sirkel- og landdetektorene, ikke-avvikende celler og tomme celler; ruten er { "454" } km med { "10.5" } % i avvikende celler, { "21.2" } % ikke avvikende, { "0.0" } % uvurdert og { "68.3" } % ikke observert. ADS-B og AIS er separate lag og blir aldri slått sammen. En flagget celle er ikke et funn av interferens, og en celle uten farge ble ikke observert, noe som ikke er det samme som klar. Alle data er funnet på, i åpent hav midt i Atlanteren, og er ikke en måling.

seg-765f43228dc6 = Begge dagene er de syntetiske eksemplene i <c1/>, hver med en syntetisk rute i <c2/>; eksponeringsandelene er det <c3/> skriver ut for dem. Ingenting i dem er et ekte sted, fly eller fartøy.

seg-228f39c0305b = Data og lisenser

seg-d3336cc18ff7 = Bare kildene som er gjennomgått i <a1><c1/></a1> er innebygd, valgt med <c2/>:

seg-b03d56f501c3 = Type

seg-2328672e782f = Lisensfelt i utdata

seg-2319c7a6f6e2 = ODbL { "1.0" }

seg-7464d3c830f3 = AIS

seg-c13f76567536 = Amerikansk allmennhetsgods (CC0 { "1.0" } ifølge utgiveren)

seg-636c2bb6f29d = allmennhetsgods

seg-f6f4e431d36d = NLOD { "2.0" }

seg-5621e3a3908f = begge deler

seg-6b3a1f8ca649 = det du oppgir

seg-be349e2c455f = <c1/>, <c2/>, <c3/> påkrevd

seg-590344d1eae5 = Hver utdatafil har lisensen, lisens-URL-en, den påkrevde kildehenvisningen og kildens dekningsbegrensninger innebygd. Det finnes ingen innebygd oppføring for kilder hvis vilkår forbyr kommersiell bruk eller videredistribusjon av avledede kart.

seg-2d8eaefab0f8 = <b>ODbL og Kshana-utgavene.</b> En ADS-B-fil per celle laget av data fra adsb.lol er en Derived Database og gis ut under ODbL { "1.0" }; feltet <c1/> i filen sier det. Kshanas egen kode forblir AGPL-3.0. Kommersielle utgaver av Kshana som skriver slike filer fører den samme merknaden, og alle som publiserer filen på nytt må beholde den. ADS-B- og AIS-resultater slås aldri sammen i én fil, så ODbL knyttes ikke til AIS-laget.

seg-bb4932d5d15c = <b>Dekningsskjevhet.</b> Kart arver dekningen til kilden sin. adsb.lol følger frivillige mottakere, så åpent hav og tynt dekkede områder er sparsomt representert. Kystverkets åpne data utelater fiskefartøy under { "15" } m og fritidsfartøy under { "45" } m, så kartet gjenspeiler større skip. MarineCadastre dekker bare amerikanske farvann.

seg-713babc3963b = <b>Identifikatorer.</b> Inndatarader har en identifikator for fly eller fartøy. Den hashes i minnet med et tilfeldig salt per kjøring, brukes bare til å telle distinkte fly eller fartøy, og skrives, logges eller skrives ut aldri. Utdataene er aggregerte: ingen identifikator forekommer noe sted i dem.

seg-fa3c70a8997a = <b>Undertrykking.</b> En celle med færre enn <c1/> distinkte fly eller fartøy observert den dagen publiseres ikke i det hele tatt, og for AIS rapporteres et flaggtall på én eller to i en publisert celle som <c2/>. Ingen publisert verdi kan peke ut et fly eller et fartøy.

seg-02dbfcb9c808 = Inndataformater

seg-2f291f986a87 = Ren CSV med en overskriftsrad, kommaseparert, uten anførselstegn, UTC-tider. Kolonnerekkefølgen er fri; ukjente kolonner ignoreres. Et tidsstempel er Unix-sekunder eller <c1/>. Rader som ikke kan tolkes telles i utdataenes metadata, de blir ikke stille droppet.

seg-571365be20a5 = ADS-B (<c1/>):

seg-aaeff8f42699 = Kolonne

seg-b10a51ed96c0 = Påkrevd

seg-357c2320b43a = ja

seg-14ac5d0f109b = rapporttidspunkt

seg-6dbe5595d0be = ugjennomsiktig identifikator (hashes, lagres aldri)

seg-c5fb6b91dc68 = grader

seg-e283838c85aa = høyde i fot; <c1/> eller tom utelater raden

seg-9ab90c35bd7d = minst én

seg-868e5b9c00ab = heltall { "0" } til { "11" }; tom betyr ikke rapportert

seg-db907db790b1 = nei

seg-5c2ce9f61700 = hvis til stede brukes bare verdier som begynner med <c1/> (MLAT, TIS-B og lignende utelates)

seg-412f40b8eeb1 = <b>adsb.lol readsb-historikk, lest direkte.</b> Dagsarkivene er en delt tar-fil av readsb-sporfiler. Pakk ut ett slik utgiveren beskriver (sett delene sammen, <c1/>), og gi deretter Kshana den utpakkede mappen, én enkelt <c2/>-fil eller en CSV:

seg-6e7d378bd89b = En mappe søkes gjennom rekursivt etter <c1/>-filer (andre filer, som <c2/>, ignoreres, og symbolske lenker følges ikke). Hver fil er gzip-komprimert eller ren JSON, oppdaget fra de første bytene, fordi readsb skriver gzip under et <c3/>-navn; dekomprimeringen er begrenset til { "512" } MiB per fil. Fra hver sporoppføring leser Kshana tidsforskyvningen, breddegrad, lengdegrad, høyde (markøren <c4/> utelater oppføringen), feltene <c5/> og <c6/> i flyets detaljobjekt, og strengen for posisjonskilde (oppføringer fra noe annet enn ADS-B utelates). En oppføring uten detaljobjekt har ingen nøyaktighetsfelt og telles som utelatt. En fil som ikke kan leses telles i <c7/> i utdataenes metadata og hoppes over.

seg-b1502f7f4c98 = AIS (<c1/>):

seg-91395984ddac = grader; AIS-verdiene for «ikke tilgjengelig» og ({ "0" }, { "0" }) forkastes

seg-34ae94eb1797 = fart over grunnen i knop; { "102.3" } (ikke tilgjengelig) behandles som manglende

seg-a1e60af5adaa = Detektoren for landposisjon trenger en landpolygonfil (<c1/>): GeoJSON Polygon eller MultiPolygon. Natural Earths landlag i { "1" }:{ "10" } millioner (allmennhetsgods) er den tiltenkte filen. Uten <c2/> er detektoren av, og utdataene sier det. Slik laster du den ned (den eneste nettverkstilgangen i denne funksjonen):

seg-cd55a09894c5 = Dette kjører systemets <c1/> (som en argumentliste, ikke gjennom et skall) over HTTPS, én gang, for én fil på en fast adresse som navngir en enkelt commit i oppstrøms repositoriet. Nedlastingen beholdes bare hvis SHA-256 er lik verdien som er festet i koden; avvik sletter den og gir feil. Hvis <c2/> ikke er installert, sier kommandoen fra om det og oppgir adressen og sjekksummen, slik at filen kan hentes for hånd. Ingenting er medlevert i repositoriet.

seg-95eeaa0033b3 = Én GeoJSON-fil per kilde per UTC-dag, i mappen <c1/>, med navnet <c2/>, der <c3/> er <c4/> eller <c5/>, <c6/> er nøkkelen <c7/> (<c8/>, <c9/>, <c10/> eller <c11/>), og datoen er UTC-dagen til rapportene: <c12/>, <c13/>. Datasettet står i navnet slik at to datasett av samme type ikke kan dele en fil, og <b>Kshana overskriver aldri en fil</b>: hvis noe mål finnes, feiler kommandoen før den skriver noe. CLI-et skriver ut én linje per fil det skriver. En leser kan hente ut de tre delene med <c14/>; den samme informasjonen ligger inne i filen (<c15/>, <c16/>, <c17/>). Syntetiske eksempelfiler, én per kilde, ligger i <c18/>, sammen med kommandoen som lager dem på nytt, til bruk ved bygging og testing av en visning. Et medlem på toppnivå, <c19/>, holder skjemanavnet, datoen, rutenettet, metode-id-en og alle parametere, tallene på dagsnivå, datalisensen og kildehenvisningen, og en merknad. Hvert objekt er en cellepolygon med <c20/>, <c21/>, <c22/>, <c23/> og de aggregerte antallene.

seg-1ee702004726 = Rutenettet er fast: kvadratiske celler på <c1/> grader (standard { "0.5" }) i breddegrad og lengdegrad, indeksert fra (-90, -180). Bredden i øst-vest-retning krymper med breddegraden: omtrent { "55" } km ved ekvator og omtrent { "28" } km ved { "60" } grader for standardverdien. Breddegrad { "90" } hører til den siste raden, og lengdegrad { "180" } er den samme meridianen som -180. <b>De forhåndsregistrerte metodene er definert på rutenettet med { "0.5" } grader.</b> En annen <c2/> kjører, men er ikke den forhåndsregistrerte metoden: CLI-et sier det, og filen registrerer <c3/> og <c4/> (false) slik at en visning også kan si det.

seg-6e1e8f2a9082 = <b>Tilbakeholdte antall.</b> Hvert antall per celle under publiseringsminimumet ({ "5" }) er <c1/>, også null, så <c2/> betyr aldri «ingen», og ingen publisert verdi kan peke ut et fly eller et fartøy. Feltene <c3/> og <c4/> oppgis likevel. I ADS-B-filer er <c5/> alltid minst { "5" } for en publisert celle; <c6/> og <c7/> er <c8/> under { "5" }, og <c9/> er <c10/> med mindre begge er minst { "5" } (en andel ville avslørt et tilbakeholdt antall). I AIS-filer er hver oppføring i <c11/> <c12/> under { "5" }.

seg-fd929d6ee90b = Formatversjon og felt

seg-ff443e9cbd20 = Formatet er fastsatt som <c1/>, <c2/>. En endring som fjerner eller omdøper et felt, eller endrer hva et felt betyr, øker versjonen; å legge til et felt gjør det ikke, så en leser må ignorere felt den ikke kjenner. Et antall som er <c3/> er tilbakeholdt, ikke null.

seg-60818bfc3f90 = <c1/>-verdier: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> er true bare for <c10/> og <c11/>. Rapporten for rute-eksponering har sitt eget skjema, <c12/>.

seg-ea526ebdd260 = Observatoriet: dagsproduktet

seg-e33f63fe5c0a = <c1/> gjør én UTC-dag med ADS-B-rapporter om til observatoriets tre filer (GeoJSON, PNG og en JSON med hendelsesrapport) og et hash-manifest, og <c2/> spiller av den dagen på nytt under endringer av de forhåndsregistrerte parameterne, én om gangen. Kommandoen håndhever utgivelsesreglene: minst { "24" } timer etter at dagen er slutt (<c3/> kan bare økes), celler på { "0.5" } grader eller grovere, bare tre tilstander (<c4/>, <c5/>, <c6/>), ingen årsak tilskrevet og ingen OpenSky-data. Metodenotatet, filformatene og begrensningene står i <a1><c7/></a1>. En regional kjøring (<c8/>) leser bare rapportene i boksen og sier det i filen.

seg-31ce42fc05dc = Spesifikasjon for kartsiden i Studio

seg-a9aca2e2d390 = For kartsiden i Studio, som laster en GeoJSON-fil brukeren oppgir (siden er bygd i Studio-kilden, ikke i dette repositoriet). Ingenting lastes opp: filen leses i nettleseren, og siden sender ingen forespørsel til noen datakilde.

seg-064ec5d4c91a = <b>Lese en fil.</b> Godta en fil bare hvis <c1/> begynner med <c2/> og <c3/> er et tall siden støtter; ellers sier du at filen ikke er et støttet interferenskart fra Kshana. Les feltene som er oppført ovenfor; ignorer ukjente. En fil holder én kilde og én dag. Flere filer kan lastes.

seg-5be32f8cff46 = <b>Celler.</b> Tegn polygonen til hvert objekt. Farg etter <c1/>, og si alltid hva hver farge betyr i en tegnforklaring. Fire tilstander, og ingen av dem må skjules eller slås sammen:

seg-b652b86e6b8e = Tilstand

seg-4a511b6a03e3 = Hvor den kommer fra

seg-f92da2236260 = Degradert (eller avvikende for AIS)

seg-591ebe8007cb = en høy andel av flyene rapporterte lav nøyaktighet, eller fartøyene viste avvik, den dagen

seg-bd993c64b6e8 = <c1/> er true

seg-88d43eb1c14a = Klar

seg-af5f7989fd09 = observert med nok fly eller fartøy og ikke flagget

seg-2bc810e02210 = <c1/> er <c2/> eller <c3/>

seg-d894eaa21369 = Uvurdert

seg-38c88ed94111 = observert, men for få utvalgte fly, dagen var forstyrret, eller dagens bakgrunn kunne ikke estimeres

seg-e358a8c7903f = <c1/> er <c2/>, <c3/> eller <c4/>

seg-013b7c903426 = Ikke observert

seg-81bcffa57ec2 = for få fly eller fartøy, så cellen ble ikke publisert

seg-6828d71822bd = ingen objekt for den cellen

seg-753192a770ac = «Ikke observert» er fraværet av et objekt: tegn det nøytralt (uten fyll, eller med skravur), aldri i fargen til «klar». Bruk et fargeskjema som ikke bare er avhengig av rødt mot grønt. Celledetaljer ved hold over eller valg viser antallene i <c1/> slik de er oppgitt, og hvert <c2/>-antall som «tilbakeholdt (færre enn { "5" })», aldri som null. En visning bør også si, når <c3/> er false, at filen bruker en cellestørrelse utenfor den forhåndsregistrerte metoden.

seg-e90fedf7ad89 = <b>Lag.</b> ADS-B og AIS er separate lag med egne brytere, tegnforklaringer og lisenslinjer. Slå dem aldri sammen til ett fargefelt eller ett antall, tegn dem aldri som én kombinert celle, og summer aldri cellene deres. Ulike dager er ulike filer: vis én dag om gangen, med en dagsvelger, i stedet for å legge dager oppå hverandre.

seg-6d500d3c0baa = <b>Lisens og kildehenvisning.</b> For hvert synlige lag vises, på kartet og i enhver eksport eller skjermdump, teksten i <c1/> ordrett, <c2/> med en lenke til <c3/>, og <c4/>. Hvis et ADS-B-lag vises, gjelder ODbL-lisensen bare for det laget. Ikke tilby å eksportere en kombinert fil.

seg-6f786153ef8e = <b>Metode.</b> Tilby metode-id-en og parameterne (<c1/>, <c2/>) og tallene i <c3/> i et detaljpanel, inkludert <c4/> (si rett ut at ingen celle ble kalt degradert på grunn av dagens bakgrunn) og <c5/>.

seg-905348837439 = <b>Forbehold som skal beholdes</b> (vis filens egne <c1/> og <c2/>, og hold denne ordlyden eller en tilsvarende synlig sammen med kartet):

seg-1f70e308010a = En degradert eller avvikende celle er ikke et funn av interferens. Andre årsaker finnes.

seg-7cde0ddadb73 = En celle uten farge ble ikke observert. Det er ikke bevis for at området var klart.

seg-1135dfeadb8f = Dette er en beskrivelse av tidligere posisjonsrapporter, ikke en prognose og ikke en måling av noen mottaker.

seg-3ad1216bf3ed = Dekningen følger datakilden; les dekningsnotatene.

seg-046f6af48349 = Siden må ikke navngi eller vise noe enkeltstående fly eller fartøy, og filene inneholder ingen.

seg-ae79b67c3b98 = <b>Eksponering langs rute.</b> Hvis siden også laster en <c1/>-rapport, vis radene per dag og kilde med alle de fire andelene (degradert, klar, uvurdert, ikke observert) sammen, aldri den degraderte andelen alene, i tillegg til rapportens <c2/>, og hver rads <c3/> og <c4/>.

seg-98131acf49d8 = ADS-B-metode (<c1/>)

seg-83b660b0bfa6 = Hver ADS-B-rapport fra fly i luften har to selvvurderte felt for navigasjonskvalitet: NIC (innesluttingsradius for posisjonen) og NACp (grensen for { "95" } % nøyaktighet, EPU). Når mottakeren om bord mister eller ikke stoler på satellittposisjonen sin, faller begge, og derfor bærer de en signatur for interferens. De faller også av andre årsaker.

seg-4b9020a68db6 = <b>Forhåndsregistrerte parametere</b> (konstanter i koden, skrevet inn i hver fil; en endring betyr en ny metodeversjon):

seg-e73ea9921fcf = Parameter

seg-8650fa804f14 = Høydegrense

seg-25056ee5a36c = barometrisk høyde på minst { "5000" } fot

seg-17322eff480a = Rapport med lav nøyaktighet

seg-48ab6ed5eedd = NACp på høyst { "6" } (den rapporterte EPU-grensen er { "556" } m, { "0.3" } NM, eller større, eller ukjent) eller NIC på høyst { "5" } (den rapporterte grensen for innesluttingsradius er { "1852" } m, { "1" } NM, eller større, eller ukjent)

seg-84beb488319d = God rapport

seg-2595055d9593 = NACp på minst { "8" } og NIC på minst { "7" }; bedømt på feltene inndataene har (begge når begge finnes, ellers det som finnes)

seg-b4bbce695b2d = Utstyrsgrunnlinje

seg-4986ed51f600 = et fly teller i en celle bare med minst { "5" } gode rapporter utenfor den cellen samme dag

seg-42859d1d785b = Fly i utvalget i en celle

seg-1ae26d6d99a9 = minst { "3" } rapporter i cellen

seg-48bba15e2e0e = Berørte fly i en celle

seg-1fe9c3ab930c = minst { "50" } % av rapportene i cellen er av lav nøyaktighet

seg-b147473d133c = Minste utvalg

seg-33060cda8536 = minst { "10" } fly i utvalget

seg-009ca23b9cd6 = Degradert

seg-afef85ae2a25 = minst { "5" } berørte fly, en berørt andel av flyene i utvalget på minst { "0.30" }, og minst { "0.15" } over dagens median for cellenes andel

seg-890dcc56fa5c = Forstyrret dag

seg-b27768e64d62 = medianandel for celler (over minst { "5" } celler med fullt utvalg) på minst { "0.15" }: ingen celle erklæres degradert

seg-18fbf3c348c9 = Ingen bakgrunn

seg-534111e0c6ad = færre enn { "5" } celler med fullt utvalg, så medianen kan ikke estimeres: en celle som når tersklene er <c1/>, ikke degradert

seg-b571f127c595 = Publiseringsminimum

seg-60621ffc5bcf = minst { "5" } distinkte fly observert

seg-f36389caf81b = Disse verdiene ble fastsatt ut fra definisjonene av NIC- og NACp-kodene og fra personvernregelen før noen data ble sett på. De ble ikke tunet på ekte data, og testene bruker bare syntetiske data. Cellestatuser: <c1/>, <c2/>, <c3/> (publisert, men færre enn { "10" } fly i utvalget), <c4/> og <c5/>.

seg-c89afc07989b = <b>Versjon { "2" }.</b> Versjon { "1" } erklærte en celle degradert fra så få som { "3" } berørte fly, færre enn publiseringsminimumet på 5 fly, og hoppet over kontrollen av dagens bakgrunn uten å si fra når færre enn { "5" } celler var fullt utvalgt. Versjon { "2" } krever minst { "5" } berørte fly og holder tilbake vurderingen (<c1/>) når bakgrunnen ikke kan estimeres. Begge endringene strammer inn metoden (ingenting som ikke var degradert i versjon { "1" } er degradert i versjon { "2" }); grunnen er at en publisert vurdering aldri må hvile på færre fly enn tallet som antall holdes tilbake under. Filer fra versjon { "1" } ble ikke gitt ut.

seg-ffd0e5175548 = Hvorfor nøyaktighetsfeltene faller av andre årsaker enn interferens, og vernet mot hver:

seg-12b613a77f64 = Årsak

seg-e30479c3e5d8 = Vern

seg-ecac3d226210 = Eldre transpondere som aldri rapporterer NIC eller NACp, eller rapporterer dem med en fast lav verdi

seg-8b504b60fcc0 = utstyrsgrunnlinjen: et fly uten gode rapporter andre steder den dagen telles ikke

seg-1df45f128708 = Lav høyde og operasjoner på bakken (terrengskygging, andre posisjonsformater)

seg-cc5f23f0da05 = høydegrense; rader markert <c1/> utelates

seg-ddf6aeb47dbe = MLAT eller andre posisjoner som ikke er fra GNSS

seg-51162a1835d1 = <c1/>-filter når kolonnen finnes

seg-08196503a657 = Ett fly som sender mange rapporter

seg-bf13dfa85dbe = distinkte fly telles, ikke rapporter

seg-bbcb809624bc = Et konstellasjons- eller utvidelsesavbrudd, eller en romværhendelse, som senker nøyaktigheten over et stort område

seg-5f428bb7ad4a = cellen må overstige dagens median for cellenes andel med en margin, og en dag der medianen selv er høy markeres som forstyrret og erklærer ingen celle

seg-30290253a95d = En feil i utstyret til ett fly

seg-b673195405ff = krever en andel av mange distinkte fly, med et minste utvalg

seg-aeebeded71be = Få fly i cellen

seg-c33c60b49b17 = minste utvalg; under { "5" } observert publiseres ikke cellen

seg-dc8abb9b411f = Det som gjenstår: metoden kan ikke skille interferens fra en regional årsak som er lokal snarere enn utbredt (en lokal effekt av satellittgeometri eller et avbrudd i bakkebasert utvidelse ville sett likt ut), og den er konservativ i én retning: et fly som bare flyr innenfor et berørt område hele dagen har ingen grunnlinje og telles ikke, så vedvarende store områder underrapporteres.

seg-41d725eeaba9 = AIS-metode (<c1/>)

seg-7fd53079dccf = Per fartøy per dag, fem detektorer. En detektor <b>kvalifiserer</b> i en celle når den flagger minst { "5" } distinkte fartøy som utgjør minst { "20" } % av fartøyene observert der; cellen er <c1/> hvis en detektor kvalifiserer.

seg-6d599353e8e1 = Detektor

seg-551f38a9061c = Regel (forhåndsregistrert)

seg-295e8a28a5b9 = minst { "3" } rapporter i cellen mer enn { "2000" } m inne på land fra den oppgitte kystlinjen

seg-fd21160e6685 = et vindu på { "20" } påfølgende rapporter (steg { "10" }, mellomrom på høyst { "30" } min) der gjennomsnittsradius fra tyngdepunktet er { "500" } m til { "20" } km, variasjonskoeffisienten for radius er høyst { "0.15" }, én bevegelsesretning med total svingning på minst { "270" } grader (steg på høyst { "90" } grader, netto minst { "80" } % av totalen), og gjennomsnittsfart på minst { "2" } kn

seg-1aa30db06794 = minst { "2" } hopp som kommer inn i cellen: påfølgende rapporter minst { "1000" } m fra hverandre, høyst { "1" } time mellom, som antyder mer enn { "70" } kn (den antydede farten bruker minst { "1" } s mellom rapportene, så to rapporter med samme tidsstempel og posisjoner { "1" } km eller mer fra hverandre teller som et hopp)

seg-7f9b22254009 = minst { "3" } rapporterte farter over { "70" } kn i cellen

seg-e0d0968e8751 = minst { "5" } distinkte fartøy som rapporterer samme posisjon (avrundet til { "1e-4" } grader, omtrent { "11" } m) i det samme 10-minuttersvinduet

seg-1bf4c460672c = Celler med færre enn { "5" } distinkte fartøy publiseres ikke; hvert flaggtall under { "5" }, også null, rapporteres som <c1/>.

seg-b2ea2ec6bad1 = <b>Versjon { "2" }.</b> Versjon { "1" } lot en detektor kvalifisere fra { "3" } flaggede fartøy og publiserte antall på { "3" } og { "4" }. Versjon { "2" } hever minimumet for flaggede fartøy til { "5" }, publiseringsminimumet, slik at en <c1/>-vurdering aldri hviler på færre fartøy enn tallet som antall holdes tilbake under. Dette strammer inn metoden, og ingen fil fra versjon { "1" } ble gitt ut.

seg-25593339aeb0 = <b>Kjente årsaker til falske positive</b>, som andelsregelen og tersklene reduserer, men ikke fjerner: fartøy i elver, kanaler og havner nær en grov kystlinje (bufferen på { "2" } km inne på land finnes for dette); to fartøy som deler én identifikator, noe som ser ut som hopp; transpondere med dårlig posisjonsbestemmelse eller testutstyr; og kretsing fra losbåter og søkefartøy, som kan likne sirkler. En kystlinjefil på { "1" }:{ "10" } millioner er nøyaktig til omtrent en kilometer.

seg-ac661440a29a = Hopp- og fartsdetektorene sammenligner rapporter innenfor én inndatafil; et spor som er delt over filer eller dager sys ikke sammen.

seg-05f789b26904 = <b>Minne.</b> Inndata leses linje for linje og holdes aldri samlet. ADS-B beholder bare tellere per fly per celle. AIS beholder hver godtatte rapport i en kompakt post (omtrent { "40" } bytes) til dagen er evaluert, så minnebruken vokser med antallet AIS-rapporter i inndataene; del en svært stor AIS-inndata opp etter dag.

seg-206c78a69ded = Eksponering langs rute

seg-0d8832796ab7 = <c1/> er en GeoJSON LineString (alene, i en Feature eller i en FeatureCollection) eller en CSV med <c2/>-linjer. <c3/> tar kartfiler eller mapper med dem, og kan gjentas. Veipunkter forbindes med rette linjer i breddegrad og lengdegrad, så fortett lange etapper; en etappe tar korteste vei rundt i lengdegrad, så en som krysser antimeridianen ({ "179.5" } Ø til { "179.5" } V) krysser den. Ruten deles i biter på omtrent { "250" } m. Hver bit måles mellom sine egne to endepunkter på en kule med radius { "6371.0088" } km (den samme veien som avgjør hvilken celle den ligger i) og knyttes til cellen som rommer midtpunktet.

seg-cc5e2553700b = Per dag og per kilde gir rapporten rutelengden og fire andeler som summerer til { "1" }: <c1/>, <c2/>, <c3/> (celle til stede, men uten vurdering) og <c4/> (celle fraværende fra kartet). Les de to siste sammen med den første: en rute med lav degradert andel og høy andel ikke observert er ikke vist å være klar. ADS-B- og AIS-rader rapporteres hver for seg og slås aldri sammen. Hver rad har kartets lisens og kildehenvisning.

seg-3a087d90e317 = Bibliotekfunksjoner

seg-67ea1ff00bb8 = For kallere som har data i minnet (bindinger, MCP-serveren, nettleserbygget) tilbyr modulen <c1/> de samme metodene med tekst eller bytes inn og JSON ut, uten å røre noen fil og uten nettverk:

seg-4dbf41c0ec3b = Funksjon

seg-95f87a38a522 = Inn

seg-0fe8ff25f4a1 = Ut

seg-9e99af2c1f84 = ADS-B CSV-tekst

seg-e144f449c5b4 = ett byte-utsnitt per readsb-sporfil (gzip eller ren)

seg-7effd7110c4c = AIS CSV-tekst, valgfri land-GeoJSON-tekst

seg-10c5e0c0a9c8 = rutetekst, kart-GeoJSON-tekster, valgfrie <c1/>-grenser

seg-be00d23d96e9 = <c1/> JSON

seg-20a842d675c2 = Et <c1/> har <c2/> (<c3/>), <c4/> og <c5/> (v1-dokumentet). <c6/> er <c7/> eller <c8/>; <c9/> er { "0.5" }. Feil er <c10/>. Datasettreglene (klarerte forhåndsinnstillinger, lisenstekst påkrevd, typen må stemme) gjelder nøyaktig som på kommandolinjen.

seg-1195686de09b = Ekstern validering

seg-0de37085f544 = <c1/> sammenligner Kshana med uavhengige implementeringer på syntetiske inndata, med toleranser som er forhåndsregistrert i <c2/>: betydningen av NIC- og NACp-kodene mot pyModeS-dekoding av syntetiske ADS-B-rammer, AIS-verdier for «ikke tilgjengelig» mot pyais-dekoding av syntetiske AIVDM-setninger, celletilordning i rutenettet mot shapely, rutelengde per celletilstand mot shapely og GeographicLib, og maskering av land mot shapely og pyproj. Testdataene lages av <c3/>; CI trenger ikke Python. Dette validerer hvordan kodene og feltverdiene leses, og geometrien. Det validerer ikke at en flagget celle er interferens.

seg-56a3e955cbcc = Alle tester bruker syntetisk genererte data og ingen nettverk: enhetstester i <c1/>, og <c2/> for kommandoene fra ende til ende, blant annet at ingen identifikator når en utdatafil og at avslag ikke etterlater filer.

seg-212c43d1a41c = <s1>Forrige</s1>NMEA-treningsstrømmer

seg-7f13ee5d254e = <s1>Neste</s1>Interferenskart: datakilder og lisenser

seg-1fc1794d9388 = ADS-B-metode (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = AIS-metode (kshana-interference-map/ais/v2)
