# docs--slot-timing: translations (fi)

seg-f917e7fcac09 = Mikä se on

seg-adc34608c46b = Luokka

seg-3a0e724a8a2b = Taso

seg-fffbeccd4266 = Symboli

seg-2247a2344710 = Merkitys

seg-f63dd3d7aad4 = Lähde

seg-1ff32b87e030 = Satelliitit

seg-582fd72f1a1a = Päätös

seg-430edd66bda0 = Ei mallinnettu

seg-f23c8bd5f203 = Lähde: <c1/>

seg-1f2727dc4ca4 = Skenaariotyyppi <c1/> vastaa kolmeen kysymykseen kellolle, joka käy vapaasti synkronointien välillä ja jonka on pidettävä liikenne <b>aikaindeksoidun aikavälin</b> sisällä: reititys-, tehtävänanto- tai yhteydenottoaikaväli, jonka <b>suoja-aika</b> on suurin absoluuttinen aikavirhe kummalla puolella tahansa, jolla aikaväli vielä toimii.

seg-6b39d8afeb5d = <b>Milloin suoja-aika rikkoutuu?</b> Sekunnit viimeisestä korjauksesta siihen, kun ennustettu aikavirhe saavuttaa suoja-ajan, kaikki vaikuttavat termit eriteltyinä ja hallitseva nimettynä.

seg-60476d723e1a = <b>Kuinka paljon aikaa on nyt jäljellä?</b> Sama luku vähennettynä korjauksesta kuluneella ajalla.

seg-84010982db35 = <b>Kuinka usein kellon on otettava korjaus?</b> Suurin korjausten väli, joka pitää virheen suoja-ajan sisällä, vähennettynä viiveellä ennen kuin korjaus tulee voimaan.

seg-3388d46925f1 = Valinnainen osio <c1/> lisää kiertoradalla olevan vastaanottimen ajoitussuojaustason (TPL); katso <a1>Kiertoradalla olevan vastaanottimen harhautus</a1>.

seg-2eb266d992b0 = Aja mukana toimitettu esimerkki komennolla <c1/>.

seg-624e7a70c4f6 = Lyhenteet: GNSS, maailmanlaajuinen satelliittinavigointijärjestelmä; TCXO, lämpötilakompensoitu kideoskillaattori; OCXO, uunistabiloitu kideoskillaattori; RAFS, rubidiumatomitaajuusnormaali; CSAC, sirumittakaavan atomikello; USO, erittäin vakaa oskillaattori; DSAC, syväavaruuden atomikello; ADEV, Allanin poikkeama; FM, taajuusmodulaatio (tässä kellon taajuuden kohina); PM, vaihemodulaatio (sen vaiheen kohina); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, Kansainvälisen televiestintäliiton telealan standardointisektori; TIE, aikaväliavirhe; MTIE, suurin aikaväliavirhe; TDEV, aikapoikkeama; max|TE|, suurin absoluuttinen aikavirhe; CUSUM, kumulatiivisen summan muutosilmaisin; TPL, ajoitussuojaustaso; LEO, matala Maan kiertorata; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (IEEE Transactions -julkaisu); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, GPS Block II Follow-on -satelliitit; SHA-256, 256-bittinen Secure Hash Algorithm; PPS, pulssi sekunnissa.

seg-f2a0c73ef648 = Virhemalli

seg-6bc3f9e78346 = Ennustettu aikavirhe, kun kello on käynyt vapaasti <c1/> sekuntia korjauksesta, on

seg-3fbb186c716a = kattavuuskerroin ({ "3" } vastaa noin { "99.7" } % gaussisesta virheestä)

seg-883965151598 = korjauksen yhden sigman aikavirhe

seg-b63c0447865f = korjaushetkellä tunnetun taajuuden yhden sigman virhe; ikkunan <c1/> yli estimoidun taajuuden virhe on noin <c2/>

seg-ab28fc69d3ac = valkoisen vaihekohinan varianssi: aikavirheen värinä, vakiopohja

