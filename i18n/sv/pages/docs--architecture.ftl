# docs--architecture: translations (sv)

seg-e366c6dd500e = Källa: <c1/>

seg-1f25b7fa1187 = Kshana — Arkitektur

seg-b0136a82669c = Kshana är <b>en motor</b> organiserad i lager över en gemensam kärna: <b>sensorpaketen</b> (klocka, tröghet, tidsöverföring, hybrid); ett lager för <b>astrodynamik och numerik</b> (analytisk SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), en numerisk Cowell-propagator med sin kraftmodell med sju störningar, manöverutformning, banbestämning ur avstånd från markstationer och anpassning av kraftmodellen mot precisa efemerider från rymdorganisationer); ett lager för <b>tid och referenssystem</b> (IERS (International Earth Rotation and Reference Systems Service) tidsskalor, IAU (International Astronomical Union) 2006/2000A precession–nutation och reduktionen GCRS↔ITRS via CIO (Celestial Intermediate Origin) (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); ett <b>fusions</b>lager (GNSS/INS-skattarna (GNSS: global navigation satellite system; INS: inertial navigation system)); samt lagren för <b>integritet, resiliens, alt-PNT (PNT: positioning, navigation and timing) och lunar</b> (RAIM/ARAIM/SBAS (RAIM: receiver autonomous integrity monitoring; ARAIM: advanced receiver autonomous integrity monitoring; SBAS: satellite-based augmentation system), jamming och spoofingdetektering i flera lager, kartmatchning av gravitation, terräng och magnetfält, samt cislunar PNT); och de nyare lagren <b>LEO-PNT</b> (PNT i låg omloppsbana), <b>spektrum</b>, <b>solsystem och konstellationsutformning</b>, <b>nätverkstidssynkronisering</b> och <b>kampanj</b>, med de rapport-, animerings- och interoperabilitetsskrivare som varje körning kan använda (§1d). Genom alla dessa vet motorn ingenting om "kvant" kontra "klassiskt": den driver sensorernas <em>felmodeller</em> genom ett GNSS-avbrottsscenario, kör en skattare och poängsätter utfallet. En kvantenhet och en klassisk enhet jämförs därför på samma scenario och skiljer sig endast åt i sina (publicerade, citerade) felparametrar och sina oberoende brusfrön.

seg-02110864419e = Det här dokumentet samlar de strukturella och beteendemässiga diagrammen. §{ "1" } är sensorpaketens kärna; §1a kartlägger de lager för astrodynamik, fusion och alt-PNT som lagts till sedan dess; §1b–§1d lagren för studier, domäner och utdata. För användning se <a1>README</a1>; för vad som är och inte är validerat se <a2>VALIDATION</a2>; för tabellen över mognad per förmåga se <a3>CAPABILITY</a3>.

seg-7bcc7b5cd049 = Förkortningar som används i diagrammen och inte skrivs ut där de förekommer: ADEV, Allan-avvikelse; BW, bandbredd; CAI, kallatominterferometer; CZML, Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, RTCA:s (Radio Technical Commission for Aeronautics) mottagarstandard för SBAS; EKF, utökat Kalmanfilter; FM, frekvensmodulering; GSE, markstödsutrustning; HPL/VPL, horisontell/vertikal protektionsnivå; IMU, tröghetsmätenhet; IOAG, Interagency Operations Advisory Group; IQ, sampel i fas och kvadratur; ISL, länk mellan satelliter; ITU-T, standardiseringssektorn för telekommunikation inom Internationella teleunionen; J2–J6, jordens zonala gravitationsharmoniker av grad { "2" } till { "6" }; KIF, Kshana Interchange Format; KML, Keyhole Markup Language; KPI, nyckeltal för prestanda; L1/L5, GNSS-bärvågsband (L2 för CR3BP-haloomloppsbanorna är i stället Jord–Måne-Lagrangepunkten { "2" }); LEO, låg omloppsbana; LOO, leave-one-out; LTC, koordinerad månatid; MEO, medelhög jordbana; MTIE, maximalt tidsintervallfel; N2, Hill-mångfaldstalet av ordning 2; NED, nord-ost-ned; NTN, icke-jordbundet nätverk; OD, banbestämning; OPS-SAT, Europeiska rymdorganisationens satellit för programvarulaboratorium i omloppsbana; PPP, precis punktpositionering; PSD, effekttäthetsspektrum; PVT, position, hastighet och tid; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), Runge–Kutta-integratorer av fjärde ordningen respektive inbäddad femte(fjärde) ordningen; SH, sfärisk harmonik; SigMF, Signal Metadata Format; SIR, sampling importance resampling; SRIF, kvadratrotsinformationsfilter; SRP, solstrålningstryck; SSC, spektral separationskoefficient; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, tidsavvikelse; TDM, CCSDS:s (Consultative Committee for Space Data Systems) Tracking Data Message; TLE, tvåradig elementsats; TPL, Timing Protection Level; UBX, u-blox binära protokoll; UHF, ultrahög frekvens; VLBI, interferometri med mycket lång baslinje; VRW / ARW, slumpvandring i hastighet / vinkel; WASM, WebAssembly.

