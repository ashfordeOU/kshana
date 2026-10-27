# docs--agency-orbit-validation: translations (fi)

seg-31d58f23c0a2 = Aja

seg-fbe4b3eb7310 = Lähde: <c1/>

seg-87910a33b87b = Voimamallin validointi efemeridisovituksella — menetelmä ja validoidut residuaalit

seg-09a1b1b673fb = Kshanan täyden voiman moottori (<c1/>) sovitettuna <b>todellisiin virastojen tarkkoihin ratatuotteisiin</b>, rehellisin, lainattavin ja commit-hashilla leimatuin residuaalein. Tämä on tiekartan välitavoitteen P4 validointitieto (”Tarkka astrodynamiikka: korkea-asteinen gravitaatio, SRP (auringon säteilypaine), validointi virastojen aineistoja vasten”).

seg-90f366667f78 = Mitä validoitu residuaali tarkoittaa tässä

seg-3861b68a03e2 = Residuaali raportoidaan vain, kun kaikki seuraava pätee (suunnitelma <c1/>):

seg-954f4f934461 = <b>Voimamalli</b> sisältää kaikki häiriöt, joilla on merkitystä tavoitetarkkuudella: EGM2008 (Earth Gravitational Model { "2008" }) korkea-asteinen geopotentiaali (typistetty ilmoitettuun asteeseen ja kertalukuun, d/o), kiinteä + valtameri- + ilmakehäpuoksut eli <b>vuorovesivaikutukset</b> (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } Ch. { "6" }), Auringon ja Kuun kolmannen kappaleen vaikutus, kanuunankuula-SRP kartiovarjolla + estimoitu <c2/>, ilmanvastus (vain LEO (matala Maan kiertorata)), Schwarzschildin ja Lense–Thirringin yleisen suhteellisuusteorian (GR) termit (<c3/>).

seg-710f89c088cc = <b>Estimaattori</b> on todellinen Gauss–Newton-eräpienimmän neliösumman menetelmä, jossa on variaatiollinen <b>tilansiirtomatriisi</b> (ristiintarkistettu koko kaaren äärellistä differenssiä vastaan tarkkuuteen < { "1e-6" }), havaintojen painotus <c1/> ja n-sigma-poikkeamien muokkaus.

seg-dd5dcc66ed22 = <b>Koordinaatistot ja aika</b> käyttävät <b>todellisia IERS finals2000A -Maan orientaatioparametreja (EOP)</b> (UT1 (Universal Time { "1" }, Maan pyörimisaika)−UTC (Coordinated Universal Time), napaliike; <c1/>) validoidun IAU (International Astronomical Union) 2006/2000A CIO-ketjun (Celestial Intermediate Origin) kautta (<c2/>). SP3 (Standard Product { "3" }, tarkka ratamuoto) GPS (Global Positioning System) -aika → TT (Terrestrial Time) kiinteällä { "51.184" } s siirtymällä (<c3/>).

seg-665bb53b81fb = <b>Residuaalit</b> raportoidaan <b>RTN</b>-muodossa (radiaali / radan suuntainen / poikittainen) ja 3D-muodossa, <b>empiiristen kiihtyvyyksien kanssa ja ilman niitä</b>, rinnakkain raa'an (sovittamattoman) päällekkäisyyden kanssa.

seg-fea4515ba842 = Jokainen luku on <b>toistettava</b> (avoimen datan CI-portti (jatkuva integrointi)) ja <b>lainattava</b> (commit-hash + aineistoviite + fixturen SHA-256 (SHA: Secure Hash Algorithm)).

seg-fa98a174e799 = Menetelmä aineistoittain

seg-a98b098e815a = Jäsennä SP3-tarkka rata; ota valitulle satelliitille kukin ITRF (International Terrestrial Reference Frame) -paikkahavainto.

