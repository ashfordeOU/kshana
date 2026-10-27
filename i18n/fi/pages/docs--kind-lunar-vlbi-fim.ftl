# docs--kind-lunar-vlbi-fim: translations (fi)

seg-b054c73f22e5 = ei arvoa

seg-98151954f217 = false

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: tämän tyypin mainitsevat <a1>varmennusmatriisin</a1> rivit.

seg-3319b18ac61f = ja { "1" } muu matriisissa.

seg-2595bd629ffb = <b>MODELLED</b> Seitsenparametrinen Helmert-datum, joka etenee SIMULOIDUSTA HAVAINTOKAMPANJASTA eikä palaudu lisätystä muunnoksesta.

seg-7ecec8d27f50 = Lähde: <c1/>

seg-d54e29b7bc80 = <c1/> (skenaariotyyppi)

seg-1bc37634ba9f = Kuun VLBI:n asemakoordinaattien kovarianssi: lunar-vlbi-havaintosuureen viiveen osittaisderivaatat kerättynä nimenomaisen AIKATAULUN (peruslinjat x epookit) yli Fisherin informaatiomatriisiksi, käännettynä ja raportoituna asemakoordinaattien kovarianssina ja koordinaattikohtaisena asemasigmana — lasketun moottoritulosteen, ei oletetun isotrooppisen g = { "3" } -tasajakokertoimen läpi työnnetyn skalaarisen viiveen tarkkuuden. Tila sisältää Maahan KIINNITETYT (ITRS) asemakoordinaatit, joten jakobiaani on inertiaalinen osittaisderivaatta, jota on kierretty kunkin epookin GCRS->ITRS-matriisilla: Maan pyöriminen tekee nämä koordinaatit havaittaviksi, ja raportti MITTAA Maahan kiinnitetyn näkölinjan pyyhkäisyn ja majakan deklinaation eikä oleta niitä. Yksi havainto on yksi (peruslinja, epookki) -pari, jossa MOLEMMAT asemat ovat korkeuskulmamaskin yläpuolella, painotettuna 1/delay_sigma_s^{ "2" }. Raportoi asteen, datumvajeen, ehtoluvun, koko informaatiospektrin, kovarianssimatriisin, asemakohtaiset akselikohtaiset ja 3D-sigmat sekä vapaan verkon nolla-avaruuden jokaisella ajolla; asteen vajeessa otsikkosigma julkaistaan arvona NULL ja tilatiedolla, eikä sitä koskaan lueta lähes singulaarisesta käänteismatriisista. Tasajakoarvo c<em>delay_sigma_s</em>sqrt(g/N) SAMALLE aikataululle tuotetaan lasketun arvon viereen suhdeluvun kanssa, yhdessä isotrooppisen jälkirajan sqrt(p/trace(M)) kanssa, jonka AM-HM tekee kovaksi alarajaksi — joten suhdeluku on se anisotropia, jonka oletus hylkäsi. Viiveen sulkeuma tau_ik = tau_ij + tau_jk tekee vain n-1:stä n(n-1)/2:sta peruslinjasta geometrisesti riippumattomia; raportti ilmoittaa molemmat lukumäärät. MODELLED: Kuun keskipisteen efemeridi, asemien kellot, troposfääri ja Maan orientaatioparametrit pidetään KIINTEINÄ ja havaintoja käsitellään riippumattomina, joten kovarianssi on Cramer–Rao-raja pienennetylle parametrijoukolle, ei ennustettu sessiotulos; viiveen sigma, asemakoordinaatit ja aikataulu ovat syötteitä. Osittaisderivaatta, jonka geometrisen viiveen jakobiaani jättää pois (erotettu Shapiro-termi), mitataan differenssillä ja tuotetaan. Ei geodeettinen tuote.

seg-4df72c1b921e = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-vlbi-fim | { "3" } asemaa / { "3" } peruslinjaa x { "49" } epookkia = { "16" } havaintoa (maski { "10.0" } astetta) | datum anchor-first-station | aste 6/6 ehtoluku { "2.209e4" } | aseman sigma { "0.0926" } m vs. tasajako g={ "3" } { "0.0013" } m (suhde { "71.360" })

seg-f0dabe1b061b = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-fabf305ae1de = Esimerkki <c1/> asettaa muun muassa:

seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

