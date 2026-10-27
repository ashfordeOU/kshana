# docs--kind-campaign: translations (fi)

seg-8784979d6569 = dBW

seg-68a2bcb6eedd = Lähde: <c1/>

seg-24ce6aee5e53 = <c1/> (skenaariolaji)

seg-931a3d27c0f0 = Moottorin v{ $version } skenaariolaji, perhe <a1>Kampanjat</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-a07990e776cb = Kampanja: olemassa olevat skenaariolajit koottuna yhdeksi ajoksi, jossa jokainen luku luetaan nimetyn lajin todellisesta ajosta. Neljä osiota missä tahansa yhdistelmässä. PHASES: ketjutettu tehtävä yhdellä jaetulla aikajanalla -- jokainen vaihe ajaa yhden tai useamman skenaarion (esimerkiksi jamming, sitten spoofing, sitten holdover-tilassa oleva kello inertiaalinavigointijärjestelmän rinnalla vapaasti etenevän, sitten eheyshälytys, sitten palautuminen), niiden tulosteet luetaan nimettyihin kanaviin (kellon aikavirhe vartiorajaansa vasten, kantoaalto-kohinatiheyssuhde seurantalattiaa vasten, suojaustaso hälytysrajaa vasten, paikkavirhe, seuraavat satelliitit, hälytyslippu) lajikohtaisella esiasetuksella tai nimenomaisilla tulospoluilla ja näytteistetään uudelleen yhteiselle ruudukolle nollannen kertaluvun pidolla, vaiherajojen ja tapahtumien kanssa; tila siirretään eteenpäin kantamalla (carry: kanava jatkuu edellisen vaiheen loppuarvosta), luovutuksella (handoff: edellisen vaiheen luku kirjoitetaan tämän vaiheen skenaarioon) ja arvolla end_at (vaihe päättyy ajon laskemaan hetkeen, kuten harhautuksen monitorin havaitsemisaikaan). SWEEP: ruudukko yhden–kolmen pisteillä erotetun minkä tahansa lajin skenaarioavaimen yli (kokonaislukusegmentti indeksoi taulukkotaulukon, kuten kohdassa system.2.sisre_m), mittarit luetaan tulospolulla ja, kun ajoja on yli yhden, siemenluvulla alustettu Monte Carlo -joukko jokaisessa solmussa. MONTE_CARLO: realisaatio k ajetaan siemenluvulla base_seed + k; jokainen mittari raportoi keskiarvon, keskihajonnan, lähimmän sijan 5./50./95. persentiilit ja kiinteällä siemenluvulla alustetun bootstrap-{ "95" }%:n luottamusvälin keskiarvolle. COMPOSE: useita skenaarioita jaetuilla arvoilla (yhden häirintälähettimen teho ja paikka kirjoitettuna meri- ja tievastaanottimeen), yhdistetyllä parhaan/pahimman tapauksen yhteenvedolla. Tulos sisältää kampanjan hajautuksen, tiivisteen kaikkien jäsentulosten yli ja yksikkömerkinnän jokaiselle tuotetulle luvulle; yhteentoimivuusviennit kirjoittavat jokaisen geometrian sisältävän jäsenskenaarion omana tiedostojoukkonaan. Koostumuksen identiteetit testataan: yhden vaiheen kampanja toistaa erillisen ajon bitti bitiltä, kiinteällä siemenluvulla alustettu joukko on tavutasolla vakaa, ja valkoisen taajuuskohinan kellolla joukon keskiarvo osuu raportoidun välin sisälle ja hajonta vastaa arvoa sqrt(q_wf * tau). MODELLED: additiivinen kantaminen ja nollannen kertaluvun pito ovat mallinnusvalintoja, ja jokainen vaihe kantaa sen ajaneen lajin nimikkeen.

seg-05e842f80dbb = Yksi ajo tiedostosta <c1/> tiivistyy näin: campaign 46aa07cb58fb | Häirintälähettimen tehon pyyhkäisy: saatavuus ja J/S lähetystehoa vasten | lajin <c2/> pyyhkäisy: { "13" } solmua yli [jammer_power] | { "13" } jäsenajoa (MODELLED)

seg-bf339fa14645 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-abd3eac6da41 = Esimerkki <c1/> asettaa muun muassa:

seg-c4f955d5f506 = saatavuus

