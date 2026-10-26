# docs--capability-reference: translations (da)

seg-f4f59f19e091 = Funktionskort

seg-501d3a72ea43 = Integritet

seg-20db2c79b998 = Valideret

seg-65d239fc4894 = Lunart referencesystem-datum fra reel laserafstandsmåling

seg-c92dd319fa36 = { "337" } ILRS-normalpunkter · median { "5.13" } mm

seg-2f7f950518be = Erstatter den simulerede kampagne med rigtige data: { "337" } arkiverede ILRS-normalpunkter fra månens laserafstandsmåling på tværs af fem retroreflektorarrays, hvor hver observation vægtes efter sin egen registrerede præcision fra filen. Reflektorernes koordinater er et DE440-katalog i hovedakser, som opbevares under sit eget filnavn, adskilt fra DE430-tabellen for middeljorden. Bruges den ene i den andens rotation, flytter det en reflektor flere hundrede meter, og intet protesterer, fordi begge dele er velformede koordinater.

seg-2db69c58f694 = Differentiel PNT på Månen

seg-32adcb9b1b02 = Eksakt fællesmode-identitet · modelleret dekorrelation

seg-d4ac8cbac83e = Differentielle korrektioner mellem en referencestation på Månen og en bruger. Ophævelsen af fællesmode er en eksakt identitet; den rumlige dekorrelationsrest er en geometrisk model af første orden, som vokser med baseline, og restbudgettet for korrektionslinket rapporteres ved siden af, så det begrænsende led forbliver synligt i stedet for at blive foldet ind i ét tal.

seg-9b83e78dcd7b = Tidsskalaer på Månen og geodætisk VLBI

seg-bcd769beab07 = Krydsningstabel pr. urklasse

seg-80107b7841bf = Krydsningstider pr. urklasse for en tidsskala på Månen, altså hvornår hver oscillatorklasse holder op med at overholde en angivet grænse uden en opdatering, sammen med en geodætisk VLBI-observabel på Månen og den Fisher-information, den bidrager med til datummet.

seg-99084680c321 = Reel, hentet konstellationsgeometri for Månen

seg-a7be7d68e767 = { "5" } indchecket fixtures, hver kan genskabes fra sin registrerede kilde

seg-d3591b4b4633 = Dækningsvolumenet kører på offentliggjorte konstellationsdesign i stedet for et illustrativt: LANS-referencesættet med fem satellitter til interoperabilitetsdemonstration, LNCSS-casestudierne med { "8" }, { "12" } og { "16" } satellitter samt de fire rumfartøjer, der den 2023-01-01 faktisk var i kredsløb om Månen, fra JPL Horizons. Hver fil angiver sit eget referencesystem og sin egen proveniensklasse, en horisont ud over slutningen af en tabelleret efemeride afvises i stedet for at blive ekstrapoleret, og det illustrative Kepler-resultat udsendes ved siden af det hentede sammen med forskellen mellem dem og erstattes aldrig af det.

seg-807b9fc7b517 = Afvisningskontur på Månen ud fra en målt C/N₀-spredning

seg-a908030a9fcc = Afstand { "49.2" } km efter effektforhold mod { "19.4" } km efter tab af lås

seg-3ee440e8b619 = Forholdet mellem jammer og signal pr. satellit over reelle skrå afstande på Månen, hvor siden med det ønskede signal beholdes som en fordeling frem for at blive samlet til en median, så afvisningskonturen bærer det usikkerhedsbånd, som relægeometrien faktisk giver. To kriterier rapporteres side om side: tærsklen for effektforholdet og tab af lås beregnet ud fra sporingssløjfens dynamik. Den orbitale indfangningsflade gennemsøges over senderens højde og strålebredde, og hvor gitteret aldrig når limbindfangning, siger rapporten det og skriver manglen ud.

seg-229134190045 = VLBI-skema til kovarians for stationskoordinater

seg-547181855481 = Rang { "6" }, defekt { "0" }; defekt { "1" } i det frie net, angivet som en fælles translation

seg-6d147beefb43 = Akkumulerer de lunare VLBI-forsinkelsespartialer til en Fisher-informationsmatrix over et skema af baselines gange epoker og returnerer kovariansen for stationskoordinaterne, så skridtet fra forsinkelsespræcision til koordinat-sigma estimeres i stedet for at blive antaget. Det frie net rapporteres ved siden af det datumfikserede, med sin rangdefekt og den uobserverbare retning angivet. Kovariansen for overfladepunkter holdes adskilt fra den for jordstationer, fordi nærfeltsbeaconens partial er en forskel mellem to enhedsvektorer for stationer og ikke opfører sig som i fjernfeltstilfældet.

seg-028833cc45bc = Radiometrisk navigation og relæ-PNT

seg-6c94ae122721 = PNT i dybt rum og på Mars

