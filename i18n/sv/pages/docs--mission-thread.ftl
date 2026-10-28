# docs--mission-thread: translations (sv)

seg-e27476e37522 = Jorden

seg-34bdcfd66ded = I den gren i arkivet som dessa dokument kommer från; ännu inte på GitHub

seg-092dd691ca17 = Rapporten

seg-f942b36a11c4 = Ännu inte på GitHub

seg-b03d56f501c3 = Typ

seg-2afa300864a9 = Parametrar

seg-b7cf72949a21 = Källa: <c1/>

seg-32755afa0f78 = Uppdragsflödet

seg-d4af67363efc = Rådgivande programvara, inte certifierad navigationsutrustning. Enbart offentliga källor; inte knuten till eller stödd av någon rymdorganisation, och ingenting här gör anspråk på överensstämmelse med något programs krav.

seg-816770c97995 = <c1/> kopplar ihop faser i ett uppdrag, var och en av åtta registrerade typer med egna sensorer och filter, och redovisar <b>felbudgeten för navigering och tidssynkronisering</b> för hela kedjan: för varje fas 1-sigma för position, hastighet och klockbias vid inträde, vid toppen och vid utträde; varje bidrag till den, med sin enhet; marginalen mot ett krav som du anger; den svagaste länken; de daterade händelserna; och en tidslinjefigur. Varje tal är <b>MODELLED</b>: en angiven indata eller en modell av en sådan. De enda raderna med extern oberoende referens finns i <s1><c2/></s1> och säger vad de testar.

seg-c29a19879c84 = Kör exemplet från en utcheckning (det läser ett incheckat utsnitt av en månkärna):

seg-00f84b734853 = Dokumentet

seg-9979b2c873df = <b>Ett dokument avvisas, det gissas inte på,</b> när ett fas-id upprepas, en lista <c1/> är tom, ett namn är okänt, en modellnyckel inte är en som typen känner till, en längdnyckel avviker från <c2/>, eller en fas anger en källa som dess modell inte ger tal för.

seg-9b1e6ac618b5 = Vad en överlämning gör

seg-0e965f3e30fa = Det tillstånd som förs över är den fullständiga 6x6-kovariansen för <c1/> i SI-enheter, klockan (bias, drift och deras kovarians, märkta med en tidsskala), referenssystemet, uppdragstiden och en evidensetikett. En överlämning återställer aldrig en kovarians.

seg-47599d03571d = Regel

seg-023113cc5afb = för över tillståndet oförändrat

seg-43967d0b6dd8 = vitt accelerationsbrus med PSD <c1/> över <c2/> på en rätlinjig modell; raden anger båda

seg-2c791ab0fd0f = dödräkning under <c1/>, därefter sätts en axel till källans golv bara där golvet är mindre; aldrig under golvet, aldrig en återställning

seg-36b9117f5379 = Referenssystem och tidsskalor

seg-5853aaba827f = Tråden omvandlar vid överlämningen, aldrig inuti en fas, och varje omvandling är en egen budgetrad. Referenssystem: GCRF, MCI, MCMF (ITRF och LVLH avvisas med skälet). <c1/> förskjuter origo med månens geocentriska tillstånd: tillståndet av DE440-klass från kärnan där den täcker epoken (ersättning { "5" } m och { "1" } mm/s; uppmätt sämst { "2.6" } m mot fastlåsta värden från JPL Horizons), annars den analytiska serien med dess uppmätta { "195.7" } km RMS, som raden anger; ett månexempel måste därför bära en kärna som täcker dess epok. <c2/> är den genomsnittliga sideriska rotationen med axlarna i linje vid epoken och ingen libration. Tidsskalor går via TT: <c3/> exakt, <c4/> lägger till { "14" } us, <c5/> använder den sekulära hastigheten från <c6/> med dess band på { "56" } till { "59" } us/dygn som hastighetsosäkerhet.

seg-5ee610d8ab89 = De åtta fastyperna

seg-70b73f1acebf = Segment

seg-0e39a468de1d = driven stigning till en parkeringsbana: kovarians med konstant hastighet och vitt accelerationsbrus, GNSS-inhämtning och bortfall, klock-holdover

seg-d359ae5982a6 = Nycklar i <c1/> i <c2/>

seg-57c44fd6e061 = relativ navigering över sensorsträckor: Clohessy-Wiltshire-övergång i LVLH, 6x6-Kalmankovarians, dockningsfönster

seg-7dce961e2c67 = nedan

seg-4b233c6cdf8b = TLI-brännare och färd i cislunart rum: Cowell-propagering, tillståndsövergångsmatris av finita differenser, uppdateringar från gnss-ssv och markspårning

seg-352e27d02c86 = returfärd till återinträdesgränssnittet; sigma för banvinkeln, korridorsannolikhet, maximal retardation, landningsområde

seg-95eb34012fe8 = Månen

seg-cc72d2fc8a43 = relativ navigering till dockning i en månbana

seg-2cfa6846c937 = budget för landningsspridning vid en polarplats

seg-e9f5fc58fe12 = samma

seg-ba3c65a210dd = PNT och tidssynkronisering på ytan: tillgänglighet per plats och årstid

seg-8b9c5124dd3c = driven stigning till en insättningsbana

