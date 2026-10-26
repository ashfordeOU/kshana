# docs--osnma: translations (nb)

seg-fcd0ebea49bc = Kommandolinje

seg-6816f4e1a0a0 = Versjon

seg-94058315dfe4 = Inndata

seg-23746ba370c2 = Kilde: <c1/>

seg-1e9c104231db = Galileo OSNMA-verifikator på mottakersiden

seg-17fd702f5997 = En verifikator på mottakersiden for Galileo Open Service Navigation Message Authentication (OSNMA), i ren Rust. Den leser I/NAV-sider og rapporterer, per satellitt og per epoke, om navigasjonsdataene er kryptografisk autentisert, og hvorfor en kontroll feilet.

seg-ae081f55c4f1 = <b>Veiledende.</b> Dette er analyse- og overvåkingsutdata og ikke typegodkjent navigasjonsutstyr. Autentiseringsstatusen som rapporteres her, er ikke en navigasjonsintegritetstjeneste og må ikke være det eneste grunnlaget for noen navigasjons- eller sikkerhetsbeslutning.

seg-84d7260098b1 = MERKNAD: immaterielle rettigheter i Galileo OSNMA-grensesnittet

seg-6d78ccef53d5 = Kshana gir ingen rettigheter under Den europeiske unions immaterielle rettigheter i Galileo OSNMA Signal-in-Space Interface Control Document («ICD IPRs»). ICD-en har sin egen tillatelse (vedlegg E), som er ikke-eksklusiv og royaltyfri og har egne vilkår, omfang og begrensninger. Alle som bruker, bygger eller distribuerer programvare basert på denne modulen, støtter seg direkte på den tillatelsen og må selv lese og godta vilkårene. Kshanas lisens (AGPL-3.0-only, eller den kommersielle lisensen) dekker bare Kshanas egen kode.

seg-c13ad334bf9a = Denne modulen implementerer algoritmene dokumentene nedenfor beskriver. ICD-teksten gjengis ikke; tallverdier (feltoppsett, oppregninger, MAC-oppslagstabellen) er uttrykt på nytt i Kshanas egen notasjon, med kilden oppgitt i koden. ICD-en og mottakerretningslinjene er © Den europeiske union; kilden anerkjennes her. Kshana er ikke utviklet av, brukt av, godkjent av eller anbefalt av Den europeiske union, Europakommisjonen, EUSPA eller noe annet organ.

seg-860096b04999 = Referansedokumenter

seg-04c1e1a6278d = Utgitt av European GNSS Service Centre.

seg-278dd0f9df58 = Dokument

seg-3427e40d7bee = Dato

seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD («SIS ICD»)

seg-f63fbc1175cf = Utgave { "1.1" }

seg-fa85e4db2c93 = oktober { "2023" }

seg-b89aa2b88558 = Galileo OSNMA Receiver Guidelines

seg-907e4e46056c = Utgave { "1.3" }

seg-a9b75bc7f063 = januar { "2024" }

seg-530ae6421157 = Seksjons- og tabellnumre som siteres i koden og her, viser til disse versjonene.

seg-143726cc3d5f = Hva som verifiseres

seg-029a9bb7608f = Tillitskjeden, fra roten og ned til dataene:

seg-886f1b6556ce = <b>Offentlig nøkkel (ICD { "3.2.2" }, { "6.2" }).</b> En DSM-PKR settes sammen igjen fra blokkene sine, og Merkle-stien følges til en betrodd Merkle-rot (SHA-256).

seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> En DSM-KROOT settes sammen igjen; ECDSA-signaturen (P-256/SHA-256 eller P-521/SHA-512) kontrolleres mot den offentlige nøkkelen den navngir, over NMA-headeren og kjedeparametrene.

seg-acc1f06cf63a = <b>TESLA-nøkler (ICD { "5.5" }, { "6.4" }).</b> Hver nøkkel i en MACK-melding følges tilbake til KROOT eller til en tidligere verifisert nøkkel, med kjedens hashfunksjon.

seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> De fleksible Tag-Info-feltene kontrolleres mot MACSEQ med nøkkelen som åpner den MACK-en.

seg-41ba810d7c8d = <b>Tagger (ICD { "4.2" }, { "6.7" }).</b> Hver tagg beregnes på nytt (HMAC-SHA-256 eller CMAC-AES, avkortet til kjedens tagglengde) over satellittidentitetene, underrammetiden, taggposisjonen, NMA-statusen og navigasjonsdataene den dekker, og sammenlignes. ADKD { "0" } (efemeride, klokke og status), ADKD { "4" } (tidsparametre) og ADKD { "12" } (langsom MAC, nøkkel publisert ti underrammer senere) håndteres, med kryssautentisering av satellitter som ikke selv bærer OSNMA, og dummytagger (COP { "0" }).

