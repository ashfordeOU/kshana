# docs--i18n: translations (da)

seg-c3c260b7063e = Tests

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Endnu ikke på GitHub

seg-26b562e7f535 = Kilde: <c1/>

seg-60b2e78c882e = Lokalisering af motoren

seg-7f3a6f2932c2 = Motorens tekst til mennesker findes på { "17" } sprog ved siden af engelsk: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. Engelsk er kilden; <c1/> er en pseudolokalitet, der sætter accenter, parenteser og polstring på hver meddelelse, så en test kan se, om tekst er flyttet til kataloget. Rammen er <a1>Project Fluent</a1> (<c2/>, <c3/>); koden er <c4/>.

seg-1ed9fde69630 = Hvad der lokaliseres, og hvad der aldrig gør

seg-1cb6eb25338d = Lokaliseret (et menneske læser det)

seg-ab884f59f5f3 = Aldrig lokaliseret (et program læser det)

seg-dbe9b8a0ed98 = meddelelser og fejl på kommandolinjen

seg-711a8e63c1de = JSON-nøgler og -værdier i <c1/> og <c2/>

seg-a4066ef82152 = oversigtslinjen for hver kørsel

seg-6fbdf82a22dc = CSV-overskrifter og -rækker

seg-8d08a6f5f16f = teksten i SVG-diagrammer (titler, akser, signaturer, billedtekster)

seg-8ad1234dfb18 = filnavne

seg-777c2587e0da = <c1/>: overskrifter, tabeller, noter, billedtekster

seg-d5cf8d8abe89 = fejlkoder (<c1/>)

