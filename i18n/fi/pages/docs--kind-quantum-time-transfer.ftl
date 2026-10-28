# docs--kind-quantum-time-transfer: translations (fi)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = Aihesivu: <a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> Kaksisuuntainen/TWSTFT (Sagnac), GNSS yhteisnäkymä, PPP; linkin värinä→etäisyys. Oraakkeli (ExternalDataset): Sagnac-suuruus tarkistettu arvovaltaista JULKAISTUA ARVOA vasten — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), yhtälö { "1.29" }: itään suuntautuva päiväntasaajan kiertomatka kerryttää { "207.4" } ns (2ωA_E/c²); kshana toistaa { "207.386" } ns. Riippumattomasti vahvistettu RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), joka kantaa saman 2Aω/c²-geometrian. Yhdistetty BIPM TWSTFT -transponderi/yhteisnäkymä/

seg-a8beb8dfc757 = Ajansiirron virhebudjetointi on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-bb07c8ee153f = <b>PARTNER</b> Ei tarjota — vain suorituskykymalleja; kylmäatomi-/kellolaitteisto on kumppanin. Oraakkeli (NoneKind): ei mitään: kumppanin omistama ala, tarkoituksella ilman moduulia ja testiä

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Yksi toistettava TradeEvidence-olio (kiinteä kehys: skenaario+siemenluku+moottori; yhteiset FoM-kohtaiset kvantti-vs.-klassinen-arvot napaisuudeltaan oikealla hyödyllä, valinnainen { "95" }%. Oraakkeli (InternalConsistency): Suljetun muodon hyöty-/voittajaidentiteetit + uskollinen kääre olemassa olevalle quantum_trade::TradeResultille; rehellisyys sidottu edustavuuskirjanpitoon (ledger) ja varmennusmerkintöihin

seg-eb75c6a4dcec = Kvantti-vs.-klassinen-kauppatodiste (yhteinen muoto) on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-eee91dc5741d = Lähde: <c1/>

seg-05060df7f0b7 = <c1/> (skenaariotyyppi)

seg-540545e6f846 = MODELLED luotettu kvanttiajoitusketju: päästä päähän ulottuva kvantti- (optinen hilakello + lomittuminen/yksifotonilinkki) vs. klassinen (CSAC + RF-kaksisuuntainen) ajansiirtobudjetti, uudelleenkäytetty ajoituksen suojaustaso + viive-/toistohyökkäyksen turvallisuuden laatumittari (1-P_md), kellopoikkeaman havaitsemistodennäköisyys + CUSUM-latenssi sekä kvantti-vs.-klassinen-kauppa rehellisenä TradeEvidencena edustavuuden ja lentoon-puuttuvien-asioiden-tietueen kanssa. Havainnollistavat julkisista lähteistä kootut laite-/linkkiparametrit; mallintaa luokan, ei TRL-/lento-/sertifiointiväitettä.

seg-ed79bfe80fe7 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: quantum-time-transfer | kvanttiketju 1.233e-12s vs. klassinen 5.292e-9s | PL { "555.24" } ns | turvallisuus Pd { "1.000" } (Pfa { "1e-3" }) | poikkeama Pd { "0.761" } | kauppa: kvantti voittaa 2/2 | MODELLED

seg-80e94491c3df = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-6b03fa15a60d = Esimerkki <c1/> asettaa muun muassa:

seg-09760f892c7b = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-time-transfer.toml, tyyppi quantum-time-transfer

seg-873de4d05663 = <b>VALIDATED</b> Taulukkomuotoisen CUSUM-ilmaisimen pahimman tapauksen havaitsemisviive (⌊h/(z−k)⌋+{ "1" }) ja kontrollin ulkopuolinen keskimääräinen ajopituus, joita käyttävät ajoituksen suojaustason ja harhautusmonitorit. Oraakkeli (ExternalDataset): Julkaistu taulukkomuotoinen CUSUM-ARL: Siegmundin ({ "1985" }) Brownin liikkeen approksimaatio (Hawkins & Olwell { "1998" }, yhtälö { "3.7" }) ristiinankkuroituna Montgomeryn, Introduction to Statistical Quality Control (Wiley), ARL-taulukoihin, kun k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministinen viive täsmää täsmälleen ensimmäisen ylityksen oraakkeliin. Yhdistetty TPL-raja pysyy tasolla MODELLED

seg-b51e62b8dc63 = MODELLED luotettu kvanttiajoitusketju: päästä päähän ulottuva kvantti- (optinen hilakello + lomittuminen/yksifotonilinkki) vs. klassinen (CSAC + RF-kaksisuuntainen) ajansiirtobudjetti, uudelleenkäytetty ajoituksen suojaustaso + viive-/toistohyökkäyksen turvallisuuden laatumittari (1-P_md), kellopoikkeaman havaitsemistodennäköisyys + CUSUM-latenssi sekä kvantti-vs.-klassinen-kauppa rehellisenä TradeEvidencena edustavuuden ja lentoon-puuttuvien-asioiden-tietueen kanssa. (tyyppiluettelo (<c1/>))

seg-dee0faf63e7f = Luotettu kvanttiajoitus — päästä päähän ulottuva ajansiirtoketju, turvallinen jakelu, poikkeamahavaitseminen ja kvantti-vs.-klassinen-kauppa. MODELLED; havainnollistavat, julkisista lähteistä kootut laite-/linkkiparametrit; mallintaa luokan, ei TRL-/lentoväitettä. (skenaariotiedoston kommentti, rivit { "1" } - { "3" })

seg-6e9f5dfca6b0 = Luotettu kvanttiajoitus (ajansiirto + turvallinen jakelu + poikkeama) on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-d3665be74ff1 = <s1>Edellinen</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>Seuraava</s1>quantum-trade

seg-a349aa76b0ed = PARTNER
