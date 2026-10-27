# docs--receiver-protocols: translations (fi)

seg-99427ab75a03 = kenttä

seg-75e6589cf544 = Lähde: <c1/>

seg-4540630d4859 = Vastaanotinprotokollat, joita receiver-trust lukee ({ "0.38" })

seg-906a5f9e6cd9 = Kauttaaltaan vain luku: mikään tässä ei kirjoita tavuakaan vastaanottimeen, eikä lähetyspolkua ole lainkaan. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen.

seg-a44353d98d6c = Vastaanottimen omat harhautus- ja häirintäliput (UBX)

seg-b58d3a8f292c = viesti

seg-24c57b65b8f7 = luetaan muodossa

seg-bb61c4d9a33e = UBX-NAV-STATUS (0x01 0x03), { "16" } tavua

seg-3fb608c6c3ea = tavu <c1/> siirtymässä { "7" }, bitit { "4" }..3: <c2/>

seg-54d4cf306b49 = { "0" } tuntematon tai pois käytöstä, { "1" } harhautusta ei ilmoitettu, { "2" } harhautus ilmoitettu, { "3" } useita harhautusilmoituksia (protokolla { "18" } ja uudemmat; u-blox F9 HPG { "1.32" } -rajapintakuvaus, osio { "3.15.20" })

seg-36d4d1d82f3d = UBX-SEC-SIG (0x27 0x09) versio { "1" }, { "12" } tavua

seg-e7e262087849 = <c1/> kohdassa { "4" } (bitti { "0" } jamDetEnabled, bitit { "2" }..1 jammingState); <c2/> kohdassa { "8" } (bitti { "0" } spfDetEnabled, bitit { "3" }..1 spoofingState)

seg-3e117e319518 = tilat luetaan vain, kun ilmaisin on käytössä; { "0" } tuntematon, { "1" } ei mitään, { "2" } varoitus tai ilmoitettu, { "3" } kriittinen tai vahvistettu

seg-8a5a59761cd0 = UBX-SEC-SIG versio { "2" }

seg-9626adf4a5e7 = <c1/> kohdassa { "1" } (bitti { "0" } jamDetEnabled, bitit { "2" }..1 jammingState, bitti { "3" } spfDetEnabled, bitit { "6" }..4 spoofingState); <c2/> kohdassa { "3" } ja niin monta 4 tavun ryhmää (ei käytössä)

seg-e0eb14018b2c = kuten yllä

seg-b0c1eaeb4185 = <b>SEC-SIG-rakenteen lähde.</b> u-blox F9 HPG { "1.32" } ja M10 SPG { "5.10" } -rajapintakuvaukset, jotka olivat ladattavissa tätä kirjoitettaessa, mainitsevat UBX-SEC-SIG:n mutta eivät määrittele sitä. Yllä olevat rakenteet ovat u-bloxin myöhempien rajapintakuvausten rakenteita siinä muodossa kuin ne on litteroitu pyubx2-kirjastoon (BSD-3-Clause, <c1/> ja <c2/>); tiedoston <c3/> testiaineistotestit on rakennettu tästä rakenteesta, ei todellisen vastaanottimen tulosteesta. Rakenne avoimesta litteroinnista, ei tarkistettu nykyistä valmistajan ohjetta vasten: tarkista se nykyistä u-blox-rajapintakuvausta vasten ennen kuin turvaudut SEC-SIG:iin.

seg-6af7d45be34d = SEC-SIG:llä ei ole viikon aikaa; se kuuluu nykyiselle navigointiepookille. Jo epookissa luettu tila säilytetään, ellei myöhempi ole huonompi.

seg-f1cf7ee27cb1 = Vertailu <c1/>

seg-f30ddb83bf99 = Kun loki sisältää nämä liput, tuloksen jokaisella epookilla on <c1/> (kaksi tilaa, lippuaako vastaanotin, hälyttikö jokin Kshana-valvonta ja <c2/>: <c3/>, <c4/>, <c5/>, <c6/> tai <c7/>), ja tuloksella on <c8/> laskureineen ja kunkin ensimmäisine epookkeineen. Vastaanotin ”lippuaa” tilalla { "2" } tai korkeammalla. Se <b>ei anna hälytystä eikä muuta pistemäärää</b>, eikä kumpikaan puoli ole totuus: yhtäpitävyys ei ole validointia, ja ristiriita kertoo vain, että toinen ilmaisin näki jotakin, mitä toinen ei, ei sitä, kumpi oli oikeassa. Studion kaista lukee kohdan <c9/>.