seg-a87f668a8f97 = { "1" }. Modulstruktur

seg-0388999448a6 = CLI (kommandoradsgränssnittet) och båda bindningarna leds genom en enda ingångspunkt <c1/>, så att de aldrig glider isär. Paketen återanvänder den gemensamma kärnan (<c2/>, <c3/>, <c4/>); paket { "4" } (<c5/>) sätter samman modellerna och skattarna från paketen { "1" }–{ "3" } i stället för att implementera dem på nytt; <c6/> härleder en GNSS-tidslinje ur geometri som sedan matar körningen av paket { "1" }. Modulen <c7/> ligger på signalnivå mellan länkbudgeten och mätdomänen: den härleder den spektrala separationskoefficienten <c8/> ur de faktiska spektra för signal och jammer, utifrån vilken <c9/> nu beräknar sin anti-jam-<c10/> i stället för att ta en representativ konstant (korskontrollerat i CI (kontinuerlig integration)); den bär också avvägningen för utformning av avståndskoder (m-sekvens/Gold).

seg-cee4eb61a8e9 = Tre ytterligare moduler utgör ryggraden för <b>resiliens vid GNSS-nekning</b>. <c1/> besvarar den operativa frågan direkt — <em>hur länge kan den här klockan gå fritt innan tidsfelet överskrider budgeten?</em> — genom att exponera van-Loans slutna form för felet vid fritt lopp som en inversion från holdover till tröskel, korskontrollerad mot den flerstegiga kovariansrekursionen i <c2/>. Dess tröghetsmotsvarighet finns i <c3/> (<c4/>), som sätter samman vitbrusdriften hos kallatominterferometern med bias- och skalfaktorfel till en budget för positionsdrift under holdover (biastermen korskontrollerad mot den oberoende integratorn <c5/>). <c6/> renderar hela motorns matris från krav till modul till test till oberoende referens till status, med enhetstestade invarianter som förbjuder en etikett <em>validated</em> utan en oberoende extern referens — så att påståendet om säkerställande inte kan glida ifrån koden.

seg-c7bee352c04d = 1a. Lager för astrodynamik, fusion och alt-PNT

seg-99c44e3a86d5 = Utöver sensorpaketens kärna delar tre delsystem samma gemensamma kärna och matar (eller matas av) <c1/>. Lagret för <b>astrodynamik och numerik</b> lägger till en icke-analytisk Cowell-propagator bredvid den analytiska SGP4/SDP4-vägen; <b>fusions</b>lagret bär GNSS/INS-skattarna; och lagret för <b>alt-PNT</b> är kartmatchning av gravitation vid GPS-nekning (GPS: Global Positioning System). Det här är bibliotek- och scenarioförmågor (se <a1>CAPABILITY</a1> för vilka som är kopplade till en scenariotyp <c2/> kontra nåbara som ett Rust-API (application programming interface)).

