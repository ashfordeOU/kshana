# docs--ssv: translations (fi)

seg-0857a94a948e = Rajoitukset

seg-75c8da01c0f1 = MET

seg-069a652c402e = kynnys

seg-1f79a5aae6c5 = Signaalin saatavuus käyttäjälle pallolla { "36000" } km:n korkeudessa pallonpuoliskoantennilla, moottorin v{ $version } todellisesta ajosta skenaariolla scenarios/gnss-ssv-shell.toml (supistettu ajo: { "162" } käyttäjää, { "3" } vuorokautta, { "10" } min askeleet), { "20" } dB-Hz kynnyksellä. Jokaiselle satelliittitähdistölle ja kaistalle kaksi palkkia: (käyttäjä, epookki) -parien osuus, joilla on vähintään yksi signaali ja vähintään neljä. Yhdistetty, L1: { "99.4" } % vähintään yksi, { "73.2" } % vähintään neljä, pisin alle neljän signaalin katko { "160" } min. Yhdistetty, L5: { "100.0" } % vähintään yksi, { "99.9" } % vähintään neljä, pisin alle neljän signaalin katko { "20" } min. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä minkään järjestelmän palvelualuetta koskeva väite. Supistettu koko ei ole vihkosvertailu. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-92ef8e0b78de = Signaalit yhdellä korkealla Maan kiertoradalla (perigeum { "497" } km, apogeum { "58622" } km, kiertoaika { "18.8" } h), moottorin v{ $version } todellisesta ajosta skenaariolla scenarios/gnss-ssv-heo.toml, kaista L1. Ylhäällä: näkyvillä olevien signaalien paras kantoaalto-kohinatiheys suhteessa { "20" } dB-Hz kynnykseen. Keskellä: kaikista satelliittitähdistöistä näkyvillä olevien signaalien määrä, { "4" }–{ "55" } otospisteiden varrella. Vastaanotetuista linkeistä { "2252" } tuli pääkeilan kautta ja { "696" } sivukeilojen kautta käyttäen nimettyä parametrista korvikekuviota, ei minkään järjestelmän mitattua kuviota. PDOP:n mediaani { "67" }, 95. persentiili { "358" }. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä minkään järjestelmän palvelualuetta koskeva väite. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-902c5c7da9aa = Aluksen yhdeksän tilan suodatin siirtymällä matalalta radalta kohti Kuuta, moottorin v{ $version } todellisesta ajosta skenaariolla scenarios/gnss-ssv-nav-lunar.toml ({ "289" } epookkia, { "13" } piirrettyä pistettä). Logaritmisella akselilla todellinen paikkavirhe ja suodattimen oma yhden sigman raja suhteessa alusta kuluneeseen aikaan. GNSS-ratojen sisäpuolella paikan RMS on { "1.4" } m; niiden yläpuolella se on { "90" } m, ja loppuvirhe on { "184" } m korkeudessa { "193,330" } km, kun mittauksia on { "1" }. Normalisoidun estimointivirheen neliön keskiarvo koko ajon yli on { "4.4" } (noin { "3" } johdonmukaiselle paikkalohkolle). Totuus ja suodatin jakavat Auringon ja Kuun korvikkeensa. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä minkään järjestelmän palvelualuetta koskeva väite. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-9a947b61a4cb = { "2" } apulaisen suhteellinen navigointi johtajan ympärillä korkealla radalla, moottorin v{ $version } todellisesta ajosta skenaariolla scenarios/gnss-ssv-formation-heo.toml ({ "401" } epookkia). Jokaiselle apulaiselle kaksi palkkia: suhteellisen paikan RMS kahden riippumattoman absoluuttisen estimaatin erotuksesta ja suhteellisesta suodattimesta yksittäiserotetuilla pseudoetäisyyksillä. Peruslinja { "0.8" } km: { "5.1" } m ja { "1.2" } m. Peruslinja { "2.0" } km: { "4.1" } m ja { "2.1" } m. Absoluuttinen suodatin ei ole tässä johdonmukainen: normalisoidun estimointivirheen neliön keskiarvo { "187" }, kun johdonmukaiselle suodattimelle se on noin { "3" }, joten sen ilmoittama epävarmuus on aivan liian pieni. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä minkään järjestelmän palvelualuetta koskeva väite. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-d76123040989 = Avaruuskäyttäjän saatavuusmallin tallennettu vertailu julkiseen Space Service Volume -vihkoseen, ennalta rekisteröidyn ajon tallennetuista tuloksista (xval/gnss-ssv/results-run1.json, kirjoittanut moottorin v{ $version } esimerkki ssv_booklet_check). Kynnys kerrallaan toleranssin sisällä olevat solut: S0 { "13" }/{ "13" } (MET); S1 { "43" }/{ "52" } (NOT MET); S2 { "48" }/{ "52" } (NOT MET); S3 { "122" }/{ "155" } (NOT MET); S4 { "132" }/{ "156" } (NOT MET); S5 { "18" }/{ "26" } (NOT MET); S6 { "26" }/{ "26" } (MET); S7 { "0" }/{ "20" } paneelikuviota (NOT MET). Vain S0 ja S6 täyttyvät ennalta rekisteröidyssä tulkinnassa. Diagnostinen muunnelma, joka käyttää vihkosen toisia GLONASS-kulmia, tuo S1:n, S2:n ja S4:n jokaiseen soluun, mutta ei korvaa ennätysajoa. Yksikään kirjanpitorivi ei ole VALIDATED. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-74675df154dc = Lähde: <c1/>

