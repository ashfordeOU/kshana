# docs--integrity: translations (et)

# text
# c1: docs/INTEGRITY.md
seg-668241606715 = Allikas: <c1/>

# text
seg-9a8c218ce054 = Terviklikkus ja turvalisus: mida Kshana modelleerib ja mida mitte

# text
seg-52038c93765d = Kshana annab kaks kvaliteedinäitajat (FoM) — <b>terviklikkus</b> ja <b>turvalisus</b> —, mida on kerge segi ajada samanimeliste lennunduse tasemel suurustega. See leht ütleb selgelt välja, mis need praegu on, mis need <em>ei ole</em> ja mida tegevuskava lisab. Kui hinnatakse Kshanat inimelu ohutusega seotud või sertifitseerimise kontekstis, tuleks seda lehte lugeda esimesena.

# text
seg-fb6e93a107e7 = Praegu ({ "v0.37.0" })

# text
seg-ecd20ae1a05d = Terviklikkuse FoM — filtri enesekooskõla

# text
seg-153391e55508 = Terviklikkuse FoM on selliste katkestuse valimite osa, mille tegelik ajaviga jääb Kalmani filtri enda k-sigma kaitsepiiri sisse:

# text
seg-ac2413a97a7b = See mõõdab, kas filtri <em>ise esitatud</em> määramatus on GNSS-i (ülemaailmne satelliitnavigatsioonisüsteem) katkestuse ajal ausalt vastavuses selle <em>enda</em> veaga. See on kasulik sisemine kooskõlakontroll.

# text
seg-c9f80760ea53 = See <b>ei ole</b>:

# text
seg-8899525ad177 = <b>horisontaalne/vertikaalne kaitsetase (HPL/VPL)</b> — positsioonitasandi kaitsetaset pole üldse (kellapaketid on ajatasandil);

# text
seg-dd9a3e58e10b = <b>terviklikkuse risk ehk ohtlikult eksitava teabe tõenäosus (P_HMI)</b>;

# text
seg-31fa92b3271d = <b>häirepiiri</b> võrdlus;

# text
seg-ee998b974e6f = standarditele <b>RTCA DO-229E / DO-316</b> või <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) ega ühelegi muule sertifitseerimisstandardile vastav.

# text
seg-f84a56b6fe10 = Turvalisuse FoM — analüütiline spuufimise tuvastatavuse piir

# text
seg-e532288ed262 = Turvalisuse FoM on <b>kella stabiilsusel põhinev spuufimise tuvastatavuse piir</b>: kella müra (valge sageduse ja juhusliku käigu PSD-d (võimsusspektri tihedused)) ja seirevahemiku põhjal on see ühe kella kooskõlamonitori analüütiline tuvastusvaru aeglaselt kasvava valeaja spuufimise vastu. Vaiksem kell (nt optiline kell) tuvastab väiksema ja aeglasema spuufimise kui müra rohkem tekitav kell (nt CSAC (kiibimõõtmetes aatomkell)) — see kontrast ongi demonstraatori mõte.

# text
# c1: spoof
seg-fc718a805b28 = See <b>ei ole</b> mitme satelliidi RAIM-i (vastuvõtja autonoomne terviklikkuse seire) detektor. Satelliitidevahelisi pseudovahemaa jääke, kaitsetaset ega P_HMI-d pole. Innovatsiooni ja sigma testil on sama matemaatiline kuju kui klassikalisel RAIM-i vea tuvastamisel (Brown), kuid arv on antud kella analüütiline piir, mitte RAIM-i teostus, ja see on tähenduslik ainult seadistatud spuufimisstsenaariumi kontekstis (vt stsenaariumi liik <c1/>, mis süstib tegeliku kasvava rünnaku).

# text
# c1: clock
# c2: orbit
# c3: hybrid
# c4: fusion
# c5: security n/a (no attack)
# c6: fom.security
# c7: applicable: false
# c8: figure_tiers
seg-ae770e25031e = Väljund ütleb seda ise. Liigid <c1/>, <c2/>, <c3/> ja <c4/> ei seadista ühtegi rünnakut, mistõttu nende üherealine kokkuvõte prindib arvu asemel <c5/> ning nende tulemusdokument märgib põhjendusega välja <c6/> väärtuseks <c7/> oma <c8/> plokis. Väärtus ise jääb dokumenti neile, kes soovivad piiri.

