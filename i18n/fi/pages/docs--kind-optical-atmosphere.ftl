# docs--kind-optical-atmosphere: translations (fi)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-72ad48275ebe = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Optinen PNT</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-a97755cb13eb = Perhesivu: <a1>Optinen PNT</a1>

seg-9fd02351d844 = ms

seg-d4e4da22fadb = Lähde: <c1/>

seg-deb0a932a76f = <c1/> (skenaariotyyppi)

seg-a878d9be65b7 = MODELLED optinen PNT ilmakehän läpi: optiselle linkille ja joukolle maa-asemia, joilla on ilmoitetut pilviklimaatit, se raportoi aallonpituudesta ja korkeuskulmasta riippuvan kirkkaan ilman vaimennuksen (Kimin näkyvyyslaki plus Rayleigh), Hufnagel–Valley-turbulenssitilan (Rytov-varianssi, tuikeindeksi, gamma-gamma-parametrit, apertuurikeskiarvoistus), säästä riippuvan saatavuuden linkkimarginaalia vasten (pilven optinen paksuus log-normaalista nestevesiklimaatista, geometrisen optiikan ekstinktio, riippumaton turbulenssivaimennus), tavoitesaatavuuksiin tarvittavan linkkimarginaalin, katkon keston jakauman, ajoituksen ja etäisyydenmittauksen virheen kasvun katkoa kohti kellon holdover-mallin kautta, etäisyyskorreloidun paikkadiversiteettisaatavuuden sekä parannustekniikoiden mitä-jos-hyödyt (aallonpituus, vastaanottoapertuuri, adaptiivisen optiikan tuikevähennys, lisämarginaali). VALIDATED toteutuksena ilmoitetuista kaavoista riippumatonta mpmath-oraakkelia vasten: Rytov-varianssi, tuikeindeksi, gamma-gamma-vaimennustodennäköisyys, apertuurikeskiarvoistuskerroin, pilven ja kirkkaan ilman optinen paksuus. MODELLED: jokainen sää-, tekniikka- ja kellosyöte sekä riippumattomuus- ja kopulaoletukset; mitattua saatavuustietuetta ei ole verrattu. Ohjeellinen analyysi, ei sertifioitu saatavuus- eikä navigointituote.

seg-c443d8d3e4ce = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: optical-atmosphere: { "1550" } nm { "30" } asteen korkeuskulmassa, marginaali { "19.2" } dB ennen ilmakehää; paras paikka eteläinen { "74.66" } %; 3 paikan verkko { "92.72" } % riippumattomalla / { "91.62" } % korreloidulla säällä (MODELLED, ohjeellinen)

seg-e466ecbd4e6d = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-8adae3ea6e60 = Esimerkki <c1/> asettaa muun muassa:

seg-687f2930a40d = downlink

seg-e794d481aed4 = plane

seg-a0fb22dd0a44 = [ocxo, rafs, dsac]

seg-9799bd5f9fdb = nm

seg-7707c45d1d30 = dBm

seg-0fd6a569077f = Tuloksen nimike (moottorin oma): MODELLED — optinen PNT ilmakehän läpi: kirkkaan ilman ekstinktio (Kimin näkyvyyslaki + Rayleigh), pilven optinen paksuus ilmoitetusta nestevesiklimaatista (P.840-määrä, geometrisen optiikan ekstinktio), Hufnagel–Valley-turbulenssi gamma-gamma-vaimennuksin ja apertuurikeskiarvoistuksella, saatavuus linkkimarginaalia vasten

seg-4e2b759aff17 = Moottorin kirjoittama kaavio skenaariolle scenarios/optical-atmosphere-network.toml, tyyppi optical-atmosphere

seg-a18d144f149e = <b>MODELLED</b> Hufnagel–Valley Cn2 integroituna vinopolun yli tasoaallon ja pallo-aallon Rytov-varianssille (ylälinkki ja alalinkki), Andrews–Phillips-tuikeindeksille ja gamma-gamma-parametreille, gamma-gamma-vaimennustodennäköisyydelle ja vaimennusmarginaalille, Testit: <a1>optical_atmosphere_reference.rs</a1>.

seg-d97535fd4875 = <b>MODELLED</b> Optisen linkin saatavuus ilmoitettua linkkimarginaalia vasten log-normaalista pilven nestevesiklimaatista (ITU-R P.840 -määrä, geometrisen optiikan ekstinktio) ja riippumattomasta gamma-gamma-turbulenssivaimennuksesta, tavoitesaatavuuksiin tarvittava linkkimarginaali Testit: <a1>optical_atmosphere_identities.rs</a1>.

seg-6e2c643df3a6 = <b>MODELLED</b> Optisen paikan katkon keston jakauma kytkettynä kellon holdover-mallin suljetun muodon vapaaliikevarianssiin: ajoituksen ja etäisyydenmittauksen virhe ilmoitetuilla katkokvantiileilla, holdover ajoituskynnykseen, katkojen osuus ja Testit: <a1>optical_atmosphere_identities.rs</a1>.

seg-00c76aeadb90 = <b>MODELLED</b> Valinnainen <c1/>-taulukko (kesto, askel, siemenluku) saa <c2/>-tyypin kirjoittamaan myös paikkakohtaisesti yhden siemenlukuun perustuvan toteutuman ilmoitetusta paikkamallista ajan yli: pilviepisodit (kirkkaat jaksot eksponentiaalisia, pilvikatkot log-normaaleja Testit: <a1>optical_atmosphere_timeseries.rs</a1>.

seg-f1ee20e52b46 = <b>MODELLED</b> Hufnagel–Valley Cn2 integroituna vinopolun yli tasoaallon ja pallo-aallon Rytov-varianssille (ylälinkki ja alalinkki), Andrews–Phillips-tuikeindeksille. Oraakkeli (ExternalDataset): Numeriikkaa verrataan riippumattomaan ohjelmaan (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } { "30" } numerolla, tanh-sinh-kvadratuuri alkuperäisellä korkeusmuuttujalla ja Bessel-K gamma-gamma-tiheydet), joka ei jaa koodia Kshanan kanssa, ennen toteutusta kiinnitetyin kynnyksin (xval/optical-atmosphere/PREREGISTRATION.md). MIKSI MODELLED: tuo oraakkeli laskee samat julkaistut kaavat, joten se tarkistaa im

