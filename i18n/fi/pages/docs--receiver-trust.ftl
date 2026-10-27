# docs--receiver-trust: translations (fi)

seg-adc34608c46b = Luokka

seg-2247a2344710 = Merkitys

seg-fdbb9db68f1d = ei mitään

seg-f63dd3d7aad4 = Lähde

seg-98151954f217 = false

seg-c353e7bec219 = Avain

seg-cc38b40eb7a5 = Valvonta

seg-7670cf4ceda3 = Oletus

seg-a0cc45088f5f = GSV

seg-26ab8544afba = Luottamuspistemäärä yhden synteettisen kulun yli, moottorin v{ $version } todellisesta ajosta aineistolla examples/maritime-trust (tekaistu NMEA-loki lautasta Tallinna–Helsinki-reitillä, { "3001" } epookkia taajuudella { "1" } Hz). Kolme kaistaa jakaa yhden aika-akselin. Ylhäällä: vastaanottimen ilmoittaman paikan ja aluksen todellisen paikan välinen etäisyys, joka pysyy muutaman metrin sisällä noin hetkeen { "1576" } s asti, kun lokin käsikirjoitettu paikan raahaus vetää sen pois, vaikka vastaanotin ilmoittaa edelleen pätevän paikkaratkaisun. Keskellä: luottamuspistemäärä { "0" }–{ "100" }, jota ei lasketa kalibroinnin ensimmäisten { "300" } s aikana, nimelliskaistalla (vähintään { "90" }) raahaukseen asti, sitten laskien heikentyneen kaistan (vähintään { "55" }) kautta luottamattomaan kaistaan. Alhaalla: kunkin epookin kaista värillisenä nauhana nimineen. Pistemäärä on ohjeellinen. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista. Loki on tekaistu muodon ja monitorien havainnollistamiseksi; se ei ole mittaus eikä kerro mitään siitä, miten mikään vastaanotin toimisi.

seg-7000c522cc93 = Vastaanottimen oma harhautusliput Kshanan hälytyksiä vasten, moottorin v{ $version } todellisesta ajosta keksityllä UBX-lokilla ({ "200" } epookkia taajuudella { "1" } Hz). C/N0 laskee { "20" } dB kohdissa { "80" }–{ "90" } s ja { "120" }–{ "130" } s; vastaanotin liputtaa välit { "120" }–{ "130" } s ja { "160" }–{ "165" } s. Kalibroinnin jälkeen vertailluista { "140" } epookista { "11" }:ssä molemmat liputtivat, { "6" }:ssa vain vastaanotin, { "11" }:ssä vain Kshana ja { "112" }:ssa ei kumpikaan. Kumpikaan puoli ei ole totuus, eikä yhdenmukaisuus ole validointia. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-caadaad98cf6 = Lähde: <c1/>

seg-4f10c2397fcc = Vastaanottimen luottamus: todellisen GNSS-vastaanottimen lokin arviointi

seg-2596bdcdaf8e = <c1/> lukee todellisen maailmanlaajuisen satelliittinavigointijärjestelmän (GNSS) vastaanottimen lokin, ajaa sen yli luottamusvalvonnat epookki kerrallaan ja kertoo, milloin ja miksi vastaanottimen ratkaisusta tuli epäluotettava. Se voi myös pisteyttää lokin tapahtumia ja ennusteita vasten, jotka ilmoitat <b>ennen</b> ajoa: havaittiinko kukin tapahtuma ajoissa ja vastaako mallinnettu kantoaalto-kohinatiheyden (C/N0) lasku sitä, mitä vastaanotin mittasi.

seg-63f24d5f2d5e = Havaittavat suureet ovat vastaanottimen omia; valvonnat ja niiden kynnysarvot ovat moottorin ja sinun. Jokainen tulos kantaa tuon merkinnän, lokin SHA-256-tiivisteen ja jokaisen käytetyn kynnysarvon, joten ajon voi toistaa ja auditoida.

seg-6f5014b93fbc = Matkalla olevalle alukselle, jossa on live-pistemäärä ja valinnainen portti karttajärjestelmän edessä, ks. <a1><c1/></a1>.

seg-82cdabb6086f = Tämä kirjoittaa tiedostot <c1/>, <c2/> (yksi rivi epookkia kohti) ja <c3/> (keskimääräinen C/N0 ajan funktiona, luottamustila alla) skenaarion viereen ja tulostaa yksirivisen tuomion. Esimerkkiloki on synteettinen, tehty näyttämään muoto; osoita <c4/> oman vastaanottimesi lokiin.

seg-ec2be1ea73f5 = Yllä oleva kuva on tiedoston <a1><c1/></a1> alusdemo: keksitty loki, ohjeellinen pistemäärä.

seg-0f24c5cf4b9b = Sama skenaario ajetaan Pythonista (<c1/>), WebAssembly-paketista (<c2/>, loki sisällytettynä) ja Model Context Protocol (MCP) -palvelimen työkalusta <c3/>.

seg-1f3cc12b6230 = Lokit, jotka se lukee

seg-23fd4a5bf5dd = Mitä luetaan

seg-2e1a655cf846 = u-blox-binääri

