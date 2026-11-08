# docs--kind-hybrid: translations (da)

seg-03442e4be82d = Datablad for Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Emneside: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modificeret/Hadamard-afvigelse + identifikation af potenslovsstøj med χ²-konfidensintervaller. Uafhængig reference (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-referenceafvigelser på NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Lukket form for vækst i fejl under frit løb + holdover til tærskel; kvanteurklasser. Uafhængig reference (ReferenceImpl): Flertrins clock_state-kovariansrekursion (krydskontrol i samme kodebase); selve kernen for frit-løb-varians og holdover-inversion er eksternt valideret mod scipy (se 'Clock-holdover coast-variance & threshold inversion'). Tallene for holdover pr. klasse ved rødstøjsgulvet forbliver MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilstands (fase/frekvens/drift) van Loan-Kalman-ur, Joseph-stabiliseret. Uafhængig reference (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), med F via scipy.linalg.expm og Q via Van-Loan { "1978" }-blokmatrixen — en uafhængig referenceimplementering, der gengiver kshanas fulde filterforløb. Konsistens mellem implementeringer: urfysikken / Allan-kalibreringen er ikke eksternt valideret, så dette forbliver MODELLED. { "0.30" } ekstern sammenligning, et fund (forbliver MODELLED): på IGS final { "30" } s-ure fra { "11" } GPS Blo

seg-e12f672ae71d = Ur-holdover i GNSS-nægtede miljøer er MODELLED, ikke valideret: kontrolleret mod en separat implementering i denne samme kodebase — uafhængig af den enhed, der afprøves, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Tilstandsestimering af ombordur er MODELLED, ikke valideret: kontrolleret mod en separat implementering i denne samme kodebase — uafhængig af den enhed, der afprøves, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detektion af spoofing er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-dba20bb12cda = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> Ét stablet Kalman-filter over position, hastighed, urfase og frekvens, fodret med pseudoafstande, der kobler position og ur (Joseph-form-opdateringer, der bærer krydskovariansen); en 1-DOF-variant udvidet med en konstant accelerometer-bias s Tests: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Koldatom-interferometer-accelerometer ud fra grundprincipper (k_eff·T², QPN). Uafhængig reference (ExternalDataset): Offentliggjorte numeriske vektorer fra CAI-primærartikler (Cheinet { "2008" }, overføringsfunktion; Peters/Freier, følsomhed): k_eff·T² stemte præcist, skudstøjens ASD et ensidet gulv inden for ca. { "2" }× af hvert offentliggjort instrument (rigtige enheder har teknisk støj over kvantegulvet). Et interval, ikke paritet. { "0.30" } runde { "2" } (præregistreret fcb9ac64), et fund (forbliver MODELLED): rotationsstøjen med kun QPN mod den målte Gauguet et al.

seg-9955b1b1c018 = Kvanteinertial sensorydelse er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Robusthed for kvanteinertial dødregning er MODELLED, ikke valideret: kontrolleret mod en separat implementering i samme kodebase, uafhængig af den enhed, der testes, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-d91dc5633e67 = Kilde: <c1/>

seg-3b43d9c5624d = <c1/> (scenarietype)

seg-22cd963c7042 = Hybrid PNT-slutsten: ur + IMU + støtte fra tidsoverførsel.

seg-166be08d5276 = Én kørsel af <c1/> opsummeres sådan: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = Valgfrie felter: ingen

seg-f33278986879 = Eksemplet <c1/> angiver blandt andet:

seg-7bebd09c614b = Kvartsaccelerometer i navigationsklasse (Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Exail hybrid kvanteaccelerometer-triade, biasstabilitet { "5.8" }

seg-49bff8dc860e = Kvartsaccelerometer i navigationsklasse (H

seg-52378a7b074c = Diagrammet, som motoren skriver for scenarios/hybrid-pnt.toml, scenarietype hybrid

seg-a1810bbca337 = <b>MODELLED</b> Tovejs/TWSTFT (Sagnac), GNSS common-view, PPP; linkjitter→afstand. Uafhængig reference (ExternalDataset): Sagnac-størrelsen kontrolleret mod en autoritativ OFFENTLIGGJORT VÆRDI: N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), ligning { "1.29" }: en omsejling mod øst langs ækvator giver { "207.4" } ns (2ωA_E/c²); kshana gengiver { "207.386" } ns. Uafhængigt bekræftet af RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), som bærer den samme 2Aω/c²-geometri. Det sammensatte BIPM TWSTFT-transponder/common-view/

seg-a8beb8dfc757 = Fejlbudgettering for tidsoverførsel er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-a9c56fc9608a = Emneside: <a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>Forrige</s1>hybrid-ukf

seg-53b95026bf54 = <s1>Næste</s1>impairment-eval
