# docs--architecture: translations (nb)

seg-e366c6dd500e = Kilde: <c1/>

seg-1f25b7fa1187 = Kshana — Arkitektur

seg-b0136a82669c = Kshana er <b>én motor</b> organisert i lag over en felles kjerne: <b>sensorpakkene</b> (klokke, treghet, tidsoverføring, hybrid); et <b>astrodynamikk-/numerisk</b> lag (analytisk SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), en numerisk Cowell-propagator med sin kraftmodell med sju forstyrrelser, manøverutforming, banebestemmelse fra avstandsmålinger fra bakkestasjoner, og tilpasning av kraftmodellen mot presise efemerider fra romorganisasjoner); et lag for <b>tid og referansesystem</b> (IERS (International Earth Rotation and Reference Systems Service) tidsskalaer, IAU (International Astronomical Union) 2006/2000A presesjon–nutasjon, og CIO-reduksjonen (Celestial Intermediate Origin) GCRS↔ITRS (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); et <b>fusjons</b>lag (GNSS/INS-estimatorene (GNSS: global navigation satellite system; INS: inertial navigation system)); og lagene for <b>integritet, resiliens, alt-PNT (PNT: positioning, navigation and timing) og måne</b> (RAIM/ARAIM/SBAS (RAIM: receiver autonomous integrity monitoring; ARAIM: advanced receiver autonomous integrity monitoring; SBAS: satellite-based augmentation system), jamming og spoofdeteksjon i flere lag, kartmatching av gravitasjon/terreng/magnetfelt, og cislunar PNT); og de nyere lagene <b>LEO-PNT</b> (PNT i lav jordbane), <b>spektrum</b>, <b>solsystem og konstellasjonsutforming</b>, <b>nettverkstidssynkronisering</b> og <b>kampanje</b>, med rapport-, animasjons- og interoperabilitetsskriverne som hver kjøring kan bruke (§1d). På tvers av alle disse vet ikke motoren noe om «kvante» mot «klassisk»: den driver sensorers <em>feilmodeller</em> gjennom et GNSS-avbruddsscenario, kjører en estimator og gir poengsum til utfallet. En kvante- og en klassisk enhet sammenlignes derfor på det samme scenarioet, og skiller seg bare i sine (publiserte, siterte) feilparametere og sine uavhengige støyseed.

seg-02110864419e = Dette dokumentet samler de strukturelle og atferdsmessige diagrammene. §{ "1" } er kjernen med sensorpakker; §1a kartlegger lagene for astrodynamikk, fusjon og alt-PNT som er lagt til siden; §1b–§1d lagene for studier, domener og utdata. For bruk, se <a1>README</a1>; for hva som er og ikke er validert, se <a2>VALIDATION</a2>; for modenhetstabellen per funksjon, se <a3>CAPABILITY</a3>.

seg-7bcc7b5cd049 = Forkortelser brukt i diagrammene og ikke skrevet ut der de står: ADEV, Allan-deviasjon; BW, båndbredde; CAI, kaldatom-interferometer; CZML, Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, RTCAs mottakerstandard for SBAS (Radio Technical Commission for Aeronautics); EKF, utvidet Kalman-filter; FM, frekvensmodulasjon; GSE, bakkestøtteutstyr; HPL/VPL, horisontalt/vertikalt beskyttelsesnivå; IMU, treghetsmåleenhet; IOAG, Interagency Operations Advisory Group; IQ, samplene in-phase/quadrature; ISL, lenke mellom satellitter; ITU-T, telekommunikasjonssektoren i International Telecommunication Union; J2–J6, Jordens sonale gravitasjonsharmoniske av grad { "2" } til { "6" }; KIF, Kshana Interchange Format; KML, Keyhole Markup Language; KPI, nøkkelindikator for ytelse; L1/L5, GNSS-bærebølgebånd (L2 i CR3BP-halobanene er derimot Lagrange-punktet { "2" } i systemet Jorden–Månen); LEO, lav jordbane; LOO, utelatelse av én om gangen; LTC, Coordinated Lunar Time; MEO, middels jordbane; MTIE, maksimal tidsintervallfeil; N2, Hill-diversitetstallet av orden 2; NED, nord-øst-ned; NTN, ikke-terrestrisk nettverk; OD, banebestemmelse; OPS-SAT, den europeiske romorganisasjon ESAs satellitt-laboratorium for programvare i bane; PPP, presis punktposisjonering; PSD, effekttetthetsspekter; PVT, posisjon, hastighet og tid; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), Runge–Kutta-integratorer av fjerde orden og innebygd femte(fjerde) orden; SH, sfærisk harmonisk; SigMF, Signal Metadata Format; SIR, sampling importance resampling; SRIF, kvadratrotinformasjonsfilter; SRP, solstrålingstrykk; SSC, spektral separasjonskoeffisient; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, tidsdeviasjon; TDM, Tracking Data Message fra CCSDS (Consultative Committee for Space Data Systems); TLE, two-line element-sett; TPL, Timing Protection Level; UBX, u-blox' binære protokoll; UHF, ultrahøy frekvens; VLBI, interferometri med svært lang grunnlinje; VRW / ARW, tilfeldig vandring i hastighet / vinkel; WASM, WebAssembly.