seg-8792541a7b6d = valkoisen, satunnaiskävely- ja satunnaisajo-FM:n tiheydet (funktion <c1/> van Loan -termit)

seg-5d36b32c4de8 = Allanin varianssin flicker-FM-pohja

seg-65da5a90685f = korjauksen jälkeen jäävä suhteellinen taajuuspoikkeama

seg-816e427d51f9 = lämpötilan muutoksesta <c1/> aiheutuva taajuuspoikkeama lämpötilakertoimen <c2/> kautta

seg-e23d0ac960aa = lineaarinen ikääntymisnopeus

seg-43e5f75b369c = Kukin FM-termi on yhtä suuri kuin <c1/> omalle kohinatyypilleen, kun <c2/> (Zucca ja Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Valkoiselle, satunnaiskävely- ja satunnaisajo-FM:lle tämä relaatio on tarkka. Flicker-FM:lle se on aikaennustevirheen tavanomainen estimaatti (Riley, NIST SP { "1065" }): flicker-FM:llä ei ole suljettua muotoa ilman matalataajuista rajaa. Taajuuspoikkeamat lasketaan yhteen itseisarvoina, koska niiden etumerkit ovat tuntemattomia, joten deterministinen osa on pahin tapaus. Jokainen termi on ei-negatiivinen ja ei-vähenevä muuttujan <c3/> suhteen, joten yhtälöllä <c4/> on yksi juuri, joka löydetään sulkemalla ja puolittamalla.

seg-f9038fba23e2 = Mistä kello tulee

seg-5c44b2f8d015 = Skenaarioavain

seg-cb92ae98c231 = Luokan oletus

seg-7594664253f2 = yksi siteerattu yhden sekunnin ADEV ja punakohinapohja, joka syntetisoidaan kaksi ja neljä dekadia sen alapuolelle

seg-794e4932b470 = MODELLED: vastaus vakaalle kellolle määräytyy oletetun pohjan mukaan

seg-5ea820aaa69f = Datalehden esiasetus

seg-c943490619f3 = telekommunikaation ajoitusesiasetukset (<c1/>, <c2/>, <c3/>, <c4/>), kukin nimetty Microchipin datalehti

seg-a20353d50011 = MODELLED: datalehtien maksimiarvojen verhokäyrä

seg-b543f3dcd11a = Rivinsisäinen datalehti

seg-4983ec096617 = asiakkaan oma ADEV-taulukko, ikääntyminen ja lämpötilakerroin

seg-b079bca8a611 = MODELLED: annettujen maksimien verhokäyrä

seg-119d94700cab = Mitattu tallenne

seg-ae6835f0c3c5 = vaihetallenne; sen limittyvä ADEV sovitetaan painotetulla pienimmän neliösumman menetelmällä

seg-6e1c4702186d = inversio on VALIDATED pidätetyllä todellisella tallenteella (alla)

seg-f4cc2be238b7 = Versiossa { "0.28.0" } lisätyt kolme luokkaa siteeraavat kukin yhtä julkista datalehteä:

seg-47f6ddc3bd02 = Yhden sekunnin ADEV

seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, TCXO-perussarake

seg-becbff195fff = Microchip OX-208 -datalehti, Rev 12-1-2021

seg-19d8d32203f6 = Microchip 8040C Rubidium Frequency Standard -datalehti, DS00003047A

seg-48babc170b93 = EndRunin pitkän keskiarvoistusajan rivit konvergoivat koko taulukossa ({ "4e-13" } kaikille oskillaattoreille paitsi TCXO:lle, { "8e-13" }, kohdassa { "10 000" } s, ja { "6e-14" } kaikille kohdassa { "100 000" } s), mikä viittaa siihen, että ne kuvaavat kurinalaistettua tuotetta eikä vapaasti käyvää oskillaattoria, joten niitä ei käytetä.

seg-85c7211bb49b = <b>Tallennesovitus on painotettu.</b> Allanin varianssin estimaatilla, jolla on <c1/> ekvivalenttista vapausastetta, on varianssi noin <c2/>, joten jokainen piste tulee mukaan residuaalilla <c3/>. Painottamaton sovitus antoi lyhyiden keskiarvoistusaikojen ratkaista pitkien aikojen termit: valkoisen FM:n testitallenteella se tuotti virheellisen flicker-pohjan, joka lyhensi rikkoutumista, joka oli { "2 000" } s, { "30" } %. Datalehti tai tallenne tukee vain keskiarvoistusaikoja sen pisimpään pisteeseen asti; sen yli menevä rikkoutuminen merkitään <c4/>.

seg-5b61a42c76c2 = Validointi: inversio pidätetyllä todellisella kellolla

seg-2220a1490923 = <c1/> käyttää { "556" } 990 näytteen tallennetta 5071A-cesiumnormaalista mitattuna vetymaseria vastaan (A. Wallin, jaettu paketin <c2/> mukana; sama tallenne, jota estimaattorin oraakkeli <c3/> käyttää). Kun maser on vertailu, tallenne on 6.4 päivän vapaa ajo.

seg-9bae4571f67c = Sovita kohinamalli vain tallenteen <b>ensimmäiseen kolmannekseen</b>.

seg-15b2cb621db7 = Ennusta tästä mallista vapaakäyntiaika, jolloin yhden sigman aikavirhe saavuttaa { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } ja { "2.5" } ns.

seg-1bd9ac435bfa = <b>Kahdella muulla kolmanneksella</b> aja vapaasti synkronointipisteestä joka { "997" } s edeltävästä kolmanneksesta estimoidulla taajuudella ja mittaa, missä vapaakäynnin neliöllinen keskivirhe saavuttaa kunkin kynnyksen.

seg-d7640a2ec444 = Hyväksymiskynnys, joka asetettiin ennen testin ensimmäistä ajoa, on, että jokainen ennustettu rikkoutuminen on kertoimen { "1.5" } sisällä mitatusta. Kontrollin, eli yhden sekunnin ADEV:n luettuna valkoisena FM:nä, on epäonnistuttava tässä kynnyksessä, jotta kynnys osaa erottaa hyvän mallin huonosta. Testi tulostaa taulukkonsa; mutaatio, joka puolittaa valkoisen FM:n tason, epäonnistuu siinä. Raakatallenne on kolmannen osapuolen dataa, jota git ohittaa: <c1/> hakee sen, ja työnkulku <c2/> ajaa testin asetuksella <c3/>, joten puuttuva tiedosto epäonnistuu siellä eikä ohitu.

seg-3d11f7c6d4ab = Mitä tämä validoi: sovitus-ja-inversio-polun valkoisen FM:n hallitsemalla atomikellonormaalilla, noin { "50 000" } s asti ulottuvilla vapaakäynneillä. Mitä se ei validoi: datalehti- ja luokkalähteitä, deterministisiä termejä eikä kideoskillaattoria (seuraava osio).

seg-bfcc5555ed50 = Sama ennuste todellisella kideoskillaattorilla: konservatiivinen, ei validoitu

seg-b77b3f503ca2 = <c1/> käyttää mitattua OCXO:ta: { "19 982" } yhden sekunnin taajuuslukemaa oskillaattorista (taajuus { "10" } MHz) HP:n impedanssianalysaattorissa, vetymaseria vastaan (A. Wallin, { "2015" }, jaettu paketin <c2/> mukana; <c3/>). Kohinamalli ja lineaarinen ajautuma sovitetaan ensimmäiselle kolmannekselle; jokainen vapaakäynti kahdella muulla kolmanneksella alkaa edeltävien { "100" } s ylitse estimoidusta taajuudesta, ja malli kantaa tämän estimaatin epävarmuuden (<c4/>, mallin oma Allanin poikkeama kohdassa { "100" } s).

seg-e05821406c28 = Sovitettu aineistoon

seg-c70aadbd47d4 = Ennustettu ÷ mitattu rikkoutuminen, { "0.2" }–{ "10" } ns

seg-d71582148b20 = Tulkinta

seg-dcc3fd23bede = ensimmäinen kolmannes (pidätetty)

seg-f9bb286f5868 = { "0.59" }–{ "0.70" }

seg-612784f70090 = konservatiivinen: ei koskaan mitattua myöhemmin, enimmäkseen kynnyksen { "1.5" } ulkopuolella

seg-121fa832c30f = itse arviointisegmentti (diagnostiikka)

seg-b4be9afa69ac = { "0.98" }–{ "1.17" }

seg-75e1515b970a = inversio on oikein; pidätetty ero johtuu oskillaattorin muuttumisesta

seg-c91da69e9c09 = Oskillaattorin kohinapohja puolittui tallenteen aikana: ensimmäisen kolmanneksen Allanin poikkeama tasaantuu lähelle { "7.5e-12" }, loput lähelle { "3.5e-12" }. Aikaisin sovitettu malli yliennustaa kohinan, mikä on turvallinen suunta. <b>Kidetapausta ei siksi ole validoitu, ja se jää luokkaan MODELLED.</b> Kiteelle sovita asettuneelle tallenteelle ja sovita uudelleen osan ikääntyessä.

seg-6230fed0e164 = <b>Miten protokolla valittiin, ilmoitettu koska se ei ollut sokko.</b> Ensimmäinen tutkiva ajo käytti uudelleen cesiumprotokollaa (taajuus edeltävästä kolmanneksesta, ei taajuustermiä) ja ennusti rikkoutumiset { "1.4" }–{ "2.5" } kertaa mitattua myöhemmiksi: optimistisesti, vaarallisessa suunnassa. Kiteen taajuus vaeltaa, joten tuntia ennen korjausta estimoitu taajuus on vanhentunut, eikä mallissa ollut termiä sille, kuinka hyvin taajuus tunnetaan korjaushetkellä. Termi <c1/> lisättiin tästä syystä ja tämä protokolla lukittiin ennen testin kirjoittamista; hyväksymiskynnystä ei siirretty. Testi tarkistaa myös, että ilman termiä otoksensisäinen ennuste on optimistinen jokaisella kynnyksellä, joten termi on kantava.

seg-88e01cac525a = Sama ennuste kiertoradalla olevilla atomikelloilla: { "8" } / { "10" }, ei validoitu

seg-17962966b6d6 = <c1/> käyttää IGS:n lopullisia yhdistettyjä kelloja { "30" } sekunnin välein { "14" } päivän ajalta ({ "17" }.–{ "30" }. elokuuta { "2025" }; <c2/>, jokainen tiedosto lukittu SHA-256:lla): jokainen GPS Block IIF -satelliitin kello IGS-aika-asteikkoa vastaan. Protokolla (satelliittijoukko, aukkosääntö, sovitusikkuna, synkronointi joka { "3 570" } s edeltävän tunnin taajuudella, kynnykset { "1" }–{ "20" } ns, kynnys { "1.5" } ja sääntö, että luokka läpäisee vain jos jokainen satelliitti läpäisee) kirjoitettiin ylös ennen kuin yhtään dataa ladattiin.

seg-1b5832633c87 = Ennustettu ÷ mitattu rikkoutuminen

seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

seg-9a6fac366156 = { "0.76" }–{ "1.46" }

seg-c14941cb5537 = kynnyksen sisällä

seg-dbaaf875f1fb = { "1.51" }–{ "1.99" }

seg-3601e13c39b6 = optimistinen

seg-ea41cf6dbec2 = { "1.20" }–{ "1.61" }

seg-099fb000bf57 = ei arvioitu

seg-a7699b256ee1 = suljettu pois aukkosäännöllä (puuttuva päivä)

seg-eb71202e0b91 = Kahdeksan kymmenestä on hyödyllinen todiste, mutta kahden satelliitin ennustetaan pitävän pidempään kuin ne pitivät, mikä on vaarallinen suunta, ja protokolla vaatii, että jokainen satelliitti läpäisee. <b>Kiertoratatapaus jää siksi luokkaan MODELLED.</b> Block IIF -satelliiteissa on sekä rubidium- että cesiumnormaali eikä IGS-tiedostoista käy ilmi, kumpi on aktiivinen, joten tulos ilmoitetaan satelliiteille, ei yhdelle kellotyypille. Miksi G25 ja G30 eroavat, ei ole tutkittu.

seg-a9be8a92b6b9 = Bench-ajo lentoa edustavalle osalle (rajattu, ei tehty)

seg-43597df55508 = Julkinen OCXO-tallenne on { "5.5" } tuntia pitkä, yhdestä laboratoriolaitteesta, oskillaattorin yhä asettuessa. Kidetapauksen validoisi pidempi mitattu vapaa ajo lentoa edustavasta OCXO:sta tai CSAC:sta vertailua vasten:

seg-e2698f00a84a = aikaväliälaskin, joka vertaa oskillaattorin { "1" } PPS -signaalia GNSS-kurinalaistettuun tai maser-vertailuun, vähintään { "10" } päivää yhdellä näytteellä sekunnissa, lämpötila kirjattuna;

seg-c4c902ac028e = sama pidätetty protokolla: sovita ensimmäiseen kolmannekseen, ennusta rikkoutumiset, mittaa lopusta, samalla kynnyksellä ja kontrollilla;

seg-0faaa6279195 = tallenne ja sen tiiviste julkaistuna testin vieressä, jotta rivi on toistettava.

seg-9b2255563582 = Se on estynyt viitelaitteistoon pääsyn puuttuessa, eikä sitä luvata.

seg-6cb2dc94d1bf = Minkä vaellusmittarin perusteella aikaväli tulisi hyväksyä?

seg-f6d24245dca6 = Ajoitusstandardit tarjoavat kolme mittariperhettä. Aikaindeksoidulle aikavälille vain yksi niistä mittaa sitä, mikä aikavälin rikkoo.

seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) on suurin huipusta huippuun -TIE kaikissa tietyn pituisissa ikkunoissa. Se on sokea vakiopoikkeamalle: kello, joka on { "1" } µs pielessä mutta täysin tasainen, saa MTIE-arvon lähellä nollaa ja menettää jokaisen aikavälin. Se mittaa, kuinka paljon virhe <em>muuttuu</em>, ei missä se <em>on</em>.

seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) muodostetaan keskiarvoistetun vaiheen toisista differensseistä. Se poistaa vakiopoikkeaman ja vakiotaajuusvirheen, jotka ovat juuri ne termit, jotka hallitsevat vapaakäyntiä. Se luonnehtii kohinatyyppiä; se ei ole absoluuttisen ajoituksen hyväksymismittari.

seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; G.8271-standardin budjettimittari) on suurin absoluuttinen aikavirhe vertailuaika-asteikkoon nähden. Sitä voi verrata suoraan suoja-aikaan.

seg-7eefc395a118 = <b>Johtopäätös.</b> Hyväksy aikaväli max|TE|-mittarin mukaan suhteessa verkon vertailuaika-asteikkoon, arvioituna ennustettuna verhokäyränä viimeisestä korjauksesta ilmoitetulla kattavuuskertoimella. Sitä <c1/> kuvaa: koska jokainen termi kasvaa muuttujan <c2/> mukana, vapaakäynnin, jonka pituus on <c3/>, maksimi on <c4/>. MTIE ja TDEV pysyvät hyödyllisinä diagnostiikkana: TDEV sen tunnistamiseen, mitä kohinatermiä on käsiteltävä, MTIE(L) rajaamaan, kuinka paljon virhe liikkuu aikavälin, jonka pituus on <c5/>, aikana.

