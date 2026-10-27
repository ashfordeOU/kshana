# docs--real-tle-guide: translations (et)

# text
seg-a6da23b43f90 = <s1>Järgmine</s1>Kampaaniad

# text
# c1: docs/REAL_TLE_GUIDE.md
seg-bc9ae2eda129 = Allikas: <c1/>

# text
seg-68b27f011ced = Reaalsete konstellatsiooni TLE-de kasutamine

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum = true
# c4: tests/fixtures/celestrak/gps-ops_2021-07-28.txt
# c5: scripts/fetch_tles.sh
seg-109e8a920fc2 = Kaasasolev <c1/> kannab juba <b>reaalseid TLE-sid</b> (kaherealised elemendikomplektid): Celestraki <c2/> hetktõmmis töötavast GPS-i (globaalne positsioneerimissüsteem) konstellatsioonist, mis on kataloogitud 2021-07-28, { "30" } satelliiti, koos <c3/>. Iga satelliiti propageeritakse SGP4/SDP4-ga (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), mida on valideeritud ametlike AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 vektorite vastu. Sama hetktõmmis on varustatud kujul <c4/> ja <c5/> toob värske. Lugege jaotist { "3" } enne, kui sellest geomeetria arvu tsiteerite: see stsenaarium propageerib iga satelliiti tema enda epohhist.

# text
# c1: scenarios/orbit-real-tle.toml
# c2: orbit
# c3: tle
seg-faed28835cb2 = Sünteetilise, isemajandava näite jaoks annab <c1/> kuus GPS-i taolist satelliiti paljaste rea-2 kirjetena, propageerituna analüütiliste Kepleri elementidena, ning iga <c2/> stsenaarium ilma plokita <c3/> ehitab Walkeri konstellatsiooni.

# text
seg-1c9b96a07f5b = <b>Praeguse</b> GPS-i konstellatsiooni (või mis tahes muu) uurimiseks lisage värske hetktõmmis.

# text
seg-95bb71044de0 = { "1" }. Laadige alla praegune hetktõmmis

# text
seg-ab93ab55ddd9 = <a1>Celestrak</a1> levitab NORADi (North American Aerospace Defense Command) kataloogi elemendikomplekte, mida värskendatakse vähemalt iga päev. GPS-i jaoks:

# text
# c1: galileo
# c2: glo-ops
# c3: beidou
# c4: stations
seg-da7b4b89848b = Muud kasulikud rühmad: <c1/>, <c2/> (GLONASS, Venemaa globaalne satelliitnavigatsioonisüsteem), <c3/>, <c4/> (ISS, rahvusvaheline kosmosejaam, ja muud pilootidega jaamad).

# text
seg-d7fe0dccbc36 = Fail on kolmerealiste kirjete jada (nimi, rida { "1" }, rida { "2" }). Kshana parser ignoreerib nimeridu, seega võite faili kleepida nii, nagu see on.

# text
seg-c2d6ca2089a1 = { "2" }. Lisage see stsenaariumi

# text
# c1: tle
seg-6e221c5b640a = Mis tahes orbiidistsenaariumis määrake konstellatsiooni <c1/> plokk hetktõmmise sisuks:

# text
seg-f2b0e78ef568 = (PRN on pseudojuhusliku müra koodi number, mida GPS-satelliit edastab.)

# text
seg-976bcb48df94 = Rea { "1" } + rea { "2" } paari propageeritakse <b>SGP4/SDP4</b>-ga (takistuse ja sügavkosmose liikmed); paljast rida { "2" } käsitletakse analüütiliste Kepleri keskmiste elementidena. Neid võib segada.

# text
# c1: strict_checksum = true
# c2: false
seg-fa1d59fc7817 = <c1/> lükkab tagasi iga rea, mille veerus 69 olev modulo-10 kontrollsumma on vale — hea terviklikkuse kontroll värskelt allalaaditud faili jaoks. Selle vaikeväärtus on <c2/>, sest sünteetilised õppestsenaariumid kasutavad kohatäitjana kontrollsummasid.

# text
seg-90d3872ebf87 = { "3" }. Märkused epohhide kohta — lugege seda enne, kui tsiteerite geomeetria arvu

# text
# c1: parse_propagators
# c2: src/tle.rs
# c3: t
# c4: tsince = t
seg-5e9056a30d53 = SGP4 propageerib iga satelliiti <b>tema enda TLE epohhist</b> ja <c1/> (kohas <c2/>) tagastab ainult propageerijaid, seega rakendatakse stsenaariumi aega <c3/> kujul <c4/> igale satelliidile eraldi. See on õige konventsioon ainult siis, kui kõigil failis olevatel elemendikomplektidel on ühine epohh.

