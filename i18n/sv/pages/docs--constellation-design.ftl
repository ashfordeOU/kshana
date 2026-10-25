# docs--constellation-design: translations (sv)

seg-f63dd3d7aad4 = Källa

seg-8f0e4021404d = Källa: <c1/>

seg-44196ab9678c = Sorten <c1/> bygger en eller flera satellitkonstellationer kring jorden, månen, Mars eller någon annan kropp i solsystemskatalogen (<c2/>: de åtta planeterna, Pluto, månen, Phobos, Deimos, de fyra galileiska månarna och Titan, med samma konstanter som sorterna <c3/> och <c4/> använder; se <a1>SOLAR-SYSTEM.md</a1>) och kartlägger deras täckning och geometriska försämring av precisionen (DOP) över ett latitud-/longitudrutnät. Källa: <c5/>.

seg-61385c509a3d = Kroppen väljs med <c1/> (standard <c2/>). Körningen spänner över <c3/> (standard ett siderealt dygn, { "86 164" } s) i steg om <c4/> (standard { "600" } s), över <c5/> (standard { "5" } deg), på ett rutnät med <c6/> (standard { "10" } deg) som <c7/>, <c8/>, <c9/> och <c10/> kan begränsa; <c11/> lägger till den sekulära driften från J2, den andra zonala harmoniska komponenten i kroppens gravitationsfält.

seg-d02f6d747522 = Vad som går in

seg-743e68478333 = <b>Walker-skal</b> i konventionen <c1/>: <c2/> satelliter i <c3/> likformigt fördelade plan med fasning <c4/>. Ett <em>delta</em>-mönster sprider de uppstigande noderna över { "360" } deg, ett <em>star</em>-mönster över { "180" } deg. Plan <c5/> ligger vid nod <c6/> och satellit <c7/> i det vid medelanomali <c8/>.

seg-d86b01d633a0 = <b>Explicita elementuppsättningar</b>: halv storaxel eller höjd, excentricitet, inklination, rektascension för den uppstigande noden (RAAN), perigeumargument och medelanomali.

seg-0737ef1ddb72 = <b>Förinställningar</b> från publicerade nominella element (endast jorden; en förinställning kring en annan kropp är ett fel):

seg-587beeccaa11 = Förinställning

seg-1ff32b87e030 = Satelliter

seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5th edition, april { "2020" }, Tables 3.2-1 and 3.2-3

seg-fb6956d09acc = { "24" } till { "30" }

seg-f679ee0f3a3f = SPS PS Table 3.2-2: var och en av de sex utbyggbara positionerna (B1, D2, F2, A2, C4, E3) som nämns i <c1/> ersätts av sitt par fram och akter; som standard alla sex

seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), issue { "1.1" }: Walker 24/3/1, halv storaxel { "29 599.801" } km, { "56" } deg (Table { "1" }), positioner enligt Table { "23" }

seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), avsnitt { "4.1" }: Walker 24/3/1 i medelhög jordbana (MEO) på { "21 528" } km och { "55" } deg, plus tre geostationära (GEO) satelliter vid { "80" }, { "110.5" } och { "140" } deg E och tre lutande geosynkrona (IGSO) satelliter vid { "55" } deg

seg-70a32cd2402d = GLONASS Interface Control Document (ICD), edition { "5.1" } ({ "2008" }), avsnitt { "5.2" }: positionsformel, { "19 100" } km, { "64.8" } deg

seg-654d7aceff94 = GPS-tabellens RAAN är tröghetsbaserad vid sin epok; förinställningen omvandlar den till en jordfast nodlongitud med den Greenwich-timvinkel som tabellen anger ({ "100.765" } deg). GLONASS anger absoluta (Greenwich) nodlongituder direkt. Galileo-dokumentet anger ingen timvinkel, så dess RAAN används som nodlongitud. BeiDou-standarden anger inte MEO-fasen eller IGSO-noderna; förinställningen startar MEO-mönstret vid nod { "0" } och medelanomali { "0" } och lägger de tre IGSO-satelliterna på ett gemensamt markspår som korsar ekvatorn vid { "118" } deg E. Dessa två val är modelled.

seg-b2bbdd23c13b = Flera konstellationer kan dela en körning. Med <c1/> (standard) skattar mottagaren en klocka per system i sikte, som en multi-GNSS-mottagare (Global Navigation Satellite System) gör; <c2/> delar en klocka.

seg-27db52482bdd = Vad som kommer ut

seg-2405196cfccb = Per rutcell: medelvärde, minsta och största antal satelliter över masken; andelen epoker med positionsbestämning och med positions-DOP (PDOP) på eller under <c1/>; genomsnittlig geometrisk, positions-, horisontell och vertikal DOP (GDOP, PDOP, HDOP, VDOP); största PDOP. Globalt, viktat med cosinus för latituden så att varje cell räknas efter sin yta: tillgänglighet, tillgänglighet på den sämsta platsen, samt medelvärde, median, 90:e, 95:e och 99:e percentilen och maximum för varje DOP. Per satellit: ett nedsamplat markspår (<c2/> prov, standard { "24" }, för högst <c3/> satelliter, standard { "120" }). Diagrammet består av två kartor, tillgänglighet och genomsnittlig PDOP.

seg-6cb532d0bca9 = Hur det skalar