seg-49ae6094c06a = Septentrio SBF (<c1/>)

seg-4d6365d9ffd1 = <c1/> dekoodataan kirjastolla <c2/> ({ "0.4" }, <b>MIT</b>; sen ainoa riippuvuus on <c3/>; sallittu lisenssi, jonka <c4/> sallii). Luettavat lohkot: PVTGeodetic ({ "4007" }) ratkaisulle, MeasEpoch ({ "4027" }) satelliittikohtaiselle ja signaalikohtaiselle C/N0:lle (<c5/> on signaalin nimi, kuten <c6/>) ja RFStatus ({ "4092" }) niiden RF-kaistojen lukumäärälle, joiden tavu <c7/> ei ole nolla (<c8/>, kuljetetaan mukana ja <b>ei tulkita</b>: se ei koskaan lasketa lipuksi). Epookit avainnetaan viikon ajalla ja viikkonumerolla ja merkitään GPS-ajassa (<c9/>). Lohko, joka epäonnistuu CRC-tarkistuksessa tai jäsennyksessä, lasketaan ohitetuksi tietueeksi. Tämä lukija ei lue AGC:tä eikä häirintäindikaattoria, joten C/N0-laskun ja lukituksen menetyksen valvonnat ajetaan mutta AGC- ja häirintäindikaattorivalvontoja ei.

seg-f86f2c25f41a = <b>Rakenteiden lähde.</b> Septentrion viiteopasta ei voitu ladata tätä kirjoitettaessa (palvelin hylkäsi pyynnön), joten rakenteet otettiin lähteestä <c1/>, joka viittaa oppaaseen, ja tiedoston <c2/> testiaineistot ovat synteettisiä lohkoja, jotka on rakennettu tämän rakenteen ja sen CRC-16-CCITT:n mukaan. Todellista SBF-lokia ei käytetty. Rakenne avoimen lähdekoodin kirjastosta, ei tarkistettu nykyistä valmistajan ohjetta vasten: tarkista Septentrion viiteoppaasta ennen kuin turvaudut siihen.

seg-680fa4eea3f4 = Suora sarja- ja USB-syöte (<c1/>)

seg-38fcf7d91b6e = Vain Unix. Se avaa laitteen luettavaksi, asettaa <b>paikallisen</b> linjan raakatilaan nopeudella <c1/> (oletus { "4800" }, NMEA { "0183" } -nopeus) ja lukee NMEA-rivejä kuten mitä tahansa muuta lähdettä. Se ei koskaan kirjoita vastaanottimeen. <c2/> hylätään selityksen kera: Kshana ei konfiguroi vastaanottimia; aseta vastaanotin tulostamaan NMEA:ta valmistajan omalla työkalulla ja lue se sitten. Syöte on NMEA, kuten jokaisessa lähteessä, jota komento <c3/> lukee (UBX ja SBF luetaan tiedostoista). Laite, joka katoaa, päättää komennon vikaan (poistumiskoodi { "1" }) valvojan käynnistettäväksi uudelleen; kerros ei yhdistä uudelleen. Testattu pseudoterminaalin silmukkayhteydellä (<c4/>), mukaan lukien se, että master-puoli ei vastaanota komennolta yhtään tavua.

seg-97e1ea47c2be = <s1>Edellinen</s1>Kone- ja anturisyötteet

seg-55ad3fc908be = <s1>Seuraava</s1>Häiriöobservatorio: menetelmä

seg-17c3203ee615 = Vastaanottimen oman ilmoituksen vertailu

seg-68bc6d2e1575 = Septentrio SBF (format = "sbf")

seg-8444127e7ee6 = Suora sarja- ja USB-syöte (receiver-trust live --serial)
