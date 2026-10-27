# docs--kind-terrain-nav: translations (fi)

seg-216efc4e6fba = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Vaihtoehtoinen PNT GPS:n estyessä</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-0df60ac6343f = <b>MODELLED</b> Painovoimakartan sovitus, maastoviitteinen (TERCOM/SITAN), magneettinen poikkeama. Oraakkeli (InternalConsistency): IGRF-14-kertoimet; ensiperiaatteista johdettu sovitetun suodattimen CRLB. Todellisen kentän painovoimabenchmarkin kenttä tarkistetaan ulkoisesti (rivi 'Gravity-anomaly synthesis from a spherical-harmonic model'), mutta sen navigointituloksella ei ole ulkoista oraakkelia

seg-d776abd5691c = Vaihtoehtoinen / täydentävä PNT on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Perhesivu: <a1>Vaihtoehtoinen PNT GPS:n estyessä</a1>

# text
# c1: docs/kinds/by-kind/terrain-nav.md
seg-1d36a7dc3fd0 = Lähde: <c1/>

# text
# c1: terrain-nav
seg-7bfd6d049799 = <c1/> (skenaariolaji)

# text
seg-0d7bf5a4f07e = GPS-denied-maastoon perustuva navigointi (TERCOM/SITAN): tutka- tai ilmanpainekorkeusmittari sovittaa maanpinnan korkeusprofiilin SRTM-tyyppiseen DEM:iin INS-ajautuman korjaamiseksi.

# text
# c1: scenarios/terrain-nav.toml
seg-54690375328b = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: terrain-nav | free-inertial drift { "70659" } m | terrain-matched { "53" } m (1342x cut) | matching sigma { "17.0" } m

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
seg-db286a072e43 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: refine_stages
# c2: refine_factor
# c3: noise_seed
seg-efc57f43bd6f = Valinnaiset kentät: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/terrain-nav.toml
seg-96e3607379e0 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# attr:alt
seg-c5e33c7122e2 = Moottorin kirjoittama kaavio skenaariolle scenarios/terrain-nav.toml, laji terrain-nav

# text
seg-0fcad0016c78 = <s1>Edellinen</s1>telecom-timing

# text
seg-fa50992f818f = <s1>Seuraava</s1>terrain-slam
