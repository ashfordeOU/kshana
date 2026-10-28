# docs--leo-pnt: translations (fi)

seg-46c7e6f003dd = Järjestelmä

seg-cae10fb9bff8 = Skenaario

seg-f1f903f1b9ff = Kestävyys

seg-1759a8cce7d6 = Lajit

seg-71aee5eb55c5 = UHF

seg-f63dd3d7aad4 = Lähde

seg-587beeccaa11 = Esiasetus

seg-e305279d5b11 = Sisältö

seg-b03d56f501c3 = Tyyppi

seg-6752521002b2 = Osa

seg-cf6ae60eea4f = Aputiedot

seg-0bdbdd2c923b = Synkronointi

seg-b09dc4b322d3 = Efemeridi

seg-3a835a49b43f = Muut palvelut

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-c5ce76c91ff7 = Merkintä

seg-c1020ac47091 = Mitä yksi ajo laskee

seg-f708914fed48 = Kaistat

seg-486f17197d4d = REPRESENTATIVE, C-kaistan järjestelmille, joiden parametrit eivät ole julkisia (esimerkiksi TrustPoint)

seg-03d5ae448705 = <c1/> (valinnainen)

seg-fde146239f5d = Yhden ajon tulos

seg-a3f63252bd1b = Mitä se sisältää

seg-7d2c6fbf95b7 = Lähde: <c1/>

seg-6f1f29597f4b = LEO-PNT Kshanassa

seg-2a3a1f19005a = LEO-PNT on paikannus, navigointi ja ajanmääritys (PNT) matalan Maan kiertoradan (LEO) satelliiteista, keskikorkean kiertoradan (MEO) maailmanlaajuisten satelliittinavigointijärjestelmien (GNSS), kuten Global Positioning Systemin (GPS) ja Galileon, rinnalla tai sijasta. Tämä sivu kokoaa yhteen moottorin jokaisen LEO-PNT-lajin ja -skenaarion: mitä kukin laskee, kaistat ja signaaliesiasetukset ja mistä niiden luvut tulevat, mitä navigointiviesti kantaa, mikä on VALIDATED ja mikä MODELLED sekä miten kukin skenaario ajetaan. Lajisivut menevät syvemmälle:

seg-8e3556046e63 = Sivu

seg-cdb06a47be0a = <c1/> (signaalisuunnitelmat) ja monikaistaiset <c2/>-paneelit

seg-09894e033033 = <c1/> (ylilennon geometria ja linkkibudjetti kaistoittain, vähäenergiset paikkaratkaisut, ionosfäärin luotaus, harhautuksen valvonta)

seg-f19c0bfe2996 = <c1/> (lähetetty viesti: sovitin, käyttäjäalgoritmi, binääri- ja tekstimuodot)

seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (yhdistetty paikannus, tarkka pistepaikannus, 5G:n ei-maanpäällisen verkon (NTN) paikannus, ajoitus, napa-alueiden kattavuus)

seg-29013ad5656c = <c1/> (häirinnän vesiputouskuvaajat ja häirintä-signaalisuhde (J/S) kaistoittain)

seg-d291250b5d01 = <c1/> (ketjut, pyyhkäisyt, Monte Carlo -ajot ja kaikenlaiset yhdistelmät)

seg-8d2de8f77619 = Ensisijaisesti järjestelmäriippumaton

seg-f3750a8f2863 = Moottori on yleinen LEO-PNT-simulaattori. Se käsittelee mitä tahansa satelliittitähdistöä (Walker-kuviota, suoria rataelementtejä, kaksirivistä rata-elementtijoukkoa (TLE) Simplified General Perturbations { "4" } (SGP4) -etenemismallin kautta tai suunniteltua yksittäistä ylilentoa), mitä tahansa signaalisuunnitelmaa (mikä tahansa kaista, mikä tahansa yhdistelmä binäärisen vaiheensiirtoavainnuksen (BPSK), binäärisen siirtokantoaallon (BOC) ja taajuusjakoisen monikäytön (FDMA) komponentteja) ja mitä tahansa navigointiviestin mallia. Nimetyt järjestelmät ovat valinnaisia esiasetuksia: datatiedostoja, joilla kullakin on lähteensä ja jotka täyttävät vain sen, minkä skenaario jättää määrittelemättä. Jokainen ominaisuus, testi, oraakkeli ja mukana toimitettu skenaario toimii ilman Celeste-dataa.

seg-4d3bd0301e59 = Celeste IOD (kiertoratademonstraatio) -esiasetus on yksi valinnainen esiasetus muiden joukossa. Sen signaaliparametrit esiteltiin ESA NAVISP:n (Euroopan avaruusjärjestön navigoinnin innovaatio- ja tukiohjelma) LEO-PNT-työpajassa vuonna { "2026" }, eikä niillä ole vielä julkista lähdettä. Kaikki moottorin työpajasta johdetut luvut ovat yhdessä tiedostossa, <a1><c1/></a1>, jonka <c2/> kääntää mukaan vain, jos se on olemassa, sekä vain tietovarastossa olevissa skenaarioissa <c3/>. Kun tämä tiedosto ja nämä skenaariot poistetaan, esiasetus jää pois ilman lähdekoodin muokkausta; kaikki muut testit, oraakkelit ja skenaariot toimivat ilman sitä (<c4/> valvoo, mitkä tiedostot saavat nimetä sen). Tällä sivulla ei esitetä sen lukuja.

