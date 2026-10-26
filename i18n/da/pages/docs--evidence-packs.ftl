# docs--evidence-packs: translations (da)

seg-2247a2344710 = Betydning

seg-ade1d7072512 = se nedenfor

seg-245fe1f87b08 = Fil

seg-802d8b6f3afd = Kilde: <c1/>

seg-710e7e630acb = Bevispakker: en signeret registrering af en GNSS-tillidshændelse

seg-dbc796deac2a = <b>En pakke er en teknisk registrering, ikke en juridisk udtalelse.</b> Den angiver, hvad Kshana-motoren beregnede ud fra en angivet modtagerlog under en angiven konfiguration, og lader enhver kontrollere, at intet i den er ændret bagefter. Den siger ikke, hvad der forårsagede en hændelse, hvem der var ansvarlig, om nogen forpligtelse blev nået, eller at loggen viser, hvad modtageren i virkeligheden modtog. Manifestet og oversigten siger begge dette.

seg-d99cb540310c = En bevispakke er til en hændelsesrapport, en forsikringsgiver eller en myndigheds spørgsmål: »hvad sagde jeres system om GNSS-signalet mellem disse to tidspunkter, og kan vi stole på den registrering?«

seg-2fa31fe443b4 = Lav en pakke

seg-983924cb2eea = For en pakke lavet ud fra en laboratoriesession registrerer <c1/> operatørens erklæring om opstillingen (ledningsbåret eller afskærmet, dæmpning eller kabinet, hvad der udsendte eventuel RF) i det signerede manifest; se <a1><c2/></a1>. Den registreres, som den er givet, og verificeres aldrig.

seg-f01e59c876a3 = <c1/> og <c2/> er sekunder siden logens første epoke eller et UTC-tidspunkt i ISO-8601, når loggen angiver sin egen starttid. <c3/> må ikke allerede indeholde filer. <c4/> tager et rigtigt UTC-tidspunkt som <c5/> (alt andet afvises) eller <c6/>, som udelader oprettelsestidspunktet og gør pakken reproducerbar byte for byte. Oprettelsestidspunktet er det, underskriveren angiver; intet kontrollerer det mod et ur, og det er det, det valgfrie tidsstempelbevis er til.

seg-c72ddd97ad0b = Nøglefilen indeholder et Ed25519-seed på 32 byte som { "64" } hexcifre; angiv din egen (for eksempel en, der opbevares i dit nøglestyringssystem) eller lad <c1/> lave en. <c2/> advarer, hvis filen kan læses af andre brugere. <c3/> udelukker <c4/>; navngiv din nøgle sådan, hvis den ligger i et checkout.

seg-077cbd944c5d = Hvad der er i en pakke

seg-7cf2608b2b2f = Strukturen i en bevispakke. En modtagerlog (NMEA, u-blox UBX, RINEX { "3" } eller en Android-log) og et tidsvindue går ind i kshana receiver-trust evidence, som skriver syv filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig og en valgfri timestamp.tsr. Manifestet registrerer SHA-256 af hele loggen og af hver fil samt en hashkæde over filerne; signaturen dækker manifestet. kshana evidence verify kontrollerer signaturen, hver fils hash, kæden og at ingen fil uden for listen findes, og afslutter med { "0" }, når det er verificeret, { "1" }, når noget fejlede, og { "3" }, når underskriveren ikke var fastlåst. En pakke er en teknisk registrering, ikke en juridisk udtalelse.

seg-e305279d5b11 = Indhold

seg-05107c0bd3c8 = de rå bytes fra modtagerloggen for vinduet

seg-b19ce12544a5 = scenariet som kørt (hver monitortærskel, hændelse og sammenligningsregel), de monitorer, der kørte, kalibreringsbaselinen og scenariehashen; for et fartøj også den vejledende erklæring, som alt output for fartøjer bærer (vejledende software, ikke typegodkendt navigationsudstyr); fra { "0.36" } <c1/> (tabellen <c2/>, som faktisk blev brugt, geometrimonitorens vægt, hver proveniens og klassereglerne). Mappenavne og indlejrede nyttelaster fjernes.

