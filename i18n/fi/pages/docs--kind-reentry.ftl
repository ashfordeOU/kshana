# docs--kind-reentry: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-3a3ee499961e = <b>MODELLED</b> Monivaiheisen kantoraketin tasomainen painovoimakäännöksellä tehty nousu pyörimättömän pallomaisen Maan yllä US Standard Atmosphere { "1976" } -ilmakehän läpi (tiheys ja paine), pitch-potkulla, suuttimen vastapaineen vähentämällä työntövoimalla, vaiheiden polttoloput täsmällisillä s

seg-8e62cc4af6ea = Aihesivu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

# text
# c1: docs/kinds/by-kind/reentry.md
seg-c95aec0d2943 = Lähde: <c1/>

# text
# c1: reentry
seg-91424dc65b3e = <c1/> (skenaariolaji)

# text
seg-039f77066d97 = Allen–Eggers-tyyppinen ballistinen ilmakehään paluun käytävä: huippuhidastuvuus (ballistisesta kertoimesta riippumaton, V_e^{ "2" } sin|γ|/(2eH)), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämmityksen nopeus, kun annetaan paluunopeus, lentoratakulma ja ballistinen kerroin eksponentiaalisen ilmakehän läpi, sekä saman ballistisen paluun tasomainen pistemassaintegrointi, jossa on mukana painovoima, Maan kaarevuus ja US Standard Atmosphere { "1976" } (huippuhidastuvuus, nopeus, korkeus ja aika huipun kohdalla). MODELLED ballistinen (nostoton) paluu; lämmitystuloste on huippulämmityksen NOPEUS, ei lämpövuo (ei aerotermistä eikä TPS-mallia).

# text
# c1: scenarios/reentry.toml
seg-9908d06c50eb = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> peak { "16.6" } g at { "49" } km, { "4731" } m/s; heating peaks at { "6603" } m/s; point mass (gravity, curvature, US76) peak { "16.4" } g (MODELLED ballistic, no aerothermal)

# text
# c1: entry_velocity_m_s
# c2: flight_path_angle_deg
# c3: ballistic_coeff_kg_m2
# c4: scale_height_m
# c5: rho0_kg_m3
# c6: entry_interface_altitude_m
seg-f057c2a160e7 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/reentry.toml
seg-576245fd5b70 = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-0b7769c97ff3 = Tuloksen tunniste (moottorin oma): MODELLED — Allen–Eggers-tyyppinen ballistinen (nostoton) paluu, eksponentiaalinen isoterminen ilmakehä, vakio lentoratakulma; huippu-g ei riipu ballistisesta kertoimesta; lämmitys on huippulämmityksen NOPEUS, EI lämpövuo (ei aerotermistä eikä TPS-mallia)

# attr:alt
seg-b0109481e8ff = Moottorin kirjoittama kaavio skenaariolle scenarios/reentry.toml, laji reentry

# text
seg-c860b8679b47 = <b>MODELLED</b> Huippuhidastuvuus (ballistisesta kertoimesta riippumaton), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämmityksen nopeus eksponentiaalisen ilmakehän ballistiselle paluulle. Testit: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

# text
seg-84abc0b9f859 = <b>MODELLED</b> Huippuhidastuvuus (ballistisesta kertoimesta riippumaton), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämmityksen nopeus eksponentiaalisen ilmakehän ballistiselle paluulle. R. Oraakkeli (InternalConsistency): Suljetun muodon Allen–Eggers-analyyttinen paluu, lisäksi ristiintarkistettu scipy { "1.18" } solve_ivp (DOP853) -numeerista integrointia vastaan SAMASTA vain vastusta sisältävästä paluun differentiaaliyhtälöstä (tests/ballistic_re_entry_corridor_reference.rs, { "36" } tapausta, pahin a_max rel { "2.9e-9" }) — tarkistus numeerinen integraali vastaan oma analyyttinen muoto, joten edelleen InternalConsistency, EI ulkoinen validointi. MODELLED ballistinen (ei nostoa), ei aerotermistä/TPS-mallia — lämmitystuloste on nopeu

# text
# c1: label
seg-8b9d3db5d563 = MODELLED — Allen–Eggers-tyyppinen ballistinen (nostoton) paluu, eksponentiaalinen isoterminen ilmakehä, vakio lentoratakulma; huippu-g ei riipu ballistisesta kertoimesta; lämmitys on huippulämmityksen NOPEUS, EI lämpövuo (ei aerotermistä eikä TPS-mallia) (tulos <c1/>)

# text
# c1: kshana kinds --json
seg-82de2275c919 = MODELLED ballistinen (nostoton) paluu; lämmitystuloste on huippulämmityksen NOPEUS, ei lämpövuo (ei aerotermistä eikä TPS-mallia). (lajiluettelo (<c1/>))

# text
seg-080b28422342 = REHELLINEN RAJAUS: MODELLED ballistinen (nostoton), eksponentiaalinen isoterminen ilmakehä, vakio lentoratakulma. Ei aerotermistä eikä TPS-mallia -- lämmitystuloste on huippulämmityksen NOPEUS, ei lämpövuo. Ei 3-/6-vapausasteen lentorataa. Ajo: kshana scenarios/reentry.toml (skenaariotiedoston kommentti, rivit { "8" }–{ "11" })

# text
seg-cfc345f0dc0d = Ballistinen paluukäytävä (Allen–Eggers) on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon eli analyyttistä identiteettiään vastaan — se paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-a4b7c16e3fea = <s1>Edellinen</s1>realtime-frame-eop

# text
seg-6166a1c21525 = <s1>Seuraava</s1>slot-timing

seg-33b3bf4992c9 = <b>MODELLED</b> Vaihe <c1/>: lajin <c2/> paluurannikko ilman polttoa, päättyen ilmakehän tulorajapintaan; lentoratakulma ja sen sigma täydestä kovarianssista differenssigradientilla; todennäköisyys, että kulma on määritellyn
