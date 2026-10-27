# docs--kind-campaign: translations (et)

# text
seg-8784979d6569 = dBW

# text
# c1: docs/kinds/by-kind/campaign.md
seg-68a2bcb6eedd = Allikas: <c1/>

# text
# c1: campaign
seg-24ce6aee5e53 = <c1/> (stsenaariumi liik)

# text
seg-931a3d27c0f0 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kampaaniad</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-a07990e776cb = Kampaania: olemasolevad stsenaariumi liigid, mis on koondatud üheks jooksuks, kus iga arv on loetud nimetatud liigi tegelikust jooksust. Neli jaotist, mis tahes kombinatsioonis. PHASES: aheldatud missioon ühel jagatud ajateljel -- iga faas käivitab ühe või mitu stsenaariumi (näiteks segamine, siis spuufimine, siis kell holdover-is koos selle kõrval libiseva inertsiaalnavigatsioonisüsteemiga, siis terviklikkuse alarm, siis taastumine), nende väljundid loetakse nimetatud kanalitesse (kella ajaviga selle valvepiiri suhtes, kandja ja müra tiheduse suhe jälgimispõranda suhtes, kaitsetase häirepiiri suhtes, positsioonivea, jälgivad satelliidid, alarmilipud) liigipõhise eelseadistuse või selgesõnaliste tulemusteede abil ning diskreetimisel ühisele ruudustikule nulljärgu hoidega, koos faasipiiride ja sündmustega; olek antakse edasi carry abil (kanal jätkub eelmise faasi lõppväärtusest), handoff abil (eelmise faasi arv kirjutatakse selle faasi stsenaariumisse) ja end_at abil (faas lõpeb ajal, mille jooks arvutas, näiteks spuufimismonitori tuvastusaeg). SWEEP: ruudustik üle ühe kuni kolme punktidega stsenaariumivõtme mis tahes liigist (täisarvuline segment indekseerib tabelite massiivi, nagu system.2.sisre_m), mõõdikutega, mis loetakse tulemuseteega, ning üle ühe jooksu korral algväärtusega (seed) Monte Carlo ansambliga igas sõlmes. MONTE_CARLO: realisatsioon k jookseb algväärtusega base_seed + k; iga mõõdik annab keskmise, standardhälbe, lähima järgu 5./50./95. protsentiili ja fikseeritud algväärtusega (seed) bootstrap-i { "95" }% usaldusvahemiku keskmisele. COMPOSE: mitu stsenaariumi jagatud väärtustega (ühe segaja võimsus ja asukoht kirjutatud mere- ja maanteevastuvõtjale), koos kombineeritud parima/halvima kokkuvõttega. Tulemus kannab kampaania räsi, kokkuvõtet üle iga liikme tulemuse ning iga väljastatud arvu ühikukirjet; koostalitlusvõime ekspordid kirjutavad iga geomeetriaga liikmestsenaariumi eraldi failikomplektina. Koosteidentiteete testitakse: ühefaasiline kampaania reprodutseerib eraldiseisva jooksu bitthaaval, fikseeritud algväärtusega (seed) ansambel on baitide tasemel stabiilne ning valge sageduse mürega kellal jääb ansambli keskmine teatatud vahemikku, hajuvus ühtib suurusega sqrt(q_wf * tau). MODELLED: aditiivne carry ja nulljärgu hoie on modelleerimisvalikud ning iga faas kannab seda käivitanud liigi silti.

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
# c2: jamming
seg-05e842f80dbb = Ühe <c1/> jooksu kokkuvõte: campaign 46aa07cb58fb | Segaja võimsuse pühkimine: kättesaadavus ja J/S saatevõimsuse suhtes | pühkimine <c2/>: { "13" } sõlme üle [jammer_power] | { "13" } liikme jooksu (MODELLED)

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-bf339fa14645 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/campaign-sweep-jammer-power.toml
seg-abd3eac6da41 = Näide <c1/> määrab muu hulgas:

# text
seg-c4f955d5f506 = kättesaadavus

