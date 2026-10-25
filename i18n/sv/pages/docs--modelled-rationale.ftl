# docs--modelled-rationale: translations (sv)

seg-2db69c58f694 = Differentiell PNT på månen

seg-1ff1d8ebf1e7 = Compliance-mappning mot offentliga ramverk

seg-aab745a65e76 = Modul

seg-d6476863f862 = Förmåga

seg-60a43431ebe0 = Krav

seg-bde1b3a94a47 = Solens limbmörkade SRP-skugga (valfri)

seg-eaaec545dd68 = Belyst andel för SRP som den icke-skymda delen av det limbmörkade solflödet (lag enligt Eddington-approximationen I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre-kvadratur) över en sfärisk jord eller WGS-84 (srp_shadow::limb_darkened_shadow, ShadowModel-varianten OblateEarthLimbDarkened)

seg-9e15970435c3 = Sol och Måne enligt DE440 i Cowell-kraftmodellen (valfri)

seg-de6831cf7785 = Valfri efemeridnivå för termerna för tredje kropp och SRP i den numeriska Cowell-modellen ForceModel: geocentrisk Sol och Måne från valfri EphemerisProvider (en DE440 SPK-kernel via KernelEphemeris) vid TDB = TT + (TDB - TT), som vägrar en leverantör som inte kan betjäna epoken och räknar varje återgång till den analytiska serien; avstängd som standard

seg-057c21daf4f2 = Atmosfärstid S1 (valfri)

seg-f600a39f297e = Den dygnsvisa lufttrycksvågen S1 som en störning av geopotentialen: Biancale och Bode ({ "2006" }) modell N1, grad { "2" } till { "6" }, genom belastningsformeln i IERS { "2010" } ekv. { "6.21" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valfri i Cowell- och precisionskraftmodellerna (air_tide_s1, avstängd som standard)

seg-e8f5ff8c9149 = Sfäriskt harmoniskt gravitationsfält av hög grad (EGM2008 till { "2190" })

seg-d3b2f32dcecb = Underflödessäker och polsäker utvärdering av ett fullt normaliserat fält till grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes-Featherstone { "2002" } modifierad framåtkolumn med gradienten fri från 1/cos phi), en strömmande inläsare för ICGEM .gfc (from_gfc_file / from_gfc_reader; hela EGM2008 hämtas vid körning, ingår inte), och Holmes-Featherstone-utvärderaren som kan väljas i den valfria Cowell Geopotential

seg-1960804ef2f4 = Batch-banbestämning med avståndshastighet och az/el med stationsmaskering

seg-4c185244bc66 = Återskapa ett epoktillstånd ur blandad spårning av avstånd, avståndshastighet och azimut/elevation över en elevationsmask med Gauss-Newton på H = (dh/dx(t)) Phi(t, t0): analytiska mätpartialer och en variationell tillståndsövergångsmatris med analytiska partialer för två kroppar + J2 (integrerad med RK4, inte en STM i sluten form)

seg-bc3d1ee7c639 = Viktning av observationer efter noggrannhetskod i SP3

seg-63b1fab84f85 = Avbilda noggrannhetskoder i SP3 (huvudets ++-exponenter i { "2" }^n mm, basen %f, standardavvikelser base^n mm per post) på positionssigma per observation för motorn för precis banbestämning (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ae3e8833a5ef = Koppla ett publicerat gravitationsfält till en kropp

seg-ffb2b20e5f32 = with_gravity_field (på Body, i src/gravity_pds.rs): koppla valfritt inläst sfäriskt harmoniskt fält (till exempel GMM-3 eller GL0660B) till en Body så att propagatorn utvärderar det kroppsfast; valfritt, standardkroppar oförändrade

seg-9762cf428435 = Kodare för navigeringsmeddelanden utöver GPS LNAV (GPS CNAV, Galileo I/NAV och F/NAV)

seg-9b703b9607d8 = GPS CNAV-meddelandetyperna 10/11/30, Galileo I/NAV-ordtyperna 1-5 i nominella jämna/udda sidor och Galileo F/NAV-sidtyperna 1-4: ICD-fältpackning och kvantisering, CRC-24Q, faltningskodning med hastighet 1/2 och K={ "7" } (G2 inverterad för Galileo), blockinterfoliering och synkmönster, med matchande testavkodare

seg-974d8c1f7876 = Hatch-bärvågsutjämning av kod på verkliga RINEX-observationer

seg-f26b5da0f52e = Divergensfritt Hatch-filter (jonosfärsfri kod buren av den jonosfärsfria bärvågen, fönster på N epoker, omstart vid förlorad låsning, geometrifritt hopp eller lucka) i sammanställningen för precis enpunktspositionering

seg-278ca396127a = Läsning av observationsfiler i RINEX { "4" }

seg-e0883aa933eb = Observationshuvuden i RINEX 4.0x (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; etiketter matchade i kolumnerna 61-80 för version { "4" } och senare) och epokposter

seg-33e5c74720ff = Satellitposition ur sändning för BeiDou GEO

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } position för geostationär satellit ur en sändningsefemerid (tröghetsliknande system, därefter Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valfri via fältet include_beidou_geo i NavParseOptions, så standardläsaren hoppar fortfarande över GEO

seg-71f48628ebb2 = Tätt kopplad GNSS/INS med bärvågsfas och osäkerheter med flyttal

seg-5a156aa81275 = Feltillståndsbaserat EKF över { "15" } INS-tillstånd, en mottagarklocka med två tillstånd och en osäkerhet med flyttal i bärvågen per spårad satellit; pseudoavstånd, bärvågsfas och valfri avståndshastighet från en SGP4 Walker-konstellation (ljustid och Sagnac), korrektioner med Klobuchar och Saastamoinen/Niell tillämpade i slingan vid filtrets egen position; detektering av slip med tidsdifferentierad bärvåg och en tröskel per satellit vidgad av hastighetsosäkerheten; omstart av osäkerheten vid slip och återinfångning

seg-7d644516b1ec = GNSS/INS-paket för sjö, järnväg och flyg med ett alternativ för tät koppling

seg-cbb03a8baf73 = Tre scenarier för gnss-ins på banbiblioteket (ett fartyg som slingrar sig med { "8" } m/s med ett avbrott på fem minuter; ett tåg genom en skärning med två satelliter och en tunnel; ett flygplan vars avbrott täcker en 25-graders krängd sväng) och paketets valfria tabell [tight]: pseudoavstånd från en SGP4 Walker-konstellation sammanförda av navigatorn med sluten slinga, varje satellit över masken vid nominell drift och de högsta få vid försämrad drift

seg-f4dab73c4eda = Kopplat PNT-filter för pseudoavstånd med biastillstånd och 3D-utvidgning i fusionspaketet

seg-742b60089361 = Ett staplat Kalman-filter över position, hastighet, klockfas och frekvens matat med pseudoavstånd som kopplar position och klocka (uppdateringar i Joseph-form som bär korskovariansen); en variant med 1 frihetsgrad utökad med ett konstant tillstånd för accelerometerbias som fusionspaketet kör under [coupled]; och 3D-versionen med 8 tillstånd med rader för siktlinjen

seg-2db2b9dc3b45 = Bibliotek med GNSS/INS-banor och import av CSV-referens

seg-e1fe83c75a6c = Valbara rörelseprofiler för paketet gnss-ins (rakt, figur-8, urban stanna-och-kör, flygplans stigning och koordinerad sväng, kartläggningsdrönare), definierade av kommandon för Euler-hastighet och acceleration längs spåret slutna på referenstillståndet med den kinematiska IMU:n (termer för centripetal, gravitation och Coriolis), och importerad CSV-referens omvandlad till den IMU som återger den; den historiska körningen oförändrad när ingen profil anges

seg-86f9186bb884 = CR3BP för jord–måne { "9" }:{ "2" } NRHO mot den bana CAPSTONE flög

seg-d4127cf241f3 = Den cirkulära begränsade södra { "9" }:{ "2" } nära-rätlinjiga haloomloppsbanan kring L2 som cr3bp::differential_correct_halo korrigerar (banfamiljen för Gateway och CAPSTONE), jämförd för sin medelgeometri (period, perilunradie, apolunradie) med den bana CAPSTONE faktiskt flög. Ett mått på hur väl CR3BP-medlemmen beskriver den verkliga banan; en CR3BP-bana är inte en bana i en efemerimodell och jämförs inte epok för epok

seg-1a5623c81b48 = Positionsfel ur geometri: RMS-fel = sigma_UERE x DOP för motorns positionsbestämning med minsta kvadrat

seg-7a94b44a8738 = dop_error_mc::run_geometry och check: en seedad Monte Carlo (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) av motorns egen iterativa positionsbestämning med minsta kvadrat (pvt::solve_spp, enhetsvikter, löst från den sanna positionen) på de { "8" } geometrierna i tests/fixtures/dop/dop_reference.csv, som jämför felvarianserna i öst, nord, upp och klocka, RMS för H/V/P, korrelationen öst–nord, medelfelen och andelen inom den horisontella ellipsen på { "95" } % med sigma^{ "2" } Q, där Q är kovariansfaktorn i kärnan orbit::dop (orbit::dop_cofactor, samma aritmetik) på samma geometri

seg-9acfde1b57f7 = Geometrimedveten förtroendeklassificering: satellitgeometri bredvid mottagarens förtroendepoäng och en klass på varje avdrag

seg-6138c41e13ff = receiver_trust::geometry: satellitgeometri per epok (good, degraded med orsakerna few-satellites/high-pdop/high-hdop/sky-blocked, eller unknown när loggen saknar GSV, NAV-SAT eller GSA) härledd ur redovisade elevationer och azimut genom orbit::dop eller hämtad från GSA, med en etikett som alltid redovisas och aldrig poängsätts (good, fair, poor, unknown) och HDOP, PDOP, VDOP, antal satelliter och signalförlust i ord; en geometriövervakare i fartygspoängen som inte drar något om inte geometrin är poor (kvoten max(hdop/4, pdop/6, 5/n_used) över { "1" }), därefter trappar upp till ett tak på { "15" } poäng vid { "1.5" } som enbart geometri inte kan ta under det försämrade bandet (tak, slut på trappan och golv i [geometry]; inget larm); en klass på varje avdrag (geometry, environment, inconsistency) där förlorad låsning mot satelliter under { "15" } grader klassas som geometry, satelliter i sikte men inte spårade klassas som environment, och ett avdrag för poor-geometri vars angivna HDOP ligger bortom max({ "1.0" }, { "25" } % av det härledda HDOP) från den angivna himlen klassas som inconsistency

seg-bbb1828b3db1 = Reduktioner av gatukanjon, sektor och terräng till en tabell

seg-2864aec7be88 = skyline: gatukanjonen i sluten form (skär atan((h - a) / d) med d = (w/2) / abs(sin(az - s)), öppna ändar för en ändlig längd), skarpkantade sektorer medsols med omslag, samt terrängpunkter reducerade till en tabell med krökningssänkningen d^2/({ "2" } * 4/3 R); skylinen är deras punktvisa maximum med en eventuell tabell

seg-3f3d657854ce = Skylineförinställningar (stadsgata, hamninlopp, fjord, containerterminal)

seg-b915c06fa3f1 = skyline::PRESETS: fyra REPRESENTATIVA geometrier med utformningsnotens angivna mått och en proveniensrad var: city-street (en kanjon, gata { "0" } deg, { "20" } m mellan { "30" } m höga väggar, antenn { "1.5" } m), harbour-approach (sektorer: öppet mot havet över { "180" } deg, kajbyggnader { "8" } deg över { "90" } deg, vågbrytaren { "3" } deg), fjord (terräng: väggar { "600" } m över antennen på { "1.5" } km avstånd på vardera sidan om en nord-sydlig kanal, krökningssänkning tillämpad), container-terminal (sektorer: staplar { "12" } deg över den landvända hälften, kranbommar { "35" } deg och { "25" } deg över två smala sektorer); kan åsidosättas fält för fält

seg-6012113b4836 = Himlageometrifunktioner: synlighet, DOP, kovarians, felellips, Monte Carlo-moln

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> och <c2/>, Python- och WASM-funktioner med samma namn, MCP <c3/>): utifrån en plats, en tid och konstellationsförinställningar (eller satelliter som azimut/elevation eller ECEF) de satelliter som är synliga och maskade under en skyline, GDOP/PDOP/HDOP/VDOP/TDOP, kofaktorn med enhetsvarians (H^T H)^-1 och kovariansen i öst-nord-upp med en mottagarklocka per system eller en gemensam, den horisontella felellipsen (halvaxlar k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), orientering { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) från norr), samt n slumpade minstakvadratfel med frö under oberoende gaussiska avståndsfel med deras empiriska kovarians, RMS och { "95" } % inneslutning. Kofaktorn är orbit::cofactor_from_los, den enda kärnan bakom orbit::dop och orbit::dop_cov (dop är en reduktion av dop_cov): ingen andra DOP-implementation