seg-7ba47f2644f5 = dommeord (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = verifikationsmatricen, definitioner af enheder, proveniens

seg-122495009a9c = beskrivelserne af scenarietyperne (<c1/>)

seg-c7bc43c1e848 = vejledende erklæringer, ansvarsfraskrivelser og meddelelser (<c1/>)

seg-dd0fc888e0dc = de samme tekster i JSON, som forbliver engelske

seg-a236606f1ca1 = <c1/> for iq-kampagnen, undersøgelsens sammenligningsside, bench-ranglisten, resiliensrapporten

seg-4ec45651bd09 = <c1/> for en bevispakke og observatoriets PNG: begge hashes ind i et manifest (pakkens er også signeret), så de bygges på engelsk, uanset sproget

seg-048b6c3a9f0c = Tal i tekst til mennesker bruger sprogets decimaltegn (et komma i { "15" } af de { "18" } sprog; et punktum i en, ja, zh-Hans og en-XA). Tal i maskinfiler bruger altid punktum. Et antal (en variabel med navnet <c1/>, <c2/>, <c3/>, <c4/> eller <c5/>) når Fluent som et tal, så en oversættelse kan skrive <c6/>.

seg-487d6d38fa39 = Valg af sprog

seg-79499bebb806 = Kommandolinje: <c1/>, derefter <c2/>, <c3/>, <c4/>, <c5/> og så engelsk. <c6/> er pt-BR; kun <c7/> er Portugals. <c8/> er forenklet; traditionel afvises med listen over understøttede koder.

seg-079f85726238 = Bibliotek: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> på <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: en valgfri afsluttende <c1/> på <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> på <c2/> og <c3/>.

seg-e133ee809c98 = Fejl og deres koder

seg-fac73c5cbbc2 = Hver fejlmeddelelse har en stabil kode, meddelelsens id med store bogstaver (<c1/> er <c2/>), den samme på alle sprog. Engelsk kommandolinjetekst er uændret. På et andet sprog er linjen <c3/>; med <c4/> følger en anden linje <c5/> på alle sprog. API'et giver <c6/> og <c7/> (<c8/>); MCP-fejl bærer <c9/> som fejldata. Match på koden, aldrig på teksten.

seg-7d731dc5f888 = Hvordan en kørsel fungerer på et andet sprog (reglen om at køre to gange)

seg-204df30d9ca2 = En maskinfil må ikke afhænge af sproget. En kørsel på et andet sprog udfører derfor scenariet to gange: én gang på engelsk, hvis <c1/>, <c2/> og CSV er maskinfilerne, og én gang på brugerens sprog, til oversigten, diagrammet og <c3/>. Engelsk er én kørsel, byte for byte som før.

seg-b7447d4cd5a8 = Målt, native, release-build, engelsk derefter <c1/> (sekunder): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; hvert andet medfølgende scenarie er under { "4" } s; de { "173" } scenarier, der var medfølgende, da dette blev målt, tog tilsammen { "64" } s på engelsk. Omkostningen er nøjagtigt det dobbelte for et andet sprog. WebAssembly blev ikke målt (ingen wasm-bindgen her); ved browserfaktoren på omkring { "4" } er det et minut for den langsomste type.

seg-cc148fdec7a2 = En side undgår ventetiden ved at vise det engelske resultat med det samme og kalde <c1/> bagefter: det er den anden kørsel alene, den returnerer <c2/>, og Studio kan sige "oversætter..." indtil den kommer.

seg-cd0360ad624d = <b>Punkt for { "0.41" }: én kørsel.</b> Gengiv begge ud fra en optagelse af <c1/>. Det blev vurderet og ikke bygget: resultater af <c2/> inspiceres, måles og hashes, efter de er lavet (diagramtekstens bredder, proveniens-hashes over outputtekst), og <c3/> formaterer ved kaldestedet, så en optagelse ville lægge pladsholdertokens ind i maskinfiler og gøre deres bytes afhængige af genafspilningen. Det kræver <c4/>/<c5/>, der returnerer tokens, en færdiggører ved hver skriver og et bevis for byte-identitet pr. skriver.

seg-67e04a43cea8 = Wasm-buildet indlejrer kun det engelske katalog. De øvrige seksten ville tilføje omkring { "150" } kB gzip hver. En side henter <c1/> ved et sprogvalg og kalder <c2/>; hvis hentningen eller registreringen fejler, forbliver siden på engelsk. Native, kommandolinjen og Python-wheel indlejrer alle { "18" }.

seg-9a2f85e7e43c = Størrelse, uoptimeret <c1/> fra <c2/> (før wasm-bindgen og wasm-opt), base bc04e98f mod denne gren: { "18.71" } MB -> { "19.88" } MB rå, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. Det engelske katalog er { "521" } kB rå, { "153" } kB gzip heraf; resten er <c3/> og dets afhængigheder. Dette accepteres som målt.

seg-3ce9aab4916e = Kataloget

seg-fdea76581cd8 = <c1/> rummer meddelelserne, id'er med præfikset <c2/>. <c3/> er kilden; de andre filer er oversætternes og kan mangle meddelelser (hver falder tilbage til engelsk pr. meddelelse). Ledsagelister i <c4/>: <c5/> (meddelelser med antalsvariabler, til flertalsformer), <c6/> (tal sendt som pladsholdere), <c7/> (meddelelser, der er stykker af en sætning, som samles under kørsel: skal slås sammen til hele sætninger og må aldrig vokse).

seg-9432bca8a935 = <c1/> beviser engelsk: hver meddelelse har en optaget original skabelon og gengives til nøjagtig den tekst; hvert id bruges; variabler stemmer; pseudolokaliteten gengiver hver meddelelse. <c2/>, <c3/>, <c4/> dækker indgangspunkterne, beskrivelserne af typerne og de juridiske tekster. <c5/> fejler, hvis en ny strengkonstant, som et menneske ville læse, går uden om kataloget: tilladelse pr. fil i <c6/>, som kan falde og aldrig stige. <c7/> kører hele scenarier med en baseline-binær og den aktuelle og sammenligner hver outputfil.

seg-969a4b12b12c = Hvordan man flytter en streng ind i kataloget: <c1/>.

seg-48c3c0ca063d = Afhængigheder og licenser

seg-b6c2f08c9a46 = Rammen tilføjer <c1/> { "0.16" } (Apache-2.0 OR MIT) og <c2/> { "0.9" } (MIT OR Apache-2.0) med deres transitive crates: <c3/> og <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: alternativet Apache-2.0 er det, der bruges, hvilket <c9/> tillader), <c10/> og <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Hver eneste er tilladende under listen <c16/> i <c17/>; <c18/> optræder i to versioner ({ "1" } og { "2" }), som <c19/> kun rapporterer. Licenslisten blev læst fra <c20/>; <c21/> er ikke installeret i udviklingsmiljøet og kører i integrations-CI.

seg-6aa2e78078ae = <s1>Forrige</s1>Ordliste

seg-670504be0531 = <s1>Næste</s1>Studio-vejledning
