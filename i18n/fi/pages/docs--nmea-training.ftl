# docs--nmea-training: translations (fi)

seg-2247a2344710 = Merkitys

seg-45425f378b61 = merkitys

seg-6940543aa3c0 = merkkijono

seg-f5e7215e6835 = objekti

seg-c5fb6b91dc68 = astetta

seg-99427ab75a03 = kenttä

seg-bbcdd898d24d = kokonaisluku

# text
# c1: docs/NMEA-TRAINING.md
seg-ba00d0453fbf = Lähde: <c1/>

# text
# c1: kshana nmea-scenario
seg-738956d0a4b9 = NMEA-harjoitusvirrat: <c1/>

# text
seg-3663955f80c7 = Merenkulkuakatemiat ja simulaattorikeskukset voivat syöttää Kshanan tuottamaa NMEA { "0183" } -dataa siltasimulaattoriin tai merikarttaplotteriin, jotta miehistöt oppivat tunnistamaan GNSS-häirinnän (jamming) ja harhautuksen (spoofing).

# text
# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Vain harjoitus- ja testauskäyttöön.</b> Tuotetut virrat ovat synteettisiä. Niitä ei saa koskaan syöttää aluksen todellisiin navigointijärjestelmiin. Kshana on ohjeellinen, ei tyyppihyväksytty navigointilaite. Jokainen virta alkaa ja toistaa kymmenen sekunnin välein oman merkkilauseensa <c1/>, jonka vastaanottimet ohittavat; valitsin <c2/> poistaa sen simulaattorista, joka hylkää tuntemattomat lauseet. Tämä kirjoittaa NMEA-<b>vain tekstiä</b>: RF-, IQ- tai aaltomuotolähtöä ei ole, eikä mikään lähetä muuta kuin tekstin nimeämääsi osoitteeseen.

# attr:alt
seg-b66ff9ca2ff4 = Harjoitusvirta skenaariosta coastal-drag-off (moottori v{ $version }, siemenluku { "22" }, { "25" } minuuttia, yksi paikkaratkaisu per { "10" } s ohjaajan lokista). Kartta näyttää aluksen todellisen reitin ja vastaanottimen ilmoittaman reitin: ne täsmäävät, kunnes käsikirjoitettu paikan drag-off alkaa kohdassa { "421" } s, jolloin ilmoitettu reitti etääntyy todellisesta vastaanottimen pitäessä voimassa olevan paikkaratkaisun, ja se palaa takaisin, kun tapahtuma päättyy kohdassa { "1140" } s. Sen vieressä näkyvät kahden reitin välinen etäisyys ajan funktiona sekä vastaanottimen ilmoittama keskimääräinen kantoaallon ja kohinan tiheyssuhde, joka nousee yhteen korotettuun tasoon tapahtuman ajaksi. Kshanan tuottamaa synteettistä harjoitusdataa. Vain harjoitus- ja testauskäyttöön: tätä virtaa ei saa koskaan syöttää aluksen todellisiin navigointijärjestelmiin. Ohjeellinen: ei tyyppihyväksytty navigointilaite. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista. Paikat, päivämäärät ja reitit ovat keksittyjä.

# text
# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = Kuva on piirretty tiedoston <c1/> ohjaajalokista.

# text
seg-32b620b3574e = Käyttö

# text
seg-9cbd24964be4 = Valitsin

# text
# c1: <name>.nmea
seg-aadcf289aed2 = kirjoita virta tiedostoon; ilman verkkolähtöä oletus on <c1/>

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = kirjoita <c1/> ja <c2/> (oletus: tiedoston viereen)

# text
# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> tai <c2/>

# text
# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = TCP-palvelin; ajo alkaa, kun asiakas on yhdistänyt (<c1/>). Pelkkä portti kuuntelee vain osoitteessa <c2/>

# text
# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> tai <c2/>

# text
# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, yksi lause per datagrammi; <c1/> sallii yleislähetysosoitteen. Pelkkä portti lähettää osoitteeseen <c2/>

