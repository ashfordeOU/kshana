# docs--glossary: translations (da)

seg-daf25c6479c1 = Standarder

seg-c851aa23ea42 = kommaseparerede værdier

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = temperaturkompenseret krystaloscillator

seg-1bac97ee312a = rubidium-atomfrekvensnormal

seg-b09ffb8a9095 = Monte Carlo

seg-9939da5da283 = JSON

seg-5907283b71da = Forkortelse

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = intersystembias

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvanteprojektionsstøj

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-e464509f3abb = forhold mellem bærebølge og støjtæthed

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital objektidentifikator

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Den Internationale Rumstation

seg-865e7d1794b6 = Secure Hash Algorithm, 256-bit

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahøj frekvens

seg-6ce4c2164aee = Kilde: <c1/>

seg-bee5d056ef03 = Definitioner i almindeligt sprog af de begreber, der bruges i Kshana. Hver post starter med en linje »i almindelige vendinger« og tilføjer derefter den præcise betydning, hvor det hjælper. Forkortelser, der ikke er defineret i et afsnit, står i A-til-Å-tabellen nær slutningen, <a1>Alle andre forkortelser, A til Å</a1>.

seg-f8c5433d1026 = Navigation og tidssynkronisering

seg-2a42d84608ea = <b>PNT: positionering, navigation og tidssynkronisering.</b> At vide <em>hvor</em> du er, <em>hvilken vej</em> du bevæger dig, og <em>hvad klokken er</em>, præcist. Moderne PNT kommer for det meste fra satellitsignaler (GNSS, de globale satellitnavigationssystemer, der defineres næste gang); Kshana undersøger, hvad der sker med <em>tid</em> og <em>position</em>, når disse signaler går tabt.

seg-6227db2c94e1 = <b>GNSS: Global Navigation Satellite System.</b> De satellitkonstellationer, der leverer PNT: GPS (Global Positioning System, USA (Amerikas Forenede Stater)), Galileo (EU), GLONASS (Ruslands Global Navigation Satellite System), BeiDou (Kina). En modtager, der kan se ≥ { "4" } satellitter, kan beregne en fuld 3D-position og tidsbestemmelse.

seg-f8eda357e640 = <b>GNSS-udfald / nægtet / forringet / udsat for jamming.</b> Når satellitsignalerne ikke er tilgængelige (blokeret, udsat for jamming eller udenfor sigte). Under et udfald må systemet »coaste« på sine egne sensorer om bord. Kshanas hele formål er at måle, hvor godt det coaster.

seg-a3ade199f465 = <b>Holdover.</b> I almindelige vendinger: <em>hvor længe uret kan holde god tid på egen hånd, efter det har mistet GNSS.</em> Et bedre ur holder længere, før dets fejl krydser den tilladte grænse.

seg-83b33c15312f = <b>Dødregning.</b> I almindelige vendinger: <em>at anslå, hvor du er, ved at lægge din målte bevægelse sammen, uden nogen ekstern reference.</em> Fejl ophobes, så en bedre inertisensor driver langsommere.

seg-da9bcc994b9c = <b>Specifikation / tærskel.</b> Den største fejl, du må have, før løsningen tæller som »udenfor specifikation«, for eksempel »tidssynkroniseringen skal holde sig inden for { "20" } ns« eller »positionen inden for { "100" } m«.

seg-6f37a60a30c7 = De sensorer, Kshana sammenligner

seg-308b59d89586 = <b>Ur (atomur).</b> En enhed, der holder tid ved at tælle et atoms naturlige svingning. To eksempler her:

seg-3389d08be6bc = <b>CSAC: chip-scale atomur.</b> Et lille, udrullet, kommercielt ur (den »klassiske« reference). Godt, men driver mærkbart over et langt udfald.

seg-3e121d8e6400 = <b>Optisk gitterur (f.eks. strontium).</b> Et langt mere stabilt »kvante«-ur; det bedste i laboratorier, endnu ikke fløjet i rummet.

seg-4daa6cdf8ae2 = <b>Accelerometer.</b> Måler acceleration (ændring i bevægelse). Integreret to gange giver det position, så enhver fejl vokser hurtigt. <b>Koldatom-accelerometer</b> er kvanteversionen med langt bedre langtidsstabilitet; <b>navigationsklasse</b> er den klassiske.

seg-91793676c57c = <b>Gyroskop.</b> Måler rotation. En lille rotationsfejl vipper platformen, hvilket lader tyngdekraften sive ind i den horisontale retning og ødelægger positionsestimatet.

seg-2d36110effc3 = <b>IMU: Inertial Measurement Unit.</b> Selve pakken med accelerometre og gyroskoper: tre akser af hver, der rapporterer specifik kraft og vinkelhastighed. Den måler bevægelse; alene ved den ikke, hvor den er.

seg-e3b6b40e0cd0 = <b>INS: Inertial Navigation System.</b> En IMU plus den »mekanisering«, der integrerer dens output til attitude, hastighed og position. INS er det, der dødregner gennem et GNSS-udfald, og dets nøjagtighed sættes af de IMU-fejlprocesser, der er opført nedenfor.

seg-a618ff7ee429 = <b>Tidsoverførsel.</b> At sende et præcist tidssignal mellem to steder (f.eks. satellit til satellit). <b>Optiske</b> links er langt mere præcise end <b>RF</b>-links (radiofrekvens).

seg-847fbbeecfae = Hvordan fejl modelleres (urstøj)

seg-5cf197bdbbad = Urfejl opbygges af standard-»støjtyper«, hver med en kendt signatur:

seg-3806d1b1cb50 = <b>Hvid FM (hvid frekvensmodulation).</b> I almindelige vendinger: <em>hurtig, tilfældig jitter i urets rate.</em> At midle den ned forbedres med tiden. Parameter <c1/>.

seg-0793fdd3abab = <b>Random-walk-FM.</b> I almindelige vendinger: <em>urets rate vandrer langsomt.</em> Dette dominerer lange udfald. Parameter <c1/>.

seg-42b74c8b88ff = <b>Flicker-FM (1/f-støj).</b> I almindelige vendinger: <em>et stædigt støjgulv, uret aldrig kan midle under.</em> Det er fladt over midlingstider. Parameter <c1/>.

seg-b3bd841a5a2d = <b>Ældning / drift.</b> En langsom, <em>forudsigelig</em> ændring i raten over tid; fordi den er forudsigelig, fjerner Kshanas estimator den. Parameter <c1/>.

seg-d929960492e4 = <b>VRW: Velocity Random Walk.</b> Accelerometerets modstykke til hvid støj: tilfældige stød til hastigheden, der bygger op til positionsfejl. Parameter <c1/>.

seg-4a97f8d14174 = <b>ARW: Angular Random Walk.</b> Gyroskopets modstykke: tilfældige stød til orienteringen. Parameter <c1/>.

seg-dcd03b326110 = Hvordan stabilitet måles

seg-2181832c6253 = <b>Allan-deviation (<c1/>).</b> I almindelige vendinger: <em>den gængse måde at angive, hvor stabilt et ur er over en given midlingstid <c2/>.</em> Et urdatablad angiver f.eks. <c3/>. Kshana validerer sin urmodel ved at beregne Allan-deviationen af sit eget output og kontrollere, at den svarer til det offentliggjorte tal. (Reference: Riley, NIST SP { "1065" }, National Institute of Standards and Technology Special Publication { "1065" }.)

seg-11cbe561e633 = <b>PSD: effektspektraltæthed.</b> Hvordan en støjs effekt er fordelt over frekvenser; den formelle måde at angive hvid / random-walk / flicker-støj.

seg-0737d620eb5f = Kvalitetsmålene (hvordan en kørsel scores)

seg-20b66e0d4809 = De seks operationelle PNT-kvalitetsmål, Kshana rapporterer (se tabellen »Output« i README):

seg-b17d08246e49 = <b>FoM: kvalitetsmål (Figure of Merit).</b> Ét tal, der scorer ét aspekt af en kørsel, rapporteret med sin enhed og om det er valideret eller modelleret. De seks nedenfor er Kshanas operationelle FoM'er.

seg-b229a69fb4ac = <b>Positionerings- / tidsydelse</b>: fejlens størrelse, som RMS (root mean square, det kvadratiske gennemsnit) og som 95. percentil.

seg-ba3ed5a28518 = <b>Autonomi</b>: holdover-varigheden (hvor længe den holder sig inden for specifikationen uden GNSS).

seg-13ecdd037098 = <b>Robusthed</b>: hvor hurtigt fejlen vokser, når GNSS er tabt.

seg-be0168f24d6e = <b>Tilgængelighed</b>: den andel af kørslen, der har en løsning inden for specifikationen.

seg-44ef500b371d = <b>Integritet</b>: <em>kan du stole på systemets eget estimat af sin fejl?</em> Kshana rapporterer den andel af udfaldsstikprøverne, hvis sande fejl holder sig inden for filterets beskyttende grænse.

seg-d1cc3819cde9 = <b>Sikkerhed</b>: robusthed over for spoofing: en detekterbarhedsscore for spoofing baseret på urstabilitet (siden { "v0.3.0" }), kun meningsfuld, når et scenarie med spoofing-angreb er konfigureret. Det er <em>ikke</em> integritet i luftfartsklassen: den beregner intet horisontalt eller vertikalt beskyttelsesniveau (HPL/VPL) og kører ingen receiver autonomous integrity monitoring (RAIM), hverken almindelig eller avanceret. De kommer fra de separate scenarietyper for integritet og ARAIM (avanceret RAIM) og er defineret under »Integritet og augmentation« nedenfor. Eksportfølsomt.