seg-ef21cd4b1962 = Simulationsvalideret (kovarians- og lukkede-sløjfe-kvalitetsmål, ikke certificerede beskyttelsesniveauer); dynamikken for Mars med Solen som centrum er krydstjekket mod JPL DE440 til { "137" } m @ en bue på 1 døgn; Mars-LMO OD ≈ { "0.2" } m.

seg-469988966702 = En åben radiometrisk navigationsmotor til dybt rum og Mars: iterativ lystid + Shapiro-forsinkelse, to-/en-/tre-vejs Doppler og afstand (Moyer to-ben), kohærent transponderomsætning, regenerativ/PN-afstandsmåling og Δ-DOR; CCSDS-TDM-ind/ud; et reduceret-dynamisk Square-Root Information Filter (empiriske accelerationer + ur om bord + Mars-modstand), der udfører banebestemmelse i Mars-LMO i en syntetisk lukket sløjfe; fusion af envejs og tovejs; og en MARCONI-konstellation af arealstationære relæer med en end-to-end GSE-ydelsessimulator.

seg-b4284bd2629e = Optisk og RF-overdragelse med integritet på tværs af modaliteter

seg-ae131bc1ba67 = Optisk / RF-PNT

seg-1b25468c9780 = Mindste detekterbare bias { "8.20" } m horisontalt, { "12.30" } m vertikalt, { "24.6" } ns tidssynkronisering

seg-a5387333ab2d = Fejlinjektion giver monitoren på tværs af modaliteter en detektionsstyrke i stedet for en fejlfri gennemkørsel: en mindste detekterbar bias pr. akse ved et angivet budget for falsk alarm og misset detektion. Efter en overdragelse propageres kovariansens genvækst mod alarmgrænserne, så rapporten angiver, hvor længe løsningen med én modalitet holder sig inden for dem, i stedet for blot at sige, at overdragelsen var sammenhængende. De optiske og RF-baserede afstandsben sammenlignes kun ved samme akkumuleringstid og samme vej, og rapporten nægter at danne et forhold mod en værdi, der er valgt i stedet for målt.

seg-00cb9df27979 = Autonom integritet i modtageren (ARAIM)

seg-f86ecc2fda8e = MHSS på et reelt GPS- og Galileo-snapshot · DO-316 med to konstellationer

seg-841a6f3f0277 = RAIM med snapshot og løsningsadskillelse med horisontale og vertikale beskyttelsesniveauer (HPL/VPL), fejldetektion og -udelukkelse samt Stanford-integritetsdiagrammer, plus et eksplicit beskyttelsesniveau for integritetsrisikobudgettet (MHSS) med fejltilstanden for hele konstellationen ved to eller flere konstellationer (EU ARAIM / DO-316).

seg-695aa5c57d83 = ARAIM mod offentliggjorte referencevektorer

seg-08f9dd480ba7 = Største fejl { "0.044" } m mod kildernes egen tolerance på { "0.05" } m

seg-68185dd65478 = Motorens MHSS-beskyttelsesniveauer køres mod de offentliggjorte regneeksempler fra referencealgoritmen for luftfartøjer fra EU-U.S. Working Group C, hver transskriberet med sin hentnings-URL, dato, side og fil-SHA-256 og opbevaret to steder, hvor en test hævder, at de stemmer overens. Accept-vektoren er den internt konsistente Reference Airborne Algorithm Description Document v3.1, Appendix D. Rapporten for Milestone { "3" } indeholder to interne fejl, en fortegnsfejl i geometrien og en multiplikator for falsk alarm, der er beregnet ved { "57" } fejltilstande, mens teksten angiver én, så dens beskyttelsesniveauer rapporteres som målte afvigelser i stedet for at blive bedømt, og fejlene påvises ved at køre dokumentets egne tal.

seg-17b28b3cf1fa = SBAS/WAAS-beskyttelsesniveauer og dobbeltfrekvens

seg-99766b79a00a = Augmentation (SBAS)

seg-4cfec990b19b = DO-229E K-faktorer · L1/L5 ionosfærefri

seg-ef3a5513bbd8 = SBAS/WAAS-beskyttelsesniveauer i DO-229E's vægtede mindste kvadraters form (K-faktorer for præcisionsindflyvning og en-route) og den ionosfærefri L1/L5-kombination med to frekvenser (IS-GPS-705), som understøtter DO-316, hvor geometrien i beskyttelsesniveauerne er krydstjekket mod en lineær-algebra-implementering som reference.

seg-0a5bd5230c32 = Holdover, stabilitet og overførsel af tid og frekvens

seg-69a0269c4732 = Ur og tidssynkronisering

seg-641ae762b453 = kalibreret efter urenes datablade · holdover krydstjekket mod van-Loan-kovariansrekursionen

