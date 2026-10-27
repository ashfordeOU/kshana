# docs--spectrum: translations (et)

# text
seg-6cb7a787ac67 = Viited

# text
seg-cbf0f9bcd2d8 = Oraakel (sõltumatu etalon)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-33f4c7af9c53 = Kandelaine

# text
seg-c5ce76c91ff7 = Silt

# text
seg-a86ce24d81de = Sagedusriba

# text
seg-ea152d84aabc = { "465" } MHz

# text
seg-278d0b375f6f = { "20.46" } MHz

# text
seg-39e207bee75b = { "2492.028" } MHz

# text
seg-48fabff33863 = { "5020" } MHz

# text
seg-72f051e2d7e1 = Signaal

# text
seg-47408d30d095 = Nominaalne C/N₀

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-53a7343c076e = Väide

# text
seg-430edd66bda0 = Modelleerimata

# text
seg-64509c048541 = Mida modelleeritakse

# text
# c1: docs/SPECTRUM.md
seg-f07519ff8071 = Allikas: <c1/>

# text
seg-901c3e032de7 = Spektrimudel ja waterfall-diagramm

# text
# c1: spectrum
seg-eac92092dd34 = Stsenaariumi liik <c1/> ehitab ülemaailmse satelliitnavigatsioonisüsteemi (GNSS) L-sageduskanali ja mis tahes muu sagedusala, mida kavandatud signaal hõivab (ülikõrgsagedus (UHF), S-ala, C-ala), üheks võimsusspektri tiheduseks (PSD), laseb sellel muutuda skriptitud segaja ajajoone järgi ja taandab selle sellele, mida jälgimissilmus kasutab: segaja ja signaali suhe (J/S) ning iga ala efektiivne kandja ja müra tiheduse suhe (C/N₀). See joonistab tulemuse waterfall-diagrammina (sagedus risti, aeg alla, värv võimsuse jaoks) iga ala C/N₀ tulpade kõrvale ning loeb ja kirjutab Signal Metadata Format (SigMF) salvestisi, et päris püüdmist saaks hinnata ja mudeli kõrval joonistada.

# text
seg-0007b6ba97ca = Kaasasolev näide kirjutatakse faili ja käivitatakse:

# text
# c1: kshana scenarios/l-band-waterfall-jamming.toml
seg-5e205b189b26 = Väljavõtul käivitab <c1/> sama faili.

# text
# c1: src/spectrum.rs
# c2: src/sigmf.rs
# c3: src/navsignal.rs
# c4: src/leo_signal.rs
seg-261deb22b4fa = Kood: <c1/> (mudel, liik, Welchi hindaja), <c2/> (salvestuse koodek), <c3/> (ühikulise pindalaga signaalispektrid ja spektraalne eraldustegur) ja <c4/> (signaalikujunduse eelseaded, mida ala võib nimetada).

# text
seg-bb1153873209 = Modulatsioon

# text
seg-9758b36b554c = Vaikimisi vastuvõetud võimsus

# text
seg-a1a68286b809 = Vaikimisi vastuvõtja ribalaius

# text
seg-27a2cdc8183f = { "1575.42" } MHz

# text
seg-66a103496266 = binaarne faasinihkemanipulatsioon, BPSK({ "1" })

# text
seg-f386c2e2e352 = −{ "158.5" } dBW (IS-GPS-200)

# text
seg-50112ba8867d = { "2.046" } MHz

# text
seg-b7755cb9a384 = multipleksitud binaarne nihkekandja, MBOC(6,1,1/11), või binaarne nihkekandja BOC({ "1,1" })