seg-a25f69a48b5a = Muunna SP3:n GPS-epookki → TT; ratkaise <c1/> tiedostosta finals2000A kyseisellä epookilla.

seg-e5338b713d88 = Kierrä jokainen ITRF-havainto GCRS-koordinaatistoon (Geocentric Celestial Reference System) CIO-ketjun kautta näillä EOP:illa — inertiaaliset paikkahavainnot. Dynamiikka käyttää <em>samoja</em> EOP-arvoja geopotentiaalin Maahan kiinnitetylle kierrolle, joten havainnot ja voimat jakavat yhden koordinaatiston.

seg-ce987e4dda40 = Aseta epookin alkutila (paikka = ensimmäinen havainto; nopeus = 2. kertaluvun äärellinen differenssi) ja sovita eräsovituksella <c1/> (taso { "1" }), sitten lisäksi { "9" } RTN-kierroskohtaista (CPR) empiiristä kiihtyvyyttä (taso { "2" }, ennakkoon rajoitettu).

seg-22f839d05292 = Raportoi sovituksen jälkeinen RTN- ja 3D-RMS (neliöllinen keskiarvo) molemmille tasoille sekä raaka päällekkäisyys.

seg-64e2c3662a27 = Galileo, keskikorkea Maan kiertorata — <b>GREEN</b> (< { "5" } m kynnys)

seg-e77e8e35ba80 = <b>Aineisto:</b> ESA/ESOC (ESA: European Space Agency; ESOC: European Space Operations Centre) lopullinen multi-GNSS (GNSS: maailmanlaajuinen satelliittinavigointijärjestelmä) rata <c1/>, ITRF, 5 min näytteistys, satelliitti <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominaali MEO (keskikorkea Maan kiertorata)), 2022-01-01.

seg-f90d848e7a46 = <b>Avoin lähde (ei kirjautumista):</b> ESA Navigation Officen peilipalvelin, <c1/>. EOP: IERS <c2/>.

seg-ec7195b80bad = Validointi-commit:

