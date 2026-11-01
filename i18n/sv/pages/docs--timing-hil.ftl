# docs--timing-hil: translations (sv)

seg-f8cf777c0caa = Ytor

seg-f2ce7fc60cdf = Format

seg-d00b65801e9b = Steg

seg-0d580ea8043d = Ett holdover-test poängsatt utifrån en tidsfelspost, från en verklig körning av motor v{ $version } på scenarios/holdover-test-example.toml ({ "601" } sampel var { "5" } s). GNSS tas bort av operatören vid { "600" } s och återställs vid { "2400" } s; tidsfelet driver till { "299" } ns vid holdoverns slut, förbi budgeten på { "100" } ns efter { "675" } s, och återgår inom bandet på { "100" } ns { "70" } s efter återställningen. Utfall: baslinjemasker PASS, holdover-masker FAIL, holdover-envelope FAIL, återhämtning RECOVERED. Uppmätt mot masken, inte ett godkännande. Tiderna är operatörens uppgift, inte verifierade av Kshana. Rådgivande: analysutdata från ett forsknings- och teknikverktyg, inte typgodkänd navigationsutrustning och inte en safety-of-life-tjänst.

seg-7a1246297c82 = Källa: <c1/>

seg-6ea3dec83080 = Tidssynkronisering med hårdvara i loopen: dra ur antennen, poängsätt holdovern

seg-5901f0b26939 = Telekom- och elnätsoperatörer testar ett tidssynkroniseringssystem genom att ta bort dess GNSS och se vad klockan gör. Kshana gör inte det åt dem och rör inte deras utrustning. Den läser tidsfelsregistreringen som operatörens egna instrument producerade, delar upp den vid de två tider operatören anger och <b>mäter varje steg mot offentliga ITU-T-masker</b>. Scenariotypen är <a1><c1/></a1>; exempelscenarierna är <c2/> och <c3/>.

seg-daf4b071bad0 = Det här är hårdvarusäkerhet <b>steg { "1" }</b>: passivt, endast mottagning, ingen RF från Kshana (<a1><c1/></a1>). Rådgivande programvara, inte typgodkänd utrustning. Ingen har betygsatt, godkänt eller granskat den här proceduren, och den säger ingenting om huruvida ett system klarar en rekommendation.

seg-da0c48bbe011 = Proceduren

seg-e753ca7a1c99 = Operatören utför fyra steg. Kshana utför inget av dem.

seg-0c338b956741 = Vad operatören gör

seg-ebd95b343349 = Vad registreringen visar

seg-03999de98059 = { "1" }. Baslinje

seg-730f2037d22a = Låter systemet gå låst mot GNSS så länge testet behöver (och noterar hur många dygn det hade varit låst dessförinnan).

seg-f45aae4139bd = Tidsfelet medan det är disciplinerat.

seg-0f050dcede80 = { "2" }. GNSS borttaget

seg-50c0df832eda = Tar bort GNSS från systemet under test, till exempel antennkabeln vid mottagaren eller utgången från laboratoriets egen simulator, och <b>antecknar tiden</b>. Kontrollera mottagartillverkarens handbok först: vissa mottagare matar antennen, och vissa behöver en avslutning på den öppna porten.

seg-e371e7e357e3 = Ögonblicket då tidsfelet börjar vandra.

seg-f05dc0acb396 = { "3" }. Holdover

seg-a98186503e0f = Lämnar systemet på sin egen oscillator under den planerade tiden.

seg-1da66cdca856 = Systemets holdover.

seg-61197c9bad91 = { "4" }. Återhämtning

seg-75af1f4fec83 = Återställer GNSS och <b>antecknar tiden</b>.

seg-1259d36fc78c = Tidsfelet som återvänder (eller inte).

seg-c09b1ea8f1a4 = Två saker som operatören måste göra, eftersom Kshana inte kan:

seg-31f6c357864b = Ange de två tiderna.

seg-59f9eb10035a = <c1/> och <c2/> är operatörens uppgift. Kshana upptäcker inte borttagningen i registreringen och verifierar inte tiderna. En felaktig tid flyttar stegens gränser och därmed resultatet.

seg-6d0d3186fbe3 = <b>Använd samma klocka för registreringen och tiderna.</b> För en klocklogg börjar tidsaxeln vid den första avläsningen, så de två tiderna anges i sekunder från loggens första rad.

seg-bd181a831803 = Vad som ska registreras

seg-52758c10be0a = Vilken som helst av dessa, via de befintliga läsarna för <c1/> (<a1><c2/></a1>):

seg-fef0034cb88b = Instrument

seg-ad6f33d70f3f = Hur registreringen görs

seg-ef7f547609ad = linuxptp <c1/> (servot i slav- eller gränsklockan)

seg-f548a2ae96e5 = kör med <c1/> och behåll raderna <c2/>

seg-9a3b58be1b0b = linuxptp <c1/>

seg-77255f8f5fef = raderna <c1/>

seg-2cf9256bd790 = linuxptp <c1/>

seg-c667a97b92a8 = raderna <c1/>

seg-ed305bcea4f8 = chrony <c1/>

seg-021b760aae59 = <c1/> i <c2/>

seg-a7f2d72a5cb7 = chrony <c1/>

seg-a70952a099d5 = <c1/> i <c2/>

seg-6ad29120ffe7 = en TAPR TICC-räknare

seg-32f703bfcab7 = tidsstämpelläge mot referensen

seg-6862a9ac9a68 = en TimeLab ASCII-export

seg-b5e7e3a272d6 = fas i en angiven enhet

seg-8af4aac4426f = en RINEX-klockfil

seg-21d5c43719f2 = en klocka

seg-3a82b5295ab1 = något annat

