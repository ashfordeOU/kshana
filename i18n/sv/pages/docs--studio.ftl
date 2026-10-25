# docs--studio: translations (sv)

seg-c3c260b7063e = Tester

seg-ca497f6e51d4 = Källa: <c1/>

seg-256705861db0 = Webbplatsen kshana.dev

seg-82b7ed4e70af = <c1/> är trädet som GitHub Pages serverar som <a1>https://kshana.dev</a1>: sidorna (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), dokumentationen under <c8/> och Kshana Studio under <c9/> (serverad på <a2>https://kshana.dev/studio/</a2>), appen som kör motorn i webbläsaren som WebAssembly (WASM) utan serverberäkning och utan att något laddas upp. Studio har två vyer av en och samma motor: den enkla vyn (<c10/>, svaret först i klartext) och den avancerade vyn (<c11/>, hela instrumentpanelen), som delar den enkla vyns motor, worker, moduler och data genom <c12/>.

seg-2b76ce9ee32c = Sedan { "0.35.0" } har Studio fyra vyer till, var och en en egen sida med <c1/>, ingen sökindexering och en mapp med syntetiska prover som dess test läser:

seg-e3d0762bb726 = <c1/>: den maritima förtroendevyn, en förtroendepoäng för mottagaren utifrån ett fartygs positionsström, med ett demospår i <c2/>.

seg-e608cdeac977 = <c1/>: besättningsträningens genomgång, som spelar upp syntetisk NMEA med en händelse av typen jamming, drag-off, time-spoofing eller replay (<c2/>).

seg-f2ce6a93a58d = <c1/>: störningskartan och ruttexponeringen (<c2/>).

seg-3f6cf51eb439 = <c1/>: en sida med verktygskort med exempel (<c2/>, <c3/>), inklusive signerade bevispaket (<c4/>), exporten för testbench (<c5/>), compliance-mappning (<c6/>), verifiering av Galileo OSNMA (<c7/>) och kanalerna för AI-assistenten (<c8/>).

seg-fb02aba9149f = Varifrån filerna kommer

seg-a58fb92bab82 = Tre sorters filer finns här, och de ändras på tre olika sätt.

seg-d404d216114c = <b>Portade filer.</b> Sidorna, <c1/>, <c2/>, <c3/>, <c4/>, webbplatsdata i <c5/> (<c6/>, <c7/>, <c8/>) och allt under <c9/> skrivs av <c10/> utifrån ett webbplatsbygge och Studios källkod. <c11/> listar var och en med dess kontrollsumma med SHA-256 (Secure Hash Algorithm, 256 bitar). <b>Redigera dem inte här</b>: <c12/> misslyckas vid en handredigering. Ändra källan och kör porten igen:

seg-b681e66130e5 = Porten är deterministisk: en andra körning skriver ingenting, och <c1/> avslutas med { "1" } om <c2/> inte är vad porten skulle skriva. Den för över webbplatsbyggets crawl-filer oförändrade (varje sidas canonical-, social-card- och schema.org-taggar, <c3/>, <c4/>, <c5/>, <c6/>), kontrollerar dem, skriver <c7/>, <c8/> och vidarebefordringssidan på Studios gamla adress (<c9/>, till <c10/>), och pekar varje sida mot de lokala typsnitten och skriptbiblioteken (nedan).

seg-9be72ec8d40e = <b>Filer som <c1/> äger.</b> Dessa är källor i egen rätt och porten rör dem aldrig:

seg-23b6ea71fede = <c1/> är den strukturerade källan för förmågekorten och standardrutnätet. <b>Redigera den, inte HTML.</b>

seg-e1ee8cd0af21 = <c1/> genereras (<c2/>) och fastlåses av <c3/>; redigera den inte för hand. <c4/>, <c5/> och <c6/> är handunderhållna mappningar som samma test kontrollerar mot den genererade matrisen. Studios kopior under <c7/> är dessa filer, byte för byte.

seg-8901229c76ba = <c1/>, <c2/> och <c3/> är det sociala kortet (<c4/>).