seg-e3c2457161bc = hver epoke i vinduet med motorens statistik, alarmerne (årsagerne) og tillidstilstanden; fra { "0.36" } også dens satellit-<c1/> (god, forringet med årsager eller ukendt, hvor loggen ikke giver nogen satellitgeometri) og en <c2/> på hver slutning (<c3/>, <c4/>, <c5/>)

seg-2e309765271f = en selvstændig oversigt uden scripts: identifikation, hashes, resultater, årsager, et geometrispor (epoker efter geometristatus) adskilt fra klasserne af slutninger ({ "0.36" }), hver tærskel, tabellen pr. epoke og registreringens begrænsninger

seg-467277f816d2 = motorversion, vindue, oprettelsestidspunkt, logens format og navn, <b>SHA-256 af hele loggen</b>, udsnittets interval og SHA-256, underskriverens offentlige nøgle og fingeraftryk, hver fils størrelse og SHA-256 og en hashkæde over filerne

seg-7a92ff70ed7f = Ed25519-signatur over de nøjagtige bytes i <c1/>

seg-b517814b077d = valgfrit RFC { "3161" }-tidsstempelbevis

seg-6ad4c5f3afbe = <b>Logudsnit.</b> Læseren rapporterer kildebyteintervallet for hver epoke, så udsnittet er det mindste byteinterval, der rummer hver epoke i vinduet (<c1/>): NMEA, u-blox UBX, RINEX { "3" }-observationer og Android-logs. Det hashes som rå bytes, aldrig som afkodet tekst. For en live-strøm eller RINEX { "2" } findes der intet interval; hele loggen medfølger da, og manifestet siger <c2/> (vinduet begrænser, hvilke epoker der rapporteres, ikke hvilke bytes der medtages). Oversigten angiver, hvilket der gælder. Et udsnit er en registrering af vinduets bytes, ikke en selvstændig log: for eksempel har et RINEX-udsnit ingen filheader.

seg-c4c81cbd4981 = <b>Hashkæde.</b> Manifestet oplister filerne i en fast rækkefølge. <c1/>; for hver fil <c2/> (længde som { "4" } bytes, big-endian). Det sidste led er <c3/>. At omordne, fjerne eller udskifte en fil ændrer kæden; signaturen dækker kæden.

seg-1147c5b0d348 = Verificér en pakke

seg-e716ddf7bcc9 = Afslutningsstatus { "0" } betyder verificeret; { "1" } betyder, at noget fejlede; { "2" } betyder en brugsfejl; { "3" } betyder, at pakken er intakt, men at dens underskriver ikke var fastlåst (se nedenfor). Hver kontrol rapporterer bestået, fejlet eller sprunget over, og hver fejl navngives:

seg-f6f2cebd9cb0 = Fejlkode

seg-312a5d784f42 = manifestet kan ikke læses

seg-6f1b5d9d6711 = ingen signatur, ikke en hexsignatur på 64 byte med små bogstaver, eller den kan ikke verificeres over <c1/>

seg-129b78f142f1 = nøglen er ugyldig eller afviger fra den, du angav

seg-c86b25543d55 = en opført fil mangler eller afviger fra manifestet; filen navngives

seg-f98d26abf045 = en fil er i pakken, men ikke i manifestet

seg-842bac6a9e69 = et led er ikke det, dets input giver; filen navngives

seg-413034467a64 = manifestet modsiger sig selv eller <c1/>

seg-ef4bfbedca33 = med <c1/>: den log, du har, er ikke den registrerede, eller udsnittet er ikke det interval af den

seg-dcd686ac77f7 = At ændre ét byte i en hvilken som helst fil får verifikationen til at fejle med den tilsvarende årsag: en ændret artefakt rapporteres som den fils hash-mismatch og intet andet; et ændret manifest får signaturen til at fejle. At genberegne hashes og kæden efter redigering af en fil hjælper ikke uden signeringsnøglen; kun signaturen fejler da.

