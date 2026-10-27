# docs--observatory-method: translations (da)

seg-0857a94a948e = Begrænsninger

seg-2247a2344710 = Betydning

seg-b652b86e6b8e = Tilstand

seg-7ca62fa39e10 = Kilde: <c1/>

seg-48e063b567d0 = Interferensobservatoriet: metodenote

seg-d0e1d6cadc10 = Version <c1/>, bygget på <c2/>. Kun vejledende: dette er en beskrivelse af, hvordan offentliggjorte positionsrapporter så ud på tidligere dage, ikke en måling af nogen modtager, ikke en prognose, ikke en bekræftelse af interferens og ikke en tilskrivning af dens årsag.

seg-c5eab49b8d6f = Hvad observatoriet udgiver

seg-165ae7646608 = Ét produkt pr. UTC-dag og region fra ét åbent arkiv over flypositioner. Hver celle i et fast bredde-længdegitter på 0.5 grad er i én af <b>tre tilstande</b>:

seg-cc07647eb12e = En høj andel af de fly, der er stikprøvet i cellen, rapporterede den dag lav navigationsnøjagtighed, tydeligt over dagens baggrund.

seg-3e1dd7caaee6 = Der var stikprøvet nok fly, og andelen opfyldte ikke reglen.

seg-8f0d9ad60d62 = Data tillod ikke en afgørelse. Dette er <b>ikke</b> "klart". Hver sådan udgivet celle bærer en dataårsag: <c1/>, <c2/> eller <c3/>. En celle uden nogen post blev set af færre end { "5" } forskellige fly og tilbageholdes.

seg-e49e05b47061 = Intet andet udgives: ingen årsag, ingen aktør, ingen post pr. fly. Årsagerne beskriver, om dagens data var tilstrækkelige, aldrig hvorfor nøjagtigheden var lav.

seg-7b251c7860e0 = Tre filer pr. dag (<c1/>):

seg-2008b0ba6ac7 = <c1/>: cellerne med <c2/> <c3/>, metoden og dens præregistrerede parametre, licensen og kildeangivelsen, udgivelsesreglen og en meddelelse.

seg-7d5b16eac4a3 = <c1/>: de samme celler som et billede (forringet, ikke forringet, ikke observeret skraveret; tomme celler blev ikke observeret). Tekstblokke i filen gentager meddelelsen og licensen.

seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Sammenhængende forringede celler (diagonaler medregnet) udgør én hændelse med en afgrænsningsboks og sine celler. <c4/> er den faste tekst <c5/>. Filen er et input til en cyklus med rapportering, bekræftelse og underretning (luftfartens rapporteringscyklus, der ender i en NOTAM); den er ikke en bekræftelse og ikke en NOTAM.

seg-49b7bdae0d6e = og en <c1/> med bytetal og SHA-256 for de tre filer, metode-id'et, inputtællerne (læste og udelukkede rækker) og datasætblokken, så et produkt kan kontrolleres og gengives.

seg-d7bb390fb986 = Udgivelsesregler (håndhævet af kommandoen)

seg-87147317f8da = <b>Mindst { "24" } t forsinkelse.</b> En dags produkt udgives tidligst ved udgangen af den UTC-dag plus <c1/> ({ "24" } eller mere; en mindre værdi afvises). Kommandoen afviser en dag, der endnu ikke kan udgives, og angiver det tidligste tidspunkt. Der er ingen kontakt til at forkorte den.

seg-43960c3f9b6c = Grove celler.

seg-1a5ff10e5240 = <c1/> under { "0.5" } afvises.

seg-e70d8d7f9980 = <b>Undertrykkelse.</b> En celle, der er set af færre end { "5" } forskellige fly, udgives ikke; et tal under { "5" } er <c1/> (nul medregnet), som i grundmetoden.

seg-ab75582c5032 = <b>Ingen tilskrivning.</b> Ordforrådet for tilstande og årsager har ingen årsag; en test hævder det.

seg-0e7d76d7efd0 = <b>Kilder.</b> Kun adsb.lol (ODbL { "1.0" }) eller et brugerdatasæt med sin egen licens. <b>Data fra OpenSky Network afvises</b> (dets licens tillader ikke kommerciel brug eller videredistribution af afledte kort). ADS-B og AIS kombineres aldrig.

seg-dc28848046ac = <b>Produktets licens.</b> En ADS-B-fil pr. celle lavet ud fra adsb.lol er en afledt database og bærer ODbL { "1.0" } og adsb.lol-kildeangivelsen i filen. Kshanas kode forbliver AGPL-3.0.

seg-9eeba6648fec = Det observerede og grundmetoden

seg-7334dc45eb2f = Et ADS-B-fly rapporterer, hvor nøjagtig det mener, at dets egen GNSS-position er: <b>NACp</b> (Navigation Accuracy Category for Position, en vandret { "95" } %-grænse fra { "10" } NM ned til under { "3" } m) og <b>NIC</b> (Navigation Integrity Category, en indeslutningsradius). Grundmetoden (<c1/>, <c2/>) tæller pr. celle og dag andelen af <b>forskellige fly</b>, hvis rapporter i cellen mest var af lav nøjagtighed, med værn: kun højde over { "5,000" } ft; et fly tæller kun, hvis det samme dag rapporterede god nøjagtighed andre steder (en udstyrsbaseline); cellens andel skal overstige dagens median for celleandele med en margin; en dag, hvis median selv er høj, markeres som forstyrret, og ingen celle erklæres forringet. Parametrene blev fastlagt ud fra definitionerne af felterne og ud fra privatlivsreglen, før nogen data blev undersøgt, og er skrevet ind i hver outputfil. Observatoriet tilføjer ordforrådet med tre tilstande, udgivelsesreglerne og filerne ovenfor og ændrer ingen parameter.

