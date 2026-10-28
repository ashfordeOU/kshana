# docs--mission-thread-lunar: translations (fi)

seg-f942b36a11c4 = Ei vielä GitHubissa

seg-3b01a756c305 = Mitä se laskee

seg-b478421b21bb = Lähde: <c1/>

seg-dbd59cc01982 = Artemis-luokan tehtäväketjun Kuun osuus

seg-7b56ed698c30 = Neljä skenaariolajia, jotka ovat kukin myös lajin <c1/> rajapinnan vaihelaji (<c2/>): ne kuljettavat navigointi- ja ajoitusvirhebudjetin läpi etelänapa-alueen Kuu-tehtävän, Kuun kiertoradalla tapahtuvasta kohtaamisesta laskeutumiseen, oleskeluun pinnalla ja nousuun takaisin kiertoradalle. <b>Jokainen luku tässä on MODELLED</b>: määritelty malli ILLUSTRATIVE syötteillä, eikä mikään siitä ole väite minkään tehtävän, järjestelmän tai kohteen suhteen. ”Artemis-luokka” nimeää tehtäväkonseptien luokan eikä mitään muuta; minkään viraston dataa, tuotetta tai suositusta ei käytetä tai väitetä, eikä mikään tässä ole sidoksissa sellaiseen. Ohjeellinen ohjelmisto, ei virallisesti hyväksytty navigointilaite. Kshana ei lähetä mitään eikä ohjaa mitään laitteistoa.

seg-5282ad2c498a = Vaihe ja laji

seg-9b927127e042 = Esimerkkiskenaario

seg-40f3e1b2d58b = Ydin

seg-2cfaaa8be402 = suhteellinen navigointi telakointiin, { "100" } km:n ympyränmuotoinen napakiertorata tai { "100" } km x { "3000" } km:n elliptinen napakiertorata

seg-9ee09d63fed3 = laskeutumishajonnan budjetti etelänapa-alueen kohteessa

seg-c4568984e75c = <c1/>, <c2/> (tarvitsee DEM:n, checkoutin)

seg-a098e14e6a63 = paikannus- ja ajoitussaatavuus kohteen ja vuodenajan mukaan

seg-8278ae655fcc = <c1/>, <c2/> (tarvitsee DEM:n, checkoutin)

seg-249eff5159d0 = nousu kohtaamiskiertoradalle ja kiertoradalle takaisin kuljetettava kovarianssi

seg-36184e593ade = Jokainen ydin on funktio <c1/>; erillinen ajo muodostaa oletustulotilan (Kuu-keskinen inertiaalikovarianssi { "100" } m ja { "0.1" } m/s, { "1" } mikrosekunnin LTC-kello) ja oletusepookin 2028-01-01, ja ketjuajo ottaa tulotilan edelliseltä vaiheelta. Ketju, ei ydin, muuntaa koordinaatistoja ja aikaskaaloja ja soveltaa siirtosääntöä: vaiheen kääre muuntaa tulotilan koordinaatistoon <c2/> (tai pintakartassa koordinaatistoon <c3/>) ja LTC-kellolle ketjun muunnoksilla, ja muunnosrivit lisätään vaiheen budjettiin. Koordinaatisto tai aikaskaala, jota ketju ei voi muuntaa (esimerkiksi ITRF), torjutaan ketjun viestillä; ydin, jota kutsutaan suoraan koordinaatistolla, jota se ei voi käyttää, torjuu sen perustelun kera. Vaihe ei koskaan nollaa kovarianssia, vaan siirtää eteenpäin sen, jolla se päättyy.

seg-59f4a1a2684e = Mitä kukin vaihe tekee

seg-e112a34ef118 = Kaksi ajoneuvoa, takaa-ajaja ja kohde, lentävät samaa rataa paketin Kuun voimamallin mukaan (gravitaatiokenttä sekä Maa ja Aurinko kolmansina kappaleina). Eräpohjainen Gauss–Newton-estimaatti kaaren yli palauttaa molemmat alkutilat seuraavista:

seg-33bb01b1e72a = ajoneuvokohtainen absoluuttinen paikkakorjaus ILLUSTRATIVE LCNS-luokan releiden joukosta (Kuun taakse jäävät releet pudotetaan, neljä tarvitaan), jonka valkoinen osa on AFS-pilotin koodiseurannan raja (BPSK({ "5" }), { "5.115" } Mchip/s) ilmoitetulla C/N0:lla kerrottuna DOP-kofaktorilla;

seg-b061f6742a86 = <b>pysyvä</b> signaalitien virhe jokaisessa korjauksessa: releiden virheet eivät keskiarvoitu pois tuntien mittaisella kaarella, joten se kuljetetaan vakiopaikkaharhoina, joista yksi on yhteinen molemmille ajoneuvoille (<c1/> varianssista, oletus { "0.9" }, ILLUSTRATIVE) ja yksi riippumaton ajoneuvoa kohden. Vakioharha ei anna keskiarvoistushyötyä, mikä on varovainen tulkinta;

seg-437ac74b1400 = ristikkäislinkin etäisyysmittaus samasta signaalista sen omalla C/N0:lla.

