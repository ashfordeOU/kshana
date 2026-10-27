# docs--glossary: translations (nb)

seg-daf25c6479c1 = Standarder

seg-c851aa23ea42 = kommaseparerte verdier

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = temperaturkompensert krystalloscillator

seg-1bac97ee312a = rubidium atomfrekvensstandard

seg-b09ffb8a9095 = Monte Carlo

seg-9939da5da283 = JSON

seg-5907283b71da = Forkortelse

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = bias mellom systemer

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvanteprojeksjonsstøy

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-e464509f3abb = forholdet mellom bærebølge og støytetthet

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital objektidentifikator

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Den internasjonale romstasjonen

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bit

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahøy frekvens

seg-6ce4c2164aee = Kilde: <c1/>

seg-bee5d056ef03 = Definisjoner i klart språk av begrepene som brukes i { -brand }. Hver oppføring starter med en enlinjers «i klartekst» og legger så til den presise betydningen der det hjelper. Forkortelser som ikke er definert i et avsnitt, står i A-til-Å-tabellen mot slutten, <a1>Alle andre forkortelser, A til Å</a1>.

seg-f8c5433d1026 = Navigasjon og tidssynkronisering

seg-2a42d84608ea = <b>PNT — Positioning, Navigation, and Timing.</b> Å vite <em>hvor</em> du er, <em>hvilken vei</em> du er på vei og <em>hva klokka er</em> — presist. Moderne PNT kommer for det meste fra satellittsignaler (GNSS, de globale navigasjonssatellittsystemene som defineres neste); { -brand } studerer hva som skjer med <em>tid</em> og <em>posisjon</em> når disse signalene går tapt.

seg-6227db2c94e1 = <b>GNSS — Global Navigation Satellite System.</b> Satellittkonstellasjonene som gir PNT: GPS (Global Positioning System, USA (United States of America)), Galileo (EU), GLONASS (Russlands Global Navigation Satellite System), BeiDou (Kina). En mottaker som ser ≥ { "4" } satellitter, kan beregne en full 3D-posisjon og tidsbestemmelse.

seg-f8eda357e640 = <b>GNSS-bortfall / nektet / forringet / jammet.</b> Når satellittsignalene er utilgjengelige (blokkert, jammet eller utenfor syne). Under et bortfall må systemet «gå i coasting» på egne sensorer om bord. Hele hensikten med { -brand } er å måle hvor godt det klarer det.

seg-a3ade199f465 = <b>Holdover.</b> I klartekst: <em>hvor lenge klokken kan holde god tid på egen hånd etter at den mister GNSS.</em> En bedre klokke holder lenger før feilen krysser den tillatte grensen.

seg-83b33c15312f = <b>Dead-reckoning.</b> I klartekst: <em>å anslå hvor du er ved å legge sammen den målte bevegelsen din, uten noen ytre referanse.</em> Feil hoper seg opp, så en bedre treghetssensor driver saktere.

seg-da9bcc994b9c = <b>Spesifikasjon / terskel.</b> Den største feilen du får før løsningen regnes som «utenfor spesifikasjonen» — for eksempel «tiden må holde seg innenfor { "20" } ns» eller «posisjonen innenfor { "100" } m».

seg-6f37a60a30c7 = Sensorene { -brand } sammenligner

seg-308b59d89586 = <b>Klokke (atomklokke).</b> En enhet som holder tid ved å telle de naturlige svingningene til et atom. To eksempler her:

seg-3389d08be6bc = <b>CSAC — Chip-Scale Atomic Clock.</b> En liten, utplassert, kommersiell klokke (den «klassiske» referansen). God, men driver merkbart over et langt bortfall.

seg-3e121d8e6400 = <b>Optisk gitterklokke (for eksempel strontium).</b> En langt mer stabil «kvante»klokke; det ypperste i laboratorier, ennå ikke flydd i rommet.

seg-4daa6cdf8ae2 = <b>Akselerometer.</b> Måler akselerasjon (endring i bevegelse). Integrert to ganger gir det posisjon — så enhver feil vokser raskt. <b>Kaldatom-akselerometer</b> er kvanteversjonen med mye bedre langtidsstabilitet; <b>navigasjonsklasse</b> er den klassiske.

seg-91793676c57c = <b>Gyroskop.</b> Måler rotasjon. En liten rotasjonsfeil heller plattformen, noe som lekker tyngdekraften inn i horisontal retning og ødelegger posisjonsestimatet.

seg-2d36110effc3 = <b>IMU — Inertial Measurement Unit.</b> Selve pakken med akselerometer og gyroskop: tre akser av hver, som rapporterer spesifikk kraft og vinkelrate. Den måler bevegelse; alene vet den ikke hvor den er.

seg-e3b6b40e0cd0 = <b>INS — Inertial Navigation System.</b> En IMU pluss «mekaniseringen» som integrerer utdataene til holdning, hastighet og posisjon. INS er det som går i dead-reckoning gjennom et GNSS-bortfall, og nøyaktigheten bestemmes av feilprosessene i IMU-en som er listet nedenfor.

seg-a618ff7ee429 = <b>Tidsoverføring.</b> Å sende et presist tidssignal mellom to steder (for eksempel satellitt til satellitt). <b>Optiske</b> linker er langt mer presise enn <b>RF</b>-linker (radiofrekvens).

seg-847fbbeecfae = Hvordan feil modelleres (klokkestøy)

seg-5cf197bdbbad = Klokkefeil bygges av standard «støytyper», hver med en kjent signatur:

seg-3806d1b1cb50 = <b>Hvit FM (hvit frekvensmodulasjon).</b> I klartekst: <em>rask, tilfeldig jitter i klokkens rate.</em> Å midle den ned bedres med tiden. Parameter <c1/>.

seg-0793fdd3abab = <b>Random-walk-FM.</b> I klartekst: <em>klokkens rate vandrer sakte.</em> Dette dominerer lange bortfall. Parameter <c1/>.

seg-42b74c8b88ff = <b>Flicker-FM (1/f-støy).</b> I klartekst: <em>et hardnakket støygulv klokken aldri kan midle under.</em> Det er flatt over midlingstidene. Parameter <c1/>.

seg-b3bd841a5a2d = <b>Aldring / drift.</b> En langsom, <em>forutsigbar</em> endring i rate over tid; fordi den er forutsigbar, fjerner estimatoren til { -brand } den. Parameter <c1/>.

seg-d929960492e4 = <b>VRW — Velocity Random Walk.</b> Akselerometerets motstykke til hvit støy: tilfeldige dytt på hastigheten som bygger seg opp til posisjonsfeil. Parameter <c1/>.

seg-4a97f8d14174 = <b>ARW — Angular Random Walk.</b> Gyroskopets motstykke: tilfeldige dytt på orienteringen. Parameter <c1/>.

seg-dcd03b326110 = Hvordan stabilitet måles

seg-2181832c6253 = <b>Allan-deviasjon (<c1/>).</b> I klartekst: <em>standardmåten å oppgi hvor stabil en klokke er over en gitt midlingstid <c2/>.</em> Et klokkedatablad oppgir for eksempel <c3/>. { -brand } validerer klokkemodellen sin ved å beregne Allan-deviasjonen til sine egne utdata og kontrollere at den stemmer med det publiserte tallet. (Referanse: Riley, NIST SP { "1065" } — National Institute of Standards and Technology Special Publication { "1065" }.)

seg-11cbe561e633 = <b>PSD — Power Spectral Density.</b> Hvordan effekten i en støy er fordelt over frekvenser; den formelle måten å spesifisere hvit støy, random-walk-støy og flicker-støy på.

seg-0737d620eb5f = Kvalitetsmålene (hvordan en kjøring skåres)

seg-20b66e0d4809 = De seks operative PNT-kvalitetsmålene { -brand } rapporterer (se tabellen «Output» i README):

seg-b17d08246e49 = <b>FoM — Figure of Merit.</b> Ett tall som skårer ett aspekt ved en kjøring, rapportert med enhet og om det er validert eller modellert. De seks nedenfor er de operative kvalitetsmålene til { -brand }.

seg-b229a69fb4ac = <b>Posisjons- / tidsytelse</b> — størrelsen på feilen, som RMS (root mean square, det kvadratiske gjennomsnittet) og som 95. persentil.

seg-ba3ed5a28518 = <b>Autonomi</b> — holdover-varigheten (hvor lenge den holder seg innenfor spesifikasjonen uten GNSS).

seg-13ecdd037098 = <b>Robusthet</b> — hvor fort feilen vokser når GNSS er tapt.

seg-be0168f24d6e = <b>Tilgjengelighet</b> — andelen av kjøringen som har en løsning innenfor spesifikasjonen.

seg-44ef500b371d = <b>Integritet</b> — <em>kan du stole på systemets eget estimat av sin feil?</em> { -brand } rapporterer andelen av sampler under bortfallet der den sanne feilen holder seg innenfor filterets beskyttende grense.

seg-d1cc3819cde9 = <b>Sikkerhet</b> — robusthet mot spoofing: en score for spoofing-detekterbarhet basert på klokkestabilitet (siden { "v0.3.0" }), som bare har mening når et scenario med spoofing-angrep er konfigurert. Den er <em>ikke</em> integritet av luftfartsklasse: den beregner ikke noe horisontalt eller vertikalt beskyttelsesnivå (HPL/VPL) og kjører ingen RAIM (receiver autonomous integrity monitoring), verken avansert eller ikke. Disse kommer fra de separate scenariotypene for integritet og ARAIM (advanced RAIM) og er definert under «Integritet og augmentering» nedenfor. Eksportfølsom.

seg-5cae59204d9e = Begreper som brukes sammen med kvalitetsmålene:

