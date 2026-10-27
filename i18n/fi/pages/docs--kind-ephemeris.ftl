# docs--kind-ephemeris: translations (fi)

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-c33e3cbba749 = kaarisekuntia

seg-11e8c29ecb45 = Moottorin v{ $version } skenaariolaji, perhe <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-a4f1e7d2041e = Perhesivu: <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>

seg-670191cf797f = Aihesivu: <a1>SOLAR-SYSTEM.md</a1>

seg-a3697ad561db = Hz

seg-e388fdc74ffa = Lähde: <c1/>

seg-9860cb88c021 = <c1/> (skenaariotyyppi)

seg-24266bc264df = Efemeridi ja maanpintajälki: propagoi yksi satelliitti (TLE→SGP4 tai analyyttinen rata) ja anna sen TEME/GCRS-tila (paikka + nopeus), ITRF/ECEF-paikka, WGS-84 alapisteen leveys/pituus/korkeus sekä askelkohtainen aseman atsimuutti/korkeuskulma/etäisyys + etäisyysnopeus (Doppler). Satelliitti tulee kentästä <c1/> tai analyyttisestä radasta, jonka kuvaa kenttä <c2/> yhdessä kentän <c3/> kanssa (kenttä <c4/> voittaa, kun molemmat on annettu); kun kenttä <c5/> on annettu, kenttä <c6/> ohittaa TLE:n oman epookin hetkenä t = { "0" }.

seg-02f2745e0550 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: scenario 0d4dd01b3160 | sgp4 (TLE) | { "559" } samples | alt { "419" }–{ "434" } km | |lat| ≤ { "51.8" }° | speed { "7653" }–{ "7661" } m/s | max el { "25.7" }° peak Doppler { "34.3" } kHz

seg-2ce1ab71e2cc = Pakolliset kentät: <c1/>

seg-21dc45b3de59 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-cda81cdb3607 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = day

seg-cc723fa4fafa = sgp4 (TLE)

seg-0fd3c58fde09 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/ephemeris.toml, skenaariotyyppi ephemeris

seg-d291f20074f0 = <b>VALIDATED</b> Maan pyöriminen kaksiosaisesta UT1-Julian-päivämäärästä rataketjussa, joten Maan mukana pyörivä paikka säilyttää mikrosekunnin, jonka yksittäinen f64-päivämäärä menettää (noin { "3e-9" } rad lähellä vuotta { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventio, kahdelle osalle), cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF + häiriöt, erä-/sekventiaalinen OD. Oraakkeli (ExternalDataset): AIAA 2006-6753 SGP4-varmennusvektorit

seg-7cf505668c3c = <b>VALIDATED</b> IAU 2006/2000A prekessio-nutaatio, CIO GCRS↔ITRS, karkaussekuntien aikaskaalat. Oraakkeli (ExternalDataset): IAU SOFA / ERFA -vertailuvektorit; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-f19ce44dc0c0 = Aihesivu: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>Edellinen</s1>eo-radiometry

seg-971864553611 = <s1>Seuraava</s1>fusion
