# docs--positioning: translations (sv)

seg-6555ff9a6d8e = Utdata

seg-0be9b5747c00 = Kshana

seg-94058315dfe4 = Indata

seg-09721fbcf7fc = Källa: <c1/>

seg-5b362d7b0903 = Kshana är en öppen, reproducerbar <b>evidensmotor för resiliens inom PNT (positionering, navigering och tidssynkronisering)</b>. Du beskriver ett scenario, alltså sensorerna eller klockorna, ett GNSS-bortfall (globalt satellitnavigeringssystem), en jamming- eller spoofingattack och en budget, och den talar om hur väl tid och position håller, poängsatt mot operativa kvalitetsmått. Varje förmåga bakom dessa tal märks i en maskingranskad matris som <b>VALIDATED</b> (kontrollerad mot en oberoende extern referens), <b>MODELLED</b> (internt konsistent, inte externt kontrollerad) eller <b>PARTNER</b> (ägd av en maskinvarupartner). Den här sidan säger var den är starkast, vad den är till för och vad den inte är.

seg-48d576a345e3 = Var den är starkast: tidssynkronisering och holdover för kritisk infrastruktur

seg-f41d8a48ff13 = Den bäst validerade delen av motorn är tidssynkronisering. Telekomnät, elnät och finansiella handelsplatser hämtar sin tid från GNSS, och var och en måste dimensionera <b>holdover</b>: hur länge en lokal klocka kan gå fritt genom ett GNSS-bortfall innan dess tidsfel spräcker budgeten.

seg-70d00c5fe203 = <b>Vad som är VALIDATED.</b> De estimatorer för frekvensstabilitet som ett svar om holdover bygger på, Allan-deviation (ADEV), modifierad Allan-deviation (MDEV), tidsdeviation (TDEV), största tidsintervallfel (MTIE) och estimatorn Theo1 med utökat område, är kontrollerade mot Stable32-referensdeviationer, det oberoende biblioteket <c1/> och en verklig uppmätt cesiumklocka. Beräkningen av variansen vid glidning i holdover och dess inversion till en holdovertid är kontrollerade mot SciPy. Se <a1><c2/></a1> för varje rad, dess test och dess oberoende referens.

seg-9fbedc930565 = <b>Vad som förblir MODELLED.</b> Brusgolven för varje klockklass (till exempel det långsiktiga golvet för en given oscillatorklass) avgör svaret för en stabil klocka, och de är representativa tal, inte mätningar av din enhet. Tillhandahåll uppmätta golv för ett tal du tänker försvara.

seg-700df4898ede = <b>Telekomenheter.</b> Scenariotypen <c1/> redovisar MTIE och TDEV, kontrollerar dem mot maskerna från Internationella teleunionens standardiseringssektor (ITU-T): G.8272 för en primär referenstidsklocka (PRTC), G.8272.1 för en förbättrad PRTC (ePRTC), G.8273.2 för en telekomgränsklocka (T-BC) och G.8271.1 för nätverksgränserna vid referenspunkt C, och redovisar hur länge en holdover håller sig inom varje tidsfelsbudget. Se <a1><c2/></a1>.

seg-50421d8247ab = Vad som gör den annorlunda

seg-7ec913b140ed = Fysiken och standarderna är inte skillnaden: propagering med Simplified General Perturbations { "4" } (SGP4), Allan-deviation, referenssystem och dilution of precision finns tillgängliga, fria och korrekta i andra bibliotek, och Kshana kontrollerar sig själv mot flera av dem. Skillnaden är evidensdisciplinen:

seg-f7d466d5215b = <b>Öppen.</b> Motorn ligger under GNU Affero General Public License (AGPL), så vem som helst kan läsa och köra om den. En kommersiell licens finns för sluten integration.

seg-76ff24c1939b = <b>Reproducerbar.</b> Ett resultat bestäms av <c1/>, bit för bit, och en körning kan delas som en länk till lekplatsen i webbläsaren.