seg-7f66be0f15c8 = Klock-holdover utan GNSS

seg-4d8f87668a0f = Tillväxt av utrullningsfel i sluten form + holdover till tröskel; kvantklockklasser

seg-29b482d88916 = Uppmätta klockenhetskort (förutsägelse på undanhållen datamängd)

seg-8c68c5b25004 = clock_library: ett enhetskort (vitt fasbrus, vitt, flicker och slumpvandrings-FM plus ett linjärt frekvensdrift) anpassat till en tredjedel av en namngiven uppmätt klockpost efter en loggad konditioneringsomgång (luckor, fasavvikare, fassteg och skurar borttagna; frekvenssteg loggade), viktat med de frihetsgrader för brustyp som identifierats med lag-1, och dess förutsagda Allan-avvikelse poängsatt på de undanhållna två tredjedelarna; läsare för RINEX- och IGS-klockfiler, BIPM-filer per laboratorium och Circular T avsnitt { "1" }; omvandling av ett kort till brusmodellen för slottiming, den utökade Kalman-klockmodellen och brusnivåerna för spoofing-övervakaren

seg-5097a0e6460d = Uppmätta klockkort för GPS Block IIF med termer per varv (förutsägelse på undanhållen datamängd)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: ett enhetskort som bär fastermerna med en till fyra perioder per varv (period T/k, T = { "43 082.05" } s), anpassade gemensamt med den kvadratiska termen med minsta kvadrat på en tredjedel av en uppmätt satellitklockpost, där varje terms Allan-bidrag i sluten form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } ingår i den förutsagda Allan-avvikelsen

seg-0d72fcc0fbea = Tillståndsskattning av klockan ombord

seg-6db5391f8ebe = Kalmanklocka med 3 tillstånd (fas/frekvens/drift) enligt van-Loan, Joseph-stabiliserad

seg-3f0a9d7c2971 = Felbudget för tidsöverföring

seg-216f46b43860 = Tvåvägs/TWSTFT (Sagnac), GNSS common-view, PPP; länkjitter till avstånd

seg-157fadeb5d67 = Navigationssignalers modulering och kodföljningsanalys

seg-ab633d191396 = BPSK-R/BOC PSD, spektral separation κ, Gabor-bandbredd, DLL-jitter, flervägsutbredning

seg-e6c08e1e6ae3 = Prestanda för kvantinertialsensor

seg-d28e1f6a430f = Accelerometer med kallatominterferometer från första principer (k_eff·T², QPN)

seg-4b79d03cecf5 = Fringe-tvetydighet / dynamiskt område för kvantinertialsensor

seg-deb2850546d5 = Dynamiskt område för fringe-tvetydighet i Mach–Zehnder: den 2π-periodiska fringe-avläsningen sätter en största entydiga specifika kraft a_max=π/(k_eff·T²), och det entydiga området i upplösningsceller a_max/σ_a=π/σ_Φ är oberoende av den optiska skalfaktorn — förstärkningen i känslighet med T² kostar entydigt område i exakt samma takt (avfrågningstiden växlar upplösning mot område, och antalet celler fastläggs av avläsningens fasbrus)

seg-d04bf321d4a1 = Motståndskraft för kvantinertial dödräkning

seg-c4989abb5d40 = Sammansatt positionsbudget för bias + skalfaktor + VRW + stabilitetsavtagande under holdover

seg-5692c7b936b6 = Motståndskraft mot jamming utan GNSS

seg-f4ff77caa47b = Geometrisk J/S-länkbudget, C/N₀ med jamming-skydd, signalförlust per satellit

seg-ff90679d1de9 = Detektering av spoofing

seg-b843f63e77e6 = Klockstödd χ², RAIM, AGC, SQM sammanvägda till ett säkerhetskvalitetsmått per epok

seg-b10d07921f5e = Skyddsnivå för tidssynkronisering (Timing Protection Level) vid spoofing

seg-2a829711b997 = Gräns i sluten form för värsta fallets oupptäckta tidsfel = övervakarens golv + oscillatorns utrullnings-σ över CUSUM-detekteringsfördröjningen, redovisad som ett band för det röda brusgolvet

seg-f1d49eac89f8 = Alternativ / kompletterande PNT

seg-023dda973f66 = Matchning mot gravitationskartor, terrängreferens (TERCOM/SITAN), magnetisk anomali

seg-791e7285c291 = Reproducerbarhet och programvaruförsäkran

seg-7177355a482c = Deterministiska grindar med scenariohash, SBOM och golden-filer över plattformar

seg-241f2eeaef12 = Märkt syntetiskt störningskorpus + detektoroberoende sele för ROC/AUC/förväxlingsmatris/Pfa-Pmd; läckageskydd, stratifierad uppdelning, rapport om optimism vid fördelningsskifte (inom mot utanför regimen). Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/impairment-eval.toml)

seg-642087659fda = Kontrollerad syntetisk studie av optimismgapet i AUC mellan inom och utanför fördelningen över detektorer med publicerade metoder och inlärda detektorer (logistisk regression / MLP med ett dolt lager): trender enligt skalningslag per klass (Spearman ρ + lutning på { "1" }−svårighetsgrad) och en ridge-prediktor enbart med ID som skattar gapet endast utifrån diagnostik inom fördelningen, poängsatt med lämna-en-detektor-utanför och lämna-en-klass-utanför. Reproducerbart via <c1/>

seg-fd6424213d1f = Kvant mot klassisk PNT-avvägning och motståndskraft utan GNSS ({ "13503" })

seg-21b2b54200a8 = Inläsning av uppmätt ADEV (NNLS), avvägningstabell (holdover för tid/inertial + nytta), kuvert för motståndskraft mot tid; golvförbehållet följer med i artefakten. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/quantum-trade.toml)

seg-1fa865bfddd1 = Rymdväder och aktivitetsdriven termosfärisk densitet

seg-47308f611c7e = Sol- och geomagnetiska index (definitionstabell Kp↔ap), exosfärstemperaturen enligt Jacchia-1971 och den termosfäriska densiteten enligt Jacchia { "1971" } (SAO Special Report { "332" }: statiska diffusionsprofiler som återskapar dess tabell { "7" }, med dygnsvariation samt geomagnetiska, halvårs-, säsongs-latitud- och heliumvariationer) mot den statiska atmosfären USSA76. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/space-weather.toml)

seg-c76b8c395ef0 = Uppskjutningsfönster och uppstigningsgeometri (missionsanalys)

seg-6066c634faba = Tvåkropps-uppskjutningsazimut (sin Az = cos i / cos lat), lägsta nåbara inklination, cirkulär hastighet, jordrotationens bonus österut, Δv för plansbyte med dogleg och dagliga tillfällen, och, givet en epok och rader från IERS finals2000A, platshastigheten kring den sanna polen (launch::site_rotation_speed_at). Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistisk återinträdeskorridor (Allen–Eggers)

seg-c3f3422f96e4 = Maximal retardation (oberoende av ballistisk koefficient), hastighet och höjd vid maximal g-kraft samt hastighet vid maximal uppvärmning för ett ballistiskt inträde i en exponentiell atmosfär. Kan köras från CLI/bindningarna som scenariotypen <c1/> (scenarios/reentry.toml)

seg-7b4a8e25c3c9 = Adaptiv kodning och modulering enligt DVB-S2 längs ett LEO-nedlänkspass

seg-3912fb8ccb15 = Es/N0 i nedlänken längs varje pass för en satellit över en station (EIRP, fritt rumsdämpning, atmosfärsdämpning enligt cosekantlagen, övriga förluster, G/T, Boltzmanns konstant, symbolhastighet), den mest effektiva MODCOD i DVB-S2 som klarar sin kvasifelfria tröskel i ETSI EN { "302" } 307-1 V1.4.1 tabell { "13" } plus en implementationsmarginal vid varje steg, passets ACM-datavolym samt baslinjen med konstant kodning som sluter vid masken och längsta avståndet. Kan köras som scenariotypen <c1/>. Illustrativa indata; MODELLED.

seg-19603a7e0fe8 = Schemaläggning av markkontakter för flera satelliter och flera stationer med konfliktlösning

