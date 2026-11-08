# docs--i18n: translations (sv)

seg-c3c260b7063e = Tester

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Ännu inte på GitHub

seg-26b562e7f535 = Källa: <c1/>

seg-60b2e78c882e = Lokalisering av motorn

seg-7f3a6f2932c2 = Motorns text riktad till människor finns på { "17" } språk vid sidan av engelska: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. Engelska är källan; <c1/> är ett pseudospråk som sätter accenter, hakparenteser och utfyllnad på varje meddelande, så att ett test kan se om text har flyttats till katalogen. Ramverket är <a1>Project Fluent</a1> (<c2/>, <c3/>); koden är <c4/>.

seg-1ed9fde69630 = Vad som lokaliseras och vad som aldrig gör det

seg-1cb6eb25338d = Lokaliseras (en människa läser det)

seg-ab884f59f5f3 = Lokaliseras aldrig (ett program läser det)

seg-dbe9b8a0ed98 = meddelanden och fel på kommandoraden

seg-711a8e63c1de = JSON-nycklar och värden i <c1/> och <c2/>

seg-a4066ef82152 = sammanfattningsraden för varje körning

seg-6fbdf82a22dc = CSV-rubriker och rader

seg-8d08a6f5f16f = texten i SVG-diagram (titlar, axlar, förklaringar, bildtexter)

seg-8ad1234dfb18 = filnamn

seg-777c2587e0da = <c1/>: rubriker, tabeller, anmärkningar, bildtexter

seg-d5cf8d8abe89 = felkoder (<c1/>)

