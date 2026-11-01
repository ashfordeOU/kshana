# docs--constellation-design: translations (fi)

seg-f63dd3d7aad4 = Lähde

seg-8f0e4021404d = Lähde: <c1/>

seg-44196ab9678c = Skenaariolaji <c1/> rakentaa yhden tai useamman satelliittitähdistön Maan, Kuun, Marsin tai minkä tahansa muun aurinkokunnan luettelon kappaleen (<c2/>: kahdeksan planeettaa, Pluto, Kuu, Phobos, Deimos, neljä Galilein kuuta ja Titan, samoilla vakioilla, joita skenaariolajit <c3/> ja <c4/> käyttävät; ks. <a1>SOLAR-SYSTEM.md</a1>) ympärille ja kartoittaa niiden peiton ja tarkkuuden heikkenemiskertoimen (DOP) leveys-/pituusasteruudukossa. Lähde: <c5/>.

seg-61385c509a3d = Kappale valitaan asetuksella <c1/> (oletus <c2/>). Ajo kattaa ajan <c3/> (oletus yksi tähtivuorokausi, { "86 164" } s) askelin <c4/> (oletus { "600" } s), maskin <c5/> (oletus { "5" } deg) yläpuolella, ruudukossa <c6/> (oletus { "10" } deg), jota <c7/>, <c8/>, <c9/> ja <c10/> voivat rajoittaa; <c11/> lisää sekulaarin ajautuman J2:sta, kappaleen painovoimakentän toisesta zonaalisesta harmonisesta.

seg-d02f6d747522 = Mitä sisään menee

seg-743e68478333 = <b>Walker-kuoret</b> merkintätavalla <c1/>: <c2/> satelliittia <c3/> tasavälisessä tasossa vaiheistuksella <c4/>. <em>Delta</em>-kuvio levittää nousevat solmut { "360" } deg alueelle, <em>star</em>-kuvio { "180" } deg alueelle. Taso <c5/> sijaitsee solmussa <c6/> ja sen satelliitti <c7/> keskianomaliassa <c8/>.

seg-d86b01d633a0 = <b>Eksplisiittiset elementtijoukot</b>: isoakseli tai korkeus, eksentrisyys, inklinaatio, nousevan solmun rektaskensio (RAAN), periapsiksen argumentti ja keskianomalia.

seg-0737ef1ddb72 = <b>Esiasetukset</b> julkaistuista nimellisistä elementeistä (vain Maa; esiasetus toisen kappaleen ympärillä on virhe):

seg-587beeccaa11 = Esiasetus

seg-1ff32b87e030 = Satelliitit

seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5. painos, huhtikuu { "2020" }, taulukot 3.2-1 ja 3.2-3

seg-fb6956d09acc = { "24" }–{ "30" }

seg-f679ee0f3a3f = SPS PS, taulukko 3.2-2: jokainen kuudesta laajennettavasta paikasta (B1, D2, F2, A2, C4, E3), joiden nimet on annettu asetuksessa <c1/>, korvataan etu- ja takaparillaan; oletuksena kaikki kuusi

seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), issue { "1.1" }: Walker 24/3/1, isoakseli { "29 599.801" } km, { "56" } deg (taulukko { "1" }), paikat taulukosta { "23" }

seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), jakso { "4.1" }: keskikorkea Maan kiertorata (MEO) Walker 24/3/1 korkeudella { "21 528" } km ja inklinaatiolla { "55" } deg, sekä kolme geostationaarista (GEO) satelliittia pituusasteilla { "80" }, { "110.5" } ja { "140" } deg E ja kolme kallistunutta geosynkronista (IGSO) satelliittia inklinaatiolla { "55" } deg

seg-70a32cd2402d = GLONASS Interface Control Document (ICD), painos { "5.1" } ({ "2008" }), jakso { "5.2" }: paikkakaava, { "19 100" } km, { "64.8" } deg

seg-654d7aceff94 = GPS-taulukon RAAN on inertiaalinen sen epookissa; esiasetus muuntaa sen maakiinteäksi solmun pituusasteeksi taulukon ilmoittamalla Greenwichin tuntikulmalla ({ "100.765" } deg). GLONASS ilmoittaa absoluuttiset (Greenwichin) solmujen pituusasteet suoraan. Galileo-asiakirja ei ilmoita tuntikulmaa, joten sen RAAN:ia käytetään solmun pituusasteena. BeiDou-standardi ei ilmoita MEO-vaihetta eikä IGSO-solmuja; esiasetus aloittaa MEO-kuvion solmusta { "0" } ja keskianomaliasta { "0" } ja asettaa kolme IGSO:ta yhdelle maanpintajäljelle, joka ylittää päiväntasaajan pituusasteella { "118" } deg E. Nämä kaksi valintaa ovat mallinnettuja.

