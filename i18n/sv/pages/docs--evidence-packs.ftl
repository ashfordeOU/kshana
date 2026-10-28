# docs--evidence-packs: translations (sv)

seg-2247a2344710 = Betydelse

seg-ade1d7072512 = se nedan

seg-245fe1f87b08 = Fil

seg-802d8b6f3afd = Källa: <c1/>

seg-710e7e630acb = Bevispaket: en signerad registrering av en GNSS-förtroendehändelse

seg-dbc796deac2a = <b>Ett paket är en teknisk registrering, inte ett juridiskt utlåtande.</b> Det anger vad Kshana-motorn beräknade utifrån en angiven mottagarlogg under en angiven konfiguration, och låter vem som helst kontrollera att inget i det ändrades efteråt. Det säger inte vad som orsakade en händelse, vem som var ansvarig, om någon skyldighet uppfylldes, eller att loggen visar vad mottagaren verkligen tog emot. Manifestet och sammanfattningen säger båda detta.

seg-d99cb540310c = Ett bevispaket är till för en incidentrapport, en försäkringsgivare eller en myndighetsfråga: "vad sade ert system om GNSS-signalen mellan dessa två tidpunkter, och kan vi lita på den registreringen?"

seg-2fa31fe443b4 = Skapa ett paket

seg-983924cb2eea = För ett paket som skapats från en laboratoriesession registrerar <c1/> operatörens uttalande om uppställningen (ledningsbunden eller skärmad, dämpning eller kapsling, vad som sände ut eventuell RF) i det signerade manifestet; se <a1><c2/></a1>. Det registreras som det angavs och verifieras aldrig.

seg-f01e59c876a3 = <c1/> och <c2/> är sekunder sedan loggens första epok, eller en ISO-8601 UTC-tid när loggen anger sin egen starttid. <c3/> får inte redan innehålla filer. <c4/> tar en verklig UTC-tid som <c5/> (allt annat avvisas) eller <c6/>, vilket utelämnar skapandetiden och gör paketet byte för byte reproducerbart. Skapandetiden är vad undertecknaren anger; ingenting kontrollerar den mot en klocka, vilket är vad den valfria tidsstämpelstoken är till för.

seg-c72ddd97ad0b = Nyckelfilen innehåller ett Ed25519-frö på 32 byte som { "64" } hexadecimala siffror; ange ditt eget (till exempel ett som förvaras i ditt nyckelhanteringssystem) eller låt <c1/> skapa ett. <c2/> varnar om filen kan läsas av andra användare. <c3/> utesluter <c4/>; ge din nyckel ett sådant namn om den ligger i en utcheckad kopia.

seg-077cbd944c5d = Vad ett paket innehåller

seg-7cf2608b2b2f = Strukturen hos ett bevispaket. En mottagarlogg (NMEA, u-blox UBX, RINEX { "3" } eller en Android-logg) och ett tidsfönster går in i kshana receiver-trust evidence, som skriver sju filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig och en valfri timestamp.tsr. Manifestet registrerar SHA-256 för hela loggen och för varje fil samt en hashkedja över filerna; signaturen täcker manifestet. kshana evidence verify kontrollerar signaturen, varje fils hashvärde, kedjan och att ingen olistad fil finns, och avslutas med { "0" } när allt är verifierat, { "1" } när något misslyckades och { "3" } när undertecknaren inte var fastlåst. Ett paket är en teknisk registrering, inte ett juridiskt utlåtande.

seg-e305279d5b11 = Innehåll

seg-05107c0bd3c8 = de råa bytena i mottagarloggen för fönstret

seg-b19ce12544a5 = scenariot som körts (varje övervakartröskel, händelse och jämförelseregel), de övervakare som kördes, kalibreringens baslinje och scenariots hashvärde; för ett fartyg även det rådgivande uttalande som varje fartygsutdata bär (rådgivande programvara, inte typgodkänd navigationsutrustning); från { "0.36" } även <c1/> (den tabell <c2/> som faktiskt användes, geometriövervakarens vikt, varje ursprung och klassreglerna). Katalognamn och inbäddade nyttolaster tas bort.