seg-7ba47f2644f5 = utfallsord (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = verifieringsmatrisen, enhetsdefinitioner, proveniens

seg-122495009a9c = beskrivningarna av scenariotyperna (<c1/>)

seg-c7bc43c1e848 = rådgivande uttalanden, friskrivningar och meddelanden (<c1/>)

seg-dd0fc888e0dc = samma texter inuti JSON, som förblir på engelska

seg-a236606f1ca1 = <c1/> för iq-kampanjen, jämförelsesidan för studier, topplistan för bench, resiliensrapporten

seg-4ec45651bd09 = <c1/> för ett bevispaket och observatoriets PNG: båda hashas in i ett manifest (paketets är dessutom signerat), så de byggs på engelska oavsett språk

seg-048b6c3a9f0c = Tal i text för människor använder språkets decimaltecken (ett kommatecken i { "15" } av de { "18" } språken; en punkt i en, ja, zh-Hans och en-XA). Tal i maskinfiler använder alltid punkt. Ett antal (en variabel som heter <c1/>, <c2/>, <c3/>, <c4/> eller <c5/>) når Fluent som ett tal, så en översättning får skriva <c6/>.

seg-487d6d38fa39 = Välja språk

seg-79499bebb806 = Kommandoraden: <c1/>, därefter <c2/>, <c3/>, <c4/>, <c5/>, därefter engelska. <c6/> är pt-BR; bara <c7/> är Portugals. <c8/> är förenklad kinesiska; traditionell avvisas med listan över språkkoder som stöds.

seg-079f85726238 = Bibliotek: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> på <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: ett valfritt avslutande <c1/> på <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> på <c2/> och <c3/>.

seg-e133ee809c98 = Fel och deras koder

seg-fac73c5cbbc2 = Varje felmeddelande har en stabil kod, meddelande-id:t med versaler (<c1/> är <c2/>), densamma på alla språk. Kommandoradens engelska text är oförändrad. På ett annat språk är raden <c3/>; med <c4/> följer en andra rad <c5/> på alla språk. API:et ger <c6/> och <c7/> (<c8/>); MCP-fel bär <c9/> som feldata. Matcha på koden, aldrig på texten.

seg-7d731dc5f888 = Hur en körning fungerar på ett annat språk (regeln om körning två gånger)

seg-204df30d9ca2 = En maskinfil får inte bero på språket. En körning på ett annat språk kör därför scenariot två gånger: en gång på engelska, vars <c1/>, <c2/> och CSV är maskinfilerna, och en gång på användarens språk, för sammanfattningen, diagrammet och <c3/>. Engelska är en körning, byte för byte vad den var tidigare.

seg-b7447d4cd5a8 = Uppmätt, nativt, releasebygge, engelska därefter <c1/> (sekunder): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; varje annat medföljande scenario tar under { "4" } s; de { "173" } scenarier som medföljde när detta mättes tog tillsammans { "64" } s på engelska. Kostnaden är exakt dubbel för ett annat språk. WebAssembly mättes inte (ingen wasm-bindgen här); med webbläsarfaktorn omkring { "4" } blir det en minut för den långsammaste typen.

seg-cc148fdec7a2 = En sida undviker väntetiden genom att visa det engelska resultatet direkt och därefter anropa <c1/>: det är enbart den andra körningen, den returnerar <c2/>, och Studio kan visa "översätter..." tills den kommer.

seg-cd0360ad624d = <b>Punkt för { "0.41" }: en körning.</b> Rendera båda utifrån en post av <c1/>. Det bedömdes och byggdes inte: <c2/>-resultat inspekteras, mäts och hashas efter att de har skapats (bredder på diagramtext, hashar för proveniens över utdatatext), och <c3/> formaterar vid anropsstället, så en post skulle lägga platshållartoken i maskinfiler och göra deras byte beroende av uppspelningen. Det kräver <c4/>/<c5/> som returnerar token, en slutbehandlare vid varje skrivare och ett bevis på byteidentitet för varje skrivare.

seg-67e04a43cea8 = Wasm-bygget bäddar bara in den engelska katalogen. De andra sexton skulle lägga till omkring { "150" } kB gzip vardera. En sida hämtar <c1/> vid ett språkval och anropar <c2/>; om hämtningen eller registreringen misslyckas stannar sidan på engelska. Nativt bäddar kommandoraden och Python-hjulet in alla { "18" }.

seg-9a2f85e7e43c = Storlek, ooptimerad <c1/> från <c2/> (före wasm-bindgen och wasm-opt), bas bc04e98f mot den här grenen: { "18.71" } MB -> { "19.88" } MB rått, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. Den engelska katalogen är { "521" } kB rå, { "153" } kB gzip av den; resten är <c3/> och dess beroenden. Detta godtas som uppmätt.

seg-3ce9aab4916e = Katalogen

seg-fdea76581cd8 = <c1/> innehåller meddelandena, med id:n med prefixet <c2/>. <c3/> är källan; de andra filerna är översättarnas och kan sakna meddelanden (var och en faller tillbaka på engelska per meddelande). Följelistor i <c4/>: <c5/> (meddelanden med antalsvariabler, för pluralformer), <c6/> (tal som skickas som placeables), <c7/> (meddelanden som är delar av en mening som sätts ihop vid körning: ska slås ihop till meddelanden med hela meningar, aldrig bli fler).

seg-9432bca8a935 = <c1/> bevisar engelskan: varje meddelande har en registrerad ursprungsmall och renderas till exakt den texten; varje id används; variablerna stämmer; pseudospråket renderar varje meddelande. <c2/>, <c3/>, <c4/> täcker ingångspunkterna, beskrivningarna av typerna och de juridiska texterna. <c5/> misslyckas om en ny strängliteral som en människa skulle läsa går förbi katalogen: tillåtet antal per fil i <c6/>, som får sjunka och aldrig stiga. <c7/> kör hela scenarier med en baslinjebinär och den aktuella och jämför varje utdatafil.

seg-969a4b12b12c = Hur man flyttar en sträng till katalogen: <c1/>.

seg-48c3c0ca063d = Beroenden och licenser

seg-b6c2f08c9a46 = Ramverket lägger till <c1/> { "0.16" } (Apache-2.0 OR MIT) och <c2/> { "0.9" } (MIT OR Apache-2.0), med sina transitiva crates: <c3/> och <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: alternativet Apache-2.0 är det som används, vilket <c9/> tillåter), <c10/> och <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Alla är permissiva enligt listan <c16/> i <c17/>; <c18/> förekommer i två versioner ({ "1" } och { "2" }), vilket <c19/> bara rapporterar. Licenslistan lästes från <c20/>; <c21/> är inte installerat i skrivmiljön och körs i integrations-CI.

seg-6aa2e78078ae = <s1>Föregående</s1>Ordlista

seg-670504be0531 = <s1>Nästa</s1>Studioguide