# text
# c1: src/raim.rs
seg-960bd91a2b3a = Tõeline hetktõmmise, lahenduste eraldatuse ja ARAIM RAIM (<c1/>)

# text
# c1: src/raim.rs
seg-3d31ec251ac0 = Tõeline positsioonitasandi RAIM on teostatud failis <c1/>, eraldi ülaltoodud enesekooskõla FoM-ist:

# text
seg-0e8240812c16 = <b>Mitme satelliidi jääkide seire</b> — see ehitab nähtavate satelliitide vaatejoone geomeetriamaatriksi, moodustab vähimruutude positsiooni- ja kellalahenduse ning testib jääkruutude summat.

# text
# c1: SSE/σ²
# c2: chi2_{1-P_fa}(n-4)
seg-69f1535596e0 = <b>χ²-vea tuvastamine</b> — <c1/> (SSE: jääkruutude summa) on veavabaduse hüpoteesi korral χ²(n−{ "4" }); viga kuulutatakse välja, kui väärtus ületab piiri <c2/>. χ²-piirid saadakse sõltuvusteta regulariseeritud mittetäieliku gammafunktsiooni arvutusest (täpne, tabeliteta).

# text
# c1: max_i(slope_i)·pbias·σ
# c2: slope_i
# c3: pbias
# c4: P_md
seg-6721779048f5 = <b>Tõusul põhinev HPL / VPL</b> — <c1/>, kus <c2/> on satelliidipõhine positsioonivea tundlikkus kübamaatriksist ja <c3/> on mittetsentraalne χ²-nihe, mis vastab seadistatud tuvastamata jäänud sündmuse tõenäosusele <c4/>.

# text
# c1: Δ_k = x_k − x₀
seg-8dd60e98088d = <b>Lahenduste eraldatusel põhinev RAIM (MHSS: mitme hüpoteesi lahenduste eraldatus)</b> — kõigi nähtavate satelliitide lahenduse ja iga üksiku satelliidi väljajätmise osalahenduse puhul <b>tuvastab ja identifitseerib</b> pesastatud hinnangute eraldatus <c1/> vigase satelliidi ning toidab kaitsetaseme piiri.

# text
# c1: araim_raim
# c2: P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)
# c3: K_md
seg-719e27fdd2c1 = <b>ARAIM (täiustatud vastuvõtja autonoomne terviklikkuse seire) terviklikkusriski (P_HMI) eelarve</b> — <c1/> lahendab väikseima HPL/VPL-i, mille ohtlikult eksitava teabe tõenäosuste summa <c2/> (Blanch jt, <em>Baseline ARAIM</em>) vastab selgesõnalisele terviklikkusriski jaotusele, ning esitab riski, mille need tasemed saavutavad — nii saab terviklikkust vahetada otse häirepiiriga, selle asemel et jätta see kaudseks fikseeritud kordajas <c3/>.

# text
# c1: (error, PL)
seg-2f99acf45203 = <b>Stanfordi–ESA terviklikkusdiagramm</b> (ESA: Euroopa Kosmoseagentuur) — epohhipõhine akumulaator klassifitseerib paari <c1/> kättesaadavuse kokkuvõtte jaoks piirkondadesse Available / System-Unavailable / Misleading / Hazardously- Misleading.

# text
# c1: integrity
# c2: scenarios/integrity-raim.toml
# c3: scenarios/integrity-raim.toml
seg-33d01969fb0f = <b>Saavutatav otsast lõpuni</b> — stsenaariumi liik <c1/> käitab ülaltoodut SGP4 (Simplified General Perturbations { "4" }) või Kepleri satelliidikonstellatsiooni või päris TLE-de (kahereaelementide komplektid) või RINEX-i (Receiver Independent Exchange Format) navigatsioonifaili põhjal ning annab epohhipõhise HPL/VPL kättesaadavuskaardi seadistatud häirepiiride suhtes (<c2/>). Sama käitus <b>ekspordib vertikaalse Stanfordi diagrammi</b>: igal kaitstud epohhil kaardistatakse algväärtusega, reprodutseeritav veavaba vahemaavea valim geomeetria kaudu tegelikuks vertikaalseks veaks ja klassifitseeritakse VPL-i ja vertikaalse häirepiiri suhtes, nii et JSON-i (JavaScript Object Notation) tulemus ja CLI (käsurea liides) kokkuvõte sisaldavad piirkondade arve (terviklikkuse sündmused ja HMI: ohtlikult eksitav teave) — mitte ainult kättesaadavuse osa. Kaasasoleval failil <c3/> annab käitus { "344" } epohhi { "361" }-st kättesaadavaks ({ "95.3" } %) horisontaalse { "40" } m ja vertikaalse { "50" } m häirepiiri korral, { "0" } terviklikkuse sündmuse ja { "0" } HMI-ga.