# text
# c1: --speed 0
seg-8ca50e2a4b8d = säädä virran tahtia; <c1/> tarkoittaa mahdollisimman nopeaa. Verkkolähtö käyttää oletuksena reaaliaikaa, tiedostot mahdollisimman nopeaa

# text
seg-97b82dfe97a7 = korvaa skenaarion siemenluku

# text
seg-86ac66fd2771 = jätä merkkilause pois

# text
seg-f6cc05a6d39a = <b>Todennusta ei ole.</b> TCP-palvelin, jolle on annettu ei-paikallinen osoite, tarjoaa virran kenelle tahansa, joka sen tavoittaa, ja UDP lähettää mihin tahansa nimeämääsi osoitteeseen. TCP-asiakas, joka ei ota dataansa vastaan kahden sekunnin kuluessa, pudotetaan, jotta yksi jumiin jäänyt kuluttaja ei pysäytä muita.

# text
seg-b4abb5a132ba = Sama siemenluku tuottaa samat tavut yhdellä alustalla, eikä tahdistus koskaan muuta tavuja. Alustojen välillä generaattorin oma aritmetiikka on bittitarkasti identtistä (se käyttää siirrettävää matematiikkakerrosta), mutta satelliittien paikat ja katselukulmat tulevat moottorifunktioista, jotka kutsuvat isännän matematiikkakirjastoa, joten harvinaisessa rajatapauksessa GSV:n pyöristetty korkeuskulma-, atsimuutti- tai C/N0-numero voi poiketa alustojen välillä.

# text
seg-97e31fc7f0d1 = Mitä kirjoitetaan

# text
# c1: GN
seg-632a4ca26567 = Jokainen epookki ({ "1" }, { "2" }, { "5" } tai { "10" } sekunnissa) sisältää: <b>RMC, GGA, GNS</b> (paikkaratkaisu, paikka, aika), <b>GSA</b> (käytetyt satelliitit ja DOP, yksi per satelliittitähdistö), <b>GSV</b> (näkyvät satelliitit korkeuskulmineen, atsimutteineen ja SNR:ineen dB-Hz, yksi joukko per satelliittitähdistö, NMEA { "4.10" } -signaalitunnus), <b>VTG</b> (kurssi ja nopeus maan suhteen), <b>ZDA</b> (aika ja päivämäärä), <b>HDT</b> (gyrosuunta) ja <b>VBW</b> (nopeus veden ja maan suhteen lokista). Talker on <c1/>, kun satelliittitähdistöjä on useita, muuten tähdistön oma. Rivit päättyvät CRLF:ään ja niiden tarkistussummat ovat kelvollisia.

# text
seg-942803ad8c49 = HDT ja VBW edustavat riippumattomia antureita (gyrokompassi ja Doppler-loki). <b>Mikään tapahtuma ei vaikuta niihin</b>, mikä on tarkoituksellista: ero GNSS:n ilmoittaman ja gyron sekä lokin kertoman välillä on purun vihje.

# text
# c1: V
seg-2d9a9ea38dde = Kun paikkaratkaisu menetetään, GGA-laatu on { "0" }, RMC-tila on <c1/>, paikkakentät ovat tyhjiä ja aikakentät jatkuvat (vastaanottimen kello käy edelleen), kuten oikeilla vastaanottimilla.

# text
seg-c1c51ff381e7 = Alus

# text
# c1: [vessel]
# c2: [[waypoint]]
# c3: max_rot_deg_per_min
# c4: max_rot_accel_deg_per_s2
# c5: max_accel_kn_per_min
# c6: speed_kn
# c7: [environment]
# c8: stop_at_end
seg-ada150c912eb = <c1/> ja <c2/> antavat lähtöpaikan, nopeuden ja pisteet, joiden kautta ohjataan. Alus ohjataan kohti seuraavaa reittipistettä <b>käännösnopeusrajan</b> (<c3/>, oletus { "30" }), käännösnopeuden kasvun rajan (<c4/>) ja <b>nopeudenmuutosrajan</b> (<c5/>) alaisena. Osuuden nopeus on reittipisteen <c6/>. <c7/> lisää virran, jolloin nopeus maan suhteen eroaa nopeudesta veden suhteen ja suunta eroaa kurssista maan suhteen, sekä magneettisen poikkeaman. <c8/> pysäyttää aluksen viimeiseen reittipisteeseen.

