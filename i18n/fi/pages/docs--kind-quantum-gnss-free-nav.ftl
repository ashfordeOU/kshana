# docs--kind-quantum-gnss-free-nav: translations (fi)

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN). Oraakkeli (ExternalDataset): Julkaistut CAI:n alkuperäisartikkelien numeeriset vektorit (Cheinet { "2008" } siirtofunktio; Peters/Freier-herkkyys): k_eff·T² täsmää tarkasti, shot-kohinan ASD yksipuolinen lattia ~{ "2" }× sisällä kustakin julkaistusta instrumentista (todelliset laitteet kantavat teknistä kohinaa kvanttilattian yläpuolella). Haarukka, ei pariteetti. { "0.30" } kierros { "2" } (ennakkorekisteröity fcb9ac64), havainto (jää tasolle MODELLED): pelkkä QPN-kiertokohina mitattua Gauguet ym.

seg-9955b1b1c018 = Kvanttiinertiaanturin suorituskyky on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-496b17a8d3b9 = Aihesivu: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Aihesivu: <a1>QUANTUM.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ei tarjota — vain suorituskykymalleja; kylmäatomi-/kellolaitteisto on kumppanin. Oraakkeli (NoneKind): ei mitään: kumppanin omistama ala, tarkoituksella ilman moduulia ja testiä

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Yksi toistettava TradeEvidence-olio (kiinteä kehys: skenaario+siemenluku+moottori; yhteiset FoM-kohtaiset kvantti-vs.-klassinen-arvot napaisuudeltaan oikealla hyödyllä, valinnainen { "95" }%. Oraakkeli (InternalConsistency): Suljetun muodon hyöty-/voittajaidentiteetit + uskollinen kääre olemassa olevalle quantum_trade::TradeResultille; rehellisyys sidottu edustavuuskirjanpitoon (ledger) ja varmennusmerkintöihin

seg-eb75c6a4dcec = Kvantti-vs.-klassinen-kauppatodiste (yhteinen muoto) on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-bfbcc7e8f620 = Lähde: <c1/>

seg-cfa59601df4a = <c1/> (skenaariotyyppi)

seg-790fbfdd80f0 = MODELLED GNSS-vapaa kvanttinavigointi: GNSS-katkon aikana kvantti- (kylmäatomi-interferometri) inertiabudjetti vs. klassinen navigointiluokan INS — paikkavirheen kasvu vapaaliikkeen aikana, holdover paikkakynnykseen ja kvantti-vs.-klassinen-kauppa rehellisenä TradeEvidencena edustavuuden kanssa. Rehellinen havaittavuushuomautus: ilman ulkoista paikannusta kiihtyvyysmittarin harha on havaitsematon, joten virhe kasvaa; kvanttianturi hidastaa mutta ei sulje tuota eroa. Havainnollistavat julkisista lähteistä kootut laiteparametrit; mallintaa luokan, ei TRL-/lento-/sertifiointiväitettä.

seg-dd74f248373d = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: quantum-gnss-free-nav | katko 300s | kvantin paikkavirhe { "0.00" } m vs. klassinen { "37.31" } m (8289.5x) | holdover kvantti 44721s vs. klassinen 534s (kynnys { "100" } m) | kauppa: kvantti voittaa 2/2 | MODELLED

seg-960491d74173 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>

seg-88d9dfe0353a = Esimerkki <c1/> asettaa muun muassa:

seg-1bdbf1a737b2 = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-gnss-free-nav.toml, tyyppi quantum-gnss-free-nav

seg-d196391dcf4f = <b>MODELLED</b> Kvantti- (kylmäatomi-interferometri) vs. klassinen navigointiluokan INS -koetuslaskenta GNSS-katkon yli: paikkavirheen kasvu, holdover paikkakynnykseen,. Oraakkeli (InternalConsistency): Uudelleenkäytetyt inertiabudjetit ristiintarkistettuna saman koetuslaskennan ODE:n riippumattomalla Octave-kaksoisintegroinnilla (eri ajoympäristö, yhteinen malli → ReferenceImpl) sekä julkaistulla Freier-2016-lyhytaikaisella kohinalla yksipuolisena ankkurina; kvantti-vs.-klassinen-komposiitti pysyy tasolla MODELLED

seg-af35cccc4e2c = MODELLED GNSS-vapaa kvanttinavigointi: GNSS-katkon aikana kvantti- (kylmäatomi-interferometri) inertiabudjetti vs. klassinen navigointiluokan INS — paikkavirheen kasvu vapaaliikkeen aikana, holdover paikkakynnykseen ja kvantti-vs.-klassinen-kauppa rehellisenä TradeEvidencena edustavuuden kanssa. (tyyppiluettelo (<c1/>))

seg-9b9ce7600ffc = GNSS-vapaa kvanttinavigointi — kvantti- (kylmäatomi-interferometri) vs. klassinen navigointiluokan INS -koetuslaskenta GNSS-katkon yli. MODELLED; havainnollistavat, julkisista lähteistä kootut laiteparametrit; mallintaa luokan, ei TRL-/lentoväitettä. (skenaariotiedoston kommentti, rivit { "1" } - { "3" })

seg-9d67411151e3 = GNSS-vapaa kvanttinavigointi on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e1d502e1ed6d = <s1>Edellinen</s1>quantum-anomaly-detect

seg-1f3705925b3c = <s1>Seuraava</s1>quantum-time-transfer

seg-a349aa76b0ed = PARTNER