seg-69f93294d2c8 = Den numeriska propagatorns kraftermer är avstängda som standard, så att aktivera dem stör aldrig de utgivna facitfilerna. Den tätt kopplade UKF:en (unscented Kalman filter) med 17 tillstånd låter ett GNSS-avbrott löpa på den härledda hastighetsslumpvandringen hos den kvantbaserade CAI-accelerometern; banbestämning återanvänder samma <c1/>/<c2/> för att propagera ett kandidattillstånd över spårningsbågen.

seg-bd87e20c284b = Samma gemensamma kärna bär också fyra ytterligare delsystem som inte ritats ovan (deras paket förekommer i dispatchen i §{ "4" }): ett lager för <b>tid och referenssystem</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) som reducerar TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) och matar paketet <c8/>/markspår; ett lager för <b>integritet</b> (<c9/>, <c10/>) för RAIM/ARAIM/SBAS; ett lager för <b>resiliens</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) för jamming och spoofingdetektering i flera lager, med ett lager för <b>navigeringssignal</b> (<c16/>) på signalnivå — effekttäthetsspektra för BPSK-R (BPSK: binary phase-shift keying) / sinus-BOC (BOC: binary offset carrier), den spektrala separationskoefficienten <c17/> som nu härleder <c18/>:s anti-jam-<c19/>, RMS-bandbredden (Gabor) för avståndsmätning, den koherenta kodföljningsjittern i early–late-DLL (delay-locked loop) och flervägsfelets hölje (analys av signalprestanda, <b>inte</b> utformning av hårdvara för RF-nyttolast (RF: radiofrekvens) eller antenn — en nyttolastpartners roll); och ett lager för <b>lunar / cislunar</b> (<c20/>, <c21/>, <c22/>, <c23/>) för CR3BP-dynamik (circular restricted three-body problem) — inklusive tillståndsövergångsmatrisen { "6" }×{ "6" } och en differentiell korrigerare med enkel skjutning (<c24/>, <c25/>, <c26/>) som ger genuint periodiska halo-/NRHO-banor (NRHO: near-rectilinear halo orbit), och återger den publicerade södra L2-NRHO { "9" }:{ "2" } (Gateway-banan) vid period ≈ { "6.57" } d / perilun ≈ { "3,250" } km (publicerat ≈ { "6.56" } d / ≈ { "3,370" } km); den selenocentriska transformen MCI/MCMF (MCI: Moon-centred inertial; MCMF: Moon-centred, Moon-fixed) av en korrigerad bana och familjekontinuering återstår som uppföljning, och NRHO är en CR3BP-lösning (cirkulär, utan Solen), inte validerad mot en verklig efemerid för LANS/Gateway (LANS: Lunar Augmented Navigation Service) — och LunaNet-integritet. Anpassningen av kraftmodellen mot efemerider från rymdorganisationer (<c27/>, <c28/>, <c29/>, <c30/>) och hela fältuppsättningen för alt-PNT (<c31/>, <c32/>, <c33/>) fullbordar modullistan; se <a1>CAPABILITY</a1> för mognad per modul.

seg-05f8c8c84d15 = 1b. Resiliensstudier, utvärdering av maskininlärning och reproducerbara artefakter

seg-7350971daf4e = Fem ytterligare modulgrupper utgör det <b>öppna, reproducerbara studielagret</b> bakom projektets forskningsartiklar. Till skillnad från scenariots <c1/> nås de som generatorer av typen <c2/> / <c3/> som skriver <b>bytedeterministiska</b> artefakter (fasta frön, registrerad motorversion + konfigurationshash). Alla är <b>MODELLED</b> (syntetisk eller kalibrering mot offentlig datamängd) och bär ärliga valideringsetiketter — ingen av dem är en certifiering.

