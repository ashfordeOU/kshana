# docs--provenance: translations (et)

# text
seg-9a2a5f0a8a02 = Päikesesüsteem

# attr:aria-label, text
seg-d01db1c2710a = Teatmik

# text
seg-28e87f407a10 = Valdkond

# text
seg-ad856ad710eb = Staatus

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-638b8d451550 = Sensor

# text
seg-d4a762001549 = Litsents

# text
seg-60cd077d82a7 = Mudel

# text
seg-2afa300864a9 = Parameetrid

# text
seg-32b620b3574e = Kasutus

# text
# c1: docs/PROVENANCE.md
seg-f3de25879362 = Allikas: <c1/>

# text
seg-257526f1f93f = Päritolu — iga parameeter on jälgitav avaldatud allikani

# text
seg-8c12958898a8 = Kshana keskne ausa tegutsemise distsipliin on see, et <b>iga anduriparameeter, füüsikaline mudel ja valideerimisandmestik on jälgitav avaldatud allikani</b> — andmeleht, retsenseeritud artikkel, signaal kosmoses ICD (liidese kontrolldokument) või standard. See dokument koondab need päritolustringid üheks tsiteeritavaks viitetabeliks.

# text
# c1: [clock_quantum]
# c2: [clock_classical]
# c3: provenance
# c4: ModelSpec
# c5: src/types.rs
# c6: with_provenance
# c7: src/inertial/imu_errors.rs
# c8: quantum.spec.provenance
# c9: classical.spec.provenance
# c10: units
# c11: input
# c12: computed
# c13: closed-form
# c14: internal-consistency
seg-279914171c2e = Päritolu ei ole ainult dokumentatsioon: iga stsenaariumi andurite tabel (näiteks <c1/> ja <c2/>) kannab <c3/> stringi (<c4/> failis <c5/>; <c6/> failis <c7/> inertsiaalmõõteseadme (IMU) veamudeli jaoks), mis <b>voolab läbi tulemuse JSON-i</b> (JavaScript Object Notation) kujul <c8/> ja <c9/>, nii et iga käivitus kannab oma parameetriviiteid. Tulemuse <c10/> plokk märgib ka iga numbrivälja päritoluklassiga (<c11/>, <c12/>, <c13/>, <c14/>, …). Allolevad tabelid on nende stringide koondatud, inimloetav register, pluss algoritmiline ja valideerimise päritolu lähtekoodi kommentaaridest.

# text
# c1: VALIDATION.md
# c2: validated
# c3: modelled
# c4: not modeled
# c5: QUANTUM-MODELS.md
seg-683fd369407a = Küpsus on kogu ulatuses ausalt märgitud: <b>lennukvalifitseeritud</b> (on lennanud), <b>maapealne labor / sondeerraketi</b> (demonstreeritud, mitte lennanud) või <b>kosmose-eesmärk maapealsel riistvaral</b> (püüdlik arv riistvara jaoks, mis pole lennanud — eelkõige iga strontsiumi optilise võre-kella arv). Vt <a1><c1/></a1> arvu kohta käivaid silte <c2/> / <c3/> / <c4/> ja <a2><c5/></a2> maapealse labori-vs-lennu küpsuse arutelu.

# text
seg-80834864bfdd = { "1" }. Kella ja sageduse etaloni parameetrid

# text
seg-305f560d4b08 = Põhiarv

# text
seg-c35a20fa2529 = Küpsus

# text
seg-302e481e5014 = Microchip (Microsemi) SA.45s / SA65 CSAC (kiibimõõtmetega aatomkell)

# text
seg-a000ca420690 = σ_y({ "1" } s) = { "3.0" }×{ "10" }⁻¹⁰

# text
seg-222707a1bde3 = Tootja andmeleht

# text
seg-97709a803dea = <b>lennukvalifitseeritud</b> (kasutusel olev kommertsosa)

# text
seg-75db01df1aea = Strontsiumi optiline võre-kell (kosmose-eesmärk)

# text
seg-f6f430d898ed = σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵

# text
seg-1996a1d92bb1 = Origlia, Schiller, Bongs jt, <a1>arXiv:{ "1503.08457" }</a1>

