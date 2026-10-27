# docs--observatory-method: translations (fi)

seg-0857a94a948e = Rajoitukset

seg-2247a2344710 = Merkitys

seg-b652b86e6b8e = Tila

# text
# c1: docs/observatory/METHOD.md
seg-7ca62fa39e10 = Lähde: <c1/>

# text
seg-48e063b567d0 = Häiriöobservatorio: menetelmäkuvaus

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-d0e1d6cadc10 = Versio <c1/>, rakennettu pohjalle <c2/>. Vain ohjeellinen: tämä kuvaa, miltä julkaistut paikkaraportit näyttivät menneinä päivinä; se ei ole minkään vastaanottimen mittaus, ennuste, häiriön vahvistus eikä sen syyn osoitus.

# text
seg-c5eab49b8d6f = Mitä observatorio julkaisee

# text
seg-165ae7646608 = Yksi tuote per UTC-päivä ja alue, yhdestä avoimesta ilma-alusten paikka-arkistosta. Kiinteän 0.5 asteen leveys- ja pituusasteruudukon jokainen solu on yhdessä <b>kolmesta tilasta</b>:

# text
seg-cc07647eb12e = Suuri osuus solussa otokseen kuuluneista ilma-aluksista ilmoitti sinä päivänä heikkoa navigointitarkkuutta, selvästi yli kyseisen päivän taustatason.

# text
seg-3e1dd7caaee6 = Ilma-aluksia otettiin otokseen riittävästi, eikä osuus täyttänyt sääntöä.

# text
# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Data ei sallinut arviota. Tämä <b>ei</b> ole "selvä". Jokaisella tällaisella julkaistulla solulla on dataperuste: <c1/>, <c2/> tai <c3/>. Solu, jolla ei ole lainkaan merkintää, nähtiin alle { "5" } eri ilma-aluksen toimesta, ja se pidätetään.

# text
seg-e49e05b47061 = Muuta ei julkaista: ei syytä, ei toimijaa, ei ilma-aluskohtaista tietuetta. Perusteet kuvaavat, riittikö päivän data, eivät koskaan sitä, miksi tarkkuus oli heikko.

# text
# c1: kshana interference-map daily
seg-7b251c7860e0 = Kolme tiedostoa päivässä (<c1/>):

# text
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/>: solut, joiden <c2/> on <c3/>, menetelmä ja sen ennakkorekisteröidyt parametrit, lisenssi ja tekijätiedot, julkaisusääntö sekä huomautus.

# text
# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/>: samat solut kuvana (heikentynyt, ei heikentynyt, ei havaittu viivoitettuna; tyhjiä soluja ei havaittu). Tiedoston tekstilohkot toistavat huomautuksen ja lisenssin.

# text
# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Toisiinsa koskettavat heikentyneet solut (viistot mukaan lukien) muodostavat yhden tapauksen, jolla on rajauslaatikko ja sen solut. Kenttä <c4/> on kiinteä teksti <c5/>. Tiedosto on syöte raportoi, vahvista ja ilmoita -kierrokselle (ilmailun raportointikierros, joka päättyy NOTAMiin); se ei ole vahvistus eikä NOTAM.

# text
# c1: .manifest.json
seg-49b7bdae0d6e = sekä <c1/>, jossa on kolmen tiedoston tavumäärä ja SHA-256, menetelmän tunnus, syötelaskurit (luetut ja poissuljetut rivit) ja aineistolohko, jotta tuote voidaan tarkistaa ja toistaa.

# text
seg-d7bb390fb986 = Julkaisusäännöt (komento valvoo)

# text
# c1: --delay-hours
seg-87147317f8da = <b>Vähintään { "24" } h viive.</b> Päivän tuote julkaistaan aikaisintaan kyseisen UTC-päivän lopussa lisättynä arvolla <c1/> ({ "24" } tai enemmän; pienempi arvo hylätään). Komento hylkää päivän, jota ei vielä voi julkaista, ja kertoo aikaisimman ajan. Viiveen lyhentämiseen ei ole kytkintä.

# text
seg-43960c3f9b6c = Karkeat solut.

# text
# c1: --cell-deg
seg-1a5ff10e5240 = Arvo <c1/> alle { "0.5" } hylätään.

