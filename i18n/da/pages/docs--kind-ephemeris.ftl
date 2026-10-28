# docs--kind-ephemeris: translations (da)

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-c33e3cbba749 = arcsec

seg-11e8c29ecb45 = Scenarietype i motoren v{ $version }, familie <a1>Konstellationer, dækning og geometri</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-a4f1e7d2041e = Familieside: <a1>Konstellationer, dækning og geometri</a1>

seg-670191cf797f = Emneside: <a1>SOLAR-SYSTEM.md</a1>

seg-a3697ad561db = Hz

seg-e388fdc74ffa = Kilde: <c1/>

seg-9860cb88c021 = <c1/> (scenarietype)

seg-24266bc264df = Efemeride og jordspor: propager én satellit (TLE→SGP4 eller analytisk bane) og udsend dens TEME/GCRS-tilstand (position + hastighed), ITRF/ECEF-position, WGS-84-subsatellitbredde/-længde/-højde og pr. skridt stationens az/el/afstand + afstandsrate (Doppler). Satellitten kommer fra en <c1/> eller fra en analytisk <c2/> med dens <c3/> (en <c4/> vinder, når begge er angivet); med en <c5/> tilsidesætter en <c6/> TLE'ens egen epoke som t = { "0" }.

seg-02f2745e0550 = Én kørsel af <c1/> opsummeres som: scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | højde { "419" }–{ "434" } km | |bredde| ≤ { "51.8" }° | hastighed { "7653" }–{ "7661" } m/s | maks. el { "25.7" }° peak-Doppler { "34.3" } kHz

seg-2ce1ab71e2cc = Obligatoriske felter: <c1/>

seg-21dc45b3de59 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-cda81cdb3607 = Eksemplet <c1/> angiver blandt andet:

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = day

seg-0fd3c58fde09 = Diagrammet, som motoren skriver for scenarios/ephemeris.toml, scenarietype ephemeris

seg-d291f20074f0 = <b>VALIDATED</b> Jordens rotation ud fra en todelt juliansk UT1-dato på banestien, så den jordfaste position bevarer det mikrosekund, som en enkelt f64-dato mister (omkring { "3e-9" } rad ved { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventionen, på de to dele), cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF + perturbationer, batch/sekventiel OD. Uafhængig reference (ExternalDataset): AIAA 2006-6753 SGP4-verifikationsvektorer

seg-7cf505668c3c = <b>VALIDATED</b> IAU 2006/2000A-præcession-nutation, CIO GCRS↔ITRS, tidsskalaer med skudsekunder. Uafhængig reference (ExternalDataset): IAU SOFA / ERFA-referencevektorer; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-f19ce44dc0c0 = Emneside: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>Forrige</s1>eo-radiometry

seg-971864553611 = <s1>Næste</s1>fusion
