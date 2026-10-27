# docs--kind-slot-timing: translations (fi)

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-cb91473bfdda = Aihesivu: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

# text
# c1: docs/kinds/by-kind/slot-timing.md
seg-09644e40e2d8 = Lähde: <c1/>

# text
# c1: slot-timing
seg-ec92d03eaa6c = <c1/> (skenaariolaji)

# text
seg-1b61962464c5 = Slot timing: sekunnit siihen asti, kun vapaasti käyvä kello poistuu aikaindeksoidun reitityksen tai tehtävänannon aikavälin suoja-alueelta (suurin absoluuttinen aikavirhe, jonka aikaväli sietää), jokaisen termin osuus tuolla hetkellä niin, että hallitseva termi nimetään (kiinnityksen epävarmuus, valkoinen vaihekohina, valkoinen, flicker-, satunnaiskävely- ja satunnaisajelutaajuuskohina, jäännöstaajuuspoikkeama, lämpötila, ikääntyminen), viimeisestä kiinnityksestä jäljellä oleva aika sekä suurin kiinnitysväli, joka pitää kellon rajojen sisällä kiinnityksen viive vähennettynä. Oskillaattori on LUOKKAOLETUS (csac, uso, dsac, tcxo, ocxo tai rafs: yksi viitattu yhden sekunnin Allanin poikkeama ja oletettu punakohinan lattia), telekommunikaation ajoituksen TIETOLEHTI-ESIASETUS tai rivinsisäinen TIETOLEHTI (Allanin poikkeaman maksimit sovitettuna verhokäyränä sekä ikääntyminen ja lämpötilakerroin) tai rivinsisäinen MEASURED-vaihetallenne (sen limittyvä Allanin poikkeama sovitettuna painotetulla pienimmän neliösumman menetelmällä valkoisen vaiheen ja IEEE Std { "1139" } -taajuusmodulaatiokannassa, joten punakohinan lattia on mitattu eikä oletettu). Ylitys, joka ylittää pisimmän keskiarvoistusajan, jota tietolehti tai tallenne tukee, merkitään ekstrapoloiduksi. Valinnainen spoofing-osio lisää kiertoradalla olevan vastaanottimen ajoituksen suojaustason: kiertonopeus ja kiertoaika, kuinka kauan yksittäinen maassa oleva harhautuslähetin yltää satelliittiin yhdellä ylilennolla, kelloavusteisen monitorin lattia ja CUSUM-havaitsemisviive, ehdollinen raja, vetäytymä, jonka harhautuslähetin ilmoitetulla suurimmalla nousunopeudella kerryttää ennen kuin satelliitti poistuu sen kantamalta tai riippumaton tarkistus suoritetaan, sekä onko jokainen maayhteyden tai ristiinlinkin tarkistus riippumaton tuosta harhautuslähettimestä. VALIDATED: holdover-käänteisratkaisu sovitetusta tallenteesta, pidätettynä oikealla cesiumkellolla, jota mitattiin vetymaseria vastaan (tests/slot_timing_cs5071a_holdout.rs, dataportitettu); mitatulla kideoskillaattorilla pidätetty ennuste on konservatiivinen mutta ei kynnyksen sisällä, joten kideoskillaattoritapaus on MODELLED. MODELLED: luokka- ja tietolehtilähteet, deterministiset termit ja harhautusarvio.

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-1284cfee51f0 = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: slot-timing (datasheet source): guard { "100.0" } ns at k={ "3" } breaks { "650.8" } s after a fix ({ "50.8" } s left); fix at least every { "645.8" } s ({ "133.80" } per day); dominant term: random-walk frequency noise

# text
# c1: oscillator
# c2: slot
seg-97e12e763be3 = Pakolliset kentät: <c1/>, <c2/>

# text
# c1: spoofing
seg-6b75ef50497a = Valinnaiset kentät: <c1/>

# text
# c1: scenarios/slot-timing-ocxo-leo.toml
seg-8c4662736bc0 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-8aee75a55007 = ocxo

# text
seg-df4ca2d859ff = 1/s^{ "3" }

# text
seg-1a282dc35742 = datasheet

# text
seg-c13396b4e57b = Tuloksen tunniste (moottorin oma): MODELLED — aika, jonka kuluttua vapaasti käyvä kello poistuu reitityksen aikavälin suoja-alueelta, sekä kiinnitystahti, joka pitää sen rajojen sisällä, stationaarisesta potenssilakikellomallista. Tietolehtilähde on sen maksimien verhokäyrä, ei minkään yksilön mittaus; luokkalähde perustuu oletettuun punakohinan lattiaan.

# attr:alt
seg-97a91c8a60cd = Moottorin kirjoittama kaavio skenaariolle scenarios/slot-timing-ocxo-leo.toml, laji slot-timing

# text
seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: tämän lajin nimeävät <a1>varmennusmatriisin</a1> rivit.

# text
# c1: slot-timing
seg-e84e4b49fee0 = <b>VALIDATED</b> Lajin <c1/> mitatun tallenteen polku: vaihetallenteen limittyvä Allanin poikkeama sovitettuna edf-painotetulla ei-negatiivisella pienimmän neliösumman menetelmällä valkoisen vaiheen ja IEEE Std { "1139" } -taajuusmodulaatiokannassa (slot_timing::fit_weighted), Testit: <a1>slot_timing_cs5071a_holdout.rs</a1>.

