# docs--modelled-rationale: translations (da)

seg-2db69c58f694 = Differentiel PNT på Månen

seg-1ff1d8ebf1e7 = Compliance-mapping til offentlige rammeværker

seg-aab745a65e76 = Modul

seg-d6476863f862 = Funktion

seg-60a43431ebe0 = Krav

seg-bde1b3a94a47 = Solar SRP-skygge med randfortykning (valgfri)

seg-eaaec545dd68 = SRP-belyst andel som den ikke tilsløredede andel af solfluxen med randfortykning (Eddington-approksimationens lov I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kvadratur) over en sfærisk eller WGS-84-Jord (srp_shadow::limb_darkened_shadow, ShadowModel-varianten OblateEarthLimbDarkened)

seg-9e15970435c3 = Sol og Måne fra DE440 i Cowell-kraftmodellen (valgfrit)

seg-de6831cf7785 = Valgfrit efemerideniveau for leddene for tredjelegeme og SRP i den numeriske Cowell ForceModel: den geocentriske Sol og Måne fra en vilkårlig EphemerisProvider (en DE440 SPK-kernel via KernelEphemeris) ved TDB = TT + (TDB - TT), som afviser en provider, der ikke kan betjene epoken, og tæller hvert fald tilbage til den analytiske serie; som standard fra

seg-057c21daf4f2 = S1-atmosfæretidevand (valgfrit)

seg-f600a39f297e = Det døgnlige S1-lufttryksfloede som en perturbation af geopotentialet: Biancale og Bode ({ "2006" }) model N1, grad { "2" } til { "6" }, gennem belastningsformlen i IERS { "2010" } lign. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valgfrit på Cowell- og præcisionskraftmodellerne (air_tide_s1, som standard fra)

seg-e8f5ff8c9149 = Tyngdefelt med kuglefunktioner af høj grad (EGM2008 til { "2190" })

seg-d3b2f32dcecb = Evaluering af et fuldt normaliseret felt til grad { "2190" }, sikret mod underflow og mod polerne (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes-Featherstone { "2002" } modificeret fremadrettet søjle med gradienten fri af 1/cos phi), en streamende indlæser af ICGEM .gfc (from_gfc_file / from_gfc_reader; hele EGM2008 hentes ved kørsel og medleveres ikke) og Holmes-Featherstone-evaluatoren, som kan vælges på det valgfrie Cowell Geopotential

seg-1960804ef2f4 = Batch-banebestemmelse med afstandsændring og az/el med maskering af stationer

seg-4c185244bc66 = Genfind en epoketilstand ud fra blandet sporing af afstand, afstandsændring og azimut/elevation over en elevationsmaske med Gauss-Newton på H = (dh/dx(t)) Phi(t, t0): analytiske partielle afledede af målingerne og en variationel tilstandsovergangsmatrix med analytiske partielle afledede for tolegemer + J2 (RK4-integreret, ikke en STM i lukket form)

seg-bc3d1ee7c639 = Vægtning af observationer efter nøjagtighedskode i SP3

seg-63b1fab84f85 = Afbild nøjagtighedskoder i SP3 (header ++ eksponenter i { "2" }^n mm, basen %f, standardafvigelser base^n mm pr. post) til positionssigmaer pr. observation for motoren til præcis banebestemmelse (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ae3e8833a5ef = Knyt et offentliggjort tyngdefelt til et legeme

seg-ffb2b20e5f32 = with_gravity_field (på Body, i src/gravity_pds.rs): knyt ethvert indlæst felt med kuglefunktioner (for eksempel GMM-3 eller GL0660B) til en Body, så propagatoren evaluerer det legemsfast; valgfrit, standardlegemer er uændrede

seg-9762cf428435 = Navigationsmeddelelsesenkodere ud over GPS LNAV (GPS CNAV, Galileo I/NAV og F/NAV)

seg-9b703b9607d8 = GPS CNAV-meddelelsestyperne 10/11/30, Galileo I/NAV-ordtyperne 1-5 i nominelle lige/ulige sider og Galileo F/NAV-sidetyperne 1-4: pakning af ICD-felter og kvantisering, CRC-24Q, foldningskodning med rate 1/2 og K={ "7" } (G2 inverteret for Galileo), blokinterleaving og synkroniseringsmønstre, med tilsvarende testdekodere

seg-974d8c1f7876 = Hatch-bærebølgeudjævning af kode på reelle RINEX-observationer

seg-f26b5da0f52e = Hatch-filter uden divergens (ionosfærefri kode båret af den ionosfærefri bærebølge, vindue på N epoker, genstart ved tab af lås, geometrifrit spring eller hul) i samlingen til præcis enkeltpunktspositionering

seg-278ca396127a = Indlæsning af RINEX { "4" }-observationsfil

seg-e0883aa933eb = Headere i RINEX 4.0x-observationer (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; labels matchet i kolonne 61-80 for version { "4" } og senere) og epokeposter

seg-33e5c74720ff = Udsendt satellitposition for BeiDou GEO

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } position af geostationær satellit fra en udsendt efemeride (inertielignende system, derefter Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valgfri via feltet include_beidou_geo i NavParseOptions, så standardlæseren stadig springer GEO'er over

seg-71f48628ebb2 = GNSS/INS med tæt kobling på bærebølgefase med float-multiplicitet

seg-5a156aa81275 = Fejltilstands-EKF over { "15" } INS-tilstande, et ur i modtageren med to tilstande og én float-multiplicitet for bærebølgen pr. sporet satellit; pseudoafstand, bærebølgefase og valgfri afstandsændring fra en SGP4 Walker-konstellation (lysrejsetid og Sagnac), Klobuchar- og Saastamoinen/Niell-korrektioner anvendt i sløjfen ved filterets egen position; detektion af slip med tidsdifferentieret bærebølge og en tærskel pr. satellit udvidet med hastighedsusikkerheden; geninitialisering af multiplicitet ved slip og genopfangning

seg-7d644516b1ec = Pakker for GNSS/INS til skibsfart, jernbane og luftfart med mulighed for tæt kobling

seg-cbb03a8baf73 = Tre gnss-ins-scenarier på trajektoriebiblioteket (et fartøj, der sno sig med { "8" } m/s med et udfald på fem minutter; et tog gennem et indsnit med to satellitter og en tunnel; et fly, hvis udfald dækker en krængende sving på 25 grader) og pakkens valgfrie [tight]-tabel: pseudoafstande fra en SGP4 Walker-konstellation fusioneret af navigatoren med lukket sløjfe, hver satellit over masken ved nominel drift og de højeste få ved forringet

seg-f4dab73c4eda = Koblet PNT-filter med pseudoafstande med biastilstand og 3D-udvidelse i fusionspakken

seg-742b60089361 = Ét stakket Kalman-filter over position, hastighed, urfase og frekvens, fodret med pseudoafstande, der kobler position og ur (Joseph-opdateringer, der bærer krydskovariansen); en variant med 1 DOF udvidet med en konstant accelerometerbiastilstand, som fusionspakken kører under [coupled]; og 3D-versionen med 8 tilstande med rækker for sigtelinjen

seg-2db2b9dc3b45 = GNSS/INS-trajektoriebibliotek og import af CSV-reference

seg-e1fe83c75a6c = Valgbare bevægelsesprofiler til gnss-ins-pakken (ligeud, figur-8, bymæssig stop-og-kør, flyets stigning og koordineret sving, opmålingsdrone), defineret af kommandoer for Euler-rater og acceleration langs sporet, lukket på referencetilstanden med den kinematiske IMU (centripetal-, tyngde- og Coriolis-led), og importeret CSV-reference omsat til den IMU, der gengiver den; den historiske kørsel er uændret, når der ikke er angivet nogen profil

seg-86f9186bb884 = Jord–Måne CR3BP { "9" }:{ "2" } NRHO mod den bane, CAPSTONE fløj

seg-d4127cf241f3 = Den cirkulære begrænsede { "9" }:{ "2" } sydlige næsten retlinede L2-halobane, som cr3bp::differential_correct_halo korrigerer (banefamilien for Gateway og CAPSTONE), sammenlignet på sin middelgeometri (periode, perilunradius, apolunradius) med den bane, CAPSTONE faktisk fløj. En måling af, hvor godt CR3BP-medlemmet beskriver den reelle bane; en CR3BP-bane er ikke en bane i en efemeridemodel og sammenlignes ikke epoke for epoke

seg-1a5623c81b48 = Positionsfejl fra geometri: RMS-fejl = sigma_UERE x DOP for motorens mindstekvadraters positionsbestemmelse

seg-7a94b44a8738 = dop_error_mc::run_geometry og check: et seedet Monte Carlo (N = { "20,000" } epoker pr. geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) af motorens egen iterede mindstekvadraters positionsbestemmelse (pvt::solve_spp, enhedsvægte, løst fra den sande position) på de { "8" } geometrier i tests/fixtures/dop/dop_reference.csv, hvor varianserne af fejlen mod øst, nord, op og ur, H/V/P-RMS, korrelationen øst-nord, middelfejlene og andelen inden for den horisontale ellipse på { "95" } % sammenlignes med sigma^{ "2" } Q, hvor Q er kovariansfaktoren i kernen orbit::dop (orbit::dop_cofactor, den samme aritmetik) på den samme geometri

seg-9acfde1b57f7 = Geometribevidst tillidsklassifikation: satellitgeometri ved siden af modtagerens tillidsscore og en klasse på hver fradragspost

seg-6138c41e13ff = receiver_trust::geometry: satellitgeometri pr. epoke (god, forringet med årsagerne få-satellitter/høj-pdop/høj-hdop/blokeret-himmel eller ukendt, når loggen ikke har GSV, NAV-SAT eller GSA) udledt af de rapporterede elevationer og azimutter gennem orbit::dop eller taget fra GSA, med en label, der altid rapporteres og aldrig scores (god, rimelig, dårlig, ukendt) og HDOP, PDOP, VDOP, antallet af satellitter og signaltab i ord; en geometrimonitor i skibsscoren, der ikke fratrækker noget, medmindre geometrien er dårlig (forholdet max(hdop/4, pdop/6, 5/n_used) over { "1" }), derefter stiger til et loft på { "15" } point ved { "1.5" }, som geometrien alene ikke kan føre under det forringede bånd (loft, ende på rampen og gulv i [geometry]; ingen alarm); en klasse på hver fradragspost (geometri, miljø, uoverensstemmelse) med tab af lås for satellitter under { "15" } grader klassificeret som geometri, satellitter i sigte men ikke sporet klassificeret som miljø, og et fradrag for dårlig geometri, hvis angivne HDOP ligger uden for max({ "1.0" }, { "25" } % af den udledte HDOP) fra den angivne himmel, klassificeret som uoverensstemmelse

seg-bbb1828b3db1 = Reduktion af gadekløft, sektorer og terræn til en tabel

seg-2864aec7be88 = skyline: gadekløften på lukket form (afskæring atan((h - a) / d) med d = (w/2) / abs(sin(az - s)), åbne ender for en endelig længde), skarpkantede sektorer med uret med omslag og terrænpunkter reduceret til en tabel med krumningsfaldet d^2/({ "2" } * 4/3 R); horisontlinjen er deres punktvise maksimum med enhver tabel

seg-3f3d657854ce = Forudindstillinger for horisonten (bygade, havneindsejling, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: fire REPRÆSENTATIVE geometrier med udformningsnotatets angivne dimensioner og en linje om oprindelse for hver: city-street (en kløft, gade { "0" } deg, { "20" } m mellem { "30" } m høje mure, antenne { "1.5" } m), harbour-approach (sektorer: åben mod havet over { "180" } deg, kajbygninger { "8" } deg over { "90" } deg, bølgebryderen { "3" } deg), fjord (terræn: vægge { "600" } m over antennen i { "1.5" } km afstand på hver side af en nord-syd-gående rende, krumningsfald anvendt), container-terminal (sektorer: stakke { "12" } deg over den landvendte halvdel, kranarme { "35" } deg og { "25" } deg over to smalle sektorer); kan tilsidesættes felt for felt

seg-6012113b4836 = Funktioner for himmelgeometri: synlighed, DOP, kovarians, fejlellipse, Monte Carlo-sky

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> og <c2/>, Python- og WASM-funktioner med de samme navne, MCP <c3/>): ud fra et sted, et tidspunkt og konstellationsforudindstillinger (eller satellitter som azimut/elevation eller ECEF) fås de synlige og maskerede satellitter under en horisont, GDOP/PDOP/HDOP/VDOP/TDOP, enhedsvariansens kofaktor (H^T H)^-1 og kovariansen i øst-nord-op med ét modtagerur pr. system eller ét til fælles, den horisontale fejlellipse (halvakser k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientering { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) fra nord) og n seedede mindste kvadraters fejl under uafhængige gaussiske afstandsfejl med deres empiriske kovarians, RMS og { "95" } % indeslutning. Kofaktoren er orbit::cofactor_from_los, den ene kerne bag orbit::dop og orbit::dop_cov (dop er dop_covs reduktion): ingen anden DOP-implementering

seg-7f66be0f15c8 = Urets holdover uden GNSS

seg-4d8f87668a0f = Vækst i udløbsfejl på lukket form + holdover til tærskel; kvanteurklasser

seg-29b482d88916 = Målte enhedskort for ur (forudsigelse på tilbageholdte data)

seg-8c68c5b25004 = clock_library: et enhedskort (hvid fase, hvid, flicker og random-walk FM plus en lineær frekvensdrift) tilpasset en tredjedel af en navngiven målt urregistrering efter en logget konditioneringsrunde (huller, faseafvigere, fasespring og bursts fjernet; frekvensspring logget), vægtet med de frihedsgrader for støjtypen, der er identificeret ved lag 1, og dets forudsagte Allan-deviation bedømt på de tilbageholdte to tredjedele; læsere til RINEX- og IGS-urfiler, BIPM-filer for hvert laboratorium og Circular T afsnit { "1" }; omregning af et kort til støjmodellen for slot-tidssynkronisering, den udvidede Kalman-urmodel og spoofing-monitorens støjniveauer

seg-5097a0e6460d = Målte urkort for GPS Block IIF med led pr. omløb (forudsigelse på tilbageholdte data)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: et enhedskort med faseled på en til fire gange pr. omløb (periode T/k, T = { "43 082.05" } s), tilpasset samlet med det kvadratiske led ved mindste kvadrater på en tredjedel af en målt satellituregistrering, med hvert leds Allan-bidrag på lukket form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } i den forudsagte Allan-deviation

seg-0d72fcc0fbea = Tilstandsestimering af ur om bord

seg-6db5391f8ebe = Kalman-ur med 3 tilstande (fase/frekvens/drift) efter van Loan, Joseph-stabiliseret

seg-3f0a9d7c2971 = Fejlbudgettering for tidsoverførsel

seg-216f46b43860 = To-vejs/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→afstand

seg-157fadeb5d67 = Modulation af navigationssignaler og analyse af kodesporing

seg-ab633d191396 = BPSK-R/BOC PSD, spektral adskillelse κ, Gabor-båndbredde, DLL-jitter, multipath

seg-e6c08e1e6ae3 = Ydeevne for kvanteinertisensor

seg-d28e1f6a430f = Accelerometer med kolde atomer og interferometri ud fra første principper (k_eff·T², QPN)

seg-4b79d03cecf5 = Kvanteinertisensorens fringe-flertydighed / dynamikområde

seg-deb2850546d5 = Mach–Zehnder-dynamikområde for fringe-flertydighed: den 2π-periodiske fringe-aflæsning fastsætter en maksimal utvetydig specifik kraft a_max=π/(k_eff·T²), og det utvetydige område i opløsningsceller a_max/σ_a=π/σ_Φ er uafhængigt af den optiske skalafaktor — T²-følsomhedsgevinsten koster utvetydigt område i nøjagtigt samme takt (interrogationstiden bytter opløsning for område, så antallet af celler ligger fast ved aflæsningens fasestøj)

seg-d04bf321d4a1 = Robusthed af kvanteinertisk dødregning

seg-c4989abb5d40 = Sammensat positionsbudget over holdover med bias + skalafaktor + VRW + stabilitetsaftagen

seg-5692c7b936b6 = Robusthed over for jamming uden GNSS

seg-f4ff77caa47b = Geometrisk J/S-linkbudget, anti-jam C/N₀, tab af lås pr. satellit

seg-ff90679d1de9 = Detektion af spoofing

seg-b843f63e77e6 = Urstøttet χ², RAIM, AGC og SQM, fusioneret til et sikkerhedskvalitetsmål for hver epoke

seg-b10d07921f5e = Beskyttelsesniveau for tidssynkronisering under spoofing

seg-2a829711b997 = Grænse på lukket form for den værste uopdagede tidsfejl = monitorens gulv + oscillatorens udløbs-σ over CUSUM-detektionsforsinkelsen, rapporteret som et bånd for rødstøjsgulvet

seg-f1d49eac89f8 = Alternativ / supplerende PNT

seg-023dda973f66 = Tyngdekortmatchning, terrænreferencebaseret (TERCOM/SITAN), magnetisk anomali

seg-791e7285c291 = Reproducerbarhed og softwaresikring

seg-7177355a482c = Deterministisk, scenariehashet, SBOM + golden-gates på tværs af platforme

seg-241f2eeaef12 = Mærket syntetisk forstyrrelseskorpus + detektoragnostisk ROC/AUC/forvirringsmatrix/Pfa-Pmd-harness; lækagebeskyttelse, stratificeret opdeling, optimismerapport om fordelingsskift (inden for vs. uden for regime). Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/impairment-eval.toml)

seg-642087659fda = Kontrolleret syntetisk undersøgelse af optimismegabet i AUC fra distribution til uden for distribution på tværs af publicerede metoder og indlærte detektorer (logistisk regression / MLP med ét skjult lag): tendenser i skaleringslove pr. klasse (Spearman ρ + hældning på { "1" }−alvorlighed) og en ridge-forudsigelse med kun ID, der estimerer gabet alene ud fra diagnostik inden for distributionen, bedømt ved udeladelse af én detektor ad gangen og én klasse ad gangen. Kan gengives via <c1/>

seg-fd6424213d1f = Afvejning mellem kvante og klassisk PNT og robusthed uden GNSS ({ "13503" })

