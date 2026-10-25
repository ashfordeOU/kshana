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

seg-fc3443210358 = <c1/>, <c2/>: en Monte Carlo med frö (N = { "20,000" } epoker per geometri, σ = { "1.5" } m, ChaCha8-frö { "36" } + i) av <c3/> med enhetsvikter, löst från den sanna positionen, på de <b>{ "8" } geometrierna i <c4/></b> (de vars DOP är matchad mot gnss_lib_py), mot σ²·Q där Q är kovariansfaktorn för själva kärnan <c5/> (<c6/>, samma aritmetik). <b>Toleranser förhandsregistrerade</b> (incheckning e50c88d2, före den första körningen, enligt designanteckningen för geometrin i { "0.36" }, avsnitt { "5.2" }), var och en som ett antal standardfel: varianser för öst, nord, upp och klocka inom { "5" } %; RMS för H/V/P inom { "2.5" } %; korrelation öst–nord inom { "0.035" }; medelvärden inom { "5" } standardfel; andelen i { "95" } %-ellipsen horisontellt inom { "0.95" } ± { "0.0077" }. Första körningen: alla { "104" } kontroller godkänns (sämsta varians { "3.2" } %, RMS { "1.6" } %, korrelation { "0.012" }, medelvärde { "2.2" } standardfel, ellips { "0.0039" }). <b>Negativa kontroller</b> fallerar som de ska: fördubblad PDOP fallerar för varje geometri; fel som växer som 1/sin(elevation) mot den ovägda Q fallerar en variansk ontroll för varje geometri vars lägsta satellit ligger under { "20" }°. <b>Hur den hänger ihop med raden ovan:</b> den raden validerar dessa geometriers DOP mot gnss_lib_py; den här lägger till steget från de faktorerna till meter via motorns lösare. <b>En första, separat kontroll finns kvar bredvid</b> (<c7/>, <c8/>, körd före förhandsregistreringen och redovisad som sådan): fyra handvalda himlar (öppen, klustrad, kanjon, halv himmel; σ { "1" } m) med chi-kvadrat-konfidensintervall på { "1e-6" } totalt över { "20" } kontroller; kvoter { "0.987" } till { "1.009" }, och dess egna negativa kontroller (ett DOP-fel på { "10" } %, fel som 1/sin(elevation)) fallerar som de ska. <b>Varför MODELLED:</b> ingen extern datamängd; den visar inte att en verklig mottagares fel följer modellen, och σ_UERE är en indata.

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

seg-1fcc7553c627 = <c1/>: RK4 integrerar <c2/> till < { "1e-9" }, visar ~{ "16" }× lägre fel per halverat steg (konvergens av fjärde ordningen) och bevarar den harmoniska oscillatorn över en period. Det inbäddade felmåttet för DP5({ "4" }) är <b>O(h⁵)</b> (att halvera steget skär det ~{ "32" }×), integrerar oscillatorn över { "50" } perioder med energin bevarad inom < { "1e-6" }, och når samma slutpunkt vid samma tolerans med <b>färre funktionsanrop</b> än stegdubbling; <c3/> klarar samma gräns för Kepler under en meter och stämmer med RK4-vägen inom < { "1" } m på en J2..J6-bana. <b>DOP853</b> (<c4/>): Hairers par { "8" }({ "5,3" }) med tät utdata återger SciPy { "1.18.1" }:s DOP853 steg för steg (enskilt steg inom { "5.6e-15" }; identiskt antal steg i körningarna med e = { "0.7" } och Arenstorf, ett byte mellan accepterat/avvisat på { "501" } steg i LEO-körningen; sluttillstånd inom { "1.6e-12" }) och stämmer med den exakta lösningen för Kepler lika nära som SciPy gör (<c5/>).

seg-345ae1eb05ec = Zonalt harmoniskt fält J2–J6

seg-a88e67186e69 = <c1/>: <c2/> kontrolleras på tre sätt – den <b>reduceras till den med 666 vektorer validerade <c3/> till maskinprecision</b> när den begränsas till <c4/>; den <b>stämmer med den numeriska gradienten av sin egen zonala potential</b> genom hela fältet J2..J6 (guldstandarden för konservativa fält); och de udda termerna <c5/> mot de jämna <c6/>/<c7/> visar den karakteristiska (anti)symmetrin mellan nord och syd under <c8/>. En propagerad bana med J2..J6 bevarar totalenergin till ~{ "1e-8" } över ett dygn.

seg-5536986d9c8f = Gravitation från tredje kropp (sol och måne)

seg-04388d03e696 = <c1/> + <c2/>: <c3/> <b>stämmer med den exakta gradienten av sin störningspotential</b>, försvinner i geocentrum och når läroböckernas storleksordningar i LEO (~{ "5e-7" } m/s² sol, ~{ "1.1e-6" } m/s² måne). Solens lågprecisionsefemerid enligt Montenbruck–Gill når handhärledda ankarpunkter i J2000 (perihelavstånd ≈ { "1.471e11" } m, ~−{ "23" }° deklination vid solstånd, ~{ "1" }°/dygn rörelse); månens efemerid håller sig inom sitt hölje mellan perigeum och apogeum, återvinner medelavståndet ~{ "384 400" } km, överstiger aldrig inklinationen { "5.3" }° och återvänder till inom { "1" }° efter en siderisk månad. Kopplingen av högerledet (RHS) som drivs av epoken är <b>bitexakt</b> (RHS-termen är lika med <c4/> vid den samplade positionen vid t = { "0" } och t = { "1" } dygn), och ett epokskifte på ett kvartsår ger en annan bana.

seg-9c8756f9d534 = Strålningstryck från solen (SRP) + konisk skugga

seg-e6110e015204 = <c1/>: <c2/> (kanonkula <c3/>) är <b>bitidentisk</b> med det slutna uttrycket i fullt solljus, fäster <b>strålningstrycket vid 1 AU (AU: astronomisk enhet) till ≈ { "4.5398e-6" } N/m²</b>, ligger i LEO-bandet ~{ "1.36e-7" } m/s² med riktning bort från solen, minskar till en fjärdedel när avståndet till solen fördubblas (omvänd kvadrat) och är <b>exakt noll</b> djupt i umbran. <c4/> ger <c5/> i fullt solljus och <c6/> i total umbra (exakt), med en mjuk monoton penumbra som stiger { "0" } → { "1" } över bandet <c7/> som <b>sträcker sig bortom umbracylindern</b>.
