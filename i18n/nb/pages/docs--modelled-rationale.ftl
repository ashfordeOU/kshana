# docs--modelled-rationale: translations (nb)

seg-2db69c58f694 = Differensiell PNT på Månen

seg-1ff1d8ebf1e7 = Compliance-kartlegging mot offentlige rammeverk

seg-aab745a65e76 = Modul

seg-d6476863f862 = Funksjon

seg-60a43431ebe0 = Krav

seg-bde1b3a94a47 = SRP-skygge med lemmørking av Sola (valgfri)

seg-eaaec545dd68 = SRP-belyst andel som den uokkulterte andelen av den lemmørkede solfluksen (lov av Eddington-tilnærming I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kvadratur) over en sfærisk eller WGS-84-Jord (srp_shadow::limb_darkened_shadow, ShadowModel-varianten OblateEarthLimbDarkened)

seg-9e15970435c3 = DE440 Sol og Måne i Cowell-kraftmodellen (valgfritt)

seg-de6831cf7785 = Valgfritt efemeridenivå for tredjelegeme- og SRP-leddene i den numeriske Cowell-ForceModel: den geosentriske Sola og Månen fra en hvilken som helst EphemerisProvider (en DE440 SPK-kernel gjennom KernelEphemeris) ved TDB = TT + (TDB - TT), som avviser en leverandør som ikke kan betjene epoken og teller enhver reserveløsning til den analytiske serien; som standard av

seg-057c21daf4f2 = S1 atmosfærisk tidevann (valgfritt)

seg-f600a39f297e = Det daglige S1-lufttrykkstidevannet som en perturbasjon av geopotensialet: Biancale og Bode ({ "2006" }) modell N1, grad { "2" } til { "6" }, gjennom lastformelen i IERS { "2010" } likn. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valgfritt i Cowell- og de presise kraftmodellene (air_tide_s1, som standard av)

seg-e8f5ff8c9149 = Kulefunksjonsgravitasjon av høy grad (EGM2008 til { "2190" })

seg-d3b2f32dcecb = Underflytsikker og polsikker evaluering av et fullt normalisert felt til grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, modifisert fremoverkolonne etter Holmes-Featherstone { "2002" } med gradienten fri for 1/cos phi), en strømmende ICGEM .gfc-laster (from_gfc_file / from_gfc_reader; hele EGM2008 hentes ved kjøring, ikke medfølgende), og Holmes-Featherstone-evaluatoren som kan velges på den valgfrie Cowell-Geopotential

seg-1960804ef2f4 = Batch-banebestemmelse med avstandsrate og az/el med stasjonsmaskering

seg-4c185244bc66 = Gjenvinn en epoketilstand fra blandet sporing av avstand, avstandsrate og azimut/elevasjon over en elevasjonsmaske med Gauss-Newton på H = (dh/dx(t)) Phi(t, t0): analytiske partielle deriverte av målingene og en variasjonell tilstandsovergangsmatrise med analytiske todelslegeme- + J2-deriverte (RK4-integrert, ikke en STM i lukket form)

seg-bc3d1ee7c639 = Vekting av observasjoner etter SP3-nøyaktighetskode

seg-63b1fab84f85 = Avbild SP3-nøyaktighetskoder (header ++-eksponenter i { "2" }^n mm, %f-basen, standardavvik base^n mm per post) til posisjonssigma per observasjon for motoren for presis banebestemmelse (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ae3e8833a5ef = Fest et publisert gravitasjonsfelt til et legeme

seg-ffb2b20e5f32 = with_gravity_field (på Body, i src/gravity_pds.rs): fest et hvilket som helst lastet kulefunksjonsfelt (for eksempel GMM-3 eller GL0660B) til en Body slik at propagatoren evaluerer det legemsfast; valgfritt, standardlegemer uendret

seg-9762cf428435 = Koderere for navigasjonsmeldinger utover GPS LNAV (GPS CNAV, Galileo I/NAV og F/NAV)

seg-9b703b9607d8 = GPS CNAV-meldingstyper 10/11/30, Galileo I/NAV-ordtyper 1-5 i nominelle partalls-/oddetallssider og Galileo F/NAV-sidetyper 1-4: ICD-feltpakking og kvantisering, CRC-24Q, konvolusjonskoding med rate 1/2 K={ "7" } (G2 invertert for Galileo), blokkinterleaving og synkroniseringsmønstre, med tilsvarende testdekodere

seg-974d8c1f7876 = Hatch-bærebølgeutjevning av kode på virkelige RINEX-observasjoner

seg-f26b5da0f52e = Divergensfritt Hatch-filter (ionosfærefri kode båret av den ionosfærefrie bærebølgen, vindu på N epoker, omstart ved tap av lås, geometrifritt hopp eller gap) i sammenstillingen for presis enkeltpunktsposisjonering

seg-278ca396127a = Lesing av RINEX { "4" }-observasjonsfil

seg-e0883aa933eb = RINEX 4.0x observasjonsheadere (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiketter matchet i kolonne 61-80 for versjon { "4" } og senere) og epokeposter

seg-33e5c74720ff = Kringkastet satellittposisjon for BeiDou GEO

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } posisjon for geostasjonær satellitt fra en kringkastet efemeride (treghetslignende system, deretter Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valgfritt gjennom feltet include_beidou_geo i NavParseOptions, så standardleseren fortsatt hopper over GEO

seg-71f48628ebb2 = Tett koblet GNSS/INS med bærebølgefase og float-flertydigheter

seg-5a156aa81275 = Error-state EKF over { "15" } INS-tilstander, en mottakerklokke med to tilstander og én float-bærebølgeflertydighet per sporet satellitt; pseudoavstand, bærebølgefase og valgfri avstandsrate fra en SGP4 Walker-konstellasjon (lysgangstid og Sagnac), Klobuchar- og Saastamoinen/Niell-korreksjoner anvendt i sløyfen ved filterets egen posisjon; deteksjon av sykluskutt med tidsdifferensiert bærebølge og en terskel per satellitt utvidet med hastighetsusikkerheten; reinitialisering av flertydighet ved sykluskutt og gjenerverving

seg-7d644516b1ec = GNSS/INS-pakker for sjø, bane og luftfart med valgfri tett kobling

seg-cbb03a8baf73 = Tre gnss-ins-scenarioer på banebiblioteket (et fartøy som slingrer med { "8" } m/s med et avbrudd på fem minutter; et tog gjennom en skjæring med to satellitter og en tunnel; et fly der avbruddet dekker en sving med 25 graders krengning) og pakkens valgfrie [tight]-tabell: pseudoavstander fra en SGP4 Walker-konstellasjon fusjonert av navigatoren med lukket sløyfe, hver satellitt over masken når nominelt og de høyeste få når degradert

seg-f4dab73c4eda = Koblet PNT-filter for pseudoavstand med biastilstand og 3D-utvidelse i fusjonspakken

seg-742b60089361 = Ett stablet Kalman-filter over posisjon, hastighet, klokkefase og frekvens matet med pseudoavstander som kobler posisjon og klokke (oppdateringer i Joseph-form som bærer kryssovariansen); en variant med 1 DOF utvidet med en konstant akselerometerbias-tilstand som fusjonspakken kjører under [coupled]; og 3D-versjonen med 8 tilstander med siktlinjerader

seg-2db2b9dc3b45 = GNSS/INS-banebibliotek og import av CSV-referanse

seg-e1fe83c75a6c = Valgbare bevegelsesprofiler for gnss-ins-pakken (rett, figur-8, urbant stopp-og-kjør, flyoppstigning og koordinert sving, kartleggingsdrone), definert ved Euler-rate- og kommandoer for akselerasjon langs sporet, lukket på referansetilstanden med den kinematiske IMU-en (sentripetal-, gravitasjons- og Coriolis-ledd), og importert CSV-referanse omformet til den IMU-en som gjenskaper den; den historiske kjøringen er uendret når ingen profil er gitt

seg-86f9186bb884 = Jord–Måne CR3BP { "9" }:{ "2" } NRHO mot banen CAPSTONE fløy

seg-d4127cf241f3 = Den sirkulære begrensede { "9" }:{ "2" } L2 sørlige nesten-rettlinjede haloen som cr3bp::differential_correct_halo korrigerer (banefamilien for Gateway og CAPSTONE), sammenlignet på middelgeometri (periode, perilune-radius, apolune-radius) med banen CAPSTONE faktisk fløy. Et mål på hvor godt CR3BP-medlemmet beskriver den virkelige banen; en CR3BP-bane er ikke en bane i en efemeridemodell og sammenlignes ikke epoke for epoke

seg-1a5623c81b48 = Posisjonsfeil fra geometri: RMS-feil = sigma_UERE x DOP for motorens minstekvadratløsning

seg-7a94b44a8738 = dop_error_mc::run_geometry og check: en seedet Monte Carlo (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) av motorens egen iterte minstekvadratløsning (pvt::solve_spp, enhetsvekter, løst fra den sanne posisjonen) på de { "8" } geometriene i tests/fixtures/dop/dop_reference.csv, som sammenligner varianser av feil mot øst, nord, opp og klokke, RMS for H/V/P, korrelasjonen øst-nord, middelfeilene og andelen innenfor den horisontale ellipsen på { "95" } % med sigma^{ "2" } Q, der Q er kovariansfaktoren i orbit::dop-kjernen (orbit::dop_cofactor, den samme aritmetikken) på den samme geometrien

seg-9acfde1b57f7 = Geometribevisst tillitsklassifisering: satellittgeometri ved siden av tillitsscore for mottakeren og en klasse på hvert fradrag

seg-6138c41e13ff = receiver_trust::geometry: satellittgeometri per epoke (god, degradert med årsakene few-satellites/high-pdop/high-hdop/sky-blocked, eller ukjent når loggen ikke gir GSV, NAV-SAT eller GSA) utledet fra de rapporterte elevasjonene og azimutene gjennom orbit::dop eller hentet fra GSA, med en etikett som alltid rapporteres og aldri skåres (god, middels, dårlig, ukjent) og HDOP, PDOP, VDOP, antall satellitter og signaltap i ord; en geometrimonitor i skåren for fartøy som ikke trekker noe med mindre geometrien er dårlig (forholdet max(hdop/4, pdop/6, 5/n_used) over { "1" }), og deretter trapper opp til et tak på { "15" } poeng ved { "1.5" } som geometri alene ikke kan ta under det degraderte båndet (tak, sluttpunkt for trappen og gulv i [geometry]; ingen alarm); en klasse på hvert fradrag (geometri, miljø, inkonsistens) der tap av lås til satellitter under { "15" } grader klassifiseres som geometri, satellitter i sikte men ikke sporet klassifiseres som miljø, og et fradrag for dårlig geometri der den oppgitte HDOP ligger utenfor max({ "1.0" }, { "25" } % av den utledede HDOP) fra den oppgitte himmelen klassifiseres som inkonsistens

seg-bbb1828b3db1 = Gatekløft-, sektor- og terrengreduksjoner til en tabell

seg-2864aec7be88 = skyline: gatekløften i lukket form (kuttet atan((h - a) / d) med d = (w/2) / abs(sin(az - s)), åpne ender for en endelig lengde), skarpkantede sektorer med klokken med omslag, og terrengpunkter redusert til en tabell med krumningsfallet d^2/({ "2" } * 4/3 R); horisonten er deres punktvise maksimum sammen med en eventuell tabell

seg-3f3d657854ce = Horisont-forhåndsinnstillinger (bygate, havneinnseiling, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: fire REPRESENTATIVE geometrier med utformingsnotatets oppgitte dimensjoner og en opphavslinje hver: city-street (en kløft, gate { "0" } deg, { "20" } m mellom { "30" } m høye vegger, antenne { "1.5" } m), harbour-approach (sektorer: åpen mot sjøen over { "180" } deg, kaibygninger { "8" } deg over { "90" } deg, moloen { "3" } deg), fjord (terreng: vegger { "600" } m over antennen i { "1.5" } km avstand på hver side av en nord-sør-gående kanal, krumningsfall anvendt), container-terminal (sektorer: stabler { "12" } deg over den landvendte halvdelen, kranarmer { "35" } deg og { "25" } deg over to smale sektorer); kan overstyres felt for felt

seg-6012113b4836 = Himmelgeometrifunksjoner: synlighet, DOP, kovarians, feilellipse, Monte Carlo-sky

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> og <c2/>, Python- og WASM-funksjoner med samme navn, MCP <c3/>): fra et sted, et tidspunkt og konstellasjonsforhåndsinnstillinger (eller satellitter som asimut/elevasjon eller ECEF) de synlige og maskerte satellittene under en horisont, GDOP/PDOP/HDOP/VDOP/TDOP, enhetsvarians-kofaktoren (H^T H)^-1 og kovariansen i øst-nord-opp med én mottakerklokke per system eller én felles, den horisontale feilellipsen (halvakser k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientering { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) fra nord), og n seedede minstekvadraters feil under uavhengige gaussiske avstandsfeil med deres empiriske kovarians, RMS og { "95" } % omslutning. Kofaktoren er orbit::cofactor_from_los, den ene kjernen bak orbit::dop og orbit::dop_cov (dop er en reduksjon av dop_cov): ingen andre DOP-implementasjon

seg-7f66be0f15c8 = Klokke-holdover uten GNSS

seg-4d8f87668a0f = Vekst i coast-feil i lukket form + holdover-til-terskel; kvanteklokkeklasser

seg-29b482d88916 = Målte enhetskort for klokker (tilbakeholdt prediksjon)

seg-8c68c5b25004 = clock_library: et enhetskort (hvit fase, hvit, flicker og random-walk FM pluss en lineær frekvensdrift) tilpasset en tredjedel av en navngitt målt klokkeregistrering etter et logget kondisjoneringstrinn (hull, faseutliggere, fasesprang og utbrudd fjernet; frekvenssprang logget), vektet etter de lag-1-identifiserte frihetsgradene for støytype, og dets predikerte Allan-avvik vurdert på de tilbakeholdte to tredjedelene; lesere for RINEX- og IGS-klokkefiler, BIPM-filer per laboratorium og Circular T seksjon { "1" }; konvertering av et kort til støymodellen for tidsluketiming, den utvidede Kalman-klokkemodellen og støynivåene til spoofing-monitoren

seg-5097a0e6460d = Målte klokkekort for GPS Block IIF med ledd per omløp (tilbakeholdt prediksjon)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: et enhetskort som bærer fasetermene fra én til fire per omløp (periode T/k, T = { "43 082.05" } s), tilpasset sammen med det kvadratiske leddet ved minste kvadrater på en tredjedel av en målt satellittklokkeregistrering, med hvert leds Allan-bidrag i lukket form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } i det predikerte Allan-avviket

seg-0d72fcc0fbea = Tilstandsestimering for klokke om bord

seg-6db5391f8ebe = Kalman-klokke med 3 tilstander (fase/frekvens/drift), van Loan, Joseph-stabilisert

seg-3f0a9d7c2971 = Feilbudsjett for tidsoverføring

seg-216f46b43860 = Toveis/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→avstand

seg-157fadeb5d67 = Analyse av navigasjonssignalets modulasjon og kodesporing

seg-ab633d191396 = BPSK-R/BOC PSD, spektral separasjon κ, Gabor-båndbredde, DLL-jitter, flerveisfeil

seg-e6c08e1e6ae3 = Ytelse for kvantetreghetssensor

seg-d28e1f6a430f = Akselerometer med kaldatominterferometer fra grunnleggende prinsipper (k_eff·T², QPN)

seg-4b79d03cecf5 = Kvantetreghetssensor: fringe-flertydighet / dynamisk område

seg-deb2850546d5 = Dynamisk område for fringe-flertydighet i Mach–Zehnder: den 2π-periodiske fringe-avlesningen setter en maksimal entydig spesifikk kraft a_max=π/(k_eff·T²), og det entydige området i oppløsningsceller a_max/σ_a=π/σ_Φ er uavhengig av den optiske skalafaktoren — T²-sensitivitetsgevinsten koster entydig område i nøyaktig samme takt (utspørringstiden bytter oppløsning mot område, og antall celler ligger fast ved avlesningens fasestøy)

seg-d04bf321d4a1 = Resiliens for kvantetreghetsbasert dødregning

seg-c4989abb5d40 = Sammensatt posisjonsbudsjett for bias + skalafaktor + VRW + stabilitetsforfall over holdover

seg-5692c7b936b6 = Resiliens mot jamming uten GNSS

seg-f4ff77caa47b = Geometrisk J/S-linkbudsjett, anti-jam C/N₀, tap av lås per satellitt

seg-ff90679d1de9 = Spoofing-deteksjon

seg-b843f63e77e6 = Klokkestøttet χ², RAIM, AGC og SQM, fusjonert til en sikkerhetskvalitetsmåling per epoke

seg-b10d07921f5e = Beskyttelsesnivå for tidssynkronisering under spoofing

seg-2a829711b997 = Grense i lukket form for verste-tilfelle uoppdaget tidsfeil = monitorgulv + oscillatorens coast-σ over CUSUM-deteksjonslatensen, rapportert som et bånd for rødstøygulvet

seg-f1d49eac89f8 = Alternativ / komplementær PNT

seg-023dda973f66 = Matching mot tyngdekart, terrengreferert (TERCOM/SITAN), magnetisk anomali

seg-791e7285c291 = Reproduserbarhet og programvaresikring

seg-7177355a482c = Deterministisk, scenariohashet, SBOM + gylne porter på tvers av plattformer

seg-241f2eeaef12 = Merket syntetisk korpus av forstyrrelser + detektoruavhengig harness for ROC/AUC/forvekslingsmatrise/Pfa-Pmd; lekkasjevern, stratifisert deling, rapport om optimisme ved fordelingsskifte (innenfor mot utenfor regime). Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/impairment-eval.toml)

seg-642087659fda = Kontrollert syntetisk studie av AUC-optimismegapet fra innenfor til utenfor fordelingen på tvers av publiserte metoder og lærte detektorer (logistisk regresjon / MLP med ett skjult lag): trender i skaleringslover per klasse (Spearman ρ + stigning på { "1" }−alvorlighet) og en ridge-prediktor bare fra fordelingen som estimerer gapet fra diagnostikk innenfor fordelingen alene, vurdert med utelatelse av én detektor og utelatelse av én klasse. Kan gjengis via <c1/>

seg-fd6424213d1f = Avveining mellom kvante og klassisk PNT og resiliens uten GNSS ({ "13503" })

