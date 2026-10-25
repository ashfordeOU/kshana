# docs--kind-orbit: translations (sv)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenariotyp i motor v{ $version }, familj <a1>Konstellationer, täckning och geometri</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-a4f1e7d2041e = Familjesida: <a1>Konstellationer, täckning och geometri</a1>

seg-be831b52a339 = och { "4" } till i matrisen.

seg-a8d92406e428 = Optisk gitterklocka med strontium, rymdinriktat mål sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifierad/Hadamard-deviation + identifiering av potenslagsbrus med χ²-konfidensintervall. Oberoende referens (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32 referensdeviationer på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Glidfelstillväxt i sluten form + holdover till tröskel; kvantklockeklasser. Oberoende referens (ReferenceImpl): Flerstegsrekursion för clock_state-kovarians (korskontroll i samma kodbas); den underliggande kärnan för glidvarians och holdover-inversion är externt validerad mot scipy (se 'Clock-holdover coast-variance & threshold inversion'). Holdover-talen för rödbrusgolvet per klass förblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Kalmanklocka med 3 tillstånd (fas/frekvens/drift) enligt van Loan, Joseph-stabiliserad. Oberoende referens (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm och Q via blockmatrisen av Van Loan { "1978" } — en oberoende referensimplementering som reproducerar kshanas hela filterbana. Konsistens mellan implementeringar: klockfysiken / Allan-kalibreringen är inte externt validerade, så den här förblir MODELLED. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): på IGS-slutliga { "30" } s-klockor för { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Klockstödd χ², RAIM, AGC, SQM sammanslagen säkerhets-FoM per epok. Oberoende referens (ExternalDataset): TEXBAT-scenarioparametrar (Humphreys { "2012" }) — karakterisering, inte fastlåsta vektorer. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): på JammerTest { "2024" } (Bleik; GPL-3.0-data) gav monitorerna på observabelnivå (klockstött chi-kvadrat, RAIM, lösningsfel) inget larm inom { "10" } s för något av de { "8" } utvärderbara publicerade spoofing-inledningarna (där fönstret före inledningen var rent kom det första larmet { "10.2" } till { "39" } s efter pu

seg-e12f672ae71d = Klockans holdover i GNSS-nekade miljöer är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Skattning av klocktillstånd ombord är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-detektion är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätts ihop av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-d291f20074f0 = <b>VALIDATED</b> Jordrotation från ett tvådelat UT1-juliandatum på banvägen, så att den jordfasta positionen behåller den mikrosekund som ett enda f64-datum förlorar (cirka { "3e-9" } rad nära { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventionen, på de två delarna), cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: raderna i <a1>verifieringsmatrisen</a1> som nämner denna kind.

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP från siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-uppdelning. Oracle (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — oberoende bibliotek, överensstämmande till { "1e-6" } relativt

seg-53a78e98af12 = Ämnessida: <a1>SKYLINE.md</a1>

seg-ae15d15bf151 = Ämnessida: <a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = { "7" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-0e3518dc3ddb = Källa: <c1/>

seg-1428025a91e1 = <c1/> (scenariotyp)

seg-cb4262b66b8f = GNSS-tillgänglighet + DOP från en konstellation i omloppsbana (Walker / TLE / RINEX).

seg-97680b4587c8 = En körning av <c1/> sammanfattas som: scenario bffc887db977 | 77/361 samples GNSS-nominal | best PDOP { "2.53" } pos 2.53m | quantum holdover 0s p95 6.49e-5ns integrity { "1.000" } security n/a (no attack) | classical holdover 0s p95 25.0ns integrity { "1.000" } security n/a (no attack)

seg-b3a080b98bd9 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c818cc4f87da = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-364139ff447d = Exemplet <c1/> anger bland annat:

seg-d5063dda3971 = Microchip SA.45s / SA65 chip-scale atomic clock, sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = Diagrammet som motorn skriver för scenarios/orbit-rinex.toml, typ orbit

seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP från siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-uppdelning Tester: <a1>dop_reference.rs</a1>.

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry och check: en Monte Carlo med slumpfrö (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-frö { "36" } + i) av motorns egen iterativa minsta kvadrat-positionsbestämning (pvt::solve_spp, enhetsvikter, löst från den sanna positionen) på Tester: <a1>uere_dop_monte_carlo.rs</a1>.

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: den geodetiska (WGS-84) azimuten och elevationen för en satellit från en markplats, en azimut-/elevationsmasktabell linjärt interpolerad i azimut med omslag vid { "360" } deg, den synliga mängden el Tester: <a1>skyline_orekit_oracle.rs</a1>.

seg-d86884be3f98 = <s1>Föregående</s1>optical-atmosphere

seg-da202333ae8d = <s1>Nästa</s1>passes
