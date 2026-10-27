# docs--evidence-packs: translations (nl)

seg-2247a2344710 = Betekenis

seg-ade1d7072512 = zie hieronder

seg-245fe1f87b08 = Bestand

seg-802d8b6f3afd = Bron: <c1/>

seg-710e7e630acb = Bewijspakketten: een ondertekend dossier van een GNSS-vertrouwensgebeurtenis

seg-dbc796deac2a = <b>Een pakket is een technisch dossier, geen juridisch oordeel.</b> Het vermeldt wat de { -brand }-engine heeft berekend uit een vermelde ontvangerlog onder een vermelde configuratie, en laat iedereen nagaan dat er achteraf niets in is gewijzigd. Het zegt niet wat een gebeurtenis veroorzaakte, wie verantwoordelijk was, of aan enige verplichting is voldaan, of dat de log toont wat de ontvanger werkelijk ontving. Het manifest en de samenvatting zeggen dit allebei.

seg-d99cb540310c = Een bewijspakket is bedoeld voor een incidentrapport, een verzekeraar of de vraag van een toezichthouder: "wat zei uw systeem over het GNSS-signaal tussen deze twee tijdstippen, en kunnen wij dat dossier vertrouwen?"

seg-2fa31fe443b4 = Een pakket maken

seg-983924cb2eea = Voor een pakket dat is gemaakt uit een laboratoriumsessie legt <c1/> de verklaring van de operator over de opstelling (geleid of afgeschermd, demping of behuizing, wat enige RF uitzond) vast in het ondertekende manifest; zie <a1><c2/></a1>. Ze wordt vastgelegd zoals gegeven en nooit geverifieerd.

seg-f01e59c876a3 = <c1/> en <c2/> zijn seconden sinds de eerste epoch van de log, of een ISO-8601 UTC-tijd wanneer de log zijn eigen starttijd vermeldt. <c3/> mag nog geen bestanden bevatten. <c4/> neemt een echte UTC-tijd zoals <c5/> (alles anders wordt geweigerd) of <c6/>, waarmee de aanmaaktijd wordt weggelaten en het pakket byte voor byte reproduceerbaar wordt. De aanmaaktijd is wat de ondertekenaar vermeldt; niets controleert haar tegen een klok, en daar dient het optionele tijdstempeltoken voor.

seg-c72ddd97ad0b = Het sleutelbestand bevat een Ed25519-seed van 32 bytes als { "64" } hexadecimale cijfers; lever uw eigen sleutel (bijvoorbeeld een die in uw sleutelbeheersysteem wordt bewaard) of laat <c1/> er een maken. <c2/> waarschuwt als het bestand door andere gebruikers kan worden gelezen. <c3/> sluit <c4/> uit; noem uw sleutel zo als hij in een checkout staat.

seg-077cbd944c5d = Wat er in een pakket zit

seg-7cf2608b2b2f = De structuur van een bewijspakket. Een ontvangerlog (NMEA, u-blox UBX, RINEX { "3" } of een Android-log) en een tijdvenster gaan in kshana receiver-trust evidence, dat zeven bestanden schrijft: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig en een optioneel timestamp.tsr. Het manifest legt de SHA-256 van de hele log en van elk bestand vast, en een hashketen over de bestanden; de handtekening dekt het manifest. kshana evidence verify controleert de handtekening, de hash van elk bestand, de keten en dat er geen niet-vermeld bestand aanwezig is, en eindigt met { "0" } wanneer het is geverifieerd, { "1" } wanneer er iets is mislukt en { "3" } wanneer de ondertekenaar niet was vastgepind. Een pakket is een technisch dossier, geen juridisch oordeel.

seg-e305279d5b11 = Inhoud

seg-05107c0bd3c8 = de ruwe bytes van de ontvangerlog voor het venster

seg-b19ce12544a5 = het scenario zoals gedraaid (elke monitordrempel, gebeurtenis en vergelijkingsregel), de monitors die draaiden, de kalibratiebasislijn en de scenario-hash; voor een vaartuig ook de adviserende verklaring die elke uitvoer voor een vaartuig draagt (adviserende software, geen typegoedgekeurde navigatieapparatuur); vanaf { "0.36" } de <c1/> (de daadwerkelijk gebruikte tabel <c2/>, het gewicht van de geometriemonitor, elke herkomst en de klasseregels). Mapnamen en inline-payloads zijn verwijderd.

