# docs--kind-inertial: translations (fi)

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä lajia; muut ovat kohteessa <a1><c1/></a1>.

seg-b054c73f22e5 = ei arvoa

seg-98151954f217 = false

seg-be831b52a339 = ja { "4" } lisää matriisissa.

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN). Oraakkeli (ExternalDataset): Julkaistut CAI:n alkuperäisartikkelien numeeriset vektorit (Cheinet { "2008" } siirtofunktio; Peters/Freier-herkkyys): k_eff·T² täsmää tarkasti, shot-kohinan ASD yksipuolinen lattia ~{ "2" }× sisällä kustakin julkaistusta instrumentista (todelliset laitteet kantavat teknistä kohinaa kvanttilattian yläpuolella). Haarukka, ei pariteetti. { "0.30" } kierros { "2" } (ennakkorekisteröity fcb9ac64), havainto (jää tasolle MODELLED): pelkkä QPN-kiertokohina mitattua Gauguet ym.

seg-7e95210bcc48 = <b>MODELLED</b> Koostettu harha + asteikkokerroin + VRW + stabiilisuuden vaimenemis -paikkabudjetti holdoverin yli. Oraakkeli (ReferenceImpl): Riippumaton numpy Monte Carlo -SDE-integrointi kaksoisintegroidulle valkoisen kiihtyvyyden kohinalle (validoi analyyttisen VRW-varianssin aidosti riippumattomalla algoritmilla) + Grovesin { "2013" } julkaistu arvoankkuri harha- ja asteikkokerroin-termeille; CAI-laitelukemat kvantifioivat kumppanin laitteiston ja pysyvät tasolla MODELLED

seg-9955b1b1c018 = Kvanttiinertiaanturin suorituskyky on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Kvanttiinertiaalisen dead reckoning -paikanpidon kestävyys on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = Aihesivu: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Aihesivu: <a1>QUANTUM.md</a1>

seg-7bebd09c614b = Navigointiluokan kvartsikiihtyvyysanturi (Honeywell QA-2000 / G

seg-cead54058894 = Lähde: <c1/>

seg-783be547f01e = <c1/> (skenaariotyyppi)

seg-bdedf28adc48 = 1-DOF inertiaalinen dead reckoning GNSS-katkon aikana.

seg-55b5599ef867 = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-94fd9afe6f30 = Valinnaiset kentät: <c1/>

seg-bd021b5dff80 = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-8a9e52e38b05 = Exail-hybridikvanttikiihtyvyysanturikolmikko: harhan vakaus 6e-

seg-873c402bb724 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/imu-deadreckoning.toml, skenaariotyyppi inertial

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: <a1>varmennusmatriisin</a1> rivit, jotka nimeävät tämän tyypin.

seg-41f3a20fadfb = <b>VALIDATED</b> Kvaternioniasenteinen, WGS-84 NED -strapdown-inertiamekanisaatio (coning/sculling-kompensoitu), joka propagoi navigointitilaa (Δθ, Δv)-inkrementeistä Testit: <a1>classical_strapdown_ins_reference.rs</a1>.

seg-102d2e51460e = <b>MODELLED</b> Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN) Testit: <a1>quantum_inertial_sensor_reference.rs</a1>.

seg-83fa50d4859a = <b>MODELLED</b> Mach–Zehnder-interferenssijuovan epäselvyyden dynaaminen alue: 2π-jaksollinen juovalukema asettaa suurimman yksiselitteisen ominaisvoiman a_max=π/(k_eff·T²), ja yksiselitteinen alue resoluutiosoluissa a_max/σ_a=π/σ_Φ on riippumaton optisesta asteikkok

seg-89ec2e65cf4f = <b>MODELLED</b> Koostettu harha + asteikkokerroin + VRW + stabiilisuuden vaimenemis -paikkabudjetti holdoverin yli Testit: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

seg-bb07c8ee153f = <b>PARTNER</b> Ei tarjota — vain suorituskykymalleja; kylmäatomi-/kellolaitteisto on kumppanin. Oraakkeli (NoneKind): ei mitään: kumppanin omistama ala, tarkoituksella ilman moduulia ja testiä

seg-fab4c926e628 = <s1>Edellinen</s1>impairment-eval

seg-aa783749183d = <s1>Seuraava</s1>ins-trn-coast
