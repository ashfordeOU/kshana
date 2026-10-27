# docs--schema: translations (et)

# text
seg-2247a2344710 = Tähendus

# text
seg-f42465f7d066 = ns

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-6940543aa3c0 = string

# text
seg-f5e7215e6835 = objekt

# text
seg-9da5d92757bd = objekt, valikuline

# text
seg-c353e7bec219 = Võti

# text
seg-a129b9e613d0 = Tüüp

# text
# c1: docs/SCHEMA.md
seg-e28387d70be0 = Allikas: <c1/>

# text
# c1: *.result.json
seg-49d2afecf5f1 = Tulemuse skeem — Kshana <c1/> lugemine

# text
# c1: RunResult
# c2: src/report.rs
# c3: FoMScores
# c4: src/fom.rs
seg-c128455c353c = Iga käivitus kirjutab stsenaariumi kõrvale versioonitud ja ennast kirjeldava JSON-i (JavaScript Object Notation) artefakti. See leht on käsitsi kirjutatud lugejajuht vahetusümbriku ning <b>kella ja orbiidi</b> tulemuste kujude kohta: iga välja <b>ühik</b>, kus see lähtekoodis arvutatakse ja kuidas seda lugeda. Kanooniline tüüp on <c1/> failis <a1><c2/></a1>; mõõdikud (figures of merit) on <c3/> failis <a2><c4/></a2>.

# text
seg-092ea1e33a05 = See <b>ei ole</b> täielik väljade teatmik. Mootor haldab palju rohkem liike kui need kaks ning iga liik väljastab oma paketi. Täielik teatmik — ühik, päritoluklass ja määratlus iga sisseehitatud liigi iga arvväärtusega välja kohta — on genereeritud, mitte käsitsi kirjutatud: vt allpool <a1>Ühikud ja päritolu väljade kaupa, iga liigi kohta</a1>.

# text
seg-e4c4b66a2f46 = Vahetusümbrik (KIF, Kshana Interchange Format) — artefakti ära tundmine ja versiooni kontrollimine

# text
# c1: Envelope
# c2: src/interchange.rs
seg-9b83bb817814 = Kshana artefakte saab pakkida neutraalsesse, ennast kirjeldavasse <b>vahetusümbrikku</b>, et kolmanda osapoole tööriist saaks faili ära tunda ja otsustada, kas see suudab seda lugeda, <em>enne</em> kui ta võtab ette sisuskeemi. Kanooniline tüüp on <c1/> failis <a1><c2/></a1>.

# text
# c1: "kshana-interchange"
# c2: FORMAT_TAG
seg-e4fd08930644 = Alati <c1/> (<c2/>) — nii tunneb võõras tööriist Kshana artefakti ära.