seg-e3c2457161bc = elke epoch in het venster met de statistieken van de engine, de alarmen (de redenen) en de vertrouwenstoestand; vanaf { "0.36" } ook de satelliet-<c1/> (goed, gedegradeerd met redenen, of onbekend waar de log geen satellietgeometrie geeft) en een <c2/> bij elke afleiding (<c3/>, <c4/>, <c5/>)

seg-2e309765271f = een op zichzelf staande samenvatting zonder scripts: identificatie, hashes, resultaten, redenen, een geometriebaan (epochs per geometriestatus) gescheiden van de klassen van de afleidingen ({ "0.36" }), elke drempel, de tabel per epoch en de beperkingen van het dossier

seg-467277f816d2 = engineversie, venster, aanmaaktijd, het formaat en de naam van de log, <b>de SHA-256 van de volledige log</b>, het bereik en de SHA-256 van de slice, de publieke sleutel en vingerafdruk van de ondertekenaar, de grootte en SHA-256 van elk bestand, en een hashketen over de bestanden

seg-7a92ff70ed7f = Ed25519-handtekening over de exacte bytes van <c1/>

seg-b517814b077d = optioneel RFC { "3161" }-tijdstempeltoken

seg-6ad4c5f3afbe = <b>Logslice.</b> De lezer meldt de bron-bytespan van elke epoch, dus de slice is het kleinste bytebereik dat elke epoch in het venster bevat (<c1/>): NMEA, u-blox UBX, RINEX { "3" }-waarnemingen en Android-logs. Ze wordt gehasht als ruwe bytes, nooit als gedecodeerde tekst. Voor een livefeed of RINEX { "2" } is er geen span; de hele log wordt dan meegeleverd en het manifest zegt <c2/> (het venster beperkt welke epochs worden gemeld, niet welke bytes zijn opgenomen). De samenvatting vermeldt welke van toepassing is. Een slice is een dossier van de bytes van het venster, geen op zichzelf staande log: een RINEX-slice heeft bijvoorbeeld geen bestandskop.

seg-c4c81cbd4981 = <b>Hashketen.</b> Het manifest somt de bestanden op in een vaste volgorde. <c1/>; voor elk bestand <c2/> (lengte als { "4" } bytes, big-endian). De laatste schakel is <c3/>. Het herordenen, verwijderen of vervangen van een bestand verandert de keten; de handtekening dekt de keten.

seg-1147c5b0d348 = Een pakket verifiëren

seg-e716ddf7bcc9 = Exitstatus { "0" } betekent geverifieerd; { "1" } betekent dat er iets is mislukt; { "2" } betekent een gebruiksfout; { "3" } betekent dat het pakket intact is maar de ondertekenaar niet was vastgepind (zie hieronder). Elke controle meldt geslaagd, mislukt of overgeslagen, en elke mislukking wordt benoemd:

seg-f6f2cebd9cb0 = Foutcode

seg-312a5d784f42 = het manifest kan niet worden gelezen

seg-6f1b5d9d6711 = geen handtekening, geen hexadecimale handtekening van 64 bytes in kleine letters, of ze verifieert niet over <c1/>

seg-129b78f142f1 = de sleutel is ongeldig, of wijkt af van de sleutel die u hebt opgegeven

seg-c86b25543d55 = een vermeld bestand ontbreekt of wijkt af van het manifest; het bestand wordt genoemd

seg-f98d26abf045 = een bestand zit in het pakket maar niet in het manifest

seg-842bac6a9e69 = een schakel is niet wat zijn invoer oplevert; het bestand wordt genoemd

seg-413034467a64 = het manifest spreekt zichzelf of <c1/> tegen

seg-ef4bfbedca33 = met <c1/>: de log die u hebt is niet de vastgelegde, of de slice is niet dat bereik ervan