seg-86b177166f0e = <b><c1/></b> — den villkorliga Timing Protection Level: en holdover-begränsad gräns för det <em>oupptäckta</em> tidsfelet under spoofing, som sätter samman ett k-σ-golv för övervakaren, van-Loan-variansen vid fritt lopp över detektionsfördröjningen och en CUSUM (cumulative sum) för tid till larm; kalibrerad på en verklig inspelad spoofing (JammerTest { "2024" }). Det finns ingen ändlig <em>ovillkorlig</em> gräns — TPL är villkorlig av att en oberoende korskontroll upptäcker angreppet.

seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — studien av optimismglappet vid RF-störningar: ett märkt syntetiskt korpus och en detektoragnostisk ROC/AUC-ram (ROC: receiver operating characteristic; AUC: area under the curve), en panel med 13 detektorer (energi/AGC/SQM/paritet (AGC: automatic gain control; SQM: signal-quality monitoring) plus detektorer med seedad logistisk regression och MLP med ett dolt lager (MLP: multi-layer perceptron)), skalningslagar inom och utanför fördelningen med en permutationsnollhypotes, samt en leave-one-out-prediktor för försämring utanför fördelningen. Utvärderingsmåtten är validerade bit för bit mot scikit-learn.

seg-36206681024f = <b><c1/> / <c2/></b> — en front end för mjukvarudefinierad mottagare (rå IQ/IF (IQ: i fas och kvadratur; IF: mellanfrekvens) → korrelatorns early/prompt/late-uttag → SQM) och inläsningsadaptrar (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) som låter samma detektorer köras över inspelningar som tillhandahålls lokalt; inga datamängder checkas in i förrådet.

seg-fefd78868fc2 = <b><c1/> / <c2/></b> — korsningskartan för resiliens mellan kvant och klassiskt under parameterosäkerhet, och avvägningen för holdover-nytta med uppmätt ADEV; de numeriska kärnorna i avvägningen är validerade mot scipy.

seg-5749f1300772 = 1c. Lager för integritet, GNSS, djup rymd, lunar och uppdrag

seg-f44755d6d921 = De återstående domänerna kopplas in i samma <c1/>-dispatch och återanvänder den gemensamma kärnan, referenssystemen och geometrin. Allt här är <b>MODELLED</b> om inte en rad i <c2/>-matrisen hänvisar till en extern oberoende referens (RAIM-kärnan mot SciPy, SBAS mot RTKLIB-grenen (ett öppet bibliotek för kinematisk positionering i realtid), DOP-kärnan (dilution of precision) i gnss_lib_py, OPS-SAT-utvärderingen, protektionsnivåkärnan för lunar ARAIM, konsistensen mellan leverantörers lunar efemerid) — resten av lunar-sviten och kvantdemonstratorn är modellerade, illustrativa, bygger på offentliga källor och bär inget påstående om TRL (technology readiness level), arv eller stöd från någon rymdorganisation.

seg-044940c8d052 = 1d. LEO-PNT, spektrum, solsystem, nätverkstidssynkronisering, kampanjer och utdata

seg-253a26d9cc5d = De nyaste lagren följer samma mönster: var och en är en eller flera scenariotyper <c1/> som dispatchas från <c2/>, byggda på den gemensamma kärnan, och MODELLED om inte en matrisrad anger en extern oberoende referens.

seg-e47cccd54da3 = Detaljerna per typ finns i <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> och <a13>INTEROP</a13>.

seg-d04b21c7cb6c = 1e. Lager för mottagarförtroende, evidens, telemetri, träning och compliance ({ "0.35" })

