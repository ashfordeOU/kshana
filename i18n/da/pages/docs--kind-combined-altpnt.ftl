# docs--kind-combined-altpnt: translations (da)

seg-a83b25413fd8 = Kilde: <c1/>

seg-92b24377c9be = <c1/> (scenarietype)

seg-216efc4e6fba = Scenarietype i motoren v{ $version }, familie <a1>Alternativ PNT uden GPS</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-f496b7f4c63a = Kombineret navigator med tyngdekraft + magnetfelt + terræn uden GPS: tre skalare feltkanaler sammenlagt pr. waypoint for en skarpere positionsbestemmelse af driften (lavere CRLB) end med noget enkelt felt.

seg-670730bd221e = Én kørsel af <c1/> opsummeres som: combined-altpnt | fri inertidrift { "70659" } m | tyngdekraft { "464" } m magnetfelt { "782" } m terræn { "368" } m | FUSED { "365" } m

seg-cf6981466329 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-078f09d100fa = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-557db767b9c3 = Eksemplet <c1/> angiver blandt andet:

seg-df8d5e07e737 = mGal

seg-498b1aea3770 = Diagrammet, som motoren skriver for scenarios/combined-altpnt.toml, type combined-altpnt

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-0df60ac6343f = <b>MODELLED</b> Tyngdekraftskortmatchning, terrænreferenceret (TERCOM/SITAN), magnetisk anomali. Uafhængig reference (InternalConsistency): IGRF-14-koefficienter; matched-filter-CRLB fra grundprincipper. Feltet i benchmarken med reelt tyngdefelt er eksternt kontrolleret (række 'Gravity-anomaly synthesis from a spherical-harmonic model'), men dens navigationsudfald har ingen ekstern uafhængig reference

seg-d776abd5691c = Alternativ / komplementær PNT er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familieside: <a1>Alternativ PNT uden GPS</a1>

seg-49efcd2ced81 = <s1>Forrige</s1>clock

seg-f2ccea3bb03e = <s1>Næste</s1>conflict-resilience
