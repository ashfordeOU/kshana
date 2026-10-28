# docs--mission-thread-lunar: translations (sv)

seg-f942b36a11c4 = Ännu inte på GitHub

seg-3b01a756c305 = Vad den beräknar

seg-b478421b21bb = Källa: <c1/>

seg-dbd59cc01982 = Månsegmentet i uppdragsflödet i Artemis-klass

seg-7b56ed698c30 = Fyra scenariotyper, var och en också en fastyp i gränssnittet <c1/> (<c2/>): de för en felbudget för navigering och tidssynkronisering genom ett månuppdrag till sydpolen, från rendezvous i månbana till landning, vistelsen på ytan och stigningen tillbaka till banan. <b>Varje tal här är MODELLED</b>: en angiven modell med ILLUSTRATIVE indata, inget av det ett påstående om något uppdrag, system eller någon plats. "Artemis-klass" namnger en klass av uppdragskoncept, inget mer; ingen rymdorganisations data, produkt eller stöd används eller görs gällande, och ingenting här är knutet till någon. Rådgivande programvara, inte certifierad navigationsutrustning. Kshana sänder ingenting och styr ingen hårdvara.

seg-5282ad2c498a = Fas och typ

seg-9b927127e042 = Exempelscenario

seg-40f3e1b2d58b = Kärna

seg-2cfaaa8be402 = relativ navigering till dockning, cirkulär polär på { "100" } km eller elliptisk polär på { "100" } km gånger { "3000" } km

seg-9ee09d63fed3 = budgeten för landningsspridning vid en plats nära sydpolen

seg-c4568984e75c = <c1/>, <c2/> (kräver DEM, en utcheckning)

seg-a098e14e6a63 = tillgänglighet för positionering och tidssynkronisering per plats och årstid

seg-8278ae655fcc = <c1/>, <c2/> (kräver DEM, en utcheckning)

seg-249eff5159d0 = stigning till rendezvousbanan och kovariansen som förs tillbaka till banan

seg-36184e593ade = Varje kärna är en funktion av <c1/>; en fristående körning bygger det förvalda inträdet (en månscentrerad inertiell kovarians på { "100" } m och { "0.1" } m/s, en LTC-klocka på { "1" } mikrosekund) och den förvalda epoken 2028-01-01, och en trådkörning tar inträdet från föregående fas. Tråden, inte en kärna, omvandlar referenssystem och tidsskalor och tillämpar överlämningsregeln: ett fasomslag omvandlar inträdestillståndet till <c2/> (eller <c3/> för ytkartan) och en LTC-klocka genom trådens omvandlingar, och omvandlingsraderna läggs till i fasens budget. Ett referenssystem eller en tidsskala som tråden inte kan omvandla (till exempel ITRF) avvisas med trådens meddelande; en kärna som anropas direkt med ett referenssystem den inte kan använda avvisar det med skälet. En fas återställer aldrig en kovarians, den för bara över den den slutar med.

seg-59f4a1a2684e = Vad varje fas gör

seg-e112a34ef118 = Två fordon, en jagare och ett mål, flyger i samma bana under cratens månkraftmodell (ett gravitationsfält samt jorden och solen som tredje kroppar). En Gauss-Newton-skattning i satser över bågen återfinner båda begynnelsetillstånden utifrån:

seg-33bb01b1e72a = en absolut positionsbestämning per fordon från en ILLUSTRATIVE reläuppsättning i LCNS-klass (reläer bakom månen utelämnade, fyra behövs), vars vita del är kodspårningsgränsen för AFS-piloten (BPSK({ "5" }), { "5.115" } Mchip/s) vid angivet C/N0 gånger DOP-kofaktorn;

seg-b061f6742a86 = ett <b>bestående</b> signalfel i rymden på varje positionsbestämning: reläfel medelvärdesbildas inte bort över en båge på timmar, så det förs som konstanta positionsbias, ett gemensamt för båda fordonen (<c1/> av variansen, standard { "0.9" }, ILLUSTRATIVE) och ett oberoende per fordon. En konstant bias ger ingen nytta av medelvärdesbildning, den försiktiga tolkningen;