seg-a87f668a8f97 = { "1" }. Modulstruktur

seg-0388999448a6 = CLI-en (kommandolinjegrensesnittet) og begge bindingene går gjennom ett inngangspunkt <c1/>, så de driver aldri fra hverandre. Pakkene gjenbruker den felles kjernen (<c2/>, <c3/>, <c4/>); pakke { "4" } (<c5/>) setter sammen modellene og estimatorene fra pakke { "1" }–{ "3" } i stedet for å implementere dem på nytt; <c6/> utleder en GNSS-tidslinje fra geometri som deretter mater kjøringen av pakke { "1" }. Modulen <c7/> ligger på signalnivå mellom lenkebudsjettet og måledomenet: den utleder den spektrale separasjonskoeffisienten <c8/> fra de faktiske effektspektrene til signalet og jammeren, og ut fra den beregner <c9/> nå sin anti-jam-<c10/> i stedet for å ta en representativ konstant (krysskontrollert i CI (kontinuerlig integrasjon)); den bærer også avveiningene i utformingen av avstandskoder (m-sekvens/Gold).

seg-cee4eb61a8e9 = Tre ytterligere moduler danner ryggraden i <b>resiliens uten GNSS</b>. <c1/> svarer direkte på det operative spørsmålet — <em>hvor lenge kan denne klokken gå fritt før tidsfeilen overskrider budsjettet?</em> — ved å eksponere van-Loan-formen for feil under frigang som en inversjon fra holdover til terskel, krysskontrollert mot den flertrinns kovariansrekursjonen <c2/>. Dens treghetstvilling ligger i <c3/> (<c4/>), som setter sammen hvitt støy-driften fra kaldatom-interferometeret med bias- og skalafaktorfeil til et budsjett for posisjonsdrift over holdover (biasleddet krysskontrollert mot den uavhengige <c5/>-integratoren). <c6/> gjengir hele motorens matrise fra krav til modul til test til uavhengig referanse til status, med enhetstestede invarianter som forbyr en <em>validert</em>-merking uten en uavhengig ekstern referanse — slik at påstanden om sikring ikke kan drive fra koden.

seg-c7bee352c04d = 1a. Lag for astrodynamikk, fusjon og alt-PNT

seg-99c44e3a86d5 = Utover kjernen med sensorpakker deler tre delsystemer den samme felles kjernen og mater (eller mates av) <c1/>. Laget for <b>astrodynamikk / numerikk</b> legger til en ikke-analytisk Cowell-propagator ved siden av den analytiske SGP4/SDP4-veien; <b>fusjons</b>laget bærer GNSS/INS-estimatorene; og <b>alt-PNT</b>-laget er GPS-fri (GPS: Global Positioning System) gravitasjonskartmatching. Dette er bibliotek-/scenariofunksjoner (se <a1>CAPABILITY</a1> for hvilke som er koblet til en scenario-<c2/> mot nåbare som et Rust-API (application programming interface)).