seg-6df34e089b53 = <b>Proveniensmärkt.</b> Varje sensorparameter spåras till en publicerad källa (<a1><c1/></a1>), och varje förmåga bär sin nivå VALIDATED / MODELLED / PARTNER. En spärr i kontinuerlig integration (CI) vägrar en VALIDATED-rad utan oberoende extern referens, så en intern självkontroll kan inte presenteras som en validering.

seg-8bccfe110f4c = Vi har inte hittat något annat öppet verktyg som kombinerar dessa över holdover, integritet, tröghetsglidning och kvantsensorer, men en sökning som inte hittar något är inget bevis för att inget finns; vi påstår inte att vi är de enda.

seg-e942b2474960 = Kvant: en neutral avvägningsmetod, resultat märkta MODELLED

seg-655769464447 = Kshana jämför kvantklockor och klassiska klockor och tröghetssensorer på samma scenario med samma kod: varje enhet är en felmodell, och motorn vet inte vilken som är "kvant". Betrakta den som <b>en neutral avvägningsmetod mellan kvantbaserad och klassisk teknik vars resultat märks MODELLED</b>. De flesta indata är publicerade Allan-/brusbudgetkoefficienter; accelerometern med kall-atom-interferometer har ett skikt från första principer som härleder sin brusskoefficient. En partners uppmätta Allan-deviationsdata kan matas in genom typen <c1/>, vilket är vägen för att lyfta en viss enhets tal. Se <a1><c2/></a1> och <a2><c3/></a2>.

seg-eb5d247b42aa = Månen, cislunart och djupa rymden: underhållet, inte huvudnumret

seg-4b9bd68b7fb1 = Sviten för månen och cislunart (integritetsövervakning vid månen, kärnan med tre kroppar för Jorden–Månen, tidsskalor för månen, analys av servicevolym) och motorn för radiometrisk navigering i djupa rymden är underhållna förmågor. De flesta av deras rader är MODELLED, och särskilda verktyg betjänar redan navigering vid månen, så de erbjuds som förmågor i samma motor, var och en med sin egen nivå, i stället för som huvudnumret.

seg-26f242f1bef8 = Resten av motorn

seg-b9b2e29e51d9 = Samma motor, med samma nivåer, täcker också:

seg-89d1923b3ed9 = <b>PNT i låg omloppsbana (LEO), från början till slut.</b> Signalutformning (<c1/>), pass och länkbudget per band (<c2/>), sändningsmeddelande för navigering (<c3/>), sammanslagen positionsbestämning med medel- och låg omloppsbana (<c4/>), konvergens för precis punktpositionering (PPP) med LEO-förstärkning (<c5/>), positionsbestämning från ett icke-terrestriskt 5G-nät (<c6/>), och <c7/>, som lämnar varje stegs utdata vidare till nästa för ett system.

seg-2e5b57ccd454 = <b>Spektrum.</b> Ett vattenfall av effektspektraltäthet för L-band (och ultrahögfrekvens (UHF), S- och C-band) under en skriptad tidslinje för en jammer, med förhållandet mellan jammer och signal per band och effektiv bärvåg-till-brusdensitet (<c1/>), samt in- och utdata för inspelningar i Signal Metadata Format (SigMF).

seg-0e7fd993a838 = <b>Solsystemet och vilken central kropp som helst.</b> Positioner och fysikaliska konstanter för planeterna och de stora månarna (<c1/>), positionsbestämning runt vilken som helst av dessa kroppar (<c2/>) samt konstellationsdesign enligt Walker och publicerade platser med täcknings- och dilution-of-precision-kartor runt vilken som helst av dem (<c3/>).

seg-9d993a356eb0 = <b>Kampanjer.</b> Befintliga typer kedjade på en gemensam tidslinje, svepta, körda som Monte Carlo-ensembler med frö eller körda sida vid sida under gemensamma villkor (<c1/>).

