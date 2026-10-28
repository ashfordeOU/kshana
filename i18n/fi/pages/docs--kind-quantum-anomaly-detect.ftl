# docs--kind-quantum-anomaly-detect: translations (fi)

seg-29e58493fdd4 = Mallinnettu

seg-619127334cf3 = Yksikään matriisin rivi ei nimeä tätä tyyppiä nimellä; sen tuloksen merkintä on moottorin oma, yllä.

seg-7b2721b7588d = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Inertia-, fuusio- ja kvanttianturit</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin oma; tyyppi on MODELLED, ellei matriisi toisin sano (miten merkintä ansaitaan: README-tiedoston osio Evidence).

seg-f7f12029e0ec = Perhesivu: <a1>Inertia-, fuusio- ja kvanttianturit</a1>

seg-496b17a8d3b9 = Aihesivu: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ei tarjota — vain suorituskykymalleja; kylmäatomi-/kellolaitteisto on kumppanin. Oraakkeli (NoneKind): ei mitään: kumppanin omistama ala, tarkoituksella ilman moduulia ja testiä

seg-836d5102f0d1 = Lähde: <c1/>

seg-ad4ce0110e8d = <c1/> (skenaariotyyppi)

seg-04310cd6cbec = MODELLED vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille: nimetty vikaluettelo (kellon taajuushyppy/ajautuma/lukituksen menetys; anturin harha-askel/katkos), havaitsemistunnusluvun ROC AUC (bootstrap-luottamusväli ulkoisesti validoidusta eval_statsista) ja pienin havaittava vika kiinteällä väärän hälytyksen asteella, kun kvanttikelloavusteinen monitori (pienempi kohina) havaitsee pienempiä vikoja — rehellisenä TradeEvidencena + edustavuutena. Gaussin havaitsemistunnusluvun malli (AUC = Phi(mu/(sigma*sqrt2))); mallintaa luokan, havainnollistavat julkisista lähteistä kootut parametrit, ei TRL-/lento-/sertifiointiväitettä.

seg-442310afbb13 = Skenaarion <c1/> yksi ajo tiivistyy seuraavasti: quantum-anomaly-detect | AUC kvantti { "0.9908" } vs. klassinen { "0.7603" } | pienin havaittava vika kvantti { "1.312" } vs. klassinen { "4.372" } | { "5" } vikaluokkaa | kauppa: kvantti voittaa 2/2 | MODELLED

seg-335b8d87e27d = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-c2b10c0bdaf8 = Esimerkki <c1/> asettaa muun muassa:

seg-f44afe581836 = { $version }

seg-2f1d14239d1a = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-anomaly-detect.toml, tyyppi quantum-anomaly-detect

seg-af9aaf95d4f8 = <b>VALIDATED</b> Analyyttinen binormaali ROC AUC = Φ(μ/(σ√{ "2" })) ja pienin havaittava vika σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) kvanttivika- ja poikkeamailmaisimien perustana. Oraakkeli (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), molemmat BSD-3-Clause — riippumattomat kirjastot, jotka laskevat samat yksikäsitteisesti määritellyt Gaussin hännän / AUC-suureet, täsmäten A&S-erf-lattiaan (~{ "7e-8" }). Tämän päälle rakennettu kvantti-vs.-klassinen etu pysyy tasolla MODELLED

seg-c37642bb24fe = <b>MODELLED</b> Yksi toistettava TradeEvidence-olio (kiinteä kehys: skenaario+siemenluku+moottori; yhteiset FoM-kohtaiset kvantti-vs.-klassinen-arvot napaisuudeltaan oikealla hyödyllä, valinnainen { "95" }%. Oraakkeli (InternalConsistency): Suljetun muodon hyöty-/voittajaidentiteetit + uskollinen kääre olemassa olevalle quantum_trade::TradeResultille; rehellisyys sidottu edustavuuskirjanpitoon (ledger) ja varmennusmerkintöihin

seg-b854cedc8a51 = <b>MODELLED</b> Nimetty kvanttivikaluettelo (kellon taajuushyppy/ajautuma/lukituksen menetys; anturin harha-askel/katkos), havaitsemistunnusluvun ROC AUC bootstrap-luottamusvälillä ja pienin. Oraakkeli (InternalConsistency): Suljetun muodon Gaussin AUC = Phi(mu/(sigma*sqrt2)) ristiintarkistettuna ulkoisesti validoitua eval_stats::bootstrap_auc_ci:tä vasten (vs. scikit-learn) + havaitsemisen analyyttiset kynnykset

seg-7b465c2bb7cf = MODELLED vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille: nimetty vikaluettelo (kellon taajuushyppy/ajautuma/lukituksen menetys; anturin harha-askel/katkos), havaitsemistunnusluvun ROC AUC (bootstrap-luottamusväli ulkoisesti validoidusta eval_statsista) ja pienin havaittava vika kiinteällä väärän hälytyksen asteella, kun kvanttikelloavusteinen monitori (pienempi kohina) havaitsee pienempiä vikoja — rehellisenä TradeEvidencena + edustava (tyyppiluettelo (<c1/>))

seg-7f43972b246d = Vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille — nimetty vikaluettelo + ROC AUC + pienin havaittava vika, kvanttikelloavusteinen vs. klassinen monitori. MODELLED; havainnollistavat julkisista lähteistä kootut parametrit; mallintaa luokan, ei TRL-/lentoväitettä. (skenaariotiedoston kommentti, rivit { "1" } - { "3" })

seg-eb75c6a4dcec = Kvantti-vs.-klassinen-kauppatodiste (yhteinen muoto) on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = Vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille on MODELLED, ei validoitu: sitä on tarkistettu omaa suljetun muodon tai analyyttistä identiteettiään vasten, mikä paljastaa kopiointi- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>Edellinen</s1>pvt

seg-aa689568cf84 = <s1>Seuraava</s1>quantum-gnss-free-nav

seg-a349aa76b0ed = PARTNER
