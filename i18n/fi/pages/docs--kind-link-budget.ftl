# docs--kind-link-budget: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän lajin.

seg-a3697ad561db = Hz

seg-cec5c06d38af = <b>MODELLED</b> Kuun omaan ympäristöön sovitettu häirintä–signaali-suhde, tehollinen C/N₀ ja lukituksen menetys selenografiselle pintakäyttäjälle Kuun pinnalla olevan (tai korotetun) häirintälähettimen alla, havainnollistavan julkisiin lähteisiin perustuvan Moonlight/LCNS-luokan satelliittitähdistön yli.

seg-120fcc840b87 = Lähde: <c1/>

seg-738aa7d45efb = <c1/> (skenaariotyyppi)

seg-953188c11165 = Yksisuuntainen linkkibudjetti CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä: vapaan tilan etenemishäviö, C/N₀, Eb/N₀, marginaali ja linkin sulkeutuminen lähetyksen EIRP:lle, vastaanoton G/T:lle, etäisyydelle, datanopeudelle ja kaistalle (s|x|ka) vaadittua Eb/N₀:aa vastaan. Deterministinen insinöörilaskelma annetuista syötteistä (ei kalibroitu päätelaitteen datalehti).

seg-6697c741d09c = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: link-budget: x-band, { "2000" } km, { "1000000" } bit/s -> FSPL { "177.0" } dB, Eb/N0 { "96.6" } dB, marginaali { "92.1" } dB (sulkeutuu)

seg-2305502051b6 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-588476f4ae75 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-ebb923e1a3b5 = Tuloksen nimike (moottorin oma): Yksisuuntainen linkkibudjetti CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä (EIRP − FSPL − L_other + G/T − k); deterministinen insinöörilaskelma annetuista syötteistä, EI kalibroitu päätelaitteen datalehti

seg-bd375631bc7e = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/link-budget.toml, tyyppi link-budget

seg-4f92669c3946 = <b>VALIDATED</b> Vapaan tilan etenemishäviö, C/N₀, Eb/N₀, marginaali ja linkin sulkeutuminen CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä EIRP:lle/G·T:lle/etäisyydelle/nopeudelle/kaistalle vaadittua Eb/N₀:aa vastaan. Testit: <a1>one_way_link_budget_reference.rs</a1>.

seg-bfaeb6f1cc5a = <b>VALIDATED</b> Vapaan tilan etenemishäviö, C/N₀, Eb/N₀, marginaali ja linkin sulkeutuminen CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä EIRP:lle/G·T:lle/etäisyydelle/nopeudelle/kaistalle vaadittua Eb/N₀:aa vastaan. Runn. Oraakkeli (ExternalDataset): Julkaistu syväavaruuden tietoliikenteen suunnittelun hallintataulukko kiinnitettyinä numeerisina vektoreina: DESCANSO / J. H. Yuen (toim.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Table 1-1 (Galileo X-band) — kshana kokoaa taulukon rivierät uudelleen ja toistaa sen julkaistut päästä päähän -arvot L_fs { "290.54" } dB ja Pr/N0 { "54.6" } dB-Hz; vapaan tilan häviö tarkistettu myös ITU-R P.525:tä vastaan

seg-2598c2360113 = <b>MODELLED</b> Raportti link-budget ilmoittaa jokaisen absoluuttisen vakion, josta sen oma marginaali laskettiin -- vapaan tilan häviössä käytetyn kantoaaltotaajuuden, EIRP:n, luvun. Oraakkeli (InternalConsistency): Ei ulkoista oraakkelia: tämä on itsekuvaus yhtälölle, joka on jo validoitu julkaistua suunnittelun hallintataulukkoa vastaan (ks. yksisuuntaisen linkkibudjetin rivi). Se kirjataan, koska sen puuttuminen oli mitattu vika -- julkaistun d1_rate_gain_beamwidth.csv-tiedoston toisto vaati yhden tehollisen vakion takaisinratkaisun tarkkuuteen { "0.0034" } dB kaikilta kolmeltakymmeneltä riviltä, ja moottori sekä nimeää nyt tuon yhdistelmän että todistaa testillä

seg-c779823e860c = Valinnainen: vastaanoton järjestelmän kohinalämpötila (K). Se EI ole linkkiyhtälön syöte -- se tarvitsee vain suhteen G/T -- mutta sen ilmoittaminen antaa raportin laskea myös vastaanottoantennin hyödyn, jonka ansioluku edellyttää (G = G/T + { "10" }*log10(T_sys)). Jätettäessä pois hyötyjako puuttuu raportista eikä sitä oleteta. tsys_k = { "300.0" } (skenaariotiedoston kommentti, rivit { "21" }–{ "25" })

seg-d717412c4f06 = Linkkibudjettiraportin itsekuvaus on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-ffbc9de75306 = <s1>Edellinen</s1>leo-signal

seg-59d4cb995cb9 = <s1>Seuraava</s1>lunar-attack-surface
