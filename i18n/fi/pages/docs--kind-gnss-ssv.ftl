# docs--kind-gnss-ssv: translations (fi)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = Lähde: <c1/>

seg-ee3ecc6e0330 = <c1/> (skenaariotyyppi)

seg-d07af7221334 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Avaruuskäyttäjän navigointi</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-d6d7bca305dc = MODELLED GNSS:n saatavuus ja linkin voimakkuus Space Service Volume -alueella ja sen ulkopuolella: pallolla olevalle käyttäjälle (ICG-kirjasen globaali kuori) tai Kepler-radalla (LEO:sta Kuun siirtoradalle) olevalle käyttäjälle se laskee tähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja kaikille yhdessä C/N0-kynnyksen yläpuolella käytettävät signaalit - vähintään yhden ja neljän signaalin saatavuus, suurin katkon kesto, vastaanotettu C/N0, tarkkuuden heikkenemiskerroin, pääkeila- ja sivukeilalinkit - kirjasen, parametrisella tai käyttäjän antamalla lähetyskuviolla, valinnaisin Maan reunaa hipovan säteen ionosfääri-, plasmasfääri- ja ilmakehävaikutuksin ja valinnaisella heikon signaalin vastaanotinsuunnitelmalla; lisäksi laitteen sisäinen GNSS-laajennettu Kalman-suodatin HEO- ja Kuun siirtoradan aluksille (ratadynamiikka, auringon säteilypaine, kolmannet kappaleet, kello) sekä usean aluksen muodostelman suhteellinen navigointi yksittäisdifferentioiduilla pseudoetäisyyksillä. Tarkistettu ICG SSV -kirjasen taulukoita vasten ennakkorekisteröinnin (xval/gnss-ssv) alaisena

seg-d739ae994bf0 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = Pakolliset kentät: <c1/>

