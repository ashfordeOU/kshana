# docs--kind-ephemeris: translations (et)

# text
seg-37d29d8303fe = km

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-c33e3cbba749 = kaaresekundit

# text
seg-11e8c29ecb45 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-a4f1e7d2041e = Perekonna leht: <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>

# text
seg-670191cf797f = Teemaleht: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-a3697ad561db = Hz

# text
# c1: docs/kinds/by-kind/ephemeris.md
seg-e388fdc74ffa = Allikas: <c1/>

# text
# c1: ephemeris
seg-9860cb88c021 = <c1/> (stsenaariumi liik)

# text
# c1: tle
# c2: orbit
# c3: epoch
# c4: tle
# c5: tle
# c6: epoch
seg-24266bc264df = Efemeriid ja maapinnatrajektoor: levita üks satelliit (TLE→SGP4 või analüütiline orbiit) ja väljasta selle TEME/GCRS olek (positsioon + kiirus), ITRF/ECEF positsioon, WGS-84 subsatelliitne laius/pikkus/kõrgus ning sammu kohta jaama az/el/vahemaa + vahemaakiirus (Doppler). Satelliit tuleb väljalt <c1/> või analüütilisest <c2/>-st koos selle <c3/>-ga (<c4/> võidab, kui antud on mõlemad); väljaga <c5/> asendab <c6/> TLE enda epohhi kui t = { "0" }.

# text
# c1: scenarios/ephemeris.toml
seg-02f2745e0550 = Ühe <c1/> jooksu kokkuvõte: scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } mõõtepunkti | kõrgus { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | kiirus { "7653" }–{ "7661" } m/s | maks el { "25.7" }° Doppleri tipp { "34.3" } kHz

# text
# c1: tle|orbit+epoch
seg-2ce1ab71e2cc = Kohustuslikud väljad: <c1/>

# text
# c1: step_s
# c2: duration_s
# c3: station
# c4: dut1_s
# c5: xp_arcsec
# c6: yp_arcsec
# c7: carrier_hz
# c8: eop_finals2000a
seg-21dc45b3de59 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/ephemeris.toml
seg-cda81cdb3607 = Näide <c1/> määrab muu hulgas:

# text
seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

# text
seg-4d208b6c0eb8 = päev

# text
seg-cc723fa4fafa = sgp4 (TLE)

# attr:alt
seg-0fd3c58fde09 = Diagramm, mille mootor kirjutab failile scenarios/ephemeris.toml, liik ephemeris

# text
seg-d291f20074f0 = <b>VALIDATED</b> Maa pöörlemine kaheosalisest UT1 Juliuse kuupäevast orbiidi rajal, nii et Maaga seotud positsioon säilitab mikrosekundi, mille ühe f64 kuupäev kaotab (umbes { "3e-9" } rad ümber aasta { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME konventsioon, kahel osal), cio:

# text
seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF + häiringud, pakett-/järjestikune OD. Sõltumatu etalon (ExternalDataset): AIAA 2006-6753 SGP4 kontrollvektorid

# text
seg-7cf505668c3c = <b>VALIDATED</b> IAU 2006/2000A pretsessioon-nutatsioon, CIO GCRS↔ITRS, liigsekundiga ajaskaalad. Sõltumatu etalon (ExternalDataset): IAU SOFA / ERFA etalonvektorid; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-f19ce44dc0c0 = Teemaleht: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

# text
seg-a8ea4ba6e244 = <s1>Eelmine</s1>eo-radiometry

# text
seg-971864553611 = <s1>Järgmine</s1>fusion