# text
# c1: MAJOR.MINOR
# c2: SCHEMA_VERSION
seg-abd853f2ce49 = <c1/> skeemiversioon (<c2/>, kogu crate'i ainus tõeallikas).

# text
# c1: "scenario"
# c2: "run-result"
# c3: "trade-study"
seg-ee9f238072f1 = Artefakti liik, nt <c1/>, <c2/>, <c3/> — võimaldab tarbijal suunata ilma sisu parsimata.

# text
# c1: Cargo.toml
seg-29ad4bedd64f = Crate'i versioon (<c1/>), mis sisu tekitas.

# text
# c1: Scenario
# c2: RunResult
seg-52f3e962c049 = Pakitud artefakt kanoonilise JSON-ina (<c1/>, <c2/>, …).

# text
# c1: MAJOR.MINOR
# c2: #[serde(default)]
# c3: Compatible
# c4: ForwardIncompatible
# c5: MajorIncompatible
# c6: Envelope::parse
seg-6fe0d7cd4165 = <b>Ühilduvuslepe.</b> Versioonid on kujul <c1/>. Uued väljad lisatakse atribuudiga <c2/> (<em>lisandav distsipliin</em>), seega suudab lugeja parsida iga artefakti, mille <b>peaversioon on sama ja alamversioon võrdne või vanem</b> (<c3/>). Rangelt <b>uuem alamversioon</b> (<c4/>) võib sisaldada välju, mida see lugeja ei suuda täita, ja <b>erinev peaversioon</b> (<c5/>) on struktuuriline katkestus — mõlemad lükkab tagasi <c6/>, mis kontrollib vormingu silti ja versiooni piiril, selle asemel et võõrast sisendit vaikselt valesti parsida.

# text
# c1: scenario + seed + engine_version
# c2: engine_version
# c3: scenario_hash
seg-f7ae91002e56 = <b>Determinism.</b> Ümbrik ei sisalda <b>ajatemplit</b> — seda nõuab Kshana reprodutseeritavuse lubadus (<c1/> reprodutseerib käivituse). Päritolu on kirjas väljal <c2/> ja kasuliku sisu enda väljal <c3/>.

# text
# c1: Envelope::payload_as::<T>()
# c2: Deserialize
# c3: Scenario
# c4: payload
seg-bb0b742d2df8 = Tüübitud tagasilugemine (<c1/>) töötab iga kasuliku sisu puhul, mis realiseerib <c2/> (nt <c3/>). Tulemuse artefaktid on kavandatult ainult serialiseeritavad ja neid loetakse toorest <c4/> JSON-väärtusena.

# text
seg-87be7aa00b17 = Ülemine tase (kella ja orbiidi paketid)

# text
seg-cc22d9206eb4 = Tüüp / ühik

# text
seg-3a821855c582 = Tulemuse skeemi versioon (mootori versioonist sõltumatu).

# text
# c1: Cargo.toml
seg-cc6dded799f9 = Crate'i versioon (<c1/>), mis faili tekitas.

# text
seg-5a69a99b9a87 = kuueteistkümnendsüsteemi sõne

# text
# c1: scenario + seed + engine_version
seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) kanoonilise stsenaariumi JSON-i üle — käivitus on reprodutseeritav väljast <c1/>.

# text
# c1: seed + 0x9e3779b97f4a7c15
seg-ba73ba76873e = RNG (juhuarvugeneraator) algväärtus (seed) kvantkäivituse jaoks (klassikaline kasutab <c1/>).

# text
seg-a688dd98c588 = nanosekundit

# text
# c1: threshold_ns
seg-24e0f04033fa = Ajastuse spetsifikatsioon: viga piirides ±<c1/> on „spetsifikatsiooni piires“.

# text
seg-f52388753a1a = stsenaarium

# text
# c1: ClockRun
seg-15b4082a6455 = objekt (<c1/>)

# text
seg-7d3b92769bf5 = Kvantanduri käivitus (vt allpool).

# text
seg-aa665b955931 = Klassikalise anduri käivitus võrdluseks.

# text
seg-152ae43896b3 = Selle dokumendi väljade ühikute/päritolu kaart, võtmeks välja tee. Vt allpool §Ühikud ja päritolu.

