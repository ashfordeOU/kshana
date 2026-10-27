# docs--kind-mars-pnt: translations (da)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Scenarietype i motoren v{ $version }, familie <a1>Konstellationer, dækning og geometri</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-45259ad33a01 = <b>MODELLED</b> Typen <c1/>: en orbiter eller en lander på overfladen omkring et legeme valgt ved navn navigerer med envejs-pseudoafstande fra en Walker-navigationskonstellation omkring legemet (tolegemebaner med legemets sekulære J2-drift, et ukendt bruger-u

seg-a4f1e7d2041e = Familieside: <a1>Konstellationer, dækning og geometri</a1>

seg-670191cf797f = Emneside: <a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-ur, Joseph-stabiliseret. Uafhængig reference (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan { "1978" }-blokmatrixen — en uafhængig referenceimplementering, der gengiver kshanas fulde filterforløb. Konsistens mellem implementeringer: urfysikken / Allan-kalibreringen er ikke eksternt valideret, så dette forbliver MODELLED. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): på IGS final { "30" } s-ure fra { "11" } GPS Blo

seg-8de95b3a9229 = Tilstandsestimering af ombordur er MODELLED, ikke valideret: kontrolleret mod en separat implementering i denne samme kodebase — uafhængig af den enhed, der afprøves, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-3bc1761c76ab = { "3" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-c68502b9d675 = Kilde: <c1/>

seg-46072326d616 = <c1/> (scenarietype)

seg-3f749aef8d89 = PNT til Mars i dybt rum: en simuleret MARCONI-relækonstellation (areostationære + skrå relæer, der udsender enkeltvejs + videresender tovejs til en station i dybt rum) navigerer en referencebruger (transfer | lmo | surface) gennem den fælles estimator med fusion af enkeltvejs/tovejs radiometri. Rapporterer geometri/synlighed pr. epoke, opnået RMS mod referencen og den formelle kovarians (1σ / 3σ position) — et ærligt simuleret kvalitetsmål, IKKE et certificeret beskyttelsesniveau.

seg-0254f9bd0ee6 = Én kørsel af <c1/> opsummeres som: mars-pnt 5aad87fcc94a | lmo user, uso clock | { "5" } relays (mean { "3.1" } in view) | converged pos RMS { "0.25" } m, formal 1σ { "0.31" } m (3σ { "0.93" } m — covariance FoM, not a certified PL) | clock-freq σ { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5a9640a3f9b4 = Eksemplet <c1/> sætter blandt andet:

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = Diagrammet, som motoren skriver for scenarios/mars-pnt-lmo.toml, type mars-pnt

seg-83c3a84f6b98 = <b>VALIDATED</b> Gendan en epoketilstand [r,v] ud fra afstande fra jordstationer via en Gauss–Newton-batch-differentialkorrektor og et sekventielt filter over en tolegemsmodel + J2 som kraftmodel. Uafhængig reference (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — et uafhængigt tredjepartsbibliotek til estimering på en matchet kraftmodel; gendannet epoketilstand + RMS af resten efter tilpasning stemmer til <{ "1e-3" } m uden støj og <{ "3" } m ved et støjgulv på { "5" } m

seg-4be479b81f39 = <s1>Forrige</s1>lunar-vlbi

seg-2854e6a75833 = <s1>Næste</s1>moonlight-service-volume
