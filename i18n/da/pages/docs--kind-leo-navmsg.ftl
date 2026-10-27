# docs--kind-leo-navmsg: translations (da)

seg-debc2f07db78 = true

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = { "5" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-648c27220789 = Kilde: <c1/>

seg-087287602b47 = <c1/> (scenarietype)

seg-49964654d5f4 = Scenarietype i motoren v{ $version }, familie <a1>Navigation i lav jordbane</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-867f3e41b5ab = LEO-navigationsbesked: den udsendte efemeride og det udsendte ur for en positionerings-, navigations- og tidssynkroniseringssatellit i lav jordbane (LEO), for enhver bane, bærebølge og model, med valgfrie navngivne forudindstillinger (Xona Pulsar, Iridium, Starlink, CentiSpace, et repræsentativt C-bånd-system, ATOMIC-nulur-modellen, Celeste IOD). INDHOLD: hjælpedata (SVID, issue of data, bånd, signalsundhed), synkronisering (uge, ugetid, et andenordens urpolynomium af0-af2 om toc), efemeride i en af fire modeller -- Galileo OS SIS ICD's kepleriske sæt med 16 parametre; det sæt plus korrektionspolynomier langs banen, på tværs af banen og radialt; modellen med 22 parametre fra Liu et al. { "2025" }; et ECEF-polynomium uden urled (ATOMIC-nulur) -- og andre tjenester (et udsendt Klobuchar-sæt, NeQuick-G ai0-ai2 med det effektive ioniseringsniveau og parametre for systemtid til UTC med ICD's logik for skudsekunder). FITTER: en sandhedsbane integreret med zonal J2-J6 eller EGM2008-tyngdekraft til den valgte grad og modstand og et seedet frit eller styret ur; Levenberg-Marquardt-tilpasning af det kepleriske sæt på ikke-singulære elementer, derefter lineære mindste kvadraters korrektionspolynomier; uret tilpasset netto af det relativistiske led, som brugeren selv lægger til. ANALYSER: fit-interval-trade (afstandsfejl for signal i rummet, SISRE, med globale gennemsnitsvægte for banehøjden, mod tilpasningsinterval og opdateringsperiode, kun bane og med ur), model-comparison (fire modeller, antal parametre, kodede bit og Kshanas tilpasning ved Liu et al.s højder ved siden af de offentliggjorte tal), midpass-update (den højeste passage over en bruger, hvert beskedskifts spring i position, ur og brugerafstand, spring i den værste geometri, PASS/FAIL mod en kontinuitetstærskel), encode-decode (Kshanas egen dokumenterede binære ramme med CRC-24Q, et kvantiseringsbudget på et halvt trin pr. felt, en kontrol af en beskadiget ramme, en eksport og import af en post i RINEX-4-stil mærket som en Kshana-udvidelse og en CSV-tabel). VALIDATED: SISRE-vægtene mod den offentliggjorte MEO/GEO-tabel (Montenbruck et al. { "2018" }); Galileo-brugeralgoritmen mod RTKLIB på reelle udsendte Galileo-efemerider; CRC-24Q mod dens katalogkontrolværdi og RTCM { "1005" }-eksempelrammen. MODELLED: hvert tal for tilpasning og SISRE er repræsentationsfejl mod en sandhed integreret af Kshana (ingen fejl i banebestemmelse eller prædiktion); sammenligningen med Liu et al. bruger andre baner; kodnings- og tekstformaterne er Kshanas egne.

seg-e5a4f0290e9e = Én kørsel af <c1/> opsummeres sådan: LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m Det kepleriske sæt med 16 parametre forringes fra { "0.0003" } m ved { "60" } s til { "0.1073" } m ved { "900" } s: ét kepleriske sæt med harmoniske to gange pr. omløb kan ikke følge de højfrekvente tyngdeled og modstanden på en LEO-bue i mere end nogle få minutter, og dets mindste kvadraters residual svinger hen over vinduet. Polynomierne langs/på tværs/radialt, der har højere grad, end det kepleriske sæt spænder over, optager det, der er tilbage, og giver { "0.0388" } m ved { "900" } s.

seg-3f299f6b20c8 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Eksemplet <c1/> angiver blandt andet:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Celeste IOD-besked (workshop-forudindstilling)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = Resultatmærkat (motorens): MIXED, VALIDATED byggeklodser, MODELLED resultater. SISRE-vægtene gengiver den offentliggjorte MEO/GEO-tabel (Montenbruck et al. { "2018" }), Galileo ICD-brugeralgoritmen gengiver RTKLIB på reelle udsendte Galileo-efemerider, og CRC-24Q gengiver sin katalogkontrolværdi og RTCM { "1005" }-eksempelr

seg-35e92abc6a23 = Diagrammet, som motoren skriver for scenarios/leo-navmsg-celeste-iod.toml, scenarietype leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: den radiale vægt w_R og den kvadrerede tværvægt w_AC^{ "2" } som gennemsnit af cos^{ "2" } og halv sin^{ "2" } af sigtelinjens nadirvinkel over brugere jævnt fordelt på den synlige jordkalot over en elevati

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD's kepleriske evaluering (Keplers ligning, andenharmoniske korrektioner, jordfast knude) skrevet separat fra motorens RINEX-evaluator, der returnerer positionen med argumentet Tests: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynomium 0x1864CFB, startværdi { "0" }, ingen refleksion, ingen afsluttende XOR, den kontrol, som Kshanas LEO-ramme bærer over hver foregående byte

seg-2b24c2669c23 = <b>VALIDATED</b> Fitteren og trade i <c1/>-typen: en sandhedsbane integreret med zonal J2-J6 eller EGM2008-tyngdekraft til den valgte grad og modstand og et seedet frit eller styret ur; en Levenberg-Marquardt-tilpasning af det kepleriske Galileo-sæt på ikke-singulære

