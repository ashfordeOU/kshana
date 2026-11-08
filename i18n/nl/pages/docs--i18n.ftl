# docs--i18n: translations (nl)

seg-c3c260b7063e = Tests

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Nog niet op GitHub

seg-26b562e7f535 = Bron: <c1/>

seg-60b2e78c882e = Lokalisatie van de engine

seg-7f3a6f2932c2 = De menselijk leesbare tekst van de engine staat in { "17" } talen naast het Engels: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. Engels is de bron; <c1/> is een pseudo-locale die elk bericht van accenten, haakjes en opvulling voorziet, zodat een test kan zien of tekst naar de catalogus is verplaatst. Het framework is <a1>Project Fluent</a1> (<c2/>, <c3/>); de code is <c4/>.

seg-1ed9fde69630 = Wat wordt gelokaliseerd en wat nooit

seg-1cb6eb25338d = Gelokaliseerd (een persoon leest het)

seg-ab884f59f5f3 = Nooit gelokaliseerd (een programma leest het)

seg-dbe9b8a0ed98 = berichten en fouten van de opdrachtregel

seg-711a8e63c1de = JSON-sleutels en -waarden van <c1/> en <c2/>

seg-a4066ef82152 = de samenvattingsregel van elke run

seg-6fbdf82a22dc = CSV-kopteksten en -rijen

