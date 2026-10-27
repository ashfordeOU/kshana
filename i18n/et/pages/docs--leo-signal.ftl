# docs--leo-signal: translations (et)

# text
seg-3ea93ae372ca = Mida see sisaldab

# text
seg-6cb7a787ac67 = Viited

# text
seg-cbf0f9bcd2d8 = Sõltumatu etalon

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-587beeccaa11 = Eelseade

# text
seg-6752521002b2 = Osa

# text
seg-2b0d77219437 = Eelseadistused

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-c5ce76c91ff7 = Silt

# text
seg-a86ce24d81de = Sagedusriba

# text
seg-74f4e80c65cb = Komponendid

# attr:title
seg-e769f0411e64 = Avaldaja poolt tagasi võetud; arhiivikoopiat pole

# text
# c1: docs/LEO-SIGNAL.md
seg-2255f9acec5b = Source: <c1/>

# text
seg-ff4c44ecdecb = LEO-PNT signaalikujundused ja mitme sagedusriba spekter

# text
# c1: leo-signal
# c2: spectrum
# c3: leo-pass
# c4: leo-pnt-chain
seg-5e222f965192 = Stsenaariumi liik <c1/> analüüsib madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) signaale. See ei ole seotud ühe süsteemiga. Signaal on parameetritega kujundus (andmed, mitte kood), seega analüüsib sama liik avaldatud kommertssignaali, esindusliku kujundust sagedusribale, mida keegi pole avaldanud, või mis tahes kujundust, mille stsenaarium kirjutab otse sisse. Liik <c2/> joonistab need kujundused samuti, mis tahes sagedusribas ülikõrgsagedusest (UHF) kuni C-ni, iga sagedusriba oma segajatega, ning sagedusriba <c3/> või käivitus <c4/> võib kanda mis tahes neist (vt <a1>Kus kujundusi kasutatakse</a1>).

# text
seg-caccfa826a1a = Käivita komplekti kuuluvad näited:

# text
# c1: kshana example leo-band-trade
seg-441136f32290 = <c1/>: UHF-st laia C-ni sagedusribade kompromiss esindusliku kujundustega;

# text
# c1: kshana example xona-pulsar-signals
seg-23cea428326c = <c1/>: avaldatud Xona Pulsar X1 ja X5 signaalid;

# text
# c1: kshana example multi-band-jamming-waterfall
# c2: spectrum
seg-5dcfa318a4f3 = <c1/>: UHF, L, S ja C paneelid sagedusribakaupa segajate all (stsenaarium <c2/>);

# text
# c1: kshana scenarios/celeste-iod-classical-pilot-signals.toml
seg-0390769a8d7f = <c1/>, hoidla väljavõttest (ei kuulu komplekti): Celeste In-Orbit Demonstration (IOD) sagedusribad ja signaalikonfiguratsioon, mis esitati Euroopa Kosmoseagentuuri (ESA) Navigation Innovation and Support Programme (NAVISP) LEO-PNT töötoas { "2026" } (vt allpool <a1>Töötoa parameetrid</a1>).

# text
# c1: src/leo_signal.rs
# c2: src/navsignal.rs
# c3: src/spectrum.rs
# c4: data/leo-signals/
seg-62511ee92f8a = Kood: <c1/> (signaalikujundused, liik), <c2/> (suletud kujuga valemid), <c3/> (mitme sagedusriba juga-diagramm), eelseadistuse failid kataloogis <c4/>.

# text
seg-ce08de9a19de = Signaalikujundus

# text
seg-fc0d265f4006 = keskssagedus, edastusribalaius (spekter on selle väljaspool null) ja Rahvusvahelise Telekommunikatsiooniliidu (ITU) eraldis: Radio Navigation Satellite Service (RNSS), Radio Determination Satellite Service (RDSS), Mobile Satellite Service (MSS), Earth Exploration-Satellite Service (EESS), mitte-RNSS riba või muu

# text
seg-be2d5e822342 = mis tahes alamhulk <b>omandamiskomponendist</b> (lühike ja madala kiirusega, hõlpsasti leitav), <b>andmekomponendist</b> (navigatsioonisõnum) ja <b>pilootkomponendist</b> (andmevaba, kaugusmõõtmiseks)