seg-69f93294d2c8 = Den numeriske propagatorens kraftledd er av som standard, så å slå dem på forstyrrer aldri de utgitte gullfilene. Det tettkoblede UKF-et (unscented Kalman filter) med 17 tilstander holder en GNSS-pause ut på den utledede hastighetens tilfeldige vandring fra kvante-CAI-akselerometeret; banebestemmelse gjenbruker den samme <c1/>/<c2/> for å propagere en kandidattilstand over sporingsbuen.

seg-bd87e20c284b = Den samme felles kjernen bærer også fire ytterligere delsystemer som ikke er tegnet ovenfor (pakkene deres står i fordelingen i §{ "4" }): et lag for <b>tid og referansesystem</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>) som reduserer TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) og mater pakken <c8/>/bakkespor; et <b>integritets</b>lag (<c9/>, <c10/>) for RAIM/ARAIM/SBAS; et <b>resiliens</b>lag (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) for jamming og spoofdeteksjon i flere lag, med et <b>navigasjonssignal</b>lag (<c16/>) på signalnivå — effekttetthetsspektre for BPSK-R (BPSK: binary phase-shift keying) / sinus-BOC (BOC: binary offset carrier), den spektrale separasjonskoeffisienten <c17/> som nå utleder <c18/>s anti-jam-<c19/>, RMS-båndbredden (Gabor) for avstandsmåling, koherent early–late-DLL (delay-locked loop) jitter ved kodesporing og feilomhyllingen for flerveisutbredelse (analyse av signalytelse, <b>ikke</b> utforming av RF-nyttelast (RF: radiofrekvens) / antennemaskinvare — en nyttelastpartners rolle); og et <b>måne-/cislunar</b>lag (<c20/>, <c21/>, <c22/>, <c23/>) for CR3BP-dynamikk (circular restricted three-body problem) — inkludert tilstandsovergangsmatrisen på { "6" }×{ "6" } og en differensialkorrektor med enkeltskyting (<c24/>, <c25/>, <c26/>) som gir genuint periodiske halo-/NRHO-baner (NRHO: near-rectilinear halo orbit), og gjengir den publiserte sørlige L2 { "9" }:{ "2" } NRHO (Gateway-banen) med periode ≈ { "6.57" } d / perilune ≈ { "3,250" } km (publisert ≈ { "6.56" } d / ≈ { "3,370" } km); den selenosentriske MCI/MCMF-transformasjonen (MCI: Moon-centred inertial; MCMF: Moon-centred, Moon-fixed) av en korrigert bane og familiefortsettelse gjenstår som oppfølginger, og NRHO er en CR3BP-løsning (sirkulær, uten Sol), ikke validert mot en ekte LANS/Gateway-efemeride (LANS: Lunar Augmented Navigation Service) — og LunaNet-integritet. Tilpasningen av kraftmodellen mot efemerider fra romorganisasjoner (<c27/>, <c28/>, <c29/>, <c30/>) og det fulle settet av alt-PNT-felt (<c31/>, <c32/>, <c33/>) runder av modullisten; se <a1>CAPABILITY</a1> for modenhet per modul.

seg-05f8c8c84d15 = 1b. Resiliensstudier, evaluering av maskinlæring og reproduserbare artefakter

seg-7350971daf4e = Fem ytterligere modulgrupper danner laget for <b>åpne, reproduserbare studier</b> bak prosjektets forskningsartikler. I motsetning til scenario-<c1/>-ene nås disse som generatorer med <c2/> / <c3/> som skriver <b>byte-deterministiske</b> artefakter (faste seed, registrert motorversjon + konfigurasjonshash). Alle er <b>MODELLED</b> (syntetisk eller kalibrert mot offentlige datasett) og bærer ærlige valideringsmerker — ingen av dem er en sertifisering.

