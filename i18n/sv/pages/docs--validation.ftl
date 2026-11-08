# docs--validation: translations (sv)

seg-70860389903a = Klocka

seg-583dc9ff6178 = Bibliotek

seg-d01db1c2710a = Referens

seg-619f89bf160c = Realisering av månens referenssystem

seg-2db69c58f694 = Differentiell PNT på månen

seg-2eb6d1b0483d = RAIM / ARAIM

seg-da3532b1444d = SBAS / DO-229E

seg-d3af26f389f5 = IONEX / Klobuchar

seg-d6476863f862 = Förmåga

seg-ad856ad710eb = Status

seg-d12d4565b01d = Lunar geodetisk VLBI, kärnväg

seg-5ed34a5b402e = Lunar gemensam multiteknik-banbestämning + klocka

seg-4bcec6e2dd9f = Täckningsvolym för navigeringstjänst på månen

seg-c04a3591074c = Export för interoperabilitet på månen

seg-20fee61b3107 = Bibliotek med felmodeller för kvantenheter

seg-eaf341ff4522 = GNSS-fri kvantnavigering

seg-75636f9419b2 = Kända begränsningar

seg-9c0eb89a2fbe = Paket

seg-f63dd3d7aad4 = Källa

seg-638b8d451550 = Sensor

seg-04f69a0edb2f = typ

seg-b03d56f501c3 = Typ

seg-35bf9a48e566 = Term

seg-f3526b0d95f8 = Uppmätt

seg-7634c6f4b32c = Länk

seg-b966dd26caa6 = Datamängd

seg-4fe4920a3fa1 = Standard

seg-84430d202cd4 = Källa: <c1/>

seg-028f26d1374e = <b>Om toleranser.</b> ”Validerad” nedan betyder att ett kalibreringstest kontrollerar att den simulerade statistiken stämmer med referenssambandet inom en <b>tillämpad gräns</b>, för närvarande <b>{ "20" }–{ "25" } % relativt fel</b> (medelvärde över frön) för sambanden för Allan-brus och brusbudget. Den mediana observerade överensstämmelsen är ofta mycket snävare (några procent), men den <em>garanterade</em> gränsen är tröskeln, inte medianen. Där ett tal som ”~{ "2" } %” förekommer är det en typisk observation, inte den tillämpade toleransen. Se <a1>Påståenden mot verklighet</a1>.

seg-94a480ed9ccb = Befordringsregeln

seg-a550784412a6 = En rad i den maskinkontrollerade verifieringsmatrisen (<c1/>) är VALIDATED först när en oberoende referens <b>oberoende av Kshana</b> stämmer med implementationen <b>inom en tolerans som angavs innan jämförelsen kördes</b>, i ett test som körs i grinden. Det här avsnittet är det enda stället där regeln står nedskriven; matrisen, prosan per rad och versionsanteckningarna hänvisar till det.

seg-5e14faed9f05 = De godtagna typerna av oberoende referens

seg-4297b6a1b385 = Vad som räknas

seg-a42c0c36b37f = Exempel som redan finns i matrisen

seg-e39aeb132e03 = Verkliga uppmätta data för den storhet som raden gör anspråk på: en observation av den fysiska världen, inte ett modellresultat.

seg-e77977db9de1 = De två tredjedelar av en verklig cesiumklockregistrering som hölls undan; arkiverade normalpunkter från lunar laser ranging; BIPM:s (Internationella byrån för mått och vikt) serie Circular T UTC(k); terrängrutan från SRTM (Shuttle Radar Topography Mission).

seg-6325fe1fafaf = Ett oberoende tredjepartsbibliotek eller -verktyg som beräknar en <b>entydigt definierad</b> storhet på samma indata, där biblioteket självt implementerar områdets beräkning. Överensstämmelse mellan bibliotek är en äkta kontroll bara därför att storheten har ett enda rätt svar.

seg-a9cd35495601 = allantools, Orekit, ANISE, RTKLIB, gnss_lib_py, lamberthub, pymcdm, scikit-learn, SciPys statistiska fördelningar.

seg-056adffae706 = Publicerade referensvektorer, tabeller eller verifieringsexempel: tal som en standard, en myndighet eller en referenstext skriver ut så att implementationer kan kontrolleras mot dem.

seg-991fb822e99c = Vektorer från SOFA/ERFA (Standards of Fundamental Astronomy), verifieringsvektorerna för SGP4 från AIAA (American Institute of Aeronautics and Astronautics), valideringsexemplen från ITU-R (International Telecommunication Union, Radiocommunication Sector), det genomgångna ARAIM-exemplet från Working Group C, JPL (Jet Propulsion Laboratory) Horizons.

seg-2a774e48055a = Ytterligare två standarder avgör gränsfallen. Båda antogs för version { "0.30" }.

seg-f5c6cf536ba1 = <b>P1, ett publicerat genomräknat värde.</b> Ett publicerat genomräknat värde som beräknats ur samma slutna uttryck som raden implementerar räknas som en publicerad referensvektor, när publikationen är oberoende av Kshana och jämförelsen fastställer en angiven tolerans. Värdet måste vara utskrivet som ett tal i publikationen (ett värde avläst ur ett diagram räknas bara om avläsningsosäkerheten ryms inom den angivna toleransen), och testet måste låta Kshana beräkna det ur publikationens indata; att jämföra en konstant med dokumentet den kopierades från är en transkriptionskontroll, inte P1.

seg-0b043b552e76 = <b>P2, ett oberoende numeriskt bibliotek.</b> Ett oberoende numeriskt bibliotek som numpy eller LAPACK (Linear Algebra PACKage) och som räknar om en entydigt definierad storhet i linjär algebra på angivna indata räknas som ett oberoende bibliotek. Biblioteket måste utföra uppdelningen, inversen, lösningen eller minsta kvadrat-steget med sin egen algoritm, på indata som är incheckade tillsammans med testunderlaget; det validerade påståendet är då den linjära algebran på dessa indata, inte de fysiska storheterna i ett representativt scenario. Ett skript som räknar om ett skalärt slutet uttryck med numpy-aritmetik är en andra implementation av vårt eget, inte P2.

seg-b7911d589f7a = Villkor som gäller för varje typ: den oberoende referensen är inte skriven, körd eller publicerad av det här projektet (förrådets egen artikelserie är därför inte oberoende av det); toleransen finns i testet och fastställdes före den första jämförelsen; ett datastyrt test som hoppas över när dess offentliga data saknas säger det när det hoppar över.

seg-7e6057a2cad7 = Vad som inte räknas

seg-80cfbb204767 = <b>Vår egen andra implementation</b>: en andra kodväg i den här craten (<c1/>), eller ett skript i det här förrådet som räknar om samma slutna uttryck.

seg-d6efaf8399f9 = <b>Överensstämmelse med vår egen tidigare utdata</b>: gyllene värden, regressionsfästen, ögonblicksbilder eller en tabell från projektets egna artiklar.

seg-4d0365b383e5 = <b>En transkription av konstanterna i en referens</b>: att kontrollera en koefficient, förinställning, datablads-siffra eller parameterblad mot dokumentet den kopierades från.

seg-3bf8025077fb = <b>Ett utformningsval</b>: en fördelning, viktning, tröskel, larmgräns eller ett representativt scenario. Det finns ingen extern sanning för ett val.

seg-4f0aafd7166e = <b>En intern identitet</b>: en numerisk integral mot sin egen analytiska form, en rundtur, en inversion, ett test av egenskap eller monotonicitet.

seg-4f4408e4ebab = <b>En integrationskörning mot en verklig värd</b> (<c1/>): att läsa in ett insticksprogram i en verklig Signal K-server eller OpenCPN, eller mata en verklig grinds utdata till en TCP-konsument, och kontrollera att värden tar emot indata och visar det förväntade tillståndet. Det visar att kopplingen fungerar. Värden är ingen oberoende referens för något värde som integrationen för med sig, så det finns inget externt att jämföra mot och en sådan rad (raden om marina integrationer) är MODELLED, inte VALIDATED. <c2/> är en egen typ av oberoende referens som bara är tillåten på MODELLED-rader: <c3/> i <c4/> fallerar om en VALIDATED-rad har den, och <c5/> kräver redan att varje VALIDATED-rad är <c6/>.

seg-a39a87c56a16 = <b>Rimlighet på verkliga indata</b>: verkliga data som används enbart som indata, med kontroller av storleksordning i stället för en jämförelse mot ett externt värde.

seg-db6f5d98b4ef = En tolerans som valts efter att jämförelsen setts.

seg-f4f18b7549df = Hur regeln upprätthålls

seg-19a62c7e0aee = Varje VALIDATED-rad deklarerar, i <c1/> i <c2/>, vilken typ den vilar på (Measured, Library, Reference, P1 eller P2), den oberoende källan (citerad ur radens egen text om oberoende referens) och det enda test som bär jämförelsen. Enhetstesterna bredvid tabellen fallerar när en VALIDATED-rad saknar deklaration eller är deklarerad två gånger, när en deklaration pekar ut en rad som inte är VALIDATED, när den deklarerade källan inte är den som radens text om oberoende referens anger eller är Kshana självt, när det deklarerade testet inte är ett som raden åberopar, eller när en P2-rad inte anger något oberoende numeriskt bibliotek. <c3/> kräver sedan att det deklarerade testet finns på disk som ett verkligt <c4/> som inte är ignorerat. Det maskinen inte kan kontrollera är om det angivna testet jämför mot den deklarerade källan; det förblir en mänsklig läsning. Antal per typ skrivs inte ut här: tabellen är källan.

seg-e8ae3e380f40 = Befintliga VALIDATED-rader omprövade enligt regeln

seg-1dd44545a67a = Regeln tillämpades på de befintliga raderna såväl som på framtida befordringar.

seg-38db7b6e7053 = <b>P1-rader som utpekats av valideringsstudien för { "0.30" }, var och en stödd:</b> Länkbudget för en riktning (designkontrolltabellen för Galileo X-band i JPL Pub 82-76, återskapad ur sina radposter till { "4.6e-3" } dB frirumsförlust); Bandbegränsade slutna uttryck för valfri avståndssignal ({ "90.3" } procent av huvudlobens effekt och det publicerade koherenta early-late-jittret); Maximal dopplerförskjutning för en navigeringssatellit i låg jordbana (de publicerade värdena för Xona Pulsar X1 och Iridium); Maximal dopplerförskjutning som en stillastående användare ser från en LEO- eller MEO-bana (tabell { "1" } i Pulsar-artikeln, { "20" } värden); Dopplerförskjutning som en markmottagare måste hantera från en LEO-navigeringssatellit (samma publicerade värden från en flugen bana). Varje publikation är oberoende av Kshana, skriver ut sina tal, och testet anger sin tolerans.

seg-8e38103d05d6 = <b>Ytterligare rader som vilar på P1, funna vid omprövningen, var och en stödd:</b> Avvägning för avståndskoders utformning (den publicerade Gold-korskorrelationen på −{ "23.9" } dB); Månens koordinattid (Ashby och Patla { "2024" }, vars korskontroll av månens hastighet mot DE440 är en biblioteks-kontroll); Slutna uttryck för effektspektraltäthet för L-bandssignaler (Q-värden från Kaplan och Hegarty); Jonosfärsfördröjning av första ordningen per band (kvoten för gruppfördröjning i IS-GPS-200); Globala medelvikter för avståndsfel i signalen i rymden (tabellen från Montenbruck, Steigenberger och Hauschild { "2018" }).

seg-0014c53752ac = <b>P2-rader som utpekats av studien, var och en stödd:</b> Fisher-information och Cramér–Rao-observerbarhet (numpy <c1/>/<c2/>); Identifierbarhet för månens datum; Kopplad gauge för månens referenssystem och tidsskala; Autonom pipeline för felobserverbarhet i fria nät (numpy/SciPy SVD, singulärvärdesuppdelning). Var och en räknar om en entydigt definierad storhet i linjär algebra på incheckade indata med en annan algoritm än Kshanas Jacobi-egenvärdeslösare.

seg-e9d01633d002 = <b>Ytterligare rader som vilar på P2, funna vid omprövningen, var och en stödd:</b> MCDA (multikriterieanalys) för härledning av prioriteringar (AHP, analytisk hierarkiprocess, egenvektor med SciPy/LAPACK; tabellen med slumpindex som den också återskapar är en transkription och räknas inte); Varians vid utrullning i klock-holdover (SciPy <c1/> av Van Loans utvidgade matris); Realisering av månens referenssystem (en numpy-SVD-lösning enligt Umeyama); CRPA-strålformning (controlled reception pattern antenna) (komplex lösning med LAPACK); Kärna för skyddsnivå i ARAIM på månen (RTKLIB:s LU-invers med SciPy-kvantiler); Konsistens mellan leverantörer för månens referenssystem/dynamik (en numpy-SVD-anpassning med minsta kvadrat av tre publicerade efemerider).

seg-1fd94e94e89d = <b>Flaggade i första omgången, återförankrade i omgång { "2" } av körningen för { "0.30" }.</b> Tre rader flaggades som inte stödda av den nedskrivna regeln. Var och en vilar nu på en jämförelse som förhandsregistrerats innan dess testunderlag hämtades, så ingen rad är flaggad; ett enhetstest bredvid <c1/> fäster den (nu tomma) listan.

seg-3ef9479dea55 = <b>Integritet (RAIM/ARAIM/SBAS).</b> De åberopade testerna kontrollerade tidigare bara rimlighet på verklig geometri från IGS (International GNSS Service). Raden vilar nu på tre oberoende referenser i form av bibliotek: ARAIM:s multipla hypoteser och lösningsseparation enligt Airborne Design Document v4.2 mot Stanford MAAST för ARAIM { "2" } ({ "270" } verkliga fall, största VPL-skillnad { "2.2e-3" } m mot { "0.05" } m); snapshot-RAIM:s detektion och uteslutning mot RTKLIB <c1/> ({ "2016" } av { "2016" } beslut identiska) med skyddsnivån för lutning; och SBAS-skyddsnivåerna för DO-229E L1 mot Stanford MAAST på verkliga WAAS-sändningar ({ "2868" } par inom { "1.6e-5" } m). Raden säger öppet att funktionerna med enhetlig sigma <c2/> och <c3/> inte överensstämmer med ADD och att jämförelsen för SBAS med två frekvenser på L5 är ett fynd.

seg-16a4261c77ec = <b>Planeternas positioner i hela solsystemet ur de keplerska elementen från JPL Standish.</b> Den efterhandsvalda tröskeln på det dubbla nominella felet har ersatts av en förhandsregistrerad tröskel: RMS högst värdet i Explanatory Supplement, tabell { "8.10.1" }, per planet och komponent, mot JPL Horizons DE441, med jord–måne-uppdelningen och ICRF-rotationen täckta.

seg-8d5b51a942e0 = <b>Ljustid mellan himlakroppar i solsystemet.</b> Lösaren för ljustid jämförs nu med ljustider från Horizons inom { "1e-6" } s på positioner från DE441, en förhandsregistrerad tröskel som inte ärver positionströskeln.

seg-e96900bc322f = <b>MODELLED-rader som de två policyerna gör möjliga att befordra</b> (bara genom körningen för { "0.30" } rad för rad, aldrig genom den här texten): enligt P1 gränsen för geolokalisering av sändare med TDOA/FDOA (skillnad i ankomsttid och frekvens), kopplingen mellan relativistisk klockgång och referenssystem, synkroniseringsmaskerna i ITU-T (Telecommunication Standardization Sector) (bara för maskvärden som rekommendationerna skriver ut som tal; de transkriberade brytpunkterna kontrollerade mot sig själva räknas inte) och gränsen för positionering med icke-markbundet 5G-nät (bara om ett publicerat genomräknat värde hittas); enligt P2 integritetsblindhet i gemensamt läge, den skalära skyddsnivån för tid enligt MHSS (multiple-hypothesis solution separation) och GLS-blekningen (generaliserad minsta kvadrat). De två benchmarkraderna för integritet i tid (klassificeraren för Stanford-integritetsdiagram och poängsättaren för integritetstäckning) är regelbaserad klassificering, inte linjär algebra, så P2 når dem inte; de behöver ett oberoende verktyg, och det enda som hittats (gLAB) har en licens för icke-kommersiellt bruk.

seg-50a08fe5918b = <b>Konsistens med tidigare avvisanden.</b> Vallado-kontrollen i raden om uppskjutningsfönster skulle nu kvalificera enligt P1 om dess test räknar ut det utskrivna genomräknade exemplet; planen för { "0.30" } befordrar den i stället via Orekit. Tabellen över tidpunkten då månens tid korsar per klockklass förblir MODELLED: tabellen den återger kommer från projektets egen artikel, som inte är oberoende.

seg-02423542480f = Brusterm

seg-2bd49b92f14b = Likvärdighet mellan Allan-estimatorer (ADEV/MDEV/TDEV/OHDEV (ADEV: Allan-deviation; MDEV: modifierad Allan-deviation; OHDEV: överlappande Hadamard-deviation))

seg-c429a25d17ae = Två kontroller mot primärkällor, mot <b>NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>, { "2008" }), båda med relativ tolerans <b>{ "1e-4" }</b>. ({ "1" }) <c1/>: estimatorerna för överlappande ADEV, modifierad ADEV, tidsdeviation och överlappande Hadamard återger deviationerna för den kanoniska datamängden <b>NBS14</b> med 10 punkter (<b>SP { "1065" } tabell 29/30, s. { "107" }</b>) vid tau = { "1" }, { "2" } – överensstämmelsen är i själva verket ~{ "1e-6" } (till exempel överlappande ADEV (OADEV) vid τ = { "2" }: { "85.952868" } mot { "85.95287" }). ({ "2" }) <c2/>: samma fyra estimatorer återger <b>datamängden med 1000 punkter i SP { "1065" } §{ "12.4" }</b> (<b>tabell { "31" }, s. { "108" }</b>) vid medelvärdesfaktorerna { "1" } / { "10" } / { "100" }, där datamängden återskapas i kod ur LCG:n i SP { "1065" } (ekv. { "73" }) – hermetiskt, ingen testfil. Samma data och tabell 31-tal är regressionsmålet i aewallin/allantools (<c3/>), återgivet här utan tredjepartskod. Detta fäster <em>estimatorernas matematik</em> mot referensen, skilt från raderna för brus-<em>kalibrering</em> nedan.

seg-79e6f7d1e7f0 = Likvärdighet mellan Allan-estimatorer på <b>verklig uppmätt hårdvara</b>

seg-8c72a9df2547 = <c1/>: estimatorerna för överlappande Allan och överlappande Hadamard återger referensdeviationerna från <b>Stable32</b> för en <b>verklig cesiumprimärstandard 5071A uppmätt mot en vätemaser</b> ({ "556 990" } fassampel vid τ₀ = { "1" } s; { "1" } PPS (pulse per second) in i en 53230A-räknare, feb { "2014" }; insamlat av A. Wallin, distribuerat med <c2/>). Kontrollerat över <b>hela dekadstegen i τ ({ "16" } medelvärdesfaktorer, τ = { "1" } s … { "4" }×10⁴ s)</b>: väl samplade faktorer mot en relativ gräns på <b>{ "1e-3" }</b> (observerad överensstämmelse är i själva verket ≤ { "3e-5" }, till exempel OADEV({ "1" } s) { "3.317111e-10" } mot Stable32 { "3.3171e-10" }), glesa faktorer vid långt τ måste hamna inom Stable32:s utskrivna konfidensband på { "1" }‑σ. Detta kompletterar den syntetiska NBS14-likvärdigheten ovan med en kontroll mot en uppmätt klocka. Den råa fasfilen är tredjepartsdata utan licens för vidaredistribution och är därför git-ignorerad; <c3/> återskapar den och testet skriver ut ett meddelande om överhoppning (CI (kontinuerlig integration) förblir grön) när den saknas. Bara de offentliga referenstalen från Stable32 är incheckade (<c4/>); ingen tredjepartskod används.

seg-1a7f0e741913 = Likvärdighet mellan Allan-estimatorer på den <b>kanoniska Stable32-filen PHASE.DAT</b>

seg-00e382874a00 = <c1/>: estimatorerna för överlappande Allan, modifierad Allan och tidsdeviation återger referensdeviationerna från <b>Stable32</b> för <b>PHASE.DAT</b> – serien med 1001 punkter som distribueras med Stable32 och som oberoende verktyg (till exempel <c2/>) använder som sitt standardmål för regression – över <b>hela stegen av medelvärdesfaktorer ({ "139" } faktorer)</b> mot en relativ gräns på <b>{ "1e-3" }</b> (observerat ≤ { "5e-5" }). En andra, oberoende verklig referensserie vid sidan av kontrollen mot uppmätt cesium ovan. PHASE.DAT levereras med det kommersiella verktyget Stable32, så den råa serien är git-ignorerad; <c3/> återskapar den och testet hoppas över som grönt (CI förblir grön) när den saknas. Bara de offentliga referenstalen från Stable32 är incheckade (<c4/>); ingen tredjepartskod används.

seg-9dde9e0c8055 = Stabilitet hos optisk klocka på en <b>verklig uppmätt kurva</b>

seg-ea908ba3a79f = <c1/>: inversionen av klockbrusparametrarna (<c2/>) återger den <b>publicerade σ_y(τ) för optisk gitterklocka med ⁸⁸Sr från Norcia m.fl., <em>Science</em> { "366" }:{ "93" } ({ "2019" })</b> (Zenodo 10.5281/zenodo.3382347, <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }), kurvan inkluderad i <c3/>): den återvunna koefficienten för vitt frekvensbrus √q_wf ≈ { "4.33e-16" } stämmer med artikelns kortsiktiga stabilitet ≈4.7e-16/√τ (~{ "10" } % RMS (root mean square) över kurvan) och anpassningen upptäcker ett uppmätt golv skilt från noll (q_rw > { "0" }). Detta fäster <b>inversionen från uppmätt ADEV till brusparametrar mot en verklig optisk klocka</b>; nyttan med holdover till tröskel som bygger på den förblir MODELLED.

seg-e1e930dcd0a1 = ROC (receiver operating characteristic) AUC (area under the curve) för anomalidetektion på <b>verklig telemetri från ESA (European Space Agency) OPS-SAT</b>

seg-2b637daa985c = <c1/> (återger etiketter)

seg-c667434b580d = <c1/>: på datamängden <b>OPSSAT-AD</b> (Ruszczak m.fl. { "2025" }, Zenodo 10.5281/zenodo.12588359, <b>CC BY { "4.0" }</b>) – verkliga OPS-SAT-segment med övervakningsdata och anomalietiketter som facit – återger Kshanas Mann–Whitney-ROC-AUC (<c2/>) <b>scikit-learn <c3/></b> inom <b>< { "1e-9" }</b> på den undanhållna testdelen ({ "529" } segment, { "113" } anomalier), för två deterministiska poäng: en genomskinlig detektor med ett enda särdrag (segmentets antal toppar, <b>AUC ≈ { "0.851" }</b>) och en diagonal Mahalanobis-poäng med 8 särdrag anpassad på de normala träningssegmenten (AUC ≈ { "0.556" }); <c4/> omger punktskattningen med ett intervall vars nedre gräns ligger över slumpen. Detta validerar <b>AUC-beräkningen på verkliga ESA-data</b> och en genomskinlig detektors <b>etiketterade separation</b> – det återger <b>inte</b> det bästa publicerade måttet i OPSSAT-AD-artikeln (en övervakad FCNN (fully connected neural network), F1 ≈ { "0.95" }), som kräver deras tränade modell. CC-BY-data inkluderade (<c5/>, hermetiskt); referensen återgenereras av <c6/>.

seg-5f2d41617fb2 = Syntes av gravitationsfältsfunktionaler (gravitationsstödd / GNSS-fri (GNSS: global navigation satellite system) navigeringskarta)

seg-4c1126137428 = <c1/>: kärnan för funktionaler av gravitationsfältet i sfäriska harmoniska funktioner (<c2/> / <c3/>) – ”kartläsaren” som en gravitationsstödd navigator matchar mot – är validerad mot <b>normalgravitationen enligt GRS80 (Geodetic Reference System { "1980" })</b> (Moritz { "1980" }, antagen av IAG (IAG: International Association of Geodesy)). Att bygga GRS80:s normalfält ur dess publicerade jämna zonala harmoniska J₂…J₈ och syntetisera tyngdkraften (gravitation + centrifugalkraft) på ellipsoiden återger den slutna normalgravitationen enligt <b>Somigliana</b>, och de publicerade ekvatoriella/polära värdena γ_e = { "9.7803267715" } / γ_p = { "9.8321863685" } m/s², inom <b>{ "3.5e-12" }</b> relativt över alla breddgrader (gräns { "1e-9" }). Samma kärna läser in den ledande <b>verkliga jordmodellen EGM2008 (Earth Gravitational Model { "2008" }) från ICGEM (International Centre for Global Earth Models)</b> (NGA (National Geospatial-Intelligence Agency), allmän egendom via ICGEM; läsaren <c4/> prövas också på GRAIL-månfältet (Gravity Recovery and Interior Laboratory) i <c5/>) och ger en fysiskt begränsad karta över gravitationsstörning (RMS ≈ { "26" } mGal, max ≈ { "89" } mGal vid d/o { "70" }). Validerar <b>synteskodens korrekthet</b>; <em>noggrannheten i positionsbestämning</em> med gravitationsstöd förblir MODELLED (ingen offentlig bana med gravimeter på en plattform och facit finns).

seg-7dc3ff4c6eea = Edf specifik för brustyp (konfidensintervall)

seg-7e8a93fb2eea = <c1/>: χ²-konfidensbandet för varje punkt i överlappande ADEV använder de effektiva frihetsgraderna specifika för brustyp (slutna uttryck i NIST SP { "1065" } tabell { "5" } för vit och flimrande fasmodulation, vit och flimrande frekvensmodulation och slumpvandring i frekvensmodulation (WPM/FPM/WFM/FFM/RWFM) – den enkla uppsättningen i Stable32), där registrets potenslagstyp identifieras ur dess MDEV-lutning i log-log. Tre oberoende kontroller: (a) de fem formlerna återger handräknade värden vid N={ "64" },m={ "4" } inom { "1e-12" }; (b) ett <b>Monte Carlo-ensemble med vitt FM (FM: frekvensmodulation)</b> ({ "4 000" } register) mäter estimatorns faktiska chi-kvadrat-edf = { "2" }·medel²/Var(σ²) och stämmer med formeln inom { "20" } % (och slår med god marginal det konservativa antalet utan överlapp); (c) <c2/> återger den utskrivna <b>SP { "1065" } tabell { "32" } (s. { "109" })</b> edf = { "146.177" } för datamängden med 1000 punkter vid m={ "10" } (vitt FM) inom { "5e-3" }, och tabellens konfidensgränser på { "95" } % ({ "8.223942e-2" } / { "1.035201e-1" }) inom <{ "0.2" } % (den lilla resten är Wilson–Hilferty-approximationen av χ² mot NIST:s exakta χ²). Den exporterade ADEV-kurvan bär den identifierade brustypen, edf och bandet på { "95" } % per τ.

seg-7048ac695b99 = Vitt FM (kortsiktigt)

seg-b6982cb2ca25 = <c1/>: simulerad överlappande ADEV återger publicerad sigma_y({ "1" } s) – vanligtvis inom några procent, <b>tillämpad gräns { "20" } %</b> (CSAC och målet för optiskt gitter) – och kurvan för vitt FM sigma_y(tau)=sigma_y(1s)/sqrt(tau) över tau = { "1" }, { "10" }, { "100" } s inom en <b>gräns på { "25" } %</b> (stämmer med databladet för CSAC (chipskalig atomklocka) { "3e-10" } / { "1e-10" } / { "3e-11" }).

seg-11fc7c4b61ff = Slumpvandring i FM (långsiktigt)

seg-1e211f342e79 = <c1/>: simulerad ADEV stämmer med sigma_y^{ "2" }(tau)=q_rw*tau/3 (Riley, NIST SP { "1065" }) inom ~{ "20" } % (medelvärde över frön).

