# docs--lunar-infrastructure: translations (fi)

seg-cae10fb9bff8 = Skenaario

seg-61817375c8ea = Kuun kiertorata ja pinta navigoinnin ja geodesian infrastruktuurina

seg-9872e31ebd72 = Lähteet

seg-922905241a6b = Lähde: <c1/>

seg-bfb9c5efbe57 = Skenaariolaji <c1/>, viisi tutkimusta valittavissa kohdalla <c2/>. <b>MODELLED</b>: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja syötteillä, jotka ovat ILLUSTRATIVE. Numeriikka on tarkistettu riippumattomia numpy/scipy-ohjelmia vastaan; mitään ei verrata kuun suureen tehtyyn mittaukseen, eikä mikään täällä ole väite mistään tehtävästä tai järjestelmästä. Ei ole minkään viraston yhteydessä eikä minkään viraston tukema. Ohjeellinen ohjelmisto, ei tyyppihyväksytty laite. Kshana ei lähetä mitään eikä ohjaa laitteistoa.

seg-7908583855a2 = Mallit, syötteet ja kynnykset lukittiin tiedostossa <c1/> (tallennettu ennen kuin yhtäkään tutkimusta pisteytettiin) ja kahdessa ilmoitetussa muutoksessa (<c2/>). Jokaisen kynnyksen tulos on tiedostossa <c3/>.

seg-d9d9d0864ae0 = Tutkimus

seg-3b01a756c305 = Mitä se laskee

seg-a4ef7c81b35f = Aluksen sisäinen Maa-GNSS-radanmääritys NRHO-radalla (tai <c1/>) riippumatonta maa-asemien etäisyys- ja etäisyysnopeusmittauksiin perustuvaa radanmääritystä vastaan kolmelta DSN-asemalta; kunkin estimaatin formaali kovarianssi; siemennetty Monte Carlo siitä, selittävätkö kaksi kovarianssia eronsa (q, khiin neliö, { "6" } vapausastetta); injektoitu mallintamaton kiihtyvyys

seg-849c67471e69 = <c1/> (nopea), <c2/> (pisteytetty, noin kahdeksan minuuttia)

seg-b9c6eb8d778c = Pinta-aseman ja kiertäjän yhteinen kaksoisdifferentioitu kantoaallon vaihe; float-kokonaislukuepävarmuuden kovarianssi; LAMBDA; bootstrap- ja Monte Carlo -onnistuminen; float- ja fixed-paikan sigma

seg-74c347e0bc69 = Kuun 7-parametrisen datumin Fisherin informaatio Maa-asemien etäisyysmittauksesta, kiertäjä–pinta-asema-etäisyyksien kanssa ja ilman; siemennetyt satunnaiset asemajoukot

seg-4ed875c39781 = GNSS, VLBI ja laseretäisyysmittaus yhdellä avaruusaluksella: tekniikkojen välisten siirtymien Cramer–Rao-toistotarkkuus paikallista kytkentävirhettä vasten

seg-de25104c09a2 = Informaatio suureista h2, k2, l2 ja fysikaalinen libraatio laseretäisyysmittauksesta, kiertäjän seurannasta, gravimetristä ja pintakellosta (vakiot jaettu kuun aikamoduulien kanssa)