seg-7bcf77278958 = { "22" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-38faa927b2bd = lin

seg-1a33a746eeee = Tulosnimike (moottorin oma): MODELLED olemassa olevien skenaariolajien koostaminen. Jokainen luku luetaan nimetyn lajin todellisesta ajosta; ketjutus (kanavan additiivinen kantaminen vaiheen rajan yli, nollannen kertaluvun pito aikajanaruudukolle, lasketulla hetkellä päättyvä vaihe) on mallinnusvalinta, ja jokainen vaihe kantaa nimikkeen

seg-b2c7cd1f9712 = Moottorin kirjoittama kaavio skenaariolle scenarios/campaign-sweep-jammer-power.toml, laji campaign

seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect ja kampanja-ajaja: valinnainen taulukko [monitors] ajaa IQ-monitorit jokaisessa solussa ajajan yhdellä läpikäynnillä. Testit: <a1>iq_campaign.rs</a1>.

seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) ja iq::campaign::report::rocs: monitoreja sisältävän kampanjan jokainen solu säilyttää hälytyslajia ja kanavaa kohden monitorin oman testisuureen maksimin kunkin ilmoitetun tapahtumaikkunan yli (positiivinen) ja yli

seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) ja <c1/> komennolla <c2/>, Python <c3/> ja MCP-työkalu labfit (kampanjakansiot vain sen työhakemiston sisällä): lukee <c4/>-tulostekansion sen Testit: <a1>iq_labfit_followup.rs</a1>.

seg-f16a176dc1f8 = <b>MODELLED</b> Lajin <c1/> vaiheet: jokainen vaihe ajaa yhden tai useamman olemassa olevan lajin skenaarion funktiolla run_toml, lukee niiden tulosteet nimettyihin kanaviin (kellon aikavirhe ja vartioraja, keskimääräinen tehollinen kantoaalto-kohinatiheyssuhde ja seurantalattia, v Testit: <a1>campaign_composition_reference.rs</a1>.

seg-be831b52a339 = ja { "4" } lisää matriisissa.

seg-cc2ad9e12064 = <b>MODELLED</b> Geometrinen J/S-linkkibudjetti, häirinnänkestävä C/N₀, satelliittikohtainen lukituksen menetys. Oraakkeli (InternalConsistency): Häirinnänkestävän C/N₀:n linkkibudjettiyhtälö ristiintarkistettuna riippumatonta numpy-uudelleenjohtoa vastaan (jakaa saman suljetun muodon → InternalConsistency) sekä todellinen JammerTest-2024-C/N₀-heikkenemisen luonnehdinta. { "0.30" } kierros { "2" }, estetty (pysyy MODELLED): mitattua JammerTest { "2024" } C/N0-laskua ei ajettu linkkibudjettiennustetta vasten (ennakkorekisteröity 6a66994b, { "3" } dB:n sisällä), koska F8.1-antennin paikka ja suuntaus

seg-59afd80736c5 = <b>PARTNER</b> Ei tarjota — Kshana mallintaa signaalin suorituskykyä, ei hyötykuorma- tai antennilaitteistoa. Oraakkeli (NoneKind): ei mitään: kumppanin omistama osa-alue, jolla ei ole moduulia eikä testiä tarkoituksella

seg-fa3ad6babe54 = <b>MODELLED</b> Lajin <c1/> pyyhkäisy (yhdestä kolmeen pisteillä erotettua avainta mitä tahansa lajia, yleisen pyyhkäisyn akseliarvoilla, valinnaisesti joukko jokaisessa solmussa) ja osio monte_carlo. Oraakkeli (InternalConsistency): Vaihesatunnaiskävelyn suljettu muoto valkoisessa taajuuskohinassa, varianssi q_wf tau (NIST Technical Note { "1337" }), tilastokoneistolle, ja tavutason yhtäläisyys erillisten ajojen kanssa siementämiselle. Se tarkistaa joukkolaskennan moottorin omalla kellomallilla, ei ulkoista aineistoa

seg-c15b5ac32282 = MODELLED olemassa olevien skenaariolajien koostaminen. Jokainen luku luetaan nimetyn lajin todellisesta ajosta; ketjutus (kanavan additiivinen kantaminen vaiheen rajan yli, nollannen kertaluvun pito aikajanaruudukolle, lasketulla hetkellä päättyvä vaihe) on mallinnusvalinta, ja jokainen vaihe kantaa sen tuottaneen lajin nimikkeen. (tulos <c1/>)

seg-9e33dcc39c27 = MODELLED: additiivinen kantaminen ja nollannen kertaluvun pito ovat mallinnusvalintoja, ja jokainen vaihe kantaa sen ajaneen lajin nimikkeen. (lajiluettelo (<c1/>))

seg-adcc6ea59840 = MODELLED: kuten laji <c1/> on. (skenaariotiedoston kommentti, rivi { "14" })

seg-143f3f1cc521 = GNSS-estetyn ympäristön häirintäkestävyys (jamming) on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-d1c11e493795 = Parametripyyhkäisyt ja siemenluvulla alustetut Monte Carlo -joukot minkä tahansa skenaariolajin yli ovat MODELLED, eivät validoituja: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-edbda7aca5b9 = Perhesivu: <a1>Kampanjat</a1>

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-c4ed27a559df = Aihesivu: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-774e035da605 = <s1>Edellinen</s1>body-pnt

seg-fadd92303a4d = <s1>Seuraava</s1>cislunar-arc-recovery