seg-dcfca4041429 = Åldring / linjär drift

seg-2d5c6a44cbdb = <c1/> + kalibrerad bort

seg-492f91ba2f79 = Deterministisk; holdover-estimatorn tar bort offset och åldring med en kvadratisk prediktor, så resten är den stokastiska gränsen. Testad i <c1/> / <c2/>.

seg-2ea6a14cac1c = Kalman-estimator + integritetsgräns

seg-8c8f8a5eba5a = <c1/>: ett filter med två tillstånd (fas, frekvens) vars exakta processbrus enligt van Loan matchar sanningsmodellen; utrullning återger den analytiska holdover-variansen <c2/> inom { "1e-9" }. Kovariansuppdateringen sker i <b>stabiliserad Joseph-form</b> <c3/>, som förblir positivt semidefinit (kontrollerat med Cholesky) genom { "500" } steg av prediktion/uppdatering vid ett extremt förhållande <c4/>, och stämmer med den naiva formen inom { "1e-9" } där den senare är väl konditionerad. Körningslagret rapporterar integritet som andelen avbrottssampel inom skyddsgränsen på 3 sigma (<c5/>).

seg-f332f06e80f9 = Filtrets självkonsistens (NIS (normaliserat innovationskvadrat) / NEES (normaliserat skattningsfelskvadrat))

seg-333e1701b6d0 = <c1/> (modell)

seg-c1304de95180 = <c1/>: en konsistensbedömning med Monte Carlo (Bar-Shalom §{ "5.4" }). Det matchade filtrets sammanslagna <b>NIS → { "1" }</b> och <b>NEES → { "2" }</b> hamnar inom sina χ²-band på { "95" } % (NIS-bandet använder det sammanslagna antalet vita innovationer; NEES-bandet använder antalet oberoende körningar, eftersom skattningsfel är korrelerade i tid). Ett test med <b>svep över Q/R-felmatchning</b> kontrollerar att monitorn rapporterar <c2/> bara vid enhetsinställning och <c3/> vid felinställning ×0.1/×0.5/×2/×{ "10" }, med NIS som skalar som ≈1/q_factor enligt härledningen. Visas som <c4/> i klockans resultat-JSON (JavaScript Object Notation) och på ett kort i lekplatsen. χ²-banden använder Wilson–Hilferty-kvantilen (<c5/>, kontrollerad mot tabell).

seg-078c4009b24f = Modell för tvåvägs tidsöverföring

seg-22f8cdeda335 = <c1/>: den reciproka gemensamma fördröjningen upphävs exakt i skattningen <c2/> (härledd för hand, exakt) och två envägsmätningar medelvärdesbildas till <c3/> (medelvärde över frön); den icke-reciproka differensfördröjningen är en färgad process med vitt FM + slumpvandring i FM vars Allan-deviation följer <c4/> (medelvärde över frön, ~{ "20" } %, via länkens egen <c5/>). <em>Parametrarna</em> (per länk <c6/>, <c7/>) är representativa värden för TWSTFT/optisk (TWSTFT: two-way satellite time and frequency transfer), inte anpassade till någon specifik terminal.

seg-6ab219622143 = Säkerhet (poäng för spoofing-detektion)

seg-29dd10011ed1 = <c1/>: monitorns golv på 1 sigma <c2/> och den resulterande minsta detekterbara offseten på <c3/> sigma och poängen <c4/> är härledda för hand och enhetstestade. Modellen (innovation / klockstödd detektion i stil med RAIM (RAIM: receiver autonomous integrity monitoring)) är sund; <em>parametrarna</em> (övervakningsfönster <c5/>, detektionsmultiplikator <c6/>, mätbrus <c7/>) är representativa, inte anpassade till någon specifik mottagare.

seg-ca51e4f1e19c = Detektion av spoofing-attacker

seg-e991f5b2fdb2 = <c1/>: en ramprande falsk tid flaggas när dess offset överstiger klockans detektionsgräns; detektionstiden stämmer med det handräknade <c2/> inom ett rutnätssteg, och en klocka vars gräns överstiger specifikationen låter spoofingen nå tröskeln oupptäckt. Samma förbehåll för <c3/> som för poängen för säkerhet.

seg-3d2f6d2b7722 = Flimrande FM (golv)

seg-55697d598918 = <c1/> (av som standard)

seg-55000870c060 = Syntetiserat som en summa av logaritmiskt fördelade Ornstein-Uhlenbeck-processer (OU) kalibrerade mot ett konfigurerbart plant ADEV-golv; <c1/> validerar att golvet är plant över medelvärdestiden och ligger på den konfigurerade nivån (medelvärde över frön). Aktiveras per klocka via <c2/>. De åberopade referensscenarierna lämnar det av: CSAC domineras av vitt FM över sitt databladsområde (1–1000 s) och det systematiska golvet hos den optiska klockan (~{ "5e-17" }) representeras av dess noggrannhetsvärde.

seg-e2e3de9a61a4 = Statistik för Monte Carlo-ensemble

seg-9785d05ec5a7 = <c1/> (aggregering)

seg-cc6c6bb5eb83 = <c1/>: percentiler enligt närmaste rang och medelvärde över <c2/> reproducerbara realiseringar; en enda körning kollapsar spridningen, bandet per tidssteg är ordnat <c3/>, och omkörningar är bitidentiska. Detta är statistisk aggregering över den redan validerade enskilda körningen, inte en ny fysikalisk modell.

seg-72a9d5de61f5 = sigma_y({ "1" } s)

seg-ebbe708d9cbc = csac-sa45s (CSAC)

seg-c43fe67d4200 = Datablad för Microchip SA65 / SA.45s

seg-e3bde4355d78 = optical-sr-lattice (Sr-gitter)

seg-87793f684233 = optisk gitterklocka med strontium, rymdinriktat mål, arXiv:{ "1503.08457" }

seg-b03f5856d451 = Status: vitt FM och slumpvandring i FM validerade; åldring modellerad och kalibrerad bort; flimrande FM modellerat och validerat (av som standard i de åberopade scenarierna).

seg-c5ff448dcb88 = Mognad: värdena för den optiska klockan är <em>det rymdinriktade målet</em> på markbunden hårdvara – ingen optisk strontiumklocka har flugit. Laboratorieklockor med Sr når { "4.8e-17" } (Oelker m.fl. { "2019" }, Nature Photonics). Värdena för CSAC kommer från en driftsatt kommersiell komponent.

seg-b59a4b8e6d88 = Samband: Riley, NIST SP { "1065" }, ekv. { "67" } -- vitt FM sigma_y^{ "2" }(tau)=h0/({ "2" } tau); slumpvandring i FM sigma_y^{ "2" }(tau)=({ "2" } pi^2/3) h_-2 tau, likvärdigt med q_rw*tau/3 för en Wiener-process i frekvens med diffusionen q_rw.

seg-dca7ee671d91 = Paket { "2" } – tröghetsbaserad dödräkning (kvanttröghetsmätenhet)

seg-98452a081241 = Konstant/kvarvarande bias -> position

seg-6aa386251acf = positionsfel = familjen { "0.5" }<em>b</em>T^{ "2" } (Groves, AESS (Aerospace and Electronic Systems Society) Tutorial); handhärlett diskret test i <c1/>.

seg-c60c0b54c485 = Velocity random walk (vitt accelerationsbrus)

seg-7ce1f40566cf = <c1/>: simulerad standardavvikelse (SD) för positionsfel stämmer med sigma_x(T)=sqrt(S_a*T^3/3) (Groves ekv. 54) inom ~{ "12" } % observerat (medelvärde över frön; tillämpad gräns { "20" } %).

seg-8ac776795d40 = Fysik hos accelerometer med kallatomsinterferometer (CAI) (från första principer)

seg-4eafc81873ed = <c1/>: en kallatomsinterferometer av Mach–Zehnder-typ med tre pulser. Handverifierad mot läroboksgeometri – Rb-87 <c2/>; <c3/> vid { "1" } g, <c4/>; projektionsbrus <c5/> vid <c6/>, <c7/>; per skott <c8/>; skalningslagarna <c9/> och <c10/>; exponentiellt kontrastavtagande. <c11/> <b>härleder</b> den vita accelerationens PSD (effektspektraltäthet) som den klassiska <c12/> använder. Ärlig omfattning: enbart <b>golvet för kvantprojektionsbrus</b> (~{ "0.09" } ug/sqrtHz här) – långt under verkliga vibrationsbegränsade enheter (1–50 ug/sqrtHz); vibrationstensorn, Coriolis och systematiska ljusförskjutningar är ännu inte modellerade (se <a1><c13/></a1>).

seg-ed78f40a8d80 = Gyrobias + angular random walk (ARW) -> lutning -> koppling till tyngdkraften

seg-a73e97ac4a0e = En kvarvarande gyrobias och ARW driver ett attitydfel; lutningen kopplar in tyngdkraften (<c1/>) i horisontellt specifikt kraftfel. <c2/> validerar den rena bias-baserade kubiska positionstillväxten exakt och ARW:s attitydtillväxt som en Wiener-process (medelvärde över frön). Aktiveras per sensor via <c3/> och <c4/>; av i de åberopade scenarierna med enbart accelerometer.

seg-e68d093e952a = Biasinstabilitet (1/f-flimmergolv)

seg-5ad1e7d55d07 = <c1/>: en 1/f-flimmerprocess (samma OU-syntes som validerats för klockan) vars plana golv för Allan-deviation ligger på koefficienten för biasinstabilitet; noll är ingen åtgärd, ett golv skilt från noll ändrar banan, båda reproducerbara. Aktiveras per sensor via <c2/>.

seg-b631c1bfce05 = Accelerationens slumpvandring (rate random walk)

seg-4a4a70363412 = <c1/>: biasen är en Wiener-process med <c2/>, kontrollerad som medelvärde över frön inom ~{ "20" } %. Aktiveras per sensor via <c3/>.

seg-49c4a2532dca = Korsvalidering mot NaveGo (brusskoefficienter för IMU (tröghetsmätenhet))

seg-e558aa705560 = <c1/>: en extern korskontroll mot <b>NaveGo</b> (R. Gonzalez, verktygslåda för INS/GNSS (INS: tröghetsnavigeringssystem) med öppen källkod, <c2/>). Återger den syntetiska rundturen i NaveGos <c3/> på dess <b>publicerade referensprofil för Microstrain 3DM-GX3-35</b>: att driva vår estimator för överlappande ADEV (validerad mot NBS14/Stable32) med vitt sensorbrus på NaveGos nivåer på 1 σ återvinner koefficienterna för velocity random walk och angular random walk (VRW, ARW) (<c4/>) inom <c5/> (faktiskt ~{ "0.4" } %), med den vita brusgrenen på lutningen −1/2. Bekräftar att vår Allan-pipeline och NaveGos definitioner av VRW/ARW stämmer överens. Den inspelade loggen <c6/> från STIM300 på { "40" } MB läses inte in (begränsad av binärformatet).

seg-171b215f0526 = Skalfaktor, finare korsaxeltermer

seg-b690ed87f493 = <c1/> i det här paketet med 1-DOF (en frihetsgrad)

seg-c1bd4e24c091 = Det äldre paketet med en axel har inget fel för skalfaktor eller korskoppling. Biblioteket för strapdown med tre axlar och paketet <c1/> modellerar däremot skalfaktor, felinriktning, g-känslighet, kvantisering och hastighetsramp (<c2/>; se tabellen med påståenden nedan).

seg-ce2b3237acfe = biasstabilitet

seg-129dc6af8f10 = brus som rot-PSD

seg-7109e60b8c9b = cold-atom-quat (kvant)

seg-5f5690d74918 = { "5.88e-7" } m/s^{ "2" } ({ "60" } ng, { "24" } h)

seg-8e83c799fb03 = { "22" } ug/sqrtHz = { "2.16e-4" } (m/s^{ "2" })/sqrtHz

seg-b52686064c43 = Templier m.fl. { "2022" }, Science Advances (arXiv:{ "2209.13209" })

seg-09b42bed82c9 = nav-grade-quartz (klassisk)

seg-fa9adbe58c2f = { "1.57e-3" } m/s^{ "2" } (~{ "160" } ug)

seg-63f64f576abc = ~{ "20" } ug/sqrtHz = { "1.96e-4" } (m/s^{ "2" })/sqrtHz

seg-8714c547449a = Honeywell QA-2000 / Groves AESS Tutorial

seg-79fc524162b5 = Ärlig inramning: fördelen med kalla atomer är <b>långsiktig biasstabilitet</b> (~2600 gånger lägre), som dominerar ett långt GNSS-avbrott via { "0.5" }<em>b</em>T^{ "2" }. Det kortsiktiga bruset är jämförbart (kvant ~{ "22" } mot klassisk ~{ "20" } ug/sqrtHz) – kvantsensorn vinner maratonloppet, inte spurten. Mognad: accelerometrar med kalla atomer är på laboratorie-/tidigt stadium (JRC122785), kvarts av navigeringsklass är driftsatt.

seg-e02e93f4f30a = Paket { "3" } – tidsöverföring (optisk mot radiofrekvent (RF), optisk länk mellan satelliter)

seg-2b87e5f0ba7e = Vitt tidsjitter -> synkroniseringsprecision

seg-229295aa1f70 = <c1/>: simulerad RMS för synkronisering återger länkens jitter sigma_j; sampelmedelvärdet medelvärdesbildas som sigma/sqrt(N) inom <{ "20" } % (medelvärde över frön).

seg-4325ec478bca = Tid -> avståndsmätning i en riktning

seg-aa7a1f463683 = avstånd = c * dt, c={ "299792458" } m/s; { "1" } ps = { "0.299792458" } mm (exakt, handhärlett test).

seg-7ad8bb95bf35 = Flimmer-/TDEV-golv, rest av reciprocitet i tvåvägs

seg-5bf72778b6c2 = <c1/> (typen <c2/>): flimmerfasbrus (Kasdin–Walter, plan TDEV), en dygnsvis icke-reciprocitet och en konstant reciprocitetsrest på tvåvägsserien; paketet <c3/> med vitt jitter är oförändrat.

seg-dae3fa0375fe = jitter för ett enskilt sampel

seg-4a141a45a8ff = källa

seg-ee136a1d0051 = { "1" } ps ({ "1e-12" } s)

seg-c78abd60ec97 = mål som är trovärdigt i omloppsbana

seg-9dfc1d4334a3 = optisk länk mellan satelliter, synkroniseringsmål på pikosekundsnivå; labb-O-TWTFT (TWTFT: two-way time and frequency transfer) ~{ "1" } fs (Giorgetta { "2013" } / Deschenes { "2016" })

seg-4f3d23d83190 = { "0.5" } ns ({ "5e-10" } s)

seg-0e730e8e2237 = uppmätt under en enskild session

seg-b9faad47d802 = BIPM/PTB/NIST (BIPM: Internationella byrån för mått och vikt; PTB: Physikalisch-Technische Bundesanstalt, Tysklands nationella metrologiinstitut) TWSTFT

seg-51e2e5782c96 = Ärlig inramning: det optiska värdet är ett synkroniseringsmål på pikosekundsnivå i omloppsbana (inte flugit). Det markbundna optiska laboratoriegolvet är ~{ "1" } fs (mycket bättre); en välkonstruerad mikrovågslänk (mikrovågslänken (MWL) i ACES (Atomic Clock Ensemble in Space), ~{ "0.3" } ps) kan konkurrera med optisk, så baslinjen ”RF = { "0.5" } ns” avser specifikt vanlig TWSTFT. Omvandlingen till avstånd gäller envägs (avstånd = c<em>dt); tvåvägs/tur och retur halverar den (avstånd = c</em>dt/2).

seg-5fa72f18f983 = Paket { "4" } – hybridsammanslagning (slutprov)

seg-3de12b094504 = Sätter ihop paket { "1" } (klocka), paket { "2" } (tröghet) och paket { "3" } (tidsöverföring) till en PNT-svit (positionering, navigering och tidssynkronisering). Sviten måste hålla BÅDE tid (< specifikation för tid) och position (< specifikation för position) inom gränserna; <c1/> är tiden tills någondera överskrids. Valfri optisk tidsöverföring över länk mellan satelliter (ISL) synkroniserar om klockan under avbrottet (endast stöd för tid – position synkroniseras inte om, eftersom tidsöverföring ger tid, inte position).

seg-4f7cd8f86565 = Aspekt

seg-19deb2a3537c = Kombinerad PNT-poängsättning (tid OCH position)

seg-77a7595ffad7 = <c1/> handhärlett <c2/>-test (pnt_holdover = den första av tid/position som överskrids).

seg-d0e39bf123d8 = Integritet + säkerhet för hybridpaketet

seg-3fb63eb2b6b8 = <c1/>: en Kalman-estimator för tid som disciplineras mot sanningen (nominellt) och ankras om vid varje optisk omsynkronisering; integritet är innehållet inom skyddsgränsen (gränsen inkluderar länkens jittergolv), säkerhet är poängen för spoofing-detektion. Testad för båda sviterna inklusive fallet med länkstöd.

seg-c3be96b7cb41 = Gemensam sammanslagningsestimator

seg-e9d5448ea06c = <c1/>: ett enda gemensamt Kalman-filter ([fas, frek] ⊕ [pos, hast]) är navigatorn, disciplinerad av GNSS (lär sig offseterna ur icke-noll initial kovarians) och stödd av tidsöverföring; den gemensamma kovariansen ger en gemensam integritet som testats som tillförlitlig (≥{ "0.9" }) för båda sviterna med brusmässigt konsistenta sensorer. Paketet observerar position och tid <b>separat</b>, för vilket det optimala filtret är blockdiagonalt; skattning av konstant bias i utvidgat tillstånd och dynamiskt korsstöd är framtida arbete.

seg-915ec766439f = Kopplat filter för klocka + position (kovarians mellan block)

seg-fd718a51859a = <c1/>: ett enda staplat Kalman-filter <c2/> (uppdateringar i Joseph-form) vars <b>pseudoavstånds</b>mätning <c3/> kopplar samman positions- och klockblocken. Tester: ett delat pseudoavstånd gör <c4/> skilt från noll (frikopplade filter håller det exakt på { "0" }); två skilda geometrier löser tillsammans ut injicerade positions- och klockoffseter som ett enda avstånd inte kan skilja åt; en positionsbestämning med <b>enbart klocka</b> skärper <b>positionen</b> via korskovariansen (den vinst som kopplingen ger och som frikopplade filter inte kan ge); och en Monte Carlo-<b>NEES är konsistent med χ²({ "4" })</b> (Bar-Shalom §{ "5.4" }, band baserat på körningar). 1-DOF (paketets dimensionalitet); ännu inte kopplat till det körbara paketet, och utvidgningen till 8 tillstånd i 3-D är framtida arbete.

seg-31ecf062b941 = Sammansättning av validerade delmodeller

seg-9b849cb4fe8d = ärver

seg-4e1c8b6791f3 = termerna för klocka/tröghet/tidsöverföring är validerade i sina egna paket.

seg-b672e5499976 = Löst kopplat GNSS/INS (paketet <c1/>)

seg-277425f2cbcf = <c1/>: ett EKF med 15 tillstånd och feltillstånd (δp, δv, ψ, accel-/gyrobias; Groves §{ "14" }) driver navigatorn för strapdown med tre axlar med återkoppling. Tester: ett injicerat positionsfel nollas vid perfekt stöd från sanningen; den stödda lösningen förblir begränsad till meter medan ett fritt löpande INS divergerar förbi { "100" } m; och den sammanslagna positions-RMS:en över ett avbrott på { "60" } s slår ostödd dödräkning med gränsen i ensembletestet (~{ "4" }× när den mättes före { "0.27.3" }; marginalen är större efter rättelsen nedan). Gyrobiasens koppling kontrolleras mot själva strapdown-navigatorn: en känd kvarvarande gyrobias måste ge det attitydfel som filtret förutsäger (<c2/>), och ett brett prior måste lära sig en gyrobias av flygstyrenhetsklass samtidigt som det förblir begränsat; båda fallerar med tecknet före 0.27.3. <b>Reviderat i { "0.27.3" }:</b> den kopplingen hade fel tecken, så skattningarna av gyrobias drog åt fel håll och bara ett snävt prior höll paketet stabilt; de publicerade värdena för avbrott ändrades (CHANGELOG, Fixed). Ärlig begränsning: vid löst kopplat går accelbias/lutning svårt att skilja åt, så kalibrering per bias görs inte gällande.

seg-1c9a9f76a432 = Tätt kopplat GNSS/INS (pseudoavstånd)

seg-b4ccc12229c4 = <c1/> + <c2/> <c3/>: innovationen bildas i avståndsdomänen (siktlinjens Jacobian på δp). Tester: fyra satelliter nollar ett injicerat horisontellt fel på { "8" } m/−{ "5" } m till < { "0.1" } m; <b>två satelliter</b> (ingen positionsbestämning av position, hastighet och tid (PVT) möjlig) minskar ändå det horisontella felet med > { "5" }×; en enda satellit rakt ovanför observerar bara komponenten längs siktlinjen (vertikalt) och lämnar det horisontella orört; felaktiga indata avvisas. Enbart pseudoavstånd – bärvågsfas och ett uttryckligt mottagarklocktillstånd finns på färdplanen.

seg-240b681b6021 = Trohet i korsstöd mellan sensorer (full sammanslagning med Kalman/faktorgraf)

seg-efe7e288276b = <c1/> i paketet <c2/>

seg-e5371874c57d = Hybridpaketet är en komposition på systemnivå + tidsstöd, inte en optimal estimator. Filter finns på andra ställen: det löst och tätt kopplade EKF (utökat Kalman-filter) i paketet <c1/> (raderna ovan) och UKF (unscented Kalman-filter) med 17 tillstånd i typen <c2/>. Ingen faktorgrafsutjämnare är modellerad.

seg-189758709fd2 = Resultat: sviten med enbart kvant klarar full PNT genom ett avbrott på { "1.8" } h; sviten med enbart klassiskt är <b>positionsbegränsad</b> (IMU av navigeringsklass överskrider först). Optisk tidsöverföring mellan satelliter håller även den klassiska KLOCKAN låst och isolerar tröghetssensorn som den klassiska svitens svaga länk – kärnan i argumentet för kvanttröghet och optisk tidssynkronisering tillsammans.

seg-a4c5b45ea8a5 = Geometri – GNSS-tillgänglighet ur banor

seg-d347bb63c1fd = Cirkulär propagering med tvåkroppsproblemet

seg-60c369fbbd97 = <c1/>: omloppstid <c2/> (mu = { "3.986004418e14" }), positionen återkommer efter en omloppstid, planaritet för ekvatorial/polär bana – handhärledda tester.

seg-1260a2fef95f = Excentrisk (keplersk) propagering

seg-49df9d526f9c = <c1/>: Keplers ekvation <c2/> löst med Newton (rest < { "1e-12" }); radier i perigeum/apogeum <c3/>; det cirkulära fallet stämmer med den slutna vägen inom { "1e-9" }.

seg-958f03424508 = Sekulär drift av nod/apsid på grund av J2

seg-336b9581c47c = <c1/>: <c2/>, <c3/> (Vallado); noden regredierar (prograd) / avancerar (retrograd) / är stillastående (polär), och apsiderna fryser vid den kritiska inklinationen { "63.4" } grader – handhärledda tester av tecken/noll. Endast tvåkropps- + sekulär, inte oskulerande.

seg-dcba8d368326 = Synlighet längs siktlinjen (skymning bakom jorden + elevationsmask)

seg-2eee9a8f894b = En antipodal satellit skyms, en satellit radiellt utåt vid { "90" } graders elevation, en tangentiell satellit vid horisonten – exakta handhärledda tester.

seg-f251c75eb367 = Synlighet -> GNSS-tillstånd -> tidslinje

seg-70fbb9f3cc2b = <c1/> synliga = nominellt, 1–3 degraderat, { "0" } nekat; Walker-delta-generator; ett integrationstest driver en klock-holdover-körning från den härledda tidslinjen.

seg-988d3fedb7f5 = Optimerare för konstellationsutformning + geometri för streets-of-coverage

seg-2a636487a4e6 = <c1/>: <c2/> söker igenom rutnätet <c3/> och returnerar den cell som bäst uppfyller ett <c4/> (minsta antal satelliter för ett täckningsmål / maximal täckning / lägsta sämsta PDOP (PDOP: positionens precisionsförsämring)) – ett test kontrollerar att valet är lika med en oberoende brute force-genomsökning av samma svep, och ett genomgånget exempel bekräftar att en Walker 24/6/1-utformning för GPS (Global Positioning System) täcker minst lika bra som en utglesad med 18 satelliter. De analytiska slutna uttrycken för <b>streets-of-coverage</b> (<c5/> <c6/>; <c7/> <c8/>, Rider/Beste) är handverifierade mot läroboksgeometri (GPS vid en mask på { "5" }°: λ ≈ { "71.16" }°, halv gatubredd för 4 satelliter ≈ { "62.83" }°) och upptäcker luckan vid för få satelliter (<c9/>). Den fullständiga lösaren enligt Rider för minsta antal satelliter vid <em>global</em> täckning (det sömkänsliga antalet plan) är ännu inte implementerad.

seg-a1c1364cc45a = Precisionsförsämring (GDOP/PDOP/HDOP/VDOP/TDOP (GDOP: geometrisk precisionsförsämring; HDOP: horisontell precisionsförsämring; VDOP: vertikal precisionsförsämring; TDOP: precisionsförsämring för tid)) -> positionsnoggrannhet

seg-a1706d47f895 = <c1/>: <c2/> ur designmatrisen för siktlinjerna. <b>Extern oberoende referens</b> (<c3/>): de fem DOP-faktorerna återger de som beräknats av <b>gnss_lib_py { "1.0.4" }</b> (Stanford NAV Lab – ett oberoende, referentgranskat GNSS-bibliotek, som här används på samma sätt som ERFA (Essential Routines for Fundamental Astronomy) för referenssystemen) över <b>{ "8" } geometrier</b> från välkonditionerade till nära singulära (DOP i hundratal), inom <b>{ "1e-6" }</b> relativt; ursprung och återgenerering i <c4/>. Som en ytterligare kontroll med slutna uttryck återger en regelbunden tetraedergeometri de analytiska DOP-värdena (PDOP { "1.5" }, TDOP { "0.5" }, GDOP √{ "2.5" }, HDOP √{ "1.5" }, VDOP √{ "0.75" }) inom { "1e-9" }. Positions-sigma = PDOP × användarens ekvivalenta avståndsfel.

seg-504d5aa92cbc = Positionsfel = σ_UERE × DOP för motorns egen positionsbestämning med minsta kvadrat

seg-fc3443210358 = <c1/>, <c2/>: en Monte Carlo med frö (N = { "20,000" } epoker per geometri, σ = { "1.5" } m, ChaCha8-frö { "36" } + i) av <c3/> med enhetsvikter, löst från den sanna positionen, på de <b>{ "8" } geometrierna i <c4/></b> (de vars DOP är matchad mot gnss_lib_py), mot σ²·Q där Q är kovariansfaktorn för själva kärnan <c5/> (<c6/>, samma aritmetik). <b>Toleranser förhandsregistrerade</b> (incheckning e50c88d2, före den första körningen, enligt designanteckningen för geometrin i { "0.36" }, avsnitt { "5.2" }), var och en som ett antal standardfel: varianser för öst, nord, upp och klocka inom { "5" } %; RMS för H/V/P inom { "2.5" } %; korrelation öst–nord inom { "0.035" }; medelvärden inom { "5" } standardfel; andelen i { "95" } %-ellipsen horisontellt inom { "0.95" } ± { "0.0077" }. Första körningen: alla { "104" } kontroller godkänns (sämsta varians { "3.2" } %, RMS { "1.6" } %, korrelation { "0.012" }, medelvärde { "2.2" } standardfel, ellips { "0.0039" }). <b>Negativa kontroller</b> fallerar som de ska: fördubblad PDOP fallerar för varje geometri; fel som växer som 1/sin(elevation) mot den ovägda Q fallerar en varianskontroll för varje geometri vars lägsta satellit ligger under { "20" }°. <b>Hur den hänger ihop med raden ovan:</b> den raden validerar dessa geometriers DOP mot gnss_lib_py; den här lägger till steget från de faktorerna till meter via motorns lösare. <b>En första, separat kontroll finns kvar bredvid</b> (<c7/>, <c8/>, körd före förhandsregistreringen och redovisad som sådan): fyra handvalda himlar (öppen, klustrad, kanjon, halv himmel; σ { "1" } m) med chi-kvadrat-konfidensintervall på { "1e-6" } totalt över { "20" } kontroller; kvoter { "0.987" } till { "1.009" }, och dess egna negativa kontroller (ett DOP-fel på { "10" } %, fel som 1/sin(elevation)) fallerar som de ska. <b>Varför MODELLED:</b> ingen extern datamängd; den visar inte att en verklig mottagares fel följer modellen, och σ_UERE är en indata.