seg-6f1c2e1f0bf4 = Holdover med to-tilstands Kalman-filter, stabilitet i Allan-familien (ADEV / MDEV / TDEV / HDEV) med konfidensintervaller og en fuld IEEE-1139 potenslovstilpasning med fem koefficienter samt de operationelle overførselsmetoder: TWSTFT med BIPM's Sagnac-lukkede form, GNSS common-view, PPP-ionosfærefri overførsel, et optisk frirumslink med turbulensscintillation og en tidsskala for et urensemble med inversvarians. En regnemaskine for urets holdover uden GNSS inverterer van-Loan-væksten i frigangsfejl til en holdover-til-tærskel, altså hvor længe et ur kan løbe frit, før dets tidsfejl overskrider budgettet, på tværs af klassiske og kvantebaserede urklasser; modelleret, og ærlig om, at for et meget stabilt ur bestemmes holdover til en stram tærskel af det antagede støjgulv ved lang tau og ikke af den citerede ADEV.

seg-85b181275293 = Pseudoafstand, ionosfære og troposfære

seg-835df2d05f2a = GNSS-måledomæne

seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · Niell enhed i zenit · Klobuchar efter IS-GPS-200

seg-43c0372fe6e7 = Fremadrettet syntese af pseudoafstand og Doppler med Klobuchar (broadcast) og IONEX / TEC-gitter (målt) som ionosfære, herunder en IONEX-filparser, tidsinterpolation og tyndskals-skråningsafbildning, Saastamoinen + Niell som troposfære og RAIM med snapshot.

seg-3458cb02f156 = Enkeltpunktspositionering (PVT)

seg-640e4cd9f008 = GNSS-positionering

seg-4fa43feda96a = Valideret på reelle IGS-data (station ABMF, 2018-05-13) til { "5.7" } m 3D-RMS / { "1.1" } m horisontalt mod den opmålte koordinat.

seg-b107ba0607b0 = En reel modtagerposition løst ud fra reelle RINEX-kodepseudoafstande + broadcast-efemeride ved iterativ vægtet mindste kvadraters metode: Sagnac-/jordrotationskorrektion, broadcast-ur med TGD, den ionosfærefri L1/L2-kombination med to frekvenser (eller Klobuchar med én frekvens), Saastamoinen/Niell som troposfære, elevationsvægtning, DOP og RAIM med snapshot.

seg-5819c351d123 = Jamming og detektion af spoofing i flere lag

seg-9a03f3db9ef0 = χ²₁ NP-detektor · lukket form og Monte Carlo P_fa/P_md stemmer overens

seg-788fdc9a22a1 = En jamming-model med linkbudget (J/S → effektiv C/N₀ → tab af lås), en stokastisk detektor for tidsspoofing (Neyman–Pearson / χ²₁-energitest med Monte Carlo P_fa/P_md og en sikkerhedsFoM på { "1" } − P_md) og en detektor for spoofing i flere lag, der fusionerer en paritetstest for RAIM-konsistens, en RF-AGC-effektmonitor og en monitor for signalkvalitet (SQM). Dertil kommer et fejlbudget for kvanteinertial dødregning, som sammensætter hvidstøjsdrift fra et koldatom-interferometer med resterende bias (krydstjekket mod en uafhængig integrator) og skalafaktorfejl til et tal for positionsdrift over holdover, altså den inertiale tvilling til urets holdover.

seg-87bca15c6939 = Modulation, anti-jam og kodesporing

seg-c7d3ff7ea829 = Ydeevne for navigationssignaler

seg-1aec700caefe = BPSK self-SSC = 2/(3R_c) · C/A DLL-jitter under en meter ved { "45" } dB-Hz · GPS C/A Gold krydskorrelation -23.9 dB

seg-304803ee178d = Laget for signalydeevne mellem linkbudgettet og måledomænet: effektspektraltætheder med enhedsareal for BPSK-R(n) og sinus-BOC(m,n), den spektrale adskillelseskoefficient, der udleder anti-jam-Q'et, som jamming-modellen bruger, direkte fra de faktiske signal- og jammerspektre, RMS-båndbredden (Gabor), som fastlægger afstandsmålingens informationsindhold (BOC > BPSK), den termiske støjjitter i kohærent early–late DLL-kodesporing og den kohærente early-minus-late-envelope for flervejsfejl med undertrykkelse via smal korrelator samt en afvejning ved design af afstandskoder (autokorrelationssidelobe for m-sekvens/Gold og den tre-værdi-grænse for Gold-krydskorrelation, plus omvendingen fra kodelængde til entydig afstand). Dette er analyse af signalydeevne og ikke design af RF-nyttelast eller antennehardware.

seg-684494a7877c = Passiv RF-geolokalisering (TDOA/FDOA)

seg-414872cdf952 = Passiv RF-geolokalisering

seg-bed5944d15dd = støjfri TDOA fremad→invers til { "1e-6" } m · J·CRLB = I · GDOP monoton i modtagere · estimatoren når sin CRLB over { "4000" } Monte Carlo-forsøg