seg-21b2b54200a8 = Indlæsning af målt ADEV (NNLS), afvejningstabel (holdover for tidssynkronisering/inerti + gevinst), robusthed-over-tid-kurve; forbeholdet om gulvet følger med artefaktet. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/quantum-trade.toml)

seg-1fa865bfddd1 = Rumvejrsmiljø og aktivitetsdrevet termosfærisk massefylde

seg-47308f611c7e = Sol-/geomagnetiske indekser (definitorisk Kp↔ap-tabel), Jacchia-1971-eksosfæretemperaturen og Jacchia { "1971" }-termosfæremassefylden (SAO Special Report { "332" }: statiske diffusionsprofiler, der gengiver dens tabel { "7" }, med døgn-, geomagnetiske, halvårlige, sæsonbestemte breddegrads- og heliumvariationer) mod den statiske USSA76-atmosfære. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/space-weather.toml)

seg-c76b8c395ef0 = Opsendelsesvindue og stigningsgeometri (missionsanalyse)

seg-6066c634faba = Opsendelsesazimut(er) for to legemer (sin Az = cos i / cos lat), mindste opnåelige inklination, cirkulær hastighed, jordrotationens bonus mod øst, Δv for dogleg-planændring og daglige muligheder og, givet en epoke og IERS finals2000A-rækker, stedets hastighed om den sande pol (launch::site_rotation_speed_at). Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistisk indflyvningskorridor ved genindtræden (Allen–Eggers)

seg-c3f3422f96e4 = Maksimal deceleration (uafhængig af den ballistiske koefficient), hastighed + højde ved maksimal g og hastighed ved maksimal opvarmning for en ballistisk indtræden i en eksponentiel atmosfære. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/reentry.toml)

seg-7b4a8e25c3c9 = Adaptiv kodning og modulation efter DVB-S2 langs et LEO-nedlinkspas

seg-3912fb8ccb15 = Nedlinks Es/N0 langs hvert pas for én satellit over én station (EIRP, fririumstab, atmosfærisk tab efter cosekanslov, andre tab, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2 MODCOD, der klarer sin kvasifejlfri tærskel i ETSI EN { "302" } 307-1 V1.4.1 tabel { "13" } plus en implementeringsmargen ved hvert trin, passets ACM-datavolumen og baseline med konstant kodning, der lukker ved masken og den længste afstand. Kan køres som scenarietypen <c1/>. Illustrative inputs; MODELLED.

seg-19603a7e0fe8 = Kontaktplanlægning for jordstationer med flere satellitter og flere stationer med løsning af konflikter

seg-40edeae6e48b = Kandidatkontakter ud fra hvert satellit-station-pas med dets ACM-datavolumen; konflikter hvor én antenne ville betjene to satellitter inden for sin vendetid, eller hvor én satellit ville sende ned til to stationer samtidig; et prioritetsvægtet leveringsmål med loft ved hver satellits efterslæb; en doven grådig plan efter marginalværdi, en først-til-mølle-baseline og en eksakt branch and bound på op til { "26" } kandidater, med den grådiges optimalitetsgab rapporteret. Kan køres som scenarietypen <c1/>. Illustrative inputs; MODELLED.

seg-3742d2aea62a = Nøjsom ramme for omkostning pr. dækning / ROI

seg-4228311689f8 = Omkostning pr. procent dækning + dækning pr. euro som ROI over motoren til dimensionering af konstellationer; omkostningen pr. satellit er et bånd lav/nominel/høj leveret af kalderen (ingen opdigtede priser)

seg-8ba6ee9acc8a = Integritetspåvirkning af manglende detektion (kontekstbevidst HPL/VPL mod alarmgrænse)

seg-f5985399d0d5 = Afbilder en uopdaget spoof-/jam-bias til effektiv fejl → Stanford-område (tilgængelig/utilgængelig/MI/HMI) mod kontekstspecifik HAL/VAL (åben himmel vs. by)

seg-37d43b5b918a = CAI: databladet med citerede fejlmodelparametre ({ "13503" })

seg-0b6a901f5ad2 = Afgrænset (bedste/nominel/konservativ) ydeevne for atominterferometer med kolde atomer — biasustabilitet, hastigheds-/vinkel-random-walk, skalafaktorstabilitet, prøveudtagningsrate begrænset af interrogationen, dynamikområde for fringe-flertydighed — hver kan spores til en kilde; føder QuantumNavBudget uden at modellere hardware

seg-c93f2d3a3167 = Benchmark for tidssynkroniseringsintegritet — epokeklassifikator efter Stanford-integritetsdiagram

seg-712d5c35a6a6 = TIB-epokeklassifikation efter Stanford-integritetsdiagram (nominel / utilgængelig / MI / HMI)

seg-573aa0193cb3 = Benchmark for tidssynkroniseringsintegritet — scorer for integritetsdækning

seg-4d86f3c2d8f5 = TIB-scoring af integritetsdækning (HMI/MI/tilgængelighedsrater + dom om dækning af overgrænse)

seg-372dd0fdb025 = Benchmark for tidssynkroniseringsintegritet — fejlkatalog (parametriske generatorer)

seg-2604e7cf27d2 = TIB-fejlmenu (domænedivergens, urslam, holdover-udløb, statisk/trinvis/symmetrisk/asymmetrisk forsinkelse, genafspilning inden for friskhed, stivalg, k-af-N-kvorum)

seg-90c0eb1e7c14 = Benchmark for tidssynkroniseringsintegritet — dom om absorption af uopdagelige fejl

seg-f713acf042ff = TIB-dom om absorption af uopdagelige fejl (symmetrisk/genafspilning skal absorberes af PL og må aldrig rapporteres som opdaget)

seg-8adbbd2cdb74 = Selvbeskrivelse i rapporten om hybrid optisk/RF

seg-2a5e48b558e1 = Rapporten hybrid-optical-rf angiver den linkkonfiguration, den faktisk blev kørt med (bærebølgelængde, sende- og modtageapertur, afstand, pulsbredde, integrationstid, effektiviteter og tab, standardværdier løst) og bærer en enhedsblok, der giver enhed og proveniensklasse for hver størrelse, en artikel sandsynligvis citerer, herunder sporene af overdragelseskovariansen i kvadratmeter

seg-0691f3dee8cb = Tilgængelighed af hybrid optisk/RF-link på RF-siden

seg-72ccb655caf0 = Rapporten hybrid-optical-rf angiver en RF-linktilgængelighed, sammensat af størrelser, motoren allerede beregner, frem for af en importeret klimatologi, og angiver sammensætningen som en navngiven regel: A_rf = I_closure * I_track, hvor I_closure er lukningsdommen for det envejs CCSDS-401 / DSN-810-005-linkbudget (linkbudget::link_budget, Eb/N0-margen >= { "0" }) ved scenariets egen afstand og I_track er dommen fra sporingssløjfen (jamming::lock_status) på den C/N0, SAMME budget returnerede. Hver faktor bærer sit inputs proveniensklasse videre til outputtet, og de faktorer, der med vilje IKKE indgår i produktet — geometrisk synlighed, nægtelse ved interferens og en klimatologi for RF-udfald — er navngivet med begrundelsen i stedet for stiltiende at blive sat til { "1" }. Det løste RF-led gengives som sin egen blok rf_link_configuration, og de kontinuerte tal ved siden af indikatoren (linkmargen, C/N0-margen, de lukkede former for lukkes- og sporingsafstand og afstandsudnyttelsen) er afstandsinversionerne af det samme budget. Rapporten angiver fuldt ud, på blokken og i den enhedspost, en læser lander på, at dette tal er BEGRÆNSET AF MARGEN/GEOMETRIEN og DETERMINISTISK, mens optisk tilgængelighed er BEGRÆNSET AF VEJR/KLIMATOLOGI og sandsynlighedsbaseret, så de to aldrig kan citeres som et sammenligneligt par af procenter

seg-22c5df9b6c7c = Sammenligning af optisk og RF afstandsmåling på lige vilkår

seg-70eb396f40af = Rapporten hybrid-optical-rf udsender forholdet mellem optisk og RF afstandsmåling med den ÉNE konfiguration, begge led blev evalueret ved, båret i det samme objekt: den samme envejsvej, den samme afstand og den samme akkumulationstid. Det optiske led er motorens fotonbegrænsede ToA-CRLB på envejs fotontallet; RF-leddet er motorens DLL-early-late-termiske kodesporingsjitter ved den C/N0, som motorens eget linkbudget returnerer for den samme envejsafstand. Sløjfens støjbåndbredde er afledt, ikke valgt: B_L = 1/({ "2" }*integration_s) placerer RF-leddet ved præcis den optiske akkumulationstid, og tilsidesætter en kalder den, så de to middeltider er uens, bliver forholdet REFUSED — null, med uoverensstemmelsen og begge tider navngivet — frem for at blive citeret ved to arbejdspunkter. Der dannes intet forhold mod scenariets VALGTE parametriske rf_position_sigma_m, og afvisningen angiver hvorfor: det input bærer slet ingen konfiguration. Den frigivne optiske hovedværdi for to veje og den eksakte faktor, der bygger bro fra den til envejs-sammenligningsleddet, udsendes ved siden af forholdet, så rapporten ikke kan læses, som om den bar to uenige optiske sigmaer

seg-3f26f598e013 = Selvbeskrivelse i linkbudgetrapporten

seg-b88bf41d6d4c = Linkbudgetrapporten angiver hver absolut konstant, dens egen margen blev beregnet ud fra — den bærebølgefrekvens, fririumstabet brugte, EIRP, kvalitetsmålet, det samlede tab og Boltzmann-leddet — plus den krævede G/T, ved hvilken marginen er nul, linkkonstanten (EIRP - tab - krævet Eb/N0), som er den eneste kombination, en publiceret rate/forstærkningstabel nogensinde kan fastlægge, og, når en kalder angiver en systemstøjtemperatur, den modtageantenneforstærkning, som det kvalitetsmål medfører

seg-a7b192e27cb5 = Tabel over krydsningspunkter for månetid pr. urklasse

seg-cab605dc6ea2 = Én kørsel af månetidsbudgettet udsender en række for krydsning mellem ur og system for hver urklasse mod ét fælles systemled, så uret er den eneste variabel i sammenligningen; hver række bærer krydsningen nået på to måder — fundet ved bisektion ud fra den generelle potenslov-kurve for tidsfejl og inverteret algebraisk ud fra rækkens dominerende støjtype — med den relative forskel mellem dem

seg-18c72a7565d6 = Fodaftryk for indfangning mod højde og strålebredde

seg-9c30a0ab5233 = Tosidet sweep af det mønstervægtede, højdebegrænsede fodaftryk for overfladeindfangning over senderens højde og parabolens diameter, udsendt som én række pr. arbejdspunkt med den halveffekt-strålebredde, hver diameter medfører, og indfangning ved limben rapporteret som en TÆRSKEL — pr. række limbens J/S, dens margen og den sendeeffekt, der ville lukke den; pr. gitter de fundne krydsninger, eller en udtrykkelig angivelse af, at limben ikke nås nogen steder på gitteret, med manglen

seg-fc0a64b9a280 = Reproducerbarhed af månens tidsfejlbudget

seg-5d5970506b9c = Scenariet lunar-time-budget publicerer sine outputs i form af arrays som en tabel i langt format (gitterindeks, middeltid, led) ved siden af rapporten, så de syv kurver x(tau) for hvert led og totalen som kvadratroden af kvadratsummen er motoroutput frem for noget, en læser genopbygger ud fra metodeafsnittet

seg-675887733454 = Månens stationstidslaboratorium: holdover for miniRAFS mod LTC

seg-7dfedc40da6a = Den valgfrie blok [time_lab] i scenariet lunar-time-budget modellerer et reference-stationsur på Månen (som standard klassen miniRAFS, eller en hvilken som helst navngiven klasse, eller et enhedskort tilpasset angivne stabilitetspunkter), styret til Coordinated Lunar Time og derefter frit løbende eller gensyret hvert N sekund: tidsfejlkurven x(t) som kvadratroden af kvadratsummen af urets potenslovled, en konstant styringsrest (ILLUSTRATIV), en konstant realiseringsrest for LTC og et tilvalgt led for stationens højderate; tiden efter en styring til { "1" }, { "10" } og { "100" } ns (eller angivne tærskler) ved bisektion ved siden af den lukkede invers for den dominerende støjtype, og det dominerende led ved hver angivet horisont, alt med enheder

seg-af3ff120b707 = VLBI til geodæsi på Månen

seg-cfd7d0126028 = Nærfelts-VLBI-forsinkelse for en jordbaseline, der observerer et månefyr + partielle afledte

seg-e08e98908f3a = Jord-GNSS ved månens afstand

seg-dd8ce373d1f6 = Modtagelse af Jord-GNSS ved månens afstand: det svage signallag, som P7 tabel { "1" } navngiver, og som motoren ikke havde nogen model for. Pr. satellit og pr. epoke beregnes vinklen uden for boresigtet mod senderens nadir, om Jorden skjuler den rette vej, den skrå afstand og dens fririumstab, senderens forstærkning ved den vinkel, den modtagne effekt og bærebølge-til-støj-tætheden; derefter aggregeres kun de link, der klarer en sporingstærskel, og et fuldt omløb af konstellationen sweepes, så svaret er en FORDELING frem for ét øjebliksbillede. Tre forhold driver resultatet, og rapporten angiver hvert: Jorden spænder { "13.90" } deg set fra konstellationens radius, så strålens TOP er geometrisk utilgængelig for enhver stråle på vej mod Månen; det, der er tilbage, er hovedlobens kant og sidelobene, det regime LuGRE opererede i ved Månen i { "2025" }; og L1-vejtabet er omkring { "208" } dB, cirka { "25" } dB mere end en jordbaseret bruger betaler. MÅLT på den medleverede GPS-lignende geometri med 24 satellitter over { "64" } epoker af én omløbsperiode: tilgængelighed af SIGNAL { "0.375" } med et bedste link på { "30.93" } dB-Hz og tilgængelighed af POSITIONSBESTEMMELSE { "0.000" } — højst to samtidige sporbare link, aldrig de fire, en position kræver. Adskillelsen af de to tilgængeligheder er pointen, og rapporten nægter at lade dem blive forvekslet: Jord-GNSS ved månens afstand er et lag af TIDSSYNKRONISERINGS-kvalitet, ikke af positionskvalitet, og en prior for lagdelt robusthed skal tage tilgængeligheden af positionsbestemmelse. Konditioneringen udsendes af samme grund — hver synlig satellit ligger inden for en kegle på et par grader set fra Månen, så sigtelinjerne er næsten parallelle pr. konstruktion. Kan køres som typen <c1/> Omformuleret efter D7: påstanden ved månens afstand er den RELATIVE bærebølge-til-støj-tæthed mellem satellitter ved én epoke, ud fra målte todimensionale sendemønstre (NAVCEN Block IIR/IIR-M), plus geometrisk synlighed; absolut C/N0 påstås ikke (Parker et al. rapporterer et fælles tab på { "7" } til { "12" } dB).

seg-29df5b40a3f9 = Banebestemmelse ved Månen: Jord-GNSS mod radiometri fra jorden

seg-647902ebcee3 = Banebestemmelse i en næsten retlinet halo-bane (eller en elliptisk frossen bane) ud fra to uafhængige datatyper: Jord-GNSS-pseudoafstande modtaget om bord (linkreglen fra rækken om Jord-GNSS ved månens afstand, plus okkultation af Månen) og to-vejs afstand og afstandshastighed fra jorden fra tre Deep Space Network-stationer. Hver er en mindste kvadraters batch i ét trin omkring referencebanen med sin formelle kovarians; en seedet Monte Carlo af forskellen mellem de to estimater afprøver, om de to kovarianser forklarer den (q = d' (P_G + P_R)^-1 d, chi-i-anden med seks frihedsgrader, når modellerne stemmer), og hvad en ikke-modelleret acceleration gør ved statistikken.

seg-652bdc29deea = Opløsning af bærebølgemultiplicitet ved Månen: overflade og orbiter

seg-02496f9e9af2 = Enkeltdifferentieret Jord-GNSS bærebølgefase og kode mellem modtagere ved en månestation på overfladen og en orbiter, med urdifferensen for hver epoke profileret væk, én multiplicitet pr. sammenhængende pas og det længste pas som gauge. Kovariansen for den flydende multiplicitet er et Schur-komplement; LAMBDA opløser heltallene, den bootstrappede rate rapporteres ved siden af en seedet Monte Carlo-succesrate for heltals-mindste-kvadraters og sigmaerne for flydende og fastlåst position. Rapporteret som fundet: ved de registrerede { "12" } dBi kan dobbeltdifferensproblemet ikke dannes (ændring { "1" } flyttede standarden til { "25" } dBi, efter at kun tællinger af tilgængelighed var set), og ved { "25" } dBi opnås heltalsfastlåsning IKKE — uden for rækkevidde (nogle få procent højst), selvom den flydende løsning forbedres med buen.

seg-11dd1bb8e4e1 = Koestimering af månens referencesystem: overflade-stationer og orbitere

seg-a38c8d95e6c9 = Fisher-information for månens referencesystemdatum med syv parametre fra laserafstandsmåling fra jordstationer til de fem reflektorer alene og med afstande mellem orbiter og overflade-station lagt til: informationsmatricen, rang, Cramer-Rao-sigmaer, degenerationsmålet fra modulet for identificerbarhed i månens referencesystem og seedede tilfældige stationssæt. Banen holdes kendt i månens akser (dens fejl bæres af afstandssigmaen for orbiteren).

seg-862977c4bb01 = Præcision i rumforbindelsen mellem referencesystemer: samlokaliseret GNSS, VLBI og laserafstandsmåling

seg-a9ae8e99f00d = Cramer-Rao-præcision for forskydningerne i translation, skala og rotation mellem teknikker i referencesystemerne for GNSS, VLBI og laserafstandsmåling, når ét rumfartøj bærer alle tre, med rumfartøjets position elimineret ved hver epoke og ni lokale forbindelsesgenerende parametre med en prior, sweepet over nøjagtigheden af den lokale forbindelse. Kovarianser ad kvadratrodsvejen (normalligninger mister cifrene, når teknikkerne er næsten perfekte).

seg-ae627996875e = Følsomhed over for Love-tal og libration på Månen

seg-28780d07c4a7 = Fisher-information for h2, k2, l2 og de fysiske libration-amplituder fra laserafstandsmåling (radial og horisontal tidevandsforskydning, rotation af reflektorer), sporing af orbitere (grad-2 k2-accelerationen integreret langs sigtelinjen, trend fjernet), et gravimeter på overfladen (gravimetrisk faktor { "1" } + h2 - { "1.5" } k2) og et ur på overfladen (relativ hastighed ({ "1" } + k2 - h2) W2/c2, knyttet til månetidskonstanterne). Nominelle værdier for h2 og l2 er linearisationspunkter; undersøgelsen siger, hvad der er følsomt over for hvad, ikke hvad tallene er.

seg-da712b740519 = Forøgelse af DOP med overflade-fyr på Månen

seg-83e6341e01b1 = Fyrforøget dilution of precision for en bruger på månens overflade: rækkerne med sigtelinje til de synlige satellitter og rækkerne med afstandsmåling til de synlige overflade-fyr sættes sammen til én designmatrix og evalueres gennem den fælles DOP-kerne, og den resulterende DOP afbildes til en realiseret 1-sigma-nøjagtighed I METER gennem en brugerækvivalent afstandsfejl for hvert fyr, sammensat som kvadratroden af kvadratsummen af led for synkronisering af ur, multipath og opmåling. Fyrets synlighed er den geometriske horisont for to højder på Månen uden luft, som ikke har nogen refraktiv udvidelse og derfor er eksakt frem for tilnærmet. Kan køres som scenarietypen <c1/>, der rapporterer kun satellitter, satellitter plus fyr og en større konstellation som den konkurrerende vej til den samme geometri. MÅLT på den medleverede golden-geometri (bruger ved -80 deg, tre opmålte fyr, en illustrativ LCNS med seks satellitter ved t={ "0" }, maske { "5" } deg): { "5" } synlige satellitter giver PDOP { "9.6941" } og en 3D-1-sigma på { "11.222" } m; tilføjes de fyr, der faktisk klarer horisonten, fås PDOP { "4.1160" } og { "4.765" } m, en faktor { "2.355" }; tjenesten med 24 satellitter giver i stedet PDOP { "2.4226" } og { "2.804" } m, en faktor { "4.002" }. Rapporten udskriver antallet af SYNLIGE fyr frem for det konfigurerede, og på denne geometri klarer kun ET af de tre fyr horisonten: de to flankerende steder ligger omkring { "333" } km fra brugeren mod en horisont på { "86" } km for en antenne på { "2" } m, så en læser aldrig overlades til at antage, at alle tre bidrog

seg-845e9f5eec81 = Beskyttelsesniveau for fælles-mode og samlet integritetskonvolut

seg-e4ec41d0f5e1 = Observerbarhed af absolut stationsposition på Månen (datumdefekt)

seg-b3e4160042d2 = Fisher-information-observerbarhed af den fælles måneløsning: uden baselines til Jorden ligger det absolutte referencesystems datum i nulrummet af HᵀWH (stationens position er uobserverbar); ≥{ "3" } baselines genopretter fuldt rang og afgrænser stationens Cramér–Rao-fejl, som estimatoren opnår

seg-2ed7181c97dd = Generering af LunaNet AFS-spredekoder (LSIS V1.0)

seg-13ff6c381275 = Koderne i Augmented Forward Signal i LSIS V1.0 ({ "29" } januar { "2025" }): den primære AFS-Q-kode på 10230 chips genereret efter pilotkonstruktionen for IS-GPS-800 L1C med indeksene fra IS-GPS-800J (de samme { "210" } tildelinger, som LSIS Appendix D trykker), AFS-I-Gold-koderne på 2046 chips genereret ud fra g1 = x^{ "11" } + x^{ "2" } + { "1" } og g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } med hver PRN's G2-forsinkelse genfundet fra standardens Annex { "3" }-fil, de fire sekundære koder, de tertiære koder på 1500 chips, den foreløbige nodetildeling i Table { "11" } og den trindelte pilotkode. LSIS-indholdet læses ved kørsel fra en lokal cache, der er verificeret med SHA-256 og fyldt fra den PDF, NASA hoster, og det videredistribueres aldrig

seg-56c7aeac59c1 = LunaNet AFS-dekodbarhed i lukket sløjfe hos en uafhængig modtager (LSIS V1.0)

seg-da2d29d437b0 = En AFS-optagelse fra Kshana, som en uafhængig softwaremodtager har opfanget, sporet og dekodet, og som er sammenlignet med optagelsens egne referencemærker. Det viser kun formatkontrol mod standarden og konsistens af mærkerne; det er ikke en udtalelse om kanalfysik, udbredelse, modtaget effekt eller link-budgetter, hvis værdier i optagelsen er valgte input

seg-780369fb9a54 = Formatkontrol af GPS L1 C/A på tværs af generatorer

seg-ee47b60515f1 = GPS L1 C/A-spredekoder (sdr::CaCode) og LNAV-delramme 1-3 (gps_lnav: IS-GPS-200-feltkvantisering med specifikationens pi, to-komplement-pakning, TLM- og HOW-ord, paritet efter Table 20-XIV med D29*/D30*-inversion, de paritetsløsende bits i ord { "2" } og { "10" }) sammenlignet bit for bit med gps-sdr-sim på dens medfølgende brdc0010.22n ({ "32" } satellitter)

seg-bf429c8f00fb = GNSS IQ-erhvervelse på uafhængigt genererede I/Q-samples

seg-9a0c52bfb06e = iq::acq::acquire (FFT-parallel kodefasesøgning med kvadratlov-tærsklen efter Marcum-Q) med GpsL1Ca-replikaen, på { "20" } ms af gps-sdr-sims eget 8-bit I/Q-output dekodet af sampledekoderen iq::io (ci8, { "2.6" } MHz, { "11" } satellitter, ingen støj): hver PRN { "1" } til { "32" } søgt i to vinduer på { "10" } ms, resultatet sammenlignet med den kodefase og Doppler, gps-sdr-sim modulerede

seg-f40dc3dac990 = IQ-monitorer scoret i laboratorie-genafspilningskampagner: detektion, misses, falske alarmer og lukkede størrelser for falsk alarm

seg-93fb3109728c = iq::campaign::detect og kampagnekøreren: en valgfri tabel [monitors] kører IQ-monitorerne på hver celle i køreren enkelte gennemløb. Effekt- og spektralmonitorerne ser samplene efter hver front-end-kæde; monitorerne for C/N0, SQM og lås ser hver sporet kanals sløjfeopdateringer. Hver alarm scores mod de angivne hændelser: detekteret eller misset pr. (hændelse, alarmtype, kanal), tid til detektion og falske alarmer uden for hændelserne over deres eksponering. Hver tests lukkede størrelse for falsk alarm er angivet: effekt pr. blok (eksakt Gamma-hale), spektralt overskud pr. blok (tilnærmelse), kurtosis (ensidet gaussisk), pulse (binomialt loft), SQM pr. midlet opdatering (2Q(k) = Q(1/2, k^2/2), ny) og ARL0 for C/N0-CUSUM (Siegmund). Uden tabellen er celler, nøgler og digests uændrede. Der syntetiseres ingen interferenskurveform

seg-5b7eb7ddb474 = Detektions-ROC for IQ-monitorerne fra en scoret laboratorie-genafspilningskampagne

seg-57fe85965c9c = iq::campaign::detect (windows, roc) og iq::campaign::report::rocs: hver celle i en kampagne med monitorer beholder pr. alarmtype og kanal maksimum af monitorens egen teststatistik over hvert angivet hændelsesvindue (positiv) og over flisebelagte roc_window_s-vinduer uden for hændelserne (negativ). Statistikkerne er blokeffektens afvigelse, PSD-overskuddet, kurtosis z, SQM |z| for den midlede metrik og C/N0-CUSUM. Rapporten samler dem efter type i en empirisk ROC på vinduesniveau med dens AUC og driftspunktet ved den konfigurerede tærskel, skrevet som roc.json (kshana.campaign-roc/1) og et afsnit Detection ROC i report.html. En kampagne uden monitorer skriver ingen af dem

seg-3a3cfa322f01 = Kalibrering af den åbne modtagers C/N0- og låsmodeller til resultater fra IQ-kampagner, med angivet prædiktionsfejl

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) og <c1/> på <c2/>, Python <c3/> og MCP-værktøjet labfit (kun kampagnemapper inde i dets arbejdsmappe): læser en outputmappe fra <c4/> via dens DIGEST og grupperer de scorede celler i tilpasningsenheder (signal x sløjfeudformning x front-end-kæde x jammertype, aldrig slået sammen). Pr. enhed tilpasses målt C/N0 mod angivet J/S med den spektrale separationsform. Q_eff kan ikke identificeres ud fra C/N0-data uden en uafhængig måling af jammerens og signalets effekter, så Q angives og tilpasses aldrig (typetabellen, hændelsens q, eller for en ukendt type den mest skadelige angivne værdi, cw Q = { "1" }). Den tilpassede parameter er den identificerbare forskydning delta_eff = delta - { "10" } log10 Q, hvor korrelationsvagten rapporterer degenerationen. C/N0-intervaller med lås under { "90" } % er censurerede og opført. Tærskel-J/S angives direkte og ved den lukkede form; sporingssløjfemodellen og den empiriske låsmodel er koblet gennem C/N0-modellen med dwell-tider for tab og genlåsning. En seedet klyngebootstrap over optagelser ({ "1000" } replikater) giver percentilintervaller; prædiktionsintervaller på { "90" } % kommer fra residualtræk; leave-one-recording-out-tilbageholdte sæt deles i interpolation og ekstrapolation; en præregistreret tabel [validation] hashes, og hver tærskel bedømmes PASS/FAIL. Rapporten kshana.labfit-iq/1 som JSON, CSV og genereret Markdown, med en blok units. Kun syntetisk (ingen tredjepartsoptagelse, ingen jammerkurveform). Stien labfit for modtagerlog er uændret