seg-5cae59204d9e = Begreber, der bruges sammen med kvalitetsmålene:

seg-7adc0e49a981 = <b>Spoofing.</b> I almindelige vendinger: <em>et falsk satellitsignal, der lyver om position eller tid.</em> En spoofer fodrer modtageren med et plausibelt, men forkert svar, hvilket er værre end jamming, fordi modtageren måske ikke opdager det.

seg-2d2e6cbeade6 = <b>1-DOF: én frihedsgrad.</b> En enkelt akse. Positionsfejlen i Kshanas scenariepakker er enkeltakset; et fuldt 3D-svar kræver treaksemodellen.

seg-14a32d281c4b = <b>Monte Carlo-ensemble.</b> At køre det samme scenarie mange gange med forskellige tilfældige seeds og rapportere resultaternes spredning frem for én kørsel.

seg-fcbea49a3592 = <b>CI: konfidensinterval.</b> Det område, en statistik forventes at falde i med en angiven sandsynlighed (for eksempel { "95" } %). I README's tabeller og badges betyder »CI« oftere <b>kontinuerlig integration</b>: den automatiserede bygge- og testkørsel ved hver ændring; konteksten afgør hvilken.

seg-310abfd6a64c = <b>k-sigma-grænse.</b> En grænse sat ved <em>k</em> standardafvigelser af filterets egen usikkerhed; kvalitetsmålet for integritet tæller, hvor ofte den sande fejl holder sig inden for den.

seg-ad26afbaa7b4 = <b>CEP / 2DRMS: circular error probable / to gange kvadratmiddelafstanden.</b> To gængse måder at angive horisontal 2D-nøjagtighed: CEP er den radius, der rummer { "50" } % af positionsbestemmelserne; 2DRMS er det dobbelte af den horisontale kvadratmiddelfejl. Biblioteket kan beregne begge ud fra en positionskovarians (<c1/>), men ingen scenarietype rapporterer dem endnu.

seg-fd93c1effba8 = At læse et resultat: begreberne i outputtet

seg-3432498093cf = Dette er de navne, du møder i en resultatfil eller playgroundens oversigt, først i almindelige vendinger.

seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> I almindelige vendinger: <em>hvor mange sekunder systemet blev inden for sin fejlgrænse, efter GNSS var tabt.</em> Kshana rapporterer den korteste sådan coast på tværs af alle udfald i kørslen, målt på kørslens tidsgitter, så det er en nedre grænse ved tidstrinnets opløsning. En holdover lig med udfaldets længde betyder, at grænsen aldrig blev krydset.

seg-e68708a219f1 = <b>p95 (<c1/>).</b> I almindelige vendinger: <em>{ "95" } % af tiden var tidsfejlen så lille eller mindre.</em> Det er 95. percentil af fejlen over udfaldet. En meget lille værdi kan vises som <c2/> i en kort oversigt; resultatfilen i JSON (JavaScript Object Notation) rummer tallet i fuld præcision.

seg-4dfaee63262d = <b>Integritet (<c1/>).</b> I almindelige vendinger: <em>hvor ofte systemets eget fejlestimat var ærligt.</em> Det er den andel af udfaldsstikprøverne, hvis sande fejl holdt sig inden for filterets k-sigma-grænse (defineret nedenfor). En værdi tæt på { "1" } betyder, at estimatoren ikke undervurderede sin fejl. Det er ikke et beskyttelsesniveau i luftfartsklassen; se »Integritet og augmentation« nedenfor og <a1><c2/></a1>.

seg-5af09f5129e0 = <b>Sikkerhedsscore (<c1/>).</b> I almindelige vendinger: <em>hvor sandsynligt det er, at et spoofing-angreb opdages.</em> Det er sandsynligheden for, at det konfigurerede angreb detekteres (én minus sandsynligheden for manglende detektion <c2/>), udledt af urets stabilitet. Det betyder kun noget, når scenariet konfigurerer et spoofing-angreb. Uden konfigureret angreb udskriver enlinjeoversigten <c3/>, og resultatet mærker tallet <c4/> i sin blok <c5/>; værdien bliver i dokumentet og betyder »ikke relevant«, ikke »nul sikkerhed«.

seg-70113d509997 = <b>PDOP: positionens præcisionsfortynding (nøgler som <c1/>).</b> I almindelige vendinger: <em>hvor meget satellitgeometrien forstørrer afstandsfejl til positionsfejl.</em> Positionsfejlen er groft sagt PDOP gange afstandsfejlen, så lavere er bedre. Se <b>DOP</b> under »Estimering og geometri«.

seg-a445bf9a3c5f = <b>sigma_y (<c1/>, Allan-deviationen).</b> I almindelige vendinger: <em>hvor meget et urs rate svinger, når den midles over en tid <c2/>.</em> En databladslinje som <c3/> betyder, at raten, midlet over ét sekund, varierer med omkring { "3" } dele i 10¹⁰. Mindre er et mere stabilt ur. Se »Hvordan stabilitet måles« ovenfor.

seg-03b4bb05148d = <b>q_wf: intensitet af hvid frekvensstøj.</b> I almindelige vendinger: <em>styrken af den hurtige, tilfældige jitter i et urs rate.</em> Det er koefficienten i <c1/> for hvid frekvensstøj, så et scenarie sætter <c2/> ud fra databladets Allan-deviation ved ét sekund. Dens følgesvende er <c3/> (random-walk-frekvensstøj) og <c4/> (ældning); se »Hvordan fejl modelleres« ovenfor.

seg-074a1337ed99 = Begreber for tidssynkronisering i telekommunikation

seg-9f61398628e4 = Telekommunikationsnet fordeler tid over pakkenet (Precision Time Protocol) fra et GNSS-fodret referenceur, og International Telecommunication Union Telecommunication Standardization Sector (ITU-T) fastsætter grænser for den tidsfejl, hvert ur må tilføje. Disse begreber optræder i typen <c1/>; se <a1><c2/></a1>.

seg-f48712300b30 = <b>TE: tidsfejl.</b> I almindelige vendinger: <em>hvor langt et urs tid er fra referencetiden, på ét tidspunkt.</em> Positiv eller negativ, normalt i nanosekunder.

seg-ceda70656c6a = <b>max|TE|: maksimal absolut tidsfejl.</b> I almindelige vendinger: <em>den værste tidsfejl set over målingen, uden hensyn til fortegn.</em> Det er den overordnede grænse, de fleste masker fastsætter.

seg-38d2922cd91d = <b>cTE: konstant tidsfejl.</b> I almindelige vendinger: <em>den stabile forskydningsdel af tidsfejlen</em>: den gennemsnitlige fejl, der ikke ændrer sig over målingen.

seg-a4a61df332cd = <b>dTE: dynamisk tidsfejl.</b> I almindelige vendinger: <em>den svingende del af tidsfejlen</em>: det, der er tilbage, når den konstante forskydning er fjernet. Den bedømmes med MTIE og TDEV.

seg-31c0a85788b1 = <b>MTIE: maksimal tidsintervalfejl.</b> I almindelige vendinger: <em>det største udsving i tidsfejl set inden for et vindue af en given længde.</em> For hver vinduelængde glider den et vindue langs optagelsen og tager den største ændring fra top til top; en maske angiver den største tilladte værdi pr. vinduelængde.

seg-53fa12cab0c6 = <b>TDEV: tidsdeviation.</b> I almindelige vendinger: <em>den typiske (kvadratmiddel-)vandring af tidsfejlen ved en given midlingstid,</em> efter kortvarig jitter er midlet væk. Den er en tidsdomænefætter til Allan-deviationen og kontrolleres som MTIE mod en maske.

seg-62b5eea14f6c = <b>PRTC: primært referencetidsur.</b> Uret øverst i en telekommunikationstidskæde, normalt styret af GNSS. Dets ydelsesgrænser står i ITU-T-anbefaling G.8272.

seg-8d6d4538981b = <b>ePRTC: forbedret primært referencetidsur.</b> Et PRTC med en strammere tidsfejlsgrænse, bakket op af et meget stabilt lokalt atomur, så det kan holde tiden gennem et langt GNSS-tab. ITU-T-anbefaling G.8272.1.

seg-93fa4ac7c6fa = <b>T-BC: telekommunikationens grænseur.</b> Et netur, der modtager tid opstrøms og giver den videre nedstrøms og tilføjer en smule tidsfejl af sig selv. ITU-T-anbefaling G.8273.2.

seg-52d32a5db6b8 = <b>T-TSC: telekommunikationens tidsslaveur.</b> Uret for enden af kæden, som modtager tid og leverer den til det udstyr, der har brug for den (for eksempel en radiobasestation). Dækkes også af ITU-T-anbefaling G.8273.2.

seg-04d8ed12ca88 = <b>OCXO: ovnstyret krystaloscillator.</b> En kvartsoscillator holdt ved konstant temperatur i en lille ovn, hvilket gør den meget mere stabil end en almindelig kvartsoscillator. Et almindeligt holdover-ur i netudstyr; det ælder (driver) mærkbart over dage.

seg-6742f7ba35ac = <b>CSAC: chip-scale atomur.</b> Et meget lille atomur (se »De sensorer, Kshana sammenligner« ovenfor). Mere stabilt over lange holdover-perioder end en OCXO, til højere pris og effekt.

seg-c0e0c18bd867 = Evidensniveauer: VALIDATED, MODELLED, PARTNER

seg-61c0aa107fd9 = Hver funktion i den maskinkontrollerede verifikationsmatrix (<a1><c1/></a1>) bærer et af tre niveauer.

