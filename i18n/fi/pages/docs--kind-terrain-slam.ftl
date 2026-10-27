# docs--kind-terrain-slam: translations (fi)

seg-216efc4e6fba = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Vaihtoehtoinen PNT GPS:n estyessä</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-0df60ac6343f = <b>MODELLED</b> Painovoimakartan sovitus, maastoviitteinen (TERCOM/SITAN), magneettinen poikkeama. Oraakkeli (InternalConsistency): IGRF-14-kertoimet; ensiperiaatteista johdettu sovitetun suodattimen CRLB. Todellisen kentän painovoimabenchmarkin kenttä tarkistetaan ulkoisesti (rivi 'Gravity-anomaly synthesis from a spherical-harmonic model'), mutta sen navigointituloksella ei ole ulkoista oraakkelia

seg-d776abd5691c = Vaihtoehtoinen / täydentävä PNT on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Perhesivu: <a1>Vaihtoehtoinen PNT GPS:n estyessä</a1>

# text
# c1: docs/kinds/by-kind/terrain-slam.md
seg-bb7c9c4d4b5d = Lähde: <c1/>

# text
# c1: terrain-slam
seg-562e59d703e3 = <c1/> (skenaariolaji)

# text
seg-6bdc150ab25b = GPS-denied-peräkkäinen (rekursiivinen) maastoon perustuva navigointi: partikkelisuodatin ajaa maastosovituksen mittausmallia epookki kerrallaan (SITAN käynnissä olevana suodattimena), jolloin ajassa muuttuva INS-ajautuma seurataan reitin varrella, kun taas eräajona toimiva terrain-nav palauttaa vain yhden vakiopoikkeaman.

# text
# c1: scenarios/terrain-slam.toml
seg-1e4350c2c5f0 = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: terrain-slam | { "60" } waypoints | free-inertial RMS { "2947" } m (final { "5082" } m) | terrain-matched RMS { "1241" } m (final { "69" } m, 2x cut) | mean ESS 2599/4000 | matching sigma { "17.0" } m

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
seg-939d877137f6 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: n_particles
# c2: init_pos_sigma_deg
# c3: process_sigma_deg
# c4: resample_ess_frac
# c5: seed
seg-5ceb5b8597ac = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/terrain-slam.toml
seg-48e022b0945e = Esimerkki <c1/> asettaa muun muassa seuraavat:

# attr:alt
seg-4aca87f022dc = Moottorin kirjoittama kaavio skenaariolle scenarios/terrain-slam.toml, laji terrain-slam

# text
seg-832919783819 = <s1>Edellinen</s1>terrain-nav

# text
seg-1693abd546fe = <s1>Seuraava</s1>time-transfer-budget