seg-7fc75803140d = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-cebc76420d69 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO, suuren vahvistuksen nadir- ja patch-zenit-antennit, parametrinen s

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = { "5" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = Tulosmerkintä (moottorin oma): MODELLED: geometrinen ja linkkibudjettipyyhkäisy. Kirjasen kuvio on vakiotehoinen pääkeila, parametrinen kuvio edustava korvike ja Maan reunaa hipovan säteen väliaine yksinkertainen ilmoitettu malli; mikään tässä ei ole avaruudessa olevan signaalin mittaus. Saatavuus- ja katkoluvut noudattavat menetelmää o

seg-7dae5e291c8b = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/gnss-ssv-heo.toml, skenaariotyyppi gnss-ssv

seg-0aae0574c5e6 = <b>MODELLED</b> Tyypin <c1/> saatavuuspyyhkäisyt: tähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja yhdistettynä (käyttäjä, epookki) -parien osuus, joilla on vähintään yksi ja vähintään neljä signaalia, sekä pisin katko, pallolla olevalle käyttäjälle

seg-07c94d5ad15c = <b>MODELLED</b> Tyypin <c1/> tila <c2/>: yhdeksäntilainen laajennettu Kalman-suodatin (paikka, nopeus, vastaanottimen kellon harha ja ajautuma, auringon säteilypaineen skaala) pseudoetäisyyksillä, joiden saatavuus, kohina ja C/N0 tulevat samasta link

seg-41bfe74c6f6f = <b>MODELLED</b> Tyypin <c1/> tila <c2/>: pääalus ja apualukset ajavat kukin absoluuttisen suodattimen; apualuksen paikka suhteessa pääalukseen estimoidaan vähentämällä absoluuttiset estimaatit ja suhteellisella suodattimella yksittäisdifferentioiduilla pseudo

seg-de9a2a5b5f04 = <b>MODELLED</b> Tyypin <c1/> saatavuuspyyhkäisyt: tähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja yhdistettynä (käyttäjä, epookki) -parien osuus, joilla on vähintään yksi ja vähintään neljä signaalia, sekä pisin katko, pallolla olevalle käyttäjälle. Oraakkeli (ExternalDataset): ICG Space Service Volume -kirjanen (UN OOSA ST/SPACE/75, { "2018" }), joka on itsekin simulaatio, verrattuna ennakkorekisteröinnin alaisena, joka tehtiin ennen ajoa (xval/gnss-ssv/PREREGISTRATION.md; tulokset tiedostossa xval/gnss-ssv/RESULTS.md, jonka kiinnittää tests/ssv_booklet_results.rs, epäonnistumiset mukaan lukien). Ajo { "1" } ennakkorekisteröidyllä tulkinnalla: vähimmäissäteilytehon vakiot ja Kuun kynnys täsmäävät (S0, S6 täyttyivät); ylempi ja alempi SSV, RF-kynn

seg-f0b778c4922a = <b>MODELLED</b> Chapman-ionosfääri, Gallagher-tyyppinen plasmasfääri ja neutraali ilmakehä (refraktiivisuuden taipuma, happiabsorptio, defokusointi) integroituna suoraa pitkin. Oraakkeli (InternalConsistency): Suljetut muodot ja julkaistut suuruusluokat testeissä (Chapman-kerroksen huippu ja pinnan reunan taipuma, muutama TECU plasmasfääriä GPS–GEO-säteellä); vastaanotinsuunnitelma käyttää uudelleen kaappaus- ja seurantasilmukkamalleja ja niiden testejä. Siihen ei ole verrattu mitattua reunasondausdataa tai heikon signaalin vastaanottodataa

seg-77cef183420e = <b>MODELLED</b> Tyypin <c1/> tila <c2/>: yhdeksäntilainen laajennettu Kalman-suodatin (paikka, nopeus, vastaanottimen kellon harha ja ajautuma, auringon säteilypaineen sk. Oraakkeli (InternalConsistency): Simuloitu totuus suodattimen omaa estimaattia vasten (johdonmukaisen suodattimen keskimääräinen normalisoitu estimointivirheen neliö on noin { "3" } paikalle) ja determinismi kiinteällä siemenluvulla. Lento- tai tallennettua korkean radan GNSS-dataa ei ole verrattu; Aurinko ja Kuu ovat matalan tarkkuuden ympyräratakorvikkeita

seg-429e154cd691 = <b>MODELLED</b> Tyypin <c1/> tila <c2/>: pääalus ja apualukset ajavat kukin absoluuttisen suodattimen; apualuksen paikka suhteessa pääalukseen estimoidaan vähentämällä. Oraakkeli (InternalConsistency): Sama simuloitu totuus kuin absoluuttisella suodattimella: suhteellisen suodattimen virhe todelliseen suhteelliseen tilaan nähden sekä tarkistus, että se pärjää vähintään yhtä hyvin kuin kahden riippumattoman absoluuttisen paikannuksen vähentäminen. Lentomuodostelmadataa ei ole verrattu

seg-1dd1beb01075 = MODELLED: geometrinen ja linkkibudjettipyyhkäisy. Kirjasen kuvio on vakiotehoinen pääkeila, parametrinen kuvio edustava korvike ja Maan reunaa hipovan säteen väliaine yksinkertainen ilmoitettu malli; mikään tässä ei ole avaruudessa olevan signaalin mittaus. Saatavuus- ja katkoluvut noudattavat ICG Space Service Volume -kirjasen (UN ST/SPACE/75) menetelmää ja ne on tarkistettu sen taulukoita vasten hakemistossa xval/gnss-ssv/. (tulos <c1/>)

seg-e9c2dedbc971 = MODELLED GNSS:n saatavuus ja linkin voimakkuus Space Service Volume -alueella ja sen ulkopuolella: pallolla olevalle käyttäjälle (ICG-kirjasen globaali kuori) tai Kepler-radalla (LEO:sta Kuun siirtoradalle) olevalle käyttäjälle se laskee tähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja kaikille yhdessä C/N0-kynnyksen yläpuolella käytettävät signaalit - vähintään yhden ja neljän signaalin saatavuus, suurin katkon kesto, vastaanotettu C/N0, (tyyppiluettelo (<c1/>))

seg-3add0e744c54 = MODELLED: kuvio on edustava, ei mitattu; väliaine on ilmoitettu yksinkertainen malli (docs/SSV.md). (skenaariotiedoston kommentti, rivi { "14" })

seg-6b4655dd5270 = GNSS-signaalin saatavuus Space Service Volume -alueella ja sen ulkopuolella, verrattuna ICG SSV -kirjaseen, on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-a9e1798308df = Maan reunaa hipovien GNSS-signaalien reunasäteen ionosfääri-, plasmasfääri- ja ilmakehävaikutukset sekä heikon signaalin vastaanotinsuunnitelma tyypissä <c1/> ovat MODELLED, eivät validoituja: ne on tarkistettu niiden omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-132be2813c10 = Korkean radan ja Kuun siirtoradan avaruusalusten laitteen sisäinen GNSS-navigointisuodatin on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-f9405de9adb8 = Usean avaruusaluksen muodostelman suhteellinen navigointi erittäin elliptisellä radalla GNSS:n avulla on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-4881f925ea7f = Perhesivu: <a1>Avaruuskäyttäjän navigointi</a1>

seg-4b72df59b3f9 = Aihesivu: <a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>Edellinen</s1>gnss-sim

seg-9df48482a140 = <s1>Seuraava</s1>gravity-map
