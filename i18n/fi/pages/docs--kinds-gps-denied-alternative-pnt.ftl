# docs--kinds-gps-denied-alternative-pnt: translations (fi)

seg-b03d56f501c3 = Tyyppi

seg-f496b7f4c63a = GPS:n estyessä toimiva yhdistetty painovoima + magneettikenttä + maasto -navigaattori: kolme skalaarikenttäkanavaa yhdistetään reittipisteittäin, jotta saadaan terävämpi (pienemmän CRLB:n) ajautumakorjaus kuin millään yksittäisellä kentällä.

seg-498b1aea3770 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/combined-altpnt.toml, skenaariotyyppi combined-altpnt

seg-c8f93431680a = MODELLED kerrostetun PNT:n konfliktinkestävyys (P7): kiistellyssä ympäristössä toimiva käyttäjä käyttää useita PNT-kerroksia (avoimen palvelun GNSS, laajakaista-GNSS, autentikoitu tähdistö, täydennysrele), joilla kullakin on perusasaatavuus, tarkkuus (1σ) ja vektorikohtainen estoalttius yhteiselle häirintä-/harhautusuhalle. Voimakkuuden mukaan pyyhkäisty SIEMENLUVULLINEN Monte Carlo estää jokaisen kerroksen todennäköisyydellä clamp(vulnerability·intensity·vector_weight,{ "0,1" }), yhdistää selviytyneet suljetun muodon käänteisvarianssisäännöllä σ_fused=(Σ 1/σ_i²)^(−1/2) ja raportoi kokonaismenetyksen todennäköisyyden (kaikki kerrokset estetty), yhdistetyn virheen mediaanin ja kerroskohtaiset käytettävyys-/estotilastot voimakkuuden funktiona. Keskeinen kestävyyssuhde (yksikerroksisen ja kerrostetun kokonaismenetyksen todennäköisyys) asettuu noin ~7x RIIPPUMATTOMUUSoletuksella; yksitekijäinen Gaussin kopulan korreloitu estopyyhkäisy osoittaa sitten, että tämä ~7x romahtaa kohti arvoa { "1" }, kun eston korrelaatio kasvaa (korrelaatio kumoaa kerrostamisen). Priorisensitiivisyyslohko vaihtelee keskeistä lukua LÄHTEISTETTYJEN alttiuspriorien yli mcda-tornadon + Dirichlet-uhkapanostuksen uudelleenjaon + persentiililuottamusvälien avulla. VALIDATED ydin: Monte Carlo -kokonaismenetys suppenee suljetun muodon riippumattomaan tuloon Π_i p_deny_i (MC-keskivirheen sisällä kiinteällä siemenluvulla ja suurella N:llä); käänteisvarianssiyhdistys on suljetun muodon identiteetti; kun ρ={ "0" }, kopula redusoituu riippumattomaksi malliksi ja jokainen ρ säilyttää kunkin kerroksen reunaestoasteen. MODELLED: kerroskohtaiset alttius-/saatavuus-/tarkkuusmagnitudit ovat lähteistettyjä mutta mallinnettuja syötteitä (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — ks. conflict_threat_params), ja tietty ~7x suuruus sekä suhde–korrelaatio-käyrän muoto seuraavat tästä parametrisoinnista. Sitten §{ "4.2" } vektorikohtainen selviytymisjaottelu purkaa yhteisen RF-uhan neljäksi nimetyksi vektoriksi (jamming/spoofing/kinetic/cyber) ja raportoi kunkin vektorin käytettävän PNT:n asteittaisen heikkenemisen käyrän S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: siemenluvullinen kerroskohtainen Monte Carlo suppenee tähän suljettuun muotoon; häirintä on terävin vektori korreloituneelle RF-lähtötasolle, ja RF-immuuni inertiakerros on ratkaiseva selviytyjä. Ei sertifioitu navigoinnin saatavuustuote.

seg-4dd2bcc206db = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/conflict-resilience.toml, skenaariotyyppi conflict-resilience

seg-9a58a7b09423 = GPS:n estyessä toimiva painovoimakartan sovitusnavigointi: kylmäatomigravimetri palauttaa vakioisen INS-ajautuman painovoimapoikkeamasarjasta, jonka läpi se lentää.

seg-c42d90057e9f = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/gravity-map-nav.toml, skenaariotyyppi gravity-map

# text
seg-0d7bf5a4f07e = GPS-denied-maastoon perustuva navigointi (TERCOM/SITAN): tutka- tai ilmanpainekorkeusmittari sovittaa maanpinnan korkeusprofiilin SRTM-tyyppiseen DEM:iin INS-ajautuman korjaamiseksi.

# attr:alt
seg-c5e33c7122e2 = Moottorin kirjoittama kaavio skenaariolle scenarios/terrain-nav.toml, laji terrain-nav