# text
seg-b8c64caf79f3 = <b>kosmose-eesmärk maapealsel riistvaral</b> — ükski Sr optiline kell pole lennanud

# text
seg-b5a006507475 = Strontsiumi optiline võre-kell (labori rekord)

# text
seg-8a6ca23b19a9 = σ_y({ "1" } s) = { "4.8" }×{ "10" }⁻¹⁷

# text
seg-b21bb1b6bf40 = Oelker jt, <em>Nature Photonics</em> ({ "2019" })

# text
seg-95fb87b3a118 = ainult maapealne labor

# text
seg-a36f415cccab = ACES/PHARAO (Atomic Clock Ensemble in Space / Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite; ISS (Rahvusvaheline Kosmosejaam) benchmark)

# text
seg-9d6acc3191a5 = suurusjärk { "1" }×{ "10" }⁻¹⁶ mitmepäevase integreerimise järel

# text
seg-1cddc44025d7 = ESA (Euroopa Kosmoseagentuur) ACES/PHARAO, ISS-il töös alates aprillist { "2025" } (tsiteerida ESA avaldatud tulemusi)

# text
seg-75b7bb5ca4c8 = <b>lennukvalifitseeritud</b> (mikrolaine/maser, mitte optiline)

# text
# c1: q_wf = σ_y(1 s)²
# c2: flicker_floor
# c3: VALIDATION.md
seg-aeb8f189db37 = Holdoveri mudeli kasutatav Alani valge sageduse koefitsient on <c1/>; flicker-sagedusmodulatsiooni (flicker FM) ja vananemist modelleeritakse ainult siis, kui <c2/> on selgelt seatud (vt <a1><c3/></a1>), vastasel juhul neid ei modelleerita.

# text
seg-bfe4524b6664 = { "2" }. Inertsiaalandurite parameetrid

# text
seg-5cd1984ba399 = Põhiarvud

# text
seg-53ad9ba8cecb = Exaili hübriidse kvantkiirendusmõõturi kolmik

# text
seg-b40c95a6bea5 = nihke stabiilsus { "6" }×{ "10" }⁻⁸ g = { "5.88" }×{ "10" }⁻⁷ m/s² ({ "24" } h); müra { "22" } µg/√Hz = { "2.16" }×{ "10" }⁻⁴ (m/s²)/√Hz

# text
seg-fdb8f1d648ba = Templier jt, <em>Science Advances</em> ({ "2022" }), <a1>arXiv:{ "2209.13209" }</a1>

# text
seg-570f41ff76c9 = Honeywell QA-2000 navigatsioonitaseme kvartskiirendusmõõtur

# text
seg-a7dbc9a9705e = nihke stabiilsus ~{ "160" } µg = { "1.57" }×{ "10" }⁻³ m/s²; müra ~{ "20" } µg/√Hz; nihke püsivus ~{ "1" } µg

# text
seg-3ad7ce01c6e2 = Tootja / Grovesi <em>AESS (Aerospace and Electronic Systems Society) õpetus</em>

# text
seg-37c841945d3e = IMU veamudel (skaalategur, nihe, g-tundlikkus, kvantimine, kiiruse ramp)

# text
seg-b7547264e608 = viis süstemaatilist kategooriat

# text
seg-2f20d848f9d3 = IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabel { "4.1" }

# text
seg-c24b9890cf3b = mudel

# text
seg-67a38b3fe143 = Strapdown mehhaniseerimine (NED, põhi-ida-alla; coning/sculling)

# text
seg-832b3645b515 = kvaternioon-asend §{ "2.2" }, §{ "5.5" }; NED mehhaniseerimine §{ "5.4" }; gravitatsioon §{ "2.4" }

# text
seg-58c85c15b0aa = Groves, <em>Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems</em>, 2. trükk

# text
seg-ac7ef2be17e0 = { "3" }. Aja ja sageduse edastamise parameetrid

# text
seg-7634c6f4b32c = Link

# text
seg-dddf65bbb231 = Vabaruumi optiline kahesuunaline (satelliitidevaheline)

# text
seg-e3a8990e650a = labori põhi ~{ "1" } fs; { "1" } ps orbiidil usutav sihtmärk