seg-21b2b54200a8 = Inntak av målt ADEV (NNLS), avveiingstabell (holdover for tidssynkronisering og treghet + gevinst), resiliens-mot-tid-omhylling; forbeholdet om gulvet følger med artefakten. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/quantum-trade.toml)

seg-1fa865bfddd1 = Romværmiljø og aktivitetsdrevet termosfærisk tetthet

seg-47308f611c7e = Sol- og geomagnetiske indekser (definisjonstabell Kp↔ap), eksosfærisk temperatur etter Jacchia-1971 og termosfærisk tetthet etter Jacchia { "1971" } (SAO Special Report { "332" }: statiske diffusjonsprofiler som gjengir dens tabell { "7" }, med døgn-, geomagnetiske, halvårs-, sesong-breddegrads- og heliumvariasjoner) mot den statiske atmosfæren USSA76. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/space-weather.toml)

seg-c76b8c395ef0 = Oppskytingsvindu og stigningsgeometri (misjonsanalyse)

seg-6066c634faba = Oppskytingsasimut(er) i tolegemeproblemet (sin Az = cos i / cos lat), minste nåbare inklinasjon, sirkulær hastighet, østgående bonus fra jordrotasjonen, dogleg-planendrings-Δv og daglige muligheter, og, gitt en epoke og IERS finals2000A-rader, stedets hastighet om den sanne polen (launch::site_rotation_speed_at). Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistisk inngangskorridor ved gjeninntreden (Allen–Eggers)

seg-c3f3422f96e4 = Maksimal retardasjon (uavhengig av ballistisk koeffisient), hastighet og høyde ved maksimal g, og hastighet ved maksimal oppvarming for en ballistisk innflyvning i en eksponentiell atmosfære. Kan kjøres fra CLI/bindinger som scenariotypen <c1/> (scenarios/reentry.toml)

seg-7b4a8e25c3c9 = Adaptiv koding og modulasjon i DVB-S2 langs en LEO-nedlinkpassasje

seg-3912fb8ccb15 = Es/N0 i nedlinken langs hver passasje for én satellitt over én stasjon (EIRP, frirommstap, atmosfærisk tap etter cosecant-loven, andre tap, G/T, Boltzmanns konstant, symbolrate), den mest effektive DVB-S2-MODCOD som klarer terskelen for kvasifeilfri drift i ETSI EN { "302" } 307-1 V1.4.1 tabell { "13" } pluss en implementasjonsmargin i hvert steg, passasjens ACM-datavolum, og grunnlinjen med konstant koding som lukker ved masken og lengste avstand. Kan kjøres som scenariotypen <c1/>. Illustrative inndata; MODELLED.

seg-19603a7e0fe8 = Kontaktplanlegging for flere satellitter og flere stasjoner med konfliktløsning

seg-40edeae6e48b = Kandidatkontakter fra hver passasje satellitt-stasjon med dens ACM-datavolum; konflikter der én antenne ville betjent to satellitter innenfor sin omstillingstid eller én satellitt ville nedlinket til to stasjoner samtidig; et prioritetsvektet leveringsmål begrenset oppad til hver satellitts etterslep; en lat marginalverdi-grådig plan, en førstemann-til-mølla-grunnlinje og en eksakt branch and bound på opptil { "26" } kandidater, med optimalitetsgapet til den grådige planen rapportert. Kan kjøres som scenariotypen <c1/>. Illustrative inndata; MODELLED.

seg-3742d2aea62a = Nøktern ramme for kostnad per dekning / ROI

seg-4228311689f8 = Kostnad per prosent dekning + dekning per euro som ROI over dimensjoneringsmotoren for konstellasjoner; kostnad per satellitt er et lav/nominelt/høyt intervall oppgitt av den som kaller (ingen oppdiktede priser)

seg-8ba6ee9acc8a = Integritetsvirkning av uoppdaget miss (kontekstbevisst HPL/VPL mot alarmgrense)

seg-f5985399d0d5 = Avbilder en uoppdaget spoof-/jam-bias til effektiv feil → Stanford-område (tilgjengelig/utilgjengelig/MI/HMI) mot kontekstspesifikke HAL/VAL (åpen himmel mot by)

seg-37d43b5b918a = Parameterark for CAI med siterte feilmodeller ({ "13503" })

seg-0b6a901f5ad2 = Ytelse for kaldatominterferometer i intervall (beste/nominell/konservativ) — biasustabilitet, hastighets-/vinkel-random-walk, skalafaktorstabilitet, utspørringsbegrenset samplingsrate, dynamisk område for fringe-flertydighet — hver med sporbar kilde; mater QuantumNavBudget uten å modellere maskinvare

seg-c93f2d3a3167 = Benchmark for overensstemmelse for tidsintegritet — epokeklassifiserer for Stanford-integritetsdiagram

seg-712d5c35a6a6 = TIB-epokeklassifisering i Stanford-integritetsdiagram (nominell / utilgjengelig / MI / HMI)

seg-573aa0193cb3 = Benchmark for overensstemmelse for tidsintegritet — scorer for integritetsdekning

seg-4d86f3c2d8f5 = TIB-scoring av integritetsdekning (rater for HMI/MI/tilgjengelighet + dom om overbound-dekning)

seg-372dd0fdb025 = Benchmark for overensstemmelse for tidsintegritet — feilkatalog (parametriske generatorer)

seg-2604e7cf27d2 = TIB-feilmeny (domenedivergens, klokkesmell, holdover-coast, statisk/inkrementell/symmetrisk/asymmetrisk forsinkelse, replay innenfor ferskhet, banevalgsselektiv, k-av-N-kvorum)

seg-90c0eb1e7c14 = Benchmark for overensstemmelse for tidsintegritet — dom om absorpsjon av udetekterbare feil

seg-f713acf042ff = TIB-dom om absorpsjon av udetekterbare feil (symmetrisk/replay må absorberes av PL, aldri rapporteres som detektert)

seg-8adbbd2cdb74 = Selvbeskrivelse i hybridrapporten for optisk/RF

seg-2a5e48b558e1 = Rapporten hybrid-optical-rf oppgir linkkonfigurasjonen den faktisk ble kjørt med (bærebølgelengde, sende- og mottaksåpning, avstand, pulsbredde, integrasjonstid, virkningsgrader og tap, standardverdier løst opp) og bærer en enhetsblokk som gir enhet og opphavsklasse for hver størrelse en artikkel sannsynligvis siterer, inkludert sporene av overleveringskovariansen i kvadratmeter

seg-0691f3dee8cb = Tilgjengelighet for hybrid optisk/RF-link på RF-siden

seg-72ccb655caf0 = Rapporten hybrid-optical-rf oppgir en tilgjengelighet for RF-linken, sammensatt av størrelser motoren allerede beregner og ikke av en importert klimatologi, og oppgir sammensetningen som en navngitt regel: A_rf = I_closure * I_track, der I_closure er lukkingsdommen for det enveis CCSDS-401 / DSN-810-005-linkbudsjettet (linkbudget::link_budget, Eb/N0-margin >= { "0" }) ved scenarioets egen avstand og I_track er dommen fra sporingssløyfen (jamming::lock_status) på C/N0 som DET SAMME budsjettet ga. Hver faktor bærer opphavsklassen til sin inndata videre til utdataene, og faktorene som bevisst IKKE er med i produktet -- geometrisk synlighet, avskjæring ved interferens og en klimatologi for RF-utfall -- er navngitt med begrunnelse i stedet for stilltiende å settes til { "1" }. Det løste RF-leddet gjentas som en egen blokk rf_link_configuration, og de kontinuerlige tallene ved siden av indikatoren (linkmargin, C/N0-margin, lukkings- og sporingsavstandene i lukket form og avstandsutnyttelsen) er avstandsinversjonene av det samme budsjettet. Rapporten oppgir fullt ut, på blokken og i enhetsoppføringen en leser havner på, at dette tallet er BEGRENSET AV MARGIN/GEOMETRI og DETERMINISTISK, mens optisk tilgjengelighet er BEGRENSET AV VÆR/KLIMATOLOGI og sannsynlighetsbasert, slik at de to aldri kan siteres som et sammenlignbart par prosenttall

seg-22c5df9b6c7c = Sammenligning av optisk og RF-avstandsmåling på like vilkår

seg-70eb396f40af = Rapporten hybrid-optical-rf gir forholdet mellom optisk og RF-avstandsmåling med den ENE konfigurasjonen begge ledd ble evaluert ved i samme objekt: samme enveis bane, samme avstand og samme akkumuleringstid. Det optiske leddet er motorens fotonbegrensede ToA-CRLB på enveis fotontall; RF-leddet er motorens termiske kodesporingsjitter for DLL early-late ved C/N0 som motorens eget linkbudsjett gir for samme enveis avstand. Sløyfestøybåndbredden er utledet, ikke valgt: B_L = 1/({ "2" }*integration_s) legger RF-leddet nøyaktig på den optiske akkumuleringstiden, og hvis en som kaller overstyrer den slik at de to midlingstidene ikke stemmer, er forholdet REFUSED -- null, med avviket og begge tidene navngitt -- i stedet for å siteres ved to driftspunkter. Ingen forhold dannes mot scenarioets VALGTE parametriske rf_position_sigma_m, og avvisningen sier hvorfor: denne inndataen bærer ingen konfigurasjon i det hele tatt. Det utgitte toveis optiske hovedtallet og den eksakte faktoren som forbinder det med enveis sammenligningsleddet gis ved siden av forholdet, slik at rapporten ikke kan leses som om den bærer to uenige optiske sigmaer

seg-3f26f598e013 = Selvbeskrivelse i linkbudsjettrapporten

seg-b88bf41d6d4c = Linkbudsjettrapporten oppgir hver absolutte konstant dens egen margin ble beregnet fra -- bærefrekvensen frirommstapet brukte, EIRP, kvalitetsmålingen, det samlede tapet og Boltzmann-leddet -- pluss den påkrevde G/T der marginen er null, linkkonstanten (EIRP - tap - påkrevd Eb/N0) som er den eneste kombinasjonen en publisert tabell over rate og forsterkning noen gang kan fastsette, og, når den som kaller oppgir en systemstøytemperatur, mottaksantenneforsterkningen den kvalitetsmålingen innebærer

seg-a7b192e27cb5 = Tabell over krysningspunkt for månetid per klokkeklasse

seg-cab605dc6ea2 = Én kjøring av månetidsbudsjettet gir en rad for krysningspunkt mellom klokke og ramme per klokkeklasse mot ett felles rammeledd, slik at klokken er den eneste variabelen i sammenligningen; hver rad bærer krysningspunktet nådd på to måter -- funnet ved halvering fra den generelle potenslovkurven for tidsfeil og invertert algebraisk fra radens dominerende støytype -- med den relative forskjellen mellom dem

seg-18c72a7565d6 = Fangstfotavtrykk mot høyde og strålebredde

seg-9c30a0ab5233 = Tosidig sveip av det mønstervektede, høydebegrensede overflatefangstfotavtrykket over senderhøyde og parabolantennens diameter, gitt ut som én rad per driftspunkt med halveffektbredden hver diameter innebærer, og limbfangst rapportert som en TERSKEL -- per rad limb-J/S, dens margin og senderkraften som ville lukket den; per rutenett de lokaliserte krysningene, eller en eksplisitt oppgave om at limben ikke nås noe sted i rutenettet, med underskuddet

seg-fc0a64b9a280 = Reproduserbarhet for månens tidsfeilbudsjett

seg-5d5970506b9c = Scenarioet lunar-time-budget publiserer sine matriseverdige utdata som en langformtabell (rutenettindeks, midlingstid, ledd) ved siden av rapporten, så de syv x(tau)-kurvene per ledd og rot-sum-kvadrat-totalen er motorutdata og ikke noe en leser bygger opp igjen fra metodeavsnittet

seg-675887733454 = Laboratorium for månestasjonstid: holdover for miniRAFS mot LTC

seg-7dfedc40da6a = Den valgfrie blokken [time_lab] i scenarioet lunar-time-budget modellerer en klokke i en månereferansestasjon (som standard klassen miniRAFS, eller en hvilken som helst navngitt klasse, eller et enhetskort tilpasset oppgitte stabilitetspunkter) styrt til Coordinated Lunar Time og deretter frittløpende eller styrt på nytt hvert N sekund: tidsfeilkurven x(t) som rot-sum-kvadratet av klokkens potenslovledd, en konstant styringsrest (ILLUSTRATIVE), en konstant realiseringsrest for LTC og et valgfritt ledd for stasjonshøydens rate; tiden etter en styring til { "1" }, { "10" } og { "100" } ns (eller oppgitte terskler) ved halvering ved siden av den inverse i lukket form for den dominerende støytypen, og det dominerende leddet ved hver oppgitte horisont, alt med enheter

seg-af3ff120b707 = Geodetisk VLBI på månen

seg-cfd7d0126028 = Nærfelts VLBI-forsinkelse for en jordbaselinje som observerer et månebeacon + partielle deriverte

seg-e08e98908f3a = Jord-GNSS på månens avstand

seg-dd8ce373d1f6 = Mottak av Jord-GNSS på månens avstand: det svake signallaget som tabell { "1" } i P7 navngir og som motoren ikke hadde noen modell for. Per satellitt og per epoke beregner den vinkelen utenfor boresight mot senderens nadir, om Jorden skjuler den rette banen, skråavstanden og dens frirommstap, sendeforsterkningen ved denne vinkelen, mottatt effekt og bærebølge-til-støy-tettheten; den aggregerer deretter bare linkene som klarer en sporingsterskel, og sveiper et helt omløp for konstellasjonen slik at svaret er en FORDELING og ikke ett øyeblikksbilde. Tre fakta driver resultatet, og rapporten oppgir hvert av dem: Jorden spenner over { "13.90" } deg fra konstellasjonsradien, så strålens TOPP er geometrisk utilgjengelig for enhver stråle mot Månen; det som gjenstår er kanten av hovedloben og sidelobene, regimet LuGRE opererte i ved Månen i { "2025" }; og L1-banetapet er omtrent { "208" } dB, rundt { "25" } dB mer enn en terrestrisk bruker betaler. MEASURED på den medfølgende geometrien med 24 satellitter av GPS-klasse over { "64" } epoker av én omløpsperiode: tilgjengelighet for SIGNAL { "0.375" } med en beste link på { "30.93" } dB-Hz, og tilgjengelighet for posisjonsbestemmelse { "0.000" } - høyst to samtidige sporbare linker, aldri de fire en posisjon trenger. Skillet mellom disse to tilgjengelighetene er poenget, og rapporten nekter å la dem forveksles: Jord-GNSS på månens avstand er et lag av TIDSSYNKRONISERINGS-kvalitet, ikke av posisjonskvalitet, og en prior for lagdelt resiliens må ta tilgjengeligheten for posisjonsbestemmelse. Kondisjoneringen gis ut av samme grunn - hver synlige satellitt ligger innenfor en kjegle på et par grader sett fra Månen, så siktlinjene er nesten parallelle per konstruksjon. Kan kjøres som typen <c1/> Omformulert etter D7: påstanden på månens avstand er den RELATIVE bærebølge-til-støy-tettheten mellom satellitter ved én epoke, fra målte todimensjonale sendemønstre (NAVCEN Block IIR/IIR-M), pluss geometrisk synlighet; absolutt C/N0 hevdes ikke (Parker et al. rapporterer et felles tap på { "7" } til { "12" } dB).

seg-29df5b40a3f9 = Banebestemmelse for Månen: Jord-GNSS mot radiometri fra bakken