# text
seg-e73d9832efe0 = Komponendi kohta

# text
# c1: FLAT(<MHz>)
seg-dac784d5f41a = modulatsioon: binaarne faasmanipulatsioon BPSK(n) kiirusel n × { "1.023" } Mchip/s (n võib olla murd, BPSK(1/3) on { "341" } kchip/s), binaarne nihkekandja BOC(m,n), multipleksitud BOC või <c1/> ortogonaalse sagedusjaotusega multipleksimise (OFDM) majaka jaoks; võimsuse osa; sagedusjaotusega hulgipöörduse (FDMA) alamkandja nihked; koodi pikkus; andmekiirus

# text
seg-4ccb9e269d64 = Valikuline

# text
# c1: ranging = false
seg-4c22d21ea8f0 = tugi- ja maksimaalne vastuvõetav võimsus, orbiidi kõrgus, <c1/> ainult Doppleri signaali jaoks, märkused selle kohta, mis on avaldatud ja mis eeldatud

# text
# c1: presets = [...]
# c2: [[signals]]
# c3: generic-bands
seg-c6b46532af9a = Stsenaarium võtab signaale failist <c1/> ja otse sisse kirjutatud tabelitest <c2/>. Kummagita analüüsib see eelseadistust <c3/>.

# text
# c1: data/leo-signals/
seg-a917a5ccfb79 = Üks fail igaühe kohta kataloogis <c1/>, sisse kompileeritud, igaüks viitab oma allika URL-ile. Väärtus, mida allikas ei avalda, märgitakse failis ja aruandes REPRESENTATIVE.

# text
seg-7159574bf255 = Signaalid

# text
seg-c2831d853b1d = Märgitud lähendused

# text
# c1: xona-x1
# c2: xona-x5
seg-7816d4f1c3f1 = <c1/> ({ "1593.3225" } MHz, { "1.023" } Mchip/s), <c2/> ({ "1190.51625" } MHz, { "10.23" } Mchip/s); minimaalne ja maksimaalne vastuvõetav võimsus; { "1080" } km

# text
seg-332a08bef0de = täiustatud Feheri nelifaasmanipulatsioon (EFQPSK), joonistatud ristkülikukiibi BPSK ümbrikuga; koodinihkemanipulatsiooni ja ülekattekoode ei modelleerita; edastusribalaius = peasagar (ei ole avaldatud)

# text
# c1: iridium-stl
seg-d37420c5c9f5 = <c1/> Satellite Time and Location (STL) impulsid, nelifaasmanipulatsioon (QPSK) kiirusel { "25" } ksümbolit/s, { "780" } km, ainult Doppler ja ajastus

# text
seg-a765878134e2 = PUBLIC, <a1>Resilient Navigation and Timing Foundation (RNTF) aruanne</a1>

# text
seg-5ca54b21f017 = kandelaine vahemiku { "1616" } kuni { "1626" } MHz keskel; vastuvõetav võimsus tuletatud avaldatud { "300" } kuni { "2400" } korda Global Positioning System (GPS)

# text
# c1: starlink-ku-beacon
seg-e43d1db73131 = <c1/>, { "240" } MHz OFDM majakas, ainult Doppler

# text
seg-ff9e0075e868 = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>

# text
seg-fee9a553c9ae = tasane spekter; kanali keskpunkt ja kesta kõrgus REPRESENTATIVE; avaldatud kandelaine ja müra tiheduse suhe (C/N₀) umbes { "57" } dB-Hz on määratud vastuvõtja kaudu

# text
# c1: centispace-l1
# c2: centispace-l5
seg-f89372b5231e = <c1/>, <c2/>, BPSK kiirusel { "2.046" } Mchip/s

# text
seg-2e6475b25d55 = PUBLIC, <a1>PubMed Central PMC10301026</a1>

# text
seg-ac53cebe5303 = kandelained paigutatud GPS L1 ja L5 kandelainete juurde (allikas: „lähedal“); koodi pikkus REPRESENTATIVE

# text
# c1: generic-c-band-leo
seg-cb1420efc108 = <c1/>, { "5020" } MHz, BPSK({ "10" }) { "20" } MHz-s

