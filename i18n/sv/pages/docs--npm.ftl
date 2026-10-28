# docs--npm: translations (sv)

seg-3d770dd786e4 = Användning

seg-d4a762001549 = Licens

seg-81a87d14efda = Kshana: märket, ett kompassmålkors som markerar det exakta ögonblicket, bredvid ordmärket kshana

seg-0ddcab84868f = Källa: <c1/>

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>det precisa ögonblicket</em></b><br/> En simulator med öppen källkod för PNT-resiliens (positionering, navigering och tidssynkronisering).

seg-3b861b2f08b8 = Utgåva v{ $version }

seg-6a1906d8d4ad = Cirka { "95" } % radtäckning, med spärr vid { "85" } % i kontinuerlig integration

seg-a9f4f2795fb5 = Licens: AGPL-3.0-only, eller en kommersiell licens

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Öva på minuten då GNSS går i mörker: Kshanas uppdragskonsol, ritad utifrån en verklig körning av motorn, en kedjad kampanj med jamming, spoofing, holdover och integritet över de { "102" } satelliterna i GPS, Galileo, BeiDou och GLONASS

seg-d1153c5e9112 = Öva på minuten då GNSS går i mörker

seg-d284448743af = Kshana spelar upp jamming, spoofing och klock-holdover när GNSS-signaler (Global Navigation Satellite System) fallerar, och talar om hur länge ett system håller tid och position inom sin budget, och vilken klocka eller sensor som ger mest marginal. Det här är WebAssembly-paketet: hela motorn i JavaScript, i webbläsaren eller i Node.js. Varje körning kan återskapas bit för bit utifrån scenariot, fröet och motorversionen.

seg-d1a3f78ad8e0 = Prova först utan att installera något: <a1>Kshana Studio</a1> kör hela motorn i din webbläsare, kompilerad till WebAssembly, och laddar inte upp något.

seg-d662055d817f = Paketet är en ES-modul (ECMAScript, standard-JavaScript) med en WebAssembly-last, byggd för webbläsaren. Initiera den en gång och anropa sedan motorn synkront. Den enda skillnaden mellan webbläsaren och Node.js är hur WebAssembly-binären läses in.

seg-0b750617ea08 = <b>I webbläsaren</b> (via en bundlare, eller en sida som serverar <c1/>) hämtar <c2/> <c3/> från platsen bredvid modulen:

seg-70fc98eb8d2e = <b>I Node.js</b> misslyckas <c1/> med <c2/> (Nodes <c3/> kan inte läsa en lokal fil), så läs binären från disk och lämna den till <c4/>:

seg-2c181d5e0942 = Spara Node.js-versionen som en <c1/>-fil (eller sätt <c2/> i din <c3/>) så att <c4/> fungerar. Därefter är de båda lika:

seg-06eb982ef260 = TypeScript ser typade resultat: <c1/> returnerar en <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> en <c9/> vars <c10/> är unionen <c11/> av alla typer, och <c12/> en <c13/> (eller <c14/> vid lyckat resultat). Varje resultatdokuments egna fält varierar efter typ; <c15/> typar det gemensamma höljet (<c16/>, <c17/> och blocket <c18/> med poster av typen <c19/>).

seg-31d983ae7036 = Fyra funktioner till beskriver motorn för ett gränssnitt. <c1/> returnerar ett JSON-objekt från typ till de moduler som dess rader i verifieringsmatrisen nämner, <c2/> ett från typ till de resultatfält som svarar på dess fråga (visningsmetadata; motorn läser det aldrig), <c3/> de signalnamn som <c4/> godtar, och <c5/> en kort syntetisk IQ-scen, förvärvad och spårad i minnet (högst { "0.25" } s, { "1,000,000" } sampel och { "8" } satelliter), med samma svar som det inbyggda bygget.