seg-dcd686ac77f7 = Het wijzigen van één byte van een bestand laat de verificatie mislukken met de bijpassende reden: een gewijzigd artefact wordt gemeld als hashafwijking van dat bestand en niets anders; een gewijzigd manifest laat de handtekening mislukken. Het opnieuw berekenen van hashes en de keten na het bewerken van een bestand helpt niet zonder de ondertekeningssleutel; dan mislukt alleen de handtekening.

seg-066fe7c07bf6 = <b>Pin de sleutel vast.</b> Zonder <c1/> bewijst een pakket alleen dat het intact is ten opzichte van de sleutel die het zelf noemt, en die kan iedereen genereren. De verificatie eindigt dan dus met { "3" } en zegt "INTACT, BUT THE SIGNER IS NOT PINNED" in plaats van "VERIFIED"; <c2/> accepteert de eigen sleutel van het pakket bewust en drukt "VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)" af. Haal de publieke sleutel van de ondertekenaar bij de ondertekenaar op via een route die u vertrouwt (niet uit het pakket) en geef hem mee met <c3/>: { "64" } hexadecimale cijfers of het bestand <c4/>. Per ongeluk de privésleutel meegeven wordt herkend en geweigerd. De vingerafdruk (de eerste { "128" } bits van de SHA-256 van de sleutel, { "32" } hexadecimale cijfers) wordt afgedrukt om met het oog te vergelijken; de volledige sleutel vastpinnen is de betrouwbare route.

seg-a01c7ba606c9 = Pakketformaat en verificatieprocedure (normatief)

seg-fa43e16b6aba = Deze sectie is de specificatie waaruit een onafhankelijke verificateur wordt geschreven. Woorden in hoofdletters zijn eisen. Een pakket is een map (of een willekeurige afbeelding van bestandsnaam naar bytes) met bestanden die precies zo heten als hieronder; een verificateur werkt op de bytes van elk bestand zoals opgeslagen en serialiseert nooit iets opnieuw.

seg-1fbabb3f1092 = <b>Bestanden.</b> De artefactbestanden zijn, in deze vaste volgorde, <c1/>, <c2/>, <c3/>, <c4/>. Een pakket heeft ook <c5/> en <c6/>, en MAG <c7/> hebben. Elke andere naam is een <em>niet-vermeld bestand</em>.

seg-3ed6e38ad2ee = <b>Hex.</b> Elke hexadecimale tekenreeks bestaat uitsluitend uit kleine letters <c1/>, zonder witruimte; hoofdletters worden niet geaccepteerd. SHA-256-waarden zijn { "64" } cijfers, de publieke sleutel is { "64" } cijfers, de handtekening is { "128" } cijfers.

seg-6609210d003a = <b><c1/>.</b> De 128-cijferige hexadecimale notatie in kleine letters van de Ed25519-handtekening van 64 bytes (RFC { "8032" }, het pure Ed25519-schema) over de exacte bytes van <c2/>, gevolgd door precies één <c3/> en niets anders. De handtekening MOET strikt worden gecontroleerd: een handtekening waarvan de S-waarde niet kleiner is dan de grouporde L is ongeldig.

seg-b163e9f5db66 = <b><c1/>.</b> Een UTF-8 JSON-object. De leden ervan (een verificateur MOET elk lid vinden met het vermelde JSON-type; extra leden worden genegeerd):

seg-ace92bcbfd8a = lid

seg-04f69a0edb2f = type

seg-45425f378b61 = betekenis

seg-6940543aa3c0 = tekenreeks

seg-48d303baac62 = MOET gelijk zijn aan <c1/>

seg-6e57561e7f01 = beschrijvend

seg-abec93a4a488 = tekenreeks of null

seg-7d059c0b6372 = aanmaaktijd, beschrijvend

seg-507d53a53380 = object <c1/>

seg-bb2bcbbf404a = getallen, seconden

seg-64572c65426f = niet-negatief geheel getal

seg-14d421e391dd = het aantal items van de JSON-array in <c1/>

seg-f5e7215e6835 = object

seg-a4117217030c = <c1/> tekenreeks, <c2/> tekenreeks, <c3/> hex, <c4/> niet-negatief geheel getal, <c5/> tekenreeks of null, en <c6/>

seg-02389e71a339 = <c1/> (precies <c2/> of <c3/>; elke andere waarde maakt het manifest misvormd), <c4/> en <c5/> niet-negatieve gehele getallen (byteoffsets, einde exclusief), <c6/> hex

