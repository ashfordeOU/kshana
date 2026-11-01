# docs--kind-lunar-jamming: translations (fi)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Ei tarjota — Kshana mallintaa signaalin suorituskykyä, ei hyötykuorma- tai antennilaitteistoa. Oraakkeli (NoneKind): ei mitään: kumppanin omistama osa-alue, jolla ei ole moduulia eikä testiä tarkoituksella

seg-1f17ef6a853e = Moottorin v{ $version } skenaariolaji, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-f85a85f0c7e4 = MHz

seg-7154243aabbe = laajakaistainen

seg-cec5c06d38af = <b>MODELLED</b> Kuun omaan ympäristöön sovitettu häirintä–signaali-suhde, tehollinen C/N₀ ja lukituksen menetys selenografiselle pintakäyttäjälle Kuun pinnalla olevan (tai korotetun) häirintälähettimen alla, havainnollistavan julkisiin lähteisiin perustuvan Moonlight/LCNS-luokan satelliittitähdistön yli.

seg-edcd55ccc993 = <b>MODELLED</b> Raportti <c1/> ei enää nojaa kieltokäyräänsä yhteen skalaariin.

seg-bcb02ffed4d0 = Lähde: <c1/>

seg-612388918e36 = <c1/> (skenaariotyyppi)

seg-a91a9ad5d8d1 = Kuun omaan käyttöön tehty radiotaajuinen häirintä (jamming): satelliittikohtainen häirintä-signaalisuhde, tehollinen C/N₀ ja lukituksen menetys selenografiselle pintakäyttäjälle kuun pinnalla (tai korotetulla) olevan häirintälähettimen alla, havainnollistavan julkisista lähteistä kootun Moonlight/LCNS-luokan kuun kiertoradan satelliittitähdistön yli. Yhdistää olemassa olevan avoimen häirintäfysiikan (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) olemassa olevaan kuun taivasgeometriaan (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); geometriaa tai radiometriaa ei johdeta uudelleen. Toisin kuin Maan <c1/>-tyypissä, signaalihaara EI ole kiinteä vastaanotettu teho: kunkin satelliitin isotrooppinen vastaanotettu teho on sen oma linkkibudjetti EIRP − FSPL(vinoetäisyys), joten J/S vaihtelee satelliitista toiseen kuun etäisyyden ja korkeuskulman mukana. Raportoi YHDEN RIVIN JOKAISTA NÄKYVÄÄ (epookki, satelliitti) -LINKKIÄ KOHTI — atsimuutti, korkeuskulma, vinoetäisyys, molemmat vastaanotetut tehot, joiden erotus J/S on, J/S, nimellinen ja tehollinen C/N₀ sekä lukitustila — sekä koostetut laatumittarit tämän taulukon rinnalla (ei sen sijaan) ja saman taulukon CSV-artefaktina. Jokaisella tuotetulla numeerisella kentällä on yksikkö ja alkuperäluokka. VALIDATED-aliosatuloksilla on lähdemoduulinsa oraakkeli (häirinnänestoyhtälö ja J/S-linkki lähteestä Kaplan & Hegarty §{ "9.4" }, ulkoisesti viitattu tiedostossa tests/gnss_denied_jamming_resilience_reference.rs; kuun geometria moduulista lunar_service). Itse yhdistelmä on ristiintarkistettu riippumattomalla kahden linkkibudjetin polulla (linkbudget::received_signal_power_dbw, eri vapaan tilan vaimennuksen lauseke) tarkkuuteen { "1e-9" } dB. MODELLED: havainnollistava tähdistö, edustavat EIRP / häirintälähettimen teho / antennivahvistukset / kohinalämpötila sekä maastovarjostuksen, monitie-etenemisen, AGC-dynamiikan ja adaptiivisen nollauksen puuttuminen. Ei sertifioitu palvelunestotuote. Kun häirintälähetin on määritetty, raportti sisältää myös ESTOKÄYRÄN, JOSSA ON EPÄVARMUUSKAISTA, eikä yhdestä skalaarista luettua käyrää: täydellinen mitattu haluttu signaali C/N₀ -jakauma satelliittikohtaisen taulukon yli (n, min, p05, p25, mediaani, p75, p95, max, keskiarvo, otoskeskihajonta ja otoksen oma vinous) sekä käyrä laskettuna jokaisessa näistä järjestystunnusluvuista KAHDEN moottorin tunnistaman estokriteerin mukaan — vakiintunut tehosuhdekriteeri (J/S = { "30" } dB, kuten attack-surface- ja tracking-loop-tyypeissä) ja lukituksen menetyksen kriteeri (tehollinen C/N₀ laskee arvoon tracking_threshold_dbhz, jota tämän raportin oma tilasarake käyttää) — estotason molemmilla akseleilla (vaadittu häirintälähettimen EIRP skenaarion etäisyydellä, estoetäisyys skenaarion EIRP:llä). Kaistan reunat OVAT contour(p05) ja contour(p95), sama suljetun muodon kuvaus sovellettuna otoksen omiin kvantiileihin: ei otokseen sovitettu sigma eikä mediaani ± k·stdev, ja stdev tuotetaan jatkuvuuden vuoksi eikä mikään käytä sitä. Kvantiilille, joka on jo seurantakynnyksen tasolla tai sen alapuolella, ei ole äärellistä estävää J/S:ää, ja sen lukituksen menetyksen sarakkeet ovat null laskettuine syineen, eivät koskaan rajattu säde.