seg-86b177166f0e = <b><c1/></b> — det betingede Timing Protection Level: en holdover-begrenset grense for den <em>uoppdagede</em> tidsfeilen under spoofing, som setter sammen et k-σ-monitorgulv, van-Loan-kovariansen for frigang over deteksjonsforsinkelsen og en CUSUM-tid til alarm (cumulative sum); kalibrert på en ekte registrert spoof (JammerTest { "2024" }). Det finnes ingen endelig <em>ubetinget</em> grense — TPL er betinget av at en uavhengig krysskontroll oppdager angrepet.

seg-8c9d1d90dc8e = <b><c1/></b> — en motor for poengsetting av PNT-resiliens i tråd med rammeverk (kategorier i DHS (Department of Homeland Security) RPCF (Resilient PNT Conformance Framework)) pluss en studie av beslutningsustabilitet: et Dirichlet-vektingssimpleks, Kendall-τ-rangustabilitet, hyppighet av skifte av vinner på topp 1 og <b>diversitetskollaps</b> i felles modus (Hill-N2), med en integritetshashet sikringsrapport og { "35" } håndavledede tester mot uavhengig referanse. Se <a1>RESILIENCE-CROSSWALK</a1>. Syntetiske arkitekturer tilpasset RPCF v2.0 — en egenvurdering, ikke en sertifisering.

seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — studien av optimismegapet for RF-svekkelser: et merket syntetisk korpus og en detektoragnostisk ROC/AUC-løype (ROC: receiver operating characteristic; AUC: area under the curve), et panel med 13 detektorer (energi/AGC/SQM/paritet (AGC: automatic gain control; SQM: signal-quality monitoring) pluss seedede detektorer med logistisk regresjon og MLP med ett skjult lag (MLP: multi-layer perceptron)), skaleringslover innenfor og utenfor fordelingen med en permutasjonsnull, og en leave-one-out-prediktor for degradering utenfor fordelingen. Evalueringsmetrikkene er validert bit for bit mot scikit-learn.

seg-36206681024f = <b><c1/> / <c2/></b> — en front end for programvaredefinert mottaker (rå IQ/IF (IQ: in-phase/quadrature; IF: intermediate frequency) → korrelatorens early/prompt/late-uttak → SQM) og innlesingsadaptere (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) som lar de samme detektorene kjøre over opptak levert lokalt; ingen datasett er sjekket inn i depotet.

seg-fefd78868fc2 = <b><c1/> / <c2/></b> — kartet over resiliensovergangen mellom kvante og klassisk under parameterusikkerhet, og avveiningen av holdover-gevinst med målt ADEV; de numeriske kjernene i avveiningen er validert mot scipy.

seg-5749f1300772 = 1c. Lag for integritet, GNSS, dyp rom, måne og oppdrag

seg-f44755d6d921 = De gjenværende domenene kobles til den samme <c1/>-fordelingen og gjenbruker den felles kjernen, referansesystemene og geometrien. Alt her er <b>MODELLED</b> med mindre en rad i <c2/>-matrisen viser til en ekstern uavhengig referanse (RAIM-kjernen mot SciPy, SBAS mot RTKLIB-forken (et åpen kildekode-bibliotek for sanntids kinematisk posisjonering), DOP-kjernen (dilution of precision) i gnss_lib_py, OPS-SAT-evalueringen, kjernen for beskyttelsesnivå i lunar ARAIM, konsistensen mellom leverandørene av månens efemerider) — resten av månesuiten og kvantedemonstratoren er modellert, illustrerende, fra offentlige kilder, og bærer ingen påstand om TRL (technology readiness level) / arv / støtte fra romorganisasjoner.

seg-044940c8d052 = 1d. LEO-PNT, spektrum, solsystem, nettverkstidssynkronisering, kampanjer og utdata

seg-253a26d9cc5d = De nyeste lagene følger det samme mønsteret: hvert er én eller flere scenario-<c1/>-er sendt fra <c2/>, bygget på den felles kjernen, og MODELLED med mindre en matriserad navngir en ekstern uavhengig referanse.

seg-e47cccd54da3 = Detaljene per type står i <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> og <a13>INTEROP</a13>.

seg-d04b21c7cb6c = 1e. Lag for mottakertillit, evidens, telemetri, trening og compliance ({ "0.35" })