seg-6c9176965aae = <c1/> tekenreeks (<c2/>), <c3/> hex ({ "32" } bytes), <c4/> tekenreeks

seg-dcba59304030 = array van objecten

seg-e42ed5e07430 = één per artefactbestand, in de vaste volgorde: <c1/> tekenreeks, <c2/> tekenreeks, <c3/> niet-negatief geheel getal, <c4/> hex, <c5/> hex

seg-b79c9500b744 = hex

seg-697592bd3757 = de laatste schakel

seg-9da5d92757bd = object, optioneel

seg-2032c208038d = alleen aanwezig in een pakket dat is gemaakt uit een laboratoriumsessie (<c1/>): de verklaring van de operator <c2/>, <c3/>, <c4/>, <c5/> (<c6/> of <c7/>), <c8/> of <c9/>, <c10/>, <c11/> en optioneel <c12/>, vastgelegd zoals gegeven. Ze valt onder de handtekening van het manifest en wordt nooit geverifieerd; een verificateur meldt haar als "attested by the named operator; not verified by Kshana". Anders afwezig, en een pakket zonder haar blijft ongewijzigd

seg-9411be425a80 = <c1/> zijn de eerste { "32" } hexadecimale cijfers van de SHA-256 over de { "32" } bytes van de publieke sleutel.

seg-80e55f2d3496 = Hashketen.

seg-9346fe50efac = <c1/> is de SHA-256 van de { "23" } ASCII-bytes <c2/>. Voor elk artefact in volgorde: <c3/>, waarbij <c4/> wordt genomen uit de vastgelegde <c5/> van het manifest voor dat artefact (zodat de keten een eigenschap van het manifest is en daartegen wordt gecontroleerd, niet tegen de bestanden).

seg-9dd985d8cb03 = <b>Procedure.</b> Een verificateur voert deze stappen in volgorde uit en verzamelt elke mislukking; het resultaat is de <em>verzameling</em> mislukkingen, elk een <c1/> en, waar vermeld, het bestand <c2/>. Hij MAG NIET bij de eerste mislukking stoppen, behalve waar vermeld. <c3/> is de publieke sleutel die de verificateur is opgedragen te vertrouwen, indien er een is.

seg-abb1d2635143 = Geen <c1/>: mislukking <c2/>; stop.

seg-73a4aeb463e8 = Als <c1/> geen JSON-object is met elk lid hierboven in de vermelde typen (inclusief <c2/>-items met elk lid, en <c3/>): mislukking <c4/>. Anders, als <c5/> niet de bovenstaande waarde is: <c6/>.

seg-36c9df2abf34 = Handtekeningfase. Deze fase wordt uitgevoerd of het manifest nu leesbaar was of niet. Als het manifest leesbaar was, is de <em>genoemde sleutel</em> <c1/>; als die niet uit { "64" } hexadecimale cijfers in kleine letters bestaat, mislukking <c2/> (geen genoemde sleutel); anders, als <c3/> niet de vingerafdruk ervan is, mislukking <c4/> (de sleutel blijft bruikbaar). Als er zowel een <c5/> als een genoemde sleutel bestaat en ze verschillen: mislukking <c6/>. De <em>controlesleutel</em> is <c7/> als er een is opgegeven, anders de genoemde sleutel als die er is; met geen van beide is er geen controlesleutel (dit omvat elk geval waarin het manifest niet leesbaar was en geen <c8/> is opgegeven). Als er geen <c9/> is: <c10/>. Anders, als het bestand niet precies { "128" } hexadecimale cijfers in kleine letters plus één <c11/> is: <c12/>. Anders, als er een controlesleutel is die geen geldige Ed25519-publiekesleutelcodering is: <c13/>. Anders, als er een controlesleutel is en de handtekening niet strikt verifieert over de bytes van <c14/> (wat ze ook zijn): <c15/>. (Zonder controlesleutel wordt de handtekening niet gecontroleerd en wordt daarvoor geen mislukking gemeld.)

seg-3dbe07af8fa8 = Als het manifest niet leesbaar was (stap { "2" } gaf <c1/>): stop hier.