seg-94bffbd8385b = Tillgänglighet med flera konstellationer

seg-a40eab03bbbe = <c1/>: ytterligare <c2/> slås ihop till en satellituppsättning för synlighet/DOP; ett test av det kombinerade antalet bekräftar unionen.

seg-0b905100d91c = Sänd jonosfär (Klobuchar, IS-GPS-200 (IS: Interface Specification)) → snedfördröjning på L1

seg-05e278f04770 = <c1/>: <c2/>, den sända enfrekvensmodellen med åtta koefficienter. <b>Extern oberoende referens</b> (<c3/>): snedfördröjningen på L1 återger <b><c4/> i RTKLIB (ett bibliotek med öppen källkod för kinematisk realtidspositionering)</b> (tomojitakasu/RTKLIB, <c5/> – den de facto öppna GNSS-referensen, kompilerad från källkod och körd oberoende) över <b>{ "10" } fall</b> som spänner över elevation, azimut, lokal tid och två koefficientuppsättningar (kshanas standard + RTKLIB:s), inom <b>< { "1e-4" } m</b>. Läsaren för IONEX (IONosphere map EXchange format) TEC-kartor (TEC: totalt elektroninnehåll) för GIM-filer (global jonosfärskarta) finns nu (<c6/>, <c7/> med bilinjär interpolation i rum och tid och en snedmappning, enhetstestad i craten); en korskontroll av den interpolationen mot en verklig GIM-produkt från CODE (Center for Orbit Determination in Europe) är fortfarande en uppföljning. Själva sändmodellen är externt validerad.

seg-39e235557ecc = Detektionskärna för RAIM/ARAIM (ARAIM: advanced receiver autonomous integrity monitoring) (χ² / icke-centralt χ² / normal) → trösklar och multiplikatorer

seg-8906f922b9b9 = <c1/>: detektionströskeln för snapshot / solution-separation / ARAIM (<c2/>), den icke-centralitet för missad detektion <c3/> (<c4/>) och multiplikatorerna K_fa/K_md/K_V (<c5/>) beräknas alla ur en beroendefri regulariserad ofullständig gammafunktion. <b>Extern oberoende referens</b> (<c6/>): <b>{ "171" } fall</b> återger <b>SciPy { "1.17.0" }</b> (<c7/>/<c8/>/<c9/> + <c10/> – en oberoende implementation av Cephes/Boost, en annan algoritm) över driftsområdena för P_fa / P_md / redundans, inom <b>≤ { "1e-6" } relativt</b>. Geometrin som omger kärnan (lutningen/kovariansen ur <c11/>) är den DOP-kärna som validerats mot gnss_lib_py. <b>Omfattning:</b> den här raden fäster den <em>statistiska kärnan</em>. Skyddsnivåns <em>värde</em> i ARAIM:s MHSS-fördelning (multiple-hypothesis solution separation) fästs separat mot det publicerade genomgångna exemplet från ARAIM Technical Subgroup i WG-C (Working Group C) (<c12/>, VPL (vertikal skyddsnivå) { "18.2926" } m mot { "18.3" } m, HPL (horisontell skyddsnivå) { "13.4063" } m mot { "13.45" } m, inom referensens egen tolerans på { "0.05" } m; se anmärkningen om standarder nedan och <a1><c13/></a1>).

seg-b17f1501a267 = Skyddsnivå för SBAS (satellitbaserat förstärkningssystem) (DO-229E bilaga J) → horisontell / vertikal skyddsnivå (HPL / VPL)

seg-abe00b67e4cb = <c1/>: <c2/>, den viktade minsta kvadrat-lösningen (LS: least squares) <c3/> → horisontell felellips storaxel + vertikal σ, skalad med K-faktorerna i DO-229E. <b>Extern oberoende referens</b> (<c4/>): kshanas HPL återger <b>RTKLIB-grenen för SBAS-PL</b> (<c5/> <c6/>, implementationen ”DO-229D bilaga J” av Siki & Takács { "2017" }), körd av <c7/> på <b>verkliga EGNOS-data (European Geostationary Navigation Overlay Service)</b> (sända meddelanden från GEO (geostationär bana) PRN120 + verklig RINEX (Receiver Independent Exchange Format) från BUTE/Budapest, 2017-02-19), över <b>{ "6" } epoker</b> inom <b>< { "2e-3" } m</b>. σ per satellit är referensens egen fullständiga SBAS-budget (UDRE (användarens differentiella avståndsfel) + GIVE (vertikalt jonosfärfel i rutnät) jono + tropo + flygburet). ESA gLAB { "v6.0.0" } (<c8/>) kompilerades och bekräftades använda identisk konvention. <b>Anmärkning om K_V:</b> båda referenserna avrundar MOPS (minimum operational performance standards) K_V → { "5.33" }; kshana använder det exakta <c9/> (~{ "0.06" } % mindre VPL), så den vertikala är validerad som den K-faktorfria <c10/> (= referensens VPL / { "5.33" }). HPL matchas direkt (K_H = { "6.0" } på båda sidor).

seg-fd16d642cafd = Verklig konstellationsgeometri ur TLE (rad 2 / keplersk)

seg-1311ef1cb4bb = <c1/> (tolkning)

seg-5117debbce89 = <c1/>: tolkar de keplerska medelelementen på rad 2 (halva storaxeln ur medelrörelsen); en känd elementmängd för ISS (International Space Station) går en rundtur till rätt element och omloppstid. För ett block med enbart rad 2 är propageringen motorns tvåkropps- (+ valfri J2) av <em>medel</em>elementen – sund för en ögonblicksbild från en gemensam epok, men driver från SGP4 (Simplified General Perturbations { "4" }) över tid.

seg-26d22e76e28d = Propagering med SGP4 / SDP4 (Simplified Deep-space Perturbations { "4" }) (kompletta TLE)

seg-1099f1bffa01 = <c1/>: fullständig SGP4 nära jorden + SDP4 för djuprymd (sekulära/periodiska måne–sol-effekter + resonans i geopotentialen på { "12" } h / { "24" } h). Validerad i <c2/> mot de officiella vektorerna i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (”Revisiting Spacetrack Report #3”) – alla { "666" } referenstillstånd (nära jorden, djuprymd, resonanta, felkodsfall) stämmer med ett värsta positionsfel på ≈ { "4.1" } mm. En komplett tvåradig mängd (rad { "1" } + rad { "2" }) propageras med SGP4; enbart rad 2 förblir keplersk; de två kan blandas. Referenssystemet är TEME (true equator, mean equinox), använt konsekvent för användaren och satelliterna (ingen reduktion från TEME till ECEF (ECEF: jordcentrerat, jordfast) – tillräckligt för geometri för tillgänglighet/DOP).

seg-c8fc6a49d249 = IAU (International Astronomical Union) 2000A / 2000B nutation + reduktion från TEME till GCRS (GCRS: Geocentric Celestial Reference System)

seg-b31c49596100 = <c1/>: den <b>fullständiga serien IAU 2000A</b> ({ "678" } lunisolära + { "687" } planetära termer, <c2/>) och trunkeringen 2000B med 77 termer (<c3/>) är var och en validerade <b>bit för bit</b> mot de publicerade referensvektorerna i SOFA/ERFA (SOFA: Standards of Fundamental Astronomy) vid JD_TT { "2453736.5" } – <c4/> ger Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" }; <c5/> ger Δψ = −{ "0.9632552291148363e-5" }, Δε = { "0.4063197106621160e-4" } – båda inom <b>{ "1e-13" } rad</b>. Tabellen för 2000A är maskingenererad ur ERFA-källan <c6/> av <c7/> (återger den incheckade <c8/> bit för bit). Nutationsmatrisen (<c9/>), jämdygnsekvationen och hela kedjan TEME→TOD→MOD→GCRS (TOD: true of date; MOD: mean of date) (<c10/>, Vallado AIAA-2006-6980) testas för egenskaper som äkta rotation/rundtur/precession plus nutation, nutationsmatrisen mot ERFA <c11/> element för element inom { "1e-14" }, och hela kedjan TEME→GCRS mot Vallados publicerade exempel TEME→GCRF (AIAA 2006-6753, 2004-04-06) inom <b>{ "0.11" } m</b> (<c12/>); tills den kontrollen från ände till ände lades till hade nutationsmatrisen Δψ med fel tecken, en vridning på { "2" }·Δψ (cirka { "25" }″) som egenskapstesterna inte kunde se (se CHANGELOG, Unreleased, Fixed); 2000A mot 2000B stämmer inom < { "1" } mas som krävs. Kedjan bygger på jämdygn/GMST (GMST: Greenwich mean sidereal time); reduktionen med CIO utan jämdygn (X,Y,s) och dess oberoende numeriska korskontroll med ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris – ett verktyg för planetgeometri i rent Rust; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) (≤ { "3.6" } m vid GNSS-bana, väl inom målet < { "10" } m) finns i CIO-raden nedan.

seg-0be3c40cc81a = IGRF-14 (IGRF: International Geomagnetic Reference Field) – modell för det geomagnetiska huvudfältet

seg-9dbb3b1b18a1 = <c1/>: IAGA:s (International Association of Geomagnetism and Aeronomy) Schmidt-normaliserade fält i sfäriska harmoniska funktioner (grad/ordning { "13" }, { "2025.0" } + sekulär variation; koefficienterna maskingenererade ur den officiella <c2/> av <c3/>, vilket återger <c4/> bit för bit). Validerad på fem oberoende fronter: ({ "1" }) exakta stickprov av koefficienter mot IAGA-filen (g₁⁰=−{ "29350.0" }, g₁¹=−{ "1410.3" }, h₁¹={ "4545.5" } nT); ({ "2" }) syntesen av grad 1 återger det <b>exakta slutna uttrycket för det lutande dipolfältet</b> <c5/> inom { "1e-6" }; ({ "3" }) det <b>fullständiga analytiska fältet av grad 13 är lika med −∇V</b> för skalärpotentialen (finita differenser, inom { "1e-4" }) – vilket prövar Legendre-derivatorna och termen 1/sinθ från ände till ände; ({ "4" }) dipolaxeln återger den kända <b>geomagnetiska nordpolen</b> (~{ "80.7" }°N, −{ "72.7" }°E) och <b>dipolstyrkan</b> (~{ "29.7" } µT), och det globala fältet ligger i det fysikaliska bandet { "22" }–{ "67" } µT med rätt tecken på inklinationen per halvklot; och ({ "5" }) <b>extern oberoende referens</b> – hela syntesen återger de officiella värdena från <b>webbtjänsten för IGRF-14 vid British Geological Survey</b> vid { "2025.0" } (geodetisk, höjd enligt WGS-84 (WGS: World Geodetic System)) inom <b>< { "2" } nT</b> på X/Y/Z/F och <c6/> på D/I i fyra punkter inklusive { "400" } km höjd (<c7/>).

seg-c1027d5ffc44 = CIO-baserad reduktion enligt IAU 2006/2000A från GCRS till ITRS (ITRS: International Terrestrial Reference System)

seg-aad81285e8cf = <c1/>: kedjan från himmelssystem till jordsystem utan jämdygn. CIP-koordinaterna (Celestial Intermediate Pole) <c2/> och serien med 66 termer för CIO-lokatorn <c3/> är validerade <b>bit för bit</b> mot den publicerade vektorn <c4/> i SOFA/ERFA vid JD_TT { "2453736.5" } – X={ "0.5791308482835292617e-3" } ({ "1e-14" }), Y={ "0.4020580099454020310e-4" } ({ "1e-15" }), s=-0.1220032294164579896e-7 ({ "1e-18" }); matrisen GCRS→CIRS (CIRS: Celestial Intermediate Reference System) mot <c5/> (alla nio element inom { "1e-12" }); jordrotationsvinkeln (ERA) mot <c6/> = { "0.4022837240028158102" } ({ "1e-12" }). Tabellen <c7/> är maskingenererad ur ERFA-referensen <c8/> av <c9/> (återger <c10/> bit för bit). Hela <c11/> (CIO <c12/> = polrörelse · ERA · GCRS→CIRS) testas för äkta rotation + rundtur, och visas vara konsistent med den äldre reduktionen av TEME enligt jämdygn/GMST-1982 inom { "1" } m vid en radie på { "7 000" } km (konventionerna skiljer sig åt med cirka { "5" } cm där). <b>Oberoende korskontroll mot tredje part (<c13/>):</b> samma <c14/> jämförs mot <b>ANISE</b> (omimplementationen i rent Rust av NAIF/SPICE (NAIF: Navigation and Ancillary Information Facility)) som roterar GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) ur JPL:s (Jet Propulsion Laboratory) <c15/>, med <b>identiska jordorienteringsparametrar <c16/> från IERS (International Earth Rotation and Reference Systems Service) matade till båda sidor</b>, över åtta kvartalsvisa epoker { "2020" }–{ "2023" }. De två oberoende realiseringarna av referenssystemet stämmer inom en <b>största relativa rotation på { "0.028" }″ – ≤ { "0.86" } m på marken, ≤ { "0.93" } m vid LEO (låg jordbana), ≤ { "3.6" } m vid GNSS-bana</b> (medelvinkel { "0.023" }″). Detta är kontrollen av referenssystemet ”< { "10" } m” på ROADMAP, <b>levererad</b>; resten är den förväntade skillnaden i modell/datum mellan ITRF93 och IERS-2010-CIO, inte ett fel (det bitvisa stödet förblir vektorerna i SOFA/ERFA ovan). ANISE är en crate med MPL-2.0 (MPL: Mozilla Public License) / edition-2024, så kontrollen ligger i en fristående delcrate utanför arbetsytan som aldrig rör det publicerade beroendeträdet för <c17/> eller någon standardgrind i CI.

seg-fa5889f379d2 = Rundturstest för export till SP3 (Standard Product { "3" }, det precisa banformatet) (konstellation → SP3-c → ny tolkning)

seg-cd53434eba3a = <c1/>: den verkliga ögonblicksbilden <c2/> från Celestrak ({ "30" } GPS-satelliter) propageras med SGP4, exporteras till SP3-c (<c3/> → <c4/>), tolkas på nytt (<c5/>), och de återvunna ECEF-positionerna jämförs mot SGP4-sanningen vid varje epok över { "24" } h – sämsta rest <b>< { "0.5" } m</b> (skrivarens serialisering i millimeter; milstolpens tolerans på { "10" } m i TLE-klass (TLE: tvåradig elementmängd) uppfylls med stor marginal). Sökvägen <c6/> i CLI (kommandoradsgränssnitt) täcks också: det medföljande omloppsscenariot exporterar en SP3 med 30 satelliter som går att tolka på nytt, och ett scenario utan omlopp avvisas.

seg-fa5ee52e59aa = Verklig geometri för GPS-konstellationen ur TLE (SGP4 → ECEF)

seg-1329a53ca94c = <c1/>: en äkta <b>ögonblicksbild <c2/> från Celestrak</b> (2021-07-28, { "30" } operativa GPS-satelliter; ursprung i <c3/>) tolkas och varje satellit propageras genom den validerade SGP4-kärnan till ett gemensamt ögonblick, roterad från TEME till ECEF. Kontrollerar att hela konstellationen hamnar på GPS-skalet i medelhög jordbana (MEO) inom { "1" } %, och att från en plats på mellanbreddgrad med öppen himmel ger alla synliga satelliter (nio satelliter) en PDOP på { "1.64" } där den vertikala precisionsförsämringen överstiger den horisontella (som den måste för en markbunden användare). Detta prövar SGP4 på en verklig konstellation, vid sidan av de verkliga datavägarna för SP3 (precis) och RINEX (sänd).

seg-a1b7d74bbe02 = Walker-generator med medelelement för SGP4

seg-01f1635b75e4 = <c1/>: ett utformat Walker-delta-mönster ges ut som medelelement för SGP4 (Kozai-medelrörelse vald så att halva storaxeln i SGP4 hamnar på målskalet) och propageras genom den validerade kärnan. Tester: en GPS-lik Walker med 24 satelliter ligger på MEO-skalet inom { "1" } %, planen ligger exakt { "90" }° ifrån varandra i RAAN (rektascension för uppstigande nod) återvunnet ur banornas normaler, och medelrörelsen återger omloppstiden på ~{ "718" } min för GPS-skalet.

seg-6e8c472ec9fa = Svep av PDOP för konstellationen + mått för täckning/återbesök (FoM)

seg-dcdbf9c78ca5 = <c1/> (monotonicitet)

seg-5a70f090db45 = <c1/>: <c2/> tabellerar täckning och median/sämsta PDOP över ett rutnät <c3/>; <c4/> rapporterar täckningsandelen och luckorna mellan återbesök i en punkt på marken. Validerad genom de fysikaliska monotonicitetsvillkor som en designavvägning måste uppfylla: fler satelliter sänker aldrig täckningen och sänker strikt median-PDOP (en fullständig utformning med 24 satelliter täcker kontinuerligt vid PDOP ~{ "1.7" }), och att förtäta en utglesad konstellation krymper strikt den sämsta luckan mellan återbesök. Den genomsnittliga luckan mellan återbesök överstiger aldrig maxvärdet. Det här är tabeller för geometriavvägningar, inte en certifierad länk- eller täckningsbudget.

seg-9f0747d71ecc = Ärlig inramning: det här är ett deterministiskt geometrilager (cirkulära banor, sfärisk jord med medelradien { "6371" } km, ren siktlinje). Det fastställer <em>tillgänglighet</em> och den <em>geometriska</em> positionsnoggrannheten (precisionsförsämring × en representativ budget för avståndsfel) ur verklig geometri, inte en navigeringslösning med precis efemerid. Referensen <c1/> placerar ett rymdfarkost inuti GNSS-skalet: den håller en positionsbestämning bara ~{ "59" } % av dygnet, kvantklockan håller en tidslösning på { "5" } ns genom varje lucka (tillgänglighet { "1.0" }) medan den chipskaliga klockan håller ~{ "0.73" }.

seg-e2c433c35ba8 = Numerisk propagator (Cowell) och kraftmodell

seg-20ace4e0a710 = Den numeriska propagatorn (<c1/>) integrerar en hierarkisk kraftmodell (<c2/>) med de adaptiva integratorerna (<c3/>). Varje term nedan är validerad mot analytisk sanning eller ett handhärlett slutet uttryck; störningarna är <b>av som standard</b>, så de utgivna gyllene värdena är orörda. Den sammansatta modellen korskontrolleras också mot ett annat verktyg: <c4/> kör { "11" } fall i LEO och GTO (geostationär överföringsbana), { "275" } timepoker, mot propagatorn DormandPrince853 i Orekit { "12.2" }, och de konservativa nivåerna (tvåkropp → J2–J6 → sol/måne → SRP med kanonkula) stämmer inom ett värsta fall på { "0.08" } m över { "24" } h (VALIDATED i matrisen); nivån med luftmotstånd är bara karakteriserad ({ "333" } m) och förblir MODELLED.

seg-ec74e57ff801 = Cowell-propagator mot analytisk keplersk sanning

seg-8d773778ff0e = <c1/>: den ostörda (tvåkropps-) banan återger den <b>exakta lösningen med universella variabler för Kepler inom under en meter över en LEO-bana på { "24" } h</b> (en snävare gräns än ”mot en numerisk referens < { "10" } m”); specifik energi och rörelsemängdsmoment bevaras till ~{ "1e-9" } relativt; nodregressionen på grund av J2 återger det slutna <c2/> till förstaordningens teori (inom { "2" } %, resten av ordningen O(J2²)). <c3/> returnerar <c4/> i stället för ett tyst felaktigt svar när Newton inte konvergerar (nära perigeum, e = { "0.999" }). Den robusta <c5/> (startvärde enligt Markley { "1995" }, <c6/>) konvergerar där och över { "0" } ≤ e ≤ { "0.999999" }, inom { "0.9" } ε·|E| från rötter med 50 siffror i mpmath (<c7/>).

seg-549d15780f79 = Adaptiva integratorer (RK4 (Runge–Kutta av fjärde ordningen) med stegdubblering + det inbäddade paret Dormand–Prince RK5({ "4" }), DP5({ "4" }) nedan)

seg-1fcc7553c627 = <c1/>: RK4 integrerar <c2/> till < { "1e-9" }, visar ~{ "16" }× lägre fel per halverat steg (konvergens av 4:e ordningen) och bevarar den harmoniska oscillatorn över en period. Det inbäddade felmåttet för DP5({ "4" }) är <b>O(h⁵)</b> (att halvera steget skär det ~{ "32" }×), integrerar oscillatorn över { "50" } perioder med energin bevarad inom < { "1e-6" }, och når samma slutpunkt vid samma tolerans med <b>färre funktionsanrop</b> än stegdubbling; <c3/> klarar samma gräns för Kepler under en meter och stämmer med RK4-vägen inom < { "1" } m på en J2..J6-bana. <b>DOP853</b> (<c4/>): Hairers par { "8" }({ "5,3" }) med tät utdata återger SciPy { "1.18.1" }:s DOP853 steg för steg (enskilt steg inom { "5.6e-15" }; identiskt antal steg i körningarna med e = { "0.7" } och Arenstorf, ett byte mellan accepterat/avvisat på { "501" } steg i LEO-körningen; sluttillstånd inom { "1.6e-12" }) och stämmer med den exakta lösningen för Kepler lika nära som SciPy gör (<c5/>).

seg-345ae1eb05ec = Zonalt harmoniskt fält J2–J6

seg-a88e67186e69 = <c1/>: <c2/> kontrolleras på tre sätt – den <b>reduceras till den med 666 vektorer validerade <c3/> till maskinprecision</b> när den begränsas till <c4/>; den <b>stämmer med den numeriska gradienten av sin egen zonala potential</b> genom hela fältet J2..J6 (guldstandarden för konservativa fält); och de udda termerna <c5/> mot de jämna <c6/>/<c7/> visar den karakteristiska (anti)symmetrin mellan nord och syd under <c8/>. En propagerad bana med J2..J6 bevarar totalenergin till ~{ "1e-8" } över ett dygn.

seg-5536986d9c8f = Gravitation från tredje kropp (sol och måne)

seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>stämmer med den exakta gradienten av sin störningspotential</b>, försvinner i geocentrum och når läroböckernas storleksordningar i LEO (~{ "5e-7" } m/s² sol, ~{ "1.1e-6" } m/s² måne). Solens lågprecisionsefemerid enligt Montenbruck–Gill når handhärledda ankarpunkter i J2000 (perihelavstånd ≈ { "1.471e11" } m, ~−{ "23" }° deklination vid solstånd, ~{ "1" }°/dygn rörelse); månens efemerid håller sig inom sitt hölje mellan perigeum och apogeum, återvinner medelavståndet ~{ "384 400" } km, överstiger aldrig inklinationen { "5.3" }° och återvänder till inom { "1" }° efter en siderisk månad. Kopplingen av högerledet (RHS) som drivs av epoken är <b>bitexakt</b> (RHS-termen är lika med <c4/> vid den samplade positionen vid t = { "0" } och t = { "1" } dygn), och ett epokskifte på ett kvartsår ger en annan bana.

seg-9c8756f9d534 = Strålningstryck från solen (SRP) + konisk skugga

seg-e6110e015204 = <c1/>: <c2/> (kanonkula <c3/>) är <b>bitidentisk</b> med det slutna uttrycket i fullt solljus, fäster <b>strålningstrycket vid 1 AU (AU: astronomisk enhet) till ≈ { "4.5398e-6" } N/m²</b>, ligger i LEO-bandet ~{ "1.36e-7" } m/s² med riktning bort från solen, minskar till en fjärdedel när avståndet till solen fördubblas (omvänd kvadrat) och är <b>exakt noll</b> djupt i umbran. <c4/> ger <c5/> i fullt solljus och <c6/> i total umbra (exakt), med en mjuk monoton penumbra som stiger { "0" } → { "1" } över bandet <c7/> som <b>sträcker sig bortom umbracylindern</b>.

seg-17b48db4038b = Atmosfäriskt luftmotstånd (första hastighetsberoende termen)

seg-4e6c2d0fff55 = <c1/>: <c2/> (Vallado Table 8-4, styckvis exponentiell) <b>förankras vid { "1.225" } kg/m³ vid havsnivå</b>, klipps under ytan, avtar monotont genom LEO, ligger i bandet ~{ "1e-12" } kg/m³ vid { "400" } km med en fysikaliskt återvunnen skalhöjd på ~{ "58" } km; <c3/> motverkar den medroterande relativa hastigheten vid LEO-storleken ~{ "2e-6" } m/s². Signaturkontrollen: en bana på { "300" } km förlorar specifik energi <b>monotont</b> och dess halva storaxel minskar med begränsade ~km/dygn, medan baslinjen i vakuum bevarar energin till < { "1e-9" }.

seg-133eed361425 = Postnewtonsk (Schwarzschild) relativistisk korrektion

seg-c8e26480f148 = <c1/>: <c2/> (IERS-formen <c3/> <c4/>) kollapsar för en cirkulär bana till den slutna formen <c5/> (radiell, <b>utåtriktad</b>, komponenterna utanför axeln exakt noll), visar det läroboksmässiga <b>förhållandet <c6/> i LEO till tvåkroppsaccelerationen</b>, stämmer med den för hand förenklade formen <c7/> för radialhastighet till < { "1e-12" }, och i propagatorn <b>stör banan men håller halva storaxeln inom under en meter/dygn</b> — den konservativa motsatsen till luftmotståndets bannedgång.