seg-84ee122959b4 = Dessa lager läser en mottagares egen logg eller skriver filer för andra verktyg; inget av dem syntetiserar eller sänder en radiofrekvenssignal. De ligger vid sidan av <c1/> snarare än under scenariotyperna, bortsett från <c2/> självt, som är en scenariotyp. Alla är MODELLED om inte en matrisrad anger en extern oberoende referens, och de maritima utdata är rådgivande, inte typgodkänd navigationsutrustning.

seg-aab745a65e76 = Modul

seg-9d17ad3e87c8 = Dokumenterad i

seg-920b6b14c0e2 = poängsätter en mottagarlogg epok för epok med förtroendeövervakarna; en fartygsplattform lägger till de maritima övervakarna och poängen 0–100 med skäl

seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

seg-c311dfc2a161 = samma poängsättning på en ström allteftersom den anländer (stdin, en fil som får tillägg, TCP eller UDP), meningen <c1/> och den valfria gaten; <c2/> är hela mekanismen utan någon in- eller utmatning

seg-07b2d6edf7b9 = ett signerat, hashkedjat paket med ett loggfönster, dess konfiguration och motorns resultat, verifierbart offline; valfri tidsstämpeltoken enligt RFC { "3161" }

seg-32d08730b9c0 = förtroendeströmmen som Prometheus-mått, syslog-händelser (CEF eller LEEF) och valfri OpenTelemetry (funktionen <c1/>, avstängd som standard)

seg-53311b8c3b93 = syntetisk NMEA { "0183" } från brygga med skriptade händelser för jamming, drag-off, tidsspoofing och replay samt en instruktörslogg, för besättningsträning (endast text)

seg-f7cc3cfbdfc6 = sammanställda kartor över försämrad navigering från öppet licensierade rapporter från flygplan och fartyg, samt en rutts exponering för dem; endast lokala filer

seg-83fe3c87e2d5 = en verifierare på mottagarsidan för Galileo OSNMA: läser I/NAV-sidor (vanliga sidor, vektor-CSV, en UBX-ström), kontrollerar den signerade nyckeln, TESLA-kedjan och MAC-värdena och rapporterar per satellit om navigeringsdatan är autentiserad; <c1/> är den enda väg som kommandoraden, Python och WebAssembly delar; endast autentiseringsstatus, ingen integritetstjänst

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = kopplar utdata från { -brand } till offentliga ramverk för resiliens och fyller i kopplingen utifrån resultatdokument; <c1/> och <c2/> tar emot texter, inte sökvägar

seg-e16c483479ce = ett scenarios fordonsrörelse och händelser som en rörelse-CSV, NMEA, waypoint-text och händelsefiler för en GNSS-simulator i laboratorium; ingen signal skrivs

seg-044c58c98397 = Integrationer för båtar (Signal K-pluginet, OpenCPN i gate-läge och referensbygget) anropar kommandoradsverktyget; se <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Motorns pipeline (per körning)

seg-53e9e596ca44 = Varje körning stegar en enskild sensormodell genom tidsrastret. Den styrs så länge GNSS är nominellt och får gå fritt (holdover / dödräkning) under avbrottet.

seg-257407f3c375 = Ett scenario kör den här pipelinen två gånger, en gång för kvantsensorn och en gång för den klassiska sensorn, med <b>oberoende frön</b> (<c1/>) så att de två brusrealiseringarna är okorrelerade.

seg-4659e89ba5f5 = { "3" }. Felmodellens gränssnitt (förlängningspunkten)

seg-7b70e8b1b98a = Varje sensor implementerar samma idé: ett objekt med tillstånd vars <c1/> för sitt inre stokastiska fel framåt och vars ackumulerade tillstånd läses ut vid varje tick. Klockor visar ackumulerad fas, accelerometrar visar dubbelintegrerad position och länkar visar jitter per mätning.

seg-79ab76c6dbc0 = <c1/> följer med in i resultatet så att varje siffra i utdata kan spåras till den publicerade källa som anges i <c2/>.

