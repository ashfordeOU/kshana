# docs--kind-clock: translations (sv)

seg-debc2f07db78 = true

seg-33555d61ddc6 = Källa: <c1/>

seg-618393657d01 = <c1/> (scenariotyp)

seg-c61e88721556 = Scenariotyp i motor v{ $version }, familj <a1>Klockor, tidssynkronisering och holdover</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-78cba87823f7 = Klockans holdover mot specifikation; valfri Monte Carlo-ensemble (runs > { "1" }).

seg-dd2ad570a6c9 = En körning av <c1/> sammanfattas som: scenario 91d2b6d10d14 | { "200" } körningar | kvant-holdover 6600s [6600-6600] p95 8.78e-4ns säkerhet n/a (ingen attack) | klassisk holdover 844s [220-2130] p95 167.0ns säkerhet n/a (ingen attack)

seg-51820163de28 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-80fe14eb5e79 = Valfria fält: <c1/>, <c2/>

seg-807e7c5a2565 = Exemplet <c1/> anger bland annat:

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC-datablad sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Optisk gitterklocka med strontium, rymdinriktat mål sigma_y

seg-0cd8dc81045c = { "4" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-cb0b7da83f5c = Diagrammet som motorn skriver för scenarios/clock-ensemble.toml, typ clock

seg-5b3dbe0aed82 = <b>MODELLED</b> Det valfria avsnittet [integrity] i typen clock (clock_integrity::run): från en angiven plats och konstellationsförinställningar (geometry::sky_geometry), vid varje integritetsepok medan GNSS-tidslinjen inte är nekad, ögonblicks-RAIM (raim::snapshot_ Tester: <a1>clock_integrity.rs</a1>.

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: ett parserlager som gör om en RINEX-klockfil (AS/AR-poster för en namngiven klocka, versionerna { "2" } och { "3.00" } till { "3.04" }), en ASCII-fas- eller frekvenslogg i TimeLab-stil, eller en TAPR TICC-tidsstämpel- eller intervalllogg till en enhetlig pha Tester: <a1>clock_log_allantools.rs</a1>.

seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input med formaten ptp4l, phc2sys, ts2phc, chrony-tracking och chrony-statistics: den loggade offseten för en linuxptp-servorad (ns, radens egen tidsstämpel inom hakparentes, avläsningar innan servot först rapporterar s2 utelämnade a

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifierad/Hadamard-deviation + identifiering av potenslagsbrus med χ²-konfidensintervall. Oberoende referens (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32 referensdeviationer på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Glidfelstillväxt i sluten form + holdover till tröskel; kvantklockeklasser. Oberoende referens (ReferenceImpl): Flerstegsrekursion för clock_state-kovarians (korskontroll i samma kodbas); den underliggande kärnan för glidvarians och holdover-inversion är externt validerad mot scipy (se 'Clock-holdover coast-variance & threshold inversion'). Holdover-talen för rödbrusgolvet per klass förblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Kalmanklocka med 3 tillstånd (fas/frekvens/drift) enligt van Loan, Joseph-stabiliserad. Oberoende referens (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm och Q via blockmatrisen av Van Loan { "1978" } — en oberoende referensimplementering som reproducerar kshanas hela filterbana. Konsistens mellan implementeringar: klockfysiken / Allan-kalibreringen är inte externt validerade, så den här förblir MODELLED. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): på IGS-slutliga { "30" } s-klockor för { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Klockstödd χ², RAIM, AGC, SQM sammanslagen säkerhets-FoM per epok. Oberoende referens (ExternalDataset): TEXBAT-scenarioparametrar (Humphreys { "2012" }) — karakterisering, inte fastlåsta vektorer. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): på JammerTest { "2024" } (Bleik; GPL-3.0-data) gav monitorerna på observabelnivå (klockstött chi-kvadrat, RAIM, lösningsfel) inget larm inom { "10" } s för något av de { "8" } utvärderbara publicerade spoofing-inledningarna (där fönstret före inledningen var rent kom det första larmet { "10.2" } till { "39" } s efter pu

seg-e12f672ae71d = Klockans holdover i GNSS-nekade miljöer är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Skattning av klocktillstånd ombord är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-detektion är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätts ihop av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Familjesida: <a1>Klockor, tidssynkronisering och holdover</a1>

seg-ee7dd15019d0 = Ämnessida: <a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = Ämnessida: <a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>Föregående</s1>cislunar-observability

seg-aba9395185fa = <s1>Nästa</s1>combined-altpnt
