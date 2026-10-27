# docs--kind-tracking-loop: translations (fi)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-b054c73f22e5 = ei arvoa

seg-59afd80736c5 = <b>PARTNER</b> Ei tarjota — Kshana mallintaa signaalin suorituskykyä, ei hyötykuorma- tai antennilaitteistoa. Oraakkeli (NoneKind): ei mitään: kumppanin omistama osa-alue, jolla ei ole moduulia eikä testiä tarkoituksella

seg-a3697ad561db = Hz

seg-304496607bd7 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-5d23d7f8f872 = Perhesivu: <a1>Häirintä (jamming), harhautus (spoofing) ja spektri</a1>

seg-edcd55ccc993 = <b>MODELLED</b> Raportti <c1/> ei enää nojaa kieltokäyräänsä yhteen skalaariin.

seg-05e8854de548 = chip

# text
# c1: docs/kinds/by-kind/tracking-loop.md
seg-4f57723d340e = Lähde: <c1/>

# text
# c1: tracking-loop
seg-e84aabe07c43 = <c1/> (skenaariolaji)

# text
seg-f6ff1c8c78db = Seurantasilmukan lukituksen menetys: C/N0 -> lukitus/lukituksen purkautuminen HYSTEREESILLÄ, aika lukituksen menetykseen sekä harhautuslähettimen sisäänveto koodin ja kantoaallon poikkeaman NOPEUDEN funktiona. Moottorin nykyiset estämis- ja kaappauskriteerit ovat suhteita vastaanotetulle teholle (häirintälähetin estää arvolla J/S = { "30" } dB, harhautuslähetin kaappaa arvolla { "3" } dB); todellinen lukituksen menetys ei ole tehosuhde, vaan se on kohta, jossa silmukan värinä ja dynaaminen rasitus ylittävät sen seurantakynnysbudjetin. Raportoi ({ "1" }) kantoaallon (Costas) ja koodin (ei-koherentti early/late) 1-sigma-terminen värinä suhteessa C/N0:aan, neliöintihäviö mukaan lukien, ilmoitettuja sääntöjä { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15 asteen sääntö kolmen sigman muodossa) ja { "3" }</em>sigma_DLL + ramp lag <= d/2 chips vastaan; ({ "2" }) pudotus- ja uudelleenlukitus-C/N0-kynnykset, joissa sitova silmukka nimetään, uudelleenlukituskynnys JOHDETTU leveämmästä kaistanleveydestä, jolla vastaanotin vetää sisään uudelleen, eikä väitetty, joten hystereesin leveyden on osuttava välille { "5" }<em>log10(ratio) ja { "10" }</em>log10(ratio) dB; ({ "3" }) ilmoitettu aika lukituksen menetykseen kahden kynnyksen lukitusilmaisimesta, jossa on vahvistusviipymät ja jota ajetaan C/N0-ramppina, raportoituna erikseen fysikaalisesta vaiheen pakenemisajasta (Viterbin keskimääräinen aika syklihyppyjen välillä, log10 s:ssa, koska se kattaa satoja dekadeja); ({ "4" }) harhautuksen sisäänvedon rajat — suurin koodin liukuma ja kantoaallon Doppler-nopeus, joita uhrin silmukat voivat seurata, kartalla molempien akselien yli, koska harhautuslähetin, joka liukuu näitä nopeammin, ei kaappaa silmukkaa vaan ohittaa sen; ja ({ "5" }) silmukan dynamiikan implikoima ESTOSÄDE raportoituna OLEMASSA OLEVAN tehosuhdesäteen RINNALLA, ei koskaan sen tilalla, niiden etumerkillinen erotus omana nimettynä kenttänään (denial_radius_delta_km) ja määritelmä sen vieressä. Jokaisella emittoidulla numeerisella kentällä on yksikkö ja alkuperäluokka. VALIDATED suljetut muodot: kantoaallon ja koodin värinälausekkeet, silmukkasuodattimen pelkistys sqrt({ "2" }<em>B_n</em>T) ja ensimmäisen kertaluvun ramppiviive on ristiintarkistettu moottorin oman sdr-korrelaattorin kanssa, jota on askellettu eteenpäin siemenlukuun sidotulla synteettisellä IF:llä — eri reitti samoihin lukuihin — tarkkuuksilla { "0.6" } %, { "3.7" } % ja { "0.17" } % vastaavasti, ja syklihyppyaikaa taustalla oleva modifioitu Bessel I0 tavallisia taulukoituja arvoja vastaan tarkkuudella { "1e-7" }. Alempi pätevyysraja on väitetty, ei vain ilmoitettu: alle ~{ "32" } dB-Hz arvolla { "1" } ms todellinen atan-diskriminaattori kyllästyy +-pi/2-alueeseensa ja mittaa vähemmän värinää kuin mikään lineaarinen teoria. MODELLED: silmukkakaistanleveydet, integrointiaika, korrelaattorin väli, sisäänvedon kaistanleveyssuhde, vahvistusviipymät, häirintälähettimen teho ja antennivahvistukset ovat edustavia kaistaluvuja, eivät tietolehti. EI mallinneta: oskillaattorin (Allanin poikkeama) ja tärinän värinä, etupään kaistanleveyden rajoitus, monitie-eteneminen, AGC:n dynamiikka, databittisiirtymän häviö, ulkoinen avustus sekä mikä tahansa puolisyklin korjaus Costas-syklihyppykaavaan. Silmukan dynamiikan alla harhautuksen kaappauksella ei ole lainkaan sädettä — sitova rajoite on poikkeaman nopeus, ei teho — joten se kenttä on null ja sille annetaan syy, eikä keksittyä lukua. Ei sertifioitu vastaanottimen suorituskykytuote.

