# docs--reproducibility: translations (sv)

seg-03cb5fb3dd8f = Ja

seg-a7d5633dbcc0 = Reproducerbarhet och proveniens

seg-ab939e90efad = Källa: <c1/>

seg-1c48a3edda84 = Kshana är byggt för att vara reproducerbart: samma indata ger samma resultat, och byggartefakterna kan spåras tillbaka till den källkod som producerade dem. Det här dokumentet anger exakt vad som garanteras, vad som inte garanteras och hur garantierna upprätthålls.

seg-95b0eba44abe = Determinismgarantier

seg-1f637144697d = Motorn har ingen väggklocka, inget beroende av exekveringstråd och ingen oseedad slumpmässighet. Varje stokastisk process drivs av en <c1/>-ström som styrs av scenariots <c2/> och dras i fast ordning. Följder:

seg-14df30025491 = Egenskap

seg-f0badf8cb640 = Garanteras

seg-9f6678ac42f5 = Upprätthålls av

seg-cfc934af2c75 = Samma scenario, samma maskin → byte för byte identisk <c1/>

seg-917da569fdd7 = <c1/> (kör referensscenariot två gånger och jämför SHA-256 (SHA: Secure Hash Algorithm))

seg-27351cbdc2b5 = Samma scenario → identiska kvalitetsmått fält för fält

seg-bdeaf344acf8 = Ja, per plattform

seg-debbc6540baf = <c1/> fastlåser varje kvalitetsmått (FoM) för de fyra referensscenarierna

seg-f7c5427c88f9 = Scenariots indatahash (<c1/>) är plattformsoberoende

seg-2bdf4b2d80be = innehållsadresserad SHA-256 av det kanoniska scenariot, fastlåst i <c1/>

seg-45861afe0994 = Indatafingeravtryck + utdatans <b>form</b> identiska över operativsystem

seg-49345663b97c = <c1/> fastlåser en exakt SHA-256 per scenario (tio scenarier, en <c2/>-fil var i <c3/>), kontrollerad på CI-matrisen (kontinuerlig integration) med 3 operativsystem

seg-e54b5ff80782 = Utdatans <b>värden</b> stämmer överens mellan operativsystem (ubuntu/macOS/Windows)

seg-271bcbff6287 = Ja, till { "1e-6" }

seg-3c25e00debff = CI-jobbet <c1/> kör <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) och <c4/> på alla tre operativsystem

seg-3876618cc821 = En navigeringsmeddelanderam för låg omloppsbana (LEO) är samma byte på varje plattform och i varje bygge, WebAssembly-bygget (WASM) inräknat

seg-8aff3ee31c7e = <c1/> (varje transcendent funktion och varje normalavvikelse i typen <c2/> går genom det rena Rust-cratet <c3/>); <c4/> fastlåser en hel ram utan plattformsspärr

seg-69750a5db756 = Seedade indexdragningar (bootstrap-omsampling, blandningar) är desamma på 32-bitars och 64-bitars mål

seg-01e0601aa7fc = <c1/> samplar alltid som <c2/>; fastlåst i <c3/>

seg-e42899fd8a4e = Samma verktygskedja överallt

seg-0bdd9769d5fb = <c1/> fastlåser kanalen; <c2/> låter bygget misslyckas vid avvikelse; CI och utgåva fastlåser samma version

seg-b0a3fd993614 = Samma beroendeuppsättning

seg-5a3daf9f0468 = <c1/> är incheckad och <c2/> används för SBOM (software bill of materials)

seg-3ec3fae0dc5e = Varje körning från kommandoraden skriver också en reproducerbarhetspost i sin rapport (<c1/> och <c2/>): motorversionen, SHA-256 för scenariofilen och för resultatdokumentet, fröet, plattformen och det exakta kommandot, som <c3/> kör om till ett byte för byte identiskt resultat. Rapporten är själv en ren funktion av körningen: två körningar av <c4/> skriver samma <c5/> byte för byte. Se <a1>REPORTS.md</a1>.

seg-273a66a3584d = Förbehållet mellan plattformar (och hur goldens hanterar det)

