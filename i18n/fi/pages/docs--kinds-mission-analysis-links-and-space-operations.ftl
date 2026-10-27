# docs--kinds-mission-analysis-links-and-space-operations: translations (fi)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Tyyppi

seg-cb9447893c7f = Yksi satelliitti yhden aseman yllä: jokaisen ylilennon vinoetäisyys, korkeuskulma ja Es/N0 ylilennon varrella, kullakin askeleella valittu DVB-S2 MODCOD (ETSI EN { "302" } 307-1 Table { "13" } -kynnykset sekä toteutusmarginaali) ja datamäärä, jonka ACM siirtää verrattuna vakiokoodauksen lähtötasoon, joka sulkeutuu maskilla. MODELLED.

seg-046f69293874 = Moottorin kirjoittama kaavio skenaariolle scenarios/acm-link.toml, laji acm-link

seg-7eff466eb018 = Avaruusaluksen asennonhallinta: jäykän rungon inertiaalisuuntainen käännös kolmella tai useammalla tasapainotetulla reaktiopyörällä MRP-takaisinkytkennällä (L = -K sigma - P omega), miniminormin pyörämomentit rajattuna kunkin moottorin rajaan, RK4 nollannen kertaluvun pidolla; valinnaisesti suljettuna multiplikatiiviseen EKF:ään simuloidusta gyrosta (kulma- ja nopeussatunnaiskävely) ja tähtikamerasta. Raportoi asettumisajan, lopullisen ja huippuosoitusvirheen, pyörän huippunopeuden ja -momentin, kyllästyneen osuuden, liikemäärämomentin ajautuman ja estimaattorin kanssa sen asentovirheen ja NEES:n. Todellisen tilan silmukka on VALIDATED vertailussa Basilisk { "2.9.1" }; estimaattori on MODELLED.

seg-08c624d5324d = Moottorin kirjoittama kaavio skenaariolle scenarios/aocs-slew.toml, laji aocs

seg-0cef33b41040 = Apertuurin käyttösuhde: navigoinnin ja viestinnän aikajako, jonka yhteysaikataulu merkitsee ohjattavien apertuurien joukolle. Ottaa yhteysaikataulun (luettelo ikkunoista <c1/> aos_s/los_s, joista kukin pyytää navigointia tai viestintää — sama aos_s/los_s-sanasto, jonka ennustin <c2/> tuottaa), apertuurien määrän ja VÄLITYSPOLITIIKAN (navigointi etusijalla oletuksena, tai viestintä etusijalla, tai keskeyttämätön ensin tullut ensin palvellaan), ja raportoi navigoinnin käyttösuhteen, viestinnän käyttösuhteen, joutoajan käyttösuhteen ja istuntokohtaisen katkon — yhteysajan, jonka istunto pyysi ja jota mikään apertuuri ei palvellut. Tarkka välinpyyhkäisy ikkunarajojen yli, joten toisiinsa koskettavat ikkunat eivät koskaan kilpaile eikä yhtään apertuurisekuntia lasketa kahdesti; navigoinnin, viestinnän ja joutoajan apertuurisekunnit kerätään toisistaan riippumatta ja ne sulkeutuvat arvoon apertuurit*horizon_s. Raportti ilmoittaa ratkaistun politiikan, sen täyden määritelmän sekä käyttösuhteen ja katkon määritelmät, koska ilman välityspolitiikkaansa esitetty käyttösuhdeluku ei ole toistettavissa. MODELLED aikataulutuslaskenta: mitään käännös- / uudelleenvirityksen / vaihtoaikaa ei veloiteta, kun apertuuri vaihtaa palvelua tai istuntoa, päätökseen ei vaikuta datamäärä, puskuritila, energiabudjetti eikä linkin sulkeutuminen, ja yhteysikkunat ovat syötteitä — niiden geometria on se, mikä ne tuotti. Ei maasegmentin aikataulutustuote.

seg-a8b38ed8e029 = Moottorin kirjoittama kaavio skenaariolle scenarios/aperture-duty-cycle.toml, laji aperture-duty-cycle

