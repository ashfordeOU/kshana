# docs--kind-spectrum: translations (et)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Ei paku — Kshana modelleerib signaali toimivust, mitte kasulikkoormuse/antenni riistvara. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Segamine, spuufimine ja spekter</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-5d23d7f8f872 = Perekonna leht: <a1>Segamine, spuufimine ja spekter</a1>

# text
seg-f85a85f0c7e4 = MHz

# text
seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-3319b18ac61f = ja veel { "1" } maatriksis.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> Liik <c1/> laiendatud üle L-riba: sagedusalad, mis on antud eelseadistatud signaalikavandina (joonistatud iga komponendiga, ribapiiratud edastusribalaiusele, C/N0 ja J/S viidatud jälgitavale komponendile) või kohandatud kandja ja modulatsioonina Testid: <a1>leo_signal_reference.rs</a1>.

# text
# c1: docs/kinds/by-kind/spectrum.md
seg-ab8fe1c3cb79 = Allikas: <c1/>

# text
# c1: spectrum
seg-10a4479141b5 = <c1/> (stsenaariumi liik)

# text
seg-fef00c827c6a = L-riba spektrimudel ja juga-diagramm (waterfall): kogu GNSS-i L-riba ühe võimsusspektri tihedusena (PSD), sagedus risti, aeg allapoole, stsenaariumipõhise segaja ajajoone kohal. SIGNAALID: GPS L1 C/A ja L2C (BPSK({ "1" })), Galileo E1 avatud teenus (MBOC(6,1,1/11) või BOC({ "1,1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), kõik oma kandesagedusel liidese spetsifikatsiooni minimaalse vastuvõetud võimsusega (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), kui seda pole üle kirjutatud; GLONASS, BeiDou ja Galileo E6 ei ole modelleeritud. SEGAJAD: pidevlaine toon, lame kitsaribaline müra, lineaarne saehamba-chirp ja ribalai müra, mis on sobitatud riba enda modulatsiooniga, igaühel keskpunkt, ribalaius, vastuvõetud võimsus (otse või EIRP ja kaugus segamise liigi vabaruumi levikadu kaudu) ning sisse-/väljalülitusajad. Iga segajat hinnatakse iga riba suhtes selle spektraalse eraldumiskoefitsiendiga kappa üle vastuvõtja ribalaiuse ning (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; ühe segaja korral on see võrdne segamise liigi segamisvastase võrrandiga Q = 1/(R_c kappa) ning aruanne kannab seda ristkontrolli (ja segamise liigi esindusliku Q arvu selle kõrval). Müra põhjatase on k T_sys, kus T_sys = T_ant + { "290" } K (F - { "1" }). Waterfall keskmistab iga lahtri üle selle lahtri ja rea (chirpid täpselt, terved pühkimised pluss osaline; rea keskel lülituvad segajad oma töötsükli järgi), nii et C/N0 ajajoon ja pilt tulevad samadest arvudest; result.json kannab võimsuses ploki-keskmistatud ruudustikku, riba kohta C/N0 ja J/S rea kohta ning segaja kohta riba kohta SSC, Q, J/S, ribasisese J/S ja püsiva C/N0. Valikuline [iq]: mudel joonistatud kompleksse IQ-na ühel hetkel, kirjutatud SigMF-salvestisse (cf32_le või ci16_le) ja sealt tagasi loetud ning võrreldud Welchi hinnanguga. Valikuline [recording] (natiivsed ehitused): tegeliku SigMF-salvestise Welchi PSD mudeli kõrval. VALIDATED: signaalide PSD-d õpikulise peakasti laiuse vastu (BPSK(n) 2n x { "1.023" } MHz nullist nullini; BOC({ "1,1" }) kasti keskmed kohal +/-1.023 MHz) ja spektraalse eraldumise koefitsiendid nende Parsevali kinniste kujude ning Kaplani ja Hegarty Q = { "1" } (CW) ja { "1.5" } (sobitatud) vastu. MODELLED: segajate võimsused, ajajoon, vastuvõtja sisendotsa ribalaiused, pideva spektri (koodijooni ei ole) käsitlus ning AGC, blankimise ja antennidiagrammi puudumine.

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-92f1d6d2c0f2 = Ühe <c1/> käivituse kokkuvõte: scenario spectrum | { "5" } riba | { "3" } segajat | müra põhjatase -202.0 dBW/Hz | halvim riba gps-l1ca min C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-ed3a383d6f1e = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/l-band-waterfall-jamming.toml
seg-fb332c77fd0e = Näide <c1/> määrab muu hulgas:

# text
seg-df78607f9cdb = Tulemuse silt (mootori oma): MODELLED: L-riba võimsusspektri tihedus, mis on ehitatud kinniste kujudega signaalispektritest (VALIDATED õpikulise peakasti laiuse ja spektraalse eraldumise koefitsientide vastu), segajate spektritest ja kT müra põhjatasemest, taandatud J/S-iks ja efektiivseks C/N0-ks spektraalse eraldumise koefitsiendi abil. Segajate võimsused, t

# attr:alt
seg-ea1678eb9e84 = Diagramm, mille mootor kirjutab failile scenarios/l-band-waterfall-jamming.toml, liik spectrum

# text
seg-ce0afea7b030 = <b>VALIDATED</b> Ühikalaga võimsusspektri tihedused: GPS L1 C/A ja L2C (BPSK({ "1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), siinus-BOC({ "1,1" }) ja Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, lisatud MBOC variandiga), nende arvuliselt leitud nullkohad ja

# text
# c1: spectrum
seg-7e315c5675d0 = <b>MODELLED</b> Liik <c1/>: sageduse-ajas ruudustik L-riba võimsusspektri tihedusest (termiline põhjatase k T_sys, kus T_sys = T_ant + { "290" } K (F - { "1" }), signaalid oma liidese spetsifikatsiooni minimaalsete vastuvõetud võimsustega ning pidevlaine, kitsaribaline

# text
seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: Signal Metadata Format salvestiste lugemine ja kirjutamine (JSON .sigmf-meta koos põhiliste global-, captures- ja annotations-väljadega; töötlemata .sigmf-data kujul cf32_le, ci16_le või ci8, täisarvuliste dekooderitega, mida jagatakse realdata::iqif::load_iq-iga), kõik s

# text
seg-4e35cc861b15 = <b>VALIDATED</b> Ühikalaga võimsusspektri tihedused: GPS L1 C/A ja L2C (BPSK({ "1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), siinus-BOC({ "1,1" }) ja Galileo E1 MBOC(6,1,1/11) (navsignal::M. Oraakel (sõltumatu etalon; ExternalDataset): avaldatud õpikuväärtused: BPSK(n) peakast 2n x { "1.023" } MHz nullist nullini ja segamisvastased koefitsiendid Q = { "1" } kitsaribalise (CW) segaja jaoks ning Q = { "1.5" } C/A-le sobitatud hajaspektrisegaja jaoks (Kaplan & Hegarty, Understanding GPS/GNSS, 3. väljaanne, jaotis { "9.4" }); BOC(m,n) peakastid keskmega kohal pluss-miinus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); the

# text
# c1: spectrum
# c2: jamming
seg-287de49e90a8 = <b>MODELLED</b> Liik <c1/>: sageduse-ajas ruudustik L-riba võimsusspektri tihedusest (termiline põhjatase k T_sys, kus T_sys = T_ant + { "290" } K (F - { "1" }), signaalid. Oraakel (sisemine kooskõla; InternalConsistency): taandamine olemasoleva liigi <c2/> segamisvastasele võrrandile ja lingieelarvele (sama kood, kutsutud samadel sisenditel) ning k T0 F müra põhjataseme kinnisele kujule. Aluseks olevad signaalispektrid on ülalolev valideeritud rida; segajate võimsused, ajajoon ja sisendotsa ribalaiused on stsenaariumi sisendid, spektrid on pidevad (hajutuskoodi jooni ei ole) ning segajale ei mõju automaatne võimenduse reguleerimine, blankimine ega antennidiagramm

# text
seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: Signal Metadata Format salvestiste lugemine ja kirjutamine (JSON .sigmf-meta koos põhiliste global-, captures- ja annotations-väljadega; töötlemata .sigmf-data kujul cf32_le, ci1. Oraakel (sõltumatu etalon; ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) sama perioodilise Hanni akna, kattuvuse, tiheduse skaleerimise, trendi eemaldamiseta ja kahepoolse keskmise keskmistamisega: iga bin suhtelise täpsusega { "1e-12" } (täheldatud { "6.0e-14" }) { "27" } juhul, kusjuures segmentide arvud on võetud scipy enda spektrogrammist. sigmf-python { "1.13.0" } (LGPL-3.0, käivitatud tööriistana) kirjutab viis kolmanda osapoole salvestist (cf32_le, ci16_le, ci8, kaks annotatsioonidega salvestust, nullist erinev fir

# text
# c1: not_modelled[0]
seg-0cbbe567f1c8 = hajutuskoodi joonestruktuur (näiteks C/A { "1" } kHz jooned): toone hinnatakse siledat mähist vastu (tulemus <c1/>)

# text
# c1: not_modelled[1]
seg-2efdae3f5764 = automaatne võimenduse reguleerimine, kvantimine, impulssblankimine ja notšfiltreerimine (tulemus <c1/>)

# text
# c1: not_modelled[2]
seg-f3e58705c9a2 = vastuvõtuantenni diagramm segaja suunas peale ühe võimenduse arvu (tulemus <c1/>)

# text
# c1: not_modelled[3]
seg-c0d379cb1ab3 = süsteemisisene hulgipöörduse häire ühe riba satelliitide vahel (tulemus <c1/>)

# text
# c1: not_modelled[4]
seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 ja Galileo E6 (tulemus <c1/>)

# text
# c1: not_modelled[5]
seg-249d8a46f95a = projekteeritud signaali kiirgused väljaspool selle edastusribalaiust: selle spekter on seal kärbitud, seega ei jõua ükski ribaväline kiirgus naaberribasse (tulemus <c1/>)

# text
# c1: not_modelled[6]
seg-cc83c047f02a = chirpi mõju silmusele pühkimiskiirustel, mis on võrreldavad silmuse ribalaiusega: selle C/N0 kasutab rea keskmistatud spektrit (tulemus <c1/>)

# text
# c1: label
seg-7155706bc289 = MODELLED: L-riba võimsusspektri tihedus, mis on ehitatud kinniste kujudega signaalispektritest (VALIDATED õpikulise peakasti laiuse ja spektraalse eraldumise koefitsientide vastu), segajate spektritest ja kT müra põhjatasemest, taandatud J/S-iks ja efektiivseks C/N0-ks spektraalse eraldumise koefitsiendi abil. Segajate võimsused, ajajoon ja sisendotsa ribalaiused on stsenaariumi sisendid, mitte mõõtmised. (tulemus <c1/>)

# text
seg-95879767c438 = Teemaleht: <a1>LEO-SIGNAL.md</a1>

# text
seg-ce69d8d2d9d1 = <s1>Eelmine</s1>space-weather

# text
seg-ac2c9c25fbb6 = <s1>Järgmine</s1>spoof-detect
