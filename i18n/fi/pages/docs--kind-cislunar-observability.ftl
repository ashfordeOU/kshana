# docs--kind-cislunar-observability: translations (fi)

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-6d584e86deba = suhde (dimensioton)

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-258f128cea60 = Lähde: <c1/>

seg-f0c7758e472f = <c1/> (skenaariolaji)

seg-7ccd0a3babb8 = MODELLED tasomaisen kuunläheisen satelliittitähdistön havaittavuus (P6): seuraa neljän avaruusaluksen differentiaalikorjattua tasomaista DRO-satelliittitähdistöä satelliittien välisellä etäisyysmittauksella ja raportoi, kuinka suuren osan avaruusaluksen nelitilasta [x,y,ẋ,ẏ] kaari tekee havaittavaksi. Tuottaa ({ "1" }) aste-kaaren pituutta vastaan -taulukon yhdelle pelkkää etäisyyttä käyttävälle linkille — hetkellisesti aste 1, kasvaa kohti täyttä nelitilaa kaaren pidentyessä (P6 Table { "1" }); ({ "2" }) havaittavuuden Gramin matriisin ominaisarvospektrin ja ehtoluvun kaaren yli; ({ "3" }) pelkkä etäisyys vs etäisyys+etäisyysnopeus -hetkellisen asteen vertailun (Doppler-suunnitteluvipu) sekä pelkän etäisyyden singulaarisen / etäisyys+nopeus-määritellyn GDOP-raportoinnin; ja ({ "4" }) riippumattoman SRIF-ristiinvalidoinnin, jonka posteriorikovarianssi muuttuu äärelliseksi / hyvin ehdolliseksi täsmälleen kaarella, jolla havaittava aste saavuttaa neljä. VALIDATED ydin: havaittava aste on asteen paljastava singulaariarvokynnys, joka on ristiintarkistettu Gramin matriisin ominaisarvoasteella; ominaisarvospektri noudattaa spektri-invariantteja (trace=Σλ, det=Πλ, Frobenius²=Σλ²); variaatiotilansiirtomatriisi on äärellisellä differenssillä validoitu CR3BP:n tilansiirtomatriisi; etäisyyden/etäisyysnopeuden jakobiaanin rivit ovat äärellisellä differenssillä validoituja analyyttisiä osittaisderivaattoja (ristiintarkistettu paketin 3-D-etäisyysnopeushavaintoa vastaan); neljä alkuehtoa ovat differentiaalikorjattuja tasomaisia DRO:ita, jotka sulkeutuvat tiukkaan jaksollisuusjäännökseen ja ovat vastakulkuisia; asteen siirtymä on ristiinvalidoitu paketin neliöjuuri-informaatiosuodattimella (posteriorikovarianssi äärellinen täsmälleen täydellä asteella, cond(P)=cond(OᵀO)); asteeltaan vajaa tilannekuva merkitään GDOP-määrittelemättömäksi (fim condition=inf), ei koskaan valheelliseksi äärelliseksi arvoksi — sama singulaarigeometriasuoja, jota pvt::solve_spp soveltaa. MODELLED: satelliittitähdistön suunnittelu (DRO:n periluna-amplitudit ja vaiheet) ja sen tuottama erityinen asteen eteneminen. Ei sertifioitu navigoinnin suorituskykytuote.