seg-34d041d6bd9f = Monivaiheisen kantoraketin tasomainen painovoimakäännöksellä tehty nousu pyörimättömän pallomaisen Maan yllä US Standard Atmosphere { "1976" } -ilmakehän läpi (pystysuora nousu, pitch-potku, työntövoima nopeuden suuntaan), integroiden painovoima-, ilmanvastus-, ohjaus- ja vastapainehäviöt ja tarkistaen ideaalisen dv:n miinus häviöt polttoloppunopeutta vasten; max-Q, huippukiihtyvyys ja polttolopputila. MODELLED.

seg-ccf2185b0b5e = Moottorin kirjoittama kaavio skenaariolle scenarios/ascent-losses.toml, laji ascent-losses

seg-62c0dda9fc56 = 3-DOF-asento- ja osoitusvirhebudjetti: pahimman tapauksen gravitaatiogradienttihäiriömomentti ((3/2)(μ/R³)ΔI) ja osoitusvirheen neliösumman juuren budjetti nimettyjen 1σ-osatekijöiden yli (anturikohina, reaktiopyörän jitter, lämpö, linjaus) hallitsevan termin kanssa, kiertoratakorkeudelle ja rungon hitausmomenttien hajonnalle. MODELLED skalaarinen AOCS-budjetti — laitteistoa edeltävä täydennys Basiliskille/42:lle, ei säätösilmukan / 6-DoF:n / joustavien muotojen simulaatio.

seg-ad0e72e3b688 = Moottorin kirjoittama kaavio skenaariolle scenarios/attitude-budget.toml, laji attitude-budget

seg-be4e928a5865 = Maayhteyksien suunnittelu usealle satelliitille usealla asemalla: näennäiset yhteysikkunat (SGP4, IAU 2006/2000A Maan mukana pyörivä koordinaatisto, ITU-R P.834 -refraktio, valon kulkuaika), kunkin ohikulun DVB-S2 ACM -datamäärä (ETSI EN { "302" } 307-1 taulukon { "13" } kynnykset) ja ristiriidaton aikataulu (yksi satelliitti antennia kohti käännösajalla, yksi asema satelliittia kohti, prioriteettipainotettu toimitus rajattuna kunkin jonon kokoon) marginaaliarvoon perustuvalla ahneella menetelmällä, ensin tulleen palvelun lähtötasolla ja tarkalla branch and bound -haulla pienillä joukoilla, sekä ahneen menetelmän optimaalisuusvälillä. MODELLED.

seg-e26b549579e2 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/contact-schedule.toml, skenaariotyyppi contact-schedule

seg-b843e2e0a4ee = 3-DoF pistemassamallinen ilmakehään tulo pyörivän pallomaisen Maan tai Marsin yllä (ballistinen tai nostava vakiokallistuksella), RK4, US76-, eksponentiaalisen tai Marsin ilmakehän läpi, Sutton-Gravesin pysähdyspisteen konvektiivisella lämpenemisellä (NASA TR R-376): huippuhidastuvuus, lämpövuo ja dynaaminen paine, lämpökuorma, maanpintakantama, pyörivän koordinaatiston energiatarkistus ja Allen-Eggers-suljettu muoto sen rinnalla. Huippuhidastuvuus on tarkistettu julkaistua Stardust-nimellisarvoa vastaan; lämpeneminen on MODELLED.

seg-dbb618cd6357 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/entry-heating-stardust.toml, skenaariotyyppi entry-heating

seg-47b4aea6ed01 = Maanhavaintokuorman jalanjälki ja kattavuusgeometria (SMAD:n avaruuskolmio): Maan kulmasäde, kaistan leveys, nadirin maanäytteen etäisyys (GSD), suurin nadirista poikkeava saavutettavuus, ympyräradan jaksonaika, J2-solmujakso ja päiväntasaajan maanpintajäljen väli yhtenäisen kattavuuden lipulla, kiertoradan korkeudelle, kaltevuudelle (oletuksena aurinkosynkroninen) ja anturin FOV/IFOV:lle. MODELLED pallomaisen Maan geometria (ei radiometriaa/MTF:ää/ilmakehää/osoitusvärinää/auringonpaistetta (glint)); solmuväli R_e·(ω − Ω̇)·T_nodal ensimmäisen kertaluvun J2-sekulaarisilla nopeuksilla.