seg-1be16a4ca722 = En tagg som navngir en reservert verdi, eller hvis ADKD ikke stemmer med sporet i MAC-oppslagstabellen, legges til side (mottakerretningslinjene sier at den skal forkastes) og rapporteres som <c1/>, ikke som en feil.

seg-eb993b3a0d17 = Sider kontrolleres mot CRC-en sin (Galileo CRC-24Q) før noe annet; en side som feiler, droppes og rapporteres (<c1/>).

seg-c414a30d0840 = Statusverdier

seg-268f61b565b9 = Per tagg: <c1/>, <c2/> med en begrunnelse (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> med en begrunnelse (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), eller <c15/>. En dummytagg (COP { "0" }) vises som <c16/> på taggnivå, siden den beviser nøkkelen, men den dekker ingen navigasjonsdata og teller aldri for en satellitt.

seg-331a6ab821f3 = Per satellitt, i formen mottakertillitsmonitoren bruker:

seg-9912068c5b34 = <c1/> bare så lenge de nyeste verifiserte efemeride- og klokkedataene (ADKD { "0" } eller

seg-38e7f56293e7 = til den satellitten er ferske (innen { "600" } s fra verifikatorens tid som standard) og fortsatt er dataene som er i bruk. Kontrollen gjelder dataene, ikke IODnav: verifikatoren beholder SHA-256 av den autentiserte bitstrengen (ordtype { "1" } til { "5" } slik ADKD { "0" } dekker dem) og av den nyeste slike strengen satellitten sender, og de må være like. En kopiert IODnav over andre ord, eller endrede biter i ordtype { "5" } (som ikke bærer IODnav), gir <c1/> til de nye dataene er autentisert. En underramme som bærer efemerideord men ikke et fullstendig sett av ordtype { "1" } til { "5" } under én IODnav, tar statusen bort på samme måte (hver ekte E1-B-underramme bærer alle fem); en uten noen efemerideord sier ingenting. Tagger fra en annen satellitt (kryssautentisering) teller for satellitten hvis data de dekker.

seg-233109ef4428 = <c1/> når en kontroll av satellittens data feilet innenfor feilminnet ({ "600" } s som standard av verifikatorens tid), selv om senere data verifiseres. En mismatch belastes satellitten hvis data taggen dekker og satellitten som sendte taggen, siden begge kan ha skylden; en MACSEQ-mismatch belastes den sendende satellitten.

seg-8ba1d89bcf91 = <c1/> ellers, og for hver satellitt etter en verifisert varselmelding, med NMA-status «don't use» eller en reservert status, og til den første nøkkelen er verifisert.

seg-7fceea6e23f8 = Totalverdien er <c1/> hvis en satellitt feilet, <c2/> hvis minst én er autentisert og ingen feilet, ellers <c3/>. <c4/> er den tilsvarende setningen; <c5/> bygger den.

seg-446a3218ccbb = Tid

seg-18e91e6aa160 = Nøkkelkjeden viser at en nøkkel hører til en gitt underramme, ikke at underrammen er den nåværende. Verifikatoren tar derfor aldri «nå» fra en uverifisert side. Tiden er den seneste av referansetiden gitt med <c1/> (<c2/>) og underrammen til den siste TESLA-nøkkelen som ble verifisert (en nøkkel kan ikke være kjent før sporet sitt, så den beviser at tiden ikke er tidligere). Feilminnet, gyldighetsvinduet for en autentisering og fjerning av gamle data går på den tiden. En underramme stemplet mer enn tre underrammer etter den siste verifiserte nøkkelen legges til side med mindre dens egen nøkkel beviser tiden; nøkkel- og varselmeldinger i den behandles likevel, siden de bærer sitt eget bevis (en signatur eller Merkle-roten).

seg-318323322a3a = Klokken står stille når OSNMA stopper, siden bare nøkler flytter den. En levende kaller må kalle <c1/> med vertstid hver underramme; autentiseringen utløper da av seg selv, og <c2/> (kjøres også med hver underramme) returnerer en <c3/>-hendelse når ingen nøkkel har verifisert på lenger enn autentiseringsvinduet.

seg-5338d8f5de77 = Det dette ikke gir, er ferskhet. Uten en referansetid fra en kilde en angriper ikke kan flytte, autentiseres en gjentakelse av gamle autentiske data under gamle stempler, og sidestemplene er bare så gode som kilden sin: kommandolinjen sier det (<c1/>) hver gang ingen referansetid er oppgitt. Med en referansetid er toleransen under én underramme (standard { "29" } s; større verdier avvises). En referansetid er ett enkelt øyeblikk: underrammer lenger unna den enn toleransen legges til side og telles, så den passer for levende eller nettopp innspilte data, ikke en lang opptaksperiode. For en opptaksperiode utelater du referansetiden og leser resultatet som «autentisk, ikke nødvendigvis fersk». Mottakerretningslinjene gir det formelle kravet.

seg-aa37ce329914 = Sidestemplene i en u-blox-strøm kommer fra de uautentiserte dataene selv (se Inndata), så de gir heller ingen beskyttelse mot manglende ferskhet.

seg-a33d72076025 = Kjeder, nøkler og varsler

seg-be2d9588df65 = Verifiserte kjeder oppbevares per kjede-id (CID); tagger kontrolleres med kjeden NMA-headeren navngir, og en header som navngir en kjede som ikke ble verifisert, lar underrammens tagger stå ukontrollert (<c1/>). En andre KROOT for en kjede i kraft legger til et anker; en KROOT for en annen kjede beholdes ved siden av, så å kunngjøre den gamle kjeden på nytt etter en fornyelse opphever ikke den nye.

seg-bbb6574fa258 = NMA-headeren er ikke autentisert, så det den kunngjør, teller bare når det er bekreftet: når mer enn én satellitt sender den samme headeren i en underramme, eller når den signerte meldingen til en verifisert KROOT bærer den (headeren er en del av den meldingen). De to er ikke likeverdige. At mer enn én satellitt er enige, beskytter mot en avvikende enkeltsatellitt, ikke mot en spoofer: én spoofer kan forfalske to satellitt-id-er. Det den vinner på det, er tjenestenekt og ikke mer, siden en bekreftet «don't use» fjerner alle satellitters autentiserte data: å oppheve den, forfalsket eller ekte, gjenoppretter ingenting før nye tagger verifiseres under ekte operative underrammer. (Før den fjerningen kunne en forfalsket opphevelse bringe tilbake, i inntil autentiseringsvinduet, data som allerede var autentisert.) Den reelle bekreftelsen er den KROOT-signerte headeren, som også opphever en «don't use» igjen når den bærer en operativ status. Headeren til en enkelt satellitt endrer ikke noe annet enn taggkontrollen i sin egen underramme. En KROOT hvis anvendelsestidspunkt ikke er senere enn kjedens som holdes for samme id (en gjentakelse av en eldre) avvises (<c1/>); en KROOT for samme kjede legger til et anker.

seg-5c08dbaa8d43 = Statusen og CPKS-verdien i den bekreftede headeren styrer tilbakekalling. Med NMA-status «don't use» fjerner CPKS «chain revoked» kjeden headeren navngir og avviser KROOT-en dens fra da av; CPKS «public key revoked» fjerner den offentlige nøkkelen som signerte kjeden, og hver kjede signert med den. Hvis erstatningskjeden for den id-en ble tatt i bruk før headeren ble bekreftet, uansett hvor lenge før, er nøkkelen som tilbakekalles den forrige kjedens, ikke den nyes; det minnet beholdes til tilbakekallingen er utført eller en annen prosedyres header er bekreftet, og en tilbakekallingsheader som gjentas hver underramme, utføres én gang. De samme CPKS-verdiene med status operational markerer overgangen til erstatningen og tilbakekaller ingenting. Headeren er ikke selv autentisert, så en forfalsket tilbakekalling kan bare ta autentisering bort, og den er endelig til verifikatoren startes på nytt. Den endeligheten gjelder også den levende nøkkelen: en forfalsket tilbakekalling av offentlig nøkkel nullstiller minnet om den avløste nøkkelen og tilbakekaller nøkkelen som er i bruk, og bare en omstart angrer det.

seg-e7d43eb18c24 = En DSM-PKR med NPKT { "4" } er varselmeldingen; den verifiseres gjennom Merkle-treet som en nøkkel, der det tilfeldige NPK-feltet er en del av bladet. Et verifisert varsel fjerner alle kjeder og offentlige nøkler, avviser hver senere KROOT og offentlige nøkkel, og gjør hver satellitt <c1/>, slik mottakerretningslinjene krever, til verifikatoren startes på nytt.

seg-4068e9bda7c1 = Utfyllingsfeltet i en DSM-KROOT er en hash av den signerte meldingen og signaturen. Det kontrolleres før signaturen, og det sier også hvilken NMA-header den signerte meldingen ble bygget med når headeren endret seg mens meldingen ble satt sammen.

seg-8ea31bf25ef0 = Hva som ikke verifiseres, eller ikke utprøves

seg-3d0808cab632 = <b>Ferskhet.</b> Se Tid ovenfor: den trenger en referansetid utenfra.

seg-b3d63950baa4 = <b>Fornyelse og tilbakekalling.</b> Kjeder og nøkler følges slik strømmene i de publiserte vektorene utprøver dem (fornyelse, kjedeslutt, kjede- og nøkkeltilbakekalling, ny offentlig nøkkel, nytt Merkle-tre, varsel), ikke hvert tilfelle ICD-en tillater. En tilbakekalling kunngjort av den uautentiserte headeren tas på ordet og er endelig for økten. Et nytt Merkle-tre fanges bare opp gjennom Merkle-roten verifikatoren får.

seg-f01d90a44585 = <b>Merkle-trehash.</b> DSM-PKR-meldinger kontrolleres med et SHA-256-tre. Et SHA3-256-tre, som ICD-en tillater i fremtiden, støttes ikke. Kjedens hashfunksjon kan være SHA-256 eller SHA3-256.

seg-d9ca4e69ffc9 = <b>Nøkkelstatuslister.</b> Tilbakekalling følges gjennom NMA-headeren og meldingene i strømmen; sertifikattilbakekallingslister leses ikke.

seg-73e0b16d03c7 = <b>Dekning av autentiserte data.</b> ADKD { "4" } med COP { "1" } sendt i en oddetallsunderramme kan ikke autentisere (ordtype { "10" } kan være sendt én eller to underrammer tidligere); dette koster bare tilgjengelighet, aldri korrekthet.

seg-acc28dcced83 = <b>Konstanttidsdrift.</b> Ikke levert og ikke nødvendig: verifikatoren holder ingen hemmeligheter (bare offentlige nøkler, publiserte kjedenøkler og mottatte data).

seg-b2f8ec90ae39 = <b>Signal- og datakvalitet.</b> Sider CRC-kontrolleres og varselsider droppes, men ingenting er kjent om signalet de kom inn på. Reed-Solomon-gjenoppretting av I/NAV-ord { "1" } til { "4" } brukes ikke: data må mottas direkte.

seg-97313ba2bf88 = <b>Ikke en posisjonsintegritetstjeneste.</b> Autentisering sier at dataene kom fra systemet. Den sier ingenting om signalet de kom inn på eller kvaliteten på posisjonsbestemmelsen.

seg-d696f298c4a2 = <b>Enkelt sideformat.</b> Ett sidepar per linje: <c1/>, <c2/>-kommentarer er tillatt. <c3/> er GST i sekunder (<c4/>) ved begynnelsen av siden; heksadesimalen er de { "240" } bitene i partallshalvdelen og oddetallshalvdelen (haler inkludert), mest signifikante bit først.

seg-e436d96b12cf = <b>Testvektor-CSV.</b> Oppsettet til de publiserte vektorene (<c1/>). Starttiden kommer fra <c2/> eller fra et datert filnavn.

seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> En rå UBX-bytestrøm (<c1/>, oppdages automatisk). Galileo E1-B I/NAV-meldinger bygges om til sidepar (<c2/>); andre systemer, E5b, varselsider og rammer med feil sjekksum ignoreres. SFRBX bærer ingen tid, så hver side stemples fra tiden inne i sine egne data (ordtype { "5" } og { "0" }) og godtas bare hvis påfølgende sider med tid stemmer med antallet sider mottatt mellom dem; sider som ikke kan plasseres, droppes, aldri gjettes. Den tiden kommer fra dataene selv og gir ingen beskyttelse mot manglende ferskhet (se Tid ovenfor). Signal-id { "0" } (E1-C) bærer ingen data, så det er harmløst å godta den ved siden av E1-B. Et løst synkpar med absurd lengde holder ikke leseren tilbake. Rammekoden er en tredje kopi av UBX-rammingen i treet (<c3/>, mottakertillitens innlesing); den holdes adskilt slik at mottakertillitens oppførsel er uendret, og de tre kunne dele én leser senere. Ordoppsettet i en SFRBX-melding er hentet fra offentlige beskrivelser og kontrollert bare på syntetiske rammer, ikke på en levende mottaker.

seg-47118a577876 = Tekstutdata gir statusen per satellitt og, med <c1/>, per tagg og epoke; <c2/> gir det samme med taggliste. Avslutningsstatus { "3" } betyr at en kontroll av en satellitts data feilet, { "2" } betyr en bruks- eller inndatafeil. Det veiledende ovenfor skrives ut først på hver sti, feil og bruk inkludert.

seg-e2af23b756f5 = Fra Python og WebAssembly

seg-4edf83a818d1 = <c1/> (Python) og <c2/> (WebAssembly) kjører den samme verifikatoren på bytes i minnet og returnerer JSON-en <c3/> skriver ut, med det veiledende inkludert. MCP-serveren har den ikke: inndataene er en lang rå mottakerstrøm som egner seg bedre for kommandolinjen og Python, og et agentverktøy ville legge til en stor inndataflate uten nytte. Den samme veiledende erklæringen og de samme begrensningene gjelder; statusen er ikke en navigasjonsintegritetstjeneste.

seg-0987c3b00a14 = Tester og testdata

seg-2acc9fa7212b = Testdataene er syntetiske og generert av Kshanas egen kode og tester. Ingen ICD- eller retningslinjevektorer, regneeksempler eller nøkkelmateriale er lagret i dette depotet. Standardtestene (<c1/> og enhetstestene) bygger en kjede, sider og tagger fra ligningene og kontrollerer konsistens og at bevisst korrupsjon fanges: en snudd navigasjonsbit, en snudd nøkkelbit, gjentatte tagger, gale tidsstempler, en tid utenfor referansen, manglende data, og angrepene gjennomgangen fant (en spoofet underramme langt frem i tid som ikke må viske ut en feil, autentisering som må utløpe og følge IODnav, et varsel, NMA-status «don't use», dummytagger, MACSEQ-mismatch, motstridende nøkler, kjedetilbakekalling og -fornyelse, en dårlig utfylling eller signatur), med CMAC-AES, en SHA3-256-kjede og en P-521-signatur ført gjennom verifikatoren. Fordi disse dataene kommer fra vår egen lesning av ICD-en, viser de selvkonsistens, ikke overensstemmelse.

seg-4906b14a33a3 = Primitivene kontrolleres mot publiserte kjent-svar-tester, ingen hentet fra ICD-en: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) og RFC { "6979" } (ECDSA P-256). P-521-signaturer kontrolleres for koding og hashvalg med en engangsnøkkel laget i testen; kurveregningen er bibliotekets.

seg-82ee90adf7ed = Overensstemmelse kontrolleres av <c1/>, som er opt-in: den leser en kopi av det offisielle testvektorarkivet som du laster ned selv, fra katalogen <c2/> navngir, og gjør ingenting når variabelen ikke er satt. Den lagrer og videredistribuerer ingenting, og standard testkjøringer bruker ikke nettverk. Den gir verifikatoren bare en Merkle-rot og de offentlige nøklene til ett tre, slik en mottaker ville hatt, så kjedene etableres fra den signerte DSM-KROOT i strømmen og hele stien kjøres: Merkle, signatur, nøkkelkjede, MACSEQ og tagger. Den hevder, per vektorsett, et gulv for de autentiserte taggene, at ingen feilet, hvilke kjeder og nøkler strømmen kunngjør, autentiserte tagger av ADKD { "0" }, { "4" } og { "12" }, at autentiseringen gjenopptas etter kjedeslutt, kjedetilbakekalling, nøkkeltilbakekalling og ny offentlig nøkkel, at varselmeldingen verifiseres og ikke lar noe stå autentisert, og at hver vektor bare bruker HMAC-SHA-256, en SHA-256-kjede, 128-bits nøkler, 40-bits tagger og oppslagsoppføringene { "33" } og { "34" }. Andre algoritme- og parametervalg i ICD-en dekkes derfor bare av kjent-svar-testene og de syntetiske testene ovenfor.

seg-70bb026ce655 = Avhengigheter

seg-00a3dd901039 = RustCrypto-crates, ren Rust, MIT OR Apache-2.0, bygget uten standardfunksjoner: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> og <c6/> (funksjonen <c7/>, brukt bare til verifikasjon), ved siden av <c8/> som allerede er i treet. De bygges for <c9/> og består <c10/>.

seg-7ab62b91d469 = <s1>Forrige</s1>Tillit som sikkerhetstelemetri

seg-5dc48294fbb2 = <s1>Neste</s1>LunaNet augmented forward signal
