# docs--reproducibility: translations (da)

seg-03cb5fb3dd8f = Ja

seg-a7d5633dbcc0 = Reproducerbarhed og proveniens

seg-ab939e90efad = Kilde: <c1/>

seg-1c48a3edda84 = Kshana er bygget til at kunne reproduceres: de samme input giver de samme resultater, og buildartefakterne kan spores tilbage til den kilde, der frembragte dem. Dette dokument angiver præcist, hvad der garanteres, hvad der ikke garanteres, og hvordan garantierne håndhæves.

seg-95b0eba44abe = Determinismegarantier

seg-1f637144697d = Motoren har intet vægur, ingen afhængighed af tråden for udførelsen og ingen frøløs tilfældighed. Hver stokastisk proces drives af en <c1/>-strøm, der er nøglet til scenariets <c2/> og trukket i en fast rækkefølge. Konsekvenser:

seg-14df30025491 = Egenskab

seg-f0badf8cb640 = Garanteret

seg-9f6678ac42f5 = Håndhæves af

seg-cfc934af2c75 = Samme scenarie, samme maskine → byte-identisk <c1/>

seg-917da569fdd7 = <c1/> (kører referencescenariet to gange og sammenligner SHA-256 (SHA: Secure Hash Algorithm))

seg-27351cbdc2b5 = Samme scenarie → identiske kvalitetsmål felt for felt

seg-bdeaf344acf8 = Ja, for hver platform

seg-debbc6540baf = <c1/> fastlåser hvert kvalitetsmål (FoM) for de fire referencescenarier

seg-f7c5427c88f9 = Scenariets inputhash (<c1/>) er uafhængig af platform

seg-2bdf4b2d80be = indholdsadresseret SHA-256 af det kanoniske scenarie, fastlåst i <c1/>

seg-45861afe0994 = Inputfingeraftryk + outputtets <b>form</b> identiske på tværs af OS (operativsystem)

seg-49345663b97c = <c1/> fastlåser en præcis SHA-256 for hvert scenarie (ti scenarier, én <c2/>-fil hver i <c3/>), kontrolleret på 3-OS CI (kontinuerlig integration)-matrixen

seg-e54b5ff80782 = Outputtets <b>værdier</b> stemmer på tværs af OS (ubuntu/macOS/Windows)

seg-271bcbff6287 = Ja, til { "1e-6" }

seg-3c25e00debff = CI-jobbet <c1/> kører <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) og <c4/> på alle tre OS

seg-3876618cc821 = En navigationsbeskedramme for lav jordbane (LEO) er de samme bytes på hver platform og i hver buildprofil, WebAssembly (WASM)-buildet medregnet

seg-8aff3ee31c7e = <c1/> (hver transcendental funktion og hver normalfordelt trækning af typen <c2/> går gennem det rene Rust-crate <c3/>); <c4/> fastlåser en hel ramme uden platformsspærre

seg-69750a5db756 = Seedede indekstrækninger (bootstrap-gentrækning, omrokeringer) er de samme på 32-bit- og 64-bit-mål

seg-01e0601aa7fc = <c1/> trækker altid som <c2/>; fastlåst i <c3/>

seg-e42899fd8a4e = Samme værktøjskæde overalt

seg-0bdd9769d5fb = <c1/> fastlåser kanalen; <c2/> lader buildet fejle ved afdrift; CI og udgivelse fastlåser den samme version

seg-b0a3fd993614 = Samme afhængighedssæt

seg-5a3daf9f0468 = <c1/> er committet, og <c2/> bruges til SBOM (software bill of materials)

seg-3ec3fae0dc5e = Hver kørsel fra kommandolinjen skriver også en reproducerbarhedsoptegnelse ind i sin rapport (<c1/> og <c2/>): motorversionen, SHA-256 af scenariefilen og af resultatdokumentet, seed, platformen og den præcise kommando, som <c3/> genkører til et byte-identisk resultat. Rapporten er selv en ren funktion af kørslen: to kørsler af <c4/> skriver den samme <c5/> byte for byte. Se <a1>REPORTS.md</a1>.

