# docs--kind-cislunar-arc-recovery: translations (fi)

seg-debc2f07db78 = true

seg-330cbcd04718 = osuus (dimensioton)

seg-8f21a5462b09 = Lähde: <c1/>

seg-e4858b0a33c9 = <c1/> (skenaariolaji)

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-f994c81583bf = MODELLED riippumattoman estimaattorin testi kuunläheisen kaaren pituuden havaittavuuskynnykselle. Tuo kynnys on havaittavuusmatriisin ASTE-luku, joka on koottu ANALYYTTISISTÄ etäisyysjakobiaanin riveistä ja ANALYYTTISESTÄ variaatiotilansiirtomatriisista, ja sen neliöjuuri-informaatiosuodattimen ristiintarkistus taittaa samat rivit — kahden numeerisen koneen välinen johdonmukaisuustarkistus, ei vahvistus. Tämä laji tarjoaa puuttuvan ratkaisijan: eräkohtaisen pienimmän neliösumman estimaattorin, joka todella PALAUTTAA päähenkilön alkutilan simuloiduista mittauksista, kun mittausosittaisderivaatat otetaan koostetun eteenpäinmallin KESKEISINÄ ÄÄRELLISINÄ DIFFERENSSEINÄ. Se ei kutsu yhtään analyyttistä jakobiaanin riviä, yhtään variaatiotilansiirtomatriisia, yhtään singulaariarvo- tai ominaisarvohajotelmaa, yhtään asteen toleranssia eikä neliöjuuri-informaatiosuodatinta — tiedoston tests/cislunar_arc_recovery_reference.rs lähdetekstisuoja tekee tämän pakotettavaksi — kun taas dynamiikka (sama RK4 CR3BP -virtaus), alkuehdot (sama differentiaalikorjattu satelliittitähdistö), skalaarihavainto ja epookkiruudukko jaetaan tarkoituksella ja nimetään tuotetussa lohkossa <c1/>, koska saman fysikaalisen ongelman kaksi analyysia on sovittava fysiikasta ollakseen vertailukelpoisia. Kaksi kriteeriä, kumpikin pyyhkäisty viiden dekadin yli omalla rajallaan: KOHINATON PALAUTUS (jokaisen siemenluvulla alustetun kokeen lopullinen tilavirhe on enintään recovery_factor kertaa sen a priori -poikkeama — asteen vastine, jossa ei ole singulaariarvotoleranssia) ja MONTE CARLO -ESTIMOITAVUUS (mitattu RMS-paikkavirhe siemenluvulla alustetun kohinajoukon yli on ilmoitetun rajan alapuolella — estimoitavuuden vastine, mitattu eikä ennustettu). Tukee tasomaista nelitilaista ja avaruudellista kuusitilaista, DRO / L2 halo / L2 NRHO -perheitä, etäisyys- ja etäisyysnopeushavaintoja sekä Kuu-keskistä polaariparametrisointia, jossa muunnos sovelletaan TILAAN ja eteenpäinmalli derivoidaan siellä uudelleen. MEASURED julkaistulla tasomaisella DRO-ruudukolla: estimaattori palauttaa nelitilan arvosta { "0.782609" } h, kun astekriteerin arvo on { "2.086957" } h toleranssilla rel_tol { "1e-6" } (suhde { "0.375" }) — aste-kynnystä EI ole vahvistettu palautettavuuden rajaksi — kun taas mitattu estimoitavuusraja osuu samaan ruudukon soluun kuin muodollinen, { "5.739130" } h, ja mitattu virhekäyrä toistaa muodollisen 1-sigman { "21" } kaaren pituuden yli geometrisella keskisuhteella { "0.98" }. MODELLED: satelliittitähdistön suunnittelu, epookkiruudukko, yksi seurattu linkki, poikkeaman suuruus, mittaussigma ja kaksi ilmoitettua rajaa. Ei sertifioitu navigoinnin suorituskykytuote.

seg-ada71f37b21b = Yksi ajo tiedostosta <c1/> tiivistyy näin: cislunar-arc-recovery | dro-perhe, 4-tila, { "4" } s/c, etäisyyshavainto, karteesinen parametrisointi | { "6.0" } h kaari, { "24" } epookkia (ruudukko { "0.260870" } h), { "32" } koetta, siemenluku { "20260920" } | äärellisen differenssin osittaisderivaatat, ei analyyttistä jakobiaania / STM:ää / SVD:tä / SRIF:ää | kohinaton palautus arvosta { "0.782609" } h (kerroin { "1e-2" }) vs Gramin matriisin astekynnys { "2.086957" } h | Monte Carlo -estimoitavuus arvosta { "5.739130" } h (RMS-paikka ≤ { "1.000" } km, σ { "1.000" } m) vs Gramin matriisin estimoitavuus { "5.739130" } h | kaaren lopun RMS-paikka { "0.6026" } km

