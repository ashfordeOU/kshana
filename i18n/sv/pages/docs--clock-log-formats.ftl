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

seg-0b758195e7eb = <b><c1/></b>: ASCII-fas- eller frekvensloggar i TimeLab-stil, den vanliga textform som TimeLab exporterar och som dess ASCII-import och Stable32 läser. Det finns en avläsning per rad: antingen en enda kolumn med likformigt <c2/>, eller två kolumner <c3/>. Kolumner kan avgränsas med blanksteg, kommatecken eller semikolon.

seg-a7ae9e712bea = Rader som börjar med <c1/>, <c2/> eller <c3/> är kommentarer. En kommentar av formen <c4/> (eller <c5/>) anger <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> eller <c12/>, för fas), <c13/> (<c14/> eller <c15/>) eller <c16/> (<c17/> eller <c18/>, för den första av två kolumner).

seg-84cf463d5e74 = En inledande icke-numerisk rad tas som kolumnrubrik.

seg-84f4b59bcdbf = Frekvensdata (relativ frekvens) godtas bara som en enda kolumn. De integreras till fas som <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = TimeLabs binära projektfiler och projektfiler av typen <c1/> läses inte.

seg-3af6e4e7bc73 = Rader i tidsstämpelläge (<c1/>, <c2/>) och TimeLab-lägets pseudotidsstämpelkanal (<c3/>) är tidsstämplar för händelser. Fasen för den valda kanalen är dess tidsstämpel minus den nominella takten: <c4/>, där <c5/> är det hela antalet <c6/> sedan den första händelsen. En missad händelse är en lucka.

seg-cecf9df4ff10 = Rader i intervalläge (<c1/>, eller valfri etikett som börjar med <c2/>) läses direkt som fas, en avläsning per <c3/>. Scenariot måste ange <c4/>, eftersom raden inte bär någon tid.

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

seg-0f061f726ec5 = <s1>Föregående</s1>Test av holdover och tidshårdvara i slingan

seg-3c89cfcbbd04 = <s1>Nästa</s1>Hårdvarusäkerhet

seg-9b52cd5eb4be = tau0 och luckor

seg-9c8042f0d3d7 = <b><c1/></b>: RINEX clock-filer, versionerna { "2.00" } och { "3.00" } till { "3.04" } (inklusive namnfältet på nio tecken i { "3.04" }). Posten <c2/> kontrolleras och varje annan version avvisas, med angivande av den version som hittades: IGS publicerar klockformatet (<c3/>, <c4/>, <c5/>) upp till { "3.04" }, och dokumenten RINEX { "4.00" }, { "4.01" } och { "4.02" } definierar bara observations-, navigerings- och meteorologiska filer, så det finns ingen version { "4.00" } av klockfilen att läsa. Rubriken läses bara för sin <c6/> och hoppas över fram till <c7/>. Av dataposterna behålls bara posterna <c8/> (satellit) och <c9/> (mottagare eller station) för en klocka, vald med namn. Deras första värdefält, klockbiasen i sekunder, är fasen. Fortsättningsrader och posterna <c10/>, <c11/> och <c12/> hoppas över. Epokerna är postens kalenderfält, som sekunder från 1980-01-06 { "00" }:{ "00" }:{ "00" } i filens eget tidssystem, utan omvandling.

seg-b65f4a928891 = <b><c1/></b>: loggar från räknaren TAPR TICC (TICC Operation Manual, revisionerna från { "23" } november { "2016" } och { "15" } december { "2025" }, "measurement modes"). Varje datafält är sekunder med { "12" } decimaler ({ "11" } som standard från firmware { "20251101" }: varje antal upp till { "15" } läses). En tidsstämpel läses från sin decimaltext som ett helt antal femtosekunder, inte som ett binärt flyttal, så att fasen i en logg som tagits dagar efter att räknaren startade behåller räknarens egen upplösning: en tidsstämpel av typen <c2/> vid { "3.0e5" } s har ett avstånd på { "5.8e-11" } s, ungefär räknarens { "60" } ps.

seg-bb51bfa2a834 = Paired Timestamp mode skriver ut samma rader i kanalordning och läses som Timestamp mode; 3-Corner Hat mode lägger till den syntetiserade <c1/>, läst som ovan.

seg-220bc7450e83 = Utdata i Period mode och Debug mode avvisas. En kanal vars avläsningar inte ökar rapporteras som Period mode. Binary Timestamp mode är inte text, och en fil i det läget avvisas med ett meddelande som säger så.

seg-1138c53b3eac = Din egen klocka

seg-1f9cce016fa0 = En tabell <c1/> på klocktypen redovisar hur stabil din egen klocka var, bredvid simuleringen: <c2/> (<c3/>) är <c4/> med ett utdrag på 96 avläsningar från en IGS-satellitklocka som en inbäddad TimeLab-logg. Ersätt <c5/> med <c6/> och <c7/> för din egen fil. Blocket <c8/> i resultatet innehåller hur loggen lästes (format, <c9/> och varifrån den kom, varje glapp) och dess ADEV, TDEV och MTIE; det ändrar inte simuleringen.

seg-584564d1a734 = Styr holdovern med din egen klocka: <c1/>

