# docs--osnma: translations (sv)

seg-fcd0ebea49bc = Kommandorad

seg-6816f4e1a0a0 = Version

seg-94058315dfe4 = Indata

seg-23746ba370c2 = Källa: <c1/>

seg-1e9c104231db = Galileo OSNMA-verifierare på mottagarsidan

seg-17fd702f5997 = En verifierare på mottagarsidan för Galileo Open Service Navigation Message Authentication (OSNMA), i ren Rust. Den läser I/NAV-sidor och redovisar, per satellit och per epok, om navigeringsdata är kryptografiskt autentiserade, och varför en kontroll misslyckades.

seg-ae081f55c4f1 = <b>Rådgivande.</b> Detta är analys- och övervakningsutdata och inte typgodkänd navigationsutrustning. Autentiseringsstatusen som redovisas här är inte en tjänst för navigeringsintegritet och får inte vara den enda grunden för något navigerings- eller säkerhetsbeslut.

seg-84d7260098b1 = MEDDELANDE: immateriella rättigheter i Galileo OSNMA-gränssnittet

seg-6d78ccef53d5 = Kshana beviljar inga rättigheter under Europeiska unionens immateriella rättigheter i Galileo OSNMA Signal-in-Space Interface Control Document ("ICD IPRs"). ICD:n bär sitt eget tillstånd (dess bilaga E), som är icke-exklusivt och royaltyfritt och har egna villkor, omfattning och begränsningar. Den som använder, bygger eller distribuerar programvara baserad på den här modulen förlitar sig direkt på det tillståndet och måste själv läsa och godta dess villkor. Kshanas licens (endast AGPL-3.0, eller den kommersiella licensen) omfattar bara Kshanas egen kod.

seg-c13ad334bf9a = Den här modulen implementerar de algoritmer som dokumenten nedan beskriver. ICD-texten återges inte; numeriska värden (fältlayouter, uppräkningar, MAC-uppslagstabellen) uttrycks på nytt i Kshanas egen notation, med källan angiven i koden. ICD:n och Receiver Guidelines är © Europeiska unionen; källan erkänns här. Kshana är inte utvecklad av, använd av, godkänd av eller stödd av Europeiska unionen, Europeiska kommissionen, EUSPA eller något annat organ.

seg-860096b04999 = Referensdokument

seg-04c1e1a6278d = Utgivna av European GNSS Service Centre.

seg-278dd0f9df58 = Dokument

seg-3427e40d7bee = Datum

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD ("SIS ICD")

seg-f63fbc1175cf = Utgåva { "1.1" }

