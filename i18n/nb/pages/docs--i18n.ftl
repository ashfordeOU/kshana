# docs--i18n: translations (nb)

seg-c3c260b7063e = Tester

seg-257c477dc510 = WebAssembly

seg-f942b36a11c4 = Ikke på GitHub ennå

seg-26b562e7f535 = Kilde: <c1/>

seg-60b2e78c882e = Lokalisering av motoren

seg-7f3a6f2932c2 = Motorens tekst som mennesker leser finnes på { "17" } språk ved siden av engelsk: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans. Engelsk er kilden; <c1/> er en pseudolokalitet som aksentuerer, setter i klammer og polstrer hver melding, slik at en test kan se om tekst har flyttet til katalogen. Rammeverket er <a1>Project Fluent</a1> (<c2/>, <c3/>); koden er <c4/>.

seg-1ed9fde69630 = Hva som lokaliseres og hva som aldri gjør det

seg-1cb6eb25338d = Lokalisert (et menneske leser det)

seg-ab884f59f5f3 = Aldri lokalisert (et program leser det)

seg-dbe9b8a0ed98 = meldinger og feil på kommandolinjen

seg-711a8e63c1de = JSON-nøkler og -verdier i <c1/> og <c2/>

seg-a4066ef82152 = sammendragslinjen for hver kjøring

seg-6fbdf82a22dc = CSV-topptekster og -rader

seg-8d08a6f5f16f = teksten i SVG-diagrammer (titler, akser, tegnforklaringer, bildetekster)

seg-8ad1234dfb18 = filnavn

seg-777c2587e0da = <c1/>: overskrifter, tabeller, merknader, bildetekster

seg-d5cf8d8abe89 = feilkoder (<c1/>)

seg-7ba47f2644f5 = verdiord (VALIDATED, MODELLED, PARTIAL)

seg-1739c009f155 = verifikasjonsmatrisen, enhetsdefinisjoner, proveniens

seg-122495009a9c = beskrivelsene av scenariotypene (<c1/>)

seg-c7bc43c1e848 = veiledende erklæringer, ansvarsfraskrivelser og merknader (<c1/>)

seg-dd0fc888e0dc = de samme tekstene inne i JSON, som forblir engelske

seg-a236606f1ca1 = <c1/> for IQ-kampanjen, studiesammenligningssiden, bench-ledertavlen, robusthetsrapporten

seg-4ec45651bd09 = <c1/> for en bevispakke og observatoriets PNG: begge hashes inn i et manifest (pakkens er også signert), så de bygges på engelsk uansett språk

seg-048b6c3a9f0c = Tall i tekst som mennesker leser bruker språkets desimaltegn (komma i { "15" } av de { "18" } språkene; punktum i en, ja, zh-Hans og en-XA). Tall i maskinfiler bruker alltid punktum. Et antall (en variabel som heter <c1/>, <c2/>, <c3/>, <c4/> eller <c5/>) når Fluent som et tall, så en oversettelse kan skrive <c6/>.

seg-487d6d38fa39 = Velge språk

seg-79499bebb806 = Kommandolinje: <c1/>, deretter <c2/>, <c3/>, <c4/>, <c5/>, deretter engelsk. <c6/> er pt-BR; bare <c7/> er Portugals. <c8/> er forenklet; tradisjonell avvises med listen over støttede koder.

seg-079f85726238 = Bibliotek: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1df6e0d69fd9 = Python: <c1/> på <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>; <c9/>; <c10/>.

seg-017ca3380cee = WebAssembly: en valgfri avsluttende <c1/> på <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; <c11/>; <c12/>; <c13/>.

seg-3e49c408ad12 = MCP: <c1/> på <c2/> og <c3/>.

seg-e133ee809c98 = Feil og kodene deres

seg-fac73c5cbbc2 = Hver feilmelding har en stabil kode, meldings-id-en med store bokstaver (<c1/> er <c2/>), den samme på alle språk. Engelsk kommandolinjetekst er uendret. På et annet språk er linjen <c3/>; med <c4/> følger en ekstra linje <c5/> på alle språk. API-et gir <c6/> og <c7/> (<c8/>); MCP-feil bærer <c9/> som feildata. Match på koden, aldri på teksten.

seg-7d731dc5f888 = Hvordan en kjøring fungerer på et annet språk (regelen om dobbel kjøring)

seg-204df30d9ca2 = En maskinfil må ikke avhenge av språket. En kjøring på et annet språk kjører derfor scenarioet to ganger: én gang på engelsk, hvis <c1/>, <c2/> og CSV er maskinfilene, og én gang på brukerens språk, for oppsummeringen, diagrammet og <c3/>. Engelsk er én kjøring, byte for byte som den var før.