seg-647902ebcee3 = Banebestemmelse i en nesten rettlinjet halobane (eller en elliptisk frossen bane) fra to uavhengige datatyper: Jord-GNSS-pseudoavstander mottatt om bord (linkregelen fra raden Jord-GNSS på månens avstand, pluss okkultasjon av Månen) og toveis avstand og avstandsrate fra bakken fra tre stasjoner i Deep Space Network. Hver er en minstekvadraters batch i ett steg om referansebanen med sin formelle kovarians; en seedet Monte Carlo av differansen mellom de to estimatene tester om de to kovariansene forklarer den (q = d' (P_G + P_R)^-1 d, kjikvadrat med seks frihetsgrader når modellene stemmer) og hva en ikke-modellert akselerasjon gjør med statistikken.

seg-652bdc29deea = Bærebølgefaseflertydighet på Månen: overflate og orbiter

seg-02496f9e9af2 = Enkeltdifferensiert Jord-GNSS bærebølgefase og kode mellom mottakere ved en månestasjon på overflaten og en orbiter, med klokkedifferansen per epoke profilert ut, én flertydighet per sammenhengende passasje og den lengste passasjen som gauge. Kovariansen for float-flertydigheten er et Schur-komplement; LAMBDA løser heltallene, den bootstrappede raten rapporteres ved siden av en seedet Monte Carlo-rate for suksess med heltalls minstekvadrater og sigmaene for posisjon med float og fastsatt løsning. Rapportert som funnet: ved de registrerte { "12" } dBi er dobbeltdifferanseproblemet ikke mulig å danne (endring { "1" } flyttet standarden til { "25" } dBi etter at bare tellinger av tilgjengelighet var sett), og ved { "25" } dBi oppnås heltallsfastsettelse IKKE - utenfor rekkevidde (noen få prosent høyst), selv om float-løsningen forbedres med buen.

seg-11dd1bb8e4e1 = Samestimering av månens ramme: overflatestasjoner og orbitere

seg-a38c8d95e6c9 = Fisher-informasjon for månerammens datum med sju parametere fra laseravstandsmåling fra jordstasjoner til de fem reflektorene alene og med avstander fra orbiter til overflatestasjon lagt til: informasjonsmatrisen, rang, Cramer-Rao-sigmaer, degenerasjonsmålet fra modulen for identifiserbarhet på månen og seedede tilfeldige stasjonsmengder. Banen holdes kjent i månens akser (dens feil bæres av orbiterens avstandssigma).

seg-862977c4bb01 = Presisjon for rammeknytning i rommet: samlokalisert GNSS, VLBI og laseravstandsmåling

seg-a9ae8e99f00d = Cramer-Rao-presisjon for translasjons-, skala- og rotasjonsforskyvningene mellom teknikkene GNSS, VLBI og laseravstandsmåling når ett romfartøy bærer alle tre, med romfartøyets posisjon eliminert ved hver epoke og ni lokale knytningsforstyrrelsesparametere som bærer en prior, sveipet over nøyaktigheten til den lokale knytningen. Kovarianser ved kvadratrotmetoden (normalligninger mister sifrene når teknikkene er nær perfekte).

seg-ae627996875e = Sensitivitet for Love-tall og librasjon på Månen

seg-28780d07c4a7 = Fisher-informasjon for h2, k2, l2 og de fysiske librasjonsamplitudene fra laseravstandsmåling (radial og horisontal tidevannsforskyvning, reflektorrotasjon), orbitersporing (grad-2 k2-akselerasjonen integrert langs siktlinjen, trend fjernet), et gravimeter på overflaten (gravimetrisk faktor { "1" } + h2 - { "1.5" } k2) og en klokke på overflaten (fraksjonal rate ({ "1" } + k2 - h2) W2/c2, knyttet til månetidskonstantene). Nominelle verdier for h2 og l2 er lineariseringspunkter; studien sier hva som er sensitivt for hva, ikke hva tallene er.

seg-da712b740519 = DOP-forsterkning med overflatebeacons på Månen

seg-83e6341e01b1 = Beacon-forsterket presisjonsfortynning for en månebruker på overflaten: radene for siktlinjer til synlige satellitter og avstandsradene til synlige overflatebeacons settes sammen til én designmatrise og evalueres gjennom den felles DOP-kjernen, og den resulterende DOP avbildes til en realisert 1-sigma-nøyaktighet I METER gjennom en brukerekvivalent avstandsfeil per beacon satt sammen som rot-sum-kvadratet av ledd for klokkesynkronisering, flerveis og oppmåling. Synlighet for beacons er den geometriske horisonten med to høyder på Månen uten atmosfære, som ikke har noen refraktiv utvidelse og derfor er eksakt og ikke approksimativ. Kan kjøres som scenariotypen <c1/>, som rapporterer bare satellitter, satellitter pluss beacons og en større konstellasjon som den konkurrerende veien til samme geometri. MEASURED på den medfølgende gylne geometrien (bruker ved -80 deg, tre oppmålte beacons, illustrativ LCNS med seks satellitter ved t={ "0" }, maske { "5" } deg): { "5" } synlige satellitter gir PDOP { "9.6941" } og en 3D 1-sigma på { "11.222" } m; å legge til beaconene som faktisk klarer horisonten gir PDOP { "4.1160" } og { "4.765" } m, en faktor på { "2.355" }; tjenesten med 24 satellitter gir i stedet PDOP { "2.4226" } og { "2.804" } m, en faktor på { "4.002" }. Rapporten skriver ut antallet SYNLIGE beacons og ikke det konfigurerte, og i denne geometrien klarer bare ÉN av de tre beaconene horisonten: de to flankerende stedene ligger omtrent { "333" } km fra brukeren mot en horisont på { "86" } km for en antenne på { "2" } m, slik at en leser aldri må anta at alle tre bidro

seg-845e9f5eec81 = Beskyttelsesnivå for felles modus og total integritetsomhylling

seg-e4ec41d0f5e1 = Observerbarhet av månens absolutte stasjonsposisjon (datumdefekt)

seg-b3e4160042d2 = Fisher-informasjonsobserverbarhet for den felles månebestemmelsen: uten jordgrunnlinjer ligger absoluttsystemets datum i null-rommet til HᵀWH (stasjonsposisjonen er uobserverbar); ≥{ "3" } grunnlinjer gjenoppretter full rang og begrenser stasjonens Cramér–Rao-feil, som estimatoren oppnår

seg-2ed7181c97dd = LunaNet AFS-spredningskodegenerering (LSIS V1.0)

seg-13ff6c381275 = Kodene for Augmented Forward Signal i LSIS V1.0 ({ "29" } januar { "2025" }): AFS-Q 10230-chip primærkoden generert fra IS-GPS-800 L1C-pilotkonstruksjonen med IS-GPS-800J-indeksene (de samme { "210" } tildelingene som LSIS tillegg D skriver ut), AFS-I 2046-chip Gold-kodene generert fra g1 = x^{ "11" } + x^{ "2" } + { "1" } og g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } der hver PRNs G2-forsinkelse er hentet fra standardens Annex { "3" }-fil, de fire sekundærkodene, de 1500-chip tertiærkodene, den midlertidige nodetildelingen i tabell { "11" } og den nivådelte pilotkoden. LSIS-innholdet leses ved kjøring fra en lokal hurtigbuffer som er SHA-256-verifisert og fylt fra den NASA-hostede PDF-filen, og det videredistribueres aldri

seg-56c7aeac59c1 = LunaNet AFS lukket-sløyfe-dekodbarhet med en uavhengig mottaker (LSIS V1.0)

seg-da2d29d437b0 = En Kshana AFS-opptaking som er innhentet, sporet og dekodet av en uavhengig programvaremottaker og sammenlignet med opptakingens egne fasitetiketter. Dette viser bare at standarden følges og at etikettene er konsistente; det er ikke en påstand om kanalfysikk, utbredelse, mottatt effekt eller linkbudsjetter, hvis verdier i opptakingen er valgte inngangsverdier

seg-780369fb9a54 = GPS L1 C/A kryssgeneratorkontroll mot standarden

seg-ee47b60515f1 = GPS L1 C/A-spredningskoder (sdr::CaCode) og LNAV-delramme 1-3 (gps_lnav: IS-GPS-200-feltkvantisering med spesifikasjonens pi, tos komplement-pakking, TLM- og HOW-ord, tabell 20-XIV-paritet med D29*/D30*-invertering, de paritetsløsende bitene i ord { "2" } og { "10" }) sammenlignet bit for bit med gps-sdr-sim på dens medfølgende brdc0010.22n ({ "32" } satellitter)

seg-bf429c8f00fb = GNSS IQ-innhenting på uavhengig genererte I/Q-sampler

seg-9a0c52bfb06e = iq::acq::acquire (FFT parallelt kodefasesøk med kvadratlov-Marcum-Q-terskel) med GpsL1Ca-replikaen, på { "20" } ms av gps-sdr-sims egen 8-bits I/Q-utdata dekodet av iq::io-sampledekoderen (ci8, { "2.6" } MHz, { "11" } satellitter, ingen støy): hver PRN { "1" } til { "32" } søkt i to vinduer på { "10" } ms, resultatet sammenlignet med kodefasen og Doppleren gps-sdr-sim modulerte

seg-f40dc3dac990 = IQ-monitorer scoret i lab-avspillingskampanjer: deteksjon, bom, falske alarmer og lukket-form falsk-alarm-tall

seg-93fb3109728c = iq::campaign::detect og kampanjekjøreren: en valgfri [monitors]-tabell kjører IQ-monitorene på hver celle i kjørerens enkeltgjennomløp. Effekt- og spektralmonitorene ser samplene etter hver frontend-kjede; C/N0-, SQM- og låsemonitorene ser hver sporet kanals sløyfeoppdateringer. Hver alarm scores mot de oppgitte hendelsene: detektert eller oversett per (hendelse, alarmtype, kanal), tid til deteksjon, og falske alarmer utenfor hendelsene over eksponeringen deres. Hver tests lukkede falsk-alarm-tall oppgis: effekt per blokk (eksakt Gamma-hale), spektralt overskudd per blokk (tilnærming), kurtose (ensidig gaussisk), pulser (binomisk tak), SQM per midlet oppdatering (2Q(k) = Q(1/2, k^2/2), ny), og C/N0-CUSUMs ARL0 (Siegmund). Uten tabellen er celler, nøkler og sammendrag uendret. Ingen interferensbølgeform syntetiseres

seg-5b7eb7ddb474 = Deteksjons-ROC for IQ-monitorene fra en scoret lab-avspillingskampanje

seg-57fe85965c9c = iq::campaign::detect (windows, roc) og iq::campaign::report::rocs: hver celle i en kampanje med monitorer beholder, per alarmtype og kanal, maksimum av monitorens egen teststatistikk over hvert oppgitt hendelsesvindu (positiv) og over flislagte roc_window_s-vinduer utenfor hendelsene (negativ). Statistikkene er blokkeffektavviket, PSD-overskuddet, kurtose-z, SQM |z| for den midlede metrikken og C/N0-CUSUM. Rapporten slår dem sammen per type til en empirisk ROC på vindusnivå med sin AUC og arbeidspunktet ved den konfigurerte terskelen, skrevet som roc.json (kshana.campaign-roc/1) og en Detection ROC-seksjon i report.html. En kampanje uten monitorer skriver ingen av delene

seg-3a3cfa322f01 = Kalibrering av den åpne mottakerens C/N0- og låsemodeller mot IQ-kampanjeresultater, med oppgitt prediksjonsfeil

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) og <c1/> på <c2/>, Python <c3/> og MCP-verktøyet labfit (kampanjemapper bare innenfor sin egen arbeidsmappe): leser en <c4/>-utdatamappe ved dens DIGEST og grupperer de scorede cellene i tilpasningsenheter (signal x sløyfeutforming x frontend-kjede x jammertype, aldri slått sammen). Per enhet tilpasses målt C/N0 mot oppgitt J/S med spektralseparasjonsformen. Q_eff er ikke identifiserbar fra C/N0-data uten en uavhengig måling av jammer- og signaleffektene, så Q oppgis, aldri tilpasses (typetabellen, hendelsens q, eller for en ukjent type den mest skadelige oppgitte verdien, cw Q = { "1" }). Den tilpassede parameteren er den identifiserbare forskyvningen delta_eff = delta - { "10" } log10 Q, med korrelasjonsvakten som rapporterer degenerasjonen. C/N0-bin som er låst under { "90" } % er sensurert og listet. Terskel-J/S oppgis direkte og ved den lukkede formen; sporingssløyfemodellen og de empiriske låsemodellene er koblet gjennom C/N0-modellen, med fall- og gjenlåsingsventetider. En seedet klyngebootstrap over opptak ({ "1000" } replikater) gir persentilintervaller; prediksjonsintervaller på { "90" } % kommer fra residualtrekk; utelat-ett-opptak-ut-tilbakeholdte datasett deles i interpolasjon og ekstrapolasjon; en forhåndsregistrert [validation]-tabell hashes og hver terskel bedømmes PASS/FAIL. Rapporter kshana.labfit-iq/1 som JSON, CSV og generert Markdown, med en units-blokk. Bare syntetisk (ingen tredjepartsopptak, ingen jammerbølgeform). Labfit-banen for mottakerlogg er uendret

seg-9537d301c95e = GPS LNAV-koding dekodet av et uavhengig mottakerbibliotek

seg-909415621881 = Kshanas LNAV-delramme 1-3 (gps_lnav::encode_subframes) for de { "32" } brdc0010.22n-efemeridene gitt til RTKLIBs decode_word og decode_frame: paritet for hvert ord, delrammedekoding med konsistent datautgave, og hver dekodet parameter mot Kshanas heltall og mot inngangsverdien

seg-f66855e35c53 = GPS LNAV-navigasjonsmeldingskoding

seg-8caf8366e2f8 = IS-GPS-200 LNAV-delramme 1-3 (gps_lnav::encode_subframes: kvantisering med avrunding til nærmeste av hver klokke- og banepararameter ved spesifikasjonens skalafaktorer og verdi av pi, tos komplement-pakking, TLM- og HOW-ord, tabell 20-XIV-paritet med D29*/D30*-invertering, de paritetsløsende bitene i ord { "2" } og { "10" }), meldingen en GPS L1 C/A-signalgenerator sender

seg-c5c944357643 = Innhenting og C/N0-estimering på ekte IQ fra månen

seg-f5dcb5e06bf4 = Parallelt kodefasesøk (acquisition::pcps_acquire: portabel FFT, koherent folding, ikke-koherent akkumulering, kjikvadratterskel for en søkeomfattende falsk-alarm-sannsynlighet), forfining, åpen-sløyfe prompt-korrelasjon med kode-Doppler og M2M4 C/N0-estimatoren, kjørt på LuGRE L1 4-bits IQ-batcher lest gjennom realdata::ion_sdr

seg-709626569a5c = Innhenting på ekte IQ fra månen mot baneprediktert Doppler (beslutning på samplingseffekt)

seg-784ebd80c425 = acquisition::pcps_acquire med sin beslutning på samplingseffekt på de ni LuGRE L1-batchene som ikke er fra overflaten, med mid-rise-nivåer; Doppler-forskjeller mellom innhentede satellitter sammenlignet med forskjeller predikert fra ESAs endelige baner og den Firefly-rekonstruerte Blue Ghost-banen

seg-89875d67b253 = Innhenting på ekte IQ fra månen scoret mot baneprediktert Doppler

seg-956bcfeaf319 = acquisition::pcps_acquire med celle-midlende beslutning (topp over rutenettets middelcelle, robust mot båndbegrenset støy) på de ni LuGRE L1-batchene som ikke er fra overflaten, med mid-rise-nivåer; Doppler-forskjeller mellom innhentede satellitter sammenlignet med forskjeller predikert fra ESAs endelige baner og den Firefly-rekonstruerte Blue Ghost-banen

seg-8fa779dd1788 = Innhenting på tilbakeholdt ekte IQ fra månen mot baneprediktert Doppler

seg-484868771231 = acquisition::pcps_acquire (celle-midlende beslutning, falsk-alarm-sannsynlighet { "1e-7" }) med refine_doppler_coherent på LuGRE L1-batchene registrert på månens overflate (I i høy nibble, mid-rise-nivåer); Doppler-forskjeller mellom innhentede satellitter mot forskjeller predikert fra ESAs endelige baner og Firefly-landingsstedets kjerne

seg-10af60b488b9 = Differensiell referansestasjon i NovaMoon-klassen: fellesmodus-kansellering + grunnlinjevoksende residual + DGNSS-beskyttelsesnivåer

seg-c04a3591074c = Eksport for interoperabilitet på månen

seg-91f4a066b3c0 = LunaNet/IOAG-tilpasset eksport av referansesystem + tid + efemeride for månen (CCSDS OEM + KIF) med rundtur-formatkontroll

seg-8ab65cbefb75 = Scoring tilpasset PNT-resiliensrammeverk

seg-c48198f31d63 = Delscorer per dimensjon over Kshanas egne syv resilienskategorier (ikke DHS-begreper), RethinkPNT RDRR-funksjoner og Yang-kriterier, hver merket modellert med sin driver; foreløpig RPCF-nivå med en port for begrenset degradering. Simuleringsavledet egenvurdering, aldri sertifisering.

seg-d7bdb6fe186e = Studie av beslutningsustabilitet i resiliensscore

seg-5fcf18a68bb1 = Kvantifiserer hvordan en enkelt sammensatt score / RPCF-nivå omordner arkitekturer under et forsvarlig vektingssimpleks og et trusselensemble (topp-1-vendingsrate, Kendall-tau-spredning, nivåvendingsrate, rangområder); analyser av deklarert mot målt og mangfoldskollaps.

seg-1bf03544a010 = Representativitet i demonstrasjonen og gap til flyvning

seg-db24d16d38c9 = Ærlighetsregister per resultat som kvalifiserer en demonstrasjonsutdata: dens eksterne ankre, modellerte forutsetninger, gap til flyvning og representative TRL-bånd, med håndhevede invarianter (Validated krever et eksternt anker; Modelled krever et gap og kan ikke hevde noe over TRL { "4" }).

seg-52ab936eb5f5 = Evidens for avveining mellom kvante og klassisk (felles form)

seg-a6679ed5bed7 = Ett reproduserbart TradeEvidence-objekt (fast ramme: scenario+seed+motor; felles verdier per FoM for kvante mot klassisk med fordel med riktig polaritet, valgfri { "95" }% CI, merkelapp for validert/modellert) som bærer en representativitetspost, slik at hver kvante-PNT-vertikal rapporterer avveiningen på samme ærlige måte.

seg-20fee61b3107 = Feilmodellbibliotek for kvanteenheter

seg-e42eabe9bc2a = Enhetskort (optisk/fanget-ion/kvikksølv-ion + klassiske klokker gjenbrukt fra holdover/clock_state; kaldatom-interferometer; klassiske + sammenfiltrings-/enkeltfoton-tidsoverføringslinker) som hver bærer en representativitetspost; sammenfiltringslinken legger til en skuddbegrenset tidspresisjonsmodell (~jitter/sqrt(R*tau), mørktellingsstraff, systematisk gulv).

seg-86d71fd89f26 = Pålitelig kvantetidssynkronisering (tidsoverføring + sikker formidling + anomali)

seg-d2a3d37825ef = Ende-til-ende tidsoverføringskjede for kvante mot klassisk (klokkekyst + linkpresisjon i kvadratur), et gjenbrukt tidssynkroniseringsbeskyttelsesnivå, en sikkerhets-FoM mot forsinknings-/avspillingsangrep (1-P_md) og en deteksjonssannsynlighet for klokkeanomali + CUSUM-latens, utgitt som ærlig TradeEvidence med en representativitetspost.

seg-eaf341ff4522 = GNSS-fri kvantenavigasjon

seg-908a44a9f7c7 = Kvante (kaldatom-interferometer) mot klassisk navigasjonsklasse-INS med dødregning over et GNSS-bortfall: vekst i posisjonsfeil, holdover til en posisjonsterskel, og avveiningen kvante mot klassisk som ærlig TradeEvidence; ærlig observerbarhetsnotat (bias er uobserverbar uten posisjonsbestemmelse, så feilen vokser).

seg-914132833f5a = Feil-/anomalideteksjon for kvante-PNT-systemer

seg-f20392820b9d = Merket katalog over kvantefeil (klokkefrekvenssprang/-drift/låsetap; sensorbiassteg/-bortfall), en ROC AUC for deteksjonsstatistikken med bootstrap-CI, og en minste detekterbar feil ved en fast falsk-alarm-rate; en kvanteklokkestøttet monitor detekterer mindre feil enn en klassisk, utgitt som ærlig TradeEvidence.

seg-d31be81dfd8f = TDOA/FDOA passiv senderlokalisering

seg-aa870cee16f6 = Lokaliser en sender (jammer/spoofer, eller en opportunistisk kilde for omvendt PNT) fra ankomsttidsdifferanse over et mottakernettverk — τᵢ=(Rᵢ−R₀)/c hyperboloideskjæringen løst med Gauss–Newton minste kvadrater — og, ved å legge til ankomstfrekvensdifferanse (avstandsratedifferanser) med bevegelige mottakere, gjenvinn posisjon og hastighet i fellesskap; med Cramér–Rao nedre grense på posisjonskovariansen fra målegeometrien