seg-cb31da7b7d88 = NAV-SAT satelliittikohtainen C/N0, korkeuskulma ja atsimuutti, NAV-PVT-paikka, MON-RF automaattinen vahvistuksensäätö (AGC) ja häirintäindikaattori <c1/>, NAV-TIMEGPS-viikko sekä vastaanottimen omat liput: NAV-STATUS <c2/> ja SEC-SIG (<c3/>, ks. <a1>RECEIVER-PROTOCOLS.md</a1>)

seg-cec582f4afa5 = RINEX { "3" } -havaintotiedosto

seg-57708a636148 = <c1/>-koodit (C/N0) satelliittia ja signaalia kohti; lähetetyn navigointitiedoston (<c2/>) kanssa pseudoetäisyydet moottorin omaa ratkaisua varten

seg-176c2493782e = Android GnssLogger CSV

seg-d69b9dd6ebad = rivit <c1/>: C/N0 ja <c2/> satelliittia kohti; rivit <c3/>: paikka

seg-d390120374a9 = NMEA { "0183" } -teksti

seg-9eb885aa79af = GSV signaali-kohinasuhde satelliittia kohti (dB-Hz, signaalitunnuksella { "4.10" } tai ilman) sekä sen korkeuskulma ja atsimuutti, GSA tarkkuuden heikkenemiskerroin ja käytetyt satelliitit, GGA ja RMC aika ja paikka

seg-7864926ce37e = Septentrio-binääri ({ "0.38" }, vain luku)

seg-44675c4bdf40 = PVTGeodetic-paikka, MeasEpoch C/N0 satelliittia ja signaalia kohti, RFStatus-kaistamäärä; ks. <a1>RECEIVER-PROTOCOLS.md</a1>

seg-a5367d75c5ee = RTKLIB-ratkaisutiedosto (<c1/>)

seg-37d28ca5ed00 = aika, paikka (leveys-/pituusaste tai ECEF, muunnettuna) ja käytetyt satelliitit epookkia kohti; aste-minuutti-sekunti-tiedostot hylätään ilmoituksella

seg-5e10ecb93f96 = NovAtel OEM7 ASCII- tai binäärilokit

seg-a630fbcf7425 = <c1/>-paikka (vain lasketut ratkaisut), <c2/> C/No satelliittia ja signaalia kohti; viestin <c3/> häirintälaitteen liput muuttuvat epookin kentäksi <c4/> (häirintätila { "2" }, kun vastaanotin lippuaa häirintälaitteen, { "1" }, kun ei; kentässä RXSTATUS ei ole harhautuslippua), asetettuna Kshanan hälytyksiä vasten vertailulla <c5/>

seg-d4735b581cbf = GNSS-SDR Monitor- ja PVT-monitor-virrat JSON-riveinä

seg-053235d67fb3 = kanavakohtainen C/N0, ratkaisu, käytetyt satelliitit, HDOP, atsimuutti ja korkeuskulma; tuottaa <c1/>

seg-2e9033aa4e9d = Näiden kolmen yksityiskohdat, lähteet ja rajat: <a1><c1/></a1>.

seg-8987b2c46eb0 = Jokainen lukijoiden tuottama epookki kantaa myös kentät <c1/>, <c2/> eli tavusiirtymät syötteeseen: pienin yhtenäinen alue, joka sisältää siihen vaikuttaneet tietueet, jotta tarkka raakaleike voidaan tiivistää tapahtumaikkunalle. NMEA: jokainen rivi, joka luetaan epookin ollessa voimassa (ylijoukko, jos asiaan kuulumaton rivi on sen lauseiden välissä). UBX: epookin kehykset. RINEX { "3" }: epookkitietueet jokaisesta rivistä <c3/> seuraavaan. Android: epookin rivit <c4/> (rivi <c5/> vain epookille, jolla ei ole rivejä <c6/>). Puuttuu live-virralta ja kaikkialta, missä sitä ei ole hyvin määritelty (RINEX { "2" }).

seg-cea9532b57a2 = Tiedosto annetaan kentällä <c1/> (ratkaistaan skenaarion oman kansion suhteen) tai suoraan sisällytettynä kentällä <c2/> tai <c3/> (ainoat vaihtoehdot selaimessa).

seg-3bc4f9c91950 = IMU-loki toisena anturina

seg-49b10ad5928e = <c1/> lisää inertialokin samalle kellolle:

seg-9e0560b09f5a = Kääntönopeus integroidaan kentästä <c1/> ja se täyttää suuntiman kaikkialla, missä vastaanottimen loki ei sisällä sitä, joten valvonta <c2/> (joka tarvitsee alustalle asetuksen <c3/>) vertaa gyrosuuntimaa maahan nähden kulkemaan kurssiin. Gyro ajautuu: suuntima on vain niin hyvä kuin integrointi-ikkuna, ja <c4/> ratkaisee, mikä lasketaan erimielisyydeksi. Muoto <c5/> on dokumentoitu tiedostossa <c6/>. IMU-tavut ovat osa skenaariotiivistettä ja todistepaketin skenaariotiivistettä. Sisällytetty (<c7/>/<c8/>) toimii kaikilla pinnoilla; <c9/> hylätään siellä, missä tiedostoja ei lueta.