seg-ce7ea32e67f1 = GNSS tähdistön ulkopuolella: tyyppi <c1/>

seg-389cb131fd77 = Vain ohjeellinen. Mallinnettuja tuloksia ilmoitetuista syötteistä ja simuloidusta totuudesta; ei sertifiointi, lentokelpoiseksi todennettu luku tai palveluvolyymiväite minkään järjestelmän osalta. Kshana ei lähetä mitään.

seg-a0011b278269 = Tyyppi <c1/> vastaa kysymykseen: kuinka monta GNSS-signaalia avaruusalus voi käyttää, kun se on GNSS-ratojen yläpuolella, ympärillä tai kaukana niiden ulkopuolella, kuinka vahvoja ne ovat, kuinka hyvä geometria on ja mitä aluksella oleva suodatin niillä voi tehdä? Siinä on kolme tilaa, jotka valitaan sen mukaan, mikä taulukko skenaariossa on: <c2/>, <c3/> tai <c4/> (valinnaisella <c5/>).

seg-2e4ac6b7a883 = Tila: <b>MODELLED</b>. Saatavuuspyyhkäisyjä verrataan ICG:n Space Service Volume -vihkoseen ennakkorekisteröinnin alla; katso <a1>mitä vertailu näyttää</a1> ennen kuin luotat mihinkään lukuun.

seg-a0ff58bccaa8 = Julkiset lähteet

seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } marraskuuta { "2018" }), valmistellut International Committee on GNSS (ICG), Working Group B: menetelmä (liite B), jokaisen tähdistön ratakoordinaatit (liite C), lähetyskeilanleveydet ja -tehot (taulukot B2, B6, B8, { "4.2" }), käyttäjäantennit (taulukko B10) ja julkaistut saatavuustaulukot. Se on itsekin simulaatio. Haettu skriptillä <c1/> (lukittu SHA-256), ei koskaan sisällytetty.

seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, GPS Block IIR:n ja IIR-M:n antennipaneelikuviot (Marquis, { "2014" }): mitatut L1-paneelikuviot, joita käytetään vain parametrisen korvikkeen arviointiin (kynnys S7). Haettu, ei koskaan sisällytetty, kuviodataa ei tallennettu.