seg-066fe7c07bf6 = <b>Fastlås nøglen.</b> Uden <c1/> beviser en pakke kun, at den er intakt i forhold til den nøgle, den selv navngiver, og som enhver kan generere. Verifikationen afslutter derfor med { "3" } og siger »INTACT, BUT THE SIGNER IS NOT PINNED« i stedet for »VERIFIED«; <c2/> accepterer pakkens egen nøgle med vidende og udskriver »VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)«. Få underskriverens offentlige nøgle fra underskriveren ad en vej, du stoler på (ikke fra pakken), og angiv den med <c3/>: { "64" } hexcifre eller filen <c4/>. Hvis den private nøgle angives ved en fejl, genkendes det og afvises. Fingeraftrykket (de første { "128" } bit af nøglens SHA-256, { "32" } hexcifre) udskrives, så det kan sammenlignes med øjet; at fastlåse hele nøglen er den pålidelige vej.

seg-a01c7ba606c9 = Pakkeformat og verifikationsprocedure (normativ)

seg-fa43e16b6aba = Dette afsnit er den specifikation, en uafhængig verifikator skrives ud fra. Ord med store bogstaver er krav. En pakke er en mappe (eller et hvilket som helst kort fra filnavn til bytes) med filer, der hedder præcis som nedenfor; en verifikator arbejder på bytes i hver fil, som den er gemt, og serialiserer aldrig noget igen.

seg-1fbabb3f1092 = <b>Filer.</b> Artefaktfilerne er i denne faste rækkefølge <c1/>, <c2/>, <c3/>, <c4/>. En pakke har også <c5/> og <c6/> og KAN have <c7/>. Ethvert andet navn er en <em>fil uden for listen</em>.

seg-3ed6e38ad2ee = <b>Hex.</b> Hver hexstreng består kun af små bogstaver og <c1/>, uden blanktegn; store bogstaver accepteres ikke. SHA-256-værdier er { "64" } cifre, den offentlige nøgle er { "64" } cifre, signaturen er { "128" } cifre.

seg-6609210d003a = <b><c1/>.</b> Hex med små bogstaver og 128 cifre for Ed25519-signaturen på 64 byte (RFC { "8032" }, den rene Ed25519-ordning) over de nøjagtige bytes i <c2/>, efterfulgt af præcis ét <c3/> og intet andet. Signaturen SKAL kontrolleres strengt: en signatur, hvis S-værdi ikke er mindre end gruppens orden L, er ugyldig.

seg-b163e9f5db66 = <b><c1/>.</b> Et UTF-8 JSON-objekt. Dets medlemmer (en verifikator SKAL finde hvert med den angivne JSON-type; yderligere medlemmer ignoreres):

seg-ace92bcbfd8a = medlem

seg-04f69a0edb2f = type

seg-45425f378b61 = betydning

seg-6940543aa3c0 = streng

seg-48d303baac62 = SKAL være lig med <c1/>

seg-6e57561e7f01 = beskrivende

seg-abec93a4a488 = streng eller null

seg-7d059c0b6372 = oprettelsestidspunkt, beskrivende

seg-507d53a53380 = objekt <c1/>

seg-bb2bcbbf404a = tal, sekunder

seg-64572c65426f = ikke-negativt heltal

seg-14d421e391dd = antallet af poster i JSON-arrayet i <c1/>

seg-f5e7215e6835 = objekt

seg-a4117217030c = <c1/> streng, <c2/> streng, <c3/> hex, <c4/> ikke-negativt heltal, <c5/> streng eller null og <c6/>

seg-02389e71a339 = <c1/> (præcis <c2/> eller <c3/>; enhver anden værdi gør manifestet misdannet), <c4/> og <c5/> ikke-negative heltal (byteforskydninger, slut eksklusiv), <c6/> hex