seg-ddb27b07b9af = og { "7" } flere i matrixen.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: den radiale vægt w_R og den kvadrerede tværvægt w_AC^{ "2" } som gennemsnit af cos^{ "2" } og halv sin^{ "2" } af sigtelinjens nadir. Uafhængig reference (ExternalDataset): Den offentliggjorte tabel med SISRE-vægtningsfaktorer fra Montenbruck, Steigenberger og Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } og 1/49, GLONASS { "0.98" } og 1/45, Galileo { "0.98" } og 1/61, BeiDou MEO { "0.98" } og 1/54, BeiDou IGSO/GEO { "0.99" } og 1/126. Det samme gennemsnit evalueret ved LEO-radier giver

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD's kepleriske evaluering (Keplers ligning, andenharmoniske korrektioner, jordfast knude) skrevet separ. Uafhængig reference (ExternalDataset): RTKLIB 2.4.2-p13 eph2pos ECEF-positioner (en uafhængig implementering af den samme ICD-algoritme) for reelle BKG/IGS-udsendte poster fra 2024-09-10, begge committet med proveniens i tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dette validerer den kepleriske brugeralgoritme; korrektionerne langs/på tværs/radialt, der lægges ovenpå, dækkes af deres egne rækker, og Liu-leddene b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynomium 0x1864CFB, startværdi { "0" }, ingen refleksion, ingen afsluttende XOR, den kontrol, som Kshanas LEO-ramme bærer over hver foregående. Uafhængig reference (ExternalDataset): CRC-katalogets kontrolværdi for disse parametre (reveng.sourceforge.io CRC-katalog, CRC-24/LTE-A: bredde { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), som er CRC-24Q-parametrene i RTCM { "10403" } og Galileo OS SIS ICD, og eksempelrammen for beskedtype { "1005" } trykt i RTCM { "10403" }

seg-6e2719a28884 = <b>VALIDATED</b> Fitteren og trade i <c1/>-typen: en sandhedsbane integreret med zonal J2-J6 eller EGM2008-tyngdekraft til den valgte grad og modstand og et seedet frit eller styr. Uafhængig reference (ExternalDataset): Reelle præcise videnskabelige baner som sandhed (TU Graz IfG/ITSG operationelle reduceret-dynamiske baner, frie til enhver brug med anerkendelse; SHA-256-værdier i fixturens NOTICE) tilpasset med sættet med 16 parametre over buer på { "20" } og { "30" } min, mod de statistikker, som Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) offentliggør for de samme satellitter og dage: langs, på tværs og radialt RMS hver inden for 1.5x (målt { "0.804" } til { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE er beskedens repræsentationsfejl mod den sandhed, den blev tilpasset til; fejl i banebestemmelse og banepræduktion er ikke modelleret. (resultat <c1/>)

seg-3762de39de07 = Sandhedsbanen er en numerisk integration fra Kshana (zonal eller EGM2008-tyngdekraft, statisk eksponentiel modstand), ikke et rigtigt satellits præcise bane; ingen tredjelegemer, solstrålingstryk eller tidevand. (resultat <c1/>)

seg-4486dd350b57 = Det binære format er Kshanas egen dokumenterede kodning, modelleret efter de offentliggjorte beskedkomponenter; det er ikke bitlayoutet for Celeste eller noget andet system (ingen er offentlige). (resultat <c1/>)

seg-2a5c1bce8320 = RINEX-blokken er en dokumenteret Kshana-udvidelse; RINEX { "4.02" } definerer ingen LEO-navigationsposter. (resultat <c1/>)

seg-642d8f4d60e7 = NeQuick-G-koefficienter medbringes, og det effektive ioniseringsniveau beregnes, men NeQuick-integrationen af elektrontætheden, der omsætter det til en forsinkelse, er ikke implementeret; det er Klobuchar-forsinkelsen, skaleret til bærebølgen med 1/f^{ "2" } uden korrektion for en satellit, der flyver inde i ionosfæren. (resultat <c1/>)

seg-8ba04a3147bd = Leddene med 22 parametre fra Liu et al. { "2025" } følger artiklens brugeralgoritme (ligning 1-7) og tilpasningsstrategi (afsnit { "2.3" }); dens SISRE-mod-højde-tal brugte reelle præcise baner, så denne sammenligning på en bane integreret af Kshana er MODELLED, ikke VALIDATED (sammenligningen med reelle baner er tests/leo_navmsg_fit_real_orbit_oracle.rs). (resultat <c1/>)

seg-b3585c7feb4e = MIXED, VALIDATED byggeklodser, MODELLED resultater. SISRE-vægtene gengiver den offentliggjorte MEO/GEO-tabel (Montenbruck et al. { "2018" }), Galileo ICD-brugeralgoritmen gengiver RTKLIB på reelle udsendte Galileo-efemerider, og CRC-24Q gengiver sin katalogkontrolværdi og RTCM { "1005" }-eksempelrammen. Hvert tal for tilpasning, SISRE, kontinuitet og kvantisering er MODELLED: repræsentationsfejlen for en besked mod en (resultat <c1/>)

seg-d6e412aab1b4 = MODELLED: hvert tal for tilpasning og SISRE er repræsentationsfejl mod en sandhed integreret af Kshana (ingen fejl i banebestemmelse eller prædiktion); sammenligningen med Liu et al. (typekatalog (<c1/>))

seg-c5478f572d21 = Familieside: <a1>Navigation i lav jordbane</a1>

seg-d9257241d523 = Emneside: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Forrige</s1>launch-window

seg-2984c4c69850 = <s1>Næste</s1>leo-pass