seg-5bd3882531b6 = Konvektiv oppvarming i stagnasjonspunktet (Sutton-Graves) ved en 3-DoF-inngang

seg-4f97036ed72f = Konvektiv varmefluks i stagnasjonspunktet q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstantene for jordluft og Mars-atmosfæren (NASA TR R-376, { "1971" }), dens topp og den integrerte varmebelastningen langs en 3-DoF-inngang, ballistisk eller løftende ved konstant krengning, på Jorden eller Mars.

seg-1b96577665fc = Radiometri, MTF, relativ kantrespons og GIQE { "4" } NIIRS for elektro-optisk avbilder

seg-38902593e841 = Signal-til-støy-budsjett for nadir-avbilder (lambertiansk scenestråling, kameraligningen, skudd-, mørk-, lese- og kvantiseringsstøy), system-MTF ved Nyquist som produktet av diffraksjon fra uhindret apertur, detektorapertur, lineær utsmøring og gaussisk jitter, kantresponsen og den relative kantresponsen integrert fra denne MTF-en, Q = lambda F / p, og GIQE versjon { "4" } NIIRS uten MTF-kompensasjon. Kan kjøres som scenariotypen <c1/>.

seg-07ca77a67207 = Tap fra tyngdekraft, luftmotstand, styring og mottrykk ved oppskytingsstigning

seg-7a1802cf2c80 = Plan tyngdekraftsvending-stigning for et flertrinnsfartøy over en ikke-roterende sfærisk jord gjennom US Standard Atmosphere { "1976" } (tetthet og trykk), med et pitch-spark, skyvekraft redusert av dysens mottrykk, trinnavbrenning ved eksakte stegrenser, og tapene fra tyngdekraft, luftmotstand, styring og mottrykk integrert ved siden av tilstanden. Kan kjøres som scenariotypen <c1/>.

seg-55e8345def8b = TWSTFT tovegsligning, usikkerhetsbudsjett og linkstabilitet med flicker og døgnvariasjon i ikke-resiprositet

seg-5ca5226c24ec = TWSTFT tovegsligningen løst for T_A - T_B med stasjonenes sende- og mottaksforsinkelser, den ionosfæriske Ku-bånd opp/ned-asymmetrien, transponderens forsinkelsesforskjell og Sagnac-leddene, mot sin eksakte foroverrettede modell; et usikkerhetsbudsjett i kvadratur med link-TDEV som type A-ledd; en tovegsserie med hvit og flicker fasestøy (Kasdin-Walter), en døgnvariasjon i ikke-resiprositet og en konstant resiprositetsrest; og raten, residual-RMS, TDEV og ADEV for oppgitte Circular T-, MJD-CSV- eller IGS RINEX-stasjonsklokkeserier. Kan kjøres som scenariotypen <c1/>.

seg-2f9be02c92bc = Numerikk for optisk atmosfære på skrå bane: Rytov-varians, scintillasjon, gamma-gamma-fadesannsynlighet, aperturmidling, sky og optisk dybde i klar luft

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integrert langs en skrå bane for plan- og kulebølge-Rytov-variansen (opplink og nedlink), Andrews-Phillips-scintillasjonsindeksen og gamma-gamma-parametrene, gamma-gamma-fadesannsynligheten og fademarginen, aperturmidlingsfaktoren ved svak turbulens, den optiske skydybden for en flytende vannsøyle og den optiske dybden i klar luft fra Kim-sikt pluss Rayleigh, som erstatter det samlede atmosfæretapet i det optiske linkbudsjettet når en atmosfære oppgis. Kan kjøres innenfor scenariotypen <c1/>.

seg-a2faab92e760 = Værdrevet tilgjengelighet for optisk bakkested og avstandskorrelert stedsdiversitet

seg-7f4e4e763d62 = Tilgjengelighet for en optisk link mot en oppgitt linkmargin fra et lognormalt klima for skyenes flytende vann (ITU-R P.840-mengde, geometrisk-optikk-ekstinksjon) og det uavhengige gamma-gamma-turbulensfadet, linkmarginen som trengs for målrettet tilgjengelighet og taket ingen margin løfter, lognormale avbruddsvarigheter, hva-hvis for forbedringsteknikker, og en enfaktors gaussisk-kopula-nettverkstilgjengelighet der parkorrelasjonen er exp(-avstand/dekorrelasjonslengde). Kan kjøres som scenariotypen <c1/>.

seg-043ece801e72 = Kontinuitet i tidssynkronisering og avstandsmåling gjennom optiske avbrudd

seg-bb9cb3fe4180 = Avbruddsvarighetsfordelingen for et optisk sted koblet til den lukkede kystvariansen i holdover-klokkemodellen: feil i tidssynkronisering og avstandsmåling ved oppgitte avbruddskvantiler, holdover til en tidssynkroniseringsterskel, andelen av avbrudd og av avbruddstid innenfor den og tidssynkroniseringstilgjengeligheten A + U E[min(D, T_h)]/E[D], for de klassiske og kvanteklokkeklassene. Kan kjøres innenfor scenariotypen <c1/>.

seg-b119df65d2a7 = Optisk linkmargin over tid: én seedet realisering av et steds vær

seg-06125f3cae90 = En valgfri <c1/>-tabell (duration, step, seed) får <c2/>-typen til også å skrive, per sted, én seedet realisering av den oppgitte stedsmodellen gjennom tid: skyepisoder (klare perioder eksponentielle, skyavbrudd lognormale med oppgitt middel og spredning, andelen tid i sky satt til oppgitt skysannsynlighet), én lognormal flytende vannsøyle per skyepisode, ett gamma-gamma-scintillasjonssample per steg, og ut fra dem linkmarginen, sky- og scintillasjonsfadene og link-opp-flagget, med realisert tilgjengelighet, skyandel, antall avbrudd og lengste avbrudd. Uten tabellen er resultatet dokumentet fra { "0.37" }. Trekningene går gjennom portable fordelings- og matterutiner, så native og wasm32 gir de samme bytene.

seg-58cbf576c959 = TRK-2-18 Orbit Data File-leser og Mars rampet 2-veis Doppler-modell

seg-d1055650a77f = En leser for DSN Orbit Data Files (TRK-2-18): postgruppene på 36 byte (filetikett, identifikator, banedata, ramper per stasjon, klokkeforskyvninger, sammendrag, filslutt), og i hver banedatapost tidsmerket siden { "1950" }, nedlinks- og opplinksforsinkelser, observabel, stasjoner, datatype, bånd, gyldighet, kanal, romfartøy, referansefrekvensen på 46 bit og komprimeringstiden; rampestart- og sluttider, rater og startfrekvenser. Oppå den en rampet 2-veis X-bånd Doppler-modell (integrerte opplinksramper, rundtur-lysgangstid med Shapiro og troposfære, DSN-stasjoner gjennom IAU 2006/2000A CIO-kjeden og IERS EOP, stasjonstid) og en batch-banebestemmelse for Mars-satellitt (GMM-3-felt, tredjelegemer, SRP, drag).

seg-455dc946c965 = Multiplikativ EKF-holdningsestimering fra et gyro og en stjernesporer

seg-553d043438b4 = Lefferts-Markley-Shuster multiplikativ EKF: holdningsfeil i kroppssystemet og gyrobias-tilstander, propagering med gyrorate minus biasestimatet og Farrenkopfs diskrete prosessstøy (vinkel- og raterandomvandring), stjernesporeroppdateringer med residualen { "2" } vec(q^-1 q_st) i Joseph-form, og den multiplikative tilbakestillingen; en diskret Farrenkopf-simulator for gyro og stjernesporer. Typen <c1/> kan lukke reguleringssløyfen på sitt estimat.

seg-a971ff07592a = Arbeidssyklus for apertur mellom navigasjon og kommunikasjon

seg-5b0ba97379bf = Én kjøring tar en kontaktplan (en liste over aos_s/los_s-vinduer, der hvert ber aperturen om navigasjon eller kommunikasjon — det samme vindusvokabularet som <c1/> sender ut, konvertert av <c2/>), et aperturantall og en eksplisitt arbitreringspolicy, og returnerer navigasjonsarbeidssyklusen, kommunikasjonsarbeidssyklusen, tomgangsarbeidssyklusen og avbruddet per økt. Policyen er en inngangsverdi med en dokumentert standard (<c3/>; også <c4/> og ikke-preemptiv <c5/>), og rapporten bærer den løste policyen, dens fulle definisjon og definisjonene av arbeidssyklus og avbrudd, fordi et arbeidssyklustall oppgitt uten sin arbitreringsregel ikke er reproduserbart. Planen er et eksakt intervallsveip over vindusgrensene, så et vindu som slutter nøyaktig der det neste begynner aldri konkurrerer, og apertursekunder for navigasjon, kommunikasjon og tomgang akkumuleres uavhengig i det ene sveipet. Kan kjøres som scenariotypen <c6/>

seg-43cd7aa7ab53 = RF-jamming av månens overflatenavigasjon (J/S per satellitt)

seg-e0566f37ad8f = Månenativ jammer-til-signal-forhold, effektiv C/N₀ og tap av lås for en selenografisk overflatebruker under en jammer på månens overflate (eller hevet), over den illustrerende konstellasjonen i Moonlight/LCNS-klassen fra offentlige kilder. Setter sammen den åpne jammingkjeden (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) med den åpne månehimmelgeometrien (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri utledes på nytt. I motsetning til jord-typen <c1/> er signalleddet ikke en fast mottatt effekt: hver satellitts isotrope mottatte effekt er dens egen linkbudsjett-EIRP − FSPL(skrå avstand), så J/S varierer fra satellitt til satellitt med månens avstand og elevasjon. Gir EN RAD PER SYNLIG (epoke, satellitt)-LINK som JSON og som en *.table.csv-artefakt, med begge mottatte effekter som J/S er differansen mellom skrevet ut ved siden av; aggregerte kvalitetsmål står ved siden av denne tabellen, aldri i stedet for den. Kan kjøres som scenariotypen <c2/>

seg-4c116e25c5c5 = Nektelseskontur på månen med et usikkerhetsbånd fra den målte C/N₀-spredningen

seg-77828c25f3ab = Rapporten <c1/> hviler ikke lenger nektelseskonturen på én skalar. Den sender ut hele den målte fordelingen av ønsket-signal-C/N₀ over tabellen per satellitt — n, min, p05, p25, median, p75, p95, maks, middel, utvalgsstandardavvik og utvalgets egen asymmetri (p95 − median) − (median − p05) — ved siden av radene per link, som er uendret. Konturen rapporteres så ved hver av disse ordensstatistikkene under BEGGE nektelseskriteriene motoren kjenner, aldri det ene i stedet for det andre: det etablerte effektforholdskriteriet (J/S = { "30" } dB, den samme terskelen som attack_surface og tracking_loop bruker, og kriteriet bak <c2/>-kolonnen i den utgitte tabellen for lunar link-jamming), og kriteriet tap av lås (effektiv C/N₀ som faller til tracking_threshold_dbhz), som er kriteriet rapportens egen links[].status-kolonne scores med. Hvert konturpunkt oppgis på begge aksene i nektelsesplanet — jammer-EIRP som kreves ved scenarioets avstand, og nektelsesavstanden ved scenarioets EIRP — slik at båndet er et intervall på de samme aksene et konturplott tegnes på. Båndkantene ER contour(p05) og contour(p95): den samme lukkede avbildningen brukt på utvalgets egne kvantiler, ikke en sigma tilpasset utvalget og ikke median ± k·stdev, og rapporten sier det i en band_definition-streng ved siden av tallene. stdev sendes ut for kontinuitet og brukes av ingenting. En kvantil hvis C/N₀ allerede er ved eller under sporingsterskelen har ingen endelig nektende J/S; disse kolonnene sendes ut som null med en talt årsak i stedet for som en uendelighet eller en avkortet radius

seg-2d3944107ba0 = Deteksjonsstyrke for kryssmodalitets integritetsmonitor

seg-38bc7c0bfe57 = Rapporten hybrid-optical-rf oppgir hva kryssmodalitets-kjikvadratmonitoren faktisk kan DETEKTERE, ikke bare at den består et feilfritt tilfelle: den minste detekterbare biasen per overvåket akse (øst, nord, opp, klokke) ved scenarioets oppgitte sannsynligheter for falsk alarm og oversett deteksjon, deteksjonsstyrkekurven på hver side av den, det støyfrie biasmultiplumet der den realiserte statistikken først krysser terskelen, og tiden til deteksjon for en biasrampe ved en oppgitt rate. Feil injiseres også gjennom den virkelige monitoren, og statistikken den returnerer rapporteres ved siden av den analytiske prediksjonen

seg-38cabd4921c1 = Gjenvekst av kovarians etter overlevering mot varslingsgrensen

seg-9287268bbada = Rapporten hybrid-optical-rf eksponerer filterets prosessstøymodell og oppgir hvor lenge løsningen etter overleveringen holder seg innenfor varslingsgrensen: for begge overleveringsretninger bærer den kovariansen per akse overleveringen etterlot, propagerer den fremover under en oppgitt randomvandrings-prosessstøy, og rapporterer tidspunktet da den dekningsskalerte 1σ når varslingsgrensene for horisontal, vertikal og tid, hvilken grense som binder først, tidskonstanten for variansfordobling, og en samplet kystprofil som omslutter kryssingen. Prosessstøy-PSD-ene, dekningsfaktoren og varslingsgrensene er alle inngangsverdier med dokumenterte standarder

seg-a3b8272862aa = Antennemønster utenfor boresight i månegeometri-eksporten

seg-27d246503a48 = Eksporten av geometri per satellitt bærer, per (epoke, satellitt), vinkelen utenfor boresight VED SATELLITTEN og sendeforsterkningen mot stedet fra det virkelige jevnt belyste sirkulære aperturmønsteret (Airy), og rapporterer antallet i strålen under dette mønsteret VED SIDEN AV antallet i strålen under den symmetriske tilnærmingen fra forsterkning til stråleåpning (θ_3dB[deg] = √(31000/G_lin)), med differansen sendt ut som en eksplisitt korreksjon i links, i satellitter per epoke, og som verste enkeltepoke. Begge implisitte aperturvirkningsgrader for tilnærmingen sendes ut ({ "0.641" } mot regelen { "70" }·λ/D grader den siteres med, { "0.920" } mot en uniform sirkulær apertur), slik at virkningsgraden den stilltiende forutsetter er oppgitt og ikke utledet. Av som standard: blokken vises bare når både et eksportsted og en apertur er oppgitt

seg-6fbfa234ef3e = Tap av lås og spoof-innfanging i sporingssløyfen under interferens

seg-f78c1f28a3f7 = Tap av lås beregnet fra sløyfedynamikk i stedet for et effektforhold: bærebølge (Costas) og kode (ikke-koherent tidlig/sen) 1σ termisk jitter mot C/N₀ med kvadreringstapet, mot de oppgitte reglene 3σ_PLL + θ_e ≤ { "45" }° og 3σ_DLL + rampeforsinkelse ≤ d/2 chip; C/N₀-terskler for fall og gjenlåsing med den bindende sløyfen navngitt og hysteresen UTLEDET fra den bredere innfangingsbåndbredden og ikke hevdet; den deklarerte tiden til tap av lås fra en tosterskels låsedetektor med bekreftelsesventetider, rapportert separat fra den fysiske faseflukttiden (Viterbis midlere tid mellom syklusslipp, i log₁₀ s fordi den spenner over hundrevis av dekader); den største kodeslewen og bærebølge-Doppler-raten offerets sløyfer kan følge; og NEKTELSESRADIUSEN sløyfedynamikken innebærer, rapportert ved siden av den eksisterende effektforholdsradiusen med deres fortegnsbehæftede differanse som et eget navngitt felt. Kan kjøres som scenariotypen <c1/>

seg-0f4d023fe2d4 = Koordinatkovarians for et punkt på månens overflate fra en VLBI-forsinkelsesplan, holdt atskilt fra den for jordstasjonen

seg-47352405133b = Et tredje datumvalg, <c1/>, som holder hver jordstasjon fast og estimerer BARE FYRETS månefaste koordinater — konfigurasjonen en usikkerhet for et punkt på månens overflate faktisk oppgis for, siden jordstasjonenes koordinater er en inngangsverdi til forsinkelsesmodellen og ikke en ukjent i den. Den finnes fordi stasjonsnivåkovariansen og overflatepunktkovariansen er FORSKJELLIGE STØRRELSER atskilt av vektarmen ρ/B, og ingenting hindret tidligere at den ene ble oppgitt mot den andre. Den utsendte blokken <c2/> bærer ρ, den lengste grunnlinjen, vektarmen, overflatepunktformen av ekvipartisjonslinken c·σ_τ·(ρ/B)·√(g/N), den beregnede sigmaen per fyrkoordinat og deres forhold — forholdet er null i stedet for misvisende når fyret ikke estimeres eller matrisen er rangmangelfull. B tas som den LENGSTE grunnlinjen som er til stede, den gunstigste, slik at forholdet bare kan undervurdere. Kan kjøres som <c3/> med <c4/>, som avvises med en melding som navngir den manglende inngangsverdien når fyret ikke estimeres

seg-0315968c8214 = Differensiell PNT på månen — residualbudsjett for korreksjonslinken

seg-c6785166a44c = De tre leddene en differensiell korreksjon får mellom epoken den beregnes ved og epoken den brukes ved, hvert tidligere latt ligge som umodellert slingringsrom: oppmålingsfeil for referansestasjonen (korrelert på tvers av satellitter, uavhengig av grunnlinjen, ~{ "1" }:{ "1" } posisjonsoverføring og beviselig ikke DOP-forsterket), korreksjonsalderdom (den frosne banefeilvektoren projisert på nytt på siktlinjen motorens egen propagator setter satellitten på én latens senere, pluss c·σ_y(τ)·τ klokkedrift fra den kalibrerte potensloven), og uniform linkkvantisering over en eksakt full skala på ±(orbit_err + clock_err) med varians step²/12. Rapportert i både avstands- og posisjonsdomenet, ved siden av — aldri i stedet for — den eksisterende residualen og beskyttelsesnivået, med en latenskurve ved siden av enkelttallet

seg-c42646ae4707 = Dekning og nøyaktighetskart for referansestasjon på månen

seg-1f9834b32629 = Monte Carlo-sveip av den differensielle PNT-modellen for månen over et brukerrutenett ved sørpolen og et døgn med epoker (typen <c1/>): for en differensiell referansestasjon på et kjent sted ved sørpolen, per punkt og over regionen, persentil av korrigert og ukorrigert posisjonsfeil (3-D, horisontal, vertikal), tilgjengelighet med en årsak for hver utilgjengelige epoke (user_lt4, station_missing_sat), dekning mot en terskel oppgitt før kjøringen, DO-229E-beskyttelsesnivåer, dekningsradiusen per asimutsektor, og korreksjonslinkbudsjettet ved stasjonen og ved det verste punktet. Ikke en påstand om ytelsen til noe reelt system; ikke tilknyttet eller støttet av noe byrå

seg-7ecf4b0038b0 = Terrenghorisontmasker for månen fra en oppgitt profil eller en polar DEM

seg-7102948907bc = Asimutavhengige horisontmasker per sted for typen lunar-station-coverage (referansestasjonen og hvert brukerpunkt) og rutenettet moonlight-service-volume og dets eksportsted per satellitt (hver eksportrad får clears_terrain), i skyline-tabellformatet fra { "0.36" } (skyline::Skyline, lineær i asimut med omslag ved { "360" } grader; en oppgitt profil og en DEM-horisont ved ett sted kombineres som sitt punktvise maksimum): en oppgitt [terrain] station_horizon eller user_horizon merket med sin kilde, og/eller en horisont strålemarsjert over en sørpolar stereografisk DEM (LRO LOLA-rutenettoppsettet for polene, lest fra en beskrivelse som fastsetter størrelse og SHA-256, eller en breddegrad/lengdegrad realdata::lola_dem-flis med [terrain] dem_tile_path, gjengitt med sin SHA-256) langs store sirkler på månekulen med eksakt krumning, fra en oppgitt masthøyde, ved et oppgitt asimutsteg og rekkevidde. En satellitt teller ved et sted når den klarer den flate mask_deg og horisonten ved sin asimut (lunar_service::topocentric); en epoke horisonten etterlater med færre enn fire satellitter i et punkt, der den flate masken gir fire, telles som den utilgjengelige årsaken terrain_masked. Den medfølgende DEM-en er et utsnitt av det offentlig tilgjengelige LOLA LDEM_75S_240M-produktet, { "5" } x { "5" } blokkmiddel-resamplet til { "1200" } m (data/lunar-dem/NOTICE.md). Når den mangler, beholder hvert sted den flate masken og hvert dokument er byte-identisk

seg-d37bb01e270b = Flerveis og mottakermaskinvareledd for referansestasjon på månen

seg-1103199f019b = Den valgfrie [receiver]-seksjonen i lunar-station-coverage (LRS-02): elevasjonsavhengig flerveissigma sigma(el) = a + b exp(-el / el0) hos brukeren og ved stasjonen (RTCA DO-229 luftbårne funksjonelle form, med a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } grader som standarder; på Månen er hver verdi ILLUSTRATIVE), hvit hos brukeren og førsteordens Gauss-Markov over epoker ved stasjonen (rho = exp(-dt / tau)); tidlig-minus-sen DLL termisk kodestøy sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); biaser mellom kanaler per kanal, konstante over et forsøk, hos brukeren og ved stasjonen. Stasjonsleddene går inn i korreksjonene, brukerleddene i de rå og korrigerte målingene, hver på sin egen seedede strøm. Når de mangler, er hvert dokument uendret