seg-6c9176965aae = <c1/> streng (<c2/>), <c3/> hex ({ "32" } bytes), <c4/> streng

seg-dcba59304030 = array af objekter

seg-e42ed5e07430 = én pr. artefaktfil, i den faste rækkefølge: <c1/> streng, <c2/> streng, <c3/> ikke-negativt heltal, <c4/> hex, <c5/> hex

seg-b79c9500b744 = hex

seg-697592bd3757 = det sidste led

seg-9da5d92757bd = objekt, valgfrit

seg-2032c208038d = findes kun i en pakke lavet ud fra en laboratoriesession (<c1/>): operatørens erklæring <c2/>, <c3/>, <c4/>, <c5/> (<c6/> eller <c7/>), <c8/> eller <c9/>, <c10/>, <c11/> og eventuelt <c12/>, registreret som givet. Den dækkes af manifestets signatur og verificeres aldrig; en verifikator rapporterer den som »attested by the named operator; not verified by Kshana«. Fraværende ellers, og en pakke uden den er uændret

seg-9411be425a80 = <c1/> er de første { "32" } hexcifre af SHA-256 over de { "32" } bytes i den offentlige nøgle.

seg-80e55f2d3496 = Hashkæde.

seg-9346fe50efac = <c1/> er SHA-256 af de { "23" } ASCII-bytes <c2/>. For hver artefakt i rækkefølge, <c3/>, hvor <c4/> tages fra manifestets registrerede <c5/> for den artefakt (så kæden er en egenskab ved manifestet og kontrolleres mod det, ikke mod filerne).

seg-9dd985d8cb03 = <b>Procedure.</b> En verifikator udfører disse trin i rækkefølge og samler hver fejl; resultatet er <em>mængden</em> af fejl, hver en <c1/> og, hvor det er angivet, filen <c2/>. Den MÅ IKKE standse ved den første fejl, undtagen hvor det er angivet. <c3/> er den offentlige nøgle, verifikatoren fik besked om at stole på, hvis nogen.

seg-abb1d2635143 = Intet <c1/>: fejl <c2/>; stop.

seg-73a4aeb463e8 = Hvis <c1/> ikke er et JSON-objekt med hvert medlem ovenfor i de angivne typer (herunder <c2/> poster med hvert medlem og <c3/>): fejl <c4/>. Ellers, hvis <c5/> ikke er værdien ovenfor: <c6/>.

seg-36c9df2abf34 = Signaturfase. Denne fase udføres, uanset om manifestet kunne læses. Hvis manifestet kunne læses, er den <em>navngivne nøgle</em> <c1/>; hvis den ikke er { "64" } hexcifre med små bogstaver, fejl <c2/> (ingen navngiven nøgle); ellers, hvis <c3/> ikke er dens fingeraftryk, fejl <c4/> (nøglen forbliver brugbar). Hvis både en <c5/> og en navngiven nøgle findes og er forskellige: fejl <c6/>. <em>Kontrolnøglen</em> er <c7/>, hvis en blev givet, ellers den navngivne nøgle, hvis der er en; med ingen af dem er der ingen kontrolnøgle (det gælder også alle tilfælde, hvor manifestet ikke kunne læses, og ingen <c8/> blev givet). Hvis der ikke er nogen <c9/>: <c10/>. Ellers, hvis filen ikke er præcis { "128" } hexcifre med små bogstaver plus ét <c11/>: <c12/>. Ellers, hvis der er en kontrolnøgle, som ikke er en gyldig Ed25519-offentlig-nøgle-kodning: <c13/>. Ellers, hvis der er en kontrolnøgle, og signaturen ikke kan verificeres strengt over bytes i <c14/> (uanset hvad de er): <c15/>. (Uden kontrolnøgle kontrolleres signaturen ikke, og der rejses ingen fejl for det.)

seg-3dbe07af8fa8 = Hvis manifestet ikke kunne læses (trin { "2" } gav <c1/>): stop her.