# text
seg-895f6039fce2 = REPRESENTATIVE, C-riba süsteemidele, mille parameetrid ei ole avalikud (näiteks TrustPoint)

# text
seg-a407aaab864c = kogu kujundus

# text
seg-2f679a429dae = REPRESENTATIVE, eraldised <a1>ITU raadiosidereeglitest</a1>; { "465" } MHz UHF kandelaine avalikust <s1>openRECEIVER LEO-PNT signaalide uuringust</s1>

# text
seg-2054d9ce8a0d = kogu kujundus (ka UHF ribalaius ja modulatsioon)

# text
seg-24360342e8e6 = ATOMIC „nullkella“ polünoomefemeriid on navigatsioonisõnumi mudel, mitte signaalikujundus, ning kuulub navigatsioonisõnumi töö juurde, mitte siia.

# text
seg-ebfc032d7898 = Mida signaali kohta arvutatakse

# text
# c1: η = (2/π)[Si(πBT_c) − sin²(πBT_c/2)/(πBT_c/2)]
seg-211f655e00fa = <b>Ribapiiratud võimsusspektri tihedus (PSD)</b> ja komponendi kohta selle võimsuse osa, mille edastusriba läbi laseb. BPSK komponendi korral keskel asub suletud kuju <c1/> numbrilise väärtuse kõrval ({ "90.3" } % peasagara jaoks).

# text
# c1: β² = [B/2 − sin(πBT_c)/(2πT_c)] / (π² T_c η)
seg-05e2a7b8235a = Jälgitava komponendi <b>ruutkeskmine (RMS, Gaboři) ribalaius</b> ribas, BPSK suletud kujuga <c1/>.

# text
# c1: σ² = B_L(1 − ½B_L T) ∫ G sin²(πfΔ) df / [(2π)² (C/N₀) (∫ f G sin(πfΔ) df)²]
seg-f878fd0359c9 = Viivituslukustussilmuse (DLL) <b>koodijälgimise termilise müra värin</b> võrreldes C/N₀ ja varase-hilise korrelaatori vahega, Betzi ja Kolodziejski ribapiiratud varase-hilise valemi järgi ({ "2009" }): <c1/>, vaikimisi koherentne, soovi korral mittekoherentse ruutkadudega. Aruanne lisab piiramata ribaga õpikuvormi (Kaplan ja Hegarty) ning Gaboři ribalaiusega määratud kaduva vahe piiri. <b>Kaugusmõõtmise täpsus</b> on see värin meetrites tugi-C/N₀ ja -vahe juures.

# text
# c1: f v R_E cos(el) / ((R_E + h) c)
# c2: 2/(3T)
seg-089e4e98af82 = <b>Omandamine</b>: suurim satelliidi Doppler otse pea kohal toimuval läbilennul kõrgusnurga maski juures (<c1/>, ringorbiit, Maa pöörlemiseta) pluss ostsillaatori ja kasutaja liikmed; Doppleri korvid <c2/>; koodikorvid ühe perioodi jooksul; ruutdetektori (üldistatud Marcum Q) tuvastustõenäosus lahtri kohta antud valehäire tõenäosuse korral, tsentreeritud ja halvima juhu ülekattega; ning järjestikuse ja koodiparalleelse üheviibelise otsingu keskmine omandamisaeg (Holmes).

# text
seg-1e2029183bdc = <b>Ühilduvus</b>: ribapiiratud signaali spektraalse eraldatuse koefitsient (SSC) GPS L1 jämekoodi/omandamise (C/A), Galileo E1, GPS L5, Galileo E5a, E5b ja E5 alternatiivse BOC (AltBOC) signaali suhtes iga globaalse satelliitnavigatsioonisüsteemi (GNSS) vastuvõtja sagedusribas, C/N₀ kadu, mida see oma vastuvõetaval võimsusel põhjustab, ning iga GNSS-i signaali SSC ja C/N₀ kadu LEO jälgitavasse komponenti.

# text
# c1: spectrum
# c2: spectrum::Jammer::ssc
seg-864f3f2a5aa1 = <b>Segaja tolerants</b>: segaja ja signaali võimsuse suhe (J/S) pidevlaine (CW) toonil kandelainel, tasasel müral üle edastusriba ja jälgitavale komponendile sobitatud müral, mis viib jälgitava komponendi jälgimisläveni, liigi <c1/> enda SSC koodist (<c2/>).