seg-905a9aa8c47c = <b>Utdata.</b> Varje körning skriver ett resultatdokument, ett diagram och en rapport i HTML (HyperText Markup Language) och JSON (JavaScript Object Notation); <c1/> skriver en animering i SVG (Scalable Vector Graphics), HTML eller som bildsekvens; <c2/> skriver CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON eller STK-efemerid (Systems Tool Kit) för de typer som placerar saker på jorden, och SigMF för <c3/>.

seg-75206591a52a = De flesta av de här raderna är MODELLED; verifieringsmatrisen anger de få som är VALIDATED (till exempel rekommendationerna från Internationella teleunionen om regn och scintillation, algoritmen för Galileos sändningsefemerid, ramkontrollen med CRC-24Q (24-bitars cyklisk redundanskontroll) och lösaren för planeternas ljustid).

seg-785218a0ea66 = Vad Kshana inte är

seg-fae54ec38477 = <b>Inte en radiofrekvenssimulator (RF) eller en hardware-in-the-loop-rigg (HIL).</b> Kshana styr ingen radiomaskinvara och sänder ingenting. Det mesta arbetar på nivån felmodeller och länkbudgetar, innan maskinvara eller labbtid köps. På signalnivå är det enbart programvara: GNSS-IQ-skiktet (<c1/>) skriver sampelfiler i basband med fas och kvadratur (IQ) av legitima GNSS-signaler för mottagare i programvara och kör sin egen programvarumottagare på dem; avsnittet <c3/> i typen <c2/> (sedan { "0.29.0" }) skriver en SigMF-ögonblicksbild (Signal Metadata Format) av sin analytiska modell som inkluderar de konfigurerade jammarna (brusliknande jammare bin för bin, toner och chirpar som vågformer); och <c4/> summerar en autentisk signal och en spooferreplika i minnet för att testa slingornas inlåsning, utan att skriva ut den. Att testa en maskinvarumottagare mot verklig RF-stimulans är en RF-simulators uppgift.

seg-ca243f3f8e8d = <b>Inte en ersättning för MATLAB/Simulink, STK eller Orekit.</b> Den står bredvid dem. Den läser och skriver de utbytesformat de använder: CCSDS Orbit Ephemeris Messages (Consultative Committee for Space Data Systems), precisa banor i SP3 (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format); den skriver CZML, KML, GeoJSON och STK-efemerid för deras visningsprogram, och dess numeriska kraftmodell korskontrolleras mot Orekit i stället för att erbjudas i dess ställe.

seg-8fa4e93c3d0e = <b>Inte en motor för GNSS-bearbetning med bärvågsfas eller en positioneringstjänst</b> (se nedan).

seg-8ba4b67bc813 = <b>Inte en certifieringsmyndighet.</b> En märkning VALIDATED betyder att en förmåga stämmer med en extern referens; den är inte en certifiering av någon produkt eller operatör.

seg-362b857140b9 = Vad Kshana är, och inte är, jämfört med en motor för GNSS-bearbetning

seg-f50951b2e9c8 = Kshana är <b>inte</b> en motor för <em>bearbetning</em> av GNSS med bärvågsfas, och ingen scenariotyp är en positioneringstjänst. Den har en fot i mätdomänen, som bibliotekskod som prestandastudien stöder sig på och som kontrolleras mot oberoende referenser. RTK-positionering (real-time kinematic) med kort baslinje och heltalsfixering med LAMBDA (least-squares ambiguity decorrelation adjustment) körs på verkliga tvåfrekvens-RINEX-observationer, liksom ett statiskt flytande filter för precis punktpositionering (PPP) med slutliga IGS-banor och -klockor, och mottagarklockan som det filtret skattar är en tidslösning mot IGS slutliga stationsklocka. Var och en av de tre är en VALIDATED rad i <a1>verifieringsmatrisen</a1>, mot de IGS-stationsdata som den namnger där, och var och en körs på statiska, korta observationsfönster, inte som en strömmande tjänst med upplösning av heltalsosäkerhet över långa baslinjer, bärvågsutjämning eller en kinematisk rover. Typen <c1/> kör ett flytande PPP-filter på kod och bärvågsfas, men på mätningar som den simulerar själv, för att studera konvergenstid med och utan LEO-förstärkning; den bearbetar ingen observationsfil. Typen <c2/> (position, hastighet och tid) löser en mottagarposition från verkliga RINEX-kodpseudoavstånd plus sändningsefemerid, validerad mot en inmätt koordinat från International GNSS Service (IGS) (station ABMF, 2018-05-13) till <b>{ "5.7" } m 3D-RMS (kvadratiskt medelvärde) / { "1.1" } m horisontellt</b>. Men produkten är prestandastudien, inte positioneringstjänsten, och ramen nedan är till för att spara en tänkbar användare besvikelsen över fel verktyg.