# text
seg-1adf3425eda9 = Giorgetta jt ({ "2013" }, <em>Nature Photonics</em>); Deschênes jt ({ "2016" }, <em>Physical Review X</em>)

# text
seg-9ab60d7ed2a9 = TWSTFT (kahesuunaline satelliitaja ja -sageduse edastamine, Ku-riba)

# text
seg-543939310789 = üksiksessioon ~{ "0.5" } ns

# text
seg-7f6127bdb4d9 = BIPM (Rahvusvaheline Mõõtude ja Kaalude Büroo) / PTB (Physikalisch-Technische Bundesanstalt, Saksamaa riiklik metroloogiainstituut) / NIST (National Institute of Standards and Technology)

# text
seg-d1f0ed9c0323 = { "4" }. Orbiidi, ajasüsteemi ja tugisüsteemi mudelid

# text
seg-2ad53ecbee02 = Võrrand / standard

# text
seg-7ed15b9389e0 = Viide (allikakommentaar)

# text
seg-4d6989c7153e = SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }) levitamine

# text
seg-0d46975247cc = WGS-72 (WGS: World Geodetic System) SGP4 mudel

# text
seg-6dcfe89aeb8f = Vallado jt, <em>„Revisiting Spacetrack Report #3“</em>, <b>AIAA (American Institute of Aeronautics and Astronautics) 2006-6753</b> ({ "2006" })

# text
seg-e46bf46a4d35 = Liikumissekundi / ajasüsteemid (UTC/TAI/TT/UT1 (UTC: koordineeritud maailmaaeg; TAI: rahvusvaheline aatomaeg; TT: maaaeg; UT1: maailmaaeg { "1" }, Maa pöörlemise aeg))

# text
seg-7505e93b9bf8 = täisarvuliste liikumissekundite režiim alates 1972-01-01

# text
seg-0ea35809be61 = IERS (International Earth Rotation and Reference Systems Service) Conventions ({ "2010" }); liikumissekundite ajalugu IERS Bulletin C-st

# text
seg-d25f68665f8e = Maa pöörlemisnurk

# text
seg-a3a803bdc8a0 = IAU (Rahvusvaheline Astronoomia Liit) { "2000" } resolutsioon B1.8

# text
seg-049ad81ff5e8 = Edastatud efemeriidi SV (kosmoseaparaat, st satelliit) asukoht/kell

# text
# c1: F·e·√A·sin Eₖ
# c2: TGD
seg-a1a595008b2a = kasutaja algoritm, relativistlik <c1/>, <c2/>

# text
seg-8e2e3089e2e6 = IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.4.3.1" } / §{ "20.3.3.3.3.1" }

# text
seg-8e14a54b1f09 = Galileo / QZSS (Jaapani Quasi-Zenith Satellite System) / BeiDou efemeriidi konstandid (μ, Ω̇ₑ, C̄₂₀)

# text
seg-93b03e3b3e43 = süsteemipõhised SIS ICD-d (liidese kontrolldokumendid)

# text
seg-c7c6759c0373 = Galileo OS (Open Service) SIS ICD; BeiDou OS SIS ICD (CGCS2000, Hiina geodeetiline koordinaatsüsteem { "2000" }); GLONASS (Venemaa ülemaailmne satelliitnavigatsioonisüsteem) ICD (PZ-90 (PZ: Parametry Zemli, Venemaa geodeetiline datum))

# text
seg-7d59b9c3dabc = { "5" }. GNSS-i mõõtmisdomeeni ja vastupidavuse mudelid

# text
seg-dd7e88cfd703 = Klobuchari ühesageduslik ionosfäär

# text
seg-9920eb06b90c = poolringi algoritm

# text
seg-f96f24cbe154 = IS-GPS-200 §{ "20.3.3.5.2.5" }

# text
seg-0358759614c5 = Saastamoineni zeniiditroposfäär

# text
seg-b4b7f91f6112 = hüdrostaatiline + märg zeniidiviivitus

# text
seg-ba06204996b7 = Davis jt ({ "1985" }); Groves §{ "9.4" }