seg-03796cb741b6 = Vekst i efemeridefeil for referansestasjon på månen over korreksjonslatensen

seg-13b0ae9a874a = Den valgfrie inngangsverdien orbit_err_growth_m_per_s for lunar-station-coverage (LRS-03): en korreksjon brukt latency_s etter at den ble beregnet går glipp av veksten g latency_s i den kringkastede banefeilen, g isotrop med 3-D RMS-rate, trukket per satellitt og forsøk på sin egen seedede strøm (avstand 1-sigma-rate tau / sqrt({ "3" })), oppå den frosne-feil-siktlinjeprojeksjonen på nytt. Når den mangler, er hvert dokument uendret. Et K5-tillegg til sammenligningen med publiserte påstander, forhåndsregistrert alene, kjører K5 ved { "0.001" }, { "0.01" } og { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Løsningsmodi for den lunare referansestasjonen: høydebegrensning, tre satellitter, vindu med statisk bruker

seg-366c7ad03fb2 = Den valgfrie [solution]-seksjonen i lunar-station-coverage (LRS-06): en høyde-pseudomåling lagt til som rad up . dx = e_h med oppgitt 1-sigma, vektet mot avstandsradene, et minimum på tre satellitter som bare er tillatt sammen med den, og en vektet minste kvadraters løsning over de siste window_epochs epokene med en felles statisk posisjon og én klokke per epoke (svaret fra et filter for en statisk posisjon uten prosessstøy over de samme dataene; epokenes feil behandles som uavhengige). Uten seksjonen er snapshot-løsningen og alle dokumenter uendret. Et tillegg til sammenligningen med publiserte påstander, med kildenes løsningsstil, forhåndsregistrert alene

seg-611ba369ed00 = Nøyaktighet og dekning for en lunar referansestasjon sammenlignet med publiserte påstander

seg-4fe4f1cffa2b = Typen lunar-station-coverage kjørt under de offentlige forutsetningene i det publiserte materialet om en lunar differensiell referansestasjon (fire navigasjonssatellitter i frosne elliptiske baner på { "24" } h, { "10" } m { "95" } % SISE, { "0.30" } m kodestøy, { "1" } s og { "600" } s korreksjonsforsinkelse, en stasjonsmåling under desimeternivå, det publiserte eksempelstedet for stasjonen, sirklene på { "300" } km og { "600" } km rundt sydpolen) og vurdert mot kildenes numeriske påstander under seks ensidige terskler forhåndsregistrert før kjøringen: dekning av hele sydpolen med p95 under én meter (K1, K2), p95 etter korreksjon under én meter og på desimeternivå (K3, K4), under én meter bevart ved { "600" } s forsinkelse (K5), og nøyaktighet bevart fra { "10" } km til { "500" } km grunnlinje (K6)

seg-7bfcb5c6a985 = ARAIM med samtidige hypoteser om feil i flere satellitter

seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2-regelen for bestemmelse av delmengder (P_THRES, FC_THRES, overvåkede delmengder med færrest fjernet først) generalisert fra par til samtidige kombinasjoner av opptil max_order satellitt- og konstellasjonshendelser, med den eksakte apriorisannsynligheten P_no fault prod q_e; add_v42_protection_levels_to_order kjører ADD v4.2-veien for beskyttelsesnivå på den (orden { "2" } er nøyaktig den eksisterende veien). raim::araim_subset_raim (valgfri): avansert RAIM over denne hypotesemengden, hver overvåkede delmengde som én modus (p_fault, T, b, sigma) i integritetsrisikosummen, ikke-observerbare delmengder flyttet til den ikke-overvåkede risikoen, budsjettet skalert med ADD-allokeringen av den ikke-overvåkede risikoen, og delmengden med størst normalisert separasjon rapportert når en feil oppdages. Apriorisannsynligheter som krever dypere delmengder enn max_order avvises, aldri avkortes

seg-48ca01332f8f = RAIM ved siden av kvalitetsmålene for klokkens holdover

seg-890f1006a75d = Den valgfrie [integrity]-seksjonen i clock-typen (clock_integrity::run): fra et oppgitt sted og forhåndsinnstillinger for konstellasjoner (geometry::sky_geometry), ved hver integritetsepoke så lenge GNSS-tidslinjen ikke er nektet, snapshot-RAIM (raim::snapshot_raim: kjikvadrattest på paritet, beskyttelsesnivåer med helning) på satellittene over masken, med seedede gaussiske residualer med oppgitt sigma og en valgfri oppgitt bias; en egen integrity_fom-blokk med avgjørelser per epoke, beskyttelsesnivåer og tilgjengelighet. Nektede epoker rapporteres som utilgjengelige, aldri ekstrapolert; kvalitetsmålene for holdover er uendret, og uten seksjonen er utdataene byte-identiske

seg-9cbb4ee7588a = Romlig, støyende observerbarhet av buelengde i flere cislunare familier

seg-5ebd771deef8 = Observerbarhetsterskelen for buelengde i cislunart rom i det ROMLIGE CR3BP med seks tilstander i stedet for det plane med fire tilstander, på tvers av familiene DRO, L2-halo og L2 nesten-rettlinjet halo, med målestøy i Gramian og TO kriterier rapportert fordi det ikke finnes ett enkelt ærlig: det publiserte rangkriteriet, som beviselig er invariant overfor en homoskedastisk måle-sigma (veiing multipliserer observerbarhetsmatrisen med en skalar, slik at det relative singulærverdispekteret og dermed rang, defekt og kondisjonstall er uendret), og et estimerbarhetskriterium — den første buen der den formelle 1σ-posisjonsusikkerheten i hovedfarkostens starttilstand faller under en oppgitt grense — som er det som flytter seg med støy. Hver terskel bærer intervallet i epokenettet den ligger i; et kriterium som ikke nås er null med en begrunnelse. Plan modus forblir standard, og familier utenfor planet avvises der i stedet for å bli flatet ut til en tilstand som ikke kan representere dem

seg-e250321394bc = Feil i prediksjon av jordorientering i operativ stil, målt predikert mot endelig

seg-0e443d241460 = En minste kvadraters tilpasning av bias pluss rate over et glidende vindu pluss de viktigste periodiske leddene — årlig, halvårlig og de to viktigste sonale tidevannene for UT1; Chandler, årlig og halvårlig for polen — ekstrapolert med det siste residualet i vinduet ført videre: klassen IERS Bulletin A bruker, i stedet for persistensprediktoren som den publiserte horisonten bygde på. Vurdert på den eneste ærlige måten: en prognose for T+h bygd fra rapid-rader i Bulletin A ved eller før T, målt mot den SENERE publiserte endelige Bulletin B ved T+h, med persistens vurdert over nøyaktig samme epokesett mot de samme endelige verdiene ved siden av. En målepoke uten publisert endelig verdi forkastes i stedet for å vurderes på nytt mot rapid-kolonnen; et periodisk ledd som vinduet ikke kan begrense rapporteres som forkastet med de syklusene det faktisk dekker; et ufullstendig vindu avvises i stedet for å forkortes i det stille

seg-f4efd94dd746 = Lunart rammedatum fra en observasjonskampanje

seg-a6972eb89d7d = Helmert-datumet med sju parametere propagert fra en SIMULERT OBSERVASJONSKAMPANJE i stedet for å bli gjenvunnet fra en injisert transformasjon. Jordstasjoner observerer en kildebelagt katalog over lunare overflate-radiofyr etter en eksplisitt plan; de partielle deriverte for lunar VLBI-forsinkelse akkumuleres i en Fisher-informasjonsmatrise for radiofyrkoordinater og sendes gjennom Helmert-designet A = [I₃ | [p]ₓ | p] til H = AᵀM_bA, slik at den rapporterte datumnøyaktigheten er en funksjon av observasjonsprogrammet — nøyaktig lineær i forsinkelsens sigma og monoton i buen gjennom den librasjonen rapporten MÅLER. Datumdefekten er temaet i stedet for en fotnote: rang, defekt, kondisjonstall, spektrum, uobserverbare retninger i basisen med sju parametere, den svakeste retningen selv ved full rang og hver parameters andel av den utsendes ved hver kjøring, og enhver parameter kampanjen ikke begrenser publiseres som NULL med en status. Korrelasjonen mellom radiofyrfeil er MÅLT, ikke antatt — nøyaktig null med stasjonene holdt faste, og skrevet ut med kostnaden når de estimeres. Kan kjøres som scenariotypen <c1/>

seg-ca481f2d8f9e = Bekreftelse med uavhengig estimator av terskelen for cislunar buelengde

seg-3d5fbf896209 = En batch-estimator med minste kvadrater som GJENVINNER hovedfarkostens starttilstand fra simulerte målinger mellom satellitter over voksende prefikser av det samme epokenettet som tabellen for rang mot bue bruker, med målingenes partielle deriverte tatt som sentrale differanser av den sammensatte forovermodellen. Den bruker ingenting av maskineriet som terskelen ble målt med — ingen analytisk Jacobi-rad, ingen variasjonell tilstandsovergangsmatrise, ingen singulærverdi- eller egenverdidekomposisjon, ingen rangtoleranse, intet kvadratrotinformasjonsfilter — og deler bare dynamikken, startbetingelsene, den skalare observabelen og epokenettet, hver navngitt i det utsendte dokumentet. To kriterier, begge sveipet: gjenvinning uten støy (motstykket til rang) og Monte Carlo-estimerbarhet (motstykket til estimerbarhet, målt mot en kjent referanse i stedet for forutsagt fra en kovarians). Kan kjøres som scenariotypen <c1/>

seg-f839285852d9 = Lunart tjenestevolum fra virkelig, hentet konstellasjonsgeometri

seg-c3059fcced49 = Godtar en tabulert månesentrert tilstandsefemeride (evalueringen av en SPK/BSP-kjerne) eller en publisert konstellasjonsdefinisjon bak <c1/>, kjører den identiske sveipen for dekning / DOP / beskyttelsesnivå mot den, og utsender σ_URE-avstandskravet den innebærer VED SIDEN AV de uendrede illustrative Kepler- og perturberte resultatene, med forskjellen som en egen navngitt størrelse. Hvert tall bærer en proveniensklasse som skiller kjerneavledet fra avledet av publiserte elementer fra modellert, slik at de aldri kan forveksles i et senere sitat

seg-36a6cfaf5afa = Enhet og proveniens deklarert for hver rapportert størrelse

seg-12460501e82b = Et maskinlesbart skjema som gir enhet, proveniensklasse og definisjon for hvert numeriske felt i hver scenariorapport, pluss én global port som kjører hver registrerte scenariotype og feiler hvis et utsendt numerisk felt mangler noen av dem. Proveniensvokabularet er lukket og hver klasse bærer et evidensnivå, med to klasser bevisst avbildet til <c1/> og <c2/> i stedet for å få et nivå klassen ikke bestemmer

seg-c815cb90dcde = Lunar referansestasjonsgeodesi: lagt til retroreflektor og VLBI-radiofyr mot datumet med fem grupper

seg-103cf21173ac = Valgfrie inndata extra_reflectors og extra_beacons i scenarioet lunar-llr-datum legger til en station_geodesy-blokk: Helmert-informasjonen for de fem gruppene fra det arkiverte utsnittet av lunar laseravstandsmåling pluss informasjonen som en lagt til retroreflektor (målt ved de arkiverte normalpunktepokene der målestasjonen er over horisonten, hver med det normalpunktets arkiverte vekt) og et lagt til VLBI-radiofyr (observert av nettverket og planen i lunar-frame-campaign med jordstasjonene faste, gjennom de partielle deriverte for forsinkelse i lunar-vlbi-fim) på oppgitte steder legger på datumet med sju parametere, løst på nytt, med hver Helmert-parameters 1-sigma før og etter, forholdet mellom dem, normene før og etter og ytterverdiene for egenverdiene til Fisher-differansen. Fraværende eller tom er rapporten uendret

seg-44f582b17fa9 = Portintegritet — en grønn som betyr det den sier

seg-43fbcfbe990c = Tre strukturelle vakter over selve verifiseringsprosessen, hver lukker en klasse feil som nådde den kanoniske porten som en intermitterende eller falsk rød. ({ "1" }) Hver konstruert midlertidig sti i Rust-kildene må ha en unik komponent per kall; en prosess-ID avvises, fordi cargo kjører bibliotekstestene som parallelle tråder i ÉN prosess og pid er delt av dem alle. ({ "2" }) Hver byte-for-byte- eller hash-festing må deklarere, ved siden av seg selv eller i modulhodet, hva den dekker og hva den bevisst utelater — slik at en tverrgående endring kan se med et blikk hvilke festinger som er i omfang og hvilke som i det stille har blitt detektorer for endringer i hele depotet. ({ "3" }) En grønn kan bare påstås fra den FULLE suiten: scripts/gate.sh kjører <c1/>, fanger den sanne utgangskoden uten noen pipe i veien, og skriver en kvittering som navngir commit, antall integrasjonsbinærer, antall tester og varigheten; pre-push-sjekken avviser en push hvis commit ingen gyldig kvittering navngir, på et rent tre. Repeterbarhet samples separat av scripts/check-repeatability.sh, som kjører bibliotekssuiten N ganger og feiler hvis settet av beståtte tester er forskjellig.

seg-b7cd952ff133 = Sammensatt tids-PL — P0-seedet gjennomkjøring av holdover

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); nedre semikontinuerlig PL({ "0" }+)≥PL({ "0" }−); K(IR/2) løpende maks; faseeksponenter τ/τ³/τ⁵

seg-096b6cdfe2dc = Sammensatt tids-PL — LIL n.s.-omhyllingskurve (umulighet + konsistens)

seg-1671add2210d = Ingen endelig holdover for verste tilfelle (Brownsk sup divergerer); IR-allokert HPL konsistent med Hartman-Wintner-omhyllingskurven når IR→{ "0" }

seg-5a27c9f0a67d = Heterogen UTC(k)-overgrense for sporbarhetsbias i integritet

seg-fd09ab2adbf6 = Overgrense for bias per kilde b = (U/k_cov)·Phi^-1(1-tail/2) + aldring, som blåser opp en publisert utvidet Type B-usikkerhet til en allokert integritetshale; bro til tpl_scalar som bias_s

seg-d75b900ad25f = Korrelert kryss-kovarians for sporbarhetsbias (usikker allokering for felles modus)

seg-0641f6d38c23 = N×N bias-kryss-kovarians med rho·b_i·b_j utenfor diagonalen for kilder som deler en UTC(k)-realiserer; BEVIST correlated_fused_bias >= independent_fused_bias (naiv uavhengig allokering underavgrenser den fusjonerte biasen -> optimistisk -> usikker)

seg-1a3bb032960f = Konsistensstatistikk for felles modus (separasjonsblind feil i delt referanse)

seg-1b03f522b8fc = Skårestatistikk ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 for et skift i felles modus som løsningsseparasjon (kontraster ortogonale på { "1" }) ikke kan se; et skift i felles modus blåser den opp mens parvise separasjoner forblir flate

seg-3359eee713a5 = Lunar klassifisering av datumets nullrom (LLR rang-additivitet + librasjonens defektløft)

seg-6d722c176052 = Klassifisering av datumproblemet med intern avstandsmåling: en enkelt avstandsobservasjon bidrar med rang { "1" } (6-dimensjonalt nullrom); paret origo-X og skala er nesten null og fysisk DE440-librasjon løfter defekten til null mens paret forblir nesten degenerert