seg-56799b5fea19 = Loggen anpassas med enhetskortets förfarande i <c1/> (konditionering, kvadratisk term borttagen, brusidentifiering med lagg 1, viktade minsta kvadrater i vitt PM, vitt FM, flicker-FM och slumpvandrings-FM vid de medelvärdestider som har minst { "30" } frihetsgrader). Den namngivna klockan tar sedan <c2/>, <c3/>, <c4/> och den anpassade <c5/>; <c6/> förblir som scenariot har det, eftersom en logg bär sin referens offset, inte klockans efter styrning. Vitt fasbrus anpassas och redovisas men simuleras inte. Resultatet får ett block <c7/> (koefficienterna, anpassningspunkterna, de värden körningen använde, vad som utelämnades, loggens SHA-256) och klockan får id:t <c8/>. Med <c9/> drar ensemblen från den anpassade klockan (blocket <c10/> kräver <c11/>). En anpassning utan frekvensbrus, en logg som är för kort för att anpassas och en <c12/> som inte är <c13/> eller <c14/> är fel som säger så. <c15/> är ett exempel ({ "6" } timmar av en IGS-satellitklocka).

seg-fe695061eed3 = Vad jämförelsen på känt brus (<c1/>) visar, och vad man bör ha i åtanke:

seg-90657795ba62 = Nådda: nivån för vitt FM återfinns inom { "5" } % på varje syntetisk post som har det; det anpassade kortet återger den verkliga Allan-deviationen inom en faktor { "1.35" } vid varje medelvärdestid det anpassades vid; brusexponenten som anpassningen identifierar är lika med allantools vid varje punkt (på posten 5071A, sedan det fassteg som konditioneringen tar bort också har tagits bort ur allantools indata).

seg-f1ec27a393ae = <b>Inte nådda, och fastlåsta av testet:</b> slumpvandrings-FM återfinns bara när det dominerar de längsta medelvärdestiderna i posten, och även då i en av tre poster i en serie på { "131 072" } s med en övergång vid { "3 000" } s gav anpassningen den till flicker-FM och till driften. Uppdelningen mellan slumpvandrings-FM och flicker-FM är inte tillförlitlig utifrån en enda post. Körningen återger loggens stabilitet över de medelvärdestider som loggen täcker; bortom dem divergerar de två valen (flicker-FM är ett konstant golv, slumpvandrings-FM växer som kvadratroten av medelvärdestiden).

seg-88ba5ae782d4 = MODELLED: ett vad-händer-om för den klockans brus så som loggen visar det, inte en kalibrering av klockan och inte en förutsägelse av dess framtida beteende.

seg-6e88b597bbf0 = En felaktigt formad logg är ett fel som namnger vad som hittades (raden, versionen, den saknade väljaren), aldrig ett partiellt resultat: <c1/> låser fast { "24" } sådana fall.

seg-4a05abb27420 = MODELLED. Detta är en tolk, och dess utdata matar skattare som är validerade på annat håll mot allantools. Enhetstesterna i <c1/> använder små handskrivna loggar, och för formaten linuxptp och chrony fixturerna i <c2/>. <c3/> kör den jämförelse som förhandsregistrerades i <c4/>: tre syntetiska loggar med frö, en per format, återinlästa av en oberoende läsare skriven utifrån den här sidan av samma författare, med ADEV, TDEV och MTIE kontrollerade mot allantools { "2024.6" }; den jämförelsen täcker bara de tre första formaten, och läsarna för linuxptp och chrony har tolktester men ingen jämförelse mot oberoende referens. Loggarna i den jämförelsen är syntetiska, så ingenting där beskriver en verklig klocka eller räknare; jämförelsen på uppmätta serier beskrivs nedan.

seg-576211abf0b4 = På uppmätta data

seg-3c8d10e8bd1c = <c1/> kör den jämförelse som förhandsregistrerades i <c2/> (incheckad före varje fixtur eller körning) på fyra uppmätta serier: Stable32-filen <c3/>, de första { "65 536" } avläsningarna av en 5071A-cesiumklocka mot en vätemaser, och klockorna för IGS-satelliten G01 ({ "30" } s) och stationen ABMF ({ "300" } s) från IGS slutliga klocka för 2026-08-02, som ett medföljande utsnitt med sin NOTICE. De två första har ingen rätt till vidaredistribution: loggarna som skrivits från dem ligger i den git-ignorerade <c4/> (<c5/>), och testet säger så och godkänns när de saknas om inte <c6/>. Varje logg läses av motorn och av en oberoende läsare, och ADEV, TDEV och MTIE jämförs med allantools { "2024.6" }. Redovisat i <c7/>: på den levererade läsaren föll TICC-loggarna, rubrikens version och fem felmeddelanden på de trösklar som fastställts i förväg; de rättades och jämförelsen kördes om oförändrad. Nådd, utom för ett par: MTIE för en frekvenslogg avviker från allantools, eftersom allantools integrerar frekvensen minus dess medelvärde (fastlåst som NOT MET; jämförelsen på lika villkor nås). Raden förblir MODELLED: TICC-loggarna är uppmätta klockdata som vårt skript har kodat om till räknarens layout (ingen verklig TICC-inspelning hittades), och referensläsaren har samma författare som motorns.

seg-52778d17f4db = Styr holdovern med din egen klocka: [clock_fit]