seg-ceee5ddc0c36 = På WebAssembly-sidan är varje ingångspunkt ett separat anrop: <c1/> (resultatdokumentet som JSON-sträng), <c2/>, <c3/>, <c4/> (scenariots CSV-tabell (kommaseparerade värden) som sträng, eller <c5/> för typer som inte publicerar någon tabell; den kastar ett fel vid ogiltigt scenario), <c6/> (en motorkörning som returnerar <c7/> som JSON-sträng — använd den när du vill ha mer än en utdata, eftersom varje annat anrop kör scenariot på nytt), <c8/> (samma utdata som ett typat objekt, med dokumentet redan tolkat som <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspektion; <c14/> returnerar den tolkade listan), <c15/> / <c16/> — kodeken för delbara länkar (URL, uniform resource locator) som <a1>Kshana Studio</a1> använder för att skicka ett helt scenario fram och tillbaka via adressfältets fragment — och <c17/> / <c18/> / <c19/>, de efemerid-artefakter i SP3-c (revision c av formatet Standard Product { "3" }) och CCSDS (Consultative Committee for Space Data Systems) som kommandoradsverktyget skriver — OMM, Orbit Mean-elements Message, och OEM, Orbit Ephemeris Message — och <c20/>, som bedömer en verklig mottagarlogg beskriven av ett <c21/>-scenario och returnerar <c22/> som JSON-sträng (webbläsaren har inget filsystem, så loggen, och eventuell navigationsfil, måste ligga inline i scenariot som <c23/> eller <c24/>; en <c25/>-tabell lägger till de maritima övervakarna och förtroendepoängen 0-100, endast rådgivande), <c26/> / <c27/> (vilka interoperabilitetsformat ett scenario stöder, utan att köra det, och en export i minnet: <c28/>, <c29/>, <c30/>, <c31/> eller <c32/> som JSON <c33/>, byte-identisk för samma scenario, inget laddas upp), <c34/> (en GeoJSON-rutt skriven in i ett waypoint-spårscenario, kommandoradens <c35/>), <c36/> (körningens tidsserie som en animerad SVG, en enda HTML-spelare eller SVG-bildrutor), <c37/> / <c38/> (de medföljande referensscenarierna och deras TOML), <c39/> (bind en RFC { "3161" }-token till ett bevispaket i minnet; paketet måste fortfarande verifieras, och tidsstämplingsmyndighetens signatur kontrolleras inte), <c40/> (vilka satelliters Galileo-navigeringsdata en I/NAV-sidfil eller en UBX-ström autentiserar, med den betrodda Merkle-roten eller publika nycklar och en valfri oberoende referenstid; den autentiserar data och gör inget anspråk på prestanda mot spoofing; inget laddas upp), <c41/> (ett begränsat NMEA-utdrag poängsatt på det sätt som liveläget poängsätter; ingen grind), <c42/> (ett fartygs NMEA-logg som batchkörning), <c43/> (en förtroendeström eller ett resultat som Prometheus-text, CEF- eller LEEF-syslograder eller en OTLP-nyttolast; inget skickas), <c44/> (kontrollera ett signerat bevispaket; inget laddas upp; paket skapas med kommandoradsverktyget, Python eller MCP), <c45/> (ett scenarios rörelse och händelser som text för en laboratoriesimulator; ingen signal skrivs), <c46/> och <c47/> (vilka rader i offentliga ramverkskrav som resultatdokument ger belägg för, med varje rads lucka; inte ett konstaterande att ett ramverk är uppnått), och <c48/> (ADS-B- eller AIS-CSV-text till en <c49/>-GeoJSON per UTC-dag; endast aggregerat), <c50/> (en rutts andel genom försämrade celler i de kartorna; inte en prognos), <c51/> (syntetisk brygg-NMEA och en instruktörslogg för besättningsutbildning; endast text, aldrig för ett fartygs levande navigationssystem) och sky-geometri-funktionerna <c52/>, <c53/>, <c54/>, <c55/> och <c56/> (vilka satelliter en plats ser när byggnader, kajer eller terräng blockerar en del av himlen, med precisionsförsämring (DOP), den horisontella felellipsen, ett seedat Monte Carlo-moln och ett skyplot som SVG-text; synlighetsbeslutet och ellipsen kontrolleras mot oberoende bibliotek, förinställningarna är representativa geometrier snarare än inmätningar, och en horisontprofil tar bara bort satelliter utan fri sikt och inget mer). Inte i webbläsarbygget: <c57/> med sin grind och TCP-lyssnare, strömmad utbildnings-NMEA och telemetriexportörerna (Prometheus, OpenTelemetry, syslog) är långkörande nätverksprocesser och stannar i kommandoradsverktyget; att skapa ett bevispaket kräver en signeringsnyckel, som hör hemma i kommandoradsverktyget eller Python. Det finns inget <c58/> med ett enda anrop här; den bindningen finns bara i Python-wheelen.

seg-12a295fba8a5 = Varje förmåga i verifieringsmatrisen är märkt <b>validerad</b> (kontrollerad mot en oberoende extern referens), <b>modellerad</b> eller <b>ägd av partner</b>; siffrorna för optiska klockor är rymdmål på markhårdvara (ingen optisk strontiumklocka har flugit). Mognaden är <em>inte</em> enhetlig mellan områden — PNT på jorden är validerad mot verkliga data; navigering i djuprymden och vid Mars är modellerad, där bara byggstenarna (ljustid, planetpositioner) är validerade mot externa referenser; banbestämning (OD) för verkliga djuprymdsuppdrag finns på färdplanen.