seg-437ac74b1400 = ett avstånd över länken mellan fordonen från samma signal vid dess eget C/N0.

seg-3513a55e44e5 = Den redovisar det formella och Monte Carlo-baserade relativa positions- och hastighetsfelet i målets lokala axlar, andelen epoker med positionsbestämningar på båda fordonen, det genomsnittliga normaliserade kvadratiska skattningsfelet (NEES) för det relativa tillståndet mot sitt förväntade värde på { "6" }, den relativa driften av att bortse från gravitationsharmonikerna, en kontroll i sluten form med Hill (Clohessy-Wiltshire) för det cirkulära fallet, trådens modeller för den relativa sensorn i slutskedet <c1/> (ILLUSTRATIVE parametrar) bredvid siffran enbart med signaler, och jagarens 6x6-kovarians vid slutet.

seg-5d3fa3e8486c = <b>Vad resultatet säger.</b> Med enbart signaler bestämmer avståndet över länken mellan fordonen den relativa positionen längs siktlinjen, men den relativa positionen tvärs den begränsas av det oberoende signalfelet i rymden och av vad dynamiken ger; dockning kräver en relativ sensor, och raderna <c1/> visar på vilket avstånd var och en av trådens sensormodeller slår signalerna. Resultatet beror också på att referensen och skattaren delar en kraftmodell; skattaralternativet <c2/> visar kostnaden för att bortse från harmonikerna, och den körningen förväntas inte vara konsistent.

seg-66c4eb27641b = Fasen flyger sin egen nominella bana (fälten <c1/>), så inträdets positions- och hastighetsvektor används inte, bara dess kovarians, referenssystem och klocka; en händelse i tråden säger det.

seg-751f29ab7a35 = Per horisontell axel en inertiell felmodell med fem tillstånd (position, hastighet, accelerometerbias, lutning i attityd, gyrobias, driven av nedstigningens specifika kraft) utifrån inträdeskovariansen och IMU:n, därefter ett sekventiellt filter över de aktiverade stöden:

seg-c2eae4508a2f = <b>AFS-positionsbestämning</b>: från de reläer som är synliga över en platt mask, med ENU-DOP-kofaktorn gånger ett användaravståndsfel. <c1/> använder signalfelet i rymden; <c2/> använder korrektionslänkens residual från <c3/>. Med exakt tre reläer i sikte stöds klockan, den skattas inte, och positionsbestämningen bär då <c4/>: det är här månens tid går in i positionsbestämningen.

seg-39c938fb24e9 = <b>Terrängrelativ positionsbestämning</b>: <c1/> kör cratens TERCOM/SITAN-matchare på sitt syntetiska relief och en jordmetersskala (en ersättning, inte relief vid sydpolen); <c2/> tar Cramer-Rao-gränsen för matchning av ett höjdfönster i den verkliga LOLA-DEM:en vid platsen, <c3/>, och hävdar ingen positionsbestämning där reliefen bara begränsar en riktning (bländarproblemet).

seg-795ef82edc61 = <b>Månens tid</b>: klockfelet vid positionsbestämningen kombinerar inträdesklockan, dess tillväxt sedan synkroniseringen och LTC-TT-termen från <c1/>. Med <c2/> tickar fordonet TT och den ackumulerade offseten är en okorrigerad bias; med <c3/> återstår bara osäkerheten i det publicerade bandet på { "56" } till { "59" } mikrosekunder per dygn över horisonten. Ett tidsstämpelfel flyttar en positionsbestämning längs banan med <c4/>.

seg-82b71e26bc89 = <b>Läs det med omsorg.</b> Standardspridningen domineras av den antagna styrtermen, och vid varje plats nära sydpolen är reläernas geometri nästan densamma, så platserna skiljer sig lite åt. Månens tid betyder lite genom tidsstämpling ({ "150" } m/s gånger några mikrosekunder är under en millimeter); den betyder något när geometrin försämras till tre reläer.

