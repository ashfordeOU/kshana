# docs--kind-clock: translations (fi)

seg-debc2f07db78 = true

seg-33555d61ddc6 = Lähde: <c1/>

seg-618393657d01 = <c1/> (skenaariotyyppi)

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-78cba87823f7 = Kellon holdover suhteessa määritykseen; valinnainen Monte Carlo -otosjoukko (runs > { "1" }).

seg-dd2ad570a6c9 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: scenario 91d2b6d10d14 | { "200" } runs | quantum holdover 6600s [6600-6600] p95 8.78e-4ns security n/a (no attack) | classical holdover 844s [220-2130] p95 167.0ns security n/a (no attack)

seg-51820163de28 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-80fe14eb5e79 = Valinnaiset kentät: <c1/>, <c2/>

seg-807e7c5a2565 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC -tietolehti sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Strontiumin optinen hilakello, avaruuteen suunnattu tavoite sigma_y

seg-0cd8dc81045c = { "4" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohdassa <a1><c1/></a1>.

seg-cb0b7da83f5c = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/clock-ensemble.toml, skenaariotyyppi clock

seg-5b3dbe0aed82 = <b>MODELLED</b> Kellotyypin valinnainen [integrity]-osio (clock_integrity::run): annetusta paikasta ja tähdistöesiasetuksista (geometry::sky_geometry), jokaisella eheysepookilla, kun GNSS-aikajana ei ole estetty, hetkellinen RAIM (raim::snapshot_ Testit: <a1>clock_integrity.rs</a1>.

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: yksi jäsennyskerros, joka muuttaa RINEX-kellotiedoston (yhden nimetyn kellon AS/AR-tietueet, versiot { "2" } ja { "3.00" }–{ "3.04" }), TimeLab-tyylisen ASCII-vaihe- tai taajuuslokin tai TAPR TICC -aikaleima- tai -väliaikalokin yhtenäiseksi pha Testit: <a1>clock_log_allantools.rs</a1>.

seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input muodoilla ptp4l, phc2sys, ts2phc, chrony-tracking ja chrony-statistics: linuxptp-servorivin kirjattu poikkeama (ns, rivin oma hakasulkeissa oleva aikaleima, lukemat ennen kuin servo ensimmäisen kerran raportoi tilan s2 jätetty pois a

seg-f70076ea4a77 = <b>VALIDATED</b> Allanin / modifioitu / Hadamardin poikkeama + potenssilakikohinan tunnistus χ²-luottamusväleillä. Oraakkeli (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-vertailupoikkeamat NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Suljetun muodon ajelehtimisvirheen kasvu + holdover kynnykseen; kvanttikelloluokat. Oraakkeli (ReferenceImpl): Monivaiheinen clock_state-kovarianssirekursio (saman koodikannan ristiintarkistus); taustalla oleva ajelehtimisvarianssin ja holdover-inversion ydin on validoitu ulkoisesti scipy-kirjastoa vastaan (ks. 'Clock-holdover coast-variance & threshold inversion'). Luokkakohtaiset punakohinalattian holdover-luvut pysyvät MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilainen (vaihe/taajuus/ajautuma) van Loan -Kalman-kello, Joseph-stabiloitu. Oraakkeli (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), jossa F on laskettu scipy.linalg.expm-funktiolla ja Q Van Loanin { "1978" } lohkomatriisilla — riippumaton viitetoteutus, joka toistaa koko Kshana-suodattimen liikeradan. Toteutusten välinen johdonmukaisuus: kellofysiikkaa / Allan-kalibrointia ei ole validoitu ulkoisesti, joten tämä jää tasolle MODELLED. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): IGS final { "30" } s -kelloilla, joita on { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Kelloavusteinen χ², RAIM, AGC, SQM yhdistettynä epookkikohtaiseksi tietoturvan laatumittariksi. Oraakkeli (ExternalDataset): TEXBAT-skenaarioparametrit (Humphreys { "2012" }) — luonnehdinta, ei kiinnitettyjä vektoreita. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): aineistolla JammerTest { "2024" } (Bleik; GPL-3.0-data) havaintotason monitorit (kelloavusteinen khiin neliö, RAIM, ratkaisun epäonnistuminen) eivät antaneet hälytystä { "10" } s kuluessa yhdestäkään { "8" } arvioitavissa olevasta julkaistusta harhautuksen alkamisesta (kun alkamista edeltävä ikkuna oli puhdas, ensimmäinen hälytys tuli { "10.2" }–{ "39" } s julk

seg-e12f672ae71d = Kellon holdover GNSS:n ollessa estetty on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Onboard-kellon tilan estimointi on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Harhautuksen (spoofing) havaitseminen on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

seg-ee7dd15019d0 = Aihesivu: <a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = Aihesivu: <a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>Edellinen</s1>cislunar-observability

seg-aba9395185fa = <s1>Seuraava</s1>combined-altpnt