seg-8b098bf1df6b = Tuloksen nimike (moottorin oma): MODELLED kuun VLBI:n asemakoordinaattien kovarianssi. Kovarianssi kerätään moottorin omista analyyttisistä viiveen osittaisderivaatoista nimenomaisen peruslinjojen ja epookkien aikataulun yli ja käännetään; sitä EI muunneta skalaarisesta viiveen tarkkuudesta oletetulla geometriakertoimella. Havaintokohtainen viiveen si

seg-19c383444296 = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-vlbi-fim.toml, tyyppi lunar-vlbi-fim

seg-d1a6a5086102 = <b>VALIDATED</b> Viiveen osittaisderivaatat kerättynä peruslinjojen × epookkien aikataulun yli Fisherin informaatiomatriisiksi, käännettynä asemakoordinaattien kovarianssiksi ja koordinaattikohtaiseksi asemasigmaksi, korvaten oletetun isotrooppisen tasajakolinkin a

seg-55ce02ad5dd5 = <b>MODELLED</b> Kolmas datumvalinta, <c1/>, joka pitää jokaisen Maa-aseman kiinteänä ja estimoi pelkästään MAJAKAN Kuuhun kiinnitetyt koordinaatit — kokoonpano, jolle kuun pintapisteen epävarmuus todella ilmoitetaan, koska Maa-aseman koordinaatit

seg-811a412b40b6 = <b>VALIDATED</b> Skenaarion lunar-vlbi-fim kaikki-asemat-kiinteinä -majakkakovarianssi (jokainen Maa-asema pidetään kiinteänä, majakan Kuuhun kiinnitetyt koordinaatit estimoidaan yksin), majakka sijoitettuna JPL DE440 -Kuuhun, jonka moottorin oma ydinlukija lukee

seg-a731b913bdf0 = <b>VALIDATED</b> Viiveen osittaisderivaatat kerättynä peruslinjojen × epookkien aikataulun yli Fisherin informaatiomatriisiksi, käännettynä asemakoordinaattien kovarianssiksi ja koordinaattikohtaiseksi asemasigmaksi. Oraakkeli (ExternalDataset): Riippumaton repon sisäinen reitti. Jokainen jakobiaanirivi johdetaan uudelleen funktion lunar_vlbi::vlbi_delay_s keskeisellä differenssillä, joka lasketaan tilan omista Maahan kiinnitetyistä ja Kuuhun kiinnitetyistä koordinaateista, kierrettyinä eteenpäin koordinaatistoketjun läpi — polku, joka ei laske derivaattaa eikä jaa lauseketta analyyttisten osittaisderivaattojen kanssa — ja kummankin reitin rakentamat informaatiomatriisit täsmäävät tarkkuuteen < { "1e-6" } suurimmasta lävistäjäalkiosta.

seg-2300ffd9fc4e = <b>MODELLED</b> Kolmas datumvalinta, <c1/>, joka pitää jokaisen Maa-aseman kiinteänä ja estimoi pelkästään MAJAKAN Kuuhun kiinnitetyt koordinaatit — kokoonpano, jolle kuun. Oraakkeli (ReferenceImpl): Suljetun muodon identiteetit, ilman ulkoista oraakkelia, jota väitettäisiin tai joka olisi saatavilla. Vipuvarsi tarkistetaan suhdetta ρ/B vasten ja kaksi tasajakomuotoa toisiaan vasten tarkkuuteen { "1e-15" } — algebrallisia identiteettejä, joten ne paljastavat johdotusvirheen eivätkä muuta, ja ne on merkitty sellaisiksi. Olennainen tulos on MEASURED eikä väitetty: kiinteän peruslinjan viive rajoittaa majakan SUUNTAA, joten näkölinjan komponentti

seg-2cbf700a234e = MODELLED kuun VLBI:n asemakoordinaattien kovarianssi. Kovarianssi kerätään moottorin omista analyyttisistä viiveen osittaisderivaatoista nimenomaisen peruslinjojen ja epookkien aikataulun yli ja käännetään; sitä EI muunneta skalaarisesta viiveen tarkkuudesta oletetulla geometriakertoimella. Havaintokohtainen viiveen sigma, asemakoordinaatit, majakan paikka ja aikataulu ovat syötteitä. Kuun keskipisteen efemeridi, asemien kellot (tulos <c1/>)