seg-84ee122959b4 = Disse lagene leser en mottakers egen logg eller skriver filer for andre verktøy; ingen av dem syntetiserer eller sender et radiofrekvenssignal. De ligger ved siden av <c1/> i stedet for under scenariotypene, bortsett fra <c2/> selv, som er en scenariotype. Alle er MODELLED med mindre en matriserad navngir en ekstern uavhengig referanse, og de maritime utdataene er veiledende, ikke typegodkjent navigasjonsutstyr.

seg-aab745a65e76 = Modul

seg-9d17ad3e87c8 = Dokumentert i

seg-920b6b14c0e2 = gir poengsum til en mottakerlogg epoke for epoke med tillitsmonitorene; en fartøyplattform legger til de maritime monitorene og scoren 0–100 med årsaker

seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

seg-c311dfc2a161 = den samme poengsettingen på en strøm etter hvert som den kommer (stdin, en fil som utvides, TCP eller UDP), setningen <c1/> og den valgfrie gaten; <c2/> er hele motoren uten inn- eller utdata

seg-07b2d6edf7b9 = en signert pakke med hashkjede av et loggvindu, dets konfigurasjon og motorens resultat, som kan verifiseres frakoblet; valgfritt RFC { "3161" } tidsstempeltoken

seg-32d08730b9c0 = tillitsstrømmen som Prometheus-metrikker, syslog-hendelser (CEF eller LEEF) og valgfri OpenTelemetry (funksjonen <c1/>, av som standard)

seg-53311b8c3b93 = syntetisk bro-NMEA { "0183" } med skriptede hendelser for jamming, drag-off, tidsspoofing og replay samt en instruktørlogg, for mannskapstrening (kun tekst)

seg-f7cc3cfbdfc6 = aggregerte kart over redusert navigasjon fra åpent lisensierte fly- og skipsrapporter, og en rutes eksponering for dem; kun lokale filer

seg-83fe3c87e2d5 = en verifikator på mottakersiden for Galileo OSNMA: leser I/NAV-sider (rene sider, vektor-CSV, en UBX-strøm), kontrollerer den signerte nøkkelen, TESLA-kjeden og MAC-ene, og rapporterer per satellitt om navigasjonsdataene er autentisert; <c1/> er den ene banen som kommandolinjen, Python og WebAssembly deler; kun autentiseringsstatus, ikke en integritetstjeneste

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = kobler utdata fra Kshana til offentlige robusthetsrammeverk og fyller ut koblingen fra resultatdokumenter; <c1/> og <c2/> tar tekster, ikke stier

seg-e16c483479ce = et scenarios kjøretøybevegelse og hendelser som bevegelses-CSV, NMEA, veipunkttekst og hendelsesfiler for en GNSS-simulator i laboratoriet; ingen signaler skrives

seg-044c58c98397 = Integrasjoner for båter (Signal K-programtillegget, OpenCPN i gate-modus og referansebygget) kaller kommandolinjeverktøyet; se <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Motorens pipeline (per kjøring)

seg-53e9e596ca44 = Hver kjøring stepper én enkelt sensormodell gjennom tidsrutenettet. Modellen styres så lenge GNSS er nominelt, og får gå fritt (holdover / dødregning) under avbruddet.

seg-257407f3c375 = Et scenario kjører denne pipelinen to ganger, én gang for kvantesensoren og én gang for den klassiske sensoren, med <b>uavhengige seed</b> (<c1/>), slik at de to støyrealiseringene er ukorrelerte.

seg-4659e89ba5f5 = { "3" }. Grensesnittet for feilmodeller (utvidelsespunktet)

seg-7b70e8b1b98a = Hver sensor implementerer den samme ideen: et objekt med tilstand der <c1/> fører den interne stokastiske feilen videre, og der den akkumulerte tilstanden leses ut ved hvert tikk. Klokker eksponerer akkumulert fase, akselerometre eksponerer dobbeltintegrert posisjon, og lenker eksponerer jitter per måling.

seg-79ab76c6dbc0 = <c1/> følger med inn i resultatet, slik at hvert tall i utdataene kan spores til den publiserte kilden som er oppgitt i <c2/>.