seg-d39e75019595 = Ärlig avgränsning: de utgivna standardvärdena för <c1/> integrerar det zonala fältet. Det höggradiga <b>tesserala</b> EGM2008-fältet (<c2/>, grad/ordning { "70" }), de fasta/oceaniska/atmosfäriska <b>tidvattnen</b> (<c3/>) och termen <b>Lense–Thirring</b> för referenssystemets släpning är nu implementerade och sammansatta i den precisa kraftmodellen för efemerisanpassning (<c4/> — se nedan). Det tesserala fältet är också en frivillig term i Cowell-kraftmodellen <c5/> (<c6/>, avstängd som standard), validerad mot Orekit { "12.2" } <c7/> till grad/ordning { "70" } ({ "6" } fall över { "24" } h, sämsta |Δr| { "0.036" } m; <c8/>). Två fältutvärderare finns: den historiska <c9/> (sfäriska partialer; giltig till grad ~{ "180" } bort från polerna; utdata fastlåsta) och <c10/> (Holmes–Featherstone { "2002" } modifierad framåtkolumn, gradient utan 1/cos φ; giltig till grad { "2190" } vid varje latitud). EGM2008 till { "2190" } laddas vid körning (<c11/>, <c12/>, ingår inte). <c13/> stämmer med Orekit { "12.2" } till { "7.3e-17" } m/s² i åtta punkter genom grad { "2190" }; den förblir MODELLED eftersom pyshtools missade den förhandsregistrerade tröskeln nära polen (en kontroll med mpmath lägger felet i pyshtools; <c14/>). En bana på { "24" } h med { "200" }×{ "200" } stämmer med Orekit till { "0.13" } m, men dess förhandsregistrerade kontroll av känslighet för grad 70 missades ({ "0.73" } m < { "1" } m), så grad { "71" }–{ "200" } är karakteriserade, inte validerade, i bana (<c15/>). Termosfärdensiteten från NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) är portad (<c16/>: bitidentisk med C-porten i allmän egendom på { "720" } punkter, inom { "1.9e-6" } relativt pymsis, de { "17" } publicerade testfallen återgivna; <c17/>) och är en frivillig nivå för luftmotståndsdensitet (<c18/>, <c19/>; standardvärdet förblir den statiska Vallado-modellen). Detta validerar portningen, inte modellens noggrannhet mot uppmätt densitet. Solen och Månen från DE440 (DE: Development Ephemeris) är en frivillig efemerisnivå (<c20/>). Skuggan för SRP med tillplattad jord enligt WGS-84 är frivillig (<c21/>) och stämmer med belysningsförhållandet i Orekit { "12.2" } inom { "7.4e-9" } över { "2400" } geometrier (<c22/>); dess variant med randmörkning saknar extern oberoende referens (MODELLED). Nivån för luftmotstånd med NRLMSISE-00 stämmer med Orekit { "12.2" } och dess eget luftmotstånd med NRLMSISE-00 över { "24" } h till { "0.03" } m mot upp till { "142" } km förskjutning av luftmotståndet (<c23/>, VALIDATED under de gemensamma konventionerna). En korskontroll mot GMAT (General Mission Analysis Tool) återstår som uppföljning.

seg-46d06796e0e4 = Tidvatten på geopotentialen (<c1/>)

seg-81b18c4caad3 = Tidsvarierande korrektioner ΔC̄_nm, ΔS̄_nm till Stokes-koefficienterna (IERS Conventions { "2010" }, kapitel { "6" }), validerade mot konventionernas egna publicerade tal — inte mot något annat verktyg.

seg-78dc5baf4d9d = Bidrag

seg-7c6c910bbf89 = Fast jordtidvatten (IERS ekv. { "6.6" } / 6.8b / { "6.14" })

seg-ac1dbcc895f0 = <c1/>: det permanenta (nollfrekvens-) tidvattnet ΔC̄₂₀ hamnar inom { "1" } % av det av IERS publicerade −{ "4.1736" }×{ "10" }⁻⁹ (anelastiska Love-tal); <b>räkneexemplet för Step-2 K1 återskapas bit för bit</b> (sin/cos-amplituder { "470.9" } / −{ "30.2" } ×{ "10" }⁻¹² till { "0.1" }×{ "10" }⁻¹²); den normaliserade Legendre-vägen är fastlåst av slutna handräknade värden oberoende av rekursionen.

seg-f2e2c5334721 = Havstidvatten (IERS ekv. { "6.15" }, FES2004 (Finite Element Solution { "2004" }, tidvattensatlas), { "8" } konstituenter)

seg-0369f153806f = Den medföljande delmängden av FES2004 (<c1/> → <c2/>, tolkning av Doodson→multiplikator) återger källans M2-koefficienter ({ "2,2" }) exakt; K1:s Doodson-fas är lika med θ_g + π; den sektoriella storleken av grad 2 är fysikalisk och en storleksordning under det fasta tidvattnet.

seg-52a19a291a41 = Atmosfäriskt S2-lufttidvatten (Ray { "2001" }, NASA (National Aeronautics and Space Administration) GSFC (Goddard Space Flight Center))

seg-86b3d3a39bc7 = De medföljande Ray-övertonerna omvandlas via ytlastrelationen (ekv. { "6.21" }) till ett toppvärde ΔC̄₂₂ ≈ { "4" }×{ "10" }⁻¹¹ (~{ "10" } % av havstidvattnets M2-term). Ärligt förbehåll: <b>det finns ingen publicerad oberoende referens i form av geopotentialkoefficienter för lufttidvattnet</b>, så det är validerat genom källintegritet + storleksordning, en svagare tröskel än för det fasta och det oceaniska tidvattnet.

seg-63ac45ba51dc = Manövrar och banutformning (<c1/>)

seg-a2ff4b0619d4 = Impulsivt ΔV + kovariansutbredning

seg-12f469864d28 = En hastighetsdiskontinuitet där en kovarians på { "6" }×{ "6" } förs framåt (deterministisk manöver ⇒ enhets-STM (tillståndsövergångsmatris); utförandefelets kovarians roteras från manöverns referenssystem — ECI (Earth-centred inertial) eller LVLH (local vertical, local horizontal) — in i hastighetsblocket).

seg-f3f0e4a7ec05 = Integration av ändlig manöver jämfört med Tsiolkovsky

seg-f7b35b7acdba = Integration med konstant dragkraft över en manöverbåge (massa som tillstånd) vars uppnådda ΔV stämmer med den slutna raketekvationen av <b>Tsiolkovsky</b> till <b>bättre än { "0.01" } %</b>.

seg-46ae334a0604 = Lambert-lösare (Izzo { "2015" }), tur och retur

seg-3e2b483cd1b7 = Lambert-utdatan för ett varv (<c1/>, <c2/>, flygtid ⇒ <c3/>, <c4/>) <b>skickas tur och retur genom den exakta Kepler-propagatorn med universella variabler</b> — den måste landa tillbaka på <c5/>.

seg-04d69337acb3 = Porkchop-svep mot Hohmann-golvet

seg-fb5298b7983c = Minimum i rutnätet för uppskjutning × ankomst, C3 / ankomst-V∞, kontrolleras mot <b>det analytiska C3-golvet för Hohmann-överföring</b> för två coplanära cirkulära banor.

seg-bf2eb36e3eb6 = Lambert-lösare mot ett oberoende bibliotek

seg-40511ea76e12 = <c1/>: { "13" } överföringar med ett varv från LEO till GEO till heliocentriska, prograda och retrograda, mot lamberthub { "1.0.0" } <c2/>; sämsta skillnad i randhastighet { "7e-12" } m/s.

seg-164d7ea14d4e = Ärlig avgränsning: ingen banoptimerare, inga Lambert-grenar med flera varv, och en syntetisk heliocentrisk modell med coplanära cirkulära banor (ingen planetär DE-efemerid, så en korskontroll av C3 Jorden–Mars mot GMAT har inte körts).

seg-9d2d78ad22c4 = Banbestämning (OD) (<c1/>, <c2/>)

seg-95d5ac7f6c29 = Gauss–Newton-satskorrektor

seg-3fe29c4621b2 = Den generiska lösaren <c1/> når den exakta lösningen med viktad minsta kvadrat för en linjär anpassning, återvinner sanna parametrar för en olinjär anpassning <c2/> och löser en multilateration av avstånd i 3D från brusfria avstånd.

seg-b31d1ffa99b1 = Satsvis banbestämning från avstånd

seg-0b37139dffa9 = <c1/> återvinner <c2/> från avståndsföljning från markstation (propagerad över kraftmodellen med tvåkroppsproblem + J2) till <b>under en meter / mm·s⁻¹ från brusfria avstånd</b>, och till <b>~{ "2" } m med en residual efter anpassning vid brusgolvet på { "5" } m</b> — signaturen för en konsistent anpassning med minsta kvadrat.

seg-fb29199bf8bd = Sekventiell OD (unscented-filter)

seg-3c1f33052d48 = <c1/> återvinner rekursivt tillståndet till inom några tiotal meter med samma dynamik och avståndsmodell.

seg-7a636cc9eef0 = Satsvis och sekventiell OD mot en oberoende skattare

seg-68bf6e73c582 = <c1/>: { "8" } scenarier ({ "6" } brusfria LEO/MEO/excentriska med { "3" }–{ "4" } stationer, { "2" } med σ = { "5" } m) mot skattarna med satsvis minsta kvadrat och Kalman i Orekit { "12.2" } på en matchad kraftmodell; sämsta sats { "1e-3" } m / { "1e-6" } m/s, sekventiell { "0.9" } m.

seg-55a86bc79831 = | Satsvis OD med avståndshastighet / az-el och elevationsmask | <c1/> (extern jämförelse, en förhandsregistrerad tröskel missad) | <c2/>: { "8" } scenarier mot satsvis minsta kvadrat i Orekit { "12.2" } med egna ögonblickliga geometriska mätningar; synliga mängder identiska, mätvärden inom { "5.8e-8" } m / { "6.3e-10" } m/s / { "1.4e-13" } rad, tillståndsövergångsmatris inom { "1.2e-14" }, brusiga tillstånd inom { "1.74" } cm och RMS per typ inom { "2.7e-4" }; den förhandsregistrerade tröskeln för brusfria tillstånd ≤ { "1" } cm missas i { "2" } av { "4" } scenarier ({ "1.46" } och { "1.74" } cm; Orekits egen skattning ligger så långt från dess simulerade referens, medan kshana ligger inom { "1e-8" } m). Se <c3/>. |

seg-35a85fb744cd = Ärlig avgränsning: den didaktiska OD:n använder fasta tröghetsstationer, ett topocentriskt system för sfärisk jord och ögonblickliga geometriska mätningar (ingen ljustid, aberration, refraktion eller jordrotation); tillståndsövergångsmatrisen för avståndshastighets-/vinkelvägen är variationell (RK4-integrerad med analytiska partialer för tvåkroppsproblem + J2), inte sluten; det finns inget sekventiellt filter för avståndshastighet eller vinklar. Vägen med enbart avstånd behåller sin Jacobian med finita differenser. (Motorn för efemerisanpassning med full kraftmodell nedan har sin egen variationella tillståndsövergångsmatris.)

seg-8f425e278f7c = Validering av kraftmodell genom efemerisanpassning (<c1/>)

seg-9207d7139b87 = En precis skattare med minsta kvadrat på satser av positionsobservationer med full kraftmodell: den tesserala geopotentialen EGM2008 (utvärderad i det jordfasta systemet genom CIO-reduktionen) sammansatt med Solen/Månen som tredje kropp, SRP, luftmotstånd, GR (allmän relativitetsteori) enligt Schwarzschild/Lense–Thirring och tidvattnen ovan, anpassad till ett spår av tröghetsbaserade positionsbestämningar med en Jacobian av variationell tillståndsövergångsmatris. Validerad på <b>syntetiska</b> data, där referensen är Kshanas egen integrator, så varje residual kommer från skattaren och inte från dynamiken.

seg-fc676106563e = Sammansättning av precis kraftmodell

seg-57726d970436 = <c1/>: fältet av grad 0 är den exakta punktmassan vid varje epok (den centrala termen är rotationsinvariant); grad 8 lägger till tillplattningen i J2-bandet; tredjekroppen Solen och tidvattentermen kopplas in bitexakt; en konstant radiell empirisk acceleration är rent radiell i RTN (radiell, transversell, normal).

seg-98b036354077 = Variationell tillståndsövergångsmatris

seg-71787d9334db = Varje kolumn i Φ över ett halvt LEO-varv (geopotential av grad 8 + Solen + Månen) stämmer med en oberoende omframföring med <b>central finit differens (FD) över hela bågen</b> till <b>< { "1" }×{ "10" }⁻⁶ relativt</b> i både positions- och hastighetssvaret — den dokumenterade korskontrollen STM↔FD. Φ({ "0" }) = I; den utökade och den vanliga propagatorn stämmer med varandra till under en millimeter.

seg-0b453776136b = Självåtervinning med satsvis minsta kvadrat

seg-c651db308332 = En Kshana-båge på 1 timme (grad 6 + Solen + Månen) observerad brusfritt återvinns från en förskjutning på { "150" } m / { "0.1" } m·s⁻¹ till <b>epoktillståndet inom { "1" }×{ "10" }⁻² m</b> med nära noll RMS efter anpassning; med vitt brus på { "5" } m hamnar 3D-RMS efter anpassning vid <b>~σ-brusgolvet</b>, utan systematiskt fel. SRP-<b>C_R återvinns från { "1.0" } till inom { "1" } %</b> av det sanna värdet { "1.4" }.

seg-06bd2857f832 = Borttagning av uteliggare och RTN-rapportering

seg-8b9dea5c0727 = Ett grovt fel på { "500" } m förkastas av redigering efter anpassning vid 5-σ (exakt en observation), vilket lämnar en ren anpassning på millimeternivå; residualer rapporteras uppdelade i radiell/transversell/normal samt i 3D.

seg-e3969a15df96 = Nivå för empiriska accelerationer (RTN konstant + 1-CPR (CPR: cykel per varv))

seg-c46af7926511 = De nio empiriska parametrarna med a priori-begränsning håller sig under { "1" }×{ "10" }⁻⁸ m·s⁻² på empirifri referens utan att störa anpassningen; en konstant acceleration tvärs banan på { "3" }×{ "10" }⁻⁸ m·s⁻², injicerad i referensen, återvinns till inom { "20" } %.

seg-fd79199b52d1 = Ärlig avgränsning: den syntetiska vågen använder nominella parametrar för jordorientering (EOP: UT1 (Universal Time { "1" }, jordrotationstid) ≈ TT (Terrestrial Time), ingen polarrörelse) — exakt för självåtervinning, eftersom samma modell genererar och anpassar bågen. Valideringarna mot dataset från rymdorganisationer lägger <b>verkliga</b> finals2000A-EOP och SP3/SPK (SPK: efemeridkärna för planeter) som referens ovanpå den här motorn genom CIO-systemkedjan (<c1/>, <c2/>, <c3/>, <c4/>).

seg-934f0f8e4f5f = Verkliga precisa banor från rymdorganisationer (<c1/>, <c2/>, <c3/>)

seg-721a27294813 = Galileo MEO — < { "5" } m GREEN

seg-14a2999d0739 = Kshanas motor med full kraftmodell anpassad till ett ordagrant utsnitt av <b>den slutliga bana som ESA/ESOC (ESOC: European Space Operations Centre) själva publicerar</b> (<c1/>, ITRF (International Terrestrial Reference Frame)) för Galileo <b>E11</b> över { "8" } h, varje ITRF-positionsbestämning roterad till GCRS med verkliga finals2000A-EOP: <b>3D-RMS { "0.133" } m</b> efter anpassning med ren kraftmodell + <c2/> (RTN 0.105/0.067/0.047 m, <c3/> { "1.174" }), <b>{ "0.070" } m</b> med den empiriska nivån, från en rå överlappning på { "78.7" } km. Hela bågen på { "24" } h ger <b>{ "0.611" } m</b>. Allt långt inom tröskeln på { "5" } m. Gravitationsfältet är konvergerat vid grad/ordning 8 (identiskt vid 8/10/12); jobbet <c4/> kör hela grad/ordning 70. Ursprung + SHA-256 (SHA: Secure Hash Algorithm) i <c5/>; fullständig redovisning i <c6/>.

seg-d5ed0783432e = Swarm-A LEO — < { "5" } m GREEN

seg-403b15ec1b9b = Motor med full kraftmodell (+ atmosfäriskt luftmotstånd) anpassad till ett ordagrant utsnitt av <b>ESA:s egen reducerat dynamiska precisa bana för Swarm-A</b> (<c1/>, L47, ITRF, ~{ "430" } km, ~{ "2" } cm) över { "3" } h vid grad/ordning 70, verkliga finals2000A-EOP genom CIO-kedjan: nivån <b>dynamisk</b> (endast tillstånd, statisk densitet, <c2/>={ "1" }) ger <b>3D-RMS { "2.687" } m</b> efter anpassning (RTN 0.925/<c3/>/0.045 m — residualen ≈ rent luftmotstånd längs banan), nivån <b>reducerat dynamisk</b> (+ empiriska CPR-accelerationer) <b>{ "0.098" } m</b> (RTN 0.026/0.092/0.025 m) — ~{ "10" } cm mot ESA:s bana på ~{ "2" } cm. Ursprung + SHA-256 i <c4/>; fullständig redovisning i <c5/>.

seg-3be5a6bee187 = LRO (Lunar Reconnaissance Orbiter), Månen — validerad, över { "5" } m (ärligt)

seg-d2be90186a89 = <b>Månencentrerad</b> anpassning av kraftmodell (<c1/>): gravitationsfältet <b>GRGM660PRIM</b> från GRAIL (grad/ordning { "100" }) i månens kroppsfasta huvudaxelsystem (<c2/>, IAU { "2015" } medeljord + den fasta förskjutningen från DE421 (Development Ephemeris { "421" }) medeljord → huvudaxlar (ME→PA), tillämpad så som SPICE definierar den sedan { "0.36" }: fram till dess tillämpades den i fel riktning, cirka { "208" }″ fel) + Jorden/Solen som tredje kropp, anpassad genom <em>samma</em> generiska Gauss–Newton-skattare som jordens dataset till den verkliga <b>JPL Horizons LRO</b> (NAIF −{ "85" }) rekonstruerade banan, { "4" } h / { "241" } epoker, ~{ "98" } km. Ärligt resultat efter anpassning ({ "0.36" }): <b>dynamisk { "12.05" } m</b> (RTN 2.91/10.11/5.88), <b>reducerat dynamisk { "6.67" } m</b> (RTN 3.41/4.58/3.44, { "1" }+2 per varv empiriskt), från en rå överlappning på { "39.9" } m (före rättningen av ME→PA: { "12.6" } m, { "6.65" } m, { "53.8" } m) — <b>över</b> tröskeln < { "5" } m, och det beror inte på skattaren (identiskt vid grad/ordning 100/150 och <c3/> 1e-6/1e-9). En <b>korsvalidering av DE-klass</b> (<c4/>: månens huvudaxelorientering från DE440 (Development Ephemeris { "440" }) + DE440-efemerid via ANISE) <b>rättade</b> påståendet om den begränsande faktorn — den gav { "12.0" } m dynamisk och { "6.67" } m reducerat dynamisk, vilket den rättade analytiska stacken nu matchar på båda nivåerna (det tidigare dynamiska gapet, { "12.6" } → { "12.0" } m, var felet i förskjutningen ME→PA), så det operativa golvet är <b>inte</b> den analytiska orienteringen/efemeriden utan en residual som inte kan reduceras av den empiriska nivån (mest förenlig med omodellerad icke-gravitationell dynamik hos LRO över den korta bågen); den slimmade analytiska stacken matchar redan DE-klass för den reducerat dynamiska banan. Ursprung + SHA-256 i <c5/>; fullständig redovisning i <c6/>. <b>Validerad mot verklig referens från rymdorganisationer: { "3" } av { "3" }; uppfyller < { "5" } m: { "2" } av { "3" }.</b>

seg-3d3cbf5f043d = Navigering med gravitationskarta / alt-PNT (<c1/>, <c2/>, <c3/>, <c4/>)

seg-89f2cbf55842 = Gravitationsanomalifält med sfäriska övertoner

seg-76cae5c530f2 = <c1/>: ett fält av låg grad, fullt normaliserat, kontrollerat mot de slutna Legendre-funktionerna (<c2/>, <c3/>, <c4/>) och en för hand härledd anomali med en term på { "1.897" } mGal.

seg-f00f82b70e6e = Mätmodell för kallatomsgravimeter

seg-49090598c525 = Det vita brusgolvet härleds från ASD för CAI-accelerometern (<c1/>) och injiceras som en deterministisk frösatt följd (matcharen får aldrig brusfri referens, men körningen är ändå bitreproducerbar).

seg-0556db62c45f = Partikelfilter med sekventiell viktad omsampling

seg-3df4251aedbd = <c1/>: den deterministiska kärnan är exakt fastlåst — ESS (effective sample size, effektiv urvalsstorlek) som spänner över { "1" }…N, systematisk omsampling som väljer index i proportion till vikt, den konvexa kombinationen i det viktade medelvärdet, en gaussisk likelihood som drar skattningen mot mätningen och determinism i frösatt prediktion.

seg-7dca80b16a00 = Likelihood för kartmatchning + återvinning

seg-eb40ab2607ae = <c1/>: <c2/> når sitt maximum (= { "1" }) vid perfekt matchning och faller till <c3/> vid en sigma; ett partikelfilter över en särpräglad syntetisk terrängbit återvinner den sanna positionen till inom { "0.1" }.

seg-446d9f03a860 = Benchmark utan GPS på 60 minuter

seg-ed29fb24d9d5 = <c1/> (<c2/>): ett avbrott på ~{ "700" } km / en timme där tröghetslösningen driver till <b>≈ { "70" } km</b> återvinns till <b>≈ { "145" } m (< { "500" } m)</b> av en hierarkisk matchare från grov till fin — bitreproducerbar, stabil över brusrealiseringar och bevisat begränsad av förfiningen (ett enda grovt rutnät fastnar vid ~{ "2" } km).

seg-81a2963c26cc = Laddare för SRTM (Shuttle Radar Topography Mission) <c1/> DEM (digital elevation model) + bilinjär sampling (OBEROENDE REFERENS A)