seg-7adc0e49a981 = <b>Spoofing.</b> I klartekst: <em>et falskt satellittsignal som lyver om posisjon eller tid.</em> En spoofer gir mottakeren et plausibelt, men galt svar, noe som er verre enn jamming fordi mottakeren kanskje ikke merker det.

seg-2d2e6cbeade6 = <b>1-DOF — én frihetsgrad.</b> En enkelt akse. Posisjonsfeilen i scenariopakkene til { -brand } er enakset; et fullt 3D-svar trenger treakset-modellen.

seg-14a32d281c4b = <b>Monte Carlo-ensemble.</b> Å kjøre det samme scenarioet mange ganger med ulike tilfeldige seeder og rapportere spredningen i resultatene i stedet for én kjøring.

seg-fcbea49a3592 = <b>CI — konfidensintervall.</b> Området en statistikk forventes å havne i med en oppgitt sannsynlighet (for eksempel { "95" } %). I tabellene og merkene i README betyr «CI» oftere <b>kontinuerlig integrasjon</b> — den automatiske bygge- og testkjøringen ved hver endring; sammenhengen sier hvilket.

seg-310abfd6a64c = <b>k-sigma-grense.</b> En grense satt til <em>k</em> standardavvik av filterets egen usikkerhet; kvalitetsmålet for integritet teller hvor ofte den sanne feilen holder seg innenfor den.

seg-ad26afbaa7b4 = <b>CEP / 2DRMS — circular error probable / twice the distance root mean square.</b> To standardmåter å oppgi 2D-horisontal nøyaktighet på: CEP er radiusen som rommer { "50" } % av posisjonsbestemmelsene; 2DRMS er det dobbelte av den kvadratiske middelverdien av den horisontale feilen. Biblioteket kan beregne begge fra en posisjonskovarians (<c1/>), men ingen scenariotype rapporterer dem ennå.

seg-fd93c1effba8 = Å lese et resultat: begrepene i utdataene

seg-3432498093cf = Dette er navnene du møter i en resultatfil eller i sammendraget i lekeplassen, først i klartekst.

seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> I klartekst: <em>hvor mange sekunder systemet holdt seg innenfor feilgrensen etter at GNSS gikk tapt.</em> { -brand } rapporterer den korteste slike coastingen over alle bortfall i kjøringen, målt på kjøringens tidsrutenett, så den er en nedre grense ved oppløsningen til tidssteget. En holdover lik bortfallets lengde betyr at grensen aldri ble krysset.

seg-e68708a219f1 = <b>p95 (<c1/>).</b> I klartekst: <em>i { "95" } % av tiden var tidsfeilen så liten eller mindre.</em> Det er 95. persentil av feilen over bortfallet. En svært liten verdi kan vises som <c2/> i et kort sammendrag; resultatfilen i JSON (JavaScript Object Notation) har tallet med full presisjon.

seg-4dfaee63262d = <b>Integritet (<c1/>).</b> I klartekst: <em>hvor ofte systemets eget feilestimat var ærlig.</em> Det er andelen av sampler under bortfallet der den sanne feilen holdt seg innenfor k-sigma-grensen til filteret (definert nedenfor). En verdi nær { "1" } betyr at estimatoren ikke undervurderte feilen sin. Det er ikke et beskyttelsesnivå for luftfart; se «Integritet og augmentering» nedenfor og <a1><c2/></a1>.

seg-5af09f5129e0 = <b>Sikkerhetsscore (<c1/>).</b> I klartekst: <em>hvor sannsynlig det er at et spoofing-angrep blir fanget.</em> Det er sannsynligheten for at det konfigurerte angrepet oppdages — én minus sannsynligheten for udetektert angrep <c2/> — utledet fra klokkens stabilitet. Det har bare mening når scenarioet konfigurerer et spoofing-angrep. Uten konfigurert angrep skriver enlinjers sammendraget ut <c3/>, og resultatet markerer tallet <c4/> i blokken <c5/>; verdien blir stående i dokumentet og betyr «ikke relevant», ikke «null sikkerhet».

seg-70113d509997 = <b>PDOP — position dilution of precision (nøkler som <c1/>).</b> I klartekst: <em>hvor mye satellittgeometrien forstørrer avstandsfeil til posisjonsfeil.</em> Posisjonsfeilen er omtrent PDOP ganger avstandsfeilen, så lavere er bedre. Se <b>DOP</b> under «Estimering og geometri».

seg-a445bf9a3c5f = <b>sigma_y (<c1/>, Allan-deviasjonen).</b> I klartekst: <em>hvor mye en klokkes rate svinger når den midles over en tid <c2/>.</em> En databladlinje som <c3/> betyr at raten, midlet over ett sekund, varierer med omtrent { "3" } deler per 10¹⁰. Mindre er en mer stabil klokke. Se «Hvordan stabilitet måles» ovenfor.

seg-03b4bb05148d = <b>q_wf — intensitet av hvit frekvensstøy.</b> I klartekst: <em>styrken på den raske, tilfeldige jitteren i en klokkes rate.</em> Det er koeffisienten i <c1/> for hvit frekvensstøy, så et scenario setter <c2/> fra databladets Allan-deviasjon ved ett sekund. Følgesvennene er <c3/> (random-walk-frekvensstøy) og <c4/> (aldring); se «Hvordan feil modelleres» ovenfor.

seg-074a1337ed99 = Begreper for telekom-tidssynkronisering

seg-9f61398628e4 = Telekomnett distribuerer tid over pakkenett (Precision Time Protocol) fra en GNSS-matet referanseklokke, og International Telecommunication Union Telecommunication Standardization Sector (ITU-T) setter grenser for tidsfeilen hver klokke kan legge til. Disse begrepene forekommer i typen <c1/>; se <a1><c2/></a1>.

seg-f48712300b30 = <b>TE — time error.</b> I klartekst: <em>hvor langt en klokkes tid er fra referansetiden, i ett øyeblikk.</em> Positiv eller negativ, vanligvis i nanosekunder.

seg-ceda70656c6a = <b>max|TE| — maximum absolute time error.</b> I klartekst: <em>den verste tidsfeilen sett over målingen, uten hensyn til fortegn.</em> Det er hovedgrensen de fleste masker setter.

seg-38d2922cd91d = <b>cTE — constant time error.</b> I klartekst: <em>den jevne forskyvningsdelen av tidsfeilen</em> — gjennomsnittsfeilen som ikke endres over målingen.

seg-a4a61df332cd = <b>dTE — dynamic time error.</b> I klartekst: <em>den svingende delen av tidsfeilen</em> — det som er igjen etter at den konstante forskyvningen er fjernet. Den bedømmes med MTIE og TDEV.

seg-31c0a85788b1 = <b>MTIE — maximum time interval error.</b> I klartekst: <em>det største utslaget i tidsfeil sett innenfor et hvilket som helst vindu av en gitt lengde.</em> For hver vindulengde glir den et vindu langs registreringen og tar den største topp-til-topp-endringen; en maske gir den største tillatte verdien per vindulengde.

seg-53fa12cab0c6 = <b>TDEV — time deviation.</b> I klartekst: <em>den typiske (kvadratiske middelverdi) vandringen i tidsfeilen ved en gitt midlingstid,</em> etter at kortvarig jitter er midlet ut. Det er et tidsdomene-motstykke til Allan-deviasjonen og kontrolleres, som MTIE, mot en maske.

seg-62b5eea14f6c = <b>PRTC — primary reference time clock.</b> Klokken på toppen av en telekom-tidskjede, vanligvis styrt av GNSS. Ytelsesgrensene står i ITU-T-anbefaling G.8272.

seg-8d6d4538981b = <b>ePRTC — enhanced primary reference time clock.</b> En PRTC med en strammere grense for tidsfeil, støttet av en svært stabil lokal atomklokke slik at den kan holde tid gjennom et langt GNSS-tap. ITU-T-anbefaling G.8272.1.

seg-93fa4ac7c6fa = <b>T-BC — telecom boundary clock.</b> En nettklokke som mottar tid oppstrøms og sender den videre nedstrøms, og legger til litt tidsfeil selv. ITU-T-anbefaling G.8273.2.

seg-52d32a5db6b8 = <b>T-TSC — telecom time slave clock.</b> Klokken i enden av kjeden som mottar tid og leverer den til utstyret som trenger den (for eksempel en radiobasestasjon). Dekkes også av ITU-T-anbefaling G.8273.2.

seg-04d8ed12ca88 = <b>OCXO — oven-controlled crystal oscillator.</b> En kvartsoscillator holdt på konstant temperatur i en liten ovn, noe som gjør den mye mer stabil enn en vanlig kvartsoscillator. En vanlig holdover-klokke i nettutstyr; den eldes (driver) merkbart over dager.

seg-6742f7ba35ac = <b>CSAC — chip-scale atomic clock.</b> En svært liten atomklokke (se «Sensorene { -brand } sammenligner» ovenfor). Mer stabil over lange holdover-perioder enn en OCXO, til høyere kostnad og effekt.

seg-c0e0c18bd867 = Evidensnivåer: VALIDATED, MODELLED, PARTNER

seg-61c0aa107fd9 = Hver funksjon i den maskinkontrollerte verifikasjonsmatrisen (<a1><c1/></a1>) har ett av tre nivåer.

seg-13fb20435df3 = <b>VALIDATED.</b> I klartekst: <em>kontrollert mot noen andres svar.</em> Funksjonens utdata ble sammenlignet med en uavhengig ekstern referanse — virkelige måledata, et uavhengig bibliotek skrevet av noen andre, eller publiserte referanseverdier — og stemte innenfor en oppgitt toleranse. En kontroll i kontinuerlig integrasjon avviser en VALIDATED-rad som ikke navngir noen ekstern referanse.