seg-5b348102cb63 = Lajit ja niiden yhteydet

seg-120b9be05fc3 = signaalisuunnitelman kaistarajoitettu tehotiheysspektri (PSD), kaistan sisäinen teho, tehollinen (Gabor-) kaistanleveys, koodinseurannan värinä suhteessa kantoaalto-kohinatiheyteen (C/N0), hakuvaihe ja spektrinen erotuskerroin (SSC) GNSS-signaaleihin nähden; kaistavertailu (ultrakorkea taajuus (UHF), L, S, C)

seg-d9febf3c74c8 = suljetut muodot VALIDATED, suunnitelmat ja vertailu MODELLED

seg-d0d8d1edd9ee = <c1/> (monikaistaiset paneelit)

seg-dc3ceb315e9a = kaistakohtaiset vesiputouskuvaajat kaistakohtaisilla häirintälähteillä (jatkuva aalto (CW), chirp, kapeakaistainen, laajakaistainen, sovitettu), kunkin signaalin J/S ja tehollinen C/N0 aikajanalla

seg-126a14392994 = spektrit VALIDATED, häirintälähteet MODELLED

seg-e63f73ab5bca = ylilennon geometria, Doppler ja Dopplerin muutosnopeus, vapaan tilan vaimennus, satelliitti- ja käyttäjäantennit, ITU-R:n (Kansainvälinen televiestintäliitto, radioviestintäsektori) kaasu-, sade-, tuike- ja rakennukseen tunkeutumisvaimennus, C/N0 kaistaa ja jaksoa kohti MEO-GNSS-kantoaaltojen rinnalla; ionosfääri kaistaa kohti ja ionosfääritön yhdistelmä; vähäenergiaiset paikkaratkaisut; ionosfäärin luotaus; harhautuksen valvonta

seg-a9fd4162604f = osat VALIDATED, ylilento MODELLED

seg-91304e663174 = lähetetty efemeridi- ja kelloviesti: sovitus, signaalin avaruusosuuden etäisyysvirhe (SISRE) suhteessa sovitusväliin ja päivitysjaksoon, ylilennon aikaisen päivityksen jatkuvuus, käyttäjäalgoritmi, binäärikehys 24-bittisellä syklisellä redundanssitarkistuksella (CRC-24Q), viennit RINEX { "4" } -tyylillä (Receiver Independent Exchange Format) ja pilkuin erotettuina arvoina (CSV)

seg-cf93a9ba065c = käyttäjäalgoritmi, painot ja CRC VALIDATED, sovitukset MODELLED

seg-3084696ad387 = Doppler-paikannus, yhteiset GNSS + LEO -pseudoetäisyysratkaisut järjestelmien välisine harhoineen, napa- ja arktinen geometria, ajansiirto koordinoituun yleisaikaan (UTC) ja valinnainen jaksokohtainen aikavirhejälki

seg-79117194e50b = suurin Doppler VALIDATED, loput MODELLED

seg-1de31fd3cf86 = tarkan pistepaikannuksen (PPP) suppeneminen pelkällä GNSS:llä ja LEO-kerroksilla

seg-525733c10d9b = 5G NTN -paikannuksen tarkkuus alalinkin kaistanleveydestä (Cramér–Rao-raja)

seg-cb8eee06e664 = yksi järjestelmä päästä päähän: signaalisuunnitelma, ylilento, viesti, yhdistetty paikkaratkaisu ja PPP, kaikki luovutukset lueteltuina

seg-d28e18170f82 = mikä tahansa edellisistä ketjutettuna samalle aikajanalle, pyyhkäistynä, ajettuna Monte Carlo -joukkona tai yhdistettynä yhteisissä olosuhteissa

seg-5479654fabfd = Ketju välittää arvoja koodissa (katso alla <a1>LEO-PNT-ketju päästä päähän</a1>): signaalisuunnitelma määrää ylilentokaistan EIRP-jaon (teholtaan isotrooppisesti säteilevä ekvivalentti teho) ja seurattavan sirunopeuden; ylilento antaa seurattavan C/N0:n ja koodin värinän; navigointiviestin SISRE ja ylilennon C/N0 painottavat yhdistetyn paikkaratkaisun LEO-mittauksia.

seg-a0331a21413c = Yleiset suunnitelmat käyttävät julkisia kaistakeskitaajuuksia; kukin on REPRESENTATIVE, ei minkään järjestelmän signaali (<c1/>, <c2/>).

seg-a86ce24d81de = Kaista

seg-daf61ebdca17 = Allokaatio

seg-ba6fbebc2a98 = Yleinen suunnitelma

seg-3332ae549a90 = Keskitaajuus

seg-c7be6f6797a8 = Lähetyksen kaistanleveys

seg-74f4e80c65cb = Komponentit

seg-e95de3591152 = Ensimmäisen kertaluvun ionosfäärin viive suhteessa L-kaistaan

seg-e769f0411e64 = Julkaisija on poistanut; arkistokopiota ei ole