seg-40edeae6e48b = Kandidatkontakter från varje pass mellan satellit och station med dess ACM-datavolym; konflikter där en antenn skulle betjäna två satelliter inom sin omställningstid eller en satellit skulle sända ned till två stationer samtidigt; ett prioritetsviktat leveransmål begränsat av varje satellits kö; en lat plan med girig marginalnytta, en baslinje med först-till-kvarn och en exakt branch and bound på upp till { "26" } kandidater, med den giriga planens optimalitetsgap redovisat. Kan köras som scenariotypen <c1/>. Illustrativa indata; MODELLED.

seg-3742d2aea62a = Sparsam inramning av kostnad per täckning / ROI

seg-4228311689f8 = Kostnad per procent täckning + täckning per euro som ROI över motorn för konstellationsdimensionering; kostnaden per satellit är ett låg/nominellt/högt intervall som anroparen anger källan till (inga påhittade priser)

seg-8ba6ee9acc8a = Integritetspåverkan av missad detektering (kontextmedveten HPL/VPL mot larmgräns)

seg-f5985399d0d5 = Avbildar en oupptäckt spoofing- eller jamming-bias på effektivt fel → Stanford-region (tillgänglig/otillgänglig/MI/HMI) mot kontextspecifika HAL/VAL (öppen himmel mot urban)

seg-37d43b5b918a = Parameterblad med citerade felmodeller för CAI ({ "13503" })

seg-0b6a901f5ad2 = Intervall (bäst/nominellt/konservativt) för prestanda hos kallatominterferometer — biasinstabilitet, slumpvandring i hastighet/vinkel, skalfaktorstabilitet, avfrågningsbegränsad samplingstakt, dynamiskt område för fringe-tvetydighet — var och en spårbar till en referens; matar QuantumNavBudget utan att modellera hårdvara

seg-c93f2d3a3167 = Benchmark för tidsintegritet — epokklassificerare med Stanford-integritetsdiagram

seg-712d5c35a6a6 = Epokklassificering med TIB Stanford-integritetsdiagram (nominell / otillgänglig / MI / HMI)

seg-573aa0193cb3 = Benchmark för tidsintegritet — poängsättare för integritetstäckning

seg-4d86f3c2d8f5 = Poängsättning av TIB-integritetstäckning (andel HMI/MI/tillgänglighet + utlåtande om överskridande täckning)

seg-372dd0fdb025 = Benchmark för tidsintegritet — felkatalog (parametriska generatorer)

seg-2604e7cf27d2 = TIB-felmeny (domändivergens, klockslam, holdover-utrullning, statisk/inkrementell/symmetrisk/asymmetrisk fördröjning, replay inom färskhet, vägselektiv, k-av-N-kvorum)

seg-90c0eb1e7c14 = Benchmark för tidsintegritet — utlåtande om absorption av icke detekterbara fel

seg-f713acf042ff = TIB-utlåtande om absorption av icke detekterbara fel (symmetriska/replay måste absorberas av PL, aldrig rapporteras som detekterade)

seg-8adbbd2cdb74 = Självbeskrivning i rapporten för hybrid optisk/RF

seg-2a5e48b558e1 = Rapporten hybrid-optical-rf anger den länkkonfiguration den faktiskt kördes med (bärvågens våglängd, sändar- och mottagarapertur, avstånd, pulsbredd, integrationstid, verkningsgrader och förluster, standardvärden uppslagna) och bär ett enhetsblock som anger enhet och proveniensklass för varje storhet som en artikel sannolikt citerar, inklusive spåren av överlämningskovariansen i kvadratmeter

seg-0691f3dee8cb = Tillgänglighet för hybridlänk optisk/RF på RF-sidan

seg-72ccb655caf0 = Rapporten hybrid-optical-rf anger en RF-länktillgänglighet, sammansatt av storheter som motorn redan beräknar snarare än av en importerad klimatologi, och anger sammansättningen som en namngiven regel: A_rf = I_closure * I_track, där I_closure är utlåtandet om sluten länk för den enkelriktade länkbudgeten enligt CCSDS-401 / DSN-810-005 (linkbudget::link_budget, Eb/N0-marginal >= { "0" }) vid scenariots eget avstånd och I_track är utlåtandet för följningsloopen (jamming::lock_status) på det C/N0 som SAMMA budget gav. Varje faktor för sin indatas proveniensklass vidare till utdata, och de faktorer som avsiktligt INTE ingår i produkten -- geometrisk synlighet, störningsblockering och en klimatologi för RF-avbrott -- namnges med skälet i stället för att tyst sättas till { "1" }. Det uppslagna RF-ledet återges som ett eget block rf_link_configuration, och de kontinuerliga talen bredvid indikatorn (länkmarginal, C/N0-marginal, de slutna formerna för sluten länk och följningsavstånd samt avståndsutnyttjandet) är avståndsinversioner av samma budget. Rapporten anger fullt ut, på blocket och i den enhetspost som en läsare hamnar på, att detta tal är MARGINAL-/GEOMETRIBEGRÄNSAT och DETERMINISTISKT medan optisk tillgänglighet är VÄDER-/KLIMATOLOGIBEGRÄNSAD och probabilistisk, så att de två aldrig kan citeras som ett jämförbart par av procenttal

seg-22c5df9b6c7c = Jämförelse mellan optisk och RF-avståndsmätning på lika villkor

seg-70eb396f40af = Rapporten hybrid-optical-rf ger kvoten mellan optisk och RF-avståndsmätning med den ENA konfiguration som båda leden utvärderades vid i samma objekt: samma enkelriktade väg, samma avstånd och samma ackumuleringstid. Det optiska ledet är motorns fotonbegränsade ToA-CRLB på det enkelriktade fotonantalet; RF-ledet är motorns termiska kodföljningsjitter för DLL med tidig-sen-korrelator vid det C/N0 som motorns egen länkbudget ger för samma enkelriktade avstånd. Loopens brusbandbredd är härledd, inte vald: B_L = 1/({ "2" }*integration_s) lägger RF-ledet på exakt den optiska ackumuleringstiden, och om en anropare åsidosätter den så att de två medelvärdestiderna skiljer sig åt blir kvoten REFUSED -- null, med avvikelsen och båda tiderna namngivna -- i stället för att anges vid två arbetspunkter. Ingen kvot bildas mot scenariots VALDA parametriska rf_position_sigma_m, och avvisningen anger varför: den indatan bär ingen konfiguration alls. Den publicerade tvåvägs optiska huvudsiffran och den exakta faktorn som överbryggar den till jämförelseledet för enkelriktad väg ges bredvid kvoten, så rapporten inte kan läsas som om den bär två oense optiska sigma

seg-3f26f598e013 = Självbeskrivning i länkbudgetrapporten

seg-b88bf41d6d4c = Länkbudgetrapporten anger varje absolut konstant som dess egen marginal beräknades från -- den bärfrekvens som den fria rumsdämpningen använde, EIRP, kvalitetsmåttet, den sammanlagda förlusten och Boltzmann-termen -- plus det G/T som krävs där marginalen är noll, länkkonstanten (EIRP - förluster - krävt Eb/N0) som är den enda kombination som en publicerad tabell över hastighet och förstärkning någonsin kan fastlåsa, och, när en anropare anger en systembrustemperatur, den mottagarantennförstärkning som det kvalitetsmåttet innebär

seg-a7b192e27cb5 = Tabell över skärningspunkter för lunar tid per klockklass

seg-cab605dc6ea2 = En körning av lunar tidsbudget ger en rad för skärningspunkten mellan klocka och referenssystem per klockklass mot en enda delad systemterm, så att klockan är den enda variabeln i jämförelsen; varje rad bär skärningspunkten nådd på två sätt -- bisekterad ur den allmänna potenslagskurvan för tidsfel och inverterad algebraiskt ur radens dominerande brustyp -- med den relativa skillnaden mellan dem

seg-18c72a7565d6 = Fångstfotavtryck mot höjd och strålbredd

seg-9c30a0ab5233 = Svep i två axlar av det mönstervägda, höjdbegränsade fångstfotavtrycket vid ytan över sändarens höjd och parabolens diameter, utsänt som en rad per arbetspunkt med den halveffektsstrålbredd som varje diameter innebär, och limbfångst redovisad som en TRÖSKEL -- per rad limbens J/S, dess marginal och den sändareffekt som skulle sluta den; per raster de lokaliserade korsningarna, eller ett uttryckligt påstående att limben inte nås någonstans på rastret, med underskottet

seg-fc0a64b9a280 = Reproducerbarhet för lunar tidsfelsbudget

seg-5d5970506b9c = Scenariot lunar-time-budget publicerar sina matrisvärderade utdata som en tabell i långt format (rasterindex, medelvärdestid, term) vid sidan av rapporten, så att de sju kurvorna x(tau) per term och kvadratsumman av totalen är motorutdata snarare än något en läsare återbygger ur metodavsnittet

seg-675887733454 = Lunar stationstidslaboratorium: holdover för miniRAFS mot LTC

seg-7dfedc40da6a = Det valfria blocket [time_lab] i scenariot lunar-time-budget modellerar en lunar referensstationsklocka (som standard klassen miniRAFS, eller någon namngiven klass, eller ett enhetskort anpassat till angivna stabilitetspunkter) styrd mot Coordinated Lunar Time och sedan fritt löpande eller omstyrd var N:e sekund: tidsfelskurvan x(t) som kvadratsumman av klockans potenslagsterm, en konstant styrrest (ILLUSTRATIVE), en konstant realiseringsrest för LTC och en frivillig term för stationshöjdens gång; tiden efter en styrning till { "1" }, { "10" } och { "100" } ns (eller angivna trösklar) med bisektion bredvid den slutna inversen för den dominerande brustypen, och den dominerande termen vid varje angiven horisont, alla med enheter

seg-af3ff120b707 = Lunar geodetisk VLBI

seg-cfd7d0126028 = Närfälts-VLBI-fördröjning för en jordbaslinje som observerar en lunar beacon + partialer

seg-e08e98908f3a = Earth-GNSS på lunart avstånd