# text
# c1: 10 log₁₀(s/η)
# c2: spectrum
seg-0fbea397ab93 = C/N₀ tava: pühe ja tugi on <b>kogu ribasisene</b> C/N₀. Komponendi osa siseneb jälgimis- ja segajavalemitesse kui <c1/> (selle osa filtreerimata võimsusest jagatud ribasisese osaga), sama tava, mida liik <c2/> kasutab lihtsa sagedusriba jaoks, mille modulatsiooni võimsus väljaspool vastuvõtja riba läheb samamoodi kaduma.

# text
seg-3b7d16e8873a = Sagedusribade kompromiss

# text
# c1: [trade]
# c2: 40.3·TEC/f²
seg-39382eb3a60c = <c1/> asetab iga signaali tugisignaali kõrvale: esimese järgu ionosfääri grupiviivitus <c2/> antud kaldsuunalise täieliku elektronsisalduse (TEC) korral ({ "1" } TEC ühik, TECU, = 10¹⁶ elektroni/m²), vabaruumi levikadu (FSPL) kaldekaugusel, kaugusmõõtmise täpsus <b>võrdse C/N₀</b> ja <b>võrdse ekvivalentse isotroopselt kiiratud võimsuse (EIRP)</b> korral (C/N₀ miinus vabaruumi kao erinevus, isotroopsed antennid mõlemas otsas) ning segaja tolerants võrdse EIRP C/N₀ juures.

# text
# c1: scenarios/leo-band-trade.toml
seg-58ced9eba711 = <c1/> ({ "50" } TECU, { "1000" } km, { "45" } dB-Hz, 0.5-kiibine koherentne vahe, { "1" } Hz silmus, { "20" } ms):

# text
seg-72f051e2d7e1 = Signaal

# text
seg-3cfdff157be3 = Ionosfääri viivitus

# text
seg-b1436d1fd7a4 = ΔFSPL võrreldes L-iga

# text
seg-b5ce20ced519 = Kaugusmõõtmine, võrdne C/N₀

# text
seg-2becbee24d47 = C/N₀, võrdne EIRP

# text
seg-aba982013f21 = Kaugusmõõtmine, võrdne EIRP

# text
seg-8b292612e43e = CW J/S tolerants

# text
seg-53c8b6059c3f = { "465" } MHz, BPSK({ "5" })

# text
seg-1ee03c5e8633 = { "93.19" } m (×{ "6.57" })

# text
seg-66e74ec8ec1f = −{ "8.17" } dB

# text
seg-4dfc4b277e46 = { "0.221" } m

# text
seg-2a67835c7ddd = { "53.17" } dB-Hz

# text
seg-b36b61eaff50 = { "0.086" } m

# text
seg-37de1532b69e = { "42.1" } dB

# text
seg-f16b26301a6b = { "1191.795" } MHz, BPSK({ "10" })

# text
seg-1cc0fc817fca = { "14.19" } m

# text
seg-c1d04452ee8f = { "0.111" } m

# text
seg-b1dccfc14bb2 = { "45.00" } dB-Hz

# text
seg-467afbc3965e = { "45.0" } dB

# text
seg-63fc45ce7ef9 = { "2492.028" } MHz, BPSK({ "5" })

# text
seg-d4b8b8837709 = { "3.24" } m (×{ "0.229" })

# text
seg-271acd87a8d6 = +{ "6.41" } dB

# text
seg-0f38ea614b7f = { "0.185" } m

# text
seg-c531dc11c01d = { "38.59" } dB-Hz

# text
seg-6edbdabf77cb = { "0.388" } m

# text
seg-b1c384a78d8c = { "41.7" } dB

# text
seg-d13c29401059 = { "5020" } MHz, BPSK({ "10" })

# text
seg-7563cf0f3ebb = { "0.80" } m (×{ "0.056" })

# text
seg-fa10d26d0f8e = +{ "12.49" } dB

# text
seg-9f6390cc903b = { "32.51" } dB-Hz

# text
seg-d04fb147c95f = { "0.465" } m

# text
seg-e825ae4d1080 = { "43.4" } dB