seg-3513a55e44e5 = Se raportoi muodollisen ja Monte Carlo -suhteellisen paikka- ja nopeusvirheen kohteen paikallisissa akseleissa, niiden epookkien osuuden, joilla molemmilla ajoneuvoilla on korjaus, suhteellisen tilan keskimääräisen normalisoidun estimointivirheen neliön (NEES) suhteessa sen odotusarvoon { "6" }, gravitaatioharmonisten sivuuttamisesta aiheutuvan suhteellisen ajautuman, suljetun muodon Hill (Clohessy–Wiltshire) -tarkistuksen ympyräratatapaukselle, ketjun <c1/> päätteen suhteelliset anturimallit (ILLUSTRATIVE parametrit) pelkkien signaalien lukuarvon rinnalla sekä takaa-ajajan 6x6-kovarianssin lopussa.

seg-5d3fa3e8486c = <b>Mitä tulos kertoo.</b> Pelkillä signaaleilla ristikkäislinkin etäisyysmittaus kiinnittää suhteellisen paikan näkölinjan suunnassa, mutta suhteellista paikkaa sitä vastaan kohtisuoraan rajoittavat riippumaton signaalitien virhe ja dynamiikan antama tieto; telakointi tarvitsee suhteellisen anturin, ja rivit <c1/> näyttävät, millä etäisyydellä kukin ketjun anturimalli voittaa signaalit. Tulos riippuu myös siitä, että totuus ja estimaattori jakavat voimamallin; estimaattorivaihtoehto <c2/> näyttää harmonisten sivuuttamisen hinnan, eikä sen ajon odoteta olevan johdonmukainen.

seg-66c4eb27641b = Vaihe lentää oman nimellisratansa (kentät <c1/>), joten tulopaikka- ja nopeusvektoria ei käytetä, vain sen kovarianssia, koordinaatistoa ja kelloa; ketjun tapahtuma kertoo tämän.

seg-751f29ab7a35 = Kutakin vaaka-akselia kohden viisitilainen inertiavirhemalli (paikka, nopeus, kiihtyvyysmittarin harha, asennon kallistuma, gyron harha, herätteenä laskeutumisen ominaisvoima) tulokovarianssista ja IMU:sta, sitten peräkkäinen suodin käytössä olevien apuvälineiden yli:

seg-c2eae4508a2f = <b>AFS-korjaus</b>: tasaisen maskin yläpuolella näkyvistä releistä, ENU-DOP-kofaktorilla kerrottuna käyttäjän etäisyysvirheellä. <c1/> käyttää signaalitien virhettä; <c2/> käyttää lajin <c3/> korjauslinkin jäännöstä. Kun näkyvissä on täsmälleen kolme relettä, kello on tuettu eikä estimoitu, ja korjaus kantaa silloin termin <c4/>: tässä Kuun aika tulee mukaan korjaukseen.

seg-39c938fb24e9 = <b>Maastosuhteellinen korjaus</b>: <c1/> ajaa paketin TERCOM/SITAN-sovittimen synteettisellä reliefillään ja maan metrimittakaavalla (sijaisaineisto, ei etelänapa-alueen reliefi); <c2/> ottaa todellisen LOLA-DEM:n korkeusikkunan sovituksen Cramér–Rao-rajan kohteessa, <c3/>, eikä väitä korjausta olevan silloin, kun reliefi rajoittaa vain yhtä suuntaa (aukkoongelma).

seg-795ef82edc61 = <b>Kuun aika</b>: kellovirhe korjauksen hetkellä yhdistää tulokellon, sen kasvun synkronoinnin jälkeen ja lajin <c1/> LTC-TT-termin. Kun käytössä on <c2/>, ajoneuvo käyttää TT-aikaa ja kertynyt siirtymä on korjaamaton harha; kun käytössä on <c3/>, jäljelle jää vain julkaistun { "56" }–{ "59" } mikrosekuntia vuorokaudessa -kaistan epävarmuus horisontin yli. Aikaleimavirhe siirtää korjausta radan suunnassa määrällä <c4/>.

seg-d655c932abbf = Laskeutumishajonta on navigointivirhe kosketushetkellä lisättynä riippumattomalla ohjaustermillä (<c1/>, ILLUSTRATIVE, oletuksena { "20" } m akselia kohden). Taulukko <c2/> ajaa jokaisen apuvälinekombinaation. Ellipsi kalibroidaan Monte Carlolla (simuloitujen laskeutumisten osuus 3-sigma-käyrän sisällä verrattuna { "98.9" } %:iin, jonka 2-ulotteinen Gaussin jakauma antaa).

seg-82b71e26bc89 = <b>Lue varoen.</b> Oletushajontaa hallitsee oletettu ohjaustermi, ja jokaisessa etelänapa-alueen kohteessa releiden geometria on lähes sama, joten kohteet eroavat vähän. Kuun aika vaikuttaa vähän aikaleimauksen kautta ({ "150" } m/s kertaa muutama mikrosekunti on alle millimetrin); sillä on merkitystä, kun geometria heikkenee kolmeen releeseen.

