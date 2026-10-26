# docs--kind-mars-pnt: translations (nb)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenariotype i motoren v{ $version }, familie <a1>Konstellasjoner, dekning og geometri</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-45259ad33a01 = <b>MODELLED</b> Typen <c1/>: en orbiter eller en landingsfarkost på overflaten rundt et legeme valgt ved navn navigerer med enveis pseudoavstander fra en Walker-navigasjonskonstellasjon rundt legemet (todelslegeme-baner med legemets sekulære J2-drift, en ukjent bruker-c

seg-a4f1e7d2041e = Familieside: <a1>Konstellasjoner, dekning og geometri</a1>

seg-670191cf797f = Temaside: <a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-klokke, Joseph-stabilisert. Uavhengig referanse (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan-blokkmatrisen { "1978" } — en uavhengig referanseimplementering som gjengir hele banen til Kshanas filter. Konsistens på tvers av implementeringer: klokkefysikken / Allan-kalibreringen er ikke eksternt validert, så dette forblir MODELLED. { "0.30" } ekstern sammenligning, et funn (forblir MODELLED): på IGS final { "30" } s-klokker fra { "11" } GPS Blo

seg-8de95b3a9229 = Tilstandsestimering for klokken om bord er MODELLED, ikke validert: kontrollert mot en separat implementering i denne samme kodebasen — uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-c68502b9d675 = Kilde: <c1/>

seg-46072326d616 = <c1/> (scenariotype)

seg-3f749aef8d89 = PNT for Mars i dypt rom: en simulert MARCONI-relékonstellasjon (areostasjonære + inklinerte releer som sender énveis + videresender toveis til en stasjon i dypt rom) navigerer en referansebruker (transfer | lmo | surface) gjennom den felles estimatoren for énveis/toveis radiometrisk fusjon. Rapporterer geometri/synlighet per epoke, oppnådd RMS mot referansen og den formelle kovariansen (1σ / 3σ posisjon) — et ærlig simulert kvalitetsmål, IKKE et sertifisert beskyttelsesnivå.

seg-0254f9bd0ee6 = Én kjøring av <c1/> oppsummeres slik: mars-pnt 5aad87fcc94a | lmo-bruker, uso-klokke | { "5" } releer (gjennomsnittlig { "3.1" } i sikte) | konvergert pos-RMS { "0.25" } m, formell 1σ { "0.31" } m (3σ { "0.93" } m — kovarians-kvalitetsmål, ikke et sertifisert PL) | klokkefrekvens-σ { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5a9640a3f9b4 = Eksempelet <c1/> setter blant annet:

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = Diagrammet motoren skriver for scenarios/mars-pnt-lmo.toml, type mars-pnt

seg-83c3a84f6b98 = <b>VALIDATED</b> Gjenfinn en epoketilstand [r,v] fra avstander fra bakkestasjoner via en batch-differensialkorrektor med Gauss–Newton og et sekvensielt filter, over en kraftmodell med to legemer + J2. Uavhengig referanse (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — et uavhengig estimeringsbibliotek fra tredjepart på en tilsvarende kraftmodell; gjenfunnet epoketilstand + RMS for residualer etter tilpasningen stemmer til <{ "1e-3" } m uten støy og <{ "3" } m ved et støygulv på { "5" } m

seg-4be479b81f39 = <s1>Forrige</s1>lunar-vlbi

seg-2854e6a75833 = <s1>Neste</s1>moonlight-service-volume