# text
seg-2f20b409a3df = { "5100" } MHz, BPSK({ "50" })

# text
seg-6f22870202af = { "0.77" } m (×{ "0.055" })

# text
seg-ad13cdf3955f = +{ "12.63" } dB

# text
seg-da4b72e53c18 = { "0.022" } m

# text
seg-07ba1b6b9728 = { "32.37" } dB-Hz

# text
seg-e96dfdc0d92f = { "0.093" } m

# text
seg-04a27fee9486 = { "50.3" } dB

# text
seg-edcaed830e15 = Kompromiss loeb mõlemat pidi. Võrdse C/N₀ korral määrab kaugusmõõtmise täpsuse kiibisagedus ja sagedusriba (lai C mõõdab viis korda täpsemalt kui L). Võrdse kiiratud võimsuse korral nõuab vabaruumi levikadu kõrgemate sagedusribade eest täishinda: C-riba kaotab { "12.5" } dB C/N₀-st ja mõõdab neli korda halvemini kui L, UHF võidab { "8.2" } dB, kandes samal ajal { "6.6" } korda suuremat ionosfääriviivitust. Lai C ostab oma täpsuse tagasi ribalaiusega. Need tuginevad esindusliku kujundustele ja isotroopsetele antennidele; suunatud kasutaja antenn C-ribas muudab võrdse EIRP veerge.

# text
seg-9bb6fa0e7a95 = Xona Pulsar

# text
# c1: scenarios/xona-pulsar-signals.toml
seg-d71e8de9cdda = <c1/> avaldatud minimaalsete vastuvõetavate võimsuste juures { "290" } K antenni ja { "2" } dB müranäitaja vastu (põhi −{ "201.98" } dBW/Hz):

# text
seg-4cf70433cc54 = Tugi-C/N₀

# text
seg-2a22ffc83e00 = { "53.78" } dB-Hz

# text
seg-8f274ed7feff = { "57.08" } dB-Hz

# text
seg-6be7e20ca92f = Kaugusmõõtmise täpsus ({ "0.5" } kiipi, koherentne, { "1" } Hz)

# text
seg-60218177538e = { "0.402" } m

# text
seg-e5ccbfea146d = { "0.028" } m

# text
seg-b5a638da9ee1 = Maksimaalne satelliidi Doppler, { "1080" } km

# text
seg-6917f2712acf = { "33.2" } kHz

# text
seg-895ac83e4a5b = { "24.8" } kHz

# text
seg-b4c4179a0363 = Doppler × koodikorvid ({ "1" } ms, { "0.5" } kiipi)

# text
seg-bed6ba024afe = Keskmine koodiparalleelne omandamisaeg

# text
seg-93ffb02c7c50 = { "0.15" } s

# text
seg-3671bc5f2ace = { "0.37" } s

# text
seg-7e4c190cb4ab = X5 asub sagedusel { "1190.51625" } MHz, Galileo E5 riba sees: selle SSC on −{ "91.2" } dB/Hz Galileo E5a ja GPS L5 suhtes, −{ "103.2" } dB/Hz E5b suhtes ja −{ "86.2" } dB/Hz AltBOC signaali suhtes ning üks X5 satelliit oma miinimumvõimsusel tõstab GNSS-i vastuvõtja müratihedust { "0.0001" } kuni { "0.005" } dB. X1 Doppler, { "33.2" } kHz, jääb artikli esitatud { "32" } kuni { "34" } kHz sisse (allpool VALIDATED Doppleri rida).

# text
seg-661eefb1f346 = Mitme sagedusriba spekter

# text
# c1: spectrum
# c2: [[bands]]
# c3: gps-l1ca
# c4: galileo-e1
# c5: gps-l2c
# c6: gps-l5
# c7: galileo-e5a
seg-0a8bbe2921fd = Liigi <c1/> <c2/> võtavad lisaks viiele nimetatud GNSS-i sagedusribale (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>):

# text
# c1: signal = "<preset signal>"
# c2: signal_power_dbw
# c3: tracked_power_dbw
seg-63bd7d8a192d = <c1/>: eelseadistatud kujundus, joonistatud kõigi komponentidega, ribapiiratud oma edastusribalaiusele, vastuvõetud eelseadistuse tugivõimsusel või <c2/>. C/N₀ ja J/S viitavad jälgitavale komponendile (aruandes <c3/>);