seg-b7e03ef2dea5 = Artefacten. Als de namen in <c1/> niet precies de vier hierboven zijn, in volgorde: <c2/>. Daarna, voor elk item van het manifest, in volgorde: als het pakket geen bestand van die naam heeft, <c3/> (naam); anders, als de lengte afwijkt van <c4/>, <c5/> (naam); en, onafhankelijk daarvan, als de SHA-256 van het bestand afwijkt van <c6/>, <c7/> (naam).

seg-24cda5a1d9d8 = Niet-vermelde bestanden: voor elk bestand in het pakket behalve <c1/>, <c2/>, <c3/> en de namen in <c4/> van het manifest: <c5/> (naam).

seg-d103ade9a7c7 = Keten. Doorloop de <c1/> van het manifest in volgorde vanaf <c2/>. Als de <c3/> van een item niet uit { "64" } hexadecimale cijfers in kleine letters bestaat: <c4/> en de keten wordt verlaten (geen controle van het hoofd). Bereken anders de schakel; als die afwijkt van de <c5/> van het item: <c6/> (naam). Na de doorloop, als de keten niet is verlaten en de laatste schakel afwijkt van <c7/>: <c8/>.

seg-be9fade3f879 = Slice en epochs. Meld <c1/> (ten hoogste één keer per reden, en een verificateur meldt de code één keer, ongeacht hoeveel redenen gelden) als een van deze geldt: <c2/>; <c3/>; de <c5/> van het item <c4/> wijkt af van <c6/>; de <c7/> van dat item wijkt af van <c8/>; of <c9/> is <c10/> en een van <c11/>, <c12/>, <c13/> geldt. Als <c14/> bestaat en als JSON-array wordt geparseerd waarvan de lengte afwijkt van <c15/>: <c16/>.

seg-0dc49ed14c1f = Volledige log. Alleen als de verificateur de oorspronkelijke logbytes heeft gekregen: als hun SHA-256 afwijkt van <c1/>, <c2/>; anders, als het bereik <c3/> niet binnen de log valt of de bytes van de log daar afwijken van <c4/>, <c5/>.

seg-a7f787d6e6df = Tijdstempel. Zonder <c1/>: als de verificateur is opgedragen er een te eisen, <c2/>; anders niets. Met een: als het niet kan worden gelezen als RFC { "3161" }-token of -respons (zie hieronder), <c3/>; anders, als de message imprint niet de hash is, in het eigen algoritme van de imprint (SHA-256, SHA-384 of SHA-512), van de bytes van <c4/>: <c5/>.

seg-f7d908c6bf38 = Het pakket is precies dan geverifieerd wanneer de verzameling mislukkingen leeg is. Of de ondertekenaar was vastgepind, wordt apart gemeld en verandert de verzameling mislukkingen niet.

seg-b0d74519122d = <b>Tijdstempeltoken.</b> Een token is een DER-<c1/> waarvan het inhoudstype CMS SignedData is ({ "1.2.840.113549.1.7.2" }) en waarvan het ingekapselde inhoudstype <c2/> is ({ "1.2.840.113549.1.9.16.1.4" }); een respons is een DER-<c3/> (een <c4/> gevolgd door het token) waarvan de status { "0" } of { "1" } is. Het message-imprintalgoritme van de <c5/> moet SHA-256, SHA-384 of SHA-512 zijn met een digest van de lengte van dat algoritme, en de <c6/> ervan een echte UTC-kalendertijd. BER met onbepaalde lengte wordt niet geaccepteerd. De handtekening en de certificaatketen van de autoriteit worden alleen gecontroleerd wanneer vertrouwde ankers zijn opgegeven (<c7/>, hieronder).

seg-2156bf4dabb3 = RFC { "3161" }-tijdstempel (optioneel)

seg-27a71ea73d7d = Een tijdstempeltoken van een tijdstempelautoriteit toont dat het manifest bestond op een tijdstip dat de autoriteit bevestigt. Het token gaat over <c1/>, dus het wordt aangevraagd nadat het pakket is gemaakt (er is geen manier om er een mee te geven wanneer het pakket wordt gemaakt, en <c2/> weigert een token dat niet over precies dat manifest gaat):

