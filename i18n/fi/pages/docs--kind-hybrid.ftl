# docs--kind-hybrid: translations (fi)

seg-03442e4be82d = Microchip SA65 / SA.45s CSAC -tietolehti sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Aihesivu: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Allanin / modifioitu / Hadamardin poikkeama + potenssilakikohinan tunnistus χ²-luottamusväleillä. Oraakkeli (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-vertailupoikkeamat NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Suljetun muodon ajelehtimisvirheen kasvu + holdover kynnykseen; kvanttikelloluokat. Oraakkeli (ReferenceImpl): Monivaiheinen clock_state-kovarianssirekursio (saman koodikannan ristiintarkistus); taustalla oleva ajelehtimisvarianssin ja holdover-inversion ydin on validoitu ulkoisesti scipy-kirjastoa vastaan (ks. 'Clock-holdover coast-variance & threshold inversion'). Luokkakohtaiset punakohinalattian holdover-luvut pysyvät MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilainen (vaihe/taajuus/ajautuma) van Loan -Kalman-kello, Joseph-stabiloitu. Oraakkeli (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), jossa F on laskettu scipy.linalg.expm-funktiolla ja Q Van Loanin { "1978" } lohkomatriisilla — riippumaton viitetoteutus, joka toistaa koko Kshana-suodattimen liikeradan. Toteutusten välinen johdonmukaisuus: kellofysiikkaa / Allan-kalibrointia ei ole validoitu ulkoisesti, joten tämä jää tasolle MODELLED. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): IGS final { "30" } s -kelloilla, joita on { "11" } GPS Blo

seg-e12f672ae71d = Kellon holdover GNSS:n ollessa estetty on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Onboard-kellon tilan estimointi on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Harhautuksen (spoofing) havaitseminen on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-dba20bb12cda = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> Yksi pinottu Kalman-suodatin paikalle, nopeudelle, kellon vaiheelle ja taajuudelle, jolle syötetään paikan ja kellon kytkevät pseudoetäisyydet (Joseph-muotoiset päivitykset, jotka kantavat ristikovarianssin); 1-DOF-variantti, jota on täydennetty vakiokiihtyvyysanturin harhalla s Testit: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN). Oraakkeli (ExternalDataset): Julkaistut CAI:n alkuperäisartikkelien numeeriset vektorit (Cheinet { "2008" } siirtofunktio; Peters/Freier-herkkyys): k_eff·T² täsmää tarkasti, shot-kohinan ASD yksipuolinen lattia ~{ "2" }× sisällä kustakin julkaistusta instrumentista (todelliset laitteet kantavat teknistä kohinaa kvanttilattian yläpuolella). Haarukka, ei pariteetti. { "0.30" } kierros { "2" } (ennakkorekisteröity fcb9ac64), havainto (jää tasolle MODELLED): pelkkä QPN-kiertokohina mitattua Gauguet ym.

seg-9955b1b1c018 = Kvanttiinertiaanturin suorituskyky on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Kvanttiinertiaalisen dead reckoning -paikanpidon kestävyys on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-d91dc5633e67 = Lähde: <c1/>

seg-3b43d9c5624d = <c1/> (skenaariotyyppi)

seg-22cd963c7042 = Hybridi-PNT-kokonaisuus: kello + IMU + ajansiirtoavustus.

seg-166be08d5276 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = Valinnaiset kentät: ei yhtään

seg-f33278986879 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-7bebd09c614b = Navigointiluokan kvartsikiihtyvyysanturi (Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Exail-hybridikvanttikiihtyvyysanturikolmikko, harhan vakaus { "5.8" }

seg-49bff8dc860e = Navigointiluokan kvartsikiihtyvyysanturi (H

seg-52378a7b074c = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/hybrid-pnt.toml, skenaariotyyppi hybrid

seg-a1810bbca337 = <b>MODELLED</b> Kaksisuuntainen/TWSTFT (Sagnac), GNSS yhteisnäkymä, PPP; linkin värinä→etäisyys. Oraakkeli (ExternalDataset): Sagnac-suuruus tarkistettu arvovaltaista JULKAISTUA ARVOA vasten — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), yhtälö { "1.29" }: itään suuntautuva päiväntasaajan kiertomatka kerryttää { "207.4" } ns (2ωA_E/c²); kshana toistaa { "207.386" } ns. Riippumattomasti vahvistettu RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), joka kantaa saman 2Aω/c²-geometrian. Yhdistetty BIPM TWSTFT -transponderi/yhteisnäkymä/

seg-a8beb8dfc757 = Ajansiirron virhebudjetointi on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-a9c56fc9608a = Aihesivu: <a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>Edellinen</s1>hybrid-ukf

seg-53b95026bf54 = <s1>Seuraava</s1>impairment-eval