seg-5e7bbf951faf = <c1/> / <c2/>: en handbyggd buffert <c3/> på { "2" }×{ "2" } med hörn [{ "100,200" };{ "300,400" }] interpoleras bilinjärt till <b>exakt { "250.0" }</b> i cellens mitt (sluten oberoende referens), 16-bitars big-endian tur och retur är exakt, och radvändningen placerar nordligaste filraden vid den högsta lagrade latituden — allt mot <b>specifikationen för drivrutinen SRTMHGT (Shuttle Radar Topography Mission height-file format) i GDAL (Geospatial Data Abstraction Library)</b> (16-bitars teckenbehäftad big-endian, radvis, nordlig rad först, tomvärde -32768, <a1>https://gdal.org/en/stable/drivers/raster/srtmhgt.html</a1>). En incheckad fixtur på { "11" }×{ "11" } (<c4/>) övar parsern i CI; och en <b>incheckad verklig SRTM v3-ruta i allmän egendom från NASA/USGS (USGS: United States Geological Survey)</b> (N36W117, Death Valley, decimerad till 6 bågsekunder, { "722" } KB, <c5/>) läses i CI (inte ignorerad, <c6/>) och placerar <b>Badwater Basin vid ≈ −{ "78" } m inom det dokumenterade bandet [−{ "95" },−{ "70" }] m</b> (mätvärde från NGS/NOAA (NGS: National Geodetic Survey; NOAA: National Oceanic and Atmospheric Administration) ≈ −{ "86" } m) med rutans maximum ≈ { "2161" } m — sanningskällan är mätningen, det är DEM:en som testas (icke-cirkulärt). Större publicerade spothöjder (Mount Whitney { "4421" } m) finns kvar i fullruteteser som styrs av <c7/>.

seg-80f985ea3e11 = Konvergens för terrängbaserad navigering (TERCOM/SITAN (TERCOM: terrain contour matching; SITAN: Sandia Inertial Terrain-Aided Navigation)) (OBEROENDE REFERENS B)

seg-9ad7bf3a8c3e = <c1/> (<c2/>): en <b>handhärledd</b> injicerad INS-drift ({ "0.5" }°N, −{ "0.4" }°E ≈ { "70" } km vid ~{ "12" }° lat, beräknad som drift° × M_per_deg × cos lat) återvinns till <b>< { "500" } m</b> (inom golvet för rutnätsupplösningen <c3/>), en minskning med > { "100" }× jämfört med fri tröghetsnavigering — kontrollerad mot det <em>injicerade</em> talet, aldrig mot DEM:en (icke-cirkulärt), bitreproducerbar och stabil över brusfrön.

seg-5b7c1dc72436 = Fusionsvinst för gravitation+magnetism+terräng (OBEROENDE REFERENS C)

seg-7e3818f2ee2b = <c1/> (<c2/>): tre skalära kanaler (Δg · |B| anomali i jordskorpan · höjd) fuserade som en produktlikelihood ger en <b>begränsad residual < { "500" } m</b> över avbrottet på 60 min som, medelvärdesbildad över frön, är <b>inte sämre än den bästa enskilda kanalen</b> (additiv information / lägre CRLB (Cramér–Rao lower bound)). Ligger inom det publicerade regimen för TERCOM / terrängbaserad navigering (TRN) med CEP (circular error probable) på "tiotals meter" (<a1>https://en.wikipedia.org/wiki/TERCOM</a1>; PeerJ { "2024" } ESKF-TERCOM (ESKF: error-state Kalman filter), <a2>https://peerj.com/articles/cs-3118/</a2>).

seg-fe23ff839bce = Ärlig avgränsning: gravitationsfältet är av låg grad + syntetiska mascons, <b>inte</b> hela koefficientuppsättningen EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques); den magnetiska kanalen vilar på det jämna IGRF-huvudfältet plus <b>syntetiska</b> mascons för anomalier i jordskorpan (en verklig högfrekvent skorpkarta är en uppföljning); CI-terrängfältet för benchmarkarna av <em>navigeringspositionsbestämning</em> är den självständiga syntetiska DEM:en, medan själva läsaren för <c1/> nu är validerad i CI mot en incheckad verklig SRTM v3-ruta (ovan); fullupplösta verkliga rutor styrs fortfarande av <c2/>. En Monte Carlo-studie av felet i kartrepresentationen är fortfarande en uppföljning. Alla tre navigatorerna är nu kopplade till scenariomotorn med <c3/> (<c4/>, <c5/>, <c6/>).

seg-d9f7e199e5d0 = INS-/IMU-felmodell — datablad-refererad validering (<c1/>)

seg-48266c2faaed = Den stokastiska felmodellen för IMU är validerad mot <b>publicerade specifikationer från tillverkares datablad / dataset</b> — aldrig mot ett värde som Kshana självt har producerat. Bryggan från en specifikation i fältenheter till brusmodellen i SI (International System of Units) är den vanliga identifieringen via Allan-deviation (Riley, NIST SP { "1065" } §{ "5" }; IEEE (Institute of Electrical and Electronics Engineers) Std { "952" }): koefficienten för slumpvandring <c1/> är den överlappande ADEV avläst vid τ = { "1" } s på lutningen τ⁻¹ᐟ², och koefficienten för biasinstabilitet är den flacka Allan-platån (<c2/>, hermetisk — ingen nedladdning).

seg-702de63000d2 = Evidens / oberoende referens

seg-c3fed48b98b1 = Enhetskonverteringslager (risk nr 1 för icke-cirkularitet)

seg-6cdc88d36bfd = Handkontrollerat: { "0.15" } deg/√hr = { "4.3633e-5" } rad/√s; { "3.6" } µg = { "3.5304e-5" } m/s²; { "2.0" } deg/hr = { "9.6963e-6" } rad/s.

seg-75afa5abcd08 = Gyrots slumpvandring i vinkel

seg-d5fd60857e4d = ADIS16465 ARW { "0.15" } deg/√hr (datablad från Analog Devices) återvunnen från ADEV({ "1" } s) till < { "5" }%.

seg-c5e2d361b83f = Accelerometerns slumpvandring i hastighet

seg-4413d3bb39b4 = ADIS16465 VRW { "0.1" } m/s/√hr återvunnen till < { "5" }%.

seg-ebeb0bb0e0fb = Allan-lutning för vitt brus

seg-f674ce82dc2c = ADIS16460, vit gren, log-log-lutning −{ "0.5" } ± { "0.05" }.

seg-40afd130f31d = Platå för biasinstabilitet under körning

seg-94acb18a94cb = ADIS16465, gyrots biasinstabilitet (BI) { "2.0" } deg/hr återvunnen som det flacka Allan-minimumet till < { "15" }%.

seg-b359e0e92e20 = Andra IMU-profilen

seg-1a304949bcf9 = NaveGo ADIS16488 (ARW { "0.3" } deg/√hr, VRW { "0.029" } m/s/√hr) båda återvunna till < { "5" }%.

seg-fea9287d6533 = Ärlig avgränsning: detta validerar <b>den stokastiska felmodellen</b> mot Allan-koefficienter i datablad. Fordonsdatasetet <b>KF-GINS</b> från i2Nav-WHU (WHU: Wuhan University) används som en separat, datastyrd kontroll: det löst kopplade EKF med felmodell i sluten slinga och hävarmsmodell för GNSS är en VALIDATED rad i <a1>verifieringsmatrisen</a1> (<em>Loosely coupled GNSS/INS EKF with lever arm on the KF-GINS dataset</em>), jämförd med C++-referensbanan från KF-GINS under trösklar som registrerades före körningen. Den körs bara där datasetet tillhandahålls (<c1/>); utan det körs den syntetiska laddaren och testerna av hävarmen. De tätt kopplade varianterna och varianterna med bärvågsfas täcks inte av den raden (raden för tätt kopplad GNSS/INS med bärvågsfas är MODELLED).

seg-f0ab98c1a79d = Djuprymd och Mars-PNT — D0-grunden (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-bd222b27949c = Den första milstolpen för navigeringsmotorn för djuprymd: att generalisera den jordhårdkodade kärnan till en godtycklig centralkropp, lägga till Mars-dynamik, en gränsyta för efemerisleverantörer, tid under en mikrosekund samt primitiver för ljustid och relativistisk fördröjning. <b>Varje befintligt jordscenario är byte-identiskt</b> — referensfilerna (golden) för reproducerbarhet över plattformar (<c1/>, <c2/>) går igenom oförändrade utan omgenerering, vilket kontrolleras vid varje incheckning.

seg-e0cdbfcbb28a = Abstraktion av centralkropp (Jorden byte-identisk)

seg-7d20649189fa = <c1/>: <c2/> med <c3/>. <c4/> kontrollerar att <c5/> och <c6/> är lika med de äldre jordfunktionerna med <b>exakt bitlikhet</b> (<c7/>), och en jordbåge med standardvärdet för <c8/> är byte-identisk — referensfilerna för reproducerbarhet är oförändrade (samma SHA, ingen omgenerering).

seg-658acc8112e3 = Gravitation för Mars (GMM-3 (GMM: Goddard Mars Model) tesseral, kroppsfast)

seg-9b058665cf4b = <c1/>: zonala C̄20/C̄30/C̄{ "40" } från J2/J3/J4 i MRO110 (gravitationslösning för Mars Reconnaissance Orbiter) (<c2/>, J2 går tur och retur till { "1.9604e-3" }) + sektoriella/tesserala C̄22/S̄{ "22" }, C̄32/S̄{ "32" } från MRO110B2 (Konopliv et al. { "2011" }; tabellerade i Liu, Baoyin & Ma { "2012" }), utvärderade i det kroppsfasta IAU-systemet för Mars. <c3/> kontrollerar tur och retur, J2-skalans avvikelse från punktmassa, och att fältet verkligen är kroppsfast (en omorientering med ett kvarts Marsdygn ändrar den tröghetsbaserade accelerationen). Högre grad/ordning laddas från en medföljande <c4/> via <c5/>.

seg-1dcbee768418 = Kroppsfast system för Mars (IAU-pol)

seg-0708e5b37d69 = <c1/>: IAU:s 3-1-3-rotation <c2/> (konvention från WGCCRE/NAIF (WGCCRE: Working Group on Cartographic Coordinates and Rotational Elements), samma som i <c3/>). Tester: ortonormal till { "1e-12" } med determinant +{ "1" }, identitet vid tur och retur, nollmeridianen avancerar med <c4/> per dygn.

seg-5b6355a143c7 = Propagering centrerad på Mars / Solen

seg-4ab87f666765 = <c1/> (självkonsistens)

seg-12e3d173340b = <c1/>: en bana kring Mars med låg höjd (Low-Mars-Orbit) återvänder till sin start efter en Kepler-period (slutning); specifik energi ε=v²/2−μ/r driver <{ "1e-9" } över bågen; den sekulära regressionen av noden från Mars J2 stämmer med Vallados analytiska takt (oberoende beräknad ≈ −{ "5.15" } °/dygn vid { "60" }° inklination) till { "3" }%; en heliocentrisk bana återger Marsåret på ~687 dygn (vis-viva + oberoende återvinning av perioden från bågen). Inga externa data.

seg-acff4c016089 = Korsvalidering mot DE440 (heliocentriska Mars)

seg-ed164e298754 = <c1/> (undantagen från arbetsytan; MPL-2.0-licensierade ANISE avgränsat till sin egen Cargo.lock; speglar <c2/>): jämför Kshanas Sun-centrala Marspropagering med JPL DE440 (via ANISE), med referens från Horizons citerad ordagrant (ursprung + SHA-256). <b>Återskapat resultat</b> (start-JD (Julian date) { "2459580.5" } TDB (Barycentric Dynamical Time), <c3/> SHA-256 <c4/>): positionsresidual <b>{ "137" } m vid båge på 1 dygn</b> ({ "5.97" }×{ "10" }⁻¹⁰ av det heliocentriska avståndet { "2.299" }×10¹¹ m), växande till { "3.3" } km vid { "5" } d, { "87.9" } km vid { "30" } d, { "1.71" } Mm vid { "90" } d — residualen <em>växer</em> med båglängden eftersom en Sun-central tvåkroppsmodell medvetet utelämnar planetstörningarna (främst Jupiter) och den interna rörelsen i Marssystemet som barycenter-efemeriden DE440 bär, så tillväxten är den ärliga signaturen av den omodellerade n-kroppsdynamiken, inte ett integratorfel; en kort båge som förblir en liten del av det heliocentriska avståndet bekräftar att det Sun-centrala maskineriet är korrekt. Körs bara när DE440-kärnan finns (<c5/>, eller hämtas automatiskt, ~{ "32" } MB) — en manuell kontroll av DE-klass / <c6/>, <b>inte</b> en standardspärr i CI, så det publicerade cratet och varje standardspärr förblir byte för byte orörda.

seg-a7d79066a53b = Ljustid + Shapiro-fördröjning

seg-798148171dab = <c1/>: den iterativa lösningen av ljustid till retarderad epok (konvergerar |Δτ|<{ "1e-12" } s, med tak) och Shapiro-fördröjningen Δt=(2μ/c³)·ln[(r1+r2+r12)/(r1+r2−r12)]. Tester: Jorden–Solen ≈ { "499" } s och Jorden–Månen ≈ { "1.28" } s via den inbyggda efemeriden; en syntetisk sändare med konstant hastighet återvinner den analytiska retarderade lösningen till <{ "1e-9" } s (lösaren bevisat oberoende av varje verklig efemerid); Shapiro stämmer exakt med ett handräknat värde och ger ~{ "100" }–{ "250" } µs för en stråle som snuddar vid Solen vid övre konjunktion Jorden–Mars.

seg-1bc28f6bdc8f = Gränssnitt för efemerisleverantörer

seg-34d6a07ad252 = <c1/>: <c2/> + kärnfri <c3/> (Sol/Måne enligt Montenbruck–Gill, geocentriskt); returnerar <c4/> för kroppar som den saknar serie för (t.ex. Mars), där ANISE-leverantören av DE-klass är vägen — samma uppdelning mellan inbyggd och ANISE som <c5/>/<c6/>.

seg-5e1fed7a98c0 = Tvådelad tid + TT↔TDB

seg-5ebca9b5f2db = <c1/>: en <c2/> med Knuth-tvåsummeackumulering återvinner intervall under en mikrosekund som JD med en enda f64 förlorar nära J2000 (>{ "1000" }× bättre, testat); <c3/>/<c4/> använder den dominerande periodiska serien av Fairhead–Bretagnon (|TDB−TT|≲{ "1.7" } ms, handverifierad vid J2000). Additivt — den befintliga tidsvägen med enkel f64 är oförändrad.

seg-d2da2e1d1711 = Radiometriska observabler för djuprymd och CCSDS Tracking Data Message — D1 (<c1/>, <c2/>)

seg-b98f508f2375 = Den andra milstolpen för navigeringsmotorn för djuprymd: <b>observabelmodellen</b> som omvandlar D0-kärnan för ljustid/relativistisk fördröjning till de storheter som ett följningspass från Deep Space Network (DSN) eller ESTRACK (European Space Tracking network) faktiskt rapporterar — avstånd, Doppler med en/två/tre vägar, koherent transponderomvändning, regenerativ/PN (PN: pseudo-noise) avståndsmätning, Δ-DOR (DOR: differential one-way ranging) och utbredningsmedier — samt in- och utdata för <b>CCSDS (Consultative Committee for Space Data Systems) 503.0-B Tracking Data Message (TDM)</b> som läser in/skriver ut en standardiserad följningsfil från en rymdorganisation. <b>Ärlig avgränsning:</b> detta är <b>exakta geometriska modeller</b> enligt konventionerna i Moyer / CCSDS; mätningens <em>brus</em> är det <c1/> per observation som anroparen anger, inte inbakat i modellen. Att återskapa ett <em>specifikt verkligt följningspass</em> kräver verkliga TDM-data plus lösaren för banbestämning i djuprymd — det är <b>D2</b>, inte D1. Allt nedan är additivt (referensfilerna för reproducerbarhet är oförändrade; samma SHA, ingen omgenerering).

seg-d1d2dc7906c8 = Avstånd och Doppler med 1/2/3 vägar (Moyer, lösning i två led)

seg-e2176b844df8 = <c1/>: <c2/>/<c3/> sätter ihop D0:s retarderade (nedlänk) och avancerade (upplänk) lösningar för ljustid; hela konventionen för tur och retur är <c4/> (m), dokumenterad och konsistent. <c5/>/<c6/>/<c7/> bildar bärvågsförskjutningen <c8/> (Hz) från avståndshastigheten längs siktlinjen, <b>teckenkonvention: en rymdfarkost som närmar sig ger en positiv (blå) förskjutning</b>. Tester: avstånd med två vägar = summan av leden till <{ "1" } mm (~{ "2" } AU tur och retur Jorden–Solen); avstånd med en väg = <c9/> exakt; Doppler med en väg stämmer med det analytiska <c10/> för en radiell sändare med konstant hastighet till ppt; tre vägar med samlokaliserade stationer kollapsar byte för byte till två vägar.

seg-638697be5b5b = Koherent transponderomvändning (exakta DSN-förhållanden)

seg-781aa4041c58 = <c1/>: de exakta rationella omvändningstalen för DSN/CCSDS <c2/> (Moyer §{ "13" }; DSN 810-005 modul 201/214) — S/S 240/221, S/X 880/221, X/S 240/749, X/X 880/749, X/Ka 3344/749, Ka/Ka 3360/3599. Testade för exakt likhet; ett odefinierat bandpar <b>avbryter med panic</b> (fail-loud, hittar aldrig på ett förhållande). <c3/> tillämpar bandets bärvåg + förhållandet från början till slut och är lika med den explicita <c4/> till maskinprecision.

seg-f24f9da1570c = Regenerativ / PN-avståndsmätning (CCSDS { "414" }; tvetydighet)

seg-1abd8c221e8d = <c1/>: <c2/> = <c3/> (det entydiga avståndet i skalan för upplösning per chip) och <c4/> = det multiplicerat med kodlängden (det fullständiga entydiga avståndet för PN-koden <c5/>), enligt CCSDS 414.1-B. Testat: en avståndsklocka på { "1" } MHz ger ~{ "149.9" } m; PN-koden med viktad röstning enligt CCSDS-414.1 ({ "1 009 470" } chip) vid { "1" } Mchip/s ger det entydiga designavståndet ~{ "151 000" } km; en fördubblad chiptakt halverar tvetydigheten per chip.

seg-16b9fdd916a7 = Δ-DOR (CCSDS { "506" }, himmelsplanet)

seg-93055e944306 = <c1/>: den differentiella fördröjningen i himmelsplanet <c2/> (s) för en interferometerbaslinje <c3/> (CCSDS 506.1-B). Testat: stämmer med den exakta analytiska projektionen <c4/> för en känd förskjutning längs baslinjen till { "1e-15" } s, storleken i liten vinkel <c5/>, och <b>nollfallet</b> (en rymdfarkost i linje med kvasaren ger exakt noll differentiell fördröjning).

seg-4e5258bb04d5 = Plasma 1/f², kalibrering med två frekvenser

seg-e3b340103825 = <c1/>: <c2/> = <c3/> (den dispersiva gruppfördröjningen <c4/> från laddade partiklar, <c5/>); <c6/> kolonnen för koronan av Cassini-klass <c7/> (analytiskt substitut, inte en kalibrerad korona); <c8/> den dispersiva inversionen <c9/> som DSN använder för att ta bort plasma. Testat: 1/f²-lagen <c10/>; koronan stiger mot konjunktion; och en <b>injicerad TEC återvinns till <{ "1" } %</b> (i själva verket ≪ { "1e-9" } brusfritt) — <c11/>.

seg-e1e265ab499a = Medier för troposfär / jonosfär (återanvänder GNSS-modeller)

seg-2d9aa52f318b = <c1/>/<c2/>: markstationssegmentet för djuprymd passerar samma jordatmosfär som GNSS-paketet redan modellerar, så dessa delegerar till <c3/> (Saastamoinen-zenit + Niell-avbildning, icke-dispersiv) och <c4/> (jonosfär från utsändning). Testat inkopplade + med fysikaliskt tecken: tropo positiv och större vid låg elevation än i zenit; iono en icke-negativ fördröjning längs siktlinjen (numerisk noggrannhet testas av GNSS-paketets egna databladsrefererade tester).

seg-44ba6e0411fd = CCSDS-TDM { "503" }, tolkning / skrivning + radiometrisk brygga

seg-18eafe936dcb = <c1/>: en läsare <b>och</b> skrivare för CCSDS 503.0-B-2 KVN (keyword-value notation) (huvud + segmenten <c2/> / <c3/>; posterna <c4/>/<c5/>/<c6/>/<c7/>). Tester (<c8/> + <c9/>): referensfixturen tolkas till de förväntade namngivna fälten; <b>tolkning→skrivning→tolkning ger en lika struktur</b> (semantisk tur och retur); bryggan <c10/> avbildar de entydiga posterna <c11/>/<c12/> till <c13/> (antal vägar från <c14/> <c15/>/<c16/>/<c17/>, band från <c18/>, km→m); en fil med flera segment nollställer tillståndsmaskinen. <b>Ärligt hoppa-över-inte-gissa:</b> vinklar/frekvenser, okända band, epoker som dag på året och okända tidssystem <b>hoppas över</b>, avbildas aldrig fel, och <c19/> lämnas som <c20/> för anroparen att vikta.

seg-e8ca55dd29b1 = DSN/ESTRACK-benchmark (modellens precision ≫ publicerat golv)

seg-247b9e7b2be8 = <c1/>: observablerna är exakta geometriska beräkningar, så den ärliga benchmarken är att <b>modellens eget numeriska fel ligger långt under det publicerade mätgolvet för DSN/ESTRACK</b> — modellen är inte flaskhalsen för noggrannheten, det är det σ som anroparen anger. Varje test beräknar en observabel på två oberoende sätt (eller återvinner en injicerad referens) och kontrollerar att residualen ligger under golvet: <b>avstånd</b> går tur och retur till <{ "1" } mm ≪ golvet på ~{ "1" } m för PN-avståndsmätning (DSN 810-005 mod. { "214" } / CCSDS 414.1-B); <b>Doppler</b> stämmer med den exakta slutna retarderade avståndshastigheten <c2/> till ~{ "10" }⁻⁶ m/s, flera × under golvet för X-band på ~{ "0.05" } mm/s (DSN 810-005 mod. { "203" } / Moyer) — residualen är f64-golvet för avståndsdifferens vid ~{ "1" } AU, en numerisk egenskap och inte ett modellfel; <b>Δ-DOR</b> återger den slutna projektionen till en motsvarande vinkel i himmelsplanet ≪ { "1" } nrad ≪ golvet på ~{ "1" }–{ "10" } nrad (DSN 810-005 mod. { "210" } / CCSDS 506.1-B); <b>plasma</b> med två frekvenser återvinner den injicerade fördröjningen till ≪ { "1" } %; och <b>Shapiro</b>-fördröjningen ligger i det publicerade bandet ~{ "100" }–{ "250" } µs för konjunktion Jorden–Mars. De publicerade siffrorna anges och märks som DSN-specifikationer av <b>storleksordning</b>, inte påhittade exakta tal, och moduldokumentet är tydligt med att detta mäter modellens precision, inte återskapande av verkliga pass (det är D2 + verklig TDM).

seg-2a25e6a8a5b1 = Reducerat dynamisk OD för djuprymd — D2 (<c1/>, <c2/>, <c3/>)

seg-0d7a1b75a0ea = Den tredje milstolpen för navigeringsmotorn för djuprymd: <b>skattaren</b> som omvandlar de radiometriska observablerna i D1 till en återvunnen bana — ett numeriskt robust kvadratrotsinformationsfilter (Square-Root Information Filter, SRIF) med reducerat dynamiska empiriska accelerationer, en ombordklocka med tre tillstånd, en modell för luftmotstånd på Mars och de radiometriska mätpartialerna som kopplar avstånd/Doppler till filtertillståndet, avslutad från början till slut med en syntetisk återvinning av banbestämning för en bana kring Mars med låg höjd (LMO). <b>Ärlig avgränsning:</b> återvinningen är en <b>syntetisk sluten slinga</b> (referensen och filtret delar samma Mars-propagator, och observationerna är samma geometriska observabelmodell som filtret inverterar, plus injicerat gaussiskt brus) — den validerar <b>skattarens maskineri</b>, inte den absoluta noggrannheten hos kraftmodellen för Mars; den externa korskontrollen av DE-klass är craten <c1/> som styrs av kärnor (D0.8b). Allt nedan är additivt (referensfilerna för reproducerbarhet är oförändrade; samma SHA, ingen omgenerering).

seg-51f203291066 = SRIF-kärna (kvadratrotsinformationsfilter)

seg-9d5fd8c1d37d = <c1/>: ett handskrivet kvadratrotsinformationsfilter av Bierman — övre triangulär <c2/> med <c3/>, informationsvektor <c4/>, Householder-mät-/tidsuppdateringar, aritmetik med enbart <c5/> (ingen nalgebra). Tester: det sekventiella SRIF stämmer med lösningen med satsvis viktad minsta kvadrat (<c6/>) i <b>både tillstånd och kovarians till { "1e-9" }</b> på ett konstruerat linjärt-gaussiskt problem (<c7/>); den återvunna kovariansen <c8/> är <b>symmetrisk ({ "1e-12" }) och positivt definit genom konstruktion</b> efter en lång sekvens av mät-/tidsuppdateringar (<c9/>, Cholesky lyckas); och informationen ackumuleras (spåret av <c10/> avtar monotont när mätningar med identisk geometri vikas in).

seg-f9ffa1ef4688 = Reducerat dynamiska empiriska accelerationer (avstämning mellan cruise och LMO)

seg-b0612a7140c3 = <c1/>: filtret med nio tillstånd <c2/> med empiriska RTN-accelerationer som Gauss–Markov-processer av första ordningen som tillstånd, den reducerat dynamiska tekniken från JPL/ESOC exponerad som ett enda reglage <c3/> (nästan dynamisk ⇒ jämnar ut brus på en ballistisk båge; nästan kinematisk ⇒ den empiriska nivån absorberar en omodellerad manöver/luftmotstånd). Tester: ett nästan kinematiskt filter följer en <b>stegformad (thruster-) manöver</b> med <½ av residualen hos det nästan dynamiska, medan det nästan dynamiska filtret <b>jämnar ut en brusig ballistisk båge</b> bättre (<c4/>); att svepa stramheten flyttar residualen efter anpassning <b>monotont</b>, ett kontinuum och inte en omkopplare (<c5/>).

seg-9d5db4d63990 = Ombordklocka med 3 tillstånd (fas/frekvens/drift, van Loan Q, Allan)

seg-fe5beef74e24 = <c1/>: felstillstånd för fas + relativ frekvens + frekvensdrift med <b>exakt diskret processbrus enligt van Loan</b> och en Joseph-stabiliserad uppdatering. Tester: den diskretiserade <c2/> stämmer med det för hand härledda van Loan-polynomet <b>till { "1e-12" }</b> och <b>reduceras exakt till Q för tvåtillståndsklockan KalmanClock när drift = { "0" }</b> (en strikt övermängd); en glidning över flera steg växer fasvariansen till det analytiska holdover-sambandet i NIST SP { "1065" } genom termen för slumpmässig körning <c3/>; drifttillståndet <b>återvinner en sann åldringsramp till <{ "5" } %</b>; en <b>Allan-profil av USO-klass återvinns</b> (överlappande ADEV vid τ={ "1" } s inom kalibreringsgränsen) och skattaren förblir NEES-konsistent (>{ "95" } % inom 3σ) och PSD genom en körning med hårt <c4/>. <c5/> bär de citerade CSAC/USO/DSAC (USO: ultra-stable oscillator; DSAC: Deep Space Atomic Clock) <c6/>-siffrorna och Doppler-golvet <c7/>.

seg-8666d18daa2b = Atmosfäriskt luftmotstånd på Mars (Mars-GRAM-lite (GRAM: Global Reference Atmospheric Model))

seg-6a64c2b9e553 = <c1/>: en styckvis exponentiell profil för neutraldensitet på Mars (yta ~{ "0.020" } kg/m³, skalhöjd nära ytan ~{ "11" } km, lågdammsmedelvärdet i Mars-GRAM { "2010" } / MCD (Mars Climate Database)) och den kvadratiska luftmotståndsaccelerationen relativt den <b>medroterande</b> Marsatmosfären, plus en variant <c2/> som SRIF kan multiplicera. Tester: densiteten avtar monotont och kontinuerligt över banden, den återvunna skalhöjden nära ytan är de fysikaliska ~{ "11" } km, luftmotståndet är <b>strikt antiparallellt med den relativa hastigheten</b> (kryssprodukten försvinner till { "1e-12" }) med en rimlig storlek ~{ "3e-4" } m/s² i LMO, och det är linjärt i den ballistiska termen. <b>Ärlig avgränsning:</b> en representativ ingenjörsatmosfär, inte en flygvaliderad Mars-GRAM/MCD med beroende av damm/årstid/lokal tid.

seg-452f32dace80 = Radiometriska mätpartialer (avstånd/Doppler) för SRIF

seg-6661d241cdaf = <c1/> / <c2/>: partialerna för avstånd längs siktlinjen <c3/> (∂ρ/∂r = û, ∂ρ/∂v = { "0" }) och avståndshastighet <c4/> (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ) som kopplar D1:s observabler till filtertillståndet, plus partialen för klockfrekvens vid Doppler med en väg <c5/>. Tester: båda partialerna stämmer med en <b>central finit differens av observabeln till { "1e-6" }</b> (<c6/>, <c7/>); en enda avståndsuppdatering <b>krymper kovariansen i den observerade riktningen (siktlinjen, LOS) med ≫{ "1000" }×</b> och håller den positivt definit (PD), och en Doppleruppdatering krymper variansen i <b>hastighet</b> längs LOS (<c8/>, <c9/>).

seg-9a2cb6292477 = Mars-LMO, OD från början till slut utifrån radiometriska data

seg-6318968b683a = <c1/>: en referensbåge i bana kring Mars med låg höjd, propagerad under gravitationen <c2/>, genererar brusigt <b>avstånd (σ={ "1" } m) + Doppler (σ={ "0.1" } mm/s)</b> med två vägar mot två följningsstationer; det reducerat dynamiska SRIF återvinner den från ett initialtillstånd som är <b>~{ "2.7" } km</b> stört. Uppnått: konvergerad positions-<b>RMS ≈ { "0.2" } m</b> (under en meter, långt inom kriteriet meter till tiotals meter) över en båge på 3 varv med kadens { "30" } s, med <b>den faktoriserade kovariansen positivt definit i varje epok</b> (SRIF-garantin, kontrollerad genomgående). <b>Kontinuumet cruise→LMO</b> prövas från början till slut: med en omodellerad referens för luftmotstånd som filtermallen saknar återvinner reglaget för reducerat dynamiskt läge (stramhet { "1" }) till ~{ "14" } m mot ~{ "677" } m för körningen i nästan dynamiskt läge (stramhet { "0" }) — en förbättring på { "48" }× när den empiriska nivån absorberar luftmotståndet. <b>Ärlig avgränsning:</b> syntetisk sluten slinga (referens = samma propagator som filtret använder); den externa korskontrollen av DE-klass är den kärnstyrda <c3/> (D0.8b), aldrig körd här, inget nätverk.

seg-559176eb1a82 = Scenario för PNT i djuprymd och fusion av en väg + två vägar — D3 (<c1/>, <c2/>)

seg-bdb5da496071 = Den fjärde milstolpen för navigeringsmotorn för djuprymd: ett körbart <b>produktscenario för Mars-PNT</b> som knyter ihop Marskroppen/systemet i D0, de radiometriska observablerna i D1 och den reducerat dynamiska OD i D2 till en enda scenariotyp <c1/>. Det modellerar en liten <b>reläkonstellation i stil med MARCONI</b> som sänder en signal i rymden med en väg (klockkopplad) och dessutom vidarebefordrar en länk med två vägar (koherent, klockfri) till en station för djuprymd, och navigerar tre referensanvändare (Marsöverföring, orbiter i bana kring Mars med låg höjd, fast punkt på ytan) genom <b>den gemensamma skattaren D3.1 för fusion av en väg + två vägar</b> — ett SRIF med tolv tillstånd som utökar det reducerat dynamiska bana-/empiriska blocket i D2 med en ombordklocka med tre tillstånd. <b>Ärlig avgränsning:</b> varje kvalitetsmått är skattarens <b>formella kovariansgräns</b> (1σ / 3σ position per epok) och den uppnådda RMS mot en <b>syntetisk referens i sluten slinga</b> (referensen och filtret delar samma Marsdynamik och samma geometriska observabelmodell, plus injicerat gaussiskt brus) — ett simulerat navigeringsmått, <b>INTE</b> en luftfartscertifierad skyddsnivå och <b>INTE</b> ett flygpåstående (ingen certifierad felmodell, ingen integritetsövervakare, inga verkliga följningsdata). Allt nedan är additivt (referensfilerna för reproducerbarhet är oförändrade; samma SHA, ingen omgenerering).

seg-b81920d2df82 = Gemensam radiometrisk fusion av en väg + två vägar (fuserad slår vardera ensam)

seg-cd9d2a7dd08f = <c1/>: det reducerat dynamiska SRIF D2.2 utökat med de tre klocktillstånden ombord (<c2/>), som tar in en blandad tidsserie av avstånd/Doppler med <b>två vägar</b> (klockfri, fäster banan — nollkolumner för klockan i partialen) och <b>en väg</b> (klockkopplad — frekvenspartialen <c3/>) genom <c4/>. Strukturen kalibrera-sedan-glid: pass med två vägar fäster banan, data med en väg kalibrerar sedan klockan och låter banan glida mellan passen med ett fel som begränsas av klockans Allan-stabilitet. Testat i <c5/> <c6/>: den <b>fuserade</b> lösningen slår <b>vardera länktyp ensam</b>; glidfelet för en körning med enbart en väg växer med gapet mellan passen med två vägar i linje med Allan-gränsen för klockklassen; den gemensamma kovariansen förblir SPD (symmetrisk positivt definit) hela tiden.

seg-26a4bfa8e6ad = MARCONI-konstellation (areostationär radie, ockultation)

seg-f2c2e1b83411 = <c1/>: en uppsättning av fem reläer — tre <b>areostationära</b> reläer vid <c2/> (den Mars-synkrona radien utifrån publicerad μ/rotationstakt; testad inom bandet <b>{ "20 400" }–{ "20 500" } km</b>) jämnt fördelade { "120" }° i longitud med { "5" }° inklination, plus två reläer i en högre ({ "1.4" }× areostationär) cirkulär bana med { "60" }° inklination för täckning i himmelsplanet. Reläens tillstånd per epok integreras framåt under gravitationen <c3/>; synlighetstestet för <b>ockultation av Mars</b> är geometrin där kordan klarar sfären (<c4/>, testat: ett diametralt motsatt relä är skymt, ett relä rakt ovanför är synligt). <b>Ärlig avgränsning:</b> en minimal representativ geometri för utsändning plus relä byggd på publicerade Marskonstanter — inte en specifik utformning av en flygkonstellation.

seg-b53ea4dd9f7d = Scenariot <c1/> nåbart via CLI / Python / WASM (WebAssembly) / MCP (Model Context Protocol)

seg-3a01d13ad2e7 = <c1/> / <c2/> är kopplat som scenariot <c3/> över alla gränssnitt (D3.3): körningen i CLI, Python-bindningen, bygget för WASM/playground och MCP-serverns dispatch leder alla till det (<c4/>, test av tur och retur <c5/>). Medföljande referensscenarier: <c6/>, <c7/>, <c8/>. Resultatet bär en explicit <c9/> som märker kvalitetsmåttet som en kovariansgräns (inte en certifierad skyddsnivå, PL), och utdata <c10/> / <c11/> upprepar ärlighetsmärkningen.

seg-28a49a455a74 = Målen för MARCONI / LightShip återskapade: <b>orbiter < { "100" } m</b>, <b>rover < { "15" } m</b>

seg-28da71940857 = <c1/>: de publicerade programmålen för MARCONI / LightShip (orbiter < { "100" } m, yta/rover < { "15" } m) återskapade i simulering. <b>Gemensamma antaganden:</b> standardkonstellationen MARCONI med fem reläer; varje relä i sikte ger avstånd + Doppler med en väg per epok; ett koherent stationspass med två vägar var <b>{ "30" } min</b>; brus av DSN-klass (<b>avstånds-σ = { "1" } m, Doppler-σ = { "0.1" } mm/s</b>); det gemensamma fusionsfiltret för reducerat dynamisk bana + klocka med 3 tillstånd, initierat från ett a priori-tillstånd som är <b>~{ "2.7" } km</b> stört (stramhet { "0.1" }); kvalitetsmått = konvergerad 3D-positions-RMS för bågens bakre hälft mot den syntetiska referensen. <b>Orbiter</b> (LMO ~{ "400" } km / { "60" }° inkl., klocka av typ <b>USO</b>, kadens { "60" } s, ~{ "2" } h ≈ en båge på ett varv): uppnådd konvergerad RMS <b>≈ { "0.40" } m</b> ≪ målet { "100" } m (i genomsnitt { "3.1" } reläer i sikte, kovarians SPD genomgående). <b>Rover</b> (fast punkt på ytan vid ekvatorn, klocka av typ <b>USO</b>, kadens { "30" } s, båge på ~{ "2" } h): uppnådd konvergerad RMS <b>≈ { "5.1" } m</b> < målet { "15" } m (i genomsnitt { "3.0" } reläer i sikte, kovarians SPD). <b>Båda målen uppfylldes utan att någon assertion försvagades</b> — USO är den <em>mindre</em> kapabla av de realistiska klasserna av ombordklockor (en DSAC skulle bara hjälpa) och kadensen på 30 min för pass med två vägar är försiktig för ett rutinmässigt schema i ett relänät, så antagandena är fysikaliskt rimliga för ett system av MARCONI-klass snarare än tillrättalagda för att klara testet. <b>Ärlig avgränsning:</b> simulerad återskapning under de angivna antagandena, INTE ett flygpåstående eller en certifierad skyddsnivå; den syntetiska referensen i sluten slinga delar filtrets Marsdynamik och observabelmodell.

seg-37b2bad62854 = Månens koordinattid — relativistisk klocktakt mellan Jorden och Månen (<c1/>)

seg-787705fa0fac = En tidsskala för månens koordinattid (LTC/TCL (TCL: Temps-Coordonnée Lunaire, det franska namnet på Lunar Coordinate Time)) kräver den sekulära takt med vilken en klocka på månytan går relativt en klocka på jordens geoid (TT). <c1/> beräknar den från första principer: en postnewtonsk identitet av första ordningen som summerar <b>skillnaden i självpotential</b> (IAU:s <c2/>, den konventionella geoidpotentialen <c3/>, minus Månens självpotential vid ytan <c4/>) och den <b>kinetiska termen (andra ordningens Doppler)</b> <c5/> från Månens geocentriska hastighet (finit differens från månserien av Montenbruck–Gill i <c6/>). Den dominerande självpotentialtermen ger <b>≈ { "57.5" } µs/dygn</b>, den kinetiska termen <b>≈ −{ "0.5" } µs/dygn</b>, totalt <b>≈ { "57" } µs/dygn</b>. Scenariot <c7/> rapporterar denna takt, den ackumulerade skillnaden LTC−TT över en horisont och stödjer ett minimalt ensemblemedel med inversvarians (en klocka av papper för månen); omvandlingar TT↔LTC går tur och retur till < { "1" } ns/dygn.

seg-beeb6561ef6b = Oberoende referens / ärlig avgränsning

seg-4500e65ede97 = Relativistisk klocktakt mellan Jorden och Månen (LTC/TCL)

seg-4c7a29bc3003 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>. <b>Oberoende referens: en intern sluten relativistisk identitet</b> (geopotentialen <c6/> enligt IAU / IERS-konventionerna och självpotentialen GM/r (GM: gravitationsparameter, G gånger massan)), <b>korskontrollerad mot det publicerade bandet för månklockans takt [{ "56" }, { "59" }] µs/dygn</b>. Tester (<c7/>): självpotentialtermen ≈ { "57.5" } µs/dygn, Månens fart ≈ { "1" } km/s, den kinetiska termen en liten negativ, totalen inom bandet med de namngivna termerna som summerar till den, skillnaden LTC−TT efter 1 dygn ≈ { "57" } µs och en tur-och-retur-omvandling TT↔LTC på < { "1" } ns/dygn. <b>Ärlig avgränsning:</b> huvudsiffran i µs/dygn är <b>referensberoende</b> — den beror på de valda referensytorna (jordens geoid <c8/> kontra en selenoid på Månen), tidsfönstret för medelvärdesbildning och de försummade korrektionerna för centrifugal/J₂ under µs/dygn — vilket är skälet till att ett <b>band</b>, inte ett enskilt certifierat tal, är den publicerade utdatan. Detta är en kontroll av självkonsistens av typen <c9/>, <b>INTE</b> en extern validering, <b>INTE</b> absolut noggrannhet under en nanosekund och <b>INTE</b> certifierad för operativ tidshållning.

seg-b4e3228c84b8 = Geodetisk VLBI för Månen — närfältsfördröjning för en baslinje på Jorden som observerar en beacon på Månen (<c1/>)

seg-bbb634953ebf = En observabel för geodetisk VLBI (very-long-baseline interferometry) för två markstationer på Jorden (en baslinje) som observerar en signal med en väg från en sändare av klass NovaMoon på månytan. Månen är i <b>närfältet</b>, inte en plan våg, så den geometriska fördröjningen är den exakta skillnaden mellan två avstånd <c1/> snarare än projektionen i himmelsplanet. Hela observabeln lägger till skillnaden i stationernas klockoffset och en differentierad Shapiro-term för jordens potential (återanvänd från <c2/>). Stationerna placeras i geocentriska tröghetskoordinater (GCRS) via <c3/> + <c4/>; beaconen via <c5/> (geocentrisk Måne) + <c6/> (selenografisk→MCMF (MCMF: Moon-centred, Moon-fixed)) + <c7/> (IAU-2015 ME kroppsfast→tröghet). Scenariot <c8/> samplar fördröjningen, dess hastighet med finit differens och närfältskorrektionen under ett pass.

seg-b2b758337ebc = Den <b>oberoende referensen</b> är den observabel för Δ-DOR med plan våg i samma kodbas, <c1/> i <c2/>: i fjärrfältsgränsen (en syntetisk beacon på { "1e15" } m) måste den geometriska fördröjningen kollapsa till <c3/> till maskinprecision; vid verkligt månavstånd är korrektionen för vågfrontens krökning i närfältet skild från noll (tiotals till hundratals µs). Beacon-partialerna <c4/> (och stationspartialerna) verifieras med central finit differens (relativt fel < { "1e-5" }).

seg-107b9d328f69 = Fördröjning och partialer för geodetisk VLBI på Månen

seg-acee0ad60cf4 = <c1/>, <c2/>, <c3/>/<c4/>/<c5/>, <c6/>, <c7/>. <b>Oberoende referens: <c8/></b> — den observabel för plan våg <c9/> i samma kodbas (<c10/>) i fjärrfältsgränsen, plus <b>partialer med finit differens</b>. Tester (<c11/>): stationens storlek ≈ jordradien, beaconens avstånd vid månavstånd ({ "356" }–{ "407" } Mm), den geometriska fördröjningen i fjärrfältet stämmer med <c12/> till < { "1e-9" } s, en korrektion i närfältet skild från noll vid månavstånd, FD-partialer för beacon/station inom { "1e-5" } relativt, en exakt klockterm och en ändlig scenariokörning via <c13/>. <b>Ärlig avgränsning:</b> <c14/>, <b>INTE</b> validerad mot verkliga VLBI-data. Polarrörelsen utelämnas (<c15/>), så stationernas tröghetspositioner bär ett fel i referenssystemet på några meter; beaconen blandar en månserie för medelekvatorn för datum med en kroppsfast förskjutning i ICRF (International Celestial Reference Frame) (<c16/>), en inkonsistens mellan referenssystem som ligger under modellens noggrannhet men inte är rigorös; och det finns ingen iteration av ljustid, jordrotation under ljustiden, medier (tropo/iono/plasma) eller aberrationsterm utöver den differentierade Shapiro-termen. Inget påstående görs om TRL (technology readiness level), flygarv eller stöd från någon rymdorganisation. { "0.30" }: mot ljustider i ANISE via DE440 ligger ingen fördröjning på denna analytiska väg inom { "1" } ps (största gap { "24" } µs); resultatet är fastlåst.

seg-d90c67f098f7 = <c1/> (DE440 för Jorden och Månen, DE440 för månens huvudaxlar, jordorientering ITRF93, varje ljustid konvergerad i det barycentriska systemet), körs av scenariot <c2/> när de tre kärnsökvägarna är satta. <b>Oberoende referens: Library</b> — NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }) konvergerade ljustider till DSS-14/43/63, förhandsregistrerat: { "75" } fördröjningar inom { "1" } ps (sämst { "0.06" } ps), partialer för beacon och station inom { "1e-6" }, vid { "25" } epoker nära J2000 (en ändring efter att { "2024" } epoker föll på SPICE:s egen epok för emission i dubbel precision, cirka { "6" } ps, redovisad och fastlåst). Den differentierade Shapiro-termen, fördröjningens hastighet och närfältskorrektionen i scenariot jämförs inte.