seg-7ae6e0326b65 = <c1/> leest het token (een kaal token of een volledige respons), controleert dat het is verleend en dat zijn message imprint gelijk is aan de hash van <c2/>, en drukt het tijdstip af dat het vermeldt. Zonder vertrouwde ankers voegt het "timestamp authority signature not verified by Kshana" toe en meldt <c3/>; voer voor dat deel de regel <c4/> hierboven uit. Een token waarvan de imprint afwijkt, of dat niet parseert, is een mislukking. De inhoudstypen, de imprintlengte en de generatietijd van het token worden op zinnigheid gecontroleerd.

seg-88359c107bf1 = Met <c1/> (een of meer PEM-certificaten, allemaal vertrouwd) controleert <c2/> ook de autoriteit, offline, zoals <c3/> dat doet: de message digest van de ondertekende attributen, de handtekening (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 of P-384), de ESS-binding met het ondertekeningscertificaat, het kritieke extended key usage timeStamping van de ondertekenaar, en de keten naar een zelfuitgegeven anker, waarbij elk certificaat geldig is op de <c4/> van het token. Een mislukking wordt gemeld als <c5/> met de eerste controle die mislukte, en <c6/> is alleen true wanneer alles slaagde. Intrekking (CRL of OCSP) wordt niet gecontroleerd. Deze verificateur komt overeen met OpenSSL { "3.0.13" } op { "27" } zelfgegenereerde gevallen (<c7/>).

seg-f534ae37f10c = <b>Het token staat naast het ondertekende manifest, niet erin.</b> Niets in de handtekening of de keten dekt het, dus een token kan worden verwijderd, of een ander geldig token kan worden vervangen, zonder dat de handtekening mislukt. <c1/> meldt daarom wanneer een pakket er geen heeft, en <c2/> maakt een ontbrekend token tot een mislukking (<c3/>); een vervangen token wordt alleen opgemerkt als het niet bij het manifest past. <c4/> weigert een bestaand token te overschrijven tenzij u <c5/> meegeeft. Als een tijdstempel voor u van belang is, bewaar dan het token en het verificatieresultaat bij uw eigen gegevens, en eis het.

seg-b993ef559bd0 = Vanuit code

seg-de24fd02c7c2 = <c1/> is het ene toegangspunt dat de opdrachtregel en elk ander oppervlak aanroepen om een pakket te maken: een scenario, de bytes van de log (en die van het navigatiebestand, voor RINEX), het venster als tekst, een titel en een optionele aanmaaktijd, plus de ondertekeningsseed gaan erin; de bestanden, het aantal epochs, de slice, de manifesthash en de vingerafdruk van de ondertekenaar komen eruit. Het leest geen bestanden en geen klok, dus dezelfde invoer geeft dezelfde bytes. Daaronder zijn <c2/> en <c3/> zuivere functies: bytes erin (<c4/>, een seed van 32 bytes, een <c5/> van bestanden), serialiseerbare resultaten eruit (<c6/>, <c7/>). Ze gebruiken geen bestanden, klok of processtatus en bouwen voor <c8/>, zodat de Python-, WebAssembly- en serveroppervlakken ze ongewijzigd aanroepen. De opdrachtregel is een dunne laag eromheen.

seg-292a5bc48548 = Wat een pakket niet doet

seg-852aca7fc407 = Het draait de beoordeling niet opnieuw. Iedereen met de volledige log en <c1/> kan <c2/> opnieuw draaien en vergelijken met <c3/>; het pakket bewijst wat is vastgelegd, niet dat de engine gelijk had.

seg-91639deac47d = Het bewijst niet dat de log echt of volledig is. De hash van de volledige log koppelt het dossier aan één bestand; waar dat bestand vandaan kwam, moet de operator vaststellen.

seg-0f721c314fa1 = Het bevat geen bewering over prestaties bij het detecteren of afwijzen van interferentie.

seg-9c361736bf27 = Het is een technisch dossier en geen juridisch oordeel en geen certificering.

seg-68bcf43b4e27 = <s1>Vorige</s1>Lijndekking

seg-09c0b5fa6e52 = <s1>Volgende</s1>Optische verbindingen door de atmosfeer