seg-c2a8332f2ee2 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/eo-coverage.toml, skenaariotyyppi eo-coverage

seg-816bd5a5808a = Nadir-kuvaajan radiometria ja kuvanlaatu: Lambert-kohtauksen apertuurinsäteily, kamerayhtälö, signaali sekä shot-, pimeävirta-, lukemis- ja kvantisointikohina ja SNR; järjestelmän MTF Nyquistilla (diffraktio x ilmaisin x liike x värinä), siitä johdettu suhteellinen reunavaste, Q = lambda F/p ja GIQE-version { "4" } NIIRS ilman MTF-kompensaatiota. MODELLED.

seg-bf7b52f7a01e = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/eo-radiometry.toml, skenaariotyyppi eo-radiometry

seg-7a4e6215a488 = Kaksirunkoinen laukaisu- ja nousugeometria: laukaisuazimutit (sin Az = cos i / cos lat), pienin saavutettavissa oleva inklinaatio, ympyräratanopeus, Maan pyörimisen itään suuntautuva hyöty, dogleg-tasonmuutoksen Δv kun tavoiteinklinaatio on alle laukaisupaikan leveysasteen, sekä päivittäisten laukaisumahdollisuuksien lukumäärä. MODELLED pallomaisen Maan geometria (ei pyörivän Maan nopeuskolmion korjausta, ei nousu- tai vastushäviömallia).

seg-9696283a95ae = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/launch-window.toml, tyyppi launch-window

seg-953188c11165 = Yksisuuntainen linkkibudjetti CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä: vapaan tilan etenemishäviö, C/N₀, Eb/N₀, marginaali ja linkin sulkeutuminen lähetyksen EIRP:lle, vastaanoton G/T:lle, etäisyydelle, datanopeudelle ja kaistalle (s|x|ka) vaadittua Eb/N₀:aa vastaan. Deterministinen insinöörilaskelma annetuista syötteistä (ei kalibroitu päätelaitteen datalehti).

seg-bd375631bc7e = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/link-budget.toml, tyyppi link-budget

seg-dbffff25b57f = CCSDS OEM -yhteentoimivuussilta: tuo ulkoisen lentodynamiikkatyökalun tuottama Orbit Ephemeris Message (GMAT/Orekit/STK tuottavat kaikki OEM:n) ja raportoi sen segmentit/kohteet/koordinaatistot/epookkivälin sekä nopeuden johdonmukaisuustarkistuksen; ilman syötettä se kiertää generoidun viiteradan edestakaisin ja raportoi tuonnin↔viennin tarkkuuden. MODELLED rakenteellinen/fysikaalinen sisäänottotarkistus, EI lähteen radan tarkkuuden validointi.

seg-5db5a7c812ca = Moottorin kirjoittama kaavio skenaariolle scenarios/oem-interop.toml, tyyppi oem-interop

# text
seg-039f77066d97 = Allen–Eggers-tyyppinen ballistinen ilmakehään paluun käytävä: huippuhidastuvuus (ballistisesta kertoimesta riippumaton, V_e^{ "2" } sin|γ|/(2eH)), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämmityksen nopeus, kun annetaan paluunopeus, lentoratakulma ja ballistinen kerroin eksponentiaalisen ilmakehän läpi, sekä saman ballistisen paluun tasomainen pistemassaintegrointi, jossa on mukana painovoima, Maan kaarevuus ja US Standard Atmosphere { "1976" } (huippuhidastuvuus, nopeus, korkeus ja aika huipun kohdalla). MODELLED ballistinen (nostoton) paluu; lämmitystuloste on huippulämmityksen NOPEUS, ei lämpövuo (ei aerotermistä eikä TPS-mallia).

# attr:alt
seg-b0109481e8ff = Moottorin kirjoittama kaavio skenaariolle scenarios/reentry.toml, laji reentry