seg-9537d301c95e = GPS LNAV-kodning dekodet af et uafhængigt modtagerbibliotek

seg-909415621881 = LNAV-delramme 1-3 fra Kshana (gps_lnav::encode_subframes) for de { "32" } efemerider i brdc0010.22n, ført til decode_word og decode_frame i RTKLIB: paritet for hvert ord, dekodning af delrammer med konsistent issue of data og hver dekodet parameter mod heltallet fra Kshana og mod inputværdien

seg-f66855e35c53 = Kodning af GPS LNAV-navigationsmeddelelsen

seg-8caf8366e2f8 = IS-GPS-200 LNAV-delramme 1-3 (gps_lnav::encode_subframes: kvantisering med afrunding til nærmeste af hver ur- og baneparameter ved specifikationens skalafaktorer og værdi af pi, to-komplement-pakning, TLM- og HOW-ord, paritet efter Table 20-XIV med D29*/D30*-inversion, de paritetsløsende bits i ord { "2" } og { "10" }), den meddelelse som en GPS L1 C/A-signalgenerator udsender

seg-c5c944357643 = Erhvervelse og C/N0-estimering på ægte IQ fra Månen

seg-f5dcb5e06bf4 = Parallel kodefasesøgning (acquisition::pcps_acquire: portabel FFT, koherent foldning, ikke-koherent akkumulering, chi-i-anden-tærskel for en falsk-alarm-sandsynlighed for hele søgningen), forfinelse, åben-sløjfe-prompt-korrelation med kode-Doppler og M2M4 C/N0-estimatoren, kørt på LuGRE L1 4-bit IQ-batcher læst gennem realdata::ion_sdr

seg-709626569a5c = Erhvervelse på ægte IQ fra Månen mod Doppler forudsagt ud fra baner (beslutning ud fra sampleeffekt)

seg-784ebd80c425 = acquisition::pcps_acquire med sin beslutning ud fra sampleeffekt på de ni LuGRE L1-batcher uden for overfladen med mid-rise-niveauer; Dopplerforskelle mellem erhvervede satellitter sammenlignet med forskelle forudsagt ud fra ESA's endelige baner og den af Firefly rekonstruerede Blue Ghost-bane

seg-89875d67b253 = Erhvervelse på ægte IQ fra Månen vurderet ud fra Doppler forudsagt ud fra baner

seg-956bcfeaf319 = acquisition::pcps_acquire med beslutningen ud fra celleaveraging (top over gitterets middelcelle, robust over for båndbegrænset støj) på de ni LuGRE L1-batcher uden for overfladen med mid-rise-niveauer; Dopplerforskelle mellem erhvervede satellitter sammenlignet med forskelle forudsagt ud fra ESA's endelige baner og den af Firefly rekonstruerede Blue Ghost-bane

seg-8fa779dd1788 = Erhvervelse på tilbageholdt ægte IQ fra Månen mod Doppler forudsagt ud fra baner

seg-484868771231 = acquisition::pcps_acquire (beslutning ud fra celleaveraging, falsk-alarm-sandsynlighed { "1e-7" }) med refine_doppler_coherent på LuGRE L1-batcher optaget på månens overflade (I i den høje nibble, mid-rise-niveauer); Dopplerforskelle mellem erhvervede satellitter mod forskelle forudsagt ud fra ESA's endelige baner og Firefly-kernen for landingsstedet

seg-10af60b488b9 = Differentiel referencestation af NovaMoon-klassen: ophævelse af fællesmodefejl + residual, der vokser med baselinen, + DGNSS-beskyttelsesniveauer

seg-c04a3591074c = Interoperabilitetseksport for Månen

seg-91f4a066b3c0 = Eksport af månesystem + tid + efemeride afstemt efter LunaNet/IOAG (CCSDS OEM + KIF) med formatkontrol ved rundtur

seg-8ab65cbefb75 = Scoring efter rammeværker for PNT-resiliens

seg-c48198f31d63 = Delscorer pr. dimension over Kshanas egne syv resilienskategorier (ikke DHS-termer), RethinkPNT RDRR-funktioner og Yang-kriterier, hver mærket modelleret med sin drivkraft; foreløbigt RPCF-niveau med en port for begrænset forringelse. Selvvurdering afledt af simulering, aldrig certificering.

seg-d7bdb6fe186e = Undersøgelse af beslutningsustabilitet i resiliensscoren

seg-5fcf18a68bb1 = Kvantificerer, hvordan en enkelt sammensat score / et RPCF-niveau omrangerer arkitekturer under et forsvarligt vægtsimpleks og et trusselsensemble (top-1-vendingsrate, spredning i Kendalls tau, vendingsrate for niveau, rangintervaller); analyser af erklæret kontra målt og af diversitetskollaps.

seg-1bf03544a010 = Repræsentativitet af demonstrationen og afstand til flyvning

seg-db24d16d38c9 = Ærlighedsregister pr. resultat, der kvalificerer et demonstrationsoutput: dets eksterne holdepunkter, modellerede antagelser, afstande til flyvning og repræsentativt TRL-bånd, med håndhævede invarianter (valideret kræver et eksternt holdepunkt; modelleret kræver en afstand og kan ikke hævde noget over TRL { "4" }).

seg-52ab936eb5f5 = Evidens for afvejning mellem kvante og klassisk (fælles form)

seg-a6679ed5bed7 = Ét reproducerbart TradeEvidence-objekt (fast ramme: scenarie+seed+motor; fælles værdier pr. FoM for kvante kontra klassisk med fordel i korrekt polaritet, valgfrit { "95" }%-CI, mærke valideret/modelleret), der bærer en repræsentativitetspost, så hver kvante-PNT-vertikal rapporterer afvejningen på samme ærlige måde.

seg-20fee61b3107 = Bibliotek med fejlmodeller for kvanteenheder

seg-e42eabe9bc2a = Enhedskort (optisk/fangede ioner/kviksølvion + klassiske ure genbrugt fra holdover/clock_state; koldatom-interferometer; klassiske + sammenfiltrede/enkeltfoton-tidsoverførselslinks), hvert med en repræsentativitetspost; linket med sammenfiltring tilføjer en model for tidspræcision begrænset af skudstøj (~jitter/sqrt(R*tau), straf for mørketællinger, systematisk gulv).

seg-86d71fd89f26 = Pålidelig kvantetidssynkronisering (tidsoverførsel + sikker udbredelse + anomali)

seg-d2a3d37825ef = Ende-til-ende-kæde for tidsoverførsel, kvante kontra klassisk (urets coast + linkets præcision i kvadratur), et genbrugt beskyttelsesniveau for tidssynkronisering, en FoM for sikkerhed mod forsinkelses-/genafspilningsangreb (1-P_md) og en sandsynlighed for detektion af uranomali + CUSUM-latenstid, udsendt som ærlig TradeEvidence med en repræsentativitetspost.

seg-eaf341ff4522 = GNSS-fri kvantenavigation

seg-908a44a9f7c7 = Kvante (koldatom-interferometer) kontra klassisk dødregning med navigationsklasse-INS under et GNSS-udfald: vækst i positionsfejl, holdover til en positionstærskel og afvejningen mellem kvante og klassisk som ærlig TradeEvidence; ærlig note om observerbarhed (bias er uobserverbar uden en positionsbestemmelse, så fejlen vokser).

seg-914132833f5a = Detektion af fejl/anomalier i kvante-PNT-systemer

seg-f20392820b9d = Mærket katalog over kvantefejl (urets frekvenssprang/drift/tab af lås; sensorens biastrin/udfald), en AUC for ROC af detektionsstatistikken med bootstrap-CI og en mindste detekterbar fejl ved en fast falsk-alarm-rate; en monitor med kvanteur finder mindre fejl end en klassisk, udsendt som ærlig TradeEvidence.

seg-d31be81dfd8f = Passiv geolokalisering af sender med TDOA/FDOA

seg-aa870cee16f6 = Lokalisér en sender (jammer/spoofer eller en opportunistisk kilde til reverse-PNT) ud fra tidsforskel i ankomst (time-difference-of-arrival) på tværs af et modtagernetværk — skæringen af hyperboloider τᵢ=(Rᵢ−R₀)/c løst med Gauss–Newton mindste kvadrater — og ved at tilføje frekvensforskel i ankomst (forskelle i afstandsrate) med bevægelige modtagere genfind position og hastighed i fællesskab; med Cramér–Rao-nedre grænse for positionskovariansen ud fra målegeometrien