seg-0a002dc0df64 = Mallin vakiot (painovoima, Maan pyöriminen, vapaan tilan häviö, kohinatiheys) ovat standardeja; Gallagherin plasmasfäärin tiheyslaki, Chapman-kerros ja radioaaltojen taitekerroinprofiili ovat julkaistuja muotoja, joita käytetään ilmoitetuilla yksinkertaisilla parametreilla (katso <c1/>).

seg-c3c3f63df966 = Kuoritila: vihkosen globaali mittari

seg-f1e153c95b13 = <c1/> sijoittaa käyttäjän pallolle (oletus { "36,000" } km korkeus nadiiriin osoittavalla puolipallomaisella antennilla, ylempi SSV; tai { "8,000" } km korkeus kaikkisuuntaisella antennilla, alempi SSV) 2,562 pisteen ikosfääriruudukolle ja laskee { "14" } päivän ajalta 1 minuutin askelin niiden (käyttäjä, epookki) -parien osuuden, joilla on vähintään yksi ja vähintään neljä signaalia, tähdistöä kohti ja yhdistettynä, sekä pisimmän katkoksen huonoimmalla käyttäjällä. Pyyhkäisy käyttää suljetun muodon näkyvyysväliä keskuskulmassa (keilakartio, Maan peitto { "6378" } km pallolla plus { "50" } km, käyttäjän puolipallo ja RF-etäisyysraja) ja ajautuu sekunneissa release-koontiversiossa; ominaisuustesti tarkistaa sen yleistä geometristä predikaattia vasten.

seg-3fb4c06c8b3f = Ratatila: kiertoradalla

seg-632fedc95af5 = <c1/> lentää käyttäjää Keplerin radalla (esiasetus: <c2/>, <c3/>, <c4/>, <c5/> (vihkosen taulukko { "5.10" }) tai <c6/>, tai elementit) ja raportoi kaistaa ja tähdistöä kohti yhden ja neljän signaalin saatavuuden, katkosten kestot, näkyvissä olevat signaalit, parhaan C/N0-arvon, tarkkuuden heikkenemiskertoimen (mediaani, 95. persentiili, pahin), pääkeilan ja sivukeilojen kautta vastaanotetut linkit sekä valinnaisen aikasarjan ja CSV:n.

seg-7bfd301cd789 = <b>Lähetyskuvio</b> (<c1/>): <c2/> (vakioteho vertailukeilasta poikkeamakulman sisällä), <c3/> (nimetty korvike: { "3" } dB astetta kohti vertailukulman yli lattiaan { "25" } dB pääkeilan alapuolella; <b>ei</b> minkään järjestelmän mitattu kuvio) tai <c4/> (itse antamasi mitattu kuvio: <c5/> tai rivinsisäinen <c6/>; Block IIR/IIR-M -paneelikuviot voi poimia skriptillä <c7/>).

seg-c1390929d9f2 = <b>Vastaanottoantennit</b>: kaikkisuuntainen, puolipallo tai vihkosen taulukon B10 suurvahvistus- ja patch-antennit, nadiiriin tai zeniittiin; jokainen linkki käyttää antennia, jolla on suurempi vahvistus.

seg-fe56ab7a2cac = <b>Raajasäteen väliaine</b> (<c1/>): Chapman-ionosfääri, plasmasfääri (Gallagherin muoto { "1988" }, plasmapause kohdassa L = { "4.5" }, kavennettu { "1,500" } km alapuolella) ja neutraali ilmakehä (taittuminen noin { "1.33" } astetta pinnalla, happiabsorptio, defokusointi) integroituna suoraa sädettä pitkin. Raportoi viistopolun TEC:n, sen plasmasfäärisen osan, lisäviiveen, tangenttikorkeuden ja hipaisun vuoksi menetetyt linkit. Suoran säteen integrointi: taittuminen raportoidaan, ei iteroida.