seg-a5dfb48e4dcb = <b>MODELLED.</b> I klartekst: <em>bygget på solid fysikk og kontrollert for intern konsistens, men ennå ikke sammenlignet med et eksternt svar.</em> Tallene er meningsfulle for sammenligning og designavveininger; de er ikke evidens for at en virkelig enhet vil yte slik. <a1><c1/></a1> forklarer hvorfor hver slik rad er modellert.

seg-0512b2d2145a = <b>PARTNER.</b> I klartekst: <em>denne delen tilhører en partner innen maskinvare eller produktsikring, og { -brand } påstår ingenting om den.</em> Raden finnes slik at gapet er synlig i stedet for taust.

seg-278dee6d3d4c = Begreper for spektrum og interferens

seg-285a240c9958 = Disse begrepene forekommer i typen <c1/>; se <a1><c2/></a1>.

seg-db4fdef1c562 = <b>BPSK(n) — binary phase-shift keying ved n × { "1.023" } Mchip/s.</b> Modulasjonen med rektangulære chips i GPS L1 coarse/acquisition (C/A) og L2 civil (L2C) (n = { "1" }) og GPS L5 og Galileo E5a (n = { "10" }). Spekteret er en sinc² med nullpunkter for hver n × { "1.023" } MHz.

seg-cdd0f4194f42 = <b>BOC(m, n) — binary offset carrier.</b> En spredekode ved n × { "1.023" } Mchip/s multiplisert med en firkantbølge-underbærebølge ved m × { "1.023" } MHz, som deler spekteret i to lober på hver side av bærebølgen.

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multiplexed binary offset carrier.</b> Effekttetthetsspekteret 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), avtalt for Galileo E1 open service og GPS L1C; Galileo sender det som sammensatt BOC (CBOC).

seg-7423f94e3018 = <b>CW — continuous wave.</b> En umodulert bærebølge: én enkelt tone.

seg-55d03dd4af03 = <b>J/S — jammer-to-signal ratio.</b> Mottatt jammer-effekt over mottatt signaleffekt, i desibel.

seg-b0f2974647d4 = <b>SSC — spectral separation coefficient.</b> κ = ∫ G_s(f) G_j(f) df over mottakerbåndet: hvor mye av spekteret til en interferenskilde med enhetseffekt som havner der signalets gjør. Den effektive bærebølge-til-støy-tettheten er [1/(C/N₀) + (J/S)·κ]⁻¹.

seg-c5affeee5269 = <b>Støytall.</b> Hvor mye en mottaker legger til den termiske støyen, som et forhold F i desibel; systemets støytemperatur er T_ant + { "290" } K × (F − { "1" }).

seg-5307c38d3036 = <b>Waterfall.</b> Et tid-frekvens-bilde av et spekter: frekvens på tvers, tid nedover, farge for effekt.

seg-3b1ac094fdc5 = <b>Welch-estimat.</b> Et effekttetthetsspekter estimert ved å midle vindusbaserte, overlappende periodogrammer (Welch { "1967" }).

seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Et åpent opptaksformat: en JSON-fil <c1/> som beskriver en rå fil <c2/> med sampler (her komplekse <c3/>, <c4/> eller <c5/>).

seg-83041671f422 = <b>IQ — in-phase and quadrature.</b> De to komponentene i et komplekst basebåndsampel.

seg-39e6ea8506b3 = Signalbegreper for LEO-PNT

seg-36452ee3f5cc = Disse begrepene forekommer i typen <c1/> og scenarioene for flere bånd <c2/>; se <a1><c3/></a1>.

seg-8363a15f3c5a = <b>LEO-PNT — posisjonering, navigasjon og tidssynkronisering fra lav jordbane.</b> Navigasjonssignaler som sendes fra satellitter noen hundre til omtrent { "1200" } km oppe: sterkere og raskere i bevegelse enn GNSS fra middels høy jordbane.

seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.</b> ITUs (Den internasjonale teleunion) tjenestetildelinger som et bånd kan ligge i.

seg-d1e494623341 = <b>Pilot-, data- og innhentingskomponenter.</b> Delene av ett signal: en datafri pilot for avstandsmåling, en datakomponent som bærer navigasjonsmeldingen, og en kort komponent med lav datarate som er lett å finne.

seg-cce232b7cd6a = <b>FDMA — frekvensdelt flertilgang.</b> Komponenter eller satellitter som skilles med bærefrekvens i stedet for med kode.

seg-9d9476ee62b1 = <b>Gabor-båndbredde (RMS).</b> β = √(∫ f² G df / ∫ G df) over mottakerbåndet: hvordan et signals effekt er spredt i frekvens, noe som avgjør hvor fint det kan måle avstand.

seg-6febe9c2e506 = <b>DLL — delay lock loop.</b> Kodesporingssløyfen; avstanden mellom tidlig og sen korrelator og støybåndbredden bestemmer jitteren i avstandsmålingen fra termisk støy.

seg-5a55da97daf9 = <b>EFQPSK — enhanced Feher quadrature phase-shift keying.</b> En modulasjon med konstant envelope (Xona Pulsar); her tilnærmet med et spektrum av rektangulære chip-pulser.

seg-6dcbf1de9904 = <b>OFDM — ortogonal frekvensdelt multipleksing.</b> En flerbærebølgeform (nedlinken til Starlink); tegnet her som et flatt bånd.

seg-548b285c7c8e = <b>TEC — total elektroninnhold.</b> Elektroner per kvadratmeter langs banen; { "1" } TECU = 10¹⁶ el/m². Den ionosfæriske forsinkelsen av første orden er { "40.3" }·TEC/f² meter.

seg-dd7e0743f364 = <b>EIRP — effektiv isotropisk utstrålt effekt.</b> Sendeeffekt ganger antenneforsterkning mot mottakeren.

seg-aba3b3eaba85 = Integritet og forsterkning

seg-eab1b2c6728e = Integritet er <em>tillitsspørsmålet</em>: ikke «hvor stor er feilen min?», men «kan jeg sette en grense for den, og får jeg beskjed når grensen brytes?» Dette er luftfartens begreper for det.

seg-696a73449c49 = <b>RAIM — Receiver Autonomous Integrity Monitoring.</b> Enkelt sagt: <em>mottakeren kontrollerer satellittene mot hverandre.</em> Med flere satellitter enn de fire en posisjonsbestemmelse trenger, bør de overskytende målingene (residualene) være små; en stor residual betyr at én satellitt gir feil opplysninger, og mottakeren kan si fra om det uten hjelp fra bakken. Implementert i <a1><c1/></a1>.

seg-89237433f01a = <b>ARAIM — Advanced Receiver Autonomous Integrity Monitoring.</b> Den moderne formen av RAIM for flere frekvenser og flere konstellasjoner. Den får en integritetsstøttemelding som oppgir hver satellitts antatte feil og feilsannsynlighet, og gir beskyttelsesnivåer i stedet for et bestått/ikke bestått-flagg. Full beskrivelse, med alle forutsetninger, i <a1><c1/></a1>.

seg-4cc13de05193 = <b>SISRE — Signal-in-Space Range Error.</b> Enkelt sagt: <em>hvor mye en satellitts utsendte bane og klokke får avstanden en typisk bruker måler til å avvike.</em> Banefeilen deles i radielle, langsgående og tverrgående deler og veies etter hvor mye hver av dem slår ut langs en gjennomsnittlig siktlinje, og kombineres deretter med klokkefeilen (Montenbruck et al. { "2018" }). For en satellitt i lav jordbane veier de langsgående og tverrgående delene mye mer enn for GPS, fordi brukerne ser satellitten langt fra nadir. Brukes av <c1/>-typen.

seg-847e40a033e1 = <b>RAC — Radial, Along-track, Cross-track.</b> De tre retningene en banefeil deles opp i: ut fra jordens sentrum, langs flyretningen og vinkelrett på baneplanet. Modellen <c2/> i <c1/>-typen legger til et korreksjonspolynom i hver av dem.

seg-b725d23c839e = <b>SVID — Space-Vehicle Identifier.</b> Tallet en navigasjonsmelding bruker for å navngi satellitten som sendte den.

seg-b0f850eb04b1 = <b>IOD — Issue of Data.</b> En teller som endres hver gang innholdet i en satellitts navigasjonsmelding endres, slik at en mottaker kan skille en ny melding fra en gjentakelse. (Ikke å forveksle med en demonstrasjon i bane, også forkortet IOD, som i ESAs Celeste IOD.)

seg-985a5e9c9ce9 = <b>TOW — Time of Week.</b> Sekunder siden starten av den gjeldende GNSS-uken (søndag { "00" }:{ "00" }).

seg-1fc62dca46d6 = <b>CRC-24Q — 24-bits syklisk redundanssjekk (Qualcomm-polynom).</b> Feildeteksjonssjekken RTCM { "10403" }- og Galileo-meldinger bærer: en 24-bits rest av meldingens biter delt på polynomet <c1/>. En mottaker beregner den på nytt og forkaster en melding som ikke stemmer.

seg-abb4679dab23 = <b>URE — User Range Error.</b> Enkelt sagt: <em>hvor feil en satellitts egen utsendte bane og klokke gjør hver avstand til den.</em> Kalles også signalfeil i rommet (SISE); det er feilbudsjettet per satellitt som ARAIM og RAIM får som inndata (<c1/> i <a1><c2/></a1>).

seg-158c210fd3fe = <b>MHSS — Multiple Hypothesis Solution Separation.</b> Metoden ARAIM bruker. For hver måte konstellasjonen kan ha en feil på, danner den en løsning som utelater de mistenkte satellittene, og setter en grense for hvor langt denne delløsningen kan ligge fra løsningen med alle satellitter i sikte.