seg-6bebda4a3c6c = <c1/> eller <c2/>

seg-9a443cc0c444 = <c1/>-par, likformigt samplade

seg-b8d1d45df70b = <b>Vad registreringen mäter spelar roll.</b> En servologg (linuxptp, chrony) registrerar den offset som daemonen mätte och korrigerar: det är tidsfelet som återstår under servostyrning, inte en oberoende mätning av klockan mot UTC. Under holdover-steget i ett test som verkligen tar bort referensen visar en servologg fortfarande vad daemonen trodde, vilket kan skilja sig från det verkliga felet. En TICC eller annan räknare mot en oberoende referens är den starkare registreringen; ange vilken du använde när du rapporterar resultatet.

seg-6d4e25914d1c = Scenariot

seg-ca1244db2387 = Valfria nycklar: <c1/> (namn, <c2/>, källa; standardvärdena för telecom-timing när de saknas) och <c3/> inuti <c4/> för att välja en källa ur en logg som innehåller flera.

seg-38eb634b7f8f = Vad rapporten innehåller

seg-6a64755e11d6 = <b><c1/></b>: för baslinjen, holdovern och återhämtningen, start och slut, antalet sampel samt medelvärde, rms, största värde och slutvärde för tidsfelet.

seg-cd11d0838c44 = <b><c1/></b>: varje mask du namngav, mätt på det steg som dess villkor anger. En mask skriven för en låst klocka mäts på baslinjen; en skriven för holdover eller en självständig klocka mäts på holdovern. Varje kontroll har sin gräns, det uppmätta värdet, marginalen och tabellen den är avskriven från. En mask som behöver en längre registrering än steget gav är <b>INCOMPLETE</b>, aldrig extrapolerad; en som motorn inte kan utvärdera för registreringens samplingsintervall är <b>NOT-EVALUATED</b> med skälet angivet.

seg-cb54e67ca4eb = <b><c1/></b>: den relativa frekvensoffset som systemet höll (lutningen på en minsta kvadrat-linje genom holdover-tidsfelet, i ns/s, vilket är miljarddelar), residualen kring den linjen, det största absoluta tidsfelet och när det inträffade, samt steget vid borttagningsögonblicket.

seg-daa40ac07396 = <b><c1/></b>: ePRTC-A:s holdover-kurva enligt ITU-T G.8272.1 tabell { "3" }, utifrån <c2/>, med tiden då den först överskrids.

seg-cd480a1bf901 = <b><c1/></b>: tiden efter borttagningen då varje tidsfelsbudget först överskrids.

seg-007a0393cb39 = <b><c1/></b>: om <c2/> kom in i bandet och stannade där under uppehållstiden, hur lång tid efter att GNSS återvänt det började, toppen efter återställningen och det största steget mellan på varandra följande sampel under återhämtningen.

seg-199497dfcc09 = <b><c1/></b>: MTIE och TDEV för baslinje- och holdover-stegen.

seg-ce00a41a322f = <b><c1/></b>: en sammanfattning på ett ord per steg.

seg-c09fc305ead1 = Varje tal har sin enhet och sitt ursprung i rapportens <c1/>-block.

seg-5d87a772c132 = Orden och gränserna

seg-0810b24c6f3e = Resultatet är <b>uppmätt mot masken</b>. Maskerna är avskrivna från fritt nedladdningsbara ITU-T-rekommendationer (samma tabeller som typen <c1/>, listade i <a1><c2/></a1>), och varje post som rekommendationerna lämnar "for further study" saknas, den är inte ifylld. Kshana säger inte att en klocka eller ett system klarar eller är godkänt mot en rekommendation, och det gör inte rapporten heller.

seg-527189cf37c6 = <b>MODELLED.</b> Steglogiken, linjeanpassningen och återhämtningsregeln är kontrollerade på registreringar byggda av formler vars svar är kända före körningen; ingen laboratorie-holdover har poängsatts mot en oberoende extern referens, och ingen partner eller något laboratorium har gått med på något. Ett tidslaboratorium skulle behövas innan någon siffra per klockklass kunde lyftas upp.

seg-ad8160fbed46 = <b>Vad som inte täcks</b>, angivet i varje rapport: om GNSS verkligen togs bort och återställdes vid de angivna tiderna; varje steg som operatören inte registrerade; masker definierade genom ett filter på { "0.1" } Hz för en registrering samplad långsammare än en gång per sekund; instrumentets egen mätosäkerhet; och varje procedur i en rekommendation utöver en tidsfelsregistrering (temperaturprofiler, last i paketnät).

seg-cf681db42f05 = <b>Återhämtningsbandet är testets eget val.</b> Standardvärdet { "100" } ns är det största absoluta tidsfelet för en PRTC-A (ITU-T G.8272); det är en praktisk linje, inte ett krav i någon rekommendation för återhämtning.

seg-4ce2f2052df4 = <b>Ingen sändningsväg.</b> Kshana läser filer. Den genererar ingen signal, och att ta bort GNSS i ett laboratorium görs med laboratoriets egen utrustning och under dess eget tillstånd.

seg-0cff831a8444 = <c1/> är en scenariotyp, så den körs överallt där typer körs: <c2/>, Rust-API:et (<c3/>), Python-bindningen (<c4/>), bygget för WebAssembly och npm (inbäddad <c5/> eller <c6/>; filnycklarna finns inte där), MCP-servern (<c7/>, endast inbäddat innehåll) och Kshana Studios scenariokörare. De två scenariofilerna medföljer (<c8/>).

seg-432c07a8e6f5 = <s1>Föregående</s1>Deceived time

seg-8499ae539222 = <s1>Nästa</s1>Klockloggformat