# text
seg-9fc988ebf2aa = Nielli kaardistusfunktsioonid

# text
seg-8eb79ff7faaa = hüdrostaatiline ja märg, kõrguse kaardistus

# text
seg-ca4642e37561 = Niell ({ "1996" })

# text
seg-7876aa9fc732 = Segamisvastane sidelingi eelarve

# text
# c1: [1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹
seg-75e1c40bdc0f = <c1/> (C/N₀ kandja ja müra tiheduse suhe, J/S segamise ja signaali suhe, Q spektraalse eraldumise tegur, Rc kiibisagedus) → efektiivne C/N₀ → lukukaotus

# text
seg-7afcd0de9ae8 = Kaplan ja Hegarty, <em>Understanding GPS/GNSS</em>, 3. trükk, §{ "9.4" }

# text
seg-c6e2f2ee16cb = Spuufimise / energia tuvastamine

# text
seg-15390c9b849c = Neyman–Pearson / kahepoolne χ²₁ energia test; Φ⁻¹ Acklami meetodil; erf Abramowitzi ja Stegun { "7.1.26" } järgi

# text
seg-1c30c0b6a81f = klassikaline tuvastusteooria

# text
seg-023867611249 = Alani perekonna stabiilsus (ADEV/MDEV/TDEV/HDEV (ADEV: Alani hälve; MDEV: modifitseeritud Alani hälve; TDEV: ajahälve; HDEV: Hadamardi hälve))

# text
seg-478bb58f8a7f = usaldusvahemikega

# text
seg-2abd4df32f9c = NIST SP (Special Publication) { "1065" } (Riley); Kasdin, <em>Proc. IEEE</em> ({ "1995" })

# text
seg-a958238e3d1c = RAIM (vastuvõtja autonoomne terviklikkuse seire) / terviklikkus (HPL/VPL (HPL: horisontaalne kaitsetase; VPL: vertikaalne kaitsetase), ARAIM (täiustatud vastuvõtja autonoomne terviklikkuse seire) lahendite eraldamine)

# text
seg-41b219635fbe = hetktõmmis ja lahendite eraldamine

# text
# c1: INTEGRITY.md
seg-b971eeb2bf2b = vt <a1><c1/></a1>

# text
seg-926261321371 = { "6" }. Valideerimisandmestikud

# text
# c1: scripts/fetch_*.sh
# c2: realdata-cache/
seg-04863ce407e7 = <b>Hoidlasse kopeerimise poliitika.</b> Kommitakse sõna-sõnalt koopia iga valideerimisandmestikust, mille litsents lubab levitamist <em>ja</em> mille suurus mahub mugavalt gitti, nii et kloon saab valideerimise reprodutseerida võrguühenduseta, ilma võrguta ja ilma lingi kõdunemiseta. Andmestik on <b>laadimisega piiratud</b> (alla laaditud <c1/> abilisega git-ignoreeritud kataloogi <c2/>, kommitituna ainult väike <em>tuletatud</em> etalonväärtuste komplekt) ainult siis, kui selle litsents ei luba selgelt levitamist või kui see on gitti jaoks liiga suur. Iga piiratud andmestik märgib allpool oma konkreetse põhjuse; midagi ei piirata mugavuse pärast.

# text
seg-b966dd26caa6 = Andmestik

# text
seg-e0351f9b83fc = Hoidlasisene staatus

# text
seg-ea1ad9965f74 = AIAA 2006-6753 SGP4 testivektorid (kõik { "666" })

# text
seg-cb7efe21070c = SGP4 numbriline valideerimine — halvim { "4.12" } mm

# text
seg-a624c6877c48 = Avaldatud etalonvektorid (Vallado, AIAA)

# text
seg-d90675af2816 = Hoidlasse kopeeritud

# text
seg-c1cee31c42df = ⁸⁸Sr optilise kella ADEV σ_y(τ) (Norcia jt, Science { "366" }:{ "93" }, { "2019" })

# text
seg-232e54a0e396 = optilise kella mõõdetud stabiilsuse sobituse valideerimine

# text
seg-3345cefbfa3c = <b>CC-BY-4.0</b> (Creative Commons Attribution { "4.0" }; Zenodo 10.5281/zenodo.3382347)