seg-8d08a6f5f16f = de tekst van SVG-grafieken (titels, assen, legenda's, bijschriften)

seg-8ad1234dfb18 = bestandsnamen

seg-777c2587e0da = <c1/>: koppen, tabellen, noten, bijschriften

seg-d5cf8d8abe89 = foutcodes (<c1/>)

seg-7ba47f2644f5 = oordeelwoorden (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = de verificatiematrix, definities van eenheden, herkomst

seg-122495009a9c = de beschrijvingen van de scenariosoorten (<c1/>)

seg-c7bc43c1e848 = adviezen, disclaimers en meldingen (<c1/>)

seg-dd0fc888e0dc = dezelfde teksten binnen JSON, die Engels blijven

seg-a236606f1ca1 = <c1/> van de iq-campagne, de vergelijkingspagina van studies, het klassement van de bench, het veerkrachtrapport

seg-4ec45651bd09 = <c1/> van een bewijspakket en de PNG van het observatorium: beide worden in een manifest gehasht (dat van het pakket is ook ondertekend), dus ze worden in het Engels gebouwd, in welke taal dan ook

seg-048b6c3a9f0c = Getallen in menselijke tekst gebruiken het decimaalteken van de taal (een komma in { "15" } van de { "18" } talen; een punt in en, ja, zh-Hans en en-XA). Getallen in machinebestanden gebruiken altijd de punt. Een aantal (een variabele met de naam <c1/>, <c2/>, <c3/>, <c4/> of <c5/>) bereikt Fluent als getal, dus een vertaling mag <c6/> schrijven.

seg-487d6d38fa39 = De taal kiezen

seg-79499bebb806 = Opdrachtregel: <c1/>, daarna <c2/>, <c3/>, <c4/>, <c5/>, daarna Engels. <c6/> is pt-BR; alleen <c7/> is dat van Portugal. <c8/> is vereenvoudigd; traditioneel wordt geweigerd met de lijst van ondersteunde tags.

seg-079f85726238 = Bibliotheek: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> bij <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: een optionele afsluitende <c1/> bij <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> bij <c2/> en <c3/>.

seg-e133ee809c98 = Fouten en hun codes

seg-fac73c5cbbc2 = Elke foutmelding heeft een stabiele code, de bericht-id in hoofdletters (<c1/> is <c2/>), in elke taal gelijk. De Engelse tekst van de opdrachtregel is ongewijzigd. In een andere taal is de regel <c3/>; met <c4/> volgt in elke taal een tweede regel <c5/>. De API geeft <c6/> en <c7/> (<c8/>); MCP-fouten dragen <c9/> als foutgegevens. Vergelijk op de code, nooit op de tekst.

seg-7d731dc5f888 = Hoe een run in een andere taal werkt (de regel van twee keer uitvoeren)

seg-204df30d9ca2 = Een machinebestand mag niet van de taal afhangen. Een run in een andere taal voert het scenario daarom twee keer uit: eenmaal in het Engels, waarvan <c1/>, <c2/> en de CSV de machinebestanden zijn, en eenmaal in de taal van de gebruiker, voor de samenvatting, de grafiek en <c3/>. Engels is één run, byte voor byte wat het eerder was.

seg-b7447d4cd5a8 = Gemeten, native, releasebuild, Engels en daarna <c1/> (seconden): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; elk ander meegeleverd scenario duurt minder dan { "4" } s; de { "173" } scenario's die op het moment van meten waren meegeleverd duurden samen { "64" } s in het Engels. De kosten zijn voor een andere taal precies het dubbele. WebAssembly is niet gemeten (hier geen wasm-bindgen); bij de browserfactor van ongeveer { "4" } is het een minuut voor de langzaamste soort.

seg-cc148fdec7a2 = Een pagina vermijdt het wachten door het Engelse resultaat meteen te tonen en daarna <c1/> aan te roepen: dat is alleen de tweede run, het geeft <c2/> terug, en Studio kan "bezig met vertalen..." zeggen tot het binnenkomt.

seg-cd0360ad624d = <b>Punt voor { "0.41" }: één run.</b> Render beide uit een opname van <c1/>. Het is beoordeeld en niet gebouwd: de resultaten van <c2/> worden na het maken geïnspecteerd, gemeten en gehasht (tekstbreedtes in grafieken, herkomsthashes over uitvoertekst), en <c3/> formatteert op de plek van de aanroep, dus een opname zou plaatsaanduidingen in machinebestanden brengen en hun bytes van de herhaling laten afhangen. Het vraagt <c4/>/<c5/> die tokens teruggeven, een afrondingsstap bij elke schrijver en een bewijs van byte-identiteit per schrijver.

seg-67e04a43cea8 = De wasm-build bevat alleen de Engelse catalogus. De andere zestien zouden elk ongeveer { "150" } kB gzip toevoegen. Een pagina haalt <c1/> op bij een taalkeuze en roept <c2/> aan; als het ophalen of de registratie mislukt, blijft de pagina in het Engels. Native bevatten de opdrachtregel en het Python-wheel alle { "18" }.

seg-9a2f85e7e43c = Grootte, niet-geoptimaliseerde <c1/> uit <c2/> (vóór wasm-bindgen en wasm-opt), basis bc04e98f tegen deze tak: { "18.71" } MB -> { "19.88" } MB ruw, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. De Engelse catalogus is { "521" } kB ruw, { "153" } kB gzip daarvan; de rest is <c3/> en zijn afhankelijkheden. Dit wordt zoals gemeten geaccepteerd.

seg-3ce9aab4916e = De catalogus

seg-fdea76581cd8 = <c1/> bevat de berichten, met id's met het voorvoegsel <c2/>. <c3/> is de bron; de andere bestanden zijn die van de vertalers en kunnen berichten missen (elk valt per bericht terug op het Engels). Aanvullende lijsten in <c4/>: <c5/> (berichten met telvariabelen, voor meervoudsvormen), <c6/> (getallen die als plaatsaanduiding worden doorgegeven), <c7/> (berichten die stukken van een tijdens de run samengestelde zin zijn: samen te voegen tot berichten met een hele zin, nooit om te groeien).

seg-9432bca8a935 = <c1/> bewijst het Engels: elk bericht heeft een vastgelegd origineel sjabloon en wordt precies tot die tekst weergegeven; elke id wordt gebruikt; variabelen komen overeen; de pseudo-locale geeft elk bericht weer. <c2/>, <c3/>, <c4/> dekken de ingangspunten, de beschrijvingen van de soorten en de juridische teksten. <c5/> faalt als een nieuwe stringliteral die een persoon zou lezen de catalogus omzeilt: een toelage per bestand in <c6/>, die mag dalen en nooit stijgen. <c7/> voert hele scenario's uit met een baselinebinary en de huidige en vergelijkt elk uitvoerbestand.

seg-969a4b12b12c = Hoe u een string naar de catalogus verplaatst: <c1/>.

seg-48c3c0ca063d = Afhankelijkheden en licenties

seg-b6c2f08c9a46 = Het framework voegt <c1/> { "0.16" } (Apache-2.0 OR MIT) en <c2/> { "0.9" } (MIT OR Apache-2.0) toe, met hun transitieve crates: <c3/> en <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: het alternatief Apache-2.0 is degene die wordt gebruikt, wat <c9/> toestaat), <c10/> en <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Elk is permissief volgens de lijst <c16/> van <c17/>; <c18/> komt voor in twee versies ({ "1" } en { "2" }), wat <c19/> alleen meldt. De licentielijst is gelezen uit <c20/>; <c21/> is niet geïnstalleerd in de ontwikkelomgeving en draait in de integratie-CI.

seg-6aa2e78078ae = <s1>Vorige</s1>Woordenlijst

seg-670504be0531 = <s1>Volgende</s1>Studiogids
