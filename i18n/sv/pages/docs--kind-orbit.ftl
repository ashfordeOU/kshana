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