# text
seg-6043a4ef45ca = −{ "157.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
seg-6dc5e3668a78 = { "14.322" } MHz

# text
seg-f03380403a2a = { "1227.60" } MHz

# text
seg-06c245582533 = BPSK({ "1" }) (CM ja CL koodid ajamultipleksitud)

# text
seg-fa56c0085dbc = −{ "160.0" } dBW (IS-GPS-200)

# text
seg-1982a811e1ef = { "1176.45" } MHz

# text
seg-dd074e33242e = BPSK({ "10" })

# text
seg-f30f2e48a3bf = −{ "157.9" } dBW (IS-GPS-705)

# text
seg-898ae19a946b = −{ "155.25" } dBW (Galileo OS SIS ICD Issue { "2.1" }, Table { "12" })

# text
# c1: [[bands]]
seg-3216d5cd918d = GPS (Global Positioning System) L1 C/A on tuvastus-/hankekood (coarse/acquisition); L2C on L2 tsiviilsignaal; IS-GPS-200 ja IS-GPS-705 on GPS liidesespetsifikatsioonid; Galileo OS SIS ICD on Galileo avatud teenuse signaal-ruumis liidese juhtdokument. Vastuvõetud võimsused on spetsifikatsiooni miinimumid; ribalaiused on modelleerimisvalikud. Mõlemat saab ala kaupa üle kirjutada. Ilma tabelita <c1/> kasutab käivitus neid viit. GLONASS G1/G2, BeiDou B1/B2 ja Galileo E6 <b>ei ole</b> nimetatud alade seas.

# text
# c1: [[bands]]
seg-79cc2ed8195b = Kirje <c1/> on ühel kolmest kujust:

# text
# c1: signal_power_dbw
# c2: rx_bandwidth_mhz
# c3: galileo-e1
# c4: modulation = "boc11"
seg-67d0591c69d8 = nimi ülaltoodud tabelist, valikuliste väljadega <c1/>, <c2/> ja väljal <c3/> väljaga <c4/>;

# text
# c1: signal = "<preset>"
# c2: leo-signal
# c3: name
# c4: xona-x1
# c5: xona-x5
# c6: iridium-stl
# c7: starlink-ku-beacon
# c8: centispace-l1
# c9: centispace-l5
# c10: generic-c-band-leo
# c11: generic-uhf
# c12: generic-l
# c13: generic-s
# c14: generic-c
# c15: generic-c-wide
seg-8596194c81f2 = <c1/>: madala Maa orbiidi (LEO) või representatiivne signaalikujundus liigi <c2/> eelseadete teegist (<a1>LEO-SIGNAL.md</a1>), mis tahes alas, joonistatud kõigi komponentidega (hange, andmed, pilot, sagedusjaotusega alamkandjad) ja piiratud oma saatmisribalaiusega; C/N₀ ja J/S viidatakse jälgitavale komponendile ning <c3/> ainult sildistab seda. Eelseaded on <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/> ja <c15/>;

# text
# c1: name
# c2: centre_mhz
# c3: modulation
# c4: BPSK(n)
# c5: BOC(m,n)
# c6: MBOC(6,1,p)
# c7: signal_power_dbw
seg-2ca46a7f2949 = kohandatud ala: mis tahes <c1/> väljadega <c2/>, <c3/> (<c4/>, <c5/> või <c6/>) ja <c7/>.

# text
# c1: [[jammers]]
# c2: waveform
seg-fcb0f9fcffbf = Segajad (<c1/>) võtavad väärtuse <c2/>:

# text
# c1: cw
# c2: centre_mhz
seg-457e5e95c677 = <c1/> — pidevlaine (CW) toon sagedusel <c2/>;

# text
# c1: narrowband
# c2: bandwidth_mhz
seg-3120ac4f6710 = <c1/> — tasane müra üle <c2/>;

# text
# c1: wideband
# c2: bandwidth_mhz
# c3: narrowband
# c4: jamming
seg-7d975838a2e6 = <c1/> — tasane müra üle laia <c2/> (barrage-segaja): sama tihedus mis <c3/>, nimetatud eraldi, sest liik <c4/> hindab seda lairiba omaks;

# text
# c1: chirp
# c2: bandwidth_mhz
# c3: sweep_period_us
seg-d13b177946d2 = <c1/> — lineaarne saehamba pühkimine <c2/> iga <c3/> järel;

# text
# c1: matched
# c2: matched_to
seg-675fb74a89e4 = <c1/> — lairibamüra, mille spekter on ala <c2/> enda modulatsioon.

# text
# c1: received_power_dbw
# c2: eirp_dbw
# c3: range_m
# c4: rx_gain_dbi
# c5: jamming
# c6: on_s
# c7: off_s
seg-64d7a14a198e = Igaüks annab kas <c1/> või efektiivse isotroopselt kiiratud võimsuse <c2/> koos <c3/> (ja valikuliselt <c4/>), mis läbib liigi <c5/> vabaruumi levikadu. <c6/> ja <c7/> skriptivad ajajoone.

# text
# c1: [receiver]
# c2: N₀ = k·T_sys
# c3: T_sys = T_ant + 290 K × (F − 1)
# c4: T_ant
# c5: F
seg-8e718c09f7d8 = Vastuvõtja (<c1/>) seab müra põhja, <c2/> koos <c3/> antenni temperatuuri <c4/> ja müranäitaja <c5/> korral, ning jälgimislävi.

# text
# c1: [grid]
# c2: [[panels]]
# c3: name
# c4: f_min_mhz
# c5: f_max_mhz
# c6: n_freq
seg-9b8078bd0df3 = Põhiline waterfall-diagramm katab <c1/> (vaikimisi { "1160" } kuni { "1590" } MHz { "430" } kastis). Iga kirje <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, vaikimisi { "200" } kasti) lisab sama ajajoone peale veel ühe waterfall-diagrammi oma sagedusvahemikus, nii et spekter hõlmab mitut ala.