seg-988ae3272c1f = En satellit på radie <c1/> ligger över en elevationsmask <c2/> exakt när dess centralvinkel från användaren är högst <c3/>, så siktprovet är en skalärprodukt mot <c4/>. Varje epok sorteras satelliterna också efter latitud för punkten under satelliten, och en rutnätsrad vid latitud <c5/> provar bara de satelliter som ligger inom <c6/> från <c7/>. Båda är exakta på en sfärisk kropp, och ett enhetstest håller varje karta mot en uttömmande genomsökning med det direkta elevationsprovet. Blocket <c8/> redovisar de parprov som en uttömmande genomsökning skulle göra och de som gjordes. Enhetstestets design med { "5" } 000 satelliter på ett rutnät om { "10" } deg ({ "648" } punkter, { "6" } epoker) behåller { "9.9" } % av de { "19 440 000" } parproven i den uttömmande genomsökningen; det medföljande scenariot <c9/> ({ "5 000" } satelliter, { "648" } punkter, { "12" } epoker) körs på cirka { "0.14" } s med kommandoradsbinären för release på en bärbar dator med Apple-silicon. Väggklocketider varierar med maskinen och dess belastning. Motorn använder inga trådar, klocka eller filsystem, så den körs oförändrad som WebAssembly.

seg-abba032ee1c7 = Vad som kontrolleras, och mot vad

seg-2342ed239300 = VALIDATED, mot publicerade dokument:

seg-dc7fe92fcf05 = Walker-generatorn återger alla { "24" } rader i Galileo OS SDD Table { "23" }, och GLONASS ICD:s positionsformel är samma uppsättning om { "24" } positioner som en Walker 24/3/1;

seg-686f9543c7c9 = GPS-förinställningen återger kolumnen för markspårets ekvatorkorsning i SPS PS Tables 3.2-1 och 3.2-2: { "35" } av { "36" } platser inom { "0.0108" } deg mot en avrundningströskel på { "0.015" } deg. E3F hålls mot en lösare tröskel på { "0.06" } deg, eftersom tabellens egen rad för E3F är inkonsekvent med dess RAAN och latitudargument: dess latitudargument ligger { "14.60" } deg före E3:s, vilket flyttar korsningen { "7.30" } deg, medan tabellen flyttar den { "7.36" } deg;

seg-dc2756c75401 = GPS-baslinjen under villkoren i SPS PS Appendix B (ett siderealt dygn, { "287" } steg om fem minuter, ett rutnät på { "4" } deg, alla i sikte, mask på { "5" } deg) ger en global HDOP-median på { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } och medelvärde { "0.965" }, mot de publicerade { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } och { "0.96" } (tröskel { "0.03" }, fastställd före den första körningen). PDOP-medianen { "1.795" } ligger under { "1.815" } i Table B.3-1, som beskriver en försämrad blandning av 20–24 satelliter. PDOP på { "6" } eller lägre gäller { "100" } % av tiden, mot { "98" } % globalt och { "88" } % på den sämsta platsen i Table 3.8-1.

seg-9aac9d8aa228 = Kontrollerat mot en handräkning, inte mot ett externt dokument: en DOP för en enda epok stämmer med den slutna formen för en zenitsatellit och tre på { "30" } deg elevation (PDOP 8/3, GDOP { "3.0732" }).

seg-d946dad08e23 = MODELLED: tvåkroppsbanor med valfri sekulär J2-drift; en sfärisk kropp; endast geometrisk sikt (ingen signaleffekt, satellithälsa eller terräng); ingen tredjekroppsstörning, som en verklig frusen månbana är beroende av. Den sämsta enskilda punkten i tid och rum beror på rutnätet: HDOP { "2.40" } och VDOP { "5.22" } här mot { "2.49" } och { "5.43" } publicerade; dessa redovisas, de fastställs inte. De fyra systemens förinställningar kommer från olika referensepoker, så deras relativa fas i en körning är inte en ögonblicksbild av något datum.

seg-a6c63abeb7e6 = Medföljande scenarier

seg-3e6a942c84d4 = Varje rad anger vad körningen skriver ut med kshana { $version }.

seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou och GLONASS ({ "102" } satelliter) under ett dygn över en mask på { "10" } deg, en klocka per system. Tillgänglighet (PDOP { "6" } eller lägre) { "100" } % globalt och på den sämsta platsen, median-PDOP { "0.95" }, i genomsnitt { "31.0" } satelliter i sikte.

seg-b65ade1eab04 = <c1/>: { "5 000" } satelliter i fyra skal i låg jordbana (LEO) för positionering, navigering och tidssynkronisering (PNT), med J2, över en mask på { "20" } deg. Tillgänglighet (PDOP { "3" } eller lägre) { "99.22" } % globalt och { "0" } % på den sämsta platsen, median-PDOP { "1.11" }, i genomsnitt { "39.4" } satelliter i sikte.

seg-7d860ca30360 = <c1/>: { "8" } satelliter i elliptiska frusna månbanor och ett cirkulärt skal med 6 satelliter kring månen. Tillgänglighet (PDOP { "6" } eller lägre) { "21.33" } % globalt och { "0" } % på den sämsta platsen, median-PDOP { "5.22" }, i genomsnitt { "3.2" } satelliter i sikte.

seg-0c331bea1f52 = LEO-PNT-täckning för användare vid polerna och i Arktis, jämfört med GNSS i medelhög jordbana, är sorten <c1/> med dess polarläge (<c2/>; se <a1>LEO-PNT.md</a1>).

seg-9aab3bf49146 = <s1>Föregående</s1>Fusionerad MEO- och LEO-positionering

seg-9f717b9015e1 = <s1>Nästa</s1>Modeller för kvantsensorer