seg-8b04e51a023e = ei radionavigaatioallokaatio (edustava); kantoaalto julkisesta <s1>openRECEIVER-kartoituksesta</s1> (sivu on sittemmin poistettu; katso <a1>LEO-SIGNAL.md</a1>)

seg-ea152d84aabc = { "465" } MHz

seg-8a3026904912 = { "10" } MHz

seg-e1500e8695b9 = BPSK({ "5" }) pilotti ja data

seg-ac33d89291ca = radionavigaatiosatelliittipalvelu (RNSS), Galileo E5:n keskitaajuus

seg-278d0b375f6f = { "20.46" } MHz

seg-54e10c07ace3 = BPSK({ "10" }) pilotti ja data

seg-5e28b8377751 = radiopaikannussatelliittipalvelu (RDSS), NavIC:n (Navigation with Indian Constellation) S-kantoaalto

seg-39e207bee75b = { "2492.028" } MHz

seg-a573432714b8 = { "16.5" } MHz

seg-6fe14d537f33 = RNSS, { "5010" }–{ "5030" } MHz:n allokaation keskitaajuus

seg-48fabff33863 = { "5020" } MHz

seg-0b50907d3165 = { "20" } MHz

seg-c43105d1c770 = Laajennettu C

seg-c05714081a0e = RNSS-allokaation ulkopuolella (edustava)

seg-638ab0837b29 = { "5100" } MHz

seg-4d3857271629 = { "120" } MHz

seg-18bc5451fc46 = BPSK({ "50" }) pilotti ja data

seg-3714e1c00ab8 = S (matkaviestinsatelliittipalvelu, MSS)

seg-cc26934bac14 = MSS-alalinkki, 3GPP:n (Third Generation Partnership Project) kaista n256

seg-12ca7304ece7 = käyttäjänä <c1/>

seg-896b6ee57728 = { "2172.5" } MHz

seg-e6e1d955489a = { "0.18" }–{ "20" } MHz

seg-50e44c7042c9 = 5G New Radio -paikannussignaalit

seg-02f71b44edf5 = Signaali- ja järjestelmäesiasetukset

seg-c60ce9c32b57 = REPRESENTATIVE, kaistojen keskitaajuudet ITU:n radiosäännöstöstä

seg-58fae66f7c12 = <c1/> (signaalisuunnitelmat): yllä oleva kaistataulukko; <c2/> (<c3/>-oletus): UHF { "450" } MHz:llä, L, S ja C yllä olevilla keskitaajuuksilla, { "0" } dBW EIRP kaistaa kohti, { "550" } km:n aurinkosynkroninen Walker 240/12/1 -kerros

seg-5d918965c00c = BPSK({ "10" }) { "5020" } MHz:llä, isoflux-keila

seg-dddb031a7e2e = PUBLIC: Leclère, Marathe ja Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

seg-67fc4039084d = X1 { "1593.3225" } MHz:llä ({ "1.023" } Mchip/s) ja X5 { "1190.51625" } MHz:llä ({ "10.23" } Mchip/s), julkaistut pienin ja suurin vastaanotettu teho, { "258" } satelliittia noin { "1080" } km:n korkeudella ({ "53" } ja { "97" } asteen kuoret)

seg-f17f98d1ae0b = PUBLIC: <a1>Resilient Navigation and Timing Foundationin (RNTF) katsaus</a1>

seg-c6694cdbb02b = purskeet { "1616" }–{ "1626" } MHz:llä, Doppler enintään ±{ "36" } kHz, { "66" } satelliittia { "780" } km:n korkeudella ({ "781" } km esiasetuksessa <c1/>), vastaanotettu teho ”{ "300" }–{ "2400" } kertaa GPS”

seg-704ec002a889 = <c1/> / <c2/> / <c3/> (signaali-, ylilento- ja paikannuslajit)

seg-a4a3a7c7bc22 = PUBLIC-signaalilukuja: Kozhaya, Saroufim ja Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; REPRESENTATIVE-rata

seg-49985bf11216 = { "240" } MHz:n Ku-kaistan majakka, jota käytetään vain Dopplerille, C/N0 noin { "57" } dB-Hz

seg-84cb50b019e0 = PUBLIC-signaalirakenne: <a1>PMC10301026</a1>; REPRESENTATIVE-rata ja teho

seg-1c50faed9f1e = BPSK nopeudella { "2.046" } Mchip/s L1:n ja L5:n lähellä

seg-c72e9b87f116 = <c1/> (<c2/> viestilajissa)

seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ATOMIC-hyötykuorma (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

seg-4f0cff24b4fd = 6. asteen polynomiefemeridi ilman kelloterms (kello ohjataan GNSS-aikaan)

seg-9d1e7aebcd84 = WORKSHOP: esitelty ESA NAVISP:n LEO-PNT-työpajassa, { "2026" }

seg-28c2e7ae6065 = kiertoratademonstraation signaalikonfiguraatio #1 ja viestin rakenne, yhdessä pois jätettävässä tiedostossa

seg-9f0d16f43993 = Jokainen esiasetus merkitsee lukunsa PUBLIC (URL-osoitteella), REPRESENTATIVE (dokumentoitu suunnitteluvalinta, ei koskaan väite todellisesta järjestelmästä) tai WORKSHOP, ja jokaisen sitä käyttävän ajon tulos kertoo, mikä niistä on kyseessä.

seg-556fe9c6c3b1 = Navigointiviesti

seg-a220662ed8de = LEO-navigointiviesti (<a1>LEO-NAVMSG.md</a1>) sisältää neljä osaa, rakenteen, jonka Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) ja julkaistut LEO-ehdotukset jakavat:

seg-5bda276f6e82 = Galileo ICD:n 16 parametrin Kepler-joukko (isoakselin neliöjuuri, eksentrisyys, inklinaatio ja sen muutosnopeus, noususolmun rektaskensio ja sen muutosnopeus, perigeumin argumentti, keskianomalia, keskiliikkeen korjaus, kuusi harmonista korjausta, vertailuaika) sekä rataa pitkin, rataa vasten kohtisuoraan ja säteen suunnassa olevat korjauspolynomit; tai Liu ym. { "2025" } 22 parametrin malli (<a1>doi 10.3390/rs17162894</a1>); tai ATOMICin nollakello-polynomi

seg-8a7dabfece01 = viikkonumero ja viikon aika (TOW) sekä toisen asteen kellopolynomi (af0, af1, af2 suhteessa aikaan toc)

seg-24eaf4ae7eb3 = avaruusaluksen tunniste (SVID), datan versio (IOD), signaalin tila

seg-e7d819b7a724 = ionosfäärikorjaukset yksitaajuuskäyttäjille (Klobuchar-tyylinen joukko ja NeQuick-G ai0–ai2) sekä järjestelmäajan ja UTC:n erotus (A0, A1, karkaussekunnit ja niiden aikataulu)

seg-200e59d9279c = Binäärikehys on Kshanan oma dokumentoitu koodaus, joka on mallinnettu näiden osien mukaan, ei minkään järjestelmän bittirakenne. RINEX { "4.02" } ei määrittele LEO-navigointitietueita, joten RINEX-tyylinen vienti on dokumentoitu Kshanan laajennus (aiempi tutkimus: <a1>arXiv { "2401.17767" }</a1>).

seg-aa18ab84599b = <c1/>-pyyhkäisy lajista <c2/>

seg-70dc120ea19e = { "50" } MHz:n kohinahäirintä { "1185" } MHz:llä pyyhkäistynä −{ "140" } dBW:stä −{ "80" } dBW:hen: GPS L5 menetetään −{ "105" } dBW:llä, Galileo E5a ja LEO:n L-kaistasignaali −{ "100" } dBW:llä; LEO:n UHF-, S- ja C-kaistasignaalit säilyttävät { "49.4" }, { "49.2" } ja { "47.4" } dB-Hz jokaisella teholla

seg-61f05d7e3a18 = { "40" } MHz:n kohinahäirintä { "1185" } MHz:llä, joka nousee { "5" } dB { "10" } sekunnin välein −{ "125" } dBW:stä: GPS L5 menetetään −{ "105" } dBW:llä, Galileo E5a −{ "100" } dBW:llä, Xona X5 (julkaistulla vähimmäisteholla −{ "144.9" } dBW) −{ "95" } dBW:llä; yleinen LEO-signaali seuraa vielä −{ "135" } dBW:llä −{ "90" } dBW:n häirintätasolla ({ "28.9" } dB-Hz). Vastaanotettu teho ostaa J/S-marginaalia desibeli desibeliltä

seg-6a3a46be60a5 = { "30" } m:n paikkahyppy mitatulla paikalla: pelkän GNSS:n Doppler-testi ei havaitse sitä koskaan; testi jokaisella kanavalla havaitsee sen { "105" } s alkamisen jälkeen (katso <a1>LEO-PASS.md</a1>)

seg-d0c4683d7c93 = <c1/>-yhdistelmä lajista <c2/>

seg-bf0ec52f63ea = neljä harhauttajaa, molemmat valvontamenetelmät: vain L-kaistaa harhauttava ja kaikkia kaistoja harhauttava, ionosfääriä huomioimaton harhauttaja jäävät kiinni kaistojen välisessä valvonnassa alkuhetkellä ({ "300" } s) ja Doppler-valvonnassa ajoilla { "420" } s ja { "395" } s; ionosfäärin huomioiva kaikkia kaistoja harhauttava harhauttaja vain Doppler-valvonnassa ({ "395" } s); pelkän GNSS:n { "30" } m:n työntö kummassakaan ei

seg-17bcc4ead2ee = <c1/>-ketju (<c2/>, <c3/>)

seg-d9b6e6fe6807 = GNSS häirittynä { "15" } minuuttia (GPS L1:n karkea hankintakoodi (C/A) noin { "10" } dB-Hz:iin, E5a { "17.4" } dB-Hz:iin { "25" } dB-Hz:n kynnystä vasten), kun taas S- ja C-kaistan LEO-signaalit säilyttävät { "49.2" } ja { "47.4" } dB-Hz; pelkän LEO-kerroksen vastaanottimen autonominen eheyden valvonta (RAIM) muodostaa suojaustason jokaisella jaksolla, alle { "50" } m:n pystysuuntaisen hälytysrajan { "28" }:lla { "30" } ruutuajasta, ja hälytys annetaan kahdella muulla; normaali- ja toipumisvaiheet { "5.4" }–{ "15.6" } m