# text
# c1: figures
# c2: path
# c3: quantum.fom.timing_p95_ns
# c4: tier
# c5: VALIDATED
# c6: MODELLED
# c7: requirement
# c8: applicable
# c9: applicable
# c10: false
# c11: reason
# c12: security
# c13: fom.security
# c14: untiered
# c15: hybrid
# c16: fusion
# c17: clock
# c18: orbit
# c19: hybrid
# c20: fusion
# c21: fom_label::kind_figures
# c22: api::without_figure_tiers
# c23: lunar-station-coverage
# c24: docs/predictions/lunar-reference-station.md
# c25: figure_tiers
# c26: leo-ppp
# c27: solar-system
# c28: optical-atmosphere
# c29: sweep
# c30: sweep-nd
# c31: lunar-attack-surface
# c32: fom_label::KINDS_EXCLUDED_FROM_FIGURE_TIERS
seg-119bac9b3e6f = Iga raporteeritud mõõdiku (figure of merit) kontrollitase ning alati dokumendi viimane võti. <c1/> loetleb ühe kirje iga olemasoleva mõõdiku kohta: <c2/> (nt <c3/>), <c4/> (<c5/> = kontrollitud sõltumatu välise sõltumatu etaloni vastu, <c6/> = esimestest printsiipidest, sisemiselt testitud), <c7/> (kontrollimaatriksi rida, millest tase loetakse) ja <c8/>. <c9/> on <c10/>, koos väljaga <c11/>, väljale <c12/> igas stsenaariumis, kus ründekonfiguratsiooni pole: piir jääb väljale <c13/>, kuid see ei vasta küsimusele, mida stsenaarium esitab. <c14/> loetleb iga mõõdiku, mida ükski maatriksirida ei oma (positsioonimõõdikud liikidel <c15/> ja <c16/>), selle asemel et anda sellele tase. Väljastavad liigid <c17/> (üksikkäivitus ja Monte Carlo ansambel), <c18/>, <c19/> ja <c20/>, mis ehitavad selle oma käivituse sees, ning ({ "0.36" }, RM-04) kõik muud liigid oma peamiste mõõdikute jaoks, lisatuna pärast käivitust liigipõhisest tabelist <c21/>; <c22/> eemaldab selle tagasi tasemeta dokumendiks bait baidi haaval. Ei väljasta <c23/>, mille tulemus on külmutatud eelregistreeritud ennustus (<c24/>): sellel liigil pole väljal <c25/> midagi, kuni uus kuupäevastatud ennustus selle asendab. Samuti ei väljasta <c26/>, <c27/>, <c28/> ({ "0.37" }; saidipõhised massiivid), <c29/> ja <c30/>, millel pole skalaarset peamõõdikut, ega <c31/>, mille dokument on kompaktne JSON (<c32/> annab iga põhjuse), ega kampaania manustatud liikmedokumendid. Ei sisalda numbreid.

# text
# c1: samples_total
# c2: samples_with_fix
# c3: sigma_uere_m
# c4: best_pdop
# c5: median_pdop
# c6: best_position_sigma_m
# c7: median_position_sigma_m
# c8: sigma_uere_m
seg-1448f90f0086 = Orbiidipaketi geomeetria kokkuvõte: <c1/>, <c2/>, <c3/> (m, modelleeritud satelliidipõhine kaugusvea eelarve), <c4/> / <c5/> (mõõtmeteta) ja <c6/> / <c7/> (m, PDOP (positsiooni täpsuse halvenemise tegur) × <c8/>). <b>Ainult orbiidipakett.</b>

# text
# c1: [x, y, z]
seg-ae4f8eed06ac = massiiv <c1/> km, valikuline

# text
seg-d13d827f54b0 = Kasutajakosmoselaeva levitatud Maa-keskne inertsiaalne trajektoor, üks kirje iga valimiaja kohta. <b>Ainult orbiidipakett</b>; muidu välja jäetud. Ainult väljund — ei räsita.

# text
# c1: StudyMeta
seg-8f511d5de657 = objekt (<c1/>), valikuline

# text
seg-ea152e097d6f = Lisandav aruande metaandmestik (uuringu pealkiri, genereerimise tempel, autor, lahtiütlus). Puudumisel välja jäetud, nii et metaandmeteta käivitus on bait baidi haaval identne vana väljundiga. Ainult väljund — ei räsita.

# text
# c1: ClockRun
# c2: quantum
# c3: classical
seg-1041873fba1b = <c1/> (kumbki väljadest <c2/> / <c3/>)

# text
# c1: optical-sr-lattice
seg-3fa81140c10d = Anduri identifikaator (nt <c1/>).

# text
# c1: clock
seg-80765d202558 = Mudeli liik (nt <c1/>).

# text
seg-6bf458d964fe = Anduri parameetrite viide/allikas.

# text
seg-9145f04a557f = Kasutatud toored mudeliparameetrid.

# text
# c1: {t, error_ns, gnss}
seg-697940342a28 = massiiv <c1/>

# text
# c1: t
# c2: error_ns
# c3: gnss
# c4: nominal
# c5: degraded
# c6: denied
seg-b5f4216b55a2 = Sammupõhine ajarida: <c1/> sekundites, <c2/> ajastusviga <b>nanosekundites</b>, <c3/> üks väärtustest <c4/>/<c5/>/<c6/>.