seg-9f4ec3dc638d = De numeriska resultaten är <b>bitvis identiska på en given plattform</b> men kan skilja sig i de sista enheterna i sista siffran (ULP) <b>mellan</b> plattformar. Orsaken är plattformens matematikbibliotek: <c1/>, <c2/>, <c3/> med flera måste enligt IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) inte vara korrekt avrundade, så Linux (glibc, GNU C-biblioteket), macOS och Windows kan var och en ge en annan sista bit. Under en lång körning ackumuleras dessa skillnader på ~{ "1e-16" } till kanske ~{ "1e-12" } relativt.

seg-9297c2585419 = Två saker gör att skillnaden i sista siffran blir större än den börjar, och båda är uppmätta snarare än antagna. En <b>adaptiv integrator</b> väljer sitt nästa steg utifrån felskattningen genom en femterot, så en enhet i sista siffran ändrar stegföljden och de två plattformarna stämmer då bara överens till integrationstoleransen. En <b>iterativ skattare</b> (en minstakvadratanpassning, ett filter för banbestämning) kan ta en annan väg till konvergens. Typer som bygger på någon av dem kan skilja sig mellan plattformar med mer än { "1e-6" } i enskilda fält; <c1/> registrerar samma förhållande för enhetstesterna.

seg-c6bd20427abc = <b>Byggprofilen</b> spelar roll på samma sätt, på en och samma maskin. Ett optimerat bygge på macOS slår ihop en sinus och en cosinus av samma argument till ett enda anrop av systemets kombinerade rutin, vars sinus skiljer sig från den fristående <c1/> i sista biten för { "379" } av { "200 000" } argument; ett ooptimerat bygge gör de två anropen. Uppmätt på aarch64 macOS över de { "138" } scenariofilerna ger ett debug- och ett release-bygge av samma källkod byte för byte identiska resultatdokument för { "102" }. De övriga { "36" } skiljer sig i de sista siffrorna: { "28" } inom { "1e-6" }, ett (<c2/>) med { "2.8e-6" }, och sju kampanjer bara i kontrollsummorna för sina medlemskörningar; ingen skiljer sig i en etikett, ett antal eller ett utlåtande. Garantin om byte för byte-identitet ovan gäller därför ett bygge: samma binär två gånger.

seg-ff368c627bd2 = De seedade <b>normaldragningarna</b> är en tredje, mycket sällsyntare källa: samplaren anropar värdens exponential- och logaritmfunktion i sina sällsynta grenar, och ungefär en dragning på en miljon skiljer sig i sista biten mellan det inbyggda och WASM-bygget.

seg-0b7ebca1a5e3 = Där en utdata är <b>diskret</b> är en skillnad i sista siffran inte acceptabel alls, och typen beräknas med <c1/> istället för värdbiblioteket. Typen <c2/> är den första: dess binära ram är överförda heltal, och samma scenario kodades en gång till tre olika ramar: i ett release-bygge, i ett debug-bygge av samma källkod och i webbläsaren. Det är nu samma byte i alla tre.

seg-1746a0ea22fe = På grund av detta fastlåser golden-testerna <b>inte</b> en enda hash över plattformar av flyttalsutdata — det skulle vara bräckligt och skulle få ärligt korrekta byggen på ett annat operativsystem att misslyckas. Istället:

seg-9733b0545768 = <b><c1/></b> fastlåser varje kvalitetsmått med en relativ tolerans på <c2/> — fyra storleksordningar snävare än någon verklig regression (som flyttar ett värde med hela procent) men långt mer tillåtande än jitter i matematikbiblioteket (libm) mellan plattformar. Rutnätsbundna fält (holdover-sekunder) och fält som är exakt noll fastlåses exakt.

seg-a3dfe1c26401 = <b><c1/></b> — en innehållshash av <em>indata</em> — är plattformsoberoende och fastlåses exakt.

