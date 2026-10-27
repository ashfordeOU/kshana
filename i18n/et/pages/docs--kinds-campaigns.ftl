# docs--kinds-campaigns: translations (et)

# text
seg-b03d56f501c3 = Liik

# text
seg-a07990e776cb = Kampaania: olemasolevad stsenaariumi liigid, mis on koondatud üheks jooksuks, kus iga arv on loetud nimetatud liigi tegelikust jooksust. Neli jaotist, mis tahes kombinatsioonis. PHASES: aheldatud missioon ühel jagatud ajateljel -- iga faas käivitab ühe või mitu stsenaariumi (näiteks segamine, siis spuufimine, siis kell holdover-is koos selle kõrval libiseva inertsiaalnavigatsioonisüsteemiga, siis terviklikkuse alarm, siis taastumine), nende väljundid loetakse nimetatud kanalitesse (kella ajaviga selle valvepiiri suhtes, kandja ja müra tiheduse suhe jälgimispõranda suhtes, kaitsetase häirepiiri suhtes, positsioonivea, jälgivad satelliidid, alarmilipud) liigipõhise eelseadistuse või selgesõnaliste tulemusteede abil ning diskreetimisel ühisele ruudustikule nulljärgu hoidega, koos faasipiiride ja sündmustega; olek antakse edasi carry abil (kanal jätkub eelmise faasi lõppväärtusest), handoff abil (eelmise faasi arv kirjutatakse selle faasi stsenaariumisse) ja end_at abil (faas lõpeb ajal, mille jooks arvutas, näiteks spuufimismonitori tuvastusaeg). SWEEP: ruudustik üle ühe kuni kolme punktidega stsenaariumivõtme mis tahes liigist (täisarvuline segment indekseerib tabelite massiivi, nagu system.2.sisre_m), mõõdikutega, mis loetakse tulemuseteega, ning üle ühe jooksu korral algväärtusega (seed) Monte Carlo ansambliga igas sõlmes. MONTE_CARLO: realisatsioon k jookseb algväärtusega base_seed + k; iga mõõdik annab keskmise, standardhälbe, lähima järgu 5./50./95. protsentiili ja fikseeritud algväärtusega (seed) bootstrap-i { "95" }% usaldusvahemiku keskmisele. COMPOSE: mitu stsenaariumi jagatud väärtustega (ühe segaja võimsus ja asukoht kirjutatud mere- ja maanteevastuvõtjale), koos kombineeritud parima/halvima kokkuvõttega. Tulemus kannab kampaania räsi, kokkuvõtet üle iga liikme tulemuse ning iga väljastatud arvu ühikukirjet; koostalitlusvõime ekspordid kirjutavad iga geomeetriaga liikmestsenaariumi eraldi failikomplektina. Koosteidentiteete testitakse: ühefaasiline kampaania reprodutseerib eraldiseisva jooksu bitthaaval, fikseeritud algväärtusega (seed) ansambel on baitide tasemel stabiilne ning valge sageduse mürega kellal jääb ansambli keskmine teatatud vahemikku, hajuvus ühtib suurusega sqrt(q_wf * tau). MODELLED: aditiivne carry ja nulljärgu hoie on modelleerimisvalikud ning iga faas kannab seda käivitanud liigi silti.

# attr:alt
seg-b2c7cd1f9712 = Diagramm, mille mootor kirjutab failile scenarios/campaign-sweep-jammer-power.toml, liik campaign

# text
# c1: docs/kinds/campaigns.md
seg-ea93f81fa08b = Allikas: <c1/>

# text
seg-7f8e8af56bc0 = Kampaaniad (stsenaariumi liikide perekond)

# text
seg-c8012ee549ea = { "1" } stsenaariumi liik mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-09ed7c4e175c = Teemalehed: <a1>CAMPAIGNS</a1>. Käivita üks: <c1/>. Kõik perekonnad: <a2>KINDS.md</a2>.

# attr:alt
seg-b49ec180e810 = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Kampaaniad liikide jaoks

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-b2016159c9d0 = Kampaania: olemasolevad stsenaariumi liigid, mis on koondatud üheks jooksuks, kus iga arv on loetud nimetatud liigi tegelikust jooksust.

# text
# c1: title
# c2: seed
# c3: timeline
# c4: phases
# c5: sweep
# c6: monte_carlo
# c7: compose
seg-25148644a262 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-e0334a6899b6 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>campaign</a1>.

# text
seg-906f63ffbc30 = <s1>Eelmine</s1>Käitumisjuhend

# text
seg-cdf23ced49bd = <s1>Järgmine</s1>Kellad, ajastus ja holdover
