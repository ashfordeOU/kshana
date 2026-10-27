# docs--kind-lunar-time-budget: translations (et)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-8f8871ac8a0f = Teemaleht: <a1>LUNAR-REFERENCE-STATION.md</a1>

# text
seg-a2889fb2b42a = Teemaleht: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/lunar-time-budget.md
seg-11f512367036 = Allikas: <c1/>

# text
# c1: lunar-time-budget
seg-f7cd4fcfc62d = <c1/> (stsenaariumi liik)

# text
seg-cac3a0bcbfc6 = MODELLED otsast lõpuni koordineeritud Kuu aja (LTC) ajavea eelarve: seitse LTC vealiiget, mis on kokku pandud ajavea kõveratena x_i(τ) üle kogu keskmistamisaja ruudustiku, ruutsummana kokku x_Σ(τ)-ks, ja kella-vs-tugisüsteemi RISTUMISE-τ, mille juures kasvav kellaliige ületab konstantse reaalajalise tugisüsteemi realiseerimise liikme (allpool seda on eelarve tugisüsteemiga piiratud, ülalpool kellaga piiratud) — aus vastus ühe-τ artefaktile. τ-kalded on suletud kujul ja analüütiliselt kontrollitavad (kell τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, põhjad τ^{ "0" }, mõõtmine τ^{ "{" }-1/2{ "}" }) ja kellaread reprodutseerivad avaldatud ühepäevased kellaspetsifikatsioonid (crate::clock_specs); RF/optilise lingi, tugisüsteemi realiseerimise, relativistliku jäägi ja efemeriidi põhja SUURUSJÄRGUD on modelleeritud eelarve eraldised (dokumenteeritud vaikeväärtused, kutsuja poolt tühistatavad), mitte mõõtmised. Panus on reprodutseeritav ristumise-τ, mitte sertifitseeritud liikmepõhine arv; ei ole sertifitseeritud operatiivseks ajahoidmiseks.

# text
# c1: scenarios/lunar-time-budget.toml
seg-8a5c9e451d4e = Ühe <c1/> käivituse kokkuvõte: lunar-time-budget | kell passive-h-maser | 7-liikmeline x_Σ(τ) üle { "57" } τ-punkti ({ "1" }–{ "1e7" } s) | ristumise τ { "8.689e4" } s (x { "1.001e-9" } s) | tugisüsteemi põhi { "1.001e-9" } s | kell x({ "1" } p) { "0.995" } ns (MODELLED)

# text
# c1: clock
# c2: tau_min_s
# c3: tau_max_s
# c4: points_per_decade
# c5: clocks
# c6: time_lab
seg-7cdc521303eb = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: scenarios/lunar-time-budget.toml
seg-c050033b32c3 = Näide <c1/> määrab muu hulgas:

# text
seg-eebd3e40d0b9 = Tulemuse silt (mootori oma): MODELLED otsast lõpuni LTC ajavea eelarve. τ-kalded on suletud kujul ja analüütiliselt kontrollitavad (kell τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, põhjad τ^{ "0" }, mõõtmine τ^{ "{" }-1/2{ "}" }) ja kellaread reprodutseerivad avaldatud ühepäevased kellaspetsifikatsioonid; RF/optiline link, tugisüsteemi realiseerimine, relativistlik jääk ja efemeriidi põh

# attr:alt
seg-56fe184f2a12 = Mootori joonistatud diagramm failile scenarios/lunar-time-budget.toml, liik lunar-time-budget

# text
seg-b03509dfcb1b = <b>MODELLED</b> Üks lunar-time-budget käivitus väljastab kella-vs-tugisüsteemi ristumisrea iga kellaklassi kohta ühe jagatud tugisüsteemi liikme suhtes, nii et kell on võrdluses ainus muutuja; iga rida kannab ristumist, milleni jõuti kahel viisil -- poolitatud gen

# text
seg-fd52e493b6c2 = <b>MODELLED</b> Stsenaariumi lunar-time-budget valikuline plokk [time_lab] modelleerib Kuu etaloonijaama kella (vaikimisi miniRAFS klass või mis tahes nimetatud klass või kindlaksmääratud stabiilsuspunktidele sobitatud seadmekaart), mida juhitakse koordineeritud Kuu ajale an Testid: <a1>lunar_station_time_lab.rs</a1>.