seg-e3c2457161bc = varje epok i fönstret med motorns statistik, larmen (skälen) och förtroendetillståndet; från { "0.36" } även dess satellit-<c1/> (bra, försämrad med skäl, eller okänd där loggen inte ger någon satellitgeometri) och en <c2/> för varje slutsats (<c3/>, <c4/>, <c5/>)

seg-2e309765271f = en fristående, skriptfri sammanfattning: identifiering, hashvärden, resultat, skäl, ett geometrispår (epoker efter geometristatus) skilt från slutsatsernas klasser ({ "0.36" }), varje tröskel, tabellen per epok och registreringens begränsningar

seg-467277f816d2 = motorversion, fönster, skapandetid, loggens format och namn, <b>SHA-256 för hela loggen</b>, utsnittets intervall och SHA-256, undertecknarens publika nyckel och fingeravtryck, varje fils storlek och SHA-256 samt en hashkedja över filerna

seg-7a92ff70ed7f = Ed25519-signatur över de exakta bytena i <c1/>

seg-b517814b077d = valfri tidsstämpelstoken enligt RFC { "3161" }

seg-6ad4c5f3afbe = <b>Loggutsnitt.</b> Läsaren redovisar källans byteintervall för varje epok, så utsnittet är det minsta byteintervall som rymmer varje epok i fönstret (<c1/>): NMEA, u-blox UBX, RINEX { "3" }-observationer och Android-loggar. Det hashas som råa bytes, aldrig som avkodad text. För en direktström eller RINEX { "2" } finns inget intervall; hela loggen medföljer då och manifestet säger <c2/> (fönstret begränsar vilka epoker som redovisas, inte vilka bytes som ingår). Sammanfattningen anger vilket som gäller. Ett utsnitt är en registrering av fönstrets bytes, inte en fristående logg: till exempel har ett RINEX-utsnitt inget filhuvud.

seg-c4c81cbd4981 = <b>Hashkedja.</b> Manifestet listar filerna i fast ordning. <c1/>; för varje fil, <c2/> (längd som { "4" } bytes, big-endian). Den sista länken är <c3/>. Att ändra ordning på, ta bort eller byta ut en fil ändrar kedjan; signaturen täcker kedjan.

seg-1147c5b0d348 = Verifiera ett paket

seg-e716ddf7bcc9 = Slutstatus { "0" } betyder verifierat; { "1" } betyder att något misslyckades; { "2" } betyder ett användningsfel; { "3" } betyder att paketet är intakt men att dess undertecknare inte var fastlåst (se nedan). Varje kontroll rapporterar godkänd, underkänd eller hoppad över, och varje fel namnges:

seg-f6f2cebd9cb0 = Felkod

seg-312a5d784f42 = manifestet kan inte läsas

seg-6f1b5d9d6711 = ingen signatur, ingen hexadecimal signatur på 64 byte med gemener, eller så verifieras den inte över <c1/>

seg-129b78f142f1 = nyckeln är inte giltig, eller skiljer sig från den du angav

seg-c86b25543d55 = en listad fil saknas eller skiljer sig från manifestet; filen namnges

seg-f98d26abf045 = en fil finns i paketet men inte i manifestet

seg-842bac6a9e69 = en länk är inte vad dess indata ger; filen namnges

seg-413034467a64 = manifestet motsäger sig självt eller <c1/>

seg-ef4bfbedca33 = med <c1/>: loggen du har är inte den som registrerades, eller så är utsnittet inte det intervallet av den

seg-dcd686ac77f7 = Att ändra en enda byte i någon fil gör att verifieringen misslyckas med motsvarande skäl: en ändrad artefakt rapporteras som den filens hashavvikelse och inget annat; ett ändrat manifest gör att signaturen misslyckas. Att räkna om hashvärden och kedjan efter att en fil redigerats hjälper inte utan signeringsnyckeln; då är det bara signaturen som misslyckas.

