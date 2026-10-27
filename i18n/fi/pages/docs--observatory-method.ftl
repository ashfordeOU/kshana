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
