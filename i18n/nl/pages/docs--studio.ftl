# docs--studio: translations (nl)

seg-c3c260b7063e = Tests

seg-ca497f6e51d4 = Bron: <c1/>

seg-256705861db0 = De site kshana.dev

seg-82b7ed4e70af = <c1/> is de boom die GitHub Pages serveert als <a1>https://kshana.dev</a1>: de pagina's (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), de documentatie onder <c8/> en Kshana Studio onder <c9/> (geserveerd op <a2>https://kshana.dev/studio/</a2>), de app die de engine in de browser draait als WebAssembly (WASM), zonder berekeningen op de server en zonder dat er iets wordt geüpload. De Studio heeft twee weergaven van één engine: de eenvoudige weergave (<c10/>, het antwoord eerst in gewone woorden) en de geavanceerde weergave (<c11/>, het volledige dashboard), die engine, worker, modules en gegevens van de eenvoudige weergave deelt via <c12/>.

seg-2b76ce9ee32c = Sinds { "0.35.0" } heeft de Studio vier extra weergaven, elk een eigen pagina met <c1/>, zonder zoekindexering en met een map synthetische voorbeelden die zijn test leest:

seg-e3d0762bb726 = <c1/>: de maritieme vertrouwensweergave, een vertrouwensscore van de ontvanger voor de positiestroom van een vaartuig, met een demotraject in <c2/>.

seg-e608cdeac977 = <c1/>: de nabespreking voor bemanningstraining, waarin synthetische NMEA wordt afgespeeld met een gebeurtenis van jamming, drag-off, tijd-spoofing of replay (<c2/>).

seg-f2ce6a93a58d = <c1/>: de interferentiekaart en de blootstelling van de route (<c2/>).

seg-3f6cf51eb439 = <c1/>: één pagina met hulpmiddelkaarten met voorbeelden (<c2/>, <c3/>), waaronder ondertekende bewijspakketten (<c4/>), de export voor de test-bench (<c5/>), compliance-koppeling (<c6/>), Galileo OSNMA-verificatie (<c7/>) en de kanalen van de AI-assistent (<c8/>).

seg-fb02aba9149f = Waar de bestanden vandaan komen

seg-a58fb92bab82 = Hier staan drie soorten bestanden, en ze worden op drie verschillende manieren gewijzigd.

seg-d404d216114c = <b>Overgenomen bestanden.</b> De pagina's, <c1/>, <c2/>, <c3/>, <c4/>, de sitegegevens in <c5/> (<c6/>, <c7/>, <c8/>) en alles onder <c9/> worden door <c10/> geschreven op basis van een sitebuild en de bron van de Studio. <c11/> vermeldt ze allemaal met hun SHA-256-controlesom (Secure Hash Algorithm, 256-bit). <b>Bewerk ze hier niet</b>: <c12/> faalt bij een handmatige wijziging. Wijzig de bron en voer de overname opnieuw uit:

seg-b681e66130e5 = De overname is deterministisch: een tweede run schrijft niets, en <c1/> sluit af met { "1" } als <c2/> niet is wat de overname zou schrijven. Ze neemt de crawlbestanden van de sitebuild ongewijzigd over (de canonical-, social-card- en schema.org-tags van elke pagina, <c3/>, <c4/>, <c5/>, <c6/>), controleert ze, schrijft <c7/>, <c8/> en de doorverwijspagina op het oude adres van de Studio (<c9/>, naar <c10/>), en laat elke pagina verwijzen naar de lokale lettertypen en scriptbibliotheken (hieronder).

seg-9be72ec8d40e = <b>Bestanden die <c1/> beheert.</b> Dit zijn bronnen op zich en de overname raakt ze nooit aan:

seg-23b6ea71fede = <c1/> is de gestructureerde bron voor de mogelijkhedenkaarten en het standaardenraster. <b>Bewerk die, niet de HTML.</b>

seg-e1ee8cd0af21 = <c1/> wordt gegenereerd (<c2/>) en vastgezet door <c3/>; bewerk het niet met de hand. <c4/>, <c5/> en <c6/> zijn met de hand onderhouden koppelingen die dezelfde test controleert aan de gegenereerde matrix. De kopieën van de Studio onder <c7/> zijn deze bestanden, byte voor byte.

seg-8901229c76ba = <c1/>, <c2/> en <c3/> vormen de social card (<c4/>).

