# docs--kind-sweep-nd: translations (fi)

seg-fa3ad6babe54 = <b>MODELLED</b> Lajin <c1/> pyyhkäisy (yhdestä kolmeen pisteillä erotettua avainta mitä tahansa lajia, yleisen pyyhkäisyn akseliarvoilla, valinnaisesti joukko jokaisessa solmussa) ja osio monte_carlo. Oraakkeli (InternalConsistency): Vaihesatunnaiskävelyn suljettu muoto valkoisessa taajuuskohinassa, varianssi q_wf tau (NIST Technical Note { "1337" }), tilastokoneistolle, ja tavutason yhtäläisyys erillisten ajojen kanssa siementämiselle. Se tarkistaa joukkolaskennan moottorin omalla kellomallilla, ei ulkoista aineistoa

seg-d1c11e493795 = Parametripyyhkäisyt ja siemenluvulla alustetut Monte Carlo -joukot minkä tahansa skenaariolajin yli ovat MODELLED, eivät validoituja: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-c61e88721556 = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kellot, ajoitus ja holdover</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-849c08d3ce70 = Perhesivu: <a1>Kellot, ajoitus ja holdover</a1>

seg-ee7dd15019d0 = Aihesivu: <a1>CAMPAIGNS.md</a1>

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN). Oraakkeli (ExternalDataset): Julkaistut CAI:n alkuperäisartikkelien numeeriset vektorit (Cheinet { "2008" } siirtofunktio; Peters/Freier-herkkyys): k_eff·T² täsmää tarkasti, shot-kohinan ASD yksipuolinen lattia ~{ "2" }× sisällä kustakin julkaistusta instrumentista (todelliset laitteet kantavat teknistä kohinaa kvanttilattian yläpuolella). Haarukka, ei pariteetti. { "0.30" } kierros { "2" } (ennakkorekisteröity fcb9ac64), havainto (jää tasolle MODELLED): pelkkä QPN-kiertokohina mitattua Gauguet ym.

seg-7e95210bcc48 = <b>MODELLED</b> Koostettu harha + asteikkokerroin + VRW + stabiilisuuden vaimenemis -paikkabudjetti holdoverin yli. Oraakkeli (ReferenceImpl): Riippumaton numpy Monte Carlo -SDE-integrointi kaksoisintegroidulle valkoisen kiihtyvyyden kohinalle (validoi analyyttisen VRW-varianssin aidosti riippumattomalla algoritmilla) + Grovesin { "2013" } julkaistu arvoankkuri harha- ja asteikkokerroin-termeille; CAI-laitelukemat kvantifioivat kumppanin laitteiston ja pysyvät tasolla MODELLED

seg-9955b1b1c018 = Kvanttiinertiaanturin suorituskyky on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko kyvykkyys koostuu mallinnetuista osista, joten kyvykkyys jää mallinnetuksi. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Kvanttiinertiaalisen dead reckoning -paikanpidon kestävyys on MODELLED, ei validoitu: se on tarkistettu erillistä toteutusta vasten samassa koodikannassa — riippumaton testattavasta yksiköstä, mutta ei ulkoisesti auktoritatiivinen. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-5a70fcb097dc = Valinnaiset kentät: ei yhtään

seg-bb07c8ee153f = <b>PARTNER</b> Ei tarjota — vain suorituskykymalleja; kylmäatomi-/kellolaitteisto on kumppanin. Oraakkeli (NoneKind): ei mitään: kumppanin omistama ala, tarkoituksella ilman moduulia ja testiä

seg-8b701f465117 = log

# text
# c1: docs/kinds/by-kind/sweep-nd.md
seg-792218eac075 = Lähde: <c1/>

# text
# c1: sweep-nd
seg-c7e5582d0b24 = <c1/> (skenaariolaji)

# text
seg-4f19d4fb1341 = Yleinen N-ulotteinen pyyhkäisy minkä tahansa paketin yli pisteytettyjen TOML-avainten / JSON-metriikkapolkujen avulla.

# text
# c1: scenarios/sweep-nd-inertial.toml
# c2: inertial
seg-cd907c72698b = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: generic sweep of <c2/> over [threshold_m, accel_classical.bias] | { "15" } nodes (shape [{ "5" }, { "3" }]) | metrics [classical.fom.holdover_s, classical.fom.pos_rms_m]

# text
# c1: base
# c2: axes
# c3: metrics
seg-502ba2c57a5f = Pakolliset kentät: <c1/>, <c2/>, <c3/>

# text
# c1: scenarios/sweep-nd-inertial.toml
seg-c372e390bb4f = Esimerkki <c1/> asettaa muun muassa seuraavat:

# attr:alt
seg-621a18c07044 = Moottorin kirjoittama kaavio skenaariolle scenarios/sweep-nd-inertial.toml, laji sweep-nd

# text
seg-ce006a6715e9 = <s1>Edellinen</s1>spoof

# text
seg-b9f8771ffd3d = <s1>Seuraava</s1>sweep