seg-514c49659947 = Vid sidan av den analytiska <c1/> kör klockpaketet ett Kalman-filter med två tillstånd (fas, frekvens) (<c2/>) vars processbrus motsvarar referensmodellen. När filtret glider genom ett avbrott växer dess fasfelsvarians till exakt <c3/>, den analytiska holdover-relationen, och dess 1-σ-gräns online används för att fylla måttet <b>integritet</b> (andelen avbrottsprov vars fel håller sig inom k-σ-gränsen).

seg-7404589deb40 = { "4" }. Dispatch (CLI och bindningar)

seg-6138513a43f7 = <c1/> är den enda ingången: den kikar på <c2/> på översta nivån, deserialiserar det matchande scenariot, kör paketet och returnerar <c3/> (<c4/> finns bara för de typer som publicerar en reproducerbarhetstabell). CLI:t skriver dessa till filer, tillsammans med rapporten (<c5/>, <c6/>) och eventuell utdata från <c7/> / <c8/>. Python- och WebAssembly-bindningarna returnerar dem till värden. En dispatch, ingen avvikelse.

seg-524f749be364 = Dispatch sker på en typad enum <c1/> som matchas uttömmande (se nästa underavsnitt), så att tillägg av ett paket är en ändring som kontrolleras vid kompilering. Ett saknat <c2/> faller tillbaka på paketet <c3/>, så att befintliga scenarier av en enda typ deserialiseras oförändrade (<c4/> ignorerar fältet <c5/> i varje scenariostruct). Ett okänt <c6/> avvisas med <c7/>, som anger den närmaste inbyggda typen när namnet ser ut som ett skrivfel.

seg-eedaeae2a7e7 = Typad dispatch och det strukturerade API:et

seg-ca47f566eaee = Dispatch sker på en typad enum <c1/>, inte på en rå strängmatchning: <c2/> översätter fältet <c3/> till en variant, och dispatchern matchar på den uttömmande. Tillägg av ett paket är en ändring som kontrolleras vid kompilering, inte ett strängfel. Två typade gränssnitt finns vid sidan av <c4/>, som returnerar en sträng (kvar för CLI:t och befintliga bindningar):

seg-167c47049329 = <b><c1/></b>: den typade ingången, med en strukturerad felindelning (<c2/>, <c3/>, <c4/>, <c5/>). Varje fel har en stabil <c6/> så att en anropare kan grena på felkategorin i stället för att tolka meddelandet. Bindningarna exponerar detta som <c7/>.

seg-1943051b3b20 = <b><c1/></b> (och <c2/>, som i bindningarna exponeras som <c3/>): programmatisk introspektion med varje typs namn, beskrivning samt obligatoriska och valfria fält, för automatisk komplettering i användargränssnitt (UI) och notebooks.

seg-630243592256 = Att utöka { -brand } med ett externt paket

seg-d1adedd2c08b = Ett tredjepartspaket implementerar två små, semver-stabila traits från <c1/>:

seg-d01471b13324 = <c1/> har också en standardmetod <c2/>, som inte gör något om inte ett paket väljer registrets dispatch-söm i <c3/>. Det inbyggda paketet <c4/> kopplas in via <c5/> som genomgånget exempel. Paket utanför trädet följer samma kontrakt utan att forka kärnan (efter förebild från förlängningspunkten <c6/> i §{ "3" }, som den privata resiliens-overlayen använder).

seg-5b0449d96bc3 = { -brand } har därför <b>två stabila förlängningssömmar</b>: lägg till en <em>sensor</em> genom att implementera <c1/> (§{ "3" }), eller lägg till en hel <em>scenariotyp</em> genom att implementera <c2/> + <c3/>. Båda är semver-stabila och ingen kräver en fork av kärnan:

seg-3928a007756b = { "5" }. Den hybrida slutprodukten

