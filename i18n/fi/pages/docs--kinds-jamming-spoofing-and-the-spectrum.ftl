# docs--kinds-jamming-spoofing-and-the-spectrum: translations (fi)

seg-b03d56f501c3 = Tyyppi

seg-98e740d32860 = Koneoppimiseen perustuvan RF-häiriöiden havaitsemisen arviointitestialusta ({ "13494" }): generoi merkitty, parametriperusteinen SYNTEETTINEN korpus (nominal/jamming/spoof-time/spoof-position/multipath), pisteytä ilmaisin (energy|agc|sqm|parity|fused) ilmaisimesta riippumattomalla arviointikehyksellä ja raportoi AUC/ROC/sekaannusmatriisi + luokkakohtainen Pd tavoite-Pfa:lla sekä jakaumansisäisen ja jakaumanulkoisen optimismiaukon. Vain MODELLED toimintaominaisuudet — ei koskaan kenttä-/IQ-dataa, ei hyvä/huono-päätöstä.

seg-7e7b07bc5545 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/impairment-eval.toml, skenaariotyyppi impairment-eval

seg-60bf3f0ff000 = Häirintä linkkibudjetilla: J/S → tehollinen C/N₀ → lukituksen menetys.

seg-42d46b928d09 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/jamming-demo.toml, tyyppi jamming