seg-51d4ee8484d7 = Kaksi mittarin valinnasta seuraavaa tarkennusta:

seg-a52524111ed7 = <b>Suoja-aika koskee kahden solmun välistä suhteellista virhettä.</b> Jos lähetin ja vastaanotin molemmat käyvät vapaasti itsenäisesti, niiden stokastiset virheet summautuvat neliöllisesti ja deterministiset virheet itseisarvoina. Kun stokastinen osa hallitsee, kullekin solmulle voidaan antaa <c1/>; kun ikääntyminen tai lämpötila hallitsee, <c2/>.

seg-073fe7cd8e63 = Kattavuuskerroin on suunnitteluvalinta, ei kellon ominaisuus.

seg-eb1cbf9fda2d = <c1/> rajaa noin { "99.7" } % gaussisista virheistä yhdellä hetkellä, ei kaikkien vuorokauden aikavälien yli; reittisuunnitelma, jossa on monta aikaväliä vuorokaudessa, tarvitsee aikavälikohtaisen riskin, jonka se sietää.

seg-04734b8a115b = Kiertoradalla olevan vastaanottimen harhautus

seg-9e734bbda345 = Osio <c1/> arvioi funktion <c2/> samalle kellolle:

seg-a2f21a643389 = <b>Geometria.</b> Maalla oleva harhauttaja yltää LEO-satelliittiin vain niin kauan kuin satelliitti on sen horisontin yläpuolella: korkeudella { "550" } km enintään noin kaksitoista minuuttia ylilentoa kohti. Harhauttaja, joka nostaa nopeudella <c1/>, voi siksi vetää kelloa enintään <c2/> kertaa tuon ikkunan verran, tai seuraavaan riippumattomaan tarkistukseen kuluvan ajan verran, jos se on lyhyempi (<c3/>).