seg-b2bbdd23c13b = Useampi tähdistö voi jakaa yhden ajon. Asetuksella <c1/> (oletus) vastaanotin estimoi yhden kellon jokaista näkyvissä olevaa järjestelmää kohden, kuten usean GNSS-järjestelmän (maailmanlaajuinen satelliittinavigointijärjestelmä) vastaanotin; <c2/> jakaa yhden kellon.

seg-27db52482bdd = Mitä tulee ulos

seg-2405196cfccb = Ruutua kohden: keskimääräinen, pienin ja suurin satelliittimäärä maskin yläpuolella; niiden epookkien osuus, joilla on paikkaratkaisu ja paikka-DOP (PDOP) on enintään <c1/>; keskimääräiset geometrinen, paikka-, vaaka- ja pystysuuntainen DOP (GDOP, PDOP, HDOP, VDOP); suurin PDOP. Globaalisti, painotettuna leveysasteen kosinilla, jotta jokainen ruutu lasketaan alansa mukaan: saatavuus, huonoimman paikan saatavuus sekä kunkin DOP:n keskiarvo, mediaani, 90., 95. ja 99. persentiili ja maksimi. Satelliittia kohden: harvennettu maanpintajälki (näytteitä <c2/>, oletus { "24" }, satelliitteja enintään <c3/>, oletus { "120" }). Kaavio on kaksi karttaa: saatavuus ja keskimääräinen PDOP.

seg-6cb532d0bca9 = Miten se skaalautuu

seg-988ae3272c1f = Satelliitti säteellä <c1/> on korkeuskulmamaskin <c2/> yläpuolella täsmälleen silloin, kun sen keskuskulma käyttäjästä on enintään <c3/>, joten näkyvyystesti on yksi pistetulo arvoa <c4/> vastaan. Joka epookilla satelliitit myös lajitellaan sub-satelliittileveysasteen mukaan, ja ruudukon rivi leveysasteella <c5/> testaa vain satelliitit, jotka ovat enintään <c6/> etäisyydellä arvosta <c7/>. Molemmat ovat tarkkoja pallomaiselle kappaleelle, ja yksikkötesti vertaa jokaista karttaa raakaan skannaukseen suoralla korkeuskulmatestillä. Lohko <c8/> raportoi parien testit, jotka raaka skannaus tekisi, ja ne, jotka tehtiin. Yksikkötestin { "5" } 000 satelliitin suunnitelma { "10" } deg ruudukolla ({ "648" } pistettä, { "6" } epookkia) tekee vain { "9.9" } % raaka-skannauksen { "19 440 000" } paritestistä; mukana toimitettu skenaario <c9/> ({ "5 000" } satelliittia, { "648" } pistettä, { "12" } epookkia) kestää noin { "0.14" } s julkaisukomentorivibinäärillä Apple-silicon-kannettavalla. Seinäkelloajat vaihtelevat koneen ja sen kuorman mukaan. Moottori ei käytä säikeitä, kelloa eikä tiedostojärjestelmää, joten se toimii muuttumattomana WebAssemblyna.

seg-abba032ee1c7 = Mitä tarkistetaan ja mitä vastaan

seg-2342ed239300 = VALIDATED, julkaistuja asiakirjoja vastaan:

seg-dc7fe92fcf05 = Walker-generaattori toistaa kaikki { "24" } riviä Galileo OS SDD -taulukosta { "23" }, ja GLONASS ICD:n paikkakaava on sama { "24" } paikan joukko kuin Walker 24/3/1;

seg-686f9543c7c9 = GPS-esiasetus toistaa SPS PS -taulukoiden 3.2-1 ja 3.2-2 maanpintajäljen päiväntasaajan ylitys -sarakkeen: { "35" } paikkaa { "36" } sijainnista on enintään { "0.0108" } deg päässä, kun pyöristyskynnys on { "0.015" } deg. E3F pidetään löysemmässä { "0.06" } deg kynnyksessä, koska taulukon oma E3F-rivi on epäjohdonmukainen sen RAAN:n ja leveysargumentin kanssa: sen leveysargumentti on { "14.60" } deg E3:n edellä, mikä siirtää ylitystä { "7.30" } deg, kun taas taulukko siirtää sitä { "7.36" } deg;