seg-be8f2a419275 = Find en jammer eller spoofer (eller en opportunistisk kilde til omvendt PNT) ud fra hyperboloider for ankomsttidsforskel på tværs af et netværk af modtagere, løst med Gauss–Newton mindste kvadrater; tilføjes ankomstfrekvensforskel med bevægelige modtagere, genvindes emitterens position og hastighed i fællesskab, med Cramér–Rao-grænsen for positionskovariansen ud fra netværkets geometri. En punktkildemodel med fri sigtelinje, uden led for flervej / NLOS, modtagerurets bias eller refraktion.

seg-48e98ff7065e = RINEX-, SP3- og CCSDS-formater

seg-7c6f4dc6bcba = Interoperabilitet

seg-ae8dc649ab26 = broadcast-efemeride + SP3-interpolation mod RTKLIB; OEM mod en uafhængig CCSDS-parser

seg-75aae4d201fd = Indlæsning af multi-GNSS RINEX-3-broadcast-efemeride (GPS, Galileo, QZSS, BeiDou, GLONASS), en parser til RINEX-3-observationer (RINEX { "4.00" }-observationslayoutet forventes at kunne parses, men ingen { "4.00" }-fil er blevet læst igennem den; RINEX { "4" }-navigationsfiler afvises ved navn), en læser/skriver til SP3-c/d-præcisionsefemeride med Lagrange-interpolation og CCSDS OEM { "2.0" } + OMM (middelelementer) som eksport til flyvedynamikværktøjer (GMAT, Orekit, STK) samt parsing og udskrivning af CCSDS-TDM ({ "503" }), sporingsdatabeskeder til radiometrisk sporing i dybt rum.

seg-1f379e235f5f = Maskinkontrolleret verifikationsmatrix

seg-a4d10bb41065 = Verifikation og sikring

seg-72ec664ea7ae = rækker, der er mærket valideret, kræver en uafhængig ekstern reference (invariant håndhævet i CI)

seg-cab165105f32 = En krydsreference fra krav til modul til test til uafhængig reference til status, gengivet fra selve motoren (Markdown/CSV), med enhedstestede ærlighedsinvarianter: en række må kun mærkes valideret, hvis den har en uafhængig ekstern reference (NIST / AIAA / SOFA / IGS / en offentliggjort værdi), så en intern selvkonsistenstjek ikke kan udgive sig for en validering, og de hardware-/PA-funktioner, som Kshana ikke leverer, registreres som huller, der ejes af partneren. Den eksekverbare rygrad for en ECSS-E-ST-10-02-verifikationskrydsreference.

seg-190cdf3ca8dc = Enhed og proveniens på hver rapporteret størrelse

seg-1c7bb8c3e887 = { "87" } af { "87" } arter, { "3127" } af { "3127" } numeriske felter

seg-3e7fb040a7c4 = Hvert numerisk felt, et scenarie udsender, bærer en enhed og en proveniensklasse fra et lukket vokabular, med en definition, hvor en findes, offentliggjort som et maskinlæsbart skema ved siden af motoren. En ratchet-port kører hver indbygget art og fejler på et felt, der ikke har nogen; de arter, der endnu ikke er komplette, nævnes én for én med grunden til, at hver stadig er åben, og listen kan kun blive kortere. Rapporter, der angiver deres egne konstanter, som linkbudgettet for envejs og budgettet for optik og RF, lader en læser genberegne hovedtallet ud fra rapporten alene.

seg-0e1a01c9158a = Budgetter for opsendelse, genindtræden, dækning og pegning

seg-f5cf9e86d3c9 = Missionsanalyse

seg-767b2cd5f4ba = kontrolleret mod lukket form (opsendelsesazimut · Allen-Eggers · SMAD)

seg-23bac81d700b = Missionsdesignbudgetter af første orden, hver et scenarie der kan køres: opsendelses- og stigningsgeometri for to legemer (opsendelsesazimut, mindste inklination, bonus fra jordens rotation, Δv for planskift med dogleg, daglige muligheder), en ballistisk Allen–Eggers-korridor for genindtræden (maksimal deceleration, hastigheder ved maksimal g og maksimal opvarmning), dækningsgeometri for jordobservation (swath / nadir-GSD / adgang uden for nadir / revisit via SMAD-rumtrekanten), et budget for attitude og pegefejl med 3 frihedsgrader (gravitationsgradientmoment + RSS-pegebudget), forudsigelse af passager over jordstationer (AOS/TCA/LOS, maksimal elevation, adgang) og et envejs linkbudget over CCSDS { "401" } / DSN 810-005-linkligningen (FSPL, C/N₀, Eb/N₀, margin, lukning). Det analytiske lag før hardware under STK/GMAT/Basilisk: modellerede budgetter af første orden og ikke en erstatning for 6-DoF eller radiometri.

seg-43f53b910042 = Deling af apertur mellem navigation og kommunikation

seg-989637b0c6fc = Udfald og konflikt pr. session, ikke ét tal for driftscyklus

seg-5c63a4559aff = En kontaktplan og et antal aperturer ind; driftscyklus for navigation, driftscyklus for kommunikation, udfald pr. session og konflikt ud. Arbitreringspolitikken nævnes i rapporten i stedet for at blive underforstået, og en session, der ikke kan betjenes fuldt ud, rapporterer den andel af den, der gik tabt, i stedet for at forsvinde i et gennemsnit.

