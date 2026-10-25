# docs--clock-log-formats: translations (sv)

seg-ca2fcdd60f65 = Källa: <c1/>

seg-0dfd1160c5d7 = Klockloggsformat

seg-f52a62872493 = <c1/> läser en uppmätt klocklogg till en enda normaliserad fasserie: ett likformigt nät av <c2/>-sampel, med samplingsintervallet <c3/> angivet eller funnet, varje lucka räknad och loggens enheter namngivna. Åtta format läses, vart och ett en dokumenterad delmängd. Allt utanför delmängden avvisas med ett fel som namnger det som hittades, i stället för att läsas ungefärligt.

seg-dbdbfec37ab6 = <b>Förkortningar.</b> RINEX är Receiver Independent Exchange Format. TICC är TAPR:s (Tucson Amateur Packet Radio) tidsintervallräknare. ADEV är den överlappande Allan-deviationen, TDEV tidsdeviationen och MTIE det maximala tidsintervallfelet. <c1/> är samplingsintervallet i sekunder.

seg-1d5a6c2090af = Var en logg kan användas

seg-2a391645eeeb = <b><c1/></b>: <c2/> i stället för <c3/> eller <c4/>. Loggens fas, i ns, är den tidsfelserie som kontrolleras mot maskerna, och rapporten får ett block <c5/> som anger hur den lästes.

seg-4c2a67008451 = <b>Slaget clock</b>: en tabell <c1/> lägger till ett block <c2/> i körningen: hur loggen lästes, SHA-256 för tabellen (<c3/>; körningens <c4/> omfattar inte tabellen) och för fassampeln, samt den överlappande ADEV, TDEV och MTIE vid oktavvisa medelvärdesfaktorer. Den kräver <c5/>. Den simulerade holdovern är oförändrad.

seg-2f464fe709c9 = Utan tabellen tolkas, hashas och redovisas båda slagen precis som förut.

seg-c931c5ec2f4a = Formaten

seg-7f608c733407 = <b><c1/></b>: RINEX-klockfiler, versionerna { "2" } och { "3.00" } till { "3.04" } (inklusive namnfältet på nio tecken i { "3.04" }). Huvudet läses bara för sitt <c2/> och hoppas över fram till <c3/>. Av dataposterna behålls bara posterna <c4/> (satellit) och <c5/> (mottagare eller station) för en klocka, vald med namn. Deras första värdefält, klockbiasen i sekunder, är fasen. Fortsättningsrader och posterna <c6/>, <c7/> och <c8/> hoppas över. Epoker är postens kalenderfält, som sekunder från 1980-01-06 { "00" }:{ "00" }:{ "00" } i filens eget tidssystem, utan omvandling.

seg-0b758195e7eb = <b><c1/></b>: ASCII-fas- eller frekvensloggar i TimeLab-stil, den vanliga textform som TimeLab exporterar och som dess ASCII-import och Stable32 läser. Det finns en avläsning per rad: antingen en enda kolumn med likformigt <c2/>, eller två kolumner <c3/>. Kolumner kan avgränsas med blanksteg, kommatecken eller semikolon.

seg-a7ae9e712bea = Rader som börjar med <c1/>, <c2/> eller <c3/> är kommentarer. En kommentar av formen <c4/> (eller <c5/>) anger <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> eller <c12/>, för fas), <c13/> (<c14/> eller <c15/>) eller <c16/> (<c17/> eller <c18/>, för den första av två kolumner).

seg-84cf463d5e74 = En inledande icke-numerisk rad tas som kolumnrubrik.

seg-84f4b59bcdbf = Frekvensdata (relativ frekvens) godtas bara som en enda kolumn. De integreras till fas som <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = TimeLabs binära projektfiler och projektfiler av typen <c1/> läses inte.

seg-3d8853fa9c92 = <b><c1/></b>: loggar från räknaren TAPR TICC (TICC Operation Manual, revision av { "23" } november { "2016" }, "measurement modes"). Varje datafält är sekunder med { "12" } decimaler.

seg-3af6e4e7bc73 = Rader i tidsstämpelläge (<c1/>, <c2/>) och TimeLab-lägets pseudotidsstämpelkanal (<c3/>) är tidsstämplar för händelser. Fasen för den valda kanalen är dess tidsstämpel minus den nominella takten: <c4/>, där <c5/> är det hela antalet <c6/> sedan den första händelsen. En missad händelse är en lucka.

seg-cecf9df4ff10 = Rader i intervalläge (<c1/>, eller valfri etikett som börjar med <c2/>) läses direkt som fas, en avläsning per <c3/>. Scenariot måste ange <c4/>, eftersom raden inte bär någon tid.

seg-75301936698f = Utdata i periodläge och felsökningsläge avvisas. En kanal vars avläsningar inte ökar redovisas som periodläge.

seg-5ec2509907dd = Rader som börjar med <c1/>, och rader som inte är <c2/> (till exempel startmenyn), hoppas över och räknas.

seg-cb4b7062dd5a = loggar från linuxptp och chrony

seg-c6c70813a988 = Dessa fem format läser det som en tidsdaemon i drift skriver om sin egen klocka. De är till för att kontrollera en tidskedja i efterhand (en boundary-klocka, en grandmasters PHC, en chrony-klient) med samma skattare som för de andra loggarna. De läser inte en daemons konfiguration, och ingenting här pratar med en daemon.

seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: servoraderna från linuxptp, där varje format bara läser rader från sitt eget program. En avläsning är en rad av formen