seg-fd3e6ef1cd93 = Alusta: staattinen tai alus

seg-b67c0d57dc1d = Yllä olevat valvonnat olettavat kiinteän antennin. Skenaario ilmoittaa alustan ennen ajoa ylätason taulussa <c1/>; ilman sitä alusta on <c2/> eikä mikään muutu.

seg-3d6bc18bd83e = Miksi tämä arvo

seg-32f339f63acf = Kauppa-alusten ja useimpien matkustaja-alusten palvelunopeuden yläpuolella, joten todellinen alus ei koskaan saavuta sitä; selvästi alle nopeuden, jonka paikan vetäminen pois (drag-off) edellyttää. Hitaamman aluksen tulee ilmoittaa matalampi raja: mitä matalampi raja, sitä aiemmin vetäminen havaitaan.

seg-9506e8601857 = Suuri alus muuttaa nopeuttaan selvästi alle { "0.1" } m/s²; pieni nopea alus saavuttaa muutaman kymmenesosan voimakkaassa kaasunmuutoksessa.

seg-b0b6baaee456 = Suuri alus kääntyy selvästi alle { "1" } astetta sekunnissa ja pieni alus jyrkässä käännöksessä muutaman.

seg-53d0fffb3c09 = Asennuksen ominaisuus; arvaus olisi piilotettu kynnysarvo.

seg-ac48403443f9 = Ilmoitettu <c1/> ja lokista puuttuva on virhe, joten puuttuva anturi ei voi läpäistä puhtaana tarkistuksena.

seg-8266739dc26b = Alusavaimet hylätään tyypillä <c1/>. Alukselle valvontaa <c2/> ei ajeta, koska se mittaa etäisyyttä kalibroinnin keskiarvosta, mikä on väärin liikkuvalle antennille; tuloksen <c3/> tallentaa alustan ja käytetyt rajat.

seg-7551792a0cb4 = Synteettiset NMEA-virrat komennosta <a1><c1/></a1>, tehty miehistön koulutukseen, NMEA-lukija hyväksyy, ja ne voi ajaa tämän tyypin läpi kuten minkä tahansa NMEA-lokin.

seg-18d7538bc56d = Valvonnat

seg-e5c1cb89f0b3 = Jokainen valvonta tarvitsee datansa; valvontaa, jonka dataa ei ole lokissa, ei ajeta eikä sitä luetella kentässä <c1/>. Ensimmäiset <c2/> sekuntia (oletus { "60" }) määrittävät lähtötason, eikä niiden aikana hälytetä koskaan.

seg-3be9ee05f087 = Hälyttää, kun

seg-98ead58c671d = Tarvitsee

seg-f6e6df453260 = lähtötason kanssa yhteisten satelliittien keskimääräinen C/N0 laskee arvon <c1/> verran tai enemmän (oletus { "6" } dB)

seg-d9bf6efc6835 = seurattuja satelliitteja on vähintään <c1/> vähemmän kuin lähtötason mediaani (oletus { "4" })

seg-60c7a99f9819 = AGC-lukema poikkeaa lähtötasostaan yli <c1/> keskihajontaa (oletus { "5" })

seg-7c1c65e64418 = UBX MON-RF tai Android <c1/>

seg-a5a5252417cb = u-blox-vastaanottimen arvo <c1/> ylittää arvon <c2/> (oletus { "80" } / { "255" })

seg-8bca191bf4c4 = UBX MON-RF

seg-0ac4898d81cf = vastaanottimen oma ratkaisu on yli <c1/> päässä kalibroinnin keskiarvosta (oletus { "50" } m)

seg-6a3fec1214b9 = ilmoitettu paikka

seg-4c05faf783eb = moottorin oman yhden pisteen ratkaisun pariteettiin perustuva vastaanottimen autonominen eheyden valvonta (RAIM) hylkää mittausjoukon

seg-037ab193613c = RINEX-loki, jossa on <c1/>

seg-8890a4ebf231 = moottorin yhden pisteen ratkaisu epäonnistuu, vaikka satelliitteja on viisi tai enemmän

seg-0a5a708ac75b = vastaanottimen kello poikkeaa ennustetusta enemmän kuin sen kalibrointikohinan pienin havaittava siirtymä

seg-31b64b635261 = Kalibroitu profiili (valinnainen).