seg-c8eb43aeb31a = Rumvejr og termosfærisk massefylde

seg-37b8c9397544 = Rummiljø

seg-25e24a6c0ba3 = Jacchia-71 valideret mod offentliggjort solminimum / middel / solmaksimum

seg-1eff250f41c3 = En miljømodel for rumvejr: solar (F10.7 / centreret 81-dages F10.7a) og geomagnetisk (Kp, med den definitionsmæssige Kp↔ap-tabel) aktivitetsindeks, den eksosfæriske temperatur fra Jacchia-1971, som de driver, og den aktivitetskorrigerede mod den statiske neutrale termosfæriske massefylde i højden, altså den afhængighed af solcyklussen i massefylden, som en statisk atmosfære udelader. En kalibreret kobling af første orden via skalahøjde og ikke en datavalideret NRLMSISE-atmosfære.

seg-49bac998eb07 = Evaluering af detektion af RF-forstyrrelser og PNT-afvejning

seg-dca720256d85 = Evaluering og afvejning med maskinlæring

seg-5f0a39efe160 = AUC-harness verificeret mod binormal lukket form Φ(d′/√{ "2" }) (Gneiting & Vogel { "2018" }); evalueringsmålene valideret bit for bit mod scikit-learn { "1.9.0" }: syntetisk korpus, ikke rå IQ/TEXBAT

seg-0dc3a7135442 = Et testbed til evaluering af detektion af RF-forstyrrelser: et mærket, parameterbaseret syntetisk korpus (nominel / jamming / spoof-tid / spoof-position / flervej), en detektoragnostisk ROC/AUC-harness, der scorer enhver detektor med Pd pr. klasse ved en mål-Pfa, og optimismegabet mellem inden for og uden for fordelingen. Et dybere studie af optimismegabet udvider dette til et panel med 13 detektorer (energi / AGC / SQM / paritet plus seedede detektorer med logistisk regression og MLP med ét skjult lag), skaleringslove inden for og uden for fordelingen med en permutationsnul og en leave-one-out-prædiktor for forringelse uden for fordelingen; en front end til softwaredefineret modtager (rå IQ/IF til korrelatorernes early/prompt/late-aftap til SQM) og adaptere til indlæsning af reelle data (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) lader de samme detektorer køre over optagelser, der leveres lokalt. Dertil en afvejning mellem kvante og klassisk PNT, der kvantificerer fordelen ved et kandidat-urs tidssynkronisering og inertialt holdover ud fra en målt ADEV-kurve mod en klassisk baseline, med en modstandsdygtighedskuvert mod tid uden GNSS. Modellerede driftskarakteristikker, aldrig felt- eller IQ-data, ingen dom om godt eller dårligt.

seg-8766e058334d = Kort over krydsning i modstandsdygtighed mellem kvante og klassisk

seg-8f851e9cf8c2 = genskaber studierne af inertial- og urkrydsning bag figurerne i Resultater; afvejningskerner valideret mod scipy { "1.17.1" }

seg-a057ad4c89ce = Et reproducerbart kort over, hvor en kvantesensor overhaler sin klassiske modpart under parameterusikkerhed: koldatom mod dødregning af navigationsklasse og optisk mod chip-skala-ur i holdover, over udfaldets varighed og platformens vibration, hver kurve med en etiket for teknologisk modenhed. Kan genskabes med cargo run --bin crossover_study. Modellerede ydelsesbudgetter: inputtene er offentliggjorte eller afgrænsede koefficienter og ikke flyvedata.

seg-6347618838dd = Betinget beskyttelsesniveau for tidssynkronisering

seg-a846e806e577 = Integritet af tidssynkronisering

seg-762bc9f28716 = sammensætningen krydstjekket mod den flertrins kovariansrekursion for clock_state; kalibreret på JammerTest { "2024" } (Zenodo { "15911589" })

seg-3622798325cd = En holdover-begrænset grænse for den uopdagede tidsfejl under GNSS-spoofing: givet et uafhængigt krydstjek er den leverede tidsfejl afgrænset af et k-sigma-gulv for monitoren, van-Loan-frigangsvariansen over detektionsforsinkelsen og en CUSUM-tid til alarm. Kalibreret på en reel optaget spoof (JammerTest { "2024" }) og kan genskabes med cargo run --example tpl_jammertest. Modelleret sammensætning, betinget af detektion: der findes ingen endelig ubetinget grænse, fordi en tilstrækkelig langsom rampe undgår en enkelt urstøttet monitor.

seg-734a93b6a809 = Scoring af modstandsdygtighed i PNT og ustabilitet i beslutninger

seg-c25b4e240fb5 = Vurdering af modstandsdygtighed

seg-f42ae8719e02 = { "35" } håndudledte tests mod en uafhængig reference; byte-deterministisk studieartefakt (fast seed); afstemt efter DHS RPCF v2.0