seg-fa85e4db2c93 = oktober { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Utgåva { "1.3" }

seg-a9b75bc7f063 = januari { "2024" }

seg-530ae6421157 = Avsnitts- och tabellnummer som anges i koden och här avser de versionerna.

seg-143726cc3d5f = Vad som verifieras

seg-029a9bb7608f = Förtroendekedjan, från roten ner till data:

seg-886f1b6556ce = <b>Publik nyckel (ICD { "3.2.2" }, { "6.2" }).</b> Ett DSM-PKR sätts ihop på nytt av sina block och dess Merkle-sökväg följs till en betrodd Merkle-rot (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> Ett DSM-KROOT sätts ihop på nytt; dess ECDSA-signatur (P-256/SHA-256 eller P-521/SHA-512) kontrolleras mot den publika nyckel den namnger, över NMA-huvudet och kedjeparametrarna.

seg-acc1f06cf63a = <b>TESLA-nycklar (ICD { "5.5" }, { "6.4" }).</b> Varje nyckel i ett MACK-meddelande följs tillbaka till KROOT eller till en tidigare verifierad nyckel, med kedjans hashfunktion.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> De flexibla Tag-Info-fälten kontrolleras mot MACSEQ med den nyckel som öppnar det MACK:et.

seg-41ba810d7c8d = <b>Taggar (ICD { "4.2" }, { "6.7" }).</b> Varje tagg räknas om (HMAC-SHA-256 eller CMAC-AES, avkortad till kedjans taggängd) över satellitidentiteterna, delramens tid, taggens position, NMA-statusen och den navigeringsdata den täcker, och jämförs. ADKD { "0" } (efemerid, klocka och status), ADKD { "4" } (tidsparametrar) och ADKD { "12" } (långsam MAC, nyckeln publiceras tio delramar senare) hanteras, med korsautentisering av satelliter som inte själva bär OSNMA, och dummytaggar (COP { "0" }).

seg-1be16a4ca722 = En tagg som anger ett reserverat värde, eller vars ADKD inte stämmer med platsen i MAC-uppslagstabellen, läggs åt sidan (mottagarriktlinjerna säger att den ska kasseras) och rapporteras som <c1/>, inte som ett fel.

seg-eb993b3a0d17 = Sidor kontrolleras mot sin CRC (Galileos CRC-24Q) före allt annat; en sida som misslyckas slängs och rapporteras (<c1/>).

seg-c414a30d0840 = Statusvärden

seg-268f61b565b9 = Per tagg: <c1/>, <c2/> med en orsak (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> med en orsak (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), eller <c15/>. En dummytagg (COP { "0" }) visas som <c16/> på taggnivå, eftersom den bevisar nyckeln, men den täcker ingen navigeringsdata och räknas aldrig för en satellit.

seg-331a6ab821f3 = Per satellit, i den form som övervakaren för mottagarförtroende använder:

seg-9912068c5b34 = <c1/> bara så länge de senaste verifierade efemerid- och klockdata (ADKD { "0" } eller

seg-38e7f56293e7 = för den satelliten är färska (inom { "600" } s från verifierarens tid som standard) och fortfarande är de data som används. Kontrollen gäller data, inte IODnav: verifieraren behåller SHA-256 för den autentiserade bitsträngen (ordtyp { "1" } till { "5" } såsom ADKD { "0" } täcker dem) och för den senaste sådana strängen som satelliten skickar, och de måste vara lika. En kopierad IODnav över andra ord, eller ändrade bitar i ordtyp { "5" } (som inte bär någon IODnav), läses som <c1/> tills de nya data autentiseras. En delram som bär efemeridord men ingen komplett uppsättning ordtyp { "1" } till { "5" } under en IODnav tar bort statusen på samma sätt (varje äkta E1-B-delram bär alla fem); en utan några efemeridord alls säger ingenting. Taggar från en annan satellit (korsautentisering) räknas för den satellit vars data de täcker.

seg-233109ef4428 = <c1/> när en kontroll av satellitens data misslyckades inom felminnet ({ "600" } s som standard av verifierarens tid), även om senare data verifieras. En avvikelse läggs på den satellit vars data taggen täcker och på den satellit som sände taggen, eftersom någondera kan ha fel; en MACSEQ-avvikelse läggs på den sändande satelliten.

seg-8ba1d89bcf91 = <c1/> annars, och för varje satellit efter ett verifierat varningsmeddelande, med NMA-status "don't use" eller en reserverad status, och tills den första nyckeln har verifierats.

seg-7fceea6e23f8 = Det samlade värdet är <c1/> om någon satellit misslyckades, <c2/> om minst en är autentiserad och ingen misslyckades, annars <c3/>. <c4/> är motsvarande mening; <c5/> bygger den.

seg-446a3218ccbb = Tid

seg-18e91e6aa160 = Nyckelkedjan visar att en nyckel hör till en viss delram, inte att delramen är den aktuella. Verifieraren hämtar därför aldrig "nu" från en overifierad sida. Dess tid är den senare av referenstiden som anges med <c1/> (<c2/>) och delramen för den senaste TESLA-nyckel som verifierats (en nyckel kan inte vara känd före sin lucka, så den bevisar att tiden inte är tidigare). Felminne, giltighetsfönstret för en autentisering och avlägsnandet av gamla data styrs av den tiden. En delram stämplad mer än tre delramar efter den senaste verifierade nyckeln läggs åt sidan om inte dess egen nyckel bevisar dess tid; nyckel- och varningsmeddelanden i den behandlas ändå, eftersom de bär sitt eget bevis (en signatur eller Merkle-roten).

seg-318323322a3a = Klockan står still när OSNMA slutar, eftersom bara nycklar för den framåt. En live-anropare måste anropa <c1/> med värdtid varje delram; autentiseringen löper då ut av sig själv, och <c2/> (som också körs för varje delram) returnerar en <c3/>-händelse när ingen nyckel har verifierats under längre tid än autentiseringsfönstret.

seg-5338d8f5de77 = Det detta inte ger är färskhet. Utan en referenstid från en källa som en angripare inte kan flytta autentiseras en replay av gamla äkta data under gamla stämplar, och sidstämplarna är bara så bra som sin källa: kommandoradsverktyget säger det (<c1/>) så snart ingen referenstid anges. Med en referenstid är toleransen under en delram (standard { "29" } s; större värden avvisas). En referenstid är ett enda ögonblick: delramar längre från den än toleransen läggs åt sidan och räknas, så den passar live- eller nyss inspelade data, inte en lång inspelning. För en inspelning, utelämna referenstiden och läs resultatet som "äkta, inte nödvändigtvis färskt". Mottagarriktlinjerna ger det formella kravet.

seg-aa37ce329914 = Sidstämplarna i en u-blox-ström kommer från de oautentiserade data själva (se Indata), så de ger inte heller något färskhetsskydd.

seg-a33d72076025 = Kedjor, nycklar och varningar

seg-be2d9588df65 = Verifierade kedjor lagras per kedje-id (CID); taggar kontrolleras med den kedja som NMA-huvudet anger, och ett huvud som anger en kedja som inte verifierats lämnar delramens taggar okontrollerade (<c1/>). En andra KROOT för en gällande kedja lägger till ett ankare; en KROOT för en annan kedja behålls vid sidan, så att ett nytt tillkännagivande av den gamla kedjan efter en förnyelse inte upphäver den nya.

seg-bbb6574fa258 = NMA-huvudet är inte autentiserat, så det det tillkännager räknas bara när det bekräftas: när fler än en satellit skickar samma huvud i en delram, eller när det signerade meddelandet i en verifierad KROOT bär det (huvudet är en del av det meddelandet). De två är inte likvärdiga. Samstämmighet mellan fler än en satellit skyddar mot en avvikelse hos en enskild satellit, inte mot en spoofer: en spoofer kan förfalska två satellit-id. Vad det ger den är denial of service, och inget mer eftersom ett bekräftat "don't use" rensar varje satellits autentiserade data: att häva det, förfalskat eller äkta, återställer ingenting förrän nya taggar verifieras under äkta operativa delramar. (Före den rensningen kunde en förfalskad hävning ge tillbaka, i upp till autentiseringsfönstret, data som redan hade autentiserats.) Den verkliga bekräftelsen är det KROOT-signerade huvudet, som också häver ett "don't use" igen när det bär en operativ status. En enskild satellits huvud ändrar ingenting utom kontrollen av taggarna i dess egen delram. En KROOT vars tillämpbarhetstid inte är senare än den för kedjan som innehas för samma id (en replay av en äldre) avvisas (<c1/>); en KROOT för samma kedja lägger till ett ankare.

seg-5c08dbaa8d43 = Det bekräftade huvudets status och CPKS-värde styr återkallelse. Med NMA-status "don't use" tar CPKS "chain revoked" bort den kedja som huvudet anger och avvisar dess KROOT från och med då; CPKS "public key revoked" tar bort den publika nyckel som signerade den kedjan, och varje kedja signerad med den. Om ersättningskedjan för det id:t antogs innan huvudet bekräftades, hur långt före som helst, är den återkallade nyckeln den föregående kedjans, inte den nya; det minnet behålls tills återkallelsen genomförs eller en annan procedurs huvud bekräftas, och ett återkallelsehuvud som upprepas varje delram genomförs en gång. Samma CPKS-värden med status operational markerar övergången till ersättningen och återkallar ingenting. Huvudet är inte självt autentiserat, så en förfalskad återkallelse kan bara ta bort autentisering, och den är slutgiltig tills verifieraren startas om. Den slutgiltigheten gäller även den levande nyckeln: en förfalskad återkallelse av publik nyckel nollställer minnet av den ersatta nyckeln och återkallar nyckeln som används, och bara en omstart ångrar det.

seg-e7d43eb18c24 = Ett DSM-PKR med NPKT { "4" } är varningsmeddelandet; det verifieras genom Merkle-trädet som en nyckel, där dess slumpmässiga NPK-fält ingår i bladet. Ett verifierat varningsmeddelande rensar alla kedjor och publika nycklar, avvisar varje senare KROOT och publik nyckel, och gör varje satellit <c1/>, som mottagarriktlinjerna föreskriver, tills verifieraren startas om.

seg-4068e9bda7c1 = Utfyllnadsfältet i ett DSM-KROOT är en hash av det signerade meddelandet och signaturen. Det kontrolleras före signaturen, och det anger också vilket NMA-huvud det signerade meddelandet byggdes med när huvudet ändrades medan meddelandet sattes ihop.

seg-8ea31bf25ef0 = Vad som inte verifieras, eller inte prövas

seg-3d0808cab632 = <b>Färskhet.</b> Se Tid ovan: den behöver en referenstid utifrån.

seg-b3d63950baa4 = <b>Förnyelse och återkallelse.</b> Kedjor och nycklar följs så som strömmarna i de publicerade vektorerna prövar dem (förnyelse, kedjeslut, kedje- och nyckelåterkallelse, ny publik nyckel, nytt Merkle-träd, varning), inte varje fall som ICD tillåter. En återkallelse som tillkännages av det oautentiserade huvudet tas på orden och är slutgiltig för sessionen. Ett nytt Merkle-träd plockas upp bara genom den Merkle-rot som verifieraren får.

seg-f01d90a44585 = <b>Merkle-trädets hash.</b> DSM-PKR-meddelanden kontrolleras med ett SHA-256-träd. Ett SHA3-256-träd, som ICD tillåter i framtiden, stöds inte. Kedjans hashfunktion kan vara SHA-256 eller SHA3-256.

seg-d9ca4e69ffc9 = <b>Nyckelstatuslistor.</b> Återkallelse följs genom NMA-huvudet och meddelandena i strömmen; listor över återkallade certifikat läses inte.

seg-73e0b16d03c7 = <b>Täckning av autentiserade data.</b> ADKD { "4" } med COP { "1" } skickad i en udda delram kan inte autentisera (ordtyp { "10" } kan skickas en eller två delramar tidigare); detta kostar bara tillgänglighet, aldrig korrekthet.

seg-acc28dcced83 = <b>Drift i konstant tid.</b> Tillhandahålls inte och behövs inte: verifieraren håller inga hemligheter (bara publika nycklar, publicerade kedjenycklar och mottagna data).

seg-b2f8ec90ae39 = <b>Signal- och datakvalitet.</b> Sidor CRC-kontrolleras och varningssidor slängs, men inget är känt om signalen de kom in på. Reed-Solomon-återvinning av I/NAV-orden { "1" } till { "4" } används inte: data måste tas emot direkt.

seg-97313ba2bf88 = <b>Inte en integritetstjänst för position.</b> Autentisering säger att data kom från systemet. Den säger ingenting om signalen den kom in på eller positionsbestämningens kvalitet.

seg-d696f298c4a2 = <b>Enkelt sidformat.</b> Ett sidpar per rad: <c1/>, <c2/>-kommentarer tillåtna. <c3/> är GST i sekunder (<c4/>) vid sidans början; hexvärdet är de { "240" } bitarna i den jämna och den udda hälften (svansar inkluderade), mest signifikanta biten först.

seg-e436d96b12cf = <b>Testvektor-CSV.</b> Layouten för de publicerade vektorerna (<c1/>). Starttiden kommer från <c2/> eller från ett daterat filnamn.

seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> En rå UBX-bytesström (<c1/>, identifieras automatiskt). Galileo E1-B I/NAV-meddelanden byggs om till sidpar (<c2/>); andra system, E5b, varningssidor och ramar med felaktig kontrollsumma ignoreras. SFRBX bär ingen tid, så varje sida stämplas utifrån tiden i dess egna data (ordtyp { "5" } och { "0" }) och godtas bara om på varandra följande tidsbärande sidor stämmer med antalet sidor som mottagits mellan dem; sidor som inte kan placeras slängs, aldrig gissas. Den tiden kommer från själva data och ger inget färskhetsskydd (se Tid ovan). Signal-id { "0" } (E1-C) bär inga data, så att godta den vid sidan av E1-B är ofarligt. Ett löst synkpar med en orimlig längd håller inte tillbaka läsaren. Ramningskoden är en tredje kopia av UBX-ramningen i trädet (<c3/>, inläsningen för mottagarförtroende); den hålls isär så att receiver-trust-beteendet är oförändrat, och de tre kunde dela en läsare senare. Ordlayouten i ett SFRBX-meddelande är hämtad från offentliga beskrivningar och kontrollerad bara på syntetiska ramar, inte på en levande mottagare.

seg-47118a577876 = Textutdata ger status per satellit och, med <c1/>, per tagg och epok; <c2/> ger samma med taglistan. Avslutsstatus { "3" } betyder att en kontroll av någon satellits data misslyckades, { "2" } betyder ett användnings- eller indatafel. Det rådgivande uttalandet ovan skrivs ut först på varje väg, fel och användning inkluderade.

seg-e2af23b756f5 = Från Python och WebAssembly

seg-4edf83a818d1 = <c1/> (Python) och <c2/> (WebAssembly) kör samma verifierare på bytes i minnet och returnerar den JSON som <c3/> skriver ut, rådgivande uttalande inkluderat. MCP-servern har den inte: indata är en lång rå mottagarström som bättre betjänas av kommandoraden och Python, och ett agentverktyg skulle lägga till en stor yta för indata utan någon nytta. Samma rådgivande uttalande och samma begränsningar gäller; statusen är inte en integritetstjänst för navigering.

seg-0987c3b00a14 = Tester och testdata

seg-2acc9fa7212b = Testdata är syntetiska och genereras av Kshanas egen kod och tester. Inga ICD- eller riktlinjevektorer, genomgångna exempel eller nyckelmaterial lagras i det här repositoriet. Standardtesterna (<c1/> och enhetstesterna) bygger en kedja, sidor och taggar utifrån ekvationerna och kontrollerar konsistens och att avsiktlig korruption fångas: en vänd navigeringsbit, en vänd nyckelbit, återspelade taggar, fel tidsstämplar, en tid utanför referensen, saknade data, och de attacker som granskningen hittade (en spoofad delram långt in i framtiden som inte får radera ett fel, autentisering som måste löpa ut och följa IODnav, en varning, NMA-status "don't use", dummytaggar, MACSEQ-avvikelse, motstridiga nycklar, kedjeåterkallelse och förnyelse, en felaktig utfyllnad eller signatur), med CMAC-AES, en SHA3-256-kedja och en P-521-signatur genom verifieraren. Eftersom de datan kommer från vår egen läsning av ICD visar den självkonsistens, inte överensstämmelse.

seg-4906b14a33a3 = Primitiverna kontrolleras mot publicerade known-answer-tester, inga hämtade från ICD: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) och RFC { "6979" } (ECDSA P-256). P-521-signaturer kontrolleras för kodning och hashval med en engångsnyckel som skapas i testet; kurvaritmetiken är bibliotekets.

seg-82ee90adf7ed = Kontrollen mot de officiella vektorerna görs av <c1/>, som är opt-in: den läser en kopia av det officiella testvektorarkivet som du själv laddar ner, från katalogen som anges av <c2/>, och gör ingenting när variabeln inte är satt. Den lagrar och vidaredistribuerar ingenting, och standardtestkörningar använder inget nätverk. Den ger verifieraren bara en Merkle-rot och de publika nycklarna för ett träd, som en mottagare skulle ha, så kedjor upprättas från det signerade DSM-KROOT i strömmen och hela vägen körs: Merkle, signatur, nyckelkedja, MACSEQ och taggar. Den hävdar, per vektoruppsättning, en nedre gräns för de autentiserade taggarna, att ingen misslyckades, vilka kedjor och nycklar strömmen tillkännager, autentiserade taggar av ADKD { "0" }, { "4" } och { "12" }, att autentisering återupptas efter kedjeslut, kedjeåterkallelse, nyckelåterkallelse och ny publik nyckel, att varningsmeddelandet verifieras och inte lämnar något autentiserat, och att varje vektor bara använder HMAC-SHA-256, en SHA-256-kedja, 128-bitarsnycklar, 40-bitarstaggar och uppslagsposterna { "33" } och { "34" }. Andra algoritm- och parameterval i ICD täcks därför bara av known-answer-testerna och de syntetiska testerna ovan.

seg-70bb026ce655 = Beroenden

seg-00a3dd901039 = RustCrypto-crates, ren Rust, MIT OR Apache-2.0, byggda utan standardfunktioner: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> och <c6/> (funktionen <c7/>, används bara för verifiering), vid sidan av <c8/> som redan finns i trädet. De byggs för <c9/> och klarar <c10/>.

seg-7ab62b91d469 = <s1>Föregående</s1>Förtroende som säkerhetstelemetri

seg-5dc48294fbb2 = <s1>Nästa</s1>LunaNet Augmented Forward Signal