seg-89d78af0258c = <c1/> och <c2/>: de typsnittsfiler och det skriptbibliotek som sidorna använder, hämtade en gång av <c3/> och incheckade (se "Inga förfrågningar till tredje part").

seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> och <c5/>.

seg-5071806d230f = <b>Byggutdata</b>, git-ignorerade och producerade av <c1/>: <c2/> (paketet <c3/>, som också är det npm-paketet byggs från), <c4/> (samma paket där Studio importerar det) och <c5/> (varje referensscenario, på den adress som den tidigare ensidiga webbplatsen serverade dem från).

seg-5042f55f78b5 = Bygg och servera lokalt

seg-f393a52f7794 = Utan WASM-verktygskedjan förbereder <c1/> ett befintligt paket i stället för att kompilera ett. Pages-arbetsflödet använder aldrig det.

seg-35094cb7ed04 = Varje modul i <c1/> är ren logik med ett matchande <c2/>; Studios DOM-drivrutiner (Document Object Model, sidans elementträd) är <c3/> (den enkla vyn) och <c4/> (den avancerade vyn). Kontinuerlig integrering kör vart och ett av dessa som ett eget steg och misslyckas om en testfil under <c5/> saknar steg.

seg-ba24be498f87 = Inga förfrågningar till tredje part

seg-7215806f98d4 = kshana.dev serverar sina egna typsnitt, stilar och skript. En sida gör inga förfrågningar till en typsnittsvärd eller en skriptvärd, så en besökares adress lämnas inte ut till någon.

seg-30fc8da50592 = Webbplatsen och Studio är skrivna mot Google Fonts och en skriptvärd. Porten ersätter varje sidas Google Fonts-länk med motsvarande stilmall i <c1/> (samma regler <c2/> och samma typsnittsfiler, varje delmängd, så att text renderas som förut) och varje adress till skriptvärd med filen under <c3/>. <c4/> och <c5/> anger var varje fil kommer ifrån och dess kontrollsumma; typsnitten omfattas av SIL Open Font License (<c6/>) och three.js av MIT-licensen (<c7/>).

seg-68a02a54db3b = <c1/> är det enda steget som använder nätverket. Kör det igen bara när en sida ber om en typsnittsuppsättning eller en biblioteksversion som inte finns här: porten vägrar och säger det. <c2/> misslyckas om någon portad sida, stilmall eller skript namnger en typsnittsvärd eller laddar något från en annan värd.

seg-4ff8a4accad4 = Sidan { "404" }

seg-763503746a48 = GitHub Pages svarar på en saknad adress med <c1/> och status { "404" }. Porten gör den sidan av startsidans eget skal (navigering, sidfot, sök) runt ett kort meddelande med länkar till Hem, Dokumentation och Studio. Varje adress i den skrivs från webbplatsroten, eftersom den serveras på vilket djup som helst.

seg-9126631f595b = Gamla adresser

seg-a64ed190233a = Fram till { "v0.28.0" } var webbplatsen en enda sida, och allt låg bakom ett fragment på <c1/> (<c2/>, <c3/>, delningslänkar som <c4/>, inbäddningar som <c5/>; en inbäddningslänks gamla flikname, som <c6/>, öppnar den Studioflik som ersatte den). <c7/> listar varje sådan adress som publicerat material använder och var den hamnar nu; startsidan laddar <c8/>, genererad från den listan, för att skicka dem dit. Lägg till ett fall i listan innan du avvecklar någon adress.

seg-a9db9b0675e2 = Distribution

seg-0316a3f12053 = Arbetsflödet <c1/> i GitHub Actions distribuerar en releasetagg, inte <c2/>: <c3/> startar det när en release har publicerats, och en manuell start distribuerar en namngiven tagg på nytt. Det kör <c4/>, lägger <c5/> i mellanlagring utan testerna, byggskriptet, <c6/>, manifestet och den här filen, och publicerar resultatet på GitHub Pages.

seg-6aa2e78078ae = <s1>Föregående</s1>Ordlista

seg-419353a4fb30 = <s1>Nästa</s1>Handledningar
