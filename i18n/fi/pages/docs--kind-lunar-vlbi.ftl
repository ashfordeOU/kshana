# docs--kind-lunar-vlbi: translations (fi)

seg-c1ce24cd6008 = analyyttinen

seg-37d29d8303fe = km

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-df90e5910fb4 = hr

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b> Viiveen osittaisderivaatat kerättynä peruslinjojen × epookkien aikataulun yli Fisherin informaatiomatriisiksi, käännettynä asemakoordinaattien kovarianssiksi ja koordinaattikohtaiseksi asemasigmaksi, korvaten oletetun isotrooppisen tasajakolinkin a

seg-55ce02ad5dd5 = <b>MODELLED</b> Kolmas datumvalinta, <c1/>, joka pitää jokaisen Maa-aseman kiinteänä ja estimoi pelkästään MAJAKAN Kuuhun kiinnitetyt koordinaatit — kokoonpano, jolle kuun pintapisteen epävarmuus todella ilmoitetaan, koska Maa-aseman koordinaatit

seg-afeb6e26c5ad = Lähde: <c1/>

seg-6d1a32afd780 = <c1/> (skenaariotyyppi)

seg-e01f77d493a0 = Mallinnettu kuun geodeettinen VLBI-viiveen havaintosuure: Maa-peruslinja (kaksi maa-asemaa, GCRS) havaitsee yksisuuntaisen signaalin NovaMoon-luokan kuun pinnalla olevalta majakalta. Tuottaa lähikentän kahden etäisyyden erotuksen viiveen, sen muutosnopeuden ja aaltorintaman kaarevuuden lähikenttäkorjauksen ohituksen yli — ristiintarkistettu saman koodikannan tasoaaltoon perustuvaa Δ-DOR-havaintosuuretta vasten kaukokentän rajalla, differenssillä varmennetuin osittaisderivaatoin. Oletusarvoinen analyyttinen polku on MODELLED ja sisältää koordinaatiston johdonmukaisuuden, napaliikkeen xp=yp={ "0" } ja tasoaalto-vs.-lähikenttä -varaumat. Asetuksilla planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path ajetaan sen sijaan ydinpolku (DE440, MOON_PA_DE440, ITRF93; suppenneet barycentriset valon kulkuajat; lisää epookin majakan ja aseman osittaisderivaatat), jonka newtonilainen viive ja osittaisderivaatat täsmäävät NAIF SPICEn suppenneisiin valon kulkuaikoihin tarkkuudella { "0.06" } ps ja { "7.4e-9" }. Ei validoitu todellista VLBI-dataa vasten.

seg-92227c085867 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-vlbi | peruslinja { "10727" } km | majakan etäisyys { "402900" } km | viive -10049.126 µs (muutosnopeus { "1.312e-6" } s/s) | lähikenttä { "58.9" } µs | { "13" } näytettä { "6.0" } h:n aikana

seg-1a38a07a0d70 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

seg-11450a55fc9d = Esimerkki <c1/> asettaa muun muassa:

seg-07d97fc1abac = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-vlbi.toml, tyyppi lunar-vlbi

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: tämän tyypin nimeävät <a1>varmennusmatriisin</a1> rivit.

seg-61f431e422e5 = <b>MODELLED</b> Lähikentän VLBI-viive Maa-peruslinjalle, joka havaitsee kuun majakan + osittaisderivaatat

seg-7342b50d34e4 = <b>VALIDATED</b> Lähikentän VLBI-viive Maa-peruslinjalle, joka havaitsee kuun majakan, majakan ja aseman osittaisderivaatoin, ydinpolulla (lunar_vlbi::KernelGeometry): DE440:n Maa ja Kuu, DE440:n kuun pääakselit, ITRF93-Maan orientaatio UT1:llä ja Testit: <a1>naif_kernel_reader_check.rs</a1>.

seg-5547f1f662d3 = ja { "2" } muuta matriisissa.

seg-1461c84350d8 = <b>MODELLED</b> Lähikentän VLBI-viive Maa-peruslinjalle, joka havaitsee kuun majakan + osittaisderivaatat. Oraakkeli (ReferenceImpl): Tasoaalto delta_dor (sama koodikanta) kaukokentän rajalla; differenssillä lasketut osittaisderivaatat. { "0.30" } ulkoinen vertailu, havainto (pysyy tasolla MODELLED): ANISE:a { "0.10" } vasten, suppenneet valon kulkuajat DE440:n kautta ({ "75" } viivettä 2024-01-01 kolmella DSN-peruslinjalla, tuotettu ilman Kshana-koodia ohjelmalla xval/anise-lunar-od), yksikään viive ei ole { "1" } ps:n toleranssin sisällä. Suurin ero on { "24" } µs, analyyttisestä Kuun keskipisteestä (noin { "200" } km DE:stä

seg-b41c162b015f = Oletusarvoinen analyyttinen polku on MODELLED ja sisältää koordinaatiston johdonmukaisuuden, napaliikkeen xp=yp={ "0" } ja tasoaalto-vs.-lähikenttä -varaumat. (tyyppiluettelo (<c1/>))

seg-0beac99bb095 = Rehellisyys: MODELLED, EI validoitu todellista VLBI-dataa vasten. Napaliike jätetään pois (xp = yp = { "0" }), joten aseman inertiaalipaikoissa on muutaman metrin koordinaatistovirhe; majakka yhdistää keskimääräisen päivän ekvaattorin Kuu-sarjan ICRF-kappalekiinteään siirtymään (jd_tdb ~ jd_tt), koordinaatiston johdonmukaisuuden epäsuhdan mallin tarkkuuden alapuolella; ei valon kulkuajan iterointia, väliaineita eikä aberraatiota erotetun Shapiro-termin lisäksi. Ei TRL:ää, lentoperintöä eikä viraston (skenaariotiedoston kommentti, rivit { "17" } - { "21" })

seg-58b64e5ff3db = Kuun geodeettinen VLBI on MODELLED, ei validoitu: sitä on tarkistettu tämän saman koodikannan erillistä toteutusta vastaan, joka on riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-04089c4d6fbe = <s1>Edellinen</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>Seuraava</s1>mars-pnt