seg-a73f2c2dfc9a = <c1/> korvaa kolme häiriökynnystä arvoilla, jotka on kalibroitu julkisella JammerTest { "2024" } -aineistolla (yksi u-blox ZED-F9P skenaariota kohti; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Kalibrointi ennakkorekisteröitiin (<c5/>), ja profiili on MODELLED, sovitettu yhteen julkiseen kampanjaan: sen kynnys <c6/> <b>ei täyttänyt</b> ennakkorekisteröityä holdout-kynnystä väärille hälytyksille ({ "0.0231" } vastaan { "0.02" }); AGC- ja häirintäindikaattorikynnykset sekä yhdistelmäkynnys (väärät hälytykset { "0.033" }, havaitseminen { "0.81" }) täyttyivät (<c7/>). Se pätee tälle vastaanotintyypille tässä tapahtumassa, ajastettuja hyökkäysjaksoja vasten, ja se kalibroitiin aineiston CSV-lokeilla (sen UBX-lokit antavat enemmän vääriä hälytyksiä kahdessa kansiossa). Profiililla ajettu tulos toistaa käytetyt kynnykset ja sisältää kentän <c8/>, joka kertoo kaiken tämän. Ilman profiilia yllä olevat oletukset pätevät ja kaikki tulosteet ovat ennallaan.

seg-1fa8c4bd1a18 = Kun alusta on <c1/>, ajetaan myös liikkuvan alustan valvonnat (kynnykset ylätason taulussa <c2/>, jokainen oletus dokumentoitu tiedostossa <c3/>); kukin tarvitsee datansa ja luetellaan kentässä <c4/> vain, kun se on tehnyt päätöksen:

seg-4b2840d9d0af = paikan muutos on ristiriidassa ilmoitetun nopeuden ja kurssin kanssa tai viittaa nopeuteen, kiihtyvyyteen tai kääntönopeuteen, joka ylittää aluksen rajat

seg-656c19cb5b52 = paikkaratkaisut; nopeus ja kurssi (RMC tai VTG) dead reckoning -osaa varten

seg-cedefd52998d = gyrosuuntima ja maahan nähden kulkema kurssi eroavat yli <c1/> (nopeus yli <c2/>)

seg-c66704cbdd02 = HDT-, THS- tai VHW-suuntima, <c1/>

seg-1bbbf0033234 = nopeus veden suhteen ja nopeus maahan nähden eroavat yli <c1/>

seg-c9101740b235 = VHW tai VBW sekä nopeus maahan nähden

seg-42ac59072099 = GGA-korkeus poikkeaa arvosta <c1/> yli <c2/>

seg-811ec460249c = GGA-korkeus, <c1/>

seg-854ea9c26df4 = C/N0:n hajonta satelliittien yli laskee osuuteen <c1/> kalibroinnin mediaanistaan

seg-837fc4cb832c = yhteisten satelliittien C/N0 nousi keskimäärin <c1/> ja niistä osuus <c2/> nousi

seg-faae07674361 = peräkkäiset epookkiajat hyppivät epäsäännöllisesti, kulkevat taaksepäin tai poikkeavat isäntäkellosta

seg-f799a53897ed = NMEA-aika; isäntäkello viimeistä osaa varten

seg-ee4913c9f2ed = vastaanotin ilmoittaa OSNMA-todennuksen epäonnistumisesta (ilmoitettu tila luetaan; mitään ei varmenneta; OSNMA:n varmentamiseksi suoraan I/NAV-sivuista ks. <a1>docs/OSNMA.md</a1>)

seg-3fad5fcde4dc = <c1/>-tilalause

seg-ce072f2ebb6c = Epookki on <b>epäluotettava</b>, kun RAIM, kellovalvonta, ratkaisun epäonnistuminen tai paikan hyppy hälyttää tai C/N0:n lasku saavuttaa kaksinkertaisen kynnyksensä; <b>heikentynyt</b> mistä tahansa muusta hälytyksestä; ja muuten <b>nimellinen</b>.

seg-4124ff6013a0 = Moottoripolku (<c1/>, <c2/>, <c3/>) on sama laskenta kuin JammerTest { "2024" } -harhautusoraakkeli tiedostossa <c4/>: <c5/> tarkistaa, että kaikilla kahdeksalla julkaistulla alkuhetkellä ensimmäinen hälytys osuu samalle epookille ja on samaa lajia.

seg-83be3c22a577 = Luottamuspistemäärä (alustatyyppi vessel)

seg-812991f245cd = Aluksen jokainen kalibroinnin jälkeinen epookki saa myös pistemäärän välillä { "0" }–{ "100" } ja syyt siihen, miksi se ei ole { "100" }. Kuvaus on deterministinen ja kiinnitetty ennen kuin yhtäkään lokia pisteytetään: ei oppimista, mitään ei sovitettu tapahtumiin. Kukin valvonta tiivistää todisteensa suhdeluvuksi <c1/> (hälytys arvolla { "1" } tai suuremmalla); suhdeluku maksaa pistemäärälle

seg-ada5a0a52315 = joten valvonta ei maksa mitään, kun se on alle kynnyksensä osuuden <c1/> (oletus { "0.5" }), maksaa puolet painostaan kynnyksellään ja koko painonsa, kun arvo on <c2/> kertaa kynnys (oletus { "1.5" }); pistemäärä ei kasva missään tunnusluvussa. Lähde, joka ei raportoi epookilla, säilyttää viimeisen tunnuslukunsa ajan <c3/> (oletus { "10" } s: kaksi C/N0-lauseen sykliä, kun lause lähetetään { "5" } s välein), sekä hälytyksenä että vähennyksenä.

seg-6c06de24ebfe = Pyöristys tehdään puolikkaasta ylöspäin (<c1/>), vyöhyke määräytyy pyöristetyn pistemäärän mukaan, ja rajaus tehdään ennen pyöristystä. Vain valvonnat, joiden pisteet ovat nollan yläpuolella, luetellaan vähennyksissä suhdelukuineen ja pyöristämättömine pisteineen, suurimmat pisteet ensin; yhtä suuret vähennykset luetellaan valvontojen nimien järjestyksessä <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. Valvonnalle, jonka testi on läpäisy tai hylkäys (epäonnistunut ratkaisu, epäonnistunut todennus), annetaan suhdeluku { "1.5" }, eli täysi paino. Luetellut pisteet ovat rajausta { "0" } edeltäviä.

seg-e36961d46c41 = Paino (pisteet)

seg-673f6adcd681 = Miksi

seg-399be3301faf = todennuksen epäonnistuminen on toteamus, ei tunnusluku

seg-69cfc61477d6 = väärennetyn paikan on oltava ristiriidassa fysiikan tai vastaanottimen omien tarkistusten kanssa, eikä aika voi kulkea taaksepäin; yksi rikkomus täydellä voimakkuudella (kun suure on { "1.5" } kertaa kynnys: { "60" } pistettä, pistemäärä { "40" }) on epäluotettava, ja kynnyksellä ({ "30" } pistettä, pistemäärä { "70" }) heikentynyt

seg-7fa1e6e67411 = yksi riippumaton anturi eri mieltä on heikentynyt; kaksi täydellä voimakkuudella on epäluotettava

seg-4c4825d2957a = signaaliympäristö tai heikosti informatiivinen tarkistus

seg-b5a364a03714 = ympäristö on vihamielinen; se yksin ei osoita, että ratkaisu on väärä

seg-4e3749965405 = enintään { "15" }, <c1/>

seg-1e595dbcf96f = ei paino tässä rampissa: ei mitään, ellei taivas ole huono, silloin enintään <c1/> ({ "15" }); geometria yksin yltää heikentyneeseen tilaan, ei koskaan epäluotettavaan, eikä anna hälytystä (ks. alla ”Geometria”)

seg-9902ca062070 = Vyöhykkeiden rajat seuraavat painoista: kevyin hälyttävä valvonta maksaa { "12.5" } pistettä kynnyksellään, joten mikä tahansa hälytys jättää nimellisen vyöhykkeen; mikään yksittäinen valvonta alle { "60" } pisteen ei yksin yllä epäluotettavaan vyöhykkeeseen (useampi yhdessä voi). Tulos tallentaa pisteytysmallin (<c1/>) ja jokainen epookki kantaa kentän <c2/>: mitkä valvonnat vähensivät, niiden suhdeluvut ja pisteet. Aluksella epookin tila on sen pistemäärän vyöhyke.

seg-6f620668ee85 = Geometria: luonnollinen heikkeneminen erillään hyökkäyksen kaltaisesta ristiriitaisuudesta

seg-93257d87e0d4 = Laiturinosturin vieressä, sulkuammeessa tai korkean rungon alla oleva vastaanotin menettää satelliitteja ja sen ratkaisu huononee syystä, joka ei ole hyökkäys. Versiosta { "0.36" } alkaen, geometrian suunnittelumuistion (<c1/>, osio { "4" }) mukaan, jokainen epookki kantaa <b>satelliittigeometriansa</b>, aluksen pistemäärässä on <b>geometriavalvonta</b> ja jokaisella vähennyksellä on <b>luokka</b>: <c2/> (taivas), <c3/> (signaaliympäristö) tai <c4/> (hyökkäyksen kaltainen todiste).

seg-17d13c39b5aa = <b>Mistä geometria tulee.</b> Kunkin seuratun satelliitin korkeuskulma ja atsimuutti (NMEA GSV, UBX NAV-SAT), joista tarkkuuden heikkenemiskerroin (DOP) johdetaan moottorin yhdellä DOP-ytimellä (<c1/>, VALIDATED gnss_lib_py:tä vasten): <c2/>. Jos se ei onnistu, vastaanottimen ilmoittama DOP ja käytetyt satelliitit (NMEA GSA): <c3/>. Taivaan paikat ja GSA lasketaan pistemäärän ajaksi <c4/> (oletus { "10" } s), koska monet väylät lähettävät GSV:n muutaman sekunnin välein; epookilla vajaaksi jäänyttä GSV-joukkoa (katkelman loppu, kadonnut lause) ei käytetä. Loki, jossa ei ole kumpaakaan, kuten NMEA, jossa on vain GGA ja RMC, tai tällä hetkellä Android- ja RINEX-lokit, saa tilan <b><c5/></b> ja huomautuksen ”geometry unknown”: moottori ei arvaa geometriaa, jota sille ei annettu, eikä geometriavalvontaa ajeta.

seg-a267da42ac3d = riittävästi satelliitteja ja DOP kynnysten sisällä

seg-dabcd392914a = yksi tai useampi syy: <c1/>, <c2/>, <c3/> ja (informatiivinen, ei pistemäärässä) <c4/>, kun jokainen seurattu satelliitti on horisontin toisella puoliskolla

seg-c255a66d3813 = loki ei anna satelliittigeometriaa tälle epookille

seg-0a50145c2bfa = Tila on kuvaileva, ja pistemäärän kannalta merkitsevää on merkintä (alla): <c1/> sisältää informatiivisen tapauksen <c2/>, joka voi esiintyä hyvän tai kohtalaisen DOP:n kanssa, ja pisteytetään vain merkintä <c3/>.

seg-93e49a562493 = <b>Merkintä</b> (raportoidaan aina, ei koskaan pisteytetä). Jokaisen epookin <c1/> on <c2/> (HDOP enintään <c3/> { "2" }, PDOP enintään <c4/> { "3" } ja vähintään <c5/> { "6" } satelliittia), <c6/> (HDOP yli <c7/> { "4" }, PDOP yli <c8/> { "6" } tai alle <c9/> { "5" } satelliittia), <c10/> näiden välillä tai <c11/>. Epookin huomautus alkaa aina merkinnällä ja luvuilla, esimerkiksi ”geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)”, ja siihen lisätään ”, signal loss”, kun se pätee.

