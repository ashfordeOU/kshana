# docs--kind-clock: translations (nb)

seg-debc2f07db78 = true

seg-33555d61ddc6 = Kilde: <c1/>

seg-618393657d01 = <c1/> (scenariotype)

seg-c61e88721556 = Scenariotype i motoren v{ $version }, familie <a1>Klokker, tidssynkronisering og holdover</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-78cba87823f7 = Klokkens holdover mot spesifikasjonen; valgfritt Monte Carlo-ensemble (runs > { "1" }).

seg-dd2ad570a6c9 = Én kjøring av <c1/> oppsummeres som: scenario 91d2b6d10d14 | { "200" } runs | quantum holdover 6600s [6600-6600] p95 8.78e-4ns security n/a (no attack) | classical holdover 844s [220-2130] p95 167.0ns security n/a (no attack)

seg-51820163de28 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-80fe14eb5e79 = Valgfrie felt: <c1/>, <c2/>

seg-807e7c5a2565 = Eksempelet <c1/> setter blant annet:

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC-datablad sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Optisk gitterklokke med strontium, mål for bruk i rommet sigma_y

seg-0cd8dc81045c = { "4" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-cb0b7da83f5c = Diagrammet motoren skriver for scenarios/clock-ensemble.toml, typen clock

seg-5b3dbe0aed82 = <b>MODELLED</b> Den valgfrie [integrity]-delen av typen clock (clock_integrity::run): fra et oppgitt sted og konstellasjonsforhåndsinnstillinger (geometry::sky_geometry), ved hver integritetsepoke mens GNSS-tidslinjen ikke er avvist, øyeblikks-RAIM (raim::snapshot_ Tester: <a1>clock_integrity.rs</a1>.

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: ett parserlag som gjør en RINEX-klokkefil (AS/AR-poster for én navngitt klokke, versjoner { "2" } og { "3.00" } til { "3.04" }), en ASCII-fase- eller frekvenslogg i TimeLab-stil, eller en tidsstempel- eller intervalllogg fra TAPR TICC om til en enhetlig pha Tester: <a1>clock_log_allantools.rs</a1>.

seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input med formatene ptp4l, phc2sys, ts2phc, chrony-tracking og chrony-statistics: den loggede offseten fra en linuxptp-servolinje (ns, linjens eget tidsstempel i klammer, avlesninger før servoen først rapporterer s2 utelatt a

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifisert/Hadamard-avvik + identifikasjon av potenslov-støy med χ²-konfidensintervaller. Uavhengig referanse (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-referanseavvik på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Lukket form for vekst i glidefeil + holdover-til-terskel; kvantklokkeklasser. Uavhengig referanse (ReferenceImpl): Rekursjon over kovariansen i flere trinn i clock_state (kontroll mot samme kodebase); kjernen for glidevarians og invertering av holdover er eksternt validert mot scipy (se «Clock-holdover coast-variance & threshold inversion»). Tallene for holdover med rød-støy-gulv per klasse forblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-klokke, Joseph-stabilisert. Uavhengig referanse (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan-blokkmatrisen { "1978" } — en uavhengig referanseimplementering som gjengir hele banen til Kshanas filter. Konsistens på tvers av implementeringer: klokkefysikken / Allan-kalibreringen er ikke eksternt validert, så dette forblir MODELLED. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): på IGS final { "30" } s-klokker fra { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Klokkestøttet χ², RAIM, AGC, SQM sammensatt per epoke til en sikkerhetskvalitetsmåling. Uavhengig referanse (ExternalDataset): TEXBAT-scenarioparametere (Humphreys { "2012" }) — karakterisering, ikke fastlåste vektorer. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): på JammerTest { "2024" } (Bleik; GPL-3.0-data) utløste monitorene på observabelnivå (klokkestøttet kjikvadrat, RAIM, løsningssvikt) ingen alarm innen { "10" } s av noen av de { "8" } evaluerbare publiserte spoofing-starttidspunktene (der vinduet før start var rent, kom den første alarmen { "10.2" } til { "39" } s etter pu

seg-e12f672ae71d = Klokkens holdover uten GNSS er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Tilstandsestimering for klokken om bord er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-deteksjon er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Familieside: <a1>Klokker, tidssynkronisering og holdover</a1>

seg-ee7dd15019d0 = Temaside: <a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = Temaside: <a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>Forrige</s1>cislunar-observability

seg-aba9395185fa = <s1>Neste</s1>combined-altpnt