# text
# c1: FoMScores
seg-7fba0b91b75e = objekt (<c1/>)

# text
seg-5c4b60012f0e = Hinnatud mõõdikud (allpool).

# text
# c1: {tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}
seg-1308a29c6a5b = massiiv <c1/>

# text
# c1: tau_s
# c2: adev
# c3: n_samples
# c4: noise
# c5: WhiteFm
# c6: edf
# c7: ci_lo
# c8: ci_hi
# c9: adev
# c10: allan.rs:overlapping_adev_curve
seg-bbd42065492c = Kattuv Alani hälve: <c1/> keskmistamisaeg (s), <c2/> mõõtmeteta suhtelise sageduse stabiilsus σ_y(τ), <c3/> selle punkti taga olev kattuvuste arv, <c4/> MDEV (modifitseeritud Alani hälve) tõusust tuvastatud astmeseaduse tüüp (nt <c5/>), <c6/> müratüübispetsiifilised efektiivsed vabadusastmed ning <c7/>/<c8/> χ²-põhine { "95" }% usaldusvahemik väärtusele <c9/> selle τ juures. Arvutatud failis <c10/>.

# text
# c1: filter_health.rs
seg-1e61fd18257f = Kalmani filtri kooskõla hinnang (NIS/NEES (NIS: normaliseeritud innovatsiooni ruut; NEES: normaliseeritud hindamisvea ruut) nende χ² vahemike suhtes), arvutatud failis <c1/>; jäetud välja käivituste puhul, mis seda ei hinda.

# text
# c1: FoMScores
# c2: fom
seg-9333864652b0 = <c1/> (objekt <c2/>)

# text
seg-ce9caeaefd87 = Hoiatus

# text
seg-b24de276d788 = RMS (ruutkeskmine) kella faasi (ajastuse) viga katkestuse jooksul.

# text
seg-53e5018ae276 = <b>ajastuse</b> mõõdik, mitte positsioon

# text
seg-8cdec6da2072 = 95. protsentiili ajastusviga katkestuse jooksul.

# text
seg-95f058adb809 = Halvima juhu (lühim) spetsifikatsiooni piires püsiv libisemine katkestuse lõikude lõikes.

# text
seg-48babfd3bd95 = <b>ruudustikuga piiratud</b> — alumine piir ajasammu lahutusel

# text
seg-41c08973baa1 = |vea| vähimruutude kasvukiirus katkestuse ajal.

# text
seg-707ee74c5c06 = murd [{ "0,1" }]

# text
seg-32e5fe6415f8 = Kogu käivituse osa, mille jooksul lahend oli spetsifikatsiooni piires.

# text
seg-361b3b923a45 = murd [{ "0,1" }] või null

# text
seg-5d55682f9349 = <b>Filtri enesekooskõla</b>: katkestuse valimite osa, mille tegelik viga jääb Kalmani k-σ piiri sisse.

# text
# c1: INTEGRITY.md
seg-636106cb4a40 = <b>MITTE</b> HPL/VPL/RAIM (HPL: horisontaalne kaitsetase; VPL: vertikaalne kaitsetase; RAIM: vastuvõtja autonoomne terviklikkuse seire) terviklikkus — vt <a1><c1/></a1>

# text
seg-f686ade3da21 = Kella stabiilsusest tulenev <b>analüütiline spuufimise tuvastatavuse piir</b>.

# text
# c1: applicable: false
# c2: figure_tiers
# c3: n/a (no attack)
seg-f8783db25141 = mõtet on sel vaid konfigureeritud rünnaku korral, seega kella- ja orbiidipaketid (mis ei konfigureeri ühtegi) märgivad selle väljal <c2/> kui <c1/> ja trükivad kokkuvõttes kui <c3/>; <b>mitte</b> mitme satelliidi RAIM-tuvasti

# text
seg-90e2980430b9 = Milline näeb välja „hea“