seg-f5af0aef6649 = För varje plats och årstid (en epok och ett fönster efter den): positionering med reläer (fyra eller fler reläer i sikte över masken och platsens terränghorisont med PDOP under tröskeln, från samma funktioner och konstellation som <c1/>; resultatet för en enda plats är lika med dess siffra, bit för bit), om jorden och solen ligger över horisonten (analytisk sol, måne och månorientering, libration inräknad), och tillgänglighet för tidssynkronisering (ett relä eller jorden i sikte) med den längsta sträckan utan någotdera. Reläsiffran ändras inte med årstiden i den här modellen (keplersk uppsättning, medelrotation); jord- och solsiffrorna gör det. Fasen för över kovariansen oförändrad och styr klockan mot ett golv för tidssynkronisering (ILLUSTRATIVE, { "50" } ns), så att bara det längsta glappet i tidssynkronisering återstår att hålla över.

seg-0890ec65a04e = Nedstigningens modell med fem tillstånd på alla tre platsaxlarna från ytillståndet, en AFS-positionsbestämning med ett angivet intervall med samma behandling av månens tid, och den fullständiga 6x6-kovariansen för position och hastighet vid insättningen som förs vidare, med korrelationen mellan position och hastighet för varje axel bevarad. Spridningen vid motoravstängning flyttar var fordonet är och redovisas bredvid navigeringskovariansen, förs inte vidare. Felen hålls i avfyrningsplatsens axlar (ingen krökning i sträckriktningen) och det nominella utgångstillståndet är en ersättning; bara kovariansen är resultatet.

seg-f60b576fabcd = Hur ett dokument anger en fas

seg-be8e0001ed0c = I en tråd är en fas tabell <c1/> det fristående scenariots egen tabell. Fasens längd är trådens <c2/>: en modell som också anger sin egen längdnyckel (<c3/>, <c4/>, <c5/>, <c6/>) måste stämma med den, annars avvisar fasen, och en modell som utelämnar nyckeln tar trådens. Fröet är trådens id-nycklade fasfrö, så en fas som körs för sig under samma id och trådfrö returnerar de tal den returnerar i tråden. En felstavad modellnyckel avvisas, ignoreras inte. Överlämningen mellan faser, och de omvandlingar av referenssystem och tidsskalor den behöver (månscentrerat inertiellt och månfast, jorden till månen, LTC-paren), tillhör tråden.

seg-52a6e2ec0a99 = Utformningarna, indata och trösklarna fastställdes i <c1/> före varje körning, med sex daterade tillägg, vart och ett redovisat i filen; utfallet för varje tröskel, missarna och skattarens historik inräknade, finns i <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (propagatorn mot LRO:s rekonstruerade bana, { "24" } h): MET, { "33" } m största 3D-skillnad mot { "500" } m, { "2.4" } m radiellt RMS mot { "60" } m.

seg-25464238f6bd = <b>A2</b> (samma propagator mot CAPSTONE:s nästan rätlinjiga halobana över ett varv på 6.5 dygn): <b>NOT MET</b>, { "136.8" } km skillnad i slutposition mot { "25" } km, och { "28.4" } km skillnad i oskulerande periapsisradie mot { "10" } km. Orsakerna isolerades inte (kandidater är det utelämnade strålningstrycket och albedot, banans känslighet för begynnelsetillståndet och de analytiska serierna för jorden och solen); raden förblir MODELLED.

seg-e1099ad81a5d = Dessa två rader testar den propagator som månens typer delar. <b>De testar inget navigeringsfilter, ingen signal och ingen budget, och ingenting annat här har en extern oberoende referens.</b>

seg-9a4b2392aa92 = Allt annat är MODELLED, och typernas konsistenskontroller (B1 till B8 i förhandsregistreringen) testar en implementation mot dess egen angivna modell, inte mot månen.

seg-3365490b59b7 = <s1>Föregående</s1>Uppdragsflöde: från uppskjutning till återinträde

seg-90932eed0074 = <s1>Nästa</s1>PNT i låg omloppsbana (LEO)

seg-d655c932abbf = Landningsspridningen är navigeringsfelet vid beröringen plus en oberoende styrterm (<c1/>, ILLUSTRATIVE, { "20" } m per axel som standard). Tabellen <c2/> kör varje kombination av stöden. Ellipsen kalibreras med Monte Carlo (andelen simulerade landningar innanför 3-sigma-konturen mot de { "98.9" } % som en 2D-gaussfördelning ger).