# text
# c1: null
seg-e70d8d7f9980 = <b>Pidätys.</b> Solua, jonka näki alle { "5" } eri ilma-alusta, ei julkaista; alle { "5" } oleva luku on <c1/> (nolla mukaan lukien), kuten perusmenetelmässä.

# text
seg-ab75582c5032 = <b>Ei osoitusta syystä.</b> Tilojen ja perusteiden sanastossa ei ole syytä; testi varmistaa tämän.

# text
seg-0e7d76d7efd0 = <b>Lähteet.</b> Vain adsb.lol (ODbL { "1.0" }) tai käyttäjän aineisto omalla lisenssillään. <b>OpenSky Networkin dataa ei hyväksytä</b> (sen lisenssi ei salli johdettujen karttojen kaupallista käyttöä tai uudelleenjakelua). ADS-B:tä ja AIS:ää ei koskaan yhdistetä.

# text
seg-dc28848046ac = <b>Tuotteen lisenssi.</b> Solukohtainen ADS-B-tiedosto, joka on tehty adsb.lol-datasta, on Derived Database ja sisältää lisenssin ODbL { "1.0" } sekä adsb.lol-tekijätiedot tiedostossa. Kshanan koodi pysyy AGPL-3.0-lisenssillä.

# text
seg-9eeba6648fec = Havaittava suure ja perusmenetelmä

# text
# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = ADS-B-ilma-alus ilmoittaa, kuinka tarkkana se pitää oman GNSS-paikkansa: <b>NACp</b> (Navigation Accuracy Category for Position, { "95" } %:n vaakaraja välillä { "10" } NM ja alle { "3" } m) ja <b>NIC</b> (Navigation Integrity Category, suojaussäde). Perusmenetelmä (<c1/>, <c2/>) laskee solua ja päivää kohden osuuden <b>eri ilma-aluksista</b>, joiden solun sisäiset raportit olivat enimmäkseen heikkotarkkuuksisia, suojaehdoin: vain yli { "5,000" } ft:n korkeus; ilma-alus lasketaan vain, jos se ilmoitti hyvää tarkkuutta muualla samana päivänä (laitteiston lähtötaso); solun osuuden on ylitettävä päivän solujen mediaaniosuus marginaalilla; päivä, jonka mediaani on itsessään korkea, merkitään sekoittuneeksi, eikä yhtäkään solua julisteta heikentyneeksi. Parametrit kiinnitettiin kenttien määritelmistä ja yksityisyyssäännöstä ennen kuin dataa tarkasteltiin lainkaan, ja ne kirjoitetaan jokaiseen tulostiedostoon. Observatorio lisää kolmen tilan sanaston, julkaisusäännöt ja edellä mainitut tiedostot eikä muuta yhtään parametria.

# text
# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Alueajot.</b> Valitsimella <c1/> luetaan vain laatikon sisäiset raportit. Laitteiston lähtötaso ja päivän tausta lasketaan tällöin pelkästään laatikon raporteista, ja tiedosto kertoo tämän (<c2/>). Aluetuote on siis kyseisen alueen datan tuote, ei globaalin tuotteen rajaus.

# text
seg-2e7007b56a44 = Suhde NACp–almanakka-HDOP-menetelmään

# text
seg-4892485e534b = Pleninger, Topkova ja Steiner, "GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data", The Aeronautical Journal { "129" } ({ "1331" }), { "206" }–{ "223" } ({ "2025" }), doi 10.1017/aer.2024.67, vertaavat ilma-aluksen NACp:stä pääteltyä paikkavirhettä GPS-satelliittitähdistön HDOP:iin (horisontaalinen tarkkuuden heikkenemiskerroin) almanakkadatasta ja merkitsevät ilma-aluksen vaikutuksen alaiseksi, kun nämä kaksi eroavat; artikkeli arvioi menetelmää tarkoituksellisilla GPS-häirintäkokeilla.

# text
seg-74ec1aca8a22 = <b>Mitä käytimme.</b> Vain julkaistun tiivistelmän ja bibliografisen tietueen. Kokotekstiä ei ollut saatavilla (maksumuurin takana), joten emme tunne sen NACp:n ja virhearvion välistä kuvausta, HDOP-laskentaa emmekä kynnyksiä, emmekä väitä toistavamme niitä.