# text
seg-4fc2cb8a1388 = Satelliittigeometria

# text
# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Satelliitit tulevat moottorin omista nimellisistä satelliittitähdistöistä (GPS:n paikkataulukko, Galileon ja BeiDoun MEO-Walker-kuviot, GLONASS ICD), ja ne etenevät funktiolla <c1/> (kahden kappaleen malli sekä sekulaarinen J2, Maan pyöriminen) ja näkyvät alukselta moottorin WGS-84-katselukulmilla. GSV:n näkyvien satelliittien määrä, korkeuskulmat ja atsimutit ovat uskottavia paikalle ja vuorokaudenajalle. <b>Tämä on nimellinen taivas, ei virran päivämäärän efemeridi</b>: PRN:t annetaan paikkajärjestyksessä ja jokainen satelliittitähdistö säilyttää julkaistun paikkajärjestelynsä, joka etenee jatkuvasti GPS-paikkataulukon epookista (2016-12-31) J2:n vaikutuksesta, joten järjestely säilyy ehjänä mutta sen suuntaus ei vastaa todellista taivasta virran päivämääränä. C/N0 seuraa korkeuskulmaa (nimellinen zeniittitaso, asetetaan kohdassa <c2/>) sekä kiinteää satelliittikohtaista poikkeamaa, hidasta häipymää ja kohinaa. Satelliitilla, joka on alle <c3/>, SNR-kenttä on tyhjä; alle <c4/> oleva satelliitti seurataan mutta sitä ei käytetä. Käytettäviä satelliitteja käytetään enintään <c5/> (oletus { "12" }, NMEA GGA:n yläraja), ja ne valitaan geometrian perusteella (korkein satelliitti kussakin { "30" } asteen atsimuuttisektorissa ensin). Alle neljä käytettävää satelliittia menettää paikkaratkaisun, ja se palaa käytettävän signaalin <c6/> jälkeen.

# text
seg-f2be7442bdf2 = Tapahtumat

# text
# c1: [[event]]
# c2: kind
# c3: start_s
# c4: duration_s
# c5: ramp_s
# c6: recovery_s
# c7: ramp_s
# c8: recovery_s
# c9: 0
seg-db86ed4b40a9 = Jokaisella tapahtumalla (<c1/>) on laji (<c2/>), alkuhetki (<c3/>), kesto (<c4/>, alkuhetkestä vapautuksen alkuun), alkunousu (<c5/>) ja vapautusnousu (<c6/>). Voimakkuus nousee lineaarisesti ajan <c7/> kuluessa, pysyy, ja laskee sitten ajan <c8/> kuluessa; arvo <c9/> on askel. Kaikki vaikutukset skaalautuvat tämän voimakkuuden mukana. Parametrit, jotka eivät kuulu lajiin, hylätään.

# text
seg-3255e99c7265 = laji

# text
seg-9285a9d699c0 = parametrit

# text
seg-e83c9db4f9c7 = vaikutus

# text
# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (oletus { "6" })

# text
# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = jokaisen satelliitin C/N0 laskee enintään arvon <c1/> verran (satelliittikohtainen hajonta), satelliitit putoavat pois heikoin ensin, paikkaratkaisu menetetään, kun käytettäviä on alle neljä, ja se palautuu vapautuksen ja arvon <c2/> jälkeen

# text
# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, jompikumpi arvoista <c2/> (todellinen) tai <c3/> (kurssiin <b>alkuhetkellä</b>, sitten pidetty), valinnaiset <c4/>, <c5/>