seg-62ef40799af4 = Misset detektion → integritetsregioner

seg-52e55797d77c = Konsekvens for integriteten

seg-99025f66f277 = Stanford-ESA-integritetsregioner (Tossaint et al., NAVIGATION { "2007" })

seg-13f23ffe5840 = En bro fra misset detektion til integritet: en uopdaget bias, som en misset spoof-, jam- eller RAIM-detektion efterlader, forstørrer den effektive positionsfejl, som holdt op mod kontekstspecifikke alarmgrænser klassificeres i Stanford-ESA-integritetsregionerne (tilgængelig / utilgængelig / vildledende / farlig). Sammensætter den eksternt forankrede Stanford-klassifikation for RAIM og tilføjer ingen ny integritetsmatematik.

seg-3a7572774192 = ROI pr. dækning

seg-797d137dc022 = Beslutningsstøtte

seg-d77993b6ef59 = En ROI-vinkel på omkostning pr. dækning: omkostning pr. enhed leveret dækning ved en afvejning mellem konstellationer eller arkitekturer. Dækningsdelen sammensætter den validerede dækningsgeometri, og regnestykket er enhedstestet, men omkostningen er et input fra brugeren, så forholdet er et planlægningsværktøj og ikke en eksternt valideret størrelse (derfor ærligt talt intet bevismærke).

seg-690b4cb0df55 = Kshana Interchange Format (KIF)

seg-558523b5e0ac = Udveksling af artefakter

seg-b882cccf5cee = versioneret kuvert · rundtur og fremadkompatibel læsning verificeret

seg-ff5a4ead87fe = En versioneret, selvbeskrivende kuvert, der omslutter et scenarieresultat med dets art, skemaversion og etiketterne modelleret/valideret, så en gemt artefakt forbliver selvdokumenterende, og ældre kuverter fortsat kan læses fremadkompatibelt.

seg-5052e1720602 = Tillidsscore for modtageren på et fartøj

seg-70144aeea2d1 = monitorernes regnestykker kontrolleret mod pynmea2 og GeographicLib

seg-9d9329128f06 = Scorer, om et fartøjs positionsbestemmelse kan stoles på, ud fra den NMEA { "0183" }, som dets modtager og instrumenter allerede udsender: en score fra 0 til 100, tre bånd og årsagerne bag dem, pr. epoke, i batch, live eller som port. Monitorerne sammenligner positionsbestemmelsen med fartøjets egen bevægelse, kursføler, log og signalstyrker for satellitter. Vejledende software, ikke typegodkendt navigationsudstyr: operatøren er fortsat ansvarlig. Monitorernes regnestykker er kontrolleret mod uafhængige biblioteker; scorens regel og tærskler er projektets egne og forbliver modelleret.

seg-a47934361f43 = NMEA-strømme til træning af besætninger

seg-c6492d4a7dae = { "225,227" } sætninger parset og afkodet af pynmea2

seg-9ca765cc09fc = Skriver syntetisk NMEA { "0183" } fra broen for en scriptet sejlads med jamming, positionsdrag-off, tidsspoofing og replay-hændelser scriptet af instruktøren, med en instruktørlog, så en besætning kan se, hvordan en forringet positionsbestemmelse ser ud på deres egne instrumenter. Kun tekst, aldrig til et fartøjs aktive navigationssystemer; intet udsendes, og intet radiosignal fremstilles. Sætningerne og deres afkodede værdier er kontrolleret; modellerne for modtager, himmel og hændelser er modellerede.

seg-39f61b88209e = kodebetydninger og geometri kontrolleret mod pyModeS, pyais, shapely og GeographicLib

seg-4c1667d3d453 = Bygger et GeoJSON-kort pr. dag over, hvor fly (ADS-B) og skibe (AIS) har rapporteret forringede navigationsdata, ud fra åbent licenserede inputs, og den andel af en rute, der går gennem forringede celler. En forringet celle er en påstand om rapporterede nøjagtighedsfelter eller usandsynlige positioner og ikke en konstatering af interferens, og en celle, som ingen har observeret, er ikke belæg for en fri rute. Tidligere rapporter og ikke en prognose.

seg-e0962980e96f = Tillidstelemetri til sikkerhedsdrift

seg-9b538e790bd7 = Prometheus, OTLP og CEF læst tilbage af uafhængige parsere

seg-f33e062790d9 = Eksporterer tillidsstrømmen som Prometheus-målinger, OpenTelemetry (OTLP/HTTP) og CEF- eller LEEF-syslog-hændelser over stdout, HTTP, UDP eller TCP, så et sikkerhedsoperationscenter ser en navigationsfejl ved siden af sine øvrige alarmer. En død indsamler hverken gør, at vurderingen går i stå, eller går ubemærket hen. Prometheus, OTLP og CEF læses tilbage af uafhængige parsere; LEEF kontrolleres kun mod sin egen specifikation.

seg-c74f3b9569b1 = Signerede bevispakker