# text
# c1: araim_dual_raim
# c2: P_const
# c3: IntegritySupportMessage
# c4: σ_URA
# c5: σ_URE
# c6: b_nom
# c7: P_sat
# c8: P_const
# c9: P_const = 0
# c10: araim_raim
# c11: integrity
# c12: araim_dual = true
# c13: scenarios/araim-gps-galileo.toml
seg-54e778eceef4 = <b>Kahe konstellatsiooni ARAIM terviklikkuse tugisõnumiga</b> — <c1/> lisab <b>kogu konstellatsiooni veareþiimi</b>: lisaks veavabale ja üksiku satelliidi hüpoteesile annab iga konstellatsioon ühe hüpoteesi, mis eemaldab kõik oma satelliidid, eelneva tõenäosusega <c2/>, samasse MHSS-i terviklikkusriski summasse. Sõnum <c3/> (ISM) kannab terviklikkuse kasutajavahemaa täpsust (<c4/>), täpsuse ruutkeskmist (<c5/>), suurimat nominaalset nihet <c6/>, mis on ühepoolselt iga režiimi sisse kokku voldetud, ning eelnevaid tõenäosusi <c7/> ja <c8/>; selle WG-C (Euroopa Liidu ja Ameerika Ühendriikide satelliitnavigatsioonikoostöö töörühm C, mille ARAIM-i tehniline alarühm avaldab etalonmaterjali) etalonkomplekt on σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } ja P_const = { "1e-4" }. <c9/> reprodutseerib ühe vea <c10/> tulemuse bitt-bitilt. Liik <c11/> kasutab seda rada väärtusega <c12/> (<c13/>: GPS + Galileo, { "48" } satelliiti, { "145" } epohhi { "145" }-st kättesaadav samade häirepiiride korral).

# text
# c1: araim-reference-check
# c2: araim_protection_level
# c3: araim_integrity_risk
# c4: VERIFICATION-MATRIX.md
seg-1f06bc1976bd = <b>Kaitsetasemed avaldatud etalonvektorite vastu</b> — liik <c1/> käitab mootori funktsioone <c2/> ja <c3/> WG-C ARAIM-i alarühma enda läbitöötatud näidetel (Reference Airborne Algorithm Description Document v3.1, { "2019" }, lisa D, ja Milestone { "3" } Report, { "2016" }, lisa A). Vastuvõtuvektori suurim vertikaalse/horisontaalse kaitsetaseme erinevus on { "0.0437" } m dokumentide enda tolerantsi { "0.05" } m vastu. See rida on failis <a1><c4/></a1> VALIDATED: see kontrollib kaitsetaseme võrrandit, mitte toimivat ISM-i ega vastuvõtjat.

# text
seg-1dda7b318c5f = Allesjäänud lünk (tegevuskava)

# text
# c1: raim.rs
seg-e27215296e1a = Mida <c1/> veel <b>ei tee</b>:

# text
seg-964c0634eae0 = see <b>ei ole kella/holdover-i stsenaariumi FoM-i sisse liidetud</b> — need paketid annavad endiselt ülaltoodud filtri enesekooskõla terviklikkusnäitaja, mitte HPL/VPL-i;

# text
seg-eecf2f9f181e = vea hüpoteesid on veavaba juhtum, <b>üksikud satelliidid</b> ja <b>terved konstellatsioonid</b> — samaaegseid vigu <b>kahe või enama satelliidi (SV: space vehicle ehk satelliit) alamhulkadel</b> ei modelleerita;

# text
seg-fd0f9fb2de83 = ISM on seadistatav parameetrite komplekt (WG-C etalonväärtustega), mitte edastatav toimiv sõnum ega valideeritud ohumudel;

# text
# c1: snapshot_raim_fde
# c2: integrity
seg-88f5242b0809 = <b>vea tuvastamine ja väljajätmine (FDE)</b> on ainult üksiku satelliidi ja hetktõmmise tasemel: lahenduste eraldatus nimetab vigase satelliidi ning <c1/> lahendab uuesti iga üksiku satelliidi väljajätmise ja tagastab väljajäetud satelliidi koos allesjäänud alamhulga hii-ruut testi ja kaitsetasemetega, kuid väljajätmisega kaitstud positsiooni ei anta, ja stsenaariumi liik <c2/> ei käivita väljajätmise sammu.