# text
seg-6bdc150ab25b = GPS-denied-peräkkäinen (rekursiivinen) maastoon perustuva navigointi: partikkelisuodatin ajaa maastosovituksen mittausmallia epookki kerrallaan (SITAN käynnissä olevana suodattimena), jolloin ajassa muuttuva INS-ajautuma seurataan reitin varrella, kun taas eräajona toimiva terrain-nav palauttaa vain yhden vakiopoikkeaman.

# attr:alt
seg-4aca87f022dc = Moottorin kirjoittama kaavio skenaariolle scenarios/terrain-slam.toml, laji terrain-slam

# text
seg-4e31c8daf798 = Kirjanpito

# text
seg-efd15cff3d32 = MODELLED (tuloksen tunniste)

# text
# c1: docs/kinds/gps-denied-alternative-pnt.md
seg-9d9aeff4f2ee = Lähde: <c1/>

# text
seg-d9fdaf3208ca = GPS-denied-vaihtoehtoinen PNT (skenaariolajiperhe)

# text
seg-9fde6af9e09f = { "5" } skenaariolajia, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
# c1: kshana scenarios/combined-altpnt.toml
seg-0d3b170b9fbc = Aihesivut: <a1>CAPABILITY</a1>, <a2>RESILIENCE-CROSSWALK</a2>. Aja yksi: <c1/>. Kaikki perheet: <a3>KINDS.md</a3>.

# attr:alt
seg-6dfd2dc2721a = Kuvakooste moottorin kirjoittamista kaavioista perheen GPS-denied-vaihtoehtoinen PNT lajeille

# text
seg-cff60d8c17d2 = GPS-denied-peräkkäinen (rekursiivinen) maastoon perustuva navigointi: partikkelisuodatin ajaa maastosovituksen mittausmallia epookki kerrallaan (SITAN käynnissä olevana suodattimena), jolloin ajassa muuttuva INS-ajautuma seurataan

# text
seg-9d8f69b51742 = MODELLED kerroksellisen PNT:n konfliktikestävyys (P7): kiistellyn ympäristön käyttäjällä on useita PNT-kerroksia (avoimen palvelun GNSS, laajakaistainen GNSS, autentikoitu satelliittitähdistö, augmentaatioreleen), kullakin

# text
# c1: nmax
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: gravimeter_asd
# c10: averaging_time_s
# c11: map_sigma_mgal
# c12: search_half_deg
# c13: search_step_deg
# c14: coeffs
# c15: mascons
# c16: refine_stages
# c17: refine_factor
# c18: noise_seed
# c19: reference
# c20: map_error_mc
seg-28486745bb43 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>. Valinnaiset: <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>.

# text
seg-c2187e8291f9 = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>gravity-map</a1>.

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_lat_deg
# c8: drift_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: search_half_deg
# c12: search_step_deg
# c13: refine_stages
# c14: refine_factor
# c15: noise_seed
seg-b1ff6f0e1769 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>. Valinnaiset: <c13/>, <c14/>, <c15/>.

# text
# c1: dem_seed
# c2: start_lat_deg
# c3: start_lon_deg
# c4: step_lat_deg
# c5: step_lon_deg
# c6: waypoints
# c7: drift_rate_lat_deg
# c8: drift_rate_lon_deg
# c9: altimeter_sigma_m
# c10: map_sigma_m
# c11: n_particles
# c12: init_pos_sigma_deg
# c13: process_sigma_deg
# c14: resample_ess_frac
# c15: seed
seg-3ec7b38184b7 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valinnaiset: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-7c777178ee8f = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>terrain-slam</a1>.

# text
# c1: start_lat_deg
# c2: start_lon_deg
# c3: step_lat_deg
# c4: step_lon_deg
# c5: waypoints
# c6: drift_lat_deg
# c7: drift_lon_deg
# c8: search_half_deg
# c9: search_step_deg
# c10: nmax
# c11: gravity_sigma_mgal
# c12: igrf_year
# c13: magnetic_sigma_nt
# c14: dem_seed
# c15: terrain_sigma_m
# c16: coeffs
# c17: mascons
# c18: magnetic_mascons
# c19: igrf_alt_km
# c20: refine_stages
# c21: refine_factor
# c22: noise_seed
# c23: magnetic_grid
seg-c5124441822e = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>. Valinnaiset: <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>.

# text
seg-d78bd011956c = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>combined-altpnt</a1>.

# text
# c1: layers
# c2: intensity
# c3: correlation
# c4: trials
# c5: seed
# c6: primary_layer
seg-2d95ddbf01c4 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-ab895b157152 = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>conflict-resilience</a1>.

# text
seg-c0ef7d676ec1 = <s1>Edellinen</s1>GNSS-mittaukset, paikannus ja eheys

# text
seg-54b45b00a2f0 = <s1>Seuraava</s1>Inertia-anturit, fuusio ja kvanttianturit