seg-28016686504c = RFC { "8032" }-vektorer byte for byte; en clean-room-verifikator er enig på { "71" } pakker

seg-123fa1de2e23 = Samler vinduet omkring en tillidshændelse i en hashkædet, Ed25519-signeret pakke, som enhver kan verificere offline: en ændret, fjernet, udskiftet eller tilføjet fil, en gensigneret pakke eller en forkert fastlåst nøgle bliver nævnt. Et valgfrit RFC { "3161" }-tidsstempelbevis er bundet til den. En teknisk registrering og ikke en juridisk udtalelse, en konstatering af faktum eller en attestering.

seg-ee2e250497f9 = Eksport til testbænk

seg-ea618add831e = konverteringer og kodninger kontrolleret mod PROJ, GeographicLib, pynmea2 og SciPy

seg-be8af88f4f99 = Skriver et scenaries køretøjsbevægelse og hændelser som en CSV-bane og NMEA { "0183" } til en GNSS-simulator i laboratoriet: jordfaste, geodætiske og lokale hastighedskolonner, attitude og UTC. Kun bevægelse og hændelser: intet signal skrives, og der påstås ingen ydeevne for simulator eller modtager.

seg-1ff1d8ebf1e7 = Compliance-mapping til offentlige rammeværker

seg-83af3fa21509 = Afbilder Kshana-output på paragrafferne i offentlige rammeværker (IMO-vejledning for skibe, EU's NIS2 artikel { "21" }, EN { "16803" }, USA's DHS-rammeværk for modstandsdygtig PNT og EASA-vejledning for luftfart) udelukkende efter paragrafnummer, udfyldt ud fra de kørsler, du giver den, og angiver, hvilke rækker et sæt kørsler leverer belæg for, med hver rækkes hul. Det er ikke en konstatering af, at noget rammeværk er opfyldt, og ikke en vurdering eller godkendelse fra nogen side.

seg-1b784a8701ac = GNSS-autentificering

seg-2b5a6095013a = alle { "18" } officielle sæt af testvektorer: { "186,382" } tags autentificeret, { "0" } fejlede

seg-0419e9af208d = En åben verifikator i ren Rust på modtagersiden til Galileo Open Service Navigation Message Authentication: den kontrollerer, hvilke satellitters navigationsdata en modtager kan autentificere ud fra I/NAV-sider eller en u-blox UBX-strøm, gennem kontrollerne af offentlig nøgle, nøglekæde og tags i specifikationen for signalet i rummet, og rapporterer autentificering pr. satellit og pr. tidspunkt. Den autentificerer data; den påstår ingen ydeevne mod spoofing.

seg-d8bb6226f2e3 = Synlighed med horisontmaske, DOP og fejlellipse

seg-6c6e7248496f = Himmelgeometri

seg-94ff262653a6 = { "1173" } sigtevinkler og { "142" } synlige sæt stemmer med Orekit { "12.2" } og gnss_lib_py { "1.0.4" } til { "1e-12" }; ellipsen stemmer med numpy på { "270" } tilfælde

seg-309521d4c9e1 = Hvilke satellitter et sted kan se, når bygninger, kajer, kraner eller terræn blokerer en del af himlen, og hvad det gør ved præcisionsfortyndingen (DOP) og den horisontale fejlellipse. En azimutafhængig horisontlinje erstatter den enkelte elevationsgrænse; det synlige sæt, dets DOP og ellipsen kommer ud pr. epoke og pr. konstellation. En horisontlinje fjerner satellitter med fri sigtelinje og intet andet: den modellerer hverken refleksioner, diffraktion eller signalstyrke.

seg-448e81d36ca4 = Forudindstillinger for horisontlinjer og funktionerne for himmelgeometri

seg-6483f9d89f15 = håndberegnede værdier og den geometri, skyen samples fra; ingen ekstern uafhængig reference

seg-ebc2904904d3 = Reduktionerne af gadekløft, sektor og terræn til en horisontlinjetabel, fire repræsentative forudindstillinger (bygade, havneindsejling, fjord, containerterminal) og de funktioner, der sammensætter dem til et skyplot og en Monte Carlo-sky, fra CLI, MCP, Python og browseren. Forudindstillingerne er repræsentative geometrier med valgte, angivne dimensioner og ikke opmålinger, og reduktionerne er kun kontrolleret mod håndberegnede værdier.

seg-c2a5a6a7bcb0 = Tillidsklassifikation med geometri

seg-2f51e4da63b4 = klassifikationsreglen og tærsklerne er projektets egne, kontrolleret mod sig selv

seg-b664ce284745 = Stiller satellitgeometrien ved siden af tillidsscoren for modtageren og angiver en klasse for hvert fradrag: tab af signal, dårlig geometri eller en uoverensstemmelse mellem modtagerens angivne DOP og den, der udledes af de satellitter, der er i sigte. Geometrien bedømmes kun, når den er kendt, og etiketten er hovedpunktet: kun en dårlig geometri koster point. Vejledende software, ikke typegodkendt navigationsudstyr.