seg-13838e036fae = <b>Geometriavalvonta</b> (aluksen pistemäärä). Se vähentää <b>ei mitään, ellei geometria ole huono</b>: sen suhdeluku on <c1/>, ja niin kauan kuin se on enintään { "1" } (hyvä tai kohtalainen geometria, mukaan lukien { "8" } satelliitin vain GPS:n avoin taivas) se ei maksa mitään, joten tällainen loki saa täsmälleen saman pistemäärän kuin versiossa { "0.35" }. Arvon { "1" } yläpuolella vähennys nousee lineaarisesti arvoon <c2/> ({ "15" }) kohdassa <c3/> ({ "1.5" } kertaa kynnykset: HDOP { "6" }, PDOP { "9" }, { "3" } satelliittia): { "7.5" } pistettä suhdeluvulla { "1.25" } (HDOP { "5" } tai { "4" } satelliittia), { "15" } arvosta { "1.5" } alkaen (pistemäärä { "85" }, heikentynyt). Yksinään se ei voi koskaan viedä pistemäärää alle arvon <c4/> (oletus: pistemäärän <c5/>, { "55" }), joten geometria yksin yltää enintään heikentyneeseen vyöhykkeeseen eikä koskaan epäluotettavaan: voimassa oleva katto on <c6/>, joten taulu <c7/>, joka nostaa arvoa <c8/> (esimerkiksi { "0.35" }-taulu, jossa <c9/> { "90" }), laskee katon arvoon <c10/> sen sijaan, että se hylättäisiin, ja arvo <c11/>, joka asetetaan alle arvon <c12/>, hylätään. Valvonta ei anna hälytystä; se luetellaan viimeisenä kentässä <c13/>, kun se teki päätöksen millä tahansa epookilla (alus, jonka loki antaa geometrian), eikä sitä lasketa mukaan { "0.35" }-identiteettiin; se ei ole kohta taulussa <c14/> (sen asettaminen hylätään), ja voimassa oleva katto ja alaraja tallennetaan kenttiin <c15/> ja <c16/>. Huonon epookin huomautus kertoo syyn, esimerkiksi ”geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency”.