seg-5bd3882531b6 = Konvektiv opvarmning ved indflyvning i stagnationspunktet (Sutton-Graves) på en 3-DoF-indflyvning

seg-4f97036ed72f = Konvektiv varmeflux i stagnationspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterne for luft på Jorden og atmosfæren på Mars (NASA TR R-376, { "1971" }), dens maksimum og den integrerede varmebelastning langs en 3-DoF-indflyvning, ballistisk eller løftende ved konstant krængning, på Jorden eller Mars.

seg-1b96577665fc = Radiometri, MTF, relativt kantrespons og GIQE { "4" } NIIRS for elektro-optisk billedoptager

seg-38902593e841 = Signal-til-støj-budget for en nadir-billedoptager (lambertsk scenelysstyrke, kameraligning, skud-, mørkestrøms-, udlæsnings- og kvantiseringsstøj), systemets MTF ved Nyquist som produktet af diffraktion for uafskærmet apertur, detektoraperturen, lineær udtværing og gaussisk jitter, kantresponset og det relative kantrespons integreret ud fra denne MTF, Q = lambda F / p og GIQE version { "4" } NIIRS uden MTF-kompensation. Kan køres som scenarietypen <c1/>.

seg-07ca77a67207 = Tab ved opsendelsesopstigning: tyngdekraft, luftmodstand, styring og modtryk

seg-7a1802cf2c80 = Plan opstigning i tyngdekraftsdrejning for et flertrinskøretøj over en ikke-roterende kugleformet Jord gennem US Standard Atmosphere { "1976" } (massefylde og tryk), med et pitch-kick, en trækkraft reduceret af dysens modtryk, udbrændinger af trin ved eksakte tringrænser og tabene ved tyngdekraft, luftmodstand, styring og modtryk integreret ved siden af tilstanden. Kan køres som scenarietypen <c1/>.

seg-55e8345def8b = TWSTFT-tovejsligning, usikkerhedsbudget og linkstabilitet med flicker og dagligt ikke-reciprokt led

seg-5ca5226c24ec = TWSTFT-tovejsligningen løst for T_A - T_B med stationernes sende- og modtageforsinkelser, den ionosfæriske op/ned-asymmetri i Ku-båndet, forskellen i transponderforsinkelse og Sagnac-leddene, mod dens eksakte fremadmodel; et usikkerhedsbudget i kvadratur med linkets TDEV som type A-led; en tovejsserie med hvid og flicker-fasestøj (Kasdin-Walter), et dagligt ikke-reciprokt led og en konstant residual for reciprocitet; samt raten, residual-RMS, TDEV og ADEV for leverede stationsurserier fra Circular T, MJD-CSV eller IGS RINEX. Kan køres som scenarietypen <c1/>.

seg-2f9be02c92bc = Numerik for optisk atmosfære på skråsti: Rytov-varians, scintillation, fadingsandsynlighed for gamma-gamma, aperturmiddelværdi, skyers og klar lufts optiske dybde

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integreret langs en skråsti til Rytov-variansen for plan- og kugleformet bølge (uplink og downlink), Andrews-Phillips-scintillationsindekset og gamma-gamma-parametrene, fadingsandsynligheden og fademarginen for gamma-gamma, aperturmiddelværdifaktoren ved svag turbulens, den optiske dybde af skyer for en søjle af flydende vand og den optiske dybde for klar luft efter Kim-sigtbarhed plus Rayleigh, som erstatter det samlede atmosfæriske tab i det optiske linkbudget, når en atmosfære leveres. Kan køres inde i scenarietypen <c1/>.

seg-a2faab92e760 = Vejrdrevet tilgængelighed for optisk jordstation og afstandskorreleret stationsdiversitet

seg-7f4e4e763d62 = Tilgængelighed af et optisk link mod en angivet linkmargin ud fra et lognormalt klima for flydende vand i skyer (mængde efter ITU-R P.840, ekstinktion i geometrisk optik) og det uafhængige turbulensfading for gamma-gamma, den linkmargin der behøves for målrettede tilgængeligheder og det loft, ingen margin kan løfte, lognormale varigheder af udfald, hvad-nu-hvis for forbedringsteknikker og en ét-faktor gaussisk copula-netværkstilgængelighed, hvis parkorrelation er exp(-afstand/dekorrelationslængde). Kan køres som scenarietypen <c1/>.

seg-043ece801e72 = Kontinuitet i tidssynkronisering og afstandsmåling gennem optiske udfald

seg-bb9cb3fe4180 = Fordelingen af varigheden af udfald for et optisk sted koblet til den lukkede coast-varians i holdovermodellen for ur: fejl i tidssynkronisering og afstandsmåling ved angivne kvantiler af udfald, holdover til en tærskel for tidssynkronisering, andelen af udfald og af udfaldstid inden for den og tilgængeligheden af tidssynkronisering A + U E[min(D, T_h)]/E[D], for de klassiske og kvanteurklasser. Kan køres inde i scenarietypen <c1/>.

seg-b119df65d2a7 = Optisk linkmargin over tid: én seedet realisering af vejret på et sted

seg-06125f3cae90 = En tilvalgt tabel <c1/> (duration, step, seed) får typen <c2/> til også at skrive, pr. sted, én seedet realisering af den angivne stedsmodel gennem tiden: skyepisoder (klare perioder eksponentielle, skyudfald lognormale med angivet middelværdi og spredning, andelen af tid i skyer sat til den angivne sandsynlighed for skyer), én lognormal søjle af flydende vand pr. skyepisode, ét gamma-gamma-scintillationssample pr. trin og ud fra dem linkmarginen, fadingerne fra skyer og scintillation og flaget for link oppe, med den realiserede tilgængelighed, skyandel, antal udfald og længste udfald. Uden tabellen er resultatet dokumentet fra { "0.37" }. Trækkene går gennem de portable fordelings- og matematikruter, så native og wasm32 giver de samme bytes.

seg-58cbf576c959 = Læser af TRK-2-18 Orbit Data File og model for rampet 2-vejs-Doppler ved Mars

seg-d1055650a77f = En læser af DSN Orbit Data Files (TRK-2-18): postgrupperne på 36 byte (filmærkat, identifikator, banedata, ramper pr. station, urforskydninger, sammendrag, filslut), og i hver banedatapost tidsmærket siden { "1950" }, forsinkelser i downlink og uplink, observabel, stationer, datatype, bånd, gyldighed, kanal, rumfartøj, referencefrekvensen på 46 bit og kompressionstiden; start- og sluttider, rater og startfrekvenser for ramper. Ovenpå den en model for rampet 2-vejs X-bånd-Doppler (integrerede uplink-ramper, rundturs-lystid med Shapiro og troposfære, DSN-stationer gennem IAU 2006/2000A CIO-kæden og IERS EOP, stationstid) og en batch-banebestemmelse for Mars-orbiter (GMM-3-felt, tredjelegemer, SRP, drag).

seg-455dc946c965 = Multiplikativt EKF til attitudeestimering ud fra et gyro og en stjernesensor

seg-553d043438b4 = Det multiplikative EKF af Lefferts-Markley-Shuster: attitudefejl i legemssystemet og gyrobiastilstande, propagering med gyroraten minus biasestimatet og Farrenkopfs diskrete processtøj (vinkel- og rateflugt), opdateringer fra stjernesensoren med residualen { "2" } vec(q^-1 q_st) i Joseph-form og den multiplikative nulstilling; en diskret Farrenkopf-simulator for gyro og stjernesensor. Typen <c1/> kan lukke styresløjfen på sit estimat.

seg-a971ff07592a = Arbejdscyklus for apertur: navigation kontra kommunikation

seg-5b0ba97379bf = Én kørsel tager en kontaktplan (en liste af vinduer aos_s/los_s, hvert med anmodning til aperturen om navigation eller kommunikation — det samme vindues-vokabular som <c1/> udsender, konverteret af <c2/>), et antal aperturer og en eksplicit arbitreringspolitik, og returnerer navigationsarbejdscyklussen, kommunikationsarbejdscyklussen, den ledige arbejdscyklus og udfaldet pr. session. Politikken er et input med en dokumenteret standard (<c3/>; også <c4/> og ikke-præemptiv <c5/>), og rapporten bærer den løste politik, dens fulde definition og definitionerne af arbejdscyklus og udfald, fordi et arbejdscyklustal oplyst uden sin arbitreringsregel ikke kan gengives. Planen er et eksakt intervalsweep over vinduesgrænserne, så et vindue, der slutter præcis, hvor det næste begynder, aldrig konkurrerer, og aperturesekunder for navigation, kommunikation og tomgang akkumuleres uafhængigt i det ene sweep. Kan køres som scenarietypen <c6/>

seg-43cd7aa7ab53 = RF-jamming af navigation på månens overflade (J/S pr. satellit)

