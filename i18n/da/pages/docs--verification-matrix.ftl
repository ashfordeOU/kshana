# docs--verification-matrix: translations (da)

seg-619f89bf160c = Realisering af månens referencesystem

seg-2db69c58f694 = Differentiel PNT på Månen

seg-1ff1d8ebf1e7 = Compliance-mapping til offentlige rammeværker

seg-aab745a65e76 = Modul

seg-d6476863f862 = Funktion

seg-ad856ad710eb = Status

seg-60a43431ebe0 = Krav

seg-cbf0f9bcd2d8 = Uafhængig reference

seg-1603e76bcf66 = Identifikation af potenslovsstøj ved lag-1-autokorrelation

seg-d95fe5878ee3 = allan::lag1_noise_id: Riley og Greenhalls ({ "2004" }) støjidentifikator med lag-1-autokorrelation (decimeret fase med dens kvadratiske led fjernet eller gruppemiddelværdi af frekvens med dens linje fjernet; gentagne første differenser, indtil delta = r1/({ "1" }+r1) < { "0.25" } eller d = dmax), som returnerer potenslovens eksponent alfa som heltal og urundet (+{ "2" } hvid PM til -2 random-walk FM) ved enhver middelværdifaktor; den fastsætter frihedsgraderne for støjtypen i enhedskortene i det målte urbibliotek

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin og bidragydere, LGPL-3.0-or-later, kørt som et separat program af fixture-generatoren): en uafhængig implementering af den offentliggjorte Riley-Greenhall-algoritme, en entydigt defineret størrelse under de angivne konventioner. Kontrollerer identifikatoren, ikke støjindholdet i noget reelt ur

seg-aedf395f3597 = Autentificering af navigationsdata på modtagersiden med Galileo OSNMA

seg-1e6e62438dad = osnma + <c1/>: en åben verifikator i ren Rust på modtagersiden til Galileo OSNMA (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) ud fra I/NAV-sider eller en u-blox UBX-RXM-SFRBX-strøm: Merkle-træets offentlige nøgler (DSM-PKR), ECDSA P-256/P-521-signaturen på DSM-KROOT, verifikation af TESLA-nøglekæden (SHA-256 eller SHA3-256), verifikation af MACSEQ og tags (HMAC-SHA-256 eller CMAC-AES) for ADKD { "0" }, { "4" } og { "12" } med krydsautentificering, kædeslutning/tilbagekaldelse/fornyelse, fornyelse og tilbagekaldelse af offentlige nøgler samt alarmmeddelelsen; status pr. satellit Authenticated/Failed/Unavailable med en årsag til hver fejl eller forsinkelse. Vejledende: ikke typegodkendt navigationsudstyr og ikke en tjeneste for navigationsintegritet; der hævdes ingen ydeevne mod spoofing

seg-a6bd60ed728f = De officielle Galileo OSNMA-testvektorer, som European GNSS Service Centre har offentliggjort som bilag til Receiver Guidelines (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } af { "18" } sæt, { "186,382" } tags autentificeret, { "0" } fejlet, kørt offline den 2026-10-10 (evidensoptegnelse i kshana-pro docs/evidence). Omfang: vektorerne kontrollerer den kryptografiske verifikation (Merkle, KROOT/ECDSA, TESLA-kæde, MACK-tags, ADKD 0/4/12) og dens udfald på de offentliggjorte scenarier; de bruger kun HMAC-SHA-256, en SHA-256-kæde, 128-bit-nøgler, 40-bit-tags og opslagsposterne { "33" } og { "34" }, så CMAC-AES, SHA3-256-kæder og andre parametre kun er dækket af offentliggjorte known-answer-tests af primitiver og af syntetiske tests. Hærdningen af betroet tid, databinding, udløb og bekræftelse af header er testet med de syntetiske angrebstests og ikke med et eksternt orakel. Ikke kontrolleret: tilbagekaldelseslister for certifikater, live signaler eller en live modtager (UBX-ordlayoutet er kun kontrolleret på syntetiske frames), Merkle-træer med SHA3-256, friskhed uden en uafhængig tid. Ikke en EU-tjeneste

seg-27a61718eb95 = Karakterisering af frekvensstabilitet

seg-56174d771190 = Allan-/modificeret/Hadamard-deviation + identifikation af potenslovsstøj med χ²-CI'er

seg-ed01b2ab3481 = NIST SP { "1065" } (Riley) / Stable32-referencedeviationer på NBS14

seg-25b78672c194 = Frekvensstabilitet på et reelt målt ur

seg-fd378f5fe04a = Overlappende Allan- + overlappende Hadamard-deviation på en reel cæsiumstandard

seg-64fd49d58394 = Stable32 overlappende ADEV/HDEV på den målte fasetidsserie fra cæsium 5071A (allantools)

seg-f305dbc83f2b = Paritet for Allan-estimatorer på den kanoniske Stable32-referenceserie

seg-5bfca5dcfb7c = Overlappende Allan + modificeret Allan + tidsdeviation over hele AF-stigen

seg-327ab6dcf16a = Stable32-referencedeviationer for PHASE.DAT (Riley; standardserien til regression)

seg-96c4275f5a89 = Frekvensstabilitet med udvidet rækkevidde (Theo1 / TOTDEV)

seg-7f59c3631ca4 = Theo1 og total deviation (TOTVAR) — estimatorer for langtidsstabilitet med udvidet rækkevidde, der når ~{ "75" } % af optagelsen, hvor Allan-deviationen giver op omkring ~{ "50" } %; det bias-fjernede ThêoH-hybrid (allan::theoh_curve), der er bygget på dem, forbliver MODELLED

seg-a38edc2526f5 = allantools { "2024.06" } — et uafhængigt frekvensstabilitetsbibliotek fra tredjepart — theo1 (NIST SP { "1065" } lign. { "30" }) og totdev (NIST SP { "1065" } lign. { "25" }) på det hermetiske LCG-datasæt i NIST SP { "1065" } §{ "12.4" }; kan genskabes offline via tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

seg-cc40472fbcbf = Maximum Time Interval Error (MTIE) — wander-mål for telekommunikation

seg-5c54ba2748f7 = MTIE(τ): det maksimale peak-to-peak-udsving i tidsfejl over et vilkårligt glidende vindue på τ = m·tau0, den wander-statistik efter ITU-T G.810/G.823/G.8261, som grænseværdierne (MTIE-masker) for synkroniseringsnet er skrevet op mod — et ekstremalt mål (max/min), der adskiller sig fra Allan-familiens RMS

seg-300fd3f945a0 = allantools { "2024.06" } — et uafhængigt frekvensstabilitetsbibliotek fra tredjepart — mtie() på den hermetiske LCG-faseserie i NIST SP { "1065" } §{ "12.4" }; MTIE er en ren max/min-statistik, så estimatorens output er bitnøjagtigt mod allantools på det identisk byggede fasearray (de indcheckede referencekonstanter med 15 betydende cifre ligger inden for { "1" } ULP). Kan genskabes offline via tests/fixtures/mtie/generate_mtie_reference.py

seg-67d73f3ca14d = Modificeret Allan / tidsdeviation (MDEV / TDEV)

seg-9ac9d2b0bdf8 = MDEV(τ): den overlappende modificerede Allan-deviation (estimator med glidende vindue og anden differens, der adskiller hvid fra flicker-fasestøj), og TDEV(τ) = τ/√{ "3" }·MDEV(τ), wander-statistikken i tidsdomænet efter ITU-T G.811/G.812/G.823, som synkroniseringsmaskerne er skrevet op mod

seg-24a441f32375 = allantools { "2024.06" } — et uafhængigt frekvensstabilitetsbibliotek fra tredjepart — mdev() og tdev() på den hermetiske LCG-faseserie i NIST SP { "1065" } §{ "12.4" } (samme serie som rækkerne for Theo1/TOTDEV/MTIE), der beregner de samme entydigt definerede estimatorer; stemmer til <{ "1e-9" } relativt. Kan genskabes offline via tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (Den datastyrede phasedat_reference.rs kontrollerer dem også mod Stable32 til { "1e-3" }; dette er det stramme, altid aktive hermetiske krydstjek)

seg-e4b6d707cbf5 = Frekvensstabilitet for optisk ur på en reel målt kurve

seg-e9077554a08f = NNLS-genfinding af potenslov (hvid FM + gulv af rød støj) ud fra en offentliggjort målt Allan-deviation for den optiske urovergang i ⁸⁸Sr — gengiver σ_y(τ) og den overordnede skalering 4.7e-16/√τ ved korte τ med et ægte målt gulv ved lange τ, i stedet for det syntetiserede gulv af optisk klasse, som holdover.rs ellers antager

seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), fig. { "4" } målt ADEV; kurven er medtaget ordret fra Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Afgrænset til at gengive den offentliggjorte målte stabilitetskurve — tallene for holdover til tærskel for enheder af urklassen forbliver MODELLED

seg-cc95c8615d39 = Integritet (RAIM/ARAIM/SBAS)

seg-d4ad9cfa4f9b = ARAIM-løsning med flere hypoteser og løsningsseparation efter ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels og add_v42_protection_levels_ecef: bestemmelse af delmængder efter reglerne P_THRES og FC_THRES, VPL, HPL, den effektive monitortærskel EMT og sigma_acc); snapshot-RAIM med χ²-fejldetektion og udelukkelse af enkelte satellitter (raim::snapshot_raim, raim::snapshot_raim_fde) og hældningsbaseret HPL/VPL på det geodætiske lokale niveau; og SBAS DO-229E-kombinationen af beskyttelsesniveauer (sbas::sbas_protection_level) på L1-tjenesten. Ikke dækket, sagt ligeud: bekvemmelighedsfunktionerne med ensartet sigma raim::araim_raim og raim::araim_dual_raim er IKKE ADD-konforme (på matchede input rammer de ved siden af Stanford MAAST med { "0.75" } m VPL / { "4.04" } m HPL og { "0.39" } m VPL / { "1.93" } m HPL, et fund); sammenligningen af dual-frequency multi-constellation (DFMC) L5 SBAS er et fund ({ "308" } bruger-epokepar uden GEO i sigte er beskyttet af Kshana og ikke af MAAST, hvis GEO-modtagelsesgrænse Kshana ikke modellerer); raim::solution_separation_raim har ingen ekstern sammenligning

seg-1c37702cc5f2 = Banepropagering og banebestemmelse

seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + perturbationer, batch-/sekventiel OD

seg-c84585f43297 = AIAA 2006-6753 verifikationsvektorer for SGP4

seg-50c545872e4f = Numerisk Cowell-propagator og kraftmodel

seg-74f8c585bcfd = Numerisk Cowell-propagator med en hierarkisk kraftmodel (tolegemer, zonal J2–J6, tredjelegeme fra Sol/Måne, SRP af kanonkuletype, eksponentiel modstand); RK4 med trindobling / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — et uafhængigt bibliotek med en anden integrator og en anden rekursion for kuglefunktioner. De konservative niveauer (tolegemer → zonal J2–J6 → tredjelegeme Sol/Måne → SRP af kanonkuletype) stemmer til under en meter over en bue på { "24" } h og kontrollerer dermed integratoren + kraftalgebraen; modstandsniveauet og den absolutte nøjagtighed af input til efemeride for Sol/Måne og massefylde forbliver MODELLED (kun karakterisering)

seg-d38c4be472ac = Skygge for SRP ved jordens fladtrykning (valgfri)

seg-ab8247c6b4d2 = SRP-belyst andel med WGS-84-ellipsoiden som det tilsløreende legeme (tilsyneladende jordradius fra ellipsoidens rand mod Solen, linseformel med to skiver; srp_shadow::oblate_conical_shadow), valgfrit på Cowell-kraftmodellen via propagator::ForceModel::srp_shadow (standard: den sfæriske koniske skygge, uændret)

seg-01066d639b39 = Solstrålingstryk (SRP) med box-wing og ECOM2, med partielle afledede (valgfrit)

seg-2a5fc9708bd0 = SRP uden kanonkugle: en flad-plade-model af typen box-wing (Vallado lign. 8-44; ensidede kropspaneler, solpegende vinger) med tabellerne for Galileo FOC, IOV og IOV ved end-of-life fra GSC's satellitmetadata, i nominel GNSS-yaw-styring, med analytiske partielle afledede for strålingsfaktoren og for hvert paneles spekulære og diffuse koefficienter; og den empiriske ECOM2-model (D2/B1) med dens partielle afledede. Box-wing er valgfri på Cowell-propagatoren (propagator::ForceModel::box_wing_srp, der sætter dens felt srp_boxwing) og på modellen til præcis banebestemmelse (precise_od::PreciseForceModel::box_wing_srp) og erstatter kanonkuleleddet med cr som strålingsfaktor; begge er som standard None, så hver eksisterende vej forbliver byte-identisk. ECOM2 er ikke koblet ind i en kraftmodel

seg-bde1b3a94a47 = Solar SRP-skygge med randfortykning (valgfri)

seg-eaaec545dd68 = SRP-belyst andel som den ikke tilsløredede andel af solfluxen med randfortykning (Eddington-approksimationens lov I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kvadratur) over en sfærisk eller WGS-84-Jord (srp_shadow::limb_darkened_shadow, ShadowModel-varianten OblateEarthLimbDarkened)

seg-76cb4b668ad5 = Ingen ekstern: Orekit { "12.2" } har ikke noget belysningsforhold med randfortykning. Kun kontrolleret mod lukkede former af den samme lov

seg-673b17e9dcf7 = NRLMSISE-00 massefylde i termosfæren

seg-09e997231de8 = En portering af den empiriske termosfære NRLMSISE-00 (gtd7 og gtd7d: massefylder af arter, samlet massefylde med anomalt ilt, temperaturer; de { "24" } kontakter; tilstande med daglig Ap og ap-array med 3 timers trin) fra C-versionen i det offentlige domæne af NRL's Fortran-kode

seg-12977f65b2ea = NRLMSISE-00 som niveau for modstandsmassefylde (valgfrit)

seg-17aec847b675 = forces::DensityModel (Exponential som standard, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) og propagator::ForceModel::drag_density: kvadratisk modstand mod den medroterende atmosfære med massefylden fra NRLMSISE-00 i det geodætiske WGS-84-punkt (Jordens rotationsvinkel med UT1 = TT, lokal soltid UT + lon/15), konstant rumvejr pr. model; som standard fra og bit-identisk

seg-1ac7430e88fc = Standardmodstand med eksponentiel model mod en uafhængig implementering (ækvatorial)

seg-a9c41b03f2ca = Standardmodstanden i Cowell-propagatoren: kvadratisk modstand mod den medroterende atmosfære med forces::atmospheric_density, den stykkevis eksponentielle tabel i Vallado tabel 8-4 ved den sfæriske højde (propagator::ForceModel::drag med standardvarianten Exponential af forces::DensityModel)

seg-9e15970435c3 = Sol og Måne fra DE440 i Cowell-kraftmodellen (valgfrit)

seg-de6831cf7785 = Valgfrit efemerideniveau for leddene for tredjelegeme og SRP i den numeriske Cowell ForceModel: den geocentriske Sol og Måne fra en vilkårlig EphemerisProvider (en DE440 SPK-kernel via KernelEphemeris) ved TDB = TT + (TDB - TT), som afviser en provider, der ikke kan betjene epoken, og tæller hvert fald tilbage til den analytiske serie; som standard fra

seg-057c21daf4f2 = S1-atmosfæretidevand (valgfrit)

seg-f600a39f297e = Det døgnlige S1-lufttryksfloede som en perturbation af geopotentialet: Biancale og Bode ({ "2006" }) model N1, grad { "2" } til { "6" }, gennem belastningsformlen i IERS { "2010" } lign. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valgfrit på Cowell- og præcisionskraftmodellerne (air_tide_s1, som standard fra)

seg-7dd9fccac779 = Ingen ekstern for effekten på geopotentialet. De { "24" } koefficienter er transskriberet fra GFZ STR06/01 tabel { "1" } model N1 og kontrolleret række for række mod rapporten (SHA-256 890865ae); grad { "0" }, { "1" }, { "7" } og { "8" } bruges ikke. Ray og Ponte ({ "2003" }) trykker ingen tabel med kuglefunktioner, så ingen anden kilde blev sammenlignet

seg-b150b1bdb599 = Koefficienter for S2-atmosfæretidevand i IERS-konventionen

seg-87e9238b8c53 = Rays ({ "2001" }) S2-harmoniske for lufttryk (n <= { "4" }, progrades og retrograde) omregnet til den fuldt normaliserede form med sinus foran i IERS { "2010" } lign. 6.20-6.21 (amplitude divideret med N_nm, epsilon = { "90" } grader - psi) og anvendt som S2-leddet i tides::atmospheric_tide

seg-444f0a65b6fd = Tesseralt geopotentiale i Cowell-propagatoren

seg-ad475816bc78 = Valgfrit tesseralt EGM2008-felt (til grad/orden { "70" }) som centraltyngde i den numeriske Cowell ForceModel, evalueret i et jordfast system roteret med IAU { "2000" } Jordens rotationsvinkel (eller CIO GCRS-til-ITRS-kæden); som standard fra, så intet eksisterende output flytter sig

seg-e8f5ff8c9149 = Tyngdefelt med kuglefunktioner af høj grad (EGM2008 til { "2190" })

seg-d3b2f32dcecb = Evaluering af et fuldt normaliseret felt til grad { "2190" }, sikret mod underflow og mod polerne (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes-Featherstone { "2002" } modificeret fremadrettet søjle med gradienten fri af 1/cos phi), en streamende indlæser af ICGEM .gfc (from_gfc_file / from_gfc_reader; hele EGM2008 hentes ved kørsel og medleveres ikke) og Holmes-Featherstone-evaluatoren, som kan vælges på det valgfrie Cowell Geopotential

seg-e81b7418c382 = DOP853-integrator

seg-e6e3638aa68e = Hairer DOP853 { "8" }({ "5,3" }) eksplicit Runge-Kutta med den kombinerede fejlestimator af 5. og 3. orden, SciPy/Hairer-trinkontrolleren, automatisk begyndelsestrin, en fail-closed trinbeskyttelse og tæt output af 7. orden; kan vælges som propagatorens Integrator-variant Dop853 / propagator::propagate_dop853

seg-9ad7c1f4da77 = Robust løser af Kepler-ligningen

seg-4b9d812fd13e = Elliptisk Kepler-løser for alle { "0" } <= e < { "1" } og alle middelanomalier: kubisk starter og korrektion af femte orden efter Markley ({ "1995" }), et residual uden udslettelse (1-e)E + e(E - sin E) - M og beskyttet Newton-polering (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

seg-1960804ef2f4 = Batch-banebestemmelse med afstandsændring og az/el med maskering af stationer

seg-4c185244bc66 = Genfind en epoketilstand ud fra blandet sporing af afstand, afstandsændring og azimut/elevation over en elevationsmaske med Gauss-Newton på H = (dh/dx(t)) Phi(t, t0): analytiske partielle afledede af målingerne og en variationel tilstandsovergangsmatrix med analytiske partielle afledede for tolegemer + J2 (RK4-integreret, ikke en STM i lukket form)

seg-bc3d1ee7c639 = Vægtning af observationer efter nøjagtighedskode i SP3

seg-63b1fab84f85 = Afbild nøjagtighedskoder i SP3 (header ++ eksponenter i { "2" }^n mm, basen %f, standardafvigelser base^n mm pr. post) til positionssigmaer pr. observation for motoren til præcis banebestemmelse (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ebecb8906506 = Ingen ekstern: vægtene er et modelvalg (SP3-formatet definerer kun koden som producentens nøjagtighedsindikator; her læses den som et enkelt sigma pr. akse). De eksisterende optagne kørsler fra agenturer er uændrede

seg-e35df6881c80 = Planetariske tyngdefelter fra PDS SHADR-tabeller

seg-f78b73ae8742 = Læs PDS SHADR-tabeller med kuglefunktioner (from_shadr, på SphericalHarmonicField i src/gravity_pds.rs: enhedsomregning, C00 = { "1" } leveret, kontrol af fuldstændighed og normalisering) og evaluér den legemsfaste tyngde for Mars GMM-3 (d/o { "120" }) og Månens GRAIL-felt GL0660B (d/o { "660" })

seg-ae3e8833a5ef = Knyt et offentliggjort tyngdefelt til et legeme

seg-ffb2b20e5f32 = with_gravity_field (på Body, i src/gravity_pds.rs): knyt ethvert indlæst felt med kuglefunktioner (for eksempel GMM-3 eller GL0660B) til en Body, så propagatoren evaluerer det legemsfast; valgfrit, standardlegemer er uændrede

seg-bcb731f7a9b5 = Kun intern konsistens. Hvert offentliggjort felt er defineret i producentens legemsfaste system (GMM-3 i Mars-systemet fra Konopliv et al. { "2006" }, GL0660B i DE421's principale akser for Månen), mens feltet evalueres i IAU-systemet; forskydningen er ikke modelleret

seg-659bfeba459c = Batch- og sekventiel banebestemmelse

seg-dbc98f498941 = Genfind en epoketilstand [r,v] ud fra afstande fra jordstationer med en Gauss–Newton-batchdifferentialkorrektor og et sekventielt filter over en kraftmodel med tolegemer+J2

seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — et uafhængigt estimeringsbibliotek fra tredjepart på en matchet kraftmodel; den genfundne epoketilstand + RMS af residualer efter tilpasning stemmer til <{ "1e-3" } m uden støj og <{ "3" } m ved et støjgulv på { "5" } m

seg-acdac055acb9 = Radiometrisk lysrejsetidsløser til dybt rum

seg-62a478e40850 = Retarderet (nedadgående ben) envejs lysrejsetidsløsning τ = |r_rx − r_target(t−τ)|/c til radiometrisk navigation i dybt rum (Jord→Mars/Sol/Måne)

seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) lysrejsetid med konvergeret newtonsk aberration (Aberration::CN; svarer til SPICE spkapo) over JPL DE440 — en uafhængig SPICE-implementering i Rust; kshanas fastpunktsløser for retarderet tid stemte til under et nanosekund. De bredere tal for Doppler / Shapiro / reduceret-dynamisk OD forbliver MODELLED

seg-c69ef9342160 = Satellitposition fra udsendt efemeride (multi-GNSS RINEX)

seg-62702fc6f242 = Keplersk → ECEF-satellitposition fra udsendt efemeride efter IS-GPS-200 / Galileo-OS / BeiDou-OS ud fra en indlæst RINEX-3-navigationspost

seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() kompileret fra C-kildekode (T. Takasu, BSD-2-Clause) — en uafhængig implementering af IS-GPS-200/SIS-ICD, fodret med de identiske RINEX-3-navigationsposter; satellittens ECEF-position stemte til ~{ "62" } nm. (Interpolation af SP3 med præcis efemeride er valideret separat — se 'Interpolation af SP3 med præcis efemeride')

seg-c807a782b20e = Interpolation af SP3 med præcis efemeride

seg-238de70daab9 = Lagrange-interpolation efter IGS-standard af satellitpositioner i SP3 med præcis efemeride med korrektion for Jordens rotation pr. knude (roter hver knude med ω⊕·(t_node−t) ind i det jordfaste system på forespørgselstidspunktet før polynomietilpasningen)

seg-e9249ae44a11 = RTKLIB peph2pos() kompileret fra C-kildekode (preceph.c; T. Takasu, BSD-2-Clause) — de facto IGS-reference, en uafhængig implementering; kshanas interpolator (nu med den samme knudekorrektion for Jordens rotation) stemte til ~{ "15" } nm på et reelt SP3-produkt, ned fra ~{ "5.5" } cm før korrektionen

seg-9762cf428435 = Navigationsmeddelelsesenkodere ud over GPS LNAV (GPS CNAV, Galileo I/NAV og F/NAV)

seg-9b703b9607d8 = GPS CNAV-meddelelsestyperne 10/11/30, Galileo I/NAV-ordtyperne 1-5 i nominelle lige/ulige sider og Galileo F/NAV-sidetyperne 1-4: pakning af ICD-felter og kvantisering, CRC-24Q, foldningskodning med rate 1/2 og K={ "7" } (G2 inverteret for Galileo), blokinterleaving og synkroniseringsmønstre, med tilsvarende testdekodere

seg-7939b210e83c = Intern rundtur og known answers fra ICD; ingen dekoder fra tredjepart er kørt (RTKLIB/GNSS-SDR-harnessen, der læser KSHANA_NAVMSG_ORACLE_JSON, er datastyret). MODELLED

seg-5ce7cd3d6011 = Læser af IONEX globalt ionosfærekort og interpolation på et reelt CODE GIM

seg-502656556ddf = IONEX { "1.0" }-læser (header, værdier af typen I5 i faste kolonner, TEC- og RMS-kort, absolutte epoker, manglende værdier) med bilineær rumlig interpolation, formatets tidsinterpolation med nærmeste / på hinanden følgende / roterede kort (lign. 1-3) og tyndskals-skråt TEC

seg-974d8c1f7876 = Hatch-bærebølgeudjævning af kode på reelle RINEX-observationer

seg-f26b5da0f52e = Hatch-filter uden divergens (ionosfærefri kode båret af den ionosfærefri bærebølge, vindue på N epoker, genstart ved tab af lås, geometrifrit spring eller hul) i samlingen til præcis enkeltpunktspositionering

seg-fac84cb9b256 = FUND mod den offentliggjorte ITRF2020-koordinat for WTZR: tærsklerne, fastsat på forhånd (udjævnet median og p95 højst { "0.6" } x rå; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md), blev ikke nået, forhold { "0.718" } og { "0.923" }; den resterende fejl på meterniveau er biaslignende (C1C-kodebias, antenne, tidevand, langperiodisk multipath) og ikke den hvide støj, som udjævning fjerner. MODELLED: filterets statistik er kontrolleret internt

seg-2eec513ae8c8 = RTK-dobbeltdifferenser med LAMBDA-heltalsfiksering på reelle RINEX-observationer

seg-6571676bf918 = Relativ positionering over kort baseline ud fra reel tofrekvent GPS-kode og bærebølgefase: dobbeltdifferenser mod den højeste satellit med deres fulde kovarians, et float-Kalman-filter over baselinen og enkeltdifferensernes multiplicitet med geninitialisering ved slip, LAMBDA-heltalsmindstekvadrater med ratiotesten og baselinen betinget på de fikserede heltal

seg-e50c5d4b65c7 = Offentliggjorte ITRF2020-koordinater for WTZR og WTZZ (IGN ITRF2020_GNSS.SSC, løsning { "3" }, med RINEX-antennehøjderne), som giver referencebaselinen; tærskler fastsat på forhånd i tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md, før koden blev skrevet. Kun kort baseline: ingen ionosfæriske eller troposfæriske dobbeltdifferenser er modelleret

seg-f9aa0c529393 = PPP-tidsløsning for modtagerens ur mod IGS' endelige stationsur

seg-83ad9e893db9 = Modtagerens ur estimeret af det statiske float-PPP-filter på reel tofrekvent GPS-kode og fase med endelige IGS-baner og -ure: en tidsoverførsel fra modtageren til IGS-tid, PPP-tidsløsningen uden ionosfære.

seg-91a882dd71e8 = Det endelige kombinerede IGS-ur for stationen WTZR (AR-poster i IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, en kombination af netværksløsninger fra flere analysecentre; IGS-produkter, fri brug med kildeangivelse); tærskler fastsat på forhånd i xval/ppp-time/PREREGISTRATION.md før nogen sammenligning; alle holdt ved første kørsel. HVAD DER IKKE ER DÆKKET: én station og ét konvergeret vindue på to timer; IGS-tid, ikke UTC(k); den konstante forskydning indeholder modtagerens kodebiaser og er afgrænset, ikke kalibreret; ingen sporbarhed til Circular T.

seg-a9b2a93401a3 = Float præcis enkeltpunktspositionering på reelle RINEX-observationer

seg-cc991ccec112 = Statisk float-PPP-extended Kalman-filter på reel tofrekvent GPS-kode og bærebølgefase med endelige IGS-baner og -ure: ionosfærefri kombination, antenneforskydninger for satellit og modtager (modtagervariationer), fast jordtidevand, phase wind-up, Shapiro-forsinkelse, estimeret zenitvådforsinkelse, float-multiplicitet pr. bue med detektion af slip via geometrifri / Melbourne-Wübbena

seg-36e7c9286af7 = Offentliggjort ITRF2020-koordinat for WTZR (IGN ITRF2020_GNSS.SSC, løsning { "3" }, propageret med dens hastighed) — tærskler fastsat på forhånd i tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md, før filteret blev skrevet; udvikling kun på den samlokaliserede station WTZZ. Ikke modelleret: havbelastning, satellit-PCV, løsning af heltalsmultiplicitet

seg-c8d87abed330 = Indlæsning af RINEX { "4" }-navigationsfil

seg-28913a01af00 = RINEX 4.00-4.02-navigationsfiler: <c1/>-poster for GPS LNAV, Galileo I/NAV og F/NAV, BeiDou D1/D2 og QZSS LNAV afkodet til typen for udsendt efemeride; poster for CNAV, CNV1-3, FDMA, SBAS, STO, EOP og ION springes over til næste postheader; en post, hvis header nævner en anden satellit, eller en afkortet post, afvises

seg-278ca396127a = Indlæsning af RINEX { "4" }-observationsfil

seg-e0883aa933eb = Headere i RINEX 4.0x-observationer (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; labels matchet i kolonne 61-80 for version { "4" } og senere) og epokeposter

seg-971fb1203a6d = Formatkontrol på en reel offentliggjort RINEX { "4.00" }-fil (indlæste værdier er lig filens udskrevne literaler) og en specifikationsafledt header; ingen uafhængig læser er kørt, så MODELLED

seg-33e5c74720ff = Udsendt satellitposition for BeiDou GEO

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } position af geostationær satellit fra en udsendt efemeride (inertielignende system, derefter Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valgfri via feltet include_beidou_geo i NavParseOptions, så standardlæseren stadig springer GEO'er over

seg-559814996a4c = Interpolation af præcist ur i SP3

seg-8e7a0dbd1755 = Satellituroffset mellem de tabellerede urknuder i SP3 ved lineær interpolation over de to omgivende gyldige knuder (RTKLIB's pephclk-skema; sentinel for dårligt ur springes over), og de samme knuder leveret til kæden for præcise produkter som poster svarende til RINEX-ur

seg-1f4f0f841802 = IGS' endelige kombination af satelliture på { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): offentliggjorte urestimater på forespørgselstidspunkterne, ikke interpoleret ud fra SP3; tærskler fastsat på forhånd i tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md før den første kørsel (RMS { "0.15" } ns, p95 { "0.30" } ns, median af knuder { "1e-12" } s, diskrimination 2x)

seg-71f48628ebb2 = GNSS/INS med tæt kobling på bærebølgefase med float-multiplicitet

seg-5a156aa81275 = Fejltilstands-EKF over { "15" } INS-tilstande, et ur i modtageren med to tilstande og én float-multiplicitet for bærebølgen pr. sporet satellit; pseudoafstand, bærebølgefase og valgfri afstandsændring fra en SGP4 Walker-konstellation (lysrejsetid og Sagnac), Klobuchar- og Saastamoinen/Niell-korrektioner anvendt i sløjfen ved filterets egen position; detektion af slip med tidsdifferentieret bærebølge og en tærskel pr. satellit udvidet med hastighedsusikkerheden; geninitialisering af multiplicitet ved slip og genopfangning

seg-00576e8c1032 = Intern konsistens: målingerne er syntetiseret ud fra de modeller, filteret bruger (χ² NEES/NIS over seeds, en støjfri konvergens, indsprøjtning af slip). MODELLED; ingen reelle modtagerdata og intet filter fra tredjepart er sammenlignet

seg-7d644516b1ec = Pakker for GNSS/INS til skibsfart, jernbane og luftfart med mulighed for tæt kobling

seg-cbb03a8baf73 = Tre gnss-ins-scenarier på trajektoriebiblioteket (et fartøj, der sno sig med { "8" } m/s med et udfald på fem minutter; et tog gennem et indsnit med to satellitter og en tunnel; et fly, hvis udfald dækker en krængende sving på 25 grader) og pakkens valgfrie [tight]-tabel: pseudoafstande fra en SGP4 Walker-konstellation fusioneret af navigatoren med lukket sløjfe, hver satellit over masken ved nominel drift og de højeste få ved forringet

seg-273c14256d4c = Intern: hver pakkes kvalitetsmål mod dens egen reference og en sammenligning af løs og tæt kobling på identiske input. MODELLED; revisionens sammenligning med NaveGo er ikke kørt

seg-f4dab73c4eda = Koblet PNT-filter med pseudoafstande med biastilstand og 3D-udvidelse i fusionspakken

seg-742b60089361 = Ét stakket Kalman-filter over position, hastighed, urfase og frekvens, fodret med pseudoafstande, der kobler position og ur (Joseph-opdateringer, der bærer krydskovariansen); en variant med 1 DOF udvidet med en konstant accelerometerbiastilstand, som fusionspakken kører under [coupled]; og 3D-versionen med 8 tilstande med rækker for sigtelinjen

seg-9558d7aad3af = Intern konsistens: reference simuleret ud fra filtrenes egne modeller (χ² NEES over Monte Carlo-seeds, den afkoblede pakke på identiske sensorer). MODELLED

seg-4a64aa1fe3ca = Løst koblet GNSS/INS-EKF med lever arm på KF-GINS-datasættet

seg-30f503856ac5 = Fejltilstands-EKF med 15 tilstande og lukket sløjfe drevet af IMU-tilvækster, hvor GNSS-antennepositioner fusioneres gennem lever arm-modellen H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], konfigureret ud fra en KF-GINS YAML-fil (begyndelsestilstand og sigmaer, ARW/VRW, Gauss-Markov-biaser)

seg-b01d28a09abe = Datasættets offentliggjorte referencetrajektorie og C++-programmet KF-GINS (GPL-3.0, commit 8291a93e, kørt som separat værktøj); tærskler fastsat på forhånd i xval/kfgins/PREREGISTRATION.md, og KF-GINS blev ikke kørt på disse data før den registrering (kontrolleret i dens Results). Alle seks tærskler holdt ved første kørsel. DATASTYRET: KF-GINS-demodatasættet (reel Leador-A15 IMU og RTK GNSS med en referencetrajektorie) har ingen licens og medleveres derfor ikke; xval/kfgins/fetch.sh henter det ved test med SHA-256 fastlåst for hver fil, og testen fejler ved uoverensstemmelse; vejen til at gengive det, som kræver netværksadgang, står i xval/kfgins/PREREGISTRATION.md. Opgraderet til VALIDATED efter ejerens beslutning på grundlag af datastyret evidens (2026-10-13)

seg-e6b6c605564c = Eksport til testbænk læst af en simulators læsere af bevægelsesfiler (gps-sdr-sim)

seg-a07429aa1998 = De bevægelsesfiler, der eksporteres til testbænken og gives til en open source GNSS-simulators egne læsere, kommer tilbage som den eksporterede trajektorie: NMEA GGA-filen (-g), udsnittet tid/bredde/længde/højde af bevægelses-CSV'en (-x) og dens udsnit tid/x/y/z (-u), på { "6" } gnss-ins-scenarier (herunder pakkerne til skibsfart, jernbane og luftfart, læst op til simulatorens grænse på 3000 sampler) og { "2" } stationære. Kun bevægelse; intet signal skrives eller genereres.

seg-07b5f46a900f = HVAD DER ER KONTROLLERET EKSTERNT, angivet snævert: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion og readUserMotionLLH med dets egen WGS { "84" } llh2xyz, kaldt gennem xval/testbench-gpssdrsim/driver.c (ingen signalfunktion kaldt), mod de jordfaste kolonner i bevægelses-CSV'en række for række, med tærskler fastsat på forhånd i xval/testbench-gpssdrsim/PREREGISTRATION.md før nogen kørsel: hver sample læst i alle { "8" } scenarier; NMEA værste { "1.21" } mm (tærskel { "1" } cm); LLH-udsnit værste { "0.145" } mm (tærskel { "1" } mm); jordfast udsnit med fire kolonner eksakt (tærskel { "1" } um, ændring { "1" }); gnss-ins-rækker på simulatorens { "10" } Hz-gitter til { "2.3e-13" } s. FUND (kørsel { "1" }, fastholdt): den fulde CSV med fjernet header kan ikke læses af -u, fordi læserens linjebuffer på 100 tegn deler hver række på 161 tegn i to sampler; docs/TEST-BENCH.md angiver udsnittet med fire kolonner. HVAD DER IKKE ER KONTROLLERET: fysikken i scenariets referencetrajektorie; gps-sdr-sims signaloutput; enhver anden simulators læser; enhver modtager.

seg-2db2b9dc3b45 = GNSS/INS-trajektoriebibliotek og import af CSV-reference

seg-e1fe83c75a6c = Valgbare bevægelsesprofiler til gnss-ins-pakken (ligeud, figur-8, bymæssig stop-og-kør, flyets stigning og koordineret sving, opmålingsdrone), defineret af kommandoer for Euler-rater og acceleration langs sporet, lukket på referencetilstanden med den kinematiske IMU (centripetal-, tyngde- og Coriolis-led), og importeret CSV-reference omsat til den IMU, der gengiver den; den historiske kørsel er uændret, når der ikke er angivet nogen profil

seg-30ea002a06a0 = Intern: identiteter for stiv-legeme-kinematik, CSV-rundturen og filterets egen kovarians. MODELLED (ingen reel kørselslog er sammenlignet)

seg-8685fd899e3c = Strapdown-INS-mekanisering

seg-ba942e322f8a = Strapdown-inertiel mekanisering med kvaternionattitude i WGS-84 NED (kompenseret for coning/sculling), der propagerer en navigationstilstand ud fra tilvækster (Δθ, Δv)

seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) kørt under Octave — en uafhængig offentliggjort INS-værktøjskasse drevet af den identiske strøm af tilvækster (Δθ,Δv). Attitude stemmer bit for bit (samme konventioner for NED / skalar-først-kvaternion / jordrate / transportrate); hastighed/position stemmer op til to dokumenterede forskelle — nordtyngdeleddet for lodafvigelse, som NaveGo medtager og kshana udelader af design (lodlinjetyngde; matchet med Groves' lukkede form til hvert ciffer, med en sanity-floor-assert) og forskelle i integratoren af orden O(dt²) — ikke fejl i mekaniseringen

seg-d1a5c8e7ca74 = Syntese af tyngdefeltsfunktionaler (tyngdestøttet / GNSS-fri navigationskort)

seg-8336eb12eb7b = Tyngdestørrelse + forstyrrelse (mGal) med kuglefunktioner fra enhver ICGEM .gfc-model; normaltyngde GRS80

seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) Somigliana-normaltyngde + offentliggjort γ_e/γ_p; reelt ICGEM EGM2008-felt

seg-86f9186bb884 = Jord–Måne CR3BP { "9" }:{ "2" } NRHO mod den bane, CAPSTONE fløj

seg-d4127cf241f3 = Den cirkulære begrænsede { "9" }:{ "2" } sydlige næsten retlinede L2-halobane, som cr3bp::differential_correct_halo korrigerer (banefamilien for Gateway og CAPSTONE), sammenlignet på sin middelgeometri (periode, perilunradius, apolunradius) med den bane, CAPSTONE faktisk fløj. En måling af, hvor godt CR3BP-medlemmet beskriver den reelle bane; en CR3BP-bane er ikke en bane i en efemeridemodel og sammenlignes ikke epoke for epoke

seg-c866a5bd4318 = CR3BP-roterende tilstande afbildet til Måne-centreret ICRF på Jord–Måne-linjen i DE440

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf afbilder en dimensionsløs roterende Jord–Måne-CR3BP-tilstand til en Måne-centreret ICRF-position og -hastighed på den øjeblikkelige Jord–Måne-linje (længdeenhed Jord–Måne-afstanden, tidsenhed den inverse omløbsrate, systemets fulde vinkelhastighed inklusive dens rate uden for planen fra Månens acceleration), med den inverse from_moon_centred_icrf, og cr3bp::to_moon_centred_icrf_de440 læser den geocentriske tilstand for Månen fra en DE440 SPK. Den afbilder tilstande; den gør ikke en CR3BP-bane til en bane i en efemeridemodel

seg-d543e3e84f36 = Solsystemtype på en JPL-kernel (planetary_kernel_path)

seg-e8a96f29afc7 = Typen <c1/> med planetary_kernel_path: hvert rapporteret legeme, hvis egen NAIF-kode SPK'en indeholder, henter sin heliocentriske J2000-position og -hastighed fra kernelen gennem motorens egen læser (label KERNEL), et link, hvis to ender begge er i kernelen, beregnes på den, barycentre erstatter aldrig en planet, og alle andre legemer forbliver analytiske med deres egen label; rapporten får en kernelblok (sti, SHA-256, de legemer og links, der er taget derfra) kun når indstillingen er sat. Med de440s.bsp er det Merkur, Venus, Jorden og Månen

seg-7f3d53b4e8d1 = Porkchop på DE440-efemeriden

seg-bd813d7e0b58 = maneuver::porkchop_kernel: sweepet over opsendelsesdato x ankomstdato af afgangens C3 (km²/s²) og ankomstens V-infinity (km/s) med den progrades Lambert-løser med én omdrejning og kollinearitetsbeskyttelsen på { "0.5" } grader, på de heliocentriske J2000-tilstande for to vilkårlige NAIF-legemer læst fra en JPL DE440 SPK af cratets egen læser. Én omdrejning, prograd, ingen begrænsninger fra løfteraket eller ankomst: et sweep og ikke en missionsudformning

seg-b1401bed5da8 = Optimering af impulsive overføringer på DE440-efemeriden

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: afgangs- og ankomstdatoerne for en ballistisk overføring med to impulser og én omdrejning, der minimerer afgangens C3 eller ankomstens V-infinity inden for type I eller type II, som et kontinuert optimum (et 2-dages gitter over begge vinduer, derefter 2D Nelder-Mead), på heliocentriske tilstande fra DE440 SPK. En datooptimering for ét ben og ikke en missionsudformning: ingen valg af løfteraket, parkeringsbane, manøvrer i dybt rum eller flere omdrejninger

seg-6c695aef043b = En uafhængig optimerer: NAIF SPICE Toolkit (CSPICE N0067 gennem spiceypy { "8.3.0" }) heliocentriske tilstande på det samme de440s-udsnit, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) og SciPy { "1.18.1" } Nelder-Mead, uden kald af Kshana-kode. NASA's håndbog for Jord-til-Mars (MIDAS, efemeride ikke oplyst, 2-dages datogitter) er en sekundær offentliggjort reference og fastsætter ikke status

seg-93f3cdbb7297 = Lambert-løser for overføringer med flere omdrejninger

seg-995a6a995b78 = Hver løsning af Lamberts problem med op til tre fulde omdrejninger (maneuver::lambert_multirev: løsningen med én omdrejning, derefter venstre og højre gren for hvert antal omdrejninger, Izzo { "2015" }), med randhastighederne v1 og v2, for prograde og retrograde overføringer, i kanoniske og heliocentriske SI-enheder, herunder overføringer inden for { "1" } % af et antal omdrejningers minimale flyvetid og geometrier nær 180 grader. Kun en tolegemeløser (ingen perturbationer)

seg-ff9c6140fe1c = Lambert-løser for tolegemeoverføringer

seg-d8c39ced64b2 = Izzo-2015-løser af Lamberts problem med én omdrejning (r1, r2, flyvetid → randhastigheder) på tværs af overføringer LEO→GEO→heliocentrisk, prograde og retrograde

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — en uafhængig Lambert-løser fra tredjepart. Lamberts problem med én omdrejning (M={ "0" }) har en entydig løsning, så overensstemmelse mellem biblioteker er en ægte ekstern kontrol; stemmer til <{ "1e-4" } m/s (observeret ~{ "1e-11" }), samme slags validering som DOP får mod gnss_lib_py

seg-347cece5df63 = Referencesystemer og tidsskalaer

seg-5a4bc2c15eaa = IAU 2006/2000A præcession-nutation, CIO GCRS↔ITRS, tidsskalaer med skudsekunder

seg-51d28ab9d256 = IAU SOFA / ERFA-referencevektorer; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-c3d4b9bef817 = Todelte juliandatoer og skudsekunder på tidsvejen for Jordens bane

seg-5e859e3aa613 = En UTC-kalenderdato og -tid til en todelt UTC-juliandato med SOFA dtf2d-konventionen for dage, der ender på et skudsekund ({ "86 401" } s lange, { "23" }:{ "59" }:{ "60" }.x gyldig), UTC til TAI og tilbage, og UT1 fra UTC gennem TAI, på todelte datoer fra 1972-01-01: den tidsvej, som SGP4 (Sgp4::propagate_at, målt fra en todelt epoke) og den jordfaste IAU 2006/2000A-rotation (sgp4::teme_to_itrs_matrix_eop med den todelte rotationsvinkel for Jorden) tager

seg-f1c7bc235a6b = Todelte juliandatoer gennem Jordens rotation på banevejen

seg-cee11d4bad08 = Jordens rotation ud fra en todelt UT1-juliandato på banevejen, så den jordfaste position bevarer det mikrosekund, en enkelt f64-dato taber (omkring { "3e-9" } rad nær { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventionen, på de to dele), cio::gcrs_to_itrs_matrix_jd2 (CIO GCRS-til-ITRS-matricen med Jordens rotationsvinkel fra de to dele) og, bygget på dem og kontrolleret internt, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 og own_jd2_utc, ephemeris-scenariets valgfrie two_part_jd (ECEF-positionen, sporet på jorden og stationsvisningen; som standard fra, uændret) og tabsfri From-konverteringer mellem jd2::Jd2 og timescales::TwoPartJd. Præcession-nutation og epoken i Cowell-kraftmodellen forbliver enkelt f64, hvor en afrunding på { "40" } us er under { "1e-15" } rad eller langt under fejlen i den analytiske efemeride for Sol/Måne

seg-096df3971f5f = Systemmatricer mod ERFA-vektorer: IAU { "2006" } bias-præcession, TEME til GCRS og CIO-kæden med forskydninger af den himmelske pol

seg-731a5ed967b3 = Tre systemmatricer sammenlignet element for element eller via rotationsvinkel med ERFA til vilkårlige epoker: precession::precession_matrix (IAU { "2006" } bias-præcession med Fukushima-Williams-vinkler), nutation::teme_to_gcrs_matrix (rotationen TEME til GCRS P^T N^T Rz(-EE) med IAU { "2006" }-præcession, IAU 2000B-nutation og jævndøgnsligningen med dens to ledende komplementære led) og cio::gcrs_to_cirs_matrix_with_offsets (rotationen GCRS til CIRS med IERS' forskydninger dX, dY af den himmelske pol lagt til modellens CIP X, Y før rotationen, SOFA-kogebogens konvention; ny). Selve modelvalgene (2000B-nutation på TEME-vejen, serien med to komplementære led) er ikke valideret, kun deres implementering

seg-4e2fe2e3dabb = UTC før 1972 (æraen med glidende rate) på tidsvejen med todelt juliandato

seg-1d086e669f09 = UTC fra 1960-01-01 til 1971-12-31, da UTC løb med en forskudt rate i forhold til TAI og sprang med brøkdele af et sekund, på vejen med todelt juliandato: TAI - UTC fra driftstabellen for hver periode (timescales::tai_minus_utc_on_date), UTC-kalenderdatoen til en todelt UTC-juliandato med dagslængden { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC til TAI med dagsbrøken skaleret fra UTC til SI-sekunder (jd2::utc_to_tai) og TAI tilbage til UTC (jd2::tai_to_utc), efter SOFA dtf2d, utctai og taiutc. Før { "1960" } regnes TAI - UTC som { "0" } (SOFA's værdi; UTC udefineret) og ligger uden for påstanden. Den enkelte f64 timescales::tai_minus_utc klipper stadig til { "10" } s før { "1972" } og er ikke dækket

seg-efacec095051 = GLONASS udsendt satellitur og propagering af udsendt bane

seg-821b9c01b56e = GLONASS' udsendte satellituroffset -tau_n + gamma_n (t - t_b) på et tidspunkt aflæst på satellittens ur (glonass::GlonassEphemeris::sv_clock_bias_s, offsettet korrigeret for urbias med to fastpunktsiterationer) og PZ-90 jordfast position af den udsendte tilstandsvektor propageret med RK4 gennem bevægelsesligningerne i GLONASS ICD inden for +/-15 min fra referenceepoken (GlonassEphemeris::position_ecef), fra reelle RINEX { "3" } GLONASS-navigationsposter. Ingen transformation fra PZ-90.11 til ITRF anvendes (de stemmer til centimeterniveau siden { "2014" }; RTKLIB anvender heller ingen). Ikke koblet til noget scenariooutput: biblioteksfunktion

seg-d3b72a6fbb18 = Én vej for Jordens bane: SGP4-elementsæt til GCRS og ITRS på IAU 2006/2000A-kæden med parametre for Jordens orientering

seg-e4eca7205b5e = Propagerings- og systemvejen, som hver dirigeret type for Jordens bane deler: et SGP4-middelelementsæt med en todelt UTC-epoke (sgp4::MeanElementSet, læst fra elementer til konstellationsudformning med MeanElementSet::from_earth_fixed) propageret af SGP4/SDP4 til TEME (sgp4::SgpOrbit), og rotationerne TEME -> ITRS og GCRS -> ITRS i IAU 2006/2000A-kæden med UT1 - UTC og polbevægelse (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, formerne uden parametre teme_to_itrs_matrix og gcrs_to_itrs_matrix). TEME er den sande ækvator for datoen med middeljævndøgn, nået fra GCRS gennem IAU { "2006" } bias-præcession, IAU 2000B-nutation og jævndøgnsligningen

seg-f650a11458b8 = Afvejning af udformning af afstandsmålingskoder

seg-071e552a7179 = grænser for sidelober og krydskorrelation for m-sekvenser/Gold, længde↔multiplicitet

seg-65b7902a2d8f = Offentliggjort GPS C/A Gold-krydskorrelation (−{ "23.9" } dB); Gold { "1967" }-grænse

seg-5ec4c0730280 = GNSS-geometri / præcisionsforringelse (DOP)

seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP ud fra sigtelinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-opdeling

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — uafhængigt bibliotek, stemmer til { "1e-6" } relativt

seg-1a5623c81b48 = Positionsfejl fra geometri: RMS-fejl = sigma_UERE x DOP for motorens mindstekvadraters positionsbestemmelse

seg-7a94b44a8738 = dop_error_mc::run_geometry og check: et seedet Monte Carlo (N = { "20,000" } epoker pr. geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) af motorens egen iterede mindstekvadraters positionsbestemmelse (pvt::solve_spp, enhedsvægte, løst fra den sande position) på de { "8" } geometrier i tests/fixtures/dop/dop_reference.csv, hvor varianserne af fejlen mod øst, nord, op og ur, H/V/P-RMS, korrelationen øst-nord, middelfejlene og andelen inden for den horisontale ellipse på { "95" } % sammenlignes med sigma^{ "2" } Q, hvor Q er kovariansfaktoren i kernen orbit::dop (orbit::dop_cofactor, den samme aritmetik) på den samme geometri

seg-90f18c774d57 = Intern konsistens mod en lukket form: under den lineære gaussiske model er mindstekvadraters kovarians sigma^{ "2" } (H^T H)^-1 (Kaplan og Hegarty (red.), Understanding GPS: Principles and Applications, 2. udg., Artech House, { "2006" }, kap. { "7" }). Metode og tolerancer i designnoten for geometri i { "0.36" }, afsnit { "5.2" }, fastsat i en præregistreringscommit før den første kørsel: hver varians inden for { "5" } % ({ "5" } standardfejl på en stikprøvevarians ved N = { "20,000" }), hver RMS inden for { "2.5" } %, korrelationen øst-nord inden for { "0.035" } (5/sqrt(N)), hver middelværdi inden for { "5" } standardfejl, andelen i ellipsen på { "95" } % inden for { "0.95" } +/- { "0.0077" } ({ "5" } binomiale standardfejl); negative kontroller (PDOP fordoblet; fejl, der vokser som 1/sin(elevation) mod den uvægtede Q) skal fejle. SÅDAN SAMMENSÆTTES DET: Q er kovariansfaktoren i kernen orbit::dop, VALIDATED mod gnss_lib_py { "1.0.4" } på de samme { "8" } geometrier i tests/dop_reference.rs (rækken 'GNSS-geometri / præcisionsforringelse'); denne række tilføjer trinnet fra disse faktorer til meter gennem motorens løser og låner ikke den rækkes status. HVORFOR MODELLED: intet eksternt datasæt er involveret; overensstemmelsen viser, at estimatoren og støjen realiserer sigma x DOP under lærebogsmodellen, ikke at en modtagers fejl er lig med UERE x DOP, og sigma_UERE er et input

seg-9acfde1b57f7 = Geometribevidst tillidsklassifikation: satellitgeometri ved siden af modtagerens tillidsscore og en klasse på hver fradragspost

seg-6138c41e13ff = receiver_trust::geometry: satellitgeometri pr. epoke (god, forringet med årsagerne få-satellitter/høj-pdop/høj-hdop/blokeret-himmel eller ukendt, når loggen ikke har GSV, NAV-SAT eller GSA) udledt af de rapporterede elevationer og azimutter gennem orbit::dop eller taget fra GSA, med en label, der altid rapporteres og aldrig scores (god, rimelig, dårlig, ukendt) og HDOP, PDOP, VDOP, antallet af satellitter og signaltab i ord; en geometrimonitor i skibsscoren, der ikke fratrækker noget, medmindre geometrien er dårlig (forholdet max(hdop/4, pdop/6, 5/n_used) over { "1" }), derefter stiger til et loft på { "15" } point ved { "1.5" }, som geometrien alene ikke kan føre under det forringede bånd (loft, ende på rampen og gulv i [geometry]; ingen alarm); en klasse på hver fradragspost (geometri, miljø, uoverensstemmelse) med tab af lås for satellitter under { "15" } grader klassificeret som geometri, satellitter i sigte men ikke sporet klassificeret som miljø, og et fradrag for dårlig geometri, hvis angivne HDOP ligger uden for max({ "1.0" }, { "25" } % af den udledte HDOP) fra den angivne himmel, klassificeret som uoverensstemmelse

seg-6987737c5fe4 = Intern konsistens: klassifikationen kontrolleres mod de regler, den angiver, og mod håndudledte forhold på syntetiske redigeringer af den indcheckede demolog, og pins uden ændring fastholder outputtet fra { "0.35.0" }: ingen score ændres, medmindre geometrien er dårlig; labelen rapporteres altid. HVORFOR MODELLED: tærsklerne er valgt og ikke tilpasset (oprindelse i hver kørsels geometry_model; tallene fra IEC 61108-1 og GPS SPS som citeret, skal kontrolleres mod standardernes tekst), og der findes intet eksternt mærket datasæt med naturlig geometriforringelse mod angreb at validere klassifikationen mod. Den udledte DOP genbruger kernen orbit::dop, VALIDATED mod gnss_lib_py, hvis status denne række ikke låner. En klasse for geometri er en udtalelse om himlen og ikke et fund om, at intet angreb fandt sted

seg-540420863a5a = Udsendt ionosfæremodel (Klobuchar, IS-GPS-200)

seg-fd157c537502 = Klobuchars ionosfæriske gruppeforsinkelse på skrå for enkelt frekvens L1 ud fra de otte udsendte α/β-koefficienter

seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — uafhængig referenceimplementering kompileret fra kildekode; stemmer til < { "1e-4" } m

seg-0af6b1a073ce = Statistisk kerne for RAIM/ARAIM-integritet (χ²- / ikke-centrale χ²- / normalfordelinger)

seg-224a6c4200cd = Den fordelingskerne, som hvert beskyttelsesniveau hviler på: tærsklen for snapshot-fejldetektion χ²₁₋ₚfₐ(dof), ikke-centraliteten for udeblevet detektion pbias=√λ og multiplikatorerne K_fa/K_md/K_V for løsningsseparation

seg-03578217425f = SBAS-beskyttelsesniveau (DO-229E vægtet LS HPL/VPL)

seg-df640d6c7a5d = DO-229E Appendix J vægtede mindstekvadraters beskyttelsesniveauer: D=(GᵀWG)⁻¹ ud fra elevation/azimut pr. satellit og fejlbudget, hovedakse af den horisontale fejlellipse og vertikal σ, skaleret med de offentliggjorte K-faktorer

seg-39aed7b4bffd = RTKLIB SBAS-PL-fork — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, "DO-229D Appendix J"), kørt af rnx2rtkp -ws på reelle EGNOS GEO-PRN120-meddelelser + reel BUTE/Budapest RINEX; uafhængig implementering fra tredjepart, HPL stemmer til < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) bekræftede identisk konvention. Begge orakler runder K_V→{ "5.33" } mod Kshanas eksakte Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } (~{ "0.06" } %), så den vertikale kontrolleres som det K-faktorfri d_U

seg-8f32eb9c8167 = Evalueringsmål for ML-detektorer (ROC/AUC/confusion/Pfa-Pmd)

seg-b0d8e1b45bf9 = AUC (Mann-Whitney, ties ½), confusion matrix ved tærskel, P_d/P_md/P_fa/precision/accuracy/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — uafhængigt bibliotek, eksakt overensstemmelse

seg-e7af87ce5e72 = Scoring af anomalidetektion på reel rumfartøjstelemetri

seg-9659b33fca5b = ROC AUC + bootstrap-CI, der adskiller reelle mærkede anomalier; gennemsigtig detektor (gengiver labels)

seg-b4ed67ce7e7e = scikit-learn roc_auc_score på testopdelingen OPSSAT-AD (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — reel OPS-SAT-telemetri

seg-5c3f1057c6cc = Numeriske kerner til kvanteafvejning (NNLS / χ²-bånd / van-Loan Q)

seg-f82113ccb30b = NNLS-tilpasning af målt ADEV, χ²-konsistensbånd for NEES/NIS og urets diskrete processtøjskovarians efter van Loan (holdover-udløb) — afvejningsmotorens beregningsmæssige rygrad

seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q eksakt, χ² <{ "5e-4" } ved driftsfrihedsgrader. Kun kerner — tal for enheders ydeevne forbliver modelleret (næste række)

seg-6f3099e7562c = Geomagnetisk referencefelt (IGRF-14-syntese)

seg-e9534723cb34 = Syntese med kuglefunktioner af IGRF-14-hovedfeltet — komponenterne X/Y/Z/F, deklination og inklination — som fodrer laget for magnetisk anomali i alt-PNT

seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — IAGA-VMOD's IGRF-referenceimplementering i ren Python, der leveres med de officielle IGRF14.shc-koefficienter (IAGA 14. generation, Zenodo 10.5281/zenodo.14012302); en uafhængig kodebase fra tredjepart, der beregner det entydigt definerede IGRF-14-felt, stemmer over et globalt gitter

seg-cb3fea409de7 = Detektionsstatistik — gaussisk AUC og mindste detekterbare fejl

seg-ca677becb465 = Analytisk binormal ROC AUC = Φ(μ/(σ√{ "2" })) og den mindste detekterbare fejl σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), der ligger til grund for kvantefejl- og anomalidetektorerne

seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), begge BSD-3-Clause — uafhængige biblioteker, der beregner de samme entydigt definerede størrelser for gaussisk hale / AUC, stemmer til A&S-erf-gulvet (~{ "7e-8" }). Fordelen ved kvante mod klassisk, der er bygget oven på, forbliver MODELLED

seg-1ed12110fb74 = Kerne for rangstatistik (Kendall-τ / Dirichlet / percentil)

seg-0fb003404a5b = Kerner for rangkorrelation og resampling under studiet af beslutningsustabilitet for modstandsdygtighed: Kendall τ-b, Dirichlet-middelværdi, konkurrencerangering og percentil-konfidensintervaller

seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — uafhængige implementeringer (τ med merge-sort) af de entydigt definerede rangstatistikker, stemmer til { "1e-12" }. Studiet af beslutningsustabilitet, der er bygget på disse kerner, forbliver MODELLED

seg-fdd2ba203d5b = Kerne for udledning af prioriteter i MCDA (AHP-egenvektor / konsistensforhold)

seg-d01c155fbddf = Analytic Hierarchy Process-prioritetsvægte = normaliseret principal (Perron) egenvektor af en reciprok matrix med parvise sammenligninger ved potensiteration, med Saatys konsistensindeks / konsistensforhold og acceptgrænsen CR<{ "0.10" }

seg-d1947f2f2b3b = Saatys ({ "1980" }) kanoniske tabel for Random Index (RI({ "5" })={ "1.12" }) gengivet eksakt + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) som uafhængig egenløser, der beregner den samme entydigt definerede Perron-egenvektor/-egenværdi, stemmer til <{ "1e-9" }. Beslutningslaget med Pareto / følsomhed / MAUT, der er bygget på denne kerne, forbliver MODELLED (aggregatorerne WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE er separat eksternt valideret — se rækkerne nedenfor)

seg-73e933220afb = Kerner for vægtet aggregering i MCDA (WSM / WPM)

seg-c436cdc991a2 = Weighted Sum Model (additivt aggregat med min–max-normalisering + rangering) og Weighted Product Model (multiplikativt aggregat med sumnormalisering og reciprok for omkostning) — de to scorere for værdiaggregering i afvejningsstudier

seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — et uafhængigt, udbredt MCDA-bibliotek i Python fra tredjepart, der beregner de samme entydigt definerede vægtede aggregater; stemmer til <{ "1e-9" }. Kan genskabes offline via tests/fixtures/mcda_wsm/ og tests/fixtures/mcda_wpm/. Garbage in, garbage out på inputtene; laget for følsomhed/robusthed forbliver MODELLED

seg-f00bdb66a052 = MCDA-rangering efter afstand til idealet (TOPSIS)

seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — min–max-normalisering, vægtede positive/negative idealløsninger, relativ nærhed Cᵢ = d⁻/(d⁺+d⁻) og rangering

seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — et uafhængigt MCDA-bibliotek fra tredjepart, der beregner de samme entydigt definerede nærhedskoefficienter; stemmer til <{ "1e-9" }. Kan genskabes offline via tests/fixtures/mcda_topsis/generate_topsis_reference.py

seg-ef33d848c985 = MCDA-kompromisrangering (VIKOR)

seg-cf879fb770f2 = VlseKriterijumska Optimizacija — gruppenytte Sᵢ, individuel fortrydelse Rᵢ og kompromisindekset Qᵢ ved strategivægt v={ "0.5" }, med rangering hvor lavere er bedre

seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — et uafhængigt MCDA-bibliotek fra tredjepart, der beregner den samme entydigt definerede områdenormaliserede S/R/Q-aggregering; stemmer til <{ "1e-9" }. Kan genskabes offline via tests/fixtures/mcda_vikor/generate_vikor_reference.py

seg-790176ba8196 = MCDA-rangering efter outranking-nettostrøm (PROMETHEE II)

seg-b25cedf6da6e = Preference Ranking Organization METHod — parvist præferenceindeks med de seks standardformer for generaliserede kriterier, positive/negative outranking-strømme og den fuldstændige nettostrømsrangering (det sædvanlige kriterium validated)

seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — et uafhængigt MCDA-bibliotek fra tredjepart, der beregner den samme entydigt definerede netto-outranking-strøm; stemmer til <{ "1e-9" }. Kan genskabes offline via tests/fixtures/mcda_promethee/generate_promethee_reference.py. De præferenceformer, der bruger tærskler (q/p/σ), reducerer til den samme algebra for generaliserede kriterier og kontrolleres fortsat på deres egenskaber

seg-72248291c388 = MCDA-valgkerne efter outranking (ELECTRE I)

seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — konkordans-/diskordansmatricer, dominansrelationen med konkordans og ikke-veto og valgkernen efter outranking (konvention med udelukkende gevinstkriterier, summenormaliserede vægte og én fælles global skala)

seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — et uafhængigt beslutningsbibliotek med flere kriterier fra tredjepart, der beregner den samme entydigt definerede konkordans/diskordans/dominans/kerne; stemmer element for element til <{ "1e-9" }. Kan genskabes offline via tests/fixtures/mcda_electre/generate_electre_reference.py. Valget af ĉ/d̂-tærsklerne er input fra analytikeren (følsomheden forbliver MODELLED)

seg-95942c6a2689 = MCDA-aggregeringskerner (WASPAS / MOORA)

seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (lineært normaliseret konveks blanding λ·WSM+({ "1" }−λ)·WPM ved λ={ "0.5" }) og MOORA-kvotientsystemet (vektornormaliseret vægtet gevinstsum minus vægtet omkostningssum) — den stabilitetshærdede værdiblanding og den fortegnsbærende kvotientsystem-scorer

seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA-kvotientsystem, vektornormalisering) — et uafhængigt, meget udbredt Python-MCDA-bibliotek fra tredjepart, der beregner de samme entydigt definerede aggregater; stemmer til <{ "1e-9" }. Kan genskabes offline via tests/fixtures/mcda_waspas/ og tests/fixtures/mcda_moora/. Garbage in, garbage out for inputtene; laget for følsomhed og robusthed forbliver MODELLED

seg-7de67fedc1da = MCDA-proportional rangering (COPRAS)

seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — søjlesumnormaliseret gevinstbetydning S⁺ plus leddet for omvendt omkostningsbetydning, den relative betydning Q og nyttegraden U = Q/max Q (bedste alternativ = { "1" })

seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — et uafhængigt MCDA-bibliotek fra tredjepart, der beregner den samme entydigt definerede relative betydning/nytte i COPRAS. pyDecision er valgt bevidst: COPRAS i pymcdm { "1.4.0" } kollapser algebraisk til det trivielle S⁺+S⁻ og er ikke en tro reference, mens pyDecision implementerer den kanoniske Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Stemmer til <{ "1e-9" }; kan genskabes offline via tests/fixtures/mcda_copras/generate_copras_reference.py

seg-bdb2917a2520 = CUSUM: detektionsforsinkelse og ARL

seg-302f5db625df = Tabulær CUSUM-detektors værste-tilfælde-detektionsforsinkelse (⌊h/(z−k)⌋+{ "1" }) og gennemsnitlig run-længde uden for kontrol, brugt af tidssynkroniseringens beskyttelsesniveau og af spoof-monitorerne

seg-691a506ce13f = Publiceret tabulær CUSUM-ARL: Siegmunds ({ "1985" }) approksimation med brownsk bevægelse (Hawkins & Olwell { "1998" }, lign. { "3.7" }) krydsforankret til ARL-tabellerne i Montgomery, Introduction to Statistical Quality Control (Wiley) for k=½, h∈{ "{" }{ "4,5" }{ "}" }; den deterministiske forsinkelse stemmer eksakt med en første-passage-reference. Den sammensatte TPL-grænse forbliver MODELLED

seg-d923a77bd31a = Varians ved udløb af ur i holdover og inversion til tærskel

seg-4fafaf5f919d = Vækst i faseforskellens varians under udløb q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 og dens monotone inversion til en holdover-tærskel for tidsfejl

seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm beregner Van-Loan-processtøjen { "1978" } i diskret form Q₀₀ = ∫₀ᵗ ΦQcΦᵀds ved Padé-skalering med kvadrering på den udvidede { "6" }×{ "6" }-matrix — en uafhængig vej, der aldrig ser kshanas polynomiekoefficienter; plus optimize.brentq, der inverterer den samme monotone kurve i forhold til kshanas bisektion. Tallene for rødstøjsgulvet i hver klasse (ClockClass) forbliver MODELLED

seg-eb3cd9e92d8d = Diversitetskerne efter omvendt Simpson

seg-244d57819f2b = Effektiv arkitektonisk diversitet = omvendt Simpson / Hill-tal af orden 2, 1/Σpᵢ², over kildekvaliteterne i hver uafhængighedsgruppe (diversitetsleddet i robusthedsscoren)

seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — et uafhængigt bibliotek fra tredjepart, der beregner det entydigt definerede omvendte Simpson-indeks; gengivet byte for byte. DHS-RPCF-scoringsrammen (vægte/niveauer), der er bygget ovenpå, forbliver MODELLED

seg-c14b8fe46517 = Azimutafhængig horisontmaske: synligt sæt, azimut og elevation samt DOP under masken

seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: den geodætiske (WGS-84) azimut og elevation af en satellit fra et jordsted, en azimut/elevation-maskestabel lineært interpoleret i azimut med omslag ved { "360" } deg, det synlige sæt el >= max(mask_deg, mask(az)) og DOP med fælles ur samt ENU-og-ur-kofaktormatricen for det sæt (kernen bag orbit::dop). Det er sådan, sektionen [skyline] afgør synlighed i typerne gnss-sim, jamming, leo-pvt, leo-pass og nmea-scenario og, med jordstedet user_site, i orbit og integrity

seg-bbb1828b3db1 = Reduktion af gadekløft, sektorer og terræn til en tabel

seg-2864aec7be88 = skyline: gadekløften på lukket form (afskæring atan((h - a) / d) med d = (w/2) / abs(sin(az - s)), åbne ender for en endelig længde), skarpkantede sektorer med uret med omslag og terrænpunkter reduceret til en tabel med krumningsfaldet d^2/({ "2" } * 4/3 R); horisontlinjen er deres punktvise maksimum med enhver tabel

seg-50f1df206b30 = Internt: de lukkede former kontrolleres mod håndberegnede værdier (murkronernes elevationer i en angivet gade, betingelsen for åben ende, krumningsfaldet for et angivet punkt). Ingen ekstern uafhængig reference: udformningsnotatet afgrænser disse reduktioner som MODELLED, og Orekits ElevationMask tager en tabel, så sammenligningen i rækken 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' læser deres tabeller med 360 punkter som input og kontrollerer dem ikke

seg-3f3d657854ce = Forudindstillinger for horisonten (bygade, havneindsejling, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: fire REPRESENTATIVE geometrier med udformningsnotatets angivne dimensioner og en linje om oprindelse for hver: city-street (en kløft, gade { "0" } deg, { "20" } m mellem { "30" } m høje mure, antenne { "1.5" } m), harbour-approach (sektorer: åben mod havet over { "180" } deg, kajbygninger { "8" } deg over { "90" } deg, bølgebryderen { "3" } deg), fjord (terræn: vægge { "600" } m over antennen i { "1.5" } km afstand på hver side af en nord-syd-gående rende, krumningsfald anvendt), container-terminal (sektorer: stakke { "12" } deg over den landvendte halvdel, kranarme { "35" } deg og { "25" } deg over to smalle sektorer); kan tilsidesættes felt for felt

seg-44ae9b6289d9 = Ingen: valgte og angivne dimensioner, ikke en opmåling af nogen gade, havn, fjord eller terminal (gadens højde-bredde-forhold ligger inden for båndet 0.5-2 hos Oke ({ "1988" }); fjorden er af størrelsesordenen de vestnorske fjorde; stakkene bruger ISO { "668" }-højden for high-cube). Testen kontrollerer forudindstillingerne mod deres egne angivne dimensioner, en transskriptionskontrol, som valideringsreglen ikke tæller med

seg-2c53381d48ae = Horisontal fejlellipse og kofaktor for hvert system ud fra geometriens kovarians

seg-15fea5c05cbd = geometry::sky_geometry: ENU-og-ur-kofaktoren (H^T H)^-1 med ét modtagerur til fælles eller ét pr. system (kernen orbit::cofactor_from_los) og den horisontale fejlellipse ud fra dens øst-nord-blok (halvakser k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), storaksens azimut fra nord)

seg-6012113b4836 = Funktioner for himmelgeometri: synlighed, DOP, kovarians, fejlellipse, Monte Carlo-sky

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> og <c2/>, Python- og WASM-funktioner med de samme navne, MCP <c3/>): ud fra et sted, et tidspunkt og konstellationsforudindstillinger (eller satellitter som azimut/elevation eller ECEF) fås de synlige og maskerede satellitter under en horisont, GDOP/PDOP/HDOP/VDOP/TDOP, enhedsvariansens kofaktor (H^T H)^-1 og kovariansen i øst-nord-op med ét modtagerur pr. system eller ét til fælles, den horisontale fejlellipse (halvakser k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientering { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) fra nord) og n seedede mindste kvadraters fejl under uafhængige gaussiske afstandsfejl med deres empiriske kovarians, RMS og { "95" } % indeslutning. Kofaktoren er orbit::cofactor_from_los, den ene kerne bag orbit::dop og orbit::dop_cov (dop er dop_covs reduktion): ingen anden DOP-implementering

seg-aa0da1028636 = DOP-faktorerne for ét ur hviler på kernen, der er valideret mod gnss_lib_py { "1.0.4" } (rækken 'GNSS geometry / dilution of precision (DOP)'); denne rækkes egne kontroller er interne: sky_geometry gengiver orbit::dop og dop_cov på den samme geometri, ellipsen gengiver en analytisk 2x2-egenværdinedbrydning, ECEF- og azimut/elevation-inputs stemmer overens, og den seedede skys RMS og { "95" } % indeslutning stemmer med geometrien. ENU-kovariansen med ét ur pr. system og ellipsen er VALIDATED i rækken 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); det, der forbliver MODELLED her, er sammensætningen: forudindstillingernes propagering til en repræsentativ himmel, Monte Carlo-skyen (kontrolleret mod den geometri, den udtrækker fra, en selvkonsistenskontrol) og fladerne. Konstellationsforudindstillingerne giver en repræsentativ himmel, ikke en dateret; den gaussiske fejlmodel og UERE er angivne inputs, ikke en målt nøjagtighed eller en integritetsgrænse

seg-7f66be0f15c8 = Urets holdover uden GNSS

seg-4d8f87668a0f = Vækst i udløbsfejl på lukket form + holdover til tærskel; kvanteurklasser

seg-2d260626e3d2 = Rekursion af clock_state-kovariansen i flere trin (krydstjek i samme kodebase); den underliggende kerne for udløbsvarians og holdover-inversion er valideret eksternt mod scipy (se 'Clock-holdover coast-variance & threshold inversion'). Tallene for holdover ved rødstøjsgulvet i hver klasse forbliver MODELLED

seg-29b482d88916 = Målte enhedskort for ur (forudsigelse på tilbageholdte data)

seg-8c68c5b25004 = clock_library: et enhedskort (hvid fase, hvid, flicker og random-walk FM plus en lineær frekvensdrift) tilpasset en tredjedel af en navngiven målt urregistrering efter en logget konditioneringsrunde (huller, faseafvigere, fasespring og bursts fjernet; frekvensspring logget), vægtet med de frihedsgrader for støjtypen, der er identificeret ved lag 1, og dets forudsagte Allan-deviation bedømt på de tilbageholdte to tredjedele; læsere til RINEX- og IGS-urfiler, BIPM-filer for hvert laboratorium og Circular T afsnit { "1" }; omregning af et kort til støjmodellen for slot-tidssynkronisering, den udvidede Kalman-urmodel og spoofing-monitorens støjniveauer

seg-5097a0e6460d = Målte urkort for GPS Block IIF med led pr. omløb (forudsigelse på tilbageholdte data)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: et enhedskort med faseled på en til fire gange pr. omløb (periode T/k, T = { "43 082.05" } s), tilpasset samlet med det kvadratiske led ved mindste kvadrater på en tredjedel af en målt satellituregistrering, med hvert leds Allan-bidrag på lukket form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } i den forudsagte Allan-deviation

seg-0d72fcc0fbea = Tilstandsestimering af ur om bord

seg-6db5391f8ebe = Kalman-ur med 3 tilstande (fase/frekvens/drift) efter van Loan, Joseph-stabiliseret

seg-3f0a9d7c2971 = Fejlbudgettering for tidsoverførsel

seg-216f46b43860 = To-vejs/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→afstand

seg-e7b6aac2ec58 = Sagnac-størrelsen er kontrolleret mod en autoritativ PUBLICERET VÆRDI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), lign. { "1.29" }: en omsejling mod øst langs ækvator opsamler { "207.4" } ns (2ωA_E/c²); kshana gengiver { "207.386" } ns. Uafhængigt underbygget af RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometri. Det sammensatte BIPM TWSTFT-budget for transponder/common-view/PPP har ingen ekstern uafhængig reference, så funktionen forbliver modelleret

seg-157fadeb5d67 = Modulation af navigationssignaler og analyse af kodesporing

seg-ab633d191396 = BPSK-R/BOC PSD, spektral adskillelse κ, Gabor-båndbredde, DLL-jitter, multipath

seg-589e0053e3e8 = Generering af GPS L1 C/A-spredningskode

seg-782d4da75b59 = G1/G2 LFSR C/A-kodegenerator, der gengiver de oktale verifikationsvektorer for de første 10 chips i IS-GPS-200 for PRN { "1" }–{ "9" } (plus længden 1023 chips, balancen med 512 ettaller og den treværdige periodiske autokorrelation)

seg-473f24d4e06a = IS-GPS-200 tabel 3-Ia 'Code Phase Assignments' — de autoritative, offentligt tilgængelige (public domain, amerikanske myndigheder) oktale verifikationsvektorer for de første 10 chips (GPS Directorate, navcen.uscg.gov); kshanas egen G1/G2 LFSR genskaber hver vektor for PRN { "1" }–{ "9" } eksakt. De efterfølgende lukkede former for modulation/SSC/DLL forbliver modelleret (separat række)

seg-e6c08e1e6ae3 = Ydeevne for kvanteinertisensor

seg-d28e1f6a430f = Accelerometer med kolde atomer og interferometri ud fra første principper (k_eff·T², QPN)

seg-4b79d03cecf5 = Kvanteinertisensorens fringe-flertydighed / dynamikområde

seg-deb2850546d5 = Mach–Zehnder-dynamikområde for fringe-flertydighed: den 2π-periodiske fringe-aflæsning fastsætter en maksimal utvetydig specifik kraft a_max=π/(k_eff·T²), og det utvetydige område i opløsningsceller a_max/σ_a=π/σ_Φ er uafhængigt af den optiske skalafaktor — T²-følsomhedsgevinsten koster utvetydigt område i nøjagtigt samme takt (interrogationstiden bytter opløsning for område, så antallet af celler ligger fast ved aflæsningens fasestøj)

seg-7603ff7a7693 = Selvkonsistens i interferometerets fringe-model: halvfringe-kanten, den 2π-periodiske aliasstruktur og skalafaktorens ophævelse i forholdet mellem område og opløsning er algebraiske identiteter på lukket form, kontrolleret mod motorens egne Mach–Zehnder-fase- og følsomhedsfunktioner — kontroller af intern konsistens, IKKE et eksternt datasæt, så rækken forbliver InternalConsistency. MODELLED ideel fringe-flertydighed med tre pulser; ingen grænser for bølgefrontsaberration eller kontrasttab på det utvetydige område

seg-d04bf321d4a1 = Robusthed af kvanteinertisk dødregning

seg-c4989abb5d40 = Sammensat positionsbudget over holdover med bias + skalafaktor + VRW + stabilitetsaftagen

seg-bfe4085115c1 = Uafhængig numpy-Monte Carlo-SDE-integration af dobbeltintegreret hvid accelerationsstøj (validerer den analytiske VRW-varians med en reelt uafhængig algoritme) + et publiceret forankringspunkt hos Groves { "2013" } for led med bias/skalafaktor; CAI-enhedernes tal kvantificerer partnerens hardware og forbliver MODELLED

seg-bc6e733c39b3 = GNSS/INS-sensorfusion

seg-16514286bb51 = Fejltilstands-EKF med 15 tilstande, løst koblet (validated på en reel IMU/GNSS-kørsel mod NaveGo); en tæt koblet UKF på pseudoafstand/Doppler og et koblet filter for ur og position (kun konsistens, uden for den validerede påstand)

seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, kørt som værktøj under GNU Octave, aldrig linket): dets løst koblede ins_gnss på dets egen reelle Ekinox IMU/GNSS-kørsel med landkøretøj, begge løsninger bedømt mod Ekinox-referencebanen. Begge filtre læser det samme { "20" } Hz float32-input, og Kshanas konfiguration er afbildet mekanisk fra datasættets publicerede parametre. Kshanas horisontale og vertikale positions-RMS og dens RMS for positionsinnovation ligger inden for 1.2x af NaveGos (målt { "0.912" }, { "0.940" } og { "0.861" }), og dens gennemsnitlige normaliserede innovation er højst { "1.5" } (målt { "0.395" }: omkring 2.5x for lidt tillid, givet datasættets angivne GNSS-sigmaer); tolerancer fastsat før sammenligningen. Omfang: GNSS er til stede ved { "5" } Hz under hele kørslen, så ingen udfald eller udløb afprøves, og kontrollen fanger grove filterfejl frem for finjustering (råpositioner korrigeret for lever-arm ville lande nær den vertikale tærskel); lever-arm-transformationen beregnes i testharnessen. Den tæt koblede UKF og det koblede filter for ur og position beholder deres filterpy { "1.4.5" }-konsistenskontroller (lineære posteriorer til { "2.4e-12" }) og forbliver uden for den validerede påstand

seg-5692c7b936b6 = Robusthed over for jamming uden GNSS

seg-f4ff77caa47b = Geometrisk J/S-linkbudget, anti-jam C/N₀, tab af lås pr. satellit

seg-ff90679d1de9 = Detektion af spoofing

seg-b843f63e77e6 = Urstøttet χ², RAIM, AGC og SQM, fusioneret til et sikkerhedskvalitetsmål for hver epoke

seg-b10d07921f5e = Beskyttelsesniveau for tidssynkronisering under spoofing

seg-2a829711b997 = Grænse på lukket form for den værste uopdagede tidsfejl = monitorens gulv + oscillatorens udløbs-σ over CUSUM-detektionsforsinkelsen, rapporteret som et bånd for rødstøjsgulvet

seg-0ec37553bbc4 = Missionsanalyse for det cislunare rum

seg-a47465f682ba = CR3BP STM + differentiel korrektor med enkeltskydning; L2 sydlig NRHO

seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; Jord–Måne L2 sydlig halo-familie, metode efter Howell/Davis) — eksternt publiceret periode T, Jacobi C og begyndelsesbetingelser for vinkelret krydsning; kshanas STM-korrektor med enkeltskydning, sat i gang med katalogets begyndelsesbetingelser og forstyrret, konvergerer tilbage på katalogets medlemmer

seg-f1d49eac89f8 = Alternativ / supplerende PNT

seg-023dda973f66 = Tyngdekortmatchning, terrænreferencebaseret (TERCOM/SITAN), magnetisk anomali

seg-da869d48e505 = IGRF-14-koefficienter; matched-filter-CRLB ud fra første principper. Marken i tyngdebenchmarken med reelle felter er kontrolleret eksternt (rækken 'Gravity-anomaly synthesis from a spherical-harmonic model'), men dens navigationsresultat har ingen ekstern uafhængig reference

seg-db7767ab661d = Syntese af tyngdeanomalier ud fra en kuglefunktionsmodel

seg-2db367c4a473 = Tyngdeanomali i sfærisk approksimation (Barthelmes STR09/02 lign. { "126" }, ICGEM gravity_anomaly_sa) ud fra fuldt normaliserede koefficienter mod en niveauellipsoide på lukket form (WGS84/GRS80), med leddet af grad nul, gittersat til tyngdekortmatcheren

seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), en uafhængig implementering: EGM2008 afkortet ved grad { "70" }, gravity_anomaly_sa, WGS84, tidevandsfri, led af grad nul, h = { "0" }. Tjenestens output bærer ingen udtrykkelig licens, så gitrene hentes på testtidspunktet med en fastlåst SHA-256 (tools/fetch_icgem_grid.sh), og kun ti værdier citeres med kildeangivelse

seg-31f51d4998cb = SRTM-læser for digitale højdemodeller på reelt terræn

seg-08ea4ae0b671 = Håndskrevet SRTM .hgt-parser (16 bit big-endian, nordlig række først, tomrumsbevidst) + bilineær sampler, der læser en reel højdemodelflise i public domain og løser en dokumenteret opmålingsbenchmark

seg-aae487789add = NASA/USGS SRTM v3 (1 buesekund) N36W117-flise — højdedata i PUBLIC DOMAIN fra amerikanske myndigheder, fra det åbne AWS-spejl elevation-tiles-prod, decimeret til 6 buesekunder og committet under tests/fixtures/terrain/ (se NOTICE.md), plus udsnit i fuld opløsning af N36W117 og N36W119, krydskontrolleret knude for knude mod GDAL's uafhængige SRTMHGT-læser og opmålingsbenchmarkene Mount Whitney ({ "4421" } m) og Badwater (−{ "86" } m). Den dokumenterede benchmark for Badwater Basin (−{ "86" } m, det laveste punkt i Nordamerika) forankrer den georefererede aflæsning. Terrænmatchningen/TERCOM-navigationspositionen, der bruger højdemodellen, forbliver modelleret (separat række om Alternativ/supplerende PNT)

seg-791e7285c291 = Reproducerbarhed og softwaresikring

seg-7177355a482c = Deterministisk, scenariehashet, SBOM + golden-gates på tværs af platforme

seg-6cf9d570cc51 = SBOM'en kontrolleres mod det officielle CycloneDX { "1.5" } JSON Schema (+ gyldige SPDX-identifikatorer) — en ekstern publiceret standard, ingen valideringsfejl over hele afhængighedsgrafen; delen om determinisme i FoM og byte-reproducerbarhed forbliver en fastlåst selvkonsistenskontrol, så rækken forbliver MODELLED

seg-89b2114542bb = Evaluering af AI/ML-detektion af RF-forstyrrelser ({ "13494" })

seg-241f2eeaef12 = Mærket syntetisk forstyrrelseskorpus + detektoragnostisk ROC/AUC/forvirringsmatrix/Pfa-Pmd-harness; lækagebeskyttelse, stratificeret opdeling, optimismerapport om fordelingsskift (inden for vs. uden for regime). Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/impairment-eval.toml)

seg-72a3c97ef04b = AUC-grænser på lukket form (Mann–Whitney) + en perfekt detektor som uafhængig reference; korpusset er SYNTETISK (parameterbaseret, ikke felt/IQ)

seg-c38ebee794b3 = Undersøgelse af optimismegab ved AI/ML-detektion af RF-forstyrrelser og en gabforudsigelse med kun ID

seg-642087659fda = Kontrolleret syntetisk undersøgelse af optimismegabet i AUC fra distribution til uden for distribution på tværs af publicerede metoder og indlærte detektorer (logistisk regression / MLP med ét skjult lag): tendenser i skaleringslove pr. klasse (Spearman ρ + hældning på { "1" }−alvorlighed) og en ridge-forudsigelse med kun ID, der estimerer gabet alene ud fra diagnostik inden for distributionen, bedømt ved udeladelse af én detektor ad gangen og én klasse ad gangen. Kan gengives via <c1/>

seg-c46973920f5b = Håndafledte statistikker mod lukkede former (binormal AUC Φ(d'/√{ "2" }), DeLong-varians, Spearman med bundne rang, eksakt OLS-genfinding) + leave-one-out-krydsvalidering mod baseline, der forudsiger middelværdien. Korpusset er SYNTETISK (parameterbaseret, aldrig felt/IQ), og optimismegabet er et skift i alvorlighed fra syntetisk til syntetisk, IKKE et resultat fra simulering til felt

seg-fd6424213d1f = Afvejning mellem kvante og klassisk PNT og robusthed uden GNSS ({ "13503" })

seg-21b2b54200a8 = Indlæsning af målt ADEV (NNLS), afvejningstabel (holdover for tidssynkronisering/inerti + gevinst), robusthed-over-tid-kurve; forbeholdet om gulvet følger med artefaktet. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/quantum-trade.toml)

seg-37d11937c966 = Kernen for tilpasning af målt ADEV→PSD (NNLS) stemmer med scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — en uafhængig ekstern kerne; men TALLENE i afvejningen kvantificerer (validerer aldrig) et partnerur/CAI, så selve afvejningen forbliver MODELLED, uden validerings-glorie

seg-1fa865bfddd1 = Rumvejrsmiljø og aktivitetsdrevet termosfærisk massefylde

seg-47308f611c7e = Sol-/geomagnetiske indekser (definitorisk Kp↔ap-tabel), Jacchia-1971-eksosfæretemperaturen og Jacchia { "1971" }-termosfæremassefylden (SAO Special Report { "332" }: statiske diffusionsprofiler, der gengiver dens tabel { "7" }, med døgn-, geomagnetiske, halvårlige, sæsonbestemte breddegrads- og heliumvariationer) mod den statiske USSA76-atmosfære. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/space-weather.toml)

seg-29bedb28c34f = CCSDS OEM-interoperabilitet (import af GMAT/Orekit/STK-efemerider)

seg-edb58ffbbb5b = CCSDS { "502.0" } OEM-importør (parse_oem), tolerant over for COMMENT-linjer / ekstra metadatanøgleord / kovariansblokke og den eksakte inverse af skriveren; rundtur + indlæsning af ekstern fil med en hastighedskonsistenskontrol. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/oem-interop.toml)

seg-c76b8c395ef0 = Opsendelsesvindue og stigningsgeometri (missionsanalyse)

seg-6066c634faba = Opsendelsesazimut(er) for to legemer (sin Az = cos i / cos lat), mindste opnåelige inklination, cirkulær hastighed, jordrotationens bonus mod øst, Δv for dogleg-planændring og daglige muligheder og, givet en epoke og IERS finals2000A-rækker, stedets hastighed om den sande pol (launch::site_rotation_speed_at). Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistisk indflyvningskorridor ved genindtræden (Allen–Eggers)

seg-c3f3422f96e4 = Maksimal deceleration (uafhængig af den ballistiske koefficient), hastighed + højde ved maksimal g og hastighed ved maksimal opvarmning for en ballistisk indtræden i en eksponentiel atmosfære. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/reentry.toml)

seg-8c10b50407d3 = Fodaftryk og dækningsgeometri for EO-nyttelast

seg-45c1e799c87c = SMAD-rumtrekantgeometri: Jordens vinkelradius, svathbredde, GSD i nadir, maksimal off-nadir-adgang og cirkulær periode, plus den første-ordens J2-nodeperiode (eo_payload::j2_nodal_period) og afstanden mellem jordspor ved ækvator R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) med et flag for sammenhængende dækning, for en banehøjde, inklination og sensor-FOV/IFOV. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/eo-coverage.toml); dens standardinklination er den solsynkrone fra eo_payload::sun_synchronous_inclination, en bekvemmelighedsstandard, som ikke er en del af den validerede påstand

seg-940692c550f3 = CCSDS Space Packet ({ "133.0" }) TM/TC-indramning

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet primær header, kodning/afkodning (version/type/sek.-header/APID/sekv.-flag/tæller/datalængde) + et indramningsscenarie. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/space-packet.toml)

seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — en uafhængig implementering af CCSDS 133.0-B-2 fra tredjepart; kshanas encode_packet/decode_packet stemte byte for byte (den primære header på 6 oktetter for { "33" } tilfælde + den fuldt kodede pakke for { "12" })

seg-5510c82f671a = CCSDS Space Packet sekundær header, pakkefejlkontrol og segmentering

seg-7503bf761df9 = CCSDS 133.0-B-2 Space Packet-udvidelser ved siden af den primære header: en sekundær header, der bærer en CCSDS 301.0-B-tidskode (CUC eller CDS, eksplicit eller implicit P-felt) og supplerende data, CRC-16-feltet til pakkefejlkontrol, segmentering af en stor brugerdataenhed og dens genopsamling, strømafkodning med kontrol af huller og rækkefølge i sekvensen og PUS-TM-pakker. Outputtet for den primære header er byte-identisk med tidligere

seg-7c61da52b8f8 = Eksport til SPICE SPK (typerne { "9" } og { "13" })

seg-582ce23522f6 = Skriver og læser til NAIF SPICE SPK-kerner af typerne { "9" } (Lagrange, ulige tidsskridt) og { "13" } (Hermite, ulige tidsskridt), med DAF-layout, segmentbeskrivere og epokekataloger, og eksport af en CCSDS OEM til en SPK-kerne (UTC- eller TDB-epoker til efemeridetid)

seg-d699104fc2af = SPICE SPK-typerne { "3" } og { "21" } (Chebyshev, udvidede differenslinjer)

seg-7d3e8b5b40af = Skriver og læser til NAIF SPICE SPK-segmenter af type { "3" } (Chebyshev-polynomier for position og hastighed over faste intervaller, grad { "0" } til { "27" }) og type { "21" } (udvidede modificerede differensarrays, differenslinjerne i JPL's integratorer, MAXDIM { "15" } til { "25" }), ud fra givne poster, i filer der også rummer segmenter af type { "9" } og { "13" }; valg af poster og evaluering i rækkefølgen i SPICE's læsere. Kshana tilpasser ikke Chebyshev-koefficienter og frembringer ikke differenslinjer

seg-39517faae95c = CCSDS Attitude Data Messages (AEM, APM)

seg-f88f6ea002c8 = Skriver og læser til CCSDS 504.0-B-2 Attitude Data Messages i KVN og NDM/XML: AEM version { "2.0" } (og { "1.0" } i KVN, med dens ATTITUDE_DIR, QUATERNION_TYPE og numeriske rotationssekvenser) med attitudetyper for kvaternion, Euler-vinkler og spin og deres varianter for afledt, vinkelhastighed og nutation, flere segmenter; APM version { "2.0" } med blokke for kvaternion, Euler, vinkelhastighed, spin, inerti og manøvre; A-til-B-kvaternionen for en post (504.0-B-2 bilag F)

seg-5f26f879037e = CCSDS Orbit Data Messages (OPM, OMM, OCM)

seg-eaddfd311fea = Skriver og læser til CCSDS 502.0-B-3 Orbit Data Messages i KVN og NDM/XML: OPM { "3.0" } og { "2.0" } (tilstandsvektor, oskulerende Kepler-elementer, rumfartøjsparametre, kovarians, manøvrer, brugerdefinerede parametre), OMM { "3.0" } og { "2.0" } (middelelementer efter middelbevægelse eller halv storakse, TLE-relaterede parametre med BSTAR eller BTERM og AGOM, kovarians) og OCM { "3.0" } med bane (CARTP, CARTPV, CARTPVA; absolutte eller relative epoker), fysiske egenskaber, kovarians (CARTP, CARTPV i LTM-rækkefølge), manøvre og brugerdefinerede blokke; en OMM i fuld præcision fra et SGP4-elementsæt ved siden af den uændrede OmmFile::to_omm_kvn

seg-1e5ea1d9918d = Budget for attitude og pejlefejl med 3 frihedsgrader (AOCS)

seg-21f2f8efcf19 = Værste-tilfælde-forstyrrelsesmoment fra tyngdegradienten ((3/2)(μ/R³)ΔI) som toppen over attituden (den validerede påstand), plus et RSS-budget for pejlefejl over navngivne bidrag på 1σ med det dominerende led (en kvadratsum af tal leveret af kalderen, uden for den validerede påstand). Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/attitude-budget.toml)

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), en uafhængig C++-implementering af det fulde tensormoment fra tyngdegradienten: Kshanas top (3/2)(μ/R³)ΔI er lig med Basilisks moment ved attituden på { "45" } deg inden for { "1e-12" } relativt (værst { "2.1e-15" }) over { "5" } højder og { "8" } inertitensorer, og afgrænser Basilisks moment over { "2000" } tilfældige attituder pr. tilfælde; tolerance fastsat før sammenligningen. Validerede påstand: toppen af tyngdegradientmomentet. RSS-pejlebudgettet er en kvadratsum af tal leveret af kalderen uden ekstern sandhed og forbliver uden for den; den håndkodede maksimering af det fulde tensormoment i Hipparchus bliver stående som understøttende selvkonsistens. Ingen simulering af reguleringssløjfe/6-DoF/fleksible modes

seg-1461aa14a7ff = Forudsigelse af jordstationspas (jordsegment)

seg-e1cf1ec4f005 = Synlighedspas i tidsdomænet (AOS/TCA/LOS, maksimal elevation, varighed) for en motorpropagator over en station over en elevationsmaske, med interpolerede opgangs-/nedgangskrydsninger og samlet adgang: passes::predict_passes, den geometriske planlægger (ingen refraktion eller lystid). Scenarietypen <c1/> kører den tilsyneladende forudsigelse fra rækken 'Apparent ground-station pass prediction with refraction and light time'

seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — et uafhængigt bibliotek for flyvedynamik: ElevationDetector (Brent-rodfinder) + EventsLogger over en ITRF-efemeride, station som en WGS-84 TopocentricFrame. AOS/LOS/maksimal elevation/antal pas/samlet adgang stemmer ved identisk bane+station+maske+vindue (committet fixture; driver xval/orekit-passes)

seg-1dd8b2655b18 = Tilsyneladende forudsigelse af jordstationspas med refraktion og lystid

seg-46f93d3c24d2 = Synlighedspas (AOS, TCA, LOS, maksimal tilsyneladende elevation, varighed) for et SGP4-elementsæt over en WGS-84-station på den validerede jordbanevej (IAU 2006/2000A, valgfrie parametre for jordens orientering), med troposfærisk refraktion efter ITU-R P.834-9 (ligning { "9" } til { "14" }, anbefalingens trykte koefficienter) og nedlinkets lystid, hver for sig til at slå til og fra; krydsninger løst ved bisektion til { "1e-7" } s og kulminationen ved gyldent-snit-søgning. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/passes.toml), begge korrektioner slået til som standard

seg-7b4a8e25c3c9 = Adaptiv kodning og modulation efter DVB-S2 langs et LEO-nedlinkspas

seg-3912fb8ccb15 = Nedlinks Es/N0 langs hvert pas for én satellit over én station (EIRP, fririumstab, atmosfærisk tab efter cosekanslov, andre tab, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2 MODCOD, der klarer sin kvasifejlfri tærskel i ETSI EN { "302" } 307-1 V1.4.1 tabel { "13" } plus en implementeringsmargen ved hvert trin, passets ACM-datavolumen og baseline med konstant kodning, der lukker ved masken og den længste afstand. Kan køres som scenarietypen <c1/>. Illustrative inputs; MODELLED.

seg-a7f26e3a6030 = Intern konsistens: den spektrale effektivitet beregnet på lukket form ud fra K_bch i tabel 5a og rammelængderne stemmer med de effektiviteter, tabel { "13" } trykker (en transskriptionskontrol af tærsklernes tabel); linkbudgettets dele stemmer med deres lukkede former; valget er monotont i Es/N0 og overholder marginen; ACM flytter mindst den konstante kodnings volumen. Passets geometri kommer fra den separat VALIDATED tilsyneladende pasforudsigelse. HVAD DER IKKE ER: intet eksternt værktøj eller målt link er sammenlignet; tærsklerne er standardens ideelle AWGN-værdier, ikke et modems; regndæmpning, pejletab langs passet og piloter er ikke modelleret.

seg-19603a7e0fe8 = Kontaktplanlægning for jordstationer med flere satellitter og flere stationer med løsning af konflikter

seg-40edeae6e48b = Kandidatkontakter ud fra hvert satellit-station-pas med dets ACM-datavolumen; konflikter hvor én antenne ville betjene to satellitter inden for sin vendetid, eller hvor én satellit ville sende ned til to stationer samtidig; et prioritetsvægtet leveringsmål med loft ved hver satellits efterslæb; en doven grådig plan efter marginalværdi, en først-til-mølle-baseline og en eksakt branch and bound på op til { "26" } kandidater, med den grådiges optimalitetsgab rapporteret. Kan køres som scenarietypen <c1/>. Illustrative inputs; MODELLED.

seg-bc520db98f9a = Intern konsistens: den eksakte branch and bound stemmer med brute-force-optælling på små tilfældige mængder, hver plan kontrolleres som mulig mod konfliktreglerne, og den grådige slår aldrig det eksakte optimum. HVAD DER IKKE ER: ingen ekstern planlægger eller driftsplan er sammenlignet; kontakter tages hele (ingen opdeling), efterslæbet er fast ved vinduets start, slewtid ud over den faste vendetid og lagerplads om bord er ikke modelleret.

seg-ddf2bc2f13a9 = Envejs linkbudget (kommunikation / linkudformning)

seg-83331f513dba = Fririumstab, C/N₀, Eb/N₀, margen og lukning over linkligningen i CCSDS { "401" } / DSN 810-005 for EIRP/G·T/afstand/rate/bånd mod et krævet Eb/N₀. Kan køres fra CLI/bindings som scenarietypen <c1/> (scenarios/link-budget.toml)

seg-195bf7e31f24 = Publiceret designkontroltabel for telekommunikation i dybt rum som fastlåste numeriske vektorer: DESCANSO / J. H. Yuen (red.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabel 1-1 (Galileo X-bånd) — kshana samler tabellens linjeposter igen og gengiver dens publicerede samlede L_fs { "290.54" } dB og Pr/N0 { "54.6" } dB-Hz; fririumstab er også kontrolleret mod ITU-R P.525

seg-3742d2aea62a = Nøjsom ramme for omkostning pr. dækning / ROI

seg-4228311689f8 = Omkostning pr. procent dækning + dækning pr. euro som ROI over motoren til dimensionering af konstellationer; omkostningen pr. satellit er et bånd lav/nominel/høj leveret af kalderen (ingen opdigtede priser)

seg-d542ac64c31c = Omkostningsregning på lukket form mod håndafledte værdier; en økonomisk RAMME om et modelleret dækningstal, ikke et tilbud eller en valideret omkostningsmodel

seg-8ba6ee9acc8a = Integritetspåvirkning af manglende detektion (kontekstbevidst HPL/VPL mod alarmgrænse)

seg-f5985399d0d5 = Afbilder en uopdaget spoof-/jam-bias til effektiv fejl → Stanford-område (tilgængelig/utilgængelig/MI/HMI) mod kontekstspecifik HAL/VAL (åben himmel vs. by)

seg-124d0ffe959e = Sammensætter den eksternt validerede RAIM Stanford-klassifikation (raim::classify_stanford); afbildningen fra manglende detektion til alarmgrænse er i sig selv modelleret, ikke en certificeret integritetsallokering

seg-37d43b5b918a = CAI: databladet med citerede fejlmodelparametre ({ "13503" })

seg-0b6a901f5ad2 = Afgrænset (bedste/nominel/konservativ) ydeevne for atominterferometer med kolde atomer — biasustabilitet, hastigheds-/vinkel-random-walk, skalafaktorstabilitet, prøveudtagningsrate begrænset af interrogationen, dynamikområde for fringe-flertydighed — hver kan spores til en kilde; føder QuantumNavBudget uden at modellere hardware

seg-4b66096727b8 = Intern konsistens: det citerede VRW-bånd krydstjekket mod fysikken i CaiAccelerometer::accel_asd + rå dynamikområde beregnet ud fra grænsen for fringe-flertydighed; tallene er MODELLED litteraturoversigtsbånd (needs_source_confirmation), ingen enhed er valideret, ingen validerings-glorie

seg-c93f2d3a3167 = Benchmark for tidssynkroniseringsintegritet — epokeklassifikator efter Stanford-integritetsdiagram

seg-712d5c35a6a6 = TIB-epokeklassifikation efter Stanford-integritetsdiagram (nominel / utilgængelig / MI / HMI)

seg-93b913e60063 = Uafhængig numpy-genimplementering af reglen for de fire områder (scripts/gen_tib_scorer_reference.py) på det identiske stikprøvesæt; metoden Cited fra Stanford–ESA-integritetsdiagrammet (Tossaint et al., ION GNSS { "2007" }) og RTCA DO-229 WAAS MOPS. IKKE en ExternalDataset-reference for nøjagtighed — benchmarken er immun over for uærlighed.

seg-573aa0193cb3 = Benchmark for tidssynkroniseringsintegritet — scorer for integritetsdækning

seg-4d86f3c2d8f5 = TIB-scoring af integritetsdækning (HMI/MI/tilgængelighedsrater + dom om dækning af overgrænse)

seg-645eb084ae8e = Uafhængig numpy-gentælling af områder i tests/fixtures/tib/reference.json; kun en krydskontrol af scorerens maskineri, ingen påstand om nøjagtighed.

seg-372dd0fdb025 = Benchmark for tidssynkroniseringsintegritet — fejlkatalog (parametriske generatorer)

seg-2604e7cf27d2 = TIB-fejlmenu (domænedivergens, urslam, holdover-udløb, statisk/trinvis/symmetrisk/asymmetrisk forsinkelse, genafspilning inden for friskhed, stivalg, k-af-N-kvorum)

seg-b907aecaccd0 = Repræsentative parametriske fejlgeneratorer (modelleret); mængden af uopdagelige fejl (symmetrisk forsinkelse, genafspilning inden for friskhed) er Cited fra Mizrahi RFC { "7384" } og Narula & Humphreys (IEEE JSTSP { "2018" }). Ingen ekstern uafhængig reference — et fejlkatalog fremsætter ingen målt påstand.

seg-90c0eb1e7c14 = Benchmark for tidssynkroniseringsintegritet — dom om absorption af uopdagelige fejl

seg-f713acf042ff = TIB-dom om absorption af uopdagelige fejl (symmetrisk/genafspilning skal absorberes af PL og må aldrig rapporteres som opdaget)

seg-6840c2467c63 = Egenskabskontrol af, at enum'en Verdict strukturelt ikke kan rapportere en uopdagelig fejl som opdaget (Mizrahi RFC { "7384" }); absorberet ⟺ PL ≥ offset. Ingen reference for nøjagtighed.

seg-3652a591eefc = Ingeniørarbejde på rumfartøjsplatform (AOCS/termisk/strukturer/fremdrift/strøm)

seg-50a9c1c7dff0 = Ikke leveret — Kshana er en simulator for navigationsydeevne, ikke en leverandør af platforme

seg-a349aa76b0ed = PARTNER

seg-b28dd62dca1c = Udformning af RF-nyttelast til navigation og antennehardware

seg-76c983a23e7b = Ikke leveret — Kshana modellerer signalydeevne, ikke nyttelast eller antennehardware

seg-7bba3b35214c = Udformning og modning af kvantenyttelasthardware

seg-15fcc200b859 = Ikke leveret — kun ydeevnemodeller; hardware til kolde atomer og ur er en partners

seg-d69dd4c5167b = Produktsikring af flyvehardware (stråling/EEE/MAIT)

seg-b1540f78ffd4 = Ikke leveret — Kshana beskæftiger sig kun med softwaresikring; sikring af flyvehardware er en partners

seg-1f200f8efc71 = Månens koordinattid

seg-2e6961dbffe9 = Relativistisk urhastighed Jord–Måne (LTC/TCL) + kædning af TT/TAI/UTC + ensemble

seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; grundlag for IAU/IAG LunaNet LTC): månens overfladepotentiale L_m = { "3.13881e-11" } og den sekulære sum { "56.02" } µs/dag stemmer som publicerede numeriske værdier; månens geocentriske hastighed krydskontrolleret mod JPL DE440 (de440s.bsp via SPICE)

seg-8adbbd2cdb74 = Selvbeskrivelse i rapporten om hybrid optisk/RF

seg-2a5e48b558e1 = Rapporten hybrid-optical-rf angiver den linkkonfiguration, den faktisk blev kørt med (bærebølgelængde, sende- og modtageapertur, afstand, pulsbredde, integrationstid, effektiviteter og tab, standardværdier løst) og bærer en enhedsblok, der giver enhed og proveniensklasse for hver størrelse, en artikel sandsynligvis citerer, herunder sporene af overdragelseskovariansen i kvadratmeter

seg-23f0c10237f4 = Ingen ekstern uafhængig reference, og ingen er mulig: dette er selvbeskrivelse, ikke en måling. Det registreres, fordi dens fravær var en defekt — P5 måtte citere bærebølgelængden og sendeaperturen fra kildens standardværdier og udlede, at en bar <c1/> var i kvadratmeter, ud fra en intern konsistenskontrol. Udledningen var korrekt, hvilket netop er grunden til, at det betød noget: intet ville have fanget, hvis den havde været forkert

seg-0691f3dee8cb = Tilgængelighed af hybrid optisk/RF-link på RF-siden

seg-72ccb655caf0 = Rapporten hybrid-optical-rf angiver en RF-linktilgængelighed, sammensat af størrelser, motoren allerede beregner, frem for af en importeret klimatologi, og angiver sammensætningen som en navngiven regel: A_rf = I_closure * I_track, hvor I_closure er lukningsdommen for det envejs CCSDS-401 / DSN-810-005-linkbudget (linkbudget::link_budget, Eb/N0-margen >= { "0" }) ved scenariets egen afstand og I_track er dommen fra sporingssløjfen (jamming::lock_status) på den C/N0, SAMME budget returnerede. Hver faktor bærer sit inputs proveniensklasse videre til outputtet, og de faktorer, der med vilje IKKE indgår i produktet — geometrisk synlighed, nægtelse ved interferens og en klimatologi for RF-udfald — er navngivet med begrundelsen i stedet for stiltiende at blive sat til { "1" }. Det løste RF-led gengives som sin egen blok rf_link_configuration, og de kontinuerte tal ved siden af indikatoren (linkmargen, C/N0-margen, de lukkede former for lukkes- og sporingsafstand og afstandsudnyttelsen) er afstandsinversionerne af det samme budget. Rapporten angiver fuldt ud, på blokken og i den enhedspost, en læser lander på, at dette tal er BEGRÆNSET AF MARGEN/GEOMETRIEN og DETERMINISTISK, mens optisk tilgængelighed er BEGRÆNSET AF VEJR/KLIMATOLOGI og sandsynlighedsbaseret, så de to aldrig kan citeres som et sammenligneligt par af procenter

seg-319705ea0166 = Ingen ekstern uafhængig reference, og ExternalDataset er afvist. De to inputs er en Eb/N0-margen og en krydsning af en C/N0-tærskel, begge funktioner af en MODELLED EIRP, kvalitetsmål og samlet tabsallokering; der findes ingen målt tilgængelighedsregistrering for en hybrid optisk/RF-tjeneste Jord–Måne at kontrollere det sammensatte tal mod. De kontroller, der findes, er interne og angives som sådanne: sammensætningen genberegnes ud fra rapportens egne publicerede marginer frem for fra udsenderens interne tilstand, og lukkeafstanden verificeres ved at køre linkligningen igen VED den og kræve, at marginen forsvinder — en rundtur gennem inversionen, ikke en uafhængig implementering. Tallets ærlige grænse er registreret på selve rapporten: det er en deterministisk 0/1-indikator, ikke en sandsynlighed, fordi intet i denne motor måler en fordeling af RF-linkudfald ved dette bånd og denne geometri. Det manglende input er navngivet i rf_availability.factors_not_included frem for opfundet, og at levere det er, hvad en sandsynlighedsbaseret RF-tilgængelighed ville kræve

seg-22c5df9b6c7c = Sammenligning af optisk og RF afstandsmåling på lige vilkår

seg-70eb396f40af = Rapporten hybrid-optical-rf udsender forholdet mellem optisk og RF afstandsmåling med den ÉNE konfiguration, begge led blev evalueret ved, båret i det samme objekt: den samme envejsvej, den samme afstand og den samme akkumulationstid. Det optiske led er motorens fotonbegrænsede ToA-CRLB på envejs fotontallet; RF-leddet er motorens DLL-early-late-termiske kodesporingsjitter ved den C/N0, som motorens eget linkbudget returnerer for den samme envejsafstand. Sløjfens støjbåndbredde er afledt, ikke valgt: B_L = 1/({ "2" }*integration_s) placerer RF-leddet ved præcis den optiske akkumulationstid, og tilsidesætter en kalder den, så de to middeltider er uens, bliver forholdet REFUSED — null, med uoverensstemmelsen og begge tider navngivet — frem for at blive citeret ved to arbejdspunkter. Der dannes intet forhold mod scenariets VALGTE parametriske rf_position_sigma_m, og afvisningen angiver hvorfor: det input bærer slet ingen konfiguration. Den frigivne optiske hovedværdi for to veje og den eksakte faktor, der bygger bro fra den til envejs-sammenligningsleddet, udsendes ved siden af forholdet, så rapporten ikke kan læses, som om den bar to uenige optiske sigmaer

seg-acbb3ac98ee3 = Ingen ekstern uafhængig reference for FORHOLDET, og ExternalDataset er afvist bevidst. Den underliggende RF-kæde har en — tests/validate_p5_rf_ranging_precision.rs kontrollerer linkbudget::link_budget og navsignal::dll_code_jitter_chips mod en uafhængig Python/NumPy-fixture og mod den hårdkodede gennemregnede værdi hos Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m ved { "45" } dB-Hz) — og den optiske CRLB har sin egen række på lukket form. At gøre krav på nogen af de to forankringer for denne række ville være lånt validering, hvilket matrixens invarianter findes for at forhindre: størrelsen her er et FORHOLD ved en konfiguration med en MODELLED EIRP, kvalitetsmål, sendeeffekt og apertur, og der findes ingen målt sammenligning af optisk og RF afstandsmåling ved et fælles arbejdspunkt at kontrollere det mod. Det, der kontrolleres internt, er det, forholdet faktisk kan gøre forkert: at de to led ligger ved ét arbejdspunkt. Det måles ved at skalere den fælles akkumulationstid og kræve, at begge led bevæger sig efter den samme kvadratrodslov, og at forholdet bliver stående, og det håndhæves ved at afvise forholdet helt, når middeltiderne er uens. Begge led er termiske grænser/grænser for haglstøj, og begge udelader mediedelay, urfejl og flertydighed, så udeladelsen er den samme på begge sider; rapporten siger det frem for at lade det være op til udledning

seg-3f26f598e013 = Selvbeskrivelse i linkbudgetrapporten

seg-b88bf41d6d4c = Linkbudgetrapporten angiver hver absolut konstant, dens egen margen blev beregnet ud fra — den bærebølgefrekvens, fririumstabet brugte, EIRP, kvalitetsmålet, det samlede tab og Boltzmann-leddet — plus den krævede G/T, ved hvilken marginen er nul, linkkonstanten (EIRP - tab - krævet Eb/N0), som er den eneste kombination, en publiceret rate/forstærkningstabel nogensinde kan fastlægge, og, når en kalder angiver en systemstøjtemperatur, den modtageantenneforstærkning, som det kvalitetsmål medfører

seg-52f98f50522f = Ingen ekstern uafhængig reference: dette er selvbeskrivelse over en ligning, der allerede er valideret mod en publiceret designkontroltabel (se rækken om envejs linkbudget). Det registreres, fordi dens fravær var en målt defekt — at gengive den frigivne d1_rate_gain_beamwidth.csv krævede at løse baglæns for én effektiv konstant til { "0.0034" } dB ud fra alle tredive rækker, og motoren navngiver nu både den kombination og beviser ved test, at ingen frigivet tabel nogensinde kunne have adskilt dens tre komponenter

seg-a7b192e27cb5 = Tabel over krydsningspunkter for månetid pr. urklasse

seg-cab605dc6ea2 = Én kørsel af månetidsbudgettet udsender en række for krydsning mellem ur og system for hver urklasse mod ét fælles systemled, så uret er den eneste variabel i sammenligningen; hver række bærer krydsningen nået på to måder — fundet ved bisektion ud fra den generelle potenslov-kurve for tidsfejl og inverteret algebraisk ud fra rækkens dominerende støjtype — med den relative forskel mellem dem

seg-ccec15f0b125 = To forskellige beregninger i kodebasen af den samme størrelse, ikke én genfortalt: bisektion på IEEE-1139-potenslovskurven kender intet til støjtype, mens den lukkede form inverterer den dominerende type algebraisk, så en fejlklassificeret støjtype eller et dårligt interval viser sig som en ikke-ubetydelig relativ forskel. De fire værdier gengiver også artiklens publicerede tabel til en halv enhed i dens sidste trykte ciffer — men den tabel var selv rekonstrueret ud fra den samme lukkede form, så det er en kontrol af reproducerbarhed og ikke en ekstern uafhængig reference, og det systemled, den måles mod, er en modelleret allokering

seg-ff32b78acb8c = Samlet UT1- og polbevægelsesfejl over et fælles sæt rækker

seg-561e588153af = Én tabel rapporterer UT1-forudsigelsesfejlen, polfejlen fra polbevægelsen og deres kvadratiske kombination ved Månen over et IDENTISK epokesæt pr. horisont og udsender de epoker, hver komponent blev målt ved. Særskilt navngiver scenariet, hvilket EOP-input der er i kraft, og opdeler dets rækketælling, og udsender altid tabellen over forudsagt mod endelig pr. horisont med en udtrykkelig angivelse af, hvorfor den er tom, når den er det

seg-3692f1fc89e6 = Standardinput til jordens orientering offline er et reelt IERS-produkt

seg-f9a9d385fd26 = Standarden for <c1/> ved kørsel er bibliotekets egen indlejrede kopi af et ordret udtræk af IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } sammenhængende daglige rækker, MJD 61224-61397, skåret ud af finals2000A.all fra 2026-09-30), der bærer alle tre rækkevintager, formatet definerer, klassificeret efter IERS' I/P-flag (eop::row_vintage): { "30" } endelige rækker fra Bulletin B, { "54" } hurtigt målte rækker (flag I uden en Bulletin B-blok) og { "90" } forudsigelser fra Bulletin A (flag P). En bar kørsel uden filargument og uden netværk udsender en udfyldt tabel pr. horisont, rækketællingen rows = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) og predicted_rows.n = { "90" } over MJD 61308-61397; skæringspunktet som udstedt for sammenligningerne af forudsagt mod endelig er den sidste målte række. Det tidligere udtræk med 32 rækker (tools/finals2000A_2026.txt, hver række flag I) og uddraget med fem rækker kun med endelige værdier leveres stadig og afprøves: på dem er predicted_rows.n { "0" }, en egenskab ved inputfilen og ikke et resultat af parseren

seg-18c72a7565d6 = Fodaftryk for indfangning mod højde og strålebredde

seg-9c30a0ab5233 = Tosidet sweep af det mønstervægtede, højdebegrænsede fodaftryk for overfladeindfangning over senderens højde og parabolens diameter, udsendt som én række pr. arbejdspunkt med den halveffekt-strålebredde, hver diameter medfører, og indfangning ved limben rapporteret som en TÆRSKEL — pr. række limbens J/S, dens margen og den sendeeffekt, der ville lukke den; pr. gitter de fundne krydsninger, eller en udtrykkelig angivelse af, at limben ikke nås nogen steder på gitteret, med manglen

seg-4d866b62d4f7 = Mængdeinklusion: jammer-til-signal-forholdet indgår som et ensartet decibeloffset, så den indfangede mængde ved højere sendeeffekt indeholder mængden ved lavere, og andelen kun kan stige — en egenskab, Airy-mønsteret IKKE giver i strålebredde eller højde, hvor det indfangede område brydes op i ringe, og andelen reelt er ikke-monoton. Ingen publiceret tabel giver den indfangede diskandel for en månebaneafsender mod højde og strålebredde, så der er intet eksternt at kontrollere disse celler mod; mønstret nedenunder er separat valideret mod publicerede Bessel-værdier og har sin egen række

seg-fc0a64b9a280 = Reproducerbarhed af månens tidsfejlbudget

seg-5d5970506b9c = Scenariet lunar-time-budget publicerer sine outputs i form af arrays som en tabel i langt format (gitterindeks, middeltid, led) ved siden af rapporten, så de syv kurver x(tau) for hvert led og totalen som kvadratroden af kvadratsummen er motoroutput frem for noget, en læser genopbygger ud fra metodeafsnittet

seg-62df6258bc62 = Kun selvkonsistens: det publicerede total kontrolleres mod kvadratroden af kvadratsummen af leddene i den samme fil, og den udsendte kurve gengiver den frigivne p3_time_budget_curve.csv over alle { "57" } punkter. Begge kontroller deler denne motors egne leddefinitioner, så ingen af dem er uafhængig. Urleddet hviler på publicerede urspecifikationer, men STØRRELSERNE af gulvene for link, system, relativistik og efemeride er dokumenterede budgetallokeringer uden ekstern uafhængig reference

seg-675887733454 = Månens stationstidslaboratorium: holdover for miniRAFS mod LTC

seg-7dfedc40da6a = Den valgfrie blok [time_lab] i scenariet lunar-time-budget modellerer et reference-stationsur på Månen (som standard klassen miniRAFS, eller en hvilken som helst navngiven klasse, eller et enhedskort tilpasset angivne stabilitetspunkter), styret til Coordinated Lunar Time og derefter frit løbende eller gensyret hvert N sekund: tidsfejlkurven x(t) som kvadratroden af kvadratsummen af urets potenslovled, en konstant styringsrest (ILLUSTRATIVE), en konstant realiseringsrest for LTC og et tilvalgt led for stationens højderate; tiden efter en styring til { "1" }, { "10" } og { "100" } ns (eller angivne tærskler) ved bisektion ved siden af den lukkede invers for den dominerende støjtype, og det dominerende led ved hver angivet horisont, alt med enheder

seg-3801e9b32309 = Kun intern konsistens: den bisekterede tid til tærskel kontrolleres mod den lukkede invers for urets dominerende støjtype, og det frit løbende urled mod budgettets eget urled. Urklasserne hviler på publicerede endagsspecifikationer (deres egne rækker); LTC-raten udledes ikke igen her og beholder sin egen VALIDATED række (Lunar coordinate time); styringsresten er ILLUSTRATIVE, realiseringsresten er en budgetallokering, og ingen termisk model indgår. Målet på nanosekundniveau, der er beskrevet i materialet fra ICG WG-B Lunar PNT fra juni { "2024" }, citeres som en kildeangivelse, ikke overtaget som en påstand; intet her er en udtalelse om noget reelt stationsur

seg-af3ff120b707 = VLBI til geodæsi på Månen

seg-cfd7d0126028 = Nærfelts-VLBI-forsinkelse for en jordbaseline, der observerer et månefyr + partielle afledte

seg-d1943f9932af = Plan-bølge delta_dor (samme kodebase) i fjernfeltsgrænsen; partielle afledte ved endelige differenser. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): mod ANISE { "0.10" } konvergerede lystider gennem DE440 ({ "75" } forsinkelser den 2024-01-01 over tre DSN-baselines, genereret af xval/anise-lunar-od uden Kshana-kode) ligger ingen forsinkelse inden for tolerancen på { "1" } ps. Det største gab er { "24" } µs, fra det analytiske Måne-centrum (omkring { "200" } km fra DE440), den ene øjeblikkelige geometri uden iteration af lystiden ({ "3.6" } µs) og den udeladte polbevægelse; beacon-partielle afledte afviger med op til { "2.9e-3" } relativt mod { "1e-6" }. Påstanden i modulets dokumentation om, at rammetilnærmelserne ligger under modellens troværdighed, holder ikke på dette niveau. { "0.30" } runde { "2" }: kernestien (lunar_vlbi::KernelGeometry) er valideret mod NAIF SPICE-lystider i sin egen række, Lunar geodetic VLBI, kernel path; ANISE-sammenligningen af den sti (75/75 inden for { "1" } ps, værst { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) er kun en krydskontrol af kerneevaluering, fordi lystidsløsningen i den harness er dette projekts egen. Denne række (den analytiske standardsti) forbliver MODELLED med fundet ovenfor

seg-d12d4565b01d = VLBI til geodæsi på Månen, kernesti

seg-11e1c942e41c = Nærfelts-VLBI-forsinkelse for en jordbaseline, der observerer et månefyr, med partielle afledte for fyr og station, på kernestien (lunar_vlbi::KernelGeometry): DE440 Jord og Måne, DE440 månens hovedakser, ITRF93 jordorientering med UT1 og polbevægelse, hver lystid konvergeret i det barycentriske system, partielle afledte med lystidsfaktoren 1/(c - u.V). Kan køres som scenariet <c1/> med planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path sat; de validerede outputs er serien geometric_delay_s og epoch_partials på kernestien. På kernestien lægger delay_s det analytiske differentierede Shapiro-led til, som ikke sammenlignes, og delay_rate og near_field_correction_us sammenlignes ikke

seg-1f10810131be = NAIF-kernelæser: DAF-container, SPK type { "2" } og binær PCK type { "2" }

seg-7da4847e7a28 = Motorens egen rene Rust-læser til binære NAIF-kerner (naif_kernel): DAF-containeren (begge byterækkefølger, sammenkædede oversigtsposter), SPK type-2 Chebyshev-positionssegmenter kædet gennem deres centre til en laveste fælles forfader og binære PCK type-2 Euler-vinkelsegmenter omsat til en rotation fra J2000 til legemet, med epoker taget som todelt ET, så en forskydning under et mikrosekund bevarer sin præcision. Det er den, KernelEphemeris (ephem_provider) og kernestierne i lunar_vlbi, lunar_llr og lunar_vlbi_fim læser DE440 gennem. Påstanden er, at den læser JPL-kerner korrekt; det er ikke en påstand om, at DE440 eller motorens analytiske serier for Solen og Månen er nøjagtige

seg-e08e98908f3a = Jord-GNSS ved månens afstand

seg-dd8ce373d1f6 = Modtagelse af Jord-GNSS ved månens afstand: det svage signallag, som P7 tabel { "1" } navngiver, og som motoren ikke havde nogen model for. Pr. satellit og pr. epoke beregnes vinklen uden for boresigtet mod senderens nadir, om Jorden skjuler den rette vej, den skrå afstand og dens fririumstab, senderens forstærkning ved den vinkel, den modtagne effekt og bærebølge-til-støj-tætheden; derefter aggregeres kun de link, der klarer en sporingstærskel, og et fuldt omløb af konstellationen sweepes, så svaret er en FORDELING frem for ét øjebliksbillede. Tre forhold driver resultatet, og rapporten angiver hvert: Jorden spænder { "13.90" } deg set fra konstellationens radius, så strålens TOP er geometrisk utilgængelig for enhver stråle på vej mod Månen; det, der er tilbage, er hovedlobens kant og sidelobene, det regime LuGRE opererede i ved Månen i { "2025" }; og L1-vejtabet er omkring { "208" } dB, cirka { "25" } dB mere end en jordbaseret bruger betaler. MEASURED på den medleverede GPS-lignende geometri med 24 satellitter over { "64" } epoker af én omløbsperiode: tilgængelighed af SIGNAL { "0.375" } med et bedste link på { "30.93" } dB-Hz og tilgængelighed af POSITIONSBESTEMMELSE { "0.000" } — højst to samtidige sporbare link, aldrig de fire, en position kræver. Adskillelsen af de to tilgængeligheder er pointen, og rapporten nægter at lade dem blive forvekslet: Jord-GNSS ved månens afstand er et lag af TIDSSYNKRONISERINGS-kvalitet, ikke af positionskvalitet, og en prior for lagdelt robusthed skal tage tilgængeligheden af positionsbestemmelse. Konditioneringen udsendes af samme grund — hver synlig satellit ligger inden for en kegle på et par grader set fra Månen, så sigtelinjerne er næsten parallelle pr. konstruktion. Kan køres som typen <c1/> Omformuleret efter D7: påstanden ved månens afstand er den RELATIVE bærebølge-til-støj-tæthed mellem satellitter ved én epoke, ud fra målte todimensionale sendemønstre (NAVCEN Block IIR/IIR-M), plus geometrisk synlighed; absolut C/N0 påstås ikke (Parker et al. rapporterer et fælles tab på { "7" } til { "12" } dB).

seg-29df5b40a3f9 = Banebestemmelse ved Månen: Jord-GNSS mod radiometri fra jorden

seg-647902ebcee3 = Banebestemmelse i en næsten retlinet halo-bane (eller en elliptisk frossen bane) ud fra to uafhængige datatyper: Jord-GNSS-pseudoafstande modtaget om bord (linkreglen fra rækken om Jord-GNSS ved månens afstand, plus okkultation af Månen) og to-vejs afstand og afstandshastighed fra jorden fra tre Deep Space Network-stationer. Hver er en mindste kvadraters batch i ét trin omkring referencebanen med sin formelle kovarians; en seedet Monte Carlo af forskellen mellem de to estimater afprøver, om de to kovarianser forklarer den (q = d' (P_G + P_R)^-1 d, chi-i-anden med seks frihedsgrader, når modellerne stemmer), og hvad en ikke-modelleret acceleration gør ved statistikken.

seg-226dedaba243 = Et uafhængigt scipy/numpy-program integrerer de samme variationsligninger (tærskel O1). Intet sammenlignes med en måling af en månebane. Den uafhængige reference kontrollerer numerikken i angivne formler, ikke fysikken, så rækken forbliver MODELLED. Begrænset trelegemesmodel: ingen Sol, ingen månens harmoniske, jordens rotationsakse langs banenormalen, ILLUSTRATIVE modtager- og stationsinputs.

seg-652bdc29deea = Opløsning af bærebølgemultiplicitet ved Månen: overflade og orbiter

seg-02496f9e9af2 = Enkeltdifferentieret Jord-GNSS bærebølgefase og kode mellem modtagere ved en månestation på overfladen og en orbiter, med urdifferensen for hver epoke profileret væk, én multiplicitet pr. sammenhængende pas og det længste pas som gauge. Kovariansen for den flydende multiplicitet er et Schur-komplement; LAMBDA opløser heltallene, den bootstrappede rate rapporteres ved siden af en seedet Monte Carlo-succesrate for heltals-mindste-kvadraters og sigmaerne for flydende og fastlåst position. Rapporteret som fundet: ved de registrerede { "12" } dBi kan dobbeltdifferensproblemet ikke dannes (ændring { "1" } flyttede standarden til { "25" } dBi, efter at kun tællinger af tilgængelighed var set), og ved { "25" } dBi opnås heltalsfastlåsning IKKE — uden for rækkevidde (nogle få procent højst), selvom den flydende løsning forbedres med buen.

seg-8d8296752eb8 = En uafhængig numpy-løsning af de samme normalligninger ud fra de eksporterede rækker (Q3) og en brute-force-optælling af heltal (Q4). Ingen GNSS- eller månebærebølgefasemåling sammenlignes med. MODELLED.

seg-11dd1bb8e4e1 = Koestimering af månens referencesystem: overflade-stationer og orbitere

seg-a38c8d95e6c9 = Fisher-information for månens referencesystemdatum med syv parametre fra laserafstandsmåling fra jordstationer til de fem reflektorer alene og med afstande mellem orbiter og overflade-station lagt til: informationsmatricen, rang, Cramer-Rao-sigmaer, degenerationsmålet fra modulet for identificerbarhed i månens referencesystem og seedede tilfældige stationssæt. Banen holdes kendt i månens akser (dens fejl bæres af afstandssigmaen for orbiteren).

seg-47d2afc53b3d = En uafhængig numpy-endelig-differens af fremadmodellen (F2). Intet sammenlignes med reelle løsninger for månens referencesystem. Faktoren er betinget af den antagne kendte bane og afstandssigmaen på { "1" } m. MODELLED.

seg-862977c4bb01 = Præcision i rumforbindelsen mellem referencesystemer: samlokaliseret GNSS, VLBI og laserafstandsmåling

seg-a9ae8e99f00d = Cramer-Rao-præcision for forskydningerne i translation, skala og rotation mellem teknikker i referencesystemerne for GNSS, VLBI og laserafstandsmåling, når ét rumfartøj bærer alle tre, med rumfartøjets position elimineret ved hver epoke og ni lokale forbindelsesgenerende parametre med en prior, sweepet over nøjagtigheden af den lokale forbindelse. Kovarianser ad kvadratrodsvejen (normalligninger mister cifrene, når teknikkerne er næsten perfekte).

seg-b37ac7294112 = Et uafhængigt numpy-stakket system med positionsubekendte elimineret ved eksplicitte Schur-komplementer (T3). Ingen data fra GRASP, Genesis eller andre missioner sammenlignes med. MODELLED.

seg-ae627996875e = Følsomhed over for Love-tal og libration på Månen

seg-28780d07c4a7 = Fisher-information for h2, k2, l2 og de fysiske libration-amplituder fra laserafstandsmåling (radial og horisontal tidevandsforskydning, rotation af reflektorer), sporing af orbitere (grad-2 k2-accelerationen integreret langs sigtelinjen, trend fjernet), et gravimeter på overfladen (gravimetrisk faktor { "1" } + h2 - { "1.5" } k2) og et ur på overfladen (relativ hastighed ({ "1" } + k2 - h2) W2/c2, knyttet til månetidskonstanterne). Nominelle værdier for h2 og l2 er linearisationspunkter; undersøgelsen siger, hvad der er følsomt over for hvad, ikke hvad tallene er.

seg-180d74388339 = En uafhængig numpy-samling ved endelige differenser (G2) og evaluering på lukket form (G4). Følsomheden over for k2 for familien af orbitere er et tal i den øvre ende (banetilstanden absorberer her kun en konstant og en trend). Ingen måling af månens tidevand eller libration sammenlignes med; k2 citeres fra Lemoine et al. { "2014" } som nominel. MODELLED.

seg-da712b740519 = Forøgelse af DOP med overflade-fyr på Månen

seg-83e6341e01b1 = Fyrforøget dilution of precision for en bruger på månens overflade: rækkerne med sigtelinje til de synlige satellitter og rækkerne med afstandsmåling til de synlige overflade-fyr sættes sammen til én designmatrix og evalueres gennem den fælles DOP-kerne, og den resulterende DOP afbildes til en realiseret 1-sigma-nøjagtighed I METER gennem en brugerækvivalent afstandsfejl for hvert fyr, sammensat som kvadratroden af kvadratsummen af led for synkronisering af ur, multipath og opmåling. Fyrets synlighed er den geometriske horisont for to højder på Månen uden luft, som ikke har nogen refraktiv udvidelse og derfor er eksakt frem for tilnærmet. Kan køres som scenarietypen <c1/>, der rapporterer kun satellitter, satellitter plus fyr og en større konstellation som den konkurrerende vej til den samme geometri. MEASURED på den medleverede golden-geometri (bruger ved -80 deg, tre opmålte fyr, en illustrativ LCNS med seks satellitter ved t={ "0" }, maske { "5" } deg): { "5" } synlige satellitter giver PDOP { "9.6941" } og en 3D-1-sigma på { "11.222" } m; tilføjes de fyr, der faktisk klarer horisonten, fås PDOP { "4.1160" } og { "4.765" } m, en faktor { "2.355" }; tjenesten med 24 satellitter giver i stedet PDOP { "2.4226" } og { "2.804" } m, en faktor { "4.002" }. Rapporten udskriver antallet af SYNLIGE fyr frem for det konfigurerede, og på denne geometri klarer kun ET af de tre fyr horisonten: de to flankerende steder ligger omkring { "333" } km fra brugeren mod en horisont på { "86" } km for en antenne på { "2" } m, så en læser aldrig overlades til at antage, at alle tre bidrog

seg-b0b618abf402 = Blindhed over for fælles-mode i integritet

seg-e732ac99a9ae = Eksakt opdeling i paritetsunderrum af en målefejl i den del, RAIM ikke kan se, og den del, den kan. For den linearisede øjebliksmodel y = G·x + e dekomponerer enhver fejl dy entydigt i en BLIND komponent i range(G) — absorberet som en tilstandsfejl S·dy og tilintetgjort af residualprojektoren Pperp = I − G·S, så usynlig for ENHVER residualtest, ikke blot for en bestemt tærskel — og en DETEKTERBAR komponent i paritetsrummet. Modulet returnerer projektoren, opdelingen og den blinde andel, så en kalder kan kvantificere, hvor meget af en bestemt fejl en øjebliksmonitor strukturelt ikke er i stand til at rapportere. Anvendt på det reelle gulv mellem efemerider: uoverensstemmelsen på meterniveau mellem DE440 og INPOP21a og mellem DE440 og EPM2021 i Månens geocentriske position absorberes næsten helt som brugerens positionsfejl (median af den blinde andel { "1.000000" }; median af den blinde positionsfejl { "2.3955" } m og { "2.0050" } m) mod en paritetsrest på { "1e-15" } m-niveau

seg-845e9f5eec81 = Beskyttelsesniveau for fælles-mode og samlet integritetskonvolut

seg-ffc59a7ed497 = Analytisk projektoralgebra kontrolleret mod sig selv: en kovarians begrænset til range(G) skal give en positiv CMPL, en kovarians begrænset til paritetsrummet skal give omtrent nul, og konvolutten skal summere to bidrag, der er ortogonale i målerummet. Fælles-mode-kovariansen, konstellationsgeometrien og k er repræsentative modellerede inputs, IKKE et certificeret budget, og der påstås ikke, at trekantsgrænsen er stram. BEMÆRKNING OM PROVENIENS: cmpl_horizontal, blind_position_covariance og integrity_envelope er offentlige og leveret, og deres enhedstests var allerede citeret af rækken om fælles-mode-blindhed, men SELVE KONVOLUTPÅSTANDEN bar ingen række — så det ene forbehold, der holder den ærlig, at summen er en trekantsgrænse og ikke en RSS, var angivet intetsteds i registeret. Rækken registrerer påstanden og forbeholdet sammen.

seg-5ed34a5b402e = Fælles OD med flere teknikker på Månen + ur

seg-5ace1caff5a9 = Batchfusion af VLBI + afstand lokalt på Månen + afstand mellem satellitter for at genfinde positioner og ure for stationer og konstellation

seg-69fbe488dec5 = Fisher-information og Cramér–Rao-observerbarhed

seg-043d4c7a2d6a = Fisher-information M=HᵀWH, Cramér–Rao-nedre grænse, observerbarhedsrang / nulrum for datumdefekt (Moore–Penrose-pseudoinvers) og D/A/E/T-optimale skalarer for forsøgsudformning fra en symmetrisk Jacobi-egenværdiløser

seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, baseret på LAPACK) — en uafhængig tredjepartsreference, der beregner de samme entydigt definerede egenværdier, σ²(XᵀX)⁻¹ Cramér–Rao-kovarians og GNSS-faktorer for præcisionsforringelse (dilution of precision) med en anden algoritme (LAPACK divide-and-conquer + LU) end den cykliske Jacobi-sweep og den spektrale pseudoinvers i Kshana; afstemt til { "1e-9" }. Den samme klasse af eksternt bibliotek validerer allerede DOP-motoren (mod gnss_lib_py) og kernerne for χ²/erf (mod SciPy). Desuden krydstjekket mod de lukkede CRLB-udtryk hos Kay ({ "1993" }) og mod Monte Carlo-opnåelse af CRLB (internt)

seg-e4ec41d0f5e1 = Observerbarhed af absolut stationsposition på Månen (datumdefekt)

seg-b3e4160042d2 = Fisher-information-observerbarhed af den fælles måneløsning: uden baselines til Jorden ligger det absolutte referencesystems datum i nulrummet af HᵀWH (stationens position er uobserverbar); ≥{ "3" } baselines genopretter fuldt rang og afgrænser stationens Cramér–Rao-fejl, som estimatoren opnår

seg-ae4b71d54dfa = 7-parameter Helmert-datumtilpasning + ICRF-orienteringsbinding fra et netværk af punkter

seg-9e434924b34c = Uafhængig lukket-form vægtet Umeyama-løser (Horn) for ligedannethedstransformation (baseret på SVD i numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — en anden algoritme end den iterative Gauss–Newton-tilpasning i Kshana, som når frem til det samme entydigt definerede vægtede mindste kvadraters optimum på byte-identiske punktnetværk

seg-4bcec6e2dd9f = Servicevolumen for månenavigation

seg-dba98ad5df1c = DOP / dækning / tilgængelighed af Moonlight-klassen på Månen + generaliserede ARAIM-beskyttelsesniveauer for Månen over en servicevolumen

seg-7e981d90a806 = Uafhængig tredjepartsreference ANISE { "0.10.2" } astro::Orbit Kepler-propagator (Nyx Space, MPL-2.0) — en ækvinoktial totlegemekodevej, der adskiller sig fra Newton-Raphson-Kepler i Kshana; MCI-positionen pr. satellit stemmer til <{ "1e-3" } m, og det afledte antal og den afledte mængde af synlige satellitter er identiske i hvert gitterpunkt. DOP-kernen er valideret mod gnss_lib_py; integritet bruger offentliggjorte LunaNet/LCNS-parametre

seg-2ed7181c97dd = Generering af LunaNet AFS-spredekoder (LSIS V1.0)

seg-13ff6c381275 = Koderne i Augmented Forward Signal i LSIS V1.0 ({ "29" } januar { "2025" }): den primære AFS-Q-kode på 10230 chips genereret efter pilotkonstruktionen for IS-GPS-800 L1C med indeksene fra IS-GPS-800J (de samme { "210" } tildelinger, som LSIS Appendix D trykker), AFS-I-Gold-koderne på 2046 chips genereret ud fra g1 = x^{ "11" } + x^{ "2" } + { "1" } og g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } med hver PRN's G2-forsinkelse genfundet fra standardens Annex { "3" }-fil, de fire sekundære koder, de tertiære koder på 1500 chips, den foreløbige nodetildeling i Table { "11" } og den trindelte pilotkode. LSIS-indholdet læses ved kørsel fra en lokal cache, der er verificeret med SHA-256 og fyldt fra den PDF, NASA hoster, og det videredistribueres aldrig

seg-dc1dd144b107 = Reference: de værdier, LSIS V1.0 trykker til validering (Tables C-1 til C-5, D-1 til D-6, E-1 til E-6), og dens elektroniske kodefiler i Annex { "3" }, under et kriterium om nul afvigelser fastsat før sammenligningen. Kriteriet er ikke nået på grund af én trykt celle, som er internt uforenelig med standardens egen Annex { "3" }-fil, så rækken forbliver MODELLED; en erratanote er udarbejdet. De samme chips er også lig LANS-AFS-SIM's (række 'LunaNet AFS-basisbåndsgengivelse mod en uafhængig generator, givet dens kanaltilstand')

seg-ea20909686ea = LunaNet AFS-basisbåndsgengivelse mod en uafhængig generator, givet dens kanaltilstand (LSIS V1.0)

seg-c0f021c38842 = Gengivelseskernen i AFS-basisbåndet (LSIS-130: kompleks indhyllingskurve I + jQ, I = AFS-I-Gold-koden gange rammen på { "500" } symboler/s ved { "1.023" } Mchip/s, Q = den trindelte AFS-Q-pilot ved { "5.115" } Mchip/s, bærebølgerotation, chip- og symbolindretning) gengiver en uafhængig generators samples, når den styres af denne generators egen optagede kanaltilstand (kodefaser og -rater, bærebølgefase og -frekvens, amplitude pr. kanal). Ikke dækket: nodemodellen, der udleder denne tilstand ud fra en Doppler, en forsinkelse og en bærebølge-til-støj-tæthed, den 50/50-effektfordeling, der beregnes ud fra bærebølge-til-støj-tætheden (amplituderne tages fra simulatoren), og SigMF-metadata og skrivning af 8-bit-samples

seg-dd1142957a05 = Bibliotek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-bånd-build, kørt som et separat program); samples fra Kshana styres kun af simulatorens optagede kanaltilstand, og en build med kun udskrift af sporing kontrolleres at være byte-identisk med den upatchede. Tærskler fastsat før kørslen: nul chip- og symbolafvigelser, |rho| >= { "0.999" } over kørslen og >= { "0.99" } pr. blok på { "2" } ms, fase inden for { "0.05" } rad. Ens I- og Q-amplituder er et input til sammenligningen, så effektfordelingen afprøves ikke af den. LANS-AFS-SIM læser sine tertiære koder fra LSIS Annex { "3" }-filen, så den del er ikke uafhængig af kodeserien. LANS-AFS-SIM og PocketSDR-AFS har samme forfatter og tæller som én uafhængig implementering. Datastyret: sammenligningen med LANS-AFS-SIM kræver den lokale LSIS V1.0-cache (xval/lunar-afs/fetch_lsis.sh, verificeret med SHA-256) og springes over med en meddelelse uden den

seg-5d79da539912 = Kanalkodning af LunaNet AFS-ramme, FID { "0" } (LSIS V1.0)

seg-6ed2b4c792e6 = FID { "0" }-rammen i LSIS V1.0 på { "12" } s og 6000 symboler: synkroniseringsmønster på 68 symboler, BCH ({ "51" }, { "8" }) delramme { "1" } (generator i oktal 763), CRC-24 (({ "1" } + X)·P(X)) på delrammerne 2-4, LDPC-kodning med rate 1/2 med de trykte A, B^-1, C, D (LSIS Annex { "1" }, læst ved kørsel fra den lokale cache verificeret med SHA-256) og standardens punktering, blokinterleaver på { "60" } x { "98" }; en udtømmende dekoder for delramme 1, som markerer en TOI uden for { "0" }..99, og en normaliseret min-sum LDPC-dekoder skrevet ud fra H = [[A, B, { "0" }], [C, D, I]] alene

seg-46879e2e8ab5 = Bibliotek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), hvis egne BCH, CRC, LDPC og interleaver frembringer rammer, der er symbolidentiske med dem fra Kshana for det samme indhold (nul afvigelser, tærskel fastsat før kørslen). Underbygget af referenceværdier: LSIS V1.0 Figure { "8" }-eksemplet for BCH og kontrolværdien for CRC-24/LTE-A (Greg Cooks katalog over parametriserede CRC-algoritmer), begge bit-for-bit nøjagtige; og af PocketSDR-AFS, som i tre kørsler dekoder hver delramme i de rammer, den synkroniserede, med bestået CRC og matchende bits i delramme 2. Paritetskontrollen er tæt på en intern identitet (den bekræfter, at den trykte B^-1 inverterer den trykte B) og tælles ikke som en uafhængig reference. Datastyret: sammenligningen med LANS-AFS-SIM kræver den lokale LSIS V1.0-cache (xval/lunar-afs/fetch_lsis.sh, verificeret med SHA-256) og springes over med en meddelelse uden den

seg-56c7aeac59c1 = LunaNet AFS-dekodbarhed i lukket sløjfe hos en uafhængig modtager (LSIS V1.0)

seg-da2d29d437b0 = En AFS-optagelse fra Kshana, som en uafhængig softwaremodtager har opfanget, sporet og dekodet, og som er sammenlignet med optagelsens egne referencemærker. Det viser kun formatkontrol mod standarden og konsistens af mærkerne; det er ikke en udtalelse om kanalfysik, udbredelse, modtaget effekt eller link-budgetter, hvis værdier i optagelsen er valgte input

seg-8211583afc64 = Bibliotek: PocketSDR-AFS (T. Ebinuma efter T. Takasus PocketSDR { "0.13" }, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-bånd-build, kopi med kun udskrift på logniveau), under kriterier fastsat før hver kørsel. Den tredje præregistrerede sammenligning opfylder sine tærskler C1 og C2 for dekodning og sporing fuldt ud, men ikke sin vagtbetingelse G0 som skrevet (to kørsler af den uændrede modtager adskiller sig i de samme fire erhvervelsesposter), og den anden missede med { "5" } overtrædelser, så rækken forbliver MODELLED. LANS-AFS-SIM og PocketSDR-AFS har samme forfatter og tæller som én uafhængig implementering; kontrollerne af trykte vektorer i rækken for rammekodning beskytter mod en fælles fejllæsning

seg-780369fb9a54 = Formatkontrol af GPS L1 C/A på tværs af generatorer

seg-ee47b60515f1 = GPS L1 C/A-spredekoder (sdr::CaCode) og LNAV-delramme 1-3 (gps_lnav: IS-GPS-200-feltkvantisering med specifikationens pi, to-komplement-pakning, TLM- og HOW-ord, paritet efter Table 20-XIV med D29*/D30*-inversion, de paritetsløsende bits i ord { "2" } og { "10" }) sammenlignet bit for bit med gps-sdr-sim på dens medfølgende brdc0010.22n ({ "32" } satellitter)

seg-325900ed59ea = Signalgeometri i GNSS IQ-scene mod en uafhængig basisbåndsgenerator

seg-ee5625b30ff2 = IQ-scenegeneratorens sandhed pr. satellit for en GPS L1 C/A-scene med udsendt efemeride (iq::scene: en SatGeometry med udsendt efemeride, genereret til TruthRecord-sandhedsposter): hvilke satellitter der er over horisonten, pseudoafstanden, kodefasen ved første sample, bærebølge-Doppler og pejlevinklerne for en statisk modtager, sammenlignet med den kanaltilstand, som gps-sdr-sim bygger første blok af sit eget I/Q-output ud fra, for den samme efemeride, modtager og starttid (ionosfære slået fra på begge sider)

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

seg-758af035b3ce = Fælles geometri for kommunikation og navigation på Månen

seg-11f861bdc6bf = Topocentriske pejlevinkler pr. satellit (azimut med uret fra nord, elevation) og skråafstand ved et navngivet selenografisk sted, givet satellitten i stedets Moon body-fixed-system (den validerede påstand). Nøjagtigheden af afstandsmåling i signal-i-rummet er tilgængelig som scenarieparameter, så et sweep over servicevolumen giver et KRAV til afstandsmåling frem for bestået/ikke bestået ved ét fast sigma; den parameter er et udformningsinput uden for den validerede påstand

seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, kørt som et værktøj fra xval/anise-service-geometry, binæren lunar-look-angles-xval, som ikke kalder nogen kode fra Kshana): ANISE's egen rutine for azimut, elevation og afstand (azimuth_elevation_range_sez) fra steder bygget af dens konstruktør for bredde, længde og højde på pck00011-Månen (kugle { "1737.4" } km), med satellitterne roteret ind i MOON_PA_DE440 gennem moon_pa_de440_200625.bpc. { "768" } samples over { "8" } steder (de { "4" } navngivne steder og { "4" } andre, over og under horisonten), { "12" } epoker og { "8" } satellitter stemmer inden for { "1e-6" } grad i azimut og elevation og { "1" } mm i afstand og stedets position (fastsat før sammenligningen); målt { "2.2e-12" } grad, { "2.1e-13" } grad og { "5.6e-9" } m. Påstand: stedets placering og pejlevinkler givet satellitten i stedets body-fixed-system. Realiseringen i Kshana af Månens body-fixed-system med middelrotation og parameteren for nøjagtighed af afstandsmåling ligger uden for den; enhedstestene af geometri i lukket form består som understøttende kontroller

seg-10af60b488b9 = Differentiel referencestation af NovaMoon-klassen: ophævelse af fællesmodefejl + residual, der vokser med baselinen, + DGNSS-beskyttelsesniveauer

seg-96b2627b388a = Identitet for differentiel fejlophævelse + genbrug af maskineriet for SBAS-PL i DO-229E; enkeltdifferens- og WLS-løsningen krydstjekkes desuden mod RTKLIB's lsq()/matinv() (Takasu, BSD-2-Clause, kompileret C) — uafhængig løserkode, men den samme førsteordens algebra for LOS-differens, så stadig InternalConsistency

seg-c04a3591074c = Interoperabilitetseksport for Månen

seg-91f4a066b3c0 = Eksport af månesystem + tid + efemeride afstemt efter LunaNet/IOAG (CCSDS OEM + KIF) med formatkontrol ved rundtur

seg-f5f8ed69bea7 = Månens OEM-eksport fra kshana, læst igen af det uafhængige tredjepartsbibliotek <c1/> (R. J. Anderson): tokens for system/tid og tilstand pr. epoke stemmer inden for skrivepræcisionen ({ "1" } mm / { "1e-9" } km/s), og en eksport uden TIME_SYSTEM afvises — en strukturel udvekslingsrundtur; den fysiske semantik for månesystem og tid er valideret af deres egne rækker, så denne forbliver MODELLED. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): en anden uafhængig læser, CCSDS OEM-parseren i Orekit { "12.2" } (Apache-2.0, strenge standardindstillinger), afviser begge månefiler, fordi den ikke implementerer tidssystemerne LTC og TCL (den dekoder cratens EME2000/UTC-OEM og dekoder månefilerne, når TIME_SYSTEM erstattes med TDB); oem { "0.4.5" } dekoder dem inden for den skrevne præcision kun ved at falde tilbage fra det ikke understøttede tidssystem. Udveksling af disse månefiler med gængse CCSDS-læsere er ikke påvist

seg-8ab65cbefb75 = Scoring efter rammeværker for PNT-resiliens

seg-c48198f31d63 = Delscorer pr. dimension over Kshanas egne syv resilienskategorier (ikke DHS-termer), RethinkPNT RDRR-funktioner og Yang-kriterier, hver mærket modelleret med sin drivkraft; foreløbigt RPCF-niveau med en port for begrænset forringelse. Selvvurdering afledt af simulering, aldrig certificering.

seg-f905aeb203bb = Håndafledte formler pr. måltal: inverse Simpson-diversitet, vægtet gennemsnitligt sammensat tal, afgrænsede/uafgrænsede varigheder på tidslinjen, niveaustige efter det svageste led

seg-d7bdb6fe186e = Undersøgelse af beslutningsustabilitet i resiliensscoren

seg-5fcf18a68bb1 = Kvantificerer, hvordan en enkelt sammensat score / et RPCF-niveau omrangerer arkitekturer under et forsvarligt vægtsimpleks og et trusselsensemble (top-1-vendingsrate, spredning i Kendalls tau, vendingsrate for niveau, rangintervaller); analyser af erklæret kontra målt og af diversitetskollaps.

seg-b6bf76a752a0 = Identiteter for rangstatistik i lukket form (tau i [-1,{ "1" }] med håndberegnede værdier; deterministisk seedet Dirichlet) og konstruerede stabile/ustabile vidner

seg-1bf03544a010 = Repræsentativitet af demonstrationen og afstand til flyvning

seg-db24d16d38c9 = Ærlighedsregister pr. resultat, der kvalificerer et demonstrationsoutput: dets eksterne holdepunkter, modellerede antagelser, afstande til flyvning og repræsentativt TRL-bånd, med håndhævede invarianter (valideret kræver et eksternt holdepunkt; modelleret kræver en afstand og kan ikke hævde noget over TRL { "4" }).

seg-81d3adb239c5 = Invarianter i lukket form, der svarer til compliance-disciplinen 'repræsentativitet begrundet + afstande til flyvning identificeret'; knyttet til grænsen mellem verifikationsstatus og type af uafhængig reference

seg-52ab936eb5f5 = Evidens for afvejning mellem kvante og klassisk (fælles form)

seg-a6679ed5bed7 = Ét reproducerbart TradeEvidence-objekt (fast ramme: scenarie+seed+motor; fælles værdier pr. FoM for kvante kontra klassisk med fordel i korrekt polaritet, valgfrit { "95" }%-CI, mærke valideret/modelleret), der bærer en repræsentativitetspost, så hver kvante-PNT-vertikal rapporterer afvejningen på samme ærlige måde.

seg-70da3e15ea8b = Identiteter for fordel/vinder i lukket form + tro indpakning af det eksisterende quantum_trade::TradeResult; ærligheden er knyttet til registret over repræsentativitet og til verifikationsmærkerne

seg-20fee61b3107 = Bibliotek med fejlmodeller for kvanteenheder

seg-e42eabe9bc2a = Enhedskort (optisk/fangede ioner/kviksølvion + klassiske ure genbrugt fra holdover/clock_state; koldatom-interferometer; klassiske + sammenfiltrede/enkeltfoton-tidsoverførselslinks), hvert med en repræsentativitetspost; linket med sammenfiltring tilføjer en model for tidspræcision begrænset af skudstøj (~jitter/sqrt(R*tau), straf for mørketællinger, systematisk gulv).

seg-632600203e1f = Genbrugte koefficienter for ur/CAI (holdover/clock_state, offentliggjorte værdier) + identiteter i lukket form for skudstøj/tab for linket med sammenfiltring

seg-86d71fd89f26 = Pålidelig kvantetidssynkronisering (tidsoverførsel + sikker udbredelse + anomali)

seg-d2a3d37825ef = Ende-til-ende-kæde for tidsoverførsel, kvante kontra klassisk (urets coast + linkets præcision i kvadratur), et genbrugt beskyttelsesniveau for tidssynkronisering, en FoM for sikkerhed mod forsinkelses-/genafspilningsangreb (1-P_md) og en sandsynlighed for detektion af uranomali + CUSUM-latenstid, udsendt som ærlig TradeEvidence med en repræsentativitetspost.

seg-ac95d112a17a = Budget i kvadratur i lukket form over genbrugte validerede kerner (ADEV mod Stable32/NIST; TPL-grænse; detektion analytic_pd/pmd); ærligheden er knyttet til registret over repræsentativitet

seg-eaf341ff4522 = GNSS-fri kvantenavigation

seg-908a44a9f7c7 = Kvante (koldatom-interferometer) kontra klassisk dødregning med navigationsklasse-INS under et GNSS-udfald: vækst i positionsfejl, holdover til en positionstærskel og afvejningen mellem kvante og klassisk som ærlig TradeEvidence; ærlig note om observerbarhed (bias er uobserverbar uden en positionsbestemmelse, så fejlen vokser).

seg-508f2c8884e2 = Genbrugte inertibudgetter krydstjekket mod en uafhængig dobbeltintegration i Octave af den samme ODE for dødregning (anden runtime, fælles model → ReferenceImpl) plus den offentliggjorte kortsigtede støj fra Freier-2016 som ensidet holdepunkt; det sammensatte resultat for kvante kontra klassisk forbliver MODELLED

seg-914132833f5a = Detektion af fejl/anomalier i kvante-PNT-systemer

seg-f20392820b9d = Mærket katalog over kvantefejl (urets frekvenssprang/drift/tab af lås; sensorens biastrin/udfald), en AUC for ROC af detektionsstatistikken med bootstrap-CI og en mindste detekterbar fejl ved en fast falsk-alarm-rate; en monitor med kvanteur finder mindre fejl end en klassisk, udsendt som ærlig TradeEvidence.

seg-a689ab2ebb84 = Gaussisk AUC i lukket form = Phi(mu/(sigma*sqrt2)) krydstjekket mod den eksternt validerede eval_stats::bootstrap_auc_ci (mod scikit-learn) + analytiske detektionstærskler

seg-0633e05d393f = Drejningsmomentfri attitudedynamik for et stift legeme

seg-23f43007bcbf = Eulers rotationsbevægelsesligninger (I ω̇ = τ − ω × Iω, hovedakse og generel inertitensor) koblet til kvaternionkinematik for attituden (q̇ = ½ q ⊗ ω) og propageret med en RK4-integrator med fast trin, som renormaliserer kvaternionen i hvert trin

seg-2d21a01ea132 = Basilisk { "2.9.1" } propagering af stift legeme for rumfartøjets hub (AVSLab, ISC; MRP-attitude gennem dens egne koblede hubligninger, svIntegratorRKF78 ved relativ tolerance { "1e-12" }), en uafhængig implementering af ligningerne for drejningsmomentfrit stift legeme: RK4-kvaternionen i Kshana (dt { "0.01" } s) og legemets rater stemmer inden for { "1e-9" } over { "1e4" } s på to generelle ikke-diagonale inertier (værst { "3.3e-11" } og { "3.4e-12" } rad/s); tolerancen fastsat før sammenligningen. Valideret påstand: drejningsmomentfri bevægelse; leddet for eksternt drejningsmoment sammenlignes ikke. Kontrollerne af bevarelseslove og symmetrisk top består som understøttende selvkonsistens. Intet miljø med fleksibelt legeme / reguleringssløjfe / eksternt drejningsmoment

seg-93b8ba1ba0e5 = Clohessy–Wiltshire / Hill-dynamik for relativ bevægelse

seg-17f27a95d009 = Relativ bevægelse for en jager omkring et mål på en cirkulær referencebane i LVLH-systemet: de lineariserede Clohessy–Wiltshire-ligninger (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) løst med den lukkede tilstandstransitionsmatrix { "6" }×{ "6" } Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) med betingelsen for afgrænset relativ bane ẏ₀=−2n·x₀ og en andenordens korrektion i lukket form (cw_dynamics::second_order_correction, CW-responset på de kvadratiske led i de eksakte ligninger for cirkulær chief; Karlgaard og Lutze { "2003" }, Newman, Lovell og Pratt { "2015" }) sammensat som cw_dynamics::propagate_second_order. Det validerede output er propagate_second_order; den lineære Φ alene er karakteriseret mod ikke-lineær sandhed, ikke valideret

seg-d31be81dfd8f = Passiv geolokalisering af sender med TDOA/FDOA

seg-aa870cee16f6 = Lokalisér en sender (jammer/spoofer eller en opportunistisk kilde til reverse-PNT) ud fra tidsforskel i ankomst (time-difference-of-arrival) på tværs af et modtagernetværk — skæringen af hyperboloider τᵢ=(Rᵢ−R₀)/c løst med Gauss–Newton mindste kvadrater — og ved at tilføje frekvensforskel i ankomst (forskelle i afstandsrate) med bevægelige modtagere genfind position og hastighed i fællesskab; med Cramér–Rao-nedre grænse for positionskovariansen ud fra målegeometrien

seg-36b74b49f82f = Maksimal opbremsning ved ballistisk 3-DoF-indflyvning mod det offentliggjorte nominelle tilfælde for Stardust

seg-a05ca2fde6fc = En 3-DoF-punktmasse-indflyvning over en roterende kugleformet Jord gennem US Standard Atmosphere { "1976" }, integreret med RK4 fra en inertial indflyvningstilstand, med rapportering af den maksimale opbremsning og dens højde; den planet-relative indflyvningstilstand udledt af den inertiale. Kan køres som scenarietypen <c1/>.

seg-5ab7065c0803 = Det nominelle tilfælde for Stardust hos Desai, Mitcheltree og Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maksimal opbremsning { "33.4" } g fra { "12.6" } km/s planet-relativt med opsendelsesmassen { "45.8" } kg, en 6-DoF POST-bane med den fulde aerodynamiske database; indflyvningsgrænsefladen fra Desai, Lyons, Tooley og Kangas (NTRS { "20090004445" }): radius { "6503.14" } km, inertial { "12.9" } km/s ved -8.2 grader. Tærskler præregistreret i xval/entry-stardust/PREREGISTRATION.md før nogen kørsel på disse input; begge holdt ved første kørsel. HVAD DER IKKE ER: ét offentliggjort tilfælde og én størrelse (maksimal opbremsning, som i den ballistiske tilnærmelse ikke afhænger af den ballistiske koefficient); indflyvningens breddegrad og kurs er antaget; opvarmning, varmebelastning og landingspunktet er ikke kontrolleret mod den; punktmasse med konstant C_D, ikke 6-DoF.

seg-5bd3882531b6 = Konvektiv opvarmning ved indflyvning i stagnationspunktet (Sutton-Graves) på en 3-DoF-indflyvning

seg-4f97036ed72f = Konvektiv varmeflux i stagnationspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterne for luft på Jorden og atmosfæren på Mars (NASA TR R-376, { "1971" }), dens maksimum og den integrerede varmebelastning langs en 3-DoF-indflyvning, ballistisk eller løftende ved konstant krængning, på Jorden eller Mars.

seg-5a203ecfeaee = Intern konsistens: sammenhængen og konstanterne som trykt i NASA TR R-376, en konvergenskontrol med halvt trin og den forventede rækkefølge af maksima for opvarmning og opbremsning. HVAD DER IKKE ER: ingen offentliggjort opvarmningsværdi er sammenlignet (Stardust-artiklerne angiver en konstruktionsgrænse og et konvektivt-plus-radiativt estimat på omkring { "1200" } W/cm2, som en rent konvektiv sammenhæng ikke kan ramme); ingen radiativ opvarmning, korrektion for vægtemperatur eller katalycitet, eller respons fra termisk beskyttelse.

seg-1b96577665fc = Radiometri, MTF, relativt kantrespons og GIQE { "4" } NIIRS for elektro-optisk billedoptager

seg-38902593e841 = Signal-til-støj-budget for en nadir-billedoptager (lambertsk scenelysstyrke, kameraligning, skud-, mørkestrøms-, udlæsnings- og kvantiseringsstøj), systemets MTF ved Nyquist som produktet af diffraktion for uafskærmet apertur, detektoraperturen, lineær udtværing og gaussisk jitter, kantresponset og det relative kantrespons integreret ud fra denne MTF, Q = lambda F / p og GIQE version { "4" } NIIRS uden MTF-kompensation. Kan køres som scenarietypen <c1/>.

seg-bb3a01edc95d = Lukkede former: diffraktions-MTF ved halv afskæring, kanten som en rampe på én pixel for en ren detektorapertur (RER { "1" }), normalfordelingens CDF-kant for en gaussisk udtværing (RER = erf(0.5/(sigma sqrt { "2" }))), skalering af skudstøj og GIQE { "4" }-koefficienterne som offentliggjort (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). HVAD DER IKKE ER: ingen ekstern billedoptager, målt MTF eller bedømt billede er sammenlignet; GIQE er en empirisk regression med sin egen fejl; ingen strølys, atmosfærisk MTF, MTF-kompensation eller aliasing.

seg-07ca77a67207 = Tab ved opsendelsesopstigning: tyngdekraft, luftmodstand, styring og modtryk

seg-7a1802cf2c80 = Plan opstigning i tyngdekraftsdrejning for et flertrinskøretøj over en ikke-roterende kugleformet Jord gennem US Standard Atmosphere { "1976" } (massefylde og tryk), med et pitch-kick, en trækkraft reduceret af dysens modtryk, udbrændinger af trin ved eksakte tringrænser og tabene ved tyngdekraft, luftmodstand, styring og modtryk integreret ved siden af tilstanden. Kan køres som scenarietypen <c1/>.

seg-174ed29adbbe = Intern konsistens: den eksakte identitet udbrændingshastighed = sum Isp g0 ln(m0/mf) minus de fire integrerede tab (residual under { "1e-6" } m/s), Tsiolkovskijs ligning på en lodret udbrænding i vakuum med tyngdekraften som eneste tab og US76-trykkene ved havets overflade og tropopausen. HVAD DER IKKE ER: ingen offentliggjorte køretøjers tab er sammenlignet; ingen jordrotation, coast, drosling eller styring ud over kicket; konstant C_D; ikke en banemaksimerer.

seg-55e8345def8b = TWSTFT-tovejsligning, usikkerhedsbudget og linkstabilitet med flicker og dagligt ikke-reciprokt led

seg-5ca5226c24ec = TWSTFT-tovejsligningen løst for T_A - T_B med stationernes sende- og modtageforsinkelser, den ionosfæriske op/ned-asymmetri i Ku-båndet, forskellen i transponderforsinkelse og Sagnac-leddene, mod dens eksakte fremadmodel; et usikkerhedsbudget i kvadratur med linkets TDEV som type A-led; en tovejsserie med hvid og flicker-fasestøj (Kasdin-Walter), et dagligt ikke-reciprokt led og en konstant residual for reciprocitet; samt raten, residual-RMS, TDEV og ADEV for leverede stationsurserier fra Circular T, MJD-CSV eller IGS RINEX. Kan køres som scenarietypen <c1/>.

seg-244f7396ac25 = Intern konsistens: fremadmodellen og den løste ligning stemmer til { "1e-15" } s, Sagnac-leddet er lig modulets uafhængige BIPM 2A-sløjfeform omega/c^{ "2" }, det ionosfæriske led er { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, og støjprocesserne viser deres forventede TDEV-former. HVAD DER IKKE ER: ingen rigtig TWSTFT-måling eller kalibreringsrapport er sammenlignet; de angivne forsinkelser og usikkerheder er input, ikke målt; stabiliteten af leverede serier rapporteres, ikke valideres.

seg-2f9be02c92bc = Numerik for optisk atmosfære på skråsti: Rytov-varians, scintillation, fadingsandsynlighed for gamma-gamma, aperturmiddelværdi, skyers og klar lufts optiske dybde

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integreret langs en skråsti til Rytov-variansen for plan- og kugleformet bølge (uplink og downlink), Andrews-Phillips-scintillationsindekset og gamma-gamma-parametrene, fadingsandsynligheden og fademarginen for gamma-gamma, aperturmiddelværdifaktoren ved svag turbulens, den optiske dybde af skyer for en søjle af flydende vand og den optiske dybde for klar luft efter Kim-sigtbarhed plus Rayleigh, som erstatter det samlede atmosfæriske tab i det optiske linkbudget, når en atmosfære leveres. Kan køres inde i scenarietypen <c1/>.

seg-7ca512adff99 = Numerikken sammenlignes med et uafhængigt program (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } med { "30" } cifre, tanh-sinh-kvadratur på den oprindelige højdevariabel og Bessel-K-gamma-gamma-tætheder), som ikke deler kode med Kshana, under tærskler fastsat før nogen implementering fandtes (xval/optical-atmosphere/PREREGISTRATION.md). HVORFOR MODELLED: den reference evaluerer de samme offentliggjorte formler, så den kontrollerer implementeringen af de angivne formler og ikke atmosfæren; intet valideringseksempel fra ITU-R og ingen målt scintillations- eller skråstiekstinktionsregistrering bruges (ITU-værdierne er en åben licensbeslutning og holdes uden for repositoriet). Niveauet i Cn2-profilen, sigtbarheden, skalahøjderne for aerosol og molekyler, aperturmiddelværdiens stilængde og momentmatchningen, der bruges til at anvende aperturmiddelværdi på gamma-gamma-parametrene, er angivne input eller konventioner. En kildelinje i modulet noterer, at én udbredt kopieret oversigt trykker den anden scintillationseksponent som 7/6, hvor Andrews og Phillips angiver 5/6; formen med 5/6 er implementeret

seg-a2faab92e760 = Vejrdrevet tilgængelighed for optisk jordstation og afstandskorreleret stationsdiversitet

seg-7f4e4e763d62 = Tilgængelighed af et optisk link mod en angivet linkmargin ud fra et lognormalt klima for flydende vand i skyer (mængde efter ITU-R P.840, ekstinktion i geometrisk optik) og det uafhængige turbulensfading for gamma-gamma, den linkmargin der behøves for målrettede tilgængeligheder og det loft, ingen margin kan løfte, lognormale varigheder af udfald, hvad-nu-hvis for forbedringsteknikker og en ét-faktor gaussisk copula-netværkstilgængelighed, hvis parkorrelation er exp(-afstand/dekorrelationslængde). Kan køres som scenarietypen <c1/>.

seg-20eab6e9b925 = Intern konsistens: grænser i lukket form og monotoni for diversitetsmodellen, den lukkede form for skyloftet og de lognormale identiteter for udfald. INGEN ekstern uafhængig reference gøres gældende, og ingen er sammenlignet: ingen målt registrering af tilgængelighed for optisk jordstation eller fri sigtelinje uden skyer bruges. HVORFOR MODELLED: skyklimaet (sandsynlighed for skyer, median og spredning af søjlen af flydende vand, varigheder af udfald), uafhængigheden af skyer og turbulens, den gaussiske copulaform, dekorrelationslængden og hver teknikgevinst er antagelser; de medfølgende scenarier angiver ILLUSTRATIVE klimaer, ikke et datasæt. At opgradere denne række kræver en citeret målt registrering af tilgængelighed og en tærskel registreret før sammenligningen

seg-043ece801e72 = Kontinuitet i tidssynkronisering og afstandsmåling gennem optiske udfald

seg-bb9cb3fe4180 = Fordelingen af varigheden af udfald for et optisk sted koblet til den lukkede coast-varians i holdovermodellen for ur: fejl i tidssynkronisering og afstandsmåling ved angivne kvantiler af udfald, holdover til en tærskel for tidssynkronisering, andelen af udfald og af udfaldstid inden for den og tilgængeligheden af tidssynkronisering A + U E[min(D, T_h)]/E[D], for de klassiske og kvanteurklasser. Kan køres inde i scenarietypen <c1/>.

seg-ab2a33c1b1a4 = Intern konsistens med holdovermodulet, bit for bit; INGEN ekstern uafhængig reference gøres gældende. Klassernes PSD'er er de syntetiserede gulve ved lang tau, som holdovermodulet allerede bærer, så tallene arver dets angivne forbehold om, at holdover til en stram tærskel styres af det antagne gulv med rød støj og ikke af den citerede Allan-deviation. Varighederne af udfald er en lognormal model med angivne parametre, ikke en målt registrering af skyopholdstid

seg-b119df65d2a7 = Optisk linkmargin over tid: én seedet realisering af vejret på et sted

seg-06125f3cae90 = En tilvalgt tabel <c1/> (duration, step, seed) får typen <c2/> til også at skrive, pr. sted, én seedet realisering af den angivne stedsmodel gennem tiden: skyepisoder (klare perioder eksponentielle, skyudfald lognormale med angivet middelværdi og spredning, andelen af tid i skyer sat til den angivne sandsynlighed for skyer), én lognormal søjle af flydende vand pr. skyepisode, ét gamma-gamma-scintillationssample pr. trin og ud fra dem linkmarginen, fadingerne fra skyer og scintillation og flaget for link oppe, med den realiserede tilgængelighed, skyandel, antal udfald og længste udfald. Uden tabellen er resultatet dokumentet fra { "0.37" }. Trækkene går gennem de portable fordelings- og matematikruter, så native og wasm32 giver de samme bytes.

seg-d25e5d2449bd = Kun intern konsistens; INGEN ekstern uafhængig reference gøres gældende, og ingen findes for en realisering af vejret. Kontrollerne sammenligner ét træk med det statistiske output fra den samme model, så en bestået kontrol siger, at generatoren udtrækker de angivne fordelinger (trækkets tilgængelighed og skyandel ligger inden for præregistrerede tolerancer af de angivne tal), ikke at noget rigtigt sted opfører sig sådan. Serien er én realisering, ikke klimaet: dens tilgængelighed afviger fra den angivne med trækkets stikprøvefejl, og scintillationssamples i forskellige trin er uafhængige, en angiven forenkling af en proces, der dekorrelerer på millisekunder. Vejrinputtene forbliver scenariets antagelser.

seg-58cbf576c959 = Læser af TRK-2-18 Orbit Data File og model for rampet 2-vejs-Doppler ved Mars

seg-d1055650a77f = En læser af DSN Orbit Data Files (TRK-2-18): postgrupperne på 36 byte (filmærkat, identifikator, banedata, ramper pr. station, urforskydninger, sammendrag, filslut), og i hver banedatapost tidsmærket siden { "1950" }, forsinkelser i downlink og uplink, observabel, stationer, datatype, bånd, gyldighed, kanal, rumfartøj, referencefrekvensen på 46 bit og kompressionstiden; start- og sluttider, rater og startfrekvenser for ramper. Ovenpå den en model for rampet 2-vejs X-bånd-Doppler (integrerede uplink-ramper, rundturs-lystid med Shapiro og troposfære, DSN-stationer gennem IAU 2006/2000A CIO-kæden og IERS EOP, stationstid) og en batch-banebestemmelse for Mars-orbiter (GMM-3-felt, tredjelegemer, SRP, drag).

seg-6d533149f6f0 = PDS3-mærkatet, som DSN's proces til datakonditionering for navigation frembragte sammen med filen (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), kontrolleret mod tærskler præregistreret i xval/mro-odf/PREREGISTRATION.md før læseren fandtes. MODELLED, fordi én registreret tærskel (rækkerne i tabellen for filslut, { "121" } i filen mod { "120" } i mærkatet) ikke blev nået; mærkatet er internt uforeneligt her. Trin { "2" } (xval/mro-od/PREREGISTRATION.md, ændringerne A1 og A2 før det scorede resultat): den Doppler, der er forudsagt ud fra rekonstruktionen fra MRO's navigationshold (mro_psp5, NAIF), stemmer med den observerede rampede 2-vejs-Doppler til { "12.5" } mHz på passager, der ikke blev brugt under udviklingen, tærskel nået; den registrerede banebestemmelse mislykkedes på den scorede bue (normalmatrix ikke positiv definit) og gav ingen bane, så banetærsklerne blev ikke nået. Kørsel { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, en dæmpet estimator, samme bue og tærskler, en scoringsændring R2-A1 oplyst i docs/revisions) konvergerede: den estimerede bane ligger inden for { "0.36" } km RMS ({ "0.53" } km maksimum) af rekonstruktionen, tærskler nået, men Doppler-RMS efter tilpasning er { "48.6" } mHz mod tærsklen på { "30" } mHz, ikke nået, så rækken forbliver MODELLED. HVAD DER IKKE ER: ingen estimeret bane har nået hver registreret tærskel; ionosfære, solplasma og det meste af antenneforskydningen (en radial forskydning på { "1.5" } m tilpasses på udviklingspassagen) er ikke modelleret.

seg-c7d292f14693 = Attitudestyring med MRP-feedback i lukket sløjfe med reaktionshjul

seg-f33781b74cc2 = Inertial pegestyring af en stiv hub med tre eller flere afbalancerede reaktionshjul: MRP-feedbackloven L_r = -K sigma_BR - P omega_BR (Schaub og Junkins), motormomenter til hjulene med mindste norm G_s u = -L_r begrænset til hvert hjuls grænse, den koblede dynamik for hub og hjul, hvor hubbens inerti bærer hjulenes spininerti, kvaternionkinematik og RK4 med zero-order hold. Kan køres som scenarietypen <c1/> (sløjfe med sand tilstand).

seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; bsk-hjulkørslen som et separat værktøj, aldrig linket eller vendoret): rumfartøjets hub, reactionWheelStateEffector (BalancedWheels, momentgrænse slået til), simpleNav, inertial3D, attTrackingError, mrpFeedback (uden integralled) og rwMotorTorque ved dt = { "0.1" } s med dens RK4, mod Kshanas egen implementering i tre tilfælde (tre ortogonale hjul; en firehjulspyramide; et mættende firehjulstilfælde), tærskler præregistreret i xval/aocs-basilisk/PREREGISTRATION.md før koden og kørslen. Alle tærskler holdt ved første kørsel. HVAD DER IKKE ER: sensorstøj i sløjfen, integralfeedback, sporingsstyring, hjulfriktion, jitter, hastighedsgrænser og effekt, noget rigtigt rumfartøjs forstærkninger; sammenligningen kontrollerer implementeringen af loven og dynamikken mod en uafhængig, ikke en flyvekontroller.

seg-455dc946c965 = Multiplikativt EKF til attitudeestimering ud fra et gyro og en stjernesensor

seg-553d043438b4 = Det multiplikative EKF af Lefferts-Markley-Shuster: attitudefejl i legemssystemet og gyrobiastilstande, propagering med gyroraten minus biasestimatet og Farrenkopfs diskrete processtøj (vinkel- og rateflugt), opdateringer fra stjernesensoren med residualen { "2" } vec(q^-1 q_st) i Joseph-form og den multiplikative nulstilling; en diskret Farrenkopf-simulator for gyro og stjernesensor. Typen <c1/> kan lukke styresløjfen på sit estimat.

seg-846cb1eeb35c = Intern konsistens: filterets normaliserede kvadrerede estimationsfejl mod sandheden simuleret ud fra de samme sensormodeller over Monte Carlo-seeds og konvergens af attitude- og biasestimaterne. HVAD DER IKKE ER: ingen ekstern estimator eller flyvedata er sammenlignet (Basilisk { "2.9.1" } har intet MEKF-modul); sensormodellerne er lærebogsmodellerne uden forskydning i monteringen, skalafaktor eller effekter af stjernesensorens synsfelt.

seg-059732bda693 = Attitudebestemmelse med Wahba/TRIAD/QUEST

seg-3ee6e56d790f = Optimal tre-akset attitude ud fra vægtede vektorobservationer (retninger til stjerne/sol/magnetometer): den deterministiske tovektor-TRIAD, Davenports q-metode (den eksakte minimerer af Wahba-tabet — den optimale kvaternion er egenvektoren til den største egenværdi i Davenport-matricen K på { "4" }×{ "4" }, løst med en symmetrisk Jacobi-egenværdiløsning) og QUEST (Newton/sekant-rod af K's karakteristiske ligning med start ved Σ vægte, derefter genfinding af kvaternionen via Gibbs-vektor)

seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — Kabsch/Markley-SVD-løsningen af Wahbas problem, en reelt uafhængig algoritme (SVD af attitudeprofilmatricen) og kodebase i forhold til egenværdiløsningen med Davenport-K og rodmetoden for karakteristisk polynomium i QUEST fra kshana, som beregner den SAMME entydigt definerede Wahba-optimale attitude. På støjfri vægtede sæt af vektorobservationer gengiver TRIAD, q-metoden og QUEST scipys optimale rotation til <{ "1e-9" } rad (sammenlignet via vinklen for attitudefejl, som er uafhængig af fortegn). Den støjede Monte Carlo-statistiske påstand 'optimal slår TRIAD' forbliver MODELLED (ingen ekstern uafhængig reference); kun punktretnings-enhedsvektorobservationer — ingen modellering af sensorens synsfelt/bias/tidsmæssig korrelation, og QUEST er singulær ved { "180" }° (q-metoden dækker det tilfælde)

seg-cd342cc48afc = Detektionsstatistikker for GNSS-erhvervelse med kvadratlov

seg-6d97452de33e = Kvadratlov-detektor (ikke-koherent) for erhvervelse over en søgning i kodefase × Doppler: falsk-alarm-sandsynlighed (central χ² med 2M frihedsgrader), tærsklen der opnår en målrettet P_fa (χ²-CDF inverteret ved bisektion) og detektionssandsynlighed (ikke-central χ² med ikke-centralitet 2M·ρ for SNR pr. celle efter korrelation ρ), med den generaliserede Marcum Q-funktion Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — en uafhængig algoritme (kædebrøk for ikke-central/central χ²) i forhold til den ufuldstændige gammaserie i kshana (raim::chi2_cdf / noncentral_chi2_cdf), som beregner den samme entydigt definerede KERNE for detektionsstatistik: den generaliserede Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²), detektionssandsynligheden P_d, falsk-alarm-sandsynligheden P_fa og inversionen P_fa→tærskel, afstemt til ~{ "1e-6" } — samme grundlag for uafhængighed som den validerede række 'statistisk kerne for RAIM/ARAIM-integritet'. KUN kernen: CFAR med celleaveraging pr. celle og tabet ved kode-/Doppler-intervaller forbliver MODELLED

seg-77f425a38aa2 = Opløsning af heltalsmultiplicitet i bærebølgefase for GNSS (LAMBDA)

seg-410ce8b6cebf = Fastsættelse af heltalsmultiplicitet med mindste kvadrater på LAMBDA-måden: en volumenbevarende heltals-dekorrelerende (Z) transformation (heltals-Gauss-størrelsesreduktion af faktoren L D Lᵀ) + en eksakt depth-first branch-and-bound-søgning efter Schnorr–Euchner for heltals-mindste-kvadrater, med ratiotesten på de to bedste kandidater (den validerede påstand); plus den lukkede bootstrappede succesrate P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), som kun kontrolleres internt og ligger uden for den validerede påstand

seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (dens kildefil lambda.c, T. Takasu, BSD-2-Clause), en uafhængig LAMBDA-reduktion og MLAMBDA-søgning kompileret fra C og kørt som et værktøj, på { "300" } tilfældige kovarianser (n { "2" } til { "10" }): mindste kvadrater med heltal har en entydig minimerer, så de fastsatte heltal skal være identiske ({ "0" } afvigelser), og de to bedste kvadrerede normer, som indgår i ratiotesten, stemmer til { "1e-9" } relativt (målt { "5.6e-13" }); tolerance fastsat før sammenligningen. Valideret påstand: ILS-løsningen og dens to bedste normer. RTKLIB beregner ikke den bootstrappede succesrate, som forbliver kontrolleret internt mod en Monte Carlo af afrundingsprocessen; invarianterne i Z-transformationen og den udtømmende optælling består som understøttende kontroller. Kun heltals-Gauss-dekorrelation (omordningspermutationerne i den fulde LAMBDA-reduktion fremskynder søgningen, men ændrer hverken det eksakte ILS-svar eller den bootstrappede rate)

seg-4ad1ec05610f = B-plan-sigtning og patched-conic-tyngdekraftsassistance

seg-d249aea7c3ea = Geometri for hyperbolsk forbiflyvning (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, drejningsvinkel δ={ "2" }·asin(1/e), afstandsparameter |B|=|a|·√(e²−{ "1" })), sigtepunktsystemet Ŝ/T̂/R̂ i B-planen og dekomponeringen B·T̂/B·R̂, og en patched-conic-tyngdekraftsassistance (størrelsen af v∞ bevaret, retningen afbøjet med δ, heliocentrisk Δv={ "2" }·v∞·sin(δ/2) uden omkostning i drivmiddel) med Tisserand-parameteren T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

seg-8e82da17a463 = CRPA-strålformning mod jamming med antennearray

seg-1744f527b4d1 = Nulstyring for antenne med kontrolleret modtagemønster: komplekse styrevektorer for arrayet a(û)=exp(j·k·pₙ·û), deterministisk nulstyring (enhedsforstærkning mod SV, eksakte nuller mod op til N−{ "1" } jammere via minimumsnormen w=Aᴴ(AAᴴ)⁻¹b) og adaptive MVDR-vægte w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv), som selv styrer dybe nuller mod stærke interferenskilder (med en kompleks lineær-algebra-kerne skrevet fra bunden)

seg-8016dae66350 = numpy.linalg / scipy.linalg (LAPACK zgesv kompleks løsning) — en lineær-algebra-kodebase, der er uafhængig af den komplekse kerne fra bunden i kshana, og som beregner de SAMME entydigt definerede vægte: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) og nulstyring med minimumsnorm w=Aᴴ(AAᴴ)⁻¹b, plus de resulterende forstærkninger af arrayresponset, afstemt til ~{ "1e-9" } — samme klasse af uafhængig reference som rækkerne for validerede DOP (gnss_lib_py) og Fisher-information (numpy). MODELLED smalbåndsarray i fjernfeltet med identiske isotrope elementer — ingen gensidig kobling, afvigelse mellem elementer, endelig båndbredde (STAP) eller fejl i estimeringen af styrevektoren

seg-f2c973f14d52 = IEEE-1139 potenslovsstøj for ur + flicker-FM-gulv

seg-4a0159558671 = Konverteringen med fem koefficienter i IEEE-1139 mellem PSD og Allan-varians S_y(f)=Σh_α f^α → σ_y²(τ) (hvid/flicker-PM, hvid/flicker/random-walk-FM), flicker-FM-gulvet σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) som et førsteklasses tilpasseligt led og en ikke-negativ tilpasning af FM-familien i basen { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" }, som genfinder det gulv, driftbasen { "{" }1/τ,τ,τ³{ "}" } ikke kan repræsentere

seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; koefficienter fra Kasdin & Walter { "1992" } / Vernotte { "2015" }) — en uafhængig tredjepartskodebase og citationslinje, som beregner den SAMME entydigt definerede IEEE-1139-konvertering fra PSD til Allan σ_y(τ) for hver af de fem typer potenslovsstøj. powerlaw::allan_deviation i kshana stemmer med de lukkede former i allantools (hvid/flicker-FM, RW-FM og hvid PM til <{ "5e-9" } relativt; flicker-PM til ~{ "1e-5" } — det egentlige signal om uafhængighed, da kshana bruger den tabulerede konstant { "1.038" } fra NIST-SP-1065 mod den fulde 3γ−ln2 i allantools), og flicker-FM-gulvet √({ "2" } ln2·h_{ "{" }-1{ "}" }) stemmer med allantools over hele rækken — den samme tærskel, som de validerede rækker for MDEV/TDEV/Theo1/MTIE klarer. MODELLED stationær potenslovsmodel — intet deterministisk driftled (τ²); koefficienter pr. enhed / målte gulve forbliver modelleret

seg-cc1ac065e684 = Udveksling af kovariansblok i CCSDS OEM

seg-ec4d44e7cf78 = Serialisér og fortolk CCSDS { "502.0" } OEM-blokken COVARIANCE_START…COVARIANCE_STOP — positions-/hastighedskovariansen på { "6" }×{ "6" } skrevet som sin nedre trekant med 21 elementer (kanonisk rækkefølge CX_X … CZ_DOT_Z_DOT) med den valgfrie COV_REF_FRAME, som supplerer den eksisterende OEM-skriver/-parser for tilstandsvektorer, så kovarianser fra banebestemmelse og filtre kan sendes rundt i standardformatet

seg-ae061c7f082c = Fejlvækst og tærskelkrydsninger ved INS/TRN-coast

seg-7bacdc8aa0d8 = Budget for positionsfejl mod coast-varighed bygget ud fra IMU-koefficienter, hver fejlkilde (accelerometerbias, gyrobias, hastighedsrandomwalk, vinkelrandomwalk, skalafaktor under marchfart og under vedvarende specifik kraft) propageret gennem en INS-fejlmodel med ni tilstande i lokalt niveau med Schuler-feedback (inertial::coast::ErrorDynamics efter Groves 2. udg. kap. { "14" }: fejl i attitude, hastighed og position, den lodrette kanal med sin tyngdegradient, WGS-84-radier og normaltyngde, en vandret platform med kurs mod nord ved den konfigurerede fart, latitude_deg og height_m; systematiske led ved en udvidet matrixeksponential, random walks ved Van Loan), flat-Jord-monomierne bevaret kun som leading_order_m; bidrag kombineret efter en angivet regel (rss / linear-sum / deterministic-sum-with-stochastic-rss); de coast-varigheder, der når positionstærskler leveret af kalderen ({ "10" } m og { "50" } m som standard), lokaliseret ved en fremadgående scanning efter den første krydsning (first_crossing_s, da kurverne afgrænset af Schuler ikke er monotone), med den dominerende kilde ved hver krydsning; og en TRN-afgrænset tilstand, der giver det største interval mellem terrænpositionsbestemmelser, som holder hver tærskel. Kan køres som scenarietypen <c1/>

seg-a971ff07592a = Arbejdscyklus for apertur: navigation kontra kommunikation

seg-5b0ba97379bf = Én kørsel tager en kontaktplan (en liste af vinduer aos_s/los_s, hvert med anmodning til aperturen om navigation eller kommunikation — det samme vindues-vokabular som <c1/> udsender, konverteret af <c2/>), et antal aperturer og en eksplicit arbitreringspolitik, og returnerer navigationsarbejdscyklussen, kommunikationsarbejdscyklussen, den ledige arbejdscyklus og udfaldet pr. session. Politikken er et input med en dokumenteret standard (<c3/>; også <c4/> og ikke-præemptiv <c5/>), og rapporten bærer den løste politik, dens fulde definition og definitionerne af arbejdscyklus og udfald, fordi et arbejdscyklustal oplyst uden sin arbitreringsregel ikke kan gengives. Planen er et eksakt intervalsweep over vinduesgrænserne, så et vindue, der slutter præcis, hvor det næste begynder, aldrig konkurrerer, og aperturesekunder for navigation, kommunikation og tomgang akkumuleres uafhængigt i det ene sweep. Kan køres som scenarietypen <c6/>

seg-656fd7d44a9e = Intern konsistens, ud fra tre størrelser beregnet med forskellige udtryk i samme sweep og derefter krævet at gå op. Aperturesekunder til navigation, aperturesekunder til kommunikation og aperturesekunder i tomgang akkumuleres hver for sig — tomgang ud fra (aperturer − |serveret|) pr. elementært interval, aldrig som en rest — og deres sum kontrolleres mod aperturer × horizon_s, hvilket en forkert afgrænset grænse, et dobbelttalt interval eller et udeladt interval straks bryder; de serverede tider pr. session skal desuden hver for sig lægge sig til de to totaler for service. Planlæggerens strukturelle egenskaber er målt frem for antaget: serveret tid kontrolleres at være ikke-aftagende i antallet af aperturer over { "200" } pseudotilfældige planer for alle tre politikker (ikke indlysende for den ikke-præemptive politik, hvor en ekstra apertur ændrer, hvem der har hvad ved hver senere grænse), og grænsearitmetikken er fastholdt ved parret med berøring/overlap på ét sekund, hvor en off-by-one ellers ville skjule sig. Broen til pasforudsigeren kontrolleres mod output fra <c1/>: med én apertur og ingen konkurrerende service er aperturesekunderne til navigation lig forudsigerens egen sum af pasvarigheder. Ingen ekstern uafhængig reference gøres gældende, og ingen findes: kapaciteten afløser regning i hånden frem for at blive kontrolleret mod den, den medfølgende kontaktplan er illustrativ frem for fløjet, og ingen operationel planlægger offentliggør et par af plan og svar med sin arbitreringsregel angivet — et arbejdscyklustal beregnet under en uangivet politik kan ikke sammenlignes med et beregnet under en angivet, og afhængigheden af politikken er målt (arbejdscyklusser for navigation på 100/150 mod 50/150 på den identiske plan). Omstillingstid og slew, datamængde, bufferstatus, energi og linklukning er udelukket i rapportens mærkat frem for at være modelleret i det skjulte

seg-43cd7aa7ab53 = RF-jamming af navigation på månens overflade (J/S pr. satellit)

seg-e0566f37ad8f = Måne-native forhold mellem jammer og signal, effektiv C/N₀ og tab af lås for en selenografisk bruger på overfladen under en jammer på månens overflade (eller hævet), over den illustrative konstellation af Moonlight/LCNS-klassen fra offentlige kilder. Sammensætter den åbne jammingkæde (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) med den åbne geometri for månehimlen (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri udledes igen. I modsætning til typen <c1/> for Jorden er signalleddet ikke en fast modtaget effekt: hver satellits isotrope modtagne effekt er dens eget linkbudget EIRP − FSPL(skråafstand), så J/S varierer fra satellit til satellit med afstand og elevation på Månen. Udsender ÉN RÆKKE PR. SYNLIGT LINK (epoke, satellit) som JSON og som artefakt *.table.csv, med begge modtagne effekter, hvis forskel J/S er, trykt ved siden af; aggregerede kvalitetsmål står ved siden af tabellen, aldrig i stedet for den. Kan køres som scenarietypen <c2/>

seg-2a4393ae7c52 = Sammensætningskontrol mod en uafhængig kodesti i samme repository: hvert J/S pr. link udledes igen som forskellen mellem to linkbudgetter beregnet med linkbudget::received_signal_power_dbw, hvis frirumstab er det enkelte udtryk { "20" }·log10(4πRf/c) frem for den sum af tre led, som jamming::free_space_path_loss_db bruger — de to stemmer til < { "1e-9" } dB på hver række (målt værste tilfælde { "7.11e-14" } dB, dvs. afrundingsfejl i flydende tal). Den underliggende interferenskæde, den sammensætter, er særskilt forankret eksternt i tests/gnss_denied_jamming_resilience_reference.rs (uafhængig genafledning i numpy/scipy af J/S og effektiv C/N₀ fastlåst til Kaplan & Hegarty §{ "9.4" }, plus målt C/N₀ fra JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); den månegeometri, den sammensætter, er geometrien i lunar_service/lunar med egne uafhængige referencer. Identiteter i lukket form kontrolleret her: en halveret afstand til jammeren lægger præcis { "20" }·log10({ "2" }) dB til hver række; J/S er præcis uforanderlig over for brugerantennens forstærkning i boresight, mens C/N₀ flytter sig præcis med den forstærkning; en elevationsmaske ændrer ingen overlevende række bit for bit. Selve rækken forbliver ReferenceImpl/modelleret: ingen målt kampagne for jamming på Månen findes at validere mod, og konstellationen er en illustrativ geometri af Moonlight/LCNS-klassen fra offentlige kilder, ikke en fløjet efemeride

seg-4c116e25c5c5 = Kontur for denial på Månen med et usikkerhedsbånd ud fra den målte spredning i C/N₀

seg-77828c25f3ab = Rapporten <c1/> hviler ikke længere sin denial-kontur på én skalar. Den udsender den fulde målte fordeling af C/N₀ for det ønskede signal over tabellen pr. satellit — n, min, p05, p25, median, p75, p95, max, middelværdi, stikprøvens standardafvigelse og stikprøvens egen asymmetri (p95 − median) − (median − p05) — ved siden af rækkerne pr. link, som er uændrede. Konturen rapporteres derefter ved hver af disse ordensstatistikker under BEGGE denial-kriterier, motoren kender, aldrig det ene i stedet for det andet: det hidtidige kriterium for effektforhold (J/S = { "30" } dB, den samme tærskel som attack_surface og tracking_loop bruger, og kriteriet bag kolonnen <c2/> i den udgivne tabel for månelinks med jamming), og kriteriet tab af lås (den effektive C/N₀ falder til tracking_threshold_dbhz), som er det kriterium, rapportens egen kolonne links[].status scores med. Hvert konturpunkt angives på begge akser af denial-planet — den jammer-EIRP der kræves ved scenariets afstand, og den denial-afstand der opnås ved scenariets EIRP — så båndet er et interval på de samme akser, som et konturplot tegnes på. Båndets kanter ER contour(p05) og contour(p95): den samme afbildning i lukket form anvendt på stikprøvens egne kvantiler, ikke et sigma tilpasset til stikprøven og ikke median ± k·stdev, og rapporten siger det i en streng band_definition ved siden af tallene. stdev udsendes af hensyn til kontinuitet og bruges af intet. En kvantil, hvis C/N₀ allerede er ved eller under sporingstærsklen, har ingen endelig afvisende J/S; de kolonner udsendes som null med en optalt årsag frem for som en uendelighed eller en afskåret radius

seg-f7457156f960 = Intern konsistens mod motorens egne fremadfunktioner, hvilket er alt, denne kapacitet ærligt kan gøre gældende. Hvert konturpunkt er en inversion i lukket form, og hver inversion kontrolleres ved at skubbe dens svar tilbage gennem den FREMAD-funktion, som rapportens egne rækker blev scoret med: kolonnen J/S gennem jamming::effective_cn0_dbhz (som skal returnere tracking_threshold_dbhz til < { "1e-9" } dB-Hz), kolonnen for afstand gennem jamming::free_space_path_loss_db og jamming::j_over_s_db (samme J/S til < { "1e-9" } dB), kolonnen for EIRP gennem jamming::j_over_s_db ved scenariets egen afstand. Konturen kontrolleres desuden at være GRÆNSEN for denial-mængden og ikke et punkt inde i den — lock_status mister låsen ved en streng ulighed, så dommen måles til at skifte fra DEGRADED til LOST over { "1e-4" } dB af J/S på hver side af konturen, hvilket en kontur forkert med et epsilon ville fejle. Den stærkeste kontrol er pr. link frem for pr. kvantil: at anvende den samme afbildning på hver rækkes egen C/N₀ gengiver rapportens kolonne status præcist — { "0" } afvigelser på { "38" } af { "38" } rækker ved det dokumenterede driftspunkt (kind = lunar-jamming, hvert input standard undtagen jammer.range_m = { "25 000" } m), hvor { "26" } rækker er LOST og { "12" } ikke er. Monotoni er målt, ikke antaget: { "20 001" } samples over [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } overtrædelser af en strengt aftagende afstand og en strengt voksende krævet effekt, så båndets kvantilrækkefølge er påvist frem for påstået. ExternalDataset afvises, og valideret med det: ingen målt kampagne for jamming på Månen findes at sammenligne en denial-radius med, konstellationen er en illustrativ geometri af Moonlight/LCNS-klassen fra offentlige kilder frem for en fløjet efemeride, og konturens input (EIRP, jammereffekt, antenneforstærkninger, støjtemperatur) er repræsentative størrelsesordener. ReferenceImpl blev også overvejet og afvist — inversen og fremaduttrykket er den SAMME algebra læst i to retninger, så rundturen fanger afskrivnings- og fortegnsfejl, men er ikke en uafhængig implementering; at kalde det en krydskontrol ville være det lånte uafhængigheds-træk, som matrixens invarianter findes for at forhindre. Hvad båndet giver, er målt og citeret frem for påstået: ved det driftspunkt er den skalare kontur { "27.402916" } km og lægger { "25" } km på den afviste side for alle { "38" } rækker, mens båndet { "21.256108" } .. { "29.921360" } km indeholder driftspunktet og derfor rapporterer den opdeling, tabellen faktisk viser. De to kriterier er også målt til at være uenige — effektforholdets bånd ({ "38.186527" } .. { "53.691675" } km) indeholder slet ikke { "25" } km — hvorfor begge udskrives

seg-2d3944107ba0 = Detektionsstyrke for integritetsmonitor på tværs af modaliteter

seg-38bc7c0bfe57 = Rapporten hybrid-optical-rf angiver, hvad chi-i-anden-monitoren på tværs af modaliteter faktisk kan DETEKTERE, ikke blot at den består et fejlfrit tilfælde: den mindste detekterbare bias pr. overvåget akse (øst, nord, op, ur) ved scenariets angivne sandsynligheder for falsk alarm og misset detektion, kurven for detektionsstyrke på begge sider af den, det støjfri biasmultiplum hvor den realiserede statistik første gang krydser tærsklen, og tiden til detektion for en biasrampe ved en angivet rate. Fejl indsprøjtes også gennem den rigtige monitor, og den statistik den returnerer rapporteres ved siden af den analytiske forudsigelse

seg-38cabd4921c1 = Ny vækst i kovarians efter overdragelse mod alarmgrænsen

seg-9287268bbada = Rapporten hybrid-optical-rf viser filterets model for processtøj og angiver, hvor længe løsningen efter overdragelsen bliver inden for alarmgrænsen: for begge overdragelsesretninger bærer den kovariansen pr. akse, som overdragelsen efterlod, propagerer den frem under et angivet processtøj af typen random walk og rapporterer det tidspunkt, hvor den dækningsskalerede 1σ når alarmgrænserne for horisontal, vertikal og tidssynkronisering, hvilken grænse der binder først, tidskonstanten for fordobling af variansen og en samplet coast-profil, der omslutter krydsningen. PSD'er for processtøj, dækningsfaktoren og alarmgrænserne er alle input med dokumenterede standarder

seg-c85b822227f3 = Ingen ekstern uafhængig reference. Krydsningen er en løsning i lukket form af variansvæksten for random walk, og testene genberegner den uafhængigt ud fra de værdier, som rapporten selv offentliggør, frem for ud fra udsenderens interne dele. Startkovariansen er fastlåst bit for bit til det spor, som den eksisterende handoff-blok allerede rapporterede, så coast ikke kan propagere en kovarians, ingen andre har set. PSD'erne for processtøj er MODELLED repræsentative input, og krydsningstiderne skalerer direkte med dem, hvilket skaleringstesten angiver som en målt egenskab og ikke som en påstand. ExternalDataset afvises bevidst: coast-tiden er en direkte funktion af to modellerede PSD'er og af alarmgrænser, som selv er repræsentative, og der findes ingen målt optisk/RF-overdragelsescoast på Månen at sammenligne med. En ekstern uafhængig reference ville her kræve en offentliggjort kurve for kovariansvækst eller holdover-nøjagtighed efter overdragelse for en tilsvarende modtager med dens model for processtøj angivet, kontrolleret til en tolerance

seg-a3b8272862aa = Mønster for antenne uden for boresight i månegeometrieksporten

seg-27d246503a48 = Eksporten af geometri pr. satellit bærer pr. (epoke, satellit) vinklen uden for boresight VED SATELLITTEN og sendeforstærkningen mod stedet fra det rigtige mønster (Airy) for en cirkulær apertur med ensartet belysning, og rapporterer antallet i strålen under det mønster VED SIDEN AF antallet i strålen under den symmetriske tilnærmelse fra forstærkning til strålebredde (θ_3dB[deg] = √(31000/G_lin)), med forskellen udsendt som en eksplicit korrektion i links, i satellitter pr. epoke og som den værste enkelte epoke. Begge implicitte aperturvirkningsgrader i tilnærmelsen udsendes ({ "0.641" } mod reglen { "70" }·λ/D grader, som den citeres med, { "0.920" } mod en ensartet cirkulær apertur), så den virkningsgrad, den stiltiende antager, angives frem for at blive udledt. Slået fra som standard: blokken optræder kun, når både et eksportsted og en apertur er givet

seg-6fbfa234ef3e = Tab af lås i sporingssløjfe og spoof pull-in under interferens

seg-f78c1f28a3f7 = Tab af lås beregnet ud fra sløjfedynamik i stedet for et effektforhold: termisk 1σ-jitter i bærebølge (Costas) og kode (ikke-koherent early/late) mod C/N₀ med kvadreringstabet, mod de angivne regler 3σ_PLL + θ_e ≤ { "45" }° og 3σ_DLL + rampeforsinkelse ≤ d/2 chips; C/N₀-tærskler for tab og genlåsning med den bindende sløjfe nævnt ved navn og hysteresen AFLEDT af den bredere pull-in-båndbredde frem for påstået; den erklærede tid til tab af lås fra en lásdetektor med to tærskler og bekræftelses-dwell, rapporteret særskilt fra den fysiske tid til faseudbrud (Viterbis middeltid mellem cycle slips, i log₁₀ s, fordi den spænder over hundreder af dekader); den største kodeslew og bærebølge-Dopplerrate, som offerets sløjfer kan følge; og den DENIAL-RADIUS, som sløjfedynamikken medfører, rapporteret ved siden af den eksisterende radius for effektforhold med deres fortegnsbehæftede forskel som et eget navngivet felt. Kan køres som scenarietypen <c1/>

seg-69155fb79ebd = Kovarians af stationskoordinater for månens VLBI ud fra en sporingsplan

seg-141285301f58 = Forsinkelsespartielle akkumuleret over en plan af baselines × epoker til en Fisher-informationsmatrix, inverteret til kovariansen af stationskoordinaterne og sigma pr. koordinat for stationen, hvilket erstatter et antaget isotropt ligefordelt link ud fra en skalar forsinkelsespræcision. Tilstanden bærer jordfaste (ITRS) stationskoordinater, så Jacobi-matricen er det inertiale partielle roteret med hver epokes GCRS→ITRS-matrix, og det er Jordens rotation, der gør disse koordinater observerbare — rapporten MÅLER den jordfaste sigtelinjesvingning og beaconens deklination frem for at antage dem. Rang, datumdefekt, konditionstal, informationsspektret og nulrummet for frit netværk udsendes ved hver kørsel, og ved rangdefekt offentliggøres det overordnede sigma som NULL med en status frem for at blive aflæst ud af en næsten singulær invers. Ligefordelingsværdien c·σ_τ·√(g/N) for SAMME plan udskrives ved siden af den beregnede med deres forhold, sammen med den isotrope sporgrænse √(p/trace(M)), som AM-HM gør til et hårdt gulv. Kan køres som scenarietypen <c1/>

seg-0f4d023fe2d4 = Kovarians af koordinater for et punkt på månens overflade ud fra en VLBI-forsinkelsesplan, holdt adskilt fra den for jordstationen

seg-47352405133b = Et tredje datumvalg, <c1/>, der holder hver jordstation fast og estimerer KUN beaconens måne-faste koordinater — den konfiguration, som usikkerheden for et punkt på månens overflade faktisk angives for, da jordstationernes koordinater er et input til forsinkelsesmodellen og ikke en ukendt i den. Det findes, fordi kovariansen på stationsniveau og kovariansen for overfladepunktet er FORSKELLIGE STØRRELSER adskilt af løftearmen ρ/B, og intet hidtil forhindrede, at den ene blev angivet mod den anden. Den udsendte blok <c2/> bærer ρ, den længste baseline, løftearmen, overfladepunktets form af ligefordelingslinket c·σ_τ·(ρ/B)·√(g/N), det beregnede sigma pr. koordinat for beaconen og deres forhold — forholdet er null frem for vildledende, når beaconen ikke estimeres, eller matricen er rangdefekt. B tages som den LÆNGSTE baseline til stede, den mest gunstige, så forholdet kun kan undervurdere. Kan køres som <c3/> med <c4/>, som afvises med en meddelelse, der nævner det manglende input, når beaconen ikke estimeres

seg-18096ae23d96 = Identiteter i lukket form, uden at nogen ekstern uafhængig reference gøres gældende eller findes. Løftearmen kontrolleres mod ρ/B, og de to ligefordelingsformer mod hinanden til { "1e-15" } — algebraiske identiteter, så de fanger en fejl i ledningsføringen og intet andet, og er mærket som sådan. Det væsentlige resultat er MEASURED frem for påstået: en forsinkelse fra en fast baseline begrænser beaconens RETNING, så sigtelinjekomponenten kun når informationsmatricen gennem nærfeltets afstandsled, og testen aflæser den resulterende anisotropi i det udsendte spektrum i stedet for at udlede den. AM-HM gør √(p/trace(M)) til et hårdt gulv, så et isotropt ligefordelingslink kun nogensinde kan UNDERVURDERE, og forholdet beregnet over ligefordeling er præcis den anisotropi, den kasserede. MEASURED på parret Goldstone-lignende/Canberra-lignende, hvis korde er { "10726.748" } km: over { "112" } samplede dage tillader { "36" } slet ingen gensidigt synlig epoke ved en maske på { "10" }°, det mest nogensinde gensidigt synlige er { "17" } af en plan med 49 samples, og på de { "73" } brugbare dage løber forholdet for tre komponenter fra { "113.9" }× til fire størrelsesordener mere, median { "1513" }×, mens en begrænsning til de to tværgående retninger, hvor sigtelinjen ikke sulter, giver { "3.94" }× til { "25.8" }×, median { "7.8" }×. HVAD DENNE RÆKKE IKKE GØR GÆLDENDE: nogen af disse tal som en egenskab ved en rigtig kampagne. Den fastslår, at størrelsen for overfladepunktet nu BEREGNES frem for antages, og at den ikke kan byttes stiltiende om med størrelsen på stationsniveau. Forbliver ReferenceImpl/MODELLED: ingen offentliggjort kovarians for overfladepunkt i månens VLBI findes at validere mod, stationerne og beaconstedet er illustrative frem for opmålte, og efemeride, ure, troposfære og parametre for jordorientering holdes FASTE, så dette er en Cramér-Rao-grænse for et reduceret parametersæt og optimistisk i sig selv. Den samme størrelse på kernestien (beaconen på DE440-Månen) er valideret på sin egen række, "…, kernel path"; på denne analytiske sti er det mindste sigma for beaconen { "3.9" } % under den rækkes SPICE-reference, hvilket er grunden til, at denne række forbliver MODELLED

seg-8958521eedf7 = Kovarians af koordinater for et punkt på månens overflade ud fra en VLBI-forsinkelsesplan, kernel path

seg-8ac12ca0f272 = Kovariansen for beaconen med alle stationer fastholdt i scenariet lunar-vlbi-fim (hver jordstation holdt fast, beaconens måne-faste koordinater estimeret alene) med beaconen placeret på JPL DE440-Månen læst af motorens egen kernelæser (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Kun Månens centrum adskiller sig fra den analytiske sti; IAU { "2015" }-legemsrotationen, stationerne, Jordens rotation og den lineære algebra er de samme. De validerede output er observationssættet, informationsspektret på { "3" } x { "3" }, rang og konditionstal, de tre måne-faste sigmaer for beaconen og deres RMS, løftearmen og forholdet beregnet over ligefordeling, på standardplanen. Kan køres som scenariet <c1/> med datum = "all-stations-fixed", estimate_beacon = true og planetary_kernel_path sat

seg-0315968c8214 = Differentiel PNT på Månen — residualbudget for korrektionslinket

seg-c6785166a44c = De tre led, som en differentiel korrektion samler op mellem den epoke, den beregnes ved, og den epoke, den bruges ved, hver tidligere efterladt som ikke-modelleret rum: opmålingsfejl for referencestationen (korreleret på tværs af satellitter, uafhængig af baseline, ~{ "1" }:{ "1" } positionsoverførsel og bevisligt ikke forstærket af DOP), ældning af korrektionen (den frosne baneefejlvektor genprojiceret på den sigtelinje, som motorens egen propagator lægger satellitten på én latenstid senere, plus c·σ_y(τ)·τ urdrift fra den kalibrerede potenslov) og ensartet kvantisering af linket over en eksakt fuld skala ±(orbit_err + clock_err) med varians step²/12. Rapporteret i både afstands- og positionsdomænet, ved siden af — aldrig i stedet for — den eksisterende residual og det eksisterende beskyttelsesniveau, med en latenskurve ved siden af det enkelte tal

seg-29b8e6c12471 = Identiteter i lukket form og selvkonsistens: variansen step²/12 for den ensartede kvantiserer, den eksakte kovariansudbredelse (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, der kollapser til σ·PDOP for ens σ, opmålingsleddets overførsel { "1" }:{ "1" } som en følge af û_user ≈ û_ref og lukning i kvadratur, når led slås fra. Krydskontrollen af PDOP mod orbit::dop deler normalmatricen [−û, { "1" }], så den er en konsistenskontrol og mærkes som sådan frem for en uafhængig reference. Intet ExternalDataset er tilgængeligt eller gøres gældende: ingen månestation har en offentliggjort opmålt nøjagtighed, intet differentielt korrektionslink for Månen har en offentliggjort latenstid eller et offentliggjort meddelelsesformat, og kvantiseringsresultatet er en lukket form frem for en måling. RTKLIB — allerede den eksterne kodereference for kernen med enkeltdifferens og vægtede mindste kvadrater — kunne drives med en bevidst forkert opmålt base for at bekræfte overførslen { "1" }:{ "1" } for opmåling, men det er uafhængig kode over den samme førsteordens algebra for sigtelinjen. STØRRELSESORDENERNE ER MODELLED: standardværdien for opmåling er denne crates egen tildeling for realisering af månesystemet frem for en målt station, latenstiden og antallet af bits er ILLUSTRATIVE input, og væksten i selve fejlvektoren for den udsendte efemeride er slet ikke modelleret — angivet i den udsendte streng for ældningsloven, fordi det er det led, der mest sandsynligt dominerer et rigtigt link

seg-c42646ae4707 = Dækning og nøjagtighedskort for referencestation på Månen

seg-1f9834b32629 = Monte Carlo-sweep af modellen for differentiel PNT på Månen over et brugergitter ved sydpolen og et døgn af epoker (typen <c1/>): for en differentiel referencestation på et kendt sted ved sydpolen, pr. punkt og over regionen, percentilerne af korrigeret og ukorrigeret positionsfejl (3-D, horisontal, vertikal), tilgængelighed med en årsag til hver utilgængelig epoke (user_lt4, station_missing_sat), dækning mod en tærskel angivet før kørslen, DO-229E-beskyttelsesniveauer, dækningsradius pr. azimutsektor og linkbudgettet for korrektionen ved stationen og ved det værste punkt. Ikke en udtalelse om ydeevnen af noget rigtigt system; ikke tilknyttet eller støttet af nogen myndighed

seg-7ecf4b0038b0 = Terrænhorisontmasker på Månen ud fra en angiven profil eller en DEM for polen

seg-7102948907bc = Azimutafhængige horisontmasker pr. sted for typen lunar-station-coverage (referencestationen og hvert brugerpunkt) og gitteret moonlight-service-volume og dets eksportsted pr. satellit (hver eksportrække får clears_terrain), i tabelformatet skyline fra { "0.36" } (skyline::Skyline, lineær i azimut med omløb ved { "360" } grader; en angiven profil og en DEM-horisont ved ét sted kombineres som deres punktvise maksimum): en angiven [terrain] station_horizon eller user_horizon mærket med sin kilde, og/eller en horisont ray-marched over en sydpolar stereografisk DEM (layoutet for LRO LOLA's gridded polar, læst fra en deskriptor, der fastlægger dens størrelse og SHA-256, eller en breddegrads-/længdegradsflise realdata::lola_dem med [terrain] dem_tile_path, gengivet med dens SHA-256) langs storcirkler på månekuglen med eksakt krumning, fra en angiven masthøjde, ved et angivet azimuttrin og en angiven rækkevidde. En satellit tæller ved et sted, når den klarer den flade mask_deg og horisonten ved sin azimut (lunar_service::topocentric); en epoke, som horisonten efterlader med færre end fire satellitter i et punkt, hvor den flade maske giver fire, tælles som den utilgængelige årsag terrain_masked. Den medfølgende DEM er et udsnit af det offentligt tilgængelige produkt LOLA LDEM_75S_240M, middelværdiresamplet i blokke på { "5" } x { "5" } til { "1200" } m (data/lunar-dem/NOTICE.md). Hvis den mangler, beholder hvert sted den flade maske, og hvert dokument er byte-identisk

seg-d37bb01e270b = Multipath og modtagerhardware-led for referencestation på Månen

seg-1103199f019b = Den valgfrie sektion [receiver] i lunar-station-coverage (LRS-02): elevationsafhængigt multipath-sigma sigma(el) = a + b exp(-el / el0) hos brugeren og ved stationen (den funktionelle form for luftbåren fra RTCA DO-229, med a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grader som standarder; på Månen er hver værdi ILLUSTRATIVE), hvid hos brugeren og første ordens Gauss-Markov over epoker ved stationen (rho = exp(-dt / tau)); termisk kodestøj i early-minus-late-DLL sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); bias mellem kanaler pr. kanal, konstant over et forsøg, hos brugeren og ved stationen. Stationsled går ind i dens korrektioner, brugerled i de rå og korrigerede målinger, hver på sin egen seedede strøm. Hvis den mangler, er hvert dokument uændret

seg-4fbc7d86b491 = Lukkede former og statistikker for modellens egne træk (InternalConsistency): DLL-formlen mod en beregning i hånden, formen fra DO-229, nulbaselinje-differensen mellem to modtagere og Gauss-Markov-korrelationen ved lag 1. Ingen måling af multipath eller modtager på Månen findes at sammenligne med; værdierne er ILLUSTRATIVE, og intet her er en udtalelse om nogen rigtig modtager

seg-03796cb741b6 = Vækst i efemeridefejl for referencestation på Månen over korrektionens latenstid

seg-13b0ae9a874a = Det valgfrie input orbit_err_growth_m_per_s i lunar-station-coverage (LRS-03): en korrektion anvendt latency_s efter, at den blev beregnet, går glip af væksten g latency_s i den udsendte baneefejl, g isotrop med 3-D RMS-rate, trukket pr. satellit og forsøg på sin egen seedede strøm (afstandens 1-sigma-rate tau / sqrt({ "3" })), oven i genprojektionen af den frosne fejl på sigtelinjen. Hvis det mangler, er hvert dokument uændret. Et K5-tillæg til sammenligningen med offentliggjorte påstande, præregistreret alene, kører K5 ved { "0.001" }, { "0.01" } og { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Løsningstilstande for lunar referencestation: højdebegrænsning, tre satellitter, vindue med statisk bruger

seg-366c7ad03fb2 = Den valgfri sektion [solution] i lunar-station-coverage (LRS-06): en højde-pseudomåling række op . dx = e_h med angivet 1-sigma, vægtet mod afstandsrækkerne, et minimum på tre satellitter, der kun er tilladt sammen med den, og en vægtet mindste kvadraters løsning over de seneste window_epochs epoker med en fælles statisk position og ét ur pr. epoke (et filters svar for en statisk position uden processtøj over de samme data; epokernes fejl behandles som uafhængige). Er sektionen fraværende, er snapshot-løsningen og alle dokumenter uændrede. Et tillæg til sammenligningen med de publicerede påstande, der bruger kildernes løsningsstil og er præregistreret alene

seg-611ba369ed00 = Nøjagtighed og dækning for en lunar referencestation sammenholdt med publicerede påstande

seg-4fe4f1cffa2b = Scenarietypen lunar-station-coverage kørt under de offentlige antagelser i det publicerede materiale om en lunar differentiel referencestation (fire navigationssatellitter i frosne elliptiske baner på { "24" } timer, { "10" } m { "95" } % SISE, { "0.30" } m kodestøj, { "1" } s og { "600" } s korrektionslatenstid, en stationsopmåling under en decimeter, den publicerede eksempelplacering for stationen og de sydpolære cirkler på { "300" } km og { "600" } km) og bedømt mod kildernes numeriske påstande under seks ensidige tærskler, der blev fastsat på forhånd før kørslen: dækning af hele sydpolen ved p95 under en meter (K1, K2), korrigeret p95 under en meter og på decimeterniveau (K3, K4), under en meter bevaret ved { "600" } s latenstid (K5) og nøjagtighed bevaret fra { "10" } km til { "500" } km baseline (K6)

seg-478225d0a8e1 = Kerne til lunar ARAIM-beskyttelsesniveau

seg-863690a44f21 = Trinnet fra geometri til kovarians i det lunare beskyttelsesniveau — (GᵀG)⁻¹ over hele synsfeltet og hver enkelt delgeometri med én fejl, projiceret på den lokale lodrette og sporet af den horisontale blok — og dets statistiske kerne: Bonferroni-detektormultiplikatoren, den gaussiske øvre hale for hver fejlhypotese og rodløsningen, der afbilder et integritetsrisikobudget på et beskyttelsesniveau, over et lunart servicevolumen med 7 punkter

seg-8191906fc700 = To etablerede tredjepartsimplementeringer sammensat, begge kørt offline, med fixturen regenereret fra ende til anden og verificeret byte-identisk. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c kompileret fra C-kildekode med -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverterer normalmatrixen ved Crout-LU med partiel pivotering, en algoritme uden forbindelse til kshanas håndskrevne Gauss-Jordan-funktion invert4(); numpy.linalg.inv (LAPACK getrf/getri) inverterer hver af dem igen som en tredje uafhængig invers og stemmer med RTKLIB til { "1.112e-12" } relativt. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) leverer norm.isf, norm.sf (Cephes ndtri/ndtr) og optimize.brentq mod kshanas Numerical-Recipes-række for den ufuldstændige gammafunktion, bisekteret invers og bisektion med 200 trin — og SciPys direkte sf er en anden numerisk vej ind i den fjerne hale end kshanas { "1" } − Φ, så udslukningen i den dybe hale er målt og ikke spejlet. Den lodrette akse er den radiale enhedsvektor (definitionen af lokal lodret på en sfærisk Måne), og den horisontale varians er sporet af den horisontale blok, så ingen øst/nord-azimutkonvention deles. UDTRYKKELIGT IKKE VALIDATED AF DENNE RÆKKE: σ_URE, det fejlprior, der gælder pr. satellit, og den illustrative konstellation af typen Moonlight/LCNS er MODELLED input, der gives til den uafhængige reference, som de er; og FORMEN af MHSS-integritetsligningen for enkeltfejl er transskriberet fra den samme publicerede grænse, som kshana implementerer — en delt lukket form er en delt antagelse, så denne række dækker en forkert evaluering af ligningen og ikke et forkert valg af den. Ingen tredjeparts MHSS ARAIM-implementering er tilgængelig (RTKLIB har intet indgangspunkt for beskyttelsesniveau, der findes ingen sådan PyPI-distribution, Stanford MAAST er MATLAB), og det er den udestående opgradering

seg-0ec1699f5754 = ARAIM MHSS-beskyttelsesniveauer sammenholdt med publicerede referencevektorer

seg-fbaaf3ad7648 = Selve ligningen for beskyttelsesniveauet ved multihypotese-løsningsseparation: vægtet mindste kvadraters løsning for hele synsfeltet og for hver fejltilstand på en geometri i øst/nord/op med én urtilstand pr. konstellation, delløsningernes sigmaer, løsningsseparationens sigmaer og ensidige projektioner af den nominelle bias, Bonferroni-tærsklerne K_fa, risikofordelingen for uovervågede fejl og VPL/HPL, der løser integritetsrisikoligningen. Kan køres som scenarietypen <c1/>

seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } juni { "2019" }), Appendix D, gennemregnet numerisk eksempel — publicerede INPUT (geometrimatrix for 10 satellitter og 2 konstellationer, diagonalerne C_int/C_acc, b_nom, P_sat, P_const, LPV-200-konstanter) og publicerede OUTPUT (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } og seks mellemresultater for konstellationsfejl), hentet 2026-09-20, kilde-SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Stemmer ved referencens EGEN angivne tolerance TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT og σ_v_acc til deres trykte præcision. Den samme undergruppes Milestone { "3" } Report ({ "2016" }) Annex A §A.IX angiver det samme eksempel, men er internt inkonsistent — en fortegnsfejl i række { "3" } af G (+{ "0.7477" }, hvor dokumentet fra { "2019" } trykker −{ "0.7477" }; med plus bliver dokumentets eget σ_v_acc { "0.8690" } m mod dets publicerede { "1.47" } m), og et K_fa_3 evalueret ved { "57" } fejltilstande, mens dokumentet angiver N_fault_max = { "1" }, dvs. { "12" }, så dets EMT følger tærsklen for 57 tilstande, men dets VPL/HPL gør ikke. Ingen implementering, der følger dokumentet, kan gengive alle dets outputs på én gang. Dets geometriske mellemresultater gengives præcist, og dets beskyttelsesniveauer er optaget som målte afvigelser (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), udeladt af acceptværdien; tolerancen blev ikke udvidet for at rumme dem. OMFANG: kun N_fault_max = { "1" } — fejldelmængder med flere hændelser afvises i stedet for at blive afkortet, og udelukkelse, chi-i-anden-konsistenskontrollen og omfordelingstrinnet mod dobbelttælling forbliver MODELLED

seg-7bfcb5c6a985 = ARAIM med samtidige fejlhypoteser for flere satellitter

seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2-reglen for bestemmelse af delmængder (P_THRES, FC_THRES, overvågede delmængder med færrest fjernede først) generaliseret fra par til samtidige kombinationer af op til max_order satellit- og konstellationshændelser med det eksakte prior P_no fault prod q_e; add_v42_protection_levels_to_order kører ADD v4.2-vejen for beskyttelsesniveauer på den (orden { "2" } er den eksisterende vej præcist). raim::araim_subset_raim (opt-in): avanceret RAIM over denne hypotesemængde, hver overvåget delmængde som én tilstand (p_fault, T, b, sigma) i integritetsrisikosummen, uobserverbare delmængder flyttet til den uovervågede risiko, budgettet skaleret med ADD-fordelingen af den uovervågede risiko, og delmængden med den største normaliserede separation rapporteres, når en fejl detekteres. Priors, der kræver dybere delmængder end max_order, afvises og afkortes aldrig

seg-6c6076ea1eee = Intern konsistens (InternalConsistency): reduktionen af orden 2 til den MAAST-kontrollerede ADD v4.2-vej, uafhængig genafledning af priorerne og en konstrueret fejl i to satellitter. Der er ikke foretaget nogen MAAST- eller RTKLIB-kørsel ud over par, så de dybere hypotesemængder og delmængde-RAIM'ens beskyttelsesniveauer er ikke kontrolleret eksternt. araim_subset_raim deler araim_dual_raims forenklinger (én sigma for integritet og nøjagtighed, ét ur, den almindelige normale hale): den følger ikke ADD

seg-48ca01332f8f = RAIM ved siden af kvalitetsmålene for urets holdover

seg-890f1006a75d = Den valgfri sektion [integrity] i kindet clock (clock_integrity::run): ud fra et angivet sted og konstellationsforudindstillinger (geometry::sky_geometry), ved hver integritetsepoke så længe GNSS-tidslinjen ikke er nægtet, snapshot-RAIM (raim::snapshot_raim: paritets-chi-i-anden-test, beskyttelsesniveauer ud fra hældning) på satellitterne over masken med seedede gaussiske residualer af den angivne sigma og en valgfri angivet bias; en separat blok integrity_fom med verdicts, beskyttelsesniveauer og tilgængelighed pr. epoke. Nægtede epoker rapporteres som utilgængelige og ekstrapoleres aldrig; holdover-kvalitetsmålene er uændrede, og uden sektionen er outputtet byte-identisk

seg-c2860bf4b562 = Intern konsistens (InternalConsistency): beskyttelsesniveauerne er dem fra snapshot_raim, som er valideret mod RTKLIB i sin egen række, genberegnet på den samme geometri; adfærd uden fejl og med indsprøjtet fejl. Himlen er en repræsentativ geometri fra en forudindstilling (ikke et dateret almanak), residualerne er syntetiske, og sigma, alarmgrænserne og sandsynlighederne er angivne input; intet her er en udtalelse om en reel modtagers tilgængelighed

seg-9cbb4ee7588a = Rumlig, støjfyldt observerbarhed af buelængde for flere cislunare familier

seg-5ebd771deef8 = Tærsklen for observerbarhed af cislunar buelængde i den RUMLIGE CR3BP med seks tilstande i stedet for den plane med fire, på tværs af familierne DRO, L2-halo og L2-næsten-retlinet halo, hvor målestøj indgår i Gramianen, og TO kriterier rapporteres, fordi der ikke findes ét ærligt: det publicerede rangkriterium, som beviseligt er invariant over for en homoskedastisk målesigma (afvægtning ganger observerbarhedsmatrixen med en skalar og lader det relative singulærværdispektrum og dermed rang, defekt og konditionstal uændrede), og et estimerbarhedskriterium — den første bue, hvor den formelle 1σ-positionsusikkerhed for chief'ens begyndelsestilstand falder under en angivet grænse — som er det, der flytter sig med støjen. Hver tærskel bærer det epokegitterinterval, den ligger i; et kriterium, der ikke nås, er null med en begrundelse. Plan tilstand er fortsat standard, og familier uden for planet afvises dér i stedet for at blive fladtrykt til en tilstand, der ikke kan repræsentere dem

seg-046231819882 = En uafhængig rækkeechelon-rang ved gaussisk elimination med partiel pivotering bekræfter hvert verdict om rang med seks tilstande — en anden algoritme, der ikke deler kode med eigen/SVD-vejen under test. Tilstandsovergangsmatrixen { "6" }×{ "6" } for CR3BP, som dette sammensætter, har sin egen ReferenceImpl-reference mod SciPys variationelle integration, og begyndelsesbetingelserne for halo/NRHO kommer fra en korrektor, der gengiver den publicerede L2-sydlige Gateway-bane { "9" }:{ "2" }. Det eksisterende led med kvadratrods-informationsfilter tælles udtrykkeligt IKKE som bekræftelse: det bruger de samme jacobianer og reducerer til den samme normalmatrix, så det er en konsistenskontrol mellem to numeriske maskiner, og den udsendte udvidelsesmærkat siger det. IKKE eksternt forankret, og ExternalDataset er derfor afvist i stedet for lånt fra STM'ens række: selve tærskelbuelængderne afhænger af den MODELLED konstellationsudformning, epokegitteret og — målbart, med op til { "40" }× — af singulærværditolerancen. De publicerede { "2.09" } timer i det plane tilfælde gengives præcist ved rel_tol = { "1e-6" } og er selv afhængige af tolerancen ({ "10.25" } timer ved { "1e-4" }, { "0.42" } timer ved { "1e-8" }), hvilket er en egenskab ved kriteriet og ikke ved banen. Intet offentligt datasæt publicerer en tærskel for observerbarhed af buelængde for en valgt cislunar konstellation. MEASURED RESULTAT: tærsklen for den rumlige tilstand med seks tilstande er { "22.17" } timer for L2 NRHO og { "40.42" } timer for L2-halo og FINDES IKKE for den plane DRO-familie, som den publicerede påstand blev udledt på — rang { "4" } af { "6" } med datumdefekt { "2" } og to præcis nul-egenværdier, en strukturel defekt, som ingen buelængde afhjælper

seg-e250321394bc = Fejl i forudsigelse af jordorientering i operationel stil, målt forudsagt mod endelig

seg-0e443d241460 = En mindste kvadraters tilpasning af bias plus rate over et bagudgående vindue plus de vigtigste periodiske led — årlig, halvårlig og de to vigtigste zonale tidevand for UT1; Chandler, årlig og halvårlig for polen — ekstrapoleret med det sidste residual i vinduet ført frem: den klasse, IERS Bulletin A bruger, i stedet for den persistensforudsigelse, den publicerede horisont hvilede på. Bedømt på den eneste ærlige måde: en prognose for T+h bygget af hurtige Bulletin A-rækker ved eller før T, målt mod den SENERE publicerede endelige Bulletin B ved T+h, med persistens bedømt over det identiske epokesæt mod de identiske endelige værdier ved siden af. En målepoke uden publiceret endelig værdi udelades i stedet for at blive genbedømt mod den hurtige kolonne; et periodisk led, som vinduet ikke kan begrænse, rapporteres som afvist med de cyklusser, det faktisk spænder over; et ufuldstændigt vindue afvises i stedet for stiltiende at blive forkortet

seg-f4efd94dd746 = Lunart datum for referencesystem ud fra en observationskampagne

seg-a6972eb89d7d = Det syvparametriske Helmert-datum udledt af en SIMULERET OBSERVATIONSKAMPAGNE i stedet for at blive genfundet fra en indsprøjtet transformation. Jordstationer observerer et kildebelagt katalog over beacons på månens overflade efter en eksplicit plan; de lunare VLBI-forsinkelsespartielle akkumuleres til en Fisher-informationsmatrix for beaconkoordinater og føres gennem Helmert-designet A = [I₃ | [p]ₓ | p] til H = AᵀM_bA, så den rapporterede datumnøjagtighed er en funktion af observationsprogrammet — nøjagtigt lineær i forsinkelsens sigma og monoton i buen gennem den libration, rapporten måler. Datumdefekten er emnet og ikke en fodnote: rang, defekt, konditionstal, spektrum, uobserverbare retninger i syvparameterbasen, den svageste retning selv ved fuld rang og hver parameters andel af den udsendes ved hver kørsel, og enhver parameter, som kampagnen ikke begrænser, publiceres som NULL med en status. Korrelation mellem beaconfejl er MEASURED og ikke antaget — nøjagtigt nul med stationerne holdt fast, og trykt med sin pris, når de estimeres. Kan køres som scenarietypen <c1/>

seg-ca481f2d8f9e = Bekræftelse af tærsklen for cislunar buelængde med en uafhængig estimator

seg-3d5fbf896209 = En batch-estimator med mindste kvadrater, der GENFINDER chief'ens begyndelsestilstand ud fra simulerede målinger mellem satellitter over voksende præfikser af det samme epokegitter, som tabellen over rang mod bue bruger, med målepartielle taget som centrale finite differences af den sammensatte fremadmodel. Den bruger intet af det maskineri, tærsklen blev målt med — ingen analytisk jacobianrække, ingen variationel tilstandsovergangsmatrix, ingen singulærværdi- eller egenværdidekomposition, ingen ranktolerance, intet kvadratrods-informationsfilter — og deler kun dynamikken, begyndelsesbetingelserne, den skalare observabel og epokegitteret, hver nævnt i det udsendte dokument. To kriterier, begge sweepet: genfinding uden støj (rangens analog) og Monte Carlo-estimerbarhed (estimerbarhedens analog, målt mod en kendt sandhed og ikke forudsagt ud fra en kovarians). Kan køres som scenarietypen <c1/>

seg-60e30948cee7 = En separat estimator i denne kodebase med en anden algoritme og en usammenhængende kodesti: ikke-lineær vægtet Gauss-Newton med partielle ved finite differences, hvis verdict læses som en målt fejl i tilstandsgenfinding i km og mm/s. Den har intet udtryk til fælles med Gramianens vej med rang og kovarians, og adskillelsen HÅNDHÆVES af en kildetekstvagt og ikke blot påstås. MEASURED på det publicerede plane DRO-gitter: ESTIMERBARHEDSkriteriet er CORROBORATED — den målte Monte Carlo-grænse er { "5.739130" } timer mod den formelle { "5.739130" } timer (forhold { "1.0000" }), og den målte RMS gengiver den formelle 1σ over { "21" } buelængder til et geometrisk middelforhold på { "0.9804" }. RANGkriteriet er ikke bekræftet som genfindingsgrænse: estimatoren genfinder fra { "0.782609" } timer mod Gramianens { "2.086957" } timer, forhold { "0.375" }, og ved { "1.826087" } timer — det sidste præfiks, som rangaflæsningen bedømmer til { "3" } af { "4" } — genfinder den til { "1.96e-5" } af den a priori forskydning. Genfindingsgrænsen er uflyttet over tre dekader af sin egen grænse, mens ranktærsklen spænder fra 'aldrig' til { "0.782609" } timer over fire dekader af rel_tol, og de to falder nøjagtigt sammen ved rel_tol = { "1e-8" }. Dette spænd blev først optaget som værende nået ved { "0.260870" } timer; det tal var et ARTEFAKT, frembragt af en rangaflæsning, der talte { "4" } retninger ud fra { "2" } målerækker under f64-støjgulvet, og det er rettet her i stedet for at blive stående. Rangaflæsningen er nu begrænset af Sylvesters ulighed med begrundelsen udsendt, og det rettede spænd mætter nøjagtigt ved den bue, hvor den uafhængige estimator genfinder, hvilket styrker og ikke svækker denne rækkes krydsvalidering: de publicerede { "1e-6" } er en konservativ KONVENTION for singulærværdier og ikke en udtalelse om genfindelighed. Det samme mønster rumligt: NRHO { "9.290323" } timer mod { "21.677419" } timer, halo { "22.978723" } timer mod { "39.829787" } timer, med estimerbarhed, der stemmer nøjagtigt i begge. Den plane DRO med seks tilstande genfinder ved ingen bue og gengiver uafhængigt den families strukturelle datumdefekt ud fra en estimator, der intet fik at vide om den. IKKE eksternt forankret — dynamikken og begyndelsesbetingelserne deles med den analyse, der testes, og intet offentligt datasæt publicerer en sådan tærskel — så ExternalDataset er afvist

seg-f839285852d9 = Lunart servicevolumen ud fra reel, hentet konstellationsgeometri

seg-c3059fcced49 = Accepterer en tabuleret Måne-centreret tilstandsefemeride (evalueringen af en SPK/BSP-kerne) eller en publiceret konstellationsdefinition bag <c1/>, kører den identiske sweep af dækning / DOP / beskyttelsesniveau mod den og udsender det σ_URE-afstandskrav, den medfører, VED SIDEN AF de uændrede illustrative Kepler-resultater og de perturberede resultater, med forskellen som sin egen navngivne størrelse. Hvert tal bærer en proveniensklasse, der skelner kerneafledt fra afledt af publicerede elementer og fra modelleret, så de aldrig kan forveksles i et efterfølgende citat

seg-36a6cfaf5afa = Enhed og proveniens angivet for hver rapporteret størrelse

seg-12460501e82b = Et maskinlæsbart skema, der angiver enhed, proveniensklasse og definition for hvert numerisk felt i hver scenarierapport, plus én enkelt global port, der kører hver registreret scenarietype og fejler, hvis et udsendt numerisk felt mangler en af dem. Proveniensvokabularet er lukket, og hver klasse bærer et evidensniveau, med to klasser bevidst afbildet på <c1/> og <c2/> i stedet for at få et niveau, som klassen ikke bestemmer

seg-a8c4a6fd4989 = Selve det udsendte dokument: hvert numerisk blad skal opløses til en post i det dokuments egen units-blok. Der findes intet eksternt enhedsregister at kontrollere en ERKLÆRET enhed mod, så en erklæret enhed er en gennemgået påstand og ikke en verificeret — porten verificerer FULDSTÆNDIGHED og KORREKT OPBYGNING, ikke sandhed, og valideret ville være forkert, fordi intet eksternt bekræfter, at <c1/> er den rigtige enhed for et felt med navnet <c2/>. En uafhængig krydskontrol af navnesuffikser blev kørt over de { "1,434" } felter, der var beskrevet PÅ DET TIDSPUNKT: af de { "691" }, der bar et suffiks med enhed, er { "40" } uenige med den erklærede enhed, og alle { "40" } er forklaret (suffikser pr. sekund, minima, apertursekunder, newtonmeter mod et suffiks, der ligner nanometer), så ingen forkert enhed dukkede op. Den krydskontrol er ikke kørt igen siden, og dækningen er vokset forbi den — tallet er stillet på det, der faktisk blev målt, og ikke gentaget ved det nuværende samlede antal. På tidspunktet for den ændring ({ "0.27.0" }) gik dækningen fra { "7" } af { "56" } typer til { "60" } af { "61" } og fra { "389" } af { "1354" } felter til { "1,742" } af { "1,744" } (docs/field-units-schema.json, som en forældelseskontrol holder aktuel). INGEN type forbliver udækket (loft { "0" }, FUT-28, { "0.36" }): den sidste var <c3/>, hvor to af kolonnerne er nøglet af kalderen, så deres enheder er data; de er nu beskrevet som <c4/>, og enheden for hver position læses fra den SWEEPEDE pakkes egen units-tabel ind i <c5/> og <c6/> (eller tages fra aksens erklærede <c7/>, som skal stemme med pakkens, når begge findes; null, når ingen af dem findes, angivet og ikke gættet). <c8/> var den, der kom før, og røg af listen, da dets udgivne dokument fik en units-blok: additivitetsfastlåsningen, der havde navngivet <c9/> som en forbudt nøgle, BEVISER nu i stedet, at tilføjelsen er additiv — fjern blokken igen, og dokumentet hasher stadig til de to konstanter, der blev fastfrosset, før den fandtes, så en udgivet værdi, der flyttede sig under tilføjelsen, fejler stadig. Arbejdet afslørede også tolv enheds- eller dokumentationsdefekter i eksisterende kode, rapporteret og ikke rettet under R1

seg-cf779c468eed = Lunart datum for referencesystem ud fra en REEL observationskampagne

seg-96151f13a92b = Kovariansen for det syvparametriske Helmert-datum, med de to simulerede input erstattet af målte: planen er jordsendeepokerne for { "337" } arkiverede ILRS-normalpunkter for lunar laserafstandsmåling (2015-04-08 til 2015-06-27, Grasse MeO { "7845" } og Matera MLRO { "7941" }, alle fem retroreflektorarrays), og hver observationsvægt er det punkts egen arkiverede præcision bin_rms/√n_raw — median { "5.13" } mm envejsafstand, aflæst i filen. Stationskoordinater IERS ITRF2020, reflektorkoordinater JPL DE430 Table { "7" }. Kan køres som scenarietypen <c1/>. Den validerede påstand ({ "0.36" }) er snæver: på den analytiske standardvej stemmer beregningen af datumkovariansen med en uafhængig reference med SPICE-lysrejsetid og NumPy på nye målte normalpunkter; den er ikke en LLR-nøjagtighed og ikke belæg for, at den analytiske Måne er nøjagtig

seg-c815cb90dcde = Lunar referencestationsgeodæsi: tilføjet retroreflektor og VLBI-beacon mod datum med fem arrays

seg-103cf21173ac = Valgfri input extra_reflectors og extra_beacons på scenariet lunar-llr-datum tilføjer en blok station_geodesy: Helmert-informationen for de fem arrays fra det arkiverede udsnit af lunar laserafstandsmåling plus den information, som en tilføjet retroreflektor (målt i afstand ved de arkiverede normalpunktsepoker, hvor målestationen er over sin horisont, hver med det normalpunkts arkiverede vægt) og en tilføjet VLBI-beacon (observeret af netværket og planen i lunar-frame-campaign med jordstationerne faste, gennem forsinkelsespartielle fra lunar-vlbi-fim) på angivne steder lægger på det syvparametriske datum, løst igen, med hver Helmert-parameters 1-sigma før og efter, deres forhold, normerne før og efter og de yderste egenværdier af Fisher-forskellen. Er de fraværende eller tomme, er rapporten uændret

seg-479a7e6bbedb = Kun intern konsistens: hvert tilføjet sted er et særskilt punkt, og en laserafstand eller en VLBI-forsinkelse med fast station berører ét punkt, så dets information A_p^T M_p A_p er positivt semidefinit og lægges til; testen kontrollerer Fisher-forskellen og hver varians mod det. Resultatet for de fem arrays er den eksisterende række med rigtige data og er uændret. Den tilføjede reflektor genbruger epoker planlagt for de fem eksisterende arrays, en ILLUSTRATIVE plan, og den tilføjede beacons netværk, plan og forsinkelsessigma er de ILLUSTRATIVE input fra lunar-frame-campaign; stedet er en ILLUSTRATIVE sydpolær position. Et sydpolært sted ser Jorden lavt på sin horisont eller slet ikke, hvilket de eksisterende tests af udkigsvinkel udtrykker; intet af stederne måles kontinuerligt i afstand. Tallene er Cramér-Rao-grænser for et reduceret parametersæt, ikke et løst datum og ikke en udtalelse om nogen reel station

seg-d9f033ebf109 = Lunart datum for referencesystem ud fra en REEL observationskampagne, kerne-Måne-center

seg-6f272a06c9f3 = Kovariansen for det syvparametriske Helmert-datum lunar-llr-datum ud fra arkiverede ILRS-normalpunkter og deres målte vægte, på kernevejen: det geocentriske Måne-center læses fra JPL DE440 af motorens egen kernelæser (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Kun Måne-centret adskiller sig fra den analytiske række; IAU { "2015" }-orienteringen, den fraværende polbevægelse og UT1, katalogerne, udvælgelsesreglerne, vægtene og den lineære algebra er de samme. Den validerede påstand er kun, at denne vejs datumkovarians stemmer med en uafhængig SPICE- og NumPy-reference på nye, usete normalpunkter. Sammenligningen skelner ikke mellem Månemodeller og kontrollerer ikke Måne-centret: på det samme udsnit består den analytiske Måne også hver tærskel, den præregistrerede mutation (kerne-Månen læst en time for sent) blev ikke opdaget, og et Måne-center, der er omkring { "4,650" } km forkert, består også (se referenceteksten). Det er ikke belæg for, at kerne-Månen forbedrer datum. Kan køres som scenariet <c1/> med planetary_kernel_path (og normal_points_dir for et andet udsnit)

seg-bd3af378b613 = Indbygget analytisk lunar efemeride — dens ANGIVNE NØJAGTIGHEDSGRÆNSE kontrolleret mod rigtige data

seg-a51c4e234a4f = ephem::moon_position, den lavpræcise geocentriske lunare serie, som cratet falder tilbage på, når ingen DE/SPK-kerne er til stede, målt mod rigtig lunar laserafstandsmåling og mod en publiceret planetefemeride over det samme tidsrum. Denne række validerer den grænse, som modulet angiver om sig selv, IKKE en nøjagtighed: serien bekræftes at være ikke værre, end den siger, ikke bekræftet at være god

seg-81dff68ddd9c = TO uafhængige eksterne datasæt, der intet deler. ({ "1" }) { "337" } arkiverede ILRS-normalpunkter for lunar laserafstandsmåling (EUROLAS Data Center, DGFI-TUM, 2015-04-08 til 2015-06-27, fem retroreflektorarrays, committet med SHA-256 pr. fil og et script til gendownload og verifikation): observeret-minus-beregnet envejsafstand { "156,494" } m RMS, med stationskoordinater fra IERS ITRF2020 og reflektorkoordinater fra JPL DE430 Table { "7" }, så residualet domineres af Måne-centerserien. ({ "2" }) JPL Horizons geometriske geocentriske Måne-tilstande over det samme tidsrum: { "112,567" } m RMS radialt, { "195,655" } m RMS vektor, værste epoke { "360,324" } m = { "0.0536" }°. Et afstandsresidual reagerer på den RADIALE del af en efemeridefejl, så ({ "1" }) og ({ "2" }) er den samme størrelse nået på to måder og stemmer med { "1.39" }× — hvilket giver scenariet lunar-llr-datum ret til at tilskrive sit residual efemeriden. Motorens egen moduldokumentation påstår ~{ "0.3" }° / ~nogle få·10² km; begge målinger ligger inden for den, den vinkelmæssige påstand med en margin på { "5.6" }×. OMFANG, angivet så ingen læser kan misforstå det: dette validerer den angivne GRÆNSE og ikke et nøjagtighedstal. Serien forbliver uegnet til enhver anvendelse, der kræver bedre end ~{ "1e5" } m, og den begrænsning er rækkens indhold lige så meget som overensstemmelsen. Kan regenereres offline med de indcheckede scripts til hentning og verifikation

seg-44f582b17fa9 = Gate-integritet — et grønt, der betyder, hvad det siger

seg-43fbcfbe990c = Tre strukturelle vagter over selve verifikationsprocessen, der hver lukker en klasse af defekter, som nåede den kanoniske gate som en intermitterende eller falsk rød. ({ "1" }) Hver konstrueret midlertidig sti i Rust-kilderne skal bære en komponent, der er unik pr. kald; et proces-id afvises, fordi cargo kører bibliotekstestene som parallelle tråde i ÉN proces, og pid'en deles af dem alle. ({ "2" }) Hver byte-for-byte- eller hash-fastlåsning skal ved siden af sig selv eller i sin modulheader erklære, hvad den dækker, og hvad den bevidst udelader — så en tværgående ændring kan se med et blik, hvilke fastlåsninger der er omfattet, og hvilke der stiltiende er blevet ændringsdetektorer for hele repositoryet. ({ "3" }) Et grønt kan kun gøres gældende fra den FULDE suite: scripts/gate.sh kører <c1/>, fanger den sande exitkode uden pipe i vejen og skriver en kvittering, der navngiver committen, antallet af integrationsbinærer, antallet af tests og varigheden; pre-push-kontrollen afviser et push, hvis commit ingen gyldig kvittering navngiver, på et rent træ. Gentagelighed stikprøves separat af scripts/check-repeatability.sh, som kører biblioteks-suiten N gange og fejler, hvis mængden af beståede tests er forskellig.

seg-17a5f9da54a4 = Lukket form: hver vagt køres over et fast kendt dårligt uddrag, der skal udløse, og et fast kendt godt uddrag, der skal forblive tavst, begge bogstavelige konstanter, som detektoren ikke kan påvirke. De to kendte dårlige uddrag er defekterne F22 og F25 i deres oprindelige form. Dette er en INTERN uafhængig reference, og rækken er MODELLED i overensstemmelse hermed: den beviser, at vagterne skelner defekten fra dens rettelse, ikke at de klasser, de beskriver, er udtømmende. Deres angivne blinde vinkler — delt tilstand, der ikke er en sti, en fastlåsning holdt i en kort navngiven konstant, en sjælden race, som tre kørsler ikke stikprøver, og en kvittering, som enhver, der kan skrive filen, kan forfalske — er skrevet ud i modul-dokumentationen i tests/source_guards.rs og i hvert scripts header og ikke overladt til at blive opdaget.

seg-178192c9c87a = Sammensat tidssynkroniserings-PL — skalar MHSS-specialisering (H=1_N)

seg-431aaf94ec31 = Skalar TPL med løsningsseparation af tid over heterogene kilder; PL drevet af støj i den værste udelukkelsesdelmængde + UTC(k)-bias

seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq og scipy { "1.18.1" } (norm.isf, norm.sf, brentq) genberegner med deres egne algoritmer delmængdernes vægtede mindste kvadraters estimatorer, den generelle separationskovarians sqrt(Δ Σ Δᵀ), biaserne og beskyttelsesniveauet ud fra dem på { "300" } indcheckede input (tests/fixtures/tpl_scalar_numpy_oracle); PL stemmer inden for { "1e-9" } relativt (værst { "1.2e-10" }), og den drivende udelukkelsesdelmængde er identisk, tolerancen fastsat før sammenligningen. Multiplikatorerne, priorerne og biasoverbounds er input, og strukturen i PL-ligningen (tilstandsliste, ir/2-opdeling, biasprojektion) er et angivet input, som for rækken om kernen til lunar ARAIM-beskyttelsesniveau; den validerede påstand er den lineære algebra og PL på de input, ikke de fysiske størrelser i et tidssynkroniseringsscenarie. ARAIM-aner Blanch { "2015" } / Joerger { "2014" }

seg-b7cd952ff133 = Sammensat tidssynkroniserings-PL — P0-seedet holdover-gennemkørsel

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); nedad halvkontinuert PL({ "0" }+)≥PL({ "0" }−); K(IR/2) løbende maksimum; τ/τ³/τ⁵ faseeksponenter

seg-1438193381be = Egenskabstests (monotonicitet, intet fald ved handover) + eksponentlint mod holdover::coast_phase_variance

seg-3ab4509b62a2 = Sammensat tidssynkroniserings-PL — dækning af holdover-envelope, flerårigt regime (tau>=90d)

seg-d9520f6c1769 = Den løbende maksimumenvelope dækker som overbound (uden gennemtrængning) en rigtig metrologisk serie ved hver testet lag tau>=90d på et usammenhængende segment; kort tau (<=30d) er en oplyst Modelled grænse

seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5-dages serie MJD 56074-60429 ({ "872" } punkter, webtai API); usammenhængende tilpasning/test, flerårig dækning uden gennemtrængning

seg-096b6cdfe2dc = Sammensat tidssynkroniserings-PL — LIL a.s.-envelope (umulighed + konsistens)

seg-1671add2210d = Ingen endelig worst-case holdover (Brownsk sup divergerer); IR-fordelt HPL i overensstemmelse med Hartman-Wintner-envelopen, når IR→{ "0" }

seg-c9ed8bbede70 = Lukket form a.s.-envelope √(2Dt·lnln t) identitet + kontrol af HPL-dominans; Baweja arXiv:{ "2606.24210" } umulighedssøm

seg-5a27c9f0a67d = Overbound for integritet af traceability-bias for heterogene UTC(k)

seg-fd09ab2adbf6 = Overbound for bias pr. kilde b = (U/k_cov)·Phi^-1(1-tail/2) + ældning, der oppuster en publiceret udvidet Type B-usikkerhed til en fordelt integritetshale; forbinder til tpl_scalar som bias_s

seg-d75b900ad25f = Korreleret krydskovarians for traceability-bias (fordeling, der er usikker ved fælles tilstand)

seg-0641f6d38c23 = N×N-krydskovarians for bias med rho·b_i·b_j uden for diagonalen for kilder, der deler en UTC(k)-realiserer; BEVIST correlated_fused_bias >= independent_fused_bias (naiv uafhængig fordeling underbegrænser den fusionerede bias -> optimistisk -> usikker)

seg-72359f29aab1 = Uafhængig numpy-reproduktion af krydskovariansen og uligheden mellem korreleret og uafhængig fusioneret bias (InternalConsistency). Repræsentativt kildesæt; Modelled scenarie.

seg-0359a9194c60 = GLS-afvægtning af fælles tilstand (Aitken) + Mahalanobis-identitet

seg-67b11ff6d055 = Håndrullet Cholesky Omega=LL^T og afvægtning ved fremadsubstitution z=L^-1 r (Cov(z)=I når Cov(r)=Omega); Mahalanobis-kvadrat z^T z = r^T Omega^-1 r

seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) og inv på { "201" } indcheckede SPD-input (tests/fixtures/gls_whitening_numpy_oracle) kontrollerer den håndrullede faktor, det afvægtede residual og afvægtningsoperatoren; Mahalanobis-kvadratet kontrolleres mod solve(Omega, r), som ikke bruger Cholesky, så identiteten z^T z = r^T Omega^-1 r bekræftes ad en separat vej. Alt inden for { "1e-12" } relativt (værst { "7.9e-16" }), tolerance fastsat før sammenligningen. Det største konditionstal er { "19.3" }, så dårligt konditionerede matricer er ikke dækket. GLS/Aitken { "1935" }-afvægtning er citeret.

seg-1a3bb032960f = Konsistensstatistik for fælles tilstand (fejl i delt reference, som separation er blind over for)

seg-1b03f522b8fc = Scorestatistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 for et fælles skift, som løsningsseparation (kontraster ortogonale på { "1" }) ikke kan se; et fælles skift oppuster den, mens parvise separationer forbliver flade

seg-91fc18cde833 = Grænse for ikke-detekterbar fælles tilstand uden for Omega

seg-0cc2c0f033c8 = Loft for ikke-detekterbar fælles tilstand: den største fejlstørrelse langs en retning d, der undslipper BÅDE separation (alpha_ss = T_ss / afvægtet kontrastnorm af d) og statistikken for fælles tilstand (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), rapporteret som min(alpha_ss, alpha_cm). Under en positivt definit Omega udelukker de to blinde retninger (d proportional med { "1" } og { "1" }^T Omega^-1 d = { "0" }) hinanden, så loftet er ENDELIGT for hvert d forskelligt fra nul; det er kun uendeligt for en nulretning eller en Omega, der ikke er positivt definit. En retning uden for den modellerede fælles akse er kun blind over for statistikken for fælles tilstand og er begrænset af separation

seg-a7a33523bb1c = Identificerbarhed af lunart datum - lineær algebra for dekomposition

seg-bd59cc76557a = Schur-komplement-marginal af blokken { "{" }lunocenter-X, skala{ "}" } i Fisher-informationen for Helmert-datum med 7 parametre: den skalare degenerationsmetrik lambda_min(S), CRLB for oprindelses-X og korrelationen mellem oprindelse og skala

seg-0f7e4fb31c44 = Uafhængig SciPy/NumPy-reference (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): Schur-komplementet, dets egenværdier og den 2x2 inverse beregnet af et uafhængigt bibliotek. Afgrænset til den LINEÆRE ALGEBRA i dekompositionen; størrelserne af den lunare korrelation/CRLB ud fra rigtig geometri forbliver MODELLED.

seg-3359eee713a5 = Klassifikation af nulrum for lunart datum (LLR-rangadditivitet + libration løfter defekt)

seg-6d722c176052 = Klassifikation af problemet med datum ved intern afstandsmåling: en enkelt afstandsobservation bidrager med rang { "1" } (nulrum med 6 dimensioner); parret oprindelses-X og skala er næsten nul, og fysisk DE440-libration løfter defekten til nul, mens parret forbliver næsten degenereret

seg-ae6dc4e6ea8b = Geometrisk struktur gengivet af motoren plus den lukkede 2x2 Schur-identitet; konsistent i STRUKTUR med Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), hvis rapporterede størrelser IKKE gengives her. Klassifikationen er strukturel; størrelserne af korrelation/CRLB under rigtig geometri er MODELLED (reflektorkoordinater og orientering holdt faste). { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): mod Sosnica et al. { "2025" } ligger korrelationen mellem oprindelse og skala i afstands-Fisher (-0.993 / -0.988) inden for { "0.05" } af den publicerede -0.97, men på papirets egen geometri med fem reflektorer er Helmert-korrelationen med 7 parametre og lige vægt -0.78 (den publicerede værdi hviler på fejl pr. reflektor, som papiret ikke trykker), og CRLB for oprindelsen ({ "0.6" } til { "1.2" } mm ved { "3" } mm afstandsstøj) ligger { "96" } til { "98" } % under papirets { "3.07" } cm mod en tolerance på { "20" } %. Størrelserne er ikke gengivet

seg-3fd19007ea67 = Multiteknik-information om lunart datum (LLR + lunar VLBI + orbiterafstand)

seg-23d0dd7d0666 = Datum-jacobianrækker for LLR-afstand Jord-reflektor, differentiel VLBI-forsinkelse mellem to lunare stationer og afstand orbiter-til-beacon over datum med 7 parametre, kombineret til én konsistent forkonditioneret Fisher; viser, at tracking uden for radialen (orbiter / dybdediversificeret) bryder degenerationen mellem oprindelses-X og skala, hvor transversal VLBI kun hjælper indirekte

seg-b2f5715c4577 = Analytiske krydskontroller mod finite differences af hver teknik's partielle (interne); forbedringens RETNING er et geometrisk faktum. Beaconplaceringer, planer og støj er MODELLED/repræsentative (se tests/fixtures/llr_geometry/NOTICE.md).

seg-f9796a4c9a85 = Leverandør af lunar orientering efter hovedakser fra DE440

seg-ebe4519a40e4 = Rotation fra MOON_PA_DE440 til J2000 ved vilkårlige epoker inden for 2014-01-01 til 2030-12-31 TDB, ved geodætisk interpolation R0·Exp(f·Log(R0ᵀR1)) mellem knuderne i en indchecket daglig serie på { "6" } 209 rækker (try_-funktionerne returnerer OrientationSpanError uden for den, de ufejlbarlige panikker; den klipper aldrig); indlejret ved kompilering, så der ikke er nogen fil-I/O ved kørsel, og WASM-builden bærer den

seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 gennem spiceypy { "8.2.0" }, kørt som værktøj): pxform fra MOON_PA_DE440 til J2000, der evaluerer JPL's binære PCK moon_pa_de440_200625.bpc direkte, med NAIF's egen rammekerne moon_de440_250416.tf, ved { "2 000" } tilfældige epoker uden for knuderne i det indlejrede vindue. Rotationsvinklen mellem Kshanas og SPICE's matricer ligger inden for { "1.7e-5" } rad ({ "30" } m ved middelradius { "1737.4" } km, fastsat før sammenligningen); målt værst { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad og værst { "1.75e-6" } rad på { "6 000" } yderligere epoker trukket af verifikatoren. De daglige knuder blev selv udtrukket fra den samme kerne (scripts/gen_de440_moon_pa.py, fixture-SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), så denne sammenligning tester interpolationen mellem dem, hvilket er påstanden. Fundet af denne sammenligning og rettet: den tidligere elementvise lineære interpolation med Gram-Schmidt bevarede aksen, men ikke vinklen i rotationen på { "13.2" } grader/dag og havde en fejl på op til { "2.0e-4" } rad ({ "340" } m) nær kvartpunkterne; det tidligere tal på omkring { "14" } m kom fra en vagt, der kun stikprøver intervalmidtpunkter. Serien dækker 2014-01-01 til 2030-12-31 og har fejl uden for den (runde { "2" }); dens knuder for 2024-2025 regenereres fra den samme kerne til { "4.3e-13" }. Sammenligningen med SPICE uden for knuderne ovenfor dækker kun 2024-2025, som er det validerede vindue; de udvidede knuder kommer fra den samme kerne og det samme script, men er ikke sammenlignet uden for knuderne. Et geometrisk substrat til identificerbarhedsanalyse, ikke et orienteringsprodukt under en meter

seg-ab96cfc8d48c = Geometrisk substrat for lunart LLR-datum (hovedaksereflektorer, jordstationer, analytiske afstandspartielle)

seg-40e91288f81a = De fem retroreflektorarrays på forsiden i PA-legemssystemets meter og LLR-jordstationerne i geodætiske koordinater; reflektorens placering fra legeme til inertial gennem DE440 PA-orienteringen; analytiske partielle af afstanden Jord-til-reflektor med hensyn til datum med 4 parametre; og den Fisher-matrix, der kun bygger på LLR, som udviser degenerationen mellem lunocenter-X og skala, der motiverer analysen med 7 parametre

seg-89ce1f95d9f6 = Beregningen kontrolleres internt: hver analytisk partiel mod en finite difference og tilfældet med datum nul mod den nominelle afstand. KATALOGET kontrolleres eksternt og uafhængigt - DE440-koordinaterne for hovedakserne (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) krydskontrolleres mod Table { "6" } i DE430-notatet om overfladekoordinater (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, maskinudtrukket fra en SHA-256-verificeret PDF af tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) og stemmer til { "1.12" } m, mens middel-Jord-realiseringen af de samme fem arrays afviger med { "672" } til { "871" } m. DEGENERATIONSSTRUKTUREN kontrolleres mod et publiceret resultat: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, som for det lunare hovedaksesystem rapporterer en korrelationskoefficient mellem lunocenter-X og skala på r = -0.97 og at LLR ikke når Månens faktiske massecenter med en nøjagtighed bedre end { "12" } cm på grund af den korrelation. Dette modul gengiver den samme struktur (|corr(t_x, scale)| mellem { "0.9" } og { "0.9999" }, datumdefekt <= { "1" }) ud fra et Fisher-design, der kun bygger på LLR. Bekræftelsen går på tværs af efemerider og er ikke en rundtur: papiret kombinerer INPOP21a, DE430 og EPM2021, mens dette modul drives af DE440-libration. Det, der IKKE er gengivet, er størrelsen - korrelationen her er omkring -0.988 mod deres -0.97, og CRLB med 4 parametre er under en millimeter mod deres opnåede gulv på { "12" } cm, fordi orientering og reflektorkoordinater holdes faste her og løses dér. Kun geometri og degenerationsstruktur; ingen nøjagtighedspåstand om et løst datum. { "0.30" } ekstern sammenligning: de dele af dette modul, der angår målt afstand (reflectors(), stations_itrf(), DE440 PA-placeringen og den barycentriske lysrejsetid llr_bcrs_one_way_m) er valideret i deres egen række, LLR-model for målt afstand, mod { "192" } ILRS-normalpunkter (RMS { "2.81" } m mod { "10" } m). Denne række forbliver MODELLED, fordi den målte sammenligning ikke afprøver resten af dens påstand. Den geodætiske stationskatalog stations() runder APOLLO til { "0.001" } grader; med en geocentrisk lysrejsetid giver den { "22.7" } m på de samme punkter (test reflector_ranges_against_ilrs_normal_points; { "96" } m med den tidligere elementvise orienteringsinterpolation). De analytiske afstandspartielle og den Fisher, der kun bygger på LLR, beregnes gennem llr_range_m og reflector_inertial med den analytiske Månserie (ephem::moon_position, omkring { "0.3" } grader fra GCRS) og uden lysrejsetid

seg-a78ba110b64c = LLR-model for målt afstand (reflektorkatalog, ITRF2020-stationer, DE440-placering efter hovedakser, barycentrisk lysrejsetid efter IERS { "2010" })

seg-c9827c1a427b = Envejsafstanden fra jordstation til reflektor for et normalpunkt i lunar laserafstandsmåling: de fem retroreflektorarrays på forsiden i DE440-hovedaksesystemets (PA) legemsmeter (lunar_llr_geometry::reflectors); stationerne i stations_itrf(), nemlig Grasse { "7845" } og Matera { "7941" } fra ITRF2020 ved epoke { "2015.0" } med deres hastigheder, placeret i Geocentric Celestial Reference System (GCRS) ved IERS { "2010" }-transformationen med polbevægelse fra Bulletin A (lunar_vlbi::station_inertial_position_itrs), og APOLLO { "7045" } ved operatørens publicerede omtrentlige geocentriske position (ingen hastighed); reflektorens placering fra legeme til inertial gennem DE440 PA-orienteringen (lunar_orientation::try_de440_moon_pa_body_to_inertial, som giver fejl uden for 2014-2030); og IERS Conventions { "2010" } Section { "11.2" } barycentrisk lysrejsetid (lunar_llr_geometry::llr_bcrs_one_way_m: transformationen Eq. { "11.19" } af station og reflektor til BCRS og Shapiro-forsinkelsen Eq. { "11.17" } fra Solen, Jorden og Månen). INPUT, ikke en del af påstanden: de barycentriske tilstande og potentialer for Jorden, Månen og Solen (DE440 gennem SPICE), IERS UT1-UTC og polbevægelse og den målte rundtur omregnet fra TT til TDB. PÅ TESTSELENS SIDE, ikke en del af påstanden: Mendes-Pavlis-zenitforsinkelsen med FCULa-afbildning, i testen, med elevation fra den geodætiske katalog stations(). Ikke modelleret: tidevand, stationsekscentriciteter, termiske led for reflektorer

seg-9b1dfa736cb6 = Koblet lunart referencesystem og tidsskalagauge: det fælles nulrum for rumligt datum, urets offset og urets rate

seg-a000ef6ab2e0 = assemble_coupled_info bygger den koblede Fisher med 9 parametre over [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space returnerer en basisinvariant dekomposition af dens nulrum i kun rumlige, kun tidslige og egentlig koblede dimensioner plus koblingsnormen for projektoren fra rumligt til tidsligt; coupled_marginal_eigs giver Schur-komplement-marginalen { "{" }skala, offset{ "}" }. På de indcheckede netværk rapporterer motoren et datum med fuld rang (defekt { "0" }) for det velstillede tilfælde og en nøjagtig enkelt defekt i rateretning for tilfældet med én epoke (forløbet tid nul, så raten ikke kan observeres pr. konstruktion), og beregner marginalen { "{" }s, d_tau{ "}" } i begge.

seg-35eebbc8a2e9 = HVAD DER KONTROLLERES EKSTERNT, angivet snævert: kshana beregner egenværdidekompositionen med sin egen håndskrevne Jacobi-løser (fim::sym_eig) og marginalen med sin egen pseudoinvers; referencen genberegner begge med numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) via scripts/gen_coupled_gauge_ref.py. Overensstemmelse til rel<{ "1e-3" } er derfor en kontrol med et uafhængigt bibliotek af DENNE CRATES ARITMETIK mod en standardimplementering, hvilket er den validerede påstand og hele den. HVAD DER IKKE KONTROLLERES: sammensætningen og klassifikationen af nulrummet er dette moduls egne regler, og referencen gengiver dem ud fra den samme specifikation og ikke fra en uafhængig kilde - det bekræfter implementeringen og ikke reglen. Beacon- og orbitergeometrien er modelleret og repræsentativ. Observationsrækkerne bærer rigtignok den virkelige DE440-orientering for Månen PA (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), men det er et INPUT, begge sider modtager, ikke belæg for svaret, og det er optaget her som proveniens og ikke som begrundelsen for status — den samme skelnen, som main allerede drager i rækken om integritet ved fælles tilstand. Hvert flydende tal i rækkerne er afrundet til { "6" } decimaler, før network.json skrives, så begge sider læser identiske IEEE-754-doubles, og den eneste forskel, der er tilbage, er løseren.

seg-63a8571f8eb0 = Degeneration mellem afstand og urets offset ved envejs lunar afstandsmåling og designloven om geometrisk diversitet

seg-cdd70f56051a = Degenerationen mellem radial afstand og modtagerurets offset pr. knude er præcis { "1" } m til { "3.336" } ns (en over c). Schur-komplement-marginalen { "{" }skala, offset{ "}" } (coupled_marginal_fisher) viser, at tovejs afstandsmåling i et geometrisk diversificeret netværk løfter marginalen med omtrent den samme faktor som et lige så stort antal ekstra envejsdata, mens løftet ved tovejs i det idealiserede regime med én knude er størrelsesordener større. Den designlov, der følger: geometrisk diversitet og ikke tovejs afstandsmåling som sådan er det, der adskiller lunar referencesystemets skala fra tidsskalaens offset ved envejs afstandsmåling; en tovejs eller ekstern tidsforbindelse er kun nødvendig i regimet med lav diversitet eller én bruger.

seg-25dd0e9134c8 = Schur-komplement-marginal af Fisher for den koblede informationsmatrix, i lukket form af lineær algebra, kontrolleret mod de to grænseregimer, den forudsiger. Ækvivalensen { "1" } m til { "3.336" } ns er definitionen af meteren via c og er ikke et empirisk resultat. Observationsnetværkene er repræsentativ modelleret geometri, så designloven er en udtalelse om den geometri, den præsenteres for, og gør ingen påstand om noget udrullet lunart netværk.

seg-16ec8283f9b4 = Kobling mellem relativistisk urrate og referencesystem for den lunare tidsskala

seg-d9a426dc8620 = rate_frame_jacobian(_with) giver følsomheden af den lunare tidsskalas rate over for realiseringen af referencesystemet, ud fra det ækvatoriale effektive potentiale afkortet ved grad { "2" } (GM, ækvatorradius, J2, rotation; LunarSurfacePotential): d_alpha/d_scale = L_m, omkring +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, omkring -1.11e-14 (tidsafhængig); d_alpha/d_r_radial = g_eff/c^{ "2" }, omkring +{ "1.806e-17" } pr. meter. For et radialt datumskift på { "1" } m er det en ratepåvirkning på omkring { "1.8e-17" } (en aritmetisk konsekvens af den radiale post), langt under den rateoffset på omkring { "1.7e-11" }, som en lunar tidsskala har mod TT

seg-a666792106d9 = Basisinvariant klassifikation af det koblede nulrum for referencesystem og tidsskala

seg-5ee36574d1b4 = classify_null_space dekomponerer datums nulrum i rent rumlige (dimension d minus rang U_T), rent tidslige (d minus rang U_S) og egentlig koblede (rang U_S plus rang U_T minus d) dele, plus koblingsnormen p_st_norm for projektoren fra rumligt til tidsligt, Frobenius-normen af den off-diagonale blok i nulrummets projektor. Hver af disse er en funktion af PROJEKTOREN og ikke af en valgt basis, så de er invariante under ethvert ortonormalt valg af nulvektorer - hvilket er det, der overhovedet gør klassifikationen rapporterbar.

seg-2c074d6260ba = Repræsentativt multiteknik-målemenu og den additive kombinationsregel for Fisher

seg-beefac5c1b13 = MeasurementBlock rummer én kandidatmålekampagne som et Fisher-informationsbidrag på 7x7 plus en skalar relativ pris; block_from_rows bygger én ud fra rå datum-jacobianrækker, så hver blok forkonditioneres identisk gennem lunar_identifiability::assemble_multi_info; combine summerer informationen for en valgt delmængde, hvilket er den rigtige regel, fordi Fisher-information er additiv på tværs af uafhængige målinger; representative_lunar_menu leverer en deterministisk menu med fire blokke (LLR, en transversal VLBI-limb-beacon, en orbiter på forsiden og en orbiter på bagsiden). Den budgetbegrænsede designoptimerer, der bruger denne menu, er ikke en del af dette crate.

seg-d83a9942ee72 = Additivitet af Fisher-information på tværs af uafhængige målinger er en egenskab ved lukket form, kontrolleret her mod en uafhængigt skrevet elementvis sum og mod den ordensinvarians og monotonicitet, der følger af den. BEMÆRKNING OM EVIDENS: kombineren havde tidligere slet ingen test, og den ene test i modulet summerede de to informationsmatricer inline i stedet for at kalde den, så en ødelagt kombiner ville have ladet modulet være grønt; testen går nu gennem combine og fejler, når den muteres. Alle beaconplaceringer, orbitergeometri, præcisioner pr. teknik og relative priser er repræsentative valg og ikke missionsværdier (se tests/fixtures/llr_geometry/NOTICE.md), så hver degenerationsmetrik og hvert CRLB-tal nået gennem denne menu arver den modellerede status fra lunar_identifiability::decompose.

seg-341eedfc47da = Konsistens mellem lunare referencesystemer/dynamik fra forskellige leverandører (reel inter-efemeride)

seg-f8d94c0771cc = dekomposition med kun rotation (6 parametre translation+rotation) af uenigheden mellem DE440/INPOP21a/EPM2021 for den geocentriske Måne i en reducerbar fælles ICRF-referencekobling og et irreducibelt overskud i lunar banens orientering (den fulde Helmert-tilpasning med 7 parametre er en separat offentlig funktion, som denne eksterne kontrol IKKE dækker: dens evidens er en intern enhedstest af analytisk genfinding plus tests/lunar_helmert_fit_cross_check.rs, som sammenholder den med den validerede eksakte Gauss-Newton-tilpasning i lunar_frame_realise og fastlåser konventionen om modsat rotationsfortegn mellem de to)

seg-c69fd3fc645b = Tre uafhængige autoritative efemerider — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — samplet via IMCCE calceph, krydskontrolleret af en uafhængig numpy SVD-tilpasning med mindste kvadrater. HVORFOR DETTE ER valideret, MENS lunar_common_mode IKKE ER det, på de samme tre efemerider: her ER den rapporterede størrelse en egenskab ved de publicerede data — deres indbyrdes uenighed — så efemeriderne er den uafhængige reference og ikke et input. I lunar_common_mode føder den samme uenighed en MODELLED konstellationsgeometri, og svaret er en egenskab ved den model, hvilket er grunden til, at den række med rette er Modelled/ReferenceImpl.

seg-2d3347bcb15e = Tolerance for konsistens mellem leverandører for en bruger med blandede leverandører

seg-9decf2cb6b0c = consistency_tolerance: inverterer et positionsbudget for brugeren til et krav om overensstemmelse pr. parameter mellem leverandørers Helmert (oprindelse/skala/rotation) ved en referencearm, eventuelt oppustet af CRLB for realiseringen hos én leverandør (P1)

seg-b8dc68eb4bda = Trekantsgrænse for worst-case for Helmert-punkt-jacobianens virkning (lukket form)

seg-5450d921dfc9 = Fejlbudget for lunar interoperabilitet mellem flere leverandører og designlov for referencesystem mod efemeride

seg-e1e30f5c17a6 = interop_budget: opdeling i reducerbar (fælles referencekobling) og irreducibel (dynamik) under konventionerne PerProvider / CommonFrameTie / CommonEphemeris, med designlovsmetrikken for den irreducible andel (~{ "0.69" } på rigtige DE440/INPOP/EPM: et fælles referencesystemmærke alene efterlader det dominerende gulv)

seg-46304ae1efa4 = RMS-aggregering af de validerede opdelinger pr. par under hver konvention (lukket form)

seg-a01f394a36d3 = Autonom lineær-algebra-pipeline for fejlobserverbarhed i frit netværk (paritetsprojektor, detekterbarhed, MDB-ikke-centralitet, byzantinsk blok-spark)

seg-b3389bb90e8d = På det reelle DE440-lunare netværk pr. knude (hver række en differentiel envejsafstand mellem knuder bygget via pernode_range_row med en rigtig DE440-sigtelinje i Månens PA-system) beregner motoren den vægtede paritetsprojektor P⊥ = I − G(GᵀWG)⁺GᵀW (den rangdefekte pseudoinversform, der overlever det 8-dimensionelle gauge datum⊕tidsskala), detekterbarhedsresidualet T1 ‖P⊥·b‖ (fejl i rækkevidden udslettes, generiske fejl er detekterbare), Baardas kvadratiske form for MDB-ikke-centralitet cᵀWP⊥c (den korrekte vægtede form med enkelt P⊥, IKKE formen med dobbelt P⊥ cᵀP⊥WP⊥c) med MDB = √(λ₀/cᵀWP⊥c), og de byzantinske antal blok-spark for detektion/identifikation af de stablede effektive jævnbyrdige signaturer P⊥·B_T (kolonnerang og ikke blot forskellig fra nul)

seg-8cb248423fd0 = Uafhængig lineær-algebra-reproduktion med numpy/scipy på rigtige DE440-sigtelinjerækker i Månens PA-system (P⊥ fra SVD af det afvægtede design W^{ "{" }1/2{ "}" }G; MDB-ikke-centraliteten fra Baardas ({ "1968" }) klassiske kvadrerede norm i paritetsunderrummet; blokrangen fra en optælling af singulærværdier med numpy SVD) — en reelt anden numerisk vej end cratets cykliske Jacobi-egenværdidekomposition af GᵀWG. Omfang (jf. tests/fixtures/faultobs/NOTICE.md): dette validerer KUN LINEÆR-ALGEBRA-PIPELINEN på disse rækker. Knudegeometrien er modelleret. Det er IKKE en operationel integritetsgaranti, ikke en certificering af beskyttelsesniveau og ikke nogen påstand om RAIM/ARAIM-tilgængelighed, og IKKE en missionsgaranti om byzantinsk fejltolerance — ANTALLET af tolererede fejl for dette netværk er modelleret, mens GRÆNSEN for blok-spark detektion>f / identifikation>2f er citeret (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blokvis spark fra Donoho–Elad { "2003" }) og bevist instantiering i kode

seg-ebb827739614 = Byzantinsk grænse for blok-spark ved detektion/identifikation på det autonome lunare netværk pr. knude (T3)

seg-4fb935e6193d = byzantine_bound instantierer kodnings-/sparse-observerbarhedsgrænsen for sikker tilstandsestimation på geometrien i netværket pr. knude: en byzantinsk peer injicerer en vilkårlig lineær kombination af de målinger, den deltager i, og netværket DETEKTERER enhver koalition på ≤ f = block_spark − { "1" } peers og IDENTIFICERER entydigt enhver koalition på ≤ ⌊(block_spark − { "1" })/2⌋, hvor block_spark er den mindste peer-koalition, hvis stablede effektive signaturer P⊥·B_T er kolonnerangdefekte. Peer-detekterbarhed er FULD KOLONNERANG for P⊥·B_j (en blok, der ikke er nul, men er rangdefekt, er et angreb forskelligt fra nul, der lander i range(G) og efterlader intet residual), ikke blot P⊥·B_j ≠ { "0" }

seg-3b8b54db475d = Geometrisk instantiering af grænsen for blokvis spark / sikker tilstandsestimation (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blokvis spark fra Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — IKKE Lamport–Shostak–Pease-konsensustærsklen 3f+{ "1" } ('byzantinsk' angiver kun den vilkårlige/sammensvorne fejl-MODEL). Det specifikke antal tolererede fejl er en modelleret egenskab ved den repræsentative netværksgeometri, kontrolleret for selvkonsistens af håndkonstruerede analytiske tilfælde og tælleformlerne

seg-4f57f586cf82 = Gulv for tidsligt gauge ved autonom holdover for den selvrefererende lunare konstellation (T4)

seg-eb690e8f5c9b = holdover_floor fastslår, at i et ensemble af autonome knuder, der kun er forbundet af målinger mellem knuder, er den fælles urrate (δα_j += { "1" } ∀j) en fri parameter i ensembletiden, der ligger i N(GᵀWG): ingen mængde yderligere afstandsmåling mellem knuder kan observere den (rate_in_gauge = true, temporal_gauge_dim = { "2" } med den fælles offset). Det er det ægte holdover-gulv — det tidslige modstykke til positionsgaugen for det stive system. Tilføjelse af én ekstern absolut ratekobling (et direkte link til en reference uden for netværket) driver den fælles rate ud af nulrummet (rate_in_gauge = false, temporal_gauge_dim = { "1" }) og beviser, at gulvet er en reel gauge og ikke et artefakt i oscillatormodellen

seg-097f126797bb = Argumentet om fri parameter i ensembletiden (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instantieret på det repræsentative reelle DE440-netværk pr. knude: en relativ-residual-nultest af den analytiske generator for fælles rate mod GᵀWG, med den kontrast, hvor koblingen er brudt, der skelner den ægte gauge fra et artefakt i oscillatormodellen. Repræsentativ modelleret geometri, ikke et certificeret tidssynkroniseringsbudget

seg-25ffd6e1979c = Fælles/differentiel opdeling pr. leverandør, forening af én rangdefekt og slope for beskyttelsesgab (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Tre facetter af den enkelte dekomposition ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) med det 8-dimensionelle gauge datum⊕tidsskala som N(G) og de state_dim − { "8" } = { "32" } observerbare retninger som range(G): (T5) provider_mismatch_split klassificerer en fælles bias hos flere leverandører (∈ range(G)) som IKKE-DETEKTERBAR — der kræver en ekstern kobling — og en differentiel bias (∉ range(G)) som selvovervåget / DETEKTERBAR; (§{ "0" }) foreningen er, at det SAMME blinde underrum range(G) styrer klassen af ikke-detekterbare fejl, så datumgaugen N(G) og det fejlblinde underrum range(G) er én geometri og ikke to; (g7) slope returnerer Browns slope for beskyttelsesgab ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ for en fejl b ∈ range(G) (estimator ødelagt med nul paritet) og endelig for en detekterbar fejl

seg-e0fd3860fce9 = Lukket form af algebra for paritetsprojektor / pseudoinvers på det repræsentative reelle DE440-netværk pr. knude: den fælles/differentielle opdeling, foreningen N(G) ⊕ range(G) og Browns ({ "1992" }) slope for beskyttelsesgab følger alle af udslettelse af rækkevidden P⊥·G = { "0" }. Repræsentativ modelleret geometri, ikke et certificeret beskyttelsesniveau

seg-101b0551d987 = MTIE og TDEV for tidsynkronisering i telekommunikation på en tidsfejlserie fra holdover

seg-b4762fd3cb9d = Den maksimale tidsintervalfejl og tidsdeviation, som scenarietypen <c1/> rapporterer, på en holdover-registrering i telekommunikationsskala: en O(n) MTIE med monoton kø og glidende vindue (telecom_timing::mtie_sliding, nødvendig for at et døgn af sekundsamples forbliver hurtigt) og motorens TDEV (allan::time_deviation), evalueret på det gitter, scenarietypen rapporterer, og læst tilbage fra en fuld kørsel, der indlæser serien

seg-59cb2711355c = allantools { "2024.06" } — et uafhængigt tredjepartsbibliotek for frekvensstabilitet — mtie() og tdev() på tests/fixtures/telecom_timing/holdover_te_series.csv, serien parset fra den samme tekst med 17 betydende cifre på begge sider; referencen optager seriens SHA-256 og kan regenereres offline via tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validerer ESTIMATORERNE på denne registrering og ikke den syntetiske holdover, der frembragte den

seg-632add2dbd3c = ITU-T-masker for synkronisering i telekommunikation med PASS/FAIL og margin

seg-47687529aee7 = Transskriberede grænser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A holdover (herunder tidsfejlenvelopen i Table { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-klasserne A-D og G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referencepunkt C, hvert interval åbent eller lukket, som tabellen angiver det, med hver post 'for further study' udeladt; en verdict og en margin ved det bindende punkt for hver kontrol og tiden til at overskride hvert budget. Kan køres som scenarietypen <c1/>

seg-165ed2bc771a = ITU-T-masker for wander-generering ved frekvenssynkronisering (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Syv MTIE- og TDEV-masker for wander-generering ved konstant temperatur til typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) Types I, II og III, G.8262 (10/2024) EEC Options { "1" } og { "2" } og G.8262.1 (11/2025) eEEC (låst tilstand), herunder de potenslovsstykker, tabellerne skriver (<c2/> og lignende), hvert interval åbent eller lukket, som det er trykt, målt gennem det filter på { "10" } Hz, som klausulerne angiver (taget som anvendt før sampling); referencescenariet scenarios/telecom-synce-eec.toml stiller en frit løbende OCXO op mod de tre EEC-masker. Ikke implementeret: tillæg for variabel temperatur, holdover, transienter, jitter og frekvensnøjagtigheden i G.811

seg-ca16d9c98dc5 = Transskription af de navngivne Recommendations (hentet fra itu.int den 2026-10-13), hver række læst igen mod teksten, med den kontinuitet i knækpunkter, som de trykte koefficienter medfører, afgrænset i testene (for eksempel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns mod platået på { "100" } ns i G.812 Table { "4" }). En standardtransskription med interne konsistenskontroller, ikke en test af overensstemmelse og ikke en ekstern validering. G.812 (06/2004) er opført som afløst af en forhåndspubliceret udgave 08/2026, og G.811 har en Amd. { "1" } (04/2016); ingen af dem kunne læses, så ingen af dem er kontrolleret. Scenariet med den frit løbende OCXO overdriver oscillatorens bidrag ved observationsintervaller, der er lange i forhold til en løkkes tidskonstant; det siger intet om noget udstyrsur

seg-5fc2ad88faf0 = Urlogformater (RINEX clock, TimeLab ASCII, TAPR TICC) læst til en normaliseret faseserie

seg-5b5bcbdea166 = clock_log::read_input: ét parserlag, der omdanner en RINEX-urfil (AS/AR-poster for ét navngivet ur, versionerne { "2" } og { "3.00" } til { "3.04" }), en fase- eller frekvenslog i TimeLab-stil ASCII eller en TAPR TICC-log med tidsstempler eller intervaller til et ensartet fasegitter, med tau0 angivet, fra en header eller som medianafstanden, hvert hul, aflæsning uden for gitteret og dublet talt, og en politik for huller med refuse, longest-run eller linear; koblet opt-in ind i serien for telecom-timing (<c1/>, der tilføjer en blok <c2/>) og scenarietypen clock (<c3/>, der tilføjer en blok <c4/> med ADEV, TDEV og MTIE, tabellens SHA-256 og fasens SHA-256; runs = { "1" }). Uden tabellen er begge typer byte-identiske

seg-acdb0337bce7 = Urlogformater linuxptp (ptp4l, phc2sys, ts2phc) og chrony (tracking, statistics) læst til en normaliseret faseserie

seg-e87b3dba2072 = clock_log::read_input med formaterne ptp4l, phc2sys, ts2phc, chrony-tracking og chrony-statistics: den loggede offset fra en servolinje i linuxptp (ns, linjens egen tidsstempel i klammer, aflæsninger før servoen første gang rapporterer s2 udeladt og talt) eller fra en chrony-tracking- eller statistics-log (s, efter kolonneposition, UTC-dato og -tid) bliver til et ensartet fasegitter gennem de samme politikker for huller som de andre formater; en kildevælger (<c1/>) navngiver én af flere grænseflader, ure eller adresser; logs føder serien for telecom-timing, typen clock og typen holdover-test

seg-fb9393044576 = Fixtures skrevet til Kshana ud fra dæmonernes offentlige linjeopbygning, med opdigtede værdier (NOTICE.md i fixturemappen); ingen log fra en rigtig installation blev læst, og ingen uafhængig reference sammenligner parsingen med en anden læser, så en opbygning, der er forskellig mellem dæmonversioner, stadig kan afvises eller misforstås. De estimatorer, som faseserien føder, er dem, der er valideret mod allantools i rækkerne ovenfor

seg-97aebb84576e = Holdover-test bedømt ud fra en tidsfejlregistrering leveret af operatøren

seg-ab533cf99c56 = Typen <c1/>: en tidsfejlregistrering (en urlog fra linuxptp, chrony, TICC, TimeLab eller RINEX, eller par time_s,time_error_ns) deles ved de to tidspunkter, operatøren angiver for fjernelse og genoprettelse af GNSS, i et baseline-, et holdover- og et genoprettelsestrin; baseline måles mod de ITU-T-masker, der er skrevet til et låst ur, og holdover mod dem, der er skrevet til holdover eller et autonomt ur, ePRTC-A-holdover-envelopen og tidsfejlbudgetterne; holdover rapporterer den frekvensoffset med mindste kvadrater, som systemet holdt, og genoprettelsen, om og hvornår |TE| kom inden for et angivet bånd og blev der i en angivet opholdstid, med toppen og det største trin. Hver grænse er den, som typen telecom-timing transskriberer; de to tidspunkter er operatørens udsagn og er ikke verificeret

seg-a54380cf95ea = Håndberegning på registreringer bygget af formler, hvis hældning, trin, ekstremum og genoprettelsestid er kendt før kørslen (testene angiver dem), og maskerne, envelopen og budgetterne i rækkerne for telecom-timing ovenfor. Ingen laboratoriemåling af en rigtig holdover er bedømt, og ingen ekstern uafhængig reference er sammenlignet, så typen gør ingen påstand om noget ur eller system; en partner i et tidslaboratorium er nødvendig, før noget tal pr. urklasse kunne forfremmes

seg-94cbac97a1aa = Tilgængelighed af GNSS-signaler i Space Service Volume og videre, sammenholdt med ICG SSV-hæftet

seg-c59e349fdc9e = Tilgængelighedssweeps for typen <c1/>: pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og kombineret, andelen af par (bruger, epoke) med mindst ét og mindst fire signaler og det længste udfald, for en bruger på en kugle (hæftets globale skal med 2,562 punkter, { "14" } dage ved { "1" } minut) eller på en bane (GEO, HEO, lunar transfer), ud fra Kepler-banerne i hæftets annex C, en konstant mindste udstrålet effekt inden for referencevinklen uden for boresight, jordens afskærmning ved kuglen plus { "50" } km og en C/N0-tærskel; brugerantenner fra hæftets table B10

seg-d71c9d361342 = ICG Space Service Volume-hæftet (UN OOSA ST/SPACE/75, { "2018" }), selv en simulering, sammenlignet under en præregistrering committet før kørslen (xval/gnss-ssv/PREREGISTRATION.md; resultater i xval/gnss-ssv/RESULTS.md, fastlåst af tests/ssv_booklet_results.rs, misses inkluderet). Kørsel { "1" } på den præregistrerede læsning: konstanterne for mindste udstrålet effekt og den lunare tærskel stemmer (S0, S6 nået); tærsklerne for øvre og nedre SSV, RF-tærskel, GEO og HEO er NOT MET, næsten alle gennem GLONASS, som hæftet giver { "20" } og { "28" } grader for i tables B2 og B6 og { "26" } og { "34" } grader i table { "4.2" }. En diagnostisk variant med vinklerne fra table { "4.2" } stemmer i hver celle for øvre SSV, nedre SSV og de seks GEO-missioner (den erstatter ikke kørsel { "1" }; celler for RF, HEO og lunar bommer stadig). De målte panelmønstre for GPS L1 gengives ikke af det parametriske stedfortræderskøn (RMS { "6" } til { "9" } dB mod en tærskel på { "3" } dB). Overensstemmelse viser, at hæftets angivne metode gengives, ikke at GNSS-signaler opfører sig sådan

seg-d2f04991c8a4 = Effekter af limb-stråle på ionosfære, plasmasfære og atmosfære for strejfende GNSS-signaler og designet af modtageren til svage signaler, i typen <c1/>

seg-1a1786ba90b6 = En Chapman-ionosfære, en plasmasfære af Gallagher-typen og en neutral atmosfære (brydningsbøjning, iltabsorption, defokusering) integreret langs den rette stråle mellem sender og bruger: skrå total elektronindhold, dets plasmasfæriske del, ekstra forsinkelse, tangenthøjde og tabet på strejfende links; og et modtagerdesign til svage signaler (kohærent og ikke-kohærent integration, databitgrænse, støtte, Doppler-søgning), der fastsætter C/N0-tærsklen ud fra modellerne for akkvisition og tracking-løkke

seg-4ca1217472ab = Lukkede former og publicerede størrelsesordener i testene (en Chapman-lags top og bøjningen ved overfladens limb, nogle få TECU plasmasfære på en stråle fra GPS til GEO); modtagerdesignet genbruger modellerne for akkvisition og tracking-løkke og deres tests. Ingen målte data fra limb-sondering eller modtagelse af svage signaler er sammenlignet med det

seg-6b8f9f3ca2a3 = GNSS-navigationsfilter om bord for rumfartøjer i høj bane og lunar transfer

seg-39ddc494f103 = Tilstanden <c2/> i typen <c1/>: et udvidet Kalman-filter med ni tilstande (position, hastighed, modtagerurets bias og drift, en skala for solstrålingstryk) på pseudoafstande, hvis tilgængelighed, støj og C/N0 kommer fra den samme linkgeometri som sweepene; sandheden integreres med J2, tredjelegemer Solen og Månen og strålingstryk med skygge, filteret modellerer J2 og tredjelegemerne og estimerer strålingstrykket; rapporterer positions- og hastighedsfejl inden for og over GNSS-banerne, det længste målingshul og den gennemsnitlige NEES

seg-469602656ab4 = Simuleret sandhed mod filterets eget estimat (et konsistent filters gennemsnitlige normaliserede kvadrerede estimationsfejl er omkring { "3" } for positionen) og determinisme for et fast seed. Ingen flyvedata eller optagede GNSS-data fra høj bane er sammenlignet; Solen og Månen er cirkulære stedfortrædere med lav præcision

seg-5fc242476828 = Relativ navigation for en formation af flere rumfartøjer i en stærkt elliptisk bane ud fra GNSS

seg-f67eb29d4483 = Tilstanden <c2/> i typen <c1/>: en chief og deputies kører hver det absolutte filter; deputy'ens position i forhold til chief estimeres ved at trække de absolutte estimater fra hinanden og ved et relativt filter på enkeltdifferencerede pseudoafstande for de signaler, begge fartøjer sporer, med den relative dynamik som forskellen mellem to ikke-lineære baner

seg-69c078b57fc8 = Den samme simulerede sandhed som for det absolutte filter: det relative filters fejl mod den sande relative tilstand og kontrollen af, at det klarer sig mindst lige så godt som at trække to uafhængige absolutte positionsbestemmelser fra hinanden. Ingen flyvedata fra en formation er sammenlignet

seg-7038f6902820 = Fejlled i koldatom-interferometer: Raman-laserfasestøj, bias fra bølgefrontens krumning og opløsning af fringe-flertydighed

seg-4d9690207607 = inertial::cai_error_terms (biblioteksfunktioner, endnu ikke tilgængelige fra en scenarietype): vægtningsfunktionen for Raman-fasen i et interferometer med tre firkantpulser (Cheinet et al. { "2008" }, Eq. { "8" }) med den lukkede form for hvid fase (pi/2)^{ "2" } S_phi0/tau_R og en numerisk vej for ethvert spektrum; den laserfrekvensstøj, som forsinkelsen ved retroreflektion ikke ophæver (Le Gouet et al. { "2007" }, Eqs. { "9" } til { "11" }); den rene defokus-bias sigma_v^2/R for en termisk sky og dens reduktion ved en detektionsradius; sandsynligheden for forkert fringe-indeks erfc(pi/(sqrt({ "2" }) s)) for en klassisk accelerometerstøtte og for to afhøringstider, og dens inverse

seg-a7b220763674 = Hver lukket form mod en uafhængig numerisk vej i testene (kvadratur i frekvensdomænet af den eksakte overføringsfunktion og forsinkelsesfilteret, en Monte Carlo over atomer for bølgefrontens bias, en Monte Carlo over skud for fringe-indekset) og dens grænsetilfælde. Én publiceret gennemregnet værdi: Cheinet et al. { "2008" } (arXiv:physics/0510197, Sec. IV) angiver, at ved tau_R = { "20" } us kræves en hvid Raman-fasestøj under -111 dB rad^2/Hz for { "1" } mrad pr. skud; det hvide led alene giver { "0.99" } mrad (papiret udleder niveauet med sin Eq. { "17" }, flicker plus hvid). Intern konsistens og én gennemregnet værdi, ikke en ekstern validering; aberrationer af højere orden og ethvert bestemt lasers støj er ikke modelleret

seg-c380ec16a4f8 = Greenhalls og Rileys eksakte ækvivalente frihedsgrader for Allan-, modificeret Allan- og Hadamard-varianserne

seg-dee2a54c5019 = allan::edf_greenhall (med omslagene edf_greenhall_adev, _mdev og _hdev): den fulde algoritme fra Greenhall og Riley, Proc. 35th PTTI ({ "2003" }), Section { "3" } (Eqns { "7" } til { "13" } og koefficienterne for stor J i Tables { "1" } til { "3" }), for differensordner { "1" } til { "3" }, støjeksponenter +{ "2" } til -4, hvor alpha + 2d > { "1" }, overlappende og ikke-overlappende, modificerede og umodificerede estimatorer; NaN, hvor den ikke gælder, herunder det umodificerede tilfælde med hvid PM med ceil(M/S) <= d, hvis lukkede form ikke er implementeret. assurance::uncertainty::edf deler nu koden og bevarer sine outputs bit for bit

seg-363705e03bac = Forudindstillinger for oscillator-holdover fra offentlige datablade

seg-9750d9e0ec7a = Fire forudindstillinger — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cæsium (Microchip 5071A højtydende rør) og CSAC (Microchip SA.45s) — hver med sit datablads maksima for Allan-deviation, ældning og temperaturgrænse; en ikke-negativ mindste kvadraters tilpasning af frekvensstøj med hvid + flicker + random walk, skaleret til at indhylle hvert datablads punkt, et flickergulv aldrig under tallet for det længste τ, lineær ældning og et sinusformet temperaturled, syntetiseret som en seedet holdover efter et tab af GNSS

seg-69f93d5ec864 = Holdover-forudsigelse ud fra en målt urregistrering, kontrolleret på tilbageholdte data

seg-8bdc5a24c66d = Målt-registrering-vejen i typen <c1/>: den overlappende Allan-deviation af en faseregistrering tilpasset ved edf-vægtet ikke-negativ mindste kvadrater i basen for hvid fase og IEEE Std { "1139" } frekvensmodulation (slot_timing::fit_weighted), derefter inverteret for den frie løbetid, hvor tidsfejlen når en tærskel (slot_timing::slot_budget). Gulvet for rød støj måles ud fra registreringen i stedet for at blive antaget

seg-c888226296fe = Et rigtigt frit løbende atomur: { "556 990" } fasesamples på et sekund fra en 5071A-cæsiumstandard målt mod en brintmaser (A. Wallin, distribueret med allantools; fastlåst commit og SHA-256 i scripts/fetch_cs5071a.sh), den samme registrering som tests/cs5071a_reference.rs bruger til estimatorerne. De tilbageholdte to tredjedele er en ekstern måling, som forudsigelsen aldrig så. Datastyret: workflowet realdata-clock henter registreringen og kører testen med KSHANA_REQUIRE_REALDATA={ "1" }. Validerer vejen tilpas-så-inverter på en atomstandard domineret af hvid FM over frie løbetider på op til omkring { "50 000" } s; ikke databladet eller kilderne til klasser, ikke de deterministiske led. IKKE en krystaloscillator: på en målt OCXO-registrering (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } timer mod en brintmaser) er den tilbageholdte forudsigelse konservativ, ved { "0.59" } til { "0.70" } af det målte brud, og for det meste uden for tærsklen, fordi den oscillators støjgulv blev halveret under registreringen; i stikprøven ligger den inden for { "0.98" } til { "1.17" }. Krystaltilfældet forbliver MODELLED. IKKE heller atomure i bane: på { "10" } GPS Block IIF-satellitures (tests/slot_timing_igs_holdout.rs, IGS endelige { "30" } s-ure, { "14" } dage, protokol skrevet før download) ligger { "8" } inden for tærsklen, og { "2" } (G25, G30) er optimistiske med op til omkring 2x, så under protokollen forbliver det orbitale tilfælde MODELLED

seg-d7e03158b972 = Sekunder, til et frit løbende ur forlader en tidsindekseret slots guard, og den hyppighed af positionsbestemmelser, der holder det inden for

seg-0b4d8815f756 = Typen <c1/>: den forudsagte fejl E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² inverteret for bruddet, den resterende tid, resynkroniseringsintervallet netto efter latens for positionsbestemmelsen og antal positionsbestemmelser pr. døgn, hvert led specificeret med det dominerende angivet; ure fra de seks standardværdier i ClockClass (TCXO, OCXO og RAFS tilføjet, hver med henvisning til ét datablad), forudindstillingerne for telecom-timing, et inline datablad eller en målt registrering; et brud ud over kildens længste middelingstid markeret som ekstrapoleret

seg-cc0464060e58 = Lukkede former for hvert led alene og den uafhængige rodsøgning holdover::holdover_seconds; databladstallene er de navngivne dokumenter (docs/SLOT-TIMING.md). En klassestandard hviler på et antaget gulv for rød støj, og en databladkilde er en envelope af maksima, så ingen af dem er en måling af nogen enhed

seg-2797643153dc = Beskyttelsesniveau for tidssynkronisering for en modtager i kredsløb under GNSS-spoofing

seg-cb412a2ffadf = orbital_timing::orbital_timing, tilgængelig som spoofing-afsnittet i <c1/>-typen: hastighed og omløbstid i cirkulær bane, den længste tid, en spoofer på jorden kan nå satellitten pr. passage, gulvet for den urunderstøttede monitor og CUSUM-detektionsforsinkelsen, det betingede beskyttelsesniveau (gulvet plus udrulning over forsinkelsen), den afvigelse, en spoofer med en angivet maksimal rampehastighed opbygger, før satellitten forlader sit dækningsområde, eller en uafhængig kontrol kører, og om hver kontrol via jordkontakt eller krydslink er uafhængig af én spoofer på jorden

seg-3d441db3a373 = Reduktion til det eksisterende beskyttelsesniveau for tidssynkronisering og til de lukkede former for cirkulær bane og sfærisk Jord for synlighed. Betinget af detektion, én terrestrisk spoofer med en angivet rampehastighed, en passage lige overhead på en ikke-roterende Jord; ikke valideret på en spoofet modtager i kredsløb

seg-158a99d40b0d = Lukkede former for effektspektraltætheder og spektrale separationskoefficienter for L-bånd-signaler

seg-17060c71fa54 = Effektspektraltætheder med enhedsareal for GPS L1 C/A og L2C (BPSK({ "1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), sinus-BOC({ "1,1" }) og Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, med en tilføjet MBOC-variant), deres numerisk lokaliserede nulpunkter og maksima (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz) og den spektrale separationskoefficient for et signal mod et vilkårligt spektrum ved en vilkårlig forskydning (navsignal::spectral_separation_coeff_offset) eller mod en tone, flad støj, et chirp eller matchet støj (spectrum::Jammer::ssc), med anti-jam-koefficienten Q = 1/(R_c kappa)

seg-d8fadba57203 = Offentliggjorte lærebogsværdier: BPSK(n)-hovedloben på 2n x { "1.023" } MHz fra nulpunkt til nulpunkt og anti-jam-koefficienterne Q = { "1" } for en smalbåndet (CW) jammer og Q = { "1.5" } for en spread-spectrum-jammer matchet til C/A (Kaplan & Hegarty, Understanding GPS/GNSS, 3. udg., afsnit { "9.4" }); BOC(m,n)-hovedlobernes centrering ved plus eller minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); de spektrale separationskoefficienter -61.8, -64.8 og -67.8 dB/Hz for C/A med C/A, BOC({ "1,1" }) med BOC({ "1,1" }) og C/A med BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, maj/juni { "2006" }), gengivet her ud fra deres lukkede former via Parseval og autokorrelation. BOC({ "1,1" })-maksimum ligger ikke ved { "1.023" } MHz: loben strækker sig fra bærebølgens nulpunkt til { "2.046" } MHz og topper ved { "0.759" } MHz, og testen fastlåser begge dele. MBOC-blandingen er ICD-definitionen og kontrolleres kun for enhedsareal og linearitet

seg-f134975d4ffa = Vandfaldsdiagram af L-bånd-spektret med J/S pr. bånd og effektiv C/N0 under en scriptet jammer-tidslinje

seg-86ad8f89a822 = <c1/>-typen: et gitter af frekvens over tid for L-båndets effektspektraltæthed (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalerne ved deres minimale modtagne effekter fra interfacespecifikationen samt jammere af typen kontinuert bølge, smalbånd, chirp og matchet støj med til- og frakoblingstider), hver celle middelberegnet over sin bin og række (chirps nøjagtigt over hele og delvise sweeps, jammere efter driftscyklus), effektiv C/N0 pr. bånd = [1/(C/N0) + sum (J/S) kappa]^-1 pr. række, J/S pr. bånd, J/S i båndet og et SVG-vandfald med C/N0-søjler. Rapporten indeholder en krydskontrol mod kæden i <c2/>-typen på de samme linkinput

seg-deead3dc3c43 = Reduktion til den eksisterende <c1/>-typens anti-jam-ligning og linkbudget (den samme kode, kaldt med de samme input) og den lukkede form for støjgulvet k T0 F. De underliggende signalspektre er den validerede række ovenfor; jammerens effekter, tidslinje og front-end-båndbredder er scenarieinput, spektrene er kontinuerte (ingen spredningskodelinjer), og ingen automatisk forstærkningsregulering, blanking eller antennediagram virker på jammeren. Der findes intet målt jammet spektrum i repositoriet at kontrollere det sammensatte resultat mod. <c2/>-typens Q-tabel (CW og smalbånd { "1" }, bredbånd og swept { "2" } siden { "0.36" }: lærebogsværdierne, fastlåst til de lukkede former i navsignal) stemmer overens med denne models CW-værdi og afviger fra det, den udleder for støj matchet til C/A ({ "1.5" }) og for flad støj fra nulpunkt til nulpunkt uden normalisering i båndet ({ "2.2" }); rapporten udskriver begge

seg-1461dcaed6be = SigMF-optagelser som input og output samt Welch-spektralestimater af komplekse IQ-data

seg-2195d95299b2 = sigmf: læs og skriv Signal Metadata Format-optagelser (JSON .sigmf-meta med felterne core global, captures og annotations; rå .sigmf-data som cf32_le, ci16_le eller ci8, med de heltalsdekodere, der deles med realdata::iqif::load_iq), alt på strenge og bytebuffere. spectrum::welch_psd: Hann-vinduede, overlappende, middelberegnede periodogrammer, densitetsskalerede, på en radix-2-transformation i selve cratet (spectrum::fft_in_place). Disse to er det validerede krav. spectrum::synthesise_iq tegner modellen som IQ, og <c1/>-typens [iq]-sektion kører model til IQ til SigMF til Welch og sammenligner med modellen; dens [recording]-sektion estimerer en rigtig optagelse (native builds); syntesen og disse modelsammenligninger ligger uden for det validerede krav

seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) med samme periodiske Hann-vindue, overlap, densitetsskalering, ingen detrend og tosidet middelværdi: hver bin inden for { "1e-12" } relativt (observeret { "6.0e-14" }) over { "27" } tilfælde, med segmentantal taget fra scipys eget spektrogram. sigmf-python { "1.13.0" } (LGPL-3.0, kørt som værktøj) skriver fem tredjepartsoptagelser (cf32_le, ci16_le, ci8, to optagelser med annotationer, en med en sample_start for første sample forskellig fra nul), som cratet dekoder bit-identisk med identiske core-felter, og læser cratets optagelser tilbage bit-identisk; SigMF { "v1.2.6" }-metadataskemaet rapporterer nul fejl på cratets metadata. Tolerancer fastlagt før den første sammenligning. Uden for kravet: spectrum::synthesise_iq og [iq]- og [recording]-sammenligningerne med modellen (en syntese har ikke ét enkelt rigtigt svar; et periodisk chirp viser linjer, Fresnel-ripple og kanthaler, som den glatte model udelader, samlet effekt inden for { "2" } %), konventionen for skalering fra heltal til flydende tal (cratet dividerer med { "32767" } og { "127" }, sigmf-pythons autoscale med { "2" }^{ "15" } og { "2" }^{ "7" }, hvilket specifikationen lader åbent; sammenligningen bruger de rå koder), flerkanalsoptagelser og de datatyper, læseren afviser

seg-bf2d02d76762 = Planetpositioner i hele solsystemet ud fra JPL's Standish-kepler-elementer

seg-c9d3549045eb = Heliocentriske positioner for Merkur, Venus, Jord-Måne-barycentret, Jorden, Mars, Jupiter og Saturn fra Standish Tabel { "1" } ({ "1800" } e.Kr. til { "2050" } e.Kr.) og for alle otte planeter fra Tabel 2a/2b ({ "3000" } f.Kr. til { "3000" } e.Kr., med middelanomali-leddene b, c, s, f), efter JPL-sidens algoritme trin for trin og roteret til ICRF (International Celestial Reference Frame) med sidens skråstilling; Jorden udskilles fra barycentret med Montenbruck & Gills månerække og massetallet. Sammensat som ephem_provider::AnalyticSolarSystem, så ethvert legeme er tilgængeligt i forhold til ethvert andet, og kan køres som <c1/>-typen

seg-4ea08a296b37 = Positioner for Solen, Månen, Merkur og Venus fra DE440-kernen ved UTC-epoker (KernelEphemeris)

seg-8d47467c36e4 = Geometriske positioner for Solen, Merkur, Venus, Jorden og Månen i forhold til hinanden (J2000/ICRF-akser, meter) fra en JPL DE440-kerne gennem ephem_provider::KernelEphemeris ved UTC-epoker: legemsnavne afbildet til NAIF-koder, UTC ført gennem skudsekundtabellen og TT til TDB med den todelte TDB-TT-række, kernen læst af motorens egen læser. Et legeme, som kernen kun rummer som systembarycenter (Mars til Neptun, Pluto i de440s), afvises og erstattes aldrig. Den kernefri Standish-række forbliver stien til browseren og til fallback

seg-b59153f28d69 = Lystid mellem solsystemets legemer

seg-48ebe0983725 = Den newtonske envejs-lystid fra et vilkårligt legeme til et andet, modtaget ved en epoke, løst af den radiometriske fikspunkts-lystidsløser (radiometric::light_time_solution, senderen i sin retarderede position) gennem solar_system::link_on på en vilkårlig EphemerisProvider; solar-system-typen kører den på det analytiske solsystem i det heliocentriske system (solar_system::link). Totvejsafstanden fra radiometric::two_way_range og Solens Shapiro-forsinkelse fra radiometric::shapiro_delay rapporteres særskilt og sammenlignes ikke eksternt. Udsendes for hvert legeme mod en observatør og for ethvert ekstra link af <c1/>-typen, og for downlinket fra legeme til Jorden af <c2/>-typen

seg-6e0b9687e8ee = Uranus og Neptun fra Standish Tabel { "1" }, Pluto og planeternes hastigheder

seg-df3bf502dfe9 = Positioner for Uranus og Neptun fra Standish Tabel { "1" } (standarden inden for { "1800" } e.Kr. til { "2050" } e.Kr.), Pluto fra rækken i Tabel { "1" } fra { "1992" }, som den nuværende JPL-side ikke længere anfører, og den heliocentriske hastighed for hver planet: den todelegemes afledte med den middelbevægelse, elementerne implicerer, plus ellipsens drejning ved perihel-, inklinations- og knuderaterne

seg-f49245efe44f = Målt mod JPL Horizons DE441 (de samme committede fixtures), men ikke valideret: de tal, Tabel { "1" } angiver for Uranus og Neptun, overskrides med op til { "2.0" } og { "5.2" } gange mod DE441 heliocentriske positioner (Neptun når dem mod barycentriske positioner, hvilket tyder på, at tilpasningen ikke var heliocentrisk), siden angiver ingen fejl for Pluto, og der findes ingen offentliggjort grænse for hastighederne. Tabel 2a/2b når deres egne tal for Uranus og Neptun og er dækket af den validerede række

seg-a50be56f605a = Positioner for Månen og syv store måner (Phobos, Deimos, de galileiske måner, Titan)

seg-2cfbe5a1eece = Den geocentriske Måne fra Montenbruck & Gill-rækken (hvis led på -1.3972 grader pr. århundrede allerede henfører den til J2000-jævndøgnet), og planetocentriske positioner og hastigheder for Phobos, Deimos, Io, Europa, Ganymedes og Callisto fra JPL Solar System Dynamics' middelelementer i hver måne Laplace-plan med middellængdens rate taget fra IAU's synkrone rotationsrate (tabellen angiver perioden med for få cifre til at fastholde fasen), og for Titan fra IAU's rotationsmodel (månen på minus legemsfaste x-akse ved middelafstanden), fordi Titans trykte række for Laplace-planen ikke gengiver Horizons, heller ikke ved sin egen epoke

seg-6c81bd570fe5 = Målt mod JPL Horizons' satellit-efemerider (DE441, MAR099, JUP365, SAT441) committet i tests/fixtures/solar_system/horizons_satellites_icrf.csv med forespørgslen og hentedatoen; der findes ingen offentliggjort nøjagtighed for middelelementer eller for rotationsmodellens placering, så de fastlåste tærskler fanger regressioner og validerer ikke. Middelelementerne udelader de resonante og solare perturbationer, og Phobos' sekulære acceleration er ikke modelleret

seg-8b8c8e28ece9 = Fysiske konstanter for hvert legeme i solsystemet og rapporten for hele systemet

seg-d225a30de35c = Body får Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan (gravitationsparameter, referenceradius, J2 hvor den er offentliggjort med den radius, den henføres til, IAU-pol og nulmeridian), et navneopslag og en BodyFacts-post (NAIF-kode, klasse, forælder, ækvatorial radius og middelradius); <c1/>-typen rapporterer dem for alle atten legemer sammen med positionerne, lystiderne og et banespor over én omdrejning, hvert legeme mærket VALIDATED eller MODELLED

seg-6adc29de51fd = Transskription af offentliggjorte konstanter, hver citeret, hvor den defineres: gravitationsparametre fra JPL Horizons' legemeposter og JPL's tabel over fysiske parametre for satellitter, radier fra JPL's tabeller over fysiske parametre (IAU WGCCRE { "2015" }), poler og nulmeridianer fra IAU's arbejdsgruppe om kartografiske koordinater og rotationselementer (middelværdier, uden T-rate og periodiske led), J2 fra Smith et al. { "2012" }, Iess et al. { "2018" } og { "2019" } og Jacobson { "2009" } og { "2014" }. Kontrolleret for intern konsistens (Jupiters rotationsperiode mod System III-raten, hver J2 mod sin referenceradius), ikke mod en ekstern uafhængig reference. { "0.30" } runde { "2" }: GM-værdierne blev overtaget fra gm_de440 og Phobos- og Deimos-elementerne fra pck00011, så { "0" } af { "84" } konstanter for de fjorten tilføjede legemer afviger nu fra NAIF (var { "12" }), hvilket er en transskriptionskontrol og ikke tælles med. { "0.36" }: IAU's legemsfaste orientering og GM for de fjorten tilføjede legemer er udskilt i en egen VALIDATED-række ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); denne række beholder det, der er tilbage. J2 og middelradius er citeret, ikke valideret; positionerne i rapporten hviler på deres egne rækker; og rapportens prime_meridian_deg for Jorden, Månen og Mars forbliver på konventionelle konstanter (op til { "6.6e-3" }, { "2.8e-2" } og { "9.6e-4" } rad fra IAU_<BODY>). { "0.30" }-revisioner: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Phobos' ækvatorialradius { "13.1" } -> { "13.0" } km; prime_meridian_deg indeholder nu de kvadratiske og periodiske led

seg-fa8a4b082cd5 = IAU's legemsorientering og gravitationsparameter for de fjorten tilføjede legemer i solsystemet

seg-fc8d277aa2fd = Body::iau_rotation_et, rotationen fra J2000 til det IAU-legemsfaste system for Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan med hver århundrederate, hvert kvadratiske led og hvert periodiske led, som legemet har i pck00011, og gravitationsparameterfeltet mu for de samme fjorten legemer. Solen, Jorden, Månen og Mars har konventionelle konstanter, som ejes af andre rækker, og er ikke dækket

seg-87ab655f8270 = Positionsbestemmelse omkring et vilkårligt legeme i solsystemet med en lokal konstellation og et dybderumslink fra Jorden

seg-d9b1b0ac97d3 = <c1/>-typen: en orbiter eller en lander på overfladen omkring et legeme valgt ved navn navigerer med envejs-pseudoafstande fra en Walker-navigationskonstellation omkring legemet (todelegemesbaner med legemets sekulære J2-drift, et ukendt brugerur) og en valgfri urfri totvejsafstand fra Jorden, med Jordens retning og afstand fra den analytiske efemeride ved hver epoke; sigtelinjer blokeret af legemets sfære og en elevationsmaske på overfladen; pr. epoke GDOP og PDOP for konstellationen alene (orbit::dop), den formelle positionsusikkerhed med og uden Jord-rækken og seedede Gauss-Newton-positionsbestemmelser (batch_ls::gauss_newton) for hver af de to tilfælde, med lystiden og rundturen fra legeme til Jorden

seg-3538c49df107 = Lukkede former og selvkonsistens: Keplers tredje lov for relæperioden, banens radius og overfladeradius holdt konstante over kørslen, at tilføjelse af en måling aldrig forøger den formelle usikkerhed, og at de seedede fejl stemmer med kovariansen. Relæbanerne ser bort fra tredje legemer (Jupiters træk i relæer omkring Europa er ikke modelleret), støjen er gaussisk på angivne niveauer, og målemodellen er øjeblikkelig, så dette er ikke valideret mod nogen missions navigationsdata

seg-281b680a9897 = Walker-konstellationens geometri og de offentliggjorte nominelle slots for GPS, Galileo og GLONASS

seg-cba54289b732 = <c1/>-typens generatorer: Walker delta- og stjernemønstre i T/P/F-konventionen (knudeafstand 360/P eller 180/P, afstand i planet { "360" }·P/T, faseforskydning mellem planer { "360" }·F/T) samt forudindstillingerne GPS-baseline og udvidelig 24-slots, Galileo og GLONASS bygget af deres offentliggjorte nominelle elementer, placeret i et jordfast system med den Greenwich-timevinkel, deres dokumenter angiver

seg-bdf83007af50 = Offentliggjorte dokumenter fra myndighederne: Galileo Open Service Service Definition Document udgave { "1.1" } (European GNSS Service Centre) Tabel { "1" } og { "23" }, referencekonstellationen 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document udgave { "5.1" } ({ "2008" }) afsnit { "5.2" }, slotformlen for knudelængde og breddeargument; GPS Standard Positioning Service Performance Standard 5. udgave (april { "2020" }) Tabel 3.2-1, 3.2-2 og 3.2-3, herunder kolonnen for sporets ækvatorkrydsning, som er en uafhængig angivelse af den jordfaste geometri, forudindstillingen skal gengive. Validerer generatorerne og transskriptionen; BeiDou-faserne i mellemhøj bane og knuderne for de skråtstillede geosynkrone baner er ikke offentliggjort og er ikke dækket

seg-0f1d49ab5d51 = Global dilution of precision for GPS-baseline-konstellationen

seg-83775b77f5ca = <c1/>-dækningsmotoren på GPS-baseline-forudindstillingen med 24 slots under betingelserne i Appendix B i GPS Standard Positioning Service Performance Standard (SPS PS) (ét siderisk døgn, { "287" } femminuttersskridt, et { "4" } x { "4" } graders globalt gitter vægtet med cosinus til breddegraden, alle i sigte, { "5" } graders maske, ét modtagerur): den globale HDOP-fordeling, PDOP-medianen og tilgængeligheden af PDOP på højst 6, globalt og på det værste sted

seg-6fb3c2028c4a = GPS SPS PS 5. udgave (april { "2020" }) Appendix B afsnit B.3.2.2 og B.3.2.3, den offentliggjorte globale gennemsnitlige HDOP-fordeling for den fuldt besatte baseline-konstellation med 24 slots (median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, middel { "0.96" }), Tabel 3.8-1 (PDOP-tilgængelighed) og Tabel B.3-1 (ensemble-PDOP for en degraderet konstellation, kun brugt som øvre grænse) samt en håndudledt lukket form for én epoke. VDOP- og PDOP-fordelingerne for den fulde konstellation er kun offentliggjort som en figur, så PDOP fastlåses ensidigt; det værste tid-rum-punkt (her HDOP { "2.40" } og VDOP { "5.22" }, offentliggjort { "2.49" } og { "5.43" }) afhænger af gitteret og rapporteres, men fastlåses ikke

seg-7d4d7200cbca = Dækning og dilution-of-precision-kort for vilkårlige multikonstellationsudformninger i stor skala, omkring et vilkårligt centrallegeme

seg-b78b79e9fae4 = <c1/>-typen ud over de to fastlåste tilfælde: eksplicitte udformninger og udformninger med flere skaller, flere konstellationer pr. kørsel med ét modtagerur pr. konstellation, Jorden, Månen og Mars ud fra legemekonstanterne, BeiDou-forudindstillingen (fase i mellemhøj bane og krydsning ved { "118" } grader Ø for skråtstillet geosynkron bane modelleret), satellitter i sigte, GDOP, PDOP, HDOP, VDOP og tilgængelighed pr. celle, nedsamplede jordspor og et synlighedsforfilter efter sub-satellit-breddegrad, der kører en udformning med { "5" } 000 satellitter på et gitter på { "10" } grader på en brøkdel af et sekund

seg-278c77438493 = En kædet mission på tværs af scenarietyper på én fælles tidslinje

seg-3dcfb26f6234 = <c1/>-typens faser: hver fase kører ét eller flere scenarier af eksisterende typer gennem run_toml, læser deres output ind i navngivne kanaler (urfejl og grænse, middel af effektivt forhold mellem bærebølge og støjtæthed og sporingsgulv, lodret beskyttelsesniveau og alarmgrænse, positionsfejl, satellitter under sporing, alarmflag) med forudindstillinger pr. type eller eksplicitte resultatstier, placerer dem ved fasens start og holder dem på et fælles gitter, med fasegrænser og hændelser; tilstand føres videre ved carry (en kanal fortsætter fra forrige fases slutværdi), handoff (en forrige fases nummer skrevet ind i det næste scenarie) og end_at (en fase slutter på et tidspunkt, en kørsel har beregnet, for eksempel en spoofing-monitors detektionstidspunkt); en kampagne-hash og en digest over hvert medlems resultat

seg-fd018ef7bc3b = Sammensætningsidentiteter mod de selvstændige kørsler af de samme typer: en kampagne med én fase gengiver det selvstændige output bit for bit, den medførte forskydning er lig med den forrige kørsels egen sidste sample, og den fase, der afsluttes af end_at, har præcis kørslens detektionstidspunkt som sin længde. Den additive carry over en fasegrænse og nulte ordens hold er modelleringsvalg, og hver fase er kun så god som den type, der kørte den; ingen kædet mission er blevet kontrolleret mod en målt

seg-ad6105af464c = Parametersweeps og seedede Monte Carlo-ensembler over en vilkårlig scenarietype

seg-95921611839e = <c1/>-typens sweep (én til tre punktopdelte nøgler af en vilkårlig type, på det generiske sweeps akseværdier, eventuelt med et ensemble i hver knude) og monte_carlo-sektioner: realisation k kører ved base_seed + k; hver metrik rapporterer middelværdi, standardafvigelse, nærmeste-rang-percentilerne 5./50./95. og et percentil-bootstrap-konfidensinterval på { "95" } % med fast seed for middelværdien (inertial::metric_stat); metrikenheder læses fra den sweepede typens egen units-blok

seg-03d15c27b3b9 = Den lukkede form for faserandomwalk under hvid frekvensstøj, varians q_wf tau (NIST Technical Note { "1337" }), for statistikmaskineriet, og byte-lighed med de selvstændige kørsler for seedningen. Den kontrollerer ensemble-aritmetikken på motorens egen urmodel, ikke et eksternt datasæt

seg-24327a0ed82e = Flere scenarier under fælles betingelser, med en samlet oversigt

seg-5833fb3b06e3 = <c1/>-typens compose-sektion: navngivne fælles værdier (for eksempel én jammers effekt og position) skrevet ind i hvert medlem ved de nøgler, hvortil det binder dem, hvert medlem køres, og pr. metrik den mindste, største og gennemsnitlige værdi på tværs af medlemmerne med angivelse af medlemmet; metrikenheder skal stemme overens på tværs af medlemmer

seg-67ffd6684b1c = Sammensætningsidentitet mod den selvstændige kørsel. Aritmetikken for fælles betingelser er bogføring; fysikken er medlemstypernes, hver med sin egen række

seg-0bc866720bde = Afgrænset optimering af én metrik over kampagneparametre

seg-f9bdb89c2b4f = <c1/>-typens optimize-sektion (CAP-32): én til tre punktopdelte scenarienøgler afgrænset til [lo, hi] på en lin- eller log-skala, én metrik læst ved resultatsti, mål minimize, maximize eller target; metode grid (sweepets akseværdier) eller en deterministisk Nelder-Mead-simpleks i normaliserede koordinater med boksprojektion og standardkoefficienterne; en manglende eller ikke-endelig metrik får den dårligste score og bliver i sporet; med runs > { "1" } er metrikken middelværdien over fælles seeds; hver evaluering er en rigtig kørsel af den navngivne type, opført i trace og talt med i reproducerbarhedsdigesten

seg-e3a2f80b04dc = Kun internt: den nøjagtige lukkede form -20 log10(afstand) for linkligningen, et uafhængigt brute-force-gitter over den samme type og Rosenbrock-funktionen. Runde { "1" }s 1D-tærskel er NOT MET (den præregistrerede boks udelukkede løsningen på { "3" } dB; optimeringen stoppede ved grænsen), registreret i docs/design/evidence/cap32-optimize/RESULTS.md og ikke bedømt igen. Optimum er lokalt for boksen og startpunktet; intet krav om globalt optimum

seg-b9b1637d326c = Båndbegrænsede lukkede former for et vilkårligt rangingsignal: effekt i båndet og early-late-kodesporingsjitter mod offentliggjorte værdier, med Gabor-båndbredden og den forskudte spektrale separation krydskontrolleret

seg-6cfdc433b120 = navsignal: sinusintegralet (sine_integral), BPSK-R-andelen af effekten inden for et dobbeltsidet bånd i lukket form (bpsk_power_in_band_closed_form), den båndbegrænsede BPSK Gabor-båndbredde i lukket form (bpsk_gabor_bandwidth_closed_form_hz), den båndbegrænsede kohærente og ikke-kohærente early-late delay-lock-loop-jitter for ethvert spektrum med enhedsareal efter Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) og dens Gabor-grænse ved forsvindende afstand (dll_jitter_small_spacing_limit_s), den forskudte BPSK spektrale separationskoefficient i lukket form (bpsk_offset_ssc_closed_form), Galileo E5 AltBOC({ "15,10" })-spektret (altboc_15_10_psd) og en parser for modulationsmærker (parse_modulation); bruges af <c1/>-typen for hvert signaldesign

seg-15d8c44be46f = Eksternt fastlåst: { "90.3" } procent hovedlobeeffekt, den kohærente early-late-jitter ved det angivne driftspunkt, sinusintegralets tabelværdier og BPSK's egen spektrale separationskoefficient 2/({ "3" } R_c) ved nul forskydning. Kun interne krydskontroller, ikke ekstern validering: den båndbegrænsede BPSK Gabor-båndbredde i lukket form og dens asymptote samt den forskudte BPSK spektrale separationskoefficient ved forskydninger forskellige fra nul, begge udledt her og kontrolleret mod kvadratur. Offentliggjorte lukkede former: BPSK-R's sinc-kvadrat-spektrum og dets { "90" } procent hovedlobeeffekt (Kaplan & Hegarty, Understanding GPS/GNSS, 3. udg.); den kohærente early-late-kodesporingsjitter sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, afsnit { "8" }) og den båndbegrænsede generalisering med dens Gabor-båndbreddegrænse (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); sinusintegralets tabeller hos Abramowitz & Stegun (Tabel { "5.1" }); den spektrale separationskoefficient som Fouriertransformationen af den kvadrerede autokorrelation (Betz { "2001" }). AltBOC-spektret kontrolleres kun for enhedsareal og lobeposition (udtrykket i Galileo Open Service Signal-in-Space Interface Control Document integrerer til { "8" } og divideres med det).

seg-def449efa852 = Maksimal Doppler for en navigationssatellit i lav jordbane, som dimensionerer erhvervelsessøgningen

seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: den største satellit-Doppler på en passage lige overhead ved elevationsmasken for en cirkulær bane, v R_E cos(el) / (R_E + h) gange f / c, ud fra hver forudindstillings egen bærebølge og banehøjde; <c1/>-typen tilføjer oscillator- og brugerled og omsætter den til Doppler-bins

seg-652e28dfa10f = Signaldesign til positionering, navigation og tidssynkronisering i lav jordbane: kodesporing, erhvervelse, GNSS-kompatibilitet og en båndafvejning for ethvert system

seg-c0ba5c7e708e = <c1/>-typen: parametriserede signaldesign (bånd, sendebåndbredde, ITU-allokering; erhvervelses-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flade spektre, effektandele, FDMA-underbærebølger, kodelængder og datarater) fra indkompilerede offentlige forudindstillingsfiler (Xona Pulsar, Iridium STL, Starlink-signal af opportunitet, CentiSpace, et generisk C-bånd-design og generiske UHF/L/S/C/bredt-C-design, hver med sin kilde-URL og uoffentliggjorte værdier mærket REPRESENTATIVE) eller skrevet direkte i scenariet; pr. signal den båndbegrænsede effektspektraltæthed, effektandele i båndet, Gabor-båndbredde, kodejitter mod C/N0 og afstand samt rangingnøjagtigheden, erhvervelsessøgerummet, kvadratlov-detektionssandsynligheden og den gennemsnitlige serielle og kodeparallelle erhvervelsestid, den spektrale separationskoefficient ind i og ud af GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og AltBOC med C/N0-forringelsen samt CW-, bredbånds- og matchet J/S-tolerance fra spectrum-typens SSC-kæde; en båndafvejning mellem ionosfæreforsinkelse, frirumstab, rangingnøjagtighed ved lige C/N0 og lige EIRP samt jammertolerance; og kvalitative formkontroller af et design mod en beskrevet måling

seg-040b3f5cc70e = De validerede lukkede former fra de to rækker ovenfor, kvadratlovens falskalarmsidentitet P_d(snr = { "0" }) = P_fa og Holmes' gennemsnitlige erhvervelsestid samt reduktion til spectrum-typens egen SSC-kæde (den samme Jammer::ssc-kode). Selve designene er input: forudindstillinger mærket REPRESENTATIVE eller WORKSHOP er ikke offentliggjorte specifikationer, udvidede Feher-QPSK-, kodeskifte- og OFDM-spektre er approksimeret, og formkontrollerne sammenligner former, ikke kalibrerede niveauer.

seg-c2b9c8e4a364 = Flerbånds-spektrumvandfald (UHF, L, S, C) med designede signaler og jammere pr. bånd

seg-609df4e0a085 = <c1/>-typen udvidet ud over L-båndet: bånd angivet som et forudindstillet signaldesign (tegnet med hver komponent, båndbegrænset til sendebåndbredden, C/N0 og J/S henført til den sporede komponent) eller som en brugerdefineret bærebølge og modulation; ekstra vandfaldspaneler over et vilkårligt frekvensområde på samme tidslinje og farveskala; en bredbåndsjammer (barrage) ved siden af CW, smalbånd, chirp og matchet støj; J/S og effektiv C/N0 pr. bånd fra den uændrede kæde for spektral separationskoefficient

seg-a3b398f66ad3 = Reduktion til den eksisterende spektrumkæde og jamming-typens anti-jam-ligning (et bånd med én komponent giver de samme tal som før udvidelsen) og signalspektrene i de validerede rækker. Jammerens effekter, tidslinje, front-end-båndbredder og de designede signaler er input, og et designet signal afskæres ved sit sendebånd (ingen emission uden for båndet).

seg-f92d6cbc58d4 = Specifikke regndæmpningskoefficienter for ethvert bånd, et LEO-PNT-link bruger

seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ligning ({ "1" }) til ({ "5" }): k_H, alpha_H, k_V, alpha_V fra kurvetilpasningerne i Tabel { "1" } til { "4" }, de sti- og polarisationsafhængige (k, alpha) og den specifikke dæmpning k R^alpha; bruges af <c1/>-typens regnled

seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) Tabel { "5" }, anbefalingens egne tabellerede k_H, alpha_H, k_V, alpha_V, committet i tests/fixtures/leo_link/p838_3_table5.csv med PDF-URL og hentedato. Tabellen er afrundet til sine trykte cifre, så tærsklen er netop den afrunding

seg-f4a311f936de = Langtidsregndæmpning på skrå sti på et Jord-rum-link

seg-2b2dba8bf5a7 = ITU-R P.618-14 afsnit { "2.2.1.1" } trin { "2" } til { "10" } (skrå og vandret sti under regnhøjden, vandret reduktions- og lodret justeringsfaktor, A0.01 og dens skalering til { "0.001" } % til { "5" } % af et gennemsnitligt år), med regnhøjden (P.839) og R0.01 (P.837) som input, fordi motoren ikke har noget digitalt kort; anvendt pr. bånd og epoke af <c1/>-typen

seg-325d1bb9c26d = ITU-R Study Group { "3" }-valideringseksempelfilen CG-3M3J-13-ValEx-Rev8.3.0 for P.618-14, som tabelleret af valideringssiderne i ITU-Rpy, med hvert steds P.839-4-regnhøjde fra de samme eksempler; committet i tests/fixtures/leo_link/p618_14_rain_attenuation.csv med URL'erne og hentedatoen. Validerer proceduren givet h_R og R0.01, ikke kortene

seg-6b51ec84bdce = Troposfærisk amplitudescintillation på et Jord-rum-link

seg-869894dec004 = ITU-R P.618-14 afsnit { "2.4.1" } trin { "3" } til { "9" } (reference-sigma ud fra N_wet, effektiv stilængde, antennemiddelfaktor, fadingdybde for { "0.01" } % til { "50" } % af tiden), med N_wet som input eller beregnet ud fra temperatur, fugtighed og tryk med udtrykkene i ITU-R P.453-14; under { "4" } GHz markerer <c1/>-typen værdien som en ekstrapolation

seg-7fc4a1e7960a = ITU-R Study Group { "3" }-valideringseksempler (CG-3M3J-13-ValEx-Rev8.3.0) for P.618-14-scintillation, med hvert steds P.453-14 N_wet fra de samme eksempler; committet i tests/fixtures/leo_link/p618_14_scintillation.csv med URL'erne og hentedatoen. Udtrykket for våd refraktivitet ud fra temperatur og fugtighed er ikke dækket af denne række

seg-e0d40cf4ea79 = Bygningsindtrængningstab for en indendørs LEO-PNT-bruger

seg-4f06274e38ec = ITU-R P.2109-2 Annex { "1" } ligning ({ "1" }) til ({ "10" }) med Tabel { "1" }: tabet, der ikke overskrides med sandsynlighed P, for traditionelle og termisk effektive bygninger ved elevationen af stien ved facaden, { "80" } MHz til { "100" } GHz; anvendt pr. bånd og epoke på en indendørs bruger af <c1/>-typen (UHF-tilfældet indendørs)

seg-99c648f9c6eb = Værdierne i ITU-R Study Group { "3" } Clutter and BEL-valideringsregnearket, som transskriberet i valideringsscriptet i referenceimplementeringen i MATLAB (github.com/eeveetza/p2109), committet i tests/fixtures/leo_link/p2109_bel.csv med URL og hentedato. Regnearket udskriver tre decimaler

seg-8c5e291c8ff8 = Førsteordens ionosfæreforsinkelse pr. bånd, den ionosfærefri kombination og frirumstab

seg-89df726127f9 = Gruppeforsinkelse { "40.3" } STEC/f^{ "2" } pr. bånd; de ionosfærefri koefficienter f1^2/(f1^{ "2" } - f2^{ "2" }) og -f2^2/(f1^{ "2" } - f2^{ "2" }) og støjforstærkningen sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) for ethvert båndpar; frirumstabet { "20" } log10({ "4" } pi R f/c) fra linkbudget::free_space_loss_db i dets kilometer-megahertz-form

seg-9bf00f744174 = IS-GPS-200 afsnit { "20.3.3.3.3.2" }, som angiver L1/L2-forholdet mellem gruppeforsinkelser gamma = (77/60)^{ "2" }, der følger af førsteordens 1/f^{ "2" }-skalering, og Friis' transmissionsformel (Proc. IRE, { "1946" }). Validerer skaleringslovene, ikke en skrå TEC

seg-c584a867fcda = Maksimal Doppler, en statisk bruger ser fra en LEO- eller MEO-bane

seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: en søgning over hver banepunkt og hver bruger på satellittens horisont i en cirkulær bane, med Jorden roterende, efter den største afstandsrate, plus den orbitale og den største jordfaste satellithastighed; rapporteret pr. bånd som Doppler-omhylningskurven af <c1/>-typen og brugt som koldstartsvindue for søgningen i dens lavenergimodel

seg-4abd3afebad2 = Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabel { "1" } (statisk modtager på en kugle med { "6371" } km, Jordens rotation som eneste andet forhold): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz på L1. Dækker cirkulære todelegemesbaner

seg-d9eb3e7e69c2 = En LEO-PNT-passage og dens linkbudget pr. bånd mod de MEO-GNSS-satellitter, der er i sigte

seg-d986e44443dd =<c1/>-typen: satellitter fra en designet passage, elementer, en TLE gennem SGP4 eller en Walker-konstellation fra constellation-design; pr. bånd og epoke sigtevinklerne, afstand, afstandsrate og afstandsacceleration i lukket form (kontrolleret ved hver kørsel mod centrale differenser og rapporteret), frirumstab, EIRP med et isoflux-, gaussisk eller fladt diagram, en patch-, halvkugleformet eller isotrop brugerantenne, gasdæmpning efter ITU-R P.676-10 Annex { "2" }, P.618-regn og -scintillation, P.2109 bygningsindtrængningstab, polarisationsfejltilpasning, systemstøjtemperatur, C/N0, Doppler og Doppler-rate samt førsteordensforsinkelsen fra en Klobuchar- eller lodret-TEC-skrå TEC skaleret med Chapman-andelen under satellitten; ionosfærefri par med kodestøj ved passagens top; Galileo- eller GPS-bærebølger fra deres modtagne effekter i interfacedokumenterne gennem den samme modtager

seg-c558a6519038 = Lukkede former og selvkonsistens: identiteterne for afstandsrate og afstandsacceleration mod numeriske afledte, at isoflux-forstærkningen ophæver væksten i afstand, lærebogens grænser for polarisationstab, den kvalitative LEO-mod-GNSS-observation (en klokkeformet passage på nogle minutter, der topper flere dB over flade GNSS-bærebølger på 44-51 dB-Hz). EIRP'erne og diagrammerne er offentliggjorte modtagne effekter omsat til en EIRP eller repræsentative valg, gasleddet er den afløste forenklede metode i P.676-10, og intet er sammenlignet med en målt LEO C/N0

seg-95a077a980b6 = Navngivne LEO-PNT-systemforudindstillinger med angivne kilder og en systemuafhængig motor

seg-4b47033cda24 = leo_link::presets: generisk flerbånd (UHF, L, S, C), generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal af opportunitet med kun Doppler, CentiSpace og en valgfri Celeste IOD-forudindstilling, hver med sin kilde mærket PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP, hvor workshop-kilden ligger i den valgfri Celeste IOD-forudindstillingsfil og kun indkompileres, hvis den fil findes; hvert bånd og hver bane kan overstyres i et scenarie, og et scenarie kan undlade at nævne nogen forudindstilling

seg-399dc53ceafb = Transskription af de citerede offentlige tal og en konsistenskontrol: en EIRP fastsat ud fra en offentliggjort minimal modtaget effekt forudsiger den offentliggjorte maksimale inden for { "0.5" } dB med et fladt diagram. Det er en kontrol af afstandsspredningen, ikke en validering af nogen satellits antenne; repræsentative forudindstillinger gør intet krav om et rigtigt system

seg-a39f34973373 = Lavenergipositionering: tid til første positionsbestemmelse og energi pr. positionsbestemmelse mod driftscyklus

seg-f3b9b669a76f = leo_link::energy og <c1/>-typens [iot]-sektion: kohærent integration begrænset af Doppler-raten, kvadratlovs ikke-kohærente summer op til en detektionstærskel, en Doppler-binsøgning over banens envelope for statiske brugere (kold) eller et støttet vindue (varm), parallel eller seriel kodesøgning, navigationsmeddelelsens tid ved koldstart, energi pr. positionsbestemmelse og batterilevetid over intervaller mellem positionsbestemmelser, for hvert LEO-bånd og GNSS-signalet

seg-a5fa1ef1be9b = Intern konsistens af en angivet designmodel: hvert effekt-, tærskel- og søgevalg er et input, og modellen ser bort fra bitkantsmultiplicitet, mistet detektion og generhvervelse. Ikke sammenlignet med en målt modtager

seg-7e94f8b38cff = Globalt gennemsnitlige vægte for signal-in-space-afstandsfejl for enhver banehøjde

seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: den radiale vægt w_R og den kvadrerede tværgående vægt w_AC^{ "2" } som gennemsnit af cos^{ "2" } og halvdelen af sin^{ "2" } af sigtelinjens nadirvinkel over brugere jævnt fordelt på den synlige jordkalot over en elevationsmaske, for enhver banerradius, ved Simpson-integration; bruges af hvert leo-navmsg-SISRE-tal (ved { "510" } km, w_R { "0.46" } og w_AC^{ "2" } 1/2.5)

seg-b9b5fe9d3b25 = Den offentliggjorte SISRE-vægtfaktortabel fra Montenbruck, Steigenberger og Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } og 1/49, GLONASS { "0.98" } og 1/45, Galileo { "0.98" } og 1/61, BeiDou MEO { "0.98" } og 1/54, BeiDou IGSO/GEO { "0.99" } og 1/126. Det samme gennemsnit evalueret ved LEO-radier giver LEO-vægtene; ingen offentliggjort LEO-tabel er fastlåst, så LEO-værdierne er den validerede metode anvendt, ikke særskilt valideret

seg-3cbb8b6afe3c = Galileo ICD's brugeralgoritme for udsendte efemerider som grundlag for en LEO-navigationsmeddelelse

seg-88efbce1f836 = leo_navmsg::elements::kepler_point: Galileo OS SIS ICD's kepler-evaluering (Keplers ligning, andenharmoniske korrektioner, jordfast knude) skrevet særskilt fra motorens RINEX-evaluator, der returnerer positionen med breddeargument, inklination og knude, som korrektionssystemet langs/på tværs/radialt bygges på, og Liu et al. { "2025" }-udvidelsesleddene

seg-6a90728fcea9 = RTKLIB 2.4.2-p13 eph2pos ECEF-positioner (en uafhængig implementering af den samme ICD-algoritme) for rigtige BKG/IGS-udsendte poster fra 2024-09-10, begge committet med proveniens i tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dette validerer den keplerske brugeralgoritme; korrektionerne langs/på tværs/radialt, der er lagt oven på, er dækket af deres egne rækker, og Liu-leddene af rækken for Liu et al. { "2025" } med 22 parametre

seg-d65102fd4a1d = CRC-24Q-rammekontrol for LEO-navigationsmeddelelsen

seg-aed568016867 = leo_navmsg::codec::crc24q: generatorpolynomium 0x1864CFB, startværdi { "0" }, ingen refleksion, ingen afsluttende XOR, den kontrol, Kshanas LEO-ramme har over hver foregående byte

seg-18c79d18e4e4 = CRC-kataloget kontrolværdi for disse parametre (reveng.sourceforge.io CRC-katalog, CRC-24/LTE-A: bredde { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), som er CRC-24Q-parametrene i RTCM { "10403" } og Galileo OS SIS ICD, og eksempelrammen for meddelelsestype { "1005" }, der er trykt i RTCM { "10403" }

seg-82b9b0f7b07c = Tilpasning af LEO-udsendte efemerider og signal-in-space-afstandsfejl mod tilpasningsinterval og opdateringsperiode

seg-8c7065aa22bd = <c1/>-typens tilpasser og afvejning: en referencebane integreret med zonal J2-J6- eller EGM2008-tyngde til den valgte grad og luftmodstand, og et seedet frit eller styret ur; en Levenberg-Marquardt-tilpasning af det keplerske Galileo-sæt på ikke-singulære elementer med svage priorer, derefter langs-, på tværs- og radiale korrektionspolynomier ved lineære mindste kvadrater; urpolynomiet tilpasset netto af brugerens relativistiske led; SISRE (kun bane og med ur) over brugsperioder centreret i deres tilpasningsvinduer, mod tilpasningsinterval og opdateringsperiode. Valideret del: tilpasningen med 16 parametre og dens SISRE kun for banen mod tilpasningsinterval på rigtige præcise baner og den integrerede J2-J6/EGM2008({ "20" }, { "70" })/luftmodstand-referencebane mod Orekit { "12.2" } inden for { "4.6" } mm over { "6" } t (tærskel { "2" } cm, samme densitetsinput); korrektionspolynomierne, urtilpasningen (seedet frit eller styret ur) og afvejningen af opdateringsperioden forbliver modelleret

seg-8121e7db3db3 = Opdatering af LEO-navigationsmeddelelsen midt i en passage med en kontinuitetskontrol ved skiftet

seg-34c310d85c42 = <c1/>-analysen midpass-update: den højeste passage over en bruger inden for et søgespænd, meddelelser på en global tidsplan med brugsperioder centreret i deres tilpasningsvinduer, og ved hvert skift 3D-positionssprånget, urspringet, brugerens pseudoafstandssprång, det største spring over en synlig sigtelinje (lukket form over nadirkeglen), afstandsfejlen før og efter samt PASS/FAIL mod en tærskel

seg-418f2cd21141 = Intern konsistens (springidentiteten og keglegrænsen mod brute-force-sampling). Tærsklen er et input; intet offentliggjort LEO-kontinuitetskrav er fastlåst

seg-7635a8339e78 = Dokumenteret binær kodning af LEO-navigationsmeddelelsen med et kvantiseringsfejlbudget

seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshanas egen ramme (præambel, version, model, længde, nyttelast, CRC-24Q) for de fire efemeridemodeller, urpolynomiet, SVID, issue of data, bånd, sundhed, et Klobuchar-sæt, NeQuick-G-koefficienter og UTC-parametre, hvert felt med en angivet bredde og skridt (field_table), kvantisering med afvisning uden for området og et budget for den største positions- og urændring, en halv-skridt-ændring af hvert felt giver over gyldighedsvinduet

seg-4261a9fac5d9 = Rundturs-identiteter og selve budgettet. Formatet er Kshanas eget, modelleret på de offentliggjorte meddelelseskomponenter og Galileo ICD's feltsæt; det er ikke bitlayoutet for Celeste eller noget andet system (ingen er offentlige), så der findes intet eksternt layout at validere mod

seg-17ca41d7fd71 = RINEX-4-lignende og CSV-eksport af LEO-navigationsmeddelelser

seg-185e12ccef0d = leo_navmsg::text: en RINEX-4-lignende blok (> EPH-posthoved, satellit- og epokelinje med tre urled, D19.12-linjer for udsendt bane) med systembogstavet L og posttyperne KP16, KRAC, LU22 og APOL, i hvert hoved mærket som en Kshana-udvidelse, der ikke er en del af RINEX { "4.02" }, og en CSV-tabel med et standardkolonneskema og forudindstillede skemaer, hver med en importer

seg-5cc5b6382437 = Rundture og kalenderaritmetikken. RINEX { "4.02" } definerer ingen LEO-navigationsposter (IGS RINEX { "4.02" }), så layoutet er en dokumenteret udvidelse med arXiv { "2401.17767" } citeret som tidligere arbejde; der findes ingen ekstern læser af det at kontrollere mod

seg-ff15935ba1b3 = Liu et al. { "2025" } LEO-efemeridemodel med 22 parametre og dens tilpasning på rigtige præcise baner

seg-6af1b6f3bbd4 = Liu22-varianten af leo_navmsg::elements::EphemerisModel, evalueret af kepler_point med Liu22Extra: sættet på 16 parametre plus en rate for storakse a_dot, en middelbevægelsesrate n_dot, der indgår som n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, transskriberet fra artiklens ligning { "1" } (tilpasningssammenligningen afhænger ikke af denne skalakonvention, så betydningen af en udsendt nDot-værdi er ikke valideret her), og radiusharmoniske for én og tre pr. omdrejning, Crs1, Crc1, Crs3, Crc3, på det ukorrigerede breddeargument. Dens tilpasning med leo_navmsg::fit::fit_message tager artiklens start og estimator fra afsnit { "2.3" } (hver korrektion starter ved nul; almindelige mindste kvadrater uden priorer; artiklens grænse på 100 iterationer), men stopper efter Kshanas regel om parameterkonvergens (hvert skridt under { "1e-3" } af dets formelle sigma) i stedet for artiklens regel om en RMS-ændring under { "0.1" } mm. Tilpasset over buer på { "20" } og { "30" } minutter af en tabelleret præcis bane

seg-e79047fc95af = ATOMIC-ECEF-polynomiet uden ur og den syntetiske modelsammenligning af LEO for fem højder

seg-e261843e35b1 = EcefPoly-varianten af leo_navmsg::elements::EphemerisModel: et ECEF-polynomium pr. akse uden urled, det relativistiske led ud fra -2 r.v/c^{ "2" }, bedømt mod et styret ur. Desuden modelsammenligningsanalysen (liu_comparison over LIU2025_TABLE), som tilpasser modellen med 22 parametre ved artiklens fem højder over buer på 20 minutter af en bane integreret af Kshana og udskriver resultatet ved siden af den offentliggjorte SISRE

seg-a3b92fdcc591 = Fakta om ATOMIC-modellen fra InsideGNSS (polynomium af 6. orden, omkring ét minuts gyldighed, { "30" } s opdatering, ur styret, { "24" } cm urfejl). Det er beskrivende fakta uden offentliggjorte tal at sammenligne med. Tabellen for fem højder udskriver Liu et al. { "2025" } SISRE ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } og { "0.75" } cm ved { "320" }, { "475" }, { "786" }, { "966" } og { "1336" } km over en bue på 20 minutter) ved siden af Kshanas tilpasning på dens egen integrerede bane ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } og { "0.51" } cm; forhold { "0.46" } til { "0.77" }), ikke fastlåst, fordi artiklen tilpassede rigtige præcise baner, og referencerne er forskellige. Modellen med 22 parametre og dens tilpasning er selv valideret mod rigtige baner i rækken Liu et al. { "2025" } 22-parameter LEO ephemeris model and its fit on real precise orbits. { "0.30" }-revision: tabellens tal flyttede sig med tilpasningen efter artiklens konvention (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

seg-7a9fca5166d4 = Ionosfære- og UTC-tjenester for ét frekvensbånd i en LEO-navigationsmeddelelse

seg-bc73bfeca68e = leo_navmsg::services: den udsendte Klobuchar-forsinkelse ved enhver bærebølge (motorens L1-model skaleret med (f_L1/f)^{ "2" }), det effektive NeQuick-G-ioniseringsniveau Az = ai0 + ai1 mu + ai2 mu^{ "2" } med reglerne for alle nuller og [{ "0" }, { "400" }] sfu, og systemtid til UTC med ICD'ens tre skudsekundstilfælde

seg-0af8030f4d21 = Doppler, som en modtager på jorden skal kunne håndtere fra en LEO-navigationssatellit

seg-9714103964d6 = Nøjagtig afstandsrate for en satellit, hvis jordfaste position og hastighed kommer fra en todelegemesbane med den sekulære J2-drift og Jordens rotation (leo_fusion::geom::EarthOrbit::state, hastigheden den nøjagtige tidsafledte af positionen), omsat til Doppler ved en bærebølge; den største absolutte Doppler, Doppler-rate og jerk over en elevationsmaske over et vindue (leo_fusion::doppler::doppler_envelope), rapporteret pr. LEO-system af <c1/>-typen i doppler-tilstand

seg-ebf6cee8ec4c = Offentliggjorte tal gengivet ud fra den angivne bane og bærebølge: Iridium-Doppler op til plus eller minus { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) og Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz (Leclère, Marathe og Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Iridium-tallet er en afrundet øvre grænse, derfor tærsklen på { "5" } %. Doppler-raten og jerk rapporteres, men er ikke valideret: den modellerede jerk for Pulsar X1 ved en passage lige overhead er omkring { "1.0" } Hz/s^{ "2" } mod den offentliggjorte { "1.26" }

seg-d2e18c8bdc14 = Positionsbestemmelse ud fra LEO-Doppler, med én eller flere satellitter og tilstande for urdrift og hastighed

seg-de6cb3c06490 = Batch Gauss-Newton-positionsbestemmelse ud fra afstandsrate med analytiske partielle afledte (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant brugerhastighed som valgmulighed, en højdepseudomåling for en bruger på overfladen, dæmpede skridt; den formelle kovarians ved referencen; projektioner langs, på tværs og lodret; nøjagtigheden for én passage mod brugerens afstand på tværs; tidspunktet for nærmeste passage. <c1/>-typens doppler-tilstand tilføjer fejlen mod vinduets længde og en tilstand med kun Doppler for signaler af opportunitet (forudindstillingen starlink-sop)

seg-84e2eb636579 = Intern konsistens: genfinding uden støj, den kinematiske identitet rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho differentieret numerisk, nul Doppler ved nærmeste passage, spejlløsningen for én passage og seedede fejl mod den formelle kovarians. Starlink-tallet fra Kozhaya, Saroufim og Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: omkring { "2" } m på { "20" } s med tre satellitter) er kun en sammenligning: den modellerede modtager, med en perfekt efemeride og alle fejl samlet i en Doppler-sigma på { "30" } Hz, er flere gange mindre nøjagtig over det samme vindue, og artiklens modtager og målerate er ikke gengivet

seg-7f462969d2d4 = Fælles positionsbestemmelse med pseudoafstande fra GNSS og LEO med intersystembiaser og fejlmodeller pr. signal

seg-b9b5298e3408 = Vægtede Gauss-Newton-positionsbestemmelser med mindste kvadrater over en vilkårlig blanding af systemer, ét modtagerur pr. system (intersystembiasen estimeret sammen med positionen) eller en kendt udsendt forskydning på referencetidsskalaen; sigmaer pr. måling leveret af kalderen, som standard motorens termiske delay-lock-loop-støj (navsignal::dll_code_jitter_chips) ved C/N0 for elevationen kombineret med signal-in-space-afstandsfejlen; uvægtet DOP (GDOP, PDOP, HDOP, VDOP, TDOP) i det lokale geodætiske system, formelle øst-nord-op-sigmaer og biassigmaerne; den fælles <c1/>-tilstand sammenligner positionsbestemmelser med kun GNSS, kun LEO og fusionerede og sweeper DOP mod antallet af tilføjede LEO-satellitter

seg-ee9a4a0cb530 = Konvergens for præcis punktpositionsbestemmelse (PPP) med kun GNSS og med LEO-forstærkning

seg-a54f36c27d90 = Et float-PPP-udvidet Kalman-filter på ionosfærefri kode og fase: statiske koordinater, et hvidt modtagerur, én intersystembias pr. ekstra system, en randomwalk-zenitvåd forsinkelse afbildet med 1/sin(elevation), en float-multiplicitet pr. satellitbue tilføjet ved opgang og droppet ved nedgang, og den præcise bane- og urfejl, der er fælles for en satellits kode og fase, behandlet som én korreleret opdatering med to rækker i en Joseph-stabiliseret form; målinger simuleret ud fra den samme model; konvergenstid (fejl under tærsklerne indtil kørslens slutning), fejlkurver og den kørselsgennemsnitlige positions-NEES for kun GNSS og hvert LEO-tilfælde, kørt som <c1/>-typen

seg-be4593802ccf = NEES-chi-kvadrat-testen er en intern konsistenskontrol (referencen og filteret deler modellen). Tendensen sammenlignes med Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min forkortet til { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter. Det medfølgende scenarie giver { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med sine egne repræsentative skaller på { "1000" } km og { "60" } grader, støj og stationer; artiklens konstellationer, støj og konvergensdefinition er ikke gengivet, så dette er en MODELLED konsistens i tendensen (monoton forkortelse, den største konstellation under en tredjedel af tiden for kun GNSS), ikke en validering

seg-8ef013b46d0f = Positioneringsnøjagtighed i 5G non-terrestrial networks ud fra signalbåndbredde

seg-12b1e4657370 = Cramér-Rao-grænsen for ankomsttid ud fra den kvadratiske middelværdi (Gabor-)båndbredde, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), for et fladt OFDM-spektrum (beta = B/sqrt({ "12" })), et båndbegrænset BPSK-spektrum (tæller i lukket form) eller ethvert spektrum ved kvadratur, og for frekvensen af en kompleks tone, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); positionsbestemmelser med ankomsttid på downlink med et ukendt modtagerur og en positionsbestemmelse med Doppler fra én satellit over en passage i 3GPP n256 MSS S-båndet, kørt som <c1/>-typen

seg-9306f1c06081 = LEO-understøttet tidsoverførsel til UTC mod C/N0 og modtagerens oscillator

seg-c618feb01476 = Urmålinger fra hver LEO-satellit i sigte ved en kendt position, kombineret ved invers varians ud fra pseudoafstandsstøjmodellen, filtreret af et Kalman-filter med to tilstande (fase, frekvens), hvis processtøj er oscillatorklassens hvide og randomwalk-frekvensstøj (slot_timing::ClockNoise, clock_state::ClockClass; udrulningsvariansen fra holdover::coast_phase_variance), et seedet referenceur ud fra de samme niveauer og IS-GPS-200-udtrykket i afsnit { "20.3.3.5.2.4" } for systemtid til UTC med en usikkerhed i den udsendte forskydning lagt til som en bias pr. kørsel; <c1/>-tilstanden timing sweeper oscillatorer og C/N0-forskydninger

seg-4a878bd4a90f = Intern konsistens: det offentliggjorte udtryk for forskydningen evalueret i hånden, den normaliserede fejl over { "40" } seeds og gulvet fastsat af usikkerheden i forskydningen. NIST-tallet for Iridium-tidsmodtagere med et miniature-atomur (under { "40" } ns fra UTC(NIST) over { "40" } dage) er kun en sammenligning; det medfølgende Iridium-scenarie giver { "10" } til { "11" } ns RMS ved nominel effekt med sin repræsentative afstandsfejl på { "5" } m. Flicker-frekvensstøj og ionosfæreforsinkelse simuleres ikke

seg-cef79d82f0d4 = LEO-dækning og dilution of precision for brugere ved polerne og i Arktis mod MEO-GNSS

seg-462a5e95d480 = Satellitter i sigte og median-PDOP, -HDOP og -VDOP med tilgængelighed mod breddegrad, over samplede længdegrader og epoker, for MEO-GNSS-systemerne alene, LEO-systemerne alene og dem alle, hvert system med sin egen maske og urmodel, kørt som <c1/>-tilstanden polar; banerne er SGP4/SDP4-elementsæt ved sweep-epoken (2026-01-01T00:{ "00" }:{ "00" } UTC i tilstanden polar) ført til det jordfaste system på den validerede Jordbane-sti (IAU 2006/2000A, UT1 = UTC, ingen polbevægelse)

seg-d92777401093 = Navngivne LEO-PNT-systemer som valgfri datapreset, hver med sin kilde

seg-5130bfe2410c = Systemuafhængige input: hvert system er Walker-skaller, eksplicitte elementer eller en GNSS-forudindstilling, et signal (bærebølge, chiprate, båndbredde, modtaget effekt eller C/N0-område), en SISRE, en Doppler-sigma og en urmodel; forudindstillinger udfylder kun det, et scenarie udelader, én fil hver med kilder mærket PUBLIC (med en URL), WORKSHOP eller AFLEDT og de uoffentliggjorte værdier opført som repræsentative: Xona Pulsar X1/X5, Iridium STL, Starlink-signaler af opportunitet, CentiSpace, et repræsentativt C-bånd-system, ATOMIC-efemeridemodellen uden ur og én forudindstilling afledt af en workshop i den valgfri Celeste IOD-forudindstillingsfil, som holdes tilbage ved at slette den fil og dens scenarier

seg-c6f71b3937cd = Transskription af de citerede offentlige værdier, kontrolleret for struktur (hver offentlig kilde har en URL, Walker-mønstre går op, C/N0 fra modtaget effekt over kT ved { "290" } K), ikke mod en ekstern uafhængig reference. Repræsentative værdier er navngivet i hver forudindstilling og er illustrative

seg-dec52b5b9cd6 = Ét LEO-PNT-system fra ende til anden: signaldesign, linkbudget for en passage, navigationsmeddelelse og fusioneret positionsbestemmelse, hvert trins output givet videre til det næste

seg-39443b31d418 = <c1/>-typen: et leo-signal-design (offentlig forudindstilling eller direkte) fastsætter centrum, båndbredde, chiprate og EIRP-fordeling for et leo-pass-bånd; passagen giver C/N0 for den sporede komponent og den båndbegrænsede kodejitter pr. epoke; en C/N0-linje efter mindste kvadrater i sin(elevation), leo-navmsg-meddelelsens SISRE (tilpasset ved passagesatellittens bane plus et angivet banebestemmelsesled i kvadratisk sum) og designets bærebølge og chiprate går til hvert LEO-system i en leo-pvt-fælles positionsbestemmelse og eventuelt til LEO-tilfældene i leo-ppp; hver overdragelse rapporteres med sin værdi og enhed

seg-854d3c1428d0 = Selvkonsistens af overdragelserne: hver videregivet værdi er lig med det foregående trins eget output, og en mutation af et opstrøms input flytter hvert nedstrøms tal, der afhænger af det. Trinnene beholder deres egne mærker; kæden tilføjer ingen fysik og ingen ekstern uafhængig reference

seg-55ca63edff02 = Detektion af spoofing ud fra LEO-Doppler og konsistens i passagegeometrien

seg-b12fc1728220 = <c1/>-typens <c2/>-sektion: en spoofer forfalsker, selvkonsistent i afstand og afstandsrate, de signaler, der ses ved en påstået position, som springer og/eller skubbes væk fra den sande efter et indsættelsestidspunkt (pr. LEO-bånd og for MEO-GNSS-signalet); modtageren forudsiger hver afstandsrate ud fra den udsendte bane og en uafhængig forhåndsposition og -hastighed og tester de målte afstandsrater med en generaliseret chi-kvadrat-statistik efter mindste kvadrater over et vindue af epoker (urdrift en generende parameter eller med en prior), på GNSS-kanalerne, LEO-kanalerne og alle kanaler, med termisk støj i frekvenslåsesløjfen ud fra C/N0 (Kaplan & Hegarty { "2006" }, afsnit { "5.6.2" }); detektionssandsynlighed fra den ikke-centrale chi-kvadrat-lov ved en angivet falskalarmsandsynlighed, detektion erklæret ved en angivet sandsynlighed for mistet detektion

seg-787c07c08c7f = Lukkede former og identiteter, ikke en ekstern måling: gradienten af afstandsraten mod en central differens, statistikken i informationsform mod den tætte kovariansform, en ren urdrift giver nul, en skub forklaret af priorn giver højst |dx|^2/sigma_p^{ "2" }, statistikken kvadratisk i et spring. Intet detektionstal er sammenlignet med et målt angreb; spoofer er idealiseret (ingen signatur i effekt, ankomstvinkel eller korrelationstop)

seg-5f341f85ac07 = Detektion af spoofing ud fra konsistens mellem bånd i et LEO-signal med flere bånd

seg-2f9c4d351b0f = For hver LEO-satellit og hvert par af rangingbånd danner <c1/>-sektionen den geometrifri pseudoafstandskombination, fjerner modtagerens ionosfæremodel og tester dens skridt fra epoke til epoke mod de to båndes kodestøj og en angivet tolereret umodelleret ionosfæreændringsrate (tosidet gaussisk, nøjagtig detektionssandsynlighed); en spoofer, der forfalsker nogle bånd og ikke andre, eller alle bånd uden ionosfæren, ses ved sit indsættelsestidspunkt; en, der forfalsker alle bånd og simulerer ionosfæren, ses ikke, hvilket resultatet angiver

seg-87fd44fa1d94 = Identiteter: indsættelsesskridtet for en ionosfærefri spoofer er lig med parrets modellerede forskel i ionosfæreforsinkelse, tærsklen er den tosidede normalkvantil gange skridtets standardafvigelse plus ændringsrategrænsen. Modtagerens ionosfæremodel er motorens, så det ægte residual er nul i middel pr. konstruktion; ingen ekstern uafhængig reference

seg-97dbcd5f2728 = Ionosfæresondering: skrå TEC ud fra den tobåndede forsinkelse over en LEO-passage

seg-844de34fd2f3 = For hvert båndpar for en <c1/>-satellit angiver rapporten det skrå totale elektronindhold, som den geometrifri kodekombination genfinder ved passagens top, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), og dets 1-sigma ud fra de to båndes termiske kodestøj, så ethvert LEO-PNT-design med flere bånd kan afvejes som en ionosfæresonde

seg-0a63a69e181d = Datumkovarians for måneramme med stationerne estimeret, mod udvidet præcision på 50 cifre

seg-de2ee45f6527 = Datumkovariansen med syv Helmert-parametre for scenariet lunar-frame-campaign med Jordstationerne estimeret (station { "1" } forankret), som lunar_frame_campaign beregner den i binary64: den fælles Fisher-information for station og beacon opbygget fra forsinkelsens Jacobi-matrix, stationsblokken marginaliseret ved et Schur-komplement gennem en spektral Jacobi-invers, H = AᵀSA dannet med Helmert-designet og inverteret spektralt. Problemet er dårligt konditioneret pr. konstruktion (Helmert-konditionstal { "2.1e8" } til { "2.3e8" }, konditionstal for den fælles information { "1.6e12" } til { "3.0e13" }): en relativ ændring på { "1e-9" } i Schur-korrektionen flytter datumsigmaerne med op til { "28" } %. Rapporteret: de syv datumsigmaer, Helmert-konditionstallet og den svageste retning. KRAV, SNÆVRET IND: motorens datumsigmaer og konditionstal ligger inden for den apriori værst tænkelige fejlgrænse for en baglæns stabil pipeline i dobbelt præcision på dette problem; dette hævder ikke, at de er så nøjagtige, som dobbelt præcision tillader (en faktoriseringsrute er omkring tusind gange mere nøjagtig på de samme input, og den valgfrie kvadratrodsløser omkring ti millioner gange), og den svageste retning er kun valideret, hvor dens tærskel ligger under en ret vinkel (kontrollen med faste stationer)

seg-71b463388e80 = Datumløser med kvadratrodsinformation mod udvidet præcision på 50 cifre

seg-5ec3e3c2bf19 = En valgfri løser med kvadratrodsinformation (lunar-frame-campaign solver = "srif"; standard uændret), der aldrig danner eller inverterer en informationsmatrix for datum: Householder-QR (ortogonal-triangulær nedbrydning) af den whitenede forsinkelses-Jacobi-matrix som en måleopdatering i et kvadratrodsinformationsfilter, Jordstationerne marginaliseret gennem den bageste triangulære blok (hvis Gram-produkt er Schur-komplementet), en anden QR af R_bb A for Helmert-datum med syv parametre, sigmaer som rækkenormerne af den triangulære invers og spektret (konditionstal, svageste retning) fra en ensidet Jacobi-singulærværdinedbrydning. Skalarprodukter kompenseres med et fejlfrit Dekker-split-produkt, så hver operation er en korrekt afrundet grundoperation i IEEE-754 eller en kvadratrod; identiske resultater på alle platforme er argumenteret ud fra dette, ikke testet på tværs af platforme

seg-433b52bf0ba2 = Maritime tillidsmonitorer: den aritmetik, de hviler på (NMEA-dekodning, geodætiske forskydninger, de kinematiske statistikker og statistikkerne for sensorresidualer)

seg-c61c575f9c38 = For et fartøj dekoder <c1/> de NMEA { "0183" }-sætninger, en modtager og dens instrumenter udsender (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), danner øst-nord-forskydningen mellem positionsbestemmelser (<c2/>) og ud fra dem de statistikker, dens monitorer afgør ud fra: den implicerede hastighed, dødregningsresidualet, den implicerede acceleration og den implicerede drejningsrate over vinduer på { "30" } s, residualerne for kurs mod sejlretning, logfart mod fart over grunden og antennehøjde ({ "10" } s medianer) samt spredningen og stigningen i satellitsignalets signal-til-støj-forhold.

seg-32fcf6956dac = HVAD DER KONTROLLERES EKSTERNT, angivet snævert: ({ "1" }) dekodningen af hvert felt, monitorerne læser, mod pynmea2 { "1.19.0" } (MIT) på { "8" } syntetiske logfiler ({ "1,086" } epoker), til { "1e-9" } i feltets enhed (breddegrad og længdegrad, højde, geoideseparation, HDOP, hastigheder, kurs, sejlretning, signal-til-støj-forhold; heltal og datoer nøjagtigt; klokkeslæt til { "1e-6" } s), med de største forskelle på niveau med det sidste ciffer i en double; ({ "2" }) øst-nord-forskydningen mellem to positionsbestemmelser, som afstand og pejling, mod WGS84-geodæten i geographiclib { "2.1" } (MIT) på { "223" } par af positionsbestemmelser med grundlinjer op til { "2" } km, fra -45 til { "70" } graders bredde og på tværs af antimeridianen, til { "0.01" } m og { "0.001" } grader (pejlingen mod geodætens middelazimut, kordens retning); ({ "3" }) monitorernes inputstatistikker ved { "341" } bedømte epoker af en syntetisk sejlads på { "400" } s med et sving og et positionsspring, mod Python-genberegninger, der bruger geographiclib til afstand og azimut, pynmea2 til dekodning og numpy til medianer og standardafvigelser: implicerede hastighed til { "0.005" } m/s, dødregningsresidual til { "0.02" } m, acceleration til { "5e-4" } m/s^{ "2" }, drejningsrate til { "1e-3" } grader/s, residualmedianerne og spredningen og stigningen i signal-til-støj-forholdet til { "1e-6" }. HVAD DER IKKE KONTROLLERES: monitorernes vinduelængder, tillæg og tærskler er dette projekts egne regler; Python gengiver dem ud fra den samme dokumentation, så overensstemmelse underbygger implementeringen af aritmetikken, ikke reglerne. THS-sætningen har ingen pynmea2-klasse, og ROT-sætningen læses ikke; ingen af dem er dækket. Tabellen fra en NMEA-talker og satellitnummer til et satellit-id i RINEX-stil er dette projekts egen (kun nummeret, talkeren og værdien sammenlignes). Inputtene for tidsskridt, værtsur og autentificeringsstatus har ingen uafhængig reference. Alle data er syntetisk tekst fra receiver_trust::synth; intet her er en måling, og der udtales intet om, hvordan en monitor yder på rigtig interferens. Pejling: sammenlignet med geodætens middelazimut. Den præregistrerede sammenligning mod fremadazimutten ved positionsbestemmelse { "1" } fejlede ved { "0.001" } grader ({ "77" } af { "223" } par, værst { "8.3e-3" } grader) på grund af en definitionsmæssig uoverensstemmelse, ikke aritmetik; tillægget blev lavet efter den første kørsel, og begge resultater er registreret (sammenligningen med fremadazimutten forbliver i testen som en beskrivende, ikke præregistreret grænse på { "0.01" } grader). Oplyst: de første kørsler fandt input, der udfordrede for lidt (acceleration og drejningsrate var klemt til nul ved hver epoke, og antimeridiansporet krydsede den aldrig), en fejl i den syntetiske generator (ingen længdeomvikling) og, for pejlingen, at den registrerede referencestørrelse (geodætens fremadazimut ved den første positionsbestemmelse) afviger fra kordens retning med omkring halvdelen af meridiankonvergensen ({ "77" } af { "223" } par uden for { "0.001" } grader, værst { "8.3e-3" }); inputtene blev rettet, og pejlingen blev sammenlignet med middelazimutten ved samme tolerance (tillæg { "1" } til { "3" } i præregistreringen, lavet efter at have set resultaterne og dermed ikke blinde); sammenligningerne af kurs og sejlretning blev gjort cirkulære ({ "360" } og { "0" } grader er én kurs, tillæg { "5" }). Mutation: en skalering på { "1e-4" } af østforskydningen fejler geodæsisammenligningen.

seg-1fdbb476c8ab = Maritim tillidsscore: aggregeringen af monitorernes evidens til en score fra 0 til 100 og dens tre bånd

seg-0d76b33144f1 = Hver monitor reducerer sin evidens til et forhold mellem statistik og tærskel; scoren er { "100" } minus summen over monitorerne af vægt gange en afgrænset lineær rampe af forholdet ({ "0" } op til { "0.5" }, { "1" } ved { "1.5" }), afgrænset til { "0" } til { "100" } og afrundet til { "0.1" }, med bånd ved { "90" } og { "55" }; hver epoke opregner de monitorer, der trak fra, og deres point.

seg-b2d3c6d6ac36 = Implementering mod specifikation, IKKE en ekstern uafhængig reference: en clean-room-genimplementering i Python (scripts/maritime_score_cleanroom.py), skrevet af en læser, der kun fik docs/RECEIVER-TRUST.md og docs/MARITIME-TRUST.md og ikke Rust-kilden, stemmer med score_from_ratios på { "600" } forholdsvektorer (score, bånd, point og rækkefølgen af fradrag, forskel { "0" }), efter at dokumentationen blev færdiggjort, hvor den første læser fandt den tavs eller inkonsistent (rækkefølge ved lighed, afrunding, forholdet for en monitor med bestået eller ikke bestået, to eksempler hvis tal ikke stemte med formlen). Det viser, at dokumentationen er tilstrækkelig, og at koden gør, hvad den siger. HVAD DER IKKE KONTROLLERES, og hvorfor rækken forbliver MODELLED: selve reglen (vægtene, rampen, båndgrænserne, evidensfastholdelsen) er dette projekts egen, præregistreret men uden ekstern kilde, og intet her viser, at en score på { "80" } eller { "40" } betyder det, en navigatør ville ønske, på rigtig interferens; der gives intet tal af den slags. Monitorernes tærskler er ligeledes dette projekts egne (række A kontrollerer kun deres aritmetik).

seg-f52fceaf06ca = Formatkontrol af NMEA { "0183" }-træningsstrøm og dekodede værdier

seg-684f86418933 = Syntetiske NMEA { "0183" }-strømme fra broen til besætningstræning (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW og PKSHT-markøren, genereret ud fra et referencespor med modellerede effekter fra modtager, himmel, jamming og spoofing. Kun tekstoutput; intet udsendes.

seg-4591ed75149c = HVAD DER KONTROLLERES EKSTERNT, angivet snævert: alle { "225,227" } sætninger i otte syntetiske træningsstrømme (fire biblioteksscenarier, seeds { "1" } og { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW og PKSHT-markøren) kan parses i pynmea2 { "1.19.0" }, en uafhængig NMEA-parser, med en gyldig kontrolsum og den forventede talker og type. Positionen, farten over grunden, kursen over grunden, sejlretningen, UTC-tid og -dato, positionsstatus og antallet af satellitter i GGA, som den dekoder, er lig med generatorens referencespor inden for tolerancer fastlagt før den første sammenligning ({ "1.5e-6" } grader, { "0.06" } kn, { "0.07" } km/t, { "0.11" } grader kurs, { "0.5" } grader sejlretning, { "0.02" } s), kørt af scripts/gen_nmea_training_ref.py med fixturen i tests/fixtures/nmea_training_ref/. Forventningen til antallet af satellitter i GGA blev rettet efter den første kørsel til NMEA-konventionen ({ "00" } uden positionsbestemmelse); numeriske tolerancer uændret fra præregistreringens commit. HVAD DER IKKE KONTROLLERES: at nogen modtager, kortplotter eller brosystem accepterer strømmene; realismen af modellerne for modtager, himmel, jamming eller spoofing (nominel himmel, modelleret støj, drag- og replay-profiler, alle MODELLED); HDOP, højde samt DOP- og GSA/GSV-indholdet ud over syntaks og antal; instruktørloggen. Intet udsendes, og der gøres intet krav om anti-jam- eller anti-spoof-ydeevne.

seg-1be1cfcb95c8 = Interferenskort: betydning af nøjagtighedskoder, AIS-værdier for ikke tilgængelig, tildeling til gitterceller, rutelængde pr. cellestatus og indlandsmaskering

seg-71cff2a675e8 = Læsningen af ADS-B-koderne for navigationsnøjagtighed og integritet, som kortet bruger (den EPU-grænse, en NACp-kode står for, den grænse for indeslutningsradius, en NIC-kode står for, og klasserne lav og god, som metoden udleder af dem); AIS-værdierne for position og fart, der ikke er tilgængelige, som AIS-læseren kasserer; den faste bredde/længde-gittercelle, en position falder i; rutelængden og dens opdeling efter cellestatus (degraderet, ikke degraderet, ikke vurderet, ikke observeret), som ruteeksponeringen rapporterer; og om en position ligger inde i landet fra et landpolygon med mere end en buffer. En celle markeret som degraderet eller anomal er en udtalelse om rapporterede nøjagtighedsfelter eller usandsynlige positioner, ikke et fund af interferens, og intet her kontrollerer det.

seg-beee15333c89 = HVAD DER KONTROLLERES EKSTERNT, angivet snævert: fem uafhængige implementeringer læser de samme syntetiske input. ({ "1" }) pyModeS { "2.21" } dekoder syntetiske DF17-rammer med operationel status og luftbåren position; Kshanas NACp EPU-grænser stemmer til { "0.5" } m (største forskel { "0.4" } m), dets NIC-indeslutningsgrænser for kode { "5" } til { "11" } stemmer til { "1" } m, og dets klasser lav og god placerer alle { "12" } NACp-koder og hver NIC-kode, som referencen producerer ({ "0" } til { "11" }), på samme side af de tærskler, referencens grænser implicerer ({ "0" } uoverensstemmelser). ({ "2" }) pyais { "3.3.0" } dekoder AIVDM-sætninger af type { "1" }, hvis nyttelastbits scriptet pakker fra de rå ITU-R M.1371-feltværdier; Kshana afviser præcis de dekodede positioner for ikke tilgængelig (breddegrad { "91" }, længdegrad { "181" }) og fart ({ "102.3" } kn) og beholder { "0" } til { "102.2" } kn som dekodet ({ "0" } uoverensstemmelser over { "94" } rammer). ({ "3" }) shapely { "2.2.0" } covers() på cellepolygoner stemmer med grid::Grid::cell_of for { "1770" } punkter over cellestørrelserne { "0.5" }, { "0.25" }, { "1" } og { "0.07" } grader, herunder punkter nær kanter, begge poler og antimeridianen ({ "0" } uoverensstemmelser). ({ "4" }) shapely { "2.2.0" } rute/celle-skæring med GeographicLib { "2.1" } WGS84-geodætlængder stemmer med ruteeksponeringen på { "8" } syntetiske ruter, herunder to der krydser antimeridianen: samlet længde til { "0.6" } % (største forskel { "0.49" } %, kuglen mod ellipsoiden) og hver cellestatus' længde til { "0.6" } % plus { "125" } m pr. stykke (største { "21" } % af den tolerance). ({ "5" }) shapely { "2.2.0" } contains() med pyproj azimutal ækvidistant afstand til kysten stemmer med indlandsmasken på { "2000" } m på { "992" } gittercentrumpunkter omkring fire syntetiske øer, én med en sø ({ "0" } uoverensstemmelser; { "4" } punkter inden for { "20" } m af bufferen blev udeladt og talt). Tolerancerne blev fastlagt i tests/fixtures/interference_map_ref/PREREGISTRATION.md før nogen sammenligning og ikke ændret efterfølgende; to defekter i de syntetiske input, som den første kørsel fandt, er registreret dér. HVAD DER IKKE KONTROLLERES: Kshana dekoder ikke rå Mode S-rammer eller AIVDM-sætninger, så dette validerer dens læsning af allerede dekodede værdier, ikke en dekoder. Referencens NIC-indeslutningsradier for kode { "1" }, { "2" } og { "4" } afviger fra DO-260B ({ "20" }, { "8" } og { "2" } NM), så kun kode { "5" } til { "11" } sammenlignes numerisk. Reglen for positionen ({ "0" }, { "0" }), højdegulvet, kildetypefilteret, hashingen af identifikatorer, metodens tærskler og statistikker og valget af cellestørrelse er Kshanas egne og kontrolleres ikke mod noget. Rutesammenligningen bruger den samme rette definition af stien i breddegrad og længdegrad på begge sider, så den kontrollerer længder og celletildeling, ikke at denne sti er den rigtige for et fartøj eller et fly. Intet her viser, at en markeret celle er interferens. Input er syntetiske; reference-fixturerne er skrevet af scripts/gen_interference_map_ref.py (pyModeS er GPL-3.0 og bruges kun i det offline-script; CI behøver ikke Python).

seg-57ace69bdf1a = Telemetri for tillid, trådformater: Prometheus-tekstformat og OpenTelemetry OTLP/HTTP JSON

seg-654126a9d073 = GNSS-tillid (score, bånd, årsager, gate og, på anmodning, position) som Prometheus-tekstformat udstillet på /metrics og som OTLP/HTTP JSON-metrikker, med en grænse for kardinaliteten af årsagsetiketter.

seg-b037c999443b = SIEM-hændelser for tillidstelemetri: Common Event Format (CEF) over syslog

seg-ffd8d7062055 = Hændelser ved båndskift (eller pr. epoke) som Common Event Format-nyttelaster i en RFC { "5424" }-kuvert over UDP eller TCP, med en dokumenteret feltafbildning og CEF-escaping.

seg-51640405c9b7 = SIEM-hændelser for tillidstelemetri: Log Event Extended Format (LEEF) over syslog

seg-1b3245506847 = Hændelser ved båndskift (eller pr. epoke) som Log Event Extended Format { "2.0" }-nyttelaster i en RFC { "5424" }-kuvert over UDP eller TCP, med en dokumenteret feltafbildning.

seg-563ccb0adbe5 = HVAD DER KONTROLLERES: dette crates egne tests med nøjagtige strenge af den dokumenterede LEEF-feltafbildning og RFC { "5424" }-kuvertens felter; der findes ingen vedligeholdt open source-LEEF-parser (en søgning i Python-pakkeindekset fandt ingen), så formatet kontrolleres mod sin egen specifikation læst af den samme forfatter, ikke mod en ekstern uafhængig reference. HVAD DER IKKE KONTROLLERES: om LEEF-nyttelasterne accepteres af nogen leverandørs parser eller SIEM; escaping-reglerne ud over de dokumenterede; en rigtig syslog-collectors adfærd.

seg-96a95b89faa5 = Integritet af bevispakken: signatur, hashkæde og verifikationsprocedure

seg-943a853d8a4a = En signeret bevispakke med hashkæde for en GNSS-tillidshændelse: SHA-256 over hver fil og en kæde over manifestet, en Ed25519-signatur over de nøjagtige manifestbytes og en verifikator, der navngiver hver fejl (en ændret, fjernet, omdøbt, ombyttet eller tilføjet fil, et omordnet eller redigeret manifest, et manifest hashet igen uden nøglen, en pakke signeret igen, en forkert fastlåst nøgle og et tidsstempeltoken, der er fjernet, erstattet, uanvendeligt eller over et andet dokument).

seg-c15736afcbc9 = Verifikation af signatur og kæde for RFC { "3161" }-tidsstempeltoken

seg-cd64bbf39459 = evidence::tsa::verify_token og valgfri <c1/> for en pakkes timestamp.tsr: et RFC { "3161" } TimeStampResp eller et bart TimeStampToken (CMS SignedData over en TSTInfo) kontrolleret offline mod betroede ankre på den måde, <c2/> kontrollerer det: de signerede attributters indholdstype og meddelelsesdigest over TSTInfo; signaturen over de signerede attributter (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 og P-384; offentlige RSA-operationer på crypto-bigint); ESS-signeringscertifikatet v1 (SHA-1) eller v2, hvis hash navngiver signercertifikatet, fundet blandt tokenets og kalderens ubetroede certifikater; signerens kritiske, eneste udvidede nøgleanvendelse timeStamping; kæden til et betroet selvudstedt anker med hvert certifikats signatur, CA-status og nøgleanvendelse, og hvert certifikat gyldigt ved tokenets genTime; og meddelelsesaftrykket mod dataene. Ikke kontrolleret: tilbagekaldelse (CRL, OCSP), navne- og politikbegrænsninger, noncen

seg-c04042b0270a = Tærskler for interferens i modtagertillid kalibreret på JammerTest { "2024" }-datasættet

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: den præregistrerede kalibrering af monitorerne for C/N0-fald, AGC og jamming-indikator på det offentlige JammerTest { "2024" }-datasæt (Zenodo { "15911589" }, GPL-3.0-or-later, hentet ved kørsel, aldrig medtaget): pr. mappe en tidslinje på { "1" } s fra mon_rf.csv og rinex.csv, monitorerne køres én gang, hver epoke efter kalibreringen mærkes ren eller jamming ud fra mappens attack_log (flyttet fra CEST til UTC, sikkerhedsmargin på { "60" } s), hver tærskel sweepes over et fast gitter, den mindste tærskel med en samlet falskalarmsandsynlighed for rene epoker på højst { "0.01" } vælges, og tællinger med leave-one-folder-out på tilbageholdte data; en krydskontrol af UBX-læseren. Udvælgelsen leveres kun som den valgfri profil [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); standardreglen og hvert output uden den er uændret

seg-65a8361b4a22 = Jammertest-scoring: en modtagerlog scoret pr. planlagt test (detektionslatenstid, oversete alarmer, falske alarmer, tid til genopretning) mod den offentliggjorte testplan

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA's testkatalog og transmissionsplan (MIT, hentet med en fastlåst SHA-256, aldrig medleveret) læses som planlagt reference med bevarede katalog-id'er; en receiver-trust-kørsel scores pr. test (første alarm minus planlagt start, detected/late/missed mod en tolerance, tid til den første alarmfri periode, alarmer uden for ethvert slot og dets sikkerhedsmargen), med en signeret bevispakke, der indeholder scorekortet. Planen består af planlagte slots, ikke af optagne tidspunkter for udsendelse

seg-0d227bbcb5f1 = Testbænk-eksport (kshana bench-export): jordfaste, geodætiske og lokale hastighedskolonner, attitudekolonner og NMEA { "0183" }-output

seg-c6a6e08afadd = Bevægelses-CSV'ens jordfaste position, geodætiske position, jordfaste hastighed, heading/pitch/roll og UTC-kolonner samt NMEA GGA/RMC-sætningerne, skrevet ud fra syntetiske scenarier (gnss-ins inklusive automotive-urban-canyon, jamming, gnss-sim). Kun bevægelse og hændelser; intet signal skrives, og der påstås ingen ydeevne for nogen simulator eller modtager.

seg-f953ad11fe08 = HVAD DER KONTROLLERES EKSTERNT, snævert formuleret: mod pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } og scipy { "1.18.1" }, kørt af scripts/gen_testbench_ref.py på { "4" } syntetiske scenarier, med tolerancer fastsat før den første sammenligning (hver især forfatterens afrundingsværste tilfælde): de jordfaste kolonner er lig med WGS { "84" }-konverteringen af de geodætiske kolonner (værst { "1.3e-4" } m, tærskel { "3e-4" }) og omvendt ({ "1.3e-9" } deg, tærskel { "2e-9" }; højde { "1.3e-4" } m, tærskel { "3e-4" }) på hver række; den jordfaste hastighed roteret til nord-øst-ned med PROJ's topocentriske operation er lig med motorens sande NED-hastighed ({ "7.5e-5" } m/s, tærskel { "2e-4" }); heading, pitch og roll er lig med scipys yaw-pitch-roll af motorens sande kvaternion ({ "5.0e-7" } deg, tærskel { "1e-6" }); hver NMEA-sætning kan tolkes i pynmea2 med en gyldig kontrolsum, og dens afkodede position ({ "1.2e-3" } m, tærskel { "5e-3" }), højde, hastighed, kurs ({ "5.0e-4" } deg, tærskel { "1e-3" }) og tid er lig med bevægelsesværdierne; UTC-kolonnen er lig med uafhængig dato-tid-aritmetik. SHA-256 af de nøjagtige CSV- og NMEA-bytes, der blev kontrolleret, er fastlåst. HVAD DER IKKE KONTROLLERES: scenariets egen sande bane (kørselsprofilen og dens integration); konventionerne (heading er kroppens yaw, ikke kursen, og afviger fra den med op til ca. { "77" } grader på automotive-urban-canyon; GGA-kvalitet, antal satellitter og HDOP er pladsholdere); om en laboratoriesimulator læser filerne som tilsigtet; enhver ydeevne for en simulator eller modtager. De uafhængige referencer kontrollerer konverteringer og kodninger, ikke scenariets fysik. Håndtering af lokalt koordinatsystem kontrolleres kun gennem hastighedsrotationen og NMEA-hastigheden og -kursen (CSV'en har ingen lokal positionskolonne).

seg-ee99388f7b15 = compliance (kshana compliance-report): en kortlægning fra Kshana-outputs til punkter i offentlige rammeværker, kun efter nummer, udfyldt ud fra de angivne kørsler; et resultat tæller for en funktion kun, når det indeholder det belæg, som kortlægningen angiver, en tom mængde belyser ingenting, og formuleringen er "leverer belæg for"; rapporten er ikke en konstatering af, at noget rammeværk er opfyldt, og ikke en vurdering eller godkendelse fra nogen.

seg-8659260fd38e = Referencer kontrolleret mod et script-udtrukket overskriftsindeks over de citerede offentlige dokumenter, læst 2026-10-10 (tests/compliance_references.rs). HVAD DER KONTROLLERES: { "49" } citerede referencer til punkter, afsnit, stykker eller overskrifter findes i det citerede dokument, og { "7" } citerede URL'er kunne slås op på den registrerede dato ({ "2" } via en anden vej); negative kontroller slår fejl. HVAD DER IKKE KONTROLLERES: at nogen omskrivning, kortlægning eller mangel er korrekt; punkter i EN { "16803" } (betalt, kun katalogtekst); senere revisioner; indekset er ikke en uafhængig implementering.

seg-98c360d82d56 = Maritime integrationer: Signal K-plugin, OpenCPN-gatestrøm og scorepanel, referencebuild

seg-7af9ce566646 = Tillidsscoren, bandet, årsagerne, gatens tilstand og den af modtageren rapporterede position, udgivet under navigation.gnss.kshana i en Signal K-server med en notifikation for advarsel, alarm og normal (integrations/signalk); den gatede NMEA-strøm, hvor positionsbestemmelsen er markeret som ugyldig, mens tilliden er kollapset, og med en PKSHT-sætning pr. cyklus, leveret til OpenCPN over TCP af selve gaten eller af et lille relæ, og et native OpenCPN-scorepanel, der læser PKSHT-sætningen (integrations/opencpn); samt systemd-enheder og en container, der kører gaten (deploy/reference-build). Hvor disse viser output, bærer de den vejledende erklæring: Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.

seg-00a0f52f7458 = HVAD DER KONTROLLERES, snævert formuleret: at disse integrationer fungerer mod den rigtige software, de er skrevet til. BELÆGGET er committet i integrations/signalk/evidence/README.md (med dens JSON-filer) og integrations/opencpn/evidence/README.md (med dens skærmbilleder og logs), hver med det script, der gengiver det. ({ "1" }) Signal K: pluginnet indlæst i den fastlåste npm-pakke signalk-server { "2.33.0" }, i et privat netværksnavnerum kun med loopback, fodret med syntetiske data. Serverens egne REST- og WebSocket-grænseflader viste de udgivne stier, scoremetadata og en notifikation, der gik fra fraværende til advarsel, alarm, normal (efter holdetiden) og advarsel igen, da dataene stoppede. Med den rigtige kshana kørt af pluginnet på den NMEA, serveren selv modtog, gik notifikationen til advarsel og derefter alarm, og den rapporterede position blev udgivet; serverens egen navigation.position blev skrevet af dens NMEA-udbyder, aldrig af pluginnet. Kørt igen mod live JSON-skema { "1.2" }. ({ "2" }) OpenCPN: pluginnet bygget mod OpenCPN's plugin-API-header og wxWidgets { "3.2.4" }, indlæst i Ubuntu { "24.04" }-pakken af OpenCPN { "5.8.4" } under en virtuel skærm; OpenCPN indlæste det, kørte dets initialisering og afleverede PKSHT-sætningerne fra den gatede strøm til det, og panelet blev rødt i det upålidelige bånd. I én ren kørsel holdt OpenCPN's egen skibsposition op med at opdatere, og dens indikator for positionsbestemmelse faldt, da gaten markerede positionsbestemmelsen som ugyldig. En anden kørsel, fodret direkte fra gatens TCP-lytter, viste levering til pluginnet, men ikke et rent før-og-efter. ({ "3" }) Relætestene afspiller et optaget udsnit af den gatede strøm gennem en rigtig TCP-socket og kontrollerer, hvad en forbruger modtager (bytes uændrede, gyldige kontrolsummer på hver sætning inklusive de omskrevne, GGA og RMC enige med hinanden, én PKSHT pr. cyklus med gate-feltet, hvor positionsbestemmelsen er ugyldig), og end-to-end-scriptet kontrollerer, at en forbruger af gatens lytter modtager nøjagtig de bytes, som den samme gate skriver til standard output. ({ "4" }) PKSHT-parserne (JavaScript og C++) køres over sætninger optaget fra kshana-output og afviser en forkert kontrolsum, version eller en score uden for { "0" } til { "100" }. ({ "5" }) Systemd-enhederne kontrolleres med systemd-analyze verify (systemd { "255" }, binære filer stubbet) og med kontroller for en shell i ExecStart, genstartspolitikken og sandbox-nøglerne; containerens entrypoint og dens håndtering af argumenter kontrolleres med en stub-binær fil. HVAD DER IKKE KONTROLLERES: der findes ingen ekstern uafhængig reference for nogen værdi, som disse integrationer viser. Selve tillidsværdierne er rækkerne ovenfor, og en integrationskørsel viser blot, at rørføringen bærer dem; det er derfor, denne række er MODELLED og ikke VALIDATED (docs/VALIDATION.md). Der blev ikke brugt noget rigtigt fartøj, nogen modtager, nogen lang kørsel, nogen anden version af nogen af værterne, noget andet operativsystem eller skrivebord; alle data er syntetisk tekst, og intet her er en måling. Notifikationens lyd og visuelle håndtering i en rigtig Signal K-klient, OpenCPN's værktøjslinjeknap, indstillinger og forældet tilstand samt pakning til OpenCPN's pluginhåndtering blev ikke afprøvet. Systemd-sandboxnøglerne blev kun kontrolleret for syntaks, ikke kørt under en levende systemd, og containerimagets build og dets sundhedstjek har ingen committet dokumentation her. Der påstås ingen tal for detektion eller falske alarmer. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.

seg-89ab9ef155eb = BOC({ "1,1" })-tracking: DLL-skalering og opløsning af bump-jump-multiplicitet (til-valg)

seg-ef24be9b5917 = Feltet boc i iq::track::LoopConfig (til-valg, None som standard): de tre DLL-diskriminatorer omskaleret, så de viser kodefejlen i chips med enhedshældning på hovedtoppen af sinus-BOC({ "1,1" }), og en bump-jump-monitor på meget tidlige og meget sene korrelatorer ved en halv subbærebølgeperiode ({ "0.5" } chip), der får kode-NCO'en til at hoppe mod hovedtoppen, når en op/ned-tæller når N ({ "8" } som standard). Uden tilvalget er alle outputs uændrede.

seg-2c32955cbfb3 = IQ-kanal for ionosfærisk scintillation (Cornell-modellen) mod målt GPS L1-scintillation ved { "50" } Hz

seg-2fdcb373ab25 = iq::channel::scint, Cornell-scintillationsmodellen (Rice-intensitet, andenordens Butterworth-spektrum, fase arg z) drevet ved et målt vindues S4 og intensitetens dekorrelationstid, sammenlignet på det, den genererer ud over disse to input; realdata::scint50 læser den målte log, fjerner tendensen og kører sammenligningen.

seg-160507ac3702 = Cell-averaging CFAR-tilvalg i IQ-akkvisition

seg-7c0a1adc9ae6 = iq::acq::ca_cfar og ca_cfar_cells (til-valg): en celle i et akkvisitionsgitter sammenlignes med middelværdien af referenceceller i dens Doppler-række (guard- og stride-lags, der løber rundt om perioden), ved en faktor alpha fastsat ud fra den lukkede form for CA-CFAR's sandsynlighed for falsk alarm for M ikke-koherente blokke (ca_cfar_pfa, ca_cfar_alpha). Detektoren på sampleeffekt forbliver standard, og alle eksisterende outputs er uændrede.

seg-5bd3bf0c22a7 = Spektrummodel: GLONASS-, BeiDou- og Galileo E6-bånd (til-valg)

seg-9c16189c63ac = spectrum::default_band opløser, kun ved navn (MORE_BAND_NAMES), GLONASS L1OF og L2OF på hver FDMA-kanal K = -7 til { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a og B3I (BPSK({ "10" })) og Galileo E6 (BPSK({ "5" })), med bærebølgerne og de mindste modtagne effekter fra deres interfacekontroldokumenter; standardbåndsættet og alle eksisterende outputs er uændrede.

seg-63b7da996265 = BeiDou B1I's primære afstandskoder mod en uafhængig generator

seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits og b1i: BDS-SIS-ICD-B1I-3.0 Gold-koderne afkortet til { "2046" } chips, PRN { "1" } til { "63" }, som IQ-laget genererer, akkvirerer og tracker dem.

seg-b4787b04338e = GPS L1C's afstands- og overlaykoder mod de trykte kontrolkolonner i IS-GPS-800J

seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits og l1c_o_bits: Weil-afstandskoderne L1CP og L1CD (beregnet Legendre-sekvens, Weil-indeks, udvidelsessekvens indsat før chip p) og L1CO S1-overlaykoderne, PRN { "1" } til { "63" }.

seg-5cba09089e09 = LunaNet AFS-I's og AFS-Q's primære koder mod de trykte kontrolkolonner i LSIS-AFS V1.0

seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits og afs_q_primary_bits (signalnavnene lunanet-afs-i og lunanet-afs-q i kshana iq): AFS-I Gold-koden ({ "2047" } kortcyklet til { "2046" }, G2 forsinket pr. PRN) og AFS-Q Weil-primærkoden (beregnet Legendre-sekvens, Weil-indeks, udvidelsessekvens indsat før chip p), PRN { "1" } til { "210" }.

seg-7b1ae0c7ca28 = LunaNet AFS' tertiærkoder og meddelelseslag (SB1 BCH, CRC-24Q, interleaver) mod LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkroniseringsmønster, SB1 BCH({ "51,8" })-koder og dekoder med 256 hypoteser, CRC-24Q, blokinterleaveren på { "60" } x { "98" }, en kontrol af symbolstrømme (kshana lunanet-afs-check) og en teststrømsgenerator med pladsholderunderrammer. Rate-1/2 LDPC-kodningen af underrammerne { "2" } til { "4" } er ikke implementeret (dens matricer findes i et separat bilag).

seg-0d7b17524c04 = Standardpakker: scenarier scoret mod tærskler fastsat før kørslen

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): testprofilerne i DHS' Resilient PNT-rammeværk for niveauerne { "1" } til { "4" }, IMO MSC.1/Circ.1575's nøjagtighedsniveauer og integritetsvurdering samt ICAO Doc { "9849" } Appendix F-pakkerne for overvågning, vurdering og afhjælpning: hver test kører en medfølgende scenarietype og sammenligner resultatfelter med tærskler angivet i pakken, og test, der kræver en modtagerlog, er opført som NEEDS INPUT og scores ikke.

seg-d9ea966abdd6 = Ingen ekstern for scenarieresultaterne: hver pakketest kører en MODELLED scenarietype. Tærsklerne er pakkeforfatterens angivne profil (DHS-rammeværket angiver ingen værdier; IMO's nøjagtighedsgrænser er Table C-1 i MSC.1/Circ.1575, læst i sin helhed; ICAO-pakken følger ICAO's egen præsentation af RFI Mitigation Plan, fordi Doc { "9849" } er en betalt publikation og ikke blev læst), committet før enhver scoret kørsel i PREREGISTRATION.md-filer i xval-stil under standards/. En tærskel med MET siger, at et modelleret scenarie nåede en angivet tærskel, intet om et produkt

seg-8a8f2c85e0c3 = Bevispakke for laboratoriets rundtur (scenarie, testbetingelser, modtagerlog, score)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) og receiver-log-eksporten kshana.test-conditions/1 fra kshana bench-export: en signeret pakke, der registrerer scenariets hash, de angivne betingelsers hash, logens hash og scoren mod de angivne hændelser, og som afviser betingelser, der ikke stemmer med scoringshændelserne, eller en log, hvis hash ikke er den angivne. Intet signal skrives, afspilles eller planlægges.

seg-76da58fe670a = Ingen ekstern: pakken forbinder hashes og en MODELLED modtagerlogscore, kontrolleret på syntetiske data (den eksporterede NMEA fra et medfølgende scenarie behandlet som modtagerens log). Der påstås ingen laboratoriekørsel

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

seg-3de364392f92 = Ingen ekstern: ingen fil produceret af RTKLIB blev læst, og kolonneopbygningen stammer fra RTKLIB-manualen. Kontrolleret kun på selvskrevne filer; ECEF-konverteringen genbruger frames::ecef_to_geodetic, som har sine egne rækker

seg-849393517c04 = NovAtel OEM7 ASCII- og binære logs (BESTPOS, RANGE, RXSTATUS) til receiver-trust

seg-7e0021922025 = Læser BESTPOS (position), RANGE (C/No pr. signal) og RXSTATUS (modtagerens jammerflag, som epokens selvrapport) fra ASCII- og binære OEM7-logs, CRC-kontrolleret, skrivebeskyttet (receiver_trust::machines::novatel).

seg-1f7c6d1009a8 = Ingen ekstern som beståelsestærskel. Feltopbygningen og CRC'en følger den offentlige OEM7-dokumentation (docs.novatel.com); CRC-rutinen blev kontrolleret én gang mod den CRC, som dokumentationen angiver for sit eget BESTPOSA-eksempel (citeret, ikke gengivet ordret). Fixtures er selvskrevne; ingen log fra en rigtig modtager blev læst

seg-a45c53a9deb3 = RTCM { "3" } MSM4- og MSM7-læser af bærebølge-til-støj-forhold til receiver-trust

seg-0a0c9976236f = Læser C/N0 for hver signalcelle i RTCM { "3" } MSM4- og MSM7-meddelelser (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) fra en rammestrøm, CRC-24Q-kontrolleret (receiver_trust::machines::rtcm3). Opbygningen stammer fra de BSD-licenserede pyrtcm-tabeller, ikke fra teksten i RTCM-standarden.

seg-2af6fc1abe98 = ReferenceImpl i en engangskontrol, ikke en test i suiten: pyrtcm { "1.2.0" }s dekoder læser de samme selvskrevne rammer til samme C/N0 og epoketid. Den deler kilde til sine tabeller med denne læser, så den kontrollerer bithåndteringen, ikke opbygningen. Ingen optagelse fra en rigtig modtager eller basestation blev læst

seg-cd554a7c1649 = GNSS-SDR-monitoradapter til receiver-trust

seg-22b587ac642d = Læser GNSS-SDR Monitor-meddelelser (Gnss_Synchro) og PVT-monitor-meddelelser, videresendt som JSON-linjer med proto-feltnavnene, til C/N0 pr. kanal, positionsbestemmelse, anvendte satellitter, HDOP og himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-d22aed9d9a16 = Ingen ekstern: feltnavnene stammer fra GNSS-SDR-dokumentationen; hverken læseren eller relay.py blev kørt mod en levende GNSS-SDR eller en rigtig optagelse

seg-217e5953c128 = Indlæsning af IMU-log, gyro-heading-input og Allan-tilpasning af hybride sensorparametre

seg-9dadc819daef = Læser en IMU-CSV (dokumenterede kolonner eller EuRoC-opbygningen); integrerer yaw-raten til den heading, som heading-course-monitoren læser ([log.imu]); og tilpasser accelerometerets og gyroets støjparametre for de hybride scenarier og fusionsscenarierne ud fra en stationær log ved overlappende Allan-deviation (imu-fit).

seg-9099f3467e9e = Ingen ekstern: tilpasningen er kontrolleret på syntetiske hvidstøjlogs med kendte koefficienter, headingen på logs med konstant yaw-rate. Ingen rigtig IMU-log blev tilpasset, og q_aa tilpasses ikke

seg-15a852a2dcb0 = Home Assistant MQTT-discovery og tilstandseksport til tillidstelemetri

seg-6d6b07b26966 = Et JSON-tilstandsdokument og Home Assistant MQTT-discovery-meddelelser for tillidsstrømmen, udskrevet som tekst på alle flader og udgivet over MQTT { "3.1.1" } QoS { "0" } af CLI'en (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-79a8f3864af3 = Ingen ekstern: pakkerne blev læst af en loopback-lytter skrevet til testen, ikke af en rigtig broker, og Home Assistant blev ikke kørt

seg-68caf86157c2 = ROS { "2" }-pakke til receiver-trust og gnss_lib_py-bro

seg-e7d7d99fe538 = En ROS-fri bro, der skriver positionsbestemmelses- og satellitmeddelelser som NMEA og scorer dem gennem Python-bindingen (integrations/ros2/kshana_trust), og en bro fra gnss_lib_py NavData til receiver-trust gennem rtklib-pos-formatet (integrations/gnss_lib_py).

seg-05ded40b17d2 = Ingen ekstern: ROS-noden blev ikke kørt på en levende ROS { "2" }-graf, og feltnavnene i ublox_ubx_msgs blev ikke kontrolleret mod en kørende driver. gnss_lib_py (MIT) blev kørt til brotesten

seg-c3c260b7063e = Tests

seg-33d506570c1b = srp_shadow::tests (den ringformede lukkede form, den ensartede lov, der gengiver den koniske skygge, grænserne for fuld sol og umbra)

seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } tilfælde x { "25" } timetilstande over { "24" } h, LEO, GEO og HEO, tredje legeme og tredje legeme + SRP: værste |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; den analytiske seriekontrol afviger med { "9.96" } m; Sol { "6.39" } m og Måne { "0.244" } m fra Orekits DE440-positioner, en registreret afvigelse fra tærsklen); enhedstests af propagator (udbyderafvisning, fallback-optælling delt på tværs af kloner)

seg-448f4acf5c7b = tides, propagator, precise_od

seg-4014447d4bcc = tides::tests (S1-leddet er dagligt, drejer { "90" } grader på et kvarter af et døgn og har belastningsfaktorens amplitude for hver række; fysisk størrelsesorden i LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit i { "8" } punkter uden for aksen: maks. |da| { "2.2e-17" } m/s^{ "2" } ved N = { "70" }, kører altid; { "3.5e-17" }, { "3.9e-17" } og { "7.3e-17" } m/s^{ "2" } ved N = { "200" }, { "360" }, { "2190" }, datastyret af KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs ({ "24" } h 200x200-bane, datastyret: værste |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; grad-70-kontrol { "0.726" } m); enhedstests af gravity_sh (enighed med den klassiske evaluator til { "1e-13" } ved grad { "70" }, endelig differens og polkontinuitet på et grad-2190-felt, et underflydende grad-2190-led mod en beregning med udvidet eksponent)

seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } scenarier: range-rate, az/el og blandet, LEO og MEO, støjfri og seedet sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad, masker på { "5" } og { "10" } grader, mod Orekit { "12.2" }: synlige sæt identiske; målingsværdier inden for { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM inden for { "1.2e-14" } relativt; støjende tilstande inden for { "1.74" } cm og { "1.14e-5" } m/s; RMS efter tilpasning pr. type inden for { "2.7e-4" } relativt; støjfri kshana mod reference { "1.06e-8" } m; støjfri kshana mod Orekit { "1.464" } og { "1.740" } cm i to scenarier, en registreret afvigelse fra tærsklen på { "1" } cm); enhedstests af orbit_determination og batch_ls

seg-f5a76ae1fcaa = sp3, precise_od

seg-39a552abfcab = enhedstests i src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (committet { "8" } h ESOC-fixture, sigma { "0.032" } m ud fra headereksponent { "5" }: Tier-1 3D RMS { "0.132" } m uændret, Tier-2 { "0.035" } m mod { "0.070" } m ved sigma { "1" } m, hvor ændringen kommer fra den genbalancerede empiriske a priori-begrænsning); tests/agency_swarm.rs (Swarm-produktet har ingen nøjagtighedskoder og falder tilbage, fastlåst)

seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

seg-dbe0dd5dcf47 = gnss_navmsg::tests (CRC-24Q-kontrolværdi 0xCDE703; foldningsimpulssvar; Viterbi retter indsatte fejl; layoutbredder); tests/gnss_navmsg_roundtrip.rs (feltstartbits er lig ICD-bitnumrene; kodning -> FEC -> interleave -> Viterbi -> afkodning går rundt inden for en halv LSB); tests/gnss_navmsg_galileo_brdc_grid.rs (IGS BRDC 2018-133 Galileo-poster på LSB-gitteret, værste { "3.6e-3" } LSB; den præregistrerede tærskel for antal satellitter blev ikke nået, { "15" } af { "20" }, FUND)

seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

seg-e892fffaaf07 = hatch::tests (støjfri gennemløb; hvid-støj-varians 1/(2N-1); genstarter); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } epoker, N = { "100" }: median 3D-fejl { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

seg-bdda05057c91 = rinex_obs (parse_obs)

seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (de første { "4" } epoker af IGS MGEX RINEX { "4.00" }-filen MAO000USA_R_20231980000_01D_30S_MO, { "58" } satellitter, { "7" } systemer: headerposter og værdier i første epoke er lig de publicerede litteraler); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (syntetisk { "4.02" }-header ud fra specifikationen)

seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (reelle C01-C04-poster: geostationær radius, længdegrader 140.02/80.04/110.55/159.99 grader i de publicerede slots, |bredde| { "2.13" } grader med hældningen mod { "6.65" } uden; den præregistrerede sammenligning af broadcast mod præcis SP3 er datastyret af KSHANA_BDS_GEO_SP3 og er ikke kørt); rinex::tests

seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (figur-8-kørsel: stabil 3D RMS { "0.025" } m for bærebølge mod { "0.470" } m for kode på identiske målinger; { "12" } seeds middel NIS/dof { "1.00" } og stabil NEES/dof { "0.92" }; et cycle slip på 1 cyklus opdaget i sin epoke uden falske alarmer og med uskadt løsning; når broadcast-korrektionerne slås fra, stiger kodefejlen fra { "0.51" } m til { "19.6" } m (iono) og { "8.0" } m (tropo); den støjfri kørsel konvergerer til { "0.3" } mm)

seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scenarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (hver pakke: fusioneret under fri INS over udfaldet for begge sensorer; jernbane: tæt { "5.3" } m mod løs { "12.9" } m i navigationsklasse og { "15.6" } m mod { "18.8" } m taktisk over udfaldet, tilgængelighed { "0.97" } mod { "0.95" }; tight-tabellen valideret); tests/gnss_ins_legacy_trajectory_pin.rs (den løst koblede standard bit-identisk)

seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (3D-filter over { "60" } seeds: middel-NEES for anden halvdel { "8.12" } for { "8" } tilstande, χ²-sum i sidste epoke inden for dens { "95" } %-bånd; en ur-positionsbestemmelse på { "0.1" } ns skærer 3D-positionens sigma fra { "5.58" } m til { "3.07" } m; biasfilter over { "60" } seeds: χ²({ "5" })-sum i båndet, bias inden for { "3" } sigma i { "59" } af { "60" }; fusion-pnt-coupled med biasede accelerometre: position p95 { "18.7" } m / { "90.0" } m og integritet { "1.00" } / { "0.97" } koblet mod { "430" } m / { "4060" } m og { "0.006" } / { "0.000" } afkoblet); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion og hybrid uden [coupled] bit-identiske)

seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

seg-5a6b5289a473 = fusion::trajectory::tests (koordineret sving har ingen sidekraft og lastfaktor 1/cos φ; CSV-import gengiver en fløjet profil til { "1e-3" } m/s og { "1" } m); tests/gnss_ins_trajectory_library.rs (hver profil kører, og fusion slår fri INS over udfaldet; hver flyver sin navngivne bevægelse; observerbarhed af kurs: yaw-sigma efter { "240" } s { "1.27" } grader ved ligeudflyvning mod { "0.039" } grader i figur-8 og { "0.062" } grader ved stop-og-kør); tests/gnss_ins_legacy_trajectory_pin.rs (ældre resultat og referencehashes bit-identiske)

seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE marts { "2023" }, { "4" } perilunier og { "5" } apolunier: periode { "6.5004" } d mod { "6.5699" } d ({ "1.07" } %, tærskel { "3" } %), apolun { "71 182" } mod { "71 215" } km ({ "0.05" } %, tærskel { "5" } %), perilun { "3 385" } mod { "3 245" } km ({ "4.1" } %, tærskel { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: på den syntetiske fjordpassage i scenarios/training/fjord-natural-degradation.toml fratrækkes de samme { "624" } epoker med og uden den angivne [skyline]; med den rapporteres sky-blocked i { "680" } epoker ({ "0" } uden: azimuth-gap-fallbacken ser intet i en tosidet fjord), open_fraction er { "0.758" }, og epoker i miljøklassen falder fra { "78" } til { "33" }, hvor resten er tab af satellitter, som den angivne horisont lader stå frie; uden for hændelsen ændrer horisonten ingen score); receiver_trust::geometry::tests (håndafledte forhold ved tærsklerne, tærskelkanterne, rampen og loftet, gulvet, etiketkanterne, [geometry]-tilsidesættelser, DOP på den validerede kerne, fastholdte og udløbne himle, ukendt ikke gættet, signaltab, tolerancen for dårlig geometri, no-fix-sentinels); tests/geometry_trust.rs (en rimelig maskeret himmel mærket og ikke scoret, en dårlig maskeret himmel, et lavt-elevationstab, et effektfald, en forfalsket HDOP, totalt signaltab, en drag-off under dårlig geometri, ukendt geometri, sessionstilsidesættelser, live-skemaet); tests/geometry_trust_no_change.rs (begge eksempelsessioner byte-identiske med { "0.35.0" }, når de tilføjede nøgler er fjernet); tests/geometry_corpus_identity.rs (hvert committet NMEA-korpus for fartøjer, også som GPS-kun åben himmel, og besætningstræningsscenarierne: byte-identiske med { "0.35.0" } undtagen dårlige epoker, som kun adskiller sig ved geometrifradraget)

seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (kernen med ét ur mod gnss_lib_py)

seg-085cbc64bab2 = holdover

seg-b31ed8fc6801 = holdover::tests (mod rekursion af Kalman-kovarians i flere trin; hvid FM eksakt; rundtur); coast-varianskernen er valideret eksternt i tests/gnss_denied_clock_holdover_reference.rs (mod scipy Van-Loan/brentq)

seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

seg-d302e2ef46ad = clock_library (card)

seg-3016100a7015 = clock_state::tests (analytisk van-Loan Q; NEES; PSD-positivitet); tests/clock_state_reference.rs (fuldt predict+update-forløb — tilstand x og { "3" }×{ "3" }-kovarians P over { "1925" } trin / { "4" } parametersæt mod filterpy { "1.4.5" }; værste |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (fastlåser fundet); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 runde { "3" })

seg-509026100595 = timetransfer, timetransfer_adv

seg-a1ad8fb8537d = timetransfer::tests (reciprok ophævelse; Sagnac-identitet i to former); tests/time_transfer_error_budgeting_reference.rs (ækvatorial omsejling Sagnac = { "207.386" } ns mod den publicerede Ashby { "207.4" } ns til <{ "0.05" } ns; samt Sagnac/geodist-geometri krydskontrolleret mod RTKLIB { "2.4.3" } geodist() kompileret fra C-kildekode)

seg-10e0cb39ac3b = navsignal

seg-1035f877de94 = navsignal::tests (BPSK selv-SSC = 2/3R_c; PSD med enhedsareal; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (GPS C/A Gold kryds-/autokorrelation, eksakt heltalsmatch mod uafhængig IS-GPS-200-kodegenerering; BPSK-R({ "1" })/sinus-BOC({ "1,1" }) PSD mod et uafhængigt scipy-periodogram); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, fastlåst)

seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016-gulvafgrænsning); tests/quantum_inertial_sensor_reference.rs (overføringsfunktion |H(ω)|, k_eff·T² og skudstøjens ASD mod publicerede numeriske vektorer fra Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, fastlåst; gradiometer_qpn_line_matches_janvier_model)

seg-81802510f112 = quantum_imu::tests (a_max ligger ved ±π-halvfringe-kanten med 1/T²-skaleringen af rækkevidden; genskabelse af indpakket fase er eksakt inden for [−a_max,a_max] og aliaser med præcis { "2" }·a_max uden for det; det entydige dynamiske område a_max/σ_a=π/σ_Φ er identisk på tværs af to meget forskellige skalafaktorer for bølgelængde/T; CaiAccelerometer-metoderne stemmer med de frie funktioner)

seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

seg-60fb2adb58ce = budget_tests (bias mod AccelModel-integrator; VRW mod analytisk integral); tests/quantum_inertial_dead_reckoning_reference.rs (VRW mod en uafhængig numpy Monte Carlo-dobbeltintegration af hvid accelerationsstøj, værste afvigelse { "0.42" }% inden for ±{ "3" }% over { "6" } coast-tider; bias/skalafaktor mod en lukket værdi fra Groves { "2013" }; holdover-rundture)

seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form og cw_q_equals_the_spectral_separation_closed_form: Q-tabellen, CW og smalbånd { "1" }, bredbånd og swept { "2" }, fastlåst til de lukkede former i navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/effektiv C-N₀ mod en uafhængig numpy-genafledning af linkbudgettet i Kaplan & Hegarty §{ "9.4" }; reel JammerTest C/N₀ falder monotont gennem tærsklen på { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (præregistreret, blokeret, ikke kørt)

seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (karakterisering af TEXBAT-parametre); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (fastlåser fundet); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

seg-9cb72e60e080 = tpl

seg-b96e16aba41a = tpl::tests (lukkede referenceformer + CUSUM); examples/tpl_jammertest.rs (kalibrering med reel spoofing fra JammerTest { "2024" }); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (fastlåser fundet); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB for map-matching; IGRF-14-felt); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (benchmarken på 60 min uden GPS på det reelle EGM2008-felt af grad 70, præregistreret i xval/icgem-egm2008/: matchet { "3106" } m, så tærsklen < { "500" } m er NOT MET og fastslået som ikke nået, og den tidobbelte reduktion af driften på { "70.6" } km er MET; samt Monte Carlo med seedet kortfejl); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel og tests/emag2_real_grid.rs (datastyret EMAG2v3-læser på et reelt udsnit; intet navigationsresultat påstås på det); tests/terrain_slam_rbpf.rs (fælles kortestimering, en RBPF i FastSLAM-stil, mod SITAN med kendt kort ved en korreleret kortfejl på { "15" } m over { "20" } seeds, præregistreret i xval/terrain-slam-rbpf/: { "1.5" }% middelgevinst og bedre i { "10" } af { "20" }, så tærsklerne på { "10" }% og 12 af 20 er NOT MET og fastslået som ikke nået; ingen skade på et perfekt kort, MET)

seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (den genererede SBOM valideres uden fejl mod det officielle CycloneDX { "1.5" } JSON Schema over hele den udleverede graf med 66 komponenter: default + python + wasm features, dev-dependencies udeladt)

seg-e4edd8fd654c = impairment_eval::tests (AUC perfekt=1/identisk=0.5/uafgjort={ "0.125" }, ROC monoton, fusioneret>{ "0.8" }, separation af lag pr. klasse, lækagevagt, reproducerbart korpus, flag for distributionsskift tyder på optimisme); dominance_demonstrators (kan nås + reproducerbar + MODELLED-not-VALIDATED + optimismegab selvkonsistent)

seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

seg-b30ce36e7afb = impairment_study::tests (AUC≈{ "1" } for uafhængig reference pr. klasse, lært optimismegab>{ "0" }, gitterform + bootstrap-CI omslutter middelværdien + positiv skaleringstendens, ID-features endelige, gabprædiktoren slår forudsig-middelværdien under BÅDE leave-one-detector-out- og leave-one-class-out-CV + deterministisk); impairment_ml::tests (logreg adskiller + deterministisk + tab↓, MLP løser XOR, som en lineær model ikke kan + seedet); eval_stats::tests (bootstrap/DeLong/Spearman/ridge mod lukkede former)

seg-e0f68f57399d = quantum_trade::tests (ADEV-rundtursgenskabelse, NNLS-ikke-negativitet, gulvforbehold til stede/fraværende, fordel>{ "1" }, monoton envelope + alt-PNT-grænse); dominance_demonstrators (målt ADEV er datadrevet, ikke antaget gulv, antaget klasse flager gulv + forbehold, misdannet kurve afvist, MODELLED-not-VALIDATED)

seg-550bd3cee63e = space_weather::tests (Kp↔ap eksakt i gitterpunkter + rundtur + monoton, middel af daglig Ap, eksosfærisk T mod publicerede solmin/middel/max + ankre for stormtillæg, tæthed enhed-ved-reference, solcyklussvinget i det observerede { "5" }–{ "10" }×-bånd, scenarie reproducerbart + MODELLED-not-VALIDATED + afvisning uden for område); dominance_demonstrators (kan nås + reproducerbar + fysisk T + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

seg-80847ffc93bf = launch

seg-2095b880eb39 = launch::tests (opsendelse mod øst når i=bredde, KSC→ISS = lærebogens { "45" }°, polar = N/S, i<bredde kan ikke nås, { "465" } m/s ækvatorbonus, planskifte { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, antal daglige muligheder, scenarie reproducerbart/MODELLED + dogleg-sti); dominance_demonstrators (kan nås + reproducerbar + KSC→ISS { "45" }° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

seg-c763ac7e3cda = reentry::tests (maksimal g uafhængig af ballistisk koefficient + fysisk g-bånd, vokser ved stejlere γ / hurtigere indflyvning, hastighed ved maksimal g = V_e·e^(−1/2) og maksimal opvarmning = V_e·e^(−1/6) hurtigere, højde ved maksimal g fysisk + dybere for højere B, scenarie reproducerbart/MODELLED + afvisning af degenereret geometri); dominance_demonstrators (kan nås + reproducerbar + V_e·e^(−1/2)-andel + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (kun krydskontrol); tests/reentry_point_mass_accelerometer_oracle.rs (blokeret, ikke kørt)

seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

seg-c6fab6332435 = frugal (over walker)

seg-257dfa053c24 = frugal::tests (håndafledt omkostning pr. dækning 48/96={ "0.5" }, ROI-forhold { "2.667" }, rækkefølge af afgrænsning + værn mod nuldækning)

seg-412105b0f541 = integrity_impact (over raim)

seg-35bc1db56d2a = integrity_impact::tests (den samme manglende detektion vipper Available→MI→HMI, efterhånden som konteksten strammes; konservativ-PL→Unavailable; HMI pr. akse; inputværn)

seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

seg-061a65493a4a = inertial::cai_params::tests (fysisk VRW ligger inden for den citerede VRW-afgrænsning på alle { "3" } niveauer; rå rækkevidde for fringe-tvetydighed beregnet ud fra k_eff·T²; konservativt budget driver mere end bedste; hver afgrænsning har kilde + bekræftelsesflag; værn mod rækkefølge af afgrænsning)

seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (fire områder + inklusive grænser + |fejl| + PL>AL-utilgængelighed); tests/tib_scorer_reference.rs (klassifikationsantal mod uafhængig numpy på et fast syntetisk sæt)

seg-60f627e001ad = src/benchmark/coverage.rs::tests (ren/under-afgrænset/alt-utilgængelig/tom); tests/tib_scorer_reference.rs (antal + rater + coverage_ok mod numpy til { "1e-12" })

seg-6b48be996d76 = src/benchmark/faults.rs::tests (offsetprofiler, monoton coast, markering af uopdagelig mængde, max_offset-konsistens, præcis to uopdagelige klasser)

seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (reference-PL absorberer; ødelagt PL uabsorberet-aldrig-opdaget; dom om dækning af detekterbare; den ærlighedsegenskab, at ingen dom om dækning/detektion kan nås for et uopdageligt scenarie)

seg-6d963d838eed = hybrid_integrity::tests (den opløste konfiguration gengives for standardværdier og for tilsidesættelser, uden at bølgelængden sendes rundt gennem meter; hver post i units bærer både en enhed og en proveniensklasse; hvert felt, som units-blokken nævner, udsendes faktisk, så den ikke kan dokumentere et spøgelse)

seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

seg-188ab5b1b2e9 = hybrid_integrity::tests (tilgængeligheden er lig produktet af de to indikatorer genberegnet ud fra rapportens egne marginer, og disse marginer samles selv igen ud fra rapportens egen EIRP, frirumstab, samlede tab, kvalitetsmål, Boltzmann-led, datarate og krav til { "1e-9" } dB; værdien måles til at være { "0" } eller { "1" }, mens den optiske tilgængelighed i samme kørsel måles til at ligge strengt mellem dem; hver faktorrække bærer en proveniensklasse fra det lukkede ordforråd i field_schema; den rapporterede lukkeafstand kørt igen gennem linkbudgettet giver en margin på { "0" } til { "1e-9" } dB og måles til at være uafhængig af den afstand, kørslen lå ved, over fire dekader, mens afstandsudnyttelsen flytter sig med præcis afstandsforholdet; et -40 dBW-link rapporterer tilgængelighed { "0" }, LOST, og en udnyttelse over { "1" } frem for en brøkdel; den afløste note 'no RF-availability counterpart is computed by this engine' er fastslået fjernet, og erstatningen er fastslået at navngive det nye felt; et misdannet RF-input afvises frem for at blive afskåret)

seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

seg-d3a72a60b237 = hybrid_integrity::tests (forholdet er lig de to udsendte ben divideret, til { "1e-15" } relativt, og dets reciprokke og decibelformer stemmer; hvert bens afstand og tidssigma er forbundet med præcis c; den udsendte fælles konfiguration er fastslået lig scenariets egen afstand og integrationstid, og RF-benets afstand er fastslået lig det optiske bens; RF-benets C/N0 er bit for bit tilgængelighedsblokkens, fra ét linkbudget, ikke en genafledning; egenskaben LIGE-FOR-LIGE er MEASURED frem for fastslået -- en firedobling af den fælles akkumuleringstid halverer det optiske ben til { "1e-12" } og RF-benet til { "1e-7" } og lader forholdet stå uændret til { "3.19e-9" } relativt, hvilket et ben, der i hemmelighed midler over noget andet, ikke kunne gøre; en tilsidesættelse af rf_dll_bandwidth_hz, der bryder den fælles middelværdidannelsestid, gør forholdet null med en begrundelse, der navngiver begge tider, mens begge ben stadig udsendes; en envejskørsel gør sammenligningsbenet bit for bit lig den udgivne hovedværdi med en straffaktor på præcis { "1" }, og en tovejskørsel gengiver straffen 0.5/sqrt(geometrisk tab på returvejen) genberegnet ud fra rapportens eget geometric_loss_db til { "1e-12" })

seg-7f3efc1e9fa0 = linkbudget

seg-da19fa334661 = linkbudget::tests (over tre bånd, fire dekader af afstand og begge lukkedomme genberegnes marginen og frirumstabet under den ud fra rapporten alene til bedre end { "1e-9" } dB; det krævede G/T samlet ud fra ligningsleddene stemmer med den samme størrelse nået som G/T minus margin, og en ny kørsel ved det nulstiller marginen; tre budgetter med vildt forskellig EIRP, tab og tærskel men en ens linkkonstant giver et identisk krav, mens { "1" } dB på konstanten flytter det præcis { "1" } dB; opdelingen af forstærkning er fraværende, medmindre en støjtemperatur er angivet, og en ikke-positiv afvises; hvert felt, som units-blokken nævner, udsendes faktisk)

seg-d9742b5a3a48 = lunar_time_budget::tests og lunar_time_budget_scenario::tests (alle fire klasser til stede i én kørsel og i en anmodet delmængdes rækkefølge; hver række stemmer med sin egen lukkede form til bedre end { "1e-12" } relativt; skalering af rammefejlen med k skalerer krydsningen med k for et flicker-FM-ur og med k^{ "2" } for et hvid-FM-ur, kontrolleret ved k={ "2" } og k={ "3" }, hvilket adskiller de to støjklasser; hver række gengiver den enkeltur-krydsning, budgettet allerede rapporterede; hver række genfinder det ene delte rammeled; et ukendt urnavn afvises)

seg-024dfb3684f1 = antenna

seg-7e64cec1882e = antenna::tests og attack_surface::tests (gitteret er fuldstændigt, og hver fanget brøkdel ligger i [{ "0,1" }]; fanget brøkdel er ikke-aftagende i sendeeffekt i hver knude; den er IKKE monoton i lobebredde eller højde, hvilket er fastlåst af sin egen test, så fejningen ikke senere kan udglattes; baseline-knuden gengiver den eksisterende fangede brøkdel bit for bit; evalueringen kun af randen er bit-identisk med den fulde fejnings sidste punkt; en lokaliseret krydsning ligger på tærsklen til { "1e-9" } dB og er omsluttet)

seg-d804d9874191 = lunar_time_budget_scenario::tests (alle { "57" } middelværdiintervaller x { "8" } led til stede, gitterindekset løber { "0" }..={ "56" } og bærer { "8" } rækker hver; rækken <c1/> er lig kvadratroden af kvadratsummen af de syv led ved siden af den ved hvert tau; tabellen følger et anmodet gitter frem for et hårdkodet; udsendelsen af den lader rapportens JSON være byte-identisk)

seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: med styring slået fra er urleddet lig budgettets urled til sidste bit for alle fire klasser; bisection_matches_the_closed_form inden for { "1e-9" } relativt for begge støjklasser; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: standarddokumentet, tabellen og oversigten er uændrede, og blokken tilføjer kun sit eget objekt og sine units; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: optisk < PHM < RAFS < miniRAFS fra { "1" } s til { "7e5" } s, hvor kurverne for PHM og RAFS krydser mellem { "7e5" } og { "8e5" } s, fastlåst som en oplyst egenskab ved urmodellerne med én støjtype; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

seg-71c4fb3e4d08 = lunar_vlbi::tests (fjernfeltsgrænsen stemmer med delta_dor; nærfeltskorrektion; FD-partielle afledte); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } lib-tests: Jordens randhalvvinkel mod dens lukkede form asin(R/r) med en yderligere påstand om, at ENHVER uokkulteret link ligger uden for den kegle, så okkultationstesten og randvinklen ikke kan være uenige; okkultationsprædikatet kontrolleret på nærsiden, fjernsiden og i tilfældet, hvor legemet ligger BAG senderen; stitab afgrænset til det plausible bånd for månens afstand på hvert link; det sporbare sæt vist at være en delmængde af det geometrisk synlige sæt og disjunkt fra det okkulterede; monotoni i begge retninger - mere modtageforstærkning reducerer aldrig antallet, en strengere tærskel hæver det aldrig; intet link krediteret med mere end boresight-forstærkning; en modtager inde i Jorden afvist; fejningen fastslået at VARIERE med epoken; og tilgængelighed af signal mod positionsbestemmelse fastslået som adskilt, korrekt ordnet og konsistent med rækkerne pr. epoke); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (fastlåst); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (fastlåst fund)

seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (tærskel O1: tilstandsovergangsmatricen kædet over tre dage og over én periode er lig scipy DOP853 til en relativ { "1e-6" }; tærskel C1: middel-q og andelen inden for 95 %; tærskel C2: stikprøve over formel trace for hver estimator; tærskel C3, NOT MET og fastlåst: med { "3e-10" } m/s2 umodelleret acceleration er overskridelsen af 95 % { "0.0525" }, ikke mindst { "0.5" } - estimatet om bord kendes kun til hundredvis af meter, så omkring ti meters forskydning gemmer sig inden for dets kovarians); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

seg-2d4d23841d56 = lunar_infra::phase; lambda

seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (tærskel Q1: Monte Carlo-succes mindst bootstrap-grænsen minus tre standardfejl; Q2: intet fald med buelængde ud over tre standardfejl; Q4: LAMBDA er lig brute-force-optælling for { "200" } træk med dimension op til fem; Q3: float-designet er lig en uafhængig numpy-løsning til { "1e-9" } for kovarianserne af tvetydighed og position, og den bootstrappede rate er NOT MET ved { "1e-9" }, fastlåst: den afviger med en relativ { "1.7e-6" }, fordi LAMBDAs normalfordelingsfunktion er en tilnærmelse af Abramowitz og Stegun)

seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (tærskel F1: CRLB-sporet stiger ikke, og den mindste egenværdi falder ikke med links fra orbiteren, i eksemplet og i { "20" } seedede tilfældige sæt; tærskel F2: afstandenes partielle afledte er lig en uafhængig numpy longdouble-endelig-differens af Rodrigues-fremadmodellen på { "50" } geometrier; tærskel F3: den mindste egenværdi stiger med mindst 2.0x, fundet omkring 111x)

seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (tærskel T1: translationssigmaer falder ikke, når det lokale bånd løsnes; T2: med teknikkernes sigmaer skaleret med { "1e-6" } ligger hvert pars translationssigma inden for { "1" } % af sqrt({ "2" }) gange sigmaen for det lokale bånd, fundet inden for { "3e-7" }; T3: informationsmatricen er lig en uafhængig numpy-stakket sammensætning til { "1e-9" }). Den første T2-kørsel med inversion af normalligninger blev ikke nået ({ "1.3" } % ved et bånd på { "0.1" } m, værdier under gulvet ved { "1" } m); årsagen var numerisk, og kovariansen blev flyttet til kvadratrodsvejen, før tærsklen blev scoret igen.

seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (tærskel G1: analytiske partielle afledte er lig en central endelig differens af hver fremadmodel til { "1e-8" }; G2: 5x5-informationen er lig en uafhængig numpy-sammensætning til { "1e-6" }; G4: urets tidevandsamplitude og dens følsomheder over for k2 og h2 er lig en uafhængig evaluering til { "1e-9" }; tærskel G3 NOT MET i sin sporhalvdel, fastlåst: tilføjelse af en familie sænker aldrig den mindste egenværdi ({ "28" } af { "28" }), men pseudoinversens spor steg i { "12" } af { "28" } tilføjelser, fordi den tilføjede familie hævede rangen)

seg-2e097e952eb5 = lunar_beacon::tests (horisontsynlighed mod den lukkede form L01; den beacon-udvidede DOP mod den bare; kvadratrodssummen af fejlbudgettet; relationen DOP-til-meter); tests/validate_p2_beacon_before_after_table.rs (hele tabellen før/efter fastlåst til en committet golden ved { "1e-9" } relativt); tests/validate_p2_beacon_before_after_independent_dop.rs (den samme geometri gennem en UAFHÆNGIG DOP-sti, så udvidelsen ikke kontrolleres mod den kerne, der frembragte den); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

seg-f8ac8be96a63 = cmpl_horizontal afgrænser den horisontale positionsfejl (k-sigma), som den blinde fælles-mode-klasse bidrager med, ved at danne blind_position_covariance = S<em>Cov</em>S^T og projicere den ind i ENU; integrity_envelope rapporterer hpl_total = hpl_araim + cmpl. Det skel, som parret findes for at tydeliggøre: RAIM/ARAIM-RESIDUALTESTEN er bevisligt blind over for fejl i range(G), men ARAIM-BESKYTTELSESNIVEAUET er ikke - dets fejlfri led afgrænser dem allerede op til en udbyders URA plus nominel bias. CMPL er derfor kun det udbyderoverskridende OVERSKUD, som en enkelt udbyders URA/ISM pr. udbyder ikke overafgrænser, og summen er en konservativ trekantsulighedsgrænse og ikke en RSS, som kun gælder, hvor dette overskud ikke allerede ligger inden for URA.

seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

seg-e927515cc210 = lunar_combination::tests (rangdeficient uden jordbaselines; tre baselines genopretter fuld rang — 3-stationstærsklen ud fra informationsrangen, ikke ud fra løsningsfejl; stationens CRLB nås af estimatoren ved effektivitet { "0.98" }; CRLB bliver monotont strammere med baselines); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (IS-GPS-800J-indekser)

seg-d111b6550515 = lunar_afs::codes::tests (registre med maksimal længde, Legendre-balance, G2-forsinkelsens rundtur, niveausammensætning); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (uden LSIS-cachen: fire citerede tal fastlåser fundet; med den: { "2 937 232" } chips og bits mod LSIS-filerne i bilag { "3" }, trykte første/sidste { "24" } chips, Legendre-tabellerne D-1 og E-1 og G2-initialiseringerne giver præcis ét afvigende punkt, cellen 'sidste { "24" } chips' for PRN { "147" } i tabel E-5, som duplikerer PRN { "151" }s, mens filen i bilag { "3" } stemmer med generatoren); den strenge præregistrerede test afs_codes_match_lsis_v1_tables_and_annex3_bit_exact er ignoreret med dette hul

seg-8cd700abad59 = lunar_afs::waveform (optagelse og reference-labels), xval/lunar-afs/run_pocketsdr.sh

seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (tredje præregistrering: { "2" } noder, { "4" } kanaler sporet, værste Doppler-fejl { "0.57" } Hz, værste kodeforskydningsfejl { "0.008" } chip, alle { "6" } rammer afkodet med den rigtige TOI hen over overgangen { "99" } -> { "0" } og med matchende underramme { "2" }; G0 ikke nået, som den er skrevet, modtagerens egen kørsel-til-kørsel-variation i dens erhvervelsesposter); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (anden: { "5" } overtrædelser); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (første: ugyldig); de strenge tests i de tre filer er ignoreret med deres huller

seg-9b511cb035c0 = gps_lnav, sdr

seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (fastlåst fund); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (streng, ignoreret med hullet); gps_lnav::tests

seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (fastlåst fund); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (streng, ignoreret med hullet)

seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } på angivne hændelser, der ikke dæmper noget); r1_the_cn0_drop_roc_separates_6_db_attenuations (streng, ignoreret med hullet); iq::campaign::detect-tests (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (fastlåst fund); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (streng, ignoreret med hullet)

seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satellitter i IGS-broadcast-filen fra { "2" } marts { "2025" }: { "960" } af { "960" } ord består RTKLIB-pariteten, { "96" } af { "96" } underrammer afkodes, { "608" } af { "608" } afkodede broadcast-heltal er lig med Kshanas, hvert input inden for et halvt kvantum, uge og tider eksakte); gps_lnav::tests

seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (fastlåst fund, datastyret); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (streng, ignoreret med hullet); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

seg-709106f38b9d = acquisition, realdata::ion_sdr

seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (fastlåst fund, datastyret); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (streng, ignoreret med hullet)

seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (fastlåst fund, datastyret); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (streng, ignoreret med hullet)

seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (fastlåst fund, datastyret); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (streng, ignoreret med hullet)

seg-b4e5e57515cc = lunar_dpnt::tests (urets fælles mode ophæves eksakt; residualet vokser med baselinen; genbruger SBAS PL; satellitantallet respekteres op til bygherrens grænse på { "24" }, så en større konstellation ikke i stilhed kan give en mindre); tests/lunar_differential_pnt_reference.rs (enkeltdifferens-residual + WLS-positionsløsning mod RTKLIBs lsq() kompileret fra C-kilde)

seg-6a567344f386 = lunar_interop::tests (OEM bærer lunar REF_FRAME/TIME_SYSTEM; tidsmetadata gør rundturen; KIF-envelope); tests/lunar_interoperability_export_reference.rs (kshanas udsendte lunar-OEM genparset af det uafhængige Python-bibliotek <c1/>: tokens REF_FRAME/TIME_SYSTEM/CENTER + tilstand pr. epoke til formatets præcision; en ødelagt eksport afvises); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

seg-921e4d47fd96 = resilience::score::tests (monotonicitet, grænser for det sammensatte tal, niveaubegrænsning, modelleret proveniens); resilience::diversity::tests (invers-Simpson, fælles mode, SPOF)

seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

seg-0e1bd42aca5a = resilience::stats::tests (Kendall-tau-håndeksempel, Dirichlet-simplex, flip-rate); resilience::study::tests (stabilitetskontrol, ustabilitetsvidne, erklæret-mod-målt, diversitetskollaps)

seg-246c5acb36ac = representativeness

seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, JSON fields)

seg-03c943a8f1fc = qtrade

seg-2d5a97db03cb = qtrade::tests (benefit polarity higher/lower-is-better, wraps a real TradeResult faithfully, dishonest evidence rejected, validated-FoM needs external anchor, deterministic JSON)

seg-fe77856b9e9d = quantum_devices::tests (clock cards honest+ordered; entanglement precision ~1/sqrt(tau); detected rate -10x/10dB; dark counts degrade; systematic floor bounds; card modelled+valid)

seg-65f4bc801f94 = timetransfer_chain::tests (precision improves with integration; quantum can win AND lose; PL finite-positive; security FoM in [{ "0,1" }] and grows with attack delay; anomaly Pd monotone; trade is_honest)

seg-52d8ccc852f8 = quantum_nav_od::tests (quantum beats classical over a long outage; advantage is outage-dependent; trade is_honest); tests/gnss_free_quantum_navigation_reference.rs (dead-reckoning position growth vs an independent Octave double-integration + the Freier-2016 published noise anchor)

seg-8e49ee940482 = quantum_faults::tests (analytic AUC known values; empirical bootstrap AUC brackets the closed form; quantum detects smaller faults / higher AUC; advantage vanishes for huge faults; 5-class catalog; trade is_honest)

seg-d0119a3cb762 = geolocation

seg-f85f780a9859 = geolocation::tests (noiseless TDOA forward→inverse to { "1e-6" } m; J·CRLB=I with a symmetric PD covariance; the CRLB position-variance trace is non-increasing when a receiver is added; joint TDOA+FDOA recovers a moving emitter's position+velocity; <{ "4" } receivers rejected); tests/geolocation_reference.rs (round trips over four geometries with a 3-D-diverse network; the Gauss–Newton estimator attains its Cramér–Rao bound — empirical error covariance tracks the analytic bound over { "4000" } Monte-Carlo trials); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound and finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, pinned)

seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (registrerer { "746" } W/cm2 for Stardust uden tærskel)

seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

seg-998c0585be86 = twstft_budget::tests (the two-way equation recovers the offset exactly; the Sagnac term equals the BIPM loop closed form; the ionospheric term follows the frequency split and the troposphere cancels; flicker phase has a flat TDEV; a diurnal residual lifts TDEV near half a day; a reciprocity bias shifts the offset and not the TDEV; series stability removes a rate); time_transfer_budget::tests

seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (præregistrerede tærskler A1-A3 mod den uafhængige mpmath-reference: { "216" } Rytov-gitterpunkter, værste relative fejl { "3.4e-7" } mod en tærskel på { "1e-6" }, scintillation værst { "4.5e-16" }, aperturfaktor værst { "5.7e-16" }, { "96" } gamma-gamma-fadingsandsynligheder værst { "1.3e-12" } i log10, skyers og klarluftens optiske dybde værst { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (tærskel A5: linkbudgettet med samlet tab og de eksisterende outputs for stedets tilgængelighed er bit-identiske med basis-committen over { "1,000" } parametersæt)

seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (tærskel A4: rho = { "0" } er lig med den uafhængige union og rho = { "1" } det bedste enkelte sted til { "1e-12" }, og nul monotonicitetsovertrædelser i antallet af steder og i korrelationen; den første kørsel af denne tærskel missede med { "3e-9" }, fordi den normale CDF i brug var Abramowitz-Stegun-formen på { "1.5e-7" }, en implementeringsdefekt, der blev erstattet af den ufuldstændige gamma-CDF med uændret tærskel); optical_weather::tests og optical_sitediv::tests (monoton margin, skyloftet som lukket form, udfaldsvarighedsidentiteterne, inversion af marginsøgningen)

seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (tærskel A6: tidssynkroniseringsfejlen pr. udfald er lig med holdover::coast_phase_sigma, og afstandsfejlen er lig med phase_to_range_m bit for bit over { "9" } ure, { "3" } middelvarigheder, { "3" } spredninger og { "4" } kvantiler); optical_outage_holdover::tests

seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (tærskler T1-T6 i xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fastsat før den første kørsel: samme seed giver samme bytes og en anden seed andre bytes; ingen nøgle uden tabellen; over { "8760" } h ved { "600" } s, seeds { "37" } og { "38" }, ligger den realiserede tilgængelighed for hvert af de tre standardsteder inden for { "6" } point af den angivne (værst { "3.3" }), og den realiserede skyandel inden for { "5" } point af den angivne sandsynlighed (værst { "2.1" }); marginen er lig med budgettet minus de to fadings, og up er lig med margin ikke negativ i hvert trin; intet ikke-portabelt matematikkald i modulet; for lange kørsler og dårlige trin afvist)

seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (en reel MRO ODF, 2007-304/305, mod sin PDS-label: antal poster, gruppepositioner, stationer, start- og stoptider og datatyper holder; antallet af rækker i slutningen af filens tabel missede med én, en label-inkonsistens, fastlåst som et fund); odf::tests (håndbygget postrundtur, epoke { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (datastyret, inputs SHA-256-fastlåst, månedlig CI med reelle data påkrævet: Doppler forudsagt ud fra MRO-navigationsrekonstruktionen mro_psp5 på de scorede passager DSS { "63" } og DSS { "14" }, { "12.5" } mHz RMS, tærskel { "30" } mHz, nået; den registrerede banebestemmelse gav ingen bane, fastlåst som et fund; kørsel { "2" } med en dæmpet estimator, separat registreret: bane { "0.36" } km RMS og { "0.53" } km maksimum mod mro_psp5, nået, post-fit Doppler { "48.6" } mHz mod { "30" } mHz, ikke nået, fastlåst som et fund; SPK type { "1" }-læser mod CSPICE, { "5e-7" } m); mars_od::tests

seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } seeds, mean six-degree-of-freedom NEES over the second half within { "4.5" } to { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

seg-4da98593fe6a = aperture_duty::tests (et vindue, der ender præcis når det næste begynder, konkurrerer ikke, og at flytte det ét sekund tidligere koster præcis ét sekund — off-by-one-vagten; overlappende vinduer ud over antallet af aperturer sætter den lavere rangerede session i udfald, med konkurrenceintervallet fastlåst; arbitreringspolitikken afgør, hvilken service der har aperturen, med alle tre politikkers tal fastlåst på én plan; først-til-mølle præemptér ikke en session, der allerede har en apertur; en session, der taber arbitreringen ved sin start, erhverver en apertur, når en bliver ledig; de tre belastninger regner for hvert tilgængeligt aperturssekund over { "3" } politikker × { "4" } antal aperturer; at tilføje en apertur øger aldrig nogen sessions udfald, målt over { "200" } pseudotilfældige planer × { "3" } politikker × hvert antal aperturer; nok aperturer til hver session efterlader slet intet udfald; rapporteringshorisonten klipper planen og sætter nævneren for belastningen; en forudsagt passageliste bliver en kontaktplan uden en anden vinduestype; den medfølgende plans belastningstal er motoroutput for én og to aperturer; rapporten angiver den politik, der gav tallene; hvert rapporteret tal bærer en enhed og en proveniensklasse; scenariet kan gengives og erklærer sig selv MODELLED; scenariet afviser en plan, det ikke kan skemalægge); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } lib tests: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } lib tests: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

seg-83724a2a8e06 = hybrid_integrity::tests (the detection-power curve runs from the false-alarm rate at zero fault to { "1" } − P_md at the minimum detectable bias; the minimum detectable bias fed back through noncentral_chi2_cdf at the threshold the monitor itself applied returns P_md to { "1e-9" }, on every axis and through the public helper; a bias actually injected into the RF estimate shifts the monitor's own statistic by exactly the hand-computed b²/(σ_rf² + σ_opt²); a noise-free bias is caught above √(T/λ*)×MDB and missed below it, with the injected ladder straddling that crossing; detection power is monotone in fault magnitude and identical on all four axes in MDB multiples; a seeded 200,000-sample Monte-Carlo of the monitor statistic reproduces the analytic power within 4σ at four points on the curve; the timing MDB is pinned above the timing alert limit, which is a measured weakness and not a feature; the Wilson-Hilferty quantile is measured to disagree with the monitor's exact threshold by ~{ "4" }%, recording why it was not used; the ramp figure is exactly MDB/rate and scales inversely with the rate, and a non-positive rate reports null rather than zero); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

seg-f9767a6109d5 = hybrid_integrity::tests (the coast starts from exactly the covariance trace the handoff block reports, for both directions, so the replayed diagonal cannot drift from the reported handover; the reported crossing time is recomputed from the report's own handover sigma, process-noise PSD and coverage factor, and the bound is inside the alert limit just before it and outside just after; the coast time scales exactly inversely with the process-noise PSD and shortens when the alert limit tightens; a zero-PSD coast reports null rather than a zero time, because never is not immediately; the emitted profile crosses exactly once and brackets the reported crossing; the variance doubling time and the alert-limit crossing time are pinned apart, being eight orders of magnitude different after the tight optical stage and within one order of magnitude after the loose RF stage; leaving the optical modality buys more coast time than leaving RF, by exactly the covariance difference divided by the horizontal growth rate; and random_walk_time_to_limit separates already-outside, crosses-at-t and never-crosses)

seg-6d2b55212f40 = lunar_service, antenna

seg-730b359e2c3f = antenna::tests og lunar_service::tests (halv-effekt-krydsningen fundet ved bisektion på mønstret stemmer med det publicerede Airy x = { "1.61634" } og giver den eksakte bredde { "1.02899" }·λ/D, hvilket registrerer, at den konventionelle koefficient { "1.02" } ligger ved −{ "2.955" } dB og ikke −{ "3.010" } dB; mønstret er strengt aftagende over { "400" } punkter fra boresight til det første nulpunkt; den implicitte virkningsgrads algebra gør rundturen til { "1e-12" } og gengiver { "0.641" } / { "0.920" }; off-boresight-vinklen stemmer med tan θ = R·sin γ/(r − R·cos γ) i { "20" } punkter og begge grænser til { "1e-12" }; den approksimative kegle indeholder den reelle stråle række for række; overskriftstallene er lig med de flag pr. række, de opsummerer, og korrektionen er lig med deres differens; hver rækkes afgørelse kan genberegnes alene ud fra den udsendte rapport; hvert udsendt numerisk og boolsk felt har en enhed og en proveniensklasse; en umulig apertur udsender ingen blok; uden en konfigureret antenne beholder eksporten præcis sine seks eksisterende nøgler, { "0" } blade ændret og { "0" } fjernet); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

seg-9910640b7886 = tracking_loop (composing sdr, jamming)

seg-a3538a1ff1f4 = tracking_loop::tests (open-loop Costas discriminator jitter against sdr::correlate stepped forward on seeded synthetic IF, { "3" } pooled noise realisations × { "900" } epochs, agreeing to { "0.63" }% over 35-45 dB-Hz, with the squaring-loss term required to fit at least { "3" }× better than the no-squaring-loss form wherever it is resolvable; the ~{ "32" } dB-Hz atan-discriminator saturation asserted rather than merely stated, so the validity limit is pinned; closed-loop σ against a stepped sdr Costas loop over { "4000" } epochs to { "3.7" }%; first-order DLL ramp lag against a stepped sdr DLL to { "0.17" }%; bessel_i0 against tabulated I₀ to { "7.4e-8" }; the hysteresis width required to fall in [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] across { "4" } ratios × { "2" } integration times × { "3" } bandwidths); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

seg-e6236f142dae = lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)

seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } lib tests: every datum spelling round-trips through parse/as_str and an unknown one is refused; holding every station without the beacon is refused with an error naming <c1/>; the lever arm is asserted EQUAL to ρ/B and the beacon equipartition EQUAL to the station equipartition times it, both to { "1e-15" }, with a further assertion that the lever arm exceeds { "10" } so the two budgets are not confusable on this geometry; the fixture's published baseline is pinned to { "10726.748" } km and its 49-sample schedule asserted to yield strictly fewer than { "49" } mutually visible observations; the beacon spectrum on a single baseline is measured to span at least five decades and the resulting ratio asserted above { "1" } by AM-HM and above { "100" } in fact; the station-plus-beacon layout is asserted rank-deficient with BOTH computed fields null while the modelled comparand still reports. Plus a guard on the fixture itself: a top-level key spliced after an array-of-tables becomes station data instead, so the splice point is asserted and the parsed scenario checked to carry the key — the failure mode is a run that silently uses a different configuration from the one the test names)

seg-08708f044bb5 = lunar_dpnt::tests (a purely-additive guard whose key-set delta is exactly { "{" }correction_link, units{ "}" } with every pre-existing value bit-identical against literals captured before the change; survey error does NOT decorrelate with baseline while the orbit term does, and survives a zero baseline where the orbit term is exactly zero — the structural check that catches wiring the term into the wrong place; a { "1" } m station error transfers { "1" }:{ "1" } and is proved not DOP-amplified; zero latency reproduces the un-aged residual bit-for-bit and the residual is monotone in latency, with the emitted curve equal to direct runs; the quantization step halves exactly per bit and σ² = step²/12, and the full scale tracks the injected magnitudes; each term switched off in turn recovers the other two in quadrature; equal per-satellite σ propagates to exactly σ·PDOP and that PDOP agrees with orbit::dop; every emitted field carries a unit and a provenance class, checked in both directions)

seg-810a6946b5cd = lunar_station (over lunar_dpnt, lunar_service)

seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: to { "1e-12" } m with and without receiver noise; zero_baseline_floor_is_zero_in_every_trial: { "0" } to { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 within the { "5" } % band stated before the run; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (the pre-registered numpy re-computation, recorded with its miss); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs and the registry and cross-platform goldens unchanged (additivity); tests/field_units_global.rs (every emitted field described, no exemption)

seg-641b41572fd9 = lunar_terrain (over skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: the ray march reproduces -acos(R / (R + a)) to { "1e-3" } deg at every azimuth; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: the same cone sampled onto a { "0.005" } deg latitude/longitude tile agrees with the analytic cone to { "0.25" } deg; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: a flat-floored crater on the sphere, observer at the centre and { "4" } km and { "7" } km off it, against the closed-form rim elevation atan2((R + H) cos s - (R + a), (R + H) sin s) with s from the spherical rim-crossing equation, to { "0.01" } deg at every azimuth; rasterised_cone_matches_the_analytic_cone: a cone rasterised onto a { "200" } m polar stereographic grid and read through the grid sampler agrees with the analytic cone to { "0.25" } deg; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, for both kinds; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 keeps its flat count and the epochs a horizon costs are terrain_masked (availability itself can rise, because a horizon can hide a satellite the station does not see), and an { "89" } deg horizon at the station leaves nothing available; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: Shackleton and Haworth crater floors low, the Malapert massif high, the mirror image not; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: a tile resampled from the vendored crop gives the station the crop horizon to { "0.22" } deg (bound { "0.5" } deg, fixed before the run), with the tile echo and units, and dem_path with dem_tile_path refused; the_export_site_is_masked_by_the_terrain: every export row clears the terrain exactly when it is visible and at or above the site horizon at its azimuth, the geometry does not move, the CSV gains the column only with terrain; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs and the registry and cross-platform goldens unchanged (additivity)

seg-27acdf36c5da = lunar_receiver; lunar_station

seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m ved { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: stikprøve-sigma sqrt({ "2" }) a inden for { "6" } %; station_multipath_is_gauss_markov: lag-1-korrelation exp(-dt / tau) inden for { "0.01" }, enhedsvarians inden for { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs og goldens uændrede (additivitet)

seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: linkfejlen med vækst slået til minus linkfejlen med vækst slået fra har stikprøve-sigma rate tau / sqrt({ "3" }) inden for { "6" } % over { "1600" } træk; linear_growth_is_the_first_order_propagated_error: en hastighedsfejl dv propageret med den interne tolegemeintegrator fra scenariets bane flytter positionen med dv tau inden for { "1" } % ved { "60" } s og { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignoreret, det registrerede tillæg)

seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: equals lunar_dpnt::position_error_vector_from_range_errors to { "1e-8" } m, a loose height row changes nothing, a tight one pins the height error; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: every figure to { "1e-6" } relative; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignoreret, det registrerede tillæg)

seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (de registrerede tal mod de registrerede tærskler); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignoreret, omkring { "7" } s i release: kører de seks registrerede tilfælde igen og hævder de registrerede tal)

seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, den ikke-overvågede risiko inden for P_THRES, en delmængde, der fjerner tre eller flere satellitter, overvåget, og mere end ti overvågede priorer uafhængigt genudledt som P_no fault q^k til { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: ingen alarm fejlfrit, og en bias på { "30" } m på to satellitter detekteret med parret som den delmængde, der har den største normaliserede separation); tests/araim_reference_vectors.rs og tests/integrity_araim_stanford_oracle.rs uændrede (orden 2-stien er den MAAST-kontrollerede)

seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: holdover-tal uændrede, { "111" } afviste epoker utilgængelige uden beskyttelsesniveau, afvist med runs > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: hver samplet epokes HPL og VPL er eksakt lig med en nulresidual-snapshot_raim på den samme forudindstillede himmel, og den fejlfri kørsel rejser ingen alarm; a_stated_bias_is_detected_while_it_lasts: en bias på { "60" } m alarmerer på præcis de { "10" } epoker, den dækker; every_integrity_field_has_a_unit); clock_integrity::tests; ur-goldens uændrede

seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

seg-02de44e48cf6 = cislunar_observability::tests og observability_gramian::tests (standarddokumentet fastlåst bit for bit af FNV-1a af dets JSON, summary og SVG, med eksplicitte standardværdier hævdet at være en no-op og de otte udvidelsesnøgler hævdet FRAVÆRENDE, så optagelsen ikke kan regenereres til en selvsammenligning; den additive <c1/>-blok udeladt fra frysningen ved at blive strippet og hashet igen mod den konstant, der blev fastlåst, før den fandtes, hvilket beviser og ikke antager, at intet udgivet flyttede sig; rang-invarians under homoskedastisk sigma hævdet ved σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos hævdet at skalere eksakt lineært med σ til { "1e-6" } relativt; DRO-nulrummet hævdet at være præcis koordinatakserne z og ż med de to årsager adskilt — en afstandsrække mellem koplanare rumfartøjer har û_z = { "0" }, og CR3BP's udenfor-plan-blok afkobles eksakt ved z = { "0" }; rumlige Jacobianer mod centrale finite differenser og mod cratens uafhængige 3-D-afstandshastighedsobservabel; familier uden for planet afvist i plan-tilstand)

seg-455bea44de27 = frame_eop, realtime_frame_eop

seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests og tests/operational_eop_predictor_reference.rs (genfinding af analytisk-signal-koefficienter til { "1e-9" } ved et vindue på 365 dage; et bias-plus-rate-fit lig med den lukkede almindelige mindste kvadraters hældning og skæring til { "1e-12" } på reelle rækker; TO look-ahead-detektorer, der ødelægger de rapide UT1- og polkolonner i hver række efter udgivelsesepoken — og lader Bulletin B-finals intakte — og kræver bit-identisk output, mutationsverificeret til at gøre { "10" } tests røde, når fit-barrieren løsnes med præcis én dag; en uafhængigt genopbygget epokeliste; et måls Bulletin B-blok blanket ud og epoken vist at forlade tabellen; termadgang kontrolleret ved vinduer på { "6" }, { "15" }, { "150" } og 365 dage; monotone rækkeantal; og en frossen optagelse af standardrapporten fra før ændringen, hævdet felt for felt uden tolerance, som desuden hævder, at optagelsen ikke indeholder de nye nøgler, så den ikke i stilhed kan regenereres til en selvsammenligning); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (den tilvalgte EopSeries::with_ls_ar_prediction-udvidelse ud over den sidste række: svar inden for tabellen bit-identiske, prognoserækker lig med ls_ar_predict, rammeargumenter efter tabellen følger prognosen i stedet for at klemmes; intern konsistens)

seg-c77bd56a0619 = lunar_frame_campaign (composing lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

seg-457a19842691 = cislunar_arc_recovery::tests og tests/cislunar_arc_recovery_reference.rs (begge grænser og deres forhold fastlåst på det publicerede gitter; den målte fejlkurve sammenlignet med den formelle kovarians række for række med en grænse på en faktor to pr. række og en grænse på det geometriske middel; en NEGATIV KONTROL — planar-DRO-seks-tilstanden — der hævder, at kriteriet KAN fejle, og at den uregulariserede estimator divergerer ud over { "1e6" } km i stedet for at returnere en plausibel lille fejl; parameteriseringsinvarians hævdet på hvert præfiks til { "1e-3" } relativt; en kildetekstvagt, der fjerner kommentarer, strengliteraler og testmodulet og derefter fejler ved enhver omtale af Jacobi-matricen, STM, SVD-rang eller SRIF-maskineri, mutationsverificeret ved at indsætte et forbudt kald; en kontrol kun i testen af, at de finitte differenser er lig de analytiske rækker, så linearisationen vides at være god, mens den analytiske rute forbliver fraværende i estimatoren; determinisme hævdet byte for byte; det udgivne cislunar-observability-dokument fastlåst ved nøglesæt, kanonisk fingeraftryk og oversigtslinje)

seg-b6b73589032f = lunar_ephemeris, lunar_service

seg-4cab37e82f00 = lunar_ephemeris::tests (format- og referencesystemparsing; Lagrange-interpolation nøjagtig i knuder og på et lineært spor uden for knuderne; ICRF-elementer følger IAU { "2015" }-reduktionen og er byte-ens med en eksplicit anvendelse af icrf_to_iau_moon; sand↔middel anomali frem og tilbage mod en fremadrettet Kepler-løsning; fejlformede filer afvist med angivelse af årsagen). lunar_service::tests (med <c1/> ikke sat er rapportens nøglesæt og SHA-256 fastlåst; Kepler-rækken er lig den selvstændige Kepler-kørsel felt for felt; identiteten σ_required · HPL_max / σ_URE = AL, derefter en END-TO-END-gentagelse ved det beregnede krav, der når { "100" } % tilgængelighed af beskyttelsesniveau, og en gentagelse { "1" } % over det, der ikke når det; hvert udsendt numerisk felt i begge nye blokke gennemgået i det producerede JSON for en enhed og en proveniensklasse; de committede fixtures afstemt med deres kildetabeller satellit for satellit; en horisont ud over slutningen af en tabel afvist); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

seg-34bff3218a01 = tests/field_units_global.rs (alle { "61" } registrerede kinds køres, én dokumentform hver: hvert numerisk blad skal kunne opløses til en post i dokumentets egen units-blok; en fejlformet post tæller som manglende for HVER kind, undtaget eller ej, så en pladsholder køber ingen dækning; undtagelseslisten må ikke overstige sit fastlåste loft, en opført kind, der viser sig at være fuldt dækket, MISLYKKES i porten, så listen ikke kan fyldes ud, og en registreret kind, der mangler i kørselstabellen, fejler, så en ny pakke ikke kan smutte ind uden at blive undersøgt — hvilket den gjorde, og det fangede begge de kinds, der blev tilføjet, efter dette arbejde var begyndt; en envejsskralde på den beskrevne-men-udefinerede restance; og en forældelseskontrol på det committede skemadokument); field_schema::tests

seg-926c069f8a2e = lunar_llr (over lunar_frame_campaign::beacon_information, schedule_for and solve_datum_information, lunar_vlbi_fim)

seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: tomme lister og baseline-eksemplet giver standardrapporten og oversigten byte for byte; an_added_site_never_increases_any_variance: den mindste egenværdi af H_after - H_before er ikke-negativ til { "1e-9" } af den største, hvert forhold mellem sigma efter og før er højst én, og begge tilføjede steder observeres; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml og scenarios/lunar-station-geodesy-with-station.toml (samme arkiverede plan og samme VLBI-kampagneblok)

seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

seg-94641c011229 = tests/source_guards.rs ({ "9" } tests: begge vagter over hele kildetræet plus mutationsfixtures, der bedømmer hver vagt i begge retninger — F22-mønstret rapporteret på begge kolliderende stier, den leverede atomare sekvensrettelse accepteret, en halv rettelse rapporteret på præcis den sti, der mistede sin unikke komponent, et tempfile-håndtag og en nedarvet unik mappe accepteret, et vægur afvist; en uerklæret fastlåsning rapporteret, en erklæret accepteret, et scope uden en udelukkelse afvist, en erklæring i den omsluttende tests doc-kommentar accepteret og vist ikke at sive over i den næste test; og hver fastlåsningsstavemåde — hex, decimal, digest-streng, bytelængde, navngivet bytetal, golden-fil — set, mens algoritmekonstanter, RNG-seeds og små kardinalitetskontroller ikke er det)

seg-416def055790 = integrity::composed_pl::tests (monoton, P0-gulv, K(IR/2), eksponenter, nedre semikontinuitet)

seg-3d4a4ed81148 = integrity::lil_envelope::tests (divergens, tærskel, dominans ved IR-skærpelse)

seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (datastyret: springer over med en meddelelse, når BIPM-serien mangler); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 runde { "3" }, prospektiv, endnu ikke kørt: Circular T { "465" } udkom 2026-10-12, og den præregistrerede regel om 1000 værdier kræver udgaver til omkring { "468" })

seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

seg-36da2dd8d3db = lunar_datum, lunar_identifiability

seg-12c2f3ad1982 = lunar_datum::tests (LLR/VLBI/orbiter analytiske partielle afledede mod finit differens); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)

seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - tomt udvalg giver nulmatricen, et enkelt udvalg er identiteten, et par er lig en uafhængigt skrevet elementvis sum, og resultatet er invariant under rækkefølgen af udvalget; adding_a_block_never_reduces_the_degeneracy_metric - monotoni under tilføjet information; radial_diversity_beats_transverse_for_breaking_the_degeneracy - orbiterblokken på bagsiden hæver degenerationsmetrikken mere end den transversale VLBI-blok)

seg-c5ebc071ce3e = lunar_interop_budget::tests (monotoni i budget; RSS-budgetreduktion under en CRLB pr. udbyder; gennemregnet rotationstolerance ved den lunare løftearm; bindende led = rotation)

seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris nulstiller budgettet; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } på de virkelige opdelinger; konventionsrækkefølge)

seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (blok forskellig fra nul, men med rangmangel ⇒ block_spark { "1" }, f_detect { "0" }; uafhængige kolonner ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (en peer, der ejer alle en nodes målinger = en urforskydningsfejl ∈ range(G), uopdagelig, med et tydeligt spektralt Gram-gab), byzantine_redundant_net_identifies_at_least_one (seks uafhængige peers med én måling hver ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (håndeksempler med P⊥ = I fastlåser f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (selvrefererende net: den fælles rate ligger i N(GᵀWG), temporal_gauge_dim { "2" }; efter én ekstern rate-tie-række: raten udstødt af gaugen, temporal_gauge_dim { "1" }, mens den fælles forskydning består)

seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (fælles bias uopdagelig, differentiel opdagelig), slope_infinity_in_range_finite_detectable (g7: hældning ∞ for b ∈ range(G), endelig for b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: rank(GᵀWG) = state_dim − { "8" }, den 8-dimensionale gauge er hele nulrummet med et spektralt gab på >{ "1e6" })

seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — åbne og lukkede ender, τ = { "400" } s-gabet i G.8271.1 tabel 7-3, kontinuitet i hvert knækpunkt, tabellerne indebærer; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (clock kind [clock_log])

seg-df411365b9ab = clock_log::tests (håndskrevne logs pr. format: headere, separatorer, enheder, frekvensintegration, TICC-kanaler og -tilstande, huller og politikker, afvisninger); tests/clock_log_allantools.rs (den præregistrerede sammenligning: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) på fixtures i tests/fixtures/clock_log/linuxptp_chrony/

seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

seg-05a12f571867 = ssv (limb, weak)

seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

seg-89cac0893981 = ssv::nav (run_nav, Ekf)

seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — den diskrete aldringsrampe inden for { "0.1" } % af (1/2)·D·t² over et døgn; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } GPS Block IIF-satelliture, { "14" } dage med IGS' endelige ure: { "8" } inden for tærsklen på { "1.5" }, G25 og G30 optimistiske med op til omkring 2x, fastlåst); tests/slot_timing_ocxo_holdout.rs (en målt OCXO: forudsigelse på tilbageholdte data aldrig optimistisk, { "0.59" } til { "0.70" } af den målte overskridelse; i stikprøven inden for { "0.98" } til { "1.17" }; uden leddet for positionsbestemmelsesfrekvens er forudsigelsen i stikprøven optimistisk ved hver tærskel); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — hver klasse mod holdover::holdover_seconds til { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — præcis tpl::timing_protection_level_ns, når uret ikke har noget flicker-, hvidfase- eller random-run-led; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S lig med jamming::j_over_s_db og effektiv C/N0 lig med jamming::effective_cn0_dbhz med Q = 1/(R_c kappa) til { "1e-9" } dB, og ankeret på { "32.105" } dB i jamming-kindens egen test; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: fastlåst ved { "2.04" } og { "5.16" } gange den nominelle længdegradsfejl, under seks gange; pluto_from_the_1992_row_is_measured_not_validated: inden for { "39" } buesekunder og { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: værst { "3.7e-3" } af farten); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: værste vinkelfejl set fra planeten over { "2000" } til { "2040" }, Phobos { "5.65" } deg, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymedes { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } deg); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: kvadratmiddelværdien af hver positionsfejl over dens egen formelle sigma i [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — hvert kort og hver tæller er lig en scanning med den direkte elevationstest; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satellitter, udskriver køretiden og de parvise tests, der blev beholdt; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (kun regressionskontrol); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regression)

seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — medlemsresultatet er byte-identisk med den selvstændige kørsel, og hver justeret værdi er lig den selvstændige serie; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

seg-c0c2439ee1f6 = campaign (run_compose)

seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — en sammensætning med ét medlem læser det selvstændige tal og resultatets digest)

seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (hvert medfølgende systemagnostisk scenarie kører uden workshopdata, båndafvejningens ionosfæriske forhold er lig (f_ref/f)^{ "2" } og dens forskelle i fri rummet { "20" } log10(f/f_ref), jitteren ved referencens C/N0 ligger mellem sin Gabor-grænse og sin form med ubegrænset bånd, E5-formkontrollerne for scenariet med workshopparametre er konsistente, når den fil er til stede, og ingen kildefil kompilerer den fil ind)

seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

seg-17f462b8768d = tests/leo_signal_reference.rs (multibånd-vandfaldet kører med fire paneler, UHF-, L5-bånd-, S- og C-jammerne afviser hver kun sit eget bånd, og en kørsel med et almindeligt bånd er uændret af udvidelsen); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: under { "0.01" } Hz og { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: inden for { "0.5" } dB af -139.1 og -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (hvert skifts afstandsspring er lig ændringen i afstandsfejl, og en korrigeret tilpasning på { "300" } s opdateret hvert { "150" } s består en tærskel på { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (den lukkede form afgrænser en tæt stikprøvetagning af keglen)

seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (hver model inden for { "2" } mm af den nøjagtige meddelelse efter afkodning, genkodning bit-identisk, en vendt bit afvist af CRC'en); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (hver model inden for { "0.1" } mm efter tekstblokken, CSV nøjagtig)

seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: til { "1" } mm og driften til { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: det vægtede residual-RMS i [{ "0.8" }, { "1.2" }] og fejlen under fire formelle sigma); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (en præregistreret proxy mod de publicerede percentiler for datasæt 3 fra "Unveiling Starlink for PNT", doi:10.33012/navi.685: med { "3" } satellitter ({ "47" } deg maske), uden højdestøtte og { "30" } Hz er p90 for 3D-fejlen { "92.2" } m ved { "20" } s og { "870" } m ved { "8" } s mod de publicerede { "2" } m og { "10" } m, så begge tærskler på en faktor to er NOT MET, på den høje side, og hævdet som misset; docs/design/evidence/cap11-starlink-doppler-proxy/)

seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) til { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } seeds, kørselsgennemsnit af NEES-middel i [{ "2.4" }, { "3.6" }] og mindst { "75" }% af epokerne inden for det tosidede { "95" }%-chi-i-anden-bånd; målt med { "150" } seeds, middel { "2.84" } kun GNSS og { "2.87" } med LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: scanninger af kildetekst i src, scenarios og tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: en stærkere EIRP, et længere tilpasningsinterval og et større led for banebestemmelse flytter hver især den videregivne værdi og den fusionerede positionsbestemmelse; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: er lig overflyvningens skrå TEC ved toppen til { "1e-9" }, og dens sigma er lig RSS af kodestøjen over { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

seg-aa2667aa0296 = receiver_trust (score, monitors, live)

seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monoton i hver statistik, tilføjelse af en monitor hæver aldrig scoren, sunde statistikker bliver på { "100" })

seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

seg-fe08580cd8d3 = telemetry::syslog::tests (nøjagtige LEEF-strenge, escaping, alvorlighed, RFC { "5424" }-konvolut, leveringstimeouts og genforbindelse); tests/telemetry_cli.rs

seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignoreret, datastyret af KSHANA_JAMMERTEST_DIR: det registrerede udvalg, tilbageholdte antal, tærskelafgørelser og afgørelsen); receiver_trust::calibration::tests (tidsstempler, vinduesparring og tidszoneforskydningen, mærker, vagtbånd, udelukkelse, udvælgelse); receiver_trust::monitors::tests::threshold_profile_is_opt_in

seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (datastyret af KSHANA_JAMMERTEST_PLAN_DIR: antal slots pr. testområde i planen fra { "2025" }, katalog-id'er, TOML-rundtur); tests/jammertest_score.rs (en syntetisk log med et kendt fald: opdaget, misset, ikke evaluerbar, kørsel med falsk alarm, signeret pakke med scorekortet); jammertest::plan::tests; tests/jammertest_score_2024.rs (datastyret af KSHANA_JAMMERTEST_DIR: den registrerede kørsel)

seg-bf1156de0226 = compliance

seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); uden for cratet: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-relæ, C++ native plugin), deploy/reference-build (systemd-enheder, container)

seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (gaten og dens TCP-listener, Rust-siden); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js og integrations/signalk/test/plugin.test.js ({ "24" } Node-tests på optaget syntetisk output); integrations/opencpn/test/relay.test.mjs ({ "5" } Node-tests); integrations/opencpn/test/e2e-live.mjs (den ægte binære fil til en TCP-forbruger, kørt i hånden og i CI); integrations/opencpn/plugin/test/pksht_test.cpp og integrations/opencpn/plugin/test/trust_state_test.cpp (C++-kontroller af PKSHT-parseren og panelets tilstand); deploy/reference-build/check-units.sh og deploy/reference-build/test-entrypoint.sh

seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); iq::track::boc-enhedstests (b4_unit_grid_misses_are_the_recorded_ones: den præregistrerede B4-tærskel for enhedstests bevaret som skrevet, dens registrerede miss hævdet som fund F1)

seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, den registrerede afgørelse hævdet som registreret, fund F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, kun rapporteret; datastyret, hentet af scripts/fetch_scint_malindi.sh); realdata::scint50-enhedstests (model_data_through_the_harness_shows_the_wrapped_phase_finding, fund F2)

seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, den registrerede afgørelse hævdet som registreret, fund F1, fastlåst af finding_noise_free_sidelobes_exceed_the_cfar_rate); iq::acq-enhedstest ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, fund F1, fastlåst af finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, fund F2, fastlåst af finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, kun rapporteret)

seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

seg-662887e17adb = standards_pack; compliance (standards-pack facts in compliance-report)

seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: the status of every test, including the misses L4-T1 and the four IMO accuracy tests); standards_pack::tests

seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), on numbers derived by tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py

seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), against xval/crpa-jamming/expected.json from xval/crpa-jamming/oracle.py

seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), against xval/jamming-terrain/expected.json from xval/jamming-terrain/oracle.py

seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), against xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json and expected_quantiser.json

seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (the FLL gate)

seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), on tests/fixtures/fll_handover_floor/results.csv

seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (lat/lon epochs, week/TOW and ECEF, dms refused, hostile input); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (pinned CRC, ASCII and binary records, bad CRC skipped, hostile input); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (CRC-24Q catalogue check value, MSM4/MSM7 C/N0 and epoch merging, GLONASS time and SBAS id mapping, bad CRC and other messages)

seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (known white-noise coefficients recovered within { "10" } %, refusals, TOML parses as AccelCfg); tests/receiver_trust_machines.rs (heading agreement and disagreement, inline carrier, imu_fit)

seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

seg-21059291ea8b = telemetry::mqtt::tests (packet bytes, loopback broker, dead broker counted); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: the format the gnss_lib_py bridge writes, run through receiver-trust); the Python tests of the bridges are integrations/ros2/kshana_trust/test/test_bridge.py (bridge with a mock engine), integrations/ros2/kshana_trust/test/test_engine_integration.py (the real wheel scores a steady fix nominal and a { "1.1" } km jump untrusted) and integrations/gnss_lib_py/test_bridge.py (real gnss_lib_py { "1.1.0" } and the wheel), run with pytest, not by cargo

seg-e8e0e0618afa = Kilde: <c1/>

seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

seg-af088012df3f = tests/osnma_official_vectors.rs (tilvalg, KSHANA_OSNMA_VECTORS: alle { "18" } vektorsæt, { "186,382" } tags autentificeret, { "0" } fejlede, gulve pr. sæt, kæder annonceret, ADKD 0/4/12, alarm verificeret, autentificering genoptaget efter kædens slutning, tilbagekaldelse af kæde og nøgle og ny offentlig nøgle; offline, vektorerne videredistribueres ikke); tests/osnma_synthetic.rs (angrebssuiten: spoofede subframes langt ude i fremtiden, udløb og databinding, alarm og don't-use, bekræftelse af header, dummy-tags, MACSEQ, nøglekonflikt, forældet og genafspillet KROOT, CMAC-AES/SHA3-256/P-521 gennem verifikatoren); osnma-enhedstests (kendte svar for RFC { "4231" }, RFC { "4493" }, FIPS { "197" }, FIPS { "202" }, RFC { "6979" } og CRC-24Q)

seg-be26fdfb4a7c = allan

seg-a59477833676 = tests/allan_reference.rs (NBS14 mod Stable32 til { "1e-4" }); allan::tests

seg-b8ed4780ccb7 = tests/cs5071a_reference.rs (virkelig 5071A Cs mod H-maser, { "556 990" } punkter, { "16" } middelingsfaktorer mod Stable32 til { "1e-3" }; datastyret via scripts/fetch_cs5071a.sh)

seg-17f05fc54f98 = tests/phasedat_reference.rs (Stable32 PHASE.DAT, { "139" } middelingsfaktorer, OADEV/MDEV/TDEV til { "1e-3" }; datastyret via scripts/fetch_phasedat.sh)

seg-8c6006055d29 = tests/theo1_totvar_reference.rs (Theo1 + TOTDEV på NIST SP { "1065" } §{ "12.4" } datasættet med 1000 punkter fra en LCG, { "6" } + { "6" } middelingsfaktorer mod allantools { "2024.06" } til <{ "1e-9" }); allan::tests (følger den lukkede form for hvid FM; TOTVAR=ADEV-identitet ved m={ "1" }; Theo1/TOTVAR er invariant over for fase-/frekvensforskydning; hældning -1/2 for hvid FM)

seg-ca3c7f74a002 = allan (mtie, mtie_curve)

seg-deb9fe96d3bd = tests/mtie_reference.rs (MTIE på den hermetiske NIST SP { "1065" } §{ "12.4" } faseserie med 1000 punkter fra en LCG, { "9" } middelingsfaktorer m={ "1" }..256 mod allantools { "2024.06" } mtie til <{ "1e-9" }, observeret ≤{ "4e-15" }); allan::tests (spids-til-spids udregnet i hånden; monotont ikke-aftagende i τ; nøjagtigt a·m på en ren rampe)

seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs (MDEV + TDEV på den hermetiske NIST SP { "1065" } §{ "12.4" } faseserie med 1000 punkter fra en LCG, { "8" } middelingsfaktorer m={ "1" }..200 mod allantools { "2024.06" } mdev/tdev til <{ "1e-9" } relativt, plus τ/√{ "3" }-identiteten på den virkelige serie); allan::tests (hældning −1/2 for hvid FM; lille MDEV-tilfælde udregnet i hånden)

seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs (Norcia et al. ⁸⁸Sr-pincetur σ_y(τ), { "8" } middelingstider { "0.92" }–{ "117.76" } s medleveret ordret under CC-BY-4.0: NNLS rekonstruerer kurven til ~{ "10" }% RMS / ≤{ "21" }% i det værste punkt; genfundet √q_wf = { "4.33e-16" } svarer til det offentliggjorte 4.7e-16/√τ; q_rw > { "0" } målt rødstøjsgulv)

seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 ({ "270" } tilfælde med virkelig geometri, Celestrak GPS+Galileo og IGS SP3: værste |dVPL| { "2.2e-3" } m, |dHPL| { "1.1e-3" } m, |dEMT| { "2.1e-10" } m mod ADD TOL_PL { "0.05" } m); tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (hullerne ved ensartet sigma, fastlåst); tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (virkelig IGS ABMF 2018-05-13, { "288" } epoker, { "2016" } tilfælde med indsatte bias fra { "10" } til { "100" } m: 2016/2016 detektionsbeslutninger og 801/801 udelukkelsesbeslutninger identiske, slope HPL/VPL inden for { "2.7e-12" } m mod { "1e-6" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages ({ "2868" } bruger-epokepar på virkelige WAAS-udsendelser, samme beskyttede sæt, værste |dVPL| { "7.1e-6" } m og |dHPL| { "1.6e-5" } m mod { "1e-4" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (L5-fundet, fastlåst); tests/igs_real_data.rs og tests/araim_dual_real_data.rs (plausibilitet på virkelige IGS SP3- og Celestrak-geometrier, beholdt som regressionskontroller, ikke som uafhængige referencer)

seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

seg-9b9adc7d7cd4 = tests/sgp4_verification.rs ({ "666" } AIAA-verifikationsvektorer, værste { "4.12" } mm); tests/sgp4_crate_comparison.rs (uafhængig sgp4-crate)

seg-1f6277967a05 = propagator, forces

seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs ({ "275" } epoker = { "11" } tilfælde × { "25" } timetilstande, LEO+GTO, mod Orekit { "12.2" } DormandPrince853; konservative niveauer T1–T5 værste |Δr| { "0.08" } m over { "24" } h; modstandsniveauet karakteriseret til { "333" } m)

seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs ({ "2400" } geometrier på tværs af skyggekanten, { "884" } i penumbra, LEO til GEO, solens deklination { "0" } og +-23.44 deg, { "8" } azimutter: værste |dnu| { "7.41e-9" } for WGS-84 og { "2.24e-9" } for den sfæriske baseline; Orekits WGS-84- og sfæriske forhold afviger med op til { "0.98" }, så sættet kan skelne fladtrykthed); enhedstests for srp_shadow og propagator

seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs ({ "252" } geometrier i Galileo-bane, { "7" } soltilfælde inklusive perihelie- og aphelie-afstande, { "100" } tilfældige attituder; summen for flade plader værste { "2.05e-15" } relativt over { "1056" } tilfælde; fra ende til anden med Orekits egen attitude og tryk værste { "2.39e-15" } over { "747" } tilfælde med fuld sol, mens Orekits standardtrykkonstanter afviger med >= { "4.43e-3" }, så sammenligningen kan skelne konstanten; nominel yaw-matrix værste { "1.89e-15" }; partiel af strålingsfaktoren værste { "1.35e-15" }; partielle afledede pr. panel værste { "4.12e-13" } relativt mod centrale differenser af Orekit over { "10836" } panel-tilfælde; ECOM2-acceleration og partielle afledede værste { "1.74e-15" }); enhedstests for srp_boxwing (grænser i lukket form, partielle afledede ved endelige differenser); koblingstests for propagator og precise_od

seg-d23a475337fb = tests/nrlmsise00_reference.rs ({ "720" } gitterpunkter, { "90" } til { "1000" } km, { "4" } breddegrader, { "2" } lokaltider, { "3" } dage, lav/moderat/høj aktivitet: densitet inden for { "1.866e-6" } relativt og temperatur inden for { "1.97e-4" } K af pymsis; bit-identisk med C-porten; de { "17" } offentliggjorte C-testtilfælde, { "187" } værdier inden for { "0.496" } enheder af det 7. betydende ciffer); enhedstests for nrlmsise00

seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs ({ "4" } tilfælde × { "25" } timetilstande over { "24" } h, cirkulær { "51.6" } deg, { "400" } km ved lav/moderat/høj aktivitet og { "300" } km: værste |dr| { "0.0303" } m og |dv| { "3.36e-5" } m/s mod { "3.3" } til { "141.8" } km modstandsforskydning, værste fejl/tærskel { "0.003" }; kontrollen med eksponentiel densitet bommer med { "119.1" } m); enhedstests for forces og propagator (standard bit-identisk; niveauet evaluerer porten i det jordfaste geodætiske punkt)

seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs (ækvatoriale tilfælde E400, E300 og E250x600 ved J2000.0, { "25" } timetilstande over { "24" } h: den modstandsinducerede forskydning afviger fra GMAT's med højst { "0.016" } af tærsklen { "0.5" } m + { "1e-3" }|D| mod { "21.5" } til { "143.9" } km forskydning; en ændring på +{ "1" } % i Cd*A/m når { "9.83" } gange tærsklen; det skråtstillede I400-tilfælde rapporteres, { "10.4" } % fra, den angivne forskel i definitionen af højde)

seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs ({ "21" } af { "21" } bølger stemmer med den offentliggjorte model A2: værste { "0.00050" } cm, { "0.050" } deg mod tærskler på { "0.0006" } cm, { "0.1" } deg); tests/tides_iers.rs (S2-amplitudebånd)

seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs ({ "6" } tilfælde × { "25" } timetilstande over { "24" } h: EGM2008 8x8 og 70x70 på LEO { "45" } deg, polær { "89.9" } deg, solsynkron { "98.2" } deg, GTO og 70x70 med Sol/Måne og SRP; værste |dr| { "0.0355" } m, |dv| { "3.74e-5" } m/s; negative kontroller bommer med { "6168" } m (frosset Jord) og { "20871" } m (kun zonal)); enhedstests for propagator (zonal-grænseidentitet til { "1e-12" }, CIO-referencesystem bit for bit mod precise_od, Jacobi-integral holdt til { "1e-9" } over { "6" } h)

seg-f75dcdead7a4 = integrator, propagator

seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs ({ "8" } enkelttrin: tilstand inden for { "5.55e-15" } relativt, FSAL-afledet { "3.46e-15" }, tæt output { "1.99e-14" }, beslutninger om accept/afvisning identiske; { "3" } fulde kørsler ved rtol = atol = { "1e-12" } (LEO { "58000" } s, e = { "0.7" } over { "5" } perioder, Arenstorf over én periode): første trin identisk, accepterede trin 502/501, 390/390, 298/298 og evalueringer 6025/6013, 5497/5497, 4285/4285 mod SciPy, sluttilstande inden for { "2.95e-13" } relativt (tolegemeproblem) og { "1.58e-12" } (Arenstorf), tæt output inden for { "9.5e-13" }; nøjagtighed mod den eksakte mpmath-Kepler-løsning lig med SciPy's (LEO { "8.44e-5" } m, Arenstorf-periodicitet { "1.475e-9" })); enhedstests for integrator og propagator ({ "24" } h tolegemeproblem mod eksakt Kepler under { "0.1" } m)

seg-c6da65825c67 = kepler, propagator

seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs ({ "405" } gitterpunkter, e fra { "0" } til { "0.999999" }, M i [-pi, pi] ned til { "1e-12" }: værste |E - E_ref| { "0.898" } eps|E| mod en tærskel på { "8" } eps|E|; { "9" } punkter med omviklet M ved højst { "0.013" } af deres tærskel; intet Newton-polerende trin nødvendigt i nogen af de { "414" } punkter; wrapper bit-identisk); enhedstests for kepler

seg-9a2263ce0872 = gravity_pds, gravity_sh

seg-43b33973adff = tests/planetary_gravity_pds.rs (udsnit af grad 20 kører altid: værste |dg|/|g| { "9.7e-16" }, perturbation-relativt { "3.4e-11" }; GMM-3 d/o { "120" } over hele kuglen { "3.7e-15" } / { "6.3e-12" } og GL0660B d/o { "660" } ved |lat| <= { "60" } deg { "5.0e-14" } / { "1.0e-10" }, datastyret; headere og udvalgte koefficienter lig med de offentliggjorte PDS-produkter, antal poster { "7380" } og { "218790" }); enhedstests for gravity_pds

seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs ({ "8" } scenarier: { "6" } uden støj LEO/MEO/excentrisk/3–4 stationer + { "2" } σ={ "5" } m, mod Orekit { "12.2" }; værste batch |Δr| { "1e-3" } m / |Δv| { "1e-6" } m/s, sekventiel |Δr| { "0.9" } m)

seg-9edf08007870 = radiometric (light_time_solution)

seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs ({ "24" } led over { "8" } epoker { "2020" }–{ "2027" } mod ANISE DE440; værste |Δτ| { "1.03e-9" } s, |Δrange| { "0.31" } m ved op til { "2.5" } AU)

seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs ({ "84" } SV-epoketilfælde: GPS + Galileo + BeiDou-MEO, { "12" } SV'er × { "7" } forskydninger, mod RTKLIB eph2pos; værste |Δ| pr. akse { "6.2e-8" } m)

seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs ({ "72" } SV-epoketilfælde uden for knudepunkter / { "6" } satellitter mod RTKLIB peph2pos; værste |Δ| pr. akse { "1.5e-8" } m)

seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs (indlæst syntetisk IONEX-kort mod formelreferencen: { "20 075" } knudepunkter eksakte, interpolation maks. |Δ| { "3.5e-13" } TECU; datastyret på KSHANA_IONEX_CODE_GIM_DIR, det virkelige endelige CODE GIM fra 2018-05-13, udsnit af breddegrader hentet af fetch.sh med en fastlåst SHA-256: knudepunkter eksakte, interpolation maks. |Δ| { "3.6e-13" } TECU over { "15 795" } samples, slant TEC { "5.1e-13" } TECU; datastyret RTKLIB v2.4.2-p13 iontec ved { "6885" } forespørgselspunkter, kørt 2026-10-13: maks. |Δ| { "3.6e-13" } TECU i begge tidstilstande, tærskel { "1e-5" } præregistreret); ionex::tests

seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs (IGS-stationer WTZR base / WTZZ rover, { "1.4" } m, 2025-02-24 00-03 h, { "30" } s: { "359" } epoker, positionsbestemmelser ved { "100" } % fra { "00" }:{ "10" }, median af fejlen på den faste baseline { "4.5" } mm, p95 { "5.5" } mm; de første { "10" } min fast { "2.6" } mm mod float { "13" } cm); rtk_real::tests

seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs (WTZR 2025-02-24, { "04" }:00-05:{ "55" }, { "24" } epoker: Kshana minus IGS std { "0.075" } ns, tærskel { "0.20" }; middel -0.659 ns, tærskel { "5.0" })

seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs (IGS-station WTZR, 2025-02-24 00-06 h, { "30" } s, holdt uden for udviklingen: horisontal { "1.5" } mm i sidste epoke, op −{ "2.9" } cm; 04-06 h 240/240 epoker inden for { "0.10" } m 3D, p95 { "6.7" } cm; kun kode p95 { "1.70" } m; datastyret ZTD-RMS { "1.7" } cm mod EUREF); ppp_real::tests; tests/ppp_parity_glab_rtklib.rs (RM-31: RTKLIB v2.4.2-p13 PPP på de samme input stemmer inden for { "0.05" } m ved 240/240 epoker, { "9.7" } mm ved den sidste, ved den tredje registrering efter to kørsler, hvor RTKLIB-konfigurationen manglede fasttidevandet og placerede antennen på basepladsen, begge registreret som fund; paritetstærsklen for SPP blev ikke nået, { "1.085" } m median mod { "0.50" } m; gLAB { "6.0.0" } ved sin første registrerede kørsel, kommandolinje fra ændring { "4" }: PPP inden for { "0.05" } m ved 240/240 epoker og { "5.0" } mm ved den sidste, SPP-tærsklen ikke nået, { "1.187" } m median, et fund: de to referenceværktøjers egne SPP-løsninger afviger med { "0.852" } m median, så tærsklen var sat strengere end enigheden mellem værktøjerne)

seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs (IGS BRD400DLR_S RINEX { "4.02" } mod BRDM00DLR_S RINEX { "3.04" } fra 2026-07-19, udsnit 00-02 h: G { "37" } / E { "478" } / C { "72" } poster matchet begge veje, hvert felt identisk, position ved Toe { "0" } m; hel dag datastyret: G { "416" } / E { "5668" } / C { "865" } / J { "118" }); rinex::tests

seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs (IGS endelig SP3 på { "15" } min fra 2025-02-24 mod IGS' endelige ure på { "30" } s, { "32" } GPS-satellitter: median |Δ| for knudepunkter { "2.6e-13" } s; { "3038" } midtpunktsposter RMS { "0.121" } ns, p95 { "0.265" } ns; ved at holde knudepunktet i stedet { "4.24" } ns RMS); sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs (syntetiske indlæsere og lever-arm-tests med roterende platform kører altid; datastyret på KSHANA_KFGINS_DIR, kørt 2026-10-13 på KF-GINS-demodatasættet: horisontal / vertikal RMS { "0.0109" } / { "0.0090" } m mod referencetrajektorien mod KF-GINS C++ { "0.0111" } / { "0.0083" } m, alle seks præregistrerede tærskler holdt; lever arm slået fra { "0.329" } m)

seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs ({ "6" } tests: reference og scenarier, eksport-bytes fastlåst, NMEA- og LLH-læsere, ECEF-udsnit med fire kolonner, FUND i kørsel 1 på CSV i fuld bredde, rækkegitter på { "10" } Hz)

seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs (statiske/drej-/coning-profiler, { "30" } epoker hver, mod NaveGo: attitude bit-identisk { "0" } rad; hastighed/position inden for navngivne analytiske grænser)

seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs (GRS80-syntese gengiver Somigliana til { "3.5e-12" }; virkeligt ICGEM EGM2008-forstyrrelseskort fysisk)

seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame ({ "72" } tilfælde: { "12" } epoker i januar { "2025" } × L1- og L2-punkterne, to sydlige L2-halo- og én DRO-starttilstand fra JPL's Three-Body Periodic Orbits API og en generisk tilstand; værste position { "1.8e-7" } m mod { "1" } mm, hastighed { "1.2e-9" } m/s mod { "1e-6" } m/s; invers { "2.7e-15" }); cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice (Merkur, Venus, Jorden og Månen ved 2026-01-01, 2030-06-15 og 2040-12-31: værste { "3.3e-5" } m og { "1.0e-11" } m/s mod { "1" } mm og { "1e-6" } m/s; kerneblokken og etiketterne eksakte); tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep (Jorden til Mars' barycenter, { "16" } afgange 2026-09-01..2027-01-29 × { "19" } ankomster 2027-06-01..2028-02-26: { "304" } celler endelige på begge sider, værste C3 { "2.5e-14" } og V-infinity { "2.6e-14" } relativt mod { "1e-8" }, samme celle med minimum C3, { "9.1997" } km²/s²)

seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy (Jorden til Mars' barycenter, afgange 2026-09-15..2027-01-15 × ankomster 2027-05-01..2028-03-01, Type I/II × min C3 / min V-infinity: værste mål { "8.7e-13" } relativt, datoer inden for { "1e-5" } dag, anden størrelse inden for { "2.5e-7" } relativt, mod præregistrerede tærskler på { "1e-7" }, { "0.01" } dag og { "1e-4" }; docs/design/evidence/cap20cd-transfer-optimiser/); tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook (sekundær offentliggjort reference NASA/TM-2010-216764 Table { "2" }: Type II min C3 { "9.182" } mod { "9.144" } og Type II min V-infinity { "2.564" } mod { "2.565" } MET; Type I min C3 { "10.535" } mod { "11.11" }, -5.18 %, NOT MET og kontrolleret som misset, idet bibliotekets reference er enig med Kshana)

seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases ({ "382" } tilfælde: { "300" } tilfældige 3D, { "18" } nær { "180" } deg, { "24" } nær minimumstiden for M = { "1" }..3, { "40" } heliocentriske; { "1058" } løsninger; antal og grenrækkefølge lig; hastigheder inden for { "1e-8" } relativt, værste { "1.6e-13" }; inden for { "1" } % af minimumstiden inden for { "1e-6" }, værste { "7.5e-15" }; en intern Kepler-landingskontrol lander hver løsning inden for { "4.2e-12" } af |r2| på nær ét fastlåst fund på en bue med e = { "0.994" }, en begrænsning i kepler_universal, ikke i løseren)

seg-67d3c2e5a311 = maneuver (lambert)

seg-5965501f44b7 = tests/lambert_reference.rs ({ "13" } overførsler mod lamberthub izzo2015; værste |Δv| { "7e-12" } m/s)

seg-559cbdef5e7b = frames, precession, nutation, cio, timescales

seg-3c23a80630da = tests/frame_reference_vectors.rs (Vallado fra ende til anden; SOFA/ERFA-vektorer)

seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs ({ "224" } UTC-tidspunkter: seks omkring hvert af de { "27" } skudsekunder 1972-2016, to faste, { "60" } med seed på tværs af 1972-2026; dtf2d, utctai og taiutc hver inden for { "1e-6" } s, værste { "1.9e-11" } s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa ({ "40" } todelte UT1/TT-datoer 1980-2050 inklusive trin på +{ "1" }, +{ "10" }, +{ "50" } us ved to datoer: gmst82 inden for { "1e-12" } rad, værste { "0" }; GCRS til ITRS-elementer inden for { "5e-12" }, værste { "2.7e-14" }; rotation over +1/+10/+{ "50" } us inden for { "1e-13" } rad af ERFA, værste { "1.1e-14" } rad, hvor enkelt-f64-stien slet ikke fanger trinene på +{ "1" } og +{ "10" } us); ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps; frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond; jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor; jd2::tests::two_part_types_convert_without_moving_the_instant

seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors ({ "40" } TT-epoker 1950-2100, dX og dY op til { "0.5" } mas: præcessionselementer inden for { "1e-13" }, værste { "0" }; TEME til GCRS inden for { "5e-10" } rad, værste { "1.10e-10" } rad; CIO med forskydninger inden for { "1e-13" }, værste { "0" }; nul-forskydninger bit-identiske med cio::gcrs_to_cirs_matrix)

seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa ({ "117" } UTC-tidspunkter: fire omkring hver af de { "15" } begyndelser af et TAI-UTC-udtryk 1960-1972 og { "60" } med seed på tværs af 1960-1971; dtf2d, utctai og taiutc hver inden for { "1e-6" } s, værste { "2.9e-11" } s); tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical (de { "224" } tidspunkter i rækken for { "1972" }+ uændrede bit for bit)

seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib ({ "292" } tilfælde: de { "4" } GLONASS-poster i den virkelige IGS MGEX-broadcastfil fra 2013-01-01 × { "73" } forskydninger inden for +/-900 s; ur inden for { "1e-14" } s, værste { "0" } s; position inden for { "0.01" } m, værste { "1.12e-3" } m)

seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs (led { "1" }: { "4432" } TEME-positioner af de { "232" } indlæste elementsæt mod python-sgp4 { "2.24" }, værste { "6.1e-8" } m, tærskel { "1" } cm; led { "2" }: { "108" } tidspunkter, { "23" } af dem med parametre for jordens orientering og ét i sidste sekund af en skudsekunddag, mod ERFA: GCRS -> ITRS værste { "2.9e-6" } mas, tærskel { "0.1" } mas; TEME -> ITRS værste { "0.41" } mas, tærskel { "2" } mas); sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch); tests/no_private_models.rs

seg-5235d736ac3e = navsignal (CodeFamily)

seg-532eb9a2900f = navsignal::code_tests (GPS C/A Gold ≈ −{ "23.9" } dB; φ({ "1023" })/10 = { "60" })

seg-6f9de921ca86 = orbit (dop)

seg-b215ace86be9 = tests/dop_reference.rs ({ "8" } geometrier, velkonditionerede → næsten singulære)

seg-686687c1fa8d = gnss_sim (klobuchar_delay_m)

seg-aee414a8d8ec = tests/klobuchar_reference.rs ({ "10" } tilfælde på tværs af elevation/azimut/lokaltid, to koefficientsæt)

seg-1c1d27c45546 = raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)

seg-b3663ac963e1 = tests/raim_reference.rs ({ "171" } tilfælde: χ² CDF/kvantil, normal CDF/kvantil, ikke-central χ² CDF, pbias på tværs af områderne for P_fa/P_md/redundans)

seg-afe92c4623d2 = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — uafhængigt bibliotek (Cephes/Boost), en anden algoritme end Kshanas række for ufuldstændig gamma; matchet til ≤{ "1e-6" } rel. Kun kernen. Fordelingen af ARAIM MHSS' P_HMI-budget <em>mangler</em> ikke længere en offentliggjort numerisk reference — WG-C ARAIM Technical Subgroups eget gennemregnede eksempel bakker nu den separate række 'ARAIM MHSS protection levels against published reference vectors' op, matchet ved referencens eget TOL_PL = { "5e-2" } m — så denne rækkes omfang er den statistiske kerne, og den anden række bærer fordelingen (se docs/ARAIM_REFERENCE.md)

seg-116377f12c14 = sbas (sbas_protection_level)

seg-f4fa833999f3 = tests/sbas_reference.rs ({ "6" } virkelige EGNOS-epoker: HPL matchet direkte, lodret d_U kontrolleret uden K-faktor)

seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

seg-f0853f1adeaa = tests/eval_metrics_reference.rs ({ "5" } datasæt, { "24" } tærskler; eksakte antal + <{ "1e-9" })

seg-ee20bf2a4315 = impairment_eval, eval_stats

seg-f546b062df87 = tests/opssat_ad_reference.rs (virkelig ESA OPS-SAT, AUC gengiver scikit-learn til { "1e-9" }); tests/ai_ml_rf_impairment_detection_evaluation_reference.rs ({ "122" } tilfælde på den virkelige OPSSAT-AD-testdeling: fuld forvekslingsmatrix i driftspunktet + Pd/Pfa/præcision/F1 mod scikit-learn, heltalseksakt)

seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

seg-42b83604390f = tests/scipy_reference.rs (NNLS; χ² ved driftsfrihedsgrader ≥ { "48" }; van-Loan Q)

seg-f571816b43fc = igrf, igrf_data

seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs ({ "2520" } globale punkter × højder mod ppigrf @ epoke { "2025.0" }; værste |ΔXYZF| { "3.9e-4" } nT, |ΔD| { "2.8e-6" }°, |ΔI| { "3.6e-7" }°)

seg-88c8996b8e2e = quantum_faults, eval_stats, detection

seg-1f37560eef48 = tests/quantum_faults_reference.rs ({ "109" } tilfælde mod scipy { "1.17" } norm.cdf/ppf + scikit-learn roc_auc_score; værste |Δ| AUC { "6.9e-8" }, mindste detekterbare fejl { "1.3e-8" }, empirisk AUC { "1.1e-16" })

seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs ({ "124" } tilfælde mod scipy { "1.18" } / numpy { "2.4" }: { "61" } Kendall τ-b til { "2e-16" }, rangering eksakt, Dirichlet-middelværdi + percentil-CI til { "1e-12" })

seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs (Saaty { "1980" } Random Index-tabel n={ "1" }..10 EKSAKT; prioritetsvektor + λ_max + CR mod SciPy/LAPACK eig på en konsistent { "3" }×{ "3" } og inkonsistent { "3" }×{ "3" } / { "4" }×{ "4" }, matchet til <{ "1e-9" })

seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs (WSM-scorer + rangering) og tests/mcda_wpm_reference.rs (WPM-scorer + rangering), hver mod pymcdm til <{ "1e-9" } på en fast beslutningsmatrix med { "4" }×{ "3" } fordels-/omkostningskriterier

seg-3b78f01d1992 = tests/mcda_topsis_reference.rs (nærhedskoefficienter + rangering mod pymcdm til <{ "1e-9" } på en fast fordels-/omkostningsmatrix med { "4" }×{ "3" })

seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs (Q-indeks + rangering mod pymcdm til <{ "1e-9" } på en fast fordels-/omkostningsmatrix med { "4" }×{ "3" })

seg-faaffee99e67 = tests/mcda_promethee_reference.rs (netto-outranking-flow + rangering, sædvanligt kriterium, mod pymcdm til <{ "1e-9" } på en fast fordels-/omkostningsmatrix med { "4" }×{ "3" })

seg-c3c1ab11c426 = tests/mcda_electre_reference.rs (matricer for konkordans, diskordans og dominans element for element + kerne-/domineret sæt mod pyDecision til <{ "1e-9" } på et fast datasæt med { "4" }×{ "3" } udelukkende fordelskriterier)

seg-08e153bbaef7 = mcda::waspas, mcda::moora

seg-eafdba85247a = tests/mcda_waspas_reference.rs (WASPAS-præferencer + rangering) og tests/mcda_moora_reference.rs (MOORA-scorer + rangering), hver mod pymcdm til <{ "1e-9" } på en fast beslutningsmatrix med { "4" }×{ "3" } fordels-/omkostningskriterier

seg-3d6cd006d21f = tests/mcda_copras_reference.rs (nytteværdigrader + rangering mod pyDecision til <{ "1e-9" } på en fast fordels-/omkostningsmatrix med { "4" }×{ "3" })

seg-7fb7df3cd534 = tpl (Cusum), security

seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs ({ "16" } tilfælde med deterministisk latenstid EKSAKTE mod en reference for første passage; { "8" } ARL₁-tilfælde, Monte Carlo @60k forsøg mod Siegmund-approksimationen + offentliggjorte Montgomery-tabeller)

seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs ({ "27" } tilfælde mod scipy { "1.18" }: { "12" } coast-varians mod linalg.expm Van-Loan Q₀₀ værste rel { "1.1e-15" }; { "7" } holdover-inversioner mod optimize.brentq værste rel { "1.5e-16" })

seg-817055dfe79a = resilience::diversity (effective_diversity)

seg-9cad75e722bc = tests/resilience_diversity_reference.rs ({ "17" } tilfælde: { "14" } mod scikit-bio inv_simpson + { "3" } fastlåste randtilfælde med nul; værste |Δ| { "0.0" })

seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

seg-db663720ff55 = sdr

seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN { "1" }–{ "9" } de første 10 chips gengiver IS-GPS-200 Table 3-Ia oktaler 1440/1620/1710/1744/1133/1455/1131/1454/1626 præcist; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

seg-e941099918ef = fusion::tests (UKF==lineært KF-identitet; udfalds-coast; NEES); tests/gnss_ins_sensor_fusion_reference.rs ({ "50" } tilfælde mod filterpy { "1.4.5" }: lineært EKF løst/tæt + koblede PNT-posteriorer til ≤{ "2.4e-12" }; UKF 40-epokes kørsel værste |Δx| { "1.9e-7" } / |ΔP| { "9.5e-6" }); tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (NaveGo v1.4 løst koblet løsning på NaveGos virkelige Ekinox IMU/GNSS-kørsel: horisontal RMS 0.912x, vertikal 0.940x, RMS af positionsinnovation 0.861x af NaveGos, middel af normaliseret innovation { "0.395" }; tærskler 1.2x, 1.2x, 1.2x og { "1.5" } fastsat før kørslen)

seg-e53182bd8d30 = cr3bp::tests (STM mod endelige differenser); tests/cislunar_mission_analysis_reference.rs ({ "5" } JPL L2-S NRHO-medlemmer: { "9" }:{ "2" } + { "4" } naboer; værste |ΔC| { "1.5e-5" }, |ΔT|/T { "9.6e-5" }, perilune { "0.7" } km i JPL's længdeenheder)

seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs (egm2008_n70_matches_cited_icgem_values i CI på ti citerede ICGEM-knudepunkter; egm2008_n70_gravity_anomaly_sa_matches_icgem over de fulde hentede 0.25-deg-gitre for Tchad 9-15N 19-25E og Death Valley 35-38N 242-245E, { "794" } knudepunkter: RMS { "1.3e-8" } og { "2.6e-8" } mGal, maks. { "2.9e-8" } mGal mod præregistrerede tærskler på { "0.005" } / { "0.02" } mGal, xval/icgem-egm2008/); gravity_sh::tests

seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief — den indlæste 6-buesekunders decimering af den offentlig-domæne SRTM v3 N36W117-tile placerer Badwater Basin, det laveste punkt i Nordamerika, på −{ "78" } m inden for opmålingsbåndet [−{ "95" },−{ "70" }] m og aflæser tilens sande relief på ~{ "2.2" } km i den østlige bjergkæde; plus, på to indlæste ordrette 1-buesekunds 361x361-udsnit af N36W119 og N36W117, real_srtm_tile_whitney_in_survey_band ({ "4412.1" } m i båndet [{ "4380,4430" }] m omkring opmålingen på { "4421" } m), real_srtm_tile_badwater_in_survey_band (−{ "78.0" } m i [−{ "95" },−{ "70" }] m) og gdal_cross_check (det nærmeste knudepunkt er lig med GDAL { "3.8.4" } gdallocationinfo på de fulde tiles, eksakt i alle { "8" } præregistrerede punkter, xval/srtm-ungate/; plus de håndbyggede orakler for bilineært midtpunkt og for parseren på syntetiske fixtures)

seg-d86971b6e158 = oem

seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs ({ "24" } tilstande / { "2" } fixtures afkodet byte-identisk af den uafhængige <c1/>-parser, pos/vel Δ = { "0" }); oem::tests (parsing af en OEM fra et eksternt værktøj med ekstra nøgleord/kommentarer/kovarians, skrivning→læsning-round-trip af hele tilstanden, pos+vel+acc tolereret, kun position + manglende obligatoriske metadata afvist, scenarie-round-trip med høj nøjagtighed + eksternt indlæst); dominance_demonstrators (kan nås + kan reproduceres + round-trip eksakt + MODELLED-not-VALIDATED)

seg-ab37fdc7a543 = Uafhængig tredjeparts CCSDS-502-parser <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — en separat kodebase, der afkoder kshanas udsendte EME2000/UTC OEM byte-identisk ({ "24" } tilstande på tværs af { "2" } fixtures, pos/vel Δ = { "0" }), og hvis strenge læser bekræfter metadatategnene; kshanas parser er på samme måde enig med den på en medleveret ekstern OEM. To ærlige interop-fund (oem-biblioteket afviser kshanas konvention med flere segmenter pr. satellit og dets kovariansliner med flere poster) er dokumenteret i testen — så dette validerer kun den formatrigtige udveksling af ét objekt, ikke at alle kshana-varianter fuldt ud følger CCSDS-502

seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

seg-e26317a36469 = eo_payload::tests (vinkelradius { "64" }° ved { "700" } km + mindskes med højden, nadir→zenit/nul afstand, horisont→ε=0/maks. centralvinkel, fejl ud over horisonten, strimmelbredde vokser med FOV / GSD med højden, ~{ "2750" } km knudepunktsafstand, scenarie reproducerbart/MODELLED + afvisning af ugyldigt input); dominance_demonstrators (kan nås + kan reproduceres + { "64" }° vinkelradius + MODELLED-not-VALIDATED); tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (højder 400-1500 km, inklinationer 1-98 deg, halv FOV 7.5-50 deg, IFOV 10-50 mikrorad, slew { "30" } og { "89" } deg: hver størrelse inden for sin præregistrerede tærskel, sammenhængende-flag 168/168); tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines; regression tests/eo_payload_coverage_reference.rs

seg-ee8ce4b84732 = space_packet::tests (headerbits svarer til CCSDS-133-layoutet, encode→decode round-trip af alle felter, uden for område/afkortet afvist); tests/ccsds_space_packet_reference.rs ({ "33" } tilfælde mod spacepackets { "0.32.0" }, heraf { "12" } sammenligninger af hele pakker; nul afvigende oktetter)

seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, packet error control, segmentation and reassembly, stream decoding)

seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs (fem præregistrerede tærskler: CRC, tidskoder, strømme, hul og rækkefølge, PUS TM; nul afvigelser); space_packet::tests

seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs (fortegnelse, evaluering, bit- og byte-identitet, konvertering af OEM-epoke; fire planlagte mutationskontroller gør den rød)

seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs (fortegnelse, evaluering begge veje, byte-identitet); spk_writer::tests

seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

seg-6d6d69a7117e = tests/adm_orekit_oracle.rs (L1 Orekit læser { "33" } Kshana-filer, L2 Kshana læser { "31" } Orekit-filer, L3 { "135" } postrotationer; fund fastlåst); adm::tests; ndm_xml::tests

seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs (L1 Orekit læser { "30" } Kshana-filer, L2 Kshana læser { "25" } Orekit-filer; fund fastlåst og kontrolleret til at vende tilbage); odm::tests

seg-2e7fd9b81080 = attitude_budget::tests (GG-moment forsvinder for et symmetrisk legeme, vokser lavere nede, lineært i ΔI, RSS-kvadratsum, varians-andele summerer til 1); tests/attitude_gg_torque_reference.rs ({ "20" } tilfælde mod et uafhængigt GG-moment med fuld tensor T=(3μ/R³)(n̂×(I·n̂)) maksimeret numerisk over attitude med Hipparchus { "3.1" } linalg; værste rel { "6e-15" }, + Wertz/Sidi's offentliggjorte O({ "1e-6" }) s⁻²-bånd); tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk ({ "40" } tilfælde mod Basilisk { "2.9.1" } GravityGradientEffector: spids ved { "45" } deg attitude inden for { "1e-12" } relativt, værste { "2.1e-15" }; intet moment over spidsen over { "2000" } tilfældige attituder pr. tilfælde, { "3" } diagonale og { "5" } generelle inertitensorer, { "5" } højder)

seg-49b30066ff1b = passes::tests (interp-cross lineær + sikker over for degenerering, polar→mellembredde-passager, højere maske ⇒ færre eller lige mange); tests/ground_station_pass_prediction_reference.rs ({ "22" } scenarier / { "129" } passager mod Orekit { "12.2" } ElevationDetector; værste |Δ| AOS/LOS { "0.0000" } s, maks. elevation { "0.0014" }°, samlet adgang { "0.0001" } s, identisk antal passager)

seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs ({ "60" } tilfælde, { "1210" } passager: AOS/LOS inden for { "3.4e-6" } s, tærskel { "5" } ms; maksimal elevation inden for { "5.5e-7" } deg, tærskel { "1e-3" } deg; { "8979" } tilsyneladende retninger inden for { "8.8e-7" } deg, tærskel { "1e-4" } deg); tests/earth_orbit_path_sgp4_erfa_oracle.rs (stien); passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them); tests/pass_predictor_apparent_orekit_oracle.rs (fund i runde 1, fastlåst; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)

seg-b985f72dcdf4 = linkbudget::tests (form for fririumstab, lukning af linkligningen); tests/one_way_link_budget_reference.rs (DESCANSO/JPL Galileo X-bånds-DCT gengivet fra ende til anden + { "6" } ITU-R P.525 FSL-tilfælde på tværs af DSN S/X/Ka-båndcentre; værste |ΔFSL| { "4.6e-3" } dB, |Δcarrier| { "2.5e-2" } dB)

seg-ca02c7483ba8 = lunar_time::tests (rate i lukket form; round-trip); tests/lunar_coordinate_time_reference.rs (LTC's egenpotentiale og sekulære ratebidrag mod offentliggjorte værdier fra Ashby & Patla { "2024" } + geocentrisk hastighed for Månen mod JPL DE440)

seg-7ef514b90798 = frame_eop::tests og realtime_frame_eop::tests (alle tre komponenter har lige, elementvis identiske, strengt stigende epokesæt over begge virkelige IERS-udtræk; det fælles sæt skrumper til fællesmængden, når de to Bulletin B-blokke reelt er uenige, og en horisont uden fælles rækker udelades i stedet for at blive udfyldt med nul; at tabellen over forudsagt mod endelig er tom, står i dokumentet i stedet for at være antydet af et manglende felt; en virkelig anden vintage udfylder den, krydskontrolleret række for række; en manglende senere vintage er en fejl, ikke en stiltiende tom tabel); tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (Tabellerne { "3" }, { "4" } og { "6" } i scenariet fra ende til anden: epokesæt eksakte, statistik for UT1 og pol inden for { "1e-9" }, kombinationen ved Månen inden for { "1e-5" } af en fuld ERFA-rotation, den angivne status for hvert tilfælde af forudsagt mod endelig); tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS { "1.001" } til { "1.100" } ved { "1" } til { "90" } dage); rækketælling: tests/embedded_eop_vintage_astropy_preregistered.rs (række med offline-input); regression fra runde 1: tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

seg-8d703fef00d5 = realtime_frame_eop, eop

seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (seks eksakte kriterier: udtrækkets bytes; { "174" } rækker; antal pr. vintage og fulde MJD-lister 30/54/90; flag P på både polbevægelse og UT1 for hver forudsagt række; tælling i standardkørslen uden argumenter; hver forudsagt række lig med IERS Bulletin A Vol. XXXIX No. { "039" } inden for sit sidst udskrevne ciffer, værste { "5.0e-5" } buesekunder og { "4.9e-6" } s); tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (regressionsfastlåsning af det gamle udtræk med 32 rækker under flagklassifikatoren: { "20" } endelige, { "12" } hurtige, { "0" } forudsagte); tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (fundet i runde 1, bevaret); realtime_frame_eop::tests; tests/operational_eop_predictor_reference.rs

seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 ({ "75" } forsinkelser ved { "25" } epoker nær J2000 over DSS-14, DSS-43 og DSS-63: forsinkelser inden for { "1" } ps, værste { "0.06" } ps; partielle afledede af fyr i legemefast system inden for { "1e-6" }, værste { "7.4e-9" }; partielle afledede af ITRF93-stationer inden for { "1e-6" }, værste { "3.8e-11" }); tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (krydskontrol af kerneevaluering); tests/naif_kernel_reader_check.rs; lunar_vlbi::tests

seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid ({ "600" } de440s.bsp-tilstande og { "200" } MOON_PA_DE440-rotationer ved { "200" } epoker 1849-2150 og tilfældige legemepar trukket ud fra præregistreringscommittens egen hash, mod SPICE og ANISE på udskårne kerner bit-identiske med NAIF's: værste forskel { "0.6" } % af tærsklen, { "1.95e-3" } m absolut); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (det samme på de fulde NAIF-filer, SHA-256 kontrolleret; datastyret); tests/naif_kernel_reader_check.rs (teknisk værn, ikke evidens); naif_kernel::tests; ephem_provider::tests

seg-92c70de528b4 = lunar_common_mode::tests ({ "8" } biblioteks-tests: opdelingen er additiv og rekonstruerer dy; en fælles-mode-kovarians giver et positivt fælles-mode-beskyttelsesniveau, mens en kovarians kun med paritet giver et næsten nul; projektoren annihilerer range(G)); tests/lunar_common_mode_integrity_reference.rs (motorens opdeling mod en uafhængig numpy-beregning på byte-identiske input over det indlæste udsnit med 366 epoker, relativ OG absolut fejl < { "1e-3" }); tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs ({ "1464" } paritetsbærende tilfælde på geometrien med 8 satellitter og en delmængde med 6 satellitter over begge virkelige par af indbyrdes efemerider: blind_dx, residual og normer inden for { "1e-12" } af |dy|, værste { "1.06e-14" })

seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

seg-63056b57baab = lunar_combination::tests (genfinder simuleret sandhed; VLBI genopretter stationens 3D-observerbarhed; deterministisk); tests/lunar_joint_multi_technique_od_reference.rs ({ "6" } geometrier × { "16" } parametre, { "31" } observationer hver, mod Orekit { "12.2" } / Hipparchus Levenberg-Marquardt på identiske observationer; genfunden tilstand værste |Δ| { "1.4e-8" } m); tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (seks net inklusive ét uden VLBI: Gauss-Newton-trin inden for { "4.3e-11" }, formelle sigmaer inden for { "1.9e-11" }, stationsfejl lige; på inputtene med { "0.36" } portabel matematik { "2.4e-11" } og { "1.3e-11" } på inputtene med { "0.30" })

seg-ef4de80a0e79 = fim

seg-6a5729ed13c5 = tests/fim_observability_reference.rs (egenværdier mod numpy.linalg.eigh; CRLB-kovarians mod σ²(XᵀX)⁻¹ via numpy.linalg.inv; GNSS GDOP/PDOP/HDOP/VDOP/TDOP fra informationsmatricen mod numpy — alle matchet til { "1e-9" }); fim::tests (Jacobi-egenværdiløser mod spektre i lukket form; CRLB mod Kay { "1993" } lukkede former — DC i WGN σ²/N og linjetilpasning σ²(XᵀX)⁻¹; Monte Carlo-opnåelse af CRLB; Moore–Penrose-identitet MM⁺M=M; nulrum for datumdefekt)

seg-454f4440a5c8 = lunar_frame_realise::tests (genfinder indsat Helmert-transformation); tests/lunar_reference_frame_realisation_reference.rs ({ "14" } tilfælde mod en uafhængig Umeyama-SVD-løser i lukket form; værste |Δ| translation { "2.0e-5" } m, rotation { "5.3e-12" } rad, skala { "9.3e-2" } ppb, RMS efter tilpasning { "6.1e-9" } m)

seg-86ded53b2aac = lunar_service::tests (DOP genbruger den validerede kerne; PL reduceres til sydpolstilfældet); tests/lunar_navigation_service_volume_reference.rs (MCI-position pr. satellit til <{ "1e-3" } m + EKSAKT sæt af synlige satellitter over hele sweepet af gitter×epoke mod ANISE { "0.10.2" })

seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim (de { "210" } primære AFS-Q-koder altid; med KSHANA_LANS_RUN og LSIS-cachen alle { "630" } koder, nul chipafvigelser); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (med LSIS-cachen: { "3" } rammer, nul symbolafvigelser; { "24" } indlæste vinduer på { "2" } ms, |rho| = { "0.999990" }); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (datastyret: hele kørslen på { "23.9" } s, |rho| = { "0.999990" }, værste blok på { "2" } ms { "0.999948" }, fase { "8e-9" } rad)

seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (med LSIS-cachen: de { "3" } rammer, LANS-AFS-SIM udsender, bygget af samme FID, TOI og databits: nul af { "18 000" } symboler afviger); tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (LSIS Figure { "8" }: 0x045 -> 0x229f61dbb84a0; CRC-24/LTE-A kontrolværdi 0xCDE703; kører altid); tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices ({ "100" } kodeord, nul uopfyldte kontroller af den trykte H); tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (dekoder alene ud fra H, uden støj og ved { "3" } dB Es/N0, og { "10" } fulde rammer); lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b; lunar_afs::frame::tests

seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels ({ "11" } kanaler: værste pseudorange { "1.6e-3" } m mod { "0.05" } m, kodefase { "5.5e-6" } chip mod { "2e-4" }, Doppler { "7.4e-5" } Hz mod { "0.02" } Hz, sigtevinkler { "4e-9" } grad mod { "1e-4" }, synligt sæt identisk); tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing (orakelharnessen gengiver programmets egen trykte kanalliste præcist)

seg-80e62d2d7748 = lunar_service::tests (topocentrisk mod geometri udregnet i hånden: lige overhead, ret nord/øst/vest, antipodal og den degenererede polare østretning; det eksporterede synlighedsflag stemmer med det uafhængige synlighedsfilter over et fuldt sweep på { "6" } h; eksporten er slået fra som standard og ændrer påviseligt intet andet; beskyttelsesniveauer er præcist lineære i den eksponerede sigma, mens geometrien nedenunder er urørt); tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites ({ "768" } samples over { "8" } steder, { "12" } epoker og { "8" } satellitter mod ANISE { "0.10.2" }: azimut og elevation inden for { "1e-6" } deg, afstand og stedets position inden for { "1" } mm; værste { "2.2e-12" } deg, { "2.1e-13" } deg, { "5.6e-9" } m)

seg-5613845e8514 = attitude_dynamics::tests (apply/solve invers, sfærisk top uden moment, fikspunkt på hovedakse, bevarelse af energi+impulsmoment i korte kørsler, q̇=½q⊗ω, fortegn for rate på symmetrisk top + præcession i legemekeglen); tests/attitude_dynamics_reference.rs ({ "200" } 000-trins momentfrie kørsler: |q|={ "1" } til { "1e-10" }, kinetisk energi T=½ωᵀIω bevaret til { "1e-9" } rel, |Iω| og den inertiale impulsmomentvektor bevaret til 1e-9/1e-8 rel, begge på en triaksial og en generel ikke-diagonal inerti; præcession i legemekeglen for symmetrisk top, oblat + prolat, gengivet til { "1e-6" } mod det analytiske λ=ω₃(I_a−I_t)/I_t); tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (to generelle ikke-diagonale inertier, { "1e4" } s momentfrit mod Basilisk { "2.9.1" } spacecraft hub med RKF78: kvaternion inden for { "1e-9" }, værste { "3.3e-11" }; legemerater inden for { "1e-9" } rad/s, værste { "3.4e-12" })

seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

seg-8edf60f6eb8c = cw_dynamics::tests (Φ({ "0" })=I, afkoblet SHM på tværs af sporet); tests/cw_dynamics_reference.rs (Φ i lukket form mod en uafhængig RK4-integration med fast trin af de samme Hill-ODE'er til <{ "1e-6" } over en tredjedel af en bane; Φ(t)Φ(−t)=I til { "1e-9" }; den afgrænsede betingelse ẏ₀=−2n·x₀ lukker hele tilstanden efter én periode til { "1e-9" } uden sekulær drift langs sporet over { "10" } baner; en ren radial forskydning driver den analytiske −12π·x₀ pr. bane); tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (fire tilfælde ved { "100" } m over en tredjedel af en bane på { "500" } km: værste { "1.15e-7" } m mod { "1e-3" } m); tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (det lineære Φ alene: { "1.2" } til { "6.3" } mm, fastlåst)

seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

seg-e9749b2960a2 = tests/entry_stardust_published.rs (spids { "35.44" } g mod de offentliggjorte { "33.4" } g, +{ "6.1" } %, tærskel { "10" } %; planetrelativ indflyvningshastighed { "12.551" } km/s mod { "12.6" }, tærskel { "0.1" } km/s); entry_eo_ascent::entry_heating::tests (energien i det roterende referencesystem falder præcist med modstandsarbejdet; vakuum-coast bevarer Jacobi-energien; ikke-roterende ballistisk tilfælde svarer til punktmassen i planet i modulet reentry; Allen-Eggers' lukkede form i sit område)

seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs ({ "3" } tilfælde, { "601" } samples hver: MRP værste { "2.4e-14" }, tærskel { "1e-9" }; legemerate { "1.6e-15" } rad/s, tærskel { "1e-9" }; hjulhastighed { "2.9e-11" } rad/s, tærskel { "1e-6" }; påført motormoment { "1.2e-13" } N m, tærskel { "1e-9" }; t = { "0" } momenter inden for { "1e-12" } N m; mætning nået i begge værktøjer); aocs::tests (impulsmoment bevaret, afbildning med minimumsnorm, MRP-gren, konvergens under mætning); aocs_kind::tests

seg-ec141da2fe8e = wahba

seg-7ece946b2cb0 = wahba::tests (A(identitetskvaternion)=I; Jacobi-egenværdiløseren opfylder Kv=λv og bevarer sporet på en kendt symmetrisk matrix; K er symmetrisk); tests/wahba_reference.rs (TRIAD, Davenports q-metode og QUEST gengiver scipy.spatial.transform.Rotation.align_vectors' optimale DCM på vægtede vektorsæt uden støj til <{ "1e-9" } rad via den referencesystemuafhængige attitudefejlvinkel; plus at q-metoden genfinder en kendt rotation med λ_max=Σ vægte og nul Wahba-tab, at q-metodens løsning minimerer Wahba-tabet under perturbation, at QUEST er enig med den optimale q-metode til <{ "1e-7" } rad, og at den optimale estimator slår TRIAD med to vektorer i RMS af attitudefejl over { "2000" } støjede Monte Carlo-forsøg)

seg-e35ff28ef879 = acquisition

seg-e6a7ff99874a = acquisition::tests (Marcum-Q centralt tilfælde Q_1({ "0" },b)=exp(−b²/2); identiteten P_d=Q_M(√(2Mρ),√γ); round-trip mellem P_fa↔tærskel på tværs af M og P_fa; monotoni i ROC — P_d stiger med SNR, falder med tærsklen, P_d→P_fa når SNR→{ "0" }; den ikke-kohærente integrationsgevinst hæver P_d ved fast P_fa; Marcum-Q monoton i a og b og afgrænset i [{ "0,1" }]); tests/acquisition_reference.rs (den generaliserede Marcum Q_M(a,b), P_d, P_fa og inversionen P_fa→tærskel matchet mod scipy.stats.ncx2/chi2 over et gitter af (M,a,b)/(M,P_fa)/(M,SNR) til ~{ "1e-6" })

seg-4f480ce145f7 = lambda

seg-7c55c072cfb7 = lambda::tests (L D Lᵀ rekonstruerer Q); tests/lambda_reference.rs (Z-transformationen er unimodulær |det Z|={ "1" } med Q_z=ZᵀQZ SPD, determinantbevarende og med lavere samlet korrelation uden for diagonalen; Schnorr–Euchner-ILS matcher opremsning ved brute force over { "300" } tilfældige kovarianser; hele kæden dekorrelér→søg→baglæns transformation er lig med den direkte ILS, og Z⁻ᵀZᵀ round-tripper heltal; den bootstrappede succesrate i lukket form matcher en Monte Carlo med 200k forsøg af sekventiel betinget afrunding til <{ "0.01" }); tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (de fikserede heltal er lig med RTKLIB v2.4.2-p13 lambda() på { "300" } tilfældige kovarianser, n { "2" } til { "10" }, { "226" } af dem kan ikke løses ved afrunding; de to bedste kvadrerede normer stemmer til { "1e-9" } relativt, målt { "5.6e-13" })

seg-18befb9e9596 = bplane

seg-5eb675d6585e = bplane::tests (flyby-skalarerne opfylder de lukkede former med to ensartede |B|-identiteter og |B|>r_p; drejningsvinklen aftager med periapsisradius og når grænserne δ→{ "0" } / δ→π; afbøjning bevarer v∞-hastigheden og roterer præcist med δ; assist-Δv's størrelse er lig med { "2" }·v∞·sin(δ/2) og afgrænset af { "2" }·v∞; B-plan-akserne er ortonormale og ⊥ Ŝ med |B|²=(B·T̂)²+(B·R̂)²; Tisserand-parameteren er invariant over for en afbøjning, der bevarer v∞ og ændrer a,e,i, og er lig med { "3" }−(v∞/v_circ)²); tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

seg-3111857b93df = crpa

seg-d333f700ca8a = crpa::tests (identiteter for komplekse tal inkl. z/z={ "1" }, |exp(jθ)|={ "1" }, zᴴz=|z|²; deterministisk nulstyring giver præcis enhedsforstærkning for SV og <{ "1e-9" } jammer-nuller på en ULA med 4 elementer og { "3" } jammere; en array med N elementer afviser >N−{ "1" } jammere og nulstyrer færre med minimumsnorm; MVDR forbliver forvrængningsfri mod SV, mens jammer-nullet dybere monotont med jammerens effekt til <{ "1e-3" } ved { "60" } dB); tests/crpa_reference.rs (MVDR- og minimumsnorm-nulstyringsvægtvektorerne og de resulterende arrayresponsforstærkninger matchet mod en uafhængig numpy/scipy LAPACK-beregning til ~{ "1e-9" })

seg-97d39969aa50 = powerlaw

seg-213c2856bc78 = powerlaw::tests (hver ren støjtype viser sin karakteristiske ADEV-log-log-hældning — hvid FM −½, flicker-FM { "0" }, random-walk-FM +½, hvid PM −{ "1" }; flicker-FM-leddet er et fladt gulv lig med √({ "2" } ln2·h_{ "{" }-1{ "}" }) over fem dekader af τ; FM-familiens tilpasning round-tripper kendte h_{ "{" }-2{ "}" },h_{ "{" }-1{ "}" },h_0 fra en syntetisk kurve til <{ "1e-6" }; og en flicker-domineret kurves gulv genfindes her, mens drifttilpasningen (quantum_trade::qparams_from_adev_curve) er >{ "10" }% forkert ved lang τ — hvilket lukker et dokumenteret hul); tests/powerlaw_oadev_reference.rs (σ_y(τ) matchet mod allantools { "2024.06" } Noise.adev i lukkede former over τ-stigen for alle fem støjtyper, plus en korroboration fra allantools' Kasdin-generator→oadev-estimator af niveauet h_a)

seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

seg-c3f4fe461c45 = oem::tests (en symmetrisk PD-kovarians round-tripper KVN→parse til f64-afrunding og forbliver symmetrisk; blokken udsender præcis de { "21" } elementer i nedre trekant — i+{ "1" } pr. matrixrække — med/uden COV_REF_FRAME; en blok med forkert antal værdier og en manglende blok afvises begge); tests/ccsds_oem_covariance_reference.rs (det uafhængige oem { "0.4.5" }-bibliotek parser et segment af en OEM udsendt af kshana og rekonstruerer den symmetriske { "6" }×{ "6" }, der matcher kshanas input-kovarians til f64-afrunding; med en perturberet negativ kontrol og en kontrol af, at oem afviser den mærkede CX_X-variant)

seg-5dd227be45fe = oem { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — den SAMME uafhængige CCSDS-502-parser, som rækken 'CCSDS OEM interoperability', der er valideret, bygger på, en helt separat kodebase (sin egen KVN-tokenizer, tilstandsmaskine for kovariansafsnit og numpy-matrixsamling). kshana udsender et fuldt OEM-segment med sin umærkede COVARIANCE-blok af bare tal i nedre trekant; oem parser den og rekonstruerer den symmetriske { "6" }×{ "6" }, der matcher kshanas input-kovarians element for element til f64-afrunding — en ægte udvekslings-round-trip mellem biblioteker (sammenlignet med oems rekonstruktion, ikke en kshana-genparsing), som lukker rækkens tidligere hul, 'no third-party fixture'

seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); scenarietype <c1/>

seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs ({ "48" } punkter, seks fejlled ved { "30" } s til { "3600" } s, Tactical-klasse, { "45" } deg N, vandret og pegende mod nord: hvert punkt inden for { "5" } %, værste +{ "3.70" } % hastigheds-random-walk ved { "1200" } s); inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast; a_bias_error_is_schuler_bounded; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model; a_full_reset_fix_makes_every_inter_fix_excursion_identical; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero; every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible); tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (fundet i runde 1 om førsteordenslovene for flad Jord, bevaret som regression)

seg-14054e77e0d4 = lunar_vlbi_fim::tests ({ "24" } biblioteks-tests: den analytiske Jacobian mod en central endelig differens af lunar_vlbi::vlbi_delay_s taget via en rute, der roterer tilstandens egne koordinater fremad og aldrig berører en partiel afledet, enig til < { "1e-6" } af 1/c pr. kolonne, med de to informationsmatricer enige til < { "1e-6" } af den største diagonal og kovarianserne til < { "1e-5" } relativt; en ortogonal enhedsgeometri, hvis kovarians er c·σ_τ pr. akse i lukket form til { "1e-12" }, som også er det ene tilfælde, hvor ækvipartitionsforbindelsen er eksakt; kovariansspektret og hvert stations 3D-sigma invariant under en stiv rotation af hele nettet til { "1e-9" } med C_rot = R·C·Rᵀ fastlåst blokvis OG en eksplicit kontrol af, at sigmaerne pr. akse flyttede sig, så testen ikke kan bestå tomt; kovarians skalerer præcist som σ² og som 1/N; AM-HM-sporgrænsen slås aldrig; delaylukningen τ_ik = τ_ij + τ_jk fastlåst til én ULP på forsinkelserne og på Jacobian-rækkerne, med en redundant baseline vist at tilføje information men aldrig rang; en enkelt epoke rapporteret rangdefekt med en nul-overskrift; en længere bue målt til at kondition bedre ved samme antal observationer; fyrblokken vist uobserverbar på denne tidsplan; den forsømte differentierede Shapiro-partielle afledede målt ved endelig differens under kørsel og udsendt i stedet for at blive vinket væk); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (forankret standardnet og frit net: SPICE-bygget Jacobian, tidsplanen med 16 observationer identisk, stationssigmaer inden for { "2.2e-3" }, egenværdier { "2.3e-3" }, kondition { "2.4e-3" }, overskrift { "1.0e-3" }, sigtelinje { "0.018" } deg, deklination { "0.007" } deg, mod tærskler på { "1" } % og { "0.1" } deg; frit net rang 8/9 med en nul-overskrift, nulrum { "0.006" } deg fra hinanden; NumPy på den indlæste Jacobian til { "2e-13" })

seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel

seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy ({ "16" } observationer identiske; rang 3/3; egenværdier inden for { "5.9e-5" }; kondition { "5.9e-5" }; fyrsigmaer inden for { "1.7e-3" } mod { "1e-2" }; RMS { "2.9e-5" }; lever arm { "1.4e-8" }; P2-sigmaer { "3.9e-14" } mod { "1e-9" }); lunar_vlbi_fim::tests

seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs ({ "7" } servicevolumentilfælde — sydpolart, mellembredde, ækvatorialt, forhøjet højland — { "6" } til { "19" } satellitter, σ_URE 10/30/60 m, P_HMI { "1e-3" } ned til { "1e-7" }, beskyttelsesniveauer fra { "1.7e2" } til { "6.9e3" } m: HPL/VPL mod den sammensatte RTKLIB + SciPy-reference, værste |Δ| { "1.061e-8" } m og { "1.044e-8" } m mod en tolerance på { "1e-6" } m; DOP mod RTKLIBs egen (GᵀG)⁻¹ til { "1.790e-14" } relativt; K_fa mod scipy.stats.norm.isf til { "2.716e-11" } relativt; tre negative kontroller — en satellitforskydning på { "5" } km, en relativ σ_URE-ændring på { "1e-6" } og en { "0.1" } % strengere P_HMI — hver målt til at flytte beskyttelsesniveauet med mindst { "171" }× toleransen; og et værn mod forældede fixtures, der fastlåser den indlæste geometri bit for bit til det, motorens egen konstellations- og synlighedskode frembringer, så en grøn status ikke kan overleve, at konstellationen ændres nedenunder)

seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

seg-68b534869ac3 = tests/araim_reference_vectors.rs ({ "2" } offentliggjorte vektorer + { "6" } negative kontroller, fixture tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt: at udelade den nominelle bias bommer på den offentliggjorte VPL med { "2.6457" } m, en ISM-fejl på { "10" } % med { "0.2798" } m, K_fa ved { "57" } modes i stedet for { "12" } med { "0.4015" } m, en integritetsvariansfejl på +{ "2" } %/+{ "5" } % med 0.0750/0.1971 m — og en fejl på +{ "1" } % flytter den kun { "0.0339" } m, rapporteret som kontrollens opløsningsgrænse i stedet for at blive skjult; de to dokumenters svar bommer hver på det andets med mere end toleransen, så vektorerne ikke kan byttes om; den indlæste fixture og de kompilerede konstanter er to uafhængige transskriptioner, der kontrolleres til at stemme, så et offentliggjort tal ikke kan redigeres i den ene side for at få en kontrol til at bestå; og C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² gælder for alle { "40" } transskriberede varianser, en aritmetisk identitet, som en slåfejl i transskriptionen ville bryde)

seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (sammensætter fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

seg-617e168e2460 = tests/lunar_llr_real_data.rs ({ "11" } tests: alle { "15" } indlæste CRD-filer byte-identiske med deres registrerede digests; alle { "349" } poster gjort rede for, { "337" } brugt og { "12" } sprunget over af en navngiven grund; hver arkiveret afstand inden for den virkelige perigæum-/apogæum-ramme; vægtene vist at VÆRE bin_rms/√n_raw; sigtelinjekoordinaten bedst bestemt for hver array, med librationssweepet, der køber det, målt separat; residualet og dets uafhængige bekræftelse mod JPL Horizons; følsomheden over for en geometrihældning på 0.1 grad; sammenligningen med den simulerede kampagne vist at være lig med en uafhængig kørsel af det scenarie; en R1-fastlåsning bit for bit af de tre eksisterende pakker til månens referencesystem); lunar_llr::tests ({ "12" }: afstandens partielle afledede mod en central endelig differens af den modellerede flyvetid til < { "1e-6" } relativt; lystiden en konvergeret rundtur til Månen; datumsigmaen præcist lineær i vægtskalaen til { "1e-9" }; blokdiagonalitet eksakt; en manglende datamappe afvist i stedet for erstattet; en redigeret katalogrække fanget af sin egen radiuskolonne); realdata::llr_crd::tests ({ "7" }: feltsemantik, midnatsovergang, afvisning af en tidsskala, der ikke er UTC, og af en formatversion, der ikke understøttes, og ingen erstatningssigma for en tom bin); tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, fastlåst; reported_residual_is_the_engine_to_spice_light_time_gap); tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points ({ "151" } usete normalpunkter fra 2025-Q2; sigmaer og normer værste { "1.11e-3" } af { "1e-2" }, kondition { "8.95e-4" } af { "2e-2" }, forhold { "1.79e-3" } af { "2e-2" }, bogføring, rang og kobling eksakte)

seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel

seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points ({ "447" } usete normalpunkter fra 2019-Q2; sigmaer og normer inden for { "4.0e-5" } af { "1e-2" }, kondition { "1.6e-5" } af { "2e-2" }, forhold { "7.6e-5" } af { "2e-2" }, bogføring og rang eksakte); tests/validate_llr_datum_kernel_moon.rs (diagnostikken på de sete data fra { "2015" }, { "0.049" } % på tz; ikke evidens for denne række); lunar_llr::tests

seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount ({ "12" } ugentlige geocentriske tilstande, vinklen i den værste epoke kontrolleret til < { "0.3" }° og RMS < { "5e5" } m mod modulets egen dokumenterede påstand, plus at LLR-residualet er enigt med den radiale uenighed til < { "5" }×); ::the_measured_residual_is_the_ephemeris_error ({ "337" } virkelige normalpunkter)

seg-e6eeb246d545 = integrity::tpl_scalar::tests (rang 1, fuse/exclude, bias-dominans, IR-krydskontrol); tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy ({ "300" } indlæste tilfælde: numpy lstsq-delmængdeestimatorer, generel separationskovarians, scipy brentq PL; PL inden for { "1e-9" } relativt, værste { "1.2e-10" }; drivende delmængde eksakt)

seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack ({ "201" } indlæste SPD-tilfælde: faktor, hvidgjort residual, hvidgørelsesoperator og kvadreret Mahalanobis mod numpy LAPACK inden for { "1e-12" } relativt, værste { "7.9e-16" })

seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling); tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack ({ "256" } indlæste tilfælde: alpha_ss, alpha_cm og minimum inden for { "1e-12" } relativt på { "210" } velkonditionerede tilfælde og randtilfælde, værste { "3.3e-15" }; { "40" } dårligt konditionerede op til kondition { "1.3e8" } inden for en angiven konditionsskaleret grænse, værste { "1.1e-9" }; seks eksakte uendeligheder)

seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference ({ "16" } syntetiske 7x7 SPD-matricer fra velkonditionerede til { "{" }{ "0,3" }{ "}" }-næsten degenererede; Schur lambda_min / oprindelses-CRLB / |corr| mod SciPy/NumPy til <{ "1e-9" } rel)

seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration); tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node ({ "2 000" } tilfældige epoker uden for knudepunkter mod SPICE pxform på den binære PCK: rotationsvinkel inden for { "1.7e-5" } rad, værste { "1.7e-6" } rad, { "3" } m ved middelradius)

seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)

seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic ({ "192" } ILRS-normalpunkter: RMS { "2.81" } m; de to ITRF2020-stationer alene { "2.96" } m; begge højst { "10" } m); tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (den afløste geocentriske lystidsmodel, { "10.94" } m, fastlåst)

seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows ({ "9" } egenværdier, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm og Schur-marginalen for { "{" }scale,offset{ "}" } for nettene well_posed med 120 rækker og single_epoch med 30 rækker, til rel<{ "1e-3" } og abs<{ "1e-3" }); lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

seg-9f0fd0918105 = lunar_gauge, lunar_time

seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields: L_m inden for { "2.8e-6" } af Ashby og Patla { "2024" } med J2 fra AIUB-GRL350A/B; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields: den radiale post inden for { "8.3e-5" } af pyshtools' ækvatoriale tyngde af grad 350; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed: hastighedsposten inden for { "2.5e-3" } af DE441's månehastighed ved { "2000" } epoker); lunar_gauge::tests; regression tests/lunar_rate_frame_coupling_oracle.rs

seg-57b6f02016e4 = lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation - en akseparallel nulbasis og dens rotation på { "0.6" } rad giver identisk defect, dim_spatial, dim_temporal, coupled_dim og p_st_norm; classify_direct_sum_null og classify_coupled_null - konstruerede tilfælde med direkte sum og reelt koblede tilfælde bekræfter dimensionsopdelingen; classify_basis_invariant; index_consts_are_correct); tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection ({ "72" } konstruerede 9x9 Fisher-matricer over { "18" } nulunderrum, hver i fire tilfældige ortonormale ombasiseringer: defect, dim_spatial, dim_temporal og coupled_dim eksakte; p_st_norm inden for { "6.0e-15" }, tærskel { "1e-9" })

seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible for { "3" } udbyderpar mod den uafhængige SciPy SVD lstsq-tilpasning i tests/fixtures/inter_ephemeris/reference.json, rel<{ "1e-3" } abs<{ "1e-3" } m; fixtures + reference byte-konsistente via scripts/gen_interop_ref.py på offentlige DE440/INPOP21a/EPM2021-kerner gennem IMCCE calceph)

seg-89624a7374e9 = tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows: den { "84" }×{ "84" } P⊥ element for element, trace(P⊥) = parity_dim = { "52" } og rank(G) = { "32" }, detekterbarhedsnormer + flag, den kvadratiske form for MDB cᵀWP⊥c + MDB-værdi og antal detekterede/identificerede ved block-spark for hver peer-koalition, gengivet mod en uafhængig numpy/scipy-reference til rel<{ "1e-3" } abs<{ "1e-3" } med heltalsantal eksakte; input byte-konsistente via examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)

seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)

seg-d4dfc8374544 = tests/telecom_timing_reference.rs ({ "17" } MTIE- og { "12" } TDEV-middelingsfaktorer på en indlæst holdover-serie fra et chipskala-atomur med { "2" } 048 sampler med aldring, flicker og temperatur, mod allantools { "2024.06" } til <{ "1e-12" } / <{ "1e-9" } relativt, observeret eksakt / { "1.1e-15" }; de samme kurver aflæst ud af en fuld telecom-timing-kørsel, der indlæser CSV'en); telecom_timing::tests (glidende MTIE lig med allan::mtie ved hvert vindue; MTIE og TDEV udregnet i hånden; monoton MTIE)

seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core); assurance::uncertainty (edf)

seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools; bar_4_wrappers_equal_the_core); tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline); tests/uncertainty_edf_reference.rs

seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record: tilpasning på den første tredjedel af registreringen, forudsigelse af overskridelsen af én sigma ved { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } og { "2.5" } ns, målt på de to andre tredjedele fra et synkroniseringspunkt hver { "997" } s; tærskel, fastsat før den første kørsel, en faktor { "1.5" } begge veje; observerede forhold { "0.84" } til { "1.03" }; en kontrol, hvor Allan-deviationen ved ét sekund læses som hvid FM, bommer med en faktor på omkring { "1 000" } og skal falde på tærsklen; en mutation, der halverer niveauet for hvid FM, får testen til at fejle); slot_timing::tests (a_measured_white_fm_record_recovers_its_level; reduces_to_the_holdover_inversion; ieee1139_conversion_matches_the_powerlaw_module)

seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

seg-436f7a545a7b = spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK({ "1" }) { "2.046" } MHz og BPSK({ "10" }) { "20.46" } MHz placeret numerisk på den lukkede form; boc11_lobes_are_centred_at_plus_minus_1_023_mhz — bærebølgenul, første nul ved { "2.046" } MHz, lobecenter { "1.023" } MHz og det eksakte maksimum ved { "0.7590" } MHz mod en uafhængig Newton-løsning af tan y = 2y; ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz, hver inden for { "0.02" } dB; q_values_match_kaplan_hegarty — CW ved bærebølgen Q = { "1" }, støj med matchet spektrum Q = { "1.5" }, flad støj fra nul til nul Q = { "2.215" }; mboc_is_a_unit_area_one_eleventh_mix)

seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)

seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data); spectrum::tests (fft_matches_a_direct_dft; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — gulv inden for { "2" } % af varians over samplingrate, samlet Parseval inden for { "2" } %, Hann-ækvivalent støjbåndbredde { "1.5" } bins; noise_like_synthesis_is_unbiased_through_welch — median af Welch minus model inden for { "0.1" } dB gennem en ci16_le-round-trip; synthesised_iq_through_sigmf_reproduces_the_model_spectrum); tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (Welch PSD mod scipy { "1.18.1" } signal.welch pr. bin til { "1e-12" } relativt over { "27" } tilfælde, observeret { "6.0e-14" }; fem sigmf-python { "1.13.0" }-optagelser afkodet bit-identisk med identiske metadata; optagelser skrevet af crate'n læst tilbage bit-identisk af sigmf-python og skemagyldige mod SigMF { "v1.2.6" })

seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)

seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (barycentre 1800-2050 fra Table { "1" } og { "3000" } BC-3000 AD fra Table { "2" }, { "8908" } og { "21857" } epoker, værste RMS { "0.778" } af tallet i Table { "8.10.1" }); tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms: Jorden gennem AnalyticSolarSystem og icrf_to_ecliptic, RMS { "0.483" } af EMB-tallet; icrf_positions_are_within_the_table_8_10_1_rms: ICRF-positioner for legemerne i Table { "1" } og Jorden, værste { "0.778" }; earth_minus_barycentre_offset_matches_de441_1950_to_2050: opdelingen i månens serie, værste { "0.088" } deg og { "6.1" } km); ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Regression uden afgørende rolle: tests/solar_system_horizons_reference.rs

seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales

seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs ({ "600" } positioner ved { "200" } UTC-epoker 1973-2026 trukket fra præregistreringens hash; værst { "0.66" } af tærsklen, { "2.96" } m); tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (datastyret); tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted; ephem_provider::tests

seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (barycentrene for Merkur, Venus, Mars, Jupiter og Saturn, Solen og Månen til Jordens centrum, { "1576" } epoker hver på interpolerede DE441-positioner, værst { "6.7e-9" } s mod { "1e-6" } s); ikke-afgørende nøjagtighedsangivelse for den analytiske sti: tests/solar_system_light_time_preregistered.rs (RMS c dLT { "0.17" } til { "0.30" } af positionstærsklen i tabel { "8.10.1" }); solar_system::tests

seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies ({ "41" } epoker { "1955" } til { "2044" }, { "574" } matricer inden for { "1e-9" } rad, værst Phobos { "1.43e-10" } rad); tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs ({ "41" } epoker { "1961" } til { "2038" }, aldrig sammenlignet før, { "574" } matricer inden for { "1e-9" } rad, værst Phobos { "1.38e-10" } rad); tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440 ({ "0" } af { "84" } konstanter for de fjorten legemer afviger fra NAIF)

seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (alle { "24" } RAAN- og middelanomali-rækker til { "1e-9" } deg); constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (ICD-slotformlen og et Walker 24/3/1 er de samme { "24" } par af knude og breddeargument); constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (sporets ækvatorkrydsning for alle { "36" } GPS-placeringer ud fra RAAN, breddeargument og timevinklen { "100.765" } deg: { "35" } inden for { "0.0108" } deg mod en afrundingstærskel på { "0.015" } deg, og E3F inden for { "0.06" } deg, fordi tabellens egen E3F-række er inkonsistent med sin RAAN og sit breddeargument med omkring { "0.06" } deg; den sekulære knuderegression inden for { "5" } % af tabellens -0.0402 deg/døgn); constellation::tests::walker_geometry_identities_are_exact (de tre afstandsidentiteter for delta- og stjernemønstre op til { "1 584" } satellitter, til { "1e-9" } deg)

seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (HDOP-median { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" }, middel { "0.965" } mod { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } og { "0.96" }, tærskel { "0.03" } for hver, fastsat før den første kørsel; PDOP-median { "1.795" } ved eller under { "1.815" } i tabel B.3-1 for en forringet blanding af 20-24 satellitter; tilgængelighed { "100" } % globalt og på det værste sted mod { "98" } % og { "88" } % i tabel 3.8-1); constellation::tests::single_epoch_dop_matches_the_hand_computation (zenit plus tre satellitter ved { "30" } deg elevation: HDOP 4/3, VDOP { "2.3094" }, PDOP 8/3, TDOP { "1.5275" }, GDOP { "3.0732" } til { "1e-9" }, og lig med orbit::dop med et fælles ur)

seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

seg-d2b3b13002dd = navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit — Si({ "1" }), Si(pi), Si({ "2" } pi) til { "1e-12" }; bpsk_power_in_band_closed_form_matches_textbook_and_numeric — { "0.9028" } af effekten i hovedloben for BPSK(1/3), BPSK({ "1" }), BPSK({ "5" }), BPSK({ "10" }), og den lukkede form lig med kvadratur til { "1e-7" } ved { "10" }, { "15" }, { "20" } og { "51.15" } MHz; bpsk_gabor_closed_form_matches_numeric_and_asymptote — til { "1e-4" } og asymptoten sqrt(B R_c / ({ "2" } pi^{ "2" })); bandlimited_dll_reduces_to_the_textbook_forms — kohærent early-late BPSK({ "1" }) ved { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms: { "0.0039564" } chips ({ "1.159" } m) inden for { "1" } %, den ikke-kohærente form lig med navsignal::dll_code_jitter_chips inden for { "1" } %, grænsen for forsvindende afstand lig med sin lukkede form til { "1e-5" }; offset_bpsk_ssc_matches_parseval_closed_form — forskydninger { "0" } til { "3.2" } R_c inden for { "0.01" } dB og -71.86 dB/Hz ved nul forskydning for BPSK({ "10" }); altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)

seg-56f381a3f611 = leo_signal (max_doppler_hz)

seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1 ({ "1593.3225" } MHz, { "1080" } km) { "33.2" } kHz inden for de offentliggjorte { "32" } til { "34" } kHz; Iridium ({ "1621" } MHz, { "780" } km) inden for { "0.5" } kHz af de offentliggjorte { "36" } kHz

seg-f1cdf8728c6b = Offentliggjorte tal: Xona Pulsar X1 maksimal Doppler { "32" } til { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridium-Doppler op til +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Jordens rotation er udeladt, hvilket flytter tallet med op til omkring { "2.3" } kHz; begge offentliggjorte tal nås uden den.

seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

seg-6ef512cefe4d = tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits: alle { "115" } rækker i tabel { "5" }, { "1" } GHz til { "1000" } GHz, hver koefficient inden for { "0.6" } af sit sidste trykte ciffer; værst observeret { "0.51" })

seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

seg-e1ab19315242 = tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples: { "56" } tilfælde på fem lokaliteter, { "14.25" } og { "29" } GHz, { "0.001" } % til { "1" } %, inden for { "1e-4" } dB; observeret { "5e-6" } dB)

seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

seg-8a35d6b6f974 = tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples: { "42" } tilfælde på syv lokaliteter, { "14.25" } og { "20" } GHz, inden for { "1e-5" } dB; observeret { "5e-7" } dB)

seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

seg-05bb3df0fcc5 = tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook: { "568" } værdier, { "28" } GHz ved { "0" } deg og { "2" } GHz ved { "45" } deg, begge klasser, P fra { "1e-7" } til { "0.998" }, inden for { "0.001" } dB)

seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

seg-09369862fb72 = tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio: gamma = (77/60)^{ "2" } til { "1e-12" }, forstærkning for L1/L2 og L1/L5 { "2.978" } og { "2.588" }; free_space_loss_is_the_friis_kilometre_megahertz_form: { "32.4478" } + { "20" } log d + { "20" } log f til { "1e-4" } dB); leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

seg-88f10ca1e3bc = tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1: Pulsar IOV { "520" } km { "97" } deg, Pulsar FOC polar { "1080" } km { "97" } deg, Pulsar FOC skrå { "1080" } km { "53" } deg og GPS { "20180" } km { "55" } deg; omløbshastighed, maksimal ECEF-hastighed, maksimal relativ hastighed og maksimal bærebølge-Doppler i L1- og L5-båndet, { "20" } værdier, hver inden for { "0.05" } %)

seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

seg-64d379a46dbc = leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table — GPS { "0.979" } og 1/48.9, GLONASS 1/45.0, Galileo { "0.984" } og 1/61.1, BeiDou MEO 1/54.2, geostationær { "0.992" } og 1/126.2 ved en maske på { "0" } deg, hver inden for { "0.005" } af w_R og { "0.5" } af 1/w_AC^{ "2" }; leo_weights_shift_toward_the_transverse_axes — horisontens nadirvinkel { "67.8" } deg ved { "510" } km)

seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — fire rigtige Galileo-broadcast-efemerider E10, E19, E24, E25 ved tk = { "0" }, +/-600, +/-1800, +/-3600 s, hver akse inden for { "1" } mm af RTKLIB; real_galileo_records_survive_the_binary_frame_and_the_text_block — inden for { "5" } mm efter den binære Kshana-ramme og { "1" } mm efter blokken i RINEX-stil)

seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

seg-577acdb9b84b = leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value — 0xCDE703 for ASCII-strengen { "123456789" }; crc24q_matches_the_rtcm_1005_example_frame — de tre kontrolbytes 0x360B98 i eksempelrammen RTCM { "10403" } for meddelelsestype { "1005" } og nul over hele rammen)

seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (monoton vækst fra { "1" } til { "15" } minutter og mindst tre gange bedre ved { "15" } minutter); leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (reduceret-dynamiske baner fra TU Graz ITSG for GRACE-A, GRACE-C, Sentinel-2A og Sentinel-6A tilpasset over buer på { "20" } og { "30" } min: RMS i along-, cross- og radialretning { "0.804" } til { "1.087" } og SISRE { "0.716" } til { "0.809" } af Liu et al. { "2025" }, inden for 1.5x; SISRE-vægte inden for { "0.0007" } af dens tabel { "2" }); tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit { "12.2" } + Hipparchus { "3.1" }, samme begyndelsestilstand og tæthedsinput: værst { "3.95" } mm tolegemeproblem, { "3.92" } mm J2-J6 og EGM2008 til grad { "20" } og { "70" }, { "4.55" } mm EGM2008 grad { "20" } med luftmodstand ved { "400" } km, tærskel { "0.02" } m over { "6" } h); intern krydskontrol, ikke en uafhængig reference: tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (fire dage fra artiklen: forhold for along, cross, radial og SISRE { "0.755" } til { "1.138" } af Liu et al. { "2025" }, inden for 1.5x); tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (otte tilbageholdte dage, to buer hver: { "0.683" } til { "1.186" })

seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

seg-4693b7ddd7b2 = leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared — L1-værdien er RTKLIBs { "6.1278" } m; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day); tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar ved L1, L2 og L5 over { "4 320" } tilfælde, værst { "7.0e-13" } m; Az over { "222" } koefficientsæt, herunder alle-nul og reglerne for { "400" } sfu, værst { "5.7e-14" } sfu; UTC-drift over { "50" } tilfælde, værst { "3.6e-15" } s; de tre skudsekundtilfælde over { "21 602" } tidspunkter hen over de rigtige skudsekunder i { "2015" } og { "2016" }, { "0" } s)

seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

seg-a8dd3751a688 = tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz: én satellit ved { "780" } km og { "86.4" } deg fløjet i et døgn ved { "1621" } MHz over fire breddegrader, maksimum inden for { "5" }% af { "36" } kHz; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz: én satellit fra hver offentliggjort skal, { "1080" } km ved { "53" } og { "97" } deg, { "1593.3225" } MHz, konstellationens maksimum inden for { "32" } til { "34" } kHz uden udvidelse ({ "33.6" } kHz, bestemt af skallen på { "97" } deg; skallen på { "53" } deg alene topper ved { "31.8" } kHz)); leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

seg-50b92f3ed7eb = leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0: { "0.4157" } m i hånden ved { "5" } MHz, { "45" } dB-Hz, { "0.1" } s; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one); tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs (konfigurationer A og B, { "4040" } stikprøver: jordfaste positioner inden for { "6.8e-5" } m, tærskel { "0.2" } m; antal i sigte identiske på 4040/4040; median-DOP inden for { "2.3e-11" } relativt, tærskel { "1e-3" }; tilgængelighed og middelantal i sigte identiske); tests/earth_orbit_path_sgp4_erfa_oracle.rs (stien); leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (runde { "2" }, geometri på givne tilstande); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (fund fra fuldt krav i runde 1, fastlåst)

seg-bd265d530763 = lunar_frame_campaign, fim

seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: tre scenarier — stationer estimeret på en ny kampagnedato 2026-03-18 (bindende), stationer fastholdt på den dato (kontrol), stationer estimeret på 2024-01-01 (scenariet fra den tidligere fejl i dobbelt præcision); hver datum-sigma, konditionstallet og den svageste retning mod en konditionsskaleret tærskel genberegnet i testen ud fra den uafhængige references eksakte følsomheder; engine_inputs_match_the_committed_fixture: den indskrevne Jacobian, vægtene og Helmert-udformningen er det, motoren bygger nu; record_engine_accuracy_against_a_factorisation_route: motorens fejlbånd og NumPy Cholesky-diagnostikken er fastlåst)

seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: fire scenarier — stationer estimeret på en ny kampagnedato 2026-06-09 (bindende), stationer fastholdt på den dato (kontrol) og inputtene med stationer estimeret for 2026-03-18 og 2024-01-01; hver datum-sigma, konditionstallet og den svageste retning mod en tærskel i kvadratrodsform genberegnet i testen ud fra den uafhængige references eksakte bestanddele; engine_inputs_match_the_committed_fixture); linalg_sr::tests ({ "9" } bibliotekstests: Dekker-produktet lig med residualet fra fused multiply-add på { "20 000" } par, kompenseret summation af en udslukkende sum, R^T R lig med A^T A, sekventielle filteropdateringer lig med én batchopdatering, den afsluttende blok lig med kvadratroden af Schur-komplementet, den trekantede invers, Jacobi-SVD, overensstemmelse med det spektrale datum i et velkonditioneret tilfælde, bitidentiske genkørsler); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected og the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

seg-02fed5e55709 = receiver_trust (ingest, maritime)

seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle) mod tests/fixtures/maritime_trust/reference.json, genskabt af scripts/gen_maritime_trust_ref.py ud fra den syntetiske NMEA skrevet af examples/gen_maritime_trust_ref_inputs.rs; tolerancer præregistreret i tests/fixtures/maritime_trust/PREREGISTRATION.md

seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

seg-5699d8162c69 = tests/nmea_training_reference.rs (sammenligning med den uafhængige reference pynmea2); tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it, ::every_sentence_type_is_present_each_epoch, ::deterministic_per_seed_and_sensitive_to_it

seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes ({ "12" } NACp-koder, { "59" } NIC-rækker); tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding ({ "94" } rammer); tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely ({ "1770" } punkter, fire cellestørrelser); tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib ({ "8" } ruter, { "420" } stykker, { "11634" } km); tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj ({ "996" } punkter); enhedstests for interference_map

seg-a14a79333731 = telemetry (prometheus: Registry, render; otlp: build_payload, Exporter (feature otlp); sample)

seg-bce7247612db = tests/telemetry_formats_reference.rs (prometheus_client_reads_our_exposition_as_the_registry_implies, the_official_otlp_proto_reads_our_json_as_the_registry_implies, awkward_reason_text_survives_the_parser, the_committed_outputs_are_what_this_crate_produces; skema { "1.3" }: prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies, the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies, promtool_accepts_the_schema_13_exposition, the_collector_receives_and_exports_the_schema_13_payload_unchanged); tests/telemetry_cli.rs; telemetry::prometheus::tests (facit-udlæsning)

seg-40e8b0a596fb = telemetry (syslog: cef, rfc5424, SyslogSink; time)

seg-baadfddd02b2 = tests/cef_reference.rs (pycef_reads_every_tier_1_event_as_the_sample_implies, the_logstash_cef_codec_reads_every_event_including_escaped_headers_as_the_sample_implies, the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered); telemetry::syslog::tests (eksakte CEF-strenge, escaping, alvorlighed, kuvert efter RFC { "5424" }); tests/telemetry_cli.rs

seg-66f38fc734a7 = evidence (bundle: create_bundle, sign_detached, chain_link, sha256_hex; verify: verify_bundle, verify_detached; tsr; assemble; cli)

seg-d50f70b4c20a = tests/evidence_crypto_reference.rs (RFC { "8032" } afsnit { "7.1" } vektorer { "1" }, { "2" }, { "3" } og { "1024" }; FIPS 180-4 SHA-256-eksempler; eksakt); tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case ({ "71" } tilfælde); tests/evidence_pack.rs (manipulationstests)

seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl (den præregistrerede sammenligning); evidence::tsa::tests (kalenderdatoer og -tider, base64, den offentlige RSA-operation); evidence::verify::tests::anchors_make_the_authority_checked (et usigneret token fejler med ankre; uden dem er rapporten uændret)

seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

seg-0094102cc5b8 = tests/testbench_reference.rs ({ "7" } tests: fastlåste uafhængige referencer, eksportbytes, værste tilfælde over hver række, positionskolonner, lokal hastighed mod sand NED-hastighed, Euler-vinkler mod scipy, NMEA mod pynmea2); tests/interop_testbench.rs (skriverens egne rundrejser)

seg-3266b898bfd2 = iq::signals::beidou (b1i_bits, b1i)

seg-ba514f7e73ce = iq::signals::gps (l1c_weil, l1c_ranging_bits, l1c_p_bits, l1c_d_bits, l1co_s1_run, l1c_o_bits); iq::signals::tables

seg-9e651a7f8dc9 = tests/iq_signals_gps_l1c.rs (c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2, c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3, c3_legendre_sequence_matches_is_gps_800j_table_6_2_1, the_column_check_rejects_relabelled_inverted_and_shifted_codes)

seg-b289551b0bb5 = iq::signals::lunanet (afs_i_bits, afs_q_primary_bits, legendre_bits); iq::signals::lunanet_tables; iq::lunanet_afs::check_spec

seg-176e3b9ea0e7 = tests/lunanet_afs_codes.rs (b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1, b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay, b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay); tests/iq_signal_matrix.rs (lunanet_afs_i, lunanet_afs_q)

seg-6bb40f180cf0 = <s1>Forrige</s1>Valideringsstatus

seg-defb46c5bc80 = <s1>Næste</s1>Funktionsreference

seg-65185cb68d6b = Fejlbudget for navigation og tidssynkronisering for en kæde af missionsfaser fra opsendelse til indflyvning (<c1/>)

seg-86a132e1a243 = Typen <c1/>: et dokument af faser, hver en af otte registrerede typer, kørt i rækkefølge, hvor 6x6-kovariansen, uret og referencesystemet gives videre efter en angiven regel (<c2/>; <c3/>, hvid accelerationsstøj over et angivet hul på en retlinet model; <c4/>, dødregning og derefter kildens gulv, aldrig under det, aldrig en nulstilling); konverteringer af referencesystem GCRF, MCI og MCMF og af tidsskala via TT, hver sin budgetrække, med Månens tilstand fra et valgfrit udsnit af DE440-kernen og den analytiske serie som den angivne reserve; marginen mod et angivet krav, det svageste led, hændelserne og en tidslinjefigur. Hvert tal er et angivet input eller en model af et

seg-cf8a0dc4088e = Håndberegninger i testene (den retlinede vækst i kovariansen, den gennemsnitlige sideriske rotation, den sekulære månetid) og, kun for Månens tilstand, de indlagte udsnit af DE440-kernen mod fastlåste JPL Horizons-værdier (værst { "2.6" } m og { "7e-6" } m/s). Ingen missionsdata sammenlignes med kæden; dens faser er rækker for sig. Dokumentet er en angivet kæde med ILLUSTRATIVE input, kun offentlige kilder og ingen støtte fra nogen rumfartsorganisation

seg-87b2b2459b45 = Opsendelse og opstigning til en parkeringsbane med GNSS-erhvervelse og fading (<c1/>)

seg-725e7ce83533 = Fasen <c1/>: en position- og hastighedskovarians med konstant hastighed og hvid accelerationsstøj (dødregningsklassen), en GNSS-positionsbestemmelse med angivet nøjagtighed anvendt efter erhvervelsestiden og uden for angivne fadings, et ur med bias og drift, der disciplineres af de samme positionsbestemmelser, og tilstanden ved indsætning i parkeringsbanen

seg-22e5c301626e = Riccati-ligevægtstilstanden og håndberegningen af prædiktionen i testene. Intet her modellerer en løfteraket eller en modtager; hvert tal er et angivet input

seg-eb66a49b0306 = Relativ navigation til dockingomhyllingen i lav jordbane over sensorstrækninger (<c1/>)

seg-658a0448d80d = Fasen <c1/>: den relative tilstand i målets LVLH-akser med den lukkede Clohessy-Wiltshire-overgang, en 6x6 Kalman-kovarians med hvid accelerationsstøj og positionsopdateringer, hvis varians er sensorens ved den aktuelle afstand, over strækninger af en angiven sensor (ILLUSTRATIVE optisk kamera, lidar og radioafstandsmåling); dockingvinduet er tiden fra det tidspunkt, hvor den relative sigma holder sig inden for indfangningsomhyllingen, til fasens slutning. Jagerens absolutte kovarians gives videre uændret, og en række siger det

seg-97f4aa0575e6 = En énaksel-håndberegning af prædiktion og opdatering i testen; Clohessy-Wiltshire-overgangen er den, som cw_dynamics kontrollerer mod en uafhængig numerisk integration. Sensorerne er ILLUSTRATIVE, og intet virkeligt rendezvous sammenlignes

seg-b45a8a357faf = Trans-lunar injektion og cislunart krydstogt: propageret middeltilstand og kovarians med sporingsopdateringer (<c1/>)

seg-ab5c79789754 = Fasen <c1/>: middeltilstanden fra motorens Cowell-propagator (Jorden som punktmasse og J2, Solen og Månen som tredjelegemer, Månen fra trådens DE440-kerne, hvor den dækker segmentet, og Solen fra den analytiske serie); kovariansen ved en fremadrettet differens-tilstandsovergangsmatrix af denne propagering (den nominelle kørsel og seks forstyrrede kørsler pr. segment) med hvid accelerationsstøj; TLI-brændingens størrelse og retningsfejl; <c2/>-positionsbestemmelser, hvis tilgængelighed og PDOP kommer fra feltet af rumservicevolumen langs en oskulerende bane, der står i for buen; afstands- og afstandshastighedssporing langs den geocentriske retning skaleret med jordnetværkets driftsandel, med opdatering på Joseph-form

seg-86dae517e339 = Liouvilles sætning (determinanten af tilstandsovergangsmatricen for den konservative del er en) og en finere differens i testene; middeltilstanden sammenlignes med en offentlig bane i rækken nedenfor, som den ikke rammer. Brændingsfejlen, opdateringerne og kovariansen sammenlignes ikke med noget

seg-7a3eb4fae324 = Kovarians ved indflyvningsgrænsefladen, korridorsandsynlighed, maksimal deceleration og landingsfodaftryk (<c1/>)

seg-93f07906d7bf = Fasen <c1/>: returkysten for <c2/> uden brænding, der ender ved indflyvningsgrænsefladen; flyvebaneafvigelsen og dens sigma fra den fulde kovarians ved en gradient med endelig differens; sandsynligheden for, at vinklen ligger inden for en angivet korridor; den maksimale deceleration ved den nominelle vinkel og ved begge korridorkanter fra motorens plane ballistiske punktmasse-indflyvning (skip-out registreret) ved siden af den lukkede Allen-Eggers-form; landingsfodaftrykket fra en angiven følsomhed i nedrækkevidde og grænsefladekovariansen på tværs af banens plan. Hverken løft, styring eller opvarmning modelleres

seg-8d5695aad35b = Håndberegninger i testene (vinkelsigmaen er den vinkelrette hastighedssigma divideret med farten; Gauss-massen i en korridor). Den plane indflyvning er motorens egen, og Allen-Eggers-formen er en lukket sammenligning; ingen fløjet indflyvning sammenlignes

seg-3f0951532f6e = Jordnetværkets dækning og sporingsandel for en trådfase (<c1/> i <c2/>)

seg-5204af351299 = Jordnetværkets overlay: stationer med en mindste elevation, køretøjets sigtbarhed på en angivet geometri (indflyvningstilstanden fløjet to-legemer med J2, Månens position for krydstoget eller en angivet andel), stationsoverdragelser, der hver taber en angivet tid, og den resulterende andel, der gives videre til fasens opdateringsrate for jordsporing; det længste interval uden station i sigte er en budgetrække

seg-0d1d229a3ab7 = Kontroller af zenit- og antipodegeometri og den forventede sigtbarhed af et fjernt mål i testene. Intet virkeligt netværk, ingen antenne og ingen tidsplan modelleres

seg-4ba700726208 = Relativ navigation til docking i en månebane (<c1/>)

seg-2e30e78e49f7 = Typen og fasen <c1/>: et fælles batch-Gauss-Newton-estimat for to køretøjer over buen (enogtyve parametre: begge tilstande og vedvarende positionsbiaser i signal-i-rummet, fælles og uafhængige), opbygget over en fjerdedel, en halvdel og hele buen med trinhalvering, ud fra en absolut positionsbestemmelse pr. køretøj (grænse for AFS-pilotkodesporing, ILLUSTRATIVE relæsæt) og en krydslinkafstand, under cratens månekraftmodel; den gennemsnitlige normaliserede estimeringsfejl i anden, Clohessy-Wiltshire-kontrollen på en cirkulær bane og den 6x6-kovarians, der gives videre

seg-09fa0c35d004 = Selvkonsistens under en præregistrering (xval/mission-thread-lunar/PREREGISTRATION.md, resultater og estimatorens historik i RESULTS.md): den gennemsnitlige NEES for den relative tilstand er { "5.85" } til { "5.93" } mod båndet { "5.2" } til { "6.8" } i fire konfigurationer, MET på det fjerde estimatordesign, efter at tre sekventielle filterdesign missede; referencen og estimatoren deler én kraftmodel, så dette siger intet om modelfejl. Den propagator, den deler, sammenlignes med LRO og CAPSTONE i en række nedenfor

seg-c85d7e5e63a3 = Budget for landingsspredning på et polart sted på Månen (<c1/>)

seg-bd88ab3ad105 = Typen og fasen <c1/>: en inertiel fejlmodel med fem tilstande pr. akse (position, hastighed, accelerometerbias, hældning, gyrobias) over en drevet nedstigning, støttet af AFS-positionsbestemmelser (selvstændige eller differentielle, med det urstøttede tilfælde med tre relæer), en terrænrelativ positionsbestemmelse (motorens terrain-nav-matcher på syntetisk relief eller en Cramer-Rao-grænse på en LOLA-DEM med en apertur-problem-regel) og månetid, med en Monte Carlo-ellipse for berøringspunktet

seg-a5ddb83a5cf1 = Den lukkede inertielle drift, de genbrugte typers egne resultater og kalibreringen af 3-sigma-ellipsen (andelen inden for stemmer overens med forventningen) i testene. Ingen fløjet eller afprøvet landing sammenlignes

seg-8dfc1600cf8c = Tilgængelighed af positionering og tidssynkronisering på overfladen efter sted og årstid ved månepolerne (<c1/>)

seg-f91c1da9ab55 = Typen og fasen <c1/>: relætilgængelighed og PDOP, sigtbarhed af Jorden og Solen og et disciplineret overfladeur for hvert sted og hver årstid, med terrænhorisonten fra <c2/>; en kørsel for ét sted er lig med den types tilgængelighed og PDOP til sidste bit

seg-e3a782dce8be = Nøjagtig lighed med den eksisterende type for ét sted og monotonikontroller i testene. Relæsættet er ILLUSTRATIVE, og ingen overflademåling sammenlignes

seg-0db91d70a079 = Drevet opstigning fra et polart sted på Månen til en indsætningsbane (<c1/>)

seg-b5b1125d515c = Typen og fasen <c1/>: den inertielle fejlmodel med fem tilstande pr. akse kørt over en drevet opstigning med specifik kraft langs banen, støttet af AFS-positionsbestemmelser og månetid, som rapporterer den position- og hastighedskovarians ved indsætning, der føres til banen, og spredningen ved motorafbrydelse (rapporteret, ikke ført videre)

seg-76e0d23b7483 = Den lukkede inertielle drift og monotonikontroller i testene. Ingen fløjet opstigning sammenlignes

seg-1983ce9cc6da = Propageringen med månekraftmodellen mod offentlige rekonstruerede baner for månesatellitter og cislunare baner

seg-57f53a7d1fa2 = Den propagator, månetyperne deler (GRAIL GL0660B grad og orden { "150" }, Jorden og Solen som tredjelegemer, relativitet, DE440-månorientering), sammenlignet med de offentlige JPL Horizons-baner for LRO ({ "24" } timer, prøver hvert { "10" }. minut) og CAPSTONE (ét omløb på { "6.5" } dage, prøver hver time), under tærskler fastsat i en indlagt fil før kørslen

seg-321d0721970d = JPL Horizons-efemerider for LRO og CAPSTONE mod tærskler præregistreret i xval/mission-thread-lunar/PREREGISTRATION.md (Ændringerne { "1" } til { "6" }). LRO: MET, { "33" } m største 3D-forskel og { "2.4" } m RMS radialt mod { "500" } m og { "60" } m. CAPSTONE: NOT MET, en forskel i slutposition på { "136.8" } km mod { "25" } km og en forskel i periapsis på { "28.4" } km mod { "10" } km, årsagerne ikke isoleret. Rækken er modelleret, fordi CAPSTONE-tærsklen ikke nås, og sammenligningen afprøver den delte propagator, ikke noget filter, signal eller budget

seg-c557d317389a = Propageringen af den cislunare middeltilstand mod den offentlige bane for Artemis I (<c1/>)

seg-539d4c3e9b56 = Propageringen af middeltilstanden i fasen <c1/> (Cowell, Jorden som punktmasse og J2, Solen og Månen som tredjelegemer, Månen fra et DE440-udsnit) sammenlignet med den offentlige JPL Horizons-bane for Artemis I over en kystbue på { "72" } timer fra 2022-11-16 { "18" }:{ "00" } TDB, ved epoker hver { "12" }. time, under tærskler fastsat i en indlagt fil før kørslen

seg-362b1a7b9e5e = JPL Horizons-mål -1023 (NASAs navigationsbane som fløjet efter TLI), mod tærskler præregistreret i xval/mission-thread/PREREGISTRATION.md (Ændring { "1" } ændrer kun anmodningens spænd). NOT MET og fastslået som misset: { "45.3" } km største positionsforskel mod { "5" } km og { "0.249" } m/s hastighedsforskel ved { "72" } timer mod { "0.05" } m/s. En diagnose skrevet efter afgørelsen placerer missen i fem impulsive hastighedstrin på { "0.09" } til { "0.22" } m/s i referencen (den præregistrerede opfattelse, at vinduet ikke rummede nogen brænding, var forkert); over de øvrige { "67" } timer gengiver modellen den næste timetilstand med en median på { "0.38" } m. Afprøver kun middeltilstanden for én kystbue: ingen kovarians, intet filter, ingen opdatering og ingen anden fase

seg-150ae9c3d755 = Interferenskildeområde: et muligt senderområde ud fra positionsrapporter fra fly og skibe

seg-b5c49044a7a1 = Et muligt område for, hvor en kilde til forringede navigationsrapporter kan være, ud fra positionsrapporter fra ADS-B (NIC/NACp) eller AIS: radiosigtlinje på en 4/3-jordradius fra rapporthøjden og et højdeinterval for senderantennen, en begrænset effektiv rækkevidde for den ukendte effekt, hvor berørte enheder trækker posterioren mod deres rækkevidde, og uberørte enheder med sigtlinje skubber imod, grupperet i sessioner i tid og rum. Output er områder med højeste tæthed ved angivne konfidensniveauer, et posterior-tyngdepunkt med en momentellipse, sessionens start, slut, varighed, berørt areal og antal forskellige fly over offentliggørelsesminimum, en døgnprofil og timer pr. dag. Uden terræn; én kilde pr. session; troværdigheden er betinget af modellen. Valgfri fusion med en TDOA-positionsbestemmelse fra geolokalisering.

seg-953a8b4f9f41 = Endnu ingen ekstern. Kun syntetiske frem-og-tilbage-kørsler fra en generator, der deler estimatorens model, så de kontrollerer koden og kalibreringen af de angivne niveauer under den model og intet om virkelige sendere. En ekstern kontrol mod de offentliggjorte senderpladser i Jammertest { "2025" } blev præregistreret (docs/emitter-region/PREREGISTRATION.md, frigivet af ejeren før enhver scoret kørsel) og kørt én gang (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } planlagte sessioner, færre end det registrerede minimum på { "4" }) og AIS NOT ASSESSABLE (ingen offentliggjort session), så ingen tærskel blev afprøvet, og rækken forbliver MODELLED

seg-e9650a618b38 = ID

seg-308cb3c31a16 = mission_thread (scenario, handover, conversions, budget, phase)

seg-65bd744f29c6 = mission_thread::scenario::tests::a_thread_runs_hands_over_converts_and_names_the_weakest_link; mission_thread::scenario::tests::bad_documents_fail_with_the_reason; mission_thread::handover::tests::inflate_never_shrinks_a_sigma_and_matches_the_hand_calculation; mission_thread::handover::tests::reacquire_sets_an_axis_to_the_floor_only_where_the_floor_is_smaller; mission_thread::conversions::tests::mci_mcmf_round_trip_returns_the_state_and_the_covariance; mission_thread::conversions::tests::tt_to_ltc_shifts_bias_and_drift_by_the_secular_rate_and_back; mission_thread::conversions::tests::the_committed_kernel_cuts_agree_with_pinned_horizons_values; tests/field_units_global.rs (the report's units block)

seg-9e5314dc6b0a = mission_thread::earth::launch (LaunchAscent)

seg-083f9245ff63 = mission_thread::earth::launch::tests::with_gnss_the_sigma_settles_near_the_fix_and_an_outage_lets_it_grow; mission_thread::earth::launch::tests::before_acquisition_the_sigma_only_grows_and_a_longer_acquisition_is_worse; mission_thread::earth::launch::tests::a_phase_that_does_not_list_gnss_never_uses_it; mission_thread::earth::launch::tests::bad_models_and_entries_are_refused; mission_thread::earth::filter::tests::repeated_updates_reach_the_riccati_steady_state

seg-da26dd6773fb = mission_thread::earth::rendezvous (LeoRendezvous); cw_dynamics; mission_thread::sensors

seg-940d19eaea64 = mission_thread::earth::rendezvous::tests::the_relative_sigma_falls_through_the_legs_and_opens_a_docking_window; mission_thread::earth::rendezvous::tests::without_relative_sensing_the_sigma_only_grows_and_no_window_opens; mission_thread::earth::rendezvous::tests::the_covariance_recursion_matches_a_one_axis_hand_calculation; mission_thread::earth::rendezvous::tests::bad_models_and_a_duration_mismatch_are_refused; mission_thread::sensors::tests::the_cross_range_error_grows_with_range_and_the_floor_dominates_up_close

seg-88b5123a7c1f = mission_thread::earth::tli_cruise (TliCruise); propagator; ssv::sweep

seg-be98276d9788 = mission_thread::earth::tli_cruise::tests::the_stm_is_symplectic_for_the_conservative_part_and_matches_a_finer_difference; mission_thread::earth::tli_cruise::tests::with_no_tracking_the_covariance_is_the_stm_propagation_of_the_entry_and_the_burn; mission_thread::earth::tli_cruise::tests::range_tracking_shrinks_the_line_of_sight_and_leaves_the_plane_of_the_sky; mission_thread::earth::tli_cruise::tests::the_thread_kernel_serves_the_moon_inside_its_window_and_the_series_outside; mission_thread::earth::tli_cruise::tests::gnss_ssv_fixes_are_applied_where_the_sweep_finds_four_signals; mission_thread::earth::tli_cruise::tests::a_phase_that_lists_a_source_the_model_lacks_is_refused_and_unknown_keys_too

seg-6057015a7a7c = mission_thread::earth::entry (Entry); reentry

seg-dcb831f6f492 = mission_thread::earth::entry::tests::the_flight_path_angle_and_its_sigma_follow_the_velocity_error_over_the_speed; mission_thread::earth::entry::tests::the_corridor_probability_is_the_gaussian_mass_inside; mission_thread::earth::entry::tests::the_phase_reports_the_interface_the_corridor_the_peaks_and_the_footprint; mission_thread::earth::entry::tests::the_steep_edge_peaks_higher_and_a_limit_below_it_is_flagged; mission_thread::earth::entry::tests::bad_corridors_unknown_keys_and_burn_keys_are_refused

seg-f937752c7a50 = mission_thread::earth::ground_network::tests::a_vehicle_over_a_station_is_seen_and_one_on_the_other_side_of_the_earth_is_not; mission_thread::earth::ground_network::tests::the_moon_is_in_view_of_three_well_spread_stations_most_of_the_time; mission_thread::earth::ground_network::tests::handover_losses_reduce_the_duty_and_never_below_zero; mission_thread::earth::ground_network::tests::a_stated_duty_is_passed_through_and_bad_documents_are_refused; mission_thread::scenario::tests::the_overlay_sets_the_tracking_duty_of_a_phase_that_lists_ground_tracking

seg-75f11c7aa6bc = lunar_rendezvous (LunarRendezvousScenario); lunar_phase; mission_thread::lunar

seg-995afbdc6a9f = lunar_rendezvous::tests::b1_mean_nees_is_inside_the_registered_band_in_all_four_configurations; lunar_rendezvous::tests::circular_cw_check_is_within_the_pre_registered_bar; lunar_rendezvous::tests::same_seed_gives_identical_documents; lunar_rendezvous::tests::b6_handover_without_a_measurement_only_propagates; mission_thread::lunar::tests::every_phase_runs_and_returns_a_modelled_outcome; tests/mission_thread_lunar_oracles.rs

seg-2c293a58fb25 = lunar_landing (LunarLandingScenario); lunar_phase; terrain_nav

seg-7ac44470d95d = lunar_landing::tests::b4_with_no_aid_the_landing_error_is_the_closed_form_inertial_drift; lunar_landing::tests::b4_each_aid_reports_exactly_what_the_reused_kind_gives; lunar_landing::tests::b3_ellipse_calibration; lunar_landing::tests::a_plane_gives_no_fix_the_aperture_problem; lunar_landing::tests::a_bowl_matches_the_closed_form_bound; lunar_landing::tests::three_relays_make_the_fix_depend_on_the_clock

seg-dd3ab355cb4f = lunar_surface_map (LunarSurfaceMapScenario); lunar_phase

seg-6b6210646fdd = lunar_surface_map::tests::b5_equals_the_service_volume_for_a_single_site; lunar_surface_map::tests::b5_equals_the_service_volume_with_the_real_terrain; lunar_surface_map::tests::terrain_never_adds_availability; lunar_surface_map::tests::timing_is_at_least_either_source_and_the_season_moves_the_earth_and_sun; lunar_surface_map::tests::same_inputs_give_identical_documents

seg-b95197d3e058 = lunar_ascent (LunarAscentScenario); lunar_phase

seg-977149f40c72 = lunar_ascent::tests::with_no_aid_the_insertion_error_is_the_closed_form_inertial_drift; lunar_ascent::tests::the_aid_never_hurts_and_the_velocity_is_carried_with_its_correlation; lunar_ascent::tests::a_stale_tt_clock_costs_a_three_relay_fix; lunar_ascent::tests::the_same_inputs_give_identical_documents

seg-48ac8187364f = lunar_od (LunarForceModel); precise_od; mission_thread_lunar_oracles (example)

seg-7372185d4dd9 = tests/mission_thread_lunar_oracles.rs::the_stored_numbers_meet_or_miss_the_registered_bars_as_recorded; tests/mission_thread_lunar_oracles.rs::the_fixtures_match_their_recorded_hashes

seg-7089ca12dbe0 = mission_thread::earth::tli_cruise; propagator; mission_thread_oracle (example)

seg-f4b44b14d819 = tests/mission_thread_oracle.rs::the_stored_numbers_miss_the_registered_bars_as_recorded; tests/mission_thread_oracle.rs::the_diagnostic_places_the_miss_in_five_impulsive_events_not_in_the_force_model; tests/mission_thread_oracle.rs::the_kernel_cut_and_the_recorded_inputs_match_their_hashes

seg-67fdcdfdb635 = interference_map::emitter (estimate, sessions, build_units, profile, GaussianFix::from_tdoa), interference_map::emitter_out (locate), <c1/>

seg-920b26e226ab = enhedstests af interference_map::emitter (projektion frem og tilbage, horisontfigur, syntetiske kørsler frem og tilbage: den kendte sender ligger inden for det angivne område med omtrent den angivne rate, grænsetilfælde, sessionsklyngedannelse, profil, privatliv og formulering); tests/interference_map_cli.rs locate-tilfælde

seg-db7a6ac0a47d = Det komplette, maskinkontrollerede evidensregister: <b>{ "412" } rækker — { "176" } VALIDATED, { "232" } MODELLED, { "4" } PARTNER</b>. En række kan kun være VALIDATED med en uafhængig ekstern reference (matrixens invarianttests håndhæver dette). De samme data, med klikbare links pr. række til hver test, hvert modul og hver indlagt fixture, er <em>Validation ledger</em> på <a1>https://kshana.dev</a1>. Se <a2>MODELLED-RATIONALE.md</a2> for, hvorfor hver modelleret række ikke er valideret eksternt.

seg-1cc523709234 = { "412" } rækker: { "176" } valideret eksternt, { "232" } modelleret, { "4" } ejet af partnere.