seg-e32842403b6b = Tidsstämpeln är den första <c1/> på raden (daemonens monotona klocka). Den läses också efter ett syslog-prefix, där ett process-id som <c2/> saknar bråkdel och inte tas.

seg-72678cd6c03e = Fasen är den loggade <c1/>, i nanosekunder, omvandlad till sekunder. Det är daemonens uppmätta tidsfel hos sin slavklocka mot sin referens, som loggat: positivt när slaven ligger före. Det är felet som återstår under servostyrning, inte driften hos en fritt gående klocka.

seg-f9080412572a = Orden mellan tidsstämpeln och <c1/> namnger källan (<c2/>, <c3/> för ett prefix <c4/>, <c5/>, <c6/>). En logg med mer än en källa behöver <c7/>; felet listar dem.

seg-5bef874341f2 = Avläsningar innan servot först redovisar <c1/> (låst) utelämnas och räknas i <c2/>: <c3/> och <c4/> är de olåsta tillstånden och stegtillstånden, vilkas förskjutningar är transienter vid inkoppling. Ett servo som aldrig når <c5/> avvisas. En rad utan tillståndsfält läses som den är.

seg-121fbe1486cf = Sammanfattningsrader (<c1/>), meddelanden om <c2/> och <c3/> samt rader från andra program hoppas över och räknas.

seg-92164f4a56be = Tidsstämplar som går bakåt (en omstartad daemon) avvisas; dela upp loggen.

seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: chronys filer <c3/> och <c4/>, lästa efter kolumnposition. En avläsning är en rad med minst { "14" } kolumner (tracking) eller { "13" } (statistics) som börjar med ett UTC-datum och en tid i formen <c5/>. Kolumnrubrikraden hoppas över och räknas; regeln <c6/> under den hoppas över utan att räknas.

seg-bae4f6895d14 = Tracking: kolumn { "7" }, den lokala förskjutningen vid klockuppdateringen, i sekunder. IP-adressen eller referens-id:t ändras med den valda källan, så utan <c1/> läses varje rad som en enda lokal klocka. <c2/> behåller ett referens-id.

seg-12b284cd7d8c = Statistics: kolumn { "5" }, den skattade förskjutningen hos en källa, i sekunder. Det finns en serie per källadress, och loggen behöver <c1/> när den innehåller fler än en.

seg-197645e3c7c5 = Epoker är sekunder från 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, utan hantering av skottsekunder. Chrony skriver en rad per uppdatering eller per källsampel, så avståndet är inte likformigt. <c1/> är medianavståndet; en avläsning under en halv <c2/> efter den som behölls före den tas bort och räknas i <c3/>, och ett längre avstånd är en lucka, vilket <c4/> redovisar. Ange <c5/> och <c6/> för en logg med ett stadigt pollintervall.

seg-61fbb0479c95 = Kolumnerna i chrony och radlayouterna i linuxptp är de som anges i daemonernas publika dokumentation. Testfilerna i <c1/> är skrivna för Kshana med påhittade värden (se dess <c2/>); ingen verklig logg har lästs, så en layout som skiljer sig mellan daemonversioner kan fortfarande avvisas eller misstolkas. En rad som inte stämmer hoppas över och räknas, aldrig gissas.

seg-b120a37b7d60 = <c1/> och luckor

seg-6fd68aad2fd7 = När loggen bär tidsstämplar och inget <c1/> anges är <c2/> medianavståndet mellan på varandra följande tidsstämplar, avrundat till fyra värdesiffror, och källan redovisas som <c3/>. En räknares avstånd skiljer sig från det nominella med referensens frekvensförskjutning, miljondelar eller mindre ({ "10" }^{ "6" }). Ett <c4/> i scenariot gäller alltid (källa <c5/>), därefter en huvudkommentar <c6/> (källa <c7/>).

seg-59e52611a7d3 = Sampel placeras på nätet <c1/>, och en saknad epok är en lucka. Avläsningar som ligger mer än { "1" } % av <c2/> från nätet tas bort och räknas, liksom dubbletter (den första behålls). Lucklinjen är en av:

seg-61b1664a7c48 = <c1/> (standard): varje lucka är ett fel som räknar luckorna;

seg-593c998b65e0 = <c1/>: behåll den längsta luckfria sekvensen;

seg-f184ce746389 = <c1/>: fyll inre luckor med linjär interpolation och redovisa antalet fyllda.

seg-1f3dc3429615 = Skattarna behöver ett luckfritt register, vilket är därför luckor löses här.

seg-fe7d27a473aa = MODELLED. Detta är en tolkare, och dess utdata matar skattare som är validerade på annat håll mot allantools. Enhetstesterna i <c1/> använder små handskrivna loggar, och för formaten linuxptp och chrony testfilerna i <c2/>. <c3/> kör den jämförelse som förhandsregistrerades i <c4/>: tre fröstyrda syntetiska loggar, en per format, inlästa på nytt av en oberoende läsare skriven utifrån den här sidan av samma författare, med ADEV, TDEV och MTIE kontrollerade mot allantools { "2024.6" }; den jämförelsen täcker bara de tre första formaten, och läsarna för linuxptp och chrony har tolkartester men ingen jämförelse mot oberoende referens. Loggarna är syntetiska, så ingenting här beskriver en verklig klocka eller räknare.

seg-0f061f726ec5 = <s1>Föregående</s1>Test av holdover och tidshårdvara i slingan

seg-3c89cfcbbd04 = <s1>Nästa</s1>Hårdvarusäkerhet

seg-9b52cd5eb4be = tau0 och luckor
