# docs--kind-orbit: translations (nb)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenariotype i motoren v{ $version }, familie <a1>Konstellasjoner, dekning og geometri</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-a4f1e7d2041e = Familieside: <a1>Konstellasjoner, dekning og geometri</a1>

seg-be831b52a339 = og { "4" } til i matrisen.

seg-a8d92406e428 = Optisk gitterklokke med strontium, mål for bruk i rommet sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifisert/Hadamard-avvik + identifikasjon av potenslov-støy med χ²-konfidensintervaller. Uavhengig referanse (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-referanseavvik på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Lukket form for vekst i glidefeil + holdover-til-terskel; kvantklokkeklasser. Uavhengig referanse (ReferenceImpl): Rekursjon over kovariansen i flere trinn i clock_state (kontroll mot samme kodebase); kjernen for glidevarians og invertering av holdover er eksternt validert mot scipy (se «Clock-holdover coast-variance & threshold inversion»). Tallene for holdover med rød-støy-gulv per klasse forblir MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-klokke, Joseph-stabilisert. Uavhengig referanse (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan-blokkmatrisen { "1978" } — en uavhengig referanseimplementering som gjengir hele banen til Kshanas filter. Konsistens på tvers av implementeringer: klokkefysikken / Allan-kalibreringen er ikke eksternt validert, så dette forblir MODELLED. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): på IGS final { "30" } s-klokker fra { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Klokkestøttet χ², RAIM, AGC, SQM sammensatt per epoke til en sikkerhetskvalitetsmåling. Uavhengig referanse (ExternalDataset): TEXBAT-scenarioparametere (Humphreys { "2012" }) — karakterisering, ikke fastlåste vektorer. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): på JammerTest { "2024" } (Bleik; GPL-3.0-data) utløste monitorene på observabelnivå (klokkestøttet kjikvadrat, RAIM, løsningssvikt) ingen alarm innen { "10" } s av noen av de { "8" } evaluerbare publiserte spoofing-starttidspunktene (der vinduet før start var rent, kom den første alarmen { "10.2" } til { "39" } s etter pu

seg-e12f672ae71d = Klokkens holdover uten GNSS er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Tilstandsestimering for klokken om bord er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Spoofing-deteksjon er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-d291f20074f0 = <b>VALIDATED</b> Jordrotasjon fra en todelt UT1-juliansk dato på banestien, slik at den jordfaste posisjonen beholder mikrosekundet som en enkelt f64-dato mister (omtrent { "3e-9" } rad nær { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konvensjonen, på de to delene), cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP fra siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-oppdeling. Uavhengig referanse (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, uavhengig bibliotek, samsvarte til { "1e-6" } relativt

seg-53a78e98af12 = Temaside: <a1>SKYLINE.md</a1>

seg-ae15d15bf151 = Temaside: <a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = { "7" } medfølgende scenarioer bruker denne typen; de andre ligger i <a1><c1/></a1>.

seg-0e3518dc3ddb = Kilde: <c1/>

seg-1428025a91e1 = <c1/> (scenariotype)

seg-cb4262b66b8f = GNSS-tilgjengelighet og DOP fra en banekonstellasjon (Walker / TLE / RINEX).

seg-97680b4587c8 = En kjøring av <c1/> oppsummeres slik: scenario bffc887db977 | 77/361 samples GNSS-nominal | best PDOP { "2.53" } pos 2.53m | quantum holdover 0s p95 6.49e-5ns integrity { "1.000" } security n/a (no attack) | classical holdover 0s p95 25.0ns integrity { "1.000" } security n/a (no attack)

seg-b3a080b98bd9 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c818cc4f87da = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-364139ff447d = Eksempelet <c1/> angir blant annet:

seg-d5063dda3971 = Microchip SA.45s / SA65 brikkeskala atomklokke, sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = Diagrammet motoren skriver for scenarios/orbit-rinex.toml, type orbit

seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP fra siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-oppdeling Tester: <a1>dop_reference.rs</a1>.

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry og check: en Monte Carlo med seed (N = { "20,000" } epoker per geometri, sigma = { "1.5" } m, ChaCha8-seed { "36" } + i) av motorens egen iterative minste kvadraters posisjonsbestemmelse (pvt::solve_spp, enhetsvekter, løst fra den sanne posisjonen) på Tester: <a1>uere_dop_monte_carlo.rs</a1>.

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: den geodetiske (WGS-84) azimuten og elevasjonen til en satellitt fra et bakkested, en tabell for azimut-/elevasjonsmaske lineært interpolert i azimut med omslag ved { "360" } deg, det synlige settet el Tester: <a1>skyline_orekit_oracle.rs</a1>.

seg-d86884be3f98 = <s1>Forrige</s1>optical-atmosphere

seg-da202333ae8d = <s1>Neste</s1>passes