# text
# c1: centre_mhz
# c2: modulation
# c3: signal_power_dbw
seg-603a2b97e621 = <c1/> koos <c2/> ja <c3/>: mis tahes kohandatud sagedusriba.

# text
# c1: [[panels]]
# c2: wideband
# c3: l-band-waterfall-jamming
# c4: tests/leo_signal_reference.rs
seg-b1c30f5d69cf = <c1/> lisavad juga-diagramme teistele sagedusvahemikele samal ajajoonel ja värviskaalal ning <c2/> (barraaž) segaja liitub CW, kitsasriba, sirina ja sobitatud müraga. Lihtne sagedusriba käitub täpselt nagu varem: komplekti kuuluv <c3/> näide annab ikka { "43.48" } dB-Hz nominaalse ja { "3.23" } dB-Hz minimaalse L1 C/A jaoks (kinnitatud failis <c4/>).

# text
# c1: scenarios/multi-band-jamming-waterfall.toml
seg-35151477cbc2 = <c1/> ({ "60" } s, üks rida sekundis):

# text
seg-47408d30d095 = Nominaalne C/N₀

# text
seg-e618666a44d8 = Pärast oma segajat

# text
seg-f75d3804cfe8 = Segaja

# text
seg-5751b2520829 = generic-uhf ({ "465" } MHz)

# text
seg-995748f9c74c = { "49.41" } dB-Hz

# text
seg-a582f1a22a07 = { "34.38" } dB-Hz alates { "10" } s

# text
seg-23570b8c7403 = CW kandelainel, −{ "120" } dBW

# text
seg-5393b075ff7f = { "43.48" } dB-Hz

# text
seg-2e935ea7b90e = { "3.38" } dB-Hz alates { "20" } s (kadunud)

# text
seg-52256ba98a99 = { "16" } MHz sirin, { "50" } mW { "100" } m juures

# text
seg-4321ccaeeca5 = { "46.73" } dB-Hz

# text
seg-71abaef6924e = { "38.51" } dB-Hz alates { "30" } s

# text
seg-45441a20f061 = { "40" } MHz barraaž sagedusel { "1185" } MHz, −{ "118" } dBW

# text
seg-59fd1427d61b = { "54.51" } dB-Hz

# text
seg-430461899d82 = { "46.29" } dB-Hz alates { "30" } s

# text
seg-4bcace842ce1 = sama barraaž

# text
seg-472da83fd67a = generic-s ({ "2492.028" } MHz)

# text
seg-0f47178201ca = { "49.23" } dB-Hz

# text
seg-0f0cad45f636 = { "41.69" } dB-Hz alates { "40" } s

# text
seg-d04f42bc0567 = { "2" } MHz müra, −{ "128" } dBW

# text
seg-372655e7c722 = generic-c-band-leo ({ "5020" } MHz)

# text
seg-f8e6beeceedd = { "47.41" } dB-Hz

# text
seg-b27c4bc24059 = { "40.35" } dB-Hz alates { "50" } s

# text
seg-ab6304cf6aec = sobitatud müra, −{ "124" } dBW

# text
seg-1f8a742cb215 = Iga segaja mõjutab ainult oma sagedusriba; test hoiab iga muud sagedusriba nominaalsel C/N₀ kuni selle enda segaja käivitumiseni.

# text
seg-01c63dd5d11b = Kus kujundusi kasutatakse

# text
seg-74f85b484b08 = Kujundust otsitakse nime järgi kõikjal, kus sagedusriba võib seda nimetada:

# text
# c1: spectrum
# c2: signal = "<design>"
# c3: multi-band-jamming-waterfall
# c4: leo-resilience-js-margin
# c5: leo-resilience-multiband-diversity
# c6: leo-resilience-gnss-jammed-leo-carries
seg-4a7aca809ec3 = sagedusriba <c1/> (<c2/>, ülal): <c3/>, <c4/> ning kampaaniad <c5/> ja <c6/>;