seg-514c49659947 = Ved siden av den analytiske <c1/> kjører klokkepakken et Kalman-filter med to tilstander (fase, frekvens) (<c2/>) hvis prosessstøy tilsvarer referansemodellen. Når det går på tomgang gjennom et avbrudd, vokser faseavvikets varians nøyaktig til <c3/>, den analytiske holdover-relasjonen, og filterets løpende 1-σ-grense brukes til å fylle ut kvalitetsmålet <b>Integritet</b> (andelen av avbruddets sampler der feilen holder seg innenfor k-σ-grensen).

seg-7404589deb40 = { "4" }. Utsendelse (CLI og bindinger)

seg-6138513a43f7 = <c1/> er det eneste inngangspunktet: den titter på <c2/> på øverste nivå, deserialiserer det samsvarende scenarioet, kjører pakken og returnerer <c3/> (<c4/> finnes bare for de typene som publiserer en reproduserbarhetstabell). CLI-en skriver disse til filer, sammen med rapporten (<c5/>, <c6/>) og eventuelle utdata fra <c7/> / <c8/>; bindingene for Python og WebAssembly returnerer dem til verten. Én utsendelse, ingen avdrift.

seg-524f749be364 = Utsendelsen skjer på en typet enum <c1/> som matches uttømmende (se neste delavsnitt), så å legge til en pakke er en endring som kompilatoren kontrollerer. Et manglende <c2/> faller tilbake på pakken <c3/>, slik at eksisterende scenarioer med én type deserialiseres uendret (<c4/> ignorerer feltet <c5/> på hver scenariostruktur). En ukjent <c6/> avvises med <c7/>, som nevner den nærmeste innebygde typen når navnet ser ut som en skrivefeil.

seg-eedaeae2a7e7 = Typet utsendelse og det strukturerte API-et

seg-ca47f566eaee = Utsendelsen skjer på en typet enum <c1/>, ikke på en rå strengmatch: <c2/> løser feltet <c3/> opp til en variant, og utsenderen matcher den uttømmende. Å legge til en pakke er en endring som kompilatoren kontrollerer, ikke en skrivefeil i en streng. To typede flater ligger ved siden av <c4/>, som returnerer en streng (beholdt for CLI-en og eksisterende bindinger):

seg-167c47049329 = <b><c1/></b>: det typede inngangspunktet, med et strukturert feiltaksonomi (<c2/>, <c3/>, <c4/>, <c5/>). Hver feil har en stabil <c6/>, slik at en kaller kan forgrene seg på feilkategorien i stedet for å tolke meldingen. Bindingene eksponerer dette som <c7/>.

seg-1943051b3b20 = <b><c1/></b> (og <c2/>, eksponert i bindingene som <c3/>): programmatisk introspeksjon. Den gir hver types navn, beskrivelse og obligatoriske og valgfrie felt, til automatisk utfylling i brukergrensesnitt (UI) og notatbøker.

seg-630243592256 = Å utvide Kshana med en ekstern pakke

seg-d1adedd2c08b = En tredjepartspakke implementerer to små, semver-stabile traits fra <c1/>:

seg-d01471b13324 = <c1/> har også en standardmetode <c2/>, som ikke gjør noe med mindre en pakke velger å bruke registerets utsendelsessøm i <c3/>. Den innebygde pakken <c4/> er koblet inn via <c5/> som det gjennomgåtte eksempelet. Pakker utenfor kodetreet følger den samme kontrakten uten å forke kjernen (på samme måte som utvidelsespunktet <c6/> i §{ "3" }, som det private robusthetslaget bruker).

seg-5b0449d96bc3 = Kshana har derfor <b>to stabile utvidelsessømmer</b>: du kan legge til en <em>sensor</em> ved å implementere <c1/> (§{ "3" }), eller en hel <em>scenariotype</em> ved å implementere <c2/> + <c3/>. Begge er semver-stabile, og ingen av dem krever en fork av kjernen:

seg-3928a007756b = { "5" }. Den hybride avslutningen