seg-c2ad9f9cc050 = <b>Fixturet (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

seg-de3df1639939 = Kaari

seg-7db37f753fc1 = 3D-RMS

seg-d39e59df38c0 = RTN (R, T, N)

seg-5ad814c7ef9e = Huomautukset

seg-bced8a114852 = CI-fixture, taso { "1" } (voima + <c1/>)

seg-f040df9ee966 = { "8" } h

seg-459900054e0e = { "0.133" } m

seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

seg-d15ea658058b = raaka päällekkäisyys { "78.7" } km

seg-1ce1bc363541 = CI-fixture, taso { "2" } (+ empiirinen CPR)

seg-461105b5c2f3 = { "0.070" } m

seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

seg-224a7fc75354 = puolittaa residuaalin

seg-1b422bc76914 = Koko kaaren dispatch, taso { "1" } (ennen korjausta†)

seg-f57ee3b36d92 = { "24" } h

seg-5fee750a5e30 = { "0.611" } m

seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

seg-95879df86618 = Yllä olevat CI-fixturen luvut kirjattiin uudelleen versiossa { "0.36" } S2-ilmakehävuorovesikorjauksen jälkeen (<c1/>): Galileon taso { "1" } muuttui { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), Swarm-A:n N-komponentit { "1" }–{ "2" } mm; koko kaaren dispatch-lukuja ei ajettu uudelleen. † <b>Ennen korjausta:</b> koko kaaren dispatch-luku kirjattiin ennen versiota { "0.36" } tehtyä S2-ilmakehävuorovesikorjausta, eikä sitä ole ajettu uudelleen korjatulla koodilla (koko vuorokauden tuotteet haetaan dispatch-työnkulussa, eivät ole saatavilla istunnossa, joka teki korjauksen). CI-fixtureissa korjaus muutti Galileon 3D-RMS:ää alle { "1" } mm ja Swarm-A:n komponentteja { "1" }–{ "2" } mm, joten samaa suuruusluokkaa olevaa muutosta odotetaan; seuraava ajo työnkulussa <c2/> kirjaa sen uudelleen.

seg-5141c1811e35 = MEO-kenttä on gravitaatioltaan suppeneva asteeseen { "8" } mennessä ({ "8" } h:n tason 1 tulos on sama asteella ja kertaluvulla { "8" }, { "10" } ja { "12" } millimetrin tarkkuudella), joten CI-fixturen d/o-12-typistys on merkityksetön; dispatch-ajo käyttää täyttä d/o-70:tä. { "8" } h:n sovitus saavuttaa <b>{ "13" } cm</b> puhtaalla voimalla ja <b>{ "7" } cm</b> empiirisellä tasolla; koko { "24" } h:n kaari (enemmän SRP- ja varjorasitusta, pidempi dynaaminen jakso) on <b>{ "61" } cm</b> — kaikki selvästi { "5" } m:n kynnyksen sisällä.

seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (< { "5" } m kynnys)

seg-cba2e4a9b9b1 = <b>Aineisto:</b> ESA Swarm Level-2 -redusoidun dynamiikan tarkka tieteellinen rata <c1/> (<c2/>, GPS-johdettu, ITRF / IGb14, ~{ "2" } cm, Delftin teknillisen yliopiston käsittely), satelliitti <b>Swarm-A</b> (SP3-tunnus <c3/>, ~{ "430" } km LEO), 2022-01-01.

seg-f66ad1515550 = <b>Avoin lähde (ei kirjautumista):</b> ESA:n Swarm-jakelupalvelin <c1/> → <c2/> (avoin ESA Data Policyn mukaisesti). EOP: sama IERS <c3/> 2022-001 -sarja.

seg-4de8b64c0bf0 = <b>Fixture (SHA-256):</b> SP3 <c1/> (<c2/>).

seg-b46c7e1d476d = LEO-kaari lisää voimamalliin <b>ilmakehän vastuksen</b>. Koska tiheysmalli on <em>staattinen</em> paloittain eksponentiaalinen, rata sovitetaan kahdella tasolla: <b>dynaaminen</b> taso (estimoidaan vain epookin tila; <c1/> pidetään arvossa { "1" }, koska LEO:ssa vastus hallitsee ja SRP on huonosti erotettavissa lyhyellä kaarella) ja <b>redusoidun dynamiikan</b> taso, joka lisää empiiriset kierroskohtaiset kiihtyvyydet, jotka kantavat mallintamattoman vastuksen — operatiivisesti merkityksellinen LEO-rata.

seg-dac35ad223dd = CI-fixture, dynaaminen (<c1/>={ "1" })

seg-0652aa62d459 = { "3" } h

seg-cc0a14ba2b40 = { "2.687" } m

seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

seg-555712268929 = residuaali ≈ puhtaasti radan suuntainen (vastus)

seg-4f8e7956aa78 = CI-fixture, redusoitu dynamiikka (+empiirinen)

seg-aa5f651bcfab = { "0.098" } m

seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

seg-82a3e25da2bf = empiirinen osa absorboi vastuksen

seg-ff834d33ae70 = Dynaaminen sovitus alittaa { "5" } m:n kynnyksen siten, että residuaali on lähes kokonaan radan suuntainen — oppikirjamainen vastuksen tunnusmerkki noin { "430" } km:n korkeudessa. Empiirinen taso absorboi tämän radan suuntaisen virheen ({ "2.52" } → { "0.09" } m) ja antaa <b>~{ "10" } cm</b> redusoidun dynamiikan sovituksen ESA:n oman ~{ "2" } cm:n radan suhteen. Koko vuorokauden, täyden asteen ajo on ohitettu testi <c1/> (jakelupalvelin tarjoaa tuotteen tiedostoselainistuntonsa kautta, joten perustaja lataa päivän SP3:n ja osoittaa muuttujan <c2/> siihen). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) avaruussääsyötteillä on mainittu päivitys, joka kiristäisi <em>dynaamista</em> tasoa edelleen.