seg-13fb20435df3 = <b>VALIDATED.</b> I almindelige vendinger: <em>kontrolleret mod en andens svar.</em> Funktionens output blev sammenlignet med en uafhængig ekstern reference (rigtige måledata, et uafhængigt bibliotek skrevet af en anden eller offentliggjorte referenceværdier) og stemte overens inden for en angivet tolerance. En kontrol i kontinuerlig integration afviser en VALIDATED-række, der ikke nævner nogen ekstern reference.

seg-a5dfb48e4dcb = <b>MODELLED.</b> I almindelige vendinger: <em>bygget på sund fysik og kontrolleret for intern konsistens, men endnu ikke sammenlignet med et eksternt svar.</em> Tallene er meningsfulde til sammenligning og designafvejninger; de er ikke evidens for, at en rigtig enhed vil yde sådan. <a1><c1/></a1> forklarer, hvorfor hver sådan række er modelleret.

seg-0512b2d2145a = <b>PARTNER.</b> I almindelige vendinger: <em>denne del tilhører en hardware- eller produktsikringspartner, og Kshana hævder intet om den.</em> Rækken findes, så hullet er synligt i stedet for tavst.

seg-278dee6d3d4c = Begreber for spektrum og interferens

seg-285a240c9958 = Disse begreber optræder i typen <c1/>; se <a1><c2/></a1>.

seg-db4fdef1c562 = <b>BPSK(n): binær faseskift-modulation ved n × { "1.023" } Mchip/s.</b> Modulationen med rektangulære chips i GPS L1 coarse/acquisition (C/A) og L2 civil (L2C) (n = { "1" }) samt GPS L5 og Galileo E5a (n = { "10" }). Dens spektrum er en sinc² med nulpunkter for hver n × { "1.023" } MHz.

seg-cdd0f4194f42 = <b>BOC(m, n): binær offsetbærebølge.</b> En spredningskode ved n × { "1.023" } Mchip/s ganget med en firkantbølge-underbærebølge ved m × { "1.023" } MHz, som deler spektret i to lober på hver side af bærebølgen.

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11): multiplekset binær offsetbærebølge.</b> Effektspektraltætheden 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), aftalt for Galileo E1 open service og GPS L1C; Galileo udsender den som sammensat BOC (CBOC).

seg-7423f94e3018 = <b>CW: kontinuert bølge.</b> En umoduleret bærebølge: en enkelt tone.

seg-55d03dd4af03 = <b>J/S: forhold mellem jammer og signal.</b> Modtaget jammereffekt over modtaget signaleffekt, i decibel.

seg-b0f2974647d4 = <b>SSC: spektral separationskoefficient.</b> κ = ∫ G_s(f) G_j(f) df over modtagerbåndet: hvor meget af en interferers spektrum med enhedseffekt der lander, hvor signalets gør. Den effektive bærebølge-til-støj-densitet er [1/(C/N₀) + (J/S)·κ]⁻¹.

seg-c5affeee5269 = <b>Støjtal.</b> Hvor meget en modtager tilfører den termiske støj, som et forhold F i decibel; systemets støjtemperatur er T_ant + { "290" } K × (F − { "1" }).

seg-5307c38d3036 = <b>Vandfald.</b> Et tid-frekvens-billede af et spektrum: frekvens på tværs, tid nedad, farve for effekt.

seg-3b1ac094fdc5 = <b>Welch-estimat.</b> En effektspektraltæthed estimeret ved at midle vinduede, overlappende periodogrammer (Welch { "1967" }).

seg-9901d64fb895 = <b>SigMF: Signal Metadata Format.</b> Et åbent optageformat: en JSON-fil <c1/>, der beskriver en rå fil <c2/> med stikprøver (her komplekse <c3/>, <c4/> eller <c5/>).

seg-83041671f422 = <b>IQ: in-phase og kvadratur.</b> De to komponenter i en kompleks basisbåndsstikprøve.

seg-39e6ea8506b3 = Begreber for LEO-PNT-signaler

seg-36452ee3f5cc = Disse begreber optræder i typen <c1/> og i scenarierne for flere bånd <c2/>; se <a1><c3/></a1>.

seg-8363a15f3c5a = <b>LEO-PNT — positionering, navigation og tidssynkronisering fra lav jordbane.</b> Navigationssignaler udsendt fra satellitter i en højde på nogle få hundrede til omkring { "1200" } km: kraftigere og hurtigere bevægelige end GNSS fra middelhøj jordbane.

seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — Radio Navigation Satellite Service, Radio Determination Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.</b> ITU-tjenestetildelinger (ITU: Den Internationale Telekommunikationsunion), som et bånd kan høre under.

seg-d1e494623341 = <b>Pilot-, data- og akkvisitionskomponenter.</b> Delene af ét signal: en datafri pilot til afstandsmåling, en datakomponent, der bærer navigationsbeskeden, og en kort akkvisitionskomponent med lav datahastighed, som er let at finde.

seg-cce232b7cd6a = <b>FDMA — frekvensdelt multipel adgang.</b> Komponenter eller satellitter adskilt efter bærefrekvens frem for efter kode.

seg-9d9476ee62b1 = <b>Gabor-båndbredde (RMS).</b> β = √(∫ f² G df / ∫ G df) over modtagerens bånd: spredningen af et signals effekt i frekvens, som afgør, hvor fint det kan måle afstand.

seg-6febe9c2e506 = <b>DLL — delay lock loop.</b> Kodesporingssløjfen; dens early-late-korrelatorafstand og støjbåndbredde fastlægger jitteren i afstandsmålingen fra termisk støj.

seg-5a55da97daf9 = <b>EFQPSK — enhanced Feher quadrature phase-shift keying.</b> En modulation med konstant envelope (Xona Pulsar); her approksimeret med et rektangulært chip-spektrum.

seg-6dcbf1de9904 = <b>OFDM — orthogonal frequency-division multiplexing.</b> En flerbærebølge-signalform (Starlinks downlink); tegnet her som et fladt bånd.

seg-548b285c7c8e = <b>TEC — totalt elektronindhold.</b> Elektroner pr. kvadratmeter langs signalvejen; { "1" } TECU = 10¹⁶ el/m². Den første ordens ionosfæreforsinkelse er { "40.3" }·TEC/f² meter.

seg-dd7e0743f364 = <b>EIRP — effektiv isotropisk udstrålet effekt.</b> Sendeeffekt gange antennegevinst i retning mod modtageren.

seg-aba3b3eaba85 = Integritet og augmentation

seg-eab1b2c6728e = Integritet er <em>tillidsspørgsmålet</em>: ikke "hvor stor er min fejl?", men "kan jeg afgrænse den, og får jeg besked, når grænsen brydes?" Det er luftfartens begreber for det.

seg-696a73449c49 = <b>RAIM — Receiver Autonomous Integrity Monitoring.</b> Kort sagt: <em>modtageren kontrollerer satellitterne mod hinanden.</em> Med flere satellitter end de fire, en positionsbestemmelse kræver, bør de overskydende målinger (residualerne) være små; et stort residual betyder, at én satellit afgiver forkerte data, og modtageren kan sige det uden hjælp fra jorden. Implementeret i <a1><c1/></a1>.

seg-89237433f01a = <b>ARAIM — Advanced Receiver Autonomous Integrity Monitoring.</b> Den moderne form af RAIM med to frekvenser og flere konstellationer. Den får en integritetsstøttebesked, der angiver hver satellits antagne fejl og fejlsandsynlighed, og returnerer beskyttelsesniveauer frem for et bestået/ikke-bestået-flag. Fuld gennemgang med alle antagelser i <a1><c1/></a1>.

seg-4cc13de05193 = <b>SISRE — Signal-in-Space Range Error.</b> Kort sagt: <em>hvor langt ved siden af en satellits udsendte bane og ur får afstanden, som en typisk bruger måler.</em> Banefejlen deles op i radiale, langsgående og tværgående dele og vægtes efter, hvor meget hver af dem slår igennem langs en gennemsnitlig sigtelinje, og kombineres derefter med urfejlen (Montenbruck et al. { "2018" }). For en satellit i lav jordbane vejer de langsgående og tværgående dele langt tungere end for GPS, fordi brugere ser den langt fra nadir. Bruges af typen <c1/>.

seg-847e40a033e1 = <b>RAC — Radial, Along-track, Cross-track.</b> De tre retninger, en banefejl opløses i: udad fra Jordens centrum, langs flyveretningen og vinkelret på banens plan. Typen <c1/> har i modellen <c2/> et korrektionspolynomium i hver af dem.

seg-b725d23c839e = <b>SVID — Space-Vehicle Identifier.</b> Nummeret, som en navigationsbesked bruger til at angive den satellit, der har sendt den.