# text
# c1: leo-pass
# c2: signal = "<design>"
# c3: frequency_mhz
seg-1ee84efd74b3 = sagedusriba <c1/> (<c2/>): riba võtab kujunduse keskssageduse (kui <c3/> pole antud), edastusribalaiuse ja jälgitava kiibisageduse, jagab oma EIRP komponentide vahel nende võimsusosade järgi ning annab igal epohhil aru jälgitava komponendi C/N₀-st ja ribapiiratud koodijälgimise värinast (<a1>LEO-PASS.md</a1>);

# text
# c1: leo-pnt-chain
# c2: leo-pnt-end-to-end
# c3: xona-pulsar-end-to-end
seg-33732550ba94 = liik <c1/>, mis annab kujunduse võimsusjaotuse ja kiibisageduse läbilennule ning selle kandesageduse ja kiibisageduse liidetud lahendusele (<c2/>, <c3/>; <a1>LEO-PNT.md</a1>).

# text
seg-625f50ac3189 = Töötoa parameetrid

# text
# c1: scenarios/celeste-iod-classical-pilot-signals.toml
# c2: src/celeste_iod.rs
# c3: scenarios/*celeste-iod*.toml
seg-9d50778efa0a = <c1/> sisaldab Celeste IOD sagedusribasid ja „Classical Pilot“ signaalikonfiguratsiooni #1, nagu need esitati ESA NAVISP LEO-PNT töötoas { "2026" }, koos ühe kujunduse kuju kontrolliga seal näidatud mõõdetud spektri vastu. See on üks Celeste IOD eelseadistuse failidest (teised on <c2/> ja muud <c3/>); ükski Celeste signaali spetsifikatsioon ei ole avalik. Selle komponendid kannavad oma eeldusi (võimsusjaotused, koodi pikkused, FDMA nihked ja esinduslik modulatsioon sagedusribadele, mille modulatsiooni ei esitatud). Kuju kontroll on MODELLED kooskõla: see võrdleb kujusid, mitte kalibreeritud tasemeid.

# text
# c1: src/celeste_iod.rs
# c2: scenarios/*celeste-iod*.toml
# c3: kshana example
# c4: include_str!
seg-6e259f57af91 = See hoitakse tagasi koos ülejäänud eelseadistusega: tuleb kustutada <c1/> ja failid <c2/>. Miski ei kompileeri stsenaariumi sisse: käsurealiides loetleb selle ainult hoidlas olevana (<c3/> nimetab ja selgitab seda, mitte ei väljasta), ning test lükkab tagasi mis tahes selle <c4/>. Iga muu stsenaarium, test ja sõltumatu etalon töötab ilma selleta; seda lugev test läbitakse märkusega, kui seda pole, ning README stsenaariumifailide arv loeb selle ikka sisse.

# text
seg-53a7343c076e = Väide

# text
seg-6e0de0f2b25f = BPSK võimsus ribas ({ "90.3" } % peasagaras); ribapiiratud varase-hilise värin, mis taandub õpikute koherentsetele ja mittekoherentsetele vormidele ning oma Gaboři piirile; BPSK enda-SSC 2/({ "3" } R_c)

# text
seg-e35f7c20a976 = Kaplan & Hegarty, Betz & Kolodziejski { "2009" }, Betz { "2001" }, Abramowitz & Stegun tabel { "5.1" }

# text
seg-0ceb71e558f6 = Ribapiiratud Gaboři ribalaiuse suletud kuju; nihutatud BPSK SSC nullist erineva nihke korral; AltBOC ühikpindala (kõik ülaltoodud rea sees, ristkontrollidena)

# text
seg-b0552001e519 = sisemine kooskõla

# text
seg-af6cff634177 = siin tuletatud, kontrollitud kvadratuuri vastu

# text
seg-6b74bc7777c7 = Maksimaalne LEO Doppler

# text
seg-f4f4ee11749d = Xona Pulsar X1 { "32" } kuni { "34" } kHz (arXiv { "2509.19551" }); Iridium ±{ "36" } kHz (RNTF)

# text
# c1: leo-signal
seg-08e5ec9a31a0 = <c1/> kujundused, omandamine, ühilduvus, segaja tolerants, kompromiss, kuju kontrollid

# text
seg-64f232587c5f = valideeritud suletud kujuga valemid, detektori samasus P_d({ "0" }) = P_fa, Holmesi keskmine aeg, spektriliigi enda SSC ahel