seg-273a66a3584d = Forbeholdet om tværplatform (og hvordan golden-filer håndterer det)

seg-9f4ec3dc638d = De numeriske resultater er <b>bit-identiske på en given platform</b>, men kan afvige i de sidste få enheder på sidste plads (ULP) <b>mellem</b> platforme. Årsagen er platformens matematikbibliotek: <c1/>, <c2/>, <c3/> og lignende kræves ikke af IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) at være korrekt afrundet, så Linux (glibc, GNU C-biblioteket), macOS og Windows kan hver returnere en forskellig sidste bit. I en lang kørsel akkumuleres disse forskelle på ~{ "1e-16" } til måske ~{ "1e-12" } relativt.

seg-9297c2585419 = To ting gør denne forskel på sidste plads større, end den begynder, og begge er målt og ikke antaget. En <b>adaptiv integrator</b> vælger sit næste trin ud fra fejlskønnet gennem en femte rod, så én enhed på sidste plads ændrer trinfølgen, og de to platforme stemmer derefter kun overens til integrationstolerancen. En <b>iterativ estimator</b> (en mindste kvadraters tilpasning, et filter til banebestemmelse) kan tage en anden vej til konvergens. Typer bygget på en af dem kan afvige mellem platforme med mere end { "1e-6" } i enkelte felter; <c1/> registrerer det samme område for enhedstestene.

seg-c6bd20427abc = <b>Buildprofilen</b> betyder det samme på én maskine. Et optimeret build på macOS slår en sinus og en cosinus af ét argument sammen til ét kald af systemets kombinerede rutine, hvis sinus afviger fra den enkeltstående <c1/> i den sidste bit for { "379" } af { "200 000" } argumenter; et uoptimeret build foretager de to kald. Målt på aarch64 macOS over de { "138" } scenariefiler giver et debug- og et release-build af den samme kilde byte-identiske resultatdokumenter for { "102" }. De øvrige { "36" } afviger på de sidste pladser: { "28" } inden for { "1e-6" }, ét (<c2/>) med { "2.8e-6" }, og syv kampagner kun i digest af deres medlemskørsler; ingen afviger i en mærkat, et antal eller en afgørelse. Garantien om byte-identitet ovenfor gælder derfor for ét build: den samme binære fil to gange.

seg-ff368c627bd2 = De seedede <b>normalfordelte trækninger</b> er en tredje, langt sjældnere kilde: samplerens kald af værtens eksponentialfunktion og logaritme i dens sjældne grene betyder, at omkring én trækning ud af en million afviger i den sidste bit mellem det native og WASM-buildet.

seg-0b7ebca1a5e3 = Hvor et output er <b>diskret</b>, er en forskel på sidste plads slet ikke acceptabel, og typen beregnes med <c1/> i stedet for værtsbiblioteket. Typen <c2/> er den første: dens binære ramme er sendte heltal, og det samme scenarie blev engang kodet til tre forskellige rammer: i et release-build, i et debug-build af den samme kilde og i browseren. Nu er det de samme bytes i alle tre.

seg-1746a0ea22fe = Derfor fastlåser golden-testene <b>ikke</b> én enkelt hash på tværs af platforme af flydende-komma-outputtet — det ville være skrøbeligt og ville få korrekte builds til at fejle på et andet OS. I stedet:

seg-9733b0545768 = <b><c1/></b> fastlåser hvert kvalitetsmål med en relativ tolerance på <c2/> — fire størrelsesordener strammere end enhver reel regression (som flytter en værdi med hele procenter), men langt løsere end udsving i matematikbiblioteket (libm) på tværs af platforme. Felter, der er begrænset af gitteret (holdover-sekunder), og felter, der er nøjagtigt nul, fastlåses præcist.

seg-a3dfe1c26401 = <b><c1/></b> — en indholdshash af <em>inputtene</em> — er uafhængig af platform og fastlåst præcist.