seg-2082f4ccb250 = <b>Luokat.</b> Jokainen vähennys (<c1/>):

seg-4197bc517f73 = <c1/> (huono geometria); <c2/>, kun jokainen kalibroinnin lähtötasoa vasten menetetty satelliitti oli viimeisimmän raportin hetkellä alle arvon <c3/>

seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> muuten; <c7/> signaalin menetyksen aikana (alla)

seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; ja <c11/>, kun geometria on huono ja ilmoitettu HDOP on ristiriidassa ilmoitetun taivaan kanssa (alla)

seg-1b5e88a4aae4 = <b>Suoja väärennettyä huonoa taivasta vastaan.</b> Harhauttaja voisi lähettää ohuen GSV:n tai ilmoittaa korkean HDOP:n ostaakseen toleranssia. Moottori merkitsee eikä anna anteeksi: mitään muuta tarkistusta ei väljennetä huonon geometrian vuoksi, ja vastaanottimen ilmoittamaa HDOP:ia (GSA pitoajan sisällä, muuten GGA) verrataan sen ilmoittamasta taivaasta johdettuun HDOP:iin. Kun ne eroavat enemmän kuin <c1/> ({ "1.0" } tai { "25" } % johdetusta HDOP:sta, sen mukaan kumpi on suurempi), epookki kantaa merkinnän <c2/> ja, kun geometria on huono, sen vähennys luokitellaan <c3/>. Hyvällä tai kohtalaisella geometrialla ristiriita raportoidaan eikä pisteytetä: mitään ei vähennetä, ellei geometria ole huono. Tämä on harkittu valinta ({ "0.36" }): ”nolla, ellei huono” pätee jokaiselle epookille, joten hyvä ja kohtalainen geometria pisteytetään täsmälleen kuten versiossa { "0.35" }, eikä väärennetty HDOP ole koskaan äänetön. Lippu (<c4/>) on tuloksen jokaisella epookilla ja jokaisella live-rivillä, huomautus sanoo ”…beyond the tolerance: reported, not scored (the geometry is not poor)” tai ”…: the geometry deduction is classed an inconsistency”, <c5/> laskee epookit, ja todisteiden yhteenvetosivu näyttää lukumäärän nolla mukaan lukien. Luku { "25" } % on <b>REPRESENTATIVE</b> suunnitteluvalinta, ei mitattu eikä standardin mukainen luku: vastaanotin, joka ratkaisee yhden kellon tähdistöä kohti tai seuraamiensa satelliittien osajoukolla (korkeuskulmamaski, C/N0-raja, RAIM-poissulkeminen), ilmoittaa HDOP:n, joka eroaa kaikkien seurattujen satelliittien yhden kellon HDOP:sta määrällä, joka kasvaa HDOP:n mukana, joten kiinteä toleranssi yksin tulkitsisi luonnollisen huonon geometrian ristiriitaisuudeksi. Suurempi ero tulkitaan yhä sellaiseksi. Luokan <c6/> vähennys on toteamus taivaasta, ei havainto siitä, ettei hyökkäystä tapahtunut.