# text
# c1: slot-timing
seg-26ccdbd07a46 = <b>MODELLED</b> Lajin <c1/> ennustettu virhe E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² käänteisenä ylitykselle, jäljellä olevalle ajalle, kiinnityksen viiveellä vähennetylle uudelleensynkronointivälille ja kiinnityksille päivää kohti, jokainen termi eriteltynä th Testit: <a1>slot_timing_igs_holdout.rs</a1>.

# text
# c1: slot-timing
seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, saavutettavissa lajin <c1/> spoofing-osiona: ympyräradan nopeus ja kiertoaika, pisin aika, jonka maassa oleva harhautuslähetin yltää satelliittiin yhdellä ylilennolla, kelloavusteisen monitorin lattia ja CUSUM-havaitsemis l

# text
# c1: slot-timing
seg-8dbc28c3398f = <b>MODELLED</b> Lajin <c1/> ennustettu virhe E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² käänteisenä ylitykselle, jäljellä olevalle ajalle, uudelleensynkronointivälille. Oraakkeli (InternalConsistency): Suljetut muodot jokaiselle termille erikseen ja riippumaton holdover::holdover_seconds-juurenetsintä; tietolehtien luvut ovat nimetyt asiakirjat (docs/SLOT-TIMING.md). Luokkaoletus perustuu oletettuun punakohinan lattiaan ja tietolehtilähde on maksimien verhokäyrä, joten kumpikaan ei ole minkään yksilön mittaus

# text
# c1: slot-timing
seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, saavutettavissa lajin <c1/> spoofing-osiona: ympyräradan nopeus ja kiertoaika, pisin aika, jonka maassa oleva harhautuslähetin yltää satelliittiin yhdellä ylilennolla. Oraakkeli (InternalConsistency): Palautus olemassa olevaan ajoituksen suojaustasoon sekä ympyräradan ja pallomaisen Maan näkyvyyden suljettuihin muotoihin. Ehdollinen havaitsemiselle, yksi maanpäällinen harhautuslähetin ilmoitetulla nousunopeudella, ylilento suoraan yläpuolelta pyörimättömällä Maalla; ei validoitu harhautetulla vastaanottimella kiertoradalla

# text
# c1: not_modelled[0]
seg-29af1ec87672 = taajuushypyt, säteilyvaikutukset ja relativistiset taajuuspoikkeamat (tulos <c1/>)

# text
# c1: not_modelled[1]
seg-89f90cdab1db = lämpömalli: lämpötilapoikkeama sovelletaan askelena kiinnityksen kohdalla (tulos <c1/>)

# text
# c1: not_modelled[2]
seg-cb3887ccae22 = itse synkronointiprotokolla: kiinnitys nollaa virheen arvoon fix_sigma_ns (tulos <c1/>)

# text
# c1: not_modelled[3]
seg-b96fceda31df = minkä vaelluksen mittarin mukaan reitityksen aikaväli tulisi hyväksyä; katso docs/SLOT-TIMING.md (tulos <c1/>)

# text
# c1: label
seg-b101457241f2 = MODELLED — aika, jonka kuluttua vapaasti käyvä kello poistuu reitityksen aikavälin suoja-alueelta, sekä kiinnitystahti, joka pitää sen rajojen sisällä, stationaarisesta potenssilakikellomallista. Tietolehtilähde on sen maksimien verhokäyrä, ei minkään yksilön mittaus; luokkalähde perustuu oletettuun punakohinan lattiaan. (tulos <c1/>)

# text
# c1: kshana kinds --json
seg-8e3d910f22ed = Oskillaattori on LUOKKAOLETUS (csac, uso, dsac, tcxo, ocxo tai rafs: yksi viitattu yhden sekunnin Allanin poikkeama ja oletettu punakohinan lattia), telekommunikaation ajoituksen TIETOLEHTI-ESIASETUS tai rivinsisäinen TIETOLEHTI (Allanin poikkeaman maksimit sovitettuna verhokäyränä sekä ikääntyminen ja lämpötilakerroin) tai rivinsisäinen MEASURED-vaihetallenne (sen limittyvä Allanin poikkeama sovitettuna painotetulla pienimmän neliösumman menetelmällä valkoisen vaiheen ja IEEE S (lajiluettelo (<c1/>))

# text
# c1: kshana kinds --json
seg-f6a831727890 = VALIDATED: holdover-käänteisratkaisu sovitetusta tallenteesta, pidätettynä oikealla cesiumkellolla, jota mitattiin vetymaseria vastaan (tests/slot_timing_cs5071a_holdout.rs, dataportitettu); mitatulla kideoskillaattorilla pidätetty ennuste on konservatiivinen mutta ei kynnyksen sisällä, joten kideoskillaattoritapaus on MODELLED. (lajiluettelo (<c1/>))

# text
# c1: kshana kinds --json
seg-1cf85cbedffa = MODELLED: luokka- ja tietolehtilähteet, deterministiset termit ja harhautusarvio. (lajiluettelo (<c1/>))

# text
seg-1a72034c1343 = Aihesivu: <a1>DECEIVED-TIME.md</a1>

# text
seg-10e6cd8ce00c = <s1>Edellinen</s1>reentry

# text
seg-b8ec9e10ee84 = <s1>Seuraava</s1>solar-system