seg-066fe7c07bf6 = <b>Lås fast nyckeln.</b> Utan <c1/> bevisar ett paket bara att det är intakt mot den nyckel det själv anger, som vem som helst kan generera. Verifieringen avslutas därför med { "3" } och säger "INTACT, BUT THE SIGNER IS NOT PINNED" i stället för "VERIFIED"; <c2/> godtar paketets egen nyckel med öppna ögon och skriver "VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)". Hämta undertecknarens publika nyckel från undertecknaren på en väg du litar på (inte från paketet) och ange den med <c3/>: { "64" } hexadecimala siffror eller filen <c4/>. Att av misstag ange den privata nyckeln känns igen och avvisas. Fingeravtrycket (de första { "128" } bitarna av nyckelns SHA-256, { "32" } hexadecimala siffror) skrivs ut för att jämföras med blotta ögat; att låsa fast hela nyckeln är den pålitliga vägen.

seg-a01c7ba606c9 = Paketformat och verifieringsprocedur (normativt)

seg-fa43e16b6aba = Det här avsnittet är den specifikation som en oberoende verifierare skrivs utifrån. Ord med versaler är krav. Ett paket är en katalog (eller vilken avbildning som helst från filnamn till bytes) med filer som heter exakt som nedan; en verifierare arbetar med bytena i varje fil så som de är lagrade och serialiserar aldrig om något.

seg-1fbabb3f1092 = <b>Filer.</b> Artefaktfilerna, i denna fasta ordning, är <c1/>, <c2/>, <c3/>, <c4/>. Ett paket har också <c5/> och <c6/>, och KAN ha <c7/>. Varje annat namn är en <em>olistad fil</em>.

seg-3ed6e38ad2ee = <b>Hex.</b> Varje hexsträng består enbart av gemena <c1/>, utan blanksteg; versaler godtas inte. SHA-256-värden är { "64" } siffror, den publika nyckeln är { "64" } siffror, signaturen är { "128" } siffror.

seg-6609210d003a = <b><c1/>.</b> Den hexadecimala texten med 128 siffror och gemener för den 64 byte långa Ed25519-signaturen (RFC { "8032" }, det rena Ed25519-schemat) över de exakta bytena i <c2/>, följd av exakt en <c3/> och inget annat. Signaturen MÅSTE kontrolleras strikt: en signatur vars S-värde inte är mindre än gruppordningen L är ogiltig.

seg-b163e9f5db66 = <b><c1/>.</b> Ett UTF-8 JSON-objekt. Dess medlemmar (en verifierare MÅSTE hitta var och en med den angivna JSON-typen; ytterligare medlemmar ignoreras):

seg-ace92bcbfd8a = medlem

seg-04f69a0edb2f = typ

seg-45425f378b61 = betydelse

seg-6940543aa3c0 = sträng

seg-48d303baac62 = MÅSTE vara lika med <c1/>

seg-6e57561e7f01 = beskrivande

seg-abec93a4a488 = sträng eller null

seg-7d059c0b6372 = skapandetid, beskrivande

seg-507d53a53380 = objekt <c1/>

seg-bb2bcbbf404a = tal, sekunder

seg-64572c65426f = icke-negativt heltal

seg-14d421e391dd = antalet poster i JSON-matrisen i <c1/>

seg-f5e7215e6835 = objekt

seg-a4117217030c = <c1/> sträng, <c2/> sträng, <c3/> hex, <c4/> icke-negativt heltal, <c5/> sträng eller null, och <c6/>

seg-02389e71a339 = <c1/> (exakt <c2/> eller <c3/>; varje annat värde gör manifestet felformat), <c4/> och <c5/> icke-negativa heltal (byteavstånd, slutet exkluderat), <c6/> hex

seg-6c9176965aae = <c1/> sträng (<c2/>), <c3/> hex ({ "32" } bytes), <c4/> sträng

seg-dcba59304030 = matris av objekt

seg-e42ed5e07430 = ett per artefaktfil, i den fasta ordningen: <c1/> sträng, <c2/> sträng, <c3/> icke-negativt heltal, <c4/> hex, <c5/> hex

seg-b79c9500b744 = hex

seg-697592bd3757 = den sista länken

seg-9da5d92757bd = objekt, valfritt