seg-f5af0aef6649 = Kullekin kohteelle ja vuodenajalle (epookki ja sen jälkeinen ikkuna): paikannus releillä (neljä tai useampi rele näkyvissä maskin ja kohteen maastohorisontin yläpuolella ja PDOP kynnyksen alla, samoilla funktioilla ja tähdistöllä kuin lajissa <c1/>; yhden kohteen tulos on bitilleen sama kuin sen luku), ovatko Maa ja Aurinko horisontin yläpuolella (analyyttinen Aurinko, Kuu ja Kuun orientaatio, libraatio mukaan lukien) sekä ajoituksen saatavuus (rele tai Maa näkyvissä) pisimmän jakson kanssa, jolloin kumpaakaan ei ole. Releiden luku ei tässä mallissa muutu vuodenajan mukana (Kepler-joukko, keskimääräinen pyöriminen); Maan ja Auringon luvut muuttuvat. Vaihe siirtää kovarianssin muuttumattomana ja saattaa kellon ajoituslattiaan (ILLUSTRATIVE, { "50" } ns), jolloin jäljelle jää vain pisin ajoitusaukko, jonka yli on pidettävä holdover.

seg-0890ec65a04e = Laskeutumisen viisitilainen malli kaikilla kolmella kohteen akselilla pintatilasta, AFS-korjaus määritellyllä välillä samalla Kuun ajan käsittelyllä sekä injektiohetken täysi 6x6-paikka–nopeus-kovarianssi eteenpäin siirrettynä, kunkin akselin paikka–nopeus-korrelaatio säilytettynä. Moottorin sammutushajonta siirtää ajoneuvon sijaintia ja raportoidaan navigointikovarianssin rinnalla, ei kuljeteta. Virheet pidetään laukaisupaikan akseleissa (ei alasuuntaista kaarevuutta) ja nimellinen poistumistila on sijaisaineisto; vain kovarianssi on tulos.

seg-f60b576fabcd = Miten asiakirja määrittelee vaiheen

seg-be8e0001ed0c = Ketjussa vaiheen taulukko <c1/> on erillisen skenaarion oma taulukko. Vaiheen pituus on ketjun <c2/>: malli, joka ilmoittaa myös oman pituusavaimensa (<c3/>, <c4/>, <c5/>, <c6/>), on sovittava sen kanssa tai vaihe torjutaan, ja malli, joka jättää avaimen pois, ottaa ketjun arvon. Siemenluku on ketjun tunnisteavaimellinen vaihesiemen, joten vaihe, joka ajetaan yksinään samalla tunnisteella ja ketjun siemenluvulla, palauttaa samat luvut kuin ketjussa. Väärin kirjoitettu mallin avain torjutaan, ei sivuuteta. Vaiheiden välinen siirto ja sen tarvitsemat koordinaatisto- ja aikaskaalamuunnokset (Kuu-keskinen inertiaali ja Kuu-kiinteä, Maa–Kuu, LTC-parit) kuuluvat ketjulle.

seg-52a6e2ec0a99 = Rakenteet, syötteet ja kynnykset kiinnitettiin tiedostossa <c1/> ennen mitään ajoa, kuudella päivätyllä muutoksella, kukin ilmoitettu tiedostossa; jokaisen kynnyksen tulos, ohitukset ja estimaattorin historia mukaan lukien, on tiedostossa <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (propagaattori LRO:n rekonstruoitua lentorataa vasten, { "24" } h): MET, { "33" } m suurin 3D-ero kynnystä { "500" } m vasten, { "2.4" } m RMS radiaalisesti kynnystä { "60" } m vasten.

seg-25464238f6bd = <b>A2</b> (sama propagaattori CAPSTONEn lähes suoraviivaista haloratakiertoa vasten yhden 6.5 vuorokauden kierroksen aikana): <b>NOT MET</b>, { "136.8" } km loppupaikan ero kynnystä { "25" } km vasten ja { "28.4" } km oskuloivan periapsiksen säteen ero kynnystä { "10" } km vasten. Syitä ei eristetty (ehdokkaita ovat pois jätetty säteilypaine ja albedo, radan herkkyys alkutilalle sekä analyyttiset Maan ja Auringon sarjat); rivi pysyy MODELLED-tasolla.

seg-e1099ad81a5d = Nämä kaksi riviä testaavat Kuun lajien jakamaa propagaattoria. <b>Ne eivät testaa mitään navigointisuodinta, signaalia tai budjettia, eikä millään muulla tässä ole ulkoista oraakkelia.</b>

seg-9a4b2392aa92 = Kaikki muu on MODELLED, ja lajien johdonmukaisuustarkistukset (ennakkorekisteröinnin B1–B8) testaavat toteutusta sen omaa määriteltyä mallia vasten, eivät Kuuta vasten.

seg-3365490b59b7 = <s1>Edellinen</s1>Tehtäväketju: laukaisusta paluuseen

seg-90932eed0074 = <s1>Seuraava</s1>LEO-paikannus, navigointi ja ajanmääritys