# text
seg-a550e89c2907 = Häireahel

# text
# c1: G_s
# c2: G_j
# c3: B
# c4: κ = ∫_B G_s(f) G_j(f) df
seg-12a2c08191c0 = Ühikulise pindalaga spektriga <c1/> signaali ja ühikulise võimsusega spektriga <c2/> segaja korral on spektraalne eraldustegur (SSC) vastuvõtja ala <c3/> kohal <c4/> ning mitme segajaga efektiivne kandja ja müra tihedus on

# text
# c1: jamming
# c2: Q = 1/(R_c κ)
# c3: jamming_kind_cross_check
# c4: jamming
seg-5c556163af62 = (Betz { "2001" }; Kaplan & Hegarty, <em>Understanding GPS/GNSS</em>, 3. tr, §{ "9.4" }). Ühe segaja korral on see täpselt liigi <c1/> segamisvastane võrrand väärtusega <c2/>; aruande <c3/> plokk käivitab liigi <c4/> enda funktsioonid samadel lingi sisenditel ja trükib erinevuse, mis on ümardamiseni null.

# text
# c1: jamming
seg-c11d0cb8e670 = Aruanne trükib ka C/N₀, mille liik <c1/> annab oma Q-tabeliga. Tabel sisaldab õpikuväärtusi, mis on testides kinnitatud suletud kujudele:

# text
# c1: Q = 1
# c2: κ = T_c
# c3: Q = 1
seg-5c21df11e35b = <b>CW ja kitsasriba: <c1/>.</b> C/A kandjal olev CW toon annab <c2/>, seega <c3/>, ja tabel ning spektrid langevad kokku. Kaasasolevas näites annab toon mõlemast { "17.98" } dB-Hz (tabel andis { "19.74" }, kui see sisaldas { "1.5" }).

# text
# c1: Q = 2
# c2: κ = 1/(2R_c)
# c3: xval/jammer-q/PREREGISTRATION.md
seg-647e209b1efc = <b>Lairiba ja pühitud: <c1/>, alates { "0.36" }.</b> See on valge müra üle peasagara, ribasisese signaali võimsus normaliseeritud ühele, <c2/>. Tabel sisaldas { "1" } kuni { "0.36" }, umbes { "3" } dB pessimistlik (<c3/>).