seg-42efdd12fc54 = Harhautuksen valvonta, sen tilastot ja rajat ovat sivulla <a1>LEO-PASS.md</a1>. Monikaistainen vesiputouskuvaaja, jossa on eri häirintälähde kullakin kaistalla, on <c1/> (<a2>LEO-SIGNAL.md</a2>).

seg-d9e58c4aa8d5 = Yksi skenaario kutakin koealuetta kohti

seg-1ab626f27e9d = Celeste IOD:n kolmannen osapuolen kokeilukutsun (ESA Open Space Innovation Platform, OSIP) kahdeksan koealuetta ovat yleisiä LEO-PNT-kysymyksiä; kullakin on järjestelmäriippumaton skenaario:

seg-afc60ca3c9da = Koealue

seg-8a8f40ce3e40 = Erittäin tarkka paikannus (PPP)

seg-b5eb3448dbb1 = <c1/>-pyyhkäisy lajista <c2/>

seg-5692301bc7cf = 192 satelliitin kerros { "500" }, { "1000" } ja { "1500" } km:n korkeudella lyhentää monen GNSS:n liukulukukäsittelyn PPP-suppenemista Münchenissä { "13.0" } minuutista { "3.25" }, { "3.25" } ja { "3.5" } minuuttiin (kuusi toteumaa, { "30" } s:n jaksot)

seg-3992215bc8c9 = PNT-kestävyys (L, S, C)

seg-a2cc270b415c = katso Kestävyys

seg-8a6381ff15ac = 5G/6G NTN -yhteensopivuus

seg-ae21ac79775f = <c1/>-pyyhkäisy lajista <c2/>

seg-cb52e7eb3c36 = paikannusviitteen kaistanleveys { "180" } kHz–{ "20" } MHz: tsenitin etäisyyden sigma { "6.5" } m–{ "5.8" } cm, saapumisajan 3D-virhe { "30.1" } m–{ "2.1" } m, jonka alarajana on { "1" } m:n verkon synkronointivirhe

seg-45985b521980 = Vähäenergiainen PNT esineiden internetille (IoT) ja matkaviestimille

seg-9afaaed509ef = <c1/>-pyyhkäisy lajista <c2/> <c3/>

seg-3bb8cc776a28 = UHF:n EIRP −{ "35" }–+{ "5" } dBW: noin { "35" } dB-Hz:n C/N0-mediaanin alapuolella kuumakäynnistyksen energia paikkaratkaisua kohti nousee { "18" } mJ:sta { "55" } J:iin; sen yläpuolella akun kesto yhdellä paikkaratkaisulla tunnissa on { "8334" } päivää, jonka määrää lepovirta

seg-4b0890bd9215 = LEO-PNT-tiede

seg-a1ddeda103fa = vinon suunnan elektronipitoisuus (TEC) neljän kaistan ylilennon jokaisesta kaistaparista Tromssan yllä: { "18.85" } TEC-yksikköä saatiin takaisin kustakin parista, 1-sigma { "0.017" } (UHF ja L) – { "2.9" } TEC-yksikköä (S ja C)

seg-fc31db33e6fe = Lisättävät PNT-datapalvelut

seg-91db4e7b4d9c = <c1/>-yhdistelmä lajista <c2/>

seg-aee8bb27a2fb = Kshanan viestikehys kasvaa { "146" } tavusta (efemeridi ja kello, { "1045" } bittiä) { "154" } tavuun Klobuchar-joukon kanssa, { "159" } tavuun NeQuick-G:n kanssa ja { "171" } tavuun UTC-parametrien kanssa

seg-bd6c76037986 = Sisätilanavigointi (UHF)

seg-0a274a3aeb86 = huippu-C/N0 sisätiloissa perinteisessä rakennuksessa: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; lämpötehokkaassa rakennuksessa UHF { "15.3" } dB-Hz ja kaikki muut kaistat matalammat

seg-101de8218f35 = Yhdistetty MEO- ja LEO-PNT

seg-b4daa58a2fe7 = <c1/>-pyyhkäisy lajista <c2/>

seg-903d8dcb96cc = Xona X5 yhdistettynä GPS:ään ja Galileoon Madridin yllä: pelkän GNSS:n 3D-virhe { "1.06" } m tehollisarvona (RMS); yhdistettynä { "0.08" } m, kun LEO:n SISRE on { "5" } cm, { "0.57" } m, kun se on { "0.5" } m, ja { "1.01" } m, kun se on { "5" } m

seg-ebe7a27275cb = Yksi skenaario kutakin loppukäyttäjäalaa kohti

seg-7c21d067769a = Jokainen ala on yhden aikajanan <c1/>-ketju, joten se animoituu, ja jokaisella on <c2/>-jäsen, joten se vie geometrian (katso <a1>Ajaminen</a1>).

seg-1d1135625500 = Ala

seg-f1a7e54ea7d0 = Autonomiset ajoneuvot