seg-4ce0fa85457c = Månens typer är också fristående scenariotyper; utformningen och evidensen finns i <a1><c1/></a1>.

seg-d16877f38793 = Budgeten bär de <b>relativa</b> sigmorna; jagarens absoluta kovarians förs över oförändrad och en rad säger det, eftersom den här fasen mäter fordonen mot varandra, inte mot jorden. Den relativa startkovariansen är jagarens absoluta plus målets angivna sigman, adderade som om de vore oberoende (försiktigt). Nycklar: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valfria <c6/> och <c7/>, samt en eller flera <c8/> med <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> eller <c15/>, ILLUSTRATIVE parametrar i <c16/>) och <c17/>; sträckornas varaktigheter adderas till fasens. Dockningsfönstret är tiden från den punkt där den relativa sigman håller sig inom infångningsenveloppen till slutet av fasen. Upprepningar är separata faser med egna id.

seg-088b78574ab4 = Medeltillståndet är motorns Cowell-propagator med jordens gravitation och J2 samt solen och månen som tredje kroppar. Kovariansen går genom varje segment av <c1/> med en tillståndsövergångsmatris framåtdifferens (den nominella körningen och sex störda körningar) och ett vitt accelerationsbrus. Brännaren går längs inträdeshastigheten med en angiven storleksandel och ett riktningsfel. <b>Begränsning angiven:</b> de incheckade utsnitten av månkärnan innehåller månen men inte solen, så propagatorn tar månen från kärnan och solen från den analytiska serien (solens term som tredje kropp är okänslig för den seriens fel); fasen anger i en händelse vilken den använde, och där ingen kärna täcker ett segment använder den den analytiska serien för båda. Brännaren är <b>inte riktad</b>: det nominella tillståndet är dit den angivna brännaren går, och månens faser tar bara kovariansen.

seg-e5a67295a5ae = Uppdateringar, används bara när dokumentet förtecknar källan: <c1/> (positionsbestämningar med tillgänglighet och PDOP från motorns svep över rymdtjänstvolymen längs en oskulerande jordbana som står i för bågen, ett svep per <c2/>; positionsbestämningens sigma = median-PDOP gånger <c3/>; formen med förväntad information håller körningen deterministisk) och <c4/> (avstånd och avståndshastighet längs den geocentriska riktningen, så att himlaplanet inte observeras; uppdateringens varians delas med spårningsdriften). Nycklar: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, valfria <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Frirörelsen är frirörelsen för <c1/> utan brännare, som slutar vid återinträdesgränssnittet; dess nycklar är nycklarna för frirörelsen ovan. Vid gränssnittet läser fasen banvinkeln och dess sigma ur hela kovariansen, sannolikheten att vinkeln ligger inom en angiven korridor, den maximala retardationen vid den nominella vinkeln och vid båda korridorkanterna (motorns plana ballistiska återinträde bredvid Allen-Eggers slutna form) mot en valfri gräns, samt landningsområdet: sträckriktningen från en angiven känslighet, tvärriktningen från gränssnittskovariansen tvärs banplanet. Nycklar: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, valfria <c8/>, <c9/> och <c10/> (det nominella returtillståndet, sex tal, när kedjan saknar en bränning från månen mot jorden som ger ett). Ingenting här modellerar en kapsels lyftkraft, styrning eller uppvärmning.

seg-352783ef7181 = Överlägget för markstationsnätet

seg-69d6ab8e93bc = En valfri tabell <c1/> anger stationer och den lägsta spårningselevationen; för varje fas den namnger beräknar tråden den andel av fasen som en station kan spåra och för över den till fasen som den driftcykel som skalar uppdateringsfrekvensen för dess markspårning. Geometrier: <c2/> (inträdestillståndet flugen tvåkropps med J2, för faser i låg bana), <c3/> (fordonet vid månens position, för färden i cislunart rum) och <c4/> (en driftcykel du anger). Ett stationsbyte förlorar <c5/>; fasens budget får det längsta intervallet utan någon station i sikte och en händelse anger driftcykeln. Ingenting modellerar ett näts antenner eller scheman.

seg-467b14d7ef59 = <c1/>: <c2/> (index, id, typ, tider, etikett, källor för navigering och tid, begränsande källa, sigman vid inträde, topp och utträde, krav, marginal, <c3/> med en enhet per rad, <c4/>), <c5/> (minsta marginal mot ett angivet krav, annars den största topposition), <c6/>, trådens <c7/> (den svagaste fasens etikett) och ett block <c8/>. Figuren är 1-sigma för position och klockbias mot uppdragstid, ett band per fas.

seg-a3c40c51c2ff = Vad evidensen är

seg-1168810d4407 = Trådens etikett är den svagaste fasens etikett, och varje fas är MODELLED. Månens propagator jämförs med LRO och CAPSTONE (<s1><c1/></s1>); bågen i cislunart rum jämförs med en offentlig bana från Horizons (<s2><c2/></s2>). En rad klarar eller missar en tröskel som fastställdes i en incheckad fil före körningen, och en miss registreras som en miss. Ingenting är VALIDATED om inte registret säger det.

seg-ee3c5b58e6fa = <s1>Föregående</s1>Månbana och månyta som infrastruktur

seg-b963f8a02aed = <s1>Nästa</s1>Uppdragsflöde: månsegmentet

seg-af81a8087ca7 = entry