seg-2032c208038d = finns bara i ett paket som skapats från en laboratoriesession (<c1/>): operatörens uttalande <c2/>, <c3/>, <c4/>, <c5/> (<c6/> eller <c7/>), <c8/> eller <c9/>, <c10/>, <c11/> och eventuellt <c12/>, registrerat som det angavs. Det täcks av manifestets signatur och verifieras aldrig; en verifierare rapporterar det som "attested by the named operator; not verified by Kshana". Saknas annars, och ett paket utan det är oförändrat

seg-9411be425a80 = <c1/> är de första { "32" } hexadecimala siffrorna av SHA-256 över de { "32" } byten i den publika nyckeln.

seg-80e55f2d3496 = Hashkedja.

seg-9346fe50efac = <c1/> är SHA-256 av de { "23" } ASCII-byten <c2/>. För varje artefakt i ordning, <c3/>, där <c4/> hämtas från manifestets registrerade <c5/> för den artefakten (så kedjan är en egenskap hos manifestet och kontrolleras mot det, inte mot filerna).

seg-9dd985d8cb03 = <b>Procedur.</b> En verifierare utför dessa steg i ordning och samlar varje fel; resultatet är <em>mängden</em> fel, vart och ett en <c1/> och, där det anges, filens <c2/>. Den FÅR INTE stanna vid det första felet utom där det anges. <c3/> är den publika nyckel som verifieraren fått veta att den ska lita på, om någon.

seg-abb1d2635143 = Ingen <c1/>: fel <c2/>; stanna.

seg-73a4aeb463e8 = Om <c1/> inte är ett JSON-objekt med varje medlem ovan i angivna typer (inklusive <c2/>-poster med varje medlem, och <c3/>): fel <c4/>. Annars, om <c5/> inte är det värde som anges ovan: <c6/>.

seg-36c9df2abf34 = Signaturfas. Den här fasen utförs oavsett om manifestet gick att läsa. Om manifestet gick att läsa är den <em>angivna nyckeln</em> <c1/>; om den inte är { "64" } hexadecimala siffror med gemener, fel <c2/> (ingen angiven nyckel); annars, om <c3/> inte är fingeravtrycket av den, fel <c4/> (nyckeln förblir användbar). Om både en <c5/> och en angiven nyckel finns och skiljer sig åt: fel <c6/>. <em>Kontrollnyckeln</em> är <c7/> om en angavs, annars den angivna nyckeln om det finns en; med ingen av dem finns ingen kontrollnyckel (detta gäller varje fall där manifestet inte gick att läsa och ingen <c8/> angavs). Om det inte finns någon <c9/>: <c10/>. Annars, om filen inte är exakt { "128" } hexadecimala siffror med gemener plus en <c11/>: <c12/>. Annars, om det finns en kontrollnyckel som inte är en giltig kodning av en publik Ed25519-nyckel: <c13/>. Annars, om det finns en kontrollnyckel och signaturen inte verifieras strikt över bytena i <c14/> (vad de än är): <c15/>. (Utan kontrollnyckel kontrolleras inte signaturen och inget fel uppstår för det.)

seg-3dbe07af8fa8 = Om manifestet inte gick att läsa (steg { "2" } gav <c1/>): stanna här.

seg-b7e03ef2dea5 = Artefakter. Om namnen i <c1/> inte exakt är de fyra ovan i ordning: <c2/>. Sedan, för varje manifestpost i ordning: om paketet inte har någon fil med det namnet, <c3/> (namn); annars, om dess längd skiljer sig från <c4/>, <c5/> (namn); och, oberoende av det, om SHA-256 för filen skiljer sig från <c6/>, <c7/> (namn).

seg-24cda5a1d9d8 = Olistade filer: för varje fil i paketet utöver <c1/>, <c2/>, <c3/> och namnen i manifestets <c4/>: <c5/> (namn).

seg-d103ade9a7c7 = Kedja. Gå igenom manifestets <c1/> i ordning från <c2/>. Om en posts <c3/> inte är { "64" } hexadecimala siffror med gemener: <c4/> och kedjan överges (ingen kontroll av huvudet). Annars beräknas länken; om den skiljer sig från postens <c5/>: <c6/> (namn). Efter genomgången, om kedjan inte övergavs och den sista länken skiljer sig från <c7/>: <c8/>.

