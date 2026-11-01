# docs--kind-fusion: translations (nb)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC-datablad sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-f4cf8b629797 = Temaside: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = og { "4" } til i matrisen.

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifisert/Hadamard-avvik + identifikasjon av potenslov-støy med χ²-konfidensintervaller. Uavhengig referanse (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-referanseavvik på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Lukket form for vekst i glidefeil + holdover-til-terskel; kvantklokkeklasser. Uavhengig referanse (ReferenceImpl): Rekursjon over kovariansen i flere trinn i clock_state (kontroll mot samme kodebase); kjernen for glidevarians og invertering av holdover er eksternt validert mot scipy (se «Clock-holdover coast-variance & threshold inversion»). Tallene for holdover med rød-støy-gulv per klasse forblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-klokke, Joseph-stabilisert. Uavhengig referanse (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan-blokkmatrisen { "1978" } — en uavhengig referanseimplementering som gjengir hele banen til Kshanas filter. Konsistens på tvers av implementeringer: klokkefysikken / Allan-kalibreringen er ikke eksternt validert, så dette forblir MODELLED. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): på IGS final { "30" } s-klokker fra { "11" } GPS Blo

seg-e12f672ae71d = Klokkens holdover uten GNSS er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Tilstandsestimering for klokken om bord er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-deteksjon er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-4de09fe367df = Kilde: <c1/>

seg-53e498cffeba = <c1/> (scenariotype)

seg-7b2721b7588d = Scenariotype i motoren v{ $version }, familie <a1>Treghets-, fusjons- og kvantesensorer</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-ec26df467b88 = Felles Kalman-sensorfusjon for PNT over de samme hybride inndataene.

seg-25708bf88728 = Én kjøring av <c1/> oppsummeres slik: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

seg-dba20bb12cda = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3d5cae65f093 = Valgfrie felt: <c1/>

seg-56bca36cabba = Eksemplet <c1/> setter blant annet:

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = Kvartsakselerometer i navigasjonsklassen; illustrativ støy-dr

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = Kaldatom-akselerometer, lav velocity-random-walk ved lang tau;

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = Kvartsakselerometer i navigasjonsklassen; i

seg-c8a1c797f4b1 = Diagrammet motoren skriver for scenarios/fusion-pnt.toml, typen fusion

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-46c0903ff7b5 = <b>VALIDATED</b> Gjenvinn en epoketilstand [r,v] fra avstandsmålinger til bakkestasjoner med en Gauss–Newton-batchkorrektor og et sekvensielt filter, over en kraftmodell med todelslegeme + J2. Tester: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

seg-44f77aaf9d7e = <b>MODELLED</b> Feiltilstands-EKF over { "15" } INS-tilstander, en klokke med to tilstander i mottakeren og én flytende bærebølgeflertydighet per sporet satellitt; pseudoavstand, bærebølgefase og valgfri avstandsrate fra en SGP4 Walker-konstellasjon (lystid og Sagnac), Klobuchar an Tester: <a1>fusion_carrier_tc.rs</a1>.

seg-509f93c7e9ce = <b>MODELLED</b> Tre gnss-ins-scenarioer på banebiblioteket (et fartøy som slingrer med { "8" } m/s og et avbrudd på fem minutter; et tog gjennom en skjæring med to satellitter og en tunnel; et fly der avbruddet dekker en 25 graders krengt sving) og pakkens valgfrie Tester: <a1>gnss_ins_packs.rs</a1>.

seg-e0633b308e4e = <b>MODELLED</b> Ett stablet Kalman-filter over posisjon, hastighet, klokkefase og frekvens, matet med pseudoavstander som kobler posisjon og klokke (oppdateringer på Joseph-form som bærer kryss-kovariansen); en 1-DOF-variant utvidet med en konstant akselerometerbias-s Tester: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Kaldatom-interferometer-akselerometer fra grunnprinsipper (k_eff·T², QPN). Uavhengig referanse (ExternalDataset): Publiserte numeriske vektorer fra primærartikler om CAI (Cheinet { "2008" } overføringsfunksjon; Peters/Freier-følsomhet): k_eff·T² stemte nøyaktig, skuddstøy-ASD et ensidig gulv innenfor ~{ "2" }× av hvert publiserte instrument (virkelige enheter har teknisk støy over kvantegulvet). Et intervall, ikke likhet. { "0.30" } runde { "2" } (forhåndsregistrert fcb9ac64), et funn (forblir MODELLED): rotasjonsstøyen kun fra QPN mot den målte Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Sammensatt posisjonsbudsjett over holdover fra bias + skalafaktor + VRW + stabilitetsforfall. Uavhengig referanse (ReferenceImpl): Uavhengig numpy Monte Carlo-SDE-integrasjon av dobbeltintegrert hvit akselerasjonsstøy (validerer den analytiske VRW-variansen med en genuint uavhengig algoritme) + et publisert Groves { "2013" }-verdianker for bias-/skalafaktorleddene; CAI-enhetenes tall kvantifiserer partnerens maskinvare og forblir MODELLED

seg-9955b1b1c018 = Ytelsen til kvanteinertisensorer er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Robustheten til kvanteinertisk dødregning er MODELLED, ikke validert: kontrollert mot en separat implementasjon i den samme kodebasen, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Treghets-, fusjons- og kvantesensorer</a1>

seg-a849735fcc6e = Temaside: <a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>Forrige</s1>ephemeris

seg-d14a7850df1c = <s1>Neste</s1>gnss-ins