seg-7f38e825519a = Hybridpakken kjører en <em>suite</em> (én klokke og én inertisensor) og krever at <b>både</b> tidssynkronisering og posisjon holder seg innenfor spesifikasjonen. <c1/> er tiden til én av dem overskrides. Eventuelt resynkroniserer en optisk intersatellittlenke <b>klokken</b> under avbruddet, og dette gjelder bare tidsstøtte. Posisjonen resynkroniseres ikke, fordi tidsoverføring gir tid, ikke posisjon. Dette er det som gjør inertisensoren til den begrensende faktoren.

seg-17a8683f0982 = { "6" }. GNSS-tilgjengelighet utledet av geometri

seg-afdb141ac367 = <c1/> er et deterministisk geometrilag uten avhengigheter. En <c2/> er enten den analytiske keplerske <c3/> (tolegemeproblem, eventuelt med sekulær J2) eller en full <c4/>-propagator bygd fra et komplett to-linjers elementsett. En Walker-delta-generator lager syntetiske konstellasjoner, og siktlinjesynlighet = jordokkultasjon + elevasjonsmaske. Antallet synlige satellitter gir en GNSS-tilstand (≥{ "4" } = nominell, { "1" }–{ "3" } = redusert, { "0" } = nektet), og <c5/> gjør dette om til tilgjengelighetstidslinjen som driver den vanlige klokke-holdover-kjøringen. Tilgjengeligheten er altså <em>utledet av geometri</em> i stedet for å være skrevet for hånd, mens kjøringen, estimatoren og skåringen er uendret.

seg-da82c97ac5c8 = En konstellasjon som er oppgitt som fulle TLE-er, propageres med SGP4/SDP4-modellen i <c1/> (validert mot AIAA (American Institute of Aeronautics and Astronautics) 2006-6753-vektorene). Elementer med bare linje 2 beholder den analytiske tolegemebanen. De to kan blandes i én konstellasjonsblokk.

seg-a47031620b54 = { "7" }. Bindinger

seg-57fb29fdd9d9 = Kjernen kompileres uendret til native kode, til en Python-utvidelse og til WebAssembly. Modulene for Python (<c1/>, PyO3 abi3) og WebAssembly (<c2/>, wasm-bindgen) er valgfrie avhengigheter som styres av funksjonsflagg (<c3/> / <c4/>): standardbygget og testsuiten kompilerer dem aldri, mens avhengighetsrevisjonen (<c5/>) inspiserer avhengighetstrærne deres, fordi disse crate-ene leveres inne i wheel-pakken og npm-pakken. Begge kaller <c6/>, så alle flater returnerer identiske resultater. WebAssembly-modulen driver nettleserens lekeplass i <c7/> og eksporterer tretten funksjoner: <c8/>, <c9/> (én motorkjøring som returnerer resultat, diagram, oppsummering og tabell samlet), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, kodeken <c16/> / <c17/> for delbare URL-er (URL: nettadresse) og de tre eksportørene <c18/> / <c19/> / <c20/> som ligger bak lekeplassens eksportmeny. To døråpninger til gir tilgang til samme <c21/>: <b>MCP-serveren (Model Context Protocol)</b> (<c22/>, en <c23/>-crate utenfor arbeidsområdet som eksponerer femten verktøy: <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; de to eksempelverktøyene leser de medfølgende scenarioene gjennom bibliotekets funksjon <c39/>, som er av som standard og som bare denne serveren slår på) og <b>JetBrains-IDE-programtillegget (integrated development environment)</b> (<c40/>, et Kotlin-prosjekt som kaller CLI-en <c41/> i stedet for å lenke mot biblioteket).

seg-a6620e0d6eef = Funksjonsstyring: Python og WASM er <c1/> / <c2/>. Tabellen over medfølgende scenarioer er <c3/> (MCP-serverens eneste bruk av den). MCP-serveren og kryssjekkene i <c4/> er crate-er som er UTELATT fra arbeidsområdet. IDE-programtillegget lenker ikke mot noe, det kjører CLI-en.

seg-7bc5df56e4e5 = { "8" }. Determinisme og reproduserbarhet

