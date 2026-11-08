# docs--kind-hybrid: translations (sv)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC-datablad sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Ämnessida: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifierad/Hadamard-deviation + identifiering av potenslagsbrus med χ²-konfidensintervall. Oberoende referens (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32 referensdeviationer på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Glidfelstillväxt i sluten form + holdover till tröskel; kvantklockeklasser. Oberoende referens (ReferenceImpl): Flerstegsrekursion för clock_state-kovarians (korskontroll i samma kodbas); den underliggande kärnan för glidvarians och holdover-inversion är externt validerad mot scipy (se 'Clock-holdover coast-variance & threshold inversion'). Holdover-talen för rödbrusgolvet per klass förblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Kalmanklocka med 3 tillstånd (fas/frekvens/drift) enligt van Loan, Joseph-stabiliserad. Oberoende referens (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm och Q via blockmatrisen av Van Loan { "1978" } — en oberoende referensimplementering som reproducerar kshanas hela filterbana. Konsistens mellan implementeringar: klockfysiken / Allan-kalibreringen är inte externt validerade, så den här förblir MODELLED. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): på IGS-slutliga { "30" } s-klockor för { "11" } GPS Blo

seg-e12f672ae71d = Klockans holdover i GNSS-nekade miljöer är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Skattning av klocktillstånd ombord är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-detektion är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan sätts ihop av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-dba20bb12cda = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> Ett staplat Kalman-filter över position, hastighet, klockfas och frekvens som matas med pseudoavstånd som kopplar position och klocka (Joseph-uppdateringar som bär korskovariansen); en 1-DOF-variant utökad med en konstant accelerometerbias s Tests: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Accelerometer med kallatomsinterferometer från grundprinciper (k_eff·T², QPN). Oracle (ExternalDataset): Publicerade numeriska vektorer från primärartiklar om CAI (Cheinet { "2008" } överföringsfunktion; Peters/Freier känslighet): k_eff·T² stämde exakt, skottbrus-ASD ett ensidigt golv inom ~{ "2" }× av varje publicerat instrument (verkliga enheter har tekniskt brus över kvantgolvet). Ett intervall, inte paritet. { "0.30" } round { "2" } (pre-registered fcb9ac64), ett fynd (förblir MODELLED): det rena QPN-rotationsbruset mot det uppmätta Gauguet et al.

seg-9955b1b1c018 = Prestanda hos kvantinertialsensorer är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Motståndskraft hos kvantinertial dödräkning är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-d91dc5633e67 = Källa: <c1/>

seg-3b43d9c5624d = <c1/> (scenario kind)

seg-22cd963c7042 = Hybrid PNT-slutsten: klocka + IMU + stöd från tidsöverföring.

seg-166be08d5276 = En körning av <c1/> sammanfattas som: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = Valfria fält: inga

seg-f33278986879 = Exemplet <c1/> anger bland annat:

seg-7bebd09c614b = Navigation-grade quartz accelerometer (Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Exail hybrid quantum accelerometer triad, bias stability { "5.8" }

seg-49bff8dc860e = Navigation-grade quartz accelerometer (H

seg-52378a7b074c = Diagrammet som motorn skriver för scenarios/hybrid-pnt.toml, kind hybrid

seg-a1810bbca337 = <b>MODELLED</b> Tvåvägs/TWSTFT (Sagnac), GNSS common-view, PPP; länkjitter→avstånd. Oracle (ExternalDataset): Sagnac-storleken kontrollerad mot ett auktoritativt PUBLICERAT VÄRDE — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: ett ekvatorialt varv åt öster ackumulerar { "207.4" } ns (2ωA_E/c²); kshana återskapar { "207.386" } ns. Oberoende bekräftat av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bär samma 2Aω/c²-geometri. Den sammansatta BIPM TWSTFT-transpondern/common-view/

seg-a8beb8dfc757 = Felbudgetering för tidsöverföring är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-a9c56fc9608a = Ämnessida: <a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>Föregående</s1>hybrid-ukf

seg-53b95026bf54 = <s1>Nästa</s1>impairment-eval
