# docs--kind-ephemeris: translations (nb)

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-c33e3cbba749 = buesekunder

seg-11e8c29ecb45 = Scenariotype i motoren v{ $version }, familie <a1>Konstellasjoner, dekning og geometri</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-a4f1e7d2041e = Familieside: <a1>Konstellasjoner, dekning og geometri</a1>

seg-670191cf797f = Temaside: <a1>SOLAR-SYSTEM.md</a1>

seg-a3697ad561db = Hz

seg-e388fdc74ffa = Kilde: <c1/>

seg-9860cb88c021 = <c1/> (scenariotype)

seg-24266bc264df = Efemeride og bakkespor: propager én satellitt (TLE→SGP4 eller analytisk bane) og send ut dens TEME/GCRS-tilstand (posisjon + hastighet), ITRF/ECEF-posisjon, WGS-84-subsatellittens bredde/lengde/høyde, og per steg stasjonens az/el/avstand + avstandshastighet (Doppler). Satellitten kommer fra en <c1/> eller fra en analytisk <c2/> med sin <c3/> (en <c4/> vinner når begge er oppgitt); med en <c5/> overstyrer en <c6/> TLE-ens egen epoke som t = { "0" }.

seg-02f2745e0550 = Én kjøring av <c1/> oppsummeres som: scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | speed { "7653" }–{ "7661" } m/s | max el { "25.7" }° peak Doppler { "34.3" } kHz

seg-2ce1ab71e2cc = Obligatoriske felt: <c1/>

seg-21dc45b3de59 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-cda81cdb3607 = Eksemplet <c1/> setter blant annet:

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = dag

seg-0fd3c58fde09 = Diagrammet motoren skriver for scenarios/ephemeris.toml, typen ephemeris

seg-d291f20074f0 = <b>VALIDATED</b> Jordrotasjon fra en todelt UT1-juliansk dato på banestien, slik at den jordfaste posisjonen beholder mikrosekundet som en enkelt f64-dato mister (omtrent { "3e-9" } rad nær { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konvensjonen, på de to delene), cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF + perturbasjoner, batch-/sekvensiell banebestemmelse. Uavhengig referanse (ExternalDataset): AIAA 2006-6753 SGP4-verifikasjonsvektorer

seg-7cf505668c3c = <b>VALIDATED</b> IAU 2006/2000A presesjon-nutasjon, CIO GCRS↔ITRS, tidsskalaer med skuddsekund. Uavhengig referanse (ExternalDataset): IAU SOFA / ERFA-referansevektorer; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-f19ce44dc0c0 = Temaside: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>Forrige</s1>eo-radiometry

seg-971864553611 = <s1>Neste</s1>fusion
