# docs--studio: translations (da)

seg-c3c260b7063e = Tests

seg-ca497f6e51d4 = Kilde: <c1/>

seg-256705861db0 = Webstedet kshana.dev

seg-82b7ed4e70af = <c1/> er det træ, som GitHub Pages serverer som <a1>https://kshana.dev</a1>: siderne (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), dokumentationen under <c8/> og Kshana Studio under <c9/> (serveret på <a2>https://kshana.dev/studio/</a2>), appen, der kører motoren i browseren som WebAssembly (WASM) uden serverside-beregning og uden at noget uploades. Studio har to visninger af én motor: den enkle visning (<c10/>, svaret først i almindelige ord) og den avancerede visning (<c11/>, det fulde dashboard), som deler den enkle visnings motor, worker, moduler og data gennem <c12/>.

seg-2b76ce9ee32c = Siden { "0.35.0" } har Studio fire visninger mere, hver sin egen side med <c1/>, ingen søgeindeksering og en mappe med syntetiske eksempler, som dens test læser:

seg-e3d0762bb726 = <c1/>: den maritime tillidsvisning, en modtagertillidsscore for et fartøjs positionsstrøm, med et demospor i <c2/>.

seg-e608cdeac977 = <c1/>: mandskabets træningsdebriefing, der afspiller syntetisk NMEA med en hændelse med jamming, drag-off, tidsspoofing eller replay (<c2/>).

seg-f2ce6a93a58d = <c1/>: interferenskortet og ruteeksponeringen (<c2/>).

seg-3f6cf51eb439 = <c1/>: én side med værktøjskort med eksempler (<c2/>, <c3/>), herunder signerede bevispakker (<c4/>), eksport til test-bench (<c5/>), compliance-kortlægning (<c6/>), verifikation af Galileo OSNMA (<c7/>) og AI-assistentkanalerne (<c8/>).

seg-fb02aba9149f = Hvor filerne kommer fra

seg-a58fb92bab82 = Tre slags filer ligger her, og de ændres på tre forskellige måder.

seg-d404d216114c = <b>Porterede filer.</b> Siderne, <c1/>, <c2/>, <c3/>, <c4/>, webstedets data i <c5/> (<c6/>, <c7/>, <c8/>) og alt under <c9/> skrives af <c10/> ud fra en webstedsbuild og Studios kildekode. <c11/> opregner hver enkelt med dens SHA-256-kontrolsum (Secure Hash Algorithm, 256-bit). <b>Redigér dem ikke her</b>: <c12/> fejler ved en manuel redigering. Ret kilden og kør porteringen igen:

seg-b681e66130e5 = Porteringen er deterministisk: en anden kørsel skriver intet, og <c1/> afslutter med { "1" }, hvis <c2/> ikke er det, porteringen ville skrive. Den fører webstedsbuildets crawlfiler uændret over (hver sides canonical-, social-card- og schema.org-tags, <c3/>, <c4/>, <c5/>, <c6/>), kontrollerer dem, skriver <c7/>, <c8/> og videresendelsessiden på Studios gamle adresse (<c9/>, til <c10/>), og peger hver side mod de lokale skrifttyper og scriptbiblioteker (nedenfor).

seg-9be72ec8d40e = <b>Filer, som <c1/> ejer.</b> Det er kilder i sig selv, og porteringen rører dem aldrig:

seg-23b6ea71fede = <c1/> er den strukturerede kilde til funktionskortene og standardgitteret. <b>Redigér den, ikke HTML'en.</b>

seg-e1ee8cd0af21 = <c1/> er genereret (<c2/>) og fastholdt af <c3/>; redigér den ikke i hånden. <c4/>, <c5/> og <c6/> er håndvedligeholdte afbildninger, som den samme test kontrollerer mod den genererede matrix. Studios kopier under <c7/> er disse filer, byte for byte.

seg-8901229c76ba = <c1/>, <c2/> og <c3/> er socialkortet (<c4/>).

