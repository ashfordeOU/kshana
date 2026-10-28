# docs--kind-ephemeris: translations (sv)

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-c33e3cbba749 = bågsekunder

seg-11e8c29ecb45 = Scenariotyp i motor v{ $version }, familj <a1>Konstellationer, täckning och geometri</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-a4f1e7d2041e = Familjesida: <a1>Konstellationer, täckning och geometri</a1>

seg-670191cf797f = Ämnessida: <a1>SOLAR-SYSTEM.md</a1>

seg-a3697ad561db = Hz

seg-e388fdc74ffa = Källa: <c1/>

seg-9860cb88c021 = <c1/> (scenario kind)

seg-24266bc264df = Efemerid och markspår: propagera en satellit (TLE→SGP4 eller analytisk bana) och ge dess TEME/GCRS-tillstånd (position + hastighet), ITRF/ECEF-position, WGS-84 sub-satellitens lat/lon/höjd samt stationens az/el/avstånd + avståndshastighet (Doppler) per steg. Satelliten kommer från en <c1/> eller från en analytisk <c2/> med dess <c3/> (en <c4/> har företräde när båda anges); med en <c5/> åsidosätter en <c6/> TLE:ns egen epok som t = { "0" }.

seg-02f2745e0550 = En körning av <c1/> sammanfattas som: scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | speed { "7653" }–{ "7661" } m/s | max el { "25.7" }° peak Doppler { "34.3" } kHz

seg-2ce1ab71e2cc = Obligatoriska fält: <c1/>

seg-21dc45b3de59 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-cda81cdb3607 = Exemplet <c1/> anger bland annat:

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = dygn

seg-0fd3c58fde09 = Diagrammet som motorn skriver för scenarios/ephemeris.toml, kind ephemeris

seg-d291f20074f0 = <b>VALIDATED</b> Jordrotation från ett tvådelat UT1-juliandatum på banvägen, så att den jordfasta positionen behåller den mikrosekund som ett enda f64-datum förlorar (cirka { "3e-9" } rad nära { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventionen, på de två delarna), cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF + störningar, batch-/sekventiell banbestämning. Oracle (ExternalDataset): AIAA 2006-6753 SGP4-verifieringsvektorer

seg-7cf505668c3c = <b>VALIDATED</b> IAU 2006/2000A precession-nutation, CIO GCRS↔ITRS, tidsskalor med skottsekunder. Oracle (ExternalDataset): IAU SOFA / ERFA-referensvektorer; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-f19ce44dc0c0 = Ämnessida: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>Föregående</s1>eo-radiometry

seg-971864553611 = <s1>Nästa</s1>fusion