# text
seg-cd03b9c900e1 = Spektrimudel tuletab oma väärtused spektritest:

# text
# c1: Q = 1.5
# c2: κ = 2/(3R_c)
seg-b1327e66260b = <c1/> C/A-ga sobitatud müra jaoks (<c2/>);

# text
# c1: Q = 2.2
# c2: 2/0.9028
seg-45b2cf032a11 = <c1/> tasase müra jaoks nullist nullini ilma normaliseerimiseta (<c2/>).

# text
seg-6c2187f0e32b = Seega nende segajate puhul kaks trükitud C/N₀ väärtust endiselt erinevad, kavandatult.

# text
# c1: Q
seg-73dfbeabcac2 = Iga waterfall-diagrammi lahter on PSD, keskmistatud üle oma sageduskasti ja rea. Chirp keskmistatakse täpselt üle rea, terved pühkimised pluss osaline; segaja, mis lülitub rea keskel sisse või välja, kaalutakse oma töötsükliga. C/N₀ ajajoon kasutab samu keskmisi, nii et pilt ja arvud langevad kokku. Ala kohta raporteerib ajajoon ribasisest J/S (segaja võimsus vastuvõtja ribalaiuses jagatud signaali võimsusega). Segaja ja ala kohta annab aruanne SSC, <c1/>, kogu J/S, ribasisese J/S ja püsiva C/N₀.

# text
seg-2c214a0a30be = Kaasasolev näide

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-4adc00a3ca10 = <c1/>: { "60" } s ajajoon, üks rida sekundis, { "290" } K antenn ja { "2" } dB müranäitaja (põhi −{ "201.98" } dBW/Hz).

# text
seg-94d1cebc134d = { "10" } s kuni { "40" } s: { "16" } MHz chirp L1 ümber, { "9" } µs pühkimised, { "50" } mW kaugusel { "100" } m.

# text
seg-b85319af4f85 = Alates { "30" } s: CW toon L1 kandjal, { "10" } mW kaugusel { "1" } km.

# text
seg-21e2b4e76832 = Alates { "45" } s: tasane { "2" } MHz müra L2 peal, vastuvõetud −{ "135" } dBW.

# text
seg-45dd378c692c = Mida käivitus arvutab:

# text
seg-eecd7d7530bf = Minimaalne C/N₀

# text
seg-1ead35e1aad5 = Esimene kadu

# text
seg-bfb55a322ece = Jälgivad read

# text
seg-863ea3f1fbe9 = { "3.23" } dB-Hz

# text
seg-9aa0239a3a0c = { "10" } s

# text
seg-9979940d2359 = { "44.73" } dB-Hz

# text
seg-25364ef39455 = { "4.44" } dB-Hz

# text
seg-c8d0bc71cccd = { "41.98" } dB-Hz

# text
seg-c945914c444c = { "36.86" } dB-Hz

# text
seg-9ff066fb53a6 = mitte kunagi

# text
seg-63d4f00f622d = { "44.08" } dB-Hz

# text
seg-58b097691919 = CW toon on põhjus, miks kaks L1 signaali lähevad { "40" } s juures lahku. See langeb C/A spektri tipule ja hoiab C/A väärtusel { "17.98" } dB-Hz, alla { "25" } dB-Hz läve. See langeb MBOC spektri nulli, nii et Galileo E1 naaseb nominaalsele C/N₀-le, kui chirp lõpeb.

# text
seg-064579d5fbac = Signaalid ise asuvad umbes { "20" } dB müra põhjast allpool, nii et waterfall-diagramm näitab põhja ja segajaid; C/N₀ tulbad näitavad, mida hajutuse eemaldamine taastab.

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
seg-023a7f163106 = Samad segajad juhivad aheldatud missiooni failis <c1/> (vt <a1>CAMPAIGNS.md</a1>): kell hoiab holdover-režiimis, kuni chirp on sees, ja vastuvõtja langeb CW tooni all tagasi Galileo E1 peale.