seg-b7e03ef2dea5 = Artefakter. Hvis navnene i <c1/> ikke præcis er de fire ovenfor i rækkefølge: <c2/>. Derefter for hver manifestpost i rækkefølge: hvis pakken ingen fil har med det navn, <c3/> (navn); ellers, hvis dens længde afviger fra <c4/>, <c5/> (navn); og uafhængigt heraf, hvis SHA-256 af filen afviger fra <c6/>, <c7/> (navn).

seg-24cda5a1d9d8 = Filer uden for listen: for hver fil i pakken udover <c1/>, <c2/>, <c3/> og navnene i manifestets <c4/>: <c5/> (navn).

seg-d103ade9a7c7 = Kæde. Gå gennem manifestets <c1/> i rækkefølge fra <c2/>. Hvis en posts <c3/> ikke er { "64" } hexcifre med små bogstaver: <c4/>, og kæden opgives (ingen kontrol af hovedet). Ellers beregnes leddet; hvis det afviger fra postens <c5/>: <c6/> (navn). Efter gennemgangen, hvis kæden ikke blev opgivet, og det sidste led afviger fra <c7/>: <c8/>.

seg-be9fade3f879 = Udsnit og epoker. Rejs <c1/> (højst én gang pr. årsag, og en verifikator rapporterer koden én gang, uanset hvor mange årsager der gælder), hvis noget af følgende gælder: <c2/>; <c3/>; posten <c4/> har <c5/>, der afviger fra <c6/>; den posts <c7/> afviger fra <c8/>; eller <c9/> er <c10/>, og et af <c11/>, <c12/>, <c13/> gælder. Hvis <c14/> findes og kan fortolkes som et JSON-array, hvis længde afviger fra <c15/>: <c16/>.

seg-0dc49ed14c1f = Hel log. Kun hvis verifikatoren fik de oprindelige logbytes: hvis deres SHA-256 afviger fra <c1/>, <c2/>; ellers, hvis intervallet <c3/> ikke ligger inde i loggen, eller logbytes dér afviger fra <c4/>, <c5/>.

seg-a7f787d6e6df = Tidsstempel. Uden <c1/>: hvis verifikatoren fik besked om at kræve et, <c2/>; ellers intet. Med et: hvis det ikke kan læses som et RFC { "3161" }-bevis eller -svar (se nedenfor), <c3/>; ellers, hvis dets meddelelsesaftryk ikke er hashen, i aftrykkets egen algoritme (SHA-256, SHA-384 eller SHA-512), af bytes i <c4/>: <c5/>.

seg-f7d908c6bf38 = Pakken er verificeret netop når mængden af fejl er tom. Om underskriveren var fastlåst, rapporteres separat og ændrer ikke mængden af fejl.

seg-b0d74519122d = <b>Tidsstempelbevis.</b> Et bevis er en DER-<c1/>, hvis indholdstype er CMS SignedData ({ "1.2.840.113549.1.7.2" }), og hvis indkapslede indholdstype er <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); et svar er en DER-<c3/> (en <c4/> efterfulgt af beviset), hvis status er { "0" } eller { "1" }. Meddelelsesaftrykkets algoritme i <c5/> skal være SHA-256, SHA-384 eller SHA-512 med en digest af den algoritmes længde, og dens <c6/> et rigtigt UTC-kalendertidspunkt. BER med ubestemt længde accepteres ikke. Autoritetens signatur og certifikatkæde kontrolleres kun, når betroede ankre er givet (<c7/>, nedenfor).

seg-2156bf4dabb3 = RFC { "3161" }-tidsstempel (valgfrit)

seg-27a71ea73d7d = Et tidsstempelbevis fra en tidsstemplingsautoritet viser, at manifestet fandtes på et tidspunkt, autoriteten bekræfter. Beviset er over <c1/>, så det rekvireres, efter pakken er lavet (der er ingen måde at levere et på, når pakken oprettes, og <c2/> afviser et bevis, der ikke er over netop det manifest):

