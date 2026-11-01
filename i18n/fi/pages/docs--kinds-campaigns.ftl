# docs--kinds-campaigns: translations (fi)

seg-b03d56f501c3 = Tyyppi

seg-a07990e776cb = Kampanja: olemassa olevat skenaariolajit koottuna yhdeksi ajoksi, jossa jokainen luku luetaan nimetyn lajin todellisesta ajosta. Neljä osiota missä tahansa yhdistelmässä. PHASES: ketjutettu tehtävä yhdellä jaetulla aikajanalla -- jokainen vaihe ajaa yhden tai useamman skenaarion (esimerkiksi jamming, sitten spoofing, sitten holdover-tilassa oleva kello inertiaalinavigointijärjestelmän rinnalla vapaasti etenevän, sitten eheyshälytys, sitten palautuminen), niiden tulosteet luetaan nimettyihin kanaviin (kellon aikavirhe vartiorajaansa vasten, kantoaalto-kohinatiheyssuhde seurantalattiaa vasten, suojaustaso hälytysrajaa vasten, paikkavirhe, seuraavat satelliitit, hälytyslippu) lajikohtaisella esiasetuksella tai nimenomaisilla tulospoluilla ja näytteistetään uudelleen yhteiselle ruudukolle nollannen kertaluvun pidolla, vaiherajojen ja tapahtumien kanssa; tila siirretään eteenpäin kantamalla (carry: kanava jatkuu edellisen vaiheen loppuarvosta), luovutuksella (handoff: edellisen vaiheen luku kirjoitetaan tämän vaiheen skenaarioon) ja arvolla end_at (vaihe päättyy ajon laskemaan hetkeen, kuten harhautuksen monitorin havaitsemisaikaan). SWEEP: ruudukko yhden–kolmen pisteillä erotetun minkä tahansa lajin skenaarioavaimen yli (kokonaislukusegmentti indeksoi taulukkotaulukon, kuten kohdassa system.2.sisre_m), mittarit luetaan tulospolulla ja, kun ajoja on yli yhden, siemenluvulla alustettu Monte Carlo -joukko jokaisessa solmussa. MONTE_CARLO: realisaatio k ajetaan siemenluvulla base_seed + k; jokainen mittari raportoi keskiarvon, keskihajonnan, lähimmän sijan 5./50./95. persentiilit ja kiinteällä siemenluvulla alustetun bootstrap-{ "95" }%:n luottamusvälin keskiarvolle. COMPOSE: useita skenaarioita jaetuilla arvoilla (yhden häirintälähettimen teho ja paikka kirjoitettuna meri- ja tievastaanottimeen), yhdistetyllä parhaan/pahimman tapauksen yhteenvedolla. Tulos sisältää kampanjan hajautuksen, tiivisteen kaikkien jäsentulosten yli ja yksikkömerkinnän jokaiselle tuotetulle luvulle; yhteentoimivuusviennit kirjoittavat jokaisen geometrian sisältävän jäsenskenaarion omana tiedostojoukkonaan. Koostumuksen identiteetit testataan: yhden vaiheen kampanja toistaa erillisen ajon bitti bitiltä, kiinteällä siemenluvulla alustettu joukko on tavutasolla vakaa, ja valkoisen taajuuskohinan kellolla joukon keskiarvo osuu raportoidun välin sisälle ja hajonta vastaa arvoa sqrt(q_wf * tau). MODELLED: additiivinen kantaminen ja nollannen kertaluvun pito ovat mallinnusvalintoja, ja jokainen vaihe kantaa sen ajaneen lajin nimikkeen.

seg-b2c7cd1f9712 = Moottorin kirjoittama kaavio skenaariolle scenarios/campaign-sweep-jammer-power.toml, laji campaign

# text
# c1: docs/kinds/campaigns.md
seg-ea93f81fa08b = Lähde: <c1/>

# text
seg-7f8e8af56bc0 = Kampanjat (skenaariolajiperhe)

# text
seg-c8012ee549ea = { "1" } skenaariolaji, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
# c1: kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-09ed7c4e175c = Aihesivut: <a1>CAMPAIGNS</a1>. Aja yksi: <c1/>. Kaikki perheet: <a2>KINDS.md</a2>.

# attr:alt
seg-b49ec180e810 = Kuvakooste moottorin kirjoittamista kaavioista perheen Kampanjat lajeille

# text
seg-4e31c8daf798 = Kirjanpito

# text
seg-b2016159c9d0 = Kampanja: olemassa olevat skenaariolajit koottuna yhdeksi ajoksi niin, että jokainen luku luetaan nimetyn lajin oikeasta ajosta.

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-25148644a262 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-e0334a6899b6 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>campaign</a1>.

# text
seg-906f63ffbc30 = <s1>Edellinen</s1>Käytännesäännöt

# text
seg-cdf23ced49bd = <s1>Seuraava</s1>Kellot, ajoitus ja holdover