# text
# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = vastaanotin pitää voimassa olevan <b>paikkaratkaisun</b>, jonka paikka etääntyy totuudesta; SOG ja COG sisältävät vedon. Veto noudattaa smoothstep-käyrää nousuissa, joten väärä reitti alkaa ja päättyy ilman nopeusaskelta; sen huiput ovat <c1/> m/s ja <c2/> m/s neliössä nousulle <c3/> s matkalla <c4/> m (molemmat kirjataan lokiin), ja skenaario, joka ylittäisi arvon <c5/>, hylätään. Askel (<c6/>) siirtää paikkaa koskematta nopeuteen

# text
seg-7da039c3262e = RMC-, GGA-, GNS- ja ZDA-aikaa siirretään todellisesta UTC:stä; paikka pysyy todellisena

# text
# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (oletus true), <c3/>

# text
# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = paikka, nopeus (ja aika) ovat aluksen vastaavat arvot ajalta <c1/> sitten, kun viive noudattaa smoothstep-käyrää nousuissaan ja ilmoitettu nopeus skaalataan kertoimella <c2/> viiveen muuttuessa: yksinkertaistettu, meaconing-tyylinen abstraktio, ei etenemismalli

# text
# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/>: kun drag-off, aikaharhautus tai toistoviive on aktiivinen, jokainen seurattu satelliitti näyttää tämän yhden korotetun tason, mikä on klassinen merkki. Jätä se pois hienovaraisesta tapahtumasta, jossa aito C/N0-kuvio säilytetään. Kun mikä tahansa väärennetty tapahtuma on aktiivinen, vastaanotin seuraa väärennettyä signaalia, joten häirintä ei pudota sitä; aiemman häirinnän vuoksi menetetty paikkaratkaisu palaa ajan <c2/> jälkeen väärennetyllä signaalilla (ks. <c3/>). Ajan muutos, joka pysäyttäisi ilmoitetun ajan tai panisi sen kulkemaan taaksepäin (nopeus { "1" } s sekunnissa tai enemmän), hylätään, ellei se ole askel (<c4/>).

# text
# c1: onset
# c2: start_s
seg-894aceb32c5c = Tapahtumat voivat limittyä; niiden vaikutukset summautuvat (poikkeamat, ajan muutokset, viiveet) tai voimakkain jää voimaan (häirintä). Aikajanan <c1/> on ensimmäinen epookki, jossa tapahtumalla on vaikutus, yksi epookki käsikirjoitetun <c2/>:n jälkeen, kun tapahtuma nousee asteittain.

# text
seg-09e311ade9e6 = Ohjaajan loki

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Virran rinnalla <c1/> ja <c2/> antavat:

# text
seg-51930977a6fe = tapahtumat sellaisina kuin ne syötettiin, selkokielellä kaikkine parametreineen, sekä niiden UTC-alkuhetken;

# text
# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = aikajanan: alkuhetki, täysi vaikutus, palautuminen alkaa, palautunut sekä vastaanottimen oma <c1/> ja <c2/>;

# text
# c1: log_interval_s
seg-af2eb88f14d0 = todellisen reitin ja ilmoitetun reitin välein <c1/>: todellinen ja ilmoitettu paikka, nopeus ja kurssi, paikkavirhe metreinä, aikapoikkeama, käytetyt ja seuratut satelliitit, keskimääräinen C/N0 sekä aktiiviset tapahtumat;

# text
seg-303f5fbe0351 = todellisen ja ilmoitetun reitin huippunopeus ja -kiihtyvyys;

# text
# c1: trainer_note
seg-593a4a1ef296 = skenaarion <c1/>.

# text
seg-8c4aebcd0eff = Näytä loki vasta purussa.

# text
# c1: kshana-nmea-training/1
seg-dd1780910af7 = JSON-kentät (skeema <c1/>)

# text
seg-60b5b11cdc0b = tyyppi, yksikkö

# text
seg-f4963d090155 = vain harjoituskäyttöä koskeva lausuma

# text
seg-7ad14e03d9e4 = skenaariosta