# text
seg-6b0edbfca134 = Väljaspool L-ala

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
# c2: [grid]
# c3: [[panels]]
seg-63d1fd8043ed = <c1/> paneb LEO positsioneerimis-, navigatsiooni- ja ajasignaalid (PNT) neljale alale GPS L1 C/A ja Galileo E5a kõrvale, igaühel oma segaja, { "60" } s ajajoonel. Waterfall-diagramm <c2/> on L-ala; kolm <c3/> lisavad UHF ({ "455" } kuni { "475" } MHz), S ({ "2482" } kuni { "2502" } MHz) ja C ({ "5005" } kuni { "5035" } MHz).

# text
seg-6818247b5863 = { "10" } s: CW toon UHF kandjal, −{ "120" } dBW vastuvõetud.

# text
seg-02de8390de31 = { "20" } s: L-ala näite chirp ({ "16" } MHz L1 ümber, { "9" } µs pühkimised, { "50" } mW kaugusel { "100" } m).

# text
seg-47e55dfd4e0d = { "30" } s: lairibamüra, { "40" } MHz sageduse { "1185" } MHz ümber, −{ "118" } dBW.

# text
seg-dfa416032770 = { "40" } s: kitsasribamüra, { "2" } MHz S-kandjal, −{ "128" } dBW.

# text
seg-1d119727a749 = { "50" } s: C-ala signaali enda spektriga sobitatud müra, −{ "124" } dBW.

# text
seg-abacb60b16a3 = Mida käivitus arvutab (kavandatud signaalide C/N₀ on jälgitava komponendi oma, nii et nominaalväärtus on kogu vastuvõetud võimsusest madalamal jälgitava osa võrra):

# text
seg-1c921b6299e4 = representatiivne, BPSK({ "5" }), −{ "150" } dBW

# text
seg-5331cde832fb = { "34.38" } dB-Hz

# text
seg-35588b19fd72 = spetsifikatsiooni miinimum

# text
seg-7d3639369444 = { "3.38" } dB-Hz

# text
seg-9eef1ec7858f = { "38.51" } dB-Hz

# text
seg-c6743d980e6b = avaldatud kujundus, −{ "144.9" } dBW

# text
seg-245bf7d080b3 = { "1190.51625" } MHz

# text
seg-f2aed7e062bf = { "46.29" } dB-Hz

# text
seg-c6a19eb8e0b9 = { "41.69" } dB-Hz

# text
seg-a6f2bb955ca2 = representatiivne, BPSK({ "10" }), −{ "152" } dBW

# text
seg-b9312cc881d2 = { "40.35" } dB-Hz

# text
seg-03bb124d45d2 = Ainult chirp võtab signaali ära (GPS L1 C/A, alates { "20" } s). Iga teine segaja halvendab ainult ala, milleni selle spekter ulatub: näiteks C-ala sobitatud müra SSC on −{ "71.87" } dB/Hz C-ala signaaliga ja alla −{ "133" } dB/Hz iga muu alaga.

# text
seg-a8bea652a85d = Sama mehhanism juhib LEO-PNT vastupidavuse stsenaariume (<a1>LEO-PNT.md</a1>):

# text
# c1: scenarios/leo-resilience-js-margin.toml
seg-cf7bc2f52cad = <c1/> astmeliselt tõstab ühte { "40" } MHz barrage-segajat sagedusel { "1185" } MHz { "5" } dB võrra iga { "10" } s järel alates −{ "125" } dBW. GPS L5 kaob sammul −{ "105" } dBW, Galileo E5a sammul −{ "100" } dBW ja Xona X5 sammul −{ "95" } dBW, samal ajal kui representatiivne LEO L-ala signaal, mis on vastu võetud −{ "135" } dBW juures, jälgib endiselt sammul −{ "90" } dBW: vastuvõetud võimsus ostab J/S varu dB dB eest.