seg-5026aab26cb8 = Studie af referencestation på Månen

seg-d6935d32272b = sammensætter testede funktioner for differentiel drift, ur og referencesystem på Månen; kontrolleret mod sig selv og en numpy-reference, ingen eksterne flyvedata

seg-4f9696706384 = Ét reproducerbart studie af, hvad en referencestation ved Månens sydpol kunne gøre under offentlige antagelser: et dækningskort og nøjagtighedskort over polarområdet (percentil for korrigeret og ukorrigeret positionsfejl, tilgængelighed med en begrundelse for hver utilgængelig epoke, beskyttelsesniveauer og budgettet for korrektionslinket), et tidslaboratorium, der holder en tidsreference for Månen på et atomur, og geodæsien for en tilføjet laserretroreflektor og VLBI-beacon mod datummet med fem arrays. Hvert input er mærket med sin offentlige kilde eller som illustrativt. Det er ikke en udtalelse om ydeevnen i noget reelt system, og Kshana er ikke tilknyttet nogen myndighed.

seg-cad8be3b66a3 = Optiske tidslink gennem skyer og turbulens

seg-e86745da72f0 = { "7" } af { "7" } numeriske tærskler fastsat på forhånd nået mod et uafhængigt mpmath-program; ingen målt tilgængelighedsregistrering er sammenlignet

seg-dd98aa94f8c8 = Hvor ofte et optisk tidsoverførselslink er oppe, når atmosfæren ligger i vejen. For hvert jordsted giver motoren tabet i klar luft, Hufnagel-Valley-turbulenstilstanden med gamma-gamma-scintillationsfades og aperturmiddelværdi, tilgængeligheden mod linkmarginen ud fra et angivet skyklima, loftet, som ingen margin kan løfte, fordelingen af udfaldets varighed og den tidsfejl, et udfald koster et ur i holdover. Derefter viser den, hvad flere steder, en større apertur, en anden bølgelængde eller adaptiv optik giver. De medfølgende skyklimaer er illustrative og ikke målte; outputtet er vejledende.

seg-861d57389dd7 = GNSS ud over konstellationen: Space Service Volume og videre

seg-8705c276af61 = ICG SSV-hæftets tabeller, præregistreret; de fleste tærskler NOT MET (xval/gnss-ssv/RESULTS.md)

seg-2dc82174942a = For et rumfartøj på en kugle (den globale skal i ICG Space Service Volume-hæftet) eller på en Kepler-bane fra LEO til lunar transfer tæller den pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for alle samlet de signaler, der ligger over en C/N0-tærskel: tilgængelighed af ét og af fire signaler, længste udfald, modtaget C/N0, præcisionsfortynding og links via hovedlobe i forhold til sidelobe. Sendemønstrene er hæftets, en parametrisk erstatning eller et, du leverer; en model for ionosfære, plasmasfære og atmosfære med limbstråle og et design af modtager til svage signaler er valgfrie; et GNSS-filter om bord til høje baner og baner til lunar transfer og relativ navigation i formation er med. MODELLED: sammenlignet med hæftets tabeller under en præregistrering fastlagt før kørslen stemmer konstanterne for mindste udstrålede effekt og Månens tærskel overens, de øvrige tærskler er NOT MET under den præregistrerede aflæsning (næsten alle på grund af hæftets inkonsistente strålevinkel for GLONASS), og den parametriske sidelobe-erstatning gengiver ikke de målte GPS-panelmønstre.

seg-61817375c8ea = Månens bane og overflade som navigations- og geodætisk infrastruktur

seg-d2439abaeabb = numpy/scipy som uafhængig reference for numerikken; tre præregistrerede tærskler NOT MET (xval/lunar-infra/RESULTS.md)

seg-db45ac2940af = Fem studier i en begrænset trelegememodel: banebestemmelse med Jord-GNSS om bord i en næsten retlinet halobane mod en uafhængig bestemmelse af afstand og afstandshastighed fra jorden; fælles fastsættelse af heltalsmultiplicitet i bærebølgefasen for en overfladestation og en orbiter (LAMBDA); Fisher-informationen for et lunart datum med syv parametre med og uden afstande fra orbiter til overfladen; GNSS-, VLBI- og laserafstandsforskydninger mod det lokale tie; og følsomhed over for parametrene for lunare tidevand og libration. MODELLED med illustrative inputs: numerikken er kontrolleret mod uafhængige numpy- og scipy-programmer og ikke fysikken. Under de præregistrerede tærskler er tre NOT MET: en injiceret kraftfejl opdages ikke med den angivne rate (C3), den bootstrappede succesrate afviger fra numpy-referencen med { "1.7e-6" } mod en tærskel på { "1e-9" } (Q3), og tilføjelsen af en afstandsfamilie sænker ikke altid pseudoinversens spor (G3, spordelen).

seg-d6476863f862 = Funktion

seg-ad856ad710eb = Status