# text
# c1: adev_curve
# c2: holdover_s
# c3: security
seg-c1afc6f3c545 = <b>Vaiksem kell</b> (madalam <c1/>) annab pikema <c2/> ja kõrgema <c3/> tuvastatavuse piiri — see ongi kvant- ja klassikalise võrdlus.

# text
# c1: availability
seg-0fa38207813a = <c1/> lähedal väärtusele { "1.0" } tähendab, et süsteem püsis spetsifikatsiooni piires peaaegu kogu käivituse; pika katkestuse ajal langeb see mürarikkama kella puhul.

# text
# c1: integrity
seg-4dcba241d5a6 = <c1/> lähedal väärtusele { "1.0" } tähendab, et filtri enda ebakindluse piir oli oma vea suhtes aus — see on <em>enesekooskõla</em> väide, mitte inimelu ohutuse tagatis.

# text
seg-3099d75a04a5 = Muud stsenaariumi liigid

# text
seg-43cd9f67f384 = Iga muu liik väljastab oma tulemuse kuju. Mõned levinumad.

# text
# c1: pos_rms_m
# c2: pos_p95_m
# c3: CAPABILITY.md
seg-6b59ef9dfe85 = <b>inertsiaalne</b>: positsioonivaldkonna mõõdikud <b>meetrites</b> (<c1/>, <c2/>) — ühe telje (1-DOF (DOF: vabadusaste)), ühe algväärtusega (vt <a1><c3/></a1>).

# text
# c1: timing_spec_ns
# c2: position_spec_m
# c3: position_p95_m
# c4: position_holdover_s
# c5: pnt_holdover_s
# c6: figure_tiers
# c7: untiered
seg-3e3ec8985dde = <b>hübriid / liit</b>: <c1/> ja <c2/> ülemisel tasemel ning iga poole kohta ühe andurikomplekti ajastus- ja positsioonimõõdikud (<c3/>, <c4/> ja <c5/>, aeg kuni kumbki spetsifikatsioon rikutakse), koos väljaga <c6/>, mis on sarnane kellapaketi omaga ja milles positsioonimõõdikud on loetletud väärtusena <c7/>.

# text
# c1: src/spoof.rs
seg-e38e8a8adec8 = <b>spuufimine</b>: sammupõhine spuufimise nihe võrreldes kella tuvastuspiiriga, ning see, kas spuufimine jõudis enne tuvastamist spetsifikatsioonini (<c1/>).

# text
# c1: orbit
# c2: integrity
# c3: user_site
# c4: gnss-sim
# c5: jamming
# c6: leo-pvt
# c7: leo-pass
# c8: [skyline]
# c9: skyline
# c10: source
# c11: preset:<name>
# c12: preset:<name>+overrides
# c13: custom
# c14: open_fraction
# c15: max(mask_deg, skyline)
# c16: provenance
# c17: masked_by_skyline
# c18: epochs[]
# c19: integrity
# c20: jamming
# c21: gnss_measurements[]
# c22: gnss-sim
# c23: joint.epochs[]
# c24: leo-pvt
# c25: leo-pass
# c26: satellites[].pass.epochs_masked_by_skyline
# c27: units
# c28: src/skyline.rs
# c29: UNITS
# c30: SKYLINE.md
seg-dfd972d160e1 = <b>horisondijoon</b> (<c1/> ja <c2/> koos liikidega <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; olemas ainult siis, kui stsenaariumil on jaotis <c8/>, nii et ilma selleta stsenaarium ei muutu): ülemise taseme objekt <c9/> väljadega <c10/> (sõne: <c11/>, <c12/> või <c13/>), <c14/> (osa [{ "0,1" }] ülemise poolsfääri ruuminurgast kõrgusel <c15/>) ja <c16/> (sõne); valimi kohta <c17/> (maski kohal, kuid horisondijoone taga olevate satelliitide arv: <c18/> liikidel <c19/> ja <c20/>, <c21/> liigil <c22/>, <c23/> liigil <c24/>); ning liigi <c25/> puhul <c26/> (epohhide arv). Nende ühikud ja päritoluklassid on blokis <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