seg-4af9bc99ef29 = <b>MODELLED</b> Optisen linkin saatavuus ilmoitettua linkkimarginaalia vasten log-normaalista pilven nestevesiklimaatista (ITU-R P.840 -määrä, geometrisen optiikan ekstinktio) ja . Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: diversiteettimallin suljetun muodon rajat ja monotonisuus, pilvikaton suljettu muoto sekä log-normaalit katkoidentiteetit. Ulkoista oraakkelia EI väitetä eikä sellaista ole verrattu: mitattua optisen maa-aseman saatavuutta tai pilvettömän näköyhteyden tietuetta ei käytetä. MIKSI MODELLED: pilviklimaatti (pilven todennäköisyys, nestevesipatsaan mediaani ja hajonta, katkojen kestot),

seg-b3abf6cbeba4 = <b>MODELLED</b> Optisen paikan katkon keston jakauma kytkettynä kellon holdover-mallin suljetun muodon vapaaliikevarianssiin: ajoituksen ja etäisyydenmittauksen virhe ilmoitetuilla ou. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus holdover-moduulin kanssa bitti bitiltä; ulkoista oraakkelia EI väitetä. Luokkien PSD:t ovat synteettisiä pitkän tau:n lattioita, jotka holdover-moduuli jo sisältää, joten luvut perivät sen ilmoitetun varauman, että holdover tiukkaan kynnykseen määräytyy oletetun punaisen kohinan lattian eikä siteeratun Allanin poikkeaman mukaan. Katkojen kestot ovat log-normaali malli ilmoitetuin parametrein, eivät mitattu c

seg-c4772a9e1a26 = MODELLED — optinen PNT ilmakehän läpi: kirkkaan ilman ekstinktio (Kimin näkyvyyslaki + Rayleigh), pilven optinen paksuus ilmoitetusta nestevesiklimaatista (P.840-määrä, geometrisen optiikan ekstinktio), Hufnagel–Valley-turbulenssi gamma-gamma-vaimennuksin ja apertuurikeskiarvoistuksella, saatavuus linkkimarginaalia vasten, holdoveriin kytketyt katkojen kestot ja etäisyyskorreloitu paikkadiversiteetti. Numeriikka tarkistetaan (tulos <c1/>)

seg-32c6524b0baf = MODELLED optinen PNT ilmakehän läpi: optiselle linkille ja joukolle maa-asemia, joilla on ilmoitetut pilviklimaatit, se raportoi aallonpituudesta ja korkeuskulmasta riippuvan kirkkaan ilman vaimennuksen (Kimin näkyvyyslaki plus Rayleigh), Hufnagel–Valley-turbulenssitilan (Rytov-varianssi, tuikeindeksi, gamma-gamma-parametrit, apertuurikeskiarvoistus), säästä riippuvan saatavuuden linkkimarginaalia vasten (pilven optinen paksuus log (tyyppiluettelo (<c1/>))

seg-2c7493ee5042 = MODELLED: jokainen sää-, tekniikka- ja kellosyöte sekä riippumattomuus- ja kopulaoletukset; mitattua saatavuustietuetta ei ole verrattu. (tyyppiluettelo (<c1/>))

seg-b4402211e3fe = Optinen PNT ilmakehän läpi: kolme ILLUSTRATIVE-maa-asemaa (pilvisempi pohjoinen paikka, keskitason keskinen paikka ja kirkkaampi eteläinen paikka) katselevat LEO-optista päätettä { "30" } asteen korkeuskulmassa aallonpituudella { "1550" } nm. Pilviklimaatit ovat ilmoitettuja syötteitä, eivät mittauksia eivätkä minkään aineiston arvoja, joten jokainen alla oleva saatavuus on MODELLED. Ajo raportoi paikkakohtaisesti kirkkaan ilman vaimennuksen, Hufnagel–Valley-turbulenssitilan, t (skenaariotiedoston kommentti, rivit { "1" } - { "8" })

seg-384f5c73cdf9 = Yksi siemenlukuun perustuva toteutuma kunkin paikan linkistä ajan yli (MODELLED; otos yllä olevasta mallista, ei klimaatti). Jos puuttuu, sarjaa ei kirjoiteta ja tulos on { "0.37" }-dokumentti. (skenaariotiedoston kommentti, rivit { "78" } - { "79" })

seg-c75fa5787bd4 = Optisen vinopolun ilmakehän numeriikka: Rytov-varianssi, tuike, gamma-gamma-vaimennustodennäköisyys, apertuurikeskiarvoistus, pilven ja kirkkaan ilman optinen paksuus on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko ominaisuus yhdistää mallinnettuja osia, joten ominaisuus pysyy mallinnettuna. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e5013bdf86bb = Säästä riippuva optisen maa-aseman saatavuus ja etäisyyskorreloitu paikkadiversiteetti on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-dc1132147318 = Aihesivu: <a1>OPTICAL-ATMOSPHERE.md</a1>

seg-bd5b1654b3ed = <s1>Edellinen</s1>oem-interop

seg-ef0a779c300c = <s1>Seuraava</s1>orbit
