# docs--kind-orbit: translations (fi)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Moottorin v{ $version } skenaariolaji, perhe <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-a4f1e7d2041e = Perhesivu: <a1>Satelliittitähdistöt, kattavuus ja geometria</a1>

seg-be831b52a339 = ja { "4" } lisää matriisissa.

seg-a8d92406e428 = Strontiumin optinen hilakello, avaruuteen suunnattu tavoite sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b> Allanin / modifioitu / Hadamardin poikkeama + potenssilakikohinan tunnistus χ²-luottamusväleillä. Oraakkeli (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-vertailupoikkeamat NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Suljetun muodon ajelehtimisvirheen kasvu + holdover kynnykseen; kvanttikelloluokat. Oraakkeli (ReferenceImpl): Monivaiheinen clock_state-kovarianssirekursio (saman koodikannan ristiintarkistus); taustalla oleva ajelehtimisvarianssin ja holdover-inversion ydin on validoitu ulkoisesti scipy-kirjastoa vastaan (ks. 'Clock-holdover coast-variance & threshold inversion'). Luokkakohtaiset punakohinalattian holdover-luvut pysyvät MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> 3-tilainen (vaihe/taajuus/ajautuma) van Loan -Kalman-kello, Joseph-stabiloitu. Oraakkeli (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), jossa F on laskettu scipy.linalg.expm-funktiolla ja Q Van Loanin { "1978" } lohkomatriisilla — riippumaton viitetoteutus, joka toistaa koko Kshana-suodattimen liikeradan. Toteutusten välinen johdonmukaisuus: kellofysiikkaa / Allan-kalibrointia ei ole validoitu ulkoisesti, joten tämä jää tasolle MODELLED. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): IGS final { "30" } s -kelloilla, joita on { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Kelloavusteinen χ², RAIM, AGC, SQM yhdistettynä epookkikohtaiseksi tietoturvan laatumittariksi. Oraakkeli (ExternalDataset): TEXBAT-skenaarioparametrit (Humphreys { "2012" }) — luonnehdinta, ei kiinnitettyjä vektoreita. { "0.30" } ulkoinen vertailu, havainto (jää tasolle MODELLED): aineistolla JammerTest { "2024" } (Bleik; GPL-3.0-data) havaintotason monitorit (kelloavusteinen khiin neliö, RAIM, ratkaisun epäonnistuminen) eivät antaneet hälytystä { "10" } s kuluessa yhdestäkään { "8" } arvioitavissa olevasta julkaistusta harhautuksen alkamisesta (kun alkamista edeltävä ikkuna oli puhdas, ensimmäinen hälytys tuli { "10.2" }–{ "39" } s julk

seg-e12f672ae71d = Kellon holdover GNSS:n ollessa estetty on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Onboard-kellon tilan estimointi on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Harhautuksen (spoofing) havaitseminen on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-d291f20074f0 = <b>VALIDATED</b> Maan pyöriminen kaksiosaisesta UT1-Julian-päivämäärästä rataketjussa, joten Maan mukana pyörivä paikka säilyttää mikrosekunnin, jonka yksittäinen f64-päivämäärä menettää (noin { "3e-9" } rad lähellä vuotta { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventio, kahdelle osalle), cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän tyypin.

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP näkölinjageometriasta Q=(HᵀH)⁻¹ paikallisella ENU-jaolla. Oraakkeli (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — riippumaton kirjasto, täsmäytetty { "1e-6" } suhteelliseen tarkkuuteen

seg-53a78e98af12 = Aihesivu: <a1>SKYLINE.md</a1>

seg-ae15d15bf151 = Aihesivu: <a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = { "7" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat kohteessa <a1><c1/></a1>.

seg-0e3518dc3ddb = Lähde: <c1/>

seg-1428025a91e1 = <c1/> (skenaariotyyppi)

seg-cb4262b66b8f = GNSS-saatavuus + DOP kiertoratatähdistöstä (Walker / TLE / RINEX).

seg-97680b4587c8 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: skenaario bffc887db977 | 77/361 näytettä GNSS-nimellisiä | paras PDOP { "2.53" } paikka 2.53m | kvantti holdover 0s p95 6.49e-5ns eheys { "1.000" } turvallisuus n/a (ei hyökkäystä) | klassinen holdover 0s p95 25.0ns eheys { "1.000" } turvallisuus n/a (ei hyökkäystä)

seg-b3a080b98bd9 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c818cc4f87da = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-364139ff447d = Esimerkki <c1/> asettaa muun muassa:

seg-d5063dda3971 = Microchip SA.45s / SA65 -sirumittakaavan atomikello, sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = Moottorin kirjoittama kaavio skenaariolle scenarios/orbit-rinex.toml, tyyppi orbit

seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP näkölinjageometriasta kaavalla Q=(HᵀH)⁻¹ paikallisella ENU-jaolla Testit: <a1>dop_reference.rs</a1>.

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry ja check: siemenlukuun perustuva Monte Carlo (N = { "20,000" } epookkia geometriaa kohti, sigma = { "1.5" } m, ChaCha8-siemenluku { "36" } + i) moottorin omasta iteroidusta pienimmän neliösumman paikannuksesta (pvt::solve_spp, yksikköpainot, ratkaistu todellisesta paikasta) Testit: <a1>uere_dop_monte_carlo.rs</a1>.

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: satelliitin geodeettinen (WGS-84) atsimuutti ja korkeuskulma maa-asemalta, atsimuutissa lineaarisesti interpoloitu atsimuutti/korkeuskulma-maskitaulukko kierrolla kohdassa { "360" } astetta, näkyvä joukko el Testit: <a1>skyline_orekit_oracle.rs</a1>.

seg-d86884be3f98 = <s1>Edellinen</s1>optical-atmosphere

seg-da202333ae8d = <s1>Seuraava</s1>passes