seg-89d78af0258c = <c1/> en <c2/>: de lettertypebestanden en de scriptbibliotheek die de pagina's gebruiken, eenmalig opgehaald door <c3/> en vastgelegd in de repository (zie "Geen verzoeken aan derden").

seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> en <c5/>.

seg-5071806d230f = <b>Buildresultaten</b>, door git genegeerd en geproduceerd door <c1/>: <c2/> (het pakket van <c3/>, waaruit ook het npm-pakket wordt gebouwd), <c4/> (hetzelfde pakket op de plek waar de Studio het importeert) en <c5/> (elk referentiescenario, op het adres waar de eerdere site met één pagina ze vandaan serveerde).

seg-5042f55f78b5 = Lokaal bouwen en serveren

seg-f393a52f7794 = Zonder de WASM-toolchain plaatst <c1/> een bestaand pakket klaar in plaats van er een te compileren. De Pages-workflow doet dat nooit.

seg-35094cb7ed04 = Elke module in <c1/> is zuivere logica met een bijbehorende <c2/>; de DOM-drivers van de Studio (Document Object Model, de elementenboom van de pagina) zijn <c3/> (de eenvoudige weergave) en <c4/> (de geavanceerde weergave). Continuous integration draait elk daarvan als een eigen stap en faalt als een testbestand onder <c5/> geen stap heeft.

seg-ba24be498f87 = Geen verzoeken aan derden

seg-7215806f98d4 = kshana.dev serveert zijn eigen lettertypen, stijlen en scripts. Een pagina doet geen verzoek aan een lettertypehost of scripthost, zodat het adres van een bezoeker niet aan een van beide wordt doorgegeven.

seg-30fc8da50592 = De site en de Studio zijn geschreven voor Google Fonts en een scripthost. De overname vervangt de Google Fonts-link van elke pagina door het bijpassende stylesheet in <c1/> (dezelfde <c2/>-regels en dezelfde lettertypebestanden, elke subset, zodat tekst als voorheen wordt weergegeven) en elk adres van een scripthost door het bestand onder <c3/>. <c4/> en <c5/> leggen vast waar elk bestand vandaan komt en wat zijn controlesom is; de lettertypen vallen onder de SIL Open Font License (<c6/>) en three.js onder de MIT-licentie (<c7/>).

seg-68a02a54db3b = <c1/> is de enige stap die het netwerk gebruikt. Voer haar alleen opnieuw uit als een pagina een lettertypeset of bibliotheekversie vraagt die hier niet is: de overname weigert dan en zegt dat. <c2/> faalt als een overgenomen pagina, stylesheet of script een lettertypehost noemt of iets van een andere host laadt.

seg-4ff8a4accad4 = De { "404" }-pagina

seg-763503746a48 = GitHub Pages beantwoordt een ontbrekend adres met <c1/> en status { "404" }. De overname maakt die pagina uit de eigen schil van de startpagina (navigatie, voettekst, zoeken) rond een kort bericht met links naar Home, Docs en de Studio. Elk adres erin is geschreven vanaf de siteroot, omdat ze op elke diepte wordt geserveerd.

seg-9126631f595b = Oude adressen

seg-a64ed190233a = Tot { "v0.28.0" } was de site één pagina, en alles zat achter een fragment op <c1/> (<c2/>, <c3/>, deellinks als <c4/>, embeds als <c5/>; de oude tabnaam van een embedlink, zoals <c6/>, opent het tabblad van de Studio dat ervoor in de plaats kwam). <c7/> vermeldt elk zulk adres dat gepubliceerd materiaal gebruikt en waar het nu uitkomt; de startpagina laadt <c8/>, gegenereerd uit die lijst, om ze daarheen te sturen. Voeg een geval aan de lijst toe voordat u een adres uit gebruik neemt.

seg-a9db9b0675e2 = Uitrol

seg-0316a3f12053 = De GitHub Actions-workflow <c1/> rolt een releasetag uit, niet <c2/>: <c3/> start haar zodra een release is gepubliceerd, en een handmatige start rolt een benoemde tag opnieuw uit. Ze draait <c4/>, plaatst <c5/> klaar zonder de tests, het buildscript, <c6/>, het manifest en dit bestand, en publiceert het resultaat op GitHub Pages.

seg-6aa2e78078ae = <s1>Vorige</s1>Verklarende woordenlijst

seg-419353a4fb30 = <s1>Volgende</s1>Handleidingen