# text
seg-de2448d74c2b = CCSDS 133.0-B Space Packet Protocol -kehystys: synteettisen TM/TC-pakettivirran koodaus (6 oktetin ensisijainen otsikko + datakenttä) sekä pakettikohtaisen otsikon dekoodauksen, oktettien kokonaismäärän ja tarkan koodaus↔dekoodaus-kierron raportointi. Deterministinen tarkka bittirakenteen kehystys — viraston pakettimuodon yhteentoimivuuskerros; EI vaatimustenmukaisuuden sertifiointi (ei toissijaisen otsikon/CRC:n/segmentoinnin logiikkaa lippuja pidemmälle).

# attr:alt
seg-af1cf9aa9938 = Moottorin kirjoittama kaavio skenaariolle scenarios/space-packet.toml, laji space-packet

# text
seg-4e31c8daf798 = Kirjanpito

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

seg-69ee217ed8e0 = Lähde: <c1/>

seg-f5091cbeecbf = Tehtäväanalyysi, yhteydet ja avaruusoperaatiot (skenaariolajien perhe)

seg-d0eea6d9d1ad = Moottorin v{ $version } skenaariolajeja on { "14" }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin antama; laji on MODELLED, ellei matriisi muuta sano (miten merkintä ansaitaan: README:n Evidence-osio).

seg-6481dabc9458 = Aihesivut: <a1>ENTRY-EO-ASCENT</a1>, <a2>CONTACT-SCHEDULING</a2>, <a3>AOCS</a3>. Aja yksi: <c1/>. Kaikki perheet: <a4>KINDS.md</a4>.

seg-d6c5a581ffaf = Yleiskuva kaavioista, jotka moottori kirjoittaa perheen Tehtäväanalyysi, yhteydet ja avaruusoperaatiot lajeille

seg-8d65a4a1948d = Kaksikappaleen laukaisu- ja nousugeometria: laukaisuazimutit (sin Az = cos i / cos lat), pienin saavutettava inklinaatio, ympyräratanopeus, Maan pyörimisen itäsuuntainen etu, dogleg-tasonmuutoksen Δv kun ta

seg-dd47e755d262 = Monivaiheisen kantoraketin tasomainen painovoimakäännöksen nousu pyörimättömän pallomaisen Maan yli US Standard Atmosphere -ilmakehän (vuosi { "1976" }) läpi (pystynousu, nostokulman potku, työntövoima nopeuden suuntaan), integroiden painovoima