seg-671711003a6f = <b>HPL / VPL — Horizontal / Vertical Protection Level.</b> Enkelt sagt: <em>radien systemet lover at den sanne feilen ligger innenfor, ved en oppgitt integritetsrisiko.</em> Det er en grense algoritmen beregner, ikke en målt feil. En kjøring er tilgjengelig når beskyttelsesnivået holder seg under alarmgrensen operasjonen tillater (VAL, den vertikale alarmgrensen; HAL, den horisontale).

seg-5bbd2d664862 = <b>SBAS — Satellite-Based Augmentation System.</b> Et bakkenettverk som overvåker GNSS, beregner korreksjoner og integritetsgrenser og sender dem ut fra geostasjonære satellitter. <b>WAAS — Wide Area Augmentation System</b> er det amerikanske; EGNOS (European Geostationary Navigation Overlay Service) er det europeiske motstykket. Kshana beregner beskyttelsesnivåer i DO-229E-formen med vektet minste kvadraters metode (DO-229E er RTCAs minstekrav til ytelse for SBAS-mottakere; RTCA het tidligere Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

seg-ba8b448582af = Estimering og geometri

seg-2eb6e72496b8 = <b>Estimator.</b> Algoritmen som forutsier den sanne posisjonen eller tiden under et avbrudd ut fra sensormodellen. Kshana har en analytisk holdover-prediktor og et <b>Kalman-filter</b>.

seg-9b4aa612c5a9 = <b>Kalman-filter.</b> Enkelt sagt: <em>en algoritme som sporer en størrelse og også sporer hvor usikker den er.</em> Kshana bruker usikkerhetsgrensen til å beregne integritet.

seg-8fda81dfccc9 = <b>EKF — Extended Kalman Filter.</b> Et Kalman-filter for et ikke-lineært problem: det lineariserer modellen rundt det gjeldende estimatet i hvert steg. Standardvalget for å koble GNSS til et INS.

seg-9bc2c6f74b29 = <b>UKF — Unscented Kalman Filter.</b> Den samme jobben uten linearisering: det sender et lite sett deterministisk valgte prøvepunkter gjennom den sanne ikke-lineære modellen og gjenoppbygger gjennomsnitt og kovarians ut fra hvor de havner. Oppfører seg bedre når ikke-lineariteten er sterk, og det er derfor banebestemmelsen bruker det.

seg-a1e52820e3a0 = <b>DOP — Dilution Of Precision.</b> Enkelt sagt: <em>hvor mye satellittenes geometri forsterker avstandsfeil til posisjons- eller tidsfeil.</em> Posisjonsfeil ≈ PDOP × avstandsfeil, så et lavt tall betyr god geometri. Familien: <b>GDOP</b> (geometrisk — posisjon og tid sammen), <b>PDOP</b> (posisjon), <b>HDOP</b> (horisontal), <b>VDOP</b> (vertikal), <b>TDOP</b> (tid).

seg-e769a91a3e4b = <b>Walker-konstellasjon.</b> En standard måte å beskrive en satellittkonstellasjon på, ved antall baneplan og satellitter per plan (GPS er omtrent et 24/6 Walker-skall).

seg-b557933a4e4d = <b>Elevasjonsmaske.</b> Den minste vinkelen over den lokale horisonten der en satellitt regnes som brukbar; signaler som er for lave, utelukkes.

seg-3ac8e11c3e33 = <b>Okkultasjon.</b> Når jorden fysisk blokkerer siktlinjen til en satellitt.

seg-249bf472cb00 = <b>Horisontprofil (horisontmaske).</b> Enkelt sagt: <em>omrisset av bygninger, kraner eller åser mot himmelen, som en elevasjon for hver asimut.</em> En satellitt regnes som i sikte bare over <c1/> ved sin asimut, og en satellitt over masken men bak horisontprofilen er «skjult av horisontprofilen». Kshana bygger en horisontprofil fra en tabell, en gatekløft, sektorer og terreng (deres punktvise maksimum) eller en forhåndsinnstilling av typen REPRESENTATIVE; bare siktlinje, ingen refleksjon eller diffraksjon (<a1><c2/></a1>).

seg-620a88820a2d = <b>Himmelgeometri.</b> Hvilke satellitter et sted ser under en horisontprofil, og hva det gjør med løsningen: DOP-faktorene, øst-nord-opp-kovariansen til posisjonsbestemmelsen med minste kvadrater og dens <b>feilellipse</b>, det horisontale området som rommer den oppgitte andelen av posisjonsbestemmelsene ({ "95" } % som standard) for uavhengige, like store gaussiske avstandsfeil. MODELLED geometri under en oppgitt feilmodell, ikke en mottakers virkelige feil (<a1><c1/></a1>).

seg-f0e610122425 = <b>CTI — Composed Timing Integrity.</b> Beskyttelsesnivåer for <em>tid</em> i stedet for posisjon, beregnet over en overlevering mellom ulike tidskilder — for eksempel fra en satellittkontrollert (RAIM-tilgjengelig) klokke til en frittgående klokke i holdover — slik at grensen forblir gyldig gjennom overgangen (<a1><c1/></a1>).

seg-56642f614c3f = <b>TIB — Timing Integrity Benchmark.</b> Et målestykke for <em>andres</em> tidsmonitorer: det injiserer en meny av feil og kontrollerer om monitorens oppgitte beskyttelsesnivå faktisk begrenset feilen. Det fremsetter ingen egen nøyaktighetspåstand, så det kan ikke overdrive en (<a1><c1/></a1>).

seg-8b89f8b913b9 = Baner og cislunart rom

seg-ba6b669eb8ba = <b>CR3BP — Circular Restricted Three-Body Problem.</b> Jord–måne-systemet behandlet som to legemer i sirkelbaner om felles massesenter, pluss et romfartøy som er for lett til å dra tilbake. Nær månen er en Kepler-ellipse for to legemer rett og slett feil form; CR3BP er den billigste dynamikken som er riktig (<a1><c1/></a1>).

seg-2726a22bf14c = <b>NRHO — Near-Rectilinear Halo Orbit.</b> En periodisk CR3BP-bane som svinger tett over den ene månepolen og langt ut over den andre, så den sett fra enden er nesten en rett linje — derav «nær-rettlinjet». Det er banen som er valgt for månestasjonen Gateway, og den gir nesten sammenhengende siktlinje til jorden.

seg-2b2e6d04376c = <b>DRO — Distant Retrograde Orbit.</b> En annen CR3BP-familie: en stor, stabil bane som sirkler rundt månen baklengs, sett i det roterende koordinatsystemet.

seg-6bb9229aee5c = <b>EOP — Earth Orientation Parameters.</b> Jordens målte, litt uregelmessige vingling og spinn (polbevegelse, UT1 (Universal Time { "1" }, jordrotasjonstid)−UTC — jordrotasjonstid minus koordinert universaltid — og døgnlengde) som trengs for å gjøre om en jordfast posisjon til en treghetsposisjon med bedre enn meters nøyaktighet. IERS (International Earth Rotation and Reference Systems Service) publiserer dem; Kshana leser filen <c1/> via <c2/>.

seg-7f1e7e523e5b = Standarder, formater og organisasjoner

seg-5d8d6144c13a = Forkortelsene README-en og pakkesidene bruker for standarder, filformater, tidsskalaer, referansesystemer og organene bak dem. Hver av dem er også skrevet ut ved første bruk på de sidene.

seg-800d42de0777 = Baner, referansesystemer og tid

seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> De analytiske standardpropagatorene for publiserte satellittbaner.

seg-87a098568846 = <b>TLE — to-linjers elementsett.</b> Det offentlige baneformatet SGP4 leser.

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — lav jordbane / middels høy jordbane / geostasjonær transferbane / skråstilt geosynkron bane.</b> Banetyper; de fleste GNSS-satellitter flyr i MEO.

seg-1ec323dbd7a6 = LMO — lav Mars-bane.

seg-d0be640282af = <b>ECI / ECEF — jordsentrert treghetssystem / jordsentrert, jordfast.</b> Et referansesystem som ikke roterer med jorden, og et som gjør det.

seg-09a937adc1db = <b>TEME — true equator, mean equinox.</b> Referansesystemet SGP4 gir resultater i.

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — Geocentric Celestial Reference System / International Terrestrial Reference System / dets realisering, International Terrestrial Reference Frame.</b> De moderne treghets- og jordfaste referansesystemene.

seg-56b24c3734be = <b>CIO — Celestial Intermediate Origin.</b> Referansepunktet for den moderne jordrotasjonskjeden uten jevndøgn.

seg-a23b05c85a63 = <b>LVLH — lokal vertikal, lokal horisontal.</b> Et referansesystem som følger med romfartøyet.

seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> Jordellipsoiden GPS bruker.

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — koordinert universaltid / internasjonal atomtid / terrestrisk tid / universaltid { "1" } (jordrotasjonstid) / barysentrisk dynamisk tid.

seg-ea7eb1f34cae = <b>LTC / TCL — Lunar Coordinate Time (Temps-Coordonnée Lunaire).</b> Den foreslåtte tidsskalaen for månen.

seg-c6e5976d9dff = <b>OD — banebestemmelse.</b> Å utlede en bane fra sporingsmålinger.

seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> og <b>DRO</b> er definert under «Baner og cislunart rom» ovenfor.

seg-2e6ba9069396 = Filformater og meldinger

seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> Filformatet for presise baner fra International GNSS Service (IGS), i versjon c og d.

seg-1bfa0d083935 = <b>RINEX — Receiver Independent Exchange Format.</b> Standard filformat for GNSS-observasjoner og utsendte efemerider.

seg-39ce08a9ae66 = IONEX — IONosphere map EXchange format.

seg-c23ea3515008 = <b>OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Standardmeldinger for baner og sporingsdata fra Consultative Committee for Space Data Systems (CCSDS).

seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Ren tekstformat for Kshana-scenarioer.

seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> Kshana sin versjonerte, selvbeskrivende resultatpakke.

seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> RTCAs minstekrav til ytelse for SBAS-mottakere og for GPS-utstyr om bord i fly med flybasert forsterkning.

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> GPS-grensesnittspesifikasjonene (den andre dekker L5-signalet).

seg-2230000aa30b = <b>NIST SP { "1065" }.</b> National Institute of Standards and Technology sitt <em>Handbook of Frequency Stability Analysis</em>.

seg-8b89719c1859 = <b>TRL — teknologisk modenhetsnivå.</b> En skala fra 1 til 9 for maskinvaremodenhet.

seg-16c972f4ea0a = Organisasjoner

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — Den europeiske romfartsorganisasjonen, dens europeiske romoperasjonssenter og dens europeiske sporingsnettverk.

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — den amerikanske romfartsorganisasjonen NASA (National Aeronautics and Space Administration), dens Jet Propulsion Laboratory, dens Navigation and Ancillary Information Facility (som publiserer verktøysettet SPICE — Spacecraft, Planet, Instrument, C-matrix, Events) og dens Deep Space Network.

seg-eaa5a2a51169 = <b>IGS</b> — International GNSS Service. <b>IERS</b> — International Earth Rotation and Reference Systems Service. <b>IAU</b> — Den internasjonale astronomiske union (hvis SOFA-bibliotek, Standards of Fundamental Astronomy, og dets åpne port ERFA, Essential Routines for Fundamental Astronomy, er Kshana sine referanser for referansesystemer).

seg-81af4c0f4c48 = <b>CCSDS</b> — Consultative Committee for Space Data Systems. <b>AIAA</b> — American Institute of Aeronautics and Astronautics. <b>RTCA</b> — het tidligere Radio Technical Commission for Aeronautics.

seg-aa0b395df17f = Programvare og leveransekjede

seg-b42188d3a6f4 = CLI — kommandolinjegrensesnitt.

seg-198c591514ab = <b>MCP — Model Context Protocol</b>, protokollen Kshana sin agentserver snakker. <b>IDE — integrert utviklingsmiljø.</b>

seg-287bf61a1a16 = SBOM — programvarestykkliste (software bill of materials).

seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, rammeverket for byggeopprinnelse som Kshana-utgivelsene attesteres under.

seg-7487c6f9ed18 = Alle andre forkortelser, A til Å

seg-56f6039bb38a = Alle forkortelser som brukes i dokumentasjonen i repoet (<c1/> og de fire README-filene) og som ingen seksjon ovenfor definerer, pluss noen som en seksjon definerer, gjentatt for oppslag. Hver side skriver også ut forkortelsene ved første bruk; denne tabellen er det ene stedet å slå dem alle opp. Noen oppføringer er identifikatorer eller navn og ikke forkortelser, og sier det.

seg-c0dfa446e523 = Står for

seg-f272d28225ae = Hvor den dukker opp

seg-ffb0596f134b = Third Generation Partnership Project

seg-77c1b4478387 = organet som skriver 5G-standardene, inkludert ikke-terrestriske nett

seg-eaf19768b977 = femte generasjons mobilnett

seg-692ddc163c55 = inkludert posisjonering i ikke-terrestriske nett (NTN)

seg-9524be916f07 = ABI

seg-0e8332db764b = binærgrensesnitt for applikasjoner (application binary interface)

seg-762ea76708dc = Python wheel-tagger

seg-d419d06ed622 = ABMF

seg-b294c714487d = IGS-stasjonen i Le Moule, Guadeloupe

seg-586a8ea87638 = en stasjonsidentifikator på fire tegn

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = vekselstrøm

seg-9cfb5dc4b4bc = som i AC-Stark-effekten (lysforskyvning)

seg-90308009c536 = ADD

seg-49d97c65662d = Algorithm Description Document

seg-493b5ceaa0fb = referansealgoritmen for ARAIM i fly fra WG-C

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = Allan-deviasjon / overlappende Allan-deviasjon

seg-23c38ecbc543 = se Allan-deviasjon ovenfor

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = delenumre for treghetssensorer (Analog Devices; Safran Sensonor; MicroStrain)

seg-c4c0a93477a8 = identifikatorer, ikke forkortelser

seg-36743c7fe98e = AEM

seg-142ca108a070 = Attitude Ephemeris Message

seg-c34185a83d8e = en CCSDS-melding

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = Aerospace and Electronic Systems Society

seg-78692bf5addf = i IEEE

seg-f429be16014e = AF

seg-afa04bc28b42 = midlingsfaktor

seg-b3db60632b92 = det heltallige multiplumet av prøveintervallet i en estimator av Allan-typen

seg-6097c4709542 = AFS

seg-7043ab3fe32b = Augmented Forward Signal

seg-20380d29d286 = LunaNets navigasjonssignal for månen

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = automatisk forsterkningsregulering

seg-750b8717220b = en jamming-indikator i en mottakers frontend

seg-31b864b910d5 = AHP

seg-f956cbe86552 = Analytic Hierarchy Process

seg-c2b63847e2dc = en vektingsmetode med flere kriterier (Saaty)

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = kunstig intelligens / maskinlæring

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = alarmgrense / horisontal alarmgrense / vertikal alarmgrense

seg-1e52f04eb047 = feilen en integritetsmonitor må sette en grense for

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = alternativ binær offsetbærebølge

seg-e3acb231cf4d = Galileo E5-modulasjonen

seg-79b130764f97 = aritmetisk middel–harmonisk middel (ulikhet)

seg-190b782b70ce = AOCS

seg-6459d9bce282 = holdnings- og banekontrollsystem

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = signalinnhenting / tidspunkt for nærmeste passering / signaltap

seg-8b73e2c51498 = hendelsene i en passering over en bakkestasjon (LOS betyr også siktlinje; sammenhengen viser hvilken)

seg-27ceb7163571 = API

seg-7903f5ff4027 = programmeringsgrensesnitt

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = identifikator for applikasjonsprosess

seg-55730824c8cf = overskriftsfeltet i CCSDS Space Packet

seg-611cd7a0d378 = APS

seg-55842a648c47 = American Physical Society

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = innflyging med vertikal veiledning

seg-69a6cc8a532a = APV-I: { "40" } m horisontale og { "50" } m vertikale alarmgrenser

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = gjennomsnittlig kjørelengde

seg-08a5d53f813c = gjennomsnittstiden en endringsdetektor bruker før den gir alarm

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = Arm-prosessorarkitekturen / dens 64-bits form

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = amplitudespektraltetthet

seg-9fb629e35a25 = kvadratroten av en effektspektraltetthet

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = astronomisk enhet

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = arealet under kurven / mottakerens driftskarakteristikk (receiver operating characteristic)

seg-4d65dbf47a5c = evaluering av detektorer

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = er vert for et åpent speil av SRTM-høydefliser

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = tap ved inntrenging i bygning

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = skjevhetsustabilitet

seg-ff2ba8692cbc = det flate minimumet i Allan-deviasjonen til en treghetssensor

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = Bureau International des Poids et Mesures (Det internasjonale byrå for mål og vekt)

seg-6ec98084ac58 = publiserer Circular T

seg-4ff08facda60 = BKG

seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (Tysklands føderale byrå for kartografi og geodesi)

seg-ac4765a77015 = driver et IGS-datamirror

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = som i BSD-lisensene

seg-97764c651815 = BSP

seg-8f85848ee08a = binær SPK

seg-6e01dca47581 = en binær SPICE-efemeridekjernefil

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = motstandsleddet i et to-linjers elementsett

seg-628e6c686508 = CAI

seg-a2418a88886c = kaldatom-interferometer

seg-273a3b8d5385 = se QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

seg-a1f55ee72524 = en data- eller tekstlisens

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = Crustal Dynamics Data Information System

seg-5b3f50bed1f6 = NASAs arkiv for romgeodesi

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = kumulativ fordelingsfunksjon

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = konstant falsk alarmrate

seg-b38b56b63da6 = en terskelregel for innhentingsdetektor

seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

seg-4dab086e5c3d = BeiDous datum

seg-8f7751d39781 = CIP

seg-e34a194da574 = Celestial Intermediate Pole

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = Celestial Intermediate Reference System

seg-a543c4d02ace = CISA

seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

seg-59c481cb5741 = i amerikanske DHS

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = sivil moderat / sivil lang

seg-cc0c8f1524f8 = de to tidsmultipleksede GPS L2C-kodene

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = beskyttelsesnivå for fellesmodus

seg-d469cd44d9d4 = grensen for feil en residualtest ikke kan se

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = converged Newtonian

seg-5d679a981a34 = SPICE-korreksjonen for lystid og aberrasjon

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = i dB-Hz

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment

seg-b99fe66bd09c = en rangeringsmetode med flere kriterier

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = Committee on Space Research

seg-235850ad0d1f = utsteder internasjonale satellittbetegnelser

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = periode per omløp

seg-a1d4080ce019 = en empirisk baneakselerasjon ved omløpsfrekvensen

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = sentral / grafisk / nevral prosesseringsenhet

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = Cramér–Rao-grense / nedre Cramér–Rao-grense

seg-6eb684e34f56 = den minste variansen en forventningsrett estimator kan oppnå

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

seg-eb95135f849c = ILRS normalpunktfiler

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = antenne med kontrollert mottaksmønster

seg-7111b9c4d382 = en antennegruppe mot jamming

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = konsistensforhold / tilfeldighetsindeks

seg-cfa91dc02138 = AHP-konsistenskontrollen (godta CR < { "0.10" })

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = det franske selskapet som vedlikeholder Orekit

seg-58d5f143ff3b = et selskapsnavn, ikke en forkortelse som skal utvides

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = kodeskiftnøkling

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = Cascading Style Sheets

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = kumulativ sum

seg-66f752e15abc = en sekvensiell endringsdetektor

seg-92ac0357d01e = CV

seg-28f75c073917 = (felles sikt i tidsoverføring; sammenhengen viser hvilken)

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = JSON-sceneformatet til CesiumJS

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = desibel / desibel-watt / desibel-hertz

seg-c485de5bcd85 = effektforhold, absolutt effekt og en C/N0-enhet

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = likestrøm

seg-0ea7fccee332 = grensen ved null frekvens

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = retningskosinusmatrise

seg-9d3d9ca79a9d = en rotasjonsmatrise

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin

seg-1545bd59f5ef = DCT

seg-8b6866288bea = designkontrolltabell

seg-80d95f099e9a = en lenkebudsjettabell (JPL DESCANSO Galileo X-bånd-eksempelet)

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL Development Ephemeris (versjon { "421" }, { "430" }, { "440" }, { "441" })

seg-748af19e3f0b = planet- og måneefemerider; «DE-grade» betyr nøyaktighet i den klassen

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = digital høydemodell

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

seg-2e11a1976171 = JPLs monografiserie

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (tysk geodetisk forskningsinstitutt ved det tekniske universitetet i München)

seg-e7cedd55549e = er vert for EUROLAS Data Center

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = differensiell GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = Department of Homeland Security

seg-6b487421c547 = USA

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = Department of Defense

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = frihetsgrad

seg-bf5bc69cb873 = se 1-DOF ovenfor

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = differensiell énveis avstandsmåling / delta differensiell énveis avstandsmåling

seg-6ba2d3b5b724 = vinkelsporing i dypt rom

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = numeriske integratorer

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = rotmiddelkvadrat av avstand

seg-a8ed04890ded = se 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = dokumentnumre for datablad fra Microchip

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = Deep Space Atomic Clock

seg-e80350ed521f = NASAs klokke med fanget kvikksølvion

seg-52e838301c0b = UT1 minus UTC

seg-fbce3b3b7b80 = jordrotasjonskorreksjonen

seg-8aa996f34920 = energi per bit over støytetthet

seg-463b21c0b791 = treghetssystemet som er innrettet med det jordfaste systemet ved starten av en kjøring

seg-4dc987bd9dbf = brukes av leo-pass-interoperabilitetseksportene

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = standarden bak JavaScript / en ES-modul

seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

seg-2967e958f353 = en GNSS-modell for solstråletrykk (CODE: Center for Orbit Determination in Europe)

seg-244af4062ccc = ECSS

seg-b74029376aba = European Cooperation for Space Standardization

seg-d452e23d503a = ECSS-E-ST-10-02 er dens verifikasjonsstandard

seg-becb6685ff13 = ED

seg-b6448e14a567 = EUROCAE-dokument

seg-ee4ada9c4c6e = som i ED-259A

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = innflyging, nedstigning og landing

seg-69f37001de44 = EEE

seg-18a1b66286ee = elektriske, elektroniske og elektromekaniske (komponenter)

seg-f814c1301059 = kvalitetssikring i romfart

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = Earth Gravitational Model (utgaven fra { "2008" })

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (eliminasjon og valg som uttrykker virkeligheten)

seg-efb2f919955a = en overrangerende metode med flere kriterier

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, MPP02-versjonen (Chapront)

seg-b1d699d70339 = en analytisk månteori

seg-aee5eeb23064 = jordens middelekvator og jevndøgn for J2000

seg-16d9b8eac95d = et treghetssystem

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = en kodediskriminator

seg-0e4110d33849 = EMT

seg-103c6de62575 = effektiv monitorterskel

seg-4b2101113387 = en ARAIM-utdata

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = øst-nord-opp / nord-øst-ned

seg-aae7610833a7 = lokalnivå-referansesystemer

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = jordobservasjon

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (utgaven fra { "2021" })

seg-bd2a27a17f6d = IAA RAS-efemeride

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = jordrotasjonsvinkel

seg-966ed500f705 = ESKF

seg-e79112a3132a = Kalman-filter for feiltilstand

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = effektiv utvalgsstørrelse

seg-57ce1c1b617b = i et partikkelfilter

seg-f529300f944b = ESSR

seg-869be8388d26 = European Space Software Repository

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = efemeridetid

seg-e0c49639649e = SPICEs navn på TDB

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = European Organisation for Civil Aviation Equipment

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = European Laser Network

seg-fa7025d88c88 = laseravstandsmåling til satellitter og månen

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = ofte stilte spørsmål

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = Federal Communications Commission

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = fullt koblet nevralt nettverk

seg-1de7b4410369 = FD

seg-4e73ff36d37f = endelig differanse

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = feildeteksjon og utelukkelse

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = Finite Element Solution (utgaven fra { "2004" })

seg-878b4a645ae9 = en havtidevannsmodell

seg-55c14f474a10 = FIM

seg-b68c86e68570 = Fisher-informasjonsmatrise

seg-d39671724dfc = Fowler–Noll–Vo-hash, variant 1a

seg-3354ad42f7dd = brukes til å feste gyldne utdata

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = full operativ evne / validering i bane

seg-ce13cca7f222 = satellittgenerasjoner (Galileo, Xona Pulsar)

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = synsfelt / momentant synsfelt

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = feltprogrammerbar portmatrise / mikrokontrollerenhet / sanntidsoperativsystem

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = fririmstap / fririmsbanetap

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = gigabyte / kilobyte / megabyte

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = Geocentric Celestial Reference Frame

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = geostasjonær bane

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = gravitasjonsgradient

seg-d8ef4d361e86 = som i gravitasjonsgradient-dreiemoment

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = gigahertz / kilohertz

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = globalt ionosfærekart

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = GNSS/INS-integrasjon / datasettet og koden for Kalman-filter GNSS/INS fra Wuhan University

seg-deca3cbe41ac = GIS

seg-36275ece527d = geografisk informasjonssystem

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = vertikal ionosfærefeil i rutenett

seg-20a40777d78a = et SBAS-meldingsbegrep

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = en programpakke for GNSS-databehandling distribuert av ESA

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = GNU C-biblioteket

seg-2630ae5f0bc5 = Russlands Global Navigation Satellite System (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

seg-361f1f18d454 = GLS

seg-397d58b727ee = generalisert minste kvadraters metode

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = gravitasjonsparameter

seg-e3a296392ac0 = gravitasjonskonstanten ganger et legemes masse

seg-45a8f50bce06 = General Mission Analysis Tool

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = et gravitasjonsfelt for Mars

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = Greenwich middelstjernetid

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = styring, navigasjon og kontroll

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = generell relativitetsteori

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = GRAIL-gravitasjonsmodellene for månen fra NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

seg-220fae5cfc61 = Geodetic Reference System { "1980" }

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = avstand mellom bakkeprøver

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = bakkestøtteutstyr

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = Goddard Space Flight Center

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = Hadamard-deviasjon / overlappende Hadamard-deviasjon

seg-bb846135ceb4 = et stabilitetsmål som ikke påvirkes av drift

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = maskinvare i sløyfen

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = farlig villedende informasjon / villedende informasjon

seg-1cbf9d6f135d = områder i Stanford-diagrammet

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = Institute of Applied Astronomy of the Russian Academy of Sciences

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = International Association of Geodesy

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = International Association of Geomagnetism and Aeronomy / dens arbeidsgruppe V-MOD (modellering av jordens magnetfelt)

seg-28805f15bae8 = vedlikeholder IGRF

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = initialbetingelse

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = Den internasjonale sivilluftfartsorganisasjonen

seg-c2d2d459177d = ICD

seg-a018300615e2 = grensesnittkontrolldokument

seg-433b45040abd = som i Galileo OS SIS ICD

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = International Centre for Global Earth Models

seg-e9650a618b38 = ID

seg-e40875ab1090 = identifikator (eller identifikasjon, som i støytype-ID)

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

seg-ce9375732735 = IF

seg-746eae5ce367 = mellomfrekvens

seg-ed568f55aa8f = mottakerprøver

seg-cb4aaa2581bb = IGS sin realisering av ITRF2014

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = International Geomagnetic Reference Field

seg-669611e731d0 = IGRF-14 (filen IGRF14.shc) er den 14. generasjonen

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = skråstilt geosynkron bane

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = en GPS-satellittgenerasjon

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = International Laser Ranging Service

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = heltalls minste kvadraters metode

seg-a214c483b8a8 = løsning av flertydighet

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

seg-22048a770612 = Observatoriet i Paris; publiserer INPOP

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, versjon 21a

seg-577acd29f11b = en planetefemeride

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = Interagency Operations Advisory Group

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = Institute of Navigation / dets International Technical Meeting

seg-53abad80634c = IoT

seg-9b766d557bd1 = tingenes internett

seg-1b41d114662e = IR

seg-ff2d89b32d07 = integritetsrisiko

seg-2dc9fcadccd6 = sannsynligheten for farlig villedende informasjon

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = Institute of Radio Engineers

seg-3fbae7e11fca = en forgjenger til IEEE

seg-9e3d84279d56 = klokkeforskjellen mellom to GNSS

seg-2ffee4396fbd = ISL

seg-505dee046f7a = lenke mellom satellitter

seg-010ea5a76e2e = ISM

seg-330b25f923db = integritetsstøttemelding

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = Den internasjonale standardiseringsorganisasjonen

seg-8291ac1ccba6 = ISO { "8601" } er dens format for dato og tid

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

seg-14dc2a58e2c3 = International Telecommunication Union Radiocommunication Sector

seg-0e8094e4d45c = dens P-serie-anbefalinger modellerer bølgeutbredelse

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = juliansk dato / modifisert juliansk dato

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = Joint Research Centre i EU-kommisjonen / ett av dets rapportnumre

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = Kalman-filter

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = en OGC-standard som leses av Google Earth

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = postypeetiketter i Kshana sitt eget tekstformat for LEO-navigasjonsmeldinger

seg-3269a4e6b3e3 = en utvidelse i Kshana, ikke en standard

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = nøkkelindikator for ytelse

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = Kennedy Space Center

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = tekstformen til CCSDS-meldinger

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = lineær kongruensgenerator

seg-8927ca404e64 = generatoren for testserien i NIST SP { "1065" }

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services

seg-5253cae4b05b = ESA-tjenesten Moonlight

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = skiftregister med lineær tilbakekobling

seg-5b09c8e3f127 = generering av spredekoder

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = loven om den itererte logaritmen

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = indikator for tap av lås / indikator for signalstyrke

seg-7d95179a5a1f = RINEX-observasjonsflagg

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = laseravstandsmåling til månen

seg-20deda97c876 = LLVM

seg-5a84a3219546 = kompilatorinfrastrukturen LLVM (opprinnelig Low Level Virtual Machine)

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = eldre navigasjonsmelding

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = satellittsystem for navigasjon og kommunikasjon på månen

seg-4ce3c0ea7a31 = konstellasjonscasene i NAVIGATION { "70" }({ "4" }), navi.613

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

seg-97ff1706b4bd = en foreslått konstellasjon for månen

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = lokaliseringsytelse med vertikal veiledning / dens kategori med beslutningshøyde { "200" } ft

seg-090ba62634a8 = innflyging i luftfart

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = skuddsekunder

seg-54ea05b82cb4 = som i Δt_LS

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = lystid

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = 4G-mobilstandarden

seg-3530cdaca137 = LU

seg-58ad64b9d450 = LU-dekomposisjon (lower–upper)

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment

seg-84874825a5d1 = fløy til månen i { "2025" }

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = Stanfords PNT-bibliotek for månen

seg-893ba320da76 = et navn

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

seg-a24b3840d248 = Stanford

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = produksjon, montering, integrasjon og test

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = JPL-løsninger for satellittefemerider for månene til Mars, Jupiter og Saturn

seg-9b0688bfc31e = identifikatorer

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = minimumskrav til systemytelse i luftfart

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = et produkt for numerisk databehandling

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = nyttelære med flere attributter

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = beslutningsanalyse med flere kriterier

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = månesentrert treghetssystem / månesentrert, månefast

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = minste detekterbare skjevhet

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = modifisert Allan-deviasjon

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = mikroelektromekaniske systemer

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO (Métrologie Optique), laserstasjonen i Grasse / Matera Laser Ranging Observatory

seg-a8fcbefbbf4c = stasjoner for laseravstandsmåling til månen

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = middels jord / hovedakser

seg-f30f1a2778cf = de to månefaste referansesystemene (MOON_ME, MOON_PA)

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = Multi-GNSS Experiment

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = Massachusetts Institute of Technology

seg-e9d7062835a9 = som i MIT-lisensen

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = flerlags perseptron

seg-6975432180f6 = et lite nevralt nettverk

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = middels for datoen / sann for datoen

seg-1af66f9b771d = referansesystemer med ekvator og jevndøgn

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = minimumskrav til operativ ytelse

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = gravitasjonsmodellene { "110" } og 110B2 fra Mars Reconnaissance Orbiter

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = laveste støttede Rust-versjon

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = modulasjonsoverføringsfunksjon

seg-7f60d1ac40ad = optisk avbildning

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = minimumsvarians uten forvrengning (minimum-variance distortionless response)

seg-83f57219e5b7 = adaptiv stråleforming

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = mikrobølgelenke

seg-639266912f59 = ACES-lenken for tidsoverføring

seg-5ac07401e4f8 = NaN

seg-722d679807ee = ikke et tall

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = navigasjon (melding) / observasjon

seg-1729ddf0eafa = de to RINEX-filtypene; Stanford NAV Lab er Navigation and Autonomous Vehicles Laboratory

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = det tidligere amerikanske National Bureau of Standards / referansedatasettet NBS14 for frekvensstabilitet

seg-3d1ac5146fea = brukes til å kontrollere Allan-estimatorer

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = normalisert estimeringsfeil i annen / normalisert innovasjon i annen

seg-af167a77a1dc = konsistenstester for filtre

seg-beb7a86721ec = National Geospatial-Intelligence Agency

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = National Imagery and Mapping Agency / dens tekniske rapport TR8350.2 (definisjonen av WGS { "84" })

seg-ffa6025b5a70 = NIMA er det tidligere navnet på NGA

seg-af4be907e56c = NLOS

seg-22ab7d58324b = et signal som bare er reflektert

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = ikke-negativ minste kvadraters metode

seg-af8ca8550600 = NORAD

seg-07428e7224cf = North American Aerospace Defense Command

seg-4edb033e3432 = fører den offentlige satellittkatalogen

seg-dd984e16dbcd = NP

seg-f92816d7c936 = Neyman–Pearson

seg-fc214695fa83 = deteksjonsteori

seg-3ef8006482bb = NPA

seg-81a072ee0520 = ikke-presisjonsinnflyging

seg-b9fd2cf6a2b9 = luftfart

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = nutasjon–presesjon–skjevhet

seg-b4562efbafdf = IAU 2006/2000A-matrisen

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = Naval Research Laboratory / dets atmosfæremodell Mass Spectrometer and Incoherent Scatter Radar Extended, { "2000" }

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = ikke-terrestrisk nett

seg-1ae0305d8455 = 5G fra satellitter

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = identifikatorer for overdrevne påstander

seg-47ba87f3730b = rader i CLAIMS-VS-REALITY.md

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = format for containerbilder

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = ordinær / stokastisk differensialligning

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = banedatameldinger

seg-35fe6a2f3de3 = CCSDS-familien som omfatter OEM og OMM

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = ordinære / vektede minste kvadrater

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = ESAs satellitt for programvarelaboratorium i bane / dens datasett for avviksdeteksjon

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = autentisering av Galileo-signaler

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = Open Service (Galileo, BeiDou), eller operativsystem

seg-6db10af375e3 = sammenhengen viser hvilket

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = Ornstein–Uhlenbeck

seg-9be9042ec983 = en støyprosess som vender tilbake til middelverdien

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = kvalitetssikring (også presisjonsinnflyging, som i K_H,PA)

seg-65ad442b3faa = PCK

seg-c788fe80678e = kjerne for planetkonstanter

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = sannsynlighet for deteksjon / sannsynlighet for falsk alarm

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = referansesystemet mellom TEME og ITRF

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = satellittidentifikatorer: en SP3-etikett for en GPS-satellitt, et pseudotilfeldig støytall for SBAS, et Galileo-satellittnavn

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

seg-302c8cb738ac = ACES-cesiumklokken

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = beskyttelsesnivå

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = faselåst sløyfe

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / en av dets artikkelidentifikatorer

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = fasemodulasjon / frekvensmodulasjon

seg-279251adb2eb = støy på en klokkes fase eller på dens frekvens

seg-685fc49957e2 = PN

seg-209dacf76ff3 = som i PN-avstandsmåling

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = presis banebestemmelse

seg-b7919977bf20 = PPN

seg-ed81960f1282 = parametrisert post-newtonsk

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = presis punktposisjonering / sanntidskinematikk / enkeltpunktsposisjonering

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = puls per sekund

seg-2619e854281a = PR

seg-66c53cdfc3d9 = pull request

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = pseudotilfeldig støy (kodenummer)

seg-6f384580af80 = hvordan GNSS-satellitter navngis i signaler

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = et tidsskrift

seg-78a947083d45 = PSD

seg-6eb799bd1582 = effektspektraltetthet

seg-ab1af8b3d968 = se ovenfor

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

seg-2800b3a8cd2e = GPS SPS PS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

seg-611e7e4a34f4 = Tysklands nasjonale metrologiinstitutt

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = posisjon, hastighet og tid

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = bindingsbiblioteket mellom Rust og Python / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = det geodetiske datumet til GLONASS

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = kvalitetssikring

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = kvadraturfaseskiftnøkling

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = Quasi-Zenith Satellite System

seg-531943b17837 = Japan

seg-697c55525b36 = RAAN

seg-85cd6997e07e = rektascensjon til den stigende noden

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover

seg-76da7c5bf39a = robusthetsmodellen til RethinkPNT/Firesmith

seg-7bb5ed20c788 = RF

seg-35b036272c8e = radiofrekvens

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = høyre side

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = rotmiddelkvadrat / kvadratrot av kvadratsum

seg-8b2bd83256f1 = RNG

seg-b90957003307 = tilfeldighetsgenerator

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = avkastning på investering

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = amerikanske DHS

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

seg-4a7703f1b605 = dens meldingsstandard bærer CRC-24Q

seg-520c91fa0ef0 = et åpen kildekode-bibliotek for GNSS-posisjonering (kinematikkbibliotek i sanntid)

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = radial, transversal, normal

seg-b1b635ff08e4 = et banefast referansesystem

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = tilfeldig gange

seg-8b593d7d5dbd = som i skjevhetens tilfeldige gange

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = frekvensmodulasjon med tilfeldig gange, hvit og flimmer / fasemodulasjon med hvit og flimmer

seg-7fced178bcc5 = potenslov-støytypene for klokker

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = produktnavn fra Microchip (to atomklokker i brikkestørrelse, en ovnsstyrt krystalloscillator)

seg-8a1ae00c4a52 = navn, ikke forkortelser

seg-a58426a850fd = SD

seg-d46cb77d53f6 = standardavvik

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = Service Definition Document

seg-9415da7a79ab = som i Galileo OS SDD

seg-1022626b788c = SDK

seg-2076da4dd4dd = programvareutviklingssett

seg-9fb492bced01 = SDR

seg-1a1082059103 = programvaredefinert radio

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = Space Defense Squadron

seg-c3f6fc1456ed = 18. SDS fører den amerikanske satellittkatalogen

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = Sol–jord–sonde-vinkelen (også kuleformet sannsynlig feil)

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = stokastisk gradientnedstigning

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = enkel harmonisk bevegelse

seg-b0973ab206ed = SI

seg-35624e5e4630 = Det internasjonale enhetssystemet

seg-02aa435dc884 = SIB

seg-262a811c8b69 = Safety Information Bulletin

seg-b9ee445609f5 = EASA; EASA er EUs luftfartssikkerhetsbyrå

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format

seg-3466519e4c62 = geodetiske løsninger

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = utvalg med viktighetsresampling

seg-7a2e0e9cac08 = et partikkelfilter

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = signal i rommet / nøyaktighet for signal i rommet

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = laseravstandsmåling til satellitter

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design

seg-dfc105c0178b = læreboken

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = signal-til-støy-forhold

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = kvadratsum / sum av kvadrerte residualer

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = det fremste som finnes

seg-127e73a3610b = NIST Special Publication { "1065" }

seg-bedc9a3d8d9f = samme dokument som NIST SP { "1065" }

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = symmetrisk positiv definitt / positiv definitt

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = lisensidentifikatorene i filhoder

seg-b377a91a047f = SPK

seg-5603642c612d = SPICE-kjerne for efemerider til romfartøyer og planeter

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = enkeltpunkt for svikt

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = overvåking av signalkvalitet

seg-a4e75468e6f9 = spoofing-kontroller basert på korrelatorform

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = informasjonsfilter med kvadratrot

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = solstråletrykk

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission / dens format for høydefiler

seg-4692354a98de = fliser navngis etter sitt sørvestlige hjørne, for eksempel N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics

seg-1d8167212f57 = JPL-gruppen

seg-d21315ea8c52 = STEC

seg-84689b829867 = skrått totalt elektroninnhold

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = et produkt for oppdragsanalyse

seg-17d792c12885 = Iridiums tjeneste for posisjonering og tidssynkronisering

seg-3efaadad9c96 = STM

seg-da395fa674ec = tilstandsovergangsmatrise

seg-d116578b987b = SV

seg-caa37a1e7d12 = romfartøy (en satellitt)

seg-845e6f3a37ec = SVD

seg-e775c436db4b = singulærverdidekomposisjon

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = telekommando / telemetri

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = testdrevet utvikling

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = tids- / frekvensforskjell i ankomst

seg-aecac9c9d2d0 = passiv lokalisering av sendere

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = terrengkonturtilpasning

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery

seg-941eccec7400 = innspilte GNSS-spoofing-data (OAKBAT er et datasett av samme klasse)

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = tidsintervallfeil

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service

seg-12f4af2b48c1 = ITU-medlemskontoer

seg-c05ba396ac1e = ToA

seg-78a41e672189 = ankomsttid

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = toleranse

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = total deviasjon / total varians

seg-7350da5c5c30 = stabilitetsestimatorer med utvidet rekkevidde

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = beskyttelsesnivå for tidssynkronisering

seg-10c9563602b7 = se SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = termisk beskyttelsessystem

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = terrengreferert navigasjon

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = teknisk rapport / teknisk notat

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = Delft University of Technology

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = toveis satellittoverføring av tid og frekvens / toveis overføring av tid og frekvens

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = den binære mottakerprotokollen fra u-blox

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = differensiell avstandsfeil for brukeren

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = brukerekvivalent avstandsfeil

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

seg-f4da31f92a79 = en IEEE Transactions

seg-573db7b5995b = { "300" } MHz til { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = brukergrensesnitt / brukeropplevelse

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = uniform lineær gruppe

seg-db65f4a7586d = ULP

seg-ae7458813685 = enhet i siste siffer

seg-d7f4df5a9d13 = presisjon i flyttall

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = brukerens avstandsnøyaktighet / brukerens avstandsfeil

seg-17e8fb142c6c = URA setter grenser for integritet, URE er nøyaktigheten som RMS

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = uniform resource locator

seg-088e05d67af1 = USGS

seg-ffed8eca324d = United States Geological Survey

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = United States Naval Observatory

seg-39ed84639c60 = USO

seg-f9f684640e53 = ultrastabil oscillator

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (optimalisering med flere kriterier og kompromissløsning)

seg-7fe170288e4e = interferometri med svært lang grunnlinje

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

seg-1746693259e0 = SBAS; se ovenfor

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

seg-c9710476b8b5 = Working Group C i samarbeidet mellom Den europeiske union og USA om satellittnavigasjon

seg-79f0e87410bf = publiserer referansedokumentene for ARAIM

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = hvit gaussisk støy

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 bruker konstanter fra WGS72

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = Wuhan University

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = vektet sum-modell / vektet produkt-modell

seg-cc68c85bb2b9 = aggregering med flere kriterier (WPM betyr også fasemodulasjon med hvit støy; sammenhengen viser hvilket)

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = eksklusiv eller

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = komponentene i jordens magnetfelt: nord, øst, ned, total styrke; deklinasjon, inklinasjon

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it (du kommer ikke til å trenge det)

seg-e4e177088376 = et designprinsipp

seg-565c1908393c = ZHD

seg-77a0948bc15d = hydrostatisk forsinkelse i zenit

seg-749be52554c5 = Reproduserbarhet og lisensiering

seg-d78d9bbb905c = <b>Reproduserbar (deterministisk).</b> De samme inndataene gir alltid bit-for-bit identiske utdata — <c1/>. Ingen skjult tilfeldighet.

seg-1412347e2298 = <b>Seed.</b> Tallet som initialiserer den (deterministiske) tilfeldighetsgeneratoren, slik at kjøringer kan gjentas.

seg-3a35740e04a8 = <b>Åpen kjerne.</b> Forretningsmodellen: motoren er gratis og åpen kildekode (AGPL-3.0, GNU Affero General Public License definert nedenfor; med kommersiell dobbeltlisens); virksomheten som bærer prosjektet er støtte, integrasjon, kommersielle lisenser og proprietære tillegg — ikke brukeravgifter på den åpne motoren.

seg-8ea21ebded3c = <b>AGPL-3.0.</b> GNU Affero General Public License v3 — en OSI-godkjent (Open Source Initiative), sterk copyleft-lisens for åpen kildekode. Som GPL (GNU General Public License), men med en ekstra klausul (§{ "13" }) som dekker programvare som tilbys brukere <b>over et nettverk</b>: en modifisert versjon som nås over et nettverk, må tilby disse brukerne den tilsvarende kildekoden. Kshana sin åpne lisens.

seg-f87860d8197d = <b>Dobbeltlisensiering.</b> Å tilby den samme koden under to lisenser slik at brukerne velger: her AGPL-3.0 (åpen, copyleft) <b>eller</b> en kommersiell lisens fra Ashforde OÜ (et estisk aksjeselskap; OÜ = osaühing) for proprietær eller lukket bruk som AGPL ikke passer for. Se <c1/>.

seg-dd5f4a1bbbf5 = Brukes også på kshana.dev

seg-9d0c42560a90 = Forkortelser nettstedet bruker som ikke står i repoets ordliste ovenfor.

seg-67a54ce8c89e = Global Positioning System

seg-814b0d29bbb2 = bærebølge-til-støy-tetthet, i dB-Hz

seg-f22a269bc575 = radiobåndet fra { "1" } til { "2" } GHz som GNSS bruker

seg-1f4360a0405c = grov/innhentingskode (coarse/acquisition) i GPS L1

seg-6f7910207534 = augmented forward signal (månen)

seg-74f02864ce32 = mikroelektromekaniske systemer

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = ubemannet luftfartøysystem

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = beskyttelsesnivå · alarmgrense

seg-78134bcc48da = innflyging med vertikal veiledning, nivå I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = lav jordbane · geostasjonær bane

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = CCSDS-meldinger for baneefemeride, banemiddelelementer og sporingsdata

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = Deep Space Network

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = temperaturkompensert · ovnsstyrt krystalloscillator

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = passiv hydrogenmaser

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = ultrastabil oscillator · atomklokke for dypt rom

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = maksimal tidsintervallfeil · tidsdeviasjon

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = primær referansetidsklokke · forbedret PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = Allan-deviasjon ved midlingstid τ

seg-96fae3b4fb8e = International Telecommunication Union, Telecommunication Standardization Sector

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = normalisert innovasjon i annen · normalisert estimeringsfeil i annen

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · kommaseparerte verdier · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = kommandolinjegrensesnitt · programmeringsgrensesnitt · integrert utviklingsmiljø

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = programvarestykkliste · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = taushetsavtale

seg-564cfa0d3084 = Digital Object Identifier

seg-5cbd99859d90 = C/N₀-fossefall

seg-ed4a9e041a83 = et diagram over bærebølge-til-støy-tetthet per satellitt over tid

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = horisontalt · vertikalt beskyttelsesnivå

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

seg-c5da9d350518 = <s1>Forrige</s1>Innføring i begreper

seg-670504be0531 = <s1>Neste</s1>Studio-veiledning