# text
# c1: tests/igs_real_data.rs
# c2: P_HMI
# c3: tests/araim_dual_real_data.rs
# c4: REAL_TLE_GUIDE.md
# c5: pvt
seg-c85aa5dedc86 = Hetktõmmise, lahenduste eraldatuse ja ARAIM-i tuumasid on katsetatud <b>päris IGS-i (International GNSS Service) täppisorbiidi (SP3: Standard Product { "3" }) geomeetrial</b>, mitte ainult sünteetilistel konstellatsioonidel: <c1/> moodustab vaatejoone geomeetria päris IGS-i SP3 toote esimesest epohhist päris maajaamas ning kontrollib, et kaitsetasemed on lõplikud ja jäävad APV-I (lähenemine vertikaalse juhtimisega) häirepiiridesse horisontaalselt { "40" } m ja vertikaalselt { "50" } m, et { "60" } m pseudovahemaa nihe vallandab χ²-monitori, et lahenduste eraldatus <b>identifitseerib</b> vigase satelliidi ning et ARAIM-i tasemed vastavad eraldatud <c2/>-le. <c3/> käitab kahe konstellatsiooni rada päris 2026-06-07 Celestraki GPS-i ja Galileo katalooguidel, mis on propageeritud ühele ühisele epohhile (vt <a1><c4/></a1> §{ "3" }). Sügavam ristkontroll — kaitsetasemete epohhipõhine võrdlus gLAB-iga (GNSS-Lab Tool, ESA levitatav GNSS-andmetöötluse komplekt) täieliku RINEX-i vaatlusarvuga — lisaks vastuvõtja tasandi pariteedi. Seda pole tehtud: liik <c5/> arvutab päris RINEX-i vaatlustest koodipõhise ühepunktipositsiooni, kuid sellest lahendusest pole ühtegi kaitsetaset gLAB-iga võrreldud.

# text
# c1: raim.rs
# c2: integrity
# c3: araim-reference-check
seg-f5fac2e836a6 = Seega on <c1/> tõeline kaitsetaseme ja terviklikkusriski tuum, saavutatav stsenaariumi liikidest <c2/> ja <c3/>, katsetatud päris etalonorbiidi geomeetrial ja kontrollitud WG-C etalonvektorite vastu. Mitme satelliidi alamhulkade vead, vastuvõtja tasandi gLAB-i pariteet ja kella FoM-i integreerimine jäävad tegevuskava punktideks ning miski sellest ei ole sertifitseerimise tõendusmaterjal.

# text
# c1: GLOSSARY.md
seg-487f24ed92d8 = <a1><c1/></a1> — iga FoM-i ja lühendi üherealised definitsioonid.

# text
# c1: ARAIM_REFERENCE.md
seg-7d3c12cf802e = <a1><c1/></a1> — ISM-i parameetrid ja WG-C etalonvektorid.

# text
# c1: SLOT-TIMING.md
seg-04532ba5288f = <a1><c1/></a1> — rannikukella ajakaitsetase (TPL), mis on tuvastamisest sõltuv.

# text
# c1: VALIDATION.md
seg-43cea496da93 = <a1><c1/></a1> — millised suurused on etalonidega valideeritud ja millised on enesekooskõla kontrollid.

# text
# c1: src/security.rs
seg-3037dde8135f = <c1/> — spuufimise tuvastatavuse piiri tuletus.

# text
seg-04d63778ca7f = RAIM kella holdover-i kvaliteedinäitajate kõrval ({ "0.36" }, valikuline)