seg-b0f850eb04b1 = <b>IOD — Issue of Data.</b> En tæller, der skifter, hver gang indholdet af en satellits navigationsbesked ændres, så en modtager kan skelne en ny besked fra en gentagelse. (Skal ikke forveksles med en demonstration i kredsløb, der også forkortes IOD, som i ESA's Celeste IOD.)

seg-985a5e9c9ce9 = <b>TOW — Time of Week.</b> Sekunder siden begyndelsen af den aktuelle GNSS-uge (søndag { "00" }:{ "00" }).

seg-1fc62dca46d6 = <b>CRC-24Q — 24-bit cyklisk redundanskontrol (Qualcomm-polynomium).</b> Den fejlopdagende kontrol, som RTCM { "10403" } og Galileo-beskeder bærer: en 24-bit rest af beskedens bit divideret med polynomiet <c1/>. En modtager genberegner den og kasserer en besked, der ikke stemmer.

seg-abb4679dab23 = <b>URE — User Range Error.</b> Kort sagt: <em>hvor forkert en satellits egen udsendte bane og ur gør hver afstand til den.</em> Kaldes også signal-i-rummet-fejlen (SISE); det er det fejlbudget pr. satellit, som ARAIM og RAIM får (<c1/> i <a1><c2/></a1>).

seg-158c210fd3fe = <b>MHSS — Multiple Hypothesis Solution Separation.</b> Den metode, ARAIM bruger. For hver måde, konstellationen kan være behæftet med fejl på, danner den en løsning, der udelukker de mistænkte satellitter, og afgrænser, hvor langt denne delløsning kan ligge fra løsningen med alle synlige satellitter.

seg-671711003a6f = <b>HPL / VPL — Horizontal / Vertical Protection Level.</b> Kort sagt: <em>den radius, som systemet lover, at den sande fejl ligger inden for, ved en angivet integritetsrisiko.</em> Det er en grænse, algoritmen beregner, ikke en målt fejl. En kørsel er tilgængelig, når beskyttelsesniveauet holder sig under den alarmgrænse, som operationen tillader (VAL, den lodrette alarmgrænse; HAL, den vandrette).

seg-5bbd2d664862 = <b>SBAS — Satellite-Based Augmentation System.</b> Et jordnetværk, der overvåger GNSS, beregner korrektioner og integritetsgrænser og udsender dem fra geostationære satellitter. <b>WAAS — Wide Area Augmentation System</b> er det amerikanske; EGNOS (European Geostationary Navigation Overlay Service) er det europæiske modstykke. Kshana beregner beskyttelsesniveauer i DO-229E-formen med vægtede mindste kvadrater (DO-229E er RTCA's minimumsstandard for driftsydelse for SBAS-modtagere; RTCA hed tidligere Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

seg-ba8b448582af = Estimering og geometri

seg-2eb6e72496b8 = <b>Estimator.</b> Algoritmen, der forudsiger den sande position eller tid under et udfald ud fra sensormodellen. Kshana har en analytisk holdover-prædiktor og et <b>Kalman-filter</b>.

seg-9b4aa612c5a9 = <b>Kalman-filter.</b> Kort sagt: <em>en algoritme, der følger en størrelse og også følger, hvor usikker den er.</em> Kshana bruger sin usikkerhedsgrænse til at beregne integritet.

seg-8fda81dfccc9 = <b>EKF — Extended Kalman Filter.</b> Et Kalman-filter til et ikke-lineært problem: det linearicerer modellen omkring det aktuelle estimat i hvert trin. Standardvalget til at koble GNSS til et INS.

seg-9bc2c6f74b29 = <b>UKF — Unscented Kalman Filter.</b> Samme opgave uden linearisering: det sender et lille sæt deterministisk valgte stikprøvepunkter gennem den sande ikke-lineære model og genopbygger middelværdi og kovarians ud fra, hvor de lander. Bedre opførsel, når ikke-lineariteten er kraftig, og derfor bruger banebestemmelsen det.

seg-a1e52820e3a0 = <b>DOP — Dilution Of Precision.</b> Kort sagt: <em>hvor meget satellitternes geometri forstærker afstandsmålingsfejl til positions- eller tidsfejl.</em> Positionsfejl ≈ PDOP × afstandsmålingsfejl, så et lavt tal er god geometri. Familien: <b>GDOP</b> (geometrisk — position og tid samlet), <b>PDOP</b> (position), <b>HDOP</b> (vandret), <b>VDOP</b> (lodret), <b>TDOP</b> (tid).

seg-e769a91a3e4b = <b>Walker-konstellation.</b> En standardmåde at beskrive en satellitkonstellation på ud fra antallet af baneplaner og satellitter pr. plan (GPS er nogenlunde en 24/6 Walker-skal).

seg-b557933a4e4d = <b>Elevationsmaske.</b> Den mindste vinkel over den lokale horisont, hvor en satellit regnes for brugbar; signaler, der er for lave, udelukkes.

seg-3ac8e11c3e33 = <b>Okkultation.</b> Når Jorden fysisk blokerer sigtelinjen til en satellit.

seg-249bf472cb00 = <b>Horisontprofil (horisontmaske).</b> Kort sagt: <em>omridset af bygninger, kraner eller bakker mod himlen, som en elevation for hver azimut.</em> En satellit tæller kun som synlig over <c1/> i sin azimut, og en satellit over masken men bag horisontprofilen er "maskeret af horisontprofilen". Kshana bygger en ud fra en tabel, en gadekløft, sektorer og terræn (deres punktvise maksimum) eller en REPRESENTATIVE forudindstilling; kun sigtelinje, ingen refleksion eller diffraktion (<a1><c2/></a1>).

seg-620a88820a2d = <b>Himmelgeometri.</b> Hvilke satellitter et sted ser under en horisontprofil, og hvad det gør ved løsningen: DOP-faktorerne, øst-nord-op-kovariansen for mindste kvadraters positionsbestemmelse og dens <b>fejlellipse</b>, det vandrette område, der rummer den angivne andel af positionsbestemmelserne ({ "95" } % som standard) for uafhængige, ens gaussiske afstandsfejl. MODELLED geometri under en angivet fejlmodel, ikke en modtagers reelle fejl (<a1><c1/></a1>).

seg-f0e610122425 = <b>CTI — Composed Timing Integrity.</b> Beskyttelsesniveauer for <em>tid</em> frem for position, beregnet på tværs af en overgang mellem forskellige tidskilder — for eksempel fra et satellitkontrolleret (RAIM-tilgængeligt) ur til et frit løbende ur i holdover — så grænsen forbliver gyldig gennem overgangen (<a1><c1/></a1>).

seg-56642f614c3f = <b>TIB — Timing Integrity Benchmark.</b> Et målestok for <em>andres</em> tidsovervågninger: den indsprøjter et udvalg af fejl og kontrollerer, om overvågningens angivne beskyttelsesniveau faktisk afgrænsede dens fejl. Den fremsætter ikke selv noget nøjagtighedskrav, så den kan ikke overdrive et (<a1><c1/></a1>).

seg-8b89f8b913b9 = Baner og cislunart rum

seg-ba6b669eb8ba = <b>CR3BP — Circular Restricted Three-Body Problem.</b> Jord–Måne-systemet behandlet som to legemer i cirkulære baner om deres fælles massemidtpunkt plus et rumfartøj, der er for let til at trække igen. Tæt på Månen er en Kepler-ellipse for to legemer simpelthen den forkerte form; CR3BP er den billigste dynamik, der er rigtig (<a1><c1/></a1>).

seg-2726a22bf14c = <b>NRHO — Near-Rectilinear Halo Orbit.</b> En periodisk CR3BP-bane, der svinger tæt forbi den ene månepol og langt ud over den anden, så den set fra enden næsten er en ret linje — deraf "næsten retlinet". Det er den bane, der er valgt til månestationen Gateway, og den bevarer næsten uafbrudt sigtelinje til Jorden.

seg-2b2e6d04376c = <b>DRO — Distant Retrograde Orbit.</b> En anden CR3BP-familie: en stor, stabil bane, der kredser om Månen baglæns set i det roterende system.

seg-6bb9229aee5c = <b>EOP — Earth Orientation Parameters.</b> Jordens målte, let uregelmæssige vaklen og rotation (polbevægelse, UT1 (Universal Time { "1" }, jordrotationstid)−UTC — jordrotationstid minus koordineret universaltid — og dagens længde), som er nødvendig for at omsætte en jordfast position til en inertial med bedre end meters nøjagtighed. IERS (International Earth Rotation and Reference Systems Service) udgiver dem; Kshana læser dens fil <c1/> via <c2/>.

seg-7f1e7e523e5b = Standarder, formater og organisationer

seg-5d8d6144c13a = De forkortelser, som README og pakkesiderne bruger for standarder, filformater, tidsskalaer, referencesystemer og de organer, der står bag dem. Hver af dem er også skrevet ud ved første brug på de sider.

seg-800d42de0777 = Baner, referencesystemer og tid

seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> De analytiske standardpropagatorer for offentliggjorte satellitbaner.

seg-87a098568846 = <b>TLE — two-line element set.</b> Det offentlige baneformat, SGP4 læser.

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — lav jordbane / middelhøj jordbane / geostationær transferbane / skrå geosynkron bane.</b> Banetyper; de fleste GNSS-satellitter flyver i MEO.

seg-1ec323dbd7a6 = LMO — lav Mars-bane.

seg-d0be640282af = <b>ECI / ECEF — jordcentreret inertial / jordcentreret, jordfast.</b> Et referencesystem, der ikke roterer med Jorden, og et, der gør.

seg-09a937adc1db = <b>TEME — true equator, mean equinox.</b> Det referencesystem, SGP4 giver sit resultat i.

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — Geocentric Celestial Reference System / International Terrestrial Reference System / dets realisering, International Terrestrial Reference Frame.</b> De moderne inertiale og jordfaste referencesystemer.

seg-56b24c3734be = <b>CIO — Celestial Intermediate Origin.</b> Referencepunktet i den moderne jordrotationskæde uden jævndøgn.

seg-a23b05c85a63 = <b>LVLH — local vertical, local horizontal.</b> Et referencesystem, der bevæger sig med rumfartøjet.

seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> Den jordellipsoide, GPS bruger.

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — koordineret universaltid / international atomtid / terrestrisk tid / universaltid { "1" } (jordrotationstid) / barycentrisk dynamisk tid.

seg-ea7eb1f34cae = <b>LTC / TCL — Lunar Coordinate Time (Temps-Coordonnée Lunaire).</b> Den foreslåede tidsskala for Månen.

seg-c6e5976d9dff = <b>OD — banebestemmelse.</b> At bestemme en bane ud fra sporingsmålinger.

seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> og <b>DRO</b> er defineret under "Baner og cislunart rum" ovenfor.

seg-2e6ba9069396 = Filformater og beskeder

seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> Filformatet for præcise baner fra International GNSS Service (IGS), i versionerne c og d.

seg-1bfa0d083935 = <b>RINEX — Receiver Independent Exchange Format.</b> Standardfilformatet for GNSS-observationer og udsendte efemerider.

seg-39ce08a9ae66 = IONEX — IONosphere map EXchange format.

seg-c23ea3515008 = <b>OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Standardbeskeder for baner og sporingsdata fra Consultative Committee for Space Data Systems (CCSDS).

seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Det almindelige tekstformat for Kshana-scenarier.

seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> Kshanas versionerede, selvbeskrivende resultatkonvolut.

seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> RTCA's minimumsstandarder for driftsydelse for SBAS-modtagere og for GPS-udstyr i luftfartøjer med augmentation baseret på luftfartøjet.

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> GPS' interfacespecifikationer (den anden dækker L5-signalet).

seg-2230000aa30b = <b>NIST SP { "1065" }.</b> National Institute of Standards and Technology's <em>Handbook of Frequency Stability Analysis</em>.

seg-8b89719c1859 = <b>TRL — technology readiness level.</b> En skala fra 1 til 9 for hardwaremodenhed.

seg-16c972f4ea0a = Organisationer

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — Den Europæiske Rumorganisation, dens europæiske rumoperationscenter og dens europæiske sporingsnetværk.

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — den amerikanske rumfartsmyndighed National Aeronautics and Space Administration, dens Jet Propulsion Laboratory, dens Navigation and Ancillary Information Facility (som udgiver værktøjskassen SPICE — Spacecraft, Planet, Instrument, C-matrix, Events) og dens Deep Space Network.

seg-eaa5a2a51169 = <b>IGS</b> — International GNSS Service. <b>IERS</b> — International Earth Rotation and Reference Systems Service. <b>IAU</b> — Den Internationale Astronomiske Union (hvis SOFA-bibliotek, Standards of Fundamental Astronomy, og dens åbne port ERFA, Essential Routines for Fundamental Astronomy, er Kshanas referencer for referencesystemer).

seg-81af4c0f4c48 = <b>CCSDS</b> — Consultative Committee for Space Data Systems. <b>AIAA</b> — American Institute of Aeronautics and Astronautics. <b>RTCA</b> — tidligere Radio Technical Commission for Aeronautics.

seg-aa0b395df17f = Software og forsyningskæde

seg-b42188d3a6f4 = CLI — kommandolinjegrænseflade.

seg-198c591514ab = <b>MCP — Model Context Protocol</b>, den protokol, Kshanas agentserver taler. <b>IDE — integreret udviklingsmiljø.</b>

seg-287bf61a1a16 = SBOM — softwarestykliste.

seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, det ramme for byggeprovenans, som Kshanas udgivelser attesteres under.

seg-7487c6f9ed18 = Alle andre forkortelser, A til Z

seg-56f6039bb38a = Alle forkortelser brugt i repositoriets dokumentation (<c1/> og de fire README-filer), som ingen af afsnittene ovenfor definerer, plus nogle få som et afsnit definerer, gentaget til opslag. Hver side skriver også sine forkortelser ud ved første brug; denne tabel er det ene sted, hvor man kan slå dem alle op. Nogle poster er identifikatorer eller navne frem for forkortelser og siger det.

seg-c0dfa446e523 = Står for

seg-f272d28225ae = Hvor den dukker op

seg-ffb0596f134b = Third Generation Partnership Project

seg-77c1b4478387 = organet, der skriver 5G-standarderne, herunder ikke-terrestriske netværk

seg-eaf19768b977 = femtegenerations mobilnetværk

seg-692ddc163c55 = herunder dets positionering i ikke-terrestriske netværk (NTN)

seg-9524be916f07 = ABI

seg-0e8332db764b = application binary interface

seg-762ea76708dc = Python-wheel-tags

seg-d419d06ed622 = ABMF

seg-b294c714487d = IGS-stationen i Le Moule, Guadeloupe

seg-586a8ea87638 = en stationsidentifikator på fire tegn

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = vekselstrøm

seg-9cfb5dc4b4bc = som i AC-Stark-effekten (lysforskydning)

seg-90308009c536 = ADD

seg-49d97c65662d = Algorithm Description Document

seg-493b5ceaa0fb = WG-C's ARAIM-referencealgoritme til luftfartøjer

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = Allan-deviation / overlappende Allan-deviation

seg-23c38ecbc543 = se Allan-deviation ovenfor

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = varenumre på inertisensorer (Analog Devices; Safran Sensonor; MicroStrain)

seg-c4c0a93477a8 = identifikatorer, ikke forkortelser

seg-36743c7fe98e = AEM

seg-142ca108a070 = Attitude Ephemeris Message

seg-c34185a83d8e = en CCSDS-besked

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = Aerospace and Electronic Systems Society

seg-78692bf5addf = under IEEE

seg-f429be16014e = AF

seg-afa04bc28b42 = middelfaktor

seg-b3db60632b92 = det heltallige multiplum af stikprøveintervallet i en estimator af Allan-typen

seg-6097c4709542 = AFS

seg-7043ab3fe32b = Augmented Forward Signal

seg-20380d29d286 = LunaNets månenavigationssignal

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = automatisk forstærkningsregulering

seg-750b8717220b = en jamming-indikator i en modtagers front end

seg-31b864b910d5 = AHP

seg-f956cbe86552 = Analytic Hierarchy Process

seg-c2b63847e2dc = en vægtningsmetode med flere kriterier (Saaty)

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = kunstig intelligens / maskinlæring

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = alarmgrænse / vandret alarmgrænse / lodret alarmgrænse

seg-1e52f04eb047 = den fejl, en integritetsovervågning skal afgrænse

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = alternative binary offset carrier

seg-e3acb231cf4d = Galileo E5-modulationen

seg-79b130764f97 = (uligheden mellem) aritmetisk middel og harmonisk middel

seg-190b782b70ce = AOCS

seg-6459d9bce282 = system til attitude- og banestyring

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = signalopfangning / tidspunkt for tætteste passage / signaltab

seg-8b73e2c51498 = hændelserne i en jordstationspassage (LOS betyder også sigtelinje; sammenhængen viser hvilken)

seg-27ceb7163571 = API

seg-7903f5ff4027 = programmeringsgrænseflade

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = application process identifier

seg-55730824c8cf = feltet i CCSDS Space Packet-headeren

seg-611cd7a0d378 = APS

seg-55842a648c47 = American Physical Society

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = indflyvning med lodret vejledning

seg-69a6cc8a532a = APV-I: { "40" } m vandret, { "50" } m lodret alarmgrænse

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = gennemsnitlig kørselslængde

seg-08a5d53f813c = den gennemsnitlige tid, en ændringsdetektor tager om at give alarm

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = Arm-processorarkitekturen / dens 64-bit-form

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = amplitudespektraltæthed

seg-9fb629e35a25 = kvadratroden af en effektspektraltæthed

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = astronomisk enhed

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = areal under kurven / modtagerens driftskarakteristik

seg-4d65dbf47a5c = evaluering af detektorer

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = er vært for et åbent spejl af SRTM-højdefelterne

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = tab ved indtrængen i bygninger

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = biasustabilitet

seg-ff2ba8692cbc = det flade minimum af en inertisensors Allan-deviation

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = Bureau International des Poids et Mesures (Det Internationale Bureau for Mål og Vægt)

seg-6ec98084ac58 = udgiver Circular T

seg-4ff08facda60 = BKG

seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (den tyske forbundsmyndighed for kartografi og geodæsi)

seg-ac4765a77015 = driver et IGS-datamirror

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = som i BSD-licenserne

seg-97764c651815 = BSP

seg-8f85848ee08a = binær SPK

seg-6e01dca47581 = en binær SPICE-efemeridekernefil

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = modstandsleddet i et two-line element set

seg-628e6c686508 = CAI

seg-a2418a88886c = koldatom-interferometer

seg-273a3b8d5385 = se QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

seg-a1f55ee72524 = en data- eller tekstlicens

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = Crustal Dynamics Data Information System

seg-5b3f50bed1f6 = NASA's arkiv for rumgeodæsi

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = kumulativ fordelingsfunktion

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = konstant falsk-alarm-rate

seg-b38b56b63da6 = en tærskelregel for en akkvisitionsdetektor

seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

seg-4dab086e5c3d = BeiDou-datummet

seg-8f7751d39781 = CIP

seg-e34a194da574 = Celestial Intermediate Pole

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = Celestial Intermediate Reference System

seg-a543c4d02ace = CISA

seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

seg-59c481cb5741 = under det amerikanske DHS

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = civil moderat / civil lang

seg-cc0c8f1524f8 = de to tidsmultiplekserede GPS L2C-koder

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = beskyttelsesniveau for fælles mode

seg-d469cd44d9d4 = grænsen for fejl, som en residualtest ikke kan se

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = converged Newtonian

seg-5d679a981a34 = SPICE's korrektion for lysets gangtid og aberration

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = i dB-Hz

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment

seg-b99fe66bd09c = en rangordningsmetode med flere kriterier

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = Committee on Space Research

seg-235850ad0d1f = udsteder internationale satellitbetegnelser

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = cyklus pr. omløb

seg-a1d4080ce019 = en empirisk baneacceleration ved omløbsfrekvensen

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = central- / grafik- / neural behandlingsenhed

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = Cramér–Rao-grænse / nedre Cramér–Rao-grænse

seg-6eb684e34f56 = den mindste varians, en middelret estimator kan nå

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

seg-eb95135f849c = ILRS-filer med normalpunkter

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = antenne med kontrolleret modtagemønster

seg-7111b9c4d382 = et antennearray mod jamming

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = konsistensratio / tilfældighedsindeks

seg-cfa91dc02138 = AHP-konsistenskontrollen (accepter CR < { "0.10" })

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = det franske firma, der vedligeholder Orekit

seg-58d5f143ff3b = et firmanavn, ikke en forkortelse, der skal udvides

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = code shift keying

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = Cascading Style Sheets

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = kumuleret sum

seg-66f752e15abc = en sekventiel ændringsdetektor

seg-92ac0357d01e = CV

seg-28f75c073917 = (fælles visning ved tidsoverførsel; sammenhængen viser hvad)

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = JSON-sceneformatet i CesiumJS

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = decibel / decibel-watt / decibel-hertz

seg-c485de5bcd85 = effektforhold, absolut effekt og en C/N0-enhed

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = jævnstrøm

seg-0ea7fccee332 = grænsen ved frekvensen nul

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = retningskosinusmatrix

seg-9d3d9ca79a9d = en rotationsmatrix

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin

seg-1545bd59f5ef = DCT

seg-8b6866288bea = design control table

seg-80d95f099e9a = en linkbudgettabel (JPL DESCANSO's Galileo X-bånd-eksempel)

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL Development Ephemeris (versionerne { "421" }, { "430" }, { "440" }, { "441" })

seg-748af19e3f0b = planet- og måneefemerider; "DE-grade" betyder nøjagtighed i den klasse

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = digital højdemodel

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

seg-2e11a1976171 = JPL's monografiserie

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Tysk Geodætisk Forskningsinstitut ved Münchens Tekniske Universitet)

seg-e7cedd55549e = er vært for EUROLAS Data Center

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = differentiel GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = Department of Homeland Security

seg-6b487421c547 = USA

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = Department of Defense

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = frihedsgrad

seg-bf5bc69cb873 = se 1-DOF ovenfor

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = differentiel envejs afstandsmåling / delta differentiel envejs afstandsmåling

seg-6ba2d3b5b724 = vinkelsporing i det dybe rum

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = numeriske integratorer

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = kvadratisk middelafstand

seg-a8ed04890ded = se 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = dokumentnumre på Microchip-datablade

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = Deep Space Atomic Clock

seg-e80350ed521f = NASA's ur med fangede kviksølvioner

seg-52e838301c0b = UT1 minus UTC

seg-fbce3b3b7b80 = jordrotationskorrektionen

seg-8aa996f34920 = energi pr. bit i forhold til støjtæthed

seg-463b21c0b791 = det inertiale referencesystem, der ved starten af en kørsel er rettet ind efter det jordfaste

seg-4dc987bd9dbf = bruges af leo-pass-interopeksporterne

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = standarden bag JavaScript / et ES-modul

seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

seg-2967e958f353 = en GNSS-model for solstråletryk (CODE: Center for Orbit Determination in Europe)

seg-244af4062ccc = ECSS

seg-b74029376aba = European Cooperation for Space Standardization

seg-d452e23d503a = ECSS-E-ST-10-02 er dens verifikationsstandard

seg-becb6685ff13 = ED

seg-b6448e14a567 = EUROCAE-dokument

seg-ee4ada9c4c6e = som i ED-259A

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = indflyvning, nedstigning og landing

seg-69f37001de44 = EEE

seg-18a1b66286ee = elektriske, elektroniske og elektromekaniske (komponenter)

seg-f814c1301059 = produktsikring for rumfart

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = Earth Gravitational Model (udgaven fra { "2008" })

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (eliminering og valg, der udtrykker virkeligheden)

seg-efb2f919955a = en overrangeringsmetode med flere kriterier

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, MPP02-versionen (Chapront)

seg-b1d699d70339 = en analytisk månteori

seg-aee5eeb23064 = Jordens middelækvator og jævndøgn ved J2000

seg-16d9b8eac95d = et inertialt referencesystem

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = en kodediskriminator

seg-0e4110d33849 = EMT

seg-103c6de62575 = effektiv overvågningstærskel

seg-4b2101113387 = et ARAIM-output

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = øst-nord-op / nord-øst-ned

seg-aae7610833a7 = lokale horisontsystemer

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = jordobservation

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (udgaven fra { "2021" })

seg-bd2a27a17f6d = IAA RAS-efemeride

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = Jordens rotationsvinkel

seg-966ed500f705 = ESKF

seg-e79112a3132a = Kalman-filter med fejltilstand

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = effektiv stikprøvestørrelse

seg-57ce1c1b617b = i et partikelfilter

seg-f529300f944b = ESSR

seg-869be8388d26 = European Space Software Repository

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = efemeridetid

seg-e0c49639649e = SPICE's navn for TDB

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = European Organisation for Civil Aviation Equipment

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = European Laser Network

seg-fa7025d88c88 = laserafstandsmåling til satellitter og Månen

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = ofte stillede spørgsmål

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = Federal Communications Commission

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = fuldt forbundet neuralt netværk

seg-1de7b4410369 = FD

seg-4e73ff36d37f = endelig differens

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = fejldetektion og -udelukkelse

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = Finite Element Solution (udgaven fra { "2004" })

seg-878b4a645ae9 = en model for havtidevand

seg-55c14f474a10 = FIM

seg-b68c86e68570 = Fisher-informationsmatrix

seg-d39671724dfc = Fowler–Noll–Vo-hash, variant 1a

seg-3354ad42f7dd = bruges til at fastlåse golden outputs

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = fuld operativ kapacitet / validering i kredsløb

seg-ce13cca7f222 = satellitgenerationer (Galileo, Xona Pulsar)

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = synsfelt / øjeblikkeligt synsfelt

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = field-programmable gate array / mikrocontrollerenhed / realtidsoperativsystem

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = fririumstab / fririums-udbredelsestab

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = gigabyte / kilobyte / megabyte

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = Geocentric Celestial Reference Frame

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = geostationær bane

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = tyngdegradient

seg-d8ef4d361e86 = som i tyngdegradientmoment

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = gigahertz / kilohertz

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = globalt ionosfærekort

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = GNSS/INS-integration / Wuhan Universitys datasæt og kode til Kalman-filter for GNSS/INS

seg-deca3cbe41ac = GIS

seg-36275ece527d = geografisk informationssystem

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = grid ionospheric vertical error

seg-20a40777d78a = et begreb i SBAS-beskeder

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = en GNSS-databehandlingspakke distribueret af ESA

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = GNU C-biblioteket

seg-2630ae5f0bc5 = Ruslands Global Navigation Satellite System (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

seg-361f1f18d454 = GLS

seg-397d58b727ee = generaliserede mindste kvadrater

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = gravitationsparameter

seg-e3a296392ac0 = gravitationskonstanten gange et legemes masse

seg-45a8f50bce06 = General Mission Analysis Tool

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = et gravitationsfelt for Mars

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = Greenwich' middelstjernetid

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = styring, navigation og kontrol

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = generel relativitetsteori

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = GRAIL-tyngdemodellerne for Månen fra NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

seg-220fae5cfc61 = Geodetic Reference System { "1980" }

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = jordopløsning pr. billedpunkt

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = jordbaseret støtteudstyr

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = Goddard Space Flight Center

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = Hadamard-deviation / overlappende Hadamard-deviation

seg-bb846135ceb4 = et stabilitetsmål, der er ufølsomt over for drift

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = hardware-in-the-loop

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = farligt vildledende information / vildledende information

seg-1cbf9d6f135d = områder i Stanford-diagrammet

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = Institute of Applied Astronomy of the Russian Academy of Sciences

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = International Association of Geodesy

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = International Association of Geomagnetism and Aeronomy / dens arbejdsgruppe V-MOD (modellering af jordens magnetfelt)

seg-28805f15bae8 = vedligeholder IGRF

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = begyndelsesbetingelse

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = Den Internationale Civile Luftfartsorganisation

seg-c2d2d459177d = ICD

seg-a018300615e2 = interface control document

seg-433b45040abd = som i Galileo OS SIS ICD

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = International Centre for Global Earth Models

seg-e9650a618b38 = ID

seg-e40875ab1090 = identifikator (eller identifikation, som i ID af støjtype)

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

seg-ce9375732735 = IF

seg-746eae5ce367 = mellemfrekvens

seg-ed568f55aa8f = modtagerens stikprøver

seg-cb4aaa2581bb = IGS' realisering af ITRF2014

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = International Geomagnetic Reference Field

seg-669611e731d0 = IGRF-14 (filen IGRF14.shc) er den 14. generation

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = skrå geosynkron bane

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = en GPS-satellitgeneration

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = International Laser Ranging Service

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = heltalsmindste kvadrater

seg-a214c483b8a8 = løsning af heltalsmultiplicitet

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

seg-22048a770612 = Observatoriet i Paris; udgiver INPOP

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, version 21a

seg-577acd29f11b = en planetefemeride

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = Interagency Operations Advisory Group

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = Institute of Navigation / dets International Technical Meeting

seg-53abad80634c = IoT

seg-9b766d557bd1 = tingenes internet

seg-1b41d114662e = IR

seg-ff2d89b32d07 = integritetsrisiko

seg-2dc9fcadccd6 = sandsynligheden for farligt vildledende information

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = Institute of Radio Engineers

seg-3fbae7e11fca = en forgænger til IEEE

seg-9e3d84279d56 = urforskydningen mellem to GNSS

seg-2ffee4396fbd = ISL

seg-505dee046f7a = link mellem satellitter

seg-010ea5a76e2e = ISM

seg-330b25f923db = integritetsstøttebesked

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = Den Internationale Standardiseringsorganisation

seg-8291ac1ccba6 = ISO { "8601" } er dens format for dato og tid

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

seg-14dc2a58e2c3 = Den Internationale Telekommunikationsunions radiokommunikationssektor

seg-0e8094e4d45c = dens P-serie af anbefalinger modellerer udbredelse

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = juliansk dato / modificeret juliansk dato

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = Den Europæiske Kommissions Fælles Forskningscenter / et af dets rapportnumre

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = Kalman-filter

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = en OGC-standard, som Google Earth læser

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = posttypeetiketter i Kshanas eget tekstformat for LEO-navigationsbeskeder

seg-3269a4e6b3e3 = en Kshana-udvidelse, ikke en standard

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = nøgleindikator for ydeevne

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = Kennedy Space Center

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = tekstformen for CCSDS-beskeder

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = lineær kongruensgenerator

seg-8927ca404e64 = testseriegeneratoren i NIST SP { "1065" }

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services

seg-5253cae4b05b = ESA's Moonlight-tjeneste

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = lineært tilbagekoblet skifteregister

seg-5b09c8e3f127 = generering af spredekoder

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = loven om den itererede logaritme

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = indikator for tab af lås / indikator for signalstyrke

seg-7d95179a5a1f = RINEX-observationsflag

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = laserafstandsmåling til Månen

seg-20deda97c876 = LLVM

seg-5a84a3219546 = LLVM-kompilerinfrastrukturen (oprindeligt Low Level Virtual Machine)

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = ældre navigationsbesked

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = satellitsystem til navigation og kommunikation ved Månen

seg-4ce3c0ea7a31 = konstellationscasestudierne i NAVIGATION { "70" }({ "4" }), navi.613

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

seg-97ff1706b4bd = en foreslået månekonstellation

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = localiser performance with vertical guidance / dens beslutningshøjdekategori på { "200" } ft

seg-090ba62634a8 = luftfartens indflyvning

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = skudsekunder

seg-54ea05b82cb4 = som i Δt_LS

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = lysets gangtid

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = 4G-mobilstandarden

seg-3530cdaca137 = LU

seg-58ad64b9d450 = nedre–øvre (dekomposition)

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment

seg-84874825a5d1 = fløj til Månen i { "2025" }

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = Stanfords PNT-bibliotek til Månen

seg-893ba320da76 = et navn

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

seg-a24b3840d248 = Stanford

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = fremstilling, samling, integration og test

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = JPL's satellitefemeridesløsninger for månerne om Mars, Jupiter og Saturn

seg-9b0688bfc31e = identifikatorer

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = minimum aviation system performance standards

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = et produkt til numerisk beregning

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = multiattribut nytteteori

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = beslutningsanalyse med flere kriterier

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = månecentreret inertial / månecentreret, månefast

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = mindste detekterbare bias

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = modificeret Allan-deviation

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = mikroelektromekaniske systemer

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO (Métrologie Optique), laserstationen i Grasse / Matera Laser Ranging Observatory

seg-a8fcbefbbf4c = laserstationer til afstandsmåling til Månen

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = middel-Jord / hovedakser

seg-f30f1a2778cf = de to månefaste referencesystemer (MOON_ME, MOON_PA)

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = Multi-GNSS Experiment

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = Massachusetts Institute of Technology

seg-e9d7062835a9 = som i MIT-licensen

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = flerlags perceptron

seg-6975432180f6 = et lille neuralt netværk

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = middel for datoen / sand for datoen

seg-1af66f9b771d = ækvator-og-jævndøgn-referencesystemer

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = minimumsstandarder for driftsydelse

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = tyngdemodellerne { "110" } og 110B2 fra Mars Reconnaissance Orbiter

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = mindste understøttede Rust-version

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = modulationsoverføringsfunktion

seg-7f60d1ac40ad = optisk billeddannelse

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = minimum-variance distortionless response

seg-83f57219e5b7 = adaptiv stråleformning

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = mikrobølgelink

seg-639266912f59 = ACES' tidsoverførselslink

seg-5ac07401e4f8 = NaN

seg-722d679807ee = ikke et tal

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = navigation (besked) / observation

seg-1729ddf0eafa = de to RINEX-filtyper; Stanford NAV Lab er Navigation and Autonomous Vehicles Laboratory

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = det tidligere amerikanske National Bureau of Standards / referencedatasættet NBS14 for frekvensstabilitet

seg-3d1ac5146fea = bruges til at kontrollere Allan-estimatorer

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = normaliseret estimeringsfejl i anden / normaliseret innovation i anden

seg-af167a77a1dc = konsistenstest af filtre

seg-beb7a86721ec = National Geospatial-Intelligence Agency

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = National Imagery and Mapping Agency / dens tekniske rapport TR8350.2 (definitionen af WGS { "84" })

seg-ffa6025b5a70 = NIMA er det tidligere navn for NGA

seg-af4be907e56c = NLOS

seg-22ab7d58324b = et signal, der kun er reflekteret

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = ikke-negative mindste kvadrater

seg-af8ca8550600 = NORAD

seg-07428e7224cf = North American Aerospace Defense Command

seg-4edb033e3432 = fører det offentlige satellitkatalog

seg-dd984e16dbcd = NP

seg-f92816d7c936 = Neyman–Pearson

seg-fc214695fa83 = detektionsteori

seg-3ef8006482bb = NPA

seg-81a072ee0520 = indflyvning uden præcision

seg-b9fd2cf6a2b9 = luftfart

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = nutation–præcession–bias

seg-b4562efbafdf = IAU 2006/2000A-matricen

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = Naval Research Laboratory / dets atmosfæremodel Mass Spectrometer and Incoherent Scatter Radar Extended, { "2000" }

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = ikke-terrestrisk netværk

seg-1ae0305d8455 = 5G fra satellitter

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = identifikatorer for overdrevne påstande

seg-47ba87f3730b = rækker i CLAIMS-VS-REALITY.md

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = format for containerbilleder

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = almindelig / stokastisk differentialligning

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = orbit data messages

seg-35fe6a2f3de3 = CCSDS-familien, der omfatter OEM og OMM

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = almindelige / vægtede mindste kvadrater

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = ESA's softwarelaboratoriesatellit i kredsløb / dens datasæt til anomalidetektion

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = autentificering af Galileo-signaler

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = Open Service (Galileo, BeiDou) eller operativsystem(er)

seg-6db10af375e3 = sammenhængen viser hvilket

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = Ornstein–Uhlenbeck

seg-9be9042ec983 = en støjproces med tilbagevenden til middelværdien

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = produktsikring (også præcisionsindflyvning, som i K_H,PA)

seg-65ad442b3faa = PCK

seg-c788fe80678e = kerne med planetkonstanter

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = sandsynlighed for detektion / sandsynlighed for falsk alarm

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = referencesystemet mellem TEME og ITRF

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = satellitidentifikatorer: en SP3-betegnelse for en GPS-satellit, et SBAS-nummer for pseudotilfældig støj, et Galileo-satellitnavn

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

seg-302c8cb738ac = ACES' cæsiumur

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = beskyttelsesniveau

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = faselåst sløjfe

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / en af dens artikelidentifikatorer

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = fasemodulation / frekvensmodulation

seg-279251adb2eb = støj på et urs fase eller på dets frekvens

seg-685fc49957e2 = PN

seg-209dacf76ff3 = som i PN-afstandsmåling

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = præcis banebestemmelse

seg-b7919977bf20 = PPN

seg-ed81960f1282 = parametriseret post-newtonsk

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = præcis punktpositionering / realtidskinematisk / enkeltpunktspositionering

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = puls pr. sekund

seg-2619e854281a = PR

seg-66c53cdfc3d9 = pull request

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = pseudotilfældig støj (kodenummer)

seg-6f384580af80 = hvordan GNSS-satellitter navngives i signaler

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = et tidsskrift

seg-78a947083d45 = PSD

seg-6eb799bd1582 = effektspektraltæthed

seg-ab1af8b3d968 = se ovenfor

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

seg-2800b3a8cd2e = GPS SPS PS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

seg-611e7e4a34f4 = Tysklands nationale metrologiinstitut

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = position, hastighed og tid

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = Rust–Python-bindingbiblioteket / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = GLONASS' geodætiske datum

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = kvalitetssikring

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = quadrature phase-shift keying

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = Quasi-Zenith Satellite System

seg-531943b17837 = Japan

seg-697c55525b36 = RAAN

seg-85cd6997e07e = opstigende knudes rektascension

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover

seg-76da7c5bf39a = RethinkPNT/Firesmith-modellen for robusthed

seg-7bb5ed20c788 = RF

seg-35b036272c8e = radiofrekvens

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = højre side

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = kvadratisk middelværdi / kvadratroden af kvadratsummen

seg-8b2bd83256f1 = RNG

seg-b90957003307 = generator af tilfældige tal

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = investeringsafkast

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = US DHS

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

seg-4a7703f1b605 = dens beskedstandard bærer CRC-24Q

seg-520c91fa0ef0 = et open source-bibliotek til GNSS-positionering (realtidskinematisk bibliotek)

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = radial, transversal, normal

seg-b1b635ff08e4 = et banefast referencesystem

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = tilfældig gang

seg-8b593d7d5dbd = som i tilfældig gang i bias

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = frekvensmodulation med tilfældig gang, hvid og flicker / fasemodulation, hvid og flicker

seg-7fced178bcc5 = urstøjtyperne med potensfunktion

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = Microchip-produktnavne (to atomure i chipstørrelse, en ovnstyret krystaloscillator)

seg-8a1ae00c4a52 = navne, ikke forkortelser

seg-a58426a850fd = SD

seg-d46cb77d53f6 = standardafvigelse

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = Service Definition Document

seg-9415da7a79ab = som i Galileo OS SDD

seg-1022626b788c = SDK

seg-2076da4dd4dd = softwareudviklingskit

seg-9fb492bced01 = SDR

seg-1a1082059103 = softwaredefineret radio

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = Space Defense Squadron

seg-c3f6fc1456ed = 18th SDS fører det amerikanske satellitkatalog

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = Sol–Jord–sonde-vinkel (også sfærisk fejlsandsynlighed)

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = stokastisk gradientnedstigning

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = simpel harmonisk bevægelse

seg-b0973ab206ed = SI

seg-35624e5e4630 = Det Internationale Enhedssystem

seg-02aa435dc884 = SIB

seg-262a811c8b69 = Safety Information Bulletin

seg-b9ee445609f5 = EASA; EASA er Den Europæiske Unions Luftfartssikkerhedsagentur

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format

seg-3466519e4c62 = geodætiske løsninger

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = sampling importance resampling

seg-7a2e0e9cac08 = et partikelfilter

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = signal i rummet / nøjagtighed af signal i rummet

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = laserafstandsmåling til satellitter

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design

seg-dfc105c0178b = lærebogen

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = signal-til-støj-forhold

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = kvadratsum / summen af kvadrerede residualer

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = det nyeste inden for teknikken

seg-127e73a3610b = NIST Special Publication { "1065" }

seg-bedc9a3d8d9f = samme dokument som NIST SP { "1065" }

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = symmetrisk positivt definit / positivt definit

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = licensidentifikatorerne i filhoveder

seg-b377a91a047f = SPK

seg-5603642c612d = SPICE-kerne for efemerider for rumfartøjer og planeter

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = single point of failure

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = overvågning af signalkvalitet

seg-a4e75468e6f9 = kontroller af spoofing ud fra korrelatorens form

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = kvadratrods-informationsfilter

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = solstråletryk

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission / dens højdefilformat

seg-4692354a98de = felter navngives efter deres sydvestlige hjørne, for eksempel N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics

seg-1d8167212f57 = JPL-gruppen

seg-d21315ea8c52 = STEC

seg-84689b829867 = skråt totalt elektronindhold

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = et produkt til missionsanalyse

seg-17d792c12885 = Iridiums tjeneste til positionering og tidssynkronisering

seg-3efaadad9c96 = STM

seg-da395fa674ec = tilstandsovergangsmatrix

seg-d116578b987b = SV

seg-caa37a1e7d12 = rumfartøj (en satellit)

seg-845e6f3a37ec = SVD

seg-e775c436db4b = singulærværdidekomposition

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = telekommando / telemetri

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = testdreven udvikling

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = forskel i ankomsttid / ankomstfrekvens

seg-aecac9c9d2d0 = passiv lokalisering af sendere

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = matchning af terrænkonturer

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery

seg-941eccec7400 = optagede GNSS-spoofingdata (OAKBAT er et datasæt i samme klasse)

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = tidsintervalfejl

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service

seg-12f4af2b48c1 = ITU-medlemskonti

seg-c05ba396ac1e = ToA

seg-78a41e672189 = ankomsttid

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = tolerance

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = total deviation / total varians

seg-7350da5c5c30 = stabilitetsestimatorer med udvidet rækkevidde

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = beskyttelsesniveau for tidssynkronisering

seg-10c9563602b7 = se SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = termisk beskyttelsessystem

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = terrænreferencet navigation

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = teknisk rapport / teknisk note

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = Delft University of Technology

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = tovejs satellit-tids- og frekvensoverførsel / tovejs tids- og frekvensoverførsel

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = u-blox' binære modtagerprotokol

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = user differential range error

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = brugerækvivalent afstandsfejl

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

seg-f4da31f92a79 = en IEEE Transactions

seg-573db7b5995b = { "300" } MHz til { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = brugerflade / brugeroplevelse

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = uniformt lineært array

seg-db65f4a7586d = ULP

seg-ae7458813685 = enhed på sidste ciffers plads

seg-d7f4df5a9d13 = præcision i flydende komma

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = brugerafstandsnøjagtighed / brugerafstandsfejl

seg-17e8fb142c6c = URA afgrænser integriteten, URE er nøjagtighedens RMS

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

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (optimering med flere kriterier og kompromisløsning)

seg-7fe170288e4e = interferometri med meget lang basislinje

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

seg-1746693259e0 = SBAS; se ovenfor

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

seg-c9710476b8b5 = Arbejdsgruppe C under samarbejdet mellem Den Europæiske Union og USA om satellitnavigation

seg-79f0e87410bf = udgiver ARAIM-referencedokumenterne

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = hvid gaussisk støj

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 bruger WGS72-konstanter

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = Wuhan University

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = vægtet summodel / vægtet produktmodel

seg-cc68c85bb2b9 = aggregering med flere kriterier (WPM betyder også hvid fasemodulation; sammenhængen viser hvilken)

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = eksklusiv eller

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = komponenterne i jordens magnetfelt: nord, øst, ned, total intensitet; deklination, inklination

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it

seg-e4e177088376 = et udformningsprincip

seg-565c1908393c = ZHD

seg-77a0948bc15d = hydrostatisk forsinkelse i zenit

seg-749be52554c5 = Reproducerbarhed og licensering

seg-d78d9bbb905c = <b>Reproducerbar (deterministisk).</b> Det samme input giver altid bit-for-bit identisk output — <c1/>. Ingen skjult tilfældighed.

seg-1412347e2298 = <b>Seed.</b> Det tal, der initialiserer den (deterministiske) tilfældighedsgenerator, så kørsler kan gentages.

seg-3a35740e04a8 = <b>Open core.</b> Forretningsmodellen: motoren er gratis og open source (AGPL-3.0, GNU Affero General Public License, defineret nedenfor; kommercielt dobbeltlicenseret); den bærende forretning er support, integration, kommercielle licenser og proprietære tilføjelser — ikke brugerbetaling for den åbne motor.

seg-8ea21ebded3c = <b>AGPL-3.0.</b> GNU Affero General Public License v3 — en stærk copyleft-open source-licens, som står på Open Source Initiatives (OSI) liste over open source-licenser. Som GPL (GNU General Public License), men med en ekstra klausul (§{ "13" }) om software, der tilbydes brugere <b>over et netværk</b>: en ændret version, som nås over et netværk, skal tilbyde disse brugere sin tilsvarende kildekode. Kshanas åbne licens.

seg-f87860d8197d = <b>Dobbeltlicensering.</b> At tilbyde den samme kode under to licenser, så brugerne vælger: her AGPL-3.0 (åben, copyleft) <b>eller</b> en kommerciel licens fra Ashforde OÜ (et estisk anpartsselskab; OÜ = osaühing) til proprietær eller lukket brug, som AGPL ikke passer til. Se <c1/>.

seg-dd5f4a1bbbf5 = Bruges også på kshana.dev

seg-9d0c42560a90 = Forkortelser, som websitet bruger, og som ikke står i repositoriets ordliste ovenfor.

seg-67a54ce8c89e = Global Positioning System

seg-814b0d29bbb2 = bærebølge-til-støj-tæthed, i dB-Hz

seg-f22a269bc575 = radiobåndet fra { "1" } til { "2" } GHz, som GNSS bruger

seg-1f4360a0405c = coarse/acquisition-koden på GPS L1

seg-6f7910207534 = augmented forward signal (månen)

seg-74f02864ce32 = mikroelektromekaniske systemer

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = ubemandet luftfartøjssystem

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = beskyttelsesniveau · alarmgrænse

seg-78134bcc48da = indflyvning med lodret vejledning, niveau I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = lav jordbane · geostationær bane

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = CCSDS-beskeder med baneefemeride, middelelementer for baner og sporingsdata

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = Deep Space Network

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = temperaturkompenseret · ovnstyret krystaloscillator

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = passiv brintmaser

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = ultrastabil oscillator · atomur til det dybe rum

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = maksimal tidsintervalfejl · tidsdeviation

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = primært referencetidsur · forbedret PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = Allan-deviation ved middeltiden τ

seg-96fae3b4fb8e = Den Internationale Telekommunikationsunions standardiseringssektor for telekommunikation

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = normaliseret innovation i anden · normaliseret estimeringsfejl i anden

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · kommaseparerede værdier · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = kommandolinjegrænseflade · programmeringsgrænseflade · integreret udviklingsmiljø

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = softwarestykliste · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = fortrolighedsaftale

seg-564cfa0d3084 = Digital Object Identifier

seg-5cbd99859d90 = C/N₀-vandfald

seg-ed4a9e041a83 = et diagram over bærebølge-til-støj-tæthed pr. satellit over tid

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = vandret · lodret beskyttelsesniveau

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

seg-c5da9d350518 = <s1>Forrige</s1>Introduktion til begreberne

seg-670504be0531 = <s1>Næste</s1>Studio-vejledning

seg-6c10aaedf2fc = <s1>Næste</s1>Sprog