seg-be9fade3f879 = Utsnitt och epoker. Utlös <c1/> (högst en gång per skäl, och en verifierare rapporterar koden en gång oavsett hur många skäl som gäller) om något av: <c2/>; <c3/>; postens <c4/> har ett <c5/> som skiljer sig från <c6/>; den postens <c7/> skiljer sig från <c8/>; eller <c9/> är <c10/> och något av <c11/>, <c12/>, <c13/>. Om <c14/> finns och tolkas som en JSON-matris vars längd skiljer sig från <c15/>: <c16/>.

seg-0dc49ed14c1f = Hela loggen. Endast om verifieraren fick de ursprungliga logg-bytena: om deras SHA-256 skiljer sig från <c1/>, <c2/>; annars, om intervallet <c3/> inte ligger inom loggen eller om loggens bytes där skiljer sig från <c4/>, <c5/>.

seg-a7f787d6e6df = Tidsstämpel. Utan <c1/>: om verifieraren fått veta att den ska kräva en, <c2/>; annars ingenting. Med en: om den inte kan läsas som en token eller ett svar enligt RFC { "3161" } (se nedan), <c3/>; annars, om dess meddelandeavtryck inte är hashvärdet, med avtryckets egen algoritm (SHA-256, SHA-384 eller SHA-512), av bytena i <c4/>: <c5/>.

seg-f7d908c6bf38 = Paketet är verifierat exakt när felmängden är tom. Om undertecknaren var fastlåst rapporteras separat och ändrar inte felmängden.

seg-b0d74519122d = <b>Tidsstämpelstoken.</b> En token är en DER-kodad <c1/> vars innehållstyp är CMS SignedData ({ "1.2.840.113549.1.7.2" }) och vars inkapslade innehållstyp är <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); ett svar är ett DER-kodat <c3/> (en <c4/> följd av token) vars status är { "0" } eller { "1" }. Algoritmen för meddelandeavtrycket i <c5/> måste vara SHA-256, SHA-384 eller SHA-512 med ett kondensat av den algoritmens längd, och dess <c6/> en verklig UTC-kalendertid. BER med obestämd längd godtas inte. Myndighetens signatur och certifikatkedja kontrolleras endast när betrodda ankare anges (<c7/>, nedan).

seg-2156bf4dabb3 = Tidsstämpel enligt RFC { "3161" } (valfri)

seg-27a71ea73d7d = En tidsstämpelstoken från en tidsstämpelmyndighet visar att manifestet fanns vid en tidpunkt som myndigheten intygar. Token gäller <c1/>, så den begärs efter att paketet skapats (det går inte att ange en när paketet skapas, och <c2/> avvisar en token som inte gäller exakt det manifestet):

seg-7ae6e0326b65 = <c1/> läser token (en ren token eller ett fullständigt svar), kontrollerar att den beviljades och att dess meddelandeavtryck är lika med hashvärdet av <c2/>, och skriver ut den tid den anger. Utan betrodda ankare lägger den till "timestamp authority signature not verified by Kshana" och rapporterar <c3/>; kör raden <c4/> ovan för den delen. En token vars avtryck skiljer sig, eller som inte går att tolka, är ett fel. Tokenens innehållstyper, avtryckslängd och genereringstid kontrolleras för rimlighet.

seg-88359c107bf1 = Med <c1/> (ett eller flera PEM-certifikat, alla betrodda) kontrollerar <c2/> också myndigheten, offline, på det sätt som <c3/> gör: de signerade attributens meddelandekondensat, signaturen (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 eller P-384), ESS-bindningen till signeringscertifikatet, undertecknarens kritiska utökade nyckelanvändning timeStamping och kedjan till ett självutfärdat ankare, där varje certifikat är giltigt vid tokenens <c4/>. Ett fel rapporteras som <c5/> med den första kontroll som misslyckades, och <c6/> är sant endast när allt godkändes. Återkallelse (CRL eller OCSP) kontrolleras inte. Den här verifieraren stämmer överens med OpenSSL { "3.0.13" } på { "27" } självgenererade fall (<c7/>).

