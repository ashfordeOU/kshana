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
