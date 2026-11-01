# docs--osnma: translations (da)

seg-fcd0ebea49bc = Kommandolinje

seg-6816f4e1a0a0 = Version

seg-94058315dfe4 = Input

seg-23746ba370c2 = Kilde: <c1/>

seg-1e9c104231db = Galileo OSNMA-verifikator på modtagersiden

seg-17fd702f5997 = En verifikator på modtagersiden til Galileo Open Service Navigation Message Authentication (OSNMA), i ren Rust. Den læser I/NAV-sider og rapporterer pr. satellit og pr. epoke, om navigationsdataene er kryptografisk autentificerede, og hvorfor en kontrol fejlede.

seg-ae081f55c4f1 = <b>Vejledende.</b> Dette er analyse- og overvågningsoutput og ikke typegodkendt navigationsudstyr. Den autentificeringsstatus, der rapporteres her, er ikke en navigationsintegritetstjeneste og må ikke være det eneste grundlag for nogen navigations- eller sikkerhedsbeslutning.

seg-84d7260098b1 = BEMÆRK: immaterielle rettigheder i Galileo OSNMA-grænsefladen

seg-6d78ccef53d5 = Kshana giver ingen rettigheder under Den Europæiske Unions immaterielle rettigheder i Galileo OSNMA Signal-in-Space Interface Control Document (de "ICD IPR'er"). ICD'en bærer sin egen tilladelse (dens Annex E), som er ikke-eksklusiv og royaltyfri og har sine egne vilkår, sit eget omfang og sine egne grænser. Enhver, der bruger, bygger eller distribuerer software baseret på dette modul, støtter sig direkte til den tilladelse og skal selv læse og acceptere dens vilkår. Kshanas licens (AGPL-3.0-only eller den kommercielle licens) dækker kun Kshanas egen kode.

seg-c13ad334bf9a = Dette modul implementerer de algoritmer, som dokumenterne nedenfor beskriver. ICD-teksten gengives ikke; talværdier (feltopbygninger, opregninger, MAC-opslagstabellen) er udtrykt igen i Kshanas egen notation, med kilden angivet i koden. ICD'en og Receiver Guidelines er © Den Europæiske Union; kilden anerkendes her. Kshana er ikke udviklet af, brugt af, godkendt af eller støttet af Den Europæiske Union, Europa-Kommissionen, EUSPA eller noget andet organ.

seg-860096b04999 = Referencedokumenter

seg-04c1e1a6278d = Udgivet af European GNSS Service Centre.

seg-278dd0f9df58 = Dokument

seg-3427e40d7bee = Dato

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD ("SIS ICD")

seg-f63fbc1175cf = Issue { "1.1" }