seg-e8f5c385de62 = LRO Kuu — validoitu, <b>yli</b> { "5" } m:n kynnyksen (rehellisesti) (P4 W4b)

seg-8a22ef5d3765 = <b>Aineisto:</b> todellinen NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) <b>Lunar Reconnaissance Orbiter</b> (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) rekonstruoitu rata JPL Horizonsista, geometriset Kuun keskipisteeseen sidotut tilavektorit ICRF-koordinaatistossa (International Celestial Reference Frame), 2022-01-01, ~{ "98" } km korkeus, 1 minuutin näytteistys ({ "241" } epookkia, { "4" } h, ~{ "2" } kierrosta). Horizonsin tekstivektoreiden käyttö ei vaadi <b>SPK/SPICE-lukijaa</b> (SPK: planeettaefemeridiydin; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events).

seg-2bcf078de340 = <b>Gravitaatio:</b> GRAIL (Gravity Recovery and Interior Laboratory) <b>GRGM660PRIM</b> -kenttä (NASA Goddard Space Flight Center, aste { "660" }), typistetty asteeseen ja kertalukuun d/o { "150" } ja sovitettu asteella d/o { "100" }, laskettuna Kuun kappalekiinteässä <b>pääakselikoordinaatistossa</b>.

seg-1454f78e9ca4 = <b>Avoin lähde (ei kirjautumista):</b> Horizons API (ohjelmointirajapinta) <c1/>; gravitaatio ICGEM:n (International Centre for Global Earth Models) kautta <c2/>.