seg-b7447d4cd5a8 = Målt, nativt, release-bygg, engelsk deretter <c1/> (sekunder): leo-navmsg-fit-interval-trade { "9.2" } -> { "17.9" }, cislunar-arc-recovery { "7.8" } -> { "14.1" }, lunar-station-coverage { "7.8" } -> { "15.0" }, clock-ensemble { "5.8" } -> { "11.6" }, leo-navmsg-model-comparison { "5.1" } -> { "10.5" }, leo-ppp-convergence { "2.8" } -> { "6.2" }; hvert annet medfølgende scenario er under { "4" } s; de { "173" } scenarioene som var medfølgende da dette ble målt, tok { "64" } s på engelsk til sammen. Kostnaden er nøyaktig det dobbelte for et annet språk. WebAssembly ble ikke målt (ingen wasm-bindgen her); med nettleserfaktoren på omtrent { "4" } er det ett minutt for den tregeste typen.

seg-cc148fdec7a2 = En side unngår ventetiden ved å vise det engelske resultatet med en gang og kalle <c1/> etterpå: det er den andre kjøringen alene, den returnerer <c2/>, og Studio kan si «oversetter...» til den kommer.

seg-cd0360ad624d = <b>Punkt for { "0.41" }: én kjøring.</b> Gjengi begge fra en post av <c1/>. Det ble vurdert og ikke bygget: resultater fra <c2/> inspiseres, måles og hashes etter at de er laget (tegnbredder i diagramtekst, proveniens-hasher over utdatatekst), og <c3/> formaterer ved kallstedet, så en post ville satt plassholder-tokens inn i maskinfiler og latt bytene deres avhenge av avspillingen. Den trenger <c4/>/<c5/> som returnerer tokens, en ferdigstiller ved hver skriver og et bevis på byte-identitet per skriver.

seg-67e04a43cea8 = Wasm-bygget bygger inn bare den engelske katalogen. De andre seksten ville lagt til omtrent { "150" } kB gzip hver. En side henter <c1/> ved et språkvalg og kaller <c2/>; hvis hentingen eller registreringen feiler, forblir siden på engelsk. Nativt bygger kommandolinjen og Python-wheelen inn alle { "18" }.

seg-9a2f85e7e43c = Størrelse, uoptimalisert <c1/> fra <c2/> (før wasm-bindgen og wasm-opt), base bc04e98f mot denne grenen: { "18.71" } MB -> { "19.88" } MB rå, { "5.43" } MB -> { "5.79" } MB gzip, +{ "357" } kB gzip. Den engelske katalogen er { "521" } kB rå, { "153" } kB gzip av det; resten er <c3/> og avhengighetene. Dette er godtatt slik det ble målt.

seg-3ce9aab4916e = Katalogen

seg-fdea76581cd8 = <c1/> holder meldingene, id-er med prefikset <c2/>. <c3/> er kilden; de andre filene tilhører oversetterne og kan mangle meldinger (hver faller tilbake til engelsk per melding). Følgelister i <c4/>: <c5/> (meldinger med telleregenskaper, for flertallsformer), <c6/> (tall sendt som plassholdere), <c7/> (meldinger som er deler av en setning satt sammen ved kjøring: skal slås sammen til hele setningsmeldinger, aldri vokse).

seg-9432bca8a935 = <c1/> beviser engelsk: hver melding har en registrert opprinnelig mal og gjengis til nøyaktig den teksten; hver id er brukt; variabler stemmer; pseudolokaliteten gjengir hver melding. <c2/>, <c3/>, <c4/> dekker inngangspunktene, typebeskrivelsene og de juridiske tekstene. <c5/> feiler hvis en ny strenglitteral som et menneske ville lese omgår katalogen: kvote per fil i <c6/>, som kan synke og aldri stige. <c7/> kjører hele scenarioer med en grunnlinjebinær og den nåværende og sammenligner hver utdatafil.

seg-969a4b12b12c = Hvordan flytte en streng inn i katalogen: <c1/>.

seg-48c3c0ca063d = Avhengigheter og lisenser

seg-b6c2f08c9a46 = Rammeverket legger til <c1/> { "0.16" } (Apache-2.0 OR MIT) og <c2/> { "0.9" } (MIT OR Apache-2.0), med deres transitive crates: <c3/> og <c4/> (Apache-2.0 OR MIT), <c5/> (Apache-2.0 OR MIT), <c6/> (Apache-2.0/MIT), <c7/> (MIT/Apache-2.0), <c8/> (Apache-2.0 OR GPL-2.0-only: Apache-2.0-alternativet er det som brukes, som <c9/> tillater), <c10/> og <c11/> (Unicode-3.0), <c12/>, <c13/>, <c14/>, <c15/> (MIT OR Apache-2.0). Hver av dem er permissiv under listen <c16/> i <c17/>; <c18/> forekommer i to versjoner ({ "1" } og { "2" }), som <c19/> bare rapporterer. Lisenslisten ble lest fra <c20/>; <c21/> er ikke installert i utviklingsmiljøet der dette ble skrevet og kjører i integrasjons-CI-en.

seg-6aa2e78078ae = <s1>Forrige</s1>Ordliste

seg-670504be0531 = <s1>Neste</s1>Studio-veiledning