seg-1bad91204f6a = <b>Heikon signaalin vastaanotin</b> (<c1/>): koherentti ja epäkoherentti integrointi, databittiraja, avustus- ja pilottikanavat, Doppler-haku; hankintakynnys ilmoitetuilla havaitsemis- ja väärän hälytyksen todennäköisyyksillä sekä kantoaallon ja koodin seurantakynnykset korvaavat kiinteän C/N0-kynnyksen (alue { "10" }–{ "25" } dB-Hz). Käyttää uudelleen moottorin hankinta- ja seurantasilmukkamalleja.

seg-497126fe23e9 = Navigointitila: aluksella oleva suodatin

seg-af7919ae046e = <c1/> lentää korkealla kiertoradalla olevaa tai Kuuhun siirtyvää alusta ja ajaa yhdeksän tilan laajennetun Kalman-suodattimen (paikka, nopeus, vastaanottimen kellovirhe ja -ajautuma, auringon säteilypaineen skaala) pseudoetäisyyksillä. Totuus integroidaan pistemassapainovoimalla, J2:lla, Auringon ja Kuun kolmannen kappaleen vaikutuksella ja säteilypaineella sylinterimäisellä Maan varjolla; suodatin mallintaa painovoiman, J2:n ja kolmannet kappaleet ja estimoi säteilypaineen. Pseudoetäisyydet tulevat samasta linkkigeometriasta ja C/N0-kynnyksestä kuin pyyhkäisyissä; niiden kohina kasvaa, kun C/N0 laskee; väliaineen lisäviive (yhdessä kentän <c2/> kanssa) lisätään eikä suodatin mallinna sitä. Raportti erottaa ajon GNSS-ratojen sisällä olevan osan (alle { "20,000" } km korkeuden) yläpuolella olevasta osasta, antaa pisimmän mittauksettoman aukon ja keskimääräisen normalisoidun estimointivirheen neliön (noin { "3" } johdonmukaiselle paikkalohkolle). Aurinko ja Kuu ovat matalan tarkkuuden ympyrärata-korvikkeita.

seg-a515950c13d6 = Muodostelmatila: suhteellinen navigointi

seg-8d2b72ca56d9 = <c1/> (johtavalle alukselle tarvitaan <c2/>) lisää todellisessa anomaliassa siirrettyjä apualuksia. Jokainen alus ajaa absoluuttisen suodattimen; apualuksen paikka suhteessa johtavaan alukseen estimoidaan vähentämällä riippumattomat absoluuttiset estimaatit ja suhteellisella suodattimella molempien alusten seuraamien signaalien yksittäisdifferensoiduilla pseudoetäisyyksillä. Raportti antaa molemmat, perusviivan ja yhteisesti seurattujen signaalien määrän.

seg-dc78efcb8bcb = Mitä vertailu vihkoseen näyttää

seg-643bcfcea515 = Kynnykset ennakkorekisteröitiin (<c1/>, lisäykset { "1" }–{ "5" }) ennen täysikokoista ajoa; tulokset tiedostossa <c2/>, solut tiedostoissa <c3/>, lukittu testillä <c4/>, epäonnistumiset mukaan lukien.

seg-5498636f8d07 = mitä

seg-32c0ea7929e2 = ajo { "1" } (ennakkorekisteröity tulkinta)

seg-abe521171d2f = GLONASS-kulmavariantti (diagnostiikka)

seg-9489ef691574 = minimisäteilyteho, { "13" } signaalia, { "0.1" } dB sisällä

seg-4b7e0252355c = ylemmän SSV:n geometria (taulukko B4)

seg-e3c870085a6c = NOT MET ({ "43" } / { "52" } solua)

seg-b57b1f9b0b43 = kaikki { "52" } solua toleranssin sisällä

seg-6bf57763d120 = alempi SSV (taulukko { "5.2" })

seg-c9349a3a0185 = NOT MET ({ "48" } / { "52" })