# text
# c1: scenarios/leo-resilience-multiband-diversity.toml
# c2: spectrum
seg-94b65c0e6087 = <c1/> on kampaania pühkimine käivitusest <c2/> üle L5-ala barrage-segaja võimsuse (<a1>CAMPAIGNS.md</a1>).

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: spectrum
seg-67279a0780e4 = <c1/> on aheldatud kampaania, mille faasid loevad GNSS ja LEO C/N₀ käivitustest <c2/>, S- ja C-ala paneelidega.

# text
seg-42b00ae14ffe = IQ, SigMF ja Welch

# text
# c1: [iq]
# c2: cf32_le
# c3: ci16_le
seg-3418c31c4318 = <c1/> joonistab mudeli ühel ajahetkel kompleksse faasi- ja kvadratuurkomponendi (IQ) valimitena, kirjutab need SigMF salvestisena (<c2/> või <c3/>), loeb salvestise tagasi ja hindab selle PSD Welchi meetodil (Hanni aken, { "50" } % kattuvus, keskmistatud periodogrammid, tihedusele skaleeritud). Soojusmüra, signaalid ja müralaadsed segajad joonistatakse kasti kaupa mudeli enda tihedusest; toon ja chirp joonistatakse tegelike lainekujudena. Ainult müralaadsete segajatega jääb Welchi hinnang mudelist { "0.1" } dB piiresse (mediaan). Perioodiline chirp on joonspekter oma pühkimiskiirusel, koos virvenduse ja sabadega üle oma ala servade, mida sile mudel välja jätab: kaasasolevas näites langeb koguvõimsus kokku { "0.02" } % piires ja mediaankast erineb { "0.5" } dB võrra. Hetktõmmis on analüüsiks kirjutatud fail; midagi ei edastata ja raadioriistvara ei juhita.

# text
# c1: [recording]
# c2: meta_path
# c3: .sigmf-data
seg-a3b0a61b5efe = <c1/> (ainult natiivsed ehitused) loeb päris SigMF salvestise failist <c2/> (andmefail on vaikimisi sama tüvi laiendiga <c3/>), hindab selle PSD ja trükib selle mudeli kõrvale salvestise sagedustel. SigMF failil puudub absoluutne võimsuskalibreering, seega annab aruanne mediaannihke ja kuju, mitte taset.

# text
# c1: kshana::sigmf::read
# c2: kshana::spectrum::welch_psd
seg-04b08e06811d = WebAssembly ehituses on failide lugemine kättesaamatu; <c1/> ja <c2/> töötavad lehe antud baitidega.

# text
seg-69b384afe05d = Signaalide PSD-d ja SSC-d

# text
# c1: jamming
seg-a65b87c51f05 = BPSK(n) peasagar 2n × { "1.023" } MHz nullist nullini; BOC({ "1,1" }) sagarad tsentreeritud kohal ±{ "1.023" } MHz (Betz { "2001" }); SSC-d −{ "61.86" } / −{ "64.87" } / −{ "67.88" } dB/Hz väärtustele C/A×C/A, BOC({ "1,1" })×BOC({ "1,1" }), C/A×BOC({ "1,1" }) nende Parsevali suletud kujudest, väärtused avaldatud −{ "61.8" } / −{ "64.8" } / −{ "67.8" } dB/Hz taga; Q = { "1" } (CW) ja { "1.5" } (sobitatud) (Kaplan & Hegarty §{ "9.4" }); liigi <c1/> tabelikirjed on võrdsed suletud kujudega: CW ja kitsasriba Q = { "1" }, lairiba ja pühitud Q = { "2" } (valge müra üle peasagara, ribasisene võimsus normaliseeritud; { "1" } kuni { "0.36" })