seg-ff59489b08b8 = <b>Dynamiikka.</b> Yhteismuotoinen aikavetäminen siirtää jokaista pseudoetäisyyttä yhtä paljon ja imeytyy kellovirheeseen, ei paikkaan, joten radanpropagaattorin paikkatarkistusta ei lasketa ajoituksen ristiintarkistukseksi.

seg-4302cc49b91f = <b>Ristiintarkistukset.</b> Satelliitilla on harvoin toista riippumatonta ajoitusvastaanotinta. Sillä on oman kellonsa vapaakäynti (kohdan <c1/> valvonta), kaksisuuntainen ajansiirto maa-aseman kanssa yhteyksien aikana sekä aikavertailut satelliittien välisillä yhteyksillä. Ristiinlinkki on riippumaton yhdestä maalla olevasta harhauttajasta vain, jos naapuri on samalla hetkellä kyseisen harhauttajan peittoalueen ulkopuolella, minkä raportti tarkistaa satelliittien määrästä kiertoratatasoa kohti.

seg-16c15664a51c = <b>Ehdollinen raja.</b> Valvonnan pohja plus kellon vapaakäynti CUSUM-havaitsemisviiveen aikana, supistuen täsmälleen muotoon <c1/>, kun kellolla ei ole flicker-, valkoisen vaiheen eikä satunnaisajotermiä. Kuten tuo raja, se pätee vain havaitsemisen ehdolla.

seg-f7678693be22 = Kaikki tämä on MODELLED: pallomainen, pyörimätön Maa, ylilento suoraan yläpuolelta, yksi maanpäällinen harhauttaja ilmoitetulla enimmäisnousunopeudella. Signaalien saapumissuunta zeniittiin osoittavalla antennilla on todellinen ristiintarkistus, joka tarvitsee antennikuvion eikä ole mallinnettu. <a1><c1/></a1> selittää, miksi allekirjoitettu ohjausviesti ei poista tätä uhkaa.

seg-070a4e72b5ea = Taajuushypyt, säteilyvaikutukset ja relativistiset taajuuspoikkeamat; lämpömalli (lämpötilan muutos on askel korjaushetkellä); itse synkronointiprotokolla (korjaus nollaa virheen arvoon <c1/>).

seg-a2766c0f19d0 = <s1>Edellinen</s1>Optiset linkit ilmakehän läpi

seg-85ad3eb72a80 = <s1>Seuraava</s1>Telekommunikaation ajoitus