# text
seg-2bb00a0c58ef = NASA/USGS (NASA: riiklik aeronautika- ja kosmoseamet; USGS: USA geoloogiateenistus) SRTM (Shuttle Radar Topography Mission) v3 kõrgusplaat N36W117 (Death Valley, detsimeeritud 6 kaaresekundini, { "722" } KB)

# text
# c1: .hgt
seg-088a57c3a5b1 = maastiku-DEM-i (DEM: digitaalne kõrgusmudel) <c1/> lugeja valideerimine päris reljeefil (Badwateri bassein ≈ −{ "86" } m)

# text
# c1: elevation-tiles-prod
seg-ed90325543c8 = <b>Avalik omand</b> (NASA/USGS SRTM v3; AWS (Amazon Web Services) Open Data <c1/> kaudu)

# text
seg-9607b2318cf5 = CCSDS 502.0/503.0 Blue Book OEM/TDM (OEM: orbiidi efemeriidisõnum; TDM: jälgimisandmete sõnum) näited

# text
seg-b53475918422 = CCSDS parseri ringkäigu valideerimine

# text
seg-25d9f396b539 = Avaldatud standardinäited (CCSDS)

# text
seg-35dfb14360e3 = IGS (International GNSS Service) SP3 (Standard Product { "3" }, täppisorbiidi vorming) täppisorbiit + RINEX (Receiver Independent Exchange Format) navigatsioonivalimid

# text
seg-5e321b8b5287 = orbiidisobituse + terviklikkuse valideerimine

# text
seg-ec0b6ff10fc5 = IGS avaandmed (vabalt mis tahes kasutuseks, viitamisega)

# text
# c1: gps-ops
# c2: galileo
seg-00db9583ce55 = Celestraki TLE (kaherealine elemendikomplekt) hetktõmmised (<c1/>, <c2/>)

# text
seg-4dabd0f62f90 = päris konstellatsiooni stsenaariumid

# text
seg-6e7c8deb24b6 = Celestraki tingimused (viitamisega; USA valitsuse päritolu (US: Ameerika Ühendriigid) TLE-d (kaherealised elemendikomplektid))

# text
# c1: tests/fixtures/celestrak/
# c2: scripts/fetch_tles.sh
seg-2827577f7008 = <c1/> + reaalajas <c2/>

# text
seg-c0945969860a = scipy / scikit-learn / filterpy etalonväljundid

# text
seg-61546d769e23 = numbriliste tuumade + hindajate valideerimine

# text
seg-b74e03fddbca = Genereeritud kohapeal BSD/MIT (BSD: Berkeley Software Distribution litsents) teekidest

# text
# c1: tests/fixtures/scipy/
seg-9d818fc79012 = <c1/> (+ generaatoriskriptid)

# text
seg-4d6c3069b01f = Stable32 etalonhälbed (dekaadide ADEV/HDEV redelid)

# text
seg-0a7b677330a6 = Alani hindajate samaväärsus

# text
seg-3c91f9ae6473 = Tuletatud kokkuvõtteväärtused (väikesed)

# text
seg-14aecb331164 = 5071A tseesiumi <b>toor</b> faasirida ({ "556 990" } punkti, { "12" } MB)

# text
seg-9d43f399613b = kattuv ADEV/HDEV päris Cs kellal

# text
# c1: allantools
seg-87b53409bedb = <b>Ebaselge</b> — <c1/> on LGPL-3.0 (GNU Lesser General Public License, tarkvaralitsents) <em>ilma selgesõnalise andmete levitamise loata</em>; fail on PyPI (Python Package Index) distributsioonist välja jäetud

# text
# c1: scripts/fetch_cs5071a.sh
seg-b741be74c8ad = <c1/>; tuletatud redelid kommitud

# text
seg-5e07eabcfe78 = <b>toor</b> PHASE.DAT (1000-punktiline regressiooniseeria)

# text
seg-d9f61f4b985c = Stable32 hindajate samaväärsuse seeria