# text
seg-4f8471649a07 = <b>Mitä observatorio tekee sen sijaan.</b> Kysymys, johon almanakkavertailu vastaa, on "voisiko pelkkä satelliittitähdistön geometria selittää tämän heikon tarkkuuden?". Perusmenetelmä vastaa liittyvään kysymykseen ilman almanakkaa: matalan osuuden on erotuttava saman päivän taustasta koko alueella ja ilma-aluksen omista hyvistä raporteista muualla. Se on erilainen ja heikompi korvike: se ei voi sanoa, että hiljaisen geometrian tunti oli heikentynyt, jos päivän tausta on myös matala. Almanakka-HDOP-pisteyttäjää <b>ei ole toteutettu</b>. Se on avoin asia, joka rakennetaan artikkelin kokotekstistä ja julkisesta GPS-almanakasta ja ennakkorekisteröidään ennen ajoa; siihen asti siihen viitataan, mutta sitä ei väitetä.

# text
seg-e9b9902633af = Tuotteen toistaminen

# text
seg-95e48f0286d9 = Putki on deterministinen kaikessa, mitä se julkaisee (ajokohtainen tunnistesuola muuttaa vain sisäisiä tiivisteitä, joita ei koskaan kirjoiteta). Manifestin SHA-256-arvot mahdollistavat toisen ajon vertaamisen tavu tavulta.

# text
seg-65236a42e316 = Herkkyystutkimus

# text
# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> toistaa yhden päivän raportit muuttaen yhtä ennakkorekisteröityä parametria kerrallaan (kaksi arvoa kullekin sekä { "1.0" } asteen ruudukko) ja raportoi variantti kerrallaan heikentyneiden, ei heikentyneiden ja ei havaittujen solujen määrän, heikentyneen joukon Jaccard-indeksin rekisteröityyn joukkoon nähden, solut joiden tila muuttui sekä heikentyneen alueen. Se ei muuta rekisteröityä sääntöä: variantti ei ole validoitu vaihtoehto, ja suuri muutos parametrin alla kertoo, kuinka paljon arvio riippuu kyseisestä parametrista, ei sitä, mikä arvo on oikea. Takautuvan katalogin tulokset ovat tiedostossa <c2/>.

# text
# c1: not_observed
seg-cc57d45c4b0a = <b>Kattavuus.</b> adsb.lol perustuu vapaaehtoisten vastaanottimiin; avomeri ja harvaan katettu ilmatila ovat niissä harvoja, ja <c1/> on siellä yleinen. Kartta näyttää lähteensä kattavuuden.

# text
seg-e3921e1eb177 = <b>Mitä heikko tarkkuus tarkoittaa.</b> NACp ja NIC laskevat muistakin syistä kuin häiriöstä: satelliittien tai täydennysjärjestelmien katkoista, avaruussäästä, vastaanottimen tai transponderin vioista ja geometriasta. Mikään tila ei viittaa syyhyn.

# text
seg-e5ad0dc456c0 = <b>Ilma-alukset, jotka pysyvät vaikutusalueella koko päivän,</b> eivät saa lähtötasoa sen ulkopuolelta eikä niitä lasketa, joten menetelmä aliarvioi pysyvän alueellisen vaikutuksen. Herkkyystutkimus näyttää lähtötasosuojan vaikutuksen.

# text
seg-a2d41becc19b = <b>Päivän rajat</b> ovat UTC; keskiyön yli ulottuva tapahtuma jakautuu kahdelle päivälle.

# text
seg-436af9f16feb = <b>Ei maastototuutta.</b> Observatoriolla ei ole ulkoista oraakkelia: jokainen luku on MODELLED, eikä yksikään varmennusmatriisin rivi nojaa siihen.

# text
seg-5c4966f0166d = <b>Aiheen herkkyys.</b> Tämänkaltaiset kartat ovat poliittisia. Observatorio esittää menetelmän, viiveen ja sanaston eikä muuta; se ei nimeä valtioita tai toimijoita, eikä se julkaise reaaliajassa.

# text
seg-874f46a80c8b = <s1>Edellinen</s1>Luetut vastaanotinprotokollat

# text
seg-3137b7595e59 = <s1>Seuraava</s1>Häiriöobservatorio: tulokset