seg-dd8ce373d1f6 = Mottagning av Earth-GNSS på lunart avstånd: det svagsignalslager som P7 tabell { "1" } nämner och som motorn saknade modell för. Per satellit och per epok beräknar den vinkeln från siktlinjens axel mot sändarens nadir, om Jorden skymmer den raka vägen, det sneda avståndet och dess fria rumsdämpning, sändarförstärkningen vid den vinkeln, den mottagna effekten och bärvåg-till-brus-densiteten; därefter aggregerar den bara länkarna som klarar en följningströskel, och sveper ett helt konstellationsvarv så att svaret blir en FÖRDELNING snarare än en ögonblicksbild. Tre fakta driver resultatet och rapporten anger var och en: Jorden spänner { "13.90" } deg från konstellationsradien så att strålens TOPP är geometriskt otillgänglig för varje stråle på väg mot Månen; det som återstår är huvudlobens kant och sidolober, det regim som LuGRE arbetade i vid Månen { "2025" }; och L1-vägförlusten är omkring { "208" } dB, ungefär { "25" } dB mer än en markbunden användare betalar. UPPMÄTT på den medföljande GPS-klassgeometrin med 24 satelliter över { "64" } epoker under en omloppsperiod: SIGNALtillgänglighet { "0.375" } med en bästa länk på { "30.93" } dB-Hz, och tillgänglighet för positionsbestämning { "0.000" } - högst två samtidigt följbara länkar, aldrig de fyra som en position behöver. Skillnaden mellan de två tillgänglighetstalen är poängen, och rapporten tillåter inte att de förväxlas: Earth-GNSS på lunart avstånd är ett lager av TIDSKVALITET, inte positionskvalitet, och ett prior för skiktad motståndskraft måste ta tillgängligheten för positionsbestämning. Konditioneringen ges av samma skäl - varje synlig satellit ligger inom en kon några grader bred sedd från Månen, så siktlinjerna är nästan parallella av konstruktion. Kan köras som typen <c1/> Omformulerat enligt D7: påståendet på lunart avstånd är den RELATIVA bärvåg-till-brus-densiteten mellan satelliter vid en epok, från uppmätta tvådimensionella sändarmönster (NAVCEN Block IIR/IIR-M), plus geometrisk synlighet; absolut C/N0 påstås inte (Parker et al. redovisar en gemensam förlust på { "7" } till { "12" } dB).

seg-29df5b40a3f9 = Lunar banbestämning: Earth-GNSS mot radiometri från marken

seg-647902ebcee3 = Banbestämning i en nästan rätlinjig halobana (eller en elliptisk fryst bana) från två oberoende datatyper: pseudoavstånd från Earth-GNSS mottagna ombord (länkregeln i raden Earth-GNSS på lunart avstånd, plus månockultation) och tvåvägs avstånd och avståndshastighet från marken från tre stationer i Deep Space Network. Var och en är en minstakvadratlösning i ett batchsteg kring referensbanan med sin formella kovarians; en Monte Carlo med frö av skillnaden mellan de två skattningarna prövar om de två kovarianserna förklarar den (q = d' (P_G + P_R)^-1 d, chi-två med sex frihetsgrader när modellerna stämmer) och vad en omodellerad acceleration gör med statistikan.

seg-652bdc29deea = Lunar bärvågsfaslösning av heltalsosäkerhet: yta och omloppsfarkost

seg-02496f9e9af2 = Enkeldifferentierad bärvågsfas och kod från Earth-GNSS mellan mottagare vid en lunar ytstation och en omloppsfarkost, med klockdifferensen per epok profilerad bort, en heltalsosäkerhet per sammanhängande pass och det längsta passet som gauge. Kovariansen för float-heltalsosäkerheten är ett Schur-komplement; LAMBDA löser heltalen, den bootstrappade andelen redovisas bredvid en Monte Carlo-andel med frö för lyckad heltalsminstakvadratlösning och positionssigma för float- och fixerad lösning. Redovisat som funnet: vid de registrerade { "12" } dBi går dubbeldifferensproblemet inte att bilda (ändring { "1" } flyttade standardvärdet till { "25" } dBi efter att endast tillgänglighetsräkningar setts), och vid { "25" } dBi uppnås heltalsfixering INTE - utom räckhåll (några procent som mest) även om float-lösningen förbättras med bågen.

seg-11dd1bb8e4e1 = Lunar samestimering av referenssystem: ytstationer och omloppsfarkoster

seg-a38c8d95e6c9 = Fisher-information för det lunara referenssystemets datum med sju parametrar från laseravståndsmätning från jordstationer till de fem reflektorerna enbart och med avståndsmätningar från omloppsfarkost till ytstation tillagda: informationsmatrisen, rang, Cramér-Rao-sigman, degenerationsmåttet i den lunara identifierbarhetsmodulen och slumpade stationsmängder med frö. Banan hålls känd i de lunara axlarna (dess fel bärs av omloppsfarkostens avståndssigma).

seg-862977c4bb01 = Precision för referenssystemsbindning i rymden: samlokaliserad GNSS, VLBI och laseravståndsmätning

seg-a9ae8e99f00d = Cramér-Rao-precision för förskjutningarna i translation, skala och rotation mellan teknikerna GNSS, VLBI och laseravståndsmätning när en rymdfarkost bär alla tre, med rymdfarkostens position eliminerad vid varje epok och nio störparametrar för lokala bindningar med ett prior, svept över noggrannheten i den lokala bindningen. Kovarianser med kvadratrotsmetoden (normalekvationerna förlorar siffrorna när teknikerna är nästan perfekta).

seg-ae627996875e = Känslighet för lunara Love-tal och libration

seg-28780d07c4a7 = Fisher-information för h2, k2, l2 och de fysikaliska libration-amplituderna från laseravståndsmätning (radiell och horisontell tidvattenförskjutning, reflektorrotation), omloppsfarkostföljning (graden-2-accelerationen k2 integrerad längs siktlinjen, trend borttagen), en ytgravimeter (gravimetrisk faktor { "1" } + h2 - { "1.5" } k2) och en ytklocka (fraktionell gång ({ "1" } + k2 - h2) W2/c2, knuten till de lunara tidskonstanterna). Nominella värden för h2 och l2 är linjäriseringspunkter; studien säger vad som är känsligt för vad, inte vad talen är.

seg-da712b740519 = Lunar förstärkning av DOP med ytbeacons

seg-83e6341e01b1 = Beaconförstärkt DOP för en lunar ytanvändare: raderna med siktlinjer till synliga satelliter och raderna med avståndsmätning mot synliga ytbeacons sätts ihop till en enda designmatris och utvärderas genom den delade DOP-kärnan, och den resulterande DOP avbildas på en realiserad 1-sigma-noggrannhet I METER genom ett användarekvivalent avståndsfel per beacon som sätts ihop som kvadratsumman av termer för klocksynkronisering, flervägsutbredning och inmätning. Beaconsynlighet är den geometriska horisonten med två höjder för en luftlös Måne, som saknar refraktiv utvidgning och därför är exakt snarare än approximativ. Kan köras som scenariot <c1/>, som redovisar enbart satelliter, satelliter plus beacons och en större konstellation som den konkurrerande vägen till samma geometri. UPPMÄTT på den medföljande golden-geometrin (användare vid -80 deg, tre inmätta beacons, en illustrativ LCNS med sex satelliter vid t={ "0" }, mask { "5" } deg): { "5" } synliga satelliter ger PDOP { "9.6941" } och en 3D-1-sigma på { "11.222" } m; att lägga till de beacons som faktiskt klarar horisonten ger PDOP { "4.1160" } och { "4.765" } m, en faktor { "2.355" }; tjänsten med 24 satelliter ger i stället PDOP { "2.4226" } och { "2.804" } m, en faktor { "4.002" }. Rapporten skriver ut antalet SYNLIGA beacons snarare än det konfigurerade, och på den här geometrin klarar bara EN av de tre beaconsen horisonten: de två flankerande platserna ligger omkring { "333" } km från användaren mot en horisont på { "86" } km för en antenn på { "2" } m, så en läsare lämnas aldrig åt att anta att alla tre bidrog

seg-845e9f5eec81 = Skyddsnivå för gemensamt läge och totalt integritetskuvert

seg-e4ec41d0f5e1 = Observerbarhet för absolut stationsposition på månen (datumdefekt)

seg-b3e4160042d2 = Observerbarhet via Fisher-information för den gemensamma månlösningen: utan baslinjer till jorden ligger det absoluta referenssystemets datum i nollrummet till HᵀWH (stationens position är inte observerbar); ≥{ "3" } baslinjer återställer full rang och begränsar stationens Cramér–Rao-fel, som estimatorn uppnår

seg-2ed7181c97dd = Generering av spridningskoder för LunaNet AFS (LSIS V1.0)

seg-13ff6c381275 = Augmented Forward Signal-koderna i LSIS V1.0 ({ "29" } januari { "2025" }): AFS-Q:s primärkod på 10230 chip genererad enligt pilotkonstruktionen för L1C i IS-GPS-800 med indexen i IS-GPS-800J (samma { "210" } tilldelningar som LSIS bilaga D skriver ut), AFS-I:s Gold-koder på 2046 chip genererade från g1 = x^{ "11" } + x^{ "2" } + { "1" } och g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" } där varje PRN:s G2-fördröjning hämtas från standardens Annex { "3" }-fil, de fyra sekundärkoderna, tertiärkoderna på 1500 chip, den preliminära nodtilldelningen enligt tabell { "11" } och den skiktade pilotkoden. LSIS-innehållet läses vid körning från ett lokalt cacheminne som verifierats med SHA-256 och fyllts från den NASA-hostade PDF-filen, och distribueras aldrig vidare

seg-56c7aeac59c1 = Avkodbarhet med sluten slinga för LunaNet AFS med en oberoende mottagare (LSIS V1.0)

seg-da2d29d437b0 = En Kshana AFS-inspelning som en oberoende programvarumottagare tagit in, följt och avkodat och som jämförts med inspelningens egna referensetiketter. Detta visar enbart att standarden följs och att etiketterna är konsekventa; det är inget påstående om kanalfysik, utbredning, mottagen effekt eller länkbudgetar, vars värden i inspelningen är valda indata

seg-780369fb9a54 = GPS L1 C/A: formatkontroll mellan generatorer

seg-ee47b60515f1 = GPS L1 C/A-spridningskoder (sdr::CaCode) och LNAV-delramar 1–3 (gps_lnav: fältkvantisering enligt IS-GPS-200 med specifikationens pi, tvåkomplementspackning, TLM- och HOW-ord, paritet enligt tabell 20-XIV med D29*/D30*-inversion, de paritetslösande bitarna i orden { "2" } och { "10" }) jämförda bit för bit med gps-sdr-sim på dess medföljande brdc0010.22n ({ "32" } satelliter)

seg-bf429c8f00fb = GNSS IQ-införvärvning på oberoende genererade I/Q-samplingar

seg-9a0c52bfb06e = iq::acq::acquire (FFT-parallell kodfassökning med Marcum-Q-tröskel för kvadratisk detektor) med GpsL1Ca-repliken, på { "20" } ms av gps-sdr-sims egen 8-bitars I/Q-utdata avkodad av samplingsavkodaren iq::io (ci8, { "2.6" } MHz, { "11" } satelliter, inget brus): varje PRN { "1" } till { "32" } söks i två fönster om { "10" } ms, och resultatet jämförs med den kodfas och den Doppler som gps-sdr-sim modulerade

seg-f40dc3dac990 = IQ-övervakare bedömda i labbuppspelningskampanjer: detektion, missar, falsklarm och slutna uttryck för falsklarmstal

seg-93fb3109728c = iq::campaign::detect och kampanjkörningen: en valfri tabell [monitors] kör IQ-övervakarna på varje cell i körningens enda pass. Effekt- och spektralövervakarna ser samplingarna efter varje frontändskedja; övervakarna för C/N0, SQM och låsning ser varje följd kanals slingutjämningar. Varje larm bedöms mot de angivna händelserna: detekterat eller missat per (händelse, larmtyp, kanal), tid till detektion och falsklarm utanför händelserna över deras exponering. För varje tests slutna uttryck anges falsklarmstalet: effekt per block (exakt gammasvans), spektralt överskott per block (approximation), kurtosis (ensidig gaussisk), pulser (binomialtak), SQM per medelvärdesbildad uppdatering (2Q(k) = Q(1/2, k^2/2), nytt) och ARL0 för C/N0-CUSUM (Siegmund). Utan tabellen är celler, nycklar och sammandrag oförändrade. Ingen störningsvågform syntetiseras

seg-5b7eb7ddb474 = Detektions-ROC för IQ-övervakarna från en bedömd labbuppspelningskampanj

seg-57fe85965c9c = iq::campaign::detect (windows, roc) och iq::campaign::report::rocs: varje cell i en kampanj med övervakare behåller, per larmtyp och kanal, maxvärdet av övervakarens egen teststatistika över varje angivet händelsefönster (positiva) och över sammanhängande roc_window_s-fönster utanför händelserna (negativa). Statistikorna är blockeffektens avvikelse, PSD-överskottet, kurtosis z, SQM |z| för det medelvärdesbildade måttet och C/N0-CUSUM. Rapporten slår ihop dem per typ till en empirisk ROC på fönsternivå med dess AUC och arbetspunkten vid den konfigurerade tröskeln, skriven som roc.json (kshana.campaign-roc/1) och som ett avsnitt Detection ROC i report.html. En kampanj utan övervakare skriver ingetdera

seg-3a3cfa322f01 = Kalibrering av den öppna mottagarens modeller för C/N0 och låsning mot resultat från IQ-kampanjer, med angivet prediktionsfel

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) och <c1/> på <c2/>, Python <c3/> och MCP-verktyget labfit (kampanjmappar enbart inom dess arbetskatalog): läser en utdatamapp från <c4/> via dess DIGEST och grupperar de bedömda cellerna i anpassningsenheter (signal x slingutformning x frontändskedja x störsändartyp, aldrig sammanslagna). Per enhet anpassas uppmätt C/N0 mot angivet J/S med den spektrala separationsformen. Q_eff är inte identifierbar ur C/N0-data utan en oberoende mätning av störsändarens och signalens effekt, så Q anges, anpassas aldrig (typtabellen, händelsens q eller, för en okänd typ, det mest skadliga angivna värdet, cw Q = { "1" }). Den anpassade parametern är den identifierbara förskjutningen delta_eff = delta - { "10" } log10 Q, där korrelationsvakten rapporterar degenerationen. C/N0-fack som är låsta under { "90" } % är censurerade och listas. Tröskel-J/S anges direkt och med det slutna uttrycket; spårningsslingans modell och den empiriska låsningsmodellen kopplas genom C/N0-modellen, med dröjsmål för tappad och återvunnen låsning. En seedad klusterbootstrap över inspelningar ({ "1000" } replikat) ger percentilintervall; { "90" } % prediktionsintervall kommer från residualdragningar; hold-outs där en inspelning utelämnas delas upp i interpolation och extrapolation; en förhandsregistrerad tabell [validation] hashas och varje tröskel bedöms som PASS/FAIL. Rapport kshana.labfit-iq/1 som JSON, CSV och genererad Markdown, med ett units-block. Endast syntetiskt (ingen tredjepartsinspelning, ingen störsändarvågform). Sökvägen labfit för mottagarloggar är oförändrad