seg-169dd778c45f = En motor för GNSS-bearbetning (RTKLIB, ett öppet bibliotek för kinematisk positionering i realtid; gLAB, verktygssviten för GNSS-laboratorium från gruppen gAGE vid Universitat Politècnica de Catalunya)

seg-4faa1de0ef70 = ett scenario: sensorfelmodeller, bortfallsfönster, geometri, eller, för <c1/>, en verklig RINEX-observationsfil plus sändningsnavigering

seg-ae60d0def8af = verkliga GNSS-observationer (RINEX), efemerider, korrektioner

seg-5fce99bb803d = kvalitetsmått för prestanda: holdover, tids-/positionsfel, tillgänglighet, gränser för integritet/säkerhet, plus en position från enpunktspositionering med kod (SPP) från typen <c1/>

seg-b752bb5c3f64 = en <b>lösning</b> för position/hastighet/tid (SPP, PPP, RTK)

seg-dd8a47d4f618 = Fråga som den besvarar

seg-b52fd8e0c856 = "hur bra <em>skulle</em> den här arkitekturen vara, och var går den sönder?"

seg-09672ca004ac = "med de här mätningarna, var befinner jag mig <em>nu</em>?"

seg-00d5ebd56088 = Kvantsensorer / optiska sensorer

seg-a55f2bd6c1bf = modellerade som felmodeller (optiska klockor, tröghetsmätenhet (IMU) med kalla atomer, optisk tidsöverföring), resultat märkta MODELLED

seg-7ccfb3395d84 = inte modellerat

seg-ec21dbf4b910 = Bearbetning av verkliga observationer

seg-324ef9a933d5 = SPP med kod från verkliga RINEX-observationer (<c1/>, på meternivå); RTK med kort baslinje med LAMBDA och statisk flytande PPP på verklig bärvågsfas, som bibliotekskod kontrollerad mot IGS-stationer (VALIDATED, statiska och korta fönster, inte en strömmande tjänst); plus geometri / dilution of precision (DOP) / tillgänglighet

seg-e15db8a33a9a = kärnkompetensen, ända fram till PPP/RTK med bärvågsfas

seg-e6df7ccdba96 = noll: körs i en webbläsarflik (WebAssembly)

seg-812c1c70ce63 = inbyggt bygge / verktygskedja

seg-58df67617e1a = Kompletterande, inte konkurrerande: RTKLIB och gLAB

seg-29aeb97bd509 = <a1>RTKLIB</a1> och <a2>gLAB</a2> är mogna, flitigt använda sviter för GNSS-bearbetning. De tar verkliga mätningar och ger en positionslösning (SPP/PPP/RTK; gLAB är också ett utmärkt undervisningsverktyg med stark tradition vid Europeiska rymdorganisationen (ESA) och European Geostationary Navigation Overlay Service (EGNOS)). Kshana ersätter dem <b>inte</b> och försöker inte göra det. Dess observationsväg är smal: enpunktspositionering med kod (<c1/>) och, som kontrollerad bibliotekskod, RTK med kort baslinje med heltalsfixering med LAMBDA och ett statiskt flytande PPP-filter på verkliga tvåfrekvensobservationer, var och en VALIDATED mot IGS-stationsdata (PPP-filtret också mot en körning av RTKLIB på samma indata). Den har ingen bärvågsutjämning, ingen kinematisk eller strömmande bearbetning och ingen upplösning av heltalsosäkerhet över långa baslinjer, och <c2/> skattar inte troposfären eller jonosfären: den tillämpar troposfärsmodellerna Saastamoinen/Niell och den jonosfärsfria kombinationen av L1/L2, och löser inte för dem som tillstånd.