# text
seg-d2afc6e05969 = Waterfall-diagramm, J/S ja C/N₀ ajajoon

# text
# c1: jamming
seg-c44413d5a060 = Taandub täpselt liigi <c1/> ahelale; segaja võimsused, ajajoon ja ribalaiused on sisendid

# text
seg-304f4aeaf4cb = SigMF koodek ja Welchi hinnang

# text
seg-7a642dd02e5c = Edasi-tagasi teisendused, otsene diskreetne Fourier' teisendus, valge müra ja Parsevali samasused; hoidlas pole ühtegi kolmanda osapoole salvestist

# text
seg-1138c9e62a21 = Mitme ala waterfall-diagramm kavandatud signaalide ja alapõhiste segajatega

# text
seg-ac38681004e9 = Taandub L-ala ahelale (ühe komponendiga ala annab samad arvud nagu enne laiendust) ja kontrollitud signaalispektritele; kavandatud signaalid, segajad ja ribalaiused on sisendid

# text
# c1: tan y = 2y
# c2: y = πf/(2R_c)
seg-0c0c625a8ff5 = Üks parandus levinud lühendusele: BOC({ "1,1" }) spektri sagarad on <em>tsentreeritud</em> kohal ±{ "1.023" } MHz (kandja nulli ja nulli vahel kohal { "2.046" } MHz), kuid PSD maksimum on kohal ±{ "0.759" } MHz, kus <c1/> väärtusega <c2/>. Testid kinnitavad mõlemat.

# text
seg-6ab6e241f7e5 = Hajutuskoodi joonestruktuur (C/A { "1" } kHz jooned): tooni hinnatakse siledat mähisjoont, mitte lähimat koodijoont, vastu.

# text
seg-4be08100a707 = Automaatne võimenduse reguleerimine, kvantimine, impulsi summutamine ja notch-filtreerimine.

# text
seg-0f195ea4126e = Vastuvõtuantenni mustri mõju segaja suunas peale ühe võimenduse arvu.

# text
seg-d3d03da9c962 = Mitmikjuurdepääsu häire sama ala satelliitide vahel.

# text
seg-db5c7566f49e = Kavandatud signaali kiirgus väljaspool selle saatmisribalaiust: selle spekter on seal kärbitud, nii et ükski ribaväline kiirgus ei jõua naaberalani.

# text
seg-9cbea7151036 = Chirpi mõju silmusele pühkimiskiirustel, mis on võrreldavad silmuse ribalaiusega: selle C/N₀ kasutab reakeskmistatud spektrit.

# text
seg-d19ed16f451c = J. W. Betz, „Binary Offset Carrier Modulations for Radionavigation“, <em>NAVIGATION</em> { "48" }({ "4" }), { "2001" }.

# text
seg-e2225151c10b = E. D. Kaplan ja C. J. Hegarty (toim.), <em>Understanding GPS/GNSS: Principles and Applications</em>, 3. tr, Artech House, { "2017" }, §{ "9.4" }.

# text
seg-85b2d251a221 = G. W. Hein et al., „MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C“, <em>Inside GNSS</em>, mai/juuni { "2006" }.

# text
seg-b091f7c36ab9 = P. D. Welch, „The Use of Fast Fourier Transform for the Estimation of Power Spectra“, <em>IEEE Transactions on Audio and Electroacoustics</em> { "15" }({ "2" }), { "1967" }.

# text
seg-b65142371229 = IS-GPS-200, IS-GPS-705; Galileo OS SIS ICD.

# text
seg-d28b74d8c755 = SigMF spetsifikatsioon, <a1>https://sigmf.org/</a1> (allikas: <a2>https://github.com/sigmf/SigMF</a2>).

# text
seg-a9b968473b2a = <s1>Eelmine</s1>Terviklikkus ja turvalisus

# text
seg-d5264da8bf65 = <s1>Järgmine</s1>ARAIM teatmik