seg-7f38e825519a = Det hybrida paketet kör en <em>svit</em> (en klocka + en tröghetssensor) och kräver att <b>både</b> tidssynkronisering och position håller sig inom specifikation. <c1/> är tiden tills någon av dem överskrids. Eventuellt synkar en optisk länk mellan satelliter om <b>klockan</b> under avbrottet, men bara som tidsstöd: positionen synkas inte om, eftersom tidsöverföring ger tid, inte position. Det är detta som gör tröghetssensorn till den begränsande faktorn.

seg-17a8683f0982 = { "6" }. GNSS-tillgänglighet härledd ur geometri

seg-afdb141ac367 = <c1/> är ett deterministiskt geometrilager utan beroenden. En <c2/> är antingen den analytiska keplerska <c3/> (tvåkropps, valfritt med sekulär J2) eller en fullständig <c4/>-propagator byggd från en komplett tvåradig elementmängd. En Walker-delta-generator skapar syntetiska konstellationer, och siktlinjens synlighet = jordens ockultation + elevationsmask. Antalet synliga satelliter avbildas på ett GNSS-tillstånd (≥{ "4" } = nominellt, { "1" }–{ "3" } = försämrat, { "0" } = nekat), och <c5/> gör om detta till den tillgänglighetstidslinje som driver den vanliga körningen av klockans holdover. Tillgängligheten är alltså <em>härledd ur geometri</em> i stället för handskriven, medan körningen, estimatorn och poängsättningen förblir oförändrade.

seg-da82c97ac5c8 = En konstellation som anges som fullständiga TLE:er propageras med SGP4/SDP4-modellen i <c1/> (VALIDATED mot AIAA (American Institute of Aeronautics and Astronautics) 2006-6753-vektorerna). Element med endast rad 2 behåller den analytiska tvåkroppsvägen. De två kan blandas inom ett och samma konstellationsblock.

seg-a47031620b54 = { "7" }. Bindningar

seg-57fb29fdd9d9 = Kärnan kompileras oförändrad till inbyggd kod, till ett Python-tillägg och till WebAssembly. Modulerna för Python (<c1/>, PyO3 abi3) och WebAssembly (<c2/>, wasm-bindgen) är valfria beroenden som styrs av funktionsflaggor (<c3/> / <c4/>): standardbygget och testsviten kompilerar dem aldrig, medan beroendegranskningen (<c5/>) däremot inspekterar deras beroendeträd, eftersom dessa crates levereras inuti wheel-paketet och npm-paketet. Båda anropar <c6/>, så varje yta returnerar identiska resultat. WebAssembly-modulen ligger bakom webbläsarens lekplats i <c7/> och exporterar tretton funktioner: <c8/>, <c9/> (en motorkörning som returnerar resultat, diagram, sammanfattning och tabell tillsammans), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, kodeken <c16/> / <c17/> för delbara webbadresser (URL: webbadress) och de tre exportfunktionerna <c18/> / <c19/> / <c20/> som ligger bakom lekplatsens exportmeny. Två ytterligare ingångar når samma <c21/>: <b>MCP-servern (Model Context Protocol)</b> (<c22/>, en <c23/>-crate utanför workspace som exponerar femton verktyg: <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; de två exempelverktygen läser de medföljande scenarierna via bibliotekets funktion <c39/>, som är avstängd som standard och som bara den här servern slår på) och <b>JetBrains IDE-pluginet (integrerad utvecklingsmiljö)</b> (<c40/>, ett Kotlin-projekt som anropar CLI:t <c41/> i stället för att länka biblioteket).

seg-a6620e0d6eef = Funktionsstyrning: Python och WASM är <c1/> / <c2/>. Tabellen med medföljande scenarier är <c3/> (MCP-serverns enda användning av den). MCP-servern och korskontrollerna i <c4/> är crates som är UTESLUTNA ur workspace. IDE-pluginet länkar ingenting, det kör CLI:t.

seg-7bc5df56e4e5 = { "8" }. Determinism och reproducerbarhet