seg-9537d301c95e = GPS LNAV-kodning avkodad av ett oberoende mottagarbibliotek

seg-909415621881 = Kshanas LNAV-delramar 1–3 (gps_lnav::encode_subframes) för de { "32" } efemeriderna i brdc0010.22n, matade till RTKLIB:s decode_word och decode_frame: paritet för varje ord, avkodning av delramar med konsekvent datautgåva och varje avkodad parameter mot Kshanas heltal och mot indatavärdet

seg-f66855e35c53 = Kodning av GPS LNAV-navigeringsmeddelandet

seg-8caf8366e2f8 = IS-GPS-200 LNAV-delramar 1–3 (gps_lnav::encode_subframes: kvantisering till närmaste av varje klock- och banparameter vid specifikationens skalfaktorer och värde på pi, tvåkomplementspackning, TLM- och HOW-ord, paritet enligt tabell 20-XIV med D29*/D30*-inversion, de paritetslösande bitarna i orden { "2" } och { "10" }), det meddelande som en GPS L1 C/A-signalgenerator sänder

seg-c5c944357643 = Införvärvning och C/N0-skattning på verklig IQ-data från månen

seg-f5dcb5e06bf4 = Parallell kodfassökning (acquisition::pcps_acquire: portabel FFT, koherent vikning, icke-koherent ackumulering, chi-tvåtröskel för en falsklarmssannolikhet över hela sökningen), förfining, öppen-slinga-korrelation av prompt-kanalen med kod-Doppler och C/N0-estimatorn M2M4, körd på LuGRE L1 4-bitars IQ-satser inlästa via realdata::ion_sdr

seg-709626569a5c = Införvärvning på verklig IQ-data från månen mot banprediktion av Doppler (beslut på samplingseffekt)

seg-784ebd80c425 = acquisition::pcps_acquire med sitt beslut på samplingseffekt på de nio LuGRE L1-satserna som inte kommer från ytan med mid-rise-nivåer; Dopplerskillnader mellan införskaffade satelliter jämförda med skillnader predikterade från ESA:s slutgiltiga banor och den av Firefly rekonstruerade banan för Blue Ghost

seg-89875d67b253 = Införvärvning på verklig IQ-data från månen bedömd mot banpredikterad Doppler

seg-956bcfeaf319 = acquisition::pcps_acquire med beslutet med cellmedelvärdesbildning (topp över rutnätets medelcell, robust mot bandbegränsat brus) på de nio LuGRE L1-satserna som inte kommer från ytan med mid-rise-nivåer; Dopplerskillnader mellan införskaffade satelliter jämförda med skillnader predikterade från ESA:s slutgiltiga banor och den av Firefly rekonstruerade banan för Blue Ghost

seg-8fa779dd1788 = Införvärvning på undanhållen verklig IQ-data från månen mot banpredikterad Doppler

seg-484868771231 = acquisition::pcps_acquire (beslut med cellmedelvärdesbildning, falsklarmssannolikhet { "1e-7" }) med refine_doppler_coherent på de LuGRE L1-satser som spelats in på månens yta (I i den höga nibblen, mid-rise-nivåer); Dopplerskillnader mellan införskaffade satelliter mot skillnader predikterade från ESA:s slutgiltiga banor och Fireflys kärna för landningsplatsen

seg-10af60b488b9 = Differentiell referensstation av NovaMoon-klass: upphävande av gemensamt läge + baslinjeväxande residual + DGNSS-skyddsnivåer

seg-c04a3591074c = Export för interoperabilitet på månen

seg-91f4a066b3c0 = Export av LunaNet/IOAG-anpassat månreferenssystem + tid + efemerid (CCSDS OEM + KIF) med rundturskontroll

seg-8ab65cbefb75 = Poängsättning anpassad till ramverk för PNT-resiliens

seg-c48198f31d63 = Delpoäng per dimension över Kshanas egna sju resilienskategorier (inte DHS-termer), RethinkPNT:s RDRR-funktioner och Yang-kriterier, var och en märkt Modelled med sin drivkraft; preliminär RPCF-nivå med en grind för begränsad försämring. Självbedömning härledd ur simulering, aldrig certifiering.

seg-d7bdb6fe186e = Studie av beslutsinstabilitet i resiliensindex

seg-5fcf18a68bb1 = Kvantifierar hur ett enda sammansatt index / en RPCF-nivå ordnar om arkitekturer under en försvarbar viktsimplex och en hotensemble (andel byten av top-1, spridning i Kendall-tau, andel nivåbyten, rangintervall); analyser av deklarerat mot uppmätt och av diversitetskollaps.

seg-1bf03544a010 = Representativitet för demonstrationen och luckor mot flygning

seg-db24d16d38c9 = Ärlighetsregister per resultat som kvalificerar en demonstrationsutdata: dess externa förankringar, modellerade antaganden, luckor mot flygning och representativt TRL-intervall, med invarianter som upprätthålls (Validated kräver en extern förankring; Modelled kräver en lucka och kan inte hävda mer än TRL { "4" }).

seg-52ab936eb5f5 = Underlag för avvägning kvant mot klassiskt (gemensam form)

seg-a6679ed5bed7 = Ett reproducerbart TradeEvidence-objekt (fast ram: scenario+seed+motor; gemensamma värden per kvalitetsmått för kvant mot klassiskt med fördel i rätt riktning, valfritt { "95" }-% konfidensintervall, etikett validerad/modellerad) som bär en representativitetspost, så att varje vertikal inom kvant-PNT redovisar avvägningen på samma ärliga sätt.

seg-20fee61b3107 = Bibliotek med felmodeller för kvantenheter

seg-e42eabe9bc2a = Enhetskort (optiska/jonfälle-/kvicksilverjonklockor + klassiska klockor återanvända från holdover/clock_state; kallatominterferometer; klassiska länkar + länkar med intrassling/enstaka fotoner för tidsöverföring) som var och en bär en representativitetspost; länken med intrassling lägger till en skotbegränsad modell för tidsprecision (~jitter/sqrt(R*tau), straff för mörkertal, systematiskt golv).

seg-86d71fd89f26 = Betrodd kvanttidssynkronisering (tidsöverföring + säker distribution + anomali)

seg-d2a3d37825ef = Kedja för tidsöverföring kvant mot klassiskt från början till slut (klockans fritt löpande drift + länkprecision i kvadratur), en återanvänd skyddsnivå för tidssynkronisering, ett säkerhetsmått mot fördröjnings-/återuppspelningsattacker (1-P_md) samt en detektionssannolikhet för klockanomalier + CUSUM-latens, redovisade som ärligt TradeEvidence med en representativitetspost.

seg-eaf341ff4522 = GNSS-fri kvantnavigering