# text
# c1: scenarios/
seg-7bcf77278958 = { "22" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-38faa927b2bd = lin

# text
seg-1a33a746eeee = Tulemuse silt (mootori oma): MODELLED olemasolevate stsenaariumi liikide koondamine. Iga arv on loetud nimetatud liigi tegelikust jooksust; aheldamine (kanali aditiivne carry üle faasipiiri, nulljärgu hoie ajatelje ruudustikule, arvutatud ajal lõppenud faas) on modelleerimisvalik ning iga faas kannab silti

# attr:alt
seg-b2c7cd1f9712 = Diagramm, mille mootor kirjutab failile scenarios/campaign-sweep-jammer-power.toml, liik campaign

# text
seg-8d3c1f9f3e9a = <b>MODELLED</b> iq::campaign::detect ja kampaaniajooksutaja: valikuline [monitors] tabel käivitab IQ-monitorid igal lahtril jooksutaja ühel läbimisel. Testid: <a1>iq_campaign.rs</a1>.

# text
seg-7e491ab49c2f = <b>MODELLED</b> iq::campaign::detect (windows, roc) ja iq::campaign::report::rocs: monitoridega kampaania iga lahter hoiab alarmiliigi ja kanali kohta monitori enda testistatistiku maksimumi üle iga väljaöeldud sündmuseakna (positiivne) ja üle t

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-f21e0ab2ad06 = <b>MODELLED</b> iq::labfit (campaign, cn0, iqfit, iqreport) ja <c1/> käsul <c2/>, Python <c3/> ja MCP labfit tööriist (kampaaniakaustad ainult selle töökataloogis): loeb kausta <c4/> väljundit selle Testid: <a1>iq_labfit_followup.rs</a1>.

# text
# c1: campaign
seg-f16a176dc1f8 = <b>MODELLED</b> Liigi <c1/> faasid: iga faas käivitab ühe või mitu olemasolevate liikide stsenaariumi funktsiooniga run_toml, loeb nende väljundid nimetatud kanalitesse (kella ajaviga ja valvepiir, keskmine efektiivne kandja ja müra tiheduse suhe ja jälgimispõrand, v Testid: <a1>campaign_composition_reference.rs</a1>.

# text
seg-be831b52a339 = ja veel { "4" } maatriksis.

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Geomeetriline J/S lingibilanss, segamisvastane C/N₀, satelliidi kaupa sünkroonsuse kadu. Oraakel (sõltumatu etalon) (InternalConsistency): Segamisvastase C/N₀ lingibilansi võrrand, mida on risttõendatud sõltumatu numpy uuestituletusega (jagab sama suletud kuju → InternalConsistency) pluss tegeliku JammerTest-2024 C/N₀ halvenemise iseloomustusega. { "0.30" } ring { "2" }, blokeeritud (jääb MODELLED): mõõdetud JammerTest { "2024" } C/N0 langust lingibilansi ennustuse vastu (eelregistreeritud 6a66994b, { "3" } dB piires) ei jooksutatud, sest F8.1 antenni asukoht ja suunamine at

# text
seg-59afd80736c5 = <b>PARTNER</b> Ei paku — Kshana modelleerib signaali toimivust, mitte kasulikkoormuse/antenni riistvara. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
# c1: campaign
seg-fa3ad6babe54 = <b>MODELLED</b> Liigi <c1/> pühkimine (üks kuni kolm punktidega võtit mis tahes liigist, üldise pühkimise telje väärtustel, soovi korral ansambel igas sõlmes) ja monte_carlo sec. Oraakel (sõltumatu etalon) (InternalConsistency): Faasi juhusliku ekslemise suletud kuju valge sageduse müra korral, dispersioon q_wf tau (NIST Technical Note { "1337" }), statistikamasinavärgi jaoks ning baitide tasemel võrdsus eraldiseisvate jooksudega seemendamise (seeding) jaoks. See kontrollib ansambli aritmeetikat mootori enda kellamudelil, mitte välist andmestikku

# text
# c1: label
seg-c15b5ac32282 = MODELLED olemasolevate stsenaariumi liikide koondamine. Iga arv on loetud nimetatud liigi tegelikust jooksust; aheldamine (kanali aditiivne carry üle faasipiiri, nulljärgu hoie ajatelje ruudustikule, arvutatud ajal lõppenud faas) on modelleerimisvalik ning iga faas kannab seda tootnud liigi silti. (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-9e33dcc39c27 = MODELLED: aditiivne carry ja nulljärgu hoie on modelleerimisvalikud ning iga faas kannab seda käivitanud liigi silti. (liikide kataloog (<c1/>))

# text
# c1: jamming
seg-adcc6ea59840 = MODELLED: nagu liik <c1/> on. (stsenaariumifaili kommentaar, rida { "14" })

# text
seg-143f3f1cc521 = GNSS-ita segamisvastane vastupidavus on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-d1c11e493795 = Parameetripühkimised ja algväärtusega (seed) Monte Carlo ansamblid üle mis tahes stsenaariumi liigi on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-edbda7aca5b9 = Perekonna leht: <a1>Kampaaniad</a1>

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
seg-c4ed27a559df = Teemaleht: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
seg-774e035da605 = <s1>Eelmine</s1>body-pnt

# text
seg-fadd92303a4d = <s1>Järgmine</s1>cislunar-arc-recovery