seg-0e729ad96db9 = <b>Signaalin menetys ei ole taivas.</b> Kun satelliitteja, jotka vastaanotin listaa näkyviin (yli <c1/>), ei seurata, moottori johtaa myös kaikkien näkyvien satelliittien DOP:n. Jos tämä näkyvien DOP on kynnysten sisällä ja joko mitään ei seurata tai seuraamattomat satelliitit ovat levittäytyneet horisontin ympärille (eivät rajoitu sen toiselle puoliskolle), taivas oli paikallaan ja signaali ei: epookki kantaa merkinnän <c2/>, huomautuksen ”satellites in view but not tracked: signal environment, not geometry”, ja geometriavähennys luokitellaan <c3/>. Seuraamattomat satelliitit, jotka rajoittuvat horisontin toiselle puoliskolle, tulkitaan yhä estyneeksi taivaaksi (seinä, kallio, laituri). Kaksipuolinen este (kanjoni tai kapea fjordi) tulkitaan signaalin menetykseksi, kunnes horisonttiprofiili on määritetty. Vastaanottimen ei-ratkaisua ilmaisevat arvot eivät ole DOP:ia: ilmoitettu HDOP tai PDOP { "99" } tai enemmän, GGA-laatu { "0" } ja GSA-tila { "1" } eivät anna ilmoitettua DOP:ia.

seg-0f218d21843b = Avain <c1/>

seg-e5ec84abd61b = valittu (suunnittelumuistio { "4.2" }): kun <c1/> on { "1.5" } m, HDOP { "4" } on 2drms-arvo { "12" } m, eli kinemaattisen tarkistuksen <c2/>. IEC 61108-1:n kerrotaan yleisesti esittävän tarkkuusvaatimuksensa HDOP:lle ≤ { "4" } (tai PDOP:lle ≤ { "6" }): muistinvaraisesti GNSS-vastaanotinkirjallisuudesta, tiettyä toissijaista lähdettä ei tarkistettu eikä standardia ole luettu; tarkistettava standardin tekstistä

seg-d99dc0fd090a = PDOP-saatavuuskynnys kohteessa <c1/>; GPS SPS Performance Standard, 5. painos ({ "2020" }), PDOP ≤ { "6" }, kuten kohteessa <c2/> siteerataan; tarkistettava standardin tekstistä

seg-2fffa47378ec = yksi enemmän kuin ratkaisu tarvitsee, jotta yksittäinen menetys ei lopeta ratkaisua; vähimmäismäärä, jolla RAIMille jää yksi ylimääräinen mittaus

seg-7dc0baed2bc4 = ilmoitettu syöte 2drms-linkille arvon <c1/> kanssa; aseta vastaanottimen oma luku

seg-7b5778d93d40 = { "1.0" } HDOP

seg-093cff5d1150 = valittu (suunnittelumuistio { "4.2" }): toleranssin absoluuttinen osa; toleranssin ylittävä ristiriita ei ole geometriaa

seg-be5c3aefd942 = REPRESENTATIVE suunnitteluvalinta: suhteellinen osa vastaanottimille, joilla on tähdistökohtaiset kellot tai osajoukkoratkaisut

seg-e71c6876114b = suunnittelumuistio { "4.3" }: sen alle menetetyt satelliitit on menetetty taivaalle; horisonttiprofiili ({ "0.36" } kohta { "1" }) laajentaa tätä

seg-bebe291ca1c0 = geometrinen, informatiivinen: jokainen satelliitti horisontin toisella puoliskolla

seg-06519582227b = suunnittelumuistio { "4.2" }: geometria yksin siirtää pistemäärän nimellisestä heikentyneeseen eikä koskaan epäluotettavaan; vähennetään vain, kun geometria on huono (perustajan päätös B1, { "0.36" })

seg-be21b5a31382 = pistemäärän oma <c1/>: ramppi yltää arvoon <c2/> kohdassa { "1.5" } kertaa huonon geometrian kynnykset

seg-e922a5342a3c = pistemäärän <c1/> ({ "55" })

seg-09fe8c435ece = geometria yksin ei koskaan yllä epäluotettavaan vyöhykkeeseen; voimassa oleva katto on <c1/>; alle arvon <c2/> asetettu alaraja hylätään