seg-3610a5f7c352 = auto Münchenissä: avoin tie, yhdistetty virhe keskimäärin { "0.30" } m; { "35" } asteen kaupunkikanjonissa GPS ja Galileo säilyttävät { "8" } satelliittia ja { "5.8" } m:n keskivirheen, yleinen LEO-kerros lisää { "4" }–{ "5" } ja tuo sen arvoon { "2.1" } m, mikä on edelleen yli { "1.5" } m:n kaistatason rajan noin puolella kanjonin jaksoista

seg-6622d9c7366d = Rautatie ja merenkulku

seg-73ba745cb492 = mukana toimitettu <c1/>-alus menettää kaikki GNSS-satelliitit ({ "12.1" } dB-Hz), kun taas sen S- ja C-kaistan LEO-ylilento yltää arvoihin { "44.2" } ja { "38.1" } dB-Hz; mukana toimitettu <c2/>-juna saavuttaa { "2" } m:n inertiavirheen { "35.8" } s tunneliin ajon jälkeen; avoimessa maastossa sen LEO-ylilento antaa L-kaistalla { "35" }–{ "50" } dB-Hz

seg-c87973b9139a = Kriittinen infrastruktuuri

seg-c16a4c99e132 = sähköasemän aikapalvelimen TCXO-luokan oskillaattori (lämpötilakompensoitu kide) vapaasti käyvänä vuorokauden ilman GNSS:ää yltää arvoon { "29" } µs ja ylittää { "1" } µs:n vartiorajan { "75" }–{ "80" } minuuttia menetyksen jälkeen (5 minuutin ruudukolla); samaa luokkaa oleva, Iridiumiin ohjattu oskillaattori pysyy välillä −{ "40" }–+{ "11" } ns

seg-1be8e11b2530 = Napa-alueiden ja arktisten alueiden käyttäjät

seg-660e450cb4ab = GPS + Galileo, keskimääräinen paikan tarkkuuden heikkenemiskerroin (PDOP) { "1.38" }, { "1.57" } ja { "1.62" } Tromssassa, Huippuvuorilla ja pohjoisnavalla; Iridiumin kanssa { "1.29" }, { "1.34" } ja { "1.26" }, kun näkyvissä on { "3.0" }, { "5.5" } ja { "6.8" } Iridium-satelliittia

seg-22d99734acf1 = Langattomat 5G/6G-verkot

seg-abcc6337206f = tukiaseman uunistabiloitu kideoskillaattori (OCXO) holdover-tilassa ylittää { "1.1" } µs:n verkkorajan { "8863" } s:n jälkeen ja { "1.5" } µs:n loppusovellusrajan { "10006" } s:n jälkeen (lajin <c1/> analyysi); Xona X5:een ohjattuna sen aikavirhe pysyy koko päivän välillä −{ "0.7" }–+{ "0.3" } ns, ennustetulla 1-sigmalla { "5" } ns, joka on lähetetyn UTC-erotuksen ilmoitettu epävarmuus

seg-532d6814ab2d = Omaisuuden seuranta ja IoT

seg-b4d6d822e1d0 = konttitunnisteen kuuma UHF-paikkaratkaisu maksaa { "18" } mJ laiturilla ja merellä ({ "8334" } päivää akkua yhdellä paikkaratkaisulla tunnissa) ja { "34" } mJ varastossa ({ "5770" } päivää), jossa L-kaista putoaa arvoon { "20" }–{ "24" } dB-Hz

seg-e54b0342fa79 = VALIDATED ja MODELLED