seg-908a44a9f7c7 = Kvant (kallatominterferometer) mot klassisk navigeringsklassad INS med koppelnavigering under ett GNSS-avbrott: positionsfelets tillväxt, holdover till en positionströskel och avvägningen kvant mot klassiskt som ärligt TradeEvidence; ärlig anmärkning om observerbarhet (biasen är oobserverbar utan en positionsbestämning, så felet växer).

seg-914132833f5a = Fel- och anomalidetektion för kvant-PNT-system

seg-f20392820b9d = Märkt katalog över kvantfel (klockans frekvenshopp/drift/låsförlust; sensorns biassteg/bortfall), en ROC AUC för detektionsstatistikan med bootstrap-konfidensintervall och ett minsta detekterbart fel vid ett fast falsklarmstal; en kvantklockstödd övervakare detekterar mindre fel än en klassisk, redovisat som ärligt TradeEvidence.

seg-d31be81dfd8f = Passiv geolokalisering av sändare med TDOA/FDOA

seg-aa870cee16f6 = Lokalisera en sändare (störsändare/spoofer eller en opportunistisk källa för omvänd PNT) utifrån tidsskillnad vid ankomst över ett mottagarnätverk — skärningen mellan hyperboloider τᵢ=(Rᵢ−R₀)/c löst med minsta kvadrater enligt Gauss–Newton — och, genom att lägga till frekvensskillnad vid ankomst (skillnader i avståndshastighet) med rörliga mottagare, gemensamt återhämta position och hastighet; med Cramér–Rao-gränsen (nedre gräns) för positionskovariansen utifrån mätgeometrin

seg-5bd3882531b6 = Konvektiv inträdesuppvärmning i stagnationspunkten (Sutton-Graves) vid ett 3-DoF-inträde

seg-4f97036ed72f = Konvektivt värmeflöde i stagnationspunkten q = k sqrt(rho/R_n) V^{ "3" } med Sutton-Graves-konstanterna för jordluft och Mars atmosfär (NASA TR R-376, { "1971" }), dess topp och den integrerade värmebelastningen längs ett 3-DoF-inträde, ballistiskt eller lyftande med konstant bankning, på jorden eller Mars.

seg-1b96577665fc = Radiometri, MTF, relativt kantsvar och GIQE { "4" } NIIRS för elektrooptisk avbildare

seg-38902593e841 = Signal-brusbudget för en nadiravbildare (lambertisk scenradians, kameraekvationen, skott-, mörker-, avläsnings- och kvantiseringsbrus), systemets MTF vid Nyquist som produkten av diffraktion för en oskymd apertur, detektorapertur, linjär utsmetning och gaussisk jitter, kantsvaret och det relativa kantsvaret integrerade från den MTF:en, Q = lambda F / p, och GIQE version { "4" } NIIRS utan MTF-kompensation. Kan köras som scenariotypen <c1/>.

seg-07ca77a67207 = Förluster vid uppskjutning på grund av gravitation, luftmotstånd, styrning och mottryck

seg-7a1802cf2c80 = Plan uppstigning med gravitationssväng för ett flerstegsfordon över en icke-roterande sfärisk jord genom US Standard Atmosphere { "1976" } (densitet och tryck), med en nickspark, dragkraft som minskas av munstyckets mottryck, utbrända steg vid exakta stegbundna gränser och förlusterna från gravitation, luftmotstånd, styrning och mottryck integrerade vid sidan av tillståndet. Kan köras som scenariotypen <c1/>.

seg-55e8345def8b = TWSTFT-tvåvägsekvation, osäkerhetsbudget och länkstabilitet med flicker och dygnsbunden icke-reciprocitet

seg-5ca5226c24ec = TWSTFT-tvåvägsekvationen löst för T_A - T_B med stationernas sänd- och mottagningsfördröjningar, jonosfärens asymmetri uppåt/nedåt i Ku-bandet, skillnaden i transponderfördröjning och Sagnac-termerna, mot dess exakta framåtmodell; en osäkerhetsbudget i kvadratur med länkens TDEV som typ A-term; en tvåvägsserie med vitt och flicker-fasbrus (Kasdin-Walter), en dygnsbunden icke-reciprocitet och en konstant reciprocitetsresidual; samt hastighet, residual-RMS, TDEV och ADEV för tillhandahållna stationsklockserier i Circular T, MJD-CSV eller IGS RINEX. Kan köras som scenariotypen <c1/>.

seg-2f9be02c92bc = Numerik för optisk atmosfär längs snedlinjer: Rytov-varians, scintillation, fadningssannolikhet för gamma-gamma, aperturmedelvärdesbildning, optiskt djup för moln och klar luft

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integrerad längs en snedlinje för Rytov-variansen för plan och sfärisk våg (upplänk och nedlänk), scintillationsindex enligt Andrews-Phillips och gamma-gamma-parametrar, fadningssannolikheten för gamma-gamma och fadningsmarginalen, aperturmedelvärdesfaktorn vid svag turbulens, det optiska djupet för moln hos en vätskevattenkolonn samt det optiska djupet för klar luft enligt Kim-sikt plus Rayleigh, som ersätter den sammanslagna atmosfärsförlusten i den optiska länkbudgeten när en atmosfär tillhandahålls. Kan köras inom scenariotypen <c1/>.

seg-a2faab92e760 = Väderstyrd tillgänglighet för optiska markplatser och avståndskorrelerad platsdiversitet

seg-7f4e4e763d62 = Tillgänglighet för en optisk länk mot en angiven länkmarginal utifrån ett lognormalt klimat för molnens vätskevatten (mängd enligt ITU-R P.840, extinktion enligt geometrisk optik) och den oberoende turbulensfadningen för gamma-gamma, den länkmarginal som behövs för önskade tillgängligheter och det tak som ingen marginal kan lyfta, lognormala avbrottslängder, vad-händer-om för förbättringstekniker och en enfaktors gaussisk copula för nätverkstillgänglighet vars parkorrelation är exp(-avstånd/dekorrelationslängd). Kan köras som scenariotypen <c1/>.

seg-043ece801e72 = Kontinuitet i tidssynkronisering och avståndsmätning genom optiska avbrott

seg-bb9cb3fe4180 = Avbrottslängdsfördelningen för en optisk plats kopplad till klockans fritt löpande varians med slutet uttryck i holdover-modellen: fel i tidssynkronisering och avståndsmätning vid angivna kvantiler av avbrottslängden, holdover till en tröskel för tidssynkronisering, andelen avbrott och avbrottstid som ligger inom den och tillgängligheten för tidssynkronisering A + U E[min(D, T_h)]/E[D], för de klassiska och de kvantbaserade klockklasserna. Kan köras inom scenariotypen <c1/>.

seg-b119df65d2a7 = Optisk länkmarginal över tid: en seedad realisering av en plats väder

seg-06125f3cae90 = En frivillig tabell <c1/> (duration, step, seed) gör att typen <c2/> också skriver, per plats, en seedad realisering av den angivna platsmodellen genom tiden: molnepisoder (klara perioder exponentiella, molnavbrott lognormala med angivet medelvärde och angiven spridning, andelen tid i moln satt till den angivna molnsannolikheten), en lognormal vätskevattenkolonn per molnepisod, ett gamma-gamma-scintillationssampling per steg, och utifrån dem länkmarginalen, moln- och scintillationsfadningarna och flaggan för länk uppe, med den realiserade tillgängligheten, molnandelen, antalet avbrott och det längsta avbrottet. Utan tabellen är resultatet dokumentet { "0.37" }. Dragningarna går via de portabla vägarna för fördelningar och matematik, så native och wasm32 ger samma byte.

seg-58cbf576c959 = Läsare för TRK-2-18 Orbit Data File och modell för rampad 2-vägs-Doppler vid Mars

seg-d1055650a77f = En läsare för DSN Orbit Data Files (TRK-2-18): postgrupperna om 36 byte (filetikett, identifierare, bandata, ramper per station, klockförskjutningar, sammanfattning, filslut), och i varje bandatapost tidsmärket sedan { "1950" }, nedlänks- och upplänksfördröjningar, observerbar, stationer, datatyp, band, giltighet, kanal, rymdfarkost, referensfrekvensen på 46 bitar och komprimeringstiden; rampernas start- och sluttider, hastigheter och startfrekvenser. Ovanpå den en modell för rampad 2-vägs-Doppler i X-band (integrerade upplänksramper, ljustid för rundturen med Shapiro och troposfär, DSN-stationer via IAU 2006/2000A CIO-kedjan och IERS EOP, stationstid) och en batchbanbestämning för en Mars-omloppsfarkost (GMM-3-fält, tredje kroppar, SRP, luftmotstånd).

seg-455dc946c965 = Attitydskattning med multiplikativt EKF från ett gyro och en stjärnkamera

seg-553d043438b4 = Det multiplikativa EKF:et enligt Lefferts-Markley-Shuster: attitydfel i kroppssystemet och gyrobiastillstånd, propagering med gyrots vinkelhastighet minus biasskattningen och Farrenkopfs diskreta processbrus (vinkel- och hastighetsslumpvandring), uppdateringar från stjärnkameran med residualen { "2" } vec(q^-1 q_st) i Joseph-form och den multiplikativa återställningen; en diskret Farrenkopf-simulator för gyro och stjärnkamera. Typen <c1/> kan sluta regleringsslingan på sin skattning.

seg-a971ff07592a = Arbetscykel för apertur: navigering mot kommunikation

seg-5b0ba97379bf = En körning tar en kontaktplan (en lista med fönster aos_s/los_s som vart och ett ber aperturen om navigering eller kommunikation — samma fönstervokabulär som <c1/> avger, omvandlad av <c2/>), ett antal aperturer och en uttrycklig arbitreringspolicy, och returnerar navigeringsarbetscykeln, kommunikationsarbetscykeln, tomgångsarbetscykeln och avbrottet per session. Policyn är en indata med ett dokumenterat standardvärde (<c3/>; även <c4/> och icke-förebyggande <c5/>), och rapporten bär den lösta policyn, dess fullständiga definition samt definitionerna av arbetscykel och avbrott, eftersom en arbetscykelsiffra som anges utan sin arbitreringsregel inte är reproducerbar. Schemat är ett exakt intervallsvep över fönstergränserna, så ett fönster som slutar exakt där nästa börjar konkurrerar aldrig, och aperturssekunder för navigering, kommunikation och tomgång ackumuleras oberoende av varandra i det enda svepet. Kan köras som scenariotypen <c6/>

seg-43cd7aa7ab53 = RF-jamming mot navigering på månytan (J/S per satellit)