seg-571aea9b8115 = <b><c1/></b> fastlåser en exakt SHA-256, incheckad per scenario i <c2/>, över den projektion som <em>är</em> identisk mellan plattformar: indatafingeravtrycket plus utdatans <b>form</b> (fältnamn, nästling, bladtyper, arraylängder — fastlagda av deterministisk rutnätsaritmetik, aldrig flyttalsvärdena). Det fångar strukturella regressioner exakt medan toleransfastlåsningarna ovan fångar värderegressioner.

seg-8543165b0d7d = <b><c1/></b> upprätthåller byte för byte identisk utdata mellan två körningar <em>på samma maskin</em> (determinismgarantin).

seg-8b8b4ba5de30 = <b>CI-jobbet <c1/></b> kör de fyra testerna ovan (<c2/>, <c3/>, <c4/>, <c5/>) på <b>ubuntu-latest, macos-latest och windows-latest</b>, så att reproducerbarhet mellan plattformar kontrolleras vid varje push — shape/input-goldens exakt, numeriken till { "1e-6" } och SGP4-tillstånden (Simplified General Perturbations { "4" }) till { "2e-5" } km — istället för att förlita sig på ett enda operativsystem.

seg-2b9915611f03 = Om du behöver generera om de fastlåsta talen (till exempel efter en avsiktlig modelländring), kör varje referensscenario och kopiera de utskrivna FoM-värdena till <c1/>, och notera sedan ändringen i <c2/>.

seg-9310a7af7ff8 = Software bill of materials (SBOM)

seg-717baa65bbb2 = <c1/> skapar en CycloneDX { "1.5" }-SBOM som listar varje crate som ingår i en kshana-artefakt, med exakt version, källa och licens. Det är en beroendefri generator byggd på <c2/> (så den fungerar med enbart verktygskedjan), och den går igenom upplösningsgrafen från paketet kshana via enbart normala beroenden och byggberoenden. Utvecklingsberoenden (crates som bara används i test, till exempel <c3/>) utesluts eftersom ingen artefakt innehåller dem.

seg-a7886c557267 = Grafen är unionen av de funktionsuppsättningar som de levererade artefakterna byggs med: standardbygget (biblioteket och CLI (kommandoradsgränssnitt)), <c1/> (PyPI (Python Package Index)-hjulet, vars <c2/>-kedja är dess gräns mot främmande funktioner) och <c3/> (npm-paketet, som bär samma SBOM i sin tarball). Plattformsvillkorade beroenden för varje mål ingår, eftersom hjulen levereras för flera operativsystem och npm-paketet riktar sig mot WebAssembly. Ett dokument täcker alla tre artefakterna, så för en enskild av dem är det en övermängd. Det listar för närvarande { "107" } komponenter; antalet är fastlåst i <c4/>. Den fristående servern <c5/> har ett eget manifest och beskrivs inte av den här SBOM:en.

seg-4c8948e9ee7d = Utdata är deterministisk — samma beroendeuppsättning ger ett byte för byte identiskt dokument, inklusive ett serienummer som härleds från den sorterade paketlistan istället för från en tidsstämpel.

seg-60742bbdc583 = Utgivningsarbetsflödet genererar SBOM:en (<c1/>) och bifogar den till varje taggad utgåva; publiceringsarbetsflödet levererar den också bredvid PyPI-hjulen och inuti npm-paketet.

seg-928c3c0108a1 = Byggprovenans

seg-42752467bfaa = Utgivningsarbetsflödet producerar ett byggprovenansintyg enligt SLSA (Supply-chain Levels for Software Artifacts) (<c1/>) som täcker varje fil det bifogar till GitHub Release: kommandoradsbinärerna för varje plattform, serverbinären <c2/>, SBOM:en, valideringssammanfattningen och <c3/>. En konsument kan med <c4/> verifiera att artefakterna byggdes av det här repositoriets utgivningsarbetsflöde från den här källkoden — vilket stänger glappet mellan "här är en binär" och "här är en binär som jag kan spåra till dess källkod". Till exempel för SBOM:en för { "v0.28.0" }:

seg-06515d230d33 = <s1>Föregående</s1>Provenans

seg-c6dba4e40c76 = <s1>Nästa</s1>Förmågekarta