seg-fb95c37c7bb9 = All slumpmässighet går genom en enda seedad <c1/> per körning. Stegordningen är fast, så <c2/>.

seg-e026c87beb26 = Resultatet bär en SHA-256 (SHA: Secure Hash Algorithm) <c1/>. <c2/> kör ett referensscenario två gånger och kontrollerar att utdata är identisk byte för byte.

seg-42a3bdcbd99f = Samma motor kompileras till inbyggd kod, till ett Python-tillägg och till <c1/> för körningar i webbläsaren som ger samma tal.

seg-12e00717c2d4 = { "9" }. Uppskjuten / framtida struktur

seg-8a8e1b93b704 = Astrodynamik-, fusions- och alt-PNT-lagren i §1a (den fullständiga SGP4/SDP4-propagatorn, den numeriska Cowell-propagatorn med sin kraftmodell med sju störningar och två adaptiva integratorer, manöver- och banutformning, banbestämning, GNSS/INS-estimatorerna med 15, 8 och 17 tillstånd, det kopplade filtret för klocka och position samt gravitationskartmatchning) har alla levererats, tillsammans med säkerhetsmåttet (Security FoM) med en aktiv spoofing-demonstrator, verklig TLE- och multikonstellationsgeometri, Monte Carlo-band, svep för avvägningsstudier, den utskrivbara HTML-rapporten (HyperText Markup Language) med sin maskinläsbara tvilling samt arbetsflödena för release, publicering, wheels och sidor.

seg-318ad50d3826 = Flera förmågor som tidigare angavs här som framtida arbete har sedan dess <b>levererats</b> och beskrivs ovan eller i <a1>VALIDATION</a1>: den fullständiga IAU 2000A-nutationen och den ekvinoxfria CIO-reduktionen GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) (VALIDATED bit för bit mot SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), geopotentialen EGM2008 (Earth Gravitational Model { "2008" }) till grad och ordning { "70" }, termen för rampdragning <b>Lense–Thirring</b>, fasta, havs- och atmosfäriska tidvatten, en korsvalidering av efemerider av DE-klass (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, ett rent Rust-verktyg för planetgeometri)), den externa korsvalideringen mot Orekit { "12.2" } av den numeriska Cowell-propagatorn ({ "0.08" } m över { "24" } h) och av batch- och sekventiell banbestämning samt den tätt kopplade navigatorn med 17 tillstånd som görs tillgänglig som scenariotypen <c1/>.

seg-068119b15b27 = De återstående uppföljningarna spåras i <a1>CHANGELOG</a1> <c1/> och i färdplanen per förmåga i <a2>CAPABILITY</a2>: ett externt oraklevärde för EGM-evaluatorn (Earth Gravitational Model) av hög grad exakt på polaxeln och en pyshtools-ren jämförelse nära polen (evaluatorn till grad { "2190" } och dess körtidsladdare för <c2/> levereras, MODELLED, se <c3/>), en tidsvarierande rymdväderdrivare för den valfria nivån med NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended, en atmosfärmodell) för luftmotståndets täthet (standardtätheten är den statiska exponentialmodellen, och Jacchia-71-tätheten i typen <c4/> är karakteriserad mot NRLMSISE-00 men ersätts inte av den), en extern kontroll av den valfria skuggan med solskivans kantmörkning, tät koppling av GNSS/INS med bärvågsfas samt en verklig EGM2008/EIGEN-gravitationskarta (EIGEN: European Improved Gravity model of the Earth by New techniques) för alt-PNT-matcharen.

seg-b48f69ea54b3 = Ett privat overlay-repo innehåller exportkänslig resiliensdjup. Det kopplas in via samma gränssnitt <c1/> (och kontraktet <c2/> i §{ "4" }) utan att ändra den publika motorn.

seg-2f88ab8f67e8 = <s1>Föregående</s1>Där { -brand } körs

seg-02b0e0fdcdbe = <s1>Nästa</s1>Där { -brand } passar in