seg-cc88f37328a3 = Allen–Eggers-ballistinen paluukäytävä: huippuhidastuvuus (riippumaton ballistisesta kertoimesta, V_e^{ "2" } sin/γ//(2eH)), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämpökuorman nopeus, paluunopeudelle

seg-8ad7c34d8c25 = 3-DoF-pistemassan ilmakehäpaluu pyörivän pallomaisen Maan tai Marsin yli (ballistinen tai nostavaa vakiokallistuksella), RK4, US76:n, eksponentiaalisen tai Marsin ilmakehän läpi, Sutton–Graves-pysähtymispisteen

seg-efe896d3f43b = Maan havainnointikuorman jalanjälki ja kattavuusgeometria (SMAD-avaruuskolmio): Maan kulmasäde, kaistanleveys, nadirin maastopikselikoko, suurin nadirista poikkeava pääsy, ympyräratajakso, J2-solmujakso

seg-d3d9652fd8a0 = Nadirkuvaajan radiometria ja kuvanlaatu: Lambert-näkymän aukkosäteily, kameran yhtälö, signaali sekä laukaus-/pimeä-/luku-/kvantisointikohina ja SNR; järjestelmän MTF Nyquistin taajuudella (diffraktio

seg-1940d5c75a98 = 3-DOF-asennon ja osoitusvirheen budjetti: pahimman tapauksen gravitaatiogradienttihäiriömomentti ((3/2)(μ/R³)ΔI) ja neliösummattu osoitusvirhebudjetti nimetyistä 1σ-osuuksista (anturikohina, reaktio

seg-e00d18fbb52b = Avaruusaluksen asennonsäätö: jäykän rungon inertiaalinen osoituskäännös kolmella tai useammalla tasapainotetulla reaktiopyörällä MRP-takaisinkytkennällä (L = -K sigma - P omega), pienimmän normin pyörämomentit rajattuna kunkin

seg-496fa280de7b = Yksisuuntainen linkkibudjetti CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä: vapaan tilan vaimennus, C/N₀, Eb/N₀, marginaali ja sulkeutuminen lähetyksen EIRP:lle, vastaanoton G/T:lle, etäisyydelle, datanopeudelle ja kaistalle (s/x/ka) vastaan

seg-f0aca7ea1ffa = Yksi satelliitti yhden aseman yllä: kunkin ylilennon vinoetäisyys, korkeuskulma ja Es/N0 ylilennon varrella, kullakin askeleella valittu DVB-S2 MODCOD (ETSI EN { "302" } 307-1 taulukon { "13" } kynnysarvot plus toteutusmarginaali)

seg-44c4890ba07e = Maayhteyksien suunnittelu usealle satelliitille usean aseman yli: näennäiset pääsyikkunat (SGP4, IAU 2006/2000A Maan kiinteä koordinaatisto, ITU-R P.834 -refraktio, valon kulkuaika), DVB-S2 ACM -datamäärä

seg-19ab136e9f9b = Aukon käyttösuhde: navigoinnin ja viestinnän aikajako, jonka yhteyssuunnitelma edellyttää ohjattavien aukkojen joukolle.

seg-ee0c649ca8b2 = CCSDS 133.0-B Space Packet Protocol -kehystys: koodaa synteettinen TM/TC-pakettivirta (6 oktetin ensisijainen otsikko + datakenttä) ja raportoi pakettikohtainen otsikon purku, oktettien kokonaismäärä ja täsmällinen koodaus↔purku

seg-e561f3a749db = CCSDS OEM -yhteentoimivuussilta: tuo ulkoisen lentodynamiikkatyökalun (GMAT/Orekit/STK tuottavat kaikki OEM:n) tuottama Orbit Ephemeris Message ja raportoi sen segmentit/kohteet/koordinaatistot/epookkijakso sekä

seg-1f074d7beccc = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-8f65824c39c5 = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>launch-window</a1>.

seg-2926bde689d3 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-66f6489411d0 = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>ascent-losses</a1>.

seg-481ce1d98bc7 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-fff98550eb48 = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>reentry</a1>.

seg-9cf8d4b6064f = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-84e1bddcbc95 = <b>Kirjanpito (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>entry-heating</a1>.

seg-eab43348803e = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-9c6ce756a89a = <b>Kirjanpito (ledger):</b> VALIDATED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>eo-coverage</a1>.

seg-cd84a7bdbe57 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>.

seg-320d724ac797 = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>eo-radiometry</a1>.

seg-905487bf50f1 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>.

seg-14511e367361 = <b>Kirjanpito (ledger):</b> VALIDATED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>attitude-budget</a1>.

seg-540fa1932dad = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valinnaiset: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>.

seg-6d2e9b9ce87f = <b>Kirjanpito (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>aocs</a1>.

seg-3345731b5729 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-f8b896b81014 = <b>Kirjanpito (ledger):</b> MODELLED { "1" } · VALIDATED { "1" }. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>link-budget</a1>.

seg-e38e356f4b71 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-eed876ed5aab = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>acm-link</a1>.

seg-5fddd2460fb0 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

seg-58d00faa1eda = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>contact-schedule</a1>.

seg-5d4f6861f301 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-1e06e06d4325 = <b>Kirjanpito (ledger):</b> MODELLED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>aperture-duty-cycle</a1>.

seg-9bb424e01c84 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>.

seg-688071019c9e = <b>Kirjanpito (ledger):</b> VALIDATED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>space-packet</a1>.

seg-03c06f9fdc85 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>.

seg-568c484ce9a0 = <b>Kirjanpito (ledger):</b> VALIDATED. Koko sivu, jolla ovat syötteet, tulokset, todisteet ja rajoitukset: <a1>oem-interop</a1>.

seg-41996765fcf1 = <s1>Edellinen</s1>Kuu ja Maa–Kuu-avaruus

seg-1951c46fe429 = <s1>Seuraava</s1>Optinen PNT