# text
# c1: field-units-schema.json
# c2: SCENARIOS.md
# c3: *Result
# c4: src/
seg-d113122b7454 = Mis tahes liigi täpse väljakomplekti leiab selle kirjest failis <a1><c1/></a1> (allpool), liigi jaotisest failis <a2><c2/></a2> või vastavast <c3/> struktuurist kataloogis <c4/>.

# text
seg-e0c63207c019 = Muud failid, mille käivitus kirjutab

# text
# c1: <scenario>.result.json
# c2: <scenario>.chart.svg
# c3: <scenario>.report.html
# c4: <scenario>.report.json
# c5: reproducibility
# c6: REPORTS.md
# c7: REPRODUCIBILITY.md
# c8: <scenario>.table.csv
# c9: --export
# c10: INTEROP.md
# c11: --animate
# c12: ANIMATION.md
seg-cc97989ca06b = Lisaks failile <c1/> kirjutab CLI (käsurea liides) faili <c2/>, trükitava <c3/> ja sama aruande failina <c4/>, mille <c5/> plokk salvestab mootori versiooni, stsenaariumifaili SHA-256, algväärtuse (seed), platvormi ja täpse käsu (vt <a1><c6/></a1> ja <a2><c7/></a2>). Liigid, mis avaldavad reprodutseeritavuse tabeli, kirjutavad ka faili <c8/> (CSV: komadega eraldatud väärtused). <c9/> kirjutab vahetusfaile (vt <a3><c10/></a3>) ja <c11/> animatsiooni (vt <a4><c12/></a4>).

# text
seg-489953601f3b = Ühikud ja päritolu väljade kaupa, iga liigi kohta

# text
seg-61b33dbb44dd = See leht on käsitsi kirjutatud ja katab kella- ja orbiidipaketid. Masinloetav vaste katab <b>iga</b> sisseehitatud liigi:

# text
# c1: units
# c2: {"unit", "provenance", "note"}
# c3: []
# c4: *
# c5: src/field_schema.rs
seg-1e20fcda7f0b = <b>Tulemuses endas.</b> Iga stsenaariumi tulemusdokument kannab ülemise taseme objekti <c1/>, mis seostab väljastatud välja tee väärtusega <c2/>. Tee grammatika (massiiv annab ühe <c3/>-lõpuga lõigu, mida jagavad selle read; <c4/> on ühelõigulise metamärgi andmevõtmetega objektidele) ja suletud päritolusõnavara on määratletud failis <a1><c5/></a1>.

# text
seg-b8256437c0b7 = Ühe failina.

# text
# c1: field-units-schema.json
# c2: coverage
seg-ae7136e34306 = <a1><c1/></a1> on kokku korjatud ühend: iga liigi iga arvväärtusega välja kohta, mille ta väljastab nimetatud allikast, koos ühiku, päritoluklassi, tõendustaseme ja määratlusega — ning iga väli, millel seda veel pole, on nimetatud, mitte välja jäetud. Selle <c2/> plokk kannab arve.

# text
# c1: tests/field_units_global.rs
# c2: UNCOVERED_KINDS
seg-66af6dc065f7 = Mõlemat jõustab <c1/>, mis käivitab iga registreeritud liigi ja kukub läbi, kui väljastatud arvväärtusega väljal puudub ühik ja päritoluklass. Liigid, mis pole veel kaetud, on nimetatud eraldi selle faili väljal <c2/> koos iga lahtise põhjusega ning arv on kinnitatud, nii et loend saab ainult lüheneda.

# text
# c1: units
seg-ca49a577a07b = Genereeri JSON uuesti pärast mis tahes muudatust aruande kujus või bloki <c1/> sisus:

# text
seg-ce4351cf7673 = <s1>Eelmine</s1>Stsenaariumi teatmik

# text
seg-b988dcc329a4 = <s1>Järgmine</s1>Päris TLE-de kasutamine

# text
seg-6585c8a3643d = ClockRun (kumbki väljadest quantum / classical)

# text
seg-299f8a9643f1 = FoMScores (objekt fom)
