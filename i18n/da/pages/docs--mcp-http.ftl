# docs--mcp-http: translations (da)

seg-c8bab9114d57 = Kilde: <c1/>

seg-4bd138b7d28a = Kør kshana-mcp over HTTP (selvhostet)

seg-7ca89d6e0201 = Et afsnit, der nævner AI-klienter fra tredjeparter, er udeladt her; det findes i <a1>docs/deploy/mcp-http.md</a1> på GitHub.

seg-2f5b3bdb7d0b = <b>Kshana hoster ikke et endpoint.</b> Der er ingen fælles <c1/>-server, som en klient kan pege på. Du kører den på din egen maskine, i din egen container eller i dit eget cloudprojekt, og du ejer adgangskontrollen og omkostningerne. Serveren i version { $version } er den, der ligger i dette repository: dens tal bærer deres mærkater VALIDATED eller MODELLED på præcis samme måde som over stdio.

seg-113a79ece785 = De sikre standardindstillinger

seg-2bdbe06123c8 = Kontrol

seg-640f28207e8a = Adfærd

seg-9bc8fe53a948 = Bind-adresse

seg-82001913f285 = Kun loopback (<c1/>, <c2/>). En bar port (<c3/>) betyder <c4/>.

seg-f2adda2d3e22 = Kræver <c1/> <b>og</b> et bearer-token i miljøvariablen <c2/> ({ "16" } tegn eller flere). Uden begge nægter serveren at starte. Med begge udskriver den en advarsel om, at den lytter ud over denne maskine.

seg-6fbe07565c36 = Autentificering

seg-d5cbeb0cd3d6 = <c1/> på hver forespørgsel, når et token er sat (det kan også sættes på loopback). Sammenlignes i konstant tid. Manglende eller forkert: <c2/>.

seg-1962f434458b = Filsystem

seg-1a9e048d348d = Ingen. IQ-filværktøjerne (<c1/>) er slået fra i HTTP-tilstand, uanset hvad <c2/> siger; ethvert andet værktøj tager sit scenarie inline og afviser et, der nævner en fil. Intet værktøjsargument læser eller skriver en sti.

seg-19261cdd2ef0 = Body-størrelse

seg-c4db8c1454f4 = <c1/>, standard { "5" } MiB (scenariegrænsen er { "4" } MiB). Over den: <c2/>, uanset om længden er angivet, eller body'en sendes i bidder.

seg-da9103d627dd = Svartid

seg-3f013a632773 = <c1/>, standard { "120" }. Over den: <c2/>. <b>Det afgrænser, hvor længe en kalder venter, ikke arbejdet</b>: en kørsel, der allerede er i gang, kan ikke stoppes, så den fortsætter efter <c3/> og afsluttes i baggrunden.

seg-a588b12596b7 = Samtidighed

seg-aa2214db3bdc = <c1/>, standard { "8" }. Ud over den får en forespørgsel straks <c2/> med <c3/>; ingen står i kø.

seg-87576ded5272 = Arbejdspulje

seg-7f9c63e3e5e6 = Ethvert værktøjskald kører på en blokerende tråd i en pulje med <c1/> pladser, aldrig på de asynkrone arbejdere, så en lang kørsel ikke kan hindre serveren i at svare. En plads frigives først, når selve kørslen slutter, ikke når kalderen giver op: forladte kørsler kan derfor ikke hobe sig op ud over puljens størrelse, og et kald, der finder puljen fuld, afvises som optaget.

seg-4a97b035483c = Arbejdsbudget

seg-91c788b33b25 = Et scenarie, der beder om langt mere end de medfølgende eksempler, afvises, før det kører: mere end { "1000" } Monte Carlo-realisationer (<c1/>), et parametergitter med mere end { "1000" } knudepunkter, mere end { "5000" } medlemskørsler (gitterknudepunkter gange realisationer) eller et tidsgitter med mere end { "2" } millioner epoker. Fejlen angiver det felt, der skal sænkes. Det samme budget gælder over stdio; kommandolinjen <c2/> har intet.

seg-79c6b146637c = CORS

seg-68fa7d9f1321 = Der sendes aldrig en <c1/>-header. En forespørgsel med en <c2/>-header afvises (<c3/>), medmindre den er angivet med <c4/>; <c5/> accepteres ikke.

seg-d7f157fdf003 = Host-header

seg-d7966e93ef1a = Kontrolleres mod loopback-navne eller bind-adressen plus hver <c1/>. Bag en proxy eller på en platforms URL skal du angive <c2/>. Alt andet: <c3/>.

seg-12d5cf72f363 = Sessioner

seg-58dfe5665877 = Ingen. Hver POST får et JSON-svar; der føres ingen sessionstabel, og ingen server-sent event-strøm holdes åben.

seg-adbc92ebc196 = TLS afsluttes ikke af <c1/>. Når den kan nås ud over én maskine, skal du sætte HTTPS foran den (din platforms TLS eller en reverse proxy) og holde tokenet hemmeligt; et bearer-token over almindelig HTTP kan aflæses på linjen.

seg-1b21740b9c63 = Lokal

seg-a6194f5a52f8 = Klientkonfiguration (en URL-klient; tilføj kun headeren, når et token er sat):

seg-a683980168f7 = Docker

seg-81df4f5cd02e = Inde i containeren skal serveren lytte på <c1/>, så den kræver <c2/> og tokenet. Hvis du publicerer porten som <c3/>, bliver den på din maskine; fjern <c4/> kun, når du vil eksponere den, og afslut så TLS foran den. <c5/>- samt Fly.io- og Cloud Run-skabeloner findes i <a1><c6/></a1>.

seg-8b8bef7174e8 = Skabeloner (du udruller dem selv; Kshana kører ingen)

seg-198bea1e0595 = <a1><c1/></a1>: sæt tokenet med <c2/>

seg-c33701cb9ca2 = <a1><c1/></a1>: hent tokenet fra Secret Manager

seg-b86ddb72b916 = Hver af dem kører det publicerede image, sætter <c1/> til det værtsnavn på platformen, som du indsætter i filen, og bruger platformen til HTTPS.

seg-ce3a5326cb95 = Sæt en CPU- og hukommelsesgrænse på platformen

seg-e1fc13672597 = Timeout, pulje og budget afgrænser, hvor meget arbejde der lukkes ind, men ét indlukket kald kan stadig bruge en kerne i lang tid, og et stort resultat kan bruge hundredvis af megabyte. Sæt også en hård grænse på containeren: skabelonerne beder om { "2" } CPU'er og { "1" } GiB (<c1/> og <c2/> i Compose, <c3/> i Fly, <c4/> i Cloud Run). Hold <c5/> på eller under antallet af CPU'er.

seg-058781b052c4 = Hvad den ikke er

seg-90edc7ff2a55 = Ikke en tjeneste med flere lejere. Enhver, der har tokenet, kører simuleringer på din hardware; der er ingen kvoter pr. bruger ud over grænserne ovenfor.

seg-5b3b9c610f31 = Vejledende, ikke typegodkendt navigationsudstyr: operatøren er fortsat ansvarlig for navigationen. Simulatorens output er modellerede eller validerede tal til analyse, som overalt ellers i Kshana.

seg-c33947d44b06 = <s1>Forrige</s1>MCP-server: alle installationskanaler

seg-a9d67efe493a = <s1>Næste</s1>Brug af Kshana fra en agent
