# docs--kind-mars-pnt: translations (sv)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenariotyp i motor v{ $version }, familj <a1>Konstellationer, täckning och geometri</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-45259ad33a01 = <b>MODELLED</b> Typen <c1/>: en omloppsfarkost eller en ytlandare kring en kropp som väljs med namn navigerar med enkelriktade pseudoavstånd från en Walker-navigationskonstellation kring kroppen (tvåkroppsbanor med kroppens sekulära J2-drift, en okänd användarklocka

seg-a4f1e7d2041e = Familjesida: <a1>Konstellationer, täckning och geometri</a1>

seg-670191cf797f = Ämnessida: <a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> Kalmanklocka med 3 tillstånd (fas/frekvens/drift) enligt van Loan, Joseph-stabiliserad. Oberoende referens (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm och Q via blockmatrisen av Van Loan { "1978" } — en oberoende referensimplementering som reproducerar kshanas hela filterbana. Konsistens mellan implementeringar: klockfysiken / Allan-kalibreringen är inte externt validerade, så den här förblir MODELLED. { "0.30" } extern jämförelse, ett fynd (förblir MODELLED): på IGS-slutliga { "30" } s-klockor för { "11" } GPS Blo

seg-8de95b3a9229 = Skattning av klocktillstånd ombord är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-c68502b9d675 = Källa: <c1/>

seg-46072326d616 = <c1/> (scenariotyp)

seg-3f749aef8d89 = PNT i djupa rymden vid Mars: en simulerad MARCONI-relästjärnbild (areostationära + inklinerade reläer som sänder enkelriktat + vidarebefordrar tvåvägs till en djuprymdsstation) navigerar en referensanvändare (transfer | lmo | surface) genom den gemensamma radiometriska fusionsestimatorn för enkelriktat/tvåvägs. Redovisar geometri/sikt per epok, uppnådd RMS mot referens och den formella kovariansen (1σ / 3σ position) — ett ärligt simulerat kvalitetsmått, INTE en certifierad skyddsnivå.

seg-0254f9bd0ee6 = En körning av <c1/> sammanfattas som: mars-pnt 5aad87fcc94a | lmo user, uso clock | { "5" } relays (mean { "3.1" } in view) | converged pos RMS { "0.25" } m, formal 1σ { "0.31" } m (3σ { "0.93" } m — covariance FoM, not a certified PL) | clock-freq σ { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5a9640a3f9b4 = Exemplet <c1/> anger bland annat:

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = Diagrammet som motorn skriver för scenarios/mars-pnt-lmo.toml, typ mars-pnt

seg-83c3a84f6b98 = <b>VALIDATED</b> Återskapa ett epoktillstånd [r,v] från markstationsavstånd med en differentialkorrektor med Gauss–Newton-satser och ett sekventiellt filter, över en tvåkropps+J2-kraftmodell. Oberoende referens (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — ett oberoende estimeringsbibliotek från tredje part på en matchad kraftmodell; återskapat epoktillstånd + RMS för resterna efter anpassning ligger inom <{ "1e-3" } m utan brus och <{ "3" } m vid ett brusgolv på { "5" } m

seg-4be479b81f39 = <s1>Föregående</s1>lunar-vlbi

seg-2854e6a75833 = <s1>Nästa</s1>moonlight-service-volume