seg-18fc4ba766df = Aluksen sisäisen Maa-GNSS-radanmäärityksen lähes suoraviivaisella halo-radalla johdonmukaisuus riippumattoman maanpäällisen radanmäärityksen kanssa, moottorin v{ $version } todellisista ajoista tiedostolla scenarios/lunar-infrastructure-od-consistency.toml ja mallivirhevariantilla ({ "400" } koetta kummassakin). Normalisoidun eron keskiarvo q on { "5.81" } ilman mallivirhettä ja { "5.95" } injektoidulla kiihtyvyysvirheellä { "3e-10" } m/s2, odotettu { "6" }: kaksi ratkaisua ovat johdonmukaisia (kynnys C1 MET). Niiden kokeiden osuus, joissa arvo on { "95" } % pisteen yläpuolella, on { "0.040" } ja { "0.052" }; kynnys injektoidun virheen havaitsemiselle oli vähintään { "0.5" }, joten se on NOT MET (C3): aluksen sisäinen ratkaisu tunnetaan noin { "352" } m tarkkuudella maanpäällisen { "23" } m:n sijaan, joten kymmenen metrin siirtymä piiloutuu sen kovarianssin sisään. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuun suureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-4c08262e2556 = Kantoaallon vaiheen kokonaislukuepävarmuuden kiinnitys kuun pinta-asemien ja kiertäjän välillä, moottorin v{ $version } pisteytetyn ajon kirjatusta tuloksesta (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } kaaren pituutta, kummassakin { "400" } arvonnan Monte Carlo, kirjoittanut scenarios/carrier-phase-scored.toml). { "1" } vrk: onnistuminen { "1.0" } % (keskivirhe { "0.5" } %), { "134" } kokonaislukuepävarmuutta, kiertäjän paikan sigma { "45.6" } m float ja { "18.5" } m fixed; { "2" } vrk: onnistuminen { "0.5" } % (keskivirhe { "0.4" } %), { "259" } kokonaislukuepävarmuutta, kiertäjän paikan sigma { "21.5" } m float ja { "8.7" } m fixed; { "3" } vrk: onnistuminen { "2.8" } % (keskivirhe { "0.8" } %), { "375" } kokonaislukuepävarmuutta, kiertäjän paikan sigma { "6.3" } m float ja { "2.1" } m fixed. Kokonaislukukiinnitystä ei saavuteta: onnistuminen pysyy välillä { "1" } %–{ "3" } % arvolla { "25" } dBi, ja rekisteröidyllä arvolla { "12" } dBi ongelmaa ei voida muodostaa. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuun suureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-7e5b10641b20 = Seitsenparametrisen kuun datumin (kolme siirtymää, mittakaava ja kolme kiertoa) toistotarkkuus Maa-asemien etäisyysmittauksesta, kiertäjä–pinta-asema-etäisyyksien kanssa ja ilman, moottorin v{ $version } todellisesta ajosta tiedostolla scenarios/lunar-infrastructure-frame-coestimation.toml. Siirtymien ja kiertojen Cramer–Rao-sigma pienenee kiertäjälinkkien myötä (esimerkiksi t_z arvosta { "0.98" } m arvoon { "0.046" } m); pienin informaation ominaisarvo kasvaa 111-kertaiseksi ja CRLB-jälki putoaa arvoon { "1.0" } % (kynnys F3 MET). Tämä olettaa radan tunnetuksi kuun akseleissa, ja sen virheen kantaa kiertäjän etäisyyden sigma { "1" } m. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuun suureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-377d29dcc6e8 = Laseretäisyysmittauksen, VLBI:n ja GNSS-paikkojen välisten siirtymien toistotarkkuus yhdellä avaruusaluksella suhteessa maanpäällisen paikallisen kytkennän virheeseen, moottorin v{ $version } todellisesta ajosta tiedostolla scenarios/lunar-infrastructure-space-tie.toml (yksi 6.56 vuorokauden kaari, tekniikoiden sigmat GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Kun paikallinen kytkentä on { "1" } mm:stä { "1" } m:iin, laser-miinus-GNSS-siirtymän sigma pysyy lähellä arvoa { "1.04" } m, kunnes kytkentä saavuttaa arvon { "1" } m: sen rajoittaa tekniikoiden mittauskohina, ei paikallinen kytkentä. Pelkän kytkennän asettama lattia on sen sigman kaksinkertaisen neliöjuuren verran. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuun suureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-9d507a371319 = Mikä havaintoperhe on herkkä kuun Love-luvuille h2, k2 ja l2, moottorin v{ $version } todellisesta ajosta tiedostolla scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Jokainen solu on perheen havaintojen RMS-osittaisderivaatta parametrin suhteen perheen omissa yksiköissä (joten soluja verrataan rivin sisällä, ei sarakkeessa); viiva tarkoittaa, ettei perheellä ole herkkyyttä. laseretäisyysmittaus: h2 { "7.6" }, k2 ei mitään, l2 { "9.8" }. kiertäjän seuranta: h2 ei mitään, k2 { "0.00086" }, l2 ei mitään. pintagravimetri: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 ei mitään. pintakello: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 ei mitään. Kaikilla neljällä perheellä Cramer–Rao-sigma on { "0.36" } % nimellisestä h2:sta, { "0.52" } % k2:sta ja { "1.16" } % l2:sta. Perheen lisääminen ei koskaan pienentänyt pienintä ominaisarvoa ({ "28" } lisäyksestä { "28" }), mutta pseudoinverssin jälki ei ollut suurempi vain { "16" } tapauksessa { "28" } lisäyksestä: tuo G3-kynnyksen puolikas on NOT MET. Kiertäjäperhe näkee k2-kiihtyvyyden näkölinjaintegraalin, ylälaidan luvun. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuun suureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-570b9276834b = Ilmoitetut yksinkertaistukset

seg-ab053aadb65d = Maa ja Kuu pistemassoina ympyräradalla, ei Aurinkoa, ei Kuun painovoimaharmonisia; Maan pyörimisakseli on radan normaali; inertiaalikoordinaatisto on sama kuin pyörivä koordinaatisto hetkellä t = { "0" }; pallomainen Kuu; synkroninen kuun koordinaatisto (ei libraatiota) paitsi kohteessa <c1/>; rata oletetaan tunnetuksi kuun akseleissa kohteessa <c2/> (sen virheen kantaa kiertäjän etäisyyden sigma); kohteen <c3/> kiertäjäperhe näkee k2-kiihtyvyyden näkölinjaintegraalin sen jälkeen, kun vakio ja lineaarinen trendi on poistettu, ylälaidan luvun.

seg-fd644b1f33ec = Raportin rakenne

seg-03efc65cbb0e = Jokainen raportti sisältää kentät <c1/>, <c2/>, <c3/>, <c4/>, tutkimuksen omat kentät ja lohkon <c5/> (yksikkö ja alkuperäluokka jokaiselle numeeriselle kentälle). Aikasarjoja ei tuoteta. Kenttäluettelot: kunkin raportin lohko <c6/> ja <c7/>.

seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), käytetty nimellisarvona. h2 ja l2 ovat linearisointipisteitä, eivät todennettuja arvoja. DSN-asemien koordinaatit ovat ITRF93-arvot, jotka on annettu NAIF-kernelin <c1/> kommenteissa; DSN-tarkkuuskaistat luettiin vain hakuyhteenvedoista. Avaruuskytkennän (space-tie) käsite noudattaa julkisia GRASP- ja ESA Genesis -kuvauksia. Täysi taulukko ja tieto siitä, miten kukin luettiin, on ennakkorekisteröinnissä.

seg-6cd670ae6eea = Tulokset yhdellä silmäyksellä (ks. RESULTS.md)

seg-6334f82991d3 = Eivät täyty. Ne on kiinnitetty testeillä, jotka toteavat täyttymättä jäämisen: C3 (injektoidun virheen mittari ei laukea arvolla { "3e-10" } m/s2), Q3:n bootstrap-osuuden puolikas arvolla { "1e-9" } ja G3:n CRLB-jäljen puolikas. Kokonaislukuepävarmuuden ratkaisu ei onnistu rekisteröidyillä syötteillä. Mikään ei ole VALIDATED.

seg-1d3bffc2fd02 = <s1>Edellinen</s1>Avaruuskäyttäjän navigointi (gnss-ssv)

seg-90932eed0074 = <s1>Seuraava</s1>LEO-paikannus, -navigointi ja -ajanmääritys