# text
seg-df8e0a135895 = <b>Ebaselge</b> — levitatakse kommertsliku Stable32-ga (Hamilton Technical Services); NIST SP { "1065" } on avalik omand, kuid ei prindi väärtusi

# text
# c1: scripts/fetch_phasedat.sh
seg-332b36d2b91f = <c1/>; tuletatud redelid kommitud

# text
seg-dd2ee7a9f1fa = JammerTest { "2024" } GNSS-i segamise/spuufimise salvestis ({ "1.4" } GB)

# text
seg-20065daf2305 = vastupidavuse/anomaalia stsenaariumi kalibreerimine

# text
seg-a4410133d410 = GPL-3.0-or-later (GNU General Public License; Zenodo 10.5281/zenodo.15910563) — levitamine lubatud, kuid <b>suurus ületab GitHubi { "100" } MB failipiiri</b> ja GPL copyleft on vastuolus AGPL-i (Affero General Public License) puuga

# text
seg-d4c7d2f9ea0d = <b>Laadimisega piiratud</b>; viidata DOI-le (digitaalse objekti identifikaator)

# text
seg-c0e39f83efcd = Iga laadimisega piiratud andmestiku litsentsi staatust uuriti ülesvoolu autoriteedi vastu; kaks „ebaselget“ kellaandmestikku jäävad piiratuks, kuni selgesõnaline levitamisluba on olemas (väärtused, mida meil <em>on</em> õigus avaldada, kommitime juba), ja JammerTest komplekt on piiratud suuruse/copyleft-põhjustel hoolimata oma avatud litsentsist.

# text
seg-e104e19931d4 = { "7" }. Uuemad valdkonnad — kust nende parameetrid pärinevad

# text
# c1: VERIFICATION-MATRIX.md
seg-c11f7c73d10b = Pärast ülaltoodud tabeleid lisatud liigid hoiavad sama reeglit. Iga rida nimetab allika ja sellele ehitatud võimekuse kontrollmaatriksi staatuse (täielik rida on failis <a1><c1/></a1>).

# text
# c1: telecom-timing
seg-5d2c25dd2ff3 = Telekommunikatsiooni ajastus (<c1/>)

# text
seg-c2ae6b1fe666 = sünkroniseerimismaskid

# text
# c1: TELECOM-TIMING.md
seg-e247606fe749 = ITU-T (Rahvusvahelise Telekommunikatsiooni Liidu telekommunikatsiooni standardimissektor) soovitused, iga piir koos oma tabeli või klauslitega, loetletud failis <a1><c1/></a1>

# text
seg-1150ab344107 = MODELLED (ümberkirjutus)

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-01d31590ca44 = ostsillaatori eelseadistused <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: TELECOM-TIMING.md
seg-9a4c0c214c54 = neli Microchipi andmelehte, dokumendinumbrid failis <a1><c1/></a1>

# text
seg-a03ea8950ab0 = MTIE (maksimaalne ajavahemiku viga) ja TDEV (ajahälve) hindajad

# text
# c1: tests/fixtures/telecom_timing/
seg-389e18e1a900 = allantools { "2024.06" } failil <c1/>

# text
# c1: solar-system
# c2: body-pnt
seg-29edfc0f6a6d = Päikesesüsteem (<c1/>, <c2/>)

# text
seg-df22756e5209 = planeetide asukohad JPL-i (Jet Propulsion Laboratory) Standishi Kepleri elementidest

# text
# c1: tests/fixtures/solar_system/
seg-194e3a13d51a = kontrollitud JPL Horizons DE441 (Development Ephemeris { "441" }) olekuvektorite vastu failis <c1/>

# text
seg-6d23934b3cb7 = VALIDATED; Uraan, Neptuun, Pluuto ja kuud MODELLED

# text
seg-a2624ce2e89a = iga keha gravitatsiooniparameetrid, raadiused ja pöörlemine

# text
seg-4d501821b508 = JPL Horizonsi kehakirjed ja JPL satelliidi füüsikaliste parameetrite tabel

# text
# c1: constellation-design
seg-f2715a76f0ec = Konstellatsiooni kavandamine (<c1/>)

# text
seg-784e471cdada = nominaalsed GPS-i, Galileo ja GLONASS-i pesad

