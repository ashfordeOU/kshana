# docs--kinds-mission-analysis-links-and-space-operations: translations (fi)

seg-6e0cb6acc073 = VALIDATED

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