# text
seg-fef00c827c6a = L-kaistan spektrimalli ja vesiputous: koko GNSS:n L-kaista yhtenä tehospektritiheytenä (PSD), taajuus vaakasuunnassa ja aika alaspäin, käsikirjoitetun häirintälähettimien aikajanan yli. SIGNAALIT: GPS L1 C/A ja L2C (BPSK({ "1" })), Galileo E1 open service (MBOC(6,1,1/11) tai BOC({ "1,1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), kukin kantoaallollaan rajapintamäärittelyn vähimmäisvastaanottotehoilla (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), ellei toisin ohiteta; GLONASSia, BeiDouta ja Galileo E6:tä ei mallinneta. HÄIRINTÄLÄHETTIMET: jatkuva siniaaltoääni, tasainen kapeakaistainen kohina, lineaarinen saha-aaltochirppi ja kaistan oman modulaation mukainen laajakaistakohina, kullakin keskitaajuus, kaistanleveys, vastaanotettu teho (suoraan tai EIRP ja etäisyys jamming-lajin vapaan tilan vaimennuksen kautta) sekä päälle- ja poiskytkentäajat. Jokainen häirintälähetin pisteytetään jokaista kaistaa vastaan spektrierotuskertoimellaan kappa vastaanottimen kaistanleveyden yli, ja (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; yhdelle häirintälähettimelle tämä on sama kuin jamming-lajin häirinnänestoyhtälö, kun Q = 1/(R_c kappa), ja raportti sisältää tämän ristiintarkistuksen (sekä jamming-lajin edustavan Q-arvon vieressä). Kohinalattia on k T_sys, kun T_sys = T_ant + { "290" } K (F - { "1" }). Vesiputous keskiarvoistaa jokaisen solun sen lokeron ja rivin yli (chirppien osalta tarkasti, kokonaiset pyyhkäisyt ja osittainen; rivin aikana kytkeytyvät häirintälähettimet työsuhteensa mukaan), joten C/N0-aikajana ja kuva tulevat samoista luvuista; result.json sisältää tehoissa lohkokeskiarvoistetun ruudukon, kaistakohtaiset C/N0:n ja J/S:n riveittäin sekä häirintälähetintä ja kaistaa kohden SSC:n, Q:n, J/S:n, kaistansisäisen J/S:n ja vakaan C/N0:n. Valinnainen [iq]: malli piirrettynä kompleksisena IQ:na yhdellä hetkellä, kirjoitettuna SigMF-tallenteeseen (cf32_le tai ci16_le) ja luettuna siitä takaisin sekä verrattuna Welch-estimaattiin. Valinnainen [recording] (natiivirakennelmat): oikean SigMF-tallenteen Welch-PSD mallin vieressä. VALIDATED: signaalien PSD:t oppikirjojen pääkeilan leveyksiä vastaan (BPSK(n) 2n x { "1.023" } MHz nollasta nollaan; BOC({ "1,1" })-keilat keskitettyinä kohtiin +/-1.023 MHz) ja spektrierotuskertoimet Parsevalin suljettuja muotojaan sekä Kaplanin ja Hegartyn arvoja Q = { "1" } (CW) ja { "1.5" } (sovitettu) vastaan. MODELLED: häirintälähettimien tehot, aikajana, etupään kaistanleveydet, jatkuvaspektrinen (ei koodiviivoja) käsittely sekä AGC:n, blankkauksen ja antennikuvion puuttuminen.

# attr:alt
seg-ea1678eb9e84 = Moottorin kirjoittama kaavio skenaariolle scenarios/l-band-waterfall-jamming.toml, laji spectrum

# text
seg-f43fe94d84e0 = Yhdistetty RF-/mittaushavaintoihin perustuva harhautuksen ilmaisin (usean SV:n RAIM-johdonmukaisuus + AGC + SQM, fuusioituna) parametroitua hyökkäystä vastaan (tehoetu, kantoaallon vaiheen kohdistus, aika-/paikkatyöntö; TEXBAT-tyylinen).

# attr:alt
seg-268ebf4cba99 = Moottorin kirjoittama kaavio skenaariolle scenarios/spoof-detect.toml, laji spoof-detect

# text
seg-cbd77f6ffd63 = Stokastinen ajanharhautuksen ilmaisin (Neyman–Pearson / χ²₁) Monte Carlo -P_fa/P_md:llä.

# attr:alt
seg-6f6a8c975111 = Moottorin kirjoittama kaavio skenaariolle scenarios/spoof-attack.toml, laji spoof

# text
seg-f6ff1c8c78db = Seurantasilmukan lukituksen menetys: C/N0 -> lukitus/lukituksen purkautuminen HYSTEREESILLÄ, aika lukituksen menetykseen sekä harhautuslähettimen sisäänveto koodin ja kantoaallon poikkeaman NOPEUDEN funktiona. Moottorin nykyiset estämis- ja kaappauskriteerit ovat suhteita vastaanotetulle teholle (häirintälähetin estää arvolla J/S = { "30" } dB, harhautuslähetin kaappaa arvolla { "3" } dB); todellinen lukituksen menetys ei ole tehosuhde, vaan se on kohta, jossa silmukan värinä ja dynaaminen rasitus ylittävät sen seurantakynnysbudjetin. Raportoi ({ "1" }) kantoaallon (Costas) ja koodin (ei-koherentti early/late) 1-sigma-terminen värinä suhteessa C/N0:aan, neliöintihäviö mukaan lukien, ilmoitettuja sääntöjä { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15 asteen sääntö kolmen sigman muodossa) ja { "3" }</em>sigma_DLL + ramp lag <= d/2 chips vastaan; ({ "2" }) pudotus- ja uudelleenlukitus-C/N0-kynnykset, joissa sitova silmukka nimetään, uudelleenlukituskynnys JOHDETTU leveämmästä kaistanleveydestä, jolla vastaanotin vetää sisään uudelleen, eikä väitetty, joten hystereesin leveyden on osuttava välille { "5" }<em>log10(ratio) ja { "10" }</em>log10(ratio) dB; ({ "3" }) ilmoitettu aika lukituksen menetykseen kahden kynnyksen lukitusilmaisimesta, jossa on vahvistusviipymät ja jota ajetaan C/N0-ramppina, raportoituna erikseen fysikaalisesta vaiheen pakenemisajasta (Viterbin keskimääräinen aika syklihyppyjen välillä, log10 s:ssa, koska se kattaa satoja dekadeja); ({ "4" }) harhautuksen sisäänvedon rajat — suurin koodin liukuma ja kantoaallon Doppler-nopeus, joita uhrin silmukat voivat seurata, kartalla molempien akselien yli, koska harhautuslähetin, joka liukuu näitä nopeammin, ei kaappaa silmukkaa vaan ohittaa sen; ja ({ "5" }) silmukan dynamiikan implikoima ESTOSÄDE raportoituna OLEMASSA OLEVAN tehosuhdesäteen RINNALLA, ei koskaan sen tilalla, niiden etumerkillinen erotus omana nimettynä kenttänään (denial_radius_delta_km) ja määritelmä sen vieressä. Jokaisella emittoidulla numeerisella kentällä on yksikkö ja alkuperäluokka. VALIDATED suljetut muodot: kantoaallon ja koodin värinälausekkeet, silmukkasuodattimen pelkistys sqrt({ "2" }<em>B_n</em>T) ja ensimmäisen kertaluvun ramppiviive on ristiintarkistettu moottorin oman sdr-korrelaattorin kanssa, jota on askellettu eteenpäin siemenlukuun sidotulla synteettisellä IF:llä — eri reitti samoihin lukuihin — tarkkuuksilla { "0.6" } %, { "3.7" } % ja { "0.17" } % vastaavasti, ja syklihyppyaikaa taustalla oleva modifioitu Bessel I0 tavallisia taulukoituja arvoja vastaan tarkkuudella { "1e-7" }. Alempi pätevyysraja on väitetty, ei vain ilmoitettu: alle ~{ "32" } dB-Hz arvolla { "1" } ms todellinen atan-diskriminaattori kyllästyy +-pi/2-alueeseensa ja mittaa vähemmän värinää kuin mikään lineaarinen teoria. MODELLED: silmukkakaistanleveydet, integrointiaika, korrelaattorin väli, sisäänvedon kaistanleveyssuhde, vahvistusviipymät, häirintälähettimen teho ja antennivahvistukset ovat edustavia kaistaluvuja, eivät tietolehti. EI mallinneta: oskillaattorin (Allanin poikkeama) ja tärinän värinä, etupään kaistanleveyden rajoitus, monitie-eteneminen, AGC:n dynamiikka, databittisiirtymän häviö, ulkoinen avustus sekä mikä tahansa puolisyklin korjaus Costas-syklihyppykaavaan. Silmukan dynamiikan alla harhautuksen kaappauksella ei ole lainkaan sädettä — sitova rajoite on poikkeaman nopeus, ei teho — joten se kenttä on null ja sille annetaan syy, eikä keksittyä lukua. Ei sertifioitu vastaanottimen suorituskykytuote.

# attr:alt
seg-72182c1aecd9 = Moottorin kirjoittama kaavio skenaariolle scenarios/tracking-loop.toml, laji tracking-loop

# text
seg-4e31c8daf798 = Kirjanpito

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-63c3a7483268 = { "6" } skenaariolajia, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
# c1: docs/kinds/jamming-spoofing-and-the-spectrum.md
seg-f6a18b7cb172 = Lähde: <c1/>

# text
seg-d4ae70a5d619 = Häirintä, harhautus ja spektri (skenaariolajiperhe)

# text
# c1: kshana scenarios/jamming-demo.toml
seg-b4b8b72e060b = Aihesivut: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Aja yksi: <c1/>. Kaikki perheet: <a4>KINDS.md</a4>.

# attr:alt
seg-cc031b964086 = Kuvakooste moottorin kirjoittamista kaavioista perheen Häirintä, harhautus ja spektri lajeille

# text
seg-bbbd87f888b9 = Seurantasilmukan lukituksen menetys: C/N0 -> lukitus/lukituksen purkautuminen HYSTEREESILLÄ, aika lukituksen menetykseen sekä harhautuslähettimen sisäänveto koodin ja kantoaallon poikkeaman NOPEUDEN funktiona.

# text
seg-e37f1e071b2c = L-kaistan spektrimalli ja vesiputous: koko GNSS:n L-kaista yhtenä tehospektritiheytenä (PSD), taajuus vaakasuunnassa ja aika alaspäin, käsikirjoitetun häirintälähettimien aikajanan yli.

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
seg-8887d666b4fc = Koneoppimiseen perustuvan RF-häiriöiden havaitsemisen arviointitestialusta ({ "13494" }): luo nimetty, parametreihin perustuva SYNTEETTINEN korpus (nominal/jamming/spoof-time/spoof-position/multipath), pisteytä ilmaisin (energy/agc/s

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: jammer
# c6: mask_deg
# c7: tracking_threshold_dbhz
# c8: degraded_margin_db
# c9: signal_power_dbw
# c10: temp_k
# c11: freq_hz
# c12: chip_rate_hz
# c13: skyline
seg-f6dcb5b36454 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>. Valinnaiset: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-7bb2f42902f0 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>jamming</a1>.

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-d5f06ff66e1b = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1bd760afbaca = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>spoof</a1>.

# text
# c1: attack
# c2: satellites
# c3: detector
seg-fb15ecc29f7c = Pakolliset kentät: <c1/>. Valinnaiset: <c2/>, <c3/>.

# text
seg-15c08ee5ae76 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>spoof-detect</a1>.

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
seg-c65b9d45bdcc = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

# text
seg-bd1b04ccfe22 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>tracking-loop</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-5024b537d000 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-a73f44c04565 = <b>Kirjanpito:</b> MODELLED { "3" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>spectrum</a1>.

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-cbcc6f5302b8 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-d14fa8348a2a = <b>Kirjanpito:</b> MODELLED { "1" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>impairment-eval</a1>.

# text
seg-5242026d2998 = <s1>Edellinen</s1>Inertia-anturit, fuusio ja kvanttianturit

# text
seg-6b9b04e59491 = <s1>Seuraava</s1>Matalan Maan kiertoradan navigointi