# text
seg-3d04797ae50e = <b>Celestraki rühmafail ei anna seda.</b> Fail <em>laaditakse alla</em> ühel hetkel, kuid iga satelliidi elemendikomplekti värskendatakse omal sagedusel, seega on selles olevad epohhid hajutatud päevade peale. Mõõdetud siin hoidlas varustatud komplektidel (rida { "1" }, veerud { "19" }–{ "32" }):

# text
seg-5f67557dd207 = fikstuur

# text
seg-ce4855643f31 = komplekte

# text
seg-49a5b4798be4 = epohhide hajuvus

# text
seg-b758a9b7ee02 = { "70.6" } h

# text
seg-79e6ea88957c = { "76.4" } h

# text
seg-e1e30f69fa4f = { "335.7" } h

# text
# c1: orbit
# c2: integrity
seg-9d38cc073c94 = { "70.6" } h on { "5.9" } GPS-i tiiru. Sellisena propageerituna on tasandisisene faasimine segi: satelliidid on õigetel kõrgustel ja kaldenurkadel, kuid mitte seal, kus nad olid ühelgi päeval, seega kirjeldavad nähtav hulk, DOP (täpsuse halvenemise tegur) ja neist arvutatud kättesaadavus konstellatsiooni, mida kunagi ei eksisteerinud. Parser ei mõõda seda hajuvust teie eest ning liigid <c1/> ja <c2/> ei joonda epohhe: stsenaariumi TLE-plokki propageeritakse alati satelliidi-epohhi kaupa.

# text
# c1: tsince
# c2: Tle::epoch_days_1950
# c3: tests/igs_real_data.rs
# c4: real_gps_tle_snapshot
seg-fa82a18e4418 = <b>Tehke selle asemel nii.</b> Hoidke epohh propageerija kõrval, valige üks võrdlushetk ja nihutage iga satelliidi <c1/> selle suhtes. <c2/> on avalik, seega on parsimistsükkel lühike; <c3/> (<c4/>) on selle puu läbitöötatud näide:

# text
# c1: tests/igs_real_data.rs
# c2: teme_to_ecef
seg-78092818695e = TEME on tõelise ekvaatori, keskmise pööripäeva koordinaatsüsteem, milles SGP4 töötab; <c1/> pöörab selle Maaga seotud koordinaatideks kasutades <c2/>.

# text
seg-78f483dfc3fa = Kui te ei joonda, öelge seda arvu esitades: see on väide orbiidi<em>kihtide</em> kohta, mitte reaalse taeva kohta.

# text
# c1: tests/araim_dual_real_data.rs
seg-34fddbd3d57f = Kui palju see loeb, on mõõdetud failis <c1/>, mis rakendab samu nihkeid (võrdlushetk: kombineeritud GPS + Galileo fikstuuride hiliseim epohh, 2026-06-07T07:{ "21" }:{ "04" } UTC (koordineeritud maailmaaeg)) { "24" } h kahe konstellatsiooni ARAIM-i (täiustatud vastuvõtja autonoomne terviklikkuse monitooring) kättesaadavuse jooksul. VAL-i (vertikaalne hoiatuspiir) { "12" } m korral annab joondatud taevas ainult GPS-i { "0.993" }, ühendatud GPS+Galileo { "1.000" } ja konstellatsioonirikke suhtes vastupidava kahe konstellatsiooni { "0.990" }; joondamata satelliidi-epohhi kaupa konventsioon annab samade sisendite jaoks { "0.208" }, { "0.671" } ja { "0.031" } — erinev järeldus, mitte väike viga.

# text
# c1: README.md
seg-49f6c8f71d99 = <a1><c1/></a1> — orbiidistsenaariumid.

# text
# c1: SCENARIOS.md
# c2: orbit
# c3: integrity
# c4: gnss-sim
# c5: jamming
# c6: constellation-design
# c7: constellation
# c8: ephemeris
# c9: tle
seg-c842884cb3e7 = <a1><c1/></a1> — liigi <c2/> väljad; liigid <c3/>, <c4/>, <c5/> ja <c6/> võtavad sama tabeli <c7/> ning <a2><c8/></a2> võtab ühe <c9/>.

# text
# c1: INTEGRITY.md
seg-a2c5db6dcf42 = <a1><c1/></a1> — ARAIM-i mootor, mida reaaltaeva test juhib.

# text
# c1: src/tle.rs
# c2: parse_propagators
# c3: ParseOpts { strict_checksum }
seg-106047488885 = <c1/> — parser (<c2/>, <c3/>).

# text
seg-c9068c1bc579 = <s1>Eelmine</s1>Tulemuse skeem