seg-571aea9b8115 = <b><c1/></b> fastlåser en præcis SHA-256, committet for hvert scenarie i <c2/>, over den projektion, der <em>er</em> identisk på tværs af platforme: inputfingeraftrykket plus outputtets <b>form</b> (feltnavne, indlejring, bladtyper, arraylængder — fastlagt af deterministisk gitteraritmetik, aldrig af flydende-komma-værdierne). Det fanger strukturelle regressioner præcist, mens toleranceloftet ovenfor fanger regressioner i værdier.

seg-8543165b0d7d = <b><c1/></b> håndhæver byte-identisk output over to kørsler <em>på den samme maskine</em> (determinismegarantien).

seg-8b8b4ba5de30 = <b>CI-jobbet <c1/></b> kører de fire ovenstående tests (<c2/>, <c3/>, <c4/>, <c5/>) på <b>ubuntu-latest, macos-latest og windows-latest</b>, så reproducerbarhed på tværs af platforme bekræftes ved hvert push — form- og input-golden-filerne præcist, numerikken til { "1e-6" } og SGP4 (Simplified General Perturbations { "4" })-tilstandene til { "2e-5" } km — i stedet for at bygge på ét enkelt OS.

seg-2b9915611f03 = Hvis du skal regenerere de fastlåste tal (for eksempel efter en tilsigtet modelændring), kør hvert referencescenarie og kopiér de udskrevne FoM-værdier ind i <c1/>, og notér derefter ændringen i <c2/>.

seg-9310a7af7ff8 = Software bill of materials (SBOM)

seg-717baa65bbb2 = <c1/> udsender en CycloneDX { "1.5" }-SBOM, der opregner hvert crate, som følger med i en kshana-artefakt, med dets præcise version, kilde og licens. Det er en afhængighedsfri generator bygget på <c2/> (så den virker med kun værktøjskæden), og den gennemløber opløsningsgrafen fra kshana-pakken kun gennem almindelige afhængigheder og build-afhængigheder. Udviklingsafhængigheder (crates, der kun bruges til test, som <c3/>) er udeladt, fordi ingen artefakt indeholder dem.

seg-a7886c557267 = Grafen er foreningsmængden af de featuresæt, som de udleverede artefakter bygges med: standardbuildet (biblioteket og CLI (kommandolinjegrænseflade)), <c1/> (PyPI (Python Package Index)-wheel, hvis <c2/>-kæde er dets grænse til fremmede funktioner) og <c3/> (npm-pakken, som bærer den samme SBOM i sin tarball). Platformsbetingede afhængigheder for hvert mål er medtaget, da wheels udleveres til flere operativsystemer, og npm-pakken har WebAssembly som mål. Ét dokument dækker alle tre artefakter, så for en enkelt af dem er det en overmængde. Det opregner i øjeblikket { "107" } komponenter; antallet er fastlåst i <c4/>. Den selvstændige <c5/>-server har sit eget manifest og er ikke beskrevet af denne SBOM.

seg-4c8948e9ee7d = Outputtet er deterministisk — det samme afhængighedssæt giver et byte-identisk dokument, herunder et serienummer udledt af den sorterede pakkeliste i stedet for af et tidsstempel.

seg-60742bbdc583 = Udgivelsesworkflowet genererer SBOM'en (<c1/>) og vedhæfter den til hver mærket udgivelse; publiceringsworkflowet leverer den også sammen med PyPI-wheels og inde i npm-pakken.

seg-928c3c0108a1 = Buildets proveniens

seg-42752467bfaa = Udgivelsesworkflowet frembringer en SLSA (Supply-chain Levels for Software Artifacts)-attestering af buildets proveniens (<c1/>), der dækker hver fil, det vedhæfter GitHub Release: kommandolinjebinærfilerne for hver platform, serverbinærfilen <c2/>, SBOM'en, valideringsoversigten og <c3/>. En forbruger kan med <c4/> kontrollere, at artefakterne blev bygget af dette repositorys udgivelsesworkflow ud fra denne kilde — og dermed lukke hullet mellem "her er en binær fil" og "her er en binær fil, jeg kan spore til dens kilde". For eksempel for SBOM'en til { "v0.28.0" }:

seg-06515d230d33 = <s1>Forrige</s1>Proveniens

seg-c6dba4e40c76 = <s1>Næste</s1>Funktionskort
