# docs--studio: translations (nb)

seg-c3c260b7063e = Tester

seg-ca497f6e51d4 = Kilde: <c1/>

seg-256705861db0 = Nettstedet kshana.dev

seg-82b7ed4e70af = <c1/> er treet GitHub Pages serverer som <a1>https://kshana.dev</a1>: sidene (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), dokumentasjonen under <c8/> og Kshana Studio under <c9/> (servert på <a2>https://kshana.dev/studio/</a2>), appen som kjører motoren i nettleseren som WebAssembly (WASM), uten beregning på tjenersiden og uten opplasting. Studio har to visninger av én motor: den enkle visningen (<c10/>, svaret først i vanlige ord) og den avanserte visningen (<c11/>, hele dashbordet), som deler motor, worker, moduler og data med den enkle visningen gjennom <c12/>.

seg-2b76ce9ee32c = Siden { "0.35.0" } har Studio fire visninger til, hver sin egen side med <c1/>, uten søkeindeksering og med en mappe med syntetiske eksempler som testen leser:

seg-e3d0762bb726 = <c1/>: den maritime tillitsvisningen, en tillitsscore for mottakeren til et fartøys posisjonsstrøm, med et demospor i <c2/>.

seg-e608cdeac977 = <c1/>: mannskapets treningsdebrief, som spiller av syntetisk NMEA med en jamming-, drag-off-, tidsspoof- eller replay-hendelse (<c2/>).

seg-f2ce6a93a58d = <c1/>: interferenskartet og ruteeksponeringen (<c2/>).

seg-3f6cf51eb439 = <c1/>: én side med verktøykort med eksempler (<c2/>, <c3/>), inkludert signerte bevispakker (<c4/>), testbenk-eksporten (<c5/>), compliance-kobling (<c6/>), Galileo OSNMA-verifisering (<c7/>) og kanalene til AI-assistenten (<c8/>).

seg-fb02aba9149f = Hvor filene kommer fra

seg-a58fb92bab82 = Tre typer filer ligger her, og de endres på tre ulike måter.

seg-d404d216114c = <b>Portede filer.</b> Sidene, <c1/>, <c2/>, <c3/>, <c4/>, nettstedsdataene i <c5/> (<c6/>, <c7/>, <c8/>) og alt under <c9/> skrives av <c10/> fra et nettstedsbygg og Studios kilde. <c11/> lister hver eneste med SHA-256-kontrollsummen (Secure Hash Algorithm, 256 bit). <b>Ikke rediger dem her</b>: <c12/> feiler på en manuell endring. Endre kilden og kjør porten på nytt:

seg-b681e66130e5 = Porten er deterministisk: en ny kjøring skriver ingenting, og <c1/> avslutter med { "1" } hvis <c2/> ikke er det porten ville skrevet. Den tar med seg nettstedsbyggets crawl-filer uendret (hver sides canonical-, sosialkort- og schema.org-tagger, <c3/>, <c4/>, <c5/>, <c6/>), kontrollerer dem, skriver <c7/>, <c8/> og videresendingssiden på Studios gamle adresse (<c9/>, til <c10/>), og peker hver side til de lokale skriftene og skriptbibliotekene (nedenfor).

seg-9be72ec8d40e = <b>Filer <c1/> eier.</b> Dette er kilder i egen rett, og porten rører dem aldri:

seg-23b6ea71fede = <c1/> er den strukturerte kilden til funksjonskortene og standardrutenettet. <b>Rediger den, ikke HTML-en.</b>

seg-e1ee8cd0af21 = <c1/> er generert (<c2/>) og festet av <c3/>; ikke rediger den for hånd. <c4/>, <c5/> og <c6/> er manuelt vedlikeholdte koblinger som den samme testen kontrollerer mot den genererte matrisen. Studios kopier under <c7/> er disse filene, byte for byte.

seg-8901229c76ba = <c1/>, <c2/> og <c3/> er det sosiale kortet (<c4/>).

seg-89d78af0258c = <c1/> og <c2/>: skriftfilene og skriptbiblioteket sidene bruker, hentet én gang av <c3/> og sjekket inn (se «Ingen forespørsler til tredjeparter»).

seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> og <c5/>.

seg-5071806d230f = <b>Byggeresultater</b>, git-ignorert og produsert av <c1/>: <c2/> (<c3/>-pakken, som npm-pakken også bygges fra), <c4/> (den samme pakken der Studio importerer den) og <c5/> (hvert referansescenario, på adressen det tidligere enkeltsidenettstedet serverte dem fra).

seg-5042f55f78b5 = Bygg og server lokalt

seg-f393a52f7794 = Uten WASM-verktøykjeden setter <c1/> opp en eksisterende pakke i stedet for å kompilere en. Pages-arbeidsflyten bruker aldri det.

seg-35094cb7ed04 = Hver modul i <c1/> er ren logikk med en tilhørende <c2/>; Studios DOM-drivere (Document Object Model, sidens elementtre) er <c3/> (den enkle visningen) og <c4/> (den avanserte visningen). Kontinuerlig integrasjon kjører hver av disse som et eget trinn og feiler hvis en testfil under <c5/> ikke har noe trinn.

seg-ba24be498f87 = Ingen forespørsler til tredjeparter

seg-7215806f98d4 = kshana.dev serverer sine egne skrifter, stiler og skript. En side sender ingen forespørsel til en skriftvert eller en skriptvert, så besøkerens adresse blir ikke gitt videre til noen.

seg-30fc8da50592 = Nettstedet og Studio er skrevet mot Google Fonts og en skriptvert. Porten erstatter hver sides Google Fonts-lenke med det tilsvarende stilarket i <c1/> (de samme <c2/>-reglene og de samme skriftfilene, alle delsett, slik at tekst gjengis som før) og hver skriptvertadresse med filen under <c3/>. <c4/> og <c5/> registrerer hvor hver fil kom fra og kontrollsummen; skriftene er under SIL Open Font License (<c6/>) og three.js under MIT-lisensen (<c7/>).

seg-68a02a54db3b = <c1/> er det eneste trinnet som bruker nettverket. Kjør det på nytt bare når en side ber om et skriftsett eller en bibliotekversjon som ikke er her: porten avviser og sier fra om det. <c2/> feiler hvis en portet side, et stilark eller et skript nevner en skriftvert eller laster noe fra en annen vert.

seg-4ff8a4accad4 = Siden { "404" }

seg-763503746a48 = GitHub Pages svarer på en manglende adresse med <c1/> og status { "404" }. Porten lager den siden av hjemmesidens eget skall (navigasjon, bunntekst, søk) rundt en kort melding med lenker til forsiden, dokumentasjonen og Studio. Hver adresse i den er skrevet fra nettstedsroten, fordi den serveres på hvilken som helst dybde.

seg-9126631f595b = Gamle adresser

seg-a64ed190233a = Fram til { "v0.28.0" } var nettstedet én enkelt side, og alt lå bak et fragment på <c1/> (<c2/>, <c3/>, delingslenker som <c4/>, innbygginger som <c5/>; et gammelt fanenavn i en innbyggingslenke, for eksempel <c6/>, åpner Studio-fanen som erstattet det). <c7/> lister hver slik adresse som publisert materiale bruker og hvor den havner nå; hjemmesiden laster <c8/>, generert fra den listen, for å sende dem dit. Legg til et tilfelle i listen før en adresse tas ut av bruk.

seg-a9db9b0675e2 = Utrulling

seg-0316a3f12053 = GitHub Actions-arbeidsflyten <c1/> ruller ut en utgivelsesmerkelapp (release tag), ikke <c2/>: <c3/> utløser den når en utgivelse er publisert, og en manuell utløsning ruller ut en navngitt merkelapp på nytt. Den kjører <c4/>, setter opp <c5/> uten testene, byggeskriptet, <c6/>, manifestet og denne filen, og publiserer resultatet til GitHub Pages.

seg-6aa2e78078ae = <s1>Forrige</s1>Ordliste

seg-419353a4fb30 = <s1>Neste</s1>Veiledninger