seg-6693c3ebcb07 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: lunar-jamming | { "4" } satelliittia, { "12" } epookkia, { "38" } linkkiä pisteestä (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (keskiarvo { "35.622" }) | { "0" } LOST | saatavuus { "0.167" } / { "0.167" } nimellisestä

seg-6e01b6354e40 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-c61fb6515ed9 = Esimerkki <c1/> asettaa muun muassa:

seg-6fe8b3c6c584 = Moottorin kirjoittama kaavio skenaariolle scenarios/lunar-jamming.toml, tyyppi lunar-jamming

seg-d4ae2f589112 = <b>MODELLED</b> Kuun omaan käyttöön tehty häirintä-signaalisuhde, tehollinen C/N₀ ja lukituksen menetys selenografiselle pintakäyttäjälle kuun pinnalla (tai korotetulla) olevan häirintälähettimen alla, havainnollistavan. Oraakkeli (ReferenceImpl): Yhdistelmän ristiintarkistus riippumattomalla repon sisäisellä koodipolulla: jokainen linkkikohtainen J/S johdetaan uudelleen kahden linkkibudjetin erotuksena, jotka on laskettu funktiolla linkbudget::received_signal_power_dbw, jonka vapaan tilan vaimennus on yksittäinen lauseke { "20" }·log10(4πRf/c) eikä kolmen termin summa, jota jamming::free_space_path_loss_db käyttää — ne täsmäävät tarkkuuteen < { "1e-9" } dB jokaisella rivillä (mitattu pahin tapaus { "7.11e-14" } dB, eli liukulukujen pyöristysvirhe)

seg-dbe54e7cc800 = <b>MODELLED</b> Raportin <c1/> estokäyrä ei enää nojaa yhteen skalaariin. Se tuottaa täydellisen mitatun halutun signaalin C/N₀ -jakauman satelliittikohtaisen t. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus moottorin omia eteenpäin-funktioita vasten, mikä on kaikki, mitä tämä ominaisuus voi rehellisesti väittää. Jokainen käyrän piste on suljetun muodon käänteisratkaisu, ja jokainen käänteisratkaisu tarkistetaan syöttämällä sen vastaus takaisin ETEENPÄIN-funktion läpi, jolla raportin omat rivit pisteytettiin: J/S-sarake funktion jamming::effective_cn0_dbhz kautta (jonka on palautettava tracking_threshold_dbhz tarkkuudella < { "1e-9" } dB-Hz), etäisyyssarake

seg-d48926e62856 = MODELLED: havainnollistava tähdistö, edustavat EIRP / häirintälähettimen teho / antennivahvistukset / kohinalämpötila sekä maastovarjostuksen, monitie-etenemisen, AGC-dynamiikan ja adaptiivisen nollauksen puuttuminen. (tyyppiluettelo (<c1/>))

seg-c455dbcb9f8c = MODELLED. Tähdistö on havainnollistava, julkisista lähteistä koottu Moonlight/LCNS-luokan geometria (ei todellinen efemeridi; ei yhteyttä eikä hyväksyntää), ja häiriömalli on linkkibudjetti: ei häirintälähettimen maastovarjostusta (ensimmäisen kertaluvun ilmiö etelänapa-alueen maastossa), ei monitie-etenemistä, ei AGC:n lähi-/kaukodynamiikkaa, ei adaptiivista nollausta, ei hankinta-seuranta-hystereesiä. (skenaariotiedoston kommentti, rivit { "26" } - { "30" })

seg-da57cc7f1aa4 = Kuun pintanavigoinnin radiotaajuinen häirintä (satelliittikohtainen J/S) on MODELLED, ei validoitu: sitä on tarkistettu tämän saman koodikannan erillistä toteutusta vastaan, joka on riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-dba1589d3c1e = Kuun estokäyrä mitatun C/N₀-hajonnan epävarmuuskaistalla on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-a2889fb2b42a = Aihesivu: <a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>Edellinen</s1>lunar-interop-export

seg-02568469f628 = <s1>Seuraava</s1>lunar-joint-od-clock