seg-a07e6ce67371 = REPRESENTATIVE, vain merkintä: puolet arvosta <c1/> ({ "0.35" }-pistemäärän alkusuhde)

seg-06db7e7af59c = REPRESENTATIVE, vain merkintä: puolet arvosta <c1/>

seg-7e7f17d36ea4 = REPRESENTATIVE, vain merkintä: yksi enemmän kuin <c1/>, jotta yksittäinen menetys jättää silti ylimääräisen mittauksen

seg-ef7a4c24e870 = <b>Mikä tulosteissa muuttui ja mikä ei.</b> Mikään pistemäärä ei muutu, ellei geometria ole huono; merkintä raportoidaan aina. Lisätyt avaimet: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> pyöristettynä arvoon { "0.001" }, <c9/> (null, kunnes horisonttiprofiili on määritetty), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satelliitit, jotka on listattu yli arvon <c16/>), <c17/>, <c18/>), <c19/> jokaisella vähennyksellä ja lopussa <c20/> (kynnykset, pito, voimassa oleva katto ja alaraja, alkuperätiedot, luokkasäännöt) ja <c21/> (epookit tilan, merkinnän ja vähennysluokan mukaan sekä epookit, joilla ilmoitettu HDOP on ristiriidassa); <c22/> on kuten versiossa { "0.35" }. Kaksi testiä sitoo tämän tavuihin asti ”{ "0.36" } portable” -vertailuversioon, kun nämä avaimet on poistettu (versioiden { "0.35.0" } tiivisteet, uudelleenperustettu, kun moottori siirtyi siirrettävään matematiikkaan ja säilytetty testeissä merkkinä siitä, mitä { "0.35.0" } julkaisi: <c23/>). <c24/> sitoo kaikki molempien esimerkki-istuntojen tulosteet (tulos-JSON, CSV, SVG, tuomio, toistetut live-rivit, <c25/>, Prometheus, CEF, LEEF). <c26/> sitoo jokaisen tallennetun aluksen NMEA-korpuksen erätuloksen, yhteenvedon, live-rivit ja <c27/> (demon ja merellisen käytön vertailutestiaineistot, kukin myös vain GPS:n avoimena taivaana { "8" } satelliitilla, sekä siemenluvuistaan generoidut miehistön koulutusskenaariot); niissä kahdessa koulutusskenaariossa, joiden häirintä tekee geometriasta huonon, jokainen epookki, joka ei ole huono, on identtinen ja jokainen huono eroaa pelkän geometriavähennyksen verran. Loki, jonka geometria on huono, menettää enintään { "15" } pistettä, joita se ei menettänyt versiossa { "0.35" }; se on tarkoitettu muutos. Demossa drag-off tulkitaan <c28/>; <c29/> muokkaa lokia peittämään läntisen taivaan (kohtalainen: merkitty, ei pisteytetty), peittämään sen ja kaksi itäistä satelliittia (huono: geometriavähennykset, lukituksen menetys <c30/>, koska myös korkeat satelliitit katosivat), menettämään vain satelliitit alle { "15" }° (lukituksen menetys <c31/>) ja ilmoittamaan HDOP:n, jota taivas ei selitä (huonon geometrian vähennyksestä tulee <c32/>). Kynnykset ovat MODELLED: valittu, ei sovitettu mihinkään lokiin; mikään tässä ei väitä, kuinka usein luonnollinen heikkeneminen ja hyökkäykset erotetaan toisistaan todellisessa datassa.

seg-8ddaf82ba00b = Tapahtumien ja ennusteiden ilmoittaminen

seg-c52c285aa308 = Kustakin tapahtumasta tulos antaa väärät hälytykset kalibroinnin ja alkuhetken välillä, ensimmäisen hälytyksen ja sen valvonnat, viiveen, lopputuloksen (<c1/>, <c2/>, <c3/> tai <c4/>) sekä havaitun C/N0:n laskun mediaanin ennustetta vasten (<c5/>, <c6/>, <c7/> tai <c8/>). Ristiriita raportoidaan, sitä ei koskaan viritetä pois: toleranssit ovat skenaariossa, ja skenaario on tuloksen tiivisteessä.

seg-3715df3fd8f7 = Mitä tämä ei väitä

seg-21a4b903e179 = Luottamusvalvonnat ovat MODELLED: niiden kynnykset ovat syötteitä, ja niiden havaitsemiskyky todellisessa häiriössä on se, mitä tapahtumapisteytys mittaa, ei jotain, mitä tämä tyyppi väittää. JammerTest { "2024" } -harhautusistunnoissa moottoripolun valvonnat saavat osan alkuhetkistä kiinni { "10" } s:n sisällä ja ovat myöhässä toisilla; luvut ks. rivi ”Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM” tiedostossa <a1><c1/></a1>. Ennuste, joka on sopusoinnussa yhden lokin kanssa, on yksi datapiste, ei validointi.

seg-0c413c1a491c = <s1>Edellinen</s1>Kestävyyden vertailu eri viitekehyksiin

seg-63fc2b340fd1 = <s1>Seuraava</s1>Merellinen luottamus
