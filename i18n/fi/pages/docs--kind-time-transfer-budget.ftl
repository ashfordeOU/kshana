# docs--kind-time-transfer-budget: translations (fi)

seg-f42465f7d066 = ns

seg-dfe78b9d0811 = GHz

seg-cd04f5662884 = MODELLED. (lajiluettelo (<c1/>))

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

# text
# c1: docs/kinds/by-kind/time-transfer-budget.md
seg-937ebbbd612c = Lähde: <c1/>

# text
# c1: time-transfer-budget
seg-6af6f07f5f5a = <c1/> (skenaariolaji)

# text
seg-9a2bb9809aed = Kaksisuuntainen satelliittiaika- ja taajuudensiirto kahden aseman välillä geostationaarisen releen kautta: kaksisuuntainen yhtälö ratkaistuna suureelle T_A - T_B jokaisen ei-resiprookkisen termin kanssa (aseman laitteiston viiveet, Ku-kaistan ionosfääri, transponderi, Sagnac), neliöllinen epävarmuusbudjetti, jonka tyypin A termi on simuloidun linkin TDEV keskiarvoistusajalla, simuloitu linkki valkoisella ja flicker-vaihekohinalla sekä vuorokautisella ei-resiprookkisuudella, sekä minkä tahansa annetun BIPM Circular T Section { "1" } -sarjan, MJD,ns-CSV:n tai IGS RINEX -aseman kellotallenteiden vakaus (nopeus, residuaalin RMS, TDEV, ADEV). MODELLED.

# text
# c1: scenarios/time-transfer-budget.toml
seg-a4f8e9a09026 = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: time-transfer-budget: europe - north-america offset { "12.500" } ns (Sagnac { "204.365" } ns, ionosphere { "0.0213" } ns); combined u { "1.087" } ns (type A { "0.031" } ns at { "86400" } s); { "0" } real series (MODELLED)

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
seg-0353d795ebdf = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: uplink_ghz
# c2: downlink_ghz
# c3: true_offset_ns
# c4: flicker_noise_ns
# c5: diurnal_amplitude_ns
# c6: reciprocity_bias_ns
# c7: step_s
# c8: span_days
# c9: averaging_s
# c10: seed
# c11: series
seg-fe3afa366df2 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/time-transfer-budget.toml
seg-00026a1d3760 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-2409cc9397c7 = Tuloksen tunniste (moottorin oma): MODELLED — TWSTFT:n kaksisuuntainen yhtälö (aseman viiveet, Ku-kaistan ionosfääri, transponderi, Sagnac) ratkaistuna ilmoitetuista viiveistä, neliöllinen epävarmuusbudjetti, jossa simuloidun linkin TDEV on tyypin A termi, simuloitu linkki flicker-vaihekohinalla ja vuorokautisella ei-resiprookkisuudella sekä minkä tahansa r:n vakaus

# attr:alt
seg-92d3c84024d7 = Moottorin kirjoittama kaavio skenaariolle scenarios/time-transfer-budget.toml, laji time-transfer-budget

# text
seg-83b9c66b9e92 = <b>MODELLED</b> TWSTFT:n kaksisuuntainen yhtälö ratkaistuna suureelle T_A - T_B aseman lähetys- ja vastaanottoviiveillä, Ku-kaistan ionosfäärin ylös-/alaslinkin epäsymmetrialla, transponderin viive-erolla ja Sagnac-termeillä, sen tarkkaa suoraa mallia vastaan; neliöllinen epävarmuus

# text
seg-58cf4086c7a5 = <b>MODELLED</b> TWSTFT:n kaksisuuntainen yhtälö ratkaistuna suureelle T_A - T_B aseman lähetys- ja vastaanottoviiveillä, Ku-kaistan ionosfäärin ylös-/alaslinkin epäsymmetrialla, transponderin viive-erolla. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: suora malli ja ratkaistu yhtälö vastaavat toisiaan tarkkuudella { "1e-15" } s, Sagnac-termi on yhtä suuri kuin moduulin riippumaton BIPM 2A omega/c^{ "2" } -silmukkamuoto, ionosfäärin termi on { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, ja kohinaprosessit osoittavat odotetut TDEV-muotonsa. MIKÄ EI OLE: yhtään oikeaa TWSTFT-mittausta tai kalibrointiraporttia ei ole verrattu; ilmoitetut viiveet ja epävarmuudet ovat syötteitä, eivät mitattuja; t

# text
# c1: label
seg-15de1cdaa684 = MODELLED — TWSTFT:n kaksisuuntainen yhtälö (aseman viiveet, Ku-kaistan ionosfääri, transponderi, Sagnac) ratkaistuna ilmoitetuista viiveistä, neliöllinen epävarmuusbudjetti, jossa simuloidun linkin TDEV on tyypin A termi, simuloitu linkki flicker-vaihekohinalla ja vuorokautisella ei-resiprookkisuudella sekä minkä tahansa annetun oikean UTC-UTC(k)- tai aseman kellosarjan vakaus; ei verrattu oikeaan TWSTFT-linkkiin (tulos <c1/>)

# text
seg-70448ca49780 = Kaksisuuntainen satelliittiaika- ja taajuudensiirto (TWSTFT) kahden ILLUSTRATIVE-aseman välillä, toinen Keski-Euroopassa ja toinen Pohjois-Amerikan itäosassa, geostationaarisen releen kautta kohdassa { "10" } deg W. Ajo ratkaisee kaksisuuntaisen yhtälön suureelle T_A - T_B ilmoitetuista laitteisto-, transponderi-, ionosfääri- (Ku-kaista, 14/11 GHz) ja Sagnac-termeistä. Se muodostaa epävarmuusbudjetin, jonka tilastollinen termi on yhden päivän TDEV simuloidusta (skenaariotiedoston kommentti, rivit { "1" }–{ "8" })

# text
seg-4b0d23aed0ab = TWSTFT:n kaksisuuntainen yhtälö, epävarmuusbudjetti ja linkin vakaus flicker-kohinalla ja vuorokautisella ei-resiprookkisuudella on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon eli analyyttistä identiteettiään vastaan — se paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-52e06909ccc5 = <s1>Edellinen</s1>terrain-slam

# text
seg-a22fa1c51042 = <s1>Seuraava</s1>timetransfer
