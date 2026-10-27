# docs--kind-fusion: translations (fi)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC -tietolehti sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-f4cf8b629797 = Aihesivu: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = ja { "4" } lisää matriisissa.

seg-f70076ea4a77 = <b>VALIDATED</b> Allanin / modifioitu / Hadamardin poikkeama + potenssilakikohinan tunnistus χ²-luottamusväleillä. Oraakkeli (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-vertailupoikkeamat NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Suljetun muodon ajelehtimisvirheen kasvu + holdover kynnykseen; kvanttikelloluokat. Oraakkeli (ReferenceImpl): Monivaiheinen clock_state-kovarianssirekursio (saman koodikannan ristiintarkistus); taustalla oleva ajelehtimisvarianssin ja holdover-inversion ydin on validoitu ulkoisesti scipy-kirjastoa vastaan (ks. 'Clock-holdover coast-variance & threshold inversion'). Luokkakohtaiset punakohinalattian holdover-luvut pysyvät MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilainen (vaihe/taajuus/ajautuma) van Loan -Kalman-kello, Joseph-stabiloitu. Oraakkeli (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), jossa F on laskettu scipy.linalg.expm-funktiolla ja Q Van Loanin { "1978" } lohkomatriisilla — riippumaton viitetoteutus, joka toistaa koko Kshana-suodattimen liikeradan. Toteutusten välinen johdonmukaisuus: kellofysiikkaa / Allan-kalibrointia ei ole validoitu ulkoisesti, joten tämä jää tasolle MODELLED. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): IGS final { "30" } s -kelloilla, joita on { "11" } GPS Blo

seg-e12f672ae71d = Kellon holdover GNSS:n ollessa estetty on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Onboard-kellon tilan estimointi on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Harhautuksen (spoofing) havaitseminen on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-4de09fe367df = Lähde: <c1/>

seg-53e498cffeba = <c1/> (skenaariotyyppi)

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-ec26df467b88 = Yhteinen Kalman-anturifuusio-PNT samoilla hybridisyötteillä.

seg-25708bf88728 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

seg-dba20bb12cda = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3d5cae65f093 = Valinnaiset kentät: <c1/>

seg-56bca36cabba = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = Navigointiluokan kvartsikiihtyvyysanturi; havainnollistava kohinan ajaut

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = Kylmäatomikiihtyvyysanturi, matala pitkän tau:n nopeuden satunnaiskävely;

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = Navigointiluokan kvartsikiihtyvyysanturi; i

seg-c8a1c797f4b1 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/fusion-pnt.toml, skenaariotyyppi fusion

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän tyypin.

seg-46c0903ff7b5 = <b>VALIDATED</b> Palauta epookkitila [r,v] maa-aseman etäisyyksistä Gauss–Newton-eräkorjaimella ja sekventiaalisella suodattimella kahden kappaleen+J2-voimamallissa Testit: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

seg-44f77aaf9d7e = <b>MODELLED</b> Virhetila-EKF { "15" } INS-tilalle, kaksitilainen vastaanottimen kello ja yksi float-kantoaaltoepävarmuus seurattua satelliittia kohti; pseudoetäisyys, kantoaallon vaihe ja valinnainen etäisyysnopeus SGP4 Walker -tähdistöstä (valon kulkuaika ja Sagnac), Klobuchar an Testit: <a1>fusion_carrier_tc.rs</a1>.

seg-509f93c7e9ce = <b>MODELLED</b> Kolme gnss-ins-skenaariota ratakirjastossa (alus, joka kiemurtelee nopeudella { "8" } m/s ja jolla on viiden minuutin katkos; juna kahden satelliitin leikkauksen ja tunnelin läpi; ilma-alus, jonka katkos kattaa 25 asteen kallistetun käännöksen) ja paketin valinnainen Testit: <a1>gnss_ins_packs.rs</a1>.

seg-e0633b308e4e = <b>MODELLED</b> Yksi pinottu Kalman-suodatin paikalle, nopeudelle, kellon vaiheelle ja taajuudelle, jolle syötetään paikan ja kellon kytkevät pseudoetäisyydet (Joseph-muotoiset päivitykset, jotka kantavat ristikovarianssin); 1-DOF-variantti, jota on täydennetty vakiokiihtyvyysanturin harhalla s Testit: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN). Oraakkeli (ExternalDataset): Julkaistut CAI:n alkuperäisartikkelien numeeriset vektorit (Cheinet { "2008" } siirtofunktio; Peters/Freier-herkkyys): k_eff·T² täsmää tarkasti, shot-kohinan ASD yksipuolinen lattia ~{ "2" }× sisällä kustakin julkaistusta instrumentista (todelliset laitteet kantavat teknistä kohinaa kvanttilattian yläpuolella). Haarukka, ei pariteetti. { "0.30" } kierros { "2" } (ennakkorekisteröity fcb9ac64), havainto (jää tasolle MODELLED): pelkkä QPN-kiertokohina mitattua Gauguet ym.

seg-7e95210bcc48 = <b>MODELLED</b> Koostettu harha + asteikkokerroin + VRW + stabiilisuuden vaimenemis -paikkabudjetti holdoverin yli. Oraakkeli (ReferenceImpl): Riippumaton numpy Monte Carlo -SDE-integrointi kaksoisintegroidulle valkoisen kiihtyvyyden kohinalle (validoi analyyttisen VRW-varianssin aidosti riippumattomalla algoritmilla) + Grovesin { "2013" } julkaistu arvoankkuri harha- ja asteikkokerroin-termeille; CAI-laitelukemat kvantifioivat kumppanin laitteiston ja pysyvät tasolla MODELLED

seg-9955b1b1c018 = Kvanttiinertiaanturin suorituskyky on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Kvanttiinertiaalisen dead reckoning -paikanpidon kestävyys on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-a849735fcc6e = Aihesivu: <a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>Edellinen</s1>ephemeris

seg-d14a7850df1c = <s1>Seuraava</s1>gnss-ins