seg-3d4a2773c32f = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-eb621f41dfbb = Esimerkki <c1/> asettaa muun muassa:

seg-6d584e86deba = suhde (dimensioton)

seg-f7f4d06e661f = cislunar-observability identtisellä

seg-a6cb7ed2ff6d = Tulosnimike (moottorin oma): MODELLED kuunläheisen kaaren pituuden palautustesti (riippumattoman estimaattorin vahvistus P6-havaittavuuskynnykselle). VALIDATED ydin: estimaattori on paketin olemassa oleva painotettu Gauss–Newton-eräkorjain (crate::batch_ls), jonka suunnittelumatriisi on koostetun eteenpäinmallin KESKEINEN ÄÄRELLINEN DIFFERENSSI

seg-2fe411ae2153 = Moottorin kirjoittama kaavio skenaariolle scenarios/cislunar-arc-recovery.toml, laji cislunar-arc-recovery

seg-99dd8cc0e3ef = <b>MODELLED</b> Eräkohtainen pienimmän neliösumman estimaattori, joka PALAUTTAA päähenkilön alkutilan simuloiduista satelliittien välisistä mittauksista saman epookkiruudukon kasvavilla alkuosilla, jota aste-kaarta vastaan -taulukko käyttää, mittausosittaisderivaatat keskeisinä äärellisinä differensseinä Testit: <a1>cislunar_arc_recovery_reference.rs</a1>.

seg-67aab2162719 = <b>MODELLED</b> Eräkohtainen pienimmän neliösumman estimaattori, joka PALAUTTAA päähenkilön alkutilan simuloiduista satelliittien välisistä mittauksista saman epookkiruudukon kasvavilla alkuosilla. Oraakkeli (ReferenceImpl): Erillinen estimaattori tässä koodikannassa eri algoritmilla ja irrallisella koodipolulla: epälineaarinen painotettu Gauss–Newton äärellisen differenssin osittaisderivaatoilla, sen tuomio luettuna mitattuna tilanpalautusvirheenä km:ssä ja mm/s:ssä. Sillä ei ole yhtään yhteistä lauseketta Gramin matriisin aste- ja kovarianssireitin kanssa, ja erottelu PAKOTETAAN lähdetekstisuojalla eikä vain väitetä. MEASURED julkaistulla tasomaisella DRO-ruudukolla: th

seg-7be582874f98 = MODELLED kuunläheisen kaaren pituuden palautustesti (riippumattoman estimaattorin vahvistus P6-havaittavuuskynnykselle). VALIDATED ydin: estimaattori on paketin olemassa oleva painotettu Gauss–Newton-eräkorjain (crate::batch_ls), jonka suunnittelumatriisi on koostetun eteenpäinmallin KESKEINEN ÄÄRELLINEN DIFFERENSSI - se ei kutsu yhtään analyyttistä mittausjakobiaanin riviä, yhtään variaatiotilansiirtomatriisia, yhtään singulaariarvo- o (tulos <c1/>)

seg-52fe686b1fdf = MODELLED riippumattoman estimaattorin testi kuunläheisen kaaren pituuden havaittavuuskynnykselle. (lajiluettelo (<c1/>))

seg-48e6e57a0b40 = MODELLED: satelliittitähdistön suunnittelu, epookkiruudukko, yksi seurattu linkki, poikkeaman suuruus, mittaussigma ja kaksi ilmoitettua rajaa. (lajiluettelo (<c1/>))

seg-75f275dcb2d2 = MODELLED: satelliittitähdistön suunnittelu, epookkiruudukko, yksi seurattu linkki, poikkeaman suuruus, mittaussigma ja kaksi ilmoitettua rajaa. Ei sertifioitu navigoinnin suorituskykytuote. (skenaariotiedoston kommentti, rivit { "33" }–{ "35" })

seg-ea82d9fd6506 = Riippumattoman estimaattorin vahvistus kuunläheisen kaaren pituuden kynnykselle on MODELLED, ei validoitu: tarkistettu erillistä toteutusta vastaan samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-53d57e6dafa6 = <s1>Edellinen</s1>campaign

seg-fe3ecf4b55fe = <s1>Seuraava</s1>cislunar-observability