seg-8bed75c5402d = Gemensam multiteknik-OD + klocka för Månen — simulerad återvinning i sluten slinga (<c1/>)

seg-d518eead07c4 = En enkelepoks (ögonblicksbild) anpassning med satsvis minsta kvadrat (<c1/>, ett Householder-QR-steg sedan { "0.30" }) som <b>fuserar teknikerna geodetisk VLBI, radiometrisk/lokal avståndsmätning på Månen och avståndsmätning mellan satelliter</b> på ett SIMULERAT månnät för att <em>tillsammans</em> återvinna 3D-positionen för en station på månytan, positionerna för varje satellit i en liten konstellation och varje tillgångs klockoffset. Observablerna är: ({ "1" }) geodetiska VLBI-fördröjningar för en jordbaslinje till månstationen behandlad som beacon (återanvänder <c2/>, geocentrisk tröghet) — huvudtekniken; ({ "2" }) geocentriska radiometriska avstånd från jordstation till satellit (som multilaterar konstellationen från de väl spridda jordstationerna) och lokala avstånd på Månen mellan station och satellit (euklidiskt avstånd i MCI (Moon-centred inertial) plus den differentierade klocktermen); ({ "3" }) avstånd mellan satelliter (samma form); plus en enda pseudoobservation för klocksynkronisering av stationen som fäster den annars icke-observerbara gemensamma klockoffseten. Tillståndsvektorn är <c3/>. Det finns <b>ingen propagering med kraftmodell inne i lösaren</b> — satelliterna är fasta, distinkta, illustrativa punkter på en representativ månbana; detta är medvetet en ren ögonblicksanpassning. Internt skalas positionerna och klockorna skattas i avståndsekvivalenta meter så att normalmatrisen förblir välkonditionerad i f64; VLBI-avstånden och avstånden på Månen medelvärdesbefrias kring den nominella geometrin så att Jacobianen med finita differenser inte drabbas av katastrofal utsläckning. Scenariot <c4/> kör lösningen med och utan VLBI-leden på samma frö/referens och rapporterar båda lösningarna plus förbättringsfaktorn för stationens observerbarhet.

seg-f634e976b583 = Det <b>viktigaste ärliga resultatet</b>: lokal avståndsmätning på Månen från en polstation till en handfull satelliter som alla ligger mot samma sida av himlen lämnar stationens position <b>svagt observerad längs en riktning</b>, så lösningen med enbart avstånd är illakonditionerad och det återvunna 3D-felet för stationen blir stort (eller så konvergerar inte lösningen). <b>Att lägga till VLBI-fördröjningarna för jordbaslinjen gör stationens hela 3D-position observerbar</b>, och det återvunna stationsfelet rasar till meternivå. Testet <c1/> kontrollerar att stationsfelet med VLBI är märkbart (≥{ "5" }×) mindre än felet med enbart avstånd på samma injicerade referens — att VLBI återställer den annars icke-observerbara stationsriktningen är hela poängen med fasen.

seg-d5feea2381b7 = Den <b>oberoende referensen</b> är intern konsistens: ett injicerat referenstillstånd (station ~{ "50" } m/axel, satelliter ~{ "30" } m/axel, klockor ~{ "1e-7" } s, med ett frösatt jitter per komponent) avbildas till syntetiska observabler genom <em>samma</em> geometrimodell som lösaren inverterar, frösatt gaussiskt brus läggs till (illustrativa standardvärden: VLBI σ ≈ { "1e-11" } s, avstånds-σ ≈ { "0.1" } m, ISL-σ ≈ { "0.1" } m; vikter <c1/>), och skattaren måste återvinna det injicerade referenstillståndet inom bruset från en initial gissning med nollor. Ett medelvärde av NEES <c2/> med Monte Carlo över frön (<c3/>) ligger inom ett löst band kring <c4/>, en kontroll av kovariansens realism.

seg-abc40f1f301a = <c1/> ({ "0.30" }, P2: lösningens linjära algebra)

seg-87de27c2421a = <c1/>, <c2/>, <c3/>. <b>Oberoende referens { "0.30" }: P2</b> — numpy { "2.4.6" } (LAPACK gelsd och inv) räknar om varje Gauss–Newton-steg, den konvergerade viktade lösningen, de formella sigmavärdena och stationsfelet på de incheckade Jacobianerna för sex nät (<c4/>, steg inom { "2.4e-11" }, sigmavärden inom { "1.3e-11" }); de fysikaliska observationsmodellerna och storleksordningarna förblir MODELLED. <b>Tidigare oberoende referens: <c5/></b> — återvinning av en injicerad simulerad referens + konsistens i NEES-kovarians. Tester (<c6/>): full fusion återvinner referensen (station < { "5" } m, RMS för satelliter < { "5" } m, klockor < { "1e-8" } s, konvergerad); VLBI återställer stationens observerbarhet i 3D (stationsfelet ≥{ "5" }× mindre med VLBI än med enbart avstånd på samma referens); deterministisk (samma frö → bitidentisk lösning, annat frö → annorlunda men återvunnen); medel-NEES inom ett löst band kring <c7/>; ändliga/skyddade rapporterade tal även när enbart avstånd är illakonditionerat; scenariot skickat via <c8/>. <b>Ärlig avgränsning:</b> detta är en <b>simulerad återvinning i sluten slinga</b> — referensen delar observationsmodellen — <b>INTE</b> validering mot verkliga data; ingen propagering med kraftmodell inne i lösaren; satelliternas positioner och geometrin för stationerna på Jorden/Månen är illustrativa. Inget påstående görs om TRL, flygarv eller stöd från någon rymdorganisation.

seg-7620f3a821f6 = Realisering av referenssystem för Månen — anpassning av datum med Helmert-transform med 7 parametrar (<c1/>)

seg-240271b9d7de = Där <c1/> <em>tillämpar</em> IAU:s WGCCRE-orientering av månkroppen från { "2015" } (en framåtmodell) <em>skattar</em> (realiserar) denna modul ett referenssystem för Månen från ett nät av skattade punktkoordinater knutna till ett datum. Skattningskärnan är en klassisk <b>likformighetstransform (Helmert) med 7 parametrar</b> — tre translationer, tre rotationer i liten vinkel och en skalparameter — som avbildar punkter <c2/> (skattat system) till <c3/> (datumsystem) som <c4/>, med <c5/> byggd av <c6/>. De sju parametrarna <c7/> skattas från ≥ { "3" } icke-kollinjära punktpar med viktad minsta kvadrat genom <c8/>: framåtmodellen predicerar varje <c9/> från dess <c10/> och plattar ut alla tre komponenter för alla punkter till observabelvektorn, de observerade datumkoordinaterna bildar <c11/>, vikterna är <c12/>, och lösningen startar från <c13/>. Rotationsvinklar skattas i µrad och skala i ppb så att Jacobianen med finita differenser förblir välskalad vid storleken på koordinaterna på månytan (~{ "1.7e6" } m). En liten funktion <c14/> sammansätter den realiserade lilla rotationen genom orienteringen kropp→ICRF enligt IAU (<c15/>) och returnerar det realiserade systemets residuala förskjutning i liten vinkel kring ICRF-axlarna — en medvetet enkel ändring av uttrycksformen, <b>inte</b> en oberoende skattning av månens pol.

seg-75769fc9671c = Den <b>oberoende referensen</b> är intern konsistens: en känd Helmert-transform (translation ~tiotals m, rotation ~µrad, skala ~{ "1e-7" }) <em>injiceras</em> i ett välspritt syntetiskt punktnät (varierande selenografisk lat/lon → MCMF, vissa punkter på höjd), frösatt gaussiskt brus läggs till, och anpassningen måste återvinna de injicerade parametrarna. På brusfria data sker återvinningen till ~maskinprecision (translation < { "1e-6" } m, rotation < { "1e-9" } rad, skala < { "1e-12" }); med brus på meternivå hamnar de återvunna parametrarna inom några × det formella σ och RMS-residualen efter anpassning ligger nära brusnivån. Scenariot <c1/> rapporterar det återvunna datumet, återvinningsfelet per parameter mot den injicerade referensen, RMS-residualen efter anpassning och kopplingen av den realiserade rotationens ICRF-orientering.

seg-3768ce021e23 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Oberoende referens: <c6/></b> — återvinning av en injicerad likformighetstransform med 7 parametrar plus den algebraiska identiteten för tur och retur för <c7/>. Tester (<c8/>): brusfri återvinning av den injicerade transformen (translation < { "1e-6" } m, rotation < { "1e-9" } rad, skala < { "1e-12" }); återvinning med brus inom några × σ och RMS-residual nära brusnivån; tillämpa-sedan-invertera, tur och retur; deterministisk (samma frö → bitidentisk, annat frö → annorlunda men återvunnen); ICRF-kopplingen vid noll rotation är noll och kopplingen bevarar rotationens storlek; scenariot skickat via <c9/>. <b>Ärlig avgränsning:</b> detta är en kontroll av <b>självkonsistens</b> — den återvinner en <em>injicerad</em> transform på ett <em>syntetiskt</em> nät — <b>INTE</b> en realisering av månens referenssystem mot verkliga följnings-/VLBI-data, och den gör inga anspråk på absolut noggrannhet i referenssystemet. ICRF-orienteringskopplingen är en enkel ändring av uttrycksformen, inte en oberoende polskattning. Inget påstående görs om TRL, flygarv eller stöd från någon rymdorganisation.

seg-f14930d33f47 = Servicevolym för navigering på Månen — DOP / täckning / tillgänglighet + generaliserad PL med ARAIM för Månen (<c1/>)

seg-9b4f13e138e4 = Den här modulen <em>sätter ihop</em> redan byggda delar till en analys av <b>servicevolym</b> för navigering på Månen: den sveper ett selenografiskt rutnät av latitud/longitud över en tidshorisont mot en <b>illustrativ konstellation i månbana av klass Moonlight / LCNS (LCNS: Lunar Communications and Navigation Services) från offentliga källor</b> och rapporterar DOP / täckning / tillgänglighet plus ett generaliserat hölje av skyddsnivåer med ARAIM för Månen. De två återanvändningarna är bärande och explicita. <b>DOP-geometrin</b> är den <b>VALIDATED</b> kärnan (mot gnss_lib_py) <c1/> — <c2/> är ett tunt filter för elevationsmask plus den kärnan, och ett test kontrollerar identiteten (<c3/> är lika med ett direkt <c4/> på samma synliga positioner). <b>Integritet</b> återanvänder maskineriet för ARAIM för Månen från LunaNet LNIS (LunaNet Interoperability Specification) <c5/> (σ_URE ≈ { "30" } m, <c6/> ≈ { "1e-4" }); <c7/> generaliserar den befintliga skyddsnivån för sydpolen till en godtycklig punkt på ytan, och ett test kontrollerar att den <b>reduceras till fallet sydpolen</b> (vid sydpolen med samma geometri/budget returnerar den exakt det befintliga resultatet <c8/> till < { "1e-9" }).

seg-456bf257f689 = Konstellationens parametrar är en <b>illustrativ approximation av offentliga beskrivningar från ESA</b> av systemklassen (≈ { "4" } satelliter i elliptiska frusna månbanor som gynnar täckning av sydpolen — apolun över södra halvklotet; { "4" } är standardvärdet i biblioteket, och den medföljande <c1/> sätter { "8" } eftersom skyddsnivån kräver minst { "6" } i sikte). De är <b>inte</b> den verkliga efemeriden för Moonlight/LCNS och antyder <b>ingen</b> anknytning, något stöd, arv, certifiering eller TRL. Sammansättningen (täckning / tillgänglighet / integritet) är <b>MODELLED</b>: en uppsättning reläer med cirkulär/elliptisk Kepler-rörelse (inte en differentialkorrigerad efemerid för LCNS / { "9" }:{ "2" } NRHO (near-rectilinear halo orbit)), en måne med medelrotation (ingen fysikalisk libration / pol med precession) och publicerade integritetsparametrar för LunaNet LNIS. Den visar <em>metoden</em> för servicevolym, inte ett operativt tillgänglighetstal. Deterministisk (ren geometri; ingen slumpmässighet). Scenariot <c2/> rapporterar täckningsprocenten, höljena för antal synliga och PDOP, höljet HPL/VPL över volymen och tillgängligheten för skyddsnivån mot larmgränsen.

seg-c28e56391894 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>DOP-geometri validerad genom återanvändning</b> av kärnan <c7/>, validerad mot gnss_lib_py; integriteten återanvänder ARAIM för Månen från publicerade LunaNet/LNIS (<c8/>, σ_URE ≈ { "30" } m). Tester (<c9/>): <c10/> är en identitet på den validerade kärnan; <c11/> vid sydpolen är lika med den befintliga PL från <c12/> till < { "1e-9" } (reduceras till fallet sydpolen); täckningen är icke-avtagande i konstellationens storlek; synligheten respekterar elevationsmasken; scenariot är deterministiskt och skickas via <c13/>. <b>Ärlig avgränsning:</b> konstellationen är <b>illustrativ, från offentliga källor, INTE knuten till ESA</b> — inte den verkliga efemeriden för Moonlight/LCNS; sammansättningen av täckning/tillgänglighet/integritet är <b>MODELLED</b> (reläer med cirkulär/elliptisk Kepler-rörelse, måne med medelrotation, publicerade LNIS-parametrar), <b>INTE</b> ett operativt tillgänglighetstal för Moonlight. Inget påstående görs om TRL, flygarv eller stöd från någon rymdorganisation.

seg-4ff4929f71df = Differentiell PNT för Månen — upphävande av gemensamt läge + residual som växer med baslinjen + skyddsnivåer för DGNSS (<c1/>)

seg-8f94c4bf3fe6 = En analog till DGNSS (differential satellite navigation) / SBAS för Månen: en <b>referensstation av klass NovaMoon</b> på en <em>känd</em> selenografisk plats beräknar differentiella korrektioner per satellit från en <b>illustrativ konstellation av klass Moonlight / LCNS från offentliga källor</b>, och en rörlig användare på en baslinje från den tillämpar dem så att de <b>gemensamma</b> felen i utsänd efemerid upphävs. Varje satellit <c1/> bär en injicerad gemensam 3D-vektor för banfel <c2/> och ett gemensamt klockfel <c3/>. Referensstationens residual i pseudoavstånd är korrektionen <c4/>; användarens råa fel är <c5/>; det korrigerade användarfelet är deras skillnad <c6/>. <b>Klocktermen <c7/> upphävs exakt</b> (den är identisk i båda observationerna), och <b>banfelstermen kollapsar till projektionen på skillnaden mellan de två enhetsvektorerna längs siktlinjen</b>, som → { "0" } när baslinjen → { "0" } (golvet för rumslig dekorrelation) och växer ≈ linjärt med baslinjen. De korrigerade avståndsfelen per satellit avbildas genom användargeometrin med en liten ögonblickslösning med viktad minsta kvadrat med få beroenden (tillståndet <c8/> via <c9/>; en konstant avståndsbias absorberas av den okända klockan i stället för att förstöra positionsbestämningen) för att ge användarens <b>positionsfel</b>. Användarens <b>skyddsnivå återanvänder maskineriet för skyddsnivå i SBAS enligt DO-229E</b> (<c10/>, K-faktorer för precisionsinflygning) med den differentiella residualens σ som 1-σ-felbudget för varje satellit.

seg-06978cfaebe3 = NovaMoon nämns <b>enbart som systemklass</b> (en offentlig beskrivning av en referensstation på Månen); konstellationen återanvänder den illustrativa <c1/> från offentliga källor. Detta är illustrativa parametrar för att öva den differentiella <em>metoden</em>, <b>inte</b> en verklig efemerid, och de antyder <b>ingen</b> anknytning, något stöd, arv, certifiering eller TRL. Scenariot <c2/> rapporterar användarens positionsfel med och utan korrektioner, reduktionsfaktorn, kurvan fel mot baslinje och skyddsnivån. I standardkonfigurationen är det korrigerade användarfelet vid en baslinje på { "50" } km ≈ { "0.008" } m mot ≈ { "24" } m okorrigerat (en reduktion på ~{ "3000" }×), och ≈ { "0" } vid noll baslinje.

seg-6bb4dbe998f9 = Den <b>oberoende referensen</b> är intern konsistens: upphävandet av gemensamt läge är en <b>exakt algebraisk identitet</b> (med <c1/> är det korrigerade felet < { "1e-6" } m vid noll baslinje; klocktermen upphävs till maskinprecision vid vilken baslinje som helst), residualen <b>växer monotont med baslinjen</b>, och skyddsnivån är <b>samma algoritm enligt DO-229E</b> som SBAS-stacken är fastlåst mot. Residualen från rumslig dekorrelation är en geometrisk modell av <b>första ordningen</b>, <b>inte</b> en anpassad dekorrelationsmodell från verklig följning på Månen.

seg-fd282b10cc77 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. <b>Oberoende referens: <c6/></b> — identiteten för upphävande av differentiella fel plus återanvändning av maskineriet för skyddsnivå i SBAS enligt DO-229E (<c7/>). Tester (<c8/>): vid noll baslinje är det korrigerade användarfelet och varje korrigerat avståndsfel per satellit ~{ "0" } (< { "1e-6" } m) och ≪ det okorrigerade felet; klocktermen upphävs exakt vid vilken baslinje som helst (fallet med banfel noll); det korrigerade felet växer monotont med baslinjen men förblir ≪ det okorrigerade vid måttliga baslinjer; differentiellt slår fristående med en tydlig marginal (> { "2" }×); skyddsnivån är lika med ett direkt anrop av <c9/> och skalar med residualens σ; underbestämd geometri returnerar <c10/>; scenariot är deterministiskt (frösatt) och skickas via <c11/>. <b>Ärlig avgränsning:</b> <b>MODELLED</b> — upphävandet av gemensamt läge är en exakt identitet men residualen från rumslig dekorrelation är en geometrisk modell av <b>första ordningen</b>, <b>inte</b> en anpassad dekorrelationsmodell från verklig följning på Månen, och detta är <b>inte</b> validerat mot verkliga data. NovaMoon nämns <b>enbart som systemklass</b> (illustrativ, från offentliga källor, <b>inte knuten till ESA</b>). Inget påstående görs om TRL, flygarv eller stöd från någon rymdorganisation.