# text
seg-a456645f97aa = Mitme sagedusriba spekter

# text
seg-868432ccfa09 = taandumine muutumatuks spektri- ja segamisahelateks

# text
seg-430edd66bda0 = Modelleerimata

# text
seg-d3bba3714684 = EFQPSK, koodinihkemanipulatsiooni ja OFDM täpsed spektrid.

# text
seg-53a727d317ae = Levituskoodi joonstruktuur ja hulgipöörduse ristkorrelatsioon.

# text
seg-08e229ae97e9 = Saatja ja vastuvõtja filtrid peale ideaalse telliskivimüüri: ribavälist kiirgust pole.

# text
seg-b1fe4ce62e6a = Mitmeteelevi, kvantimine ja automaatne võimenduse juhtimine.

# text
seg-5d2af0802400 = Maa pöörlemine Doppleri piiris (kuni umbes { "0.46" } km/s kaugusemuutuse kiirust).

# text
seg-5e5e1124fbbb = Ionosfääriviivitus peale esimese järgu ning elektronsisalduse jagunemine LEO satelliidi kohal ja all: kaldsuunaline TEC on sisend.

# text
seg-8c0d738304ab = Atmosfääri-, vihma- ja polarisatsioonikaod.

# text
seg-1fc440f042cf = Mitme viibega omandamisloogika.

# text
seg-090a6ecf879f = Koondhäire peale satelliidipõhise arvu.

# text
seg-c4b2a79ee33d = J. W. Betz ja K. R. Kolodziejski, „Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I“, <em>IEEE (Institute of Electrical and Electronics Engineers) Transactions on Aerospace and Electronic Systems</em> { "45" }({ "4" }), { "2009" }.

# text
seg-52ad2f21daf4 = J. W. Betz, „Binary Offset Carrier Modulations for Radionavigation“, <em>NAVIGATION</em> { "48" }({ "4" }),

# text
seg-aeeea70a0258 = E. D. Kaplan ja C. J. Hegarty (toim.), <em>Understanding GPS/GNSS</em>, 3. trükk, Artech House,

# text
seg-343397c21357 = J. K. Holmes, <em>Coherent Spread Spectrum Systems</em>, Wiley, { "1982" }.

# text
seg-34af310a980b = M. Abramowitz ja I. A. Stegun, <em>Handbook of Mathematical Functions</em>, { "1964" }, §{ "5.2" } ja tabel { "5.1" }.

# text
seg-45606af6bda2 = Galileo Open Service Signal-in-Space Interface Control Document; IS-GPS-200; IS-GPS-705.

# text
seg-960fc01f0a62 = Leclère, Marathe ja Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>.

# text
seg-70efdc604ab9 = Resilient Navigation and Timing Foundation, <em>Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites</em>, <a1>https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf</a1>.

# text
seg-72490fa16fd2 = Kozhaya, Saroufim ja Kassas, <em>NAVIGATION</em> { "72" }({ "1" }), { "2025" }, <a1>https://navi.ion.org/content/72/1/navi.685</a1>.

# text
seg-00cfb54b28c0 = CentiSpace: <a1>https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/</a1>.

# text
seg-4d954d28b661 = ESA Celeste IOD faktid: <a1>https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures</a1>.

# text
seg-d43b8255ba58 = ITU raadiosidereeglid: <a1>https://www.itu.int/pub/R-REG-RR</a1>.

# text
# c1: generic-uhf
seg-3a9fe081eb89 = openRECEIVER, <em>LEO-PNT Signals: Inside CELESTE's Four Bands</em>, { "1" } august { "2026" } (liigi <c1/> { "465" } MHz UHF kandelaine avalik allikas): <s1>https://open-receiver.com/blogs/leo-pnt-signals-celeste/</s1>. Leht on saidilt tagasi võetud (HTTP { "404" } ja kadunud selle ajaveebi registrist 2026-09-29); otsingumootorid loetlevad seda ikka selle pealkirja all.

# text
seg-18b16c83dd7c = <s1>Eelmine</s1>LEO positsioneerimine, navigatsioon ja aeg

# text
seg-50fe3f8ae7ec = <s1>Järgmine</s1>LEO läbilend ja sidelingi eelarve