seg-89d78af0258c = <c1/> og <c2/>: de skrifttypefiler og det scriptbibliotek, siderne bruger, hentet én gang af <c3/> og indskrevet (se "Ingen tredjepartsanmodninger").

seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> og <c5/>.

seg-5071806d230f = <b>Build-output</b>, git-ignoreret og produceret af <c1/>: <c2/> (pakken <c3/>, som også er det, npm-pakken bygges af), <c4/> (den samme pakke, hvor Studio importerer den) og <c5/> (hvert referencescenarie, på den adresse, det tidligere enkeltsides-websted serverede dem fra).

seg-5042f55f78b5 = Byg og server lokalt

seg-f393a52f7794 = Uden WASM-værktøjskæden lægger <c1/> en eksisterende pakke klar i stedet for at kompilere en. Pages-workflowet bruger aldrig det.

seg-35094cb7ed04 = Hvert modul i <c1/> er ren logik med en tilhørende <c2/>; Studios DOM-drivere (Document Object Model, sidens elementtræ) er <c3/> (den enkle visning) og <c4/> (den avancerede visning). Kontinuerlig integration kører hver af disse som sit eget trin og fejler, hvis en testfil under <c5/> ikke har noget trin.

seg-ba24be498f87 = Ingen tredjepartsanmodninger

seg-7215806f98d4 = kshana.dev serverer sine egne skrifttyper, typografiark og scripts. En side sender ingen anmodning til en skrifttypevært eller en scriptvært, så en besøgendes adresse ikke udleveres til en.

seg-30fc8da50592 = Webstedet og Studio er skrevet mod Google Fonts og en scriptvært. Porteringen erstatter hver sides Google Fonts-link med det tilsvarende typografiark i <c1/> (de samme <c2/>-regler og de samme skrifttypefiler, hver delmængde, så tekst vises som før) og hver scriptvært-adresse med filen under <c3/>. <c4/> og <c5/> registrerer, hvor hver fil kom fra, og dens kontrolsum; skrifttyperne er under SIL Open Font License (<c6/>) og three.js under MIT-licensen (<c7/>).

seg-68a02a54db3b = <c1/> er det eneste trin, der bruger netværket. Kør det kun igen, når en side beder om et skrifttypesæt eller en biblioteksversion, som ikke er her: porteringen afviser og siger det. <c2/> fejler, hvis en porteret side, et typografiark eller et script navngiver en skrifttypevært eller indlæser noget fra en anden vært.

seg-4ff8a4accad4 = Siden { "404" }

seg-763503746a48 = GitHub Pages besvarer en manglende adresse med <c1/> og status { "404" }. Porteringen laver den side ud fra forsidens egen skal (navigation, fod, søgning) omkring en kort meddelelse med links til Home, Docs og Studio. Hver adresse i den er skrevet fra webstedets rod, fordi den serveres på enhver dybde.

seg-9126631f595b = Gamle adresser

seg-a64ed190233a = Indtil { "v0.28.0" } var webstedet én side, og alt lå bag et fragment på <c1/> (<c2/>, <c3/>, delingslinks som <c4/>, indlejringer som <c5/>; et indlejringslinks gamle fanenavn, såsom <c6/>, åbner den Studio-fane, der afløste det). <c7/> opregner hver sådan adresse, som publiceret materiale bruger, og hvor den nu lander; forsiden indlæser <c8/>, genereret ud fra den liste, for at sende dem dertil. Tilføj et tilfælde til listen, før en adresse udfases.

seg-a9db9b0675e2 = Udrulning

seg-0316a3f12053 = GitHub Actions-workflowet <c1/> udruller et release-tag, ikke <c2/>: <c3/> udløser det, når en udgivelse er publiceret, og en manuel udløsning udruller et navngivet tag igen. Det kører <c4/>, stager <c5/> uden testene, build-scriptet, <c6/>, manifestet og denne fil og publicerer resultatet på GitHub Pages.

seg-6aa2e78078ae = <s1>Forrige</s1>Ordliste

seg-419353a4fb30 = <s1>Næste</s1>Vejledninger

seg-74dc3fad6ee7 = <s1>Forrige</s1>Sprog