seg-dc2756c75401 = GPS-lähtötaso SPS PS:n liitteen B ehdoilla (yksi tähtivuorokausi, { "287" } viiden minuutin askelta, { "4" } deg ruudukko, kaikki näkyvissä, { "5" } deg maski) antaa globaalin HDOP:n mediaanin { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } ja keskiarvon { "0.965" }, kun julkaistut ovat { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } ja { "0.96" } (kynnys { "0.03" }, asetettu ennen ensimmäistä ajoa). PDOP-mediaani { "1.795" } on alle taulukon B.3-1 arvon { "1.815" }, joka kuvaa heikentynyttä 20-24 satelliitin sekoitusta. PDOP { "6" } tai pienempi toteutuu { "100" } % ajasta, kun taulukossa 3.8-1 luvut ovat { "98" } % globaalisti ja { "88" } % huonoimmassa paikassa.

seg-9aac9d8aa228 = Tarkistettu käsin tehtyä johtoa vastaan, ei ulkoista asiakirjaa: yhden epookin DOP vastaa suljettua muotoa zeniitin satelliitille ja kolmelle { "30" } deg korkeuskulmassa (PDOP 8/3, GDOP { "3.0732" }).

seg-d946dad08e23 = MODELLED: kahden kappaleen radat valinnaisella sekulaarilla J2-ajautumalla; pallomainen kappale; vain geometrinen näkyvyys (ei signaalitehoa, satelliitin terveyttä eikä maastoa); ei kolmannen kappaleen häiriötä, josta todellinen Kuun jäädytetty rata riippuu. Huonoin yksittäinen aika-avaruuspiste riippuu ruudukosta: HDOP { "2.40" } ja VDOP { "5.22" } tässä vs. { "2.49" } ja { "5.43" } julkaistuissa; nämä raportoidaan, ei lukita. Neljän järjestelmän esiasetukset tulevat eri viite-epookeista, joten niiden suhteellinen vaihe yhdessä ajossa ei ole minkään päivämäärän tilannekuva.

seg-a6c63abeb7e6 = Mukana toimitetut skenaariot

seg-3e6a942c84d4 = Jokainen rivi kertoo, mitä ajo tulostaa versiolla kshana { $version }.

seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou ja GLONASS ({ "102" } satelliittia) yhden päivän ajan { "10" } deg maskin yläpuolella, yksi kello järjestelmää kohden. Saatavuus (PDOP { "6" } tai pienempi) { "100" } % globaalisti ja huonoimmassa paikassa, PDOP:n mediaani { "0.95" }, keskimäärin { "31.0" } satelliittia näkyvissä.

seg-b65ade1eab04 = <c1/>: { "5 000" } satelliittia neljässä matalan Maan kiertoradan (LEO) kuoressa paikannusta, navigointia ja ajanmääritystä (PNT) varten, J2 mukana, { "20" } deg maskin yläpuolella. Saatavuus (PDOP { "3" } tai pienempi) { "99.22" } % globaalisti ja { "0" } % huonoimmassa paikassa, PDOP:n mediaani { "1.11" }, keskimäärin { "39.4" } satelliittia näkyvissä.

seg-7d860ca30360 = <c1/>: { "8" } satelliittia elliptisillä kuun jäädytetyillä radoilla ja 6 satelliitin ympyräkuori Kuun ympärillä. Saatavuus (PDOP { "6" } tai pienempi) { "21.33" } % globaalisti ja { "0" } % huonoimmassa paikassa, PDOP:n mediaani { "5.22" }, keskimäärin { "3.2" } satelliittia näkyvissä.

seg-0c331bea1f52 = LEO-PNT-peitto napa- ja arktisille käyttäjille keskikorkean Maan kiertoradan GNSS:ään verrattuna on skenaariolajin <c1/> napatila (<c2/>; ks. <a1>LEO-PNT.md</a1>).

seg-9aab3bf49146 = <s1>Edellinen</s1>Yhdistetty MEO- ja LEO-paikannus

seg-9f717b9015e1 = <s1>Seuraava</s1>Kvanttianturimallit