# text
seg-479ddafe5925 = Galileo Open Service Service Definition Document { "1.1" }; GPS Standard Positioning Service Performance Standard, 5. väljaanne

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pvt
seg-b5e3dc8605b1 = LEO (madal Maa orbiit) PNT (<c1/>, <c2/>, <c3/>)

# text
seg-0a535468ad51 = nimelised süsteemieelseadistused

# text
seg-aae7fe16f69a = viidatud avalikud arvud, iga eelseadistus koos oma allikaga

# text
# c1: leo-navmsg
seg-a72c37136e3a = LEO navigatsioonisõnum (<c1/>)

# text
seg-ac50550a250f = signaal kosmoses kaugusvea kaalud

# text
seg-5dae296d5484 = Montenbruck, Steigenberger ja Hauschild ({ "2018" }), <em>Advances in Space Research</em>

# text
seg-9148986e8610 = 22-parameetriline efemeriidimudel

# text
seg-5b82ad0bd2c9 = Liu jt ({ "2025" }), <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }

# text
seg-2080b4fc31a8 = Diagrammi päritolu jalus

# text
# c1: *.chart.svg
# c2: *.report.html
seg-22d0b06d5df4 = Iga diagramm, mille Kshana renderdab — brauseri mänguväljakul, CLI (käsurealiides) <c1/> ekspordis ja prinditava <c2/> (HTML, HyperText Markup Language) aruande sees oleval diagrammil — templitakse paremas allnurgas järgmisega:

# text
# c1: scenario <hash>
# c2: scenario_hash
# c3: scenario_hash
seg-d8b4de856202 = <c1/> on käivituse <b>stsenaariumi räsi</b> esimesed { "12" } kuueteistkümnendmärki: SHA-256 (SHA: Secure Hash Algorithm) <em>kanoonilise</em> stsenaariumi definitsiooni (algväärtus, läved, mudeli parameetrid, GNSS-i aknad jne) üle. See on sama sõrmejälg, mis ilmub üherealises käivituse kokkuvõttes ja tulemuse JSON-i väljal <c2/>. (Liigid, mille tulemusdokument ei kanna <c3/>, näiteks terviklikkuse ja Kuu aruanded, kasutavad varuks stsenaariumi lähte-TOML-i (Tom's Obvious, Minimal Language) SHA-256-t, nii et igal diagrammil on ikkagi stabiilne sõrmejälg.)

# text
seg-8d218131da01 = Kuna räsi on deterministlik ja sisendtundlik, on salvestatud või kleebitud diagrammipilt isetuvastuv: see salvestab mootori versiooni, täpse stsenaariumi, mis selle tekitas (bitthaaval reprodutseerimiseks), ja allika — ning mis tahes muudetud parameeter annab teistsuguse räsi, nii et valesti märgistatud diagrammi saab tuvastada.

# text
seg-89c9b001868f = Kuidas tsiteerida ja reprodutseerida

# text
# c1: scenario + seed + engine version
# c2: CITATION.cff
# c3: provenance
seg-6eca19b7978c = Iga tulemus on reprodutseeritav failist <c1/>. Mootorit tuleb tsiteerida faili <a1><c2/></a1> / Zenodo kontseptsiooni DOI <a2>10.5281/zenodo.20528627</a2> kaudu ning tsiteerida ülaltoodud <em>parameetri</em> allikaid arvude jaoks, millest antud käivitus sõltub — need liiguvad tulemuse JSON-i väljades <c3/> kaasa, nii et avaldatud tulemus on isedokumenteeriv.

# text
seg-c5c58ef3771c = Kus arv on kosmose-eesmärk maapealsel riistvaral (iga strontsiumi optilise kella arv) või maapealne labori demonstratsioon (külmaatom-kiirendusmõõtur), ütleb see dokument ja tulemuse päritolu seda selgesõnaliselt. Kshana ei esita labori- või eesmärgiarve lennanud tulemuslikkusena.

# text
seg-925d456df88c = <s1>Eelmine</s1>Väited vs tegelikkus

# text
seg-19e8fefd1ceb = <s1>Järgmine</s1>Reprodutseeritavus