# text
# c1: scenarios/tracking-loop.toml
seg-62d230dfccce = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chip -> drop { "25.4744" } dB-Hz (carrier binds), relock { "27.4413" } dB-Hz, hysteresis { "1.9669" } dB | loss of lock declared { "39.101" } s into the ramp | denial radius threshold(J/S { "30" } dB) { "127.413" } km vs loop dynamics { "53.1694" } km, delta -74.2438 km | spoof pull-in <= { "0.966" } chip/s code and { "41.45" } Hz/s carrier (MODELLED loop, VALIDATED closed forms)

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-7614718317f4 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

# text
# c1: scenarios/tracking-loop.toml
seg-41162ed2743b = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-773fff0feaf7 = bracketed

# text
seg-23f3aa5c2064 = Tuloksen tunniste (moottorin oma): MIXED — VALIDATED silmukan suljetut muodot, MODELLED silmukan kokoonpano. Kantoaallon ja koodin termisen värinän lausekkeet, silmukkasuodattimen pelkistys sqrt({ "2" }<em>B_n</em>T) ja ensimmäisen kertaluvun ramppiviive on ristiintarkistettu moottorin oman sdr-korrelaattorin kanssa, jota on askellettu eteenpäin siemenlukuun sidotulla synteettisellä IF:llä (eri reitti

# attr:alt
seg-72182c1aecd9 = Moottorin kirjoittama kaavio skenaariolle scenarios/tracking-loop.toml, laji tracking-loop

# text
seg-346594a654f2 = <b>MODELLED</b> Lukituksen menetys laskettuna silmukan dynamiikasta tehosuhteen sijaan: kantoaallon (Costas) ja koodin (ei-koherentti early/late) 1σ:n terminen värinä suhteessa C/N₀:aan neliöintihäviön kanssa, ilmoitettuja sääntöjä 3σ_PLL + θ_e ≤ { "45" }° ja 3σ_DLL + ramp lag vastaan

# text
seg-3aa7f9748dc2 = <b>MODELLED</b> Lukituksen menetys laskettuna silmukan dynamiikasta tehosuhteen sijaan: kantoaallon (Costas) ja koodin (ei-koherentti early/late) 1σ:n terminen värinä suhteessa C/N₀:aan s:n kanssa. Oraakkeli (ReferenceImpl): Moottorin oma sdr-korrelaattori (sdr::correlate / synth_if / CaCode), jota on askellettu eteenpäin siemenlukuun sidotulla synteettisellä IF:llä kalibroidulla C/N₀:lla — erillinen koodipolku, joka saavuttaa samat luvut näytteistetyn IQ:n numeerisella korrelaatiolla algebrallisen värinälausekkeen sijaan, joten se on eri reitti eikä uudelleenmuotoilu — sekä tavalliset taulukoidut modifioidun Besselin I₀:n arvot syklihyppytermille. Silmukkateoria lähteen Kaplan & Hegar mukaan

# text
# c1: label
seg-de048f9cf1f6 = MIXED — VALIDATED silmukan suljetut muodot, MODELLED silmukan kokoonpano. Kantoaallon ja koodin termisen värinän lausekkeet, silmukkasuodattimen pelkistys sqrt({ "2" }<em>B_n</em>T) ja ensimmäisen kertaluvun ramppiviive on ristiintarkistettu moottorin oman sdr-korrelaattorin kanssa, jota on askellettu eteenpäin siemenlukuun sidotulla synteettisellä IF:llä (eri reitti samoihin lukuihin), ja modifioitu Bessel I0 tavallisia taulukoituja arvoja vastaan. MODELLED: silmukkakaistanleveydet, integ (tulos <c1/>)

# text
# c1: kshana kinds --json
seg-0dc70b7607f0 = MODELLED: silmukkakaistanleveydet, integrointiaika, korrelaattorin väli, sisäänvedon kaistanleveyssuhde, vahvistusviipymät, häirintälähettimen teho ja antennivahvistukset ovat edustavia kaistaluvuja, eivät tietolehti. (lajiluettelo (<c1/>))

# text
# c1: kshana kinds --json
seg-a679a9732b2a = EI mallinneta: oskillaattorin (Allanin poikkeama) ja tärinän värinä, etupään kaistanleveyden rajoitus, monitie-eteneminen, AGC:n dynamiikka, databittisiirtymän häviö, ulkoinen avustus sekä mikä tahansa puolisyklin korjaus Costas-syklihyppykaavaan. (lajiluettelo (<c1/>))

# text
seg-f8d50cbc6f2c = Jokainen alla oleva silmukkaparametri on MODELLED edustava kaistaluku, ei tietolehti. (skenaariotiedoston kommentti, rivi { "22" })

# text
seg-9241a57823cd = --- silmukan geometria ----------------------------------------------------------------- { "10" } Hz:n Costas-kantoaaltosilmukka ja { "1" } Hz:n kantoaaltoavusteinen koodisilmukka, { "1" } ms koherentti integrointi (yksi C/A-koodijakso, joten databittisynkronointia ei oleteta), kapea { "0.5" } chipin korrelaattori. (skenaariotiedoston kommentti, rivit { "25" }–{ "28" })

# text
seg-3a677e343081 = Seurantasilmukan lukituksen menetys ja harhautuksen sisäänveto häiriössä on MODELLED, ei validoitu: tarkistettu erillistä toteutusta vastaan samassa koodikannassa, joka on riippumaton testattavasta yksiköstä mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-e3a8f20108f3 = <s1>Edellinen</s1>timetransfer