seg-dd808d1741f3 = Rivi on VALIDATED vain silloin, kun testi toistaa julkaistun asetelman ja lukitsee julkaistun luvun ilmoitetun toleranssin sisälle; kaikki muu on MODELLED perusteluineen (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

seg-592a6cf625c5 = VALIDATED LEO-PNT-rivit:

seg-344712930047 = suljetun muodon kaistarajoitettu signaaliteho ja varhais-myöhäis-koodinseurannan värinä julkaistuissa toimintapisteissä (Betz ja Kolodziejski { "2009" }), Gabor-kaistanleveys ja SSC ristiintarkistettuina;

seg-e93d5b5d3dda = LEO-navigointisatelliitin suurin Doppler (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) ja paikallaan olevan käyttäjän Doppler-verhokäyrä suhteessa arXiv { "2509.19551" } -julkaisun taulukkoon { "1" };

seg-b02c1b42e509 = ITU-R P.838-3:n sadekertoimet, P.618-14:n sadevaimennus ja troposfäärin tuike sekä P.2109-2:n rakennukseen tunkeutumisvaimennus suhteessa ITU-R:n tutkimusryhmän { "3" } validointidataan;

seg-fc668542b66d = ensimmäisen kertaluvun ionosfäärin viiveen skaalaus ja vapaan tilan vaimennus (IS-GPS-200:n ryhmäviivesuhde, Friisin muoto);

seg-59847c667c8b = maailmanlaajuisen keskiarvon SISRE-painot (Montenbruck ym. { "2018" }), Galileo ICD:n käyttäjäalgoritmi suhteessa RTKLIBiin todellisilla lähetetyillä efemerideillä sekä CRC-24Q suhteessa luettelon tarkistusarvoon.

seg-922761c46f8a = MODELLED LEO-PNT-rivit: jokainen signaalisuunnitelma ja kaistavertailu, monikaistainen vesiputouskuvaaja, jokainen ylilento ja linkkibudjetti kokonaisuutena, esiasetukset, vähäenergiaiset paikkaratkaisut, viestin sovitin ja formaatit, Doppler ja yhteispaikannus, PPP:n suppeneminen, NTN-paikannus, ajansiirto, napa-alueiden kattavuus, päästä päähän -ketju, harhautuksen valvonta ja ionosfäärin luotaus sekä jokainen kampanja (kampanja yhdistää lajeja eikä lisää fysiikkaa; sen yhdistämisidentiteetit on testattu, <a1>CAMPAIGNS.md</a1>). Mitään LEO:n C/N0-, etäisyysvirhe- tai paikannuslukua ei ole verrattu minkään satelliitin mittaukseen.

seg-3cc1d3f1c0f8 = Skenaarion ajaminen

seg-00d5b60c0ebb = Jokainen yllä oleva skenaario on mukana toimitettu: <c1/> tulostaa sen, ja

seg-e01ebe977e65 = kirjoittaa tiedoston viereen tuloksen (<c1/>), kaavion (<c2/>), laajan raportin (<c3/> ja <c4/>, jossa on osio, joka upottaa animoidun ajon ja luettelee viennit), interaktiivisen soittimen (<c5/>) ja viennit. Mikä näistä pätee, riippuu lajista:

seg-8a96eda978b4 = aika-akselillinen ajo animoituu: <c1/>-jaksot, harhautusajon <c2/>, <c3/>-aikajanat, <c4/>-yhteisjaksot ja ajoitusjäljet, <c5/>-virhekäyrät ja jokainen kampanjaketju. Pyyhkäisyllä tai yhdistelmällä ei ole aika-akselia: <c6/> hylkää sen poistumistilalla { "1" } ja sitten komento ei kirjoita mitään, joten aja yllä olevat kahdeksan pyyhkäisyä ja yhdistelmää (<c7/>, <c8/> ja jokainen <c9/>-skenaario paitsi <c10/>) ilman valitsinta <c11/>;

seg-8d26148aeeff = <c1/> ja <c2/> vievät ylilennon geometrian CZML-muodossa (Cesium Language), KML-muodossa (Keyhole Markup Language), GeoJSON-muodossa ja STK-efemerideinä (Systems Tool Kit); kampanja vie jokaisen geometrian sisältävän jäsenen omana tiedostojoukkonaan, jäsenen nimike tiedostonimessä (<c3/>), joten jokainen ala vie LEO-ylilentonsa; muut LEO-lajit kertovat, miksi jokin formaatti ei sovellu (<a1>INTEROP.md</a1>).

seg-6f3ad057f914 = Muut LEO-skenaariot lajeittain (lisätietoja kunkin lajin sivulla):

seg-73365a12bf64 = <c1/>, <c2/>, valinnainen <c3/>

seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valinnainen <c6/>

seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, valinnainen <c5/>

seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, valinnainen <c6/>

seg-e3017b224dfc = <c1/>, <c2/>, valinnainen <c3/>

seg-1ada84b384ee = Valinnaiset skenaariot ovat vain tietovarastossa, ja ne jätetään pois Celeste-esiasetustiedoston mukana.

seg-6305e46ec778 = Kaksi niistä kuuluu muihin lajeihin. <c1/> (<c2/>) mitoittaa 5000 satelliitin LEO-PNT-tähdistön neljässä havainnollistavassa Walker-kuoressa: saatavuus { "99.22" } % PDOP-arvolla { "3" } tai alle { "20" }°:n maskin yläpuolella, PDOP:n mediaani { "1.11" } ja keskimäärin { "39.4" } näkyvää satelliittia { "648" } ruudukkopisteessä ja { "12" } jaksolla. <c3/> (<c4/>) kysyy, kuinka kauan LEO-piensatelliitin tietolehden mukainen OCXO pysyy { "100" } ns:n aikaväliohjauksen rajan sisällä arvolla k = { "3" } viimeisen GNSS-paikkaratkaisun jälkeen: raja rikkoutuu { "650.8" } s paikkaratkaisun jälkeen, joten tarvitaan paikkaratkaisu vähintään { "645.8" } s:n välein ({ "133.8" } päivässä), ja taajuuden satunnaiskulkukohina on hallitseva tekijä.

seg-ee9f20a4485b = LEO-PNT-ketju päästä päähän

seg-a6167db680ba = Laji <c1/> (<a1><c2/></a1>) seuraa yhtä LEO-PNT-järjestelmää sen signaalisuunnitelmasta käyttäjän paikkaan. Jokainen vaihe on moottorin oma laji, ajettuna ketjuskenaarion omalla taulukolla, ja ketju välittää arvoja vaiheesta toiseen koodissa:

seg-38ce4c90dd78 = Mistä

seg-2cbf005ed5cc = Mihin

seg-5d84d64174b6 = Mitä välitetään

seg-15372352ab42 = seurattavan komponentin tehoosuus, kaistan sisäinen osuus ja seurattava sirunopeus (kaistan EIRP-jako ja sen C/N0-poikkeama)

seg-0be525c6b695 = ketjusatelliitin korkeus ja inklinaatio (viestin todellinen rata), ellei <c1/> ilmoita niitä

seg-d2306e118be7 = seurattava C/N0 paikannusmaskin kohdalla ja zeniitissä, ylilentoon sovitetusta pienimmän neliösumman suorasta muuttujassa sin(korkeuskulma)

seg-ee40b8cd109b = signaalin avaruusosuuden etäisyysvirhe (SISRE): viestin esitysvirhe (tehollisarvo, rata ja kello) yhdistettynä skenaarion <c1/>-radanmääritystermiin neliösummana

seg-b4b3dff58f3b = kantoaaltotaajuus ja seurattava sirunopeus

seg-4def115dba1b = Arvo välitetään eteenpäin vain, jos jatkossa oleva taulukko jättää sen asettamatta, ja jokainen luovutus luetellaan tuloksen <c1/>-taulukossa arvoineen, yksikköineen ja kohteineen. Kaistan <c2/> on nimettävä suunnitelma (<c3/>); näin <c4/>-kaista voi kantaa mitä tahansa <c5/>-suunnitelmaa myös yksinään: se ottaa suunnitelman keskitaajuuden, lähetyksen kaistanleveyden ja seurattavan sirunopeuden, jakaa EIRP:nsä komponenttien kesken ja raportoi seurattavan komponentin C/N0:n sekä kaistarajoitetun koherentin varhais-myöhäis-koodinseurannan värinän (Betz ja Kolodziejski { "2009" }; puolen sirun väli, { "1" } Hz:n silmukka, { "20" } ms) jokaisella jaksolla.

seg-e75e48eeeca1 = BPSK(n) on binäärinen vaihesiirtoavainnus nopeudella n × { "1.023" } Mchip/s. Viiveen suhde on <c1/>, kun <c2/> = { "1191.795" } MHz. Vapaan tilan vaimennus kasvaa määrällä <c3/> samalla etäisyydellä (−{ "8.2" } dB UHF-kaistalla, +{ "6.4" } dB S-kaistalla, +{ "12.5" } dB C-kaistalla).

seg-2a2b15256cf4 = generic: edustava malli <c1/>: { "1080" } km, { "53" }° ylilento Madridin yllä, 240 satelliitin Walker-kerros

seg-bb05e8e505e3 = seurattu C/N0-huippu { "58.2" } dB-Hz, koodijitterin mediaani { "0.050" } m; SISRE { "0.250" } m välitetty eteenpäin; pelkän GNSS:n neliöllinen keskiarvo (RMS) 3D-virhe { "1.60" } m, GNSS + LEO { "0.43" } m; tarkan pistepaikannuksen (PPP) konvergoituminen { "11.5" } min pelkällä GNSS:llä, { "7.5" } min LEO-kerroksen kanssa

seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), kallistettu kuori paikannukseen ja molemmat kuoret PPP:hen