seg-96cf298985c6 = <b>Regionale kørsler.</b> Med <c1/> læses kun rapporter inde i boksen. Udstyrsbaselinen og dagens baggrund beregnes så kun ud fra boksens rapporter, og filen angiver det (<c2/>). Et regionalt produkt er derfor et produkt af den regions data, ikke et udsnit af et globalt.

seg-2e7007b56a44 = Forhold til metoden NACp over for almanak-HDOP

seg-4892485e534b = Pleninger, Topkova og Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" } til { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, sammenligner den positionsfejl, som et flys NACp indebærer, med HDOP (horizontal dilution of precision) for GPS-konstellationen ud fra almanakdata og markerer et fly som påvirket, når de to afviger; artiklen vurderer metoden på bevidste GPS-jamming-forsøg.

seg-74ec1aca8a22 = <b>Hvad vi brugte.</b> Kun det offentliggjorte abstract og den bibliografiske post. Fuldteksten var ikke tilgængelig for os (bag betalingsmur), så vi kender hverken dens afbildning fra NACp til et fejlestimat, dens HDOP-beregning eller dens tærskler, og vi hævder ikke at gengive dem.

seg-4f8471649a07 = <b>Hvad observatoriet gør i stedet.</b> Spørgsmålet, som almanaksammenligningen besvarer, er: "kan konstellationsgeometrien alene forklare denne lave nøjagtighed?". Grundmetoden besvarer et beslægtet spørgsmål uden almanak: en lav andel skal skille sig ud mod samme dags baggrund i regionen og mod flyets egne gode rapporter andre steder. Det er en anden og svagere erstatning: den kan ikke sige, at en time med rolig geometri var forringet, hvor dagens baggrund også er lav. En almanak-HDOP-scorer er <b>ikke implementeret</b>. Det er et åbent punkt, der skal bygges ud fra artiklens fulde tekst og den offentlige GPS-almanak og præregistreres, før den køres; indtil da er den citeret, ikke hævdet.

seg-e9b9902633af = At gengive et produkt

seg-95e48f0286d9 = Pipelinen er deterministisk i alt, hvad den udgiver (saltet til identifikatoren i hver kørsel ændrer kun interne hashværdier, som aldrig skrives). Manifestets SHA-256-værdier lader en anden kørsel sammenligne byte for byte.

seg-65236a42e316 = Følsomhedsstudie

seg-0c843e799b8f = <c1/> afspiller én dags rapporter igen under ændringer af én præregistreret parameter ad gangen (to værdier hver, plus et gitter på { "1.0" } grad) og rapporterer pr. variant antallet af forringede, ikke forringede og ikke observerede celler, Jaccard-indekset for det forringede sæt med det registrerede, de celler hvis tilstand ændrede sig, og det forringede areal. Det ændrer intet ved den registrerede regel: en variant er ikke et valideret alternativ, og en stor ændring under en parameter siger, hvor meget afgørelsen afhænger af den parameter, ikke hvilken værdi der er den rigtige. Resultaterne for tilbagekataloget står i <c2/>.

seg-cc57d45c4b0a = <b>Dækning.</b> adsb.lol følger frivillige modtagere; åbent hav og tyndt dækket luftrum er sparsomme, og <c1/> er almindeligt der. Et kort viser dækningen af sin kilde.

seg-e3921e1eb177 = <b>Hvad lav nøjagtighed betyder.</b> NACp og NIC falder af andre grunde end interferens: satellit- eller augmentationsudfald, rumvejr, modtager- eller transponderfejl og geometri. Ingen tilstand indebærer en årsag.

seg-e5ad0dc456c0 = <b>Fly, der bliver i en påvirket region hele dagen,</b> har ingen baseline uden for den og tælles ikke med, så metoden undervurderer en vedvarende regional effekt. Følsomhedsstudiet viser virkningen af baselineværnet.

seg-a2d41becc19b = <b>Dagsgrænser</b> er UTC; en hændelse, der krydser midnat, deles mellem to dage.

seg-436af9f16feb = <b>Ingen grundsandhed.</b> Observatoriet har ingen ekstern uafhængig reference: hvert tal er MODELLED, og ingen række i verifikationsmatrixen hviler på det.

seg-5c4966f0166d = <b>Emnets følsomhed.</b> Kort af denne art er politiske. Observatoriet angiver en metode, en forsinkelse og et ordforråd og intet andet; det nævner ikke stater eller aktører, og det udgiver ikke i realtid.

seg-874f46a80c8b = <s1>Forrige</s1>Modtagerprotokoller, der læses

seg-3137b7595e59 = <s1>Næste</s1>Interferensobservatoriet: resultater