seg-08e8a73f3426 = Export för interoperabilitet på Månen — CCSDS OEM + KIF i linje med LunaNet/IOAG med formatkontroll tur och retur (<c1/>)

seg-39b875078d27 = Månens referenssystem, tidsskala och efemerid exporteras i <b>CCSDS-baserade utbytesformer i linje med LunaNet/IOAG (IOAG: Interagency Operations Advisory Group)</b>. Den här fasen <b>hittar inte på</b> något trådformat: den <b>återanvänder</b> cratets befintliga skrivare och läsare för CCSDS OEM (Orbit Ephemeris Message) version { "2.0" } (<c1/> / <c2/>) och Kshana Interchange Format-kuvertet (<c3/>), omtaggade för månens sammanhang. <c4/> sätter OEM-fältet <c5/> till <b>IAU:s WGCCRE-system för månkroppen från { "2015" }</b> (<c6/> medeljord eller <c7/> huvudaxlar), <c8/> till <b>månens tidsskala</b> (<c9/> / <c10/> / <c11/>) och <c12/> till <c13/>, över en exempel-efemerid av <b>illustrativ klass LCNS från offentliga källor</b> (positioner från <c14/>, hastighet med central finit differens). <c15/> skriver ut en deskriptor för månens tid i linje med LunaNet/IOAG (skal-id, sekulär takt i µs/dygn från <c16/>, det publicerade bandet { "56" }–{ "59" } µs/dygn, referensyta) som går tur och retur genom serde_json. <c17/> lindar in OEM + deskriptor + systemetikett i det befintliga KIF-kuvertet med ärlighetsmärkningen MODELLED.

seg-bbfce5323abb = Den <b>oberoende referensen</b> är kontroll av tur och retur / fält. Eftersom <c1/> levereras med <em>båda</em> riktningarna går OEM tur och retur genom <c2/> (tillbaka till ett lika segment, med månens system/tid och antalet tillstånd bevarade) <b>och</b> kontrolleras oberoende av <c3/>, som verifierar att varje obligatoriskt nyckelord i CCSDS/LunaNet-huvudet finns, att <c4/> bär en token av typen <c5/> för Månen och att <c6/> inte är tomt, att inramningen <c7/> håller och att datarader för position+hastighet är välformade — och returnerar ett strukturerat utfall (klarat/ej klarat) plus listan över närvarande/saknade fält så att en trasig export (t.ex. ett utelämnat <c8/>) fångas och namnges. Tidsmetadata går tur och retur genom <c9/>, och KIF-kuvertet går tur och retur genom <c10/> till lika artefakter som bär märkningen MODELLED.

seg-cb9dfbed826d = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. <b>Oberoende referens: <c7/></b> — deterministisk tur och retur (CCSDS OEM via <c8/>; KIF via <c9/>; tidsmetadata via serde_json) plus kontroll av fältnamn mot publicerade fältsemantiker för CCSDS OEM + LunaNet/IOAG. Tester (<c10/>): den exporterade OEM bär token för månens <c11/> (<c12/>/<c13/>) och <c14/> (<c15/>/<c16/>), <c17/>, objektet och välformade datarader; metadata för månens tid går tur och retur (takt/band/referens) och avvisar skräp; KIF-kuvertet serialiseras och avserialiseras till ett lika värde med ärlighetsmärkningen MODELLED närvarande; en medvetet trasig OEM (saknar <c18/>) underkänns av <c19/> och rapporteras som saknad; scenariot skickas via <c20/>. <b>Ärlig avgränsning:</b> fältens <b>namn/enheter</b> är i linje med <b>offentliga</b> standarder (CCSDS 502.0-B OEM, IAU:s WGCCRE-system för Månen från { "2015" }, LunaNet Interoperability Specification / IOAG:s arkitektur för Månen); exporten är <b>MODELLED</b> — deterministisk tur och retur + kontroll av fältnamn är den oberoende referensen, detta är <b>INTE</b> ett certifierat test av formatkontroll för interoperabilitet, efemeriden är <b>illustrativ, från offentliga källor, inte knuten till ESA</b>, och inget påstående görs om TRL, flygarv eller stöd från någon rymdorganisation.

seg-69a214b7236d = Förhandsregistrerade prediktioner

seg-343fe86f6a50 = En förhandsregistrerad prediktion är ett MODELLED resultat som fryses innan några data finns att poängsätta det mot, med poängsättningsprotokollet fastställt samtidigt. Det är inte en validering och lägger inte till någon rad i registret. Var och en finns i <c1/>, med sina frysta indata, sitt resultat och deras SHA-256-hashar, och <c2/> fallerar om någon fryst byte flyttas; ett ändrat antagande besvaras med en ny, daterad prediktion bredvid den gamla, aldrig genom att redigera den.

seg-e65d79893e2c = Prediktion

seg-f9e2d4b52b79 = Fryst

seg-dd68891f75e2 = Poängsatt mot

seg-d5a09f26a028 = Täckning av en referensstation på Månen

seg-c68f124a16e7 = c05dac1d, 2026-10-12

seg-293404a9cb92 = publicerad noggrannhet, tillgänglighet, täckning och skyddsnivåer för en differentiell station vid månens sydpol, av vilken part som helst

seg-4e7d9449a880 = ännu inte poängsatt (inga publicerade resultat)

seg-ad1995b3ed17 = Demonstrationens representativitet och register över gap till flygning (<c1/>)

seg-86b70551c37f = Ett simuleringsresultat är bara användbart som evidens om det på sin framsida anger vad det är förankrat i, vad det antar och vad som fortfarande skiljer det från ett flygsystem. Registret över representativitet gör det till en förstklassig, maskinkontrollerad utdata: en post av typen <c1/> bär demonstrationens externa förankringar (<c2/>), dess modellerade antaganden, dess gap (<c3/>) till flygning (var och en med den fas/aktivitet som skulle stänga det) och det TRL-band den är representativ för. Det är följeslagaren per resultat till verifieringsmatrisen (<c4/>) på förmågenivå.

seg-ccd039d5e6a4 = Den <b>oberoende referensen</b> är en uppsättning slutna invarianter, som upprätthålls av <c1/>: en post <c2/> måste lista minst en förankring <c3/> (en simulering kan inte valideras mot sig själv); en post <c4/> måste lista minst ett gap till flygning och kan inte göra gällande ett representativt TRL-band över { "4" } (mognad bortom det kräver evidens från hårdvara/flygning, vilket är ett gap och inte en utdata från simulering); TRL-bandet måste vara välformat; och en post <c5/> får inte hävda något. Dessa invarianter omsätter disciplinen "representativiteten motiverad + återstående gap mot flygning tydligt identifierade" i praktiken.

seg-6b29111096ca = Register över representativitet och gap till flygning

seg-f6b9a2c22ae6 = <c1/>/<c2/>/<c3/>, <c4/>/<c5/>/<c6/>/<c7/>. <b>Oberoende referens: <c8/></b> — slutna invarianter för ärlighet knutna till gränsen mellan status och typ av oberoende referens i <c9/>. Tester (<c10/>): en post Validated utan extern förankring underkänns; en intern förankring (ReferenceImpl) uppfyller inte Validated; en post Modelled utan gap underkänns; en post Modelled över TRL { "4" } underkänns; felformade TRL-band fångas; posten serialiseras till JSON med de förväntade fälten och ger en läsbar rapport. <b>Ärlig avgränsning:</b> registret kontrollerar <em>klassificeringen</em> av ett resultats evidens — det bevisar inte att de namngivna förankringarna leder till levande tester (de kurateras, precis som matrisen <c11/>); påståendet "maskinkontrollerad" gäller bara invarianterna för status/förankring/gap/TRL.

seg-7e9190395eb6 = Enhetlig evidens för avvägning mellan kvant och klassiskt (<c1/>)

seg-534e48755e2c = Varje tillämpningsområde för kvant-PNT besvarar samma fråga på samma sätt: fastställ en jämförelseram (scenario + frö + motorversion), led en kvantkandidat och en klassisk baslinje genom en neutral kodväg, poängsätt dem på gemensamma kvalitetsmått och rapportera — med ett konfidensintervall och en ärlig etikett validerad/modellerad — var kvant vinner och var inte. <c1/> ger det svaret en enda form så att vertikalerna för tidssynkronisering, navigering och avvikelsedetektion alla ger ut <b>samma</b> reproducerbara, ärligt märkta objekt. Den implementerar inte om någon avvägning: siffrorna per kvalitetsmått kommer från de befintliga motorerna (<c2/>, <c3/> och vertikalmodulerna); detta är kontraktet plus omslaget för reproducerbarhet/representativitet, byggt på registret över representativitet och verifieringsetiketterna.

seg-5a52fb6670d1 = Den <b>oberoende referensen</b> är slutna identiteter för nytta/vinnare plus ett trogen inlindning av den befintliga avvägningsutdatan. <c1/>: nyttokvoten har rätt polaritet (orienterad så att <c2/> alltid betyder att kvantsidan är bättre, både för holdover där högre är bättre och för felmått där lägre är bättre); ett evidensobjekt byggt av ett verkligt <c3/> återger sina nyttokvoter; oärlig evidens förkastas (en representativitet Modelled utan gap, eller ett kvalitetsmått <c4/> vars avvägningspost saknar extern förankring); JSON är deterministisk och bär fälten för ram/frö/motor/kvalitetsmått/representativitet.

seg-ae87cea429ba = Evidens för avvägning mellan kvant och klassiskt

seg-6622ae19989c = <c1/>/<c2/>/<c3/>/<c4/>. <b>Oberoende referens: <c5/></b> — slutna identiteter för nytta/vinnare + trogen inlindning av <c6/>; ärlighet knuten till registret över representativitet och gränsen mellan verifieringsstatus och typ av oberoende referens. Tester (<c7/>) som ovan. <b>Ärlig avgränsning:</b> ramverket standardiserar <em>hur</em> en avvägning rapporteras och reproduceras; fysiken bakom varje kvalitetsmått är vad den bidragande motorn tillhandahåller, med sin egen etikett validerad/modellerad — <c8/> uppgraderar inte ett modellerat kvalitetsmått till validerat.

seg-ce13223e04d0 = Bibliotek för felmodeller för kvantenheter (<c1/>)

seg-c206fc7d58d6 = En enda plats som exponerar de kvant-PNT-enheter som demonstratorn avväger — optiska klockor / klockor med fångade joner / kvicksilverjonklockor, klassiska referensklockor, kallatomsinterferometern och länkar för tidsöverföring — var och en som ett <c1/> som bär sin huvudspecifikation och en post om representativitet. Det mesta av enhetsfysiken <b>återanvänds</b> (klockstabiliteter från <c2/> och <c3/>; kallatomsinterferometern från <c4/>/<c5/>; klassiska optiska/RF-länkar från <c6/>). Den enda verkligt nya modellen är <b>länken för tidsöverföring med intrassling / enstaka fotoner</b>, vars tidsprecision är skottbrusbegränsad: <c7/> i den detekterade koincidenstakten <c8/> och integrationen <c9/>, försämrad av en bestraffning för mörkerräkningar <c10/> och med golv från ett oreducerbart systematiskt fel.

seg-7e8f4f3a5442 = Den <b>oberoende referensen</b> är de återanvända, publicerade koefficienterna för klockor/CAI plus slutna identiteter för skottbrus/förlust. <c1/>: den återanvända ordningen mellan klockstabiliteter är rimlig (optiskt gitter < kvicksilverjon < CSAC i σ_y({ "1" } s)); precisionen för intrassling förbättras som <c2/> ({ "4" }× integration halverar σ) när den är skottbegränsad; den detekterade koincidenstakten faller { "10" }× per { "10" } dB länkförlust; mörkerräkningar försämrar precisionen monotont; det systematiska golvet begränsar precisionen nedåt; varje enhetskort är en giltig post om representativitet av typen Modelled.

seg-24dd5c3725b9 = <c1/>, <c2/>/<c3/>, <c4/>. <b>Oberoende referens: <c5/></b> — återanvända publicerade koefficienter för klockor/CAI + slutna identiteter för skottbrus/förlust för intrasslingslänken. Tester (<c6/>) som ovan. <b>Ärlig avgränsning:</b> enhetsparametrarna för klockor/CAI återanvänds från motorns befintliga modeller med publicerade koefficienter; modellen för intrasslingslänken är MODELLED utifrån publicerat beteende hos synkronisering av kvantklockor med illustrativa värden för parfrekvens/effektivitet/förlust från offentliga källor — den är <b>inte</b> validerad mot en uppmätt länk, och verklig hårdvara för källa/kanal/detektor är ett angivet gap till flygning.

seg-f6d8e7ad6bec = Betrodd kvanttidssynkronisering — kedja från början till slut, säker distribution, avvikelse + avvägning (<c1/>)

seg-3160cfec0d1f = Scenariot <c1/> sätter ihop den tidssynkroniseringskedja som en demonstrator för kvant-PNT behöver: en tidsbudget för användaren från början till slut (referensklockans fel under glidning och länkens tidsprecision kombinerade i kvadratur) för en <b>kvantkedja</b> (klocka med optiskt gitter + länk med intrassling/enstaka fotoner) mot en <b>klassisk</b> kedja (CSAC + RF-länk med två vägar); en <b>skyddsnivå för tidssynkronisering</b> (TPL, återanvänd från <c2/>) som begränsar det oupptäckta tidsfelet; ett <b>säkerhetskvalitetsmått mot fördröjnings-/återuppspelningsattacker</b> <c3/> vid en angiven frekvens av falsklarm (återanvänd från <c4/>); en <b>sannolikhet för detektion av klockavvikelser + latens för ändringsdetektion med CUSUM (cumulative sum)</b>; och jämförelsen kvant mot klassiskt som ärlig <c5/> som bär en post om representativitet + gap till flygning.

seg-6fa095264bdc = Den <b>oberoende referensen</b> är en sluten budget i kvadratur över återanvända, separat validerade kärnor (ADEV mot Stable32/NIST; TPL-gränsen; <c1/>/<c2/>). <c3/>: kvantprecisionen förbättras med integrationstiden; kvantkedjan kan vinna <em>och</em> kan förlora kvalitetsmåttet precision (ärligt — ingen universell vinst; en mycket förlustbehäftad länk vänder resultatet); skyddsnivån är ändlig och positiv; säkerhetskvalitetsmåttet ligger i [{ "0,1" }] och växer med attackens fördröjning; sannolikheten för detektion av avvikelser är monoton i felets storlek; och avvägningsevidensen är internt ärlig (<c4/>).

seg-42a7d1170cc3 = Betrodd kvanttidssynkronisering (kedja + säker distribution + avvikelse + avvägning)

seg-44855d0cec4f = <c1/>/<c2/>, <c3/>; <c4/>. <b>Oberoende referens: <c5/></b> — sluten budget i kvadratur över återanvända validerade kärnor (ADEV/Stable32-NIST, TPL-gräns, analytisk Pd/Pmd för detektion); ärlighet knuten till registret över representativitet. Tester (<c6/>) som ovan. <b>Ärlig avgränsning:</b> parametrar för klocka/länk är illustrativa, från offentliga källor; intrasslingslänken är den MODELLED skottbegränsade modellen från <c7/>; detta modellerar <em>klassen</em> av system för betrodd tidssynkronisering — det är <b>inte</b> validerat mot en uppmätt länk från början till slut, och verklig hårdvara för klocka/länk/rymdkanal är ett angivet gap till flygning; inget påstående görs om TRL, flygarv eller certifiering.

seg-c6ae292a6331 = Kvantnavigering utan GNSS (<c1/>)

seg-f34f784e928c = Scenariot <c1/> jämför dödräkning under ett GNSS-avbrott med en tröghetsbudget för <b>kvant</b> (en accelerometer med kallatomsinterferometer, återanvänd från <c2/>/<c3/>, vars brusgolv av vitt brus för CAI är validerat till inom ~{ "2" } storleksordningar från Freier et al. { "2016" }) mot en <b>klassisk</b> INS av navigeringsklass. Det rapporterar tillväxten av positionsfel under glidningen, holdover-tiden till en positionsgräns och avvägningen kvant mot klassiskt som ärlig <c4/>. Observerbarheten anges ärligt: utan extern positionsbestämning under avbrottet är accelerometerns bias icke-observerbar, så positionsfelet växer obegränsat (≈ ½·bias·t² plus en term för slumpvandring i hastighet); en kvantsensor med lägre bias <em>bromsar</em> den tillväxten men stänger inte gapet — det gör bara en extern positionsbestämning.

seg-4cfde3de8f94 = Den <b>oberoende referensen</b> är de återanvända tröghetsbudgetarna (<c1/>/<c2/>, båda implementerar traiten <c3/>) plus slutna identiteter för drift. <c4/>: kvantbudgeten slår den klassiska över ett långt avbrott (lägre fel, längre holdover); felet växer med avbrottets längd för båda (gapet i observerbarhet); fördelen beror på avbrottet och är ingen konstant vinstfaktor (kvantkurvan domineras av brus vid kort glidning, av bias vid lång); avvägningsevidensen är internt ärlig.

seg-0488b6ec9982 = <c1/>/<c2/>, <c3/>; <c4/>. <b>Oberoende referens: <c5/></b> — återanvända tröghetsbudgetar (CAI validerad genom återanvändning ~{ "2" } storleksordningar mot Freier { "2016" }; klassisk sluten drift); ärlighet knuten till registret över representativitet. Tester (<c6/>) som ovan. <b>Ärlig avgränsning:</b> en statisk jämförelse av budgetar för dödräkning, inte ett dynamiskt filter på verkliga banor; icke-observerbar bias utan positionsbestämning anges; enhetsparametrarna är illustrativa, från offentliga källor; modellerar <em>klassen</em> av kvantnavigering utan GNSS — verklig IMU-hårdvara med kalla atomer, en dynamisk plattform och flygmiljön är angivna gap till flygning; inget påstående om TRL/flygning/certifiering.

seg-e23e583ecf21 = Detektion av fel / avvikelser för kvant-PNT-system (<c1/>)

seg-6e6df91ae779 = Scenariot <c1/> definierar en märkt katalog över fel i kvant-PNT (frekvenshopp, drift och låsförlust hos klockor; biassteg och bortfall hos sensorer), poängsätter en detektionsstatistik på nominella mot felbehäftade fönster och rapporterar detektorns urskiljningsförmåga som ROC AUC och ett minsta detekterbart fel vid en fast frekvens av falsklarm. Vinkeln kvant mot klassiskt: en stabilare referensklocka av kvanttyp sänker övervakningens brus σ, så den upptäcker mindre fel — utgivet som ärlig <c2/> med en post om representativitet.

seg-eeb3c7d1f507 = Den <b>oberoende referensen</b> är en sluten AUC för den gaussiska detektionsstatistiken (nominell <c1/>, fel <c2/> ⇒ <c3/>) korskontrollerad mot den externt validerade <c4/> (validerad mot scikit-learn) och analytiska trösklar i <c5/>. <c6/>: den analytiska AUC stämmer med kända värden ({ "0.5" } vid μ={ "0" }, →{ "1" } för stort μ/σ, monoton); konfidensintervallet för empirisk bootstrap-AUC omsluter det slutna värdet; kvantövervakningen har högre AUC och ett mindre minsta detekterbart fel; fördelen försvinner för mycket stora fel (båda upptäcker perfekt — ingen universell marginal); katalogen har fem märkta klasser; avvägningen är internt ärlig.

seg-9dda4ab0647a = Detektion av fel/avvikelser för kvant-PNT

seg-cfa7a5c43d14 = <c1/>, <c2/>/<c3/>, <c4/>, <c5/>; <c6/>. <b>Oberoende referens: <c7/></b> — sluten gaussisk AUC korskontrollerad mot den externt validerade bootstrap-AUC i <c8/> (mot scikit-learn) och analytiska trösklar i <c9/>. Tester (<c10/>) som ovan. <b>Ärlig avgränsning:</b> detektionsstatistiken är en gaussisk modell, inte verklig telemetri; felkatalogen är märkt-syntetisk; brusnivåerna för kvant-/klassisk övervakning är illustrativa, från offentliga källor; modellerar <em>klassen</em> av avvikelsedetektion i kvant-PNT — verklig hårdvarutelemetri med referensetiketter är ett angivet gap till flygning; inget påstående om TRL/flygning/certifiering.

seg-24ad75143bed = Kontroll mot standarder — utbytesformat, länkbudget och integritet (kontroller mot externa oberoende referenser)

seg-9d31773e0ecd = Dessa standarder är validerade genom att återvinna <b>de ordagranna räkneexemplen / referensvärdena som publiceras i standarderna själva</b> (eller i en oberoende referensimplementation), inte genom Kshanas egen tur och retur. Att återvinna en standards eget exempel i bilagan är den starkaste tillgängliga formatkontrollen för en tolk av ett utbytesformat.

seg-7ec3d508c64f = Extern oberoende referens

seg-e06aa022e7e9 = <b>CCSDS OEM</b> (502.0-B Orbit Data Messages)

seg-65de0a1335d6 = <c1/>: <c2/> återvinner exakta epoker och tillståndsvektorerna X/Y/Z/Ẋ/Ẏ/Ż i KVN-exemplet för OEM i <b>CCSDS 502.0-B-3, bilaga G §G6, figur G-11</b> ("OEM Example with No Acceleration, No Covariance", s. G-10) — båda efemerissegmenten, inklusive källvärdena med inledande nollor (<c3/>). Fixturen <c4/> återges tecken för tecken från den officiella Blue Book (de redaktionella markörerna "< intervening data records omitted here >", som inte är giltiga OEM-poster, ingår inte).

seg-54cff1deebc7 = <b>CCSDS TDM</b> (503.0-B Tracking Data Message)

seg-a5c6b58e0053 = <c1/>: <c2/> återvinner alla { "41" } RANGE-poster (första { "3198.03679519614" } km, sista { "3270.46440460551" } km) och metadata i KVN-exemplet för TDM i <b>CCSDS 503.0-B-2, bilaga E, figur E-9</b> ("Range Data with TIMETAG_REF=TRANSMIT", s. E-9). Fixturen <c3/> är ordagrann från Blue Book. (Detta är den oberoende referensen från publicerad Blue Book vid sidan av den tidigare handskrivna tur-och-retur-kontrollen <c4/> i <c5/>.)

seg-c9a23ec7956b = <b>CCSDS { "133.0" }</b> (Space Packet Protocol)

seg-aaffd3d25c5f = <c1/>: kodaren återger testvektorerna på bytenivå för primärhuvudet i det oberoende <b>biblioteket <c2/></b> (us-irs/spacepackets-py, <c3/>) — t.ex. <c4/> och det helt maxade <c5/> — plus det kanoniska telemetrifallet (TM) med bara ettor, vart och ett skickat tur och retur genom avkodning. Bitfältens bredder/ordning enligt <b>CCSDS 133.0-B-2 §{ "4.1.3" }</b>.

seg-e48472df251a = <b>CCSDS { "401" } / DSN</b> (länkbudget, DSN 810-005)

seg-c6caa639e1c6 = <c1/>: kedjan FSPL (free-space path loss) och C/N₀ återger den publicerade designkontrolltabellen för telemetri i djuprymd i <b>J. H. Yuen (red.), <em>Deep Space Telecommunications Systems Engineering</em> (DESCANSO/JPL (DESCANSO: Deep Space Communications and Navigation Systems Center of Excellence) Pub. 82-76), tabell 1-1</b> — nedlänken för Galileo i X-band ({ "8420.43" } MHz) vid { "6.37" } AU: förlust i fri rymd <b>{ "290.54" } dB</b> (<{ "0.05" } dB) och mottagen <b>Pr/N₀ = { "54.6" } dB-Hz</b> (<{ "0.2" } dB). Bandcentra ligger inom allokeringarna för nedlänk i djuprymd enligt DSN/CCSDS-401 (DSN 810-005 modul { "201" }). <em>Standardparametrarna för uppdrag</em> förblir representativa (inte en kalibrerad transponder); det är <em>ekvationen</em> för länken som detta fastlåser.

seg-c2cee7d5c7b1 = GNSS-standarder — status för extern oberoende referens och de ärliga återstående gapen:

seg-d8f653b3c955 = Status och ärligt förbehåll

seg-fff735bd32a1 = <b>Kärna, geometri och skyddsnivån i ARAIM externt validerade.</b> Detektions<em>kärnan</em> — tröskeln för feldetektion med χ², icke-centraliteten för missad detektion med icke-central χ² och K-multiplikatorerna för normalfördelningen — återger <b>SciPy</b> (<c1/>, { "171" } fall, ≤ { "1e-6" } rel), och den omslutande geometrin återger <b>gnss_lib_py</b> (DOP). <em>Värdet</em> på skyddsnivån (PL) i ARAIM är nu också fastlåst: mot WG-C (WG: Working Group) ARAIM Reference ADD (Algorithm Description Document) v3.1 "LPV-200 (LPV: localizer performance with vertical guidance) numerical example" ger <c2/> / <c3/> VPL { "18.2926" } m mot { "18.3" } m, HPL { "13.4063" } m mot { "13.45" } m och σ_v,acc { "1.3694" } m mot { "1.3694" } m, inom referensens egen <c4/> = { "0.05" } m (typen <c5/>). Avgränsning: felmoder upp till en satellit eller en konstellation (<c6/>); delmängder av fel med flera händelser och exkludering är inte implementerade, och klassisk RAIM har fortfarande <b>ingen kanonisk publicerad testvektor från indata till HPL</b>. Se <a1><c7/></a1>.

seg-e6a47dfb7e54 = <b>Algoritmen för skyddsnivå är nu externt validerad.</b> Givet (el, az, σ) per satellit återger <c1/> i kshana <b>RTKLIB:s gaffel för SBAS-PL</b> (<c2/> <c3/>, Siki & Takács { "2017" }, "DO-229D Appendix J") — matad med det verktygets <b>egna</b> σ beräknat från <b>verkliga EGNOS</b>-utsändningsmeddelanden + verklig BUTE-RINEX — till <b>< { "2e-3" } m HPL</b> över { "6" } epoker (<c4/>); ESA gLAB { "v6.0.0" } (<c5/>) bekräftade identisk konvention. K-faktorerna (<c6/>, <c7/>, <c8/>) stämmer med DO-229E Appendix J. <b>Vad som är validerat och vad som inte är det:</b> detta fastlåser <em>algoritmen</em> för PL (σ in → HPL/VPL ut); den uppströms <em>modelleringen</em> av σ från råa UDRE/GIVE-meddelanden ligger utanför omfånget för kshana — det är där oberoende verktyg för <em>hela kedjan</em> fortfarande avviker med meter på verkliga data. K_V matchades vid referensens avrundade { "5.33" } (den exakta <c9/> i kshana → VPL ~{ "0.06" } % mindre; den vertikala är validerad utan K-faktor som <c10/>).

seg-4ef39e8ea75c = <b>Utsänd modell externt validerad.</b> Klobuchar-modellen för L1 återger <b>RTKLIB:s <c1/></b> (<c2/>, < { "1e-4" } m) — <em>paritet i implementation</em> med den de facto öppna referensen, eftersom inget officiellt exempel med <em>uppmätt referens</em> finns. Läsaren för TEC-kartor i IONEX finns nu (<c3/>, enhetstestad); det återstående gapet är en korskontroll av den mot en verklig GIM-produkt, inte den utsända modellen. Se raderna om Klobuchar i <a1>Påståenden kontra verklighet</a1>.