seg-7ae6e0326b65 = <c1/> læser beviset (et nøgent bevis eller et fuldt svar), kontrollerer, at det blev givet, og at dets meddelelsesaftryk svarer til hashen af <c2/>, og udskriver det tidspunkt, det angiver. Uden betroede ankre tilføjer den »timestamp authority signature not verified by Kshana« og rapporterer <c3/>; kør linjen <c4/> ovenfor for den del. Et bevis, hvis aftryk afviger, eller som ikke kan fortolkes, er en fejl. Bevisets indholdstyper, aftryks længde og genereringstidspunkt kontrolleres for rimelighed.

seg-88359c107bf1 = Med <c1/> (ét eller flere PEM-certifikater, alle betroede) kontrollerer <c2/> også autoriteten, offline, på samme måde som <c3/>: de signerede attributters meddelelsesdigest, signaturen (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 eller P-384), ESS-bindingen til signeringscertifikatet, underskriverens kritiske udvidede nøgleanvendelse timeStamping og kæden til et selvudstedt anker, hvor hvert certifikat er gyldigt ved beviset <c4/>. En fejl rapporteres som <c5/> med den første kontrol, der fejlede, og <c6/> er kun true, når alt bestod. Tilbagekaldelse (CRL eller OCSP) kontrolleres ikke. Denne verifikator stemmer overens med OpenSSL { "3.0.13" } på { "27" } selvgenererede tilfælde (<c7/>).

seg-f534ae37f10c = <b>Beviset ligger ved siden af det signerede manifest, ikke inde i det.</b> Intet i signaturen eller kæden dækker det, så et bevis kan fjernes, eller et andet gyldigt bevis kan sættes ind, uden at signaturen fejler. <c1/> noterer derfor, når en pakke ikke har noget, og <c2/> gør et manglende bevis til en fejl (<c3/>); et indsat bevis opdages kun, hvis det ikke passer til manifestet. <c4/> afviser at overskrive et eksisterende bevis, medmindre du angiver <c5/>. Hvis et tidsstempel betyder noget for dig, så opbevar beviset og verifikationsresultatet hos dine egne optegnelser, og kræv det.

seg-b993ef559bd0 = Fra kode

seg-de24fd02c7c2 = <c1/> er det ene indgangspunkt, som kommandolinjen og enhver anden flade kalder for at lave en pakke: et scenarie, logens bytes (og navigationsfilens, for RINEX), vinduet som tekst, en titel og et valgfrit oprettelsestidspunkt samt signeringsseedet ind; filerne, antallet af epoker, udsnittet, manifesthashen og underskriverens fingeraftryk ud. Den læser ingen filer og intet ur, så de samme input giver de samme bytes. Under den er <c2/> og <c3/> rene funktioner: bytes ind (<c4/>, et seed på 32 byte, et <c5/> af filer), serialiserbare resultater ud (<c6/>, <c7/>). De bruger ingen filer, intet ur og ingen processtilstand og bygges til <c8/>, så Python-, WebAssembly- og serverfladerne kalder dem uændret. Kommandolinjen er en tynd indpakning om dem.

seg-292a5bc48548 = Hvad en pakke ikke gør

seg-852aca7fc407 = Den kører ikke vurderingen igen. Enhver med den fulde log og <c1/> kan køre <c2/> igen og sammenligne med <c3/>; pakken beviser, hvad der blev registreret, ikke at motoren havde ret.

seg-91639deac47d = Den beviser ikke, at loggen er ægte eller fuldstændig. Hashen af den fulde log binder registreringen til én fil; hvor den fil kom fra, er det operatørens sag at fastslå.

seg-0f721c314fa1 = Den indeholder intet krav om ydeevne for detektion eller afvisning af interferens.

seg-9c361736bf27 = Den er en teknisk registrering og ikke en juridisk udtalelse eller en certificering.

seg-68bcf43b4e27 = <s1>Forrige</s1>Linjedækning

seg-09c0b5fa6e52 = <s1>Næste</s1>Optiske links gennem atmosfæren