seg-fa85e4db2c93 = oktober { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Issue { "1.3" }

seg-a9b75bc7f063 = januar { "2024" }

seg-530ae6421157 = Afsnits- og tabelnumre, der er citeret i koden og her, henviser til disse versioner.

seg-143726cc3d5f = Hvad der verificeres

seg-029a9bb7608f = Tillidskæden, fra roden ned til dataene:

seg-886f1b6556ce = <b>Offentlig nøgle (ICD { "3.2.2" }, { "6.2" }).</b> En DSM-PKR samles igen af sine blokke, og dens Merkle-sti gennemløbes til en betroet Merkle-rod (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> En DSM-KROOT samles igen; dens ECDSA-signatur (P-256/SHA-256 eller P-521/SHA-512) kontrolleres mod den offentlige nøgle, den nævner, over NMA-headeren og kædeparametrene.

seg-acc1f06cf63a = <b>TESLA-nøgler (ICD { "5.5" }, { "6.4" }).</b> Hver nøgle i en MACK-meddelelse følges tilbage til KROOT eller til en tidligere verificeret nøgle med kædens hashfunktion.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> De fleksible Tag-Info-felter kontrolleres mod MACSEQ med den nøgle, der åbner den pågældende MACK.

seg-41ba810d7c8d = <b>Tags (ICD { "4.2" }, { "6.7" }).</b> Hvert tag beregnes igen (HMAC-SHA-256 eller CMAC-AES, afkortet til kædens taglængde) over satellitidentiteterne, delrammens tid, tagpositionen, NMA-statussen og de navigationsdata, det dækker, og sammenlignes. ADKD { "0" } (efemeride, ur og status), ADKD { "4" } (tidsparametre) og ADKD { "12" } (langsom MAC, nøgle udgivet ti delrammer senere) håndteres, med krydsautentificering af satellitter, der ikke selv bærer OSNMA, og dummytags (COP { "0" }).

seg-1be16a4ca722 = Et tag, der nævner en reserveret værdi, eller hvis ADKD ikke passer til pladsen i MAC-opslagstabellen, lægges til side (Receiver Guidelines siger, at det skal kasseres) og rapporteres som <c1/>, ikke som en fejl.

seg-eb993b3a0d17 = Sider kontrolleres mod deres CRC (Galileos CRC-24Q) før alt andet; en side, der fejler, droppes og rapporteres (<c1/>).

seg-c414a30d0840 = Statusværdier

seg-268f61b565b9 = Pr. tag: <c1/>, <c2/> med en årsag (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> med en årsag (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) eller <c15/>. Et dummytag (COP { "0" }) vises som <c16/> på tagniveau, da det beviser nøglen, men det dækker ingen navigationsdata og tæller aldrig for en satellit.

seg-331a6ab821f3 = Pr. satellit, i den form som modtagertillidsmonitoren bruger:

seg-9912068c5b34 = <c1/> kun så længe de nyeste verificerede efemeride- og urdata (ADKD { "0" } eller

seg-38e7f56293e7 = for den satellit er friske (inden for { "600" } s af verifikatorens tid som standard) og stadig er de data, der bruges. Kontrollen gælder dataene, ikke IODnav: verifikatoren gemmer SHA-256 af den autentificerede bitstreng (Word Types { "1" } til { "5" }, som ADKD { "0" } dækker dem) og af den nyeste sådan streng, satellitten sender, og de skal være ens. Et kopieret IODnav over andre ord eller ændrede Word Type { "5" }-bits (som ikke bærer noget IODnav) giver <c1/>, indtil de nye data autentificeres. En delramme, der bærer efemeridedata, men ikke et komplet sæt af Word Types { "1" } til { "5" } under ét IODnav, fratager statussen på samme måde (hver ægte E1-B-delramme bærer alle fem); en uden efemeridedata overhovedet siger intet. Tags fra en anden satellit (krydsautentificering) tæller for den satellit, hvis data de dækker.

seg-233109ef4428 = <c1/> når en kontrol af satellittens data fejlede inden for fejlhukommelsen ({ "600" } s som standard af verifikatorens tid), selv om senere data verificeres. En uoverensstemmelse lægges til den satellit, hvis data tagget dækker, og til den satellit, der sendte tagget, da begge kan være i fejl; en MACSEQ-uoverensstemmelse lægges til den sendende satellit.

seg-8ba1d89bcf91 = <c1/> ellers og for hver satellit efter en verificeret alarmmeddelelse, med NMA-status "don't use" eller en reserveret status og indtil den første nøgle er verificeret.

seg-7fceea6e23f8 = Den samlede værdi er <c1/>, hvis en satellit fejlede, <c2/>, hvis mindst én er autentificeret og ingen fejlede, ellers <c3/>. <c4/> er den tilsvarende sætning; <c5/> bygger den.

seg-446a3218ccbb = Tid

seg-18e91e6aa160 = Nøglekæden viser, at en nøgle hører til en given delramme, ikke at delrammen er den nuværende. Verifikatoren tager derfor aldrig "nu" fra en uverificeret side. Dens tid er den senere af referencetiden, der er givet med <c1/> (<c2/>), og delrammen for den seneste TESLA-nøgle, der blev verificeret (en nøgle kan ikke kendes før sin slot, så den beviser, at tiden ikke er tidligere). Fejlhukommelse, en autentificerings gyldighedsvindue og bortfald af gamle data kører på den tid. En delramme, der er stemplet mere end tre delrammer efter den seneste verificerede nøgle, lægges til side, medmindre dens egen nøgle beviser dens tid; nøgle- og alarmmeddelelser i den behandles stadig, da de bærer deres eget bevis (en signatur eller Merkle-roden).

seg-318323322a3a = Uret står stille, når OSNMA stopper, da kun nøgler flytter det. En levende kalder skal kalde <c1/> med værtens tid hver delramme; autentificeringen udløber så af sig selv, og <c2/> (kørt med hver delramme) returnerer en <c3/>-hændelse, når ingen nøgle er blevet verificeret i længere tid end autentificeringsvinduet.

seg-5338d8f5de77 = Det, dette ikke giver, er friskhed. Uden en referencetid fra en kilde, en angriber ikke kan flytte, autentificeres en genafspilning af gamle ægte data under gamle stempler, og sidestemplerne er kun så gode som deres kilde: CLI'en siger det (<c1/>), når ingen referencetid er angivet. Med en referencetid er tolerancen under én delramme (standard { "29" } s; større værdier afvises). En referencetid er ét enkelt øjeblik: delrammer, der ligger længere fra den end tolerancen, lægges til side og tælles, så den passer til levende eller netop optagne data, ikke en lang optagelse. For en optagelse udelades referencetiden, og resultatet læses som "autentisk, ikke nødvendigvis frisk". Receiver Guidelines angiver det formelle krav.

seg-aa37ce329914 = Sidestemplerne i en u-blox-strøm kommer fra de uautentificerede data selv (se Input), så de giver heller ingen beskyttelse mod forældelse.

seg-a33d72076025 = Kæder, nøgler og alarmer

seg-be2d9588df65 = Verificerede kæder opbevares efter kæde-id (CID); tags kontrolleres med den kæde, NMA-headeren nævner, og en header, der nævner en kæde, som ikke blev verificeret, lader delrammens tags være ukontrollerede (<c1/>). En anden KROOT for en kæde i kraft tilføjer et anker; en KROOT for en anden kæde opbevares ved siden af, så en ny annoncering af den gamle kæde efter en fornyelse ikke omgør den nye.

seg-bbb6574fa258 = NMA-headeren er ikke autentificeret, så det, den annoncerer, tæller kun, når det bekræftes: når mere end én satellit sender den samme header i en delramme, eller når en verificeret KROOTs signerede meddelelse bærer den (headeren er en del af den meddelelse). De to er ikke lige. Enighed mellem flere satellitter beskytter mod en anomali i én satellit, ikke mod en spoofer: én spoofer kan forfalske to satellit-id'er. Det, den vinder derved, er et tjenestenægtelsesangreb og intet mere, da et bekræftet "don't use" rydder alle satellitters autentificerede data: at ophæve det, forfalsket eller ægte, genopretter intet, før nye tags verificeres under ægte operationelle delrammer. (Før den rydning kunne en forfalsket ophævelse bringe data tilbage, som allerede var autentificeret, i op til autentificeringsvinduet.) Den virkelige bekræftelse er den KROOT-signerede header, som også ophæver et "don't use" igen, når den bærer en operationel status. En enkelt satellits header ændrer kun kontrollen af tags i dens egen delramme. En KROOT, hvis anvendelsestidspunkt ikke er senere end for den kæde, der holdes for samme id (en genafspilning af en ældre), afvises (<c1/>); en KROOT for samme kæde tilføjer et anker.

seg-5c08dbaa8d43 = Den bekræftede headers status og CPKS-værdi styrer tilbagekaldelse. Med NMA-status "don't use" fjerner CPKS "chain revoked" den kæde, headeren nævner, og afviser dens KROOT fra da af; CPKS "public key revoked" fjerner den offentlige nøgle, der signerede den kæde, og hver kæde signeret med den. Hvis erstatningskæden for det id blev taget i brug, før headeren blev bekræftet, uanset hvor længe før, er den tilbagekaldte nøgle den forrige kædes, ikke den nyes; den hukommelse bevares, indtil tilbagekaldelsen er gennemført, eller en anden procedures header bekræftes, og en tilbagekaldelsesheader, der gentages hver delramme, gennemføres én gang. De samme CPKS-værdier med status operationel markerer overgangen til erstatningen og tilbagekalder intet. Headeren er ikke selv autentificeret, så en forfalsket tilbagekaldelse kan kun tage autentificeringen væk, og den er endelig, indtil verifikatoren genstartes. Den endelighed omfatter også den levende nøgle: en forfalsket tilbagekaldelse af en offentlig nøgle nulstiller hukommelsen om den afløste nøgle og tilbagekalder den nøgle, der er i brug, og kun en genstart omgør det.

seg-e7d43eb18c24 = En DSM-PKR med NPKT { "4" } er alarmmeddelelsen; den verificeres gennem Merkle-træet som en nøgle, idet dens tilfældige NPK-felt er en del af bladet. En verificeret alarm rydder alle kæder og offentlige nøgler, afviser hver senere KROOT og offentlig nøgle og gør hver satellit <c1/>, som Receiver Guidelines foreskriver, indtil verifikatoren genstartes.

seg-4068e9bda7c1 = En DSM-KROOTs udfyldningsfelt er en hashværdi af den signerede meddelelse og signaturen. Det kontrolleres før signaturen, og det siger også, hvilken NMA-header den signerede meddelelse blev bygget med, når headeren ændrede sig, mens meddelelsen blev samlet.

seg-8ea31bf25ef0 = Hvad der ikke verificeres eller ikke afprøves

seg-3d0808cab632 = <b>Friskhed.</b> Se Tid ovenfor: den kræver en referencetid udefra.

seg-b3d63950baa4 = <b>Fornyelse og tilbagekaldelse.</b> Kæder og nøgler følges, som strømmene i de offentliggjorte vektorer afprøver dem (fornyelse, kædens slutning, tilbagekaldelse af kæde og nøgle, ny offentlig nøgle, nyt Merkle-træ, alarm), ikke hvert tilfælde, ICD'en tillader. En tilbagekaldelse, der annonceres af den uautentificerede header, tages på ordet og er endelig for sessionen. Et nyt Merkle-træ opfanges kun gennem den Merkle-rod, verifikatoren får.

seg-f01d90a44585 = <b>Merkle-trætes hashfunktion.</b> DSM-PKR-meddelelser kontrolleres med et SHA-256-træ. Et SHA3-256-træ, som ICD'en tillader i fremtiden, understøttes ikke. Kædens hashfunktion kan være SHA-256 eller SHA3-256.

seg-d9ca4e69ffc9 = <b>Nøglestatuslister.</b> Tilbagekaldelse følges gennem NMA-headeren og meddelelserne i strømmen; certifikattilbagekaldelseslister læses ikke.

seg-73e0b16d03c7 = <b>Dækning af autentificerede data.</b> ADKD { "4" } med COP { "1" } sendt i en ulige delramme kan ikke autentificere (Word Type { "10" } kan være sendt en eller to delrammer tidligere); det koster kun tilgængelighed, aldrig korrekthed.

seg-acc28dcced83 = <b>Drift i konstant tid.</b> Ikke leveret og ikke nødvendig: verifikatoren rummer ingen hemmeligheder (kun offentlige nøgler, offentliggjorte kædenøgler og modtagne data).

seg-b2f8ec90ae39 = <b>Signal- og datakvalitet.</b> Sider CRC-kontrolleres, og alarmsider droppes, men intet vides om det signal, de ankom på. Reed-Solomon-genopretning af I/NAV-ord { "1" } til { "4" } bruges ikke: data skal modtages direkte.

seg-97313ba2bf88 = <b>Ikke en tjeneste for positionsintegritet.</b> Autentificering siger, at dataene kom fra systemet. Den siger intet om det signal, de ankom på, eller kvaliteten af positionsbestemmelsen.

seg-d696f298c4a2 = <b>Almindeligt sideformat.</b> Ét sidepar pr. linje: <c1/>, kommentarer med <c2/> er tilladt. <c3/> er GST i sekunder (<c4/>) ved sidens start; hex-værdien er de { "240" } bits af den lige og den ulige halvdel (haler medregnet), mest signifikante bit først.

seg-e436d96b12cf = <b>CSV med testvektorer.</b> Opbygningen af de offentliggjorte vektorer (<c1/>). Starttiden kommer fra <c2/> eller fra et dateret filnavn.

seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> En rå UBX-bytestrøm (<c1/>, registreres automatisk). Galileo E1-B I/NAV-meddelelser genopbygges til sidepar (<c2/>); andre systemer, E5b, alarmsider og rammer med en dårlig kontrolsum ignoreres. SFRBX bærer ingen tid, så hver side stemples ud fra tiden inde i sine egne data (ordtyperne { "5" } og { "0" }) og accepteres kun, hvis på hinanden følgende sider med tid stemmer med antallet af sider modtaget mellem dem; sider, der ikke kan placeres, droppes, aldrig gættes. Den tid kommer fra dataene selv og giver ingen beskyttelse mod forældelse (se Tid ovenfor). Signal-id { "0" } (E1-C) bærer ingen data, så det er harmløst at acceptere det ved siden af E1-B. Et enkelt synkroniseringspar med en absurd længde holder ikke læseren tilbage. Rammekoden er en tredje kopi af UBX-rammedannelsen i træet (<c3/>, modtagertillidens indlæsning); den holdes adskilt, så modtagertillidens adfærd er uændret, og de tre kunne senere dele én læser. Ordopbygningen i en SFRBX-meddelelse er taget fra offentlige beskrivelser og kun kontrolleret på syntetiske rammer, ikke på en levende modtager.

seg-47118a577876 = Tekstoutput giver status pr. satellit og, med <c1/>, pr. tag og epoke; <c2/> giver det samme med taglisten. Afslutningsstatus { "3" } betyder, at en kontrol af en satellits data fejlede, { "2" } betyder en fejl i brug eller input. Den vejledende erklæring ovenfor udskrives først på hver sti, fejl og brug medregnet.

seg-e2af23b756f5 = Fra Python og WebAssembly

seg-4edf83a818d1 = <c1/> (Python) og <c2/> (WebAssembly) kører den samme verifikator på bytes i hukommelsen og returnerer den JSON, som <c3/> udskriver, vejledende erklæring medregnet. MCP-serveren har den ikke med: inputtet er en lang rå modtagerstrøm, der bedre betjenes af kommandolinjen og Python, og et agentværktøj ville tilføje en stor inputflade uden gevinst. Den samme vejledende erklæring og de samme grænser gælder; statussen er ikke en navigationsintegritetstjeneste.

seg-0987c3b00a14 = Tests og testdata

seg-2acc9fa7212b = Testdata er syntetiske og genereret af Kshanas egen kode og tests. Ingen ICD- eller Guidelines-vektorer, gennemregnede eksempler eller nøglemateriale er gemt i dette repositorium. Standardtestene (<c1/> og enhedstestene) bygger en kæde, sider og tags ud fra ligningerne og kontrollerer konsistens, og at bevidst ødelæggelse fanges: en vendt navigationsbit, en vendt nøglebit, genafspillede tags, forkerte tidsstempler, en tid uden for referencen, manglende data og de angreb, gennemgangen fandt (en spoofet delramme langt ude i fremtiden, som ikke må slette en fejl, autentificering, der skal udløbe og følge IODnav, en alarm, NMA-status "don't use", dummytags, MACSEQ-uoverensstemmelse, modstridende nøgler, tilbagekaldelse og fornyelse af kæde, en dårlig udfyldning eller signatur), med CMAC-AES, en SHA3-256-kæde og en P-521-signatur ført gennem verifikatoren. Fordi disse data kommer fra vores egen læsning af ICD'en, viser de selvkonsistens, ikke overensstemmelse.

seg-4906b14a33a3 = Primitiverne kontrolleres mod offentliggjorte known-answer-tests, ingen taget fra ICD'en: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) og RFC { "6979" } (ECDSA P-256). P-521-signaturer kontrolleres for kodning og valg af hashfunktion med en engangsnøgle lavet i testen; kurvearitmetikken er bibliotekets.

seg-82ee90adf7ed = Formatkontrollen udføres af <c1/>, som er tilvalg: den læser en kopi af det officielle arkiv med testvektorer, som du selv henter, fra den mappe, som <c2/> angiver, og gør intet, når variablen ikke er sat. Den gemmer og videredistribuerer intet, og standardtestkørsler bruger intet netværk. Den giver kun verifikatoren en Merkle-rod og de offentlige nøgler fra ét træ, som en modtager ville have, så kæderne etableres ud fra den signerede DSM-KROOT i strømmen, og hele vejen køres: Merkle, signatur, nøglekæde, MACSEQ og tags. Pr. vektorsæt hævder den et gulv for de autentificerede tags, at ingen fejlede, hvilke kæder og nøgler strømmen annoncerer, autentificerede tags af ADKD { "0" }, { "4" } og { "12" }, at autentificeringen genoptages efter kædens slutning, tilbagekaldelse af kæde, tilbagekaldelse af nøgle og ny offentlig nøgle, at alarmmeddelelsen verificeres og efterlader intet autentificeret, og at hver vektor kun bruger HMAC-SHA-256, en SHA-256-kæde, 128-bit-nøgler, 40-bit-tags og opslagsposterne { "33" } og { "34" }. Andre valg af algoritmer og parametre i ICD'en er derfor kun dækket af known-answer-testene og de syntetiske tests ovenfor.

seg-70bb026ce655 = Afhængigheder

seg-00a3dd901039 = RustCrypto-crates, ren Rust, MIT OR Apache-2.0, bygget uden standardfunktioner: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> og <c6/> (funktionen <c7/>, kun brugt til verifikation) ved siden af <c8/>, der allerede er i træet. De bygges til <c9/> og består <c10/>.

seg-7ab62b91d469 = <s1>Forrige</s1>Tillid som sikkerhedstelemetri

seg-5dc48294fbb2 = <s1>Næste</s1>LunaNet-udvidet fremadrettet signal
