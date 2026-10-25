# docs--kind-fusion: translations (sv)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC-datablad sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-f4cf8b629797 = Ämnessida: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = och { "4" } till i matrisen.

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifierad/Hadamard-deviation + identifiering av potenslagsbrus med χ²-konfidensintervall. Oberoende referens (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32 referensdeviationer på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Glidfelstillväxt i sluten form + holdover till tröskel; kvantklockeklasser. Oberoende referens (ReferenceImpl): Flerstegsrekursion för clock_state-kovarians (korskontroll i samma kodbas); den underliggande kärnan för glidvarians och holdover-inversion är externt validerad mot scipy (se 'Clock-holdover coast-variance & threshold inversion'). Holdover-talen för rödbrusgolvet per klass förblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Kalmanklocka med 3 tillstånd (fas/frekvens/drift) enligt van Loan, Joseph-stabiliserad. Oberoende referens (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm och Q via blockmatrisen av Van Loan { "1978" } — en oberoende referensimplementering som reproducerar kshanas hela filterbana. Konsistens mellan implementeringar: klockfysiken / Allan-kalibreringen är inte externt validerade, så den här förblir MODELLED. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): på IGS-slutliga { "30" } s-klockor för { "11" } GPS Blo

seg-e12f672ae71d = Klockans holdover i GNSS-nekade miljöer är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Skattning av klocktillstånd ombord är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-detektion är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätts ihop av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-4de09fe367df = Källa: <c1/>

seg-53e498cffeba = <c1/> (scenario kind)

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-ec26df467b88 = Gemensam PNT med Kalman-filtersensorfusion över samma hybrida indata.

seg-25708bf88728 = En körning av <c1/> sammanfattas som: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

seg-dba20bb12cda = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3d5cae65f093 = Valfria fält: <c1/>

seg-56bca36cabba = Exemplet <c1/> anger bland annat:

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = Navigation-grade quartz accelerometer; illustrative noise-dr

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = Cold-atom accelerometer, low long-tau velocity-random-walk;

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = Navigation-grade quartz accelerometer; i

seg-c8a1c797f4b1 = Diagrammet som motorn skriver för scenarios/fusion-pnt.toml, kind fusion

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: raderna i <a1>verifieringsmatrisen</a1> som nämner denna kind.

seg-46c0903ff7b5 = <b>VALIDATED</b> Återskapa ett epokstillstånd [r,v] från markstationsavstånd med en Gauss–Newton-differentialkorrigerare i batch och ett sekventiellt filter, över en kraftmodell med tvåkropps+J2 Tests: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

seg-44f77aaf9d7e = <b>MODELLED</b> Feltillstånds-EKF över { "15" } INS-tillstånd, en klocka i mottagaren med två tillstånd och en flyttalsosäkerhet för bärvågen per spårad satellit; pseudoavstånd, bärvågsfas och valfri avståndshastighet från en SGP4 Walker-konstellation (ljustid och Sagnac), Klobuchar an Tests: <a1>fusion_carrier_tc.rs</a1>.

seg-509f93c7e9ce = <b>MODELLED</b> Tre gnss-ins-scenarier på banbiblioteket (ett fartyg som girar fram och tillbaka med { "8" } m/s med ett bortfall på fem minuter; ett tåg genom en skärning med två satelliter och en tunnel; ett flygplan vars bortfall täcker en 25-graders banad sväng) och paketets valfria Tests: <a1>gnss_ins_packs.rs</a1>.

seg-e0633b308e4e = <b>MODELLED</b> Ett staplat Kalman-filter över position, hastighet, klockfas och frekvens som matas med pseudoavstånd som kopplar position och klocka (Joseph-uppdateringar som bär korskovariansen); en 1-DOF-variant utökad med en konstant accelerometerbias s Tests: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Accelerometer med kallatomsinterferometer från grundprinciper (k_eff·T², QPN). Oracle (ExternalDataset): Publicerade numeriska vektorer från primärartiklar om CAI (Cheinet { "2008" } överföringsfunktion; Peters/Freier känslighet): k_eff·T² stämde exakt, skottbrus-ASD ett ensidigt golv inom ~{ "2" }× av varje publicerat instrument (verkliga enheter har tekniskt brus över kvantgolvet). Ett intervall, inte paritet. { "0.30" } round { "2" } (pre-registered fcb9ac64), ett fynd (förblir MODELLED): det rena QPN-rotationsbruset mot det uppmätta Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Sammansatt positionsbudget för bias + skalfaktor + VRW + stabilitetsavklingning över holdover. Oracle (ReferenceImpl): Oberoende numpy Monte Carlo-SDE-integrering av dubbelintegrerat vitt accelerationsbrus (validerar den analytiska VRW-variansen med en genuint oberoende algoritm) + ett publicerat värdeankare från Groves { "2013" } för bias-/skalfaktortermerna; CAI-enhetens siffror kvantifierar partnerhårdvara och förblir MODELLED

seg-9955b1b1c018 = Prestanda hos kvantinertialsensorer är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Motståndskraft hos kvantinertial dödräkning är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-a849735fcc6e = Ämnessida: <a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>Föregående</s1>ephemeris

seg-d14a7850df1c = <s1>Nästa</s1>gnss-ins