# text
# c1: [integrity]
# c2: src/clock_integrity.rs
# c3: lat_deg
# c4: lon_deg
# c5: height_m
# c6: systems
# c7: gps-baseline
# c8: integrity_fom
# c9: available
# c10: alarm
# c11: unavailable-pl-above-al
# c12: unavailable-too-few-satellites
# c13: unavailable-gnss-denied
# c14: runs = 1
seg-744e95749978 = Kella stsenaarium võib sisaldada jaotist <c1/> (<c2/>): asukoht (<c3/>, <c4/>, <c5/>), konstellatsiooni eelseadistused (<c6/>, vaikimisi <c7/>), mask, vahemaajääkide sigma, valehäire ja tuvastamata jäänud sündmuse tõenäosused, horisontaalne ja vertikaalne häirepiir, epohhide vahe ning valikuline kuulutatud nihe ühel satelliidil. Käitus annab siis eraldi ploki <c8/>: epohhi kohta nähtavad satelliidid, hetktõmmise RAIM-i kaitsetasemed ja otsus (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>) ning arvud ja kättesaadavus kogu käituse jooksul. Kuni ajajoon ütleb, et GNSS on blokeeritud, on RAIM kättesaamatu ja midagi ei ekstrapoleerita; halvenenud aken hinnatakse nominaalsena. Holdover-i kvaliteedinäitajad on muutumatud ja ilma jaotiseta on väljund baithaaval identne. MODELLED: esinduslik eelseadistatud taevas, sünteetilised jäägid ja kuulutatud piirid. See nõuab <c14/>.

# text
seg-139639263c90 = EL-USA WG-C ARAIM Milestone { "3" } maksimaalse URA reprodutseerimine (CAP-05c)

# text
seg-97906754d4c8 = Varasem plaan lubas võrdlust EU-ARAIM tehnilise märkme „Table A-3“ tabeliga. Selle tabeli kohta ei leitud avalikku allikat (EL-USA töörühma C ARAIM-i tehnilise alarühma avalikes Milestone { "1" } kuni { "3" } aruannetes ei ole Table A-3), seetõttu on see võrdlus <b>tagasi võetud</b> ja selle nime all ei lubata midagi.

# text
# c1: 156147e1...13d8
# c2: sigma_URA
# c3: xval/araim-m3/PREREGISTRATION.md
# c4: src/bin/gen_araim_m3_study.rs
# c5: xval/araim-m3/results.json
# c6: tests/araim_m3_reproduction.rs
seg-b61607c477f2 = Selle asemel üritatakse reprodutseerida avalikku aruannet: <b>Milestone { "3" } Report</b> ({ "25" }. veebruar { "2016" }, GPS.gov koopia, SHA-256 <c1/>), tabelid { "5" }, { "6" } ja { "7" }, mis trükivad iga konstellatsioonikonfiguratsiooni ning nii RNP { "0.1" } kui ka RNP { "0.3" } kohta suurima <c2/>, mille korral { "90" } % kasutajatest on { "99.5" } % kättesaadavus. Kontrollitakse kaheteistkümmend trükitud kirjet (kahesageduslike tabelite Depleted ja Baseline read) läbimise kriteeriumide alusel, mis on eelregistreeritud failis <a1><c3/></a1> enne ühtegi hinnatud käitust, koos kõrvaldamatute kõrvalekalletega, mis on seal välja toodud: almanahhifaile pole, päris pesade asemel on Walkeri kihid, jämedam võrk ja samm ning mootori ADD v4.2 horisontaalne rada aruande enda teksti asemel. Tabeleid { "8" } kuni { "13" } (ühesageduslikud) ja Optimistic ridu ei üritata, põhjused on seal antud. <b>Tulemus: { "8" } kirjet { "12" }-st reprodutseeritud, { "4" } NOT MET (kinnitatud):</b> kahe konstellatsiooni kirjed ja kõik ainult Galileo kirjed klapivad (sh N/A read), kahe konstellatsiooni Depleted RNP { "0.1" } kirje saavutab kattuvuse { "0.847" } kohal { "9" } m trükitud { "9" } m vastu (vajab { "0.90" }) ja kolm ainult GPS-i kirjet jäävad kaugelt alla (kattuvus { "0.70" } kohal { "4" } m, { "0.58" } kohal { "6" } m, { "0.65" } kohal { "10" } m trükitud { "4" } m, { "6" } m ja „>{ "10" } m“ vastu). Ainult GPS-i möödalaskmised võivad tuleneda ühtlasest Walkeri kihist, mis asendab päris GPS-i pesasid (D1); see on hüpotees, mitte leid. Tulemus jääb MODELLED olenemata sellest, milline see on. Uuring on <c4/>; selle mõõdetud kattuvused on failis <c5/> ja hindab <c6/>. Aruandele endale viidatakse, seda ei kopeerita hoidlasse.

# text
seg-0e98826cedcc = <s1>Eelmine</s1>Riistvara ohutus

# text
seg-e6f1e38977b7 = <s1>Järgmine</s1>Spekter ja juga

# text
seg-38ab3bb65327 = Tõeline hetktõmmise, lahenduste eraldatuse ja ARAIM RAIM (src/raim.rs)