seg-3fd19007ea67 = Lunar datuminformasjon fra flere teknikker (LLR + lunar VLBI + banefarkostavstand)

seg-23d0dd7d0666 = Datum-Jacobi-rader for LLR-avstand jord–reflektor, differensiell lunar VLBI-forsinkelse med to stasjoner og avstand banefarkost–radiofyr over datumet med 7 parametere, kombinert til én konsistent forhåndskondisjonert Fisher; viser at tracking utenfor radial retning (banefarkost / dybdediversifisert) bryter degenerasjonen mellom origo-X og skala der transversal VLBI bare hjelper indirekte

seg-ab96cfc8d48c = Lunart LLR-substrat for datumgeometri (reflektorer i hovedakser, bakkestasjoner, analytiske avstandsderiverte)

seg-40e91288f81a = De fem retroreflektorgruppene på nærsiden i PA-kroppsramme i meter og LLR-bakkestasjonene i geodetiske koordinater; reflektorens plassering fra kropp til treghetssystem gjennom DE440 PA-orienteringen; analytiske deriverte av avstanden jord–reflektor med hensyn til datumet med 4 parametere; og den rene LLR-Fisher-matrisen som viser degenerasjonen mellom lunosenter-X og skala som motiverer analysen med 7 parametere

seg-63a8571f8eb0 = Degenerasjon mellom avstand og klokkeavvik i enveis lunar avstandsmåling, og designloven for geometrisk diversitet

seg-cdd70f56051a = Degenerasjonen mellom radiell avstand per node og mottakerens klokkeavvik er nøyaktig ved { "1" } m til { "3.336" } ns (én over c). Schur-komplementmarginalen { "{" }scale, offset{ "}" } (coupled_marginal_fisher) viser at i et geometrisk variert nettverk løfter tovegs avstandsmåling marginalen med omtrent samme faktor som et like stort antall ekstra enveisdata, mens i det idealiserte regimet med én node er løftet fra tovegs størrelsesordener større. Designloven som følger: geometrisk diversitet, ikke tovegs avstandsmåling som sådan, er det som skiller lunar rammeskala fra tidsskalaavvik i enveis avstandsmåling; en tovegs eller ekstern tidskobling trengs bare i regimet med lav diversitet eller én bruker.

seg-2c074d6260ba = Representativ målemeny for flere teknikker og den additive Fisher-kombinasjonsregelen

seg-beefac5c1b13 = MeasurementBlock holder én kandidatmålekampanje som et 7x7 Fisher-informasjonsbidrag pluss en skalar relativ kostnad; block_from_rows bygger en fra rå datum-Jacobi-rader slik at hver blokk forhåndskondisjoneres identisk gjennom lunar_identifiability::assemble_multi_info; combine summerer informasjonen til en valgt delmengde, som er den riktige regelen fordi Fisher-informasjon er additiv over uavhengige målinger; representative_lunar_menu leverer en deterministisk meny med fire blokker (LLR, et tverrgående VLBI-limb-radiofyr, en banefarkost på nærsiden og en banefarkost på bakre side). Den budsjettbegrensede designoptimereren som bruker denne menyen er ikke en del av denne crate-en.

seg-2d3347bcb15e = Toleranse for konsistens på tvers av leverandører for en bruker med blandede leverandører

seg-9decf2cb6b0c = consistency_tolerance: inverterer et posisjonsbudsjett for brukeren til et krav per parameter om Helmert-overensstemmelse mellom leverandører (origo/skala/rotasjon) ved en referansearm, eventuelt oppblåst av CRLB for realisering hos én leverandør (P1)

seg-5450d921dfc9 = Feilbudsjett for lunar interoperabilitet mellom flere leverandører og designlov for ramme mot efemeride

seg-e1e30f5c17a6 = interop_budget: reduserbar (felles rammekobling) mot ikke-reduserbar (dynamikk) oppdeling under konvensjonene PerProvider / CommonFrameTie / CommonEphemeris, med designlovmetrikken for ikke-reduserbar andel (~{ "0.69" } på virkelige DE440/INPOP/EPM: en felles rammemerking alene lar det dominerende gulvet stå)

seg-ebb827739614 = Bysantinsk blokk-spark-grense for detektering/identifisering i det autonome nettverket per node for Månen (T3)

seg-4fb935e6193d = byzantine_bound instansierer koding/sparse-observerbarhetsgrensen for sikker tilstandsestimering på nettverksgeometrien per node: en bysantinsk peer injiserer en vilkårlig lineærkombinasjon av målingene den deltar i, og nettverket DETEKTERER enhver koalisjon på ≤ f = block_spark − { "1" } peers og IDENTIFISERER entydig enhver koalisjon på ≤ ⌊(block_spark − { "1" })/2⌋, der block_spark er den minste peer-koalisjonen hvis stablede effektive signaturer P⊥·B_T er kolonnerangdefekte. Peer-detekterbarhet er FULL KOLONNERANG for P⊥·B_j (en blokk som ikke er null men er rangdefekt er et angrep som ikke er null, som lander i range(G) og ikke etterlater noe residual), ikke bare P⊥·B_j ≠ { "0" }

seg-4f57f586cf82 = Autonomt gulv for tidsmessig gauge ved holdover for den selvrefererende lunar konstellasjonen (T4)

seg-eb690e8f5c9b = holdover_floor fastslår at i et ensemble av autonome noder koblet bare av målinger mellom noder er den felles klokkeraten (δα_j += { "1" } ∀j) en fri parameter i ensembletid som ligger i N(GᵀWG): ingen mengde ekstra avstandsmåling mellom noder kan observere den (rate_in_gauge = true, temporal_gauge_dim = { "2" } sammen med det felles avviket). Dette er det genuine holdover-gulvet — det tidsmessige motstykket til gaugen for stiv rammeposisjon. Å legge til én ekstern absolutt ratekobling (en direkte lenke til en referanse utenfor nettverket) driver den felles raten ut av nullrommet (rate_in_gauge = false, temporal_gauge_dim = { "1" }), noe som beviser at gulvet er en virkelig gauge, ikke en artefakt i oscillatormodellen

seg-25ffd6e1979c = Felles/differensiell oppdeling av leverandører, forening av én rangdefekt og beskyttelsesgapets helning (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Tre fasetter av den ene dekomposisjonen ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) med gaugen datum⊕tidsskala med 8 dimensjoner som N(G) og de state_dim − { "8" } = { "32" } observerbare retningene som range(G): (T5) provider_mismatch_split klassifiserer en felles bias hos flere leverandører (∈ range(G)) som UDETEKTERBAR — trenger en ekstern kobling — og en differensiell bias (∉ range(G)) som selvovervåket / DETEKTERBAR; (§{ "0" }) foreningen er at det SAMME blinde underrommet range(G) styrer den udetekterbare feilklassen, så datumgaugen N(G) og det feilblinde underrommet range(G) er én geometri, ikke to; (g7) slope returnerer helningen ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ for Brown-beskyttelsesgapet for en feil b ∈ range(G) (estimatoren ødelagt med null paritet) og endelig for en detekterbar feil

seg-632add2dbd3c = ITU-T-masker for telekomsynkronisering med PASS/FAIL og margin