seg-fb95c37c7bb9 = All tilfeldighet går gjennom én enkelt seedet <c1/> per kjøring. Rekkefølgen på stegene er fast, så <c2/>.

seg-e026c87beb26 = Resultatet har en SHA-256 (SHA: Secure Hash Algorithm) <c1/>. <c2/> kjører et referansescenario to ganger og kontrollerer at utdataene er byte-identiske.

seg-42a3bdcbd99f = Den samme motoren kompileres til native kode, til en Python-utvidelse og til <c1/> for kjøring i nettleseren med de samme tallene.

seg-12e00717c2d4 = { "9" }. Utsatt / framtidig struktur

seg-8a8e1b93b704 = Astrodynamikk-, fusjons- og alt-PNT-lagene i §1a er alle ferdige: den fulle SGP4/SDP4-propagatoren, den numeriske Cowell-propagatoren med sin kraftmodell med sju perturbasjoner og to adaptive integratorer, manøver- og banedesign, banebestemmelse, GNSS/INS-estimatorene med 15, 8 og 17 tilstander, det koblede klokke+posisjon-filteret og tyngdekartmatching. Det samme gjelder Sikkerhet-kvalitetsmålet med en aktiv spoof-demonstrator, ekte TLE-er og geometri for flere konstellasjoner, Monte Carlo-bånd, avveiningsstudier med sveip, den utskrivbare HTML-rapporten (HyperText Markup Language) med sin maskinlesbare tvilling, og arbeidsflytene for utgivelse, publisering, wheels og pages.

seg-318ad50d3826 = Flere funksjoner som tidligere sto her som framtidig arbeid, er siden <b>ferdigstilt</b> og dekkes ovenfor eller i <a1>VALIDATION</a1>: den fulle IAU 2000A-nutasjonen og den ekvinoksfrie CIO-reduksjonen GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) (validert bit for bit mot SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), geopotensialet EGM2008 (Earth Gravitational Model { "2008" }) til grad/orden { "70" }, leddet for <b>Lense–Thirring</b>-rammedragning, tidevann i fast jord, hav og atmosfære, en kryssvalidering av efemeride på DE-nivå (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, et rent Rust-verktøysett for planetgeometri)), den eksterne kryssvalideringen mot Orekit { "12.2" } av den numeriske Cowell-propagatoren ({ "0.08" } m over { "24" } h) og av batch- og sekvensiell banebestemmelse, og den tett koblede navigatoren med 17 tilstander som er gjort tilgjengelig som scenariotypen <c1/>.

seg-068119b15b27 = De gjenstående oppfølgingene spores i <a1>CHANGELOG</a1> <c1/> og i veikartet per funksjon i <a2>CAPABILITY</a2>: en ekstern referanseverdi for EGM-evaluatoren (Earth Gravitational Model) for høy grad nøyaktig på polaksen og en pyshtools-ren sammenligning nær polen (evaluatoren til grad { "2190" } og lasteren <c2/> for kjøretid er levert, MODELLED, se <c3/>), en tidsvarierende romværsdriver for det valgfrie nivået for luftmotstandstetthet etter NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) (standard luftmotstandstetthet er den statiske eksponentialmodellen, og Jacchia-71-tettheten i typen <c4/> er karakterisert mot NRLMSISE-00, men ikke erstattet av den), en ekstern kontroll av den valgfrie skyggemodellen med solskivens randdemping, tett kobling av GNSS/INS med bærebølgefase og et ekte EGM2008/EIGEN-tyngdekart (EIGEN: European Improved Gravity model of the Earth by New techniques) for alt-PNT-matcheren.

seg-b48f69ea54b3 = Et privat overlegg-repo rommer robusthetsdybde som er eksportfølsom. Det kobles inn via det samme grensesnittet <c1/> (og kontrakten <c2/> i §{ "4" }) uten å endre den offentlige motoren.

seg-2f88ab8f67e8 = <s1>Forrige</s1>Hvor Kshana kjører

seg-02b0e0fdcdbe = <s1>Neste</s1>Hvor Kshana står