seg-9c4e70ce8a55 = Kedjan är kompletterande:

seg-01f43da4858c = <b>RTKLIB / gLAB</b> besvarar <em>"var befinner jag mig, utifrån de här signalerna?"</em>

seg-f5370894cdd1 = <b>Kshana</b> besvarar <em>"hur länge behåller jag ett bra svar när signalerna upphör, och hur mycket ger en bättre klocka eller tröghetssensor, klassisk eller kvantbaserad?"</em>

seg-2403d6b115de = Ett naturligt arbetsflöde använder en bearbetningsmotor för det segment där GNSS är tillgängligt och Kshana för att studera beteendet vid <b>holdover</b> och rummet för sensoravvägningar runt det. Om du behöver en positioneringstjänst med bärvågsfas, alltså kinematisk PPP eller RTK, långa baslinjer och upplösning av heltalsosäkerhet i nätverk, använd RTKLIB eller gLAB; om du behöver reproducerbar, märkt evidens om resiliens och holdover är det det uppdrag Kshana är byggd för.

seg-21631e5c6be3 = Ett webbläsarskikt utan installation

seg-9b01dd6721ed = De flesta simuleringsverktyg på det här området (RTKLIB, gLAB, General Mission Analysis Tool (GMAT), Orekit, STK) kräver en inbyggd installation eller en licens, och en inlärningskurva innan det första resultatet. Kshana kompileras till WebAssembly och körs <b>helt i webbläsaren</b>: <a1>lekplatsen</a1> läser in ett genomarbetat scenario, kör den verkliga motorn hos klienten (ingenting laddas upp) och visar resultatet på några sekunder. Guidade reglage och scenarier med ett enda klick gör att det första användbara resultatet varken kräver TOML (Tom's Obvious Minimal Language, scenariofilens format) eller någon verktygskedja.

seg-b1cb4b8f0ef1 = Skiktet utan installation är en medveten position:

seg-33b361bde50d = <b>Räckvidd</b>: en granskare, student eller upphandlare kan prova den faktiska motorn från en länk, på vilken enhet som helst, utan någon konfiguration.

seg-a4a4ebf89cee = <b>Reproducerbarhet</b>: samma motor som levereras i webbläsaren är biblioteket som levereras på crates.io, Python Package Index (PyPI) och npm; ett resultat är reproducerbart från <c1/>, och en körning kan delas som en URL (webbadress).

seg-3d3d4bda606c = <b>Ärlighet</b>: att köra motorn själv, öppet, är det starkaste motargumentet mot "lita på talen": webbläsarskiktet <em>är</em> granskningsytan.

seg-6095bcacb725 = Webbläsarskiktet gör inte Kshana till en ersättning för en bearbetningssvit på skrivbordet; det gör frågan om avvägningsstudier av prestanda lättillgänglig för människor som aldrig skulle installera en.

seg-938ca8eab04c = <a1><c1/></a1> — omfångskartan rad för rad (<c2/>-lösarens fulla omfång och residualer finns i raden <b>GNSS-/PNT-bearbetning</b>).

seg-9e94b1740386 = <a1><c1/></a1> — vad som är validerat, med belägg.

seg-3a02f39bd90a = <a1><c1/></a1> — typen för telekomtidssynkronisering och dess masker.

seg-c5aa08e4ca55 = <a1><c1/></a1> — definitioner i klartext av termerna som används här.

seg-85aaaa34ea7c = <a1><c1/></a1> — lekplatsen i webbläsaren.

seg-54e2deeffc7d = <s1>Föregående</s1>Arkitektur

seg-b2f93c49d5c6 = <s1>Nästa</s1>Ändringslogg