seg-056eae8e55d1 = kaikki { "52" }

seg-805e4402f556 = ylempi SSV tasoilla 15/20/25 dB-Hz (taulukko B9)

seg-a8d9a1f66989 = NOT MET ({ "122" } / { "155" })

seg-7a6fd0eb8f77 = { "153" } / { "155" }

seg-cb1a6f558a09 = kuusi GEO-tehtävää

seg-e4759e8d2baa = NOT MET ({ "132" } / { "156" })

seg-3e59e79791e2 = kaikki { "156" }

seg-76d88834ab69 = HEO-tehtävä

seg-1c06414304a0 = NOT MET ({ "18" } / { "26" })

seg-b1656692859b = { "21" } / { "26" }

seg-d4cedd711485 = Kuu-tehtävä

seg-b52333886109 = NOT MET ({ "23" } / { "26" })

seg-479a041e2b62 = parametrinen kuvio mitattuja GPS L1 -paneelikuvioita vasten

seg-b514bc035c86 = NOT MET (RMS { "6.3" }–{ "8.8" } dB vasten { "3" } dB)

seg-dd703fdea949 = Vihkonen on sisäisesti ristiriitainen GLONASSin vertailukeilasta poikkeamakulmasta: taulukot B2 ja B6 ilmoittavat { "20" } ja { "28" } astetta, taulukko { "4.2" } ilmoittaa { "26" } ja { "34" }. Ajo { "1" } käytti ensimmäistä (mitä ennakkorekisteröinti nimesi); lähes jokainen epäonnistuminen kohdissa S1–S5 on GLONASS. Variantti, johon sitouduttiin diagnostiikkana ennen sen ajoa, käyttää jälkimmäistä, ja silloin ylempi SSV, alempi SSV ja GEO-tehtävät täsmäävät solu solulta, katkokset mukaan lukien. Variantti ei korvaa ajoa { "1" }. <b>Yksikään rivi ei ole VALIDATED</b>: vihkonen on simulaatio, tuomiosääntö vaatii S0–S3 ennakkorekisteröidyllä tulkinnalla, ja jäljellä olevia epäonnistumisia (GPS L1 tasolla { "20" } dB-Hz, HEO Galileo, QZSS ja NavIC, Kuun GLONASS-rivit) ei ole selitetty.

seg-6eecf686159b = Ajaminen

seg-adbb9c22de1c = Jokainen mukana toimitettu skenaario on typistetty ajettavaksi sekunneissa; täysikokoinen vertailu on yllä oleva esimerkki. Sama tyyppi toimii Pythonista (<c1/>), selaimesta (WebAssembly), MCP-palvelimesta (<c2/>, vain rivinsisäinen teksti: <c3/> on tiedostolähde ja hylätään, käytä kohtaa <c4/>) ja lisäosista.

seg-8fa10c8e7ab7 = MODELLED: mitään tässä ei ole verrattu mitattuun kiertoradalla tapahtuvaan GNSS-vastaanottoon. Vihkonen on simulaatio.

seg-b34e9acebec0 = Keplerin kahden kappaleen radat GNSS-tähdistöille ja käyttäjälle pyyhkäisyissä; Kuuhun siirtyminen on kahden kappaleen ellipsi, ei propagoitu rata.

seg-76aa617ba828 = Väliaine on ilmoitettu yksinkertainen malli suoran säteen integroinnilla; se ei ole avaruussääennuste.

seg-3114c4249988 = Navigointisuodatin on suunnittelututkimus: ei ohjausmanöövereitä, ei asentoa, ei monitie-etenemistä, ja totuus jakaa Auringon ja Kuun efemeridit suodattimen kanssa.

seg-2deafc0f9534 = <s1>Edellinen</s1>Kuun vertausasema

seg-23386861eebf = <s1>Seuraava</s1>Kuun kiertorata ja pinta infrastruktuurina