seg-47687529aee7 = Transkriberte grenser fra ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC låst og ePRTC-A holdover (inkludert tidsfeilomhyllingen i Table { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-klassene A-D og G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) referansepunkt C, hvert intervall åpent eller lukket slik tabellen oppgir det, med hver oppføring 'for further study' utelatt; en avgjørelse og en margin ved det bindende punktet per kontroll, og tiden til hvert budsjett overskrides. Kan kjøres som scenariotypen <c1/>

seg-165ed2bc771a = ITU-T-masker for wander-generering ved frekvenssynkronisering (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Sju wander-genereringsmasker for MTIE og TDEV ved konstant temperatur for typen <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) typene I, II og III, G.8262 (10/2024) EEC-alternativene { "1" } og { "2" } og G.8262.1 (11/2025) eEEC (låst modus), inkludert potenslovleddene tabellene skriver (<c2/> og lignende), hvert intervall åpent eller lukket slik det er trykt, målt gjennom filteret på { "10" } Hz klausulene oppgir (antatt anvendt før sampling); referansescenariet scenarios/telecom-synce-eec.toml setter en fritt løpende OCXO mot de tre EEC-maskene. Ikke implementert: tilleggene for variabel temperatur, holdover, transienter, jitter og G.811-frekvensnøyaktigheten

seg-5fc2ad88faf0 = Klokkeloggformater (RINEX clock, TimeLab ASCII, TAPR TICC) lest til en normalisert faseserie

seg-5b5bcbdea166 = clock_log::read_input: ett parserlag som gjør en RINEX-klokkefil (AS/AR-poster for én navngitt klokke, versjonene { "2" } og { "3.00" } til { "3.04" }), en fase- eller frekvenslogg i TimeLab-stil ASCII, eller en TAPR TICC-logg med tidsstempel eller intervall om til et uniformt fasenett, med tau0 oppgitt, fra en header, eller medianavstanden, hvert gap, avlesning utenfor nettet og duplikat telt, og en gap-policy som avviser, tar lengste løp eller lineær; koblet inn valgfritt i serien for telecom-timing (<c1/>, som legger til en blokk <c2/>) og clock-typen (<c3/>, som legger til en blokk <c4/> med ADEV, TDEV og MTIE, tabellens SHA-256 og fase-SHA-256; runs = { "1" }). Uten tabellen er begge typene byte-identiske

seg-acdb0337bce7 = Klokkeloggformatene linuxptp (ptp4l, phc2sys, ts2phc) og chrony (tracking, statistics) lest til en normalisert faseserie

seg-e87b3dba2072 = clock_log::read_input med formatene ptp4l, phc2sys, ts2phc, chrony-tracking og chrony-statistics: den loggede forskyvningen fra en linuxptp-servolinje (ns, linjens egen tidsstempel i hakeparentes, avlesninger før servoen første gang rapporterer s2 utelatt og telt) eller fra en chrony-tracking- eller statistikklogg (s, etter kolonneposisjon, UTC-dato og -tid) blir et uniformt fasenett gjennom de samme gap-policyene som de andre formatene; en kildevelger (<c1/>) navngir ett av flere grensesnitt, klokker eller adresser; loggene mater serien for telecom-timing, clock-typen og holdover-test-typen

seg-97aebb84576e = Holdover-test vurdert fra en tidsfeilregistrering levert av operatøren

seg-ab533cf99c56 = Typen <c1/>: en tidsfeilregistrering (en linuxptp-, chrony-, TICC-, TimeLab- eller RINEX-klokkelogg, eller par av time_s,time_error_ns) deles ved de to tidspunktene operatøren oppgir for fjerning og gjenoppretting av GNSS i et trinn for grunnlinje, et for holdover og et for gjenoppretting; grunnlinjen måles mot ITU-T-maskene skrevet for en låst klokke og holdoveren mot de som er skrevet for holdover eller en autonom klokke, ePRTC-A-holdoveromhyllingen og tidsfeilbudsjettene; holdoveren rapporterer frekvensforskyvningen med minste kvadrater som systemet holdt, og gjenopprettingen om og når |TE| kom innenfor et oppgitt bånd og ble der i en oppgitt oppholdstid, med toppen og det største trinnet. Hver grense er den telecom-timing-typen transkriberer; de to tidspunktene er operatørens påstand og verifiseres ikke

seg-94cbac97a1aa = Tilgjengelighet for GNSS-signaler i Space Service Volume og utover, sammenlignet med ICG SSV-heftet

seg-c59e349fdc9e = Tilgjengelighetssveipene til typen <c1/>: per konstellasjon (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og kombinert, andelen (bruker, epoke)-par med minst ett og minst fire signaler og det lengste utfallet, for en bruker på en kule (heftets globale skall på 2,562 punkter, { "14" } dager ved { "1" } minutt) eller på en bane (GEO, HEO, månetransfer), fra de keplerske banene i heftets vedlegg C, en konstant minste utstrålt effekt innenfor referansevinkelen utenfor siktaksen, jordblokkering av kulen pluss { "50" } km og en C/N0-terskel; brukerantenner fra heftets tabell B10

seg-d2f04991c8a4 = Effekter av limb-stråle på ionosfære, plasmasfære og atmosfære på streifende GNSS-signaler, og utformingen av mottakeren for svake signaler, i typen <c1/>

seg-1a1786ba90b6 = En Chapman-ionosfære, en plasmasfære av Gallagher-typen og en nøytral atmosfære (brytningsbøyning, oksygenabsorpsjon, defokusering) integrert langs den rette strålen mellom sender og bruker: skrått totalt elektroninnhold, dets plasmasfæriske del, ekstra forsinkelse, tangenthøyde og tapet på streifende lenker; og en utforming av mottaker for svake signaler (koherent og ikke-koherent integrasjon, databitgrense, støtte, Dopplersøk) som setter C/N0-terskelen fra modellene for oppfangning og sporingssløyfe

seg-6b8f9f3ca2a3 = Navigasjonsfilter om bord for GNSS for romfartøy i høy bane og månetransfer

seg-39ddc494f103 = Modusen <c2/> i typen <c1/>: et utvidet Kalman-filter med ni tilstander (posisjon, hastighet, mottakerklokkens bias og drift, en skala for solstrålingstrykk) på pseudoavstander hvis tilgjengelighet, støy og C/N0 kommer fra samme lenkegeometri som sveipene; referansen integreres med J2, tredjelegemene Sol og Måne og strålingstrykk med skygge, filteret modellerer J2 og tredjelegemene og estimerer strålingstrykket; rapporterer posisjons- og hastighetsfeil innenfor og over GNSS-banene, det lengste målingsgapet og gjennomsnittlig NEES

seg-5fc242476828 = Relativ navigasjon for en formasjon av flere romfartøy i en sterkt elliptisk bane fra GNSS

seg-f67eb29d4483 = Modusen <c2/> i typen <c1/>: en hovedfarkost og følgefarkoster kjører hver det absolutte filteret; følgefarkostens posisjon relativt til hovedfarkosten estimeres ved å trekke fra de absolutte estimatene og med et relativt filter på enkeltdifferensierte pseudoavstander for signalene begge farkoster sporer, med den relative dynamikken som differansen mellom to ikke-lineære baner

seg-7038f6902820 = Feilledd i kaldatom-interferometer: Raman-laserfasestøy, bias fra bølgefrontkrumning og oppløsning av fringe-flertydighet

seg-4d9690207607 = inertial::cai_error_terms (biblioteksfunksjoner, ennå ikke nåbare fra en scenariotype): vektingsfunksjonen for Raman-fase for et interferometer med tre firkantpulser (Cheinet et al. { "2008" }, Eq. { "8" }) med den lukkede formen for hvit fase (pi/2)^{ "2" } S_phi0/tau_R og en numerisk vei for ethvert spektrum; laserfrekvensstøyen som forsinkelsen ved retroreflektering ikke kansellerer (Le Gouet et al. { "2007" }, Eqs. { "9" } til { "11" }); ren defokus-bølgefrontbias sigma_v^2/R for en termisk sky og dens reduksjon med en deteksjonsradius; sannsynligheten for feil fringe-indeks erfc(pi/(sqrt({ "2" }) s)) for en hjelp fra et klassisk akselerometer og for to avhørstider, og dens invers

seg-363705e03bac = Holdover-forhåndsinnstillinger for oscillatorer fra offentlige datablad

seg-9750d9e0ec7a = Fire forhåndsinnstillinger — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A høyytelsesrør) og CSAC (Microchip SA.45s) — hver med databladets maksima for Allan-deviasjon, aldring og temperaturgrense; en ikke-negativ minste kvadraters tilpasning av frekvensstøy med hvit + flimmer + random walk skalert til å omhylle hvert databladpunkt, et flimmergulv aldri under tallet for lengste τ, lineær aldring og et sinusformet temperaturledd, syntetisert som en seedet holdover etter et GNSS-tap

seg-d7e03158b972 = Sekunder til en fritt løpende klokke forlater vakten til et tidsindeksert slot, og fix-kadensen som holder den innenfor

seg-0b4d8815f756 = Typen <c1/>: den predikerte feilen E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² invertert for bruddet, gjenværende tid, resynkroniseringsintervallet netto av fix-latens og fixer per døgn, hvert ledd spesifisert med det dominerende navngitt; klokker fra de seks standardene i ClockClass (TCXO, OCXO og RAFS lagt til, hver med ett datablad som kilde), forhåndsinnstillingene for telecom-timing, et innebygd datablad eller en målt registrering; et brudd utover kildens lengste midlingstid flagges som ekstrapolert

seg-2797643153dc = Beskyttelsesnivå for tidssynkronisering for en mottaker i bane under GNSS-spoofing

seg-cb412a2ffadf = orbital_timing::orbital_timing, tilgjengelig som spoofing-seksjonen i <c1/>-typen: hastighet og omløpstid i sirkulær bane, lengste tid en spoofer på bakken kan nå satellitten per overflyvning, gulvet til den klokkestøttede monitoren og CUSUM-deteksjonsforsinkelsen, det betingede beskyttelsesnivået (gulvet pluss drift over forsinkelsen), trekket en spoofer med oppgitt maksimal rampehastighet rekker å akkumulere før satellitten forlater fotavtrykket sitt eller en uavhengig kontroll kjøres, og om hver kontroll via bakkekontakt eller krysslenke er uavhengig av én spoofer på bakken

seg-f134975d4ffa = Vannfallsdiagram av L-bånd-spekteret med J/S per bånd og effektiv C/N0 under en skriptet jammer-tidslinje

seg-86ad8f89a822 = <c1/>-typen: et frekvens-mot-tid-rutenett av effekttettheten i L-båndet (termisk gulv k T_sys med T_sys = T_ant + { "290" } K (F - { "1" }), signalene ved sine minste mottatte effekter i grensesnittspesifikasjonen, og jammere med kontinuerlig bølge, smalbånd, chirp og tilpasset støy med av- og på-tidspunkter), der hver celle er gjennomsnittet over sin binge og rad (chirper nøyaktig over hele og delvise sveip, jammere etter driftssyklus), effektiv C/N0 per bånd = [1/(C/N0) + sum (J/S) kappa]^-1 per rad, J/S per bånd, J/S i båndet, og et SVG-vannfallsdiagram med C/N0-søyler. Rapporten inneholder en kryssjekk mot kjeden til <c2/>-typen på de samme linkinndataene

seg-6e0b9687e8ee = Uranus og Neptun fra Standish tabell { "1" }, Pluto og planetenes hastigheter

seg-df3bf502dfe9 = Posisjoner for Uranus og Neptun fra Standish tabell { "1" } (standard innenfor { "1800" } e.Kr. til { "2050" } e.Kr.), Pluto fra raden i tabell { "1" } fra { "1992" } som den gjeldende JPL-siden ikke lenger oppfører, og den heliosentriske hastigheten til hver planet: den todelte deriverte med middelbevegelsen elementene gir, pluss dreiningen av ellipsen fra endringsratene til perihel, inklinasjon og node

seg-a50be56f605a = Posisjoner for Månen og sju store måner (Phobos, Deimos, de galileiske månene, Titan)

seg-2cfbe5a1eece = Den geosentriske Månen fra rekken til Montenbruck & Gill (hvis ledd på -1.3972 grader per århundre allerede viser den til J2000-jevndøgnet), og planetosentriske posisjoner og hastigheter for Phobos, Deimos, Io, Europa, Ganymede og Callisto fra JPL Solar System Dynamics sine middelelementer i hver månes Laplace-plan med middellengderaten hentet fra den IAU-synkrone rotasjonsraten (tabellen oppgir perioden med for få siffer til å holde fasen), og for Titan fra IAU-rotasjonsmodellen (månen på minus den legemsfaste x-aksen ved middelavstand), fordi Titans trykte Laplace-planrad ikke gjengir Horizons selv ved sin egen epoke

seg-8b8c8e28ece9 = Fysiske konstanter for hvert legeme i solsystemet og rapporten for hele systemet

seg-d225a30de35c = Body får Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymede, Callisto og Titan (gravitasjonsparameter, referanseradius, J2 der den er publisert med radiusen den refererer til, IAU-pol og nullmeridian), et navneoppslag og en BodyFacts-post (NAIF-kode, klasse, overordnet legeme, ekvatorial radius og middelradius); <c1/>-typen rapporterer dem for alle atten legemer sammen med posisjoner, lystider og et banespor over ett omløp, der hvert legeme er merket VALIDATED eller MODELLED

seg-87ab655f8270 = Posisjonering rundt et hvilket som helst legeme i solsystemet med en lokal konstellasjon og en dypromslink fra jorden

seg-d9b1b0ac97d3 = <c1/>-typen: en orbiter eller en landingsfarkost på overflaten rundt et legeme valgt ved navn navigerer med enveis pseudoavstander fra en Walker-navigasjonskonstellasjon rundt legemet (todelte baner med legemets sekulære J2-drift, en ukjent brukerklokke) og en valgfri klokkefri tovegsavstand fra jorden, med jordens retning og avstand fra den analytiske efemeriden ved hver epoke; siktlinjer blokkert av legemets kule og en elevasjonsmaske på overflaten; per epoke GDOP og PDOP for konstellasjonen alene (orbit::dop), den formelle posisjonsusikkerheten med og uten jordraden, og sådde Gauss-Newton-posisjonsbestemmelser (batch_ls::gauss_newton) for hver variant, med lystiden og rundturen fra legemet til jorden

seg-7d4d7200cbca = Dekning og kart over fortynning av presisjon for vilkårlige konstellasjonsutforminger med flere konstellasjoner i stor skala, rundt et hvilket som helst sentrallegeme

seg-b78b79e9fae4 = <c1/>-typen utover de to fastlåste tilfellene: eksplisitte utforminger og utforminger med flere skall, flere konstellasjoner per kjøring med én mottakerklokke per konstellasjon, jorden, Månen og Mars fra legemekonstantene, BeiDou-forhåndsinnstillingen (fase i middels bane og kryssing ved { "118" } grader Ø i skråstilt geosynkron bane modellert), satellitter i sikte per celle, GDOP, PDOP, HDOP, VDOP og tilgjengelighet, nedsamplede bakkespor, og et forhåndsfilter for synlighet etter undersatellittens breddegrad som kjører en utforming med { "5" } 000 satellitter på et { "10" }-graders rutenett på en brøkdel av et sekund

seg-278c77438493 = Et lenket oppdrag på tvers av scenariotyper på én felles tidslinje

seg-3dcfb26f6234 = Fasene til <c1/>-typen: hver fase kjører ett eller flere scenarioer av eksisterende typer gjennom run_toml, leser utdataene deres inn i navngitte kanaler (klokkens tidsfeil og vakt, gjennomsnittlig effektivt forhold mellom bærebølge og støytetthet og sporingsgulv, vertikalt beskyttelsesnivå og alarmgrense, posisjonsfeil, satellitter som spores, alarmflagg) med forhåndsinnstillinger per type eller eksplisitte resultatstier, plasserer dem ved fasestart og holder dem ut på et felles rutenett, med fasegrenser og hendelser; tilstand føres videre med carry (en kanal fortsetter fra sluttverdien i forrige fase), handoff (nummeret til en forrige fase skrevet inn i neste scenario) og end_at (en fase slutter på et tidspunkt en kjøring beregnet, for eksempel deteksjonstidspunktet til en spoofing-monitor); en kampanjehash og en digest over hvert medlemsresultat

seg-ad6105af464c = Parametersveip og sådde Monte Carlo-ensembler over en hvilken som helst scenariotype

seg-95921611839e = Sveipet til <c1/>-typen (én til tre punktnotasjonsnøkler av en hvilken som helst type, på det generiske sveipets akseverdier, eventuelt med et ensemble i hver node) og monte_carlo-seksjonene: realisasjon k kjører ved base_seed + k; hver metrikk rapporterer gjennomsnitt, standardavvik, persentilene 5./50./95. etter nærmeste rang og et persentil-bootstrap-konfidensintervall med fast seed på { "95" } % for gjennomsnittet (inertial::metric_stat); metrikkenhetene leses fra den sveipede typens egen enhetsblokk

seg-24327a0ed82e = Flere scenarioer under felles forhold, med en samlet oppsummering

seg-5833fb3b06e3 = Compose-seksjonen til <c1/>-typen: navngitte felles verdier (for eksempel effekten og posisjonen til én jammer) skrevet inn i hvert medlem på nøklene det binder dem til, hvert medlem kjørt, og per metrikk den minste, største og gjennomsnittlige verdien på tvers av medlemmene med medlemmet navngitt; metrikkenhetene må stemme på tvers av medlemmene

seg-0bc866720bde = Avgrenset optimalisering av én metrikk over kampanjeparametere

seg-f9bdb89c2b4f = Optimize-seksjonen til <c1/>-typen (CAP-32): én til tre punktnotasjonsnøkler i scenarioet avgrenset til [lo, hi] på lin- eller log-skala, én metrikk lest ved resultatsti, mål minimize, maximize eller target; metode grid (sveipets akseverdier) eller en deterministisk Nelder-Mead-simpleks i normaliserte koordinater med boksprojeksjon og standardkoeffisientene; en manglende eller ikke-endelig metrikk skåres som verst og blir stående i sporet; med runs > { "1" } er metrikken gjennomsnittet over felles seeds; hver evaluering er en ekte kjøring av den navngitte typen, oppført i trace og telt i reproduserbarhetsdigesten

seg-652e28dfa10f = Signalutforminger for posisjonering, navigasjon og tidssynkronisering i lav jordbane: kodesporing, akkvisisjon, GNSS-kompatibilitet og en båndavveining for et hvilket som helst system

seg-c0ba5c7e708e = <c1/>-typen: parametriserte signalutforminger (bånd, senderbåndbredde, ITU-tildeling; akkvisisjons-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flate spektre, effektandeler, FDMA-underbærebølger, kodelengder og datarater) fra innkompilerte offentlige forhåndsinnstillingsfiler (Xona Pulsar, Iridium STL, Starlink-signal av anledning, CentiSpace, en generisk C-bånd-utforming og generiske UHF/L/S/C/bredt-C-utforminger, hver med sin kilde-URL og upubliserte verdier merket REPRESENTATIVE) eller skrevet inline; per signal den båndbegrensede effekttettheten, andeler av effekten i båndet, Gabor-båndbredde, kodejitter mot C/N0 og avstand og avstandsmålingsnøyaktigheten, akkvisisjonssøkerommet, deteksjonssannsynlighet med kvadratisk lov og gjennomsnittlig serielle og kodeparallelle akkvisisjonstid, den spektrale separasjonskoeffisienten inn i og ut fra GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og AltBOC med C/N0-degraderingen, og CW-, bredbånds- og tilpasset J/S-toleranse fra SSC-kjeden til spectrum-typen; en båndavveining av ionosfæreforsinkelse, friromstap, avstandsmålingsnøyaktighet ved lik C/N0 og lik EIRP og jammertoleranse; og kvalitative formkontroller av en utforming mot en beskrevet måling

seg-c2b9c8e4a364 = Flerbånds vannfallsdiagram (UHF, L, S, C) med utformede signaler og jammere per bånd

seg-609df4e0a085 = <c1/>-typen utvidet utover L-båndet: bånd gitt som en forhåndsinnstilt signalutforming (tegnet med hver komponent, båndbegrenset til senderbåndbredden, C/N0 og J/S referert til den sporede komponenten) eller som en egendefinert bærebølge og modulasjon; ekstra vannfallspaneler over et vilkårlig frekvensområde på samme tidslinje og fargeskala; en bredbånds (barrage) jammer ved siden av CW, smalbånd, chirp og tilpasset støy; J/S per bånd og effektiv C/N0 fra den uendrede kjeden for spektral separasjonskoeffisient

seg-d9eb3e7e69c2 = En LEO-PNT-overflyvning og dens linkbudsjett per bånd mot MEO-GNSS-satellittene i sikte

seg-d986e44443dd = <c1/>-typen: satellitter fra en utformet overflyvning, elementer, en TLE gjennom SGP4 eller en Walker-konstellasjon fra constellation-design; per bånd og epoke siktevinklene, avstand, avstandsrate og avstandsakselerasjon i lukket form (kontrollert ved hver kjøring mot sentrale differanser og rapportert), friromstap, EIRP med isoflux-, gaussisk eller flatt mønster, en patch-, halvkule- eller isotrop brukerantenne, gassdemping etter ITU-R P.676-10 vedlegg { "2" }, P.618-regn og -scintillasjon, P.2109-bygningsinntrengningstap, polarisasjonsmismatch, systemstøytemperatur, C/N0, Doppler og Doppler-rate, og førsteordens forsinkelse fra en Klobuchar- eller vertikal-TEC-skrå TEC skalert med Chapman-andelen under satellitten; ionosfærefrie par med kodestøy ved toppen av overflyvningen; Galileo- eller GPS-bærebølger fra mottatte effekter i grensesnittdokumentene gjennom den samme mottakeren

seg-95a077a980b6 = Navngitte LEO-PNT-systemforhåndsinnstillinger med oppgitte kilder, og en systemuavhengig motor

seg-4b47033cda24 = leo_link::presets: generisk flerbånds (UHF, L, S, C), generisk C-bånd, Xona Pulsar X1/X5, Iridium STL, Starlink som et signal av anledning med bare Doppler, CentiSpace og en valgfri Celeste IOD-forhåndsinnstilling, hver med kilden merket PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP, der workshop-kilden ligger i den valgfrie Celeste IOD-forhåndsinnstillingsfilen og bare kompileres inn når den filen finnes; hvert bånd og hver bane kan overstyres i et scenario, og et scenario kan unnlate å navngi noen forhåndsinnstilling

seg-a39f34973373 = Posisjonering med lavt energiforbruk: tid til første posisjonsbestemmelse og energi per posisjonsbestemmelse mot driftssyklus

seg-f3b9b669a76f = leo_link::energy og [iot]-seksjonen til <c1/>-typen: koherent integrasjon begrenset av Doppler-raten, ikke-koherente summer med kvadratisk lov opp til en deteksjonsterskel, et Doppler-bingesøk over banens omhyllingskurve for stasjonære brukere (kald) eller et støttet vindu (varm), parallelt eller serielt kodesøk, navigasjonsmeldingstid ved kaldstart, energi per posisjonsbestemmelse og batterilevetid over intervaller mellom posisjonsbestemmelser, for hvert LEO-bånd og GNSS-signalet

seg-8121e7db3db3 = Oppdatering av LEO-navigasjonsmeldingen midt i en overflyvning med kontroll av kontinuitet ved byttet

seg-34c310d85c42 = Analysen midpass-update til <c1/>: den høyeste overflyvningen over en bruker innenfor et søkespenn, meldinger på en global tidsplan med bruksperioder sentrert i tilpasningsvinduene, og ved hvert bytte 3D-posisjonshoppet, klokkehoppet, brukerens pseudoavstandshopp, det største hoppet over en hvilken som helst synlig siktlinje (lukket form over nadirkjeglen), avstandsfeilen før og etter, og PASS/FAIL mot en terskel

seg-7635a8339e78 = Dokumentert binær koding av LEO-navigasjonsmeldingen med et kvantiseringsfeilbudsjett

seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshanas egen ramme (innledning, versjon, modell, lengde, nyttelast, CRC-24Q) for de fire efemeridemodellene, klokkepolynomet, SVID, issue of data, bånd, helsetilstand, et Klobuchar-sett, NeQuick-G-koeffisienter og UTC-parametere, hvert felt med oppgitt bredde og trinn (field_table), kvantisering med avvisning utenfor område, og et budsjett over den største endringen i posisjon og klokke et halvtrinns endring i hvert felt gir over gyldighetsvinduet

seg-17ca41d7fd71 = Eksport av LEO-navigasjonsmeldinger i RINEX-4-stil og CSV

seg-185e12ccef0d = leo_navmsg::text: en blokk i RINEX-4-stil (> EPH-posthode, satellitt- og epokelinje med tre klokkeledd, D19.12 kringkastede banelinjer) med systembokstav L og posttypene KP16, KRAC, LU22 og APOL, merket i hvert hode som en Kshana-utvidelse som ikke er en del av RINEX { "4.02" }, og en CSV-tabell med et standard kolonneskjema og forhåndsinnstilte skjemaer, hver med en importør

seg-e79047fc95af = ATOMIC ECEF-polynom uten klokke og den syntetiske modellsammenligningen for LEO ved fem høyder

seg-e261843e35b1 = EcefPoly-varianten av leo_navmsg::elements::EphemerisModel: et ECEF-polynom per akse uten klokkeledd, det relativistiske leddet fra -2 r.v/c^{ "2" }, skåret mot en styrt klokke. Også modellsammenligningsanalysen (liu_comparison over LIU2025_TABLE), som tilpasser modellen med 22 parametere ved artikkelens fem høyder over buer på 20 minutter av en bane integrert av Kshana og skriver ut resultatet ved siden av den publiserte SISRE

seg-d2e18c8bdc14 = Posisjonering fra LEO-Doppler, med én og flere satellitter, med tilstander for klokkedrift og hastighet

seg-de6cb3c06490 = Batch Gauss-Newton-posisjonering fra avstandsrate med analytiske partielle deriverte (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), en konstant brukerhastighet som valg, en høydepseudomåling for en bruker på overflaten, dempede steg; den formelle kovariansen ved referansen; projeksjoner langs banen, på tvers av banen og vertikalt; nøyaktigheten for én overflyvning mot brukerens avstand på tvers av banen; tidspunktet for nærmeste passering. Doppler-modusen til <c1/>-typen legger til feilen mot vindulengde og en modus for signaler av anledning med bare Doppler (forhåndsinnstillingen starlink-sop)

seg-7f462969d2d4 = Felles posisjonsbestemmelse med GNSS- og LEO-pseudoavstander med intersystembiaser og feilmodeller per signal

seg-b9b5298e3408 = Posisjonsbestemmelser med vektet Gauss-Newton minste kvadrater over en hvilken som helst blanding av systemer, én mottakerklokke per system (intersystembiasen estimert sammen med posisjonen) eller en kjent kringkastet forskyvning på referansetidsskalaen; sigma per måling levert av kalleren, som standard motorens termiske støy i delay-lock-loop (navsignal::dll_code_jitter_chips) ved C/N0 for elevasjonen kombinert med avstandsfeilen i signal i rommet; uvektet DOP (GDOP, PDOP, HDOP, VDOP, TDOP) i det lokale geodetiske systemet, formelle øst-nord-opp-sigma og bias-sigmaene; den felles modusen i <c1/> sammenligner posisjonsbestemmelser med bare GNSS, bare LEO og fusjonerte, og sveiper DOP mot antallet tilføyde LEO-satellitter

seg-ee9a4a0cb530 = Konvergens for presis punktposisjonering (PPP) med bare GNSS og med LEO-støtte

seg-a54f36c27d90 = Et utvidet Kalman-filter for flyttalls-PPP på ionosfærefri kode og fase: statiske koordinater, en hvit mottakerklokke, én intersystembias per ekstra system, en tilfeldig gange for våt zenitforsinkelse avbildet med 1/sin(elevasjon), en flyttalls flertydighet per satellittbue lagt til ved oppgang og fjernet ved nedgang, og den presise bane- og klokkefeilen felles for en satellitts kode og fase, behandlet som én korrelert oppdatering med to rader i en Joseph-stabilisert form; målinger simulert fra samme modell; konvergenstid (feil under terskelene til slutten av kjøringen), feilkurver og den kjøringsgjennomsnittlige posisjons-NEES for bare GNSS og hvert LEO-tilfelle, kjørt som <c1/>-typen

seg-9306f1c06081 = LEO-støttet tidsoverføring til UTC mot C/N0 og mottakeroscillatoren

seg-c618feb01476 = Klokkemålinger fra hver LEO-satellitt i sikte ved en kjent posisjon, kombinert med invers varians fra pseudoavstandsstøymodellen, filtrert av et Kalman-filter med to tilstander (fase, frekvens) hvis prosessstøy er den hvite og tilfeldig-gange-frekvensstøyen til oscillatorklassen (slot_timing::ClockNoise, clock_state::ClockClass; driftvariansen til holdover::coast_phase_variance), en sådd referanseklokke fra de samme nivåene, og uttrykket i IS-GPS-200 avsnitt { "20.3.3.5.2.4" } for systemtid til UTC med en usikkerhet i kringkastet forskyvning lagt til som en bias per kjøring; timing-modusen i <c1/> sveiper oscillatorer og C/N0-forskyvninger

seg-d92777401093 = Navngitte LEO-PNT-systemer som valgfrie datasett med forhåndsinnstillinger, hver med sin kilde

seg-5130bfe2410c = Systemuavhengige inndata: hvert system er Walker-skall, eksplisitte elementer eller en GNSS-forhåndsinnstilling, et signal (bærebølge, chiprate, båndbredde, mottatt effekt eller C/N0-område), en SISRE, en Doppler-sigma og en klokkemodell; forhåndsinnstillinger fyller bare ut det et scenario utelater, én fil hver med kilder merket PUBLIC (med URL), WORKSHOP eller DERIVED og de upubliserte verdiene oppført som representative: Xona Pulsar X1/X5, Iridium STL, Starlink-signaler av anledning, CentiSpace, et representativt C-bånd-system, ATOMIC-efemeridemodellen uten klokke, og én forhåndsinnstilling utledet fra workshopen i den valgfrie Celeste IOD-forhåndsinnstillingsfilen, holdt tilbake ved å slette den filen og dens scenarioer

seg-dec52b5b9cd6 = Ett LEO-PNT-system fra ende til ende: signalutforming, linkbudsjett for overflyvning, navigasjonsmelding og fusjonert posisjonering, der hvert trinns utdata gis videre til neste

seg-39443b31d418 = <c1/>-typen: en leo-signal-utforming (offentlig forhåndsinnstilling eller inline) setter senterfrekvens, båndbredde, chiprate og EIRP-fordeling for et leo-pass-bånd; overflyvningen gir C/N0 for den sporede komponenten og båndbegrenset kodejitter per epoke; en C/N0-linje etter minste kvadrater i sin(elevasjon), SISRE fra leo-navmsg-meldingen (tilpasset ved banen til satellitten i overflyvningen, pluss et oppgitt banebestemmelsesledd i kvadratsum) og utformingens bærebølge og chiprate går til hvert LEO-system i en felles posisjonsbestemmelse med leo-pvt og, valgfritt, til LEO-tilfellene i leo-ppp; hver overlevering rapporteres med verdi og enhet

seg-55ca63edff02 = Spoofing-deteksjon ved konsistens mellom LEO-Doppler og overflyvningsgeometri

seg-b12fc1728220 = <c2/>-seksjonen i <c1/>-typen: en spoofer forfalsker, selvkonsistent i avstand og avstandsrate, signalene sett ved en påstått posisjon som hopper og/eller skyves bort fra den sanne etter et startpunkt (per LEO-bånd og for MEO-GNSS-signalet); mottakeren forutsier hver avstandsrate fra den kringkastede banen og en uavhengig prior posisjon og hastighet, og tester de målte avstandsratene med en generalisert kjikvadratstatistikk med minste kvadrater over et vindu av epoker (klokkedrift en forstyrrelsesparameter eller med en prior), på GNSS-kanalene, LEO-kanalene og alle kanaler, med termisk støy i frequency-lock-loop fra C/N0 (Kaplan & Hegarty { "2006" }, avsnitt { "5.6.2" }); deteksjonssannsynlighet fra den ikke-sentrale kjikvadratloven ved en oppgitt sannsynlighet for falsk alarm, deteksjon erklært ved en oppgitt sannsynlighet for tapt deteksjon

seg-5f341f85ac07 = Spoofing-deteksjon ved konsistens på tvers av bånd i et LEO-signal med flere bånd

seg-2f9c4d351b0f = For hver LEO-satellitt og hvert par av avstandsmålingsbånd danner <c1/>-seksjonen den geometrifrie pseudoavstandskombinasjonen, fjerner mottakerens ionosfæremodell og tester dens steg fra epoke til epoke mot de to båndenes kodestøy og en oppgitt tolerert umodellert ionosfærerate (tosidig gaussisk, eksakt deteksjonssannsynlighet); en spoofer som forfalsker noen bånd og ikke andre, eller hvert bånd uten ionosfæren, oppdages ved starten; en som forfalsker hvert bånd og simulerer ionosfæren, oppdages ikke, noe resultatet oppgir

seg-97dbcd5f2728 = Ionosfæresondering: skrå TEC fra to-bånds forsinkelse i en LEO-overflyvning

seg-844de34fd2f3 = For hvert båndpar til en <c1/>-satellitt gir rapporten det skrå totale elektroninnholdet den geometrifrie kodekombinasjonen gjenvinner ved toppen av overflyvningen, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), og dets 1-sigma fra de to båndenes termiske kodestøy, slik at en hvilken som helst LEO-PNT-utforming med flere bånd kan avveies som en ionosfæresonde