seg-306ffeb843a9 = <b>Fixturet (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

seg-65ff0c37dd74 = Tämä on <b>Kuun keskipisteeseen sidottua</b> dynamiikkaa — erillinen voimamalli (<c1/>): GRGM-kenttä Kuun kappalekiinteässä koordinaatistossa (IAU { "2015" } mean-Earth -orientaatio <c2/> yhdistettynä kiinteään DE421 (Development Ephemeris { "421" }) mean-Earth → pääakseli (ME→PA) -siirtymään), sekä Maa (hallitseva Kuun radan häiriö) ja Aurinko kolmantena kappaleena, sovitettuna <em>samalla</em> yleisellä tarkalla Gauss–Newton-estimaattorilla, jota Maa-aineistot käyttävät (trait <c3/>).

seg-68f1894a1fa5 = CI-fixture, dynaaminen (vain tila)

seg-0f055118d77a = { "4" } h

seg-c94fc5bf792b = { "12.05" } m

seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

seg-af395226ca52 = raaka päällekkäisyys { "39.9" } m

seg-2923b4d58878 = CI-fixture, redusoitu dynamiikka (+empiirinen { "1" }+2/rev)

seg-19167d54b4ad = { "6.67" } m

seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

seg-706a4d52f6c5 = 1- ja 2-kierrosta kohden -empiiriset termit absorboivat radan suuntaisen virheen

seg-3f33d99fd643 = Versiossa { "0.36" } tehty korjaus: ennen versiota { "0.36" } DE421 ME→PA -siirtymä sovellettiin väärään suuntaan (ja väärällä Euler-kulmajärjestyksellä), mikä asetti analyyttisen PA-koordinaatiston noin { "208" }″ päähän PA:sta sen päälle sijaan. Se on nyt kirjoitettu niin kuin SPICE sen määrittelee (tarkistettu kutsua <c1/> vasten tarkkuuteen { "2.6e-16" } rad, <c2/>; <c3/>). Yllä olevat luvut ovat korjauksen jälkeisiä; ennen sitä ne olivat raaka { "53.8" } m, <b>{ "12.6" } m</b> dynaaminen ({ "3.07" }, { "10.19" }, { "6.81" } m) ja <b>{ "6.65" } m</b> redusoitu dynaaminen ({ "3.49" }, { "4.56" }, { "3.35" } m).

seg-925d1445fccb = Nämä residuaalit ovat <b>yli</b> { "5" } m:n kynnyksen, jonka Galileo ({ "0.13" } m) ja Swarm-A ({ "0.10" } m) alittavat, ja ne raportoidaan rehellisesti.

seg-c414e14eaaea = Mikä todella asettaa lattian — DE-tason ristiinvalidointi (ja korjaus)

seg-72b06bac7f6b = Oletimme, että rajoittava tekijä oli <b>analyyttisen Kuun orientaation ja efemeridin</b> tarkkuus (IAU-libraatiosarja, tarkkuus kymmeniä kaarisekunteja verrattuna JPL:n DE (Development Ephemeris) -numeerisesti integroituun orientaatioon <c1/>, ja Montenbruck–Gill-Maa/Aurinko-efemeridi, ~{ "0.3" }° DE/SPICE-ydintä vastaan). Tämän suoraan testaamiseksi työtilasta poissuljettu ristiinvalidointikrate <c2/> vaihtaa <b>vain</b> nämä kaksi syötettä <b>DE-tasoisiin</b>: DE440 (Development Ephemeris { "440" }) -Kuun pääakseliorientaatioon (<c3/>) ja DE440-efemeridiin (<c4/>), luettuna ANISEn (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhdas Rust-SPICE-ytimien lukija) kautta — ja ajaa <em>saman</em> estimaattorin uudelleen (commit <c5/>, ytimen SHA-256 <c6/> / <c7/>):

seg-3a0e724a8a2b = Taso

seg-c1ce24cd6008 = analyyttinen

seg-7d04fb530a3a = raaka päällekkäisyys

seg-d9ce88edb49e = { "53.8" } m

seg-55dc7c7d84f0 = { "41.5" } m

seg-7def7880e134 = dynaaminen

seg-83e37e5e9b3e = { "12.6" } m

seg-c421a0a20278 = { "12.0" } m

seg-f70309824f25 = redusoitu dynamiikka ({ "1" }+2/rev)

seg-b8ada0c5fab3 = { "6.65" } m

seg-b6d3daff2f23 = <b>Huomautus versiosta { "0.36" }: suurin osa alla olevasta dynaamisen tason parannuksesta oli siirtymävirhe, ei DE-tasoiset syötteet.</b> Kun ME→PA-siirtymä on korjattu, analyyttinen pino antaa { "39.9" } m raakana, { "12.05" } m dynaamisena ja { "6.67" } m redusoituna dynaamisena, DE-tasoisia { "41.5" }, { "12.0" } ja { "6.67" } m vastaan: analyyttinen ja DE-tasoinen sovitus täsmäävät nyt jokaisella tasolla. Alla olevan taulukon luenta { "0.30" } seuraa tästä, säilytettynä sellaisena kuin se kirjoitettiin.

seg-691df96321d8 = <b>Hypoteesi on vain puoliksi oikea, ja pääväite vaati korjausta.</b> DE-tasoinen orientaatio ja efemeridi <em>parantavat</em> raakaa päällekkäisyyttä ({ "53.8" } → { "41.5" } m) ja <b>dynaamista</b> sovitusta ({ "12.6" } → { "12.0" } m) — joten analyyttisen orientaation ja efemeridin virhe on todellinen ja rajoittaa näitä tasoja. Mutta ne jättävät <b>redusoidun dynamiikan</b> residuaalin olennaisesti <b>muuttumattomaksi</b> ({ "6.65" } → { "6.67" } m): { "1" }+2-kierrosta kohden -empiirinen taso absorboi <em>jo</em> orientaatio- ja efemeridivirheen, joten operatiivinen ~{ "6.6" } m:n lattia määräytyy jostakin muusta — residuaalista, jota kierroskohtainen kanta ei voi absorboida ja jota DE-tasoiset koordinaatistot eivät poista. Johdonmukaisin selitys on <b>mallintamaton LRO:n ei-gravitaatiodynamiikka</b> (lämpösäteily, kaasunpoisto) lyhyellä { "4" } h:n kaarella; kentän aste suljetaan pois (identtinen asteilla d/o { "100" } ja { "150" }) ja integraattorin toleranssi suljetaan pois (identtinen arvoilla <c1/> { "1e-6" } vs { "1e-9" }). Rakentava seuraus: <b>Kshanan kevyt, ytimetön analyyttinen Kuu-pino vastaa jo DE-tason tarkkuutta redusoidun dynamiikan (operatiivisen) Kuun radalle</b> — puhdas kertoimiin perustuva oletus ei jätä siellä mitään pöydälle. { "5" } m:n kynnyksen alittaminen vaatisi LRO:n ei-gravitaatiovoimien mallintamista (avaruusaluskohtainen laatikko-siipi- ja lämpömalli sekä pidempi usean kaaren sovitus), ei parempia koordinaatistoja.

seg-4211fbd25380 = Rehellisyyssopimus

seg-f3b0a26ff5b3 = < { "5" } m:n ”vihreä” kynnys täyttyy <b>Galileo MEO:lle</b> ({ "0.13" } m dynaaminen) ja <b>Swarm-A LEO:lle</b> ({ "2.69" } m dynaaminen / { "0.10" } m redusoitu dynaaminen). <b>LRO Kuu julkaistaan sellaisenaan: { "12.05" } m dynaaminen / { "6.67" } m redusoitu dynaaminen ({ "1" }+2-kierrosta kohden -empiirinen) — kynnyksen yläpuolella</b> ({ "0.36" }, ME→PA-siirtymän korjauksen jälkeen; { "12.6" } / { "6.65" } m ennen sitä). DE-tasoinen ristiinvalidointi (yllä) <b>testasi ja korjasi</b> rajoittavan tekijän väitteen: redusoidun dynamiikan lattia <b>ei</b> ole analyyttinen orientaatio ja efemeridi (DE440-ytimet jättävät sen muuttumattomaksi arvoon { "6.67" } m), joten sitä ei sulje paremmat koordinaatistot vaan LRO:n ei-gravitaatiodynamiikan mallintaminen — rehellinen, päivitetty tie metritasolle.

seg-559a269152ae = LEO:lle <b>dynaaminen</b> (vain tila, staattinen tiheys) ja <b>redusoitu dynaaminen</b> (empiirisin kiihtyvyyksin) taso raportoidaan aina <b>erikseen</b>, jotta lukija näkee, mitä empiiriset termit absorboivat; redusoitu dynaaminen taso on operatiivinen rata. Sama erottelu pätee MEO:n empiiriseen ja puhtaan voiman tasoon.

seg-d20c7ef90250 = Jokaisella residuaalilla on yllä sen commit-hash, aineistoviite ja fixturen tarkistussumma.

seg-733d96129fca = <b>Todellista virastojen totuutta vasten validoidut aineistot: { "3" } / { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO Kuu). <b>Kynnyksen < { "5" } m täyttävät: { "2" } / { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO { "6.67" } m, rehellisesti sen yläpuolella).

seg-d7c77076c9c6 = <s1>Edellinen</s1>SGP4-validointi

seg-d661003da754 = <s1>Seuraava</s1>Aurinkokunta ja muut kappaleet

seg-36a3b8105d4b = Galileo, keskikorkea Maan kiertorata — GREEN (< { "5" } m kynnys)

seg-b6f96cf0d55a = Swarm-A LEO — GREEN (< { "5" } m kynnys)

seg-9e739bda7f20 = LRO Kuu — validoitu, yli { "5" } m:n kynnyksen (rehellisesti) (P4 W4b)