seg-f534ae37f10c = <b>Token ligger bredvid det signerade manifestet, inte i det.</b> Ingenting i signaturen eller kedjan täcker den, så en token kan tas bort, eller en annan giltig token sättas in, utan att signaturen misslyckas. <c1/> noterar därför när ett paket saknar en, och <c2/> gör en saknad token till ett fel (<c3/>); en utbytt token upptäcks bara om den inte matchar manifestet. <c4/> vägrar skriva över en befintlig token om du inte anger <c5/>. Om en tidsstämpel är viktig för dig, behåll token och verifieringsresultatet bland dina egna uppgifter, och kräv den.

seg-b993ef559bd0 = Från kod

seg-de24fd02c7c2 = <c1/> är den enda ingångspunkt som kommandoraden och varje annan yta anropar för att skapa ett paket: ett scenario, loggens bytes (och navigeringsfilens, för RINEX), fönstret som text, en titel och en valfri skapandetid, plus signeringsfröet, in; filerna, antalet epoker, utsnittet, manifestets hashvärde och undertecknarens fingeravtryck ut. Den läser inga filer och ingen klocka, så samma indata ger samma bytes. Under den är <c2/> och <c3/> rena funktioner: bytes in (<c4/>, ett frö på 32 byte, en <c5/> av filer), serialiserbara resultat ut (<c6/>, <c7/>). De använder inga filer, ingen klocka och inget processtillstånd, och bygger för <c8/>, så ytorna för Python, WebAssembly och server anropar dem oförändrade. Kommandoraden är ett tunt skal runt dem.

seg-292a5bc48548 = Vad ett paket inte gör

seg-852aca7fc407 = Det kör inte om bedömningen. Den som har hela loggen och <c1/> kan köra om <c2/> och jämföra med <c3/>; paketet bevisar vad som registrerades, inte att motorn hade rätt.

seg-91639deac47d = Det bevisar inte att loggen är äkta eller fullständig. Hashvärdet av hela loggen knyter registreringen till en fil; var den filen kommer ifrån är upp till operatören att fastställa.

seg-0f721c314fa1 = Det innehåller inget prestandapåstående om detektering eller avvisning av störning.

seg-9c361736bf27 = Det är en teknisk registrering och inte ett juridiskt utlåtande eller en certifiering.

seg-68bcf43b4e27 = <s1>Föregående</s1>Radtäckning

seg-09c0b5fa6e52 = <s1>Nästa</s1>Optiska länkar genom atmosfären

seg-bd3169455cd0 = Evidensetiketten ({ "0.40" })

seg-6fe796d2b15f = Ett paket byggt med { "0.40" } eller senare bär, inuti <c1/>, en post <c2/> (nivån, <c3/>, <c4/> eller <c5/>, som är den svagaste statusen bland dess rader, samt id:na och kraven för de rader i verifieringsmatrisen som paketets innehåll vilar på: raden för paketets integritet, raderna för receiver-trust, och raderna för jammertest-poängsättning eller rundtur för sådana paket) och <c6/> <c7/>. Den ligger inuti <c8/>, så manifestets filhash, hashkedjan och signaturen täcker den: att ändra den gör att verifieringen misslyckas. <c9/> redovisar nivån och radernas id.

seg-15b4e784361a = Ändringen är additiv och gäller bara framåt. Manifestets <c1/> förblir <c2/>: den normativa texten ovan säger att en verifierare MÅSTE hitta det värdet, och verifieraren byggd från rent blad i <c3/> gör det. Den lägre versionen bärs därför av <c4/> (saknas för ett paket gjort före { "0.40" }, vilket betyder { "1.0" }), inte av en ny sträng <c5/>. Ett paket gjort före { "0.40" } har ingen etikett och verifieras oförändrat; <c6/> säger "no evidence label (pre-0.40 pack)". Testerna är <c7/> (inklusive de incheckade oberoende paketen från före 0.40) och <c8/>.

seg-218641620d3e = <s1>Nästa</s1>Datapartner och rader som lyfts