seg-e0566f37ad8f = Måne-native forhold mellem jammer og signal, effektiv C/N₀ og tab af lås for en selenografisk bruger på overfladen under en jammer på månens overflade (eller hævet), over den illustrative konstellation af Moonlight/LCNS-klassen fra offentlige kilder. Sammensætter den åbne jammingkæde (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) med den åbne geometri for månehimlen (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri udledes igen. I modsætning til typen <c1/> for Jorden er signalleddet ikke en fast modtaget effekt: hver satellits isotrope modtagne effekt er dens eget linkbudget EIRP − FSPL(skråafstand), så J/S varierer fra satellit til satellit med afstand og elevation på Månen. Udsender ÉN RÆKKE PR. SYNLIGT LINK (epoke, satellit) som JSON og som artefakt *.table.csv, med begge modtagne effekter, hvis forskel J/S er, trykt ved siden af; aggregerede kvalitetsmål står ved siden af tabellen, aldrig i stedet for den. Kan køres som scenarietypen <c2/>

seg-4c116e25c5c5 = Kontur for denial på Månen med et usikkerhedsbånd ud fra den målte spredning i C/N₀

seg-77828c25f3ab = Rapporten <c1/> hviler ikke længere sin denial-kontur på én skalar. Den udsender den fulde målte fordeling af C/N₀ for det ønskede signal over tabellen pr. satellit — n, min, p05, p25, median, p75, p95, max, middelværdi, stikprøvens standardafvigelse og stikprøvens egen asymmetri (p95 − median) − (median − p05) — ved siden af rækkerne pr. link, som er uændrede. Konturen rapporteres derefter ved hver af disse ordensstatistikker under BEGGE denial-kriterier, motoren kender, aldrig det ene i stedet for det andet: det hidtidige kriterium for effektforhold (J/S = { "30" } dB, den samme tærskel som attack_surface og tracking_loop bruger, og kriteriet bag kolonnen <c2/> i den udgivne tabel for månelinks med jamming), og kriteriet tab af lås (den effektive C/N₀ falder til tracking_threshold_dbhz), som er det kriterium, rapportens egen kolonne links[].status scores med. Hvert konturpunkt angives på begge akser af denial-planet — den jammer-EIRP der kræves ved scenariets afstand, og den denial-afstand der opnås ved scenariets EIRP — så båndet er et interval på de samme akser, som et konturplot tegnes på. Båndets kanter ER contour(p05) og contour(p95): den samme afbildning i lukket form anvendt på stikprøvens egne kvantiler, ikke et sigma tilpasset til stikprøven og ikke median ± k·stdev, og rapporten siger det i en streng band_definition ved siden af tallene. stdev udsendes af hensyn til kontinuitet og bruges af intet. En kvantil, hvis C/N₀ allerede er ved eller under sporingstærsklen, har ingen endelig afvisende J/S; de kolonner udsendes som null med en optalt årsag frem for som en uendelighed eller en afskåret radius

seg-2d3944107ba0 = Detektionsstyrke for integritetsmonitor på tværs af modaliteter

seg-38bc7c0bfe57 = Rapporten hybrid-optical-rf angiver, hvad chi-i-anden-monitoren på tværs af modaliteter faktisk kan DETEKTERE, ikke blot at den består et fejlfrit tilfælde: den mindste detekterbare bias pr. overvåget akse (øst, nord, op, ur) ved scenariets angivne sandsynligheder for falsk alarm og misset detektion, kurven for detektionsstyrke på begge sider af den, det støjfri biasmultiplum hvor den realiserede statistik første gang krydser tærsklen, og tiden til detektion for en biasrampe ved en angivet rate. Fejl indsprøjtes også gennem den rigtige monitor, og den statistik den returnerer rapporteres ved siden af den analytiske forudsigelse

seg-38cabd4921c1 = Ny vækst i kovarians efter overdragelse mod alarmgrænsen

seg-9287268bbada = Rapporten hybrid-optical-rf viser filterets model for processtøj og angiver, hvor længe løsningen efter overdragelsen bliver inden for alarmgrænsen: for begge overdragelsesretninger bærer den kovariansen pr. akse, som overdragelsen efterlod, propagerer den frem under et angivet processtøj af typen random walk og rapporterer det tidspunkt, hvor den dækningsskalerede 1σ når alarmgrænserne for horisontal, vertikal og tidssynkronisering, hvilken grænse der binder først, tidskonstanten for fordobling af variansen og en samplet coast-profil, der omslutter krydsningen. PSD'er for processtøj, dækningsfaktoren og alarmgrænserne er alle input med dokumenterede standarder

seg-a3b8272862aa = Mønster for antenne uden for boresight i månegeometrieksporten

seg-27d246503a48 = Eksporten af geometri pr. satellit bærer pr. (epoke, satellit) vinklen uden for boresight VED SATELLITTEN og sendeforstærkningen mod stedet fra det rigtige mønster (Airy) for en cirkulær apertur med ensartet belysning, og rapporterer antallet i strålen under det mønster VED SIDEN AF antallet i strålen under den symmetriske tilnærmelse fra forstærkning til strålebredde (θ_3dB[deg] = √(31000/G_lin)), med forskellen udsendt som en eksplicit korrektion i links, i satellitter pr. epoke og som den værste enkelte epoke. Begge implicitte aperturvirkningsgrader i tilnærmelsen udsendes ({ "0.641" } mod reglen { "70" }·λ/D grader, som den citeres med, { "0.920" } mod en ensartet cirkulær apertur), så den virkningsgrad, den stiltiende antager, angives frem for at blive udledt. Slået fra som standard: blokken optræder kun, når både et eksportsted og en apertur er givet

seg-6fbfa234ef3e = Tab af lås i sporingssløjfe og spoof pull-in under interferens

seg-f78c1f28a3f7 = Tab af lås beregnet ud fra sløjfedynamik i stedet for et effektforhold: termisk 1σ-jitter i bærebølge (Costas) og kode (ikke-koherent early/late) mod C/N₀ med kvadreringstabet, mod de angivne regler 3σ_PLL + θ_e ≤ { "45" }° og 3σ_DLL + rampeforsinkelse ≤ d/2 chips; C/N₀-tærskler for tab og genlåsning med den bindende sløjfe nævnt ved navn og hysteresen AFLEDT af den bredere pull-in-båndbredde frem for påstået; den erklærede tid til tab af lås fra en lásdetektor med to tærskler og bekræftelses-dwell, rapporteret særskilt fra den fysiske tid til faseudbrud (Viterbis middeltid mellem cycle slips, i log₁₀ s, fordi den spænder over hundreder af dekader); den største kodeslew og bærebølge-Dopplerrate, som offerets sløjfer kan følge; og den DENIAL-RADIUS, som sløjfedynamikken medfører, rapporteret ved siden af den eksisterende radius for effektforhold med deres fortegnsbehæftede forskel som et eget navngivet felt. Kan køres som scenarietypen <c1/>

seg-0f4d023fe2d4 = Kovarians af koordinater for et punkt på månens overflade ud fra en VLBI-forsinkelsesplan, holdt adskilt fra den for jordstationen

seg-47352405133b = Et tredje datumvalg, <c1/>, der holder hver jordstation fast og estimerer KUN beaconens måne-faste koordinater — den konfiguration, som usikkerheden for et punkt på månens overflade faktisk angives for, da jordstationernes koordinater er et input til forsinkelsesmodellen og ikke en ukendt i den. Det findes, fordi kovariansen på stationsniveau og kovariansen for overfladepunktet er FORSKELLIGE STØRRELSER adskilt af løftearmen ρ/B, og intet hidtil forhindrede, at den ene blev angivet mod den anden. Den udsendte blok <c2/> bærer ρ, den længste baseline, løftearmen, overfladepunktets form af ligefordelingslinket c·σ_τ·(ρ/B)·√(g/N), det beregnede sigma pr. koordinat for beaconen og deres forhold — forholdet er null frem for vildledende, når beaconen ikke estimeres, eller matricen er rangdefekt. B tages som den LÆNGSTE baseline til stede, den mest gunstige, så forholdet kun kan undervurdere. Kan køres som <c3/> med <c4/>, som afvises med en meddelelse, der nævner det manglende input, når beaconen ikke estimeres

seg-0315968c8214 = Differentiel PNT på Månen — residualbudget for korrektionslinket

seg-c6785166a44c = De tre led, som en differentiel korrektion samler op mellem den epoke, den beregnes ved, og den epoke, den bruges ved, hver tidligere efterladt som ikke-modelleret rum: opmålingsfejl for referencestationen (korreleret på tværs af satellitter, uafhængig af baseline, ~{ "1" }:{ "1" } positionsoverførsel og bevisligt ikke forstærket af DOP), ældning af korrektionen (den frosne baneefejlvektor genprojiceret på den sigtelinje, som motorens egen propagator lægger satellitten på én latenstid senere, plus c·σ_y(τ)·τ urdrift fra den kalibrerede potenslov) og ensartet kvantisering af linket over en eksakt fuld skala ±(orbit_err + clock_err) med varians step²/12. Rapporteret i både afstands- og positionsdomænet, ved siden af — aldrig i stedet for — den eksisterende residual og det eksisterende beskyttelsesniveau, med en latenskurve ved siden af det enkelte tal

seg-c42646ae4707 = Dækning og nøjagtighedskort for referencestation på Månen

seg-1f9834b32629 = Monte Carlo-sweep af modellen for differentiel PNT på Månen over et brugergitter ved sydpolen og et døgn af epoker (typen <c1/>): for en differentiel referencestation på et kendt sted ved sydpolen, pr. punkt og over regionen, percentilerne af korrigeret og ukorrigeret positionsfejl (3-D, horisontal, vertikal), tilgængelighed med en årsag til hver utilgængelig epoke (user_lt4, station_missing_sat), dækning mod en tærskel angivet før kørslen, DO-229E-beskyttelsesniveauer, dækningsradius pr. azimutsektor og linkbudgettet for korrektionen ved stationen og ved det værste punkt. Ikke en udtalelse om ydeevnen af noget rigtigt system; ikke tilknyttet eller støttet af nogen myndighed

seg-7ecf4b0038b0 = Terrænhorisontmasker på Månen ud fra en angiven profil eller en DEM for polen

seg-7102948907bc = Azimutafhængige horisontmasker pr. sted for typen lunar-station-coverage (referencestationen og hvert brugerpunkt) og gitteret moonlight-service-volume og dets eksportsted pr. satellit (hver eksportrække får clears_terrain), i tabelformatet skyline fra { "0.36" } (skyline::Skyline, lineær i azimut med omløb ved { "360" } grader; en angiven profil og en DEM-horisont ved ét sted kombineres som deres punktvise maksimum): en angiven [terrain] station_horizon eller user_horizon mærket med sin kilde, og/eller en horisont ray-marched over en sydpolar stereografisk DEM (layoutet for LRO LOLA's gridded polar, læst fra en deskriptor, der fastlægger dens størrelse og SHA-256, eller en breddegrads-/længdegradsflise realdata::lola_dem med [terrain] dem_tile_path, gengivet med dens SHA-256) langs storcirkler på månekuglen med eksakt krumning, fra en angiven masthøjde, ved et angivet azimuttrin og en angiven rækkevidde. En satellit tæller ved et sted, når den klarer den flade mask_deg og horisonten ved sin azimut (lunar_service::topocentric); en epoke, som horisonten efterlader med færre end fire satellitter i et punkt, hvor den flade maske giver fire, tælles som den utilgængelige årsag terrain_masked. Den medfølgende DEM er et udsnit af det offentligt tilgængelige produkt LOLA LDEM_75S_240M, middelværdiresamplet i blokke på { "5" } x { "5" } til { "1200" } m (data/lunar-dem/NOTICE.md). Hvis den mangler, beholder hvert sted den flade maske, og hvert dokument er byte-identisk

seg-d37bb01e270b = Multipath og modtagerhardware-led for referencestation på Månen

seg-1103199f019b = Den valgfrie sektion [receiver] i lunar-station-coverage (LRS-02): elevationsafhængigt multipath-sigma sigma(el) = a + b exp(-el / el0) hos brugeren og ved stationen (den funktionelle form for luftbåren fra RTCA DO-229, med a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grader som standarder; på Månen er hver værdi ILLUSTRATIVE), hvid hos brugeren og første ordens Gauss-Markov over epoker ved stationen (rho = exp(-dt / tau)); termisk kodestøj i early-minus-late-DLL sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); bias mellem kanaler pr. kanal, konstant over et forsøg, hos brugeren og ved stationen. Stationsled går ind i dens korrektioner, brugerled i de rå og korrigerede målinger, hver på sin egen seedede strøm. Hvis den mangler, er hvert dokument uændret

seg-03796cb741b6 = Vækst i efemeridefejl for referencestation på Månen over korrektionens latenstid

seg-13b0ae9a874a = Det valgfrie input orbit_err_growth_m_per_s i lunar-station-coverage (LRS-03): en korrektion anvendt latency_s efter, at den blev beregnet, går glip af væksten g latency_s i den udsendte baneefejl, g isotrop med 3-D RMS-rate, trukket pr. satellit og forsøg på sin egen seedede strøm (afstandens 1-sigma-rate tau / sqrt({ "3" })), oven i genprojektionen af den frosne fejl på sigtelinjen. Hvis det mangler, er hvert dokument uændret. Et K5-tillæg til sammenligningen med offentliggjorte påstande, præregistreret alene, kører K5 ved { "0.001" }, { "0.01" } og { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Løsningstilstande for lunar referencestation: højdebegrænsning, tre satellitter, vindue med statisk bruger

seg-366c7ad03fb2 = Den valgfri sektion [solution] i lunar-station-coverage (LRS-06): en højde-pseudomåling række op . dx = e_h med angivet 1-sigma, vægtet mod afstandsrækkerne, et minimum på tre satellitter, der kun er tilladt sammen med den, og en vægtet mindste kvadraters løsning over de seneste window_epochs epoker med en fælles statisk position og ét ur pr. epoke (et filters svar for en statisk position uden processtøj over de samme data; epokernes fejl behandles som uafhængige). Er sektionen fraværende, er snapshot-løsningen og alle dokumenter uændrede. Et tillæg til sammenligningen med de publicerede påstande, der bruger kildernes løsningsstil og er præregistreret alene

seg-611ba369ed00 = Nøjagtighed og dækning for en lunar referencestation sammenholdt med publicerede påstande

seg-4fe4f1cffa2b = Scenarietypen lunar-station-coverage kørt under de offentlige antagelser i det publicerede materiale om en lunar differentiel referencestation (fire navigationssatellitter i frosne elliptiske baner på { "24" } timer, { "10" } m { "95" } % SISE, { "0.30" } m kodestøj, { "1" } s og { "600" } s korrektionslatenstid, en stationsopmåling under en decimeter, den publicerede eksempelplacering for stationen og de sydpolære cirkler på { "300" } km og { "600" } km) og bedømt mod kildernes numeriske påstande under seks ensidige tærskler, der blev fastsat på forhånd før kørslen: dækning af hele sydpolen ved p95 under en meter (K1, K2), korrigeret p95 under en meter og på decimeterniveau (K3, K4), under en meter bevaret ved { "600" } s latenstid (K5) og nøjagtighed bevaret fra { "10" } km til { "500" } km baseline (K6)

seg-7bfcb5c6a985 = ARAIM med samtidige fejlhypoteser for flere satellitter

seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2-reglen for bestemmelse af delmængder (P_THRES, FC_THRES, overvågede delmængder med færrest fjernede først) generaliseret fra par til samtidige kombinationer af op til max_order satellit- og konstellationshændelser med det eksakte prior P_no fault prod q_e; add_v42_protection_levels_to_order kører ADD v4.2-vejen for beskyttelsesniveauer på den (orden { "2" } er den eksisterende vej præcist). raim::araim_subset_raim (opt-in): avanceret RAIM over denne hypotesemængde, hver overvåget delmængde som én tilstand (p_fault, T, b, sigma) i integritetsrisikosummen, uobserverbare delmængder flyttet til den uovervågede risiko, budgettet skaleret med ADD-fordelingen af den uovervågede risiko, og delmængden med den største normaliserede separation rapporteres, når en fejl detekteres. Priors, der kræver dybere delmængder end max_order, afvises og afkortes aldrig

seg-48ca01332f8f = RAIM ved siden af kvalitetsmålene for urets holdover

seg-890f1006a75d = Den valgfri sektion [integrity] i kindet clock (clock_integrity::run): ud fra et angivet sted og konstellationsforudindstillinger (geometry::sky_geometry), ved hver integritetsepoke så længe GNSS-tidslinjen ikke er nægtet, snapshot-RAIM (raim::snapshot_raim: paritets-chi-i-anden-test, beskyttelsesniveauer ud fra hældning) på satellitterne over masken med seedede gaussiske residualer af den angivne sigma og en valgfri angivet bias; en separat blok integrity_fom med verdicts, beskyttelsesniveauer og tilgængelighed pr. epoke. Nægtede epoker rapporteres som utilgængelige og ekstrapoleres aldrig; holdover-kvalitetsmålene er uændrede, og uden sektionen er outputtet byte-identisk

seg-9cbb4ee7588a = Rumlig, støjfyldt observerbarhed af buelængde for flere cislunare familier

seg-5ebd771deef8 = Tærsklen for observerbarhed af cislunar buelængde i den RUMLIGE CR3BP med seks tilstande i stedet for den plane med fire, på tværs af familierne DRO, L2-halo og L2-næsten-retlinet halo, hvor målestøj indgår i Gramianen, og TO kriterier rapporteres, fordi der ikke findes ét ærligt: det publicerede rangkriterium, som beviseligt er invariant over for en homoskedastisk målesigma (afvægtning ganger observerbarhedsmatrixen med en skalar og lader det relative singulærværdispektrum og dermed rang, defekt og konditionstal uændrede), og et estimerbarhedskriterium — den første bue, hvor den formelle 1σ-positionsusikkerhed for chief'ens begyndelsestilstand falder under en angivet grænse — som er det, der flytter sig med støjen. Hver tærskel bærer det epokegitterinterval, den ligger i; et kriterium, der ikke nås, er null med en begrundelse. Plan tilstand er fortsat standard, og familier uden for planet afvises dér i stedet for at blive fladtrykt til en tilstand, der ikke kan repræsentere dem

seg-e250321394bc = Fejl i forudsigelse af jordorientering i operationel stil, målt forudsagt mod endelig

seg-0e443d241460 = En mindste kvadraters tilpasning af bias plus rate over et bagudgående vindue plus de vigtigste periodiske led — årlig, halvårlig og de to vigtigste zonale tidevand for UT1; Chandler, årlig og halvårlig for polen — ekstrapoleret med det sidste residual i vinduet ført frem: den klasse, IERS Bulletin A bruger, i stedet for den persistensforudsigelse, den publicerede horisont hvilede på. Bedømt på den eneste ærlige måde: en prognose for T+h bygget af hurtige Bulletin A-rækker ved eller før T, målt mod den SENERE publicerede endelige Bulletin B ved T+h, med persistens bedømt over det identiske epokesæt mod de identiske endelige værdier ved siden af. En målepoke uden publiceret endelig værdi udelades i stedet for at blive genbedømt mod den hurtige kolonne; et periodisk led, som vinduet ikke kan begrænse, rapporteres som afvist med de cyklusser, det faktisk spænder over; et ufuldstændigt vindue afvises i stedet for stiltiende at blive forkortet

seg-f4efd94dd746 = Lunart datum for referencesystem ud fra en observationskampagne

seg-a6972eb89d7d = Det syvparametriske Helmert-datum udledt af en SIMULERET OBSERVATIONSKAMPAGNE i stedet for at blive genfundet fra en indsprøjtet transformation. Jordstationer observerer et kildebelagt katalog over beacons på månens overflade efter en eksplicit plan; de lunare VLBI-forsinkelsespartielle akkumuleres til en Fisher-informationsmatrix for beaconkoordinater og føres gennem Helmert-designet A = [I₃ | [p]ₓ | p] til H = AᵀM_bA, så den rapporterede datumnøjagtighed er en funktion af observationsprogrammet — nøjagtigt lineær i forsinkelsens sigma og monoton i buen gennem den libration, rapporten MÅLER. Datumdefekten er emnet og ikke en fodnote: rang, defekt, konditionstal, spektrum, uobserverbare retninger i syvparameterbasen, den svageste retning selv ved fuld rang og hver parameters andel af den udsendes ved hver kørsel, og enhver parameter, som kampagnen ikke begrænser, publiceres som NULL med en status. Korrelation mellem beaconfejl er MÅLT og ikke antaget — nøjagtigt nul med stationerne holdt fast, og trykt med sin pris, når de estimeres. Kan køres som scenarietypen <c1/>

seg-ca481f2d8f9e = Bekræftelse af tærsklen for cislunar buelængde med en uafhængig estimator

seg-3d5fbf896209 = En batch-estimator med mindste kvadrater, der GENFINDER chief'ens begyndelsestilstand ud fra simulerede målinger mellem satellitter over voksende præfikser af det samme epokegitter, som tabellen over rang mod bue bruger, med målepartielle taget som centrale finite differences af den sammensatte fremadmodel. Den bruger intet af det maskineri, tærsklen blev målt med — ingen analytisk jacobianrække, ingen variationel tilstandsovergangsmatrix, ingen singulærværdi- eller egenværdidekomposition, ingen ranktolerance, intet kvadratrods-informationsfilter — og deler kun dynamikken, begyndelsesbetingelserne, den skalare observabel og epokegitteret, hver nævnt i det udsendte dokument. To kriterier, begge sweepet: genfinding uden støj (rangens analog) og Monte Carlo-estimerbarhed (estimerbarhedens analog, målt mod en kendt sandhed og ikke forudsagt ud fra en kovarians). Kan køres som scenarietypen <c1/>

seg-f839285852d9 = Lunart servicevolumen ud fra reel, hentet konstellationsgeometri

seg-c3059fcced49 = Accepterer en tabuleret Måne-centreret tilstandsefemeride (evalueringen af en SPK/BSP-kerne) eller en publiceret konstellationsdefinition bag <c1/>, kører den identiske sweep af dækning / DOP / beskyttelsesniveau mod den og udsender det σ_URE-afstandskrav, den medfører, VED SIDEN AF de uændrede illustrative Kepler-resultater og de perturberede resultater, med forskellen som sin egen navngivne størrelse. Hvert tal bærer en proveniensklasse, der skelner kerneafledt fra afledt af publicerede elementer og fra modelleret, så de aldrig kan forveksles i et efterfølgende citat

seg-36a6cfaf5afa = Enhed og proveniens angivet for hver rapporteret størrelse

seg-12460501e82b = Et maskinlæsbart skema, der angiver enhed, proveniensklasse og definition for hvert numerisk felt i hver scenarierapport, plus én enkelt global port, der kører hver registreret scenarietype og fejler, hvis et udsendt numerisk felt mangler en af dem. Proveniensvokabularet er lukket, og hver klasse bærer et evidensniveau, med to klasser bevidst afbildet på <c1/> og <c2/> i stedet for at få et niveau, som klassen ikke bestemmer

seg-c815cb90dcde = Lunar referencestationsgeodæsi: tilføjet retroreflektor og VLBI-beacon mod datum med fem arrays

seg-103cf21173ac = Valgfri input extra_reflectors og extra_beacons på scenariet lunar-llr-datum tilføjer en blok station_geodesy: Helmert-informationen for de fem arrays fra det arkiverede udsnit af lunar laserafstandsmåling plus den information, som en tilføjet retroreflektor (målt i afstand ved de arkiverede normalpunktsepoker, hvor målestationen er over sin horisont, hver med det normalpunkts arkiverede vægt) og en tilføjet VLBI-beacon (observeret af netværket og planen i lunar-frame-campaign med jordstationerne faste, gennem forsinkelsespartielle fra lunar-vlbi-fim) på angivne steder lægger på det syvparametriske datum, løst igen, med hver Helmert-parameters 1-sigma før og efter, deres forhold, normerne før og efter og de yderste egenværdier af Fisher-forskellen. Er de fraværende eller tomme, er rapporten uændret

seg-44f582b17fa9 = Gate-integritet — et grønt, der betyder, hvad det siger

seg-43fbcfbe990c = Tre strukturelle vagter over selve verifikationsprocessen, der hver lukker en klasse af defekter, som nåede den kanoniske gate som en intermitterende eller falsk rød. ({ "1" }) Hver konstrueret midlertidig sti i Rust-kilderne skal bære en komponent, der er unik pr. kald; et proces-id afvises, fordi cargo kører bibliotekstestene som parallelle tråde i ÉN proces, og pid'en deles af dem alle. ({ "2" }) Hver byte-for-byte- eller hash-fastlåsning skal ved siden af sig selv eller i sin modulheader erklære, hvad den dækker, og hvad den bevidst udelader — så en tværgående ændring kan se med et blik, hvilke fastlåsninger der er omfattet, og hvilke der stiltiende er blevet ændringsdetektorer for hele repositoryet. ({ "3" }) Et grønt kan kun gøres gældende fra den FULDE suite: scripts/gate.sh kører <c1/>, fanger den sande exitkode uden pipe i vejen og skriver en kvittering, der navngiver committen, antallet af integrationsbinærer, antallet af tests og varigheden; pre-push-kontrollen afviser et push, hvis commit ingen gyldig kvittering navngiver, på et rent træ. Gentagelighed stikprøves separat af scripts/check-repeatability.sh, som kører biblioteks-suiten N gange og fejler, hvis mængden af beståede tests er forskellig.

seg-b7cd952ff133 = Sammensat tidssynkroniserings-PL — P0-seedet holdover-gennemkørsel

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); nedad halvkontinuert PL({ "0" }+)≥PL({ "0" }−); K(IR/2) løbende maksimum; τ/τ³/τ⁵ faseeksponenter

seg-096b6cdfe2dc = Sammensat tidssynkroniserings-PL — LIL a.s.-envelope (umulighed + konsistens)

seg-1671add2210d = Ingen endelig worst-case holdover (Brownsk sup divergerer); IR-fordelt HPL i overensstemmelse med Hartman-Wintner-envelopen, når IR→{ "0" }

seg-5a27c9f0a67d = Overbound for integritet af traceability-bias for heterogene UTC(k)

seg-fd09ab2adbf6 = Overbound for bias pr. kilde b = (U/k_cov)·Phi^-1(1-tail/2) + ældning, der oppuster en publiceret udvidet Type B-usikkerhed til en fordelt integritetshale; forbinder til tpl_scalar som bias_s

seg-d75b900ad25f = Korreleret krydskovarians for traceability-bias (fordeling, der er usikker ved fælles tilstand)

seg-0641f6d38c23 = N×N-krydskovarians for bias med rho·b_i·b_j uden for diagonalen for kilder, der deler en UTC(k)-realiserer; BEVIST correlated_fused_bias >= independent_fused_bias (naiv uafhængig fordeling underbegrænser den fusionerede bias -> optimistisk -> usikker)

seg-1a3bb032960f = Konsistensstatistik for fælles tilstand (fejl i delt reference, som separation er blind over for)

seg-1b03f522b8fc = Scorestatistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 for et fælles skift, som løsningsseparation (kontraster ortogonale på { "1" }) ikke kan se; et fælles skift oppuster den, mens parvise separationer forbliver flade

seg-3359eee713a5 = Klassifikation af nulrum for lunart datum (LLR-rangadditivitet + libration løfter defekt)

seg-6d722c176052 = Klassifikation af problemet med datum ved intern afstandsmåling: en enkelt afstandsobservation bidrager med rang { "1" } (nulrum med 6 dimensioner); parret oprindelses-X og skala er næsten nul, og fysisk DE440-libration løfter defekten til nul, mens parret forbliver næsten degenereret

seg-3fd19007ea67 = Multiteknik-information om lunart datum (LLR + lunar VLBI + orbiterafstand)

seg-23d0dd7d0666 = Datum-jacobianrækker for LLR-afstand Jord-reflektor, differentiel VLBI-forsinkelse mellem to lunare stationer og afstand orbiter-til-beacon over datum med 7 parametre, kombineret til én konsistent forkonditioneret Fisher; viser, at tracking uden for radialen (orbiter / dybdediversificeret) bryder degenerationen mellem oprindelses-X og skala, hvor transversal VLBI kun hjælper indirekte

seg-ab96cfc8d48c = Geometrisk substrat for lunart LLR-datum (hovedaksereflektorer, jordstationer, analytiske afstandspartielle)

seg-40e91288f81a = De fem retroreflektorarrays på forsiden i PA-legemssystemets meter og LLR-jordstationerne i geodætiske koordinater; reflektorens placering fra legeme til inertial gennem DE440 PA-orienteringen; analytiske partielle af afstanden Jord-til-reflektor med hensyn til datum med 4 parametre; og den Fisher-matrix, der kun bygger på LLR, som udviser degenerationen mellem lunocenter-X og skala, der motiverer analysen med 7 parametre

seg-63a8571f8eb0 = Degeneration mellem afstand og urets offset ved envejs lunar afstandsmåling og designloven om geometrisk diversitet

seg-cdd70f56051a = Degenerationen mellem radial afstand og modtagerurets offset pr. knude er præcis { "1" } m til { "3.336" } ns (en over c). Schur-komplement-marginalen { "{" }skala, offset{ "}" } (coupled_marginal_fisher) viser, at tovejs afstandsmåling i et geometrisk diversificeret netværk løfter marginalen med omtrent den samme faktor som et lige så stort antal ekstra envejsdata, mens løftet ved tovejs i det idealiserede regime med én knude er størrelsesordener større. Den designlov, der følger: geometrisk diversitet og ikke tovejs afstandsmåling som sådan er det, der adskiller lunar referencesystemets skala fra tidsskalaens offset ved envejs afstandsmåling; en tovejs eller ekstern tidsforbindelse er kun nødvendig i regimet med lav diversitet eller én bruger.

seg-2c074d6260ba = Repræsentativt multiteknik-målemenu og den additive kombinationsregel for Fisher

seg-beefac5c1b13 = MeasurementBlock rummer én kandidatmålekampagne som et Fisher-informationsbidrag på 7x7 plus en skalar relativ pris; block_from_rows bygger én ud fra rå datum-jacobianrækker, så hver blok forkonditioneres identisk gennem lunar_identifiability::assemble_multi_info; combine summerer informationen for en valgt delmængde, hvilket er den rigtige regel, fordi Fisher-information er additiv på tværs af uafhængige målinger; representative_lunar_menu leverer en deterministisk menu med fire blokke (LLR, en transversal VLBI-limb-beacon, en orbiter på forsiden og en orbiter på bagsiden). Den budgetbegrænsede designoptimerer, der bruger denne menu, er ikke en del af dette crate.

seg-2d3347bcb15e = Tolerance for konsistens mellem leverandører for en bruger med blandede leverandører

seg-9decf2cb6b0c = consistency_tolerance: inverterer et positionsbudget for brugeren til et krav om overensstemmelse pr. parameter mellem leverandørers Helmert (oprindelse/skala/rotation) ved en referencearm, eventuelt oppustet af CRLB for realiseringen hos én leverandør (P1)

seg-5450d921dfc9 = Fejlbudget for lunar interoperabilitet mellem flere leverandører og designlov for referencesystem mod efemeride

seg-e1e30f5c17a6 = interop_budget: opdeling i reducerbar (fælles referencekobling) og irreducibel (dynamik) under konventionerne PerProvider / CommonFrameTie / CommonEphemeris, med designlovsmetrikken for den irreducible andel (~{ "0.69" } på rigtige DE440/INPOP/EPM: et fælles referencesystemmærke alene efterlader det dominerende gulv)

seg-ebb827739614 = Byzantinsk grænse for blok-spark ved detektion/identifikation på det autonome lunare netværk pr. knude (T3)

seg-4fb935e6193d = byzantine_bound instantierer kodnings-/sparse-observerbarhedsgrænsen for sikker tilstandsestimation på geometrien i netværket pr. knude: en byzantinsk peer injicerer en vilkårlig lineær kombination af de målinger, den deltager i, og netværket DETEKTERER enhver koalition på ≤ f = block_spark − { "1" } peers og IDENTIFICERER entydigt enhver koalition på ≤ ⌊(block_spark − { "1" })/2⌋, hvor block_spark er den mindste peer-koalition, hvis stablede effektive signaturer P⊥·B_T er kolonnerangdefekte. Peer-detekterbarhed er FULD KOLONNERANG for P⊥·B_j (en blok, der ikke er nul, men er rangdefekt, er et angreb forskelligt fra nul, der lander i range(G) og efterlader intet residual), ikke blot P⊥·B_j ≠ { "0" }

seg-4f57f586cf82 = Gulv for tidsligt gauge ved autonom holdover for den selvrefererende lunare konstellation (T4)

seg-eb690e8f5c9b = holdover_floor fastslår, at i et ensemble af autonome knuder, der kun er forbundet af målinger mellem knuder, er den fælles urrate (δα_j += { "1" } ∀j) en fri parameter i ensembletiden, der ligger i N(GᵀWG): ingen mængde yderligere afstandsmåling mellem knuder kan observere den (rate_in_gauge = true, temporal_gauge_dim = { "2" } med den fælles offset). Det er det ægte holdover-gulv — det tidslige modstykke til positionsgaugen for det stive system. Tilføjelse af én ekstern absolut ratekobling (et direkte link til en reference uden for netværket) driver den fælles rate ud af nulrummet (rate_in_gauge = false, temporal_gauge_dim = { "1" }) og beviser, at gulvet er en reel gauge og ikke et artefakt i oscillatormodellen

seg-25ffd6e1979c = Fælles/differentiel opdeling pr. leverandør, forening af én rangdefekt og slope for beskyttelsesgab (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Tre facetter af den enkelte dekomposition ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) med det 8-dimensionelle gauge datum⊕tidsskala som N(G) og de state_dim − { "8" } = { "32" } observerbare retninger som range(G): (T5) provider_mismatch_split klassificerer en fælles bias hos flere leverandører (∈ range(G)) som IKKE-DETEKTERBAR — der kræver en ekstern kobling — og en differentiel bias (∉ range(G)) som selvovervåget / DETEKTERBAR; (§{ "0" }) foreningen er, at det SAMME blinde underrum range(G) styrer klassen af ikke-detekterbare fejl, så datumgaugen N(G) og det fejlblinde underrum range(G) er én geometri og ikke to; (g7) slope returnerer Browns slope for beskyttelsesgab ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ for en fejl b ∈ range(G) (estimator ødelagt med nul paritet) og endelig for en detekterbar fejl

seg-632add2dbd3c = ITU-T-masker for synkronisering i telekommunikation med PASS/FAIL og margin

seg-47687529aee7 = Transskriberede grænser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A holdover (herunder tidsfejlenvelopen i Table { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-klasserne A-D og G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referencepunkt C, hvert interval åbent eller lukket, som tabellen angiver det, med hver post 'for further study' udeladt; en verdict og en margin ved det bindende punkt for hver kontrol og tiden til at overskride hvert budget. Kan køres som scenarietypen <c1/>

seg-165ed2bc771a = ITU-T-masker for wander-generering ved frekvenssynkronisering (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Syv MTIE- og TDEV-masker for wander-generering ved konstant temperatur til typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) Types I, II og III, G.8262 (10/2024) EEC Options { "1" } og { "2" } og G.8262.1 (11/2025) eEEC (låst tilstand), herunder de potenslovsstykker, tabellerne skriver (<c2/> og lignende), hvert interval åbent eller lukket, som det er trykt, målt gennem det filter på { "10" } Hz, som klausulerne angiver (taget som anvendt før sampling); referencescenariet scenarios/telecom-synce-eec.toml stiller en frit løbende OCXO op mod de tre EEC-masker. Ikke implementeret: tillæg for variabel temperatur, holdover, transienter, jitter og frekvensnøjagtigheden i G.811

seg-5fc2ad88faf0 = Urlogformater (RINEX clock, TimeLab ASCII, TAPR TICC) læst til en normaliseret faseserie

seg-5b5bcbdea166 = clock_log::read_input: ét parserlag, der omdanner en RINEX-urfil (AS/AR-poster for ét navngivet ur, versionerne { "2" } og { "3.00" } til { "3.04" }), en fase- eller frekvenslog i TimeLab-stil ASCII eller en TAPR TICC-log med tidsstempler eller intervaller til et ensartet fasegitter, med tau0 angivet, fra en header eller som medianafstanden, hvert hul, aflæsning uden for gitteret og dublet talt, og en politik for huller med refuse, longest-run eller linear; koblet opt-in ind i serien for telecom-timing (<c1/>, der tilføjer en blok <c2/>) og scenarietypen clock (<c3/>, der tilføjer en blok <c4/> med ADEV, TDEV og MTIE, tabellens SHA-256 og fasens SHA-256; runs = { "1" }). Uden tabellen er begge typer byte-identiske

seg-acdb0337bce7 = Urlogformater linuxptp (ptp4l, phc2sys, ts2phc) og chrony (tracking, statistics) læst til en normaliseret faseserie

seg-e87b3dba2072 = clock_log::read_input med formaterne ptp4l, phc2sys, ts2phc, chrony-tracking og chrony-statistics: den loggede offset fra en servolinje i linuxptp (ns, linjens egen tidsstempel i klammer, aflæsninger før servoen første gang rapporterer s2 udeladt og talt) eller fra en chrony-tracking- eller statistics-log (s, efter kolonneposition, UTC-dato og -tid) bliver til et ensartet fasegitter gennem de samme politikker for huller som de andre formater; en kildevælger (<c1/>) navngiver én af flere grænseflader, ure eller adresser; logs føder serien for telecom-timing, typen clock og typen holdover-test

seg-97aebb84576e = Holdover-test bedømt ud fra en tidsfejlregistrering leveret af operatøren

seg-ab533cf99c56 = Typen <c1/>: en tidsfejlregistrering (en urlog fra linuxptp, chrony, TICC, TimeLab eller RINEX, eller par time_s,time_error_ns) deles ved de to tidspunkter, operatøren angiver for fjernelse og genoprettelse af GNSS, i et baseline-, et holdover- og et genoprettelsestrin; baseline måles mod de ITU-T-masker, der er skrevet til et låst ur, og holdover mod dem, der er skrevet til holdover eller et autonomt ur, ePRTC-A-holdover-envelopen og tidsfejlbudgetterne; holdover rapporterer den frekvensoffset med mindste kvadrater, som systemet holdt, og genoprettelsen, om og hvornår |TE| kom inden for et angivet bånd og blev der i en angivet opholdstid, med toppen og det største trin. Hver grænse er den, som typen telecom-timing transskriberer; de to tidspunkter er operatørens udsagn og er ikke verificeret

seg-94cbac97a1aa = Tilgængelighed af GNSS-signaler i Space Service Volume og videre, sammenholdt med ICG SSV-hæftet

seg-c59e349fdc9e = Tilgængelighedssweeps for typen <c1/>: pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og kombineret, andelen af par (bruger, epoke) med mindst ét og mindst fire signaler og det længste udfald, for en bruger på en kugle (hæftets globale skal med 2,562 punkter, { "14" } dage ved { "1" } minut) eller på en bane (GEO, HEO, lunar transfer), ud fra Kepler-banerne i hæftets annex C, en konstant mindste udstrålet effekt inden for referencevinklen uden for boresight, jordens afskærmning ved kuglen plus { "50" } km og en C/N0-tærskel; brugerantenner fra hæftets table B10

seg-d2f04991c8a4 = Effekter af limb-stråle på ionosfære, plasmasfære og atmosfære for strejfende GNSS-signaler og designet af modtageren til svage signaler, i typen <c1/>

seg-1a1786ba90b6 = En Chapman-ionosfære, en plasmasfære af Gallagher-typen og en neutral atmosfære (brydningsbøjning, iltabsorption, defokusering) integreret langs den rette stråle mellem sender og bruger: skrå total elektronindhold, dets plasmasfæriske del, ekstra forsinkelse, tangenthøjde og tabet på strejfende links; og et modtagerdesign til svage signaler (kohærent og ikke-kohærent integration, databitgrænse, støtte, Doppler-søgning), der fastsætter C/N0-tærsklen ud fra modellerne for akkvisition og tracking-løkke

seg-6b8f9f3ca2a3 = GNSS-navigationsfilter om bord for rumfartøjer i høj bane og lunar transfer

seg-39ddc494f103 = Tilstanden <c2/> i typen <c1/>: et udvidet Kalman-filter med ni tilstande (position, hastighed, modtagerurets bias og drift, en skala for solstrålingstryk) på pseudoafstande, hvis tilgængelighed, støj og C/N0 kommer fra den samme linkgeometri som sweepene; sandheden integreres med J2, tredjelegemer Solen og Månen og strålingstryk med skygge, filteret modellerer J2 og tredjelegemerne og estimerer strålingstrykket; rapporterer positions- og hastighedsfejl inden for og over GNSS-banerne, det længste målingshul og den gennemsnitlige NEES

seg-5fc242476828 = Relativ navigation for en formation af flere rumfartøjer i en stærkt elliptisk bane ud fra GNSS

seg-f67eb29d4483 = Tilstanden <c2/> i typen <c1/>: en chief og deputies kører hver det absolutte filter; deputy'ens position i forhold til chief estimeres ved at trække de absolutte estimater fra hinanden og ved et relativt filter på enkeltdifferencerede pseudoafstande for de signaler, begge fartøjer sporer, med den relative dynamik som forskellen mellem to ikke-lineære baner

seg-7038f6902820 = Fejlled i koldatom-interferometer: Raman-laserfasestøj, bias fra bølgefrontens krumning og opløsning af fringe-flertydighed

seg-4d9690207607 = inertial::cai_error_terms (biblioteksfunktioner, endnu ikke tilgængelige fra en scenarietype): vægtningsfunktionen for Raman-fasen i et interferometer med tre firkantpulser (Cheinet et al. { "2008" }, Eq. { "8" }) med den lukkede form for hvid fase (pi/2)^{ "2" } S_phi0/tau_R og en numerisk vej for ethvert spektrum; den laserfrekvensstøj, som forsinkelsen ved retroreflektion ikke ophæver (Le Gouet et al. { "2007" }, Eqs. { "9" } til { "11" }); den rene defokus-bias sigma_v^2/R for en termisk sky og dens reduktion ved en detektionsradius; sandsynligheden for forkert fringe-indeks erfc(pi/(sqrt({ "2" }) s)) for en klassisk accelerometerstøtte og for to afhøringstider, og dens inverse

seg-363705e03bac = Forudindstillinger for oscillator-holdover fra offentlige datablade

seg-9750d9e0ec7a = Fire forudindstillinger — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cæsium (Microchip 5071A højtydende rør) og CSAC (Microchip SA.45s) — hver med sit datablads maksima for Allan-deviation, ældning og temperaturgrænse; en ikke-negativ mindste kvadraters tilpasning af frekvensstøj med hvid + flicker + random walk, skaleret til at indhylle hvert datablads punkt, et flickergulv aldrig under tallet for det længste τ, lineær ældning og et sinusformet temperaturled, syntetiseret som en seedet holdover efter et tab af GNSS

seg-d7e03158b972 = Sekunder, til et frit løbende ur forlader en tidsindekseret slots guard, og den hyppighed af positionsbestemmelser, der holder det inden for

seg-0b4d8815f756 = Typen <c1/>: den forudsagte fejl E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverteret for bruddet, den resterende tid, resynkroniseringsintervallet netto efter latens for positionsbestemmelsen og antal positionsbestemmelser pr. døgn, hvert led specificeret med det dominerende angivet; ure fra de seks standardværdier i ClockClass (TCXO, OCXO og RAFS tilføjet, hver med henvisning til ét datablad), forudindstillingerne for telecom-timing, et inline datablad eller en målt registrering; et brud ud over kildens længste middelingstid markeret som ekstrapoleret

seg-2797643153dc = Beskyttelsesniveau for tidssynkronisering for en modtager i kredsløb under GNSS-spoofing

seg-cb412a2ffadf = orbital_timing::orbital_timing, tilgængelig som spoofing-afsnittet i <c1/>-typen: hastighed og omløbstid i cirkulær bane, den længste tid, en spoofer på jorden kan nå satellitten pr. passage, gulvet for den urunderstøttede monitor og CUSUM-detektionsforsinkelsen, det betingede beskyttelsesniveau (gulvet plus udrulning over forsinkelsen), den afvigelse, en spoofer med en angivet maksimal rampehastighed opbygger, før satellitten forlader sit dækningsområde, eller en uafhængig kontrol kører, og om hver kontrol via jordkontakt eller krydslink er uafhængig af én spoofer på jorden

seg-f134975d4ffa = Vandfaldsdiagram af L-bånd-spektret med J/S pr. bånd og effektiv C/N0 under en scriptet jammer-tidslinje

seg-86ad8f89a822 = <c1/>-typen: et gitter af frekvens over tid for L-båndets effektspektraltæthed (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalerne ved deres minimale modtagne effekter fra interfacespecifikationen samt jammere af typen kontinuert bølge, smalbånd, chirp og matchet støj med til- og frakoblingstider), hver celle middelberegnet over sin bin og række (chirps nøjagtigt over hele og delvise sweeps, jammere efter driftscyklus), effektiv C/N0 pr. bånd = [1/(C/N0) + sum (J/S) kappa]^-1 pr. række, J/S pr. bånd, J/S i båndet og et SVG-vandfald med C/N0-søjler. Rapporten indeholder en krydskontrol mod kæden i <c2/>-typen på de samme linkinput

seg-6e0b9687e8ee = Uranus og Neptun fra Standish Tabel { "1" }, Pluto og planeternes hastigheder

seg-df3bf502dfe9 = Positioner for Uranus og Neptun fra Standish Tabel { "1" } (standarden inden for { "1800" } e.Kr. til { "2050" } e.Kr.), Pluto fra rækken i Tabel { "1" } fra { "1992" }, som den nuværende JPL-side ikke længere anfører, og den heliocentriske hastighed for hver planet: den todelegemes afledte med den middelbevægelse, elementerne implicerer, plus ellipsens drejning ved perihel-, inklinations- og knuderaterne

seg-a50be56f605a = Positioner for Månen og syv store måner (Phobos, Deimos, de galileiske måner, Titan)

seg-2cfbe5a1eece = Den geocentriske Måne fra Montenbruck & Gill-rækken (hvis led på -1.3972 grader pr. århundrede allerede henfører den til J2000-jævndøgnet), og planetocentriske positioner og hastigheder for Phobos, Deimos, Io, Europa, Ganymedes og Callisto fra JPL Solar System Dynamics' middelelementer i hver måne Laplace-plan med middellængdens rate taget fra IAU's synkrone rotationsrate (tabellen angiver perioden med for få cifre til at fastholde fasen), og for Titan fra IAU's rotationsmodel (månen på minus legemsfaste x-akse ved middelafstanden), fordi Titans trykte række for Laplace-planen ikke gengiver Horizons, heller ikke ved sin egen epoke

seg-8b8c8e28ece9 = Fysiske konstanter for hvert legeme i solsystemet og rapporten for hele systemet

seg-d225a30de35c = Body får Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan (gravitationsparameter, referenceradius, J2 hvor den er offentliggjort med den radius, den henføres til, IAU-pol og nulmeridian), et navneopslag og en BodyFacts-post (NAIF-kode, klasse, forælder, ækvatorial radius og middelradius); <c1/>-typen rapporterer dem for alle atten legemer sammen med positionerne, lystiderne og et banespor over én omdrejning, hvert legeme mærket VALIDATED eller MODELLED

seg-87ab655f8270 = Positionsbestemmelse omkring et vilkårligt legeme i solsystemet med en lokal konstellation og et dybderumslink fra Jorden

seg-d9b1b0ac97d3 = <c1/>-typen: en orbiter eller en lander på overfladen omkring et legeme valgt ved navn navigerer med envejs-pseudoafstande fra en Walker-navigationskonstellation omkring legemet (todelegemesbaner med legemets sekulære J2-drift, et ukendt brugerur) og en valgfri urfri totvejsafstand fra Jorden, med Jordens retning og afstand fra den analytiske efemeride ved hver epoke; sigtelinjer blokeret af legemets sfære og en elevationsmaske på overfladen; pr. epoke GDOP og PDOP for konstellationen alene (orbit::dop), den formelle positionsusikkerhed med og uden Jord-rækken og seedede Gauss-Newton-positionsbestemmelser (batch_ls::gauss_newton) for hver af de to tilfælde, med lystiden og rundturen fra legeme til Jorden

seg-7d4d7200cbca = Dækning og dilution-of-precision-kort for vilkårlige multikonstellationsudformninger i stor skala, omkring et vilkårligt centrallegeme

seg-b78b79e9fae4 = <c1/>-typen ud over de to fastlåste tilfælde: eksplicitte udformninger og udformninger med flere skaller, flere konstellationer pr. kørsel med ét modtagerur pr. konstellation, Jorden, Månen og Mars ud fra legemekonstanterne, BeiDou-forudindstillingen (fase i mellemhøj bane og krydsning ved { "118" } grader Ø for skråtstillet geosynkron bane modelleret), satellitter i sigte, GDOP, PDOP, HDOP, VDOP og tilgængelighed pr. celle, nedsamplede jordspor og et synlighedsforfilter efter sub-satellit-breddegrad, der kører en udformning med { "5" } 000 satellitter på et gitter på { "10" } grader på en brøkdel af et sekund

seg-278c77438493 = En kædet mission på tværs af scenarietyper på én fælles tidslinje

seg-3dcfb26f6234 = <c1/>-typens faser: hver fase kører ét eller flere scenarier af eksisterende typer gennem run_toml, læser deres output ind i navngivne kanaler (urfejl og grænse, middel af effektivt forhold mellem bærebølge og støjtæthed og sporingsgulv, lodret beskyttelsesniveau og alarmgrænse, positionsfejl, satellitter under sporing, alarmflag) med forudindstillinger pr. type eller eksplicitte resultatstier, placerer dem ved fasens start og holder dem på et fælles gitter, med fasegrænser og hændelser; tilstand føres videre ved carry (en kanal fortsætter fra forrige fases slutværdi), handoff (en forrige fases nummer skrevet ind i det næste scenarie) og end_at (en fase slutter på et tidspunkt, en kørsel har beregnet, for eksempel en spoofing-monitors detektionstidspunkt); en kampagne-hash og en digest over hvert medlems resultat

seg-ad6105af464c = Parametersweeps og seedede Monte Carlo-ensembler over en vilkårlig scenarietype

seg-95921611839e = <c1/>-typens sweep (én til tre punktopdelte nøgler af en vilkårlig type, på det generiske sweeps akseværdier, eventuelt med et ensemble i hver knude) og monte_carlo-sektioner: realisation k kører ved base_seed + k; hver metrik rapporterer middelværdi, standardafvigelse, nærmeste-rang-percentilerne 5./50./95. og et percentil-bootstrap-konfidensinterval på { "95" } % med fast seed for middelværdien (inertial::metric_stat); metrikenheder læses fra den sweepede typens egen units-blok

seg-24327a0ed82e = Flere scenarier under fælles betingelser, med en samlet oversigt

seg-5833fb3b06e3 = <c1/>-typens compose-sektion: navngivne fælles værdier (for eksempel én jammers effekt og position) skrevet ind i hvert medlem ved de nøgler, hvortil det binder dem, hvert medlem køres, og pr. metrik den mindste, største og gennemsnitlige værdi på tværs af medlemmerne med angivelse af medlemmet; metrikenheder skal stemme overens på tværs af medlemmer

seg-0bc866720bde = Afgrænset optimering af én metrik over kampagneparametre

seg-f9bdb89c2b4f = <c1/>-typens optimize-sektion (CAP-32): én til tre punktopdelte scenarienøgler afgrænset til [lo, hi] på en lin- eller log-skala, én metrik læst ved resultatsti, mål minimize, maximize eller target; metode grid (sweepets akseværdier) eller en deterministisk Nelder-Mead-simpleks i normaliserede koordinater med boksprojektion og standardkoefficienterne; en manglende eller ikke-endelig metrik får den dårligste score og bliver i sporet; med runs > { "1" } er metrikken middelværdien over fælles seeds; hver evaluering er en rigtig kørsel af den navngivne type, opført i trace og talt med i reproducerbarhedsdigesten

seg-652e28dfa10f = Signaldesign til positionering, navigation og tidssynkronisering i lav jordbane: kodesporing, erhvervelse, GNSS-kompatibilitet og en båndafvejning for ethvert system

seg-c0ba5c7e708e = <c1/>-typen: parametriserede signaldesign (bånd, sendebåndbredde, ITU-allokering; erhvervelses-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flade spektre, effektandele, FDMA-underbærebølger, kodelængder og datarater) fra indkompilerede offentlige forudindstillingsfiler (Xona Pulsar, Iridium STL, Starlink-signal af opportunitet, CentiSpace, et generisk C-bånd-design og generiske UHF/L/S/C/bredt-C-design, hver med sin kilde-URL og uoffentliggjorte værdier mærket REPRESENTATIVE) eller skrevet direkte i scenariet; pr. signal den båndbegrænsede effektspektraltæthed, effektandele i båndet, Gabor-båndbredde, kodejitter mod C/N0 og afstand samt rangingnøjagtigheden, erhvervelsessøgerummet, kvadratlov-detektionssandsynligheden og den gennemsnitlige serielle og kodeparallelle erhvervelsestid, den spektrale separationskoefficient ind i og ud af GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og AltBOC med C/N0-forringelsen samt CW-, bredbånds- og matchet J/S-tolerance fra spectrum-typens SSC-kæde; en båndafvejning mellem ionosfæreforsinkelse, frirumstab, rangingnøjagtighed ved lige C/N0 og lige EIRP samt jammertolerance; og kvalitative formkontroller af et design mod en beskrevet måling

seg-c2b9c8e4a364 = Flerbånds-spektrumvandfald (UHF, L, S, C) med designede signaler og jammere pr. bånd

seg-609df4e0a085 = <c1/>-typen udvidet ud over L-båndet: bånd angivet som et forudindstillet signaldesign (tegnet med hver komponent, båndbegrænset til sendebåndbredden, C/N0 og J/S henført til den sporede komponent) eller som en brugerdefineret bærebølge og modulation; ekstra vandfaldspaneler over et vilkårligt frekvensområde på samme tidslinje og farveskala; en bredbåndsjammer (barrage) ved siden af CW, smalbånd, chirp og matchet støj; J/S og effektiv C/N0 pr. bånd fra den uændrede kæde for spektral separationskoefficient

seg-d9eb3e7e69c2 = En LEO-PNT-passage og dens linkbudget pr. bånd mod de MEO-GNSS-satellitter, der er i sigte

seg-d986e44443dd =<c1/>-typen: satellitter fra en designet passage, elementer, en TLE gennem SGP4 eller en Walker-konstellation fra constellation-design; pr. bånd og epoke sigtevinklerne, afstand, afstandsrate og afstandsacceleration i lukket form (kontrolleret ved hver kørsel mod centrale differenser og rapporteret), frirumstab, EIRP med et isoflux-, gaussisk eller fladt diagram, en patch-, halvkugleformet eller isotrop brugerantenne, gasdæmpning efter ITU-R P.676-10 Annex { "2" }, P.618-regn og -scintillation, P.2109 bygningsindtrængningstab, polarisationsfejltilpasning, systemstøjtemperatur, C/N0, Doppler og Doppler-rate samt førsteordensforsinkelsen fra en Klobuchar- eller lodret-TEC-skrå TEC skaleret med Chapman-andelen under satellitten; ionosfærefri par med kodestøj ved passagens top; Galileo- eller GPS-bærebølger fra deres modtagne effekter i interfacedokumenterne gennem den samme modtager

seg-95a077a980b6 = Navngivne LEO-PNT-systemforudindstillinger med angivne kilder og en systemuafhængig motor

seg-4b47033cda24 = leo_link::presets: generisk flerbånd (UHF, L, S, C), generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal af opportunitet med kun Doppler, CentiSpace og en valgfri Celeste IOD-forudindstilling, hver med sin kilde mærket PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP, hvor workshop-kilden ligger i den valgfri Celeste IOD-forudindstillingsfil og kun indkompileres, hvis den fil findes; hvert bånd og hver bane kan overstyres i et scenarie, og et scenarie kan undlade at nævne nogen forudindstilling

seg-a39f34973373 = Lavenergipositionering: tid til første positionsbestemmelse og energi pr. positionsbestemmelse mod driftscyklus

seg-f3b9b669a76f = leo_link::energy og <c1/>-typens [iot]-sektion: kohærent integration begrænset af Doppler-raten, kvadratlovs ikke-kohærente summer op til en detektionstærskel, en Doppler-binsøgning over banens envelope for statiske brugere (kold) eller et støttet vindue (varm), parallel eller seriel kodesøgning, navigationsmeddelelsens tid ved koldstart, energi pr. positionsbestemmelse og batterilevetid over intervaller mellem positionsbestemmelser, for hvert LEO-bånd og GNSS-signalet

seg-8121e7db3db3 = Opdatering af LEO-navigationsmeddelelsen midt i en passage med en kontinuitetskontrol ved skiftet

seg-34c310d85c42 = <c1/>-analysen midpass-update: den højeste passage over en bruger inden for et søgespænd, meddelelser på en global tidsplan med brugsperioder centreret i deres tilpasningsvinduer, og ved hvert skift 3D-positionssprånget, urspringet, brugerens pseudoafstandssprång, det største spring over en synlig sigtelinje (lukket form over nadirkeglen), afstandsfejlen før og efter samt PASS/FAIL mod en tærskel

seg-7635a8339e78 = Dokumenteret binær kodning af LEO-navigationsmeddelelsen med et kvantiseringsfejlbudget

seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshanas egen ramme (præambel, version, model, længde, nyttelast, CRC-24Q) for de fire efemeridemodeller, urpolynomiet, SVID, issue of data, bånd, sundhed, et Klobuchar-sæt, NeQuick-G-koefficienter og UTC-parametre, hvert felt med en angivet bredde og skridt (field_table), kvantisering med afvisning uden for området og et budget for den største positions- og urændring, en halv-skridt-ændring af hvert felt giver over gyldighedsvinduet

seg-17ca41d7fd71 = RINEX-4-lignende og CSV-eksport af LEO-navigationsmeddelelser

seg-185e12ccef0d = leo_navmsg::text: en RINEX-4-lignende blok (> EPH-posthoved, satellit- og epokelinje med tre urled, D19.12-linjer for udsendt bane) med systembogstavet L og posttyperne KP16, KRAC, LU22 og APOL, i hvert hoved mærket som en Kshana-udvidelse, der ikke er en del af RINEX { "4.02" }, og en CSV-tabel med et standardkolonneskema og forudindstillede skemaer, hver med en importer

seg-e79047fc95af = ATOMIC-ECEF-polynomiet uden ur og den syntetiske modelsammenligning af LEO for fem højder

seg-e261843e35b1 = EcefPoly-varianten af leo_navmsg::elements::EphemerisModel: et ECEF-polynomium pr. akse uden urled, det relativistiske led ud fra -2 r.v/c^{ "2" }, bedømt mod et styret ur. Desuden modelsammenligningsanalysen (liu_comparison over LIU2025_TABLE), som tilpasser modellen med 22 parametre ved artiklens fem højder over buer på 20 minutter af en bane integreret af Kshana og udskriver resultatet ved siden af den offentliggjorte SISRE

seg-d2e18c8bdc14 = Positionsbestemmelse ud fra LEO-Doppler, med én eller flere satellitter og tilstande for urdrift og hastighed

seg-de6cb3c06490 = Batch Gauss-Newton-positionsbestemmelse ud fra afstandsrate med analytiske partielle afledte (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant brugerhastighed som valgmulighed, en højdepseudomåling for en bruger på overfladen, dæmpede skridt; den formelle kovarians ved referencen; projektioner langs, på tværs og lodret; nøjagtigheden for én passage mod brugerens afstand på tværs; tidspunktet for nærmeste passage. <c1/>-typens doppler-tilstand tilføjer fejlen mod vinduets længde og en tilstand med kun Doppler for signaler af opportunitet (forudindstillingen starlink-sop)

seg-7f462969d2d4 = Fælles positionsbestemmelse med pseudoafstande fra GNSS og LEO med intersystembiaser og fejlmodeller pr. signal

seg-b9b5298e3408 = Vægtede Gauss-Newton-positionsbestemmelser med mindste kvadrater over en vilkårlig blanding af systemer, ét modtagerur pr. system (intersystembiasen estimeret sammen med positionen) eller en kendt udsendt forskydning på referencetidsskalaen; sigmaer pr. måling leveret af kalderen, som standard motorens termiske delay-lock-loop-støj (navsignal::dll_code_jitter_chips) ved C/N0 for elevationen kombineret med signal-in-space-afstandsfejlen; uvægtet DOP (GDOP, PDOP, HDOP, VDOP, TDOP) i det lokale geodætiske system, formelle øst-nord-op-sigmaer og biassigmaerne; den fælles <c1/>-tilstand sammenligner positionsbestemmelser med kun GNSS, kun LEO og fusionerede og sweeper DOP mod antallet af tilføjede LEO-satellitter

seg-ee9a4a0cb530 = Konvergens for præcis punktpositionsbestemmelse (PPP) med kun GNSS og med LEO-forstærkning

seg-a54f36c27d90 = Et float-PPP-udvidet Kalman-filter på ionosfærefri kode og fase: statiske koordinater, et hvidt modtagerur, én intersystembias pr. ekstra system, en randomwalk-zenitvåd forsinkelse afbildet med 1/sin(elevation), en float-multiplicitet pr. satellitbue tilføjet ved opgang og droppet ved nedgang, og den præcise bane- og urfejl, der er fælles for en satellits kode og fase, behandlet som én korreleret opdatering med to rækker i en Joseph-stabiliseret form; målinger simuleret ud fra den samme model; konvergenstid (fejl under tærsklerne indtil kørslens slutning), fejlkurver og den kørselsgennemsnitlige positions-NEES for kun GNSS og hvert LEO-tilfælde, kørt som <c1/>-typen

seg-9306f1c06081 = LEO-understøttet tidsoverførsel til UTC mod C/N0 og modtagerens oscillator

seg-c618feb01476 = Urmålinger fra hver LEO-satellit i sigte ved en kendt position, kombineret ved invers varians ud fra pseudoafstandsstøjmodellen, filtreret af et Kalman-filter med to tilstande (fase, frekvens), hvis processtøj er oscillatorklassens hvide og randomwalk-frekvensstøj (slot_timing::ClockNoise, clock_state::ClockClass; udrulningsvariansen fra holdover::coast_phase_variance), et seedet referenceur ud fra de samme niveauer og IS-GPS-200-udtrykket i afsnit { "20.3.3.5.2.4" } for systemtid til UTC med en usikkerhed i den udsendte forskydning lagt til som en bias pr. kørsel; <c1/>-tilstanden timing sweeper oscillatorer og C/N0-forskydninger

seg-d92777401093 = Navngivne LEO-PNT-systemer som valgfri datapreset, hver med sin kilde

seg-5130bfe2410c = Systemuafhængige input: hvert system er Walker-skaller, eksplicitte elementer eller en GNSS-forudindstilling, et signal (bærebølge, chiprate, båndbredde, modtaget effekt eller C/N0-område), en SISRE, en Doppler-sigma og en urmodel; forudindstillinger udfylder kun det, et scenarie udelader, én fil hver med kilder mærket PUBLIC (med en URL), WORKSHOP eller DERIVED og de uoffentliggjorte værdier opført som repræsentative: Xona Pulsar X1/X5, Iridium STL, Starlink-signaler af opportunitet, CentiSpace, et repræsentativt C-bånd-system, ATOMIC-efemeridemodellen uden ur og én forudindstilling afledt af en workshop i den valgfri Celeste IOD-forudindstillingsfil, som holdes tilbage ved at slette den fil og dens scenarier

seg-dec52b5b9cd6 = Ét LEO-PNT-system fra ende til anden: signaldesign, linkbudget for en passage, navigationsmeddelelse og fusioneret positionsbestemmelse, hvert trins output givet videre til det næste

seg-39443b31d418 = <c1/>-typen: et leo-signal-design (offentlig forudindstilling eller direkte) fastsætter centrum, båndbredde, chiprate og EIRP-fordeling for et leo-pass-bånd; passagen giver C/N0 for den sporede komponent og den båndbegrænsede kodejitter pr. epoke; en C/N0-linje efter mindste kvadrater i sin(elevation), leo-navmsg-meddelelsens SISRE (tilpasset ved passagesatellittens bane plus et angivet banebestemmelsesled i kvadratisk sum) og designets bærebølge og chiprate går til hvert LEO-system i en leo-pvt-fælles positionsbestemmelse og eventuelt til LEO-tilfældene i leo-ppp; hver overdragelse rapporteres med sin værdi og enhed

seg-55ca63edff02 = Detektion af spoofing ud fra LEO-Doppler og konsistens i passagegeometrien

seg-b12fc1728220 = <c1/>-typens <c2/>-sektion: en spoofer forfalsker, selvkonsistent i afstand og afstandsrate, de signaler, der ses ved en påstået position, som springer og/eller skubbes væk fra den sande efter et indsættelsestidspunkt (pr. LEO-bånd og for MEO-GNSS-signalet); modtageren forudsiger hver afstandsrate ud fra den udsendte bane og en uafhængig forhåndsposition og -hastighed og tester de målte afstandsrater med en generaliseret chi-kvadrat-statistik efter mindste kvadrater over et vindue af epoker (urdrift en generende parameter eller med en prior), på GNSS-kanalerne, LEO-kanalerne og alle kanaler, med termisk støj i frekvenslåsesløjfen ud fra C/N0 (Kaplan & Hegarty { "2006" }, afsnit { "5.6.2" }); detektionssandsynlighed fra den ikke-centrale chi-kvadrat-lov ved en angivet falskalarmsandsynlighed, detektion erklæret ved en angivet sandsynlighed for mistet detektion

seg-5f341f85ac07 = Detektion af spoofing ud fra konsistens mellem bånd i et LEO-signal med flere bånd

seg-2f9c4d351b0f = For hver LEO-satellit og hvert par af rangingbånd danner <c1/>-sektionen den geometrifri pseudoafstandskombination, fjerner modtagerens ionosfæremodel og tester dens skridt fra epoke til epoke mod de to båndes kodestøj og en angivet tolereret umodelleret ionosfæreændringsrate (tosidet gaussisk, nøjagtig detektionssandsynlighed); en spoofer, der forfalsker nogle bånd og ikke andre, eller alle bånd uden ionosfæren, ses ved sit indsættelsestidspunkt; en, der forfalsker alle bånd og simulerer ionosfæren, ses ikke, hvilket resultatet angiver

seg-97dbcd5f2728 = Ionosfæresondering: skrå TEC ud fra den tobåndede forsinkelse over en LEO-passage

seg-844de34fd2f3 = For hvert båndpar for en <c1/>-satellit angiver rapporten det skrå totale elektronindhold, som den geometrifri kodekombination genfinder ved passagens top, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), og dets 1-sigma ud fra de to båndes termiske kodestøj, så ethvert LEO-PNT-design med flere bånd kan afvejes som en ionosfæresonde

seg-1fdbb476c8ab = Maritim tillidsscore: aggregeringen af monitorernes evidens til en score fra 0 til 100 og dens tre bånd

seg-0d76b33144f1 = Hver monitor reducerer sin evidens til et forhold mellem statistik og tærskel; scoren er { "100" } minus summen over monitorerne af vægt gange en afgrænset lineær rampe af forholdet ({ "0" } op til { "0.5" }, { "1" } ved { "1.5" }), afgrænset til { "0" } til { "100" } og afrundet til { "0.1" }, med bånd ved { "90" } og { "55" }; hver epoke opregner de monitorer, der trak fra, og deres point.

seg-51640405c9b7 = SIEM-hændelser for tillidstelemetri: Log Event Extended Format (LEEF) over syslog

seg-1b3245506847 = Hændelser ved båndskift (eller pr. epoke) som Log Event Extended Format { "2.0" }-nyttelaster i en RFC { "5424" }-kuvert over UDP eller TCP, med en dokumenteret feltafbildning.

seg-c04042b0270a = Tærskler for interferens i modtagertillid kalibreret på JammerTest { "2024" }-datasættet

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: den præregistrerede kalibrering af monitorerne for C/N0-fald, AGC og jamming-indikator på det offentlige JammerTest { "2024" }-datasæt (Zenodo { "15911589" }, GPL-3.0-or-later, hentet ved kørsel, aldrig medtaget): pr. mappe en tidslinje på { "1" } s fra mon_rf.csv og rinex.csv, monitorerne køres én gang, hver epoke efter kalibreringen mærkes ren eller jamming ud fra mappens attack_log (flyttet fra CEST til UTC, sikkerhedsmargin på { "60" } s), hver tærskel sweepes over et fast gitter, den mindste tærskel med en samlet falskalarmsandsynlighed for rene epoker på højst { "0.01" } vælges, og tællinger med leave-one-folder-out på tilbageholdte data; en krydskontrol af UBX-læseren. Udvælgelsen leveres kun som den valgfri profil [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); standardreglen og hvert output uden den er uændret

seg-65a8361b4a22 = Jammertest-scoring: en modtagerlog scoret pr. planlagt test (detektionslatenstid, oversete alarmer, falske alarmer, tid til genopretning) mod den offentliggjorte testplan

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA's testkatalog og transmissionsplan (MIT, hentet med en fastlåst SHA-256, aldrig medleveret) læses som planlagt reference med bevarede katalog-id'er; en receiver-trust-kørsel scores pr. test (første alarm minus planlagt start, detected/late/missed mod en tolerance, tid til den første alarmfri periode, alarmer uden for ethvert slot og dets sikkerhedsmargen), med en signeret bevispakke, der indeholder scorekortet. Planen består af planlagte slots, ikke af optagne tidspunkter for udsendelse

seg-ee99388f7b15 = compliance (kshana compliance-report): en kortlægning fra Kshana-outputs til punkter i offentlige rammeværker, kun efter nummer, udfyldt ud fra de angivne kørsler; et resultat tæller for en funktion kun, når det indeholder det belæg, som kortlægningen angiver, en tom mængde belyser ingenting, og formuleringen er "leverer belæg for"; rapporten er ikke en konstatering af, at noget rammeværk er opfyldt, og ikke en vurdering eller godkendelse fra nogen.

seg-98c360d82d56 = Maritime integrationer: Signal K-plugin, OpenCPN-gatestrøm og scorepanel, referencebuild

seg-7af9ce566646 = Tillidsscoren, bandet, årsagerne, gatens tilstand og den af modtageren rapporterede position, udgivet under navigation.gnss.kshana i en Signal K-server med en notifikation for advarsel, alarm og normal (integrations/signalk); den gatede NMEA-strøm, hvor positionsbestemmelsen er markeret som ugyldig, mens tilliden er kollapset, og med en PKSHT-sætning pr. cyklus, leveret til OpenCPN over TCP af selve gaten eller af et lille relæ, og et native OpenCPN-scorepanel, der læser PKSHT-sætningen (integrations/opencpn); samt systemd-enheder og en container, der kører gaten (deploy/reference-build). Hvor disse viser output, bærer de den vejledende erklæring: Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.

seg-89ab9ef155eb = BOC({ "1,1" })-tracking: DLL-skalering og opløsning af bump-jump-multiplicitet (til-valg)

seg-ef24be9b5917 = Feltet boc i iq::track::LoopConfig (til-valg, None som standard): de tre DLL-diskriminatorer omskaleret, så de viser kodefejlen i chips med enhedshældning på hovedtoppen af sinus-BOC({ "1,1" }), og en bump-jump-monitor på meget tidlige og meget sene korrelatorer ved en halv subbærebølgeperiode ({ "0.5" } chip), der får kode-NCO'en til at hoppe mod hovedtoppen, når en op/ned-tæller når N ({ "8" } som standard). Uden tilvalget er alle outputs uændrede.

seg-2c32955cbfb3 = IQ-kanal for ionosfærisk scintillation (Cornell-modellen) mod målt GPS L1-scintillation ved { "50" } Hz

seg-2fdcb373ab25 = iq::channel::scint, Cornell-scintillationsmodellen (Rice-intensitet, andenordens Butterworth-spektrum, fase arg z) drevet ved et målt vindues S4 og intensitetens dekorrelationstid, sammenlignet på det, den genererer ud over disse to input; realdata::scint50 læser den målte log, fjerner tendensen og kører sammenligningen.

seg-160507ac3702 = Cell-averaging CFAR-tilvalg i IQ-akkvisition

seg-7c0a1adc9ae6 = iq::acq::ca_cfar og ca_cfar_cells (til-valg): en celle i et akkvisitionsgitter sammenlignes med middelværdien af referenceceller i dens Doppler-række (guard- og stride-lags, der løber rundt om perioden), ved en faktor alpha fastsat ud fra den lukkede form for CA-CFAR's sandsynlighed for falsk alarm for M ikke-koherente blokke (ca_cfar_pfa, ca_cfar_alpha). Detektoren på sampleeffekt forbliver standard, og alle eksisterende outputs er uændrede.

seg-5bd3bf0c22a7 = Spektrummodel: GLONASS-, BeiDou- og Galileo E6-bånd (til-valg)

seg-9c16189c63ac = spectrum::default_band opløser, kun ved navn (MORE_BAND_NAMES), GLONASS L1OF og L2OF på hver FDMA-kanal K = -7 til { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a og B3I (BPSK({ "10" })) og Galileo E6 (BPSK({ "5" })), med bærebølgerne og de mindste modtagne effekter fra deres interfacekontroldokumenter; standardbåndsættet og alle eksisterende outputs er uændrede.

seg-7b1ae0c7ca28 = LunaNet AFS' tertiærkoder og meddelelseslag (SB1 BCH, CRC-24Q, interleaver) mod LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkroniseringsmønster, SB1 BCH({ "51,8" })-koder og dekoder med 256 hypoteser, CRC-24Q, blokinterleaveren på { "60" } x { "98" }, en kontrol af symbolstrømme (kshana lunanet-afs-check) og en teststrømsgenerator med pladsholderunderrammer. Rate-1/2 LDPC-kodningen af underrammerne { "2" } til { "4" } er ikke implementeret (dens matricer findes i et separat bilag).

seg-0d7b17524c04 = Standardpakker: scenarier scoret mod tærskler fastsat før kørslen

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): testprofilerne i DHS' Resilient PNT-rammeværk for niveauerne { "1" } til { "4" }, IMO MSC.1/Circ.1575's nøjagtighedsniveauer og integritetsvurdering samt ICAO Doc { "9849" } Appendix F-pakkerne for overvågning, vurdering og afhjælpning: hver test kører en medfølgende scenarietype og sammenligner resultatfelter med tærskler angivet i pakken, og test, der kræver en modtagerlog, er opført som NEEDS INPUT og scores ikke.

seg-8a8f2c85e0c3 = Bevispakke for laboratoriets rundtur (scenarie, testbetingelser, modtagerlog, score)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) og receiver-log-eksporten kshana.test-conditions/1 fra kshana bench-export: en signeret pakke, der registrerer scenariets hash, de angivne betingelsers hash, logens hash og scoren mod de angivne hændelser, og som afviser betingelser, der ikke stemmer med scoringshændelserne, eller en log, hvis hash ikke er den angivne. Intet signal skrives, afspilles eller planlægges.

seg-a9189e4fe413 = IQ-trackingmotor mod GNSS-SDR { "0.0.19" } på uafhængige optagelser

seg-364de05e5b1b = Den fulde IQ-lags trackingmotor (iq::track gennem kshana iq track: overdragelse fra akkvisition, korrelatorer, NCO'er, andenordens Costas-PLL ved { "15" } Hz, førsteordens bærebølgeunderstøttet EML-indhyllings-DLL ved { "2" } Hz, låseindikator og C/N0-estimatorer) på GPS L1 C/A ved { "30" } til { "45" } dB-Hz.

seg-259d201c2ff8 = CRPA-antenneforstærkninger i jamming-typen mod en uafhængig numpy-genberegning

seg-192144c57783 = Jamming-typens valgfrie [crpa]-sektion: en stråle pr. kanal mod hver satellit (nulstyring med jammeren som nulpunkt, eller MVDR på sigma^{ "2" } I + P_j a_j a_j^H), der skalerer hvert links støj med ||w||^{ "2" } og jammeren med |w^H a_j|^{ "2" } før den eksisterende anti-jam-C/N0-ligning.

seg-a2f34cff9338 = Terrænskygge af jammeren i jamming-typen mod en uafhængig numpy-genberegning på en rigtig SRTM-tile

seg-334c569d9cae = Jamming-typens valgfrie [terrain]-sektion: storcirkelterrænprofilen mellem jammer og modtager på en SRTM .hgt-tile med en jordbule med k-faktor, den dominerende knivægge (største Fresnel-Kirchhoff nu) og det enkelte knivægtab fra ITU-R P.526-15 afsnit { "4.1" }, trukket fra jammerens modtagne effekt.

seg-825c121c7512 = Akkvisitionshysterese og front-end-kvantisereren i jamming-typen mod uafhængige genberegninger

seg-f7207263d881 = Jamming-typens valgfrie [acquisition]-sektion (en satellit akkvireres ved eller over en akkvisitionstærskel efter en forsinkelse ved genakkvisition og fastholdes, så længe den er ved eller over trackingtærsklen) og [front_end]-sektion (AGC-aflæsningen { "10" } log10({ "1" } + J/N) og ADC'ens kvantiseringstab for gaussisk input trukket fra hvert link, markeret som ugyldigt for ikke-gaussiske jammere).

seg-9c46f1c76486 = Begrænset FLL-indfangning under standardudformningens gulv for FLL-til-PLL-overdragelse (til-valg)

seg-efa1d1a9e904 = iq::tracks til-valg carrier.fll_pull_in_max_s (feltet fll_pull_in_max_s i iq::track::LoopConfig): under fll_assist = pull-in overdrager FLL til PLL efter en fast indfangningstid, uanset PLI, med en tilsvarende tilbagevenden, indtil PLI første gang når fll_off_pli.

seg-ac0f97e945a7 = RTKLIB .pos-løsningslæser til receiver-trust

seg-0b8bc2c89de4 = Læser en RTKLIB-løsningsfil (kalender- eller GPS-uge/TOW-tid, bredde/længde- eller ECEF-position, anvendte satellitter) ind i receiver-trust-tidslinjen (receiver_trust::machines::rtklib).

seg-849393517c04 = NovAtel OEM7 ASCII- og binære logs (BESTPOS, RANGE, RXSTATUS) til receiver-trust

seg-7e0021922025 = Læser BESTPOS (position), RANGE (C/No pr. signal) og RXSTATUS (modtagerens jammerflag, som epokens selvrapport) fra ASCII- og binære OEM7-logs, CRC-kontrolleret, skrivebeskyttet (receiver_trust::machines::novatel).

seg-a45c53a9deb3 = RTCM { "3" } MSM4- og MSM7-læser af bærebølge-til-støj-forhold til receiver-trust

seg-0a0c9976236f = Læser C/N0 for hver signalcelle i RTCM { "3" } MSM4- og MSM7-meddelelser (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) fra en rammestrøm, CRC-24Q-kontrolleret (receiver_trust::machines::rtcm3). Opbygningen stammer fra de BSD-licenserede pyrtcm-tabeller, ikke fra teksten i RTCM-standarden.

seg-cd554a7c1649 = GNSS-SDR-monitoradapter til receiver-trust

seg-22b587ac642d = Læser GNSS-SDR Monitor-meddelelser (Gnss_Synchro) og PVT-monitor-meddelelser, videresendt som JSON-linjer med proto-feltnavnene, til C/N0 pr. kanal, positionsbestemmelse, anvendte satellitter, HDOP og himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-217e5953c128 = Indlæsning af IMU-log, gyro-heading-input og Allan-tilpasning af hybride sensorparametre

seg-9dadc819daef = Læser en IMU-CSV (dokumenterede kolonner eller EuRoC-opbygningen); integrerer yaw-raten til den heading, som heading-course-monitoren læser ([log.imu]); og tilpasser accelerometerets og gyroets støjparametre for de hybride scenarier og fusionsscenarierne ud fra en stationær log ved overlappende Allan-deviation (imu-fit).

seg-15a852a2dcb0 = Home Assistant MQTT-discovery og tilstandseksport til tillidstelemetri

seg-6d6b07b26966 = Et JSON-tilstandsdokument og Home Assistant MQTT-discovery-meddelelser for tillidsstrømmen, udskrevet som tekst på alle flader og udgivet over MQTT { "3.1.1" } QoS { "0" } af CLI'en (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-68caf86157c2 = ROS { "2" }-pakke til receiver-trust og gnss_lib_py-bro

seg-e7d7d99fe538 = En ROS-fri bro, der skriver positionsbestemmelses- og satellitmeddelelser som NMEA og scorer dem gennem Python-bindingen (integrations/ros2/kshana_trust), og en bro fra gnss_lib_py NavData til receiver-trust gennem rtklib-pos-formatet (integrations/gnss_lib_py).

seg-c3c260b7063e = Tests