# text
seg-d8807d5308d4 = <b>MODELLED</b> Üks lunar-time-budget käivitus väljastab kella-vs-tugisüsteemi ristumisrea iga kellaklassi kohta ühe jagatud tugisüsteemi liikme suhtes, nii et kell on võrdluses ai. Oraakel (sõltumatu etalon) (InternalConsistency): Kaks erinevat koodibaasisisest arvutust sama suuruse kohta, mitte üks ümber öeldud: poolitamine IEEE-1139 astmeseaduse kõveral ei tea mürategevusest midagi, samas kui suletud kuju pöörab domineeriva liigi algebraliselt, nii et valesti klassifitseeritud mürategu või halb sulg ilmneb mitte-väikese suhtelise erinevusena. Neli väärtust reprodutseerivad ka artikli avaldatud tabeli poole selle viimase trükitud numbri täpsusega -- kuid see tabel oli selle

# text
seg-4c0d7da4f7f6 = <b>MODELLED</b> Stsenaarium lunar-time-budget avaldab oma massiivväärtustega väljundid pikavormilise (ruudustiku indeks, keskmistamisaeg, liige) tabelina aruande kõrval, nii et seitse per. Oraakel (sõltumatu etalon) (InternalConsistency): Ainult enesekooskõla: avaldatud kogusummat kontrollitakse samas failis olevate liikmete ruutsumma ruutjuure vastu ja väljastatud kõver reprodutseerib väljastatud p3_time_budget_curve.csv kõigil { "57" } punktil. Mõlemad kontrollid jagavad selle mootori enda liikmemääratlusi, seega kumbki ei ole sõltumatu. Kellaliige toetub avaldatud kellaspetsifikatsioonidele, kuid lingi, tugisüsteemi, relativistliku ja efemeriidi põhja SUURUSJÄRGUD on dokumenteeritud

# text
# c1: label
seg-8abdeb1a36e1 = MODELLED otsast lõpuni LTC ajavea eelarve. τ-kalded on suletud kujul ja analüütiliselt kontrollitavad (kell τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, põhjad τ^{ "0" }, mõõtmine τ^{ "{" }-1/2{ "}" }) ja kellaread reprodutseerivad avaldatud ühepäevased kellaspetsifikatsioonid; RF/optiline link, tugisüsteemi realiseerimine, relativistlik jääk ja efemeriidi põhja SUURUSJÄRGUD on modelleeritud eelarve eraldised (dokumenteeritud vaikeväärtused, kutsuja poolt tühistatavad), mitte mõõtmised. Panus (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-66a794432751 = MODELLED otsast lõpuni koordineeritud Kuu aja (LTC) ajavea eelarve: seitse LTC vealiiget, mis on kokku pandud ajavea kõveratena x_i(τ) üle kogu keskmistamisaja ruudustiku, ruutsummana kokku x_Σ(τ)-ks, ja kella-vs-tugisüsteemi RISTUMISE-τ, mille juures kasvav kellaliige ületab konstantse reaalajalise tugisüsteemi realiseerimise liikme (allpool seda on eelarve tugisüsteemiga piiratud, ülalpool kellaga piiratud) — aus vastus ühe-τ artefakt (liikide kataloog (<c1/>))

# text
seg-ca1763d4a416 = Ausus: MODELLED. τ-kalded on suletud kujul ja analüütiliselt kontrollitavad (kell tau^{ "{" }+1/2{ "}" } või tau^{ "{" }+{ "1" }{ "}" }, põhjad tau^{ "0" }, mõõtmine tau^{ "{" }-1/2{ "}" }) ja kellaread reprodutseerivad avaldatud ühepäevased kellaspetsifikatsioonid; kuid RF/optilise lingi, tugisüsteemi realiseerimise, relativistliku jäägi ja efemeriidi põhja SUURUSJÄRGUD on modelleeritud eelarve eraldised (dokumenteeritud vaikeväärtused, kutsuja poolt tühistatavad), mitte mõõtmised. Panus on (stsenaariumifaili kommentaar, read { "13" } kuni { "18" })

# text
seg-8f884949bdf1 = Kellaklassipõhine Kuu aja ristumise tabel on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-5eaed32490ca = Kuu ajavea eelarve reprodutseeritavus on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-988e99fc26be = <s1>Eelmine</s1>lunar-station-coverage

# text
seg-a0992d394960 = <s1>Järgmine</s1>lunar-time-offset