seg-a8fe501bf419 = seurattu C/N0-huippu { "66.3" } dB-Hz, koodijitterin mediaani { "0.018" } m; pelkän GNSS:n RMS 3D-virhe { "1.49" } m, GNSS + LEO { "0.68" } m; PPP:n konvergoituminen { "20.6" } min pelkällä GNSS:llä, { "5.9" } min Pulsarin kanssa

seg-002e4c918dda = <c1/> (valinnainen)

seg-a608af78a360 = Celeste IOD E5 -konfiguraatio #1 Celeste-viestiesiasetuksen kanssa (pidätetty esiasetuksen mukana)

seg-be428c21bd27 = ylilento toistaa esiasetuksen kalibroiman kokonais-C/N0:n huipun (arvo on esiasetustiedostossa); kaksi satelliittia tuskin muuttaa 95 minuutin yhdistettyä paikkaratkaisua ({ "1.50" } m:stä { "1.48" } m:iin RMS 3D)

seg-bf44ba47e48b = kirjoittaa tuloksen, kaavion, laajan raportin (joka upottaa animoidun ylilennon ja linkittää viennit), interaktiivisen soittimen sekä ylilennon geometrian CZML- (Cesium Language), KML- (Keyhole Markup Language), GeoJSON- ja STK- (Systems Tool Kit) efemeeritiedostot.

seg-a08e67a32d60 = Ketju on MODELLED: se ei lisää fysiikkaa, ja jokainen vaihe säilyttää omat merkintänsä. Paikannusvaiheen C/N0-malli on suora viiva muuttujassa sin(korkeuskulma), joten ylilentokohtainen muoto supistuu kahdeksi luvuksi; viestivaihe ei mallinna radanmääritystä, minkä vuoksi <c1/> on ilmoitettu syöte ({ "0.25" } m mukana toimitetuissa skenaarioissa, edustava desimetritason aluksen sisäiselle radanmääritykselle ja ohjatulle sirutason kellolle, jonka ATOMIC-hyötykuorma raportoi: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

seg-ee3c5b58e6fa = <s1>Edellinen</s1>Kuun rata ja pinta infrastruktuurina

seg-6b951d6413c8 = <s1>Seuraava</s1>LEO-signaalimallit

seg-9bfe27f7ebc5 = <s1>Edellinen</s1>Tehtäväketju: Kuun osuus
