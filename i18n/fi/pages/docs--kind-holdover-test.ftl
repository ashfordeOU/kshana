# docs--kind-holdover-test: translations (fi)

seg-f42465f7d066 = ns

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

seg-73929aeded02 = Lähde: <c1/>

seg-218f00012d0e = <c1/> (skenaariotyyppi)

seg-c0924aa36e64 = MODELLED ajoitusjärjestelmän holdover-testi, pisteytettynä aikavirhetallenteesta, jonka OPERAATTORI toimittaa (linuxptp ptp4l-, phc2sys- tai ts2phc-loki, chrony tracking- tai statistics-loki, TICC-, TimeLab- tai RINEX-kellolokki, tai time_s,time_error_ns-parit). Testissä on neljä vaihetta, eikä Kshana suorita yhtäkään niistä: lukittu LÄHTÖTASO, operaattorin tekemä GNSS:N POISTO (antennikaapeli tai simulaattorin lähtö; Kshana ei lähetä eikä ohjaa mitään) ilmoitettuna ajankohtana, HOLDOVER järjestelmän omalla oskillaattorilla ja PALAUTUMINEN sen jälkeen, kun operaattori palauttaa GNSS:n toisena ilmoitettuna ajankohtana. Tallenne jaetaan näissä kahdessa ajankohdassa. Lähtötaso: aikavirhetilastot ja lukitulle kellolle kirjoitetut ITU-T-maskit. Holdover: tilastot, järjestelmän pitämä suhteellinen taajuuspoikkeama (pienimmän neliösumman suora), holdoverille tai autonomiselle kellolle kirjoitetut maskit, ePRTC-A-holdover-verhokäyrä ilmoitetusta lukitusajasta ja aika kunkin aikavirhebudjetin ylittymiseen. Palautuminen: tuliko |TE| ilmoitetun kaistan sisälle ja milloin, ja pysyikö se siellä, huippu ja suurin askel. Jokainen raja on kopioitu julkisesta ITU-T-taulukosta (telecom-timing-maskit); sanamuoto on 'mitattu maskia vasten', ja kaksi ajankohtaa ovat operaattorin ilmoitus, ei varmennettu. Maskiin liian lyhyt tallenne on INCOMPLETE, ei koskaan ekstrapoloitu. Katso docs/TIMING-HIL.md.

seg-cd6d840a1382 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = Pakolliset kentät: <c1/>, <c2/>

seg-4792040e4773 = Valinnaiset kentät: <c1/>, <c2/>

seg-ad4f9c40e317 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = Tulosmerkintä (moottorin oma): MODELLED — holdover-testi, joka on pisteytetty operaattorin toimittamasta aikavirhetallenteesta. Jokainen raja on kopioitu nimetystä julkisesta ITU-T-suosituksesta ja tulos on mitattu maskia vasten; se ei sano mitään siitä, täyttääkö mikään kello tai järjestelmä jotakin suositusta, eikä kukaan ole luokitellut tai hyväksy

seg-8ce93392747b = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/holdover-test-ptp4l.toml, skenaariotyyppi holdover-test

seg-3361819ae321 = <b>MODELLED</b> Tyyppi <c1/>: aikavirhetallenne (linuxptp-, chrony-, TICC-, TimeLab- tai RINEX-kellolokki, tai time_s,time_error_ns-parit) jaetaan operaattorin ilmoittamissa kahdessa GNSS:n poiston ja palautuksen ajankohdassa lähtötasoksi, holdoveriksi a

seg-e7273fd2a640 = <b>VALIDATED</b> Suurin aikavälivirhe (MTIE) ja aikapoikkeama (TDEV), jotka skenaariotyyppi <c1/> raportoi telekommunikaatiomittakaavan holdover-tallenteella: O(n) monotoninen jonoliuk. Oraakkeli (ExternalDataset): allantools { "2024.06" } — riippumaton kolmannen osapuolen taajuusvakauskirjasto — mtie() ja tdev() tiedostolla tests/fixtures/telecom_timing/holdover_te_series.csv, sarja jäsennetty samasta 17 merkitsevän numeron tekstistä molemmilla puolilla; viite tallentaa sarjan SHA-256:n ja on uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validoi ESTIMAATTORIT tällä tallenteella, ei syn

seg-4cf0f94f96c9 = <b>MODELLED</b> ITU-T G.8272:n (07/2025) PRTC-A/B, G.8272.1:n ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukitun ja ePRTC-A-holdoverin (mukaan lukien taulukon { "3" } aikavirheen verho. Oraakkeli (InternalConsistency): Nimettyjen suositusten transkriptio (vapaasti ladattavissa osoitteesta itu.int), jokaisella rajalla on taulukkonsa tai kohtansa, lueteltuna jokaisen vahvistamattoman tai toteuttamattoman kohdan kanssa tiedostossa docs/TELECOM-TIMING.md; taulukoiden implikoimat katkoskohtien jatkuvuusidentiteetit tarkistetaan testeissä. Standardien transkriptio sisäisillä johdonmukaisuustarkistuksilla, ei yhdenmukaisuustesti eikä ulkoinen validointi. { "0.30" } kierros { "2" } (ennakkorekisteröity

seg-142528f34e66 = <b>MODELLED</b> Tyyppi <c1/>: aikavirhetallenne (linuxptp-, chrony-, TICC-, TimeLab- tai RINEX-kellolokki, tai time_s,time_error_ns-parit) jaetaan kahdessa ajankohdassa. Oraakkeli (InternalConsistency): Käsin laskenta tallenteilla, jotka on rakennettu kaavoista, joiden kulmakerroin, askel, ääriarvo ja palautumisaika tunnetaan ennen ajoa (testit ilmoittavat ne), sekä yllä olevien telecom-timing-rivien maskit, verhokäyrä ja budjetit. Todellisen holdoverin laboratoriomittausta ei ole pisteytetty eikä ulkoista oraakkelia ole verrattu, joten tyyppi ei esitä väitettä mistään kellosta tai järjestelmästä; ajoituslaboratoriokumppani tarvitaan ennen mitään kelloluokkakohtaista fi

seg-59ff0b0e3d2d = MODELLED — holdover-testi, joka on pisteytetty operaattorin toimittamasta aikavirhetallenteesta. Jokainen raja on kopioitu nimetystä julkisesta ITU-T-suosituksesta ja tulos on mitattu maskia vasten; se ei sano mitään siitä, täyttääkö mikään kello tai järjestelmä jotakin suositusta, eikä kukaan ole luokitellut tai hyväksynyt sitä. Ajankohdat, jolloin GNSS poistettiin ja palautettiin, ovat operaattorin ilmoitus eikä niitä ole varmennettu. Ohjeellinen ohj (tulos <c1/>)

seg-daeb4ad7aa35 = MODELLED ajoitusjärjestelmän holdover-testi, pisteytettynä aikavirhetallenteesta, jonka OPERAATTORI toimittaa (linuxptp ptp4l-, phc2sys- tai ts2phc-loki, chrony tracking- tai statistics-loki, TICC-, TimeLab- tai RINEX-kellolokki, tai time_s,time_error_ns-parit). (tyyppiluettelo (<c1/>))

seg-ff3008c250cc = ITU-T:n telekommunikaatiosynkronoinnin maskit tuloksin PASS/FAIL ja marginaalilla on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-8ccd0f911626 = Operaattorin toimittamasta aikavirhetallenteesta pisteytetty holdover-testi on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-72bad5444282 = Aihesivu: <a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = Aihesivu: <a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>Edellinen</s1>gravity-map

seg-e7665ee5e30e = <s1>Seuraava</s1>hybrid-optical-rf