seg-e0566f37ad8f = Månnativt förhållande mellan störsändare och signal, effektivt C/N₀ och låsförlust för en selenografisk användare på ytan under en störsändare på månytan (eller upphöjd), över den illustrativa konstellationen av Moonlight/LCNS-klass från offentliga källor. Sammansätter den öppna jamming-kedjan (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) med den öppna geometrin för månhimlen (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); ingen geometri eller radiometri härleds på nytt. Till skillnad från jordtypen <c1/> är signalledet inte en fast mottagen effekt: varje satellits isotropa mottagna effekt är dess egen länkbudget EIRP − FSPL(snedavstånd), så J/S varierar satellit för satellit med avstånd och elevation på månen. Avger EN RAD PER SYNLIG LÄNK (epok, satellit) som JSON och som en artefakt *.table.csv, med båda mottagna effekterna som J/S är differensen av utskrivna bredvid sig; sammanfattande kvalitetsmått ligger bredvid den tabellen, aldrig i stället för den. Kan köras som scenariotypen <c2/>

seg-4c116e25c5c5 = Denial-kontur för månen med ett osäkerhetsband från den uppmätta spridningen i C/N₀

seg-77828c25f3ab = Rapporten <c1/> vilar inte längre sin denial-kontur på en enda skalär. Den avger hela den uppmätta fördelningen av önskat signal-C/N₀ över tabellen per satellit — n, min, p05, p25, median, p75, p95, max, medelvärde, stickprovets standardavvikelse och stickprovets egen asymmetri (p95 − median) − (median − p05) — bredvid raderna per länk, som är oförändrade. Konturen redovisas sedan vid var och en av dessa ordningsstatistikor under BÅDA denial-kriterierna som motorn känner igen, aldrig det ena i stället för det andra: det etablerade effektkvotskriteriet (J/S = { "30" } dB, samma tröskel som attack_surface och tracking_loop använder och kriteriet bakom kolumnen <c2/> i den publicerade tabellen för länk-jamming på månen), och kriteriet låsförlust (det effektiva C/N₀ som faller till tracking_threshold_dbhz), som är kriteriet som rapportens egen kolumn links[].status bedöms med. Varje konturpunkt anges på båda axlarna i denial-planet — den störsändar-EIRP som krävs vid scenariots avstånd, och det denial-avstånd som gäller vid scenariots EIRP — så att bandet är ett intervall på samma axlar som ett konturdiagram ritas på. Bandkanterna ÄR contour(p05) och contour(p95): samma avbildning med slutet uttryck tillämpad på stickprovets egna kvantiler, inte ett sigma anpassat till stickprovet och inte median ± k·stdev, och rapporten säger det i en sträng band_definition bredvid siffrorna. stdev avges för kontinuitet och används av ingenting. En kvantil vars C/N₀ redan ligger vid eller under spårningströskeln har inget ändligt J/S som medför denial; de kolumnerna avges som null med en räknad orsak i stället för som ett oändligt värde eller en inklämd radie

seg-2d3944107ba0 = Detektionsstyrka hos övervakare av integritet över flera modaliteter

seg-38bc7c0bfe57 = Rapporten hybrid-optical-rf anger vad chi-tvåövervakaren över flera modaliteter faktiskt kan DETEKTERA, inte bara att den klarar ett felfritt fall: den minsta detekterbara biasen per övervakad axel (öst, nord, upp, klocka) vid scenariots angivna sannolikheter för falsklarm och missad detektion, detektionsstyrkekurvan på båda sidor om den, den brusfria biasmultipel där den realiserade statistikan först passerar tröskeln och tiden till detektion för en biasramp med angiven hastighet. Fel injiceras också genom den verkliga övervakaren och den statistika den returnerar redovisas bredvid den analytiska prediktionen

seg-90307f07e0ef = Lösningslägen för en lunar referensstation: höjdbegränsning, tre satelliter, fönster med statisk användare

seg-366c7ad03fb2 = Den valfria sektionen [solution] i lunar-station-coverage (LRS-06): en pseudomätningsrad för höjd up . dx = e_h med angiven 1-sigma, viktad mot avståndsraderna, ett minimum på tre satelliter som endast tillåts tillsammans med den, samt en viktad minsta kvadrat-lösning över de senaste window_epochs epokerna med en gemensam statisk position och en klocka per epok (ett filters svar för en statisk position utan processbrus över samma data; epokernas fel behandlas som oberoende). Om sektionen saknas är snapshot-lösningen och alla dokument oförändrade. Ett tillägg till jämförelsen med publicerade påståenden, med källornas lösningssätt, förhandsregistrerat för sig

seg-611ba369ed00 = Noggrannhet och täckning hos en lunar referensstation jämfört med publicerade påståenden

seg-4fe4f1cffa2b = Slaget lunar-station-coverage körd under de offentliga antagandena i det publicerade materialet om en lunar differentiell referensstation (fyra navigationssatelliter i frysta elliptiska banor på { "24" } h, { "10" } m { "95" } % SISE, { "0.30" } m kodbrus, { "1" } s och { "600" } s korrektionsfördröjning, en stationsutmätning under decimeter, den publicerade exempelplatsen för stationen, de sydpolära cirklarna på { "300" } km och { "600" } km) och poängsatt mot källornas numeriska påståenden under sex ensidiga trösklar som fastställdes i förväg, före körningen: täckning av hela sydpolen vid p95 under en meter (K1, K2), korrigerat p95 under en meter och på decimeternivå (K3, K4), under en meter bibehållet vid { "600" } s fördröjning (K5) samt noggrannhet bibehållen från { "10" } km till { "500" } km baslinje (K6)

seg-7bfcb5c6a985 = ARAIM med samtidiga felhypoteser för flera satelliter

seg-15043111e437 = araim_reference::add_v42_subset_plan: regeln i ADD v4.2 för bestämning av delmängder (P_THRES, FC_THRES, övervakade delmängder med minst borttagna först) generaliserad från par till samtidiga kombinationer av upp till max_order satellit- och konstellationshändelser, med den exakta förhandsfördelningen P_no fault prod q_e; add_v42_protection_levels_to_order kör skyddsnivåvägen i ADD v4.2 på den (ordning { "2" } är exakt den befintliga vägen). raim::araim_subset_raim (tillval): avancerad RAIM över den hypotesmängden, där varje övervakad delmängd är ett läge (p_fault, T, b, sigma) i integritetsrisksumman, delmängder som inte går att observera flyttas till den ej övervakade risken, budgeten skalas med ADD:s fördelning av den ej övervakade risken, och delmängden med störst normaliserad separation rapporteras när ett fel upptäcks. Förhandsfördelningar som kräver djupare delmängder än max_order avvisas, trunkeras aldrig

seg-48ca01332f8f = RAIM vid sidan av kvalitetsmåtten för klock-holdover

seg-890f1006a75d = Den valfria sektionen [integrity] i klockslaget (clock_integrity::run): från en angiven plats och förinställningar för konstellationer (geometry::sky_geometry), vid varje integritetsepok medan GNSS-tidslinjen inte är nekad, snapshot-RAIM (raim::snapshot_raim: paritets-chi-två-test, skyddsnivåer med lutning) på satelliterna över masken med slumpmässigt dragna gaussiska residualer med angivet sigma och en valfri angiven bias; ett separat integrity_fom-block med utlåtanden per epok, skyddsnivåer och tillgänglighet. Nekade epoker rapporteras som otillgängliga, extrapoleras aldrig; kvalitetsmåtten för holdover är oförändrade och utan sektionen är utdata identiska byte för byte

seg-9cbb4ee7588a = Rumslig, brusig observerbarhet av bågsträcka för flera familjer av cislunara banor

seg-5ebd771deef8 = Tröskeln för observerbarhet av bågsträcka i cislunar rymd i den RUMSLIGA CR3BP med sex tillstånd i stället för den plana med fyra tillstånd, över familjerna DRO, L2-halo och L2 nära-rätlinjig halo, med mätbrus som går in i Gramianen och TVÅ kriterier rapporterade eftersom det inte finns något enskilt ärligt: det publicerade rangkriteriet, som bevisligen är invariant mot ett homoskedastiskt mätsigma (blekning multiplicerar observerbarhetsmatrisen med en skalär, vilket lämnar det relativa singulärvärdesspektrumet och därmed rang, defekt och konditionstal oförändrade), och ett skattbarhetskriterium — den första båge där den formella 1σ-osäkerheten i positionen för chief-satellitens begynnelsetillstånd understiger en angiven gräns — vilket är det som faktiskt rör sig med bruset. Varje tröskel bär det epokrutnätsintervall den ligger i; ett kriterium som inte nås är null med en orsak. Plant läge förblir standard och familjer utanför planet avvisas där i stället för att plattas ut till ett tillstånd som inte kan representera dem

seg-e250321394bc = Fel i prediktion av jordorientering i operativ stil, uppmätt förutsagt mot slutligt

seg-0e443d241460 = En anpassning med minsta kvadrat av bias plus ändringstakt över ett släpande fönster plus de huvudsakliga periodiska termerna — årlig, halvårlig och de två huvudsakliga zonala tidvattnen för UT1; Chandler, årlig och halvårlig för polen — extrapolerad med den sista residualen i fönstret förd framåt: den klass som IERS Bulletin A använder, i stället för den persistensprediktor som den publicerade horisonten vilade på. Poängsatt på det enda ärliga sättet: en prognos för T+h byggd av snabba Bulletin A-rader vid eller före T, mätt mot den SENARE publicerade slutliga Bulletin B vid T+h, med persistens poängsatt över samma epokmängd mot samma slutliga värden bredvid. En målepok utan publicerat slutligt värde utelämnas i stället för att poängsättas om mot den snabba kolumnen; en periodisk term som fönstret inte kan begränsa rapporteras som förkastad med de cykler den faktiskt spänner över; ett ofullständigt fönster avvisas i stället för att tyst förkortas

seg-f4efd94dd746 = Lunart datum för referenssystem från en observationskampanj

seg-a6972eb89d7d = Det sjuparametriga Helmert-datumet propagerat från en SIMULERAD OBSERVATIONSKAMPANJ i stället för återskapat från en injicerad transform. Jordstationer observerar en källbelagd katalog över beacons på månytan enligt ett uttryckligt schema; de lunara VLBI-fördröjningspartialerna ackumuleras till en Fisher-informationsmatris för beacon-koordinater och förs genom Helmert-utformningen A = [I₃ | [p]ₓ | p] till H = AᵀM_bA, så att den rapporterade datumnoggrannheten är en funktion av observationsprogrammet — exakt linjär i fördröjningssigma och monoton i bågen genom den libration som rapporten MÄTER. Datumdefekten är själva ämnet och inte en fotnot: rang, defekt, konditionstal, spektrum, ej observerbara riktningar i basen med sju parametrar, den svagaste riktningen även vid full rang och varje parameters andel av den redovisas vid varje körning, och varje parameter som kampanjen inte begränsar publiceras som NULL med en status. Korrelationen mellan beaconfel är MÄTT, inte antagen — exakt noll med stationerna fixerade, och redovisad med sin kostnad när de skattas. Kan köras som scenariotypen <c1/>

