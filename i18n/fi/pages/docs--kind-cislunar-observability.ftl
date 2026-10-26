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

seg-1767b216650d = määritelty

seg-fc5d34345fdd = Tulosnimike (moottorin oma): MODELLED tasomaisen kuunläheisen satelliittitähdistön havaittavuus (P6). VALIDATED ydin: havaittava ASTE on asteen paljastava singulaariarvokynnys, joka on ristiintarkistettu Gramin matriisin ominaisarvoasteella; Gramin matriisin ominaisarvospektri noudattaa spektri-invariantteja (trace = sum eig, det = prod eig, Frobenius^{ "2" } = sum eig^{ "2" }
