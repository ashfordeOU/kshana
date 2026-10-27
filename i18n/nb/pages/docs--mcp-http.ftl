# docs--mcp-http: translations (nb)

seg-c8bab9114d57 = Kilde: <c1/>

seg-4bd138b7d28a = Kjøre kshana-mcp over HTTP (selvhostet)

seg-7ca89d6e0201 = Et avsnitt som nevner KI-klienter fra tredjeparter er utelatt her; det finnes i <a1>docs/deploy/mcp-http.md</a1> på GitHub.

seg-2f5b3bdb7d0b = <b>Kshana er ikke vert for noe endepunkt.</b> Det finnes ingen delt server for <c1/> som en klient kan peke mot. Du kjører den på din egen maskin, i din egen container eller i ditt eget skyprosjekt, og du eier tilgangskontrollen og kostnaden. Serveren i versjon { $version } er den som ligger i dette depotet: tallene bærer merkelappene VALIDATED eller MODELLED akkurat som over stdio.

seg-113a79ece785 = De trygge standardene

seg-2bdbe06123c8 = Kontroll

seg-640f28207e8a = Atferd

seg-9bc8fe53a948 = Bindeadresse

seg-82001913f285 = Kun loopback (<c1/>, <c2/>). En enkelt port (<c3/>) betyr <c4/>.

seg-f2adda2d3e22 = Krever <c1/> <b>og</b> et bærertoken i miljøvariabelen <c2/> ({ "16" } tegn eller mer). Uten begge nekter serveren å starte. Med begge skriver den ut en advarsel om at den lytter utenfor denne maskinen.

seg-6fbe07565c36 = Autentisering

seg-d5cbeb0cd3d6 = <c1/> på hver forespørsel når et token er satt (det kan også settes på loopback). Sammenlignes i konstant tid. Manglende eller feil: <c2/>.

seg-1962f434458b = Filsystem

seg-1a9e048d348d = Ingen. IQ-filverktøyene (<c1/>) er slått av i HTTP-modus uansett hva <c2/> sier; alle andre verktøy tar scenarioet sitt inline og avviser et som oppgir en fil. Ingen verktøyparameter leser eller skriver en filsti.

seg-19261cdd2ef0 = Størrelse på forespørselskroppen

seg-c4db8c1454f4 = <c1/>, standard { "5" } MiB (scenariogrensen er { "4" } MiB). Over den: <c2/>, enten lengden er oppgitt eller kroppen sendes i biter.

seg-da9103d627dd = Svartid

seg-3f013a632773 = <c1/>, standard { "120" }. Over den: <c2/>. <b>Dette begrenser hvor lenge en kaller venter, ikke arbeidet</b>: en kjøring som allerede pågår kan ikke stoppes, så den fortsetter etter <c3/> og blir ferdig i bakgrunnen.

seg-a588b12596b7 = Samtidighet

seg-aa2214db3bdc = <c1/>, standard { "8" }. Utover den får en forespørsel umiddelbart <c2/> med <c3/>; ingen står i kø.

seg-87576ded5272 = Arbeidspulje

seg-7f9c63e3e5e6 = Hvert verktøykall kjører på en blokkerende tråd i en pulje på <c1/> plasser, aldri på de asynkrone arbeiderne, så en lang kjøring kan ikke hindre serveren i å svare. En plass frigjøres først når selve kjøringen er ferdig, ikke når kalleren gir opp: forlatte kjøringer kan derfor ikke hope seg opp utover pulljestørrelsen, og et kall som finner puljen full, avvises som opptatt.

seg-4a97b035483c = Arbeidsbudsjett

seg-91c788b33b25 = Et scenario som ber om langt mer enn de medfølgende eksemplene, avvises før det kjøres: mer enn { "1000" } Monte Carlo-realisasjoner (<c1/>), et parameterrutenett med mer enn { "1000" } noder, mer enn { "5000" } medlemskjøringer (rutenettnoder ganger realisasjoner), eller et tidsrutenett med mer enn { "2" } millioner epoker. Feilen nevner feltet som må senkes. Samme budsjett gjelder over stdio; kommandolinjen <c2/> har ikke noe.

seg-79c6b146637c = CORS

seg-68fa7d9f1321 = Ingen header av typen <c1/> sendes noensinne. En forespørsel med headeren <c2/> avvises (<c3/>) med mindre den er oppgitt med <c4/>; <c5/> godtas ikke.

seg-d7f157fdf003 = Host-header

seg-d7966e93ef1a = Sjekkes mot loopback-navn, eller bindeadressen pluss hver <c1/>. Bak en proxy eller på en plattform-URL, bruk <c2/>. Alt annet: <c3/>.

seg-12d5cf72f363 = Økter

seg-58dfe5665877 = Ingen. Hver POST får et JSON-svar; ingen øktstabell og ingen strøm av server-sendte hendelser holdes åpen.

seg-adbc92ebc196 = TLS termineres ikke av <c1/>. Når den kan nås utenfor én maskin, sett HTTPS foran den (plattformens TLS, eller en reverse proxy) og hold tokenet hemmelig; et bærertoken over ren HTTP kan leses på nettet.

seg-1b21740b9c63 = Lokalt

seg-a6194f5a52f8 = Klientkonfigurasjon (en URL-klient; legg til headeren bare når et token er satt):

seg-a683980168f7 = Docker

seg-81df4f5cd02e = Inne i containeren må serveren lytte på <c1/>, så den trenger <c2/> og tokenet. Å publisere porten som <c3/> holder den på din maskin; fjern <c4/> bare når du mener å eksponere den, og terminer da TLS foran den. Maler for <c5/>, Fly.io og Cloud Run finnes i <a1><c6/></a1>.

seg-8b8bef7174e8 = Maler (du distribuerer dem selv; Kshana kjører ingen)

seg-198bea1e0595 = <a1><c1/></a1>: sett tokenet med <c2/>

seg-c33701cb9ca2 = <a1><c1/></a1>: hent tokenet fra Secret Manager

seg-b86ddb72b916 = Hver av dem kjører det publiserte bildet, setter <c1/> til plattformens vertsnavn som du erstatter i filen, og er avhengig av plattformen for HTTPS.

seg-ce3a5326cb95 = Sett en CPU- og minnegrense på plattformen

seg-e1fc13672597 = Tidsavbruddet, puljen og budsjettet begrenser hvor mye arbeid som slippes inn, men ett innsluppet kall kan likevel bruke en kjerne lenge, og et stort resultat kan bruke hundrevis av megabyte. Sett også en hard grense på containeren: malene ber om { "2" } CPU-er og { "1" } GiB (<c1/> og <c2/> i Compose, <c3/> i Fly, <c4/> i Cloud Run). Hold <c5/> på eller under antall CPU-er.

seg-058781b052c4 = Hva den ikke er

seg-90edc7ff2a55 = Ikke en tjeneste for flere leietakere. Alle som har tokenet kjører simuleringer på maskinvaren din; det finnes ingen kvoter per bruker utover grensene ovenfor.

seg-5b3b9c610f31 = Veiledende, ikke typegodkjent navigasjonsutstyr: operatøren er fortsatt ansvarlig for navigasjonen. Simulatorens utdata er modellerte eller validerte tall for analyse, som overalt ellers i Kshana.

seg-c33947d44b06 = <s1>Forrige</s1>MCP-server: alle installasjonskanaler

seg-a9d67efe493a = <s1>Neste</s1>Bruke Kshana fra en agent