seg-ca481f2d8f9e = Bekräftelse från oberoende skattare av tröskeln för bågsträcka i cislunar rymd

seg-3d5fbf896209 = En skattare med batch-minsta kvadrat som ÅTERSKAPAR chief-satellitens begynnelsetillstånd från simulerade mätningar mellan satelliter över växande prefix av samma epokrutnät som tabellen rang mot båge använder, med mätpartialerna tagna som centrala finita differenser av den sammansatta framåtmodellen. Den använder ingenting av det maskineri som tröskeln mättes med — ingen analytisk jakobianrad, ingen variationell tillståndsövergångsmatris, ingen singulärvärdes- eller egenvärdesuppdelning, ingen rangtolerans, inget filter med kvadratrot av informationen — och delar bara dynamiken, begynnelsevillkoren, den skalära observabeln och epokrutnätet, vart och ett namngivet i det utsända dokumentet. Två kriterier, båda svepta: återställning utan brus (rangens motsvarighet) och skattbarhet med Monte Carlo (skattbarhetens motsvarighet, mätt mot en känd referens i stället för förutsagd ur en kovarians). Kan köras som scenariotypen <c1/>

seg-f839285852d9 = Lunar servicevolym från verklig, hämtad konstellationsgeometri

seg-c3059fcced49 = Tar emot en tabellerad månscentrerad tillståndsefemerid (utvärderingen av en SPK/BSP-kärna) eller en publicerad konstellationsdefinition bakom <c1/>, kör samma svep över täckning / DOP / skyddsnivå mot den och sänder ut det krav på σ_URE som den innebär BREDVID de oförändrade illustrativa keplerska och perturberade resultaten, med skillnaden som en egen namngiven storhet. Varje siffra bär en proveniensklass som skiljer kärnhärledd från härledd ur publicerade element och från modellerad, så att de aldrig kan förväxlas i ett citat längre fram

seg-36a6cfaf5afa = Enhet och proveniens deklarerade för varje rapporterad storhet

seg-12460501e82b = Ett maskinläsbart schema som anger enhet, proveniensklass och definition för varje numeriskt fält i varje scenariorapport, plus en enda global spärr som kör varje registrerad scenariotyp och underkänner om ett utsänt numeriskt fält saknar någotdera. Proveniensvokabulären är sluten och varje klass bär en evidensnivå, med två klasser som avsiktligt avbildas på <c1/> och <c2/> i stället för att tilldelas en nivå som klassen inte bestämmer

seg-c815cb90dcde = Geodesi för lunar referensstation: tillagd retroreflektor och VLBI-beacon mot datumet med fem grupper

seg-103cf21173ac = Valfria indata extra_reflectors och extra_beacons i scenariot lunar-llr-datum lägger till ett block station_geodesy: Helmert-informationen för de fem grupperna från det arkiverade urvalet av lunar laser ranging plus den information som en tillagd retroreflektor (avståndsmätt vid de arkiverade normalpunktsepoker då mätstationen är över sin horisont, var och en med den normalpunktens arkiverade vikt) och en tillagd VLBI-beacon (observerad av nätverket och schemat i lunar-frame-campaign med jordstationerna fixerade, genom fördröjningspartialerna i lunar-vlbi-fim) på angivna platser lägger på det sjuparametriska datumet, omlöst, med varje Helmert-parameters 1-sigma före och efter, deras kvot, normerna före och efter samt de yttersta egenvärdena för Fisher-differensen. Om de saknas eller är tomma är rapporten oförändrad

seg-44f582b17fa9 = Spärrens integritet — ett grönt som betyder vad det säger

seg-43fbcfbe990c = Tre strukturella vakter över själva verifieringsprocessen, var och en stänger en klass av defekter som nått den kanoniska spärren som en intermittent eller falsk röd. ({ "1" }) Varje konstruerad temporär sökväg i Rust-källorna måste bära en komponent som är unik per anrop; ett process-id avvisas, eftersom cargo kör bibliotekstesterna som parallella trådar i EN process och pid delas av alla. ({ "2" }) Varje fästpunkt byte för byte eller via hash måste deklarera, intill sig själv eller i modulhuvudet, vad den täcker och vad den avsiktligt utesluter — så att en ändring som skär över flera delar med en blick visar vilka fästpunkter som berörs och vilka som i tysthet blivit detektorer för ändringar i hela förrådet. ({ "3" }) Ett grönt kan bara göras gällande från HELA sviten: scripts/gate.sh kör <c1/>, fångar den sanna slutkoden utan någon pipe i vägen och skriver ett kvitto som namnger committen, antalet integrationsbinärer, antalet tester och varaktigheten; kontrollen före push avvisar en push vars commit inget giltigt kvitto namnger, på ett rent träd. Upprepbarhet provtas separat av scripts/check-repeatability.sh, som kör biblioteksviten N gånger och underkänner om mängden tester som klaras skiljer sig.

seg-b7cd952ff133 = Sammansatt PL för tidssynkronisering — P0-sådd holdover-genomfart

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); nedåt halvkontinuerlig PL({ "0" }+)≥PL({ "0" }−); K(IR/2) löpande maximum; fasexponenter τ/τ³/τ⁵

seg-096b6cdfe2dc = Sammansatt PL för tidssynkronisering — LIL a.s.-hölje (omöjlighet + konsistens)

seg-1671add2210d = Ingen ändlig värsta-fall-holdover (Brownsk sup divergerar); IR-fördelad HPL förenlig med Hartman-Wintner-höljet när IR→{ "0" }

seg-5a27c9f0a67d = Överbegränsning av integritet för spårbarhetsbias hos heterogena UTC(k)

seg-fd09ab2adbf6 = Överbegränsning av bias per källa b = (U/k_cov)·Phi^-1(1-tail/2) + åldrande, som blåser upp en publicerad utvidgad osäkerhet av Typ B till en fördelad integritetssvans; kopplar till tpl_scalar som bias_s

seg-d75b900ad25f = Korrelerad korskovarians för spårbarhetsbias (fördelning som är osäker vid gemensamt läge)

seg-0641f6d38c23 = Korskovarians för bias av storlek N×N med rho·b_i·b_j utanför diagonalen för källor som delar en realiserare av UTC(k); BEVISAT correlated_fused_bias >= independent_fused_bias (naiv oberoende fördelning underbegränsar den sammanvägda biasen -> optimistisk -> osäker)

seg-1a3bb032960f = Konsistensstatistik för gemensamt läge (fel i delad referens som separationen är blind för)

seg-1b03f522b8fc = Poängstatistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 för en förskjutning i gemensamt läge som solution separation (kontraster ortogonala mot { "1" }) inte kan se; en förskjutning i gemensamt läge blåser upp den medan parvisa separationer förblir platta

seg-3359eee713a5 = Klassificering av nollrum för lunart datum (rangadditivitet för LLR + lyft av defekt genom libration)

seg-6d722c176052 = Klassificering av det interna avståndsmätningsproblemet för datum: en enda avståndsobservation bidrar med rang { "1" } (nollrum med 6 dimensioner); paret origo-X och skala är nästan noll och fysisk DE440-libration lyfter defekten till noll medan paret förblir nästan degenererat

seg-3fd19007ea67 = Information om lunart datum från flera tekniker (LLR + lunar VLBI + avstånd till omloppsfarkost)

seg-ab96cfc8d48c = Underlag för geometri av lunart LLR-datum (reflektorer i huvudaxelsystem, markstationer, analytiska avståndspartialer)

seg-63a8571f8eb0 = Degeneration mellan avstånd och klockoffset i lunar envägsavståndsmätning, och lagen om geometrisk mångfald för utformning

seg-cdd70f56051a = Degenerationen mellan radiellt avstånd per nod och mottagarens klockoffset är exakt vid { "1" } m till { "3.336" } ns (ett genom c). Marginalen för Schur-komplementet { "{" }scale, offset{ "}" } (coupled_marginal_fisher) visar att i ett geometriskt varierat nätverk lyfter tvåvägsavståndsmätning marginalen ungefär med samma faktor som ett lika stort antal ytterligare envägsdata, medan lyftet med tvåväg i det idealiserade regimet med en enda nod är flera storleksordningar större. Den lag som följer: geometrisk mångfald, inte tvåvägsavståndsmätning som sådan, är det som skiljer lunar skala från tidsskalans offset vid envägsavståndsmätning; en tvåvägs eller extern tidskoppling krävs endast i regimet med låg mångfald eller en enda användare.

seg-2c074d6260ba = Representativ meny av multitekniska mätningar och den additiva Fisher-kombinationsregeln

seg-beefac5c1b13 = MeasurementBlock håller en kandidatmätkampanj som ett informationsbidrag av Fisher-typ på 7x7 plus en skalär relativ kostnad; block_from_rows bygger ett ur råa datum-jakobianrader så att varje block förkonditioneras identiskt genom lunar_identifiability::assemble_multi_info; combine summerar informationen för en vald delmängd, vilket är rätt regel eftersom Fisher-information är additiv över oberoende mätningar; representative_lunar_menu levererar en deterministisk meny med fyra block (LLR, en tvärgående VLBI-limbbeacon, en omloppsfarkost på närsidan och en på bortre sidan). Den budgetbegränsade utformningsoptimeraren som använder den här menyn ingår inte i den här craten.

seg-2d3347bcb15e = Tolerans för konsistens mellan leverantörer för en användare med blandade leverantörer

seg-9decf2cb6b0c = consistency_tolerance: inverterar en positionsbudget för användaren till ett krav per parameter på Helmert-samstämmighet mellan leverantörer (origo/skala/rotation) vid en referenshävarm, valfritt uppblåst med realiserings-CRLB för en enskild leverantör enligt P1

seg-5450d921dfc9 = Felbudget för lunar interoperabilitet mellan flera leverantörer och designlag för referenssystem mot efemerid

seg-e1e30f5c17a6 = interop_budget: reducerbar (gemensam ramkoppling) mot oreducerbar (dynamik) uppdelning under konventionerna PerProvider / CommonFrameTie / CommonEphemeris, med måttet för designlagen om oreducerbar andel (~{ "0.69" } på verkliga DE440/INPOP/EPM: enbart en gemensam ramtagg lämnar kvar det dominerande golvet)