seg-fa3058dffb2a = GPS L1 C/A-spridningskod (IS-GPS-200)

seg-53ac231770fb = Kodgenerering validerad externt.

seg-04db7c613bd5 = <c1/> (<c2/>): C/A-kodgeneratorn med G1/G2-LFSR (linjärt återkopplat skiftregister) återger <b>de publicerade kodfasstilldelningarna i IS-GPS-200 tabell 3-Ia</b> — de första tio chipen i oktal form för PRN (pseudoslumpbrus) { "1" }–{ "9" } ({ "{" }{ "1440" }, { "1620" }, { "1710" }, { "1744" }, { "1133" }, { "1455" }, { "1131" }, { "1454" }, { "1626" }{ "}" }) — exakt. Det fäster <b>spridningskodens chipföljd</b> mot GPS-gränssnittsspecifikationen; de omgivande delarna för modulation, spektral separation och kodföljning med DLL (delay-locked loop) (<c3/>) förblir MODELLED.

seg-e5f1b960777a = Tidssynkronisering för nät, spektrum, solsystemet, konstellationer, kampanjer och LEO-PNT

seg-c5bf3b23d688 = Förmågorna som lades till i { "0.28" }-linjen graderas rad för rad i den genererade <a1><c1/></a1>; det här avsnittet sammanfattar vilka av dem som har en oberoende extern referens. En rad är VALIDATED endast med en oberoende extern referens; allt annat är MODELLED.

seg-d791a48b3895 = Förmåga (typ)

seg-d4779be2efd8 = Extern referens, eller varför den förblir modellerad

seg-0d7bb0fc1c5e = Telecom MTIE (maximalt tidsintervallfel) och TDEV (tidsavvikelse) på en holdover-serie (<c1/>)

seg-18894b55b6c1 = <c1/>: { "17" } averaging-faktorer för MTIE och { "12" } för TDEV på en incheckad holdover-serie från en chipskaleklocka med { "2" } 048 sampel mot allantools { "2024.06" }, till < { "1e-12" } / < { "1e-9" } relativt. ITU-T-maskernas (International Telecommunication Union Telecommunication Standardization Sector) utfall PASS/FAIL och förinställningarna för oscillatorer ur databladen förblir MODELLED. Se <a1><c2/></a1>.

seg-ff9cb967ae08 = Holdover-prediktion från en uppmätt klockregistrering (<c1/>)

seg-7821227795d8 = <c1/>: anpassning på den första tredjedelen av den verkliga 5071A-cesiumregistreringen, prediktion av tidpunkten för ettsigma-överträdelsen vid sex trösklar, mätning av den på de två undanhållna tredjedelarna; tröskel en faktor { "1.5" } åt vardera hållet, observerade kvoter { "0.84" } till { "1.03" }. Slot-guard-budgeten och positionsbestämningstakten som bygger på den förblir MODELLED.

seg-2667e3ddf829 = Slutna uttryck för spektrala effekttätheter i L-bandet och spektral separation (<c1/>)

seg-1a0c6ef49f98 = <c1/> slutna uttryck mot publicerade värden (matrisrad "Closed-form L-band signal power spectral densities…"). Vattenfallsdiagrammet med J/S (störare-till-signal-förhållande) per band och effektivt C/N0 (bärvåg-till-brus-täthet), samt SigMF-in- och utdata (Signal Metadata Format), förblir MODELLED.

seg-46278e9c03c1 = Planetpositioner från JPL:s (Jet Propulsion Laboratory) Standish-element, och ljustid mellan kroppar (<c1/>)

seg-43cfeb9f2403 = { "0.30" }, förhandsregistrerad mot JPL Horizons (DE441): <c1/> och <c2/>, RMS per planet och komponent högst värdet i Explanatory Supplement tabell { "8.10.1" } (sämst { "0.778" }), jordsplittringen och ICRF-rotationen inkluderade; <c3/>, ljustidslösaren på DE441-positioner inom { "1e-6" } s från Horizons ljustid (sämst { "6.7e-9" } s). Den tidigare jämförelsen med dubbel nominell tröskel (<c4/>), vars tröskel sattes efter den första jämförelsen, behålls som en icke-grindande regressionskontroll. Uranus/Neptunus från tabell { "1" }, Pluto, månarna, kroppskonstanterna och <c5/> förblir MODELLED.

seg-b96d8ea13c87 = Walker-geometri och de publicerade GPS-, Galileo- och GLONASS-positionerna (GLObal NAvigation Satellite System); global GPS-försämring av precision (<c1/>)

seg-85c293b8d235 = <c1/>: Walker 24/3/1 återger tabellen över Galileos definition för öppen tjänst till { "1e-9" }°, GLONASS gränssnittsspecifikationens positionsformel och GPS ekvatorspassager; GPS baslinje-HDOP-median { "0.940" } mot { "0.94" } i Standard Positioning Service-prestandastandarden. Godtyckliga täckningskartor för flera konstellationer runt valfri kropp förblir MODELLED.

seg-f0187be4b97f = Kampanjer: kedjade uppdrag, svep, Monte Carlo-ensembler, körningar med gemensamma villkor (<c1/>)

seg-b5c45fc12e5f = <c1/> ({ "11" } tester): en kampanj med en fas återger den fristående körningen byte för byte, ett svep med en nod läser samma tal, en ensemble med fast frö är bytestabil. Sammansättningsidentiteter, inte en oberoende extern referens.

seg-bc25d20125e7 = Länkfysik för LEO (låg omloppsbana): ITU-R-koefficienter för regn enligt P.838 (ITU Radiocommunication Sector), regndämpning och scintillation enligt P.618, byggnadsinträngningsförlust enligt P.2109, joniosfär av första ordningen, maximal Doppler

seg-b1f3bd37d169 = <c1/>, <c2/>: ITU-R-rekommendationernas egna tabeller och valideringsexemplen från Study Group { "3" } (incheckade med sin källa och sitt hämtningsdatum), gruppfördröjningskvoten i IS-GPS-200 för joniosfären och den publicerade tabellen över maximal Doppler av Leclere, Marathe och Reid (ION GNSS+ { "2025" }, arXiv { "2509.19551" }).

seg-492917f11386 = LEO-navigeringsmeddelande: användaralgoritmen för sändningsefemerid i Galileo ICD (gränssnittsspecifikation), CRC-24Q (24-bitars cyklisk redundanskontroll), globalt genomsnittliga SISRE-vikter (signal-in-space-avståndsfel) (<c1/>)

seg-514a7da01582 = <c1/>: Galileos användaralgoritm återger RTKLIB (ett programbibliotek med öppen källkod för kinematisk positionering i realtid) till { "1" } mm på fyra verkliga Galileo-sändningsefemerider; CRC-24Q ger katalogens kontrollvärde 0xCDE703 och kontrollbytena i RTCM-exempelramen (Radio Technical Commission for Maritime Services) { "1005" }; SISRE-vikterna återger den publicerade MEO/GEO-tabellen. Anpassaren, uppdateringen mitt i passet, den binära kodningen, text i RINEX-4-stil/CSV (kommaseparerade värden) och de valbara efemeridmodellerna förblir MODELLED.

seg-94bbcd43e03a = LEO-signalutformning, pass och länkbudget, Doppler och gemensam GNSS+LEO-positionsbestämning, PPP-konvergens (precis punktpositionering), positionsbestämning med 5G NTN (icke-terrestra nät), LEO-tidsöverföring (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>)

seg-4c37a8cfac87 = <c1/>, <c2/>: slutna uttryck, filterkonsistens (till exempel PPP-filtrets körningsmedelvärde av NEES inom sitt { "95" }-procentsband) och jämförelser med publicerade trender; inga fältdata.

seg-91cf4e399f0a = Ett LEO-PNT-system från början till slut (<c1/>)

seg-fb947da2e8b4 = <c1/>: varje vidareförd storhet är lika med uppströmssteget egen utdata, och en ändring av en uppströmsindata flyttar varje nedströms tal som beror på den.

seg-7e230aa73770 = LEO-resiliens och vertikaler (spoofing via Doppler och via konsistens mellan band, joniosfärsundersökning)

seg-ab2542cfc295 = <c1/> ({ "10" } tester). Resiliens- och vertikalscenarierna listas i <a1><c2/></a1>.

seg-2d3ead293658 = Utdata som är återgivningar, inte evidens, har tester men ingen matrisrad: utbytesexporterna (CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemerid (Systems Tool Kit), SigMF (Signal Metadata Format)), var och en inläst på nytt av en validerare skriven utifrån formatets specifikation (<c1/>, { "13" } tester; se <a1><c2/></a1>); animationerna (<c3/>: byteidentiska omkörningar, exakta bildrutsantal, välformad SVG (Scalable Vector Graphics), ingen extern adress i HTML-spelaren (HyperText Markup Language)); och körningsrapporten (<c4/>, <c5/>: varje medföljande scenario rapporterar utan tomt avsnitt eller platshållarvärde, etiketterna stämmer med matrisen, och det registrerade kommandot återger <c6/> och rapporten byte för byte).

seg-903e4e51dda1 = Driftområde

seg-e226ad523a3d = Varje paket körs över sitt angivna indataområde av <c1/>, som kontrollerar att varje numerisk utdata är ändlig (inget NaN/Inf (NaN: inte ett tal)) och begränsad. Tabellen listar det testade indataintervallet per paket, det förväntade utdatabeteendet och det täckande testet.

seg-8bd4f586f3c7 = Indata som sveps

seg-3ebc1201a545 = Testat intervall

seg-a1198518d667 = Förväntad utdata

seg-7bf563f5420a = Täckande test

seg-4906c027a805 = <c1/> (tidsspecifikation)

seg-d91e18ce3773 = { "1" } – { "500" } ns

seg-10cf765fdd75 = ändliga kvalitetsmått för holdover/tidssynkronisering/säkerhet

seg-fe640e9c3c1e = { "1e-7" } – { "1e-2" } m/s² (kallatom → enkel MEMS (mikroelektromekaniska system))

seg-456c32a126a2 = ändlig, begränsad positions-RMS/p95

seg-dae96fd3a01b = <c1/> (elevationsmask)

seg-a54c3c8933c6 = ändlig DOP/tillgänglighet; begränsad

seg-bf506e17cf81 = { "0.1" } – { "50" } ns/s

seg-b6d0d587046e = ändlig P_md / säkerhet, begränsad

seg-fda0b32d7784 = { "10" } – { "1000" } m

seg-132fdea2270f = ändlig holdover för tidssynkronisering/position

seg-c9099375b99f = bana (verklig)

seg-952b94eda0ff = verkliga Celestrak-TLE:er för <c1/>

seg-60009932477c = ögonblicksbild med 30 satelliter, strikt kontrollsumma

seg-deb16d50741e = läses bara in med giltiga kontrollsummor; begränsad geometri

seg-c46d726e35b3 = klocka (flicker)

seg-15939085bf3a = <c1/> på/av

seg-504a95f55b88 = { "0" } mot { "1e-12" }

seg-e1cce0c2028e = att aktivera 1/f-golvet <b>försämrar</b> glidet i tidssynkroniseringens p95

seg-bdd4e56bdef9 = fusion (realism)

seg-09af9dd78fe3 = <c1/> { "0" } mot { "5.88e-7" } m/s²

seg-0a6723be642c = noll mot realistiskt icke-noll

seg-a9eb04be2b9f = filtret konvergerar fortfarande, inom { "3" }× felet utan bias

seg-2a839953aa6a = Raderna för flicker-FM och fusionsbias täpper till två specifika realismluckor: brustermerna är <b>avstängda som standard men påverkar uppenbart utdata när de aktiveras</b>, och det gemensamma fusionsfiltret <b>är inte beroende av att biaser nollställs</b> — det konvergerar även med en realistisk kvarvarande bias av kallatomklass.

seg-4f0e9f9d4cdf = Kvant- och klassiska körningar använder nu oberoende RNG-frön (slumptalsgenerator) (klassiskt frö = frö + 0x9e3779b97f4a7c15) så att deras brusrealiseringar är okorrelerade — åtgärdat efter granskning.

seg-3b6b785f401a = <c1/> är segmentmedveten: avbrottstidslinjer delas upp i sammanhängande segment vid GNSS-återinfångning och det rapporterade värdet är det sämsta (kortaste) glidet över dem. Det begränsas fortfarande av tidsrasterns upplösning (en undre gräns).

seg-4a830113b13d = Omsynkronisering av ISL-tidsöverföring modellerar den kvarvarande länkosäkerheten som nytt nollmedelvärdigt jitter per mätsteg plus återförankring vid det konfigurerade intervallet.

seg-30c4d89aa433 = Påståenden kontra verklighet — snabbreferens

seg-27a22de7b8c0 = En fientlig granskares checklista. För varje term som kan läsas som mer än vad den är: vad Kshana gör i dag, och var den verkliga versionen ligger på färdplanen.

seg-759eb0cfafe4 = Term du kan se

seg-6a2d3691d642 = Vad det faktiskt är i dag

seg-bbd0145bfb95 = Vad det <b>inte</b> är (än)

seg-a6fdb038b003 = "hybrid kvant-/klassisk PNT-simulator"

seg-4421f8bd0967 = en klassisk stokastisk simulator driven av publicerade Allan-/brus-koefficienter för kvantsensorer

seg-3885661aafff = kvantfysik från första principer (Mach–Zehnder-fas, projektionsbrus, systematiska fel) — se <a1><c1/></a1>

seg-1d28debd0302 = "gemensam Kalman-fusion" / fusionspaket

seg-d13beba21ba7 = det körbara paketet <c1/> observerar klockan och positionen <b>separat</b> (en direkt tidsbestämning och en direkt positionsbestämning), för vilket den optimala estimatorn genuint är blockdiagonal — två tvåtillståndsfilter med ett gemensamt kvalitetsmått

seg-25c2fe6fa6d3 = ett <em>kopplat</em> filter för fallet med <b>pseudoavstånd</b> <b>finns</b> nu som <c1/> (4-tillstånds staplad <c2/>, icke-noll kovarians mellan block, NEES-validerad) men är <b>ännu inte kopplat till det körbara paketet</b>, och paketet är <b>1-DOF (en frihetsgrad)</b> — 3D-utökningen med 8 tillstånd är framtida arbete

seg-5cce1ca5b86f = Säkerhetskvalitetsmått (typen <c1/>)

seg-d55c30f63023 = <c1/> för en <b>stokastisk detektor för tidsspoofing</b>: ett tvåsidigt χ²₁-/Neyman–Pearson-test på en klockstödd övervakningsstatistika, tröskel satt från ett mål för <c2/>, <c3/> utvärderad <b>vid specifikationens storlek</b> både i sluten form och med Monte Carlo (vilka stämmer överens till några ×1/√N)

seg-dbf2039a4a8e = en RAIM/ARAIM-detektor för flera satelliter — se <a1><c1/></a1>; övervakningsstatistikan är en gaussisk modell med klockans σ härlett ur PSD, inte en korrelation på signalnivå

seg-32bcb801e49c = "klockstödd spoofing-detektering"

seg-58e4d22075e9 = en övervakare av tidsavvikelse för <b>en enda klocka</b> (gaussisk statistika, σ från klockans PSD), INTE RAIM över flera SV (SV: rymdfarkost, det vill säga en satellit)

seg-f3f6f95bc559 = RAIM över flera SV i avståndsdomänen med skyddsnivåer

seg-a5faedaab13e = spoofing-detektorns P_md (sluten form kontra Monte Carlo)

seg-0362489c341a = det analytiska <c2/> baserat på <c1/> och den empiriska skattningen med <c3/> försök stämmer överens inom stickprovsfel (≈ 1/√N); validerad i testerna <c4/> / <c5/> vid en belastad avvikelse (μ/σ = { "2" })

seg-8fa5c9468ff5 = en uppmätt ROC för detektorn mot registrerade spoofing-data

seg-8f895aa1c657 = pseudoavståndsmodellen <c1/>

seg-a5e5e1e7a0e9 = en <b>framåtsimulering</b>: <c1/>. Varje atmosfärsmodell är enhetstestad mot handräknade värden (ZHD (hydrostatisk zenitfördröjning) ≈ { "2.3" } m, Niell = { "1" } i zenit, Klobuchars snedhet), och hela Klobuchar-sändningsmodellen är <b>korskontrollerad mot RTKLIB:s referensimplementation <c2/></b> till under en millimeter (<c3/>, { "6.1278" } m för RTKLIB:s standardkoefficientfall — det finns ingen officiellt publicerad Klobuchar-testvektor, så detta är implementationslikhet, inte uppmätt referens); en <b>körning utan brus återger geometri + korrektioner till under en millimeter</b> (RAIM-residual ≈ { "0" })

seg-adc8a5d89cbd = en positions<b>lösning</b> från verkliga signaler (PPP/RTK (PPP: precis punktpositionering)), tvåfrekvent jonosfärsfri kombination eller upplösning av bärvågsfasens heltalsosäkerhet — inte modellerat

seg-a56533528c6e = jamming-modell (typen <c1/>)

seg-0a4a28fcd53a = en <b>länkbudget</b>-kedja: J/S från fritt rymdutbredningsbortfall + antennförstärkning per riktning → effektivt C/N₀ via anti-jam-ekvationen (avspridningsförstärkning × spektral separation <c1/>) → förlust av låsning vid en tröskel (Kaplan & Hegarty §{ "9.4" })

seg-b53e210487fb = flervägsutbredning, AGC-dynamik (automatisk förstärkningsreglering) i tid, själva förvärvssökningen (den valfria hysteresen i <c1/> är ett tröskelpar); den valfria kvantiserarförlusten i <c2/> gäller en gaussisk insignal och är inte giltig för en CW-jammer; den valfria gruppantennen <c3/> är smalbandig och ideal (ingen koppling eller felanpassning), och den valfria skuggningen i <c4/> är en enda knivsegg på en SRTM-ruta; <c5/> är en representativ konstant per typ, inte härledd ur jammerns uppmätta PSD

seg-523d66d56f97 = Integritetskvalitetsmått (klock-/holdover-paket)

seg-d0702ee52d37 = filtrets <b>självkonsistens</b> (andel av avbrottssamplen inom dess egen k·σ-gräns)

seg-b4b68065e521 = HPL/VPL, integritetsrisk / P_HMI, larmgränser, DO-229E/316/ED-259A — dessa redovisas separat av typen <c1/> (RAIM / ARAIM) och SBAS-funktionerna, och vävs aldrig in i detta kvalitetsmått

seg-d5b1f858f0e3 = äldre <c1/>-scenario<b>paketets</b> kvalitetsmått

seg-e9fe365d7318 = en <b>enaxlig (1-DOF)</b> felbudget för accelerometer/gyro (VRW/ARW, biasinstabilitet) med en referensåterställning

seg-604e8d96c2c2 = det <em>äldre</em> paketet är 1-DOF; <b>3-axelvägen levereras i paketet <c1/></b> (nästa rad)

seg-e2a4a1c47f2c = 3-axligt strapdown-<b>bibliotek</b> + <c1/>-<b>paket</b> (<c2/>, <c3/>)

seg-01e5672a37a4 = en verifierad kvaternion-/NED-navigator (NED: nord-öst-ned) med en deterministisk IMU-felmodell — <b>skalfaktor, felinriktning, g-känslighet, kvantisering, ramprate</b> modellerade (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }) — nu <b>driven av scenariopaketet <c1/></b> och <b>konfigurerbar per sensor från TOML (Tom's Obvious Minimal Language, scenarioformatet)</b> (<c2/>)

seg-acecd6b81859 = <b>inte modellerat:</b> vibrationsrektifieringsfel, temperaturgradientdrift. Felet vid fusionerat glid begränsas av ett golv från överlämningens attitydfel (lutning/accelerometerbias är svagt separerbara), så kalibrering per bias görs inte gällande

seg-6b04fc376c0d = "Hybrid PNT-integration" (paketet <c1/>)

seg-cd3125081b5c = öppen-loop-dödräkning inramad av GNSS-återställningar mot referens

seg-578c93c67ae7 = en kopplad (löst/tätt) GNSS–INS-Kalman-blandning — det är det separata paketet <c1/> (EKF) och typen <c2/>

seg-57f603da0331 = "Positioneringsprestanda" (klockpaket)

seg-278aafe7fadf = klockfasens <b>tidssynkroniserings</b>-RMS i ns (<c1/>)

seg-a6af364cbcdc = en noggrannhet i positionsdomänen med RMS/CEP/SEP/DOP-viktning (SEP: sfäriskt felsannolikt)

seg-b68c5a4363a5 = kvalitetsmått för tröghetsposition (<c1/>)

seg-850e030bb5e3 = en <b>enaxlig</b> positions-RMS/p95 i meter, från ett enda frö om inte <c1/> ber om en ensemble (då medelvärde, spridning och ett bootstrap-konfidensintervall på { "95" }% per mått)

seg-be77929afa2c = en fördelning av ensemble-CEP / 2DRMS (två gånger avståndets RMS) (färdplan: Monte Carlo-CEP)

seg-75f239679dc2 = "validerad till ~{ "2" }%"

seg-2d593a99a2b1 = en <em>typisk</em> observerad överensstämmelse; den <b>tillämpade gränsen är { "20" }–{ "25" }%</b> relativt fel

seg-34cfd0e08235 = en garanterad noggrannhetsgräns på { "2" }%

seg-d3402cc1ebd5 = "reproducerbar / bitidentisk"

seg-46ea210bcdad = bitidentisk omkörning på <b>samma OS (operativsystem) + fastlåst verktygskedja</b>; över Linux, macOS och Windows kontrollerar CI en incheckad SHA-256 av varje resultats indatafingeravtryck och form (<c1/>) samt de numeriska värdena till { "1e-6" } (<c2/>)

seg-38c6528122a8 = ett byteidentiskt fullständigt resultat över operativsystem (skillnader i libm i sista siffran)

seg-b0e21aea4ccd = SGP4 GPS-scenario (<c1/>)

seg-1131aa869f1d = en äkta ögonblicksbild av Celestrak <c1/> (2021-07-28, { "30" } satelliter, strikta kontrollsummor), varje satellit propagerad från sin egen TLE-epok

seg-21c2f1b5d7e2 = en aktuell konstellation — uppdatera ögonblicksbilden med <c1/> (se <a1><c2/></a1>); NORAD-katalognumren (North American Aerospace Defense Command) är de verkliga

seg-6948bd06c7e5 = Korskontroller mot artiklar om månens PNT (regressionsevidens, inte matrisrader)

seg-9ee0faf0b359 = Månsviten/cislunarsviten (förmågorna "Lunar & cislunar" och "Lunar PNT suite" i README) har sina påståenden i publicerade artiklar oberoende korskontrollerade i <c1/>, var och en mot en referens från en <em>annan</em> implementation:

seg-b4edbf832fe6 = <b>omloppsbaserat sändnings-/infångningsavtryck</b> mot <c1/> (Cephes Bessel J1);

seg-c856d319a46e = <b>DOP för ytfyrars geometri</b> mot en oberoende NumPy-lösning av <c1/>;

seg-33ee672d98d7 = <b>tillväxt av prediktionsfelet för UT1/EOP-persistens</b> mot en NumPy-omtolkning av samma ordagranna IERS-rader i <c1/>;

seg-9b6e59789117 = <b>familjen av plana avlägsna retrograda banor</b> mot NASA/JPL:s databas för periodiska banor i trekroppsproblemet;

seg-c77384abd1cc = <b>budget för RF-avståndsprecision</b> mot en referens från första principer.

seg-a451dbe09e10 = Fixturer och skript för referensgeneratorer finns under <c1/>. De stärker evidensen bakom förmågor som förblir <b>MODELLED</b> i den maskinkontrollerade matrisen (<c2/>); de är regressionskontroller, <b>inte</b> nya VALIDATED matrisrader, så de ändrar inte i sig antalet i den maskinkontrollerade matrisen. Det antalet upprepas inte här, eftersom en handskriven kopia av det glider isär: den aktuella fördelningen är den genererade rubriken i <a1><c3/></a1>, som <c4/> skriver från <c5/> och <c6/> fastlåser.

seg-a353a63661de = <s1>Föregående</s1>Interoperabilitetsexporter och -importer

seg-fdae3b73ab67 = <s1>Nästa</s1>Verifieringsmatris

seg-59c12422e6e7 = Tidvatten på geopotentialen (src/tides.rs)

seg-10f0b4616abe = Manövrar och banutformning (src/maneuver.rs)

seg-56cdbd59ce5d = Banbestämning (OD) (src/orbit_determination.rs, src/batch_ls.rs)

seg-3a2c69fcbb86 = Validering av kraftmodeller genom efemeridanpassning (src/precise_od.rs)

seg-05a25c6ef750 = Verkliga precisa banor från myndigheter (tests/agency_galileo.rs, tests/agency_swarm.rs, tests/agency_lro.rs)

seg-279f4619bc2d = Gravitationskarte-/alt-PNT-navigering (src/gravimeter.rs, src/mapmatch.rs, src/particle_filter.rs, src/altpnt/terrain.rs)

seg-7b512df70323 = INS-/IMU-felmodell — validering mot databladsvärden (src/inertial/)

seg-b385e665cfff = Rymdsond- och Mars-PNT — D0-grund (src/body.rs, src/mars_frame.rs, src/ephem_provider.rs, src/radiometric.rs, src/timescales.rs)

seg-5887e7e1a218 = Radiometriska observabler för djuprymden och CCSDS Tracking Data Message — D1 (src/radiometric.rs, src/ccsds_tdm.rs)

seg-a9cf84a14301 = Banbestämning med reducerad dynamik för djuprymden — D2 (src/deepspace_od.rs, src/clock_state.rs, src/mars_atmos.rs)

seg-dc406cb825db = PNT-scenario för djuprymden och fusion av enkelriktat + dubbelriktat — D3 (src/mars_pnt.rs, src/deepspace_od.rs)

seg-7784f9436dd2 = Månens koordinattid — relativistisk klockgång mellan jorden och månen (src/lunar_time.rs)

seg-8a34cb900611 = Geodetisk VLBI på månen — närfältsfördröjning för en jordbaslinje som observerar en månfyr (src/lunar_vlbi.rs)

seg-d47906a347b3 = Gemensam banbestämning och klockbestämning på månen med flera tekniker — simulerad återhämtning i sluten loop (src/lunar_combination.rs)

seg-17b9f0ae9dee = Realisering av referenssystem för månen — anpassning av ett Helmert-datum med 7 parametrar (src/lunar_frame_realise.rs)

seg-3cfffa3eeb79 = Servicevolym för månnavigering — DOP / täckning / tillgänglighet + generaliserad PL för ARAIM på månen (src/lunar_service.rs)

seg-d80bf3320a15 = Differentiell PNT på månen — avdrag av gemensam mod + residual som växer med baslinjen + skyddsnivåer för DGNSS (src/lunar_dpnt.rs)

seg-23c3d8a79acf = Interoperabilitetsexport för månen — LunaNet/IOAG-anpassad CCSDS OEM + KIF med formatkontroll via tur-och-retur (src/lunar_interop.rs)

seg-a697f4f424b8 = Representativitet för demonstrationen och register över luckor mot flygning (src/representativeness.rs)

seg-4c924153299d = Enhetlig evidens för avvägningen kvant kontra klassisk (src/qtrade.rs)

seg-bd1a5835c5db = Bibliotek med felmodeller för kvantenheter (src/quantum_devices.rs)

seg-6b1bb731f966 = Betrodd kvanttidssynkronisering — kedja från början till slut, säker spridning, anomali + avvägning (src/timetransfer_chain.rs)

seg-3332c6c1ae86 = GNSS-fri kvantnavigering (src/quantum_nav_od.rs)

seg-9b46a5add4ab = Fel-/anomalidetektering för kvant-PNT-system (src/quantum_faults.rs)