seg-3de57431d3e6 = Motorn har { "87" } scenariotyper; <c1/> listar dem med deras fält. Nytt i { "0.38.0" }: <c2/> (GNSS-signaler för rymdfarkoster ovanför, runt och bortom GNSS-banorna) och <c3/> (månens bana och yta som navigerings- och geodetisk infrastruktur), båda MODELLED, och <c4/> (en tidsfelspost mot ITU-T-masker).

seg-68ed88ec0b32 = <b>Spektrum</b>: hur en jammer tar GNSS L-bandet, band för band.

seg-f04a0aeeee33 = <b>Klockor och tidssynkronisering</b>: holdover mot en tröskel, tidsöverföring och telekom-holdover mot maskerna från International Telecommunication Unions standardiseringssektor (ITU-T).

seg-7e38ac603ef2 = <b>Konstellationer runt vilken kropp som helst</b>: täckning, precisionsförsämring (DOP) och tillgänglighet runt jorden, månen eller Mars, och solsystemet vid en epok.

seg-82708b06dcc6 = <b>Navigering i låg omloppsbana</b>: signal, passage och länk, navigeringsmeddelande och en fusionerad positionsbestämning, steg för steg.

seg-e21e9bb02d00 = <b>Kampanjer</b>: ett kedjat uppdrag, ett svep eller en Monte Carlo-ensemble i ett scenario.

seg-ba5057da54e4 = <b>Rapporter, animering och exporter</b>: varje siffra med sin enhet och etikett; en animerad ritning av en körning; SP3 (Standard Product { "3" }), CCSDS-banmeddelanden (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON-, STK- (Systems Tool Kit) och SigMF-filer (Signal Metadata Format).

seg-6b43a8c3031e = En öppen motor i mitten, kshana { $version }, med typad dispatch över { "75" } typer; runt den kommandoraden, Rust-biblioteket, Python, WebAssembly och Kshana Studio, MCP-servern, Docker-avbilden och JetBrains-pluginet; under den Kshana Pro, ett proprietärt lager som beror på den öppna motorn och aldrig forkar den

seg-ea6f46d62e7b = Samma scenariofil ger samma bytes på varje yta. MCP är Model Context Protocol: <a1><c1/></a1> låter en AI-assistent (artificiell intelligens) köra motorn.

seg-f51b0a8cd30e = Sex artiklar på arXiv bygger på den öppna motorn, var och en med kommandot bakom: <a1>arXiv:{ "2606.22054" }</a1> (optimismgapet hos störningsdetektorer), <a2>arXiv:{ "2606.24210" }</a2> (en villkorad skyddsnivå för tidssynkronisering), <a3>arXiv:{ "2607.05415" }</a3> (hur stabilt ett PNT-resiliensvärde är), <a4>arXiv:{ "2607.02566" }</a4> (observerbarhet för stationer på månytan med interferometri med mycket lång baslinje), <a5>arXiv:{ "2607.06212" }</a5> (geometri vid månens sydpol och ytbeacons) och <a6>arXiv:{ "2610.23871" }</a6> (cislunär navigering som ett observerbarhetsproblem: bågens längd, konditionering av Gram-matrisen och Doppler-hävstången). Se <a7>Forskning</a7>.

seg-dad7832bf2d2 = Hela motorn är fri under AGPL-3.0. Kshana Pro, ett proprietärt lager som beror på den öppna motorn och aldrig forkar den, och skräddarsydda studier finns på uppdrag från Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Det finns inga priser; se <a2>docs/PRO.md</a2>.

seg-d217f23af0c2 = Läs mer

seg-0e8320f8ea91 = <b>Hela README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b> (motorn i din webbläsare, som WebAssembly) → <a1>https://kshana.dev</a1>

seg-13426521456e = <b>Förmågor</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>Validering och proveniens</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>Verifieringsmatris</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>Citera</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = Fri och öppen källkod under <b>GNU AGPL-3.0-only</b> (GNU Affero General Public License, endast version { "3" }). En <b>kommersiell licens</b> finns hos <a1>Ashforde® OÜ</a1> (ett estniskt privat aktiebolag; OÜ = osaühing) för sluten integration; se <a2>LICENSING.md</a2>. Professionellt utvecklad och underhållen av Ashforde® OÜ.

seg-4ae905aec2ab = <s1>Föregående</s1>Python-API

seg-8af548581ae9 = <s1>Nästa</s1>Rust-crate
