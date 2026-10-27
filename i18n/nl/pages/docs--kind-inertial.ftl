# docs--kind-inertial: translations (nl)

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-b054c73f22e5 = geen waarde

seg-98151954f217 = false

seg-be831b52a339 = en { "4" } meer in de matrix.

seg-7b2721b7588d = Scenariosoort van de engine v{ $version }, familie <a1>Inertiële, fusie- en kwantumsensoren</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> Koudeatoom-interferometeraccelerometer uit eerste principes (k_eff·T², QPN). Onafhankelijke referentie (ExternalDataset): Gepubliceerde numerieke vectoren uit primaire CAI-artikelen (Cheinet { "2008" }-overdrachtsfunctie; Peters/Freier-gevoeligheid): k_eff·T² exact gereproduceerd, shotruis-ASD een eenzijdige ondergrens binnen ~{ "2" }× van elk gepubliceerd instrument (echte apparaten hebben technische ruis boven de kwantumondergrens). Een bandbreedte, geen gelijkwaardigheid. { "0.30" } ronde { "2" } (vooraf vastgelegd fcb9ac64), een bevinding (blijft MODELLED): de alleen-QPN-rotatieruis tegenover de gemeten Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Samengesteld positiebudget van bias + schaalfactor + VRW + stabiliteitsverval over holdover. Onafhankelijke referentie (ReferenceImpl): Onafhankelijke numpy-Monte-Carlo-SDE-integratie van dubbel geïntegreerde witte-versnellingsruis (valideert de analytische VRW-variantie met een werkelijk onafhankelijk algoritme) + een gepubliceerde ankerwaarde van Groves { "2013" } voor de bias- en schaalfactortermen; de CAI-apparaatcijfers kwantificeren hardware van partners en blijven MODELLED

seg-9955b1b1c018 = De prestaties van een kwantuminertiaalsensor zijn MODELLED, niet getoetst aan een onafhankelijke externe referentie: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = De veerkracht van kwantuminertiale koppelnavigatie is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een afzonderlijke implementatie in ditzelfde codebestand, onafhankelijk van het geteste onderdeel maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familiepagina: <a1>Inertiële, fusie- en kwantumsensoren</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = Onderwerppagina: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Onderwerppagina: <a1>QUANTUM.md</a1>

seg-7bebd09c614b = Kwartsaccelerometer van navigatieklasse (Honeywell QA-2000 / G

seg-cead54058894 = Bron: <c1/>

seg-783be547f01e = <c1/> (scenariosoort)

seg-bdedf28adc48 = 1-DOF-inertiële koppelnavigatie tijdens een GNSS-uitval.

seg-55b5599ef867 = Eén run van <c1/> vat samen als: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-94fd9afe6f30 = Optionele velden: <c1/>

seg-bd021b5dff80 = Het voorbeeld <c1/> stelt onder meer in:

seg-8a9e52e38b05 = Exail hybride kwantumaccelerometer-triade: biasstabiliteit 6e-

seg-873c402bb724 = De grafiek die de engine schrijft voor scenarios/imu-deadreckoning.toml, soort inertial

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-41f3a20fadfb = <b>VALIDATED</b> Strapdown-inertiële mechanisatie in WGS-84 NED met quaternionattitude (coning-/sculling-gecompenseerd) die een navigatietoestand propageert uit (Δθ, Δv)-incrementen Tests: <a1>classical_strapdown_ins_reference.rs</a1>.

seg-102d2e51460e = <b>MODELLED</b> Koudeatoom-interferometeraccelerometer uit eerste principes (k_eff·T², QPN) Tests: <a1>quantum_inertial_sensor_reference.rs</a1>.

seg-83fa50d4859a = <b>MODELLED</b> Dynamisch bereik van de Mach–Zehnder-fringe-ambiguïteit: de 2π-periodieke fringe-uitlezing legt een maximale ondubbelzinnige specifieke kracht a_max=π/(k_eff·T²) vast, en het ondubbelzinnige bereik in resolutiecellen a_max/σ_a=π/σ_Φ is onafhankelijk van de optische schaalfact

seg-89ec2e65cf4f = <b>MODELLED</b> Samengesteld positiebudget van bias + schaalfactor + VRW + stabiliteitsverval over holdover Tests: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

seg-bb07c8ee153f = <b>PARTNER</b> Niet geleverd: alleen prestatiemodellen; koudeatoom-/klokhardware is van een partner. Onafhankelijke referentie (NoneKind): geen: een discipline van een partner, bewust zonder module en zonder test

seg-fab4c926e628 = <s1>Vorige</s1>impairment-eval

seg-aa783749183d = <s1>Volgende</s1>ins-trn-coast