# text
seg-fac0fb50b31b = käytetty siemenluku

# text
seg-f05d18516bd8 = ISO { "8601" } UTC

# text
seg-8752c09baa6a = ajon alku

# text
seg-f0d8bb5aafef = ajon pituus

# text
seg-0989e14f1e51 = solmua

# text
seg-b657b979a455 = suurin todellinen ja ilmoitettu nopeus maan suhteen

# text
seg-24e947df31ae = m/s neliössä

# text
seg-a1ca3847c8d8 = suurin nopeuden muutos sekunnissa, todellinen sekä peräkkäisten ilmoitettujen paikkaratkaisujen välillä

# text
seg-e1daadeb7d48 = yksi per käsikirjoitettu tapahtuma

# text
# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = 1-pohjainen; käytetään kentissä <c1/> ja <c2/>

# text
seg-6bbb9db14f7b = selkokielinen kuvaus parametreineen

# text
seg-2f3eac27a997 = käsikirjoitettu alkuhetki

# text
# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = tapahtuma täsmälleen kirjoitettuna (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> sekä lajin omat parametrit; puuttuvat jätetään pois)

# text
seg-88db26711d77 = astetta todellisessa suunnassa tai null

# text
seg-2f30c3d8b17b = drag-off: käytetty suunta (suhteellinen suunta ratkaistaan alkuhetkellä)

# text
seg-55d6dd667365 = m/s, m/s neliössä tai null

# text
seg-021df000164f = drag-off: huiput, jotka veto lisää väärälle reitille

# text
seg-d3a2c65ebcd4 = puruun tarkoitetut hetket aikajärjestyksessä

# text
seg-b2b72301c1c9 = s alusta, ISO { "8601" } UTC

# text
seg-34e24e21ac7e = milloin (todellinen aika)

# text
seg-cf29ba5ed968 = kokonaisluku tai null

# text
seg-8dbc5e7239be = tapahtuman tunnus; null vastaanottimen tilan muutoksille

# text
# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (tapahtumat); <c5/>, <c6/> (vastaanotin)

# text
seg-cd7c4057601b = selitys

# text
# c1: log_interval_s
seg-90e65cbe1a59 = yksi rivi per <c1/>

# text
seg-a57e27a3c470 = s, ISO { "8601" } UTC

# text
seg-24376fe24496 = todellinen paikka

# text
seg-f23b251a0e33 = solmua, astetta todellisessa suunnassa

# text
seg-242c1f2ccbd3 = todellinen nopeus ja kurssi maan suhteen sekä gyrosuunta

# text
seg-696dd61f8bbb = totuusarvo

# text
seg-ea264ef0395c = vastaanotin ilmoitti paikkaratkaisun

# text
seg-b073b87a813e = astetta, solmua, astetta todellisessa suunnassa tai null

# text
seg-b56345697092 = mitä vastaanotin ilmoitti; null paikkaratkaisun ollessa menetetty

# text
seg-c4a33c03d9da = m tai null

# text
seg-463f6fc42ae5 = vaakasuuntainen etäisyys todellisesta ilmoitettuun paikkaan

# text
seg-b68dfce8d81d = ilmoitettu UTC miinus todellinen UTC

# text
seg-ec28faa1efcc = kokonaisluvut

# text
seg-2bf397f77392 = paikkaratkaisussa käytetyt ja seuratut satelliitit

# text
seg-96b87348e90e = dB-Hz tai null

# text
seg-40f30b4a88cf = seurattujen satelliittien keskimääräinen C/N0

# text
seg-3671c8aa3c1a = niiden tapahtumien tunnukset, joilla on vaikutus tällä hetkellä

# text
# c1: /2
seg-8401fa92aae1 = Kentän lisääminen ei muuta skeematunnistetta. Kentän uudelleennimeäminen tai poistaminen tai kentän merkityksen tai yksikön muuttaminen kasvattaa numeroa (<c1/>).

# text
seg-656ee92a3130 = Skenaariokirjasto