seg-1fdbb476c8ab = Maritim tillitsscore: aggregeringen av monitorenes evidens til en score fra 0 til 100 og dens tre bånd

seg-0d76b33144f1 = Hver monitor reduserer sin evidens til et forhold mellom statistikk og terskel; scoren er { "100" } minus summen over monitorer av vekt ganger en avgrenset lineær rampe av forholdet ({ "0" } opp til { "0.5" }, { "1" } ved { "1.5" }), avgrenset til { "0" } til { "100" } og avrundet til { "0.1" }, med bånd ved { "90" } og { "55" }; hver epoke lister monitorene som trakk fra og poengene deres.

seg-51640405c9b7 = SIEM-hendelser fra tillitstelemetri: Log Event Extended Format (LEEF) over syslog

seg-1b3245506847 = Hendelser ved båndbytte (eller per epoke) som Log Event Extended Format { "2.0" }-nyttelaster i en RFC { "5424" }-konvolutt over UDP eller TCP, med en dokumentert feltavbildning.

seg-c04042b0270a = Terskler for interferens hos mottakertillit kalibrert på datasettet JammerTest { "2024" }

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: den forhåndsregistrerte kalibreringen av monitorene for C/N0-fall, AGC og jamming-indikator på det offentlige datasettet JammerTest { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, hentet ved kjøring, aldri medfølgende): per mappe en tidslinje på { "1" } s fra mon_rf.csv og rinex.csv, monitorene kjørt én gang, hver epoke etter kalibreringen merket ren eller jamming fra mappens attack_log (forskjøvet fra CEST til UTC, vakt på { "60" } s), hver terskel sveipet over et fast rutenett, den minste terskelen med samlet sannsynlighet for falsk alarm på rene epoker på høyst { "0.01" } valgt, og antall med leave-one-folder-out som tilbakeholdt datasett; en kryssjekk av UBX-leseren. Utvalget leveres bare som den valgfrie profilen [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); standardregelen og alle utdata uten den er uendret

seg-65a8361b4a22 = Jammertest-skåring: en mottakerlogg skåret per planlagt test (deteksjonsforsinkelse, uteblitte alarmer, falske alarmer, tid til gjenoppretting) mot den publiserte testplanen

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRAs testkatalog og sendeplan (MIT, hentet med en festet SHA-256, aldri medlevert i kildekoden) lest som planlagt referanse med katalog-ID-ene bevart; en kjøring av receiver-trust skåret per test (første alarm minus planlagt start, oppdaget/sen/uteblitt mot en toleranse, tid til første alarmfrie strekning, alarmer utenfor alle tidsluker og deres sikkerhetsmargin), med en signert bevispakke som bærer skåringskortet. Planen består av planlagte tidsluker, ikke registrerte sendetidspunkter

seg-ee99388f7b15 = compliance (kshana compliance-report): en kobling fra Kshana-utdata til punkter i offentlige rammeverk, utelukkende etter nummer, fylt ut fra kjøringene som er oppgitt; et resultat teller for en funksjon bare når det bærer evidensen koblingen nevner, en tom mengde gir ingen evidens, og formuleringen er "gir belegg for"; rapporten er ikke en konklusjon om at noe rammeverk er oppfylt, og ikke en vurdering eller godkjenning fra noen.

seg-98c360d82d56 = Maritime integrasjoner: Signal K-plugin, OpenCPN-gatestrøm og skårepanel, referansebygg

seg-7af9ce566646 = Tillitsscoren, båndet, årsakene, gate-tilstanden og mottakerrapportert posisjon publisert under navigation.gnss.kshana i en Signal K-server med en warn-, alarm- og normal-varsling (integrations/signalk); den gatede NMEA-strømmen, med posisjonsbestemmelsen merket ugyldig mens tilliten er kollapset og en PKSHT-setning per syklus, levert til OpenCPN over TCP av selve gaten eller av et lite relé, og et innebygd OpenCPN-skårepanel som leser PKSHT-setningen (integrations/opencpn); og systemd-enheter og en container som kjører gaten (deploy/reference-build). Der disse viser utdata, bærer de den veiledende erklæringen: Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-89ab9ef155eb = Sporing med BOC({ "1,1" }): DLL-skalering og oppløsning av bump-jump-flertydighet (valgfri)

seg-ef24be9b5917 = Feltet boc i iq::track::LoopConfig (valgfritt, None som standard): de tre DLL-diskriminatorene skalert slik at de leser kodefeilen i chip med enhetsstigning på hovedtoppen til sinus-BOC({ "1,1" }), og en bump-jump-monitor på veldig tidlige og veldig sene korrelatorer ved én halvperiode av underbæreren ({ "0.5" } chip) som hopper kode-NCO-en mot hovedtoppen når en opp/ned-teller når N ({ "8" } som standard). Uten valget er alle utdata uendret.

seg-2c32955cbfb3 = IQ-kanal for ionosfærisk scintillasjon (Cornell-modellen) mot målt { "50" } Hz GPS L1-scintillasjon

seg-2fdcb373ab25 = iq::channel::scint, Cornell-scintillasjonsmodellen (Rice-intensitet, andreordens Butterworth-spekter, fase arg z) drevet ved et målt vindus S4 og intensitetens dekorrelasjonstid, sammenlignet på det den genererer utover disse to inngangene; realdata::scint50 leser den målte loggen, fjerner trenden og kjører sammenligningen.

seg-160507ac3702 = Valgfri celle-midlende CFAR i IQ-akkvisisjon

seg-7c0a1adc9ae6 = iq::acq::ca_cfar og ca_cfar_cells (valgfri): en celle i et akkvisisjonsrutenett sammenlignes med gjennomsnittet av referanseceller i sin Doppler-rad (vern- og steglag, med omlegg rundt perioden), med en faktor alpha fastsatt ut fra den lukkede formelen for CA-CFAR-falskalarmsannsynligheten for M ikke-koherente blokker (ca_cfar_pfa, ca_cfar_alpha). Detektoren på samplet effekt forblir standarden, og alle eksisterende utdata er uendret.

seg-5bd3bf0c22a7 = Spektrummodell: GLONASS-, BeiDou- og Galileo E6-bånd (valgfri)

seg-9c16189c63ac = spectrum::default_band løser opp, bare etter navn (MORE_BAND_NAMES), GLONASS L1OF og L2OF på hver FDMA-kanal K = -7 til { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a og B3I (BPSK({ "10" })) og Galileo E6 (BPSK({ "5" })), med bærebølgene og minste mottatte effekter fra deres grensesnittkontrolldokumenter; standard båndsett og alle eksisterende utdata er uendret.

seg-7b1ae0c7ca28 = LunaNet AFS-tertiærkoder og meldingslag (SB1 BCH, CRC-24Q, interleaver) mot LSIS-AFS V1.0

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkroniseringsmønster, SB1 BCH({ "51,8" })-koder og dekoder med 256 hypoteser, CRC-24Q, blokk-interleaveren på { "60" } x { "98" }, en kontroll av symbolstrømmer (kshana lunanet-afs-check) og en teststrømgenerator med plassholder-underrammer. LDPC-kodingen med rate 1/2 av underrammene { "2" } til { "4" } er ikke implementert (matrisene finnes i et eget vedlegg).

seg-0d7b17524c04 = Standardpakker: scenarioer skåret mot terskler fastsatt før kjøringen

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): testprofilene i DHS Resilient PNT-rammeverket for nivå { "1" } til { "4" }, IMO MSC.1/Circ.1575 nøyaktighetsnivåer og integritetsevaluering, og ICAO Doc { "9849" } vedlegg F-pakkene monitor, assess og mitigate: hver test kjører en medfølgende scenariotype og sammenligner resultatfelt med terskler oppgitt i pakken, og tester som trenger en mottakerlogg er oppført som NEEDS INPUT og ikke skåret.

seg-8a8f2c85e0c3 = Bevispakke for laboratorie-rundtur (scenario, testbetingelser, mottakerlogg, score)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) og eksporten av mottakerloggen kshana.test-conditions/1 fra kshana bench-export: en signert pakke som registrerer scenarioets hash, hashen til de oppgitte betingelsene, loggens hash og scoren mot de oppgitte hendelsene, og som avviser betingelser som ikke stemmer med skåringshendelsene eller en logg hvis hash ikke er den oppgitte. Det skrives, spilles av eller planlegges ikke noe signal.

seg-a9189e4fe413 = IQ-sporingsmotor mot GNSS-SDR { "0.0.19" } på uavhengige opptak

seg-364de05e5b1b = Hele sporingsmotoren i IQ-laget (iq::track gjennom kshana iq track: overlevering fra akkvisisjon, korrelatorer, NCO-er, andreordens Costas-PLL på { "15" } Hz, førsteordens karrierestøttet EML-envelope-DLL på { "2" } Hz, låseindikator og C/N0-estimatorer) på GPS L1 C/A ved { "30" } til { "45" } dB-Hz.

seg-259d201c2ff8 = CRPA-antenneforsterkninger i jamming-typen mot en uavhengig numpy-omberegning

seg-192144c57783 = Den valgfrie [crpa]-seksjonen i jamming-typen: en stråle per kanal mot hver satellitt (nullstyring med jammeren som null, eller MVDR på sigma^{ "2" } I + P_j a_j a_j^H), som skalerer hver lenkes støy med ||w||^{ "2" } og jammeren med |w^H a_j|^{ "2" } før den eksisterende anti-jam C/N0-ligningen.

seg-a2f34cff9338 = Terrengskygge av jammeren i jamming-typen mot en uavhengig numpy-omberegning på en virkelig SRTM-rute

seg-334c569d9cae = Den valgfrie [terrain]-seksjonen i jamming-typen: den store sirkelens terrengprofil mellom jammer og mottaker på en SRTM .hgt-rute med en jordbuling med k-faktor, den dominerende knivseggen (største Fresnel-Kirchhoff nu) og enkeltknivseggtapet i ITU-R P.526-15 avsnitt { "4.1" }, trukket fra jammerens mottatte effekt.

seg-825c121c7512 = Akkvisisjonshysterese og frontend-kvantiseren i jamming-typen mot uavhengige omberegninger

seg-f7207263d881 = De valgfrie seksjonene [acquisition] (en satellitt akkvireres ved eller over en akkvisisjonsterskel etter en forsinkelse for gjenakkvisisjon og holdes mens den er ved eller over sporingsterskelen) og [front_end] (AGC-avlesningen { "10" } log10({ "1" } + J/N) og ADC-ens kvantiseringstap for gaussisk inngang, trukket fra hver lenke, merket som ikke gyldig for ikke-gaussiske jammere) i jamming-typen.

seg-9c46f1c76486 = Begrenset FLL-innhenting under standardutformingens gulv for overgang fra FLL til PLL (valgfri)

seg-efa1d1a9e904 = iq::tracks valgfrie carrier.fll_pull_in_max_s (feltet fll_pull_in_max_s i iq::track::LoopConfig): under fll_assist = pull-in overleverer FLL-en til PLL-en etter en fast innhentingstid uansett PLI, med en tilsvarende returvarighet til PLI første gang når fll_off_pli.

seg-ac0f97e945a7 = RTKLIB .pos-løsningsleser for receiver-trust

seg-0b8bc2c89de4 = Leser en RTKLIB-løsningsfil (kalender- eller GPS-uke/TOW-tid, bredde/lengde eller ECEF-posisjon, brukte satellitter) inn i tidslinjen til receiver-trust (receiver_trust::machines::rtklib).

seg-849393517c04 = NovAtel OEM7 ASCII- og binærlogger (BESTPOS, RANGE, RXSTATUS) for receiver-trust

seg-7e0021922025 = Leser BESTPOS (posisjon), RANGE (C/No per signal) og RXSTATUS (mottakerens jammerflagg, som epokens egenrapport) fra ASCII- og binære OEM7-logger, CRC-kontrollert, skrivebeskyttet (receiver_trust::machines::novatel).

seg-a45c53a9deb3 = RTCM { "3" } MSM4- og MSM7-leser for bærebølge-til-støy for receiver-trust

seg-0a0c9976236f = Leser C/N0 for hver signalcelle i RTCM { "3" } MSM4- og MSM7-meldinger (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) fra en rammestrøm, CRC-24Q-kontrollert (receiver_trust::machines::rtcm3). Oppsettene er fra de BSD-lisensierte pyrtcm-tabellene, ikke fra teksten i RTCM-standarden.

seg-cd554a7c1649 = GNSS-SDR-monitoradapter for receiver-trust

seg-22b587ac642d = Leser GNSS-SDR Monitor-meldinger (Gnss_Synchro) og PVT-monitormeldinger, videresendt som JSON-linjer med proto-feltnavnene, til C/N0 per kanal, posisjonsbestemmelse, brukte satellitter, HDOP og himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-217e5953c128 = Innlesing av IMU-logger, gyro-heading som inngang og Allan-tilpasning av parametere for hybride sensorer

seg-9dadc819daef = Leser en IMU-CSV (dokumenterte kolonner, eller EuRoC-oppsettet); integrerer gir-raten til den headingen heading-course-monitoren leser ([log.imu]); og tilpasser støyparameterne for akselerometer og gyro i de hybride scenarioene og fusjonsscenarioene fra en stasjonær logg ved overlappende Allan-avvik (imu-fit).

seg-15a852a2dcb0 = Home Assistant MQTT-oppdagelse og tilstandseksport for tillitstelemetri

seg-6d6b07b26966 = Et JSON-tilstandsdokument og Home Assistant MQTT-oppdagelsesmeldinger for tillitsstrømmen, skrevet ut som tekst på alle flater og publisert over MQTT { "3.1.1" } QoS { "0" } av CLI-et (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-68caf86157c2 = ROS { "2" }-pakke for receiver-trust og gnss_lib_py-bro

seg-e7d7d99fe538 = En ROS-fri bro som skriver posisjons- og satellittmeldinger som NMEA og skårer dem gjennom Python-bindingen (integrations/ros2/kshana_trust), og en bro fra gnss_lib_py NavData til receiver-trust gjennom formatet rtklib-pos (integrations/gnss_lib_py).

seg-c3c260b7063e = Tester
