# docs--kind-lunar-infrastructure: translations (fi)

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-d1beb62cf742 = { "6" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-e821670a8b55 = Lähde: <c1/>

seg-56953faa67ae = <c1/> (skenaariotyyppi)

seg-d0fb90f506c9 = MODELLED tutkimukset Kuun radasta ja pinnasta navigointi- ja geodeettisenä infrastruktuurina, viisi tutkimusta yhden tyypin takana, valittuna kentällä <c1/>: od-consistency (aluksella tehtävä Maa-GNSS-radanmääritys NRHO- tai ELFO-radalla verrattuna riippumattomaan maa-asemien radiometriseen radanmääritykseen, arvioituna niiden omilla kovariansseilla siemenluvulla alustetun Monte Carlon yli), carrier-phase (yhteinen pinta–kiertäjä kaksoisdifferentioitu kantoaallon vaihe ja kokonaislukuepävarmuuden ratkaisu LAMBDA:lla), frame-coestimation (pinta-asema ja kiertäjät lisättyinä Maa-asemien etäisyysmittaukseen seitsenparametrisen Kuun koordinaatiston datumin saamiseksi), space-tie (GNSS, VLBI ja laseretäisyysmittaus yhdellä avaruusaluksella, koordinaatiston sitomisen toistotarkkuus suhteessa paikalliseen sidosvirheeseen) ja geodesy-sensitivity (Kuun Love-lukujen h2, k2, l2 ja fyysisen libraation Fisher-informaatio laseretäisyysmittauksesta, kiertäjien seurannasta, pintagravimetristä ja pintakellosta). Rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin; numeriikka tarkistetaan riippumattomilla ohjelmilla, eikä mitään verrata Kuun suureen tehtyyn mittaukseen.

seg-5753b7552559 = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: lunar-infrastructure space-tie: { "4" } pyyhkäisypistettä { "1" } kaarella; laser-vs-GNSS x translaation sigma { "1.0363" } m rekisteröidyllä paikallisella sidoksella

seg-f2594b18e718 = Pakolliset kentät: <c1/>

seg-4875c29c517c = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-7b33bdb70a30 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = Tuloksen nimike (moottorin oma): MODELLED — rajoitettu kolmen kappaleen malli (Maa ja Kuu pistemassoina, ei Aurinkoa, ei Kuun painovoimaharmonisia) ilmoitetuin yksinkertaistuksin ja ILLUSTRATIVE syötteillä, jotka on nimetty julkisten lähteidensä mukaan. Numeriikka tarkistetaan riippumattomilla ohjelmilla; mitään ei verrata Kuun suureen tehtyyn mittaukseen

seg-f3b4a80a739b = ei kuvaajaa: esimerkki ei kirjoita kaaviota

seg-35a4a7a25561 = <b>MODELLED</b> Radanmääritys lähes suoraviivaisella halo-radalla (tai elliptisellä jäädytetyllä radalla) kahdesta riippumattomasta datatyypistä: aluksella vastaanotetut Maa-GNSS-pseudoetäisyydet . Oraakkeli (ReferenceImpl): Riippumaton scipy/numpy-ohjelma integroi samat variaatioyhtälöt (kynnys O1). Mitään ei verrata Kuun radan mittaukseen. Oraakkeli tarkistaa ilmoitettujen kaavojen numeriikan, ei fysiikkaa, joten rivi pysyy MODELLED. Rajoitettu kolmen kappaleen malli: ei Aurinkoa, ei Kuun harmonisia, Maan pyörimisakseli radan normaalin suuntaan, ILLUSTRATIVE vastaanotin- ja asemasyötteet.

seg-32455bf5f804 = <b>MODELLED</b> Vastaanottimien välinen yksittäisdifferentioitu Maa-GNSS-kantoaallon vaihe ja koodi Kuun pinta-asemalla ja kiertäjällä, epookkikohtaisen kellodifferenssin profiloituna pois. Oraakkeli (ReferenceImpl): Riippumaton numpy-ratkaisu samoista normaaliyhtälöistä viedyistä riveistä (Q3) ja raa'an voiman kokonaislukuluettelointi (Q4). Mitään GNSS- tai Kuun kantoaaltovaihemittausta ei verrata. MODELLED.

seg-b20c412516b6 = <b>MODELLED</b> Seitsenparametrisen Kuun koordinaatiston datumin Fisher-informaatio Maa-aseman laseretäisyysmittauksesta viiteen heijastimeen yksin ja kiertäjä–pinta-asema-etäisyysmittauksen kanssa. Oraakkeli (ReferenceImpl): Riippumaton numpy-äärellinen differenssi suorasta mallista (F2). Mitään ei verrata oikeisiin Kuun koordinaatistoratkaisuihin. Kerroin on ehdollinen oletetulle tunnetulle radalle ja { "1" } m:n etäisyyssigmalle. MODELLED.

seg-151c96b1f882 = <b>MODELLED</b> Cramer-Rao-toistotarkkuus GNSS-, VLBI- ja laseretäisyysmittauskoordinaatistojen väliselle teknikkojen väliselle translaatio-, skaala- ja rotaatiosiirtymälle, kun yksi avaruusalus kantaa kaikkia. Oraakkeli (ReferenceImpl): Riippumaton numpy-pinottu systeemi, jossa paikkatuntemattomat on eliminoitu eksplisiittisillä Schur-komplementeilla (T3). Mitään GRASP-, Genesis- tai muuta tehtäväkohtaista dataa ei verrata. MODELLED.

seg-743d78806f6a = MODELLED — rajoitettu kolmen kappaleen malli (Maa ja Kuu pistemassoina, ei Aurinkoa, ei Kuun painovoimaharmonisia) ilmoitetuin yksinkertaistuksin ja ILLUSTRATIVE syötteillä, jotka on nimetty julkisten lähteidensä mukaan. Numeriikka tarkistetaan riippumattomilla ohjelmilla; mitään ei verrata Kuun suureen tehtyyn mittaukseen, eikä mikään tässä ole lausuma mistään tehtävästä tai järjestelmästä. Ei yhteydessä mihinkään virastoon eikä sen tukema. Adviso (tulos <c1/>)

seg-da35c5298311 = MODELLED tutkimukset Kuun radasta ja pinnasta navigointi- ja geodeettisenä infrastruktuurina, viisi tutkimusta yhden tyypin takana, valittuna kentällä <c1/>: od-consistency (aluksella tehtävä Maa-GNSS-radanmääritys NRHO- tai ELFO-radalla verrattuna riippumattomaan maa-asemien radiometriseen radanmääritykseen, arvioituna niiden omilla kovariansseilla siemenluvulla alustetun Monte Carlon yli), carrier-phase (yhteinen pinta–kiertäjä kaksoisdifferentioitu kantoaallon vaihe ja kokonaislukuepävarmuuden (tyyppiluettelo (<c2/>))

seg-4658f67623b5 = Kshanan lunar-infrastructure-skenaario: space-tie. MODELLED; suunnitelma, syötteet ja kynnykset on lukittu tiedostoon xval/lunar-infra/PREREGISTRATION.md (sitoutettu ennen mitään ajoa). ILLUSTRATIVE syötteet on merkitty siellä julkisten lähteidensä mukaan. (skenaariotiedoston kommentti, rivit { "1" }–{ "3" })

seg-f7257c25f137 = Kuun radanmääritys: Maa-GNSS vs maa-asemien radiometria on MODELLED, ei validoitu: tarkistettu tämän saman koodikannan erillistä toteutusta vastaan: riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-a3988ca0b8ea = Kuun kantoaallon vaiheen kokonaislukuepävarmuuden ratkaisu: pinta ja kiertäjä on MODELLED, ei validoitu: tarkistettu tämän saman koodikannan erillistä toteutusta vastaan: riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-b2e4ab7b6e60 = Kuun koordinaatiston yhteisestimointi: pinta-asemat ja kiertäjät on MODELLED, ei validoitu: tarkistettu tämän saman koodikannan erillistä toteutusta vastaan: riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-6eedb30a58c5 = Space-tie-koordinaatiston sidonnan toistotarkkuus: samaan paikkaan sijoitetut GNSS, VLBI ja laseretäisyysmittaus on MODELLED, ei validoitu: tarkistettu tämän saman koodikannan erillistä toteutusta vastaan: riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-cd5f729c9622 = Aihesivu: <a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>Edellinen</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>Seuraava</s1>lunar-integrity