# text
# c1: scenarios/training/
seg-82a888587138 = <c1/>, kukin muutaman minuutin matka, jonka TOML sisältää ohjaajan muistiinpanon:

# text
seg-665b9b46b49b = tiedosto

# text
seg-11ed1f85d4be = mitä se näyttää

# text
seg-50ffa85a1128 = C/N0 laskee kaikilla yhtä aikaa, satelliitit putoavat pois, paikkaratkaisu menetetään ja palaa

# text
seg-10bc30b9c57b = voimassa oleva, terveeltä näyttävä paikkaratkaisu vetäytyy { "1.4" } km rantaa kohti; tasaisesti korotettu C/N0

# text
seg-f141692988e4 = paikka oikea, UTC ajautuu { "45" } s edelle hitaassa satamaan lähestymisessä

# text
seg-ce06a5ebdd42 = häirintä, sitten väärennetty ylitys drag-off-vedolla ja aikapoikkeamalla, sitten toistoviive

# text
# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = tukkeutunut taivas, ei häiriö: vuonon seinämät (REPRESENTATIVE-esiasetus <c1/> taivaanrantaprofiilille) peittävät satelliitit idässä ja lännessä, minkä jälkeen väylä aukeaa jälleen (tapahtuma <c2/>, taulukolla <c3/>)

# text
seg-5462f6b21fae = Paikat, päivämäärät ja reitit ovat keksittyjä; kirjasto ei sisällä oikeaa alusta, toimijaa tai tallennetta. Se ei esitä mitään siitä, miten mikään vastaanotin tai järjestelmä suoriutuisi häiriötä vastaan.

# text
seg-9831ab537b36 = Mallinnusvalinnat

# text
# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = Generaattori on harjoitustyökalu ilman ulkoista oraakkelia, ja sen luvut ovat mallinnusvalintoja, eivät minkään vastaanottimen mittauksia. Ne on valittu näyttämään tavalliselta vastaanottimen lokilta: C/N0-kulmakerroin { "14" } dB zeniitistä horisonttiin zeniittitason alapuolella (oletus { "47" } dB-Hz) ja satelliittikohtainen poikkeama +/-1.5 dB, hidas häipyminen { "0.8" } dB { "97" } s:n yli ja { "0.5" } dB { "31" } s:n yli, { "0.3" } dB:n värinä; seurannan ({ "20" } dB-Hz) ja käytön ({ "28" } dB-Hz) kynnykset; paikkakohina ({ "1.5" } m arvolla HDOP { "1" }, korreloitu { "30" } s:n ajan, pystysuunnassa kaksinkertainen); { "0.05" } asteen gyrokohina ja { "0.03" } solmun ajelehtimiskohina; { "20" } s:n ohjauksen aikavakio ja aluksen mallin reittipisteiden saapumissäteet; sekä satelliittien valinta atsimuuttisektoreittain. Oletukset ovat kohdissa <c1/> ja <c2/>, ja ne kaikki voi muuttaa skenaariossa.

# text
seg-84913be532a0 = Lukeminen takaisin

# text
# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> osaa lukea nämä tiedostot (<c2/>). Testit tarkistavat jokaisen kirjastoskenaarion jokaisen lauseen sen omia kenttämäärä- ja tarkistussummasääntöjä vastaan ja ajavat tiedostot tämän lukijan läpi, joka tulkitsee GGA:n, RMC:n ja GSV:n ja ohittaa muut tyypit hylkäämättä yhtäkään. Testit lukitsevat kultaisen otteen skenaariota kohden (<c3/>); luo ne uudelleen komennolla <c4/> aiotun muutoksen jälkeen.

# text
seg-b94fbc3b1dd3 = <s1>Edellinen</s1>Merenkulun luottamus

# text
seg-ecdf748cb63d = <s1>Seuraava</s1>Häiriökartta ja reitin altistuminen

# text
seg-24ad8471ff2a = JSON-kentät (skeema kshana-nmea-training/1)
