# docs--kind-hybrid: translations (nb)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC-datablad sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Temaside: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifisert/Hadamard-avvik + identifikasjon av potenslov-støy med χ²-konfidensintervaller. Uavhengig referanse (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-referanseavvik på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Lukket form for vekst i glidefeil + holdover-til-terskel; kvantklokkeklasser. Uavhengig referanse (ReferenceImpl): Rekursjon over kovariansen i flere trinn i clock_state (kontroll mot samme kodebase); kjernen for glidevarians og invertering av holdover er eksternt validert mot scipy (se «Clock-holdover coast-variance & threshold inversion»). Tallene for holdover med rød-støy-gulv per klasse forblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-klokke, Joseph-stabilisert. Uavhengig referanse (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan-blokkmatrisen { "1978" } — en uavhengig referanseimplementering som gjengir hele banen til Kshanas filter. Konsistens på tvers av implementeringer: klokkefysikken / Allan-kalibreringen er ikke eksternt validert, så dette forblir MODELLED. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): på IGS final { "30" } s-klokker fra { "11" } GPS Blo

seg-e12f672ae71d = Klokkens holdover uten GNSS er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Tilstandsestimering for klokken om bord er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-deteksjon er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-7b2721b7588d = Scenariotype i motoren v{ $version }, familie <a1>Treghets-, fusjons- og kvantesensorer</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-dba20bb12cda = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> Ett stablet Kalman-filter over posisjon, hastighet, klokkefase og frekvens, matet med pseudoavstander som kobler posisjon og klokke (oppdateringer på Joseph-form som bærer kryss-kovariansen); en 1-DOF-variant utvidet med en konstant akselerometerbias-s Tester: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Kaldatom-interferometer-akselerometer fra grunnprinsipper (k_eff·T², QPN). Uavhengig referanse (ExternalDataset): Publiserte numeriske vektorer fra primærartikler om CAI (Cheinet { "2008" } overføringsfunksjon; Peters/Freier-følsomhet): k_eff·T² stemte nøyaktig, skuddstøy-ASD et ensidig gulv innenfor ~{ "2" }× av hvert publiserte instrument (virkelige enheter har teknisk støy over kvantegulvet). Et intervall, ikke likhet. { "0.30" } runde { "2" } (forhåndsregistrert fcb9ac64), et funn (forblir MODELLED): rotasjonsstøyen kun fra QPN mot den målte Gauguet et al.

seg-9955b1b1c018 = Ytelsen til kvanteinertisensorer er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Robustheten til kvanteinertisk dødregning er MODELLED, ikke validert: kontrollert mot en separat implementasjon i den samme kodebasen, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Treghets-, fusjons- og kvantesensorer</a1>

seg-d91dc5633e67 = Kilde: <c1/>

seg-3b43d9c5624d = <c1/> (scenariotype)

seg-22cd963c7042 = Hybrid PNT-capstone: klokke + IMU + støtte fra tidsoverføring.

seg-166be08d5276 = Én kjøring av <c1/> oppsummeres slik: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = Valgfrie felt: ingen

seg-f33278986879 = Eksemplet <c1/> setter blant annet:

seg-7bebd09c614b = Kvartsakselerometer i navigasjonsklassen (Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Exail hybrid kvanteakselerometer-triade, biasstabilitet { "5.8" }

seg-49bff8dc860e = Kvartsakselerometer i navigasjonsklassen (H

seg-52378a7b074c = Diagrammet motoren skriver for scenarios/hybrid-pnt.toml, typen hybrid

seg-a1810bbca337 = <b>MODELLED</b> Toveis/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→avstand. Uavhengig referanse (ExternalDataset): Sagnac-størrelsen kontrollert mot en autoritativ PUBLISERT VERDI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), ligning { "1.29" }: en østvendt omrunding av ekvator gir { "207.4" } ns (2ωA_E/c²); kshana gjengir { "207.386" } ns. Uavhengig bekreftet av RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometrien. Den sammensatte BIPM TWSTFT-transponderen/common-view/

seg-a8beb8dfc757 = Feilbudsjettering for tidsoverføring er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-a9c56fc9608a = Temaside: <a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>Forrige</s1>hybrid-ukf

seg-53b95026bf54 = <s1>Neste</s1>impairment-eval