seg-a59f2fa9efb9 = Yksi ajo tiedostosta <c1/> tiivistyy näin: cislunar-observability | { "4" } s/c ({ "3" } viitettä) | { "6.0" } h kaari, { "24" } epookkia | aste { "1" } → { "4" } / { "4" } kaaren yli | Gramin matriisin λ [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | hetkellinen aste pelkkä etäisyys { "2" } → etäisyys+nopeus { "4" } ({ "3" } linkkiä) | GDOP pelkkä etäisyys määrittelemätön etäisyys+nopeus { "6.353" } | DRO-alkuehdot (suurin jaksollisuusjäännös { "4.7e-9" }) | SRIF-posteriori äärellinen asteen 4 epookilla { "8" } (validoitu: aste/STM/DRO-sulkeutuminen/SRIF, mallinnettu: suunnittelu)

seg-fb1601eda130 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-f3b5cc590c78 = Esimerkki <c1/> asettaa muun muassa:

seg-0cc8ab10786b = pyörivän koordinaatiston aikayksiköt

seg-84781b6fff48 = GDOP määrittelemätön (asteeltaan vajaa / singula

seg-856eb311f24b = ”määrittelemätön” (teksti sellaisena kuin asiakirja ilmoittaa

seg-fc5d34345fdd = Tulosnimike (moottorin oma): MODELLED tasomaisen kuunläheisen satelliittitähdistön havaittavuus (P6). VALIDATED ydin: havaittava ASTE on asteen paljastava singulaariarvokynnys, joka on ristiintarkistettu Gramin matriisin ominaisarvoasteella; Gramin matriisin ominaisarvospektri noudattaa spektri-invariantteja (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }

seg-f15bbf30b0dd = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/cislunar-observability.toml, skenaariotyyppi cislunar-observability

seg-4564ad90378b = <b>MODELLED</b> Kuunläheisen avaruuden kaaren pituuden havaittavuuskynnys AVARUUDELLISESSA kuuden tilan CR3BP-mallissa tasomaisen nelitilaisen mallin sijaan, DRO-, L2 halo- ja L2 lähes suoraviivaisen halon perheissä, kun mittauskohina tulee Gramin matriisiin ja KAKSI kriteeriä raportoi

seg-9f857ff85800 = <b>MODELLED</b> Kuunläheisen avaruuden kaaren pituuden havaittavuuskynnys AVARUUDELLISESSA kuuden tilan CR3BP-mallissa tasomaisen nelitilaisen mallin sijaan, DRO-, L2 halo- ja L2 lähes suoraviivaisen ha. Oraakkeli (InternalConsistency): Riippumaton rivi-porrasmuodon aste, joka lasketaan Gaussin eliminaatiolla osittaisella pivotoinnilla, vahvistaa jokaisen kuuden tilan astetuloksen — eri algoritmi, joka ei jaa koodia testattavan ominaisarvo-/SVD-reitin kanssa. CR3BP:n tilansiirtomatriisilla ({ "6" }×{ "6" }), jonka tämä koostaa, on oma oraakkeli (ReferenceImpl) SciPy-kirjaston variaatiointegrointia vastaan, ja halo-/NRHO-alkuehdot tulevat korjaimesta, joka toistaa julkaistun L2 souther

seg-53c183035bde = MODELLED tasomaisen kuunläheisen satelliittitähdistön havaittavuus (P6). VALIDATED ydin: havaittava ASTE on asteen paljastava singulaariarvokynnys, joka on ristiintarkistettu Gramin matriisin ominaisarvoasteella; Gramin matriisin ominaisarvospektri noudattaa spektri-invariantteja (jälki = summa eig, det = tulo eig, Frobenius^{ "2" } = summa eig^{ "2" }); variaatioyhtälön tilansiirtomatriisi on differenssimenetelmällä validoitu CR3BP:n tilansiirtomatriisi (crate::cr3bp); etäisyys-/etäisyysnopeus-Jacobin rivit (tulos <c1/>)

seg-f6a217f57bec = MODELLED tasomaisen kuunläheisen tähdistön havaittavuus (P6): seuraa neljän avaruusaluksen differentiaalikorjattua tasomaista DRO-tähdistöä satelliittien välisellä etäisyysmittauksella ja raportoi, kuinka suuren osan avaruusaluksen nelitilaisesta tilasta [x,y,ẋ,ẏ] kaari tekee havaittavaksi. (tyyppiluettelo (<c1/>))

seg-e5182743fd40 = MODELLED: tähdistön suunnittelu (DRO:n perilune-amplitudit ja -vaiheet) ja sen tuottama tietty asteen eteneminen. (tyyppiluettelo (<c1/>))

seg-5d3a370f1295 = Rehellisyys: MODELLED. VALIDATED ydin -- havaittava ASTE on asteen paljastava singulaariarvokynnys, joka on ristiintarkistettu Gramin matriisin ominaisarvoasteella; ominaisarvospektri noudattaa spektri-invariantteja (jälki = summa eig, det = tulo eig, Frobenius^{ "2" } = summa eig^{ "2" }); variaatioyhtälön tilansiirtomatriisi on differenssimenetelmällä validoitu CR3BP:n tilansiirtomatriisi; etäisyys-/etäisyysnopeus-Jacobin rivit ovat differenssimenetelmällä validoituja analyyttisiä osittaisderivaattoja (ristiintar (skenaariotiedoston kommentti, rivit { "16" }–{ "25" })

seg-c68bc1df8975 = Avaruudellinen, kohinainen, usean perheen kuunläheisen kaaren pituuden havaittavuus on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-ba3c2a8f0e28 = <s1>Edellinen</s1>cislunar-arc-recovery

seg-3adfb78b1f34 = <s1>Seuraava</s1>clock