seg-8f63c3e774e2 = Kuun VLBI:n asemakoordinaattien kovarianssi: lunar-vlbi-havaintosuureen viiveen osittaisderivaatat kerättynä nimenomaisen AIKATAULUN (peruslinjat x epookit) yli Fisherin informaatiomatriisiksi, käännettynä ja raportoituna asemakoordinaattien kovarianssina ja koordinaattikohtaisena asemasigmana — lasketun moottoritulosteen, ei oletetun isotrooppisen g = { "3" } -tasajakokertoimen läpi työnnetyn skalaarisen viiveen tarkkuuden. (tyyppiluettelo (<c1/>))

seg-d09b166842d5 = Tila sisältää Maahan KIINNITETYT (ITRS) asemakoordinaatit, joten jakobiaani on inertiaalinen osittaisderivaatta, jota on kierretty kunkin epookin GCRS->ITRS-matriisilla: Maan pyöriminen tekee nämä koordinaatit havaittaviksi, ja raportti MITTAA Maahan kiinnitetyn näkölinjan pyyhkäisyn ja majakan deklinaation eikä oleta niitä. (tyyppiluettelo (<c1/>))

seg-bb7ff1e5d99f = Tasajakoarvo c<em>delay_sigma_s</em>sqrt(g/N) SAMALLE aikataululle tuotetaan lasketun arvon viereen suhdeluvun kanssa, yhdessä isotrooppisen jälkirajan sqrt(p/trace(M)) kanssa, jonka AM-HM tekee kovaksi alarajaksi — joten suhdeluku on se anisotropia, jonka oletus hylkäsi. (tyyppiluettelo (<c1/>))

seg-0ed4495d4488 = MODELLED: Kuun keskipisteen efemeridi, asemien kellot, troposfääri ja Maan orientaatioparametrit pidetään KIINTEINÄ ja havaintoja käsitellään riippumattomina, joten kovarianssi on Cramer–Rao-raja pienennetylle parametrijoukolle, ei ennustettu sessiotulos; viiveen sigma, asemakoordinaatit ja aikataulu ovat syötteitä. (tyyppiluettelo (<c1/>))

seg-4df6e3981cc4 = D3:n julkaistu ketju etenee havaintokohtaisesta viiveen tarkkuudesta aseman koordinaattiepävarmuuteen oletetun ISOTROOPPISEN tasajakokertoimen g = { "3" } kautta. Tuo askel on se, jota artikkelin oma tiivistelmä kutsuu mallinnetuksi eikä mitatuksi. Tämä skenaario poistaa sen: kuun VLBI:n viiveen osittaisderivaatat kerätään todellisen (peruslinja x epookki) -parien aikataulun yli Fisherin informaatiomatriisiksi, käännetään ja raportoidaan (skenaariotiedoston kommentti, rivit { "3" } - { "8" })

seg-489b93ca0f7f = Tila sisältää Maahan KIINNITETYT (ITRS) koordinaatit, joten jakobiaani on inertiaalinen osittaisderivaatta, jota on kierretty kunkin epookin GCRS->ITRS-matriisilla: Maan pyöriminen tekee nämä koordinaatit ylipäätään havaittaviksi, ja raportti MITTAA Maahan kiinnitetyn näkölinjan pyyhkäisyn ja majakan deklinaation eikä oleta niitä. Yksi havainto on yksi (peruslinja, epookki) -pari, jossa MOLEMMAT asemat ovat korkeuskulmamaskin yläpuolella, painotettuna 1/delay (skenaariotiedoston kommentti, rivit { "10" } - { "14" })

seg-efb5719364af = Mitä raportista luetaan * asemakohtaiset akselikohtaiset ja 3D-sigmat — laskettu vastaus; * tasajakoarvo c<em>delay_sigma_s</em>sqrt(g/N) SAMALLE aikataululle, tulostettuna sen viereen suhdeluvun kanssa. Tuo suhdeluku ON se anisotropia, jonka oletus hylkäsi, ja isotrooppinen jälkiraja sqrt(p/trace(M)) tekee AM-HM:stä kovan alarajan, joten oletus voi vain aliarvioida; * aste, datumvaje, ehtoluku, koko sp (skenaariotiedoston kommentti, rivit { "16" } - { "26" })

seg-96c1a129aeae = <s1>Edellinen</s1>lunar-time-offset

seg-199d98630271 = <s1>Seuraava</s1>lunar-vlbi
