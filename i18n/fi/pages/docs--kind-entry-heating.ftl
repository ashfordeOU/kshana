# docs--kind-entry-heating: translations (fi)

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = Aihesivu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = Lähde: <c1/>

seg-3a3f732cc2dd = <c1/> (skenaariotyyppi)

seg-b843e2e0a4ee = 3-DoF pistemassamallinen ilmakehään tulo pyörivän pallomaisen Maan tai Marsin yllä (ballistinen tai nostava vakiokallistuksella), RK4, US76-, eksponentiaalisen tai Marsin ilmakehän läpi, Sutton-Gravesin pysähdyspisteen konvektiivisella lämpenemisellä (NASA TR R-376): huippuhidastuvuus, lämpövuo ja dynaaminen paine, lämpökuorma, maanpintakantama, pyörivän koordinaatiston energiatarkistus ja Allen-Eggers-suljettu muoto sen rinnalla. Huippuhidastuvuus on tarkistettu julkaistua Stardust-nimellisarvoa vastaan; lämpeneminen on MODELLED.

seg-05c8dac8d411 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> peak { "35.4" } g at { "54.2" } km, peak q { "746" } W/cm² at { "62.0" } km, heat load { "20970" } J/cm², peak q_dyn { "20.8" } kPa; terminal-altitude at { "317" } s (closed form { "60.2" } g; MODELLED 3-DoF, no radiative/TPS)

seg-96504cafb034 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-1b68d973fd30 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) ballistinen vak

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = Tulosmerkintä (moottorin oma): MODELLED — 3-DoF pistemassamallinen tulo pyörivän pallomaisen planeetan yllä (keskeisgravitaatio, ei J2:ta), mukana pyörivä tuuleton ilmakehä, vakio C_D, L/D ja kallistus, RK4; konvektiivinen pysähdyspisteen lämpeneminen NASA TR R-376:n ({ "1971" }) mukaan, kylmä seinä, EI säteilylämpenemistä, EI TPS-/ablaatiovastetta, EI 6-DoF

seg-dbb618cd6357 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/entry-heating-stardust.toml, skenaariotyyppi entry-heating

seg-e73b339df97b = <b>VALIDATED</b> 3-DoF pistemassamallinen tulo pyörivän pallomaisen Maan yllä US Standard Atmosphere { "1976" } -ilmakehän läpi, integroituna RK4:llä inertiaalisesta tulotilasta, raportoiden huippuhidastuvuuden ja sen korkeuden; planeettasuhteellinen tulotila i Testit: <a1>entry_stardust_published.rs</a1>.

seg-10124432b79b = <b>MODELLED</b> Pysähdyspisteen konvektiivinen lämpövuo q = k sqrt(rho/R_n) V^{ "3" } Sutton-Gravesin vakioilla Maan ilmalle ja Marsin ilmakehälle (NASA TR R-376, { "1971" }), sen huippu ja integroitu lämpökuorma 3-DoF-tulon varrella, ballistinen tai nostava vakio c Testit: <a1>entry_stardust_published.rs</a1>.

seg-54d133781215 = <b>VALIDATED</b> 3-DoF pistemassamallinen tulo pyörivän pallomaisen Maan yllä US Standard Atmosphere { "1976" } -ilmakehän läpi, integroituna RK4:llä inertiaalisesta tulotilasta, raportoiden th. Oraakkeli (ExternalDataset): Desai, Mitcheltree ja Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }) Stardust-nimellisarvo: suurin hidastuvuus { "33.4" } g nopeudesta { "12.6" } km/s planeettasuhteellisesti, laukaisumassa { "45.8" } kg, 6-DoF POST -rata täydellä aerodynaamisella tietokannalla; tulorajapinta Desai, Lyons, Tooley ja Kangas (NTRS { "20090004445" }): säde { "6503.14" } km, inertiaalinen { "12.9" } km/s kulmassa -8.2 astetta. Kynnykset ennakkorekisteröity xval/entry-stardust/PREREGISTRATION.

seg-03878684f9a1 = <b>MODELLED</b> Pysähdyspisteen konvektiivinen lämpövuo q = k sqrt(rho/R_n) V^{ "3" } Sutton-Gravesin vakioilla Maan ilmalle ja Marsin ilmakehälle (NASA TR R-376, { "1971" }), sen . Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: relaatio ja vakiot sellaisina kuin ne on painettu NASA TR R-376:ssa, puoliaskelkonvergenssitarkistus sekä lämpenemis- ja hidastuvuushuippujen odotettu järjestys. MITÄ EI OLE: yhtään julkaistua lämpenemisarvoa ei ole verrattu (Stardust-artikkelit antavat suunnittelurajan ja konvektiivis-plus-säteilyarvion noin { "1200" } W/cm2, jota pelkkä konvektiivinen relaatio ei voi vastata); ei säteilylämpenemistä, seinälämpötilaa tai

seg-a0f300b2ce78 = MODELLED — 3-DoF pistemassamallinen tulo pyörivän pallomaisen planeetan yllä (keskeisgravitaatio, ei J2:ta), mukana pyörivä tuuleton ilmakehä, vakio C_D, L/D ja kallistus, RK4; konvektiivinen pysähdyspisteen lämpeneminen NASA TR R-376:n ({ "1971" }) mukaan, kylmä seinä, EI säteilylämpenemistä, EI TPS-/ablaatiovastetta, EI 6-DoF (tulos <c1/>)

seg-47f81ab160cc = Huippuhidastuvuus on tarkistettu julkaistua Stardust-nimellisarvoa vastaan; lämpeneminen on MODELLED. (tyyppiluettelo (<c1/>))

seg-47cda83af127 = Tulorajapinta säteellä { "6503.14" } km, inertiaalinen { "12.9" } km/s kulmassa -8.2 astetta, { "45.8" } kg, halkaisija { "0.811" } m, nokan säde { "0.2202" } m (Desai ym., NASA NTRS { "20050042027" } ja { "20090004445" }). Leveysaste ja suunta ovat oletettu likimääräinen tulo Tyynen valtameren yllä; C_D on moduulin { "60" } asteen pallokartio-oletus. Julkaistu 6-DoF-nimellinen huippuhidastuvuus: { "33.4" } g. Lämpeneminen on vain Sutton-Gravesin konvektiivinen, MODELLED. (skenaariotiedoston kommentti, rivit { "4" }–{ "8" })

seg-98af076be1ac = Pysähdyspisteen konvektiivinen tulolämpeneminen (Sutton-Graves) 3-DoF-tulossa on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-77c073cd5d67 = <s1>Edellinen</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>Seuraava</s1>eo-coverage
