# docs--kind-leo-signal: translations (et)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-a3697ad561db = Hz

# text
seg-1918189ac2bf = ppm

# text
seg-49964654d5f4 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Madala Maa orbiidi navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README peatükk Evidence).

# text
seg-c5478f572d21 = Perekonna leht: <a1>Madala Maa orbiidi navigatsioon</a1>

# text
seg-ae15d15bf151 = Teemaleht: <a1>LEO-PASS.md</a1>

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: siinusintegraal (sine_integral), BPSK-R võimsuse osa kahepoolses ribas suletud kujul (bpsk_power_in_band_closed_form), riba-. Oraakel (sõltumatu etalon) (ExternalDataset): Väliselt kinnitatud: { "90.3" } protsenti peasagara võimsust, koherentne varajase-hilise värin kindlaksmääratud tööpunktis, siinusintegraali tabeliväärtused ja BPSK enda spektraalse eraldatuse koefitsient 2/({ "3" } R_c) nullnihkel. Ainult sisemised ristkontrollid, mitte väline valideerimine: ribapiiratud BPSK Gaboři ribalaiuse suletud kuju ja selle asümptoot ning nihutatud BPSK spektraalse eraldatuse koefitsient nullist erinevatel nihetel, mõlemad

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> Liik <c1/>: parameetriseeritud signaalikavandid (sagedusala, edastusribalaius, ITU jaotus; omandamise-, andme- ja pilootkomponendid BPSK(n), BOC(m,n), MB. Oraakel (sõltumatu etalon) (InternalConsistency): Kahe ülaltoodud rea valideeritud suletud kujud, ruutseaduse valehäire samasus P_d(snr = { "0" }) = P_fa ja Holmesi keskmine omandamisaeg ning taandamine spektri liigi enda SSC ahelale (sama Jammer::ssc kood). Kavandid ise on sisendid: eelseaded, mis on märgitud REPRESENTATIVE või WORKSHOP, ei ole avaldatud spetsifikatsioonid, täiustatud Feheri QPSK, koodinihkega modulatsiooni ja OFDM spektrid on ligikaudsed ning kuju

# text
# c1: docs/kinds/by-kind/leo-signal.md
seg-051999733048 = Allikas: <c1/>

# text
# c1: leo-signal
seg-16ae2a08d3c8 = <c1/> (stsenaariumi liik)

# text
seg-97b8d07150d4 = LEO-PNT signaalikavandid: parameetriseeritud madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) signaalid mis tahes süsteemi, sagedusala ja struktuuri jaoks. SIGNAAL on sagedusala (keskmine sagedus, edastusribalaius, ITU jaotus RNSS/RDSS/MSS/EESS/non-RNSS/other) ja komponendid (omandamine, andmed, piloot; mis tahes alamhulk), igaühel modulatsioon (BPSK(n) murdarvulise n-ga, BOC(m,n), MBOC({ "6,1" },p) või lame OFDM-laadne riba), võimsuse osa, valikulised FDMA alamkandja nihked, koodipikkus ja andmekiirus. Signaalid tulevad kompileeritud avalikest eelseadefailidest (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; igaühel oma allika URL ja iga avaldamata väärtus märgitud REPRESENTATIVE) või kirjutatakse sisemiselt. SIGNAALI KOHTA: ribapiiratud võimsusspektri tihedus ja iga komponendi võimsuse osa, mille edastusriba läbi laseb (BPSK suletud kuju numbrilise väärtuse kõrval), RMS (Gabor) ribalaius, viivitussilmuse koodijälgimise soojusmüra värin C/N0 ja varajase-hilise vahe suhtes ribapiiratud koherentsest (või mittekoherentsest) varajase-hilise valemist Betz & Kolodziejski { "2009" } koos selle piiramata riba õpikuvormi ja kaduva vahega Gabori piiriga, ulatuse täpsus meetrites, omandamise otsinguruum (Doppleri korvid orbiidi maksimaalsest Dopplerist pluss ostsillaatori ja kasutaja liikmed, korrutatud koodikorvidega), ruutseaduse tuvastamise tõenäosus ning keskmine järjestikune ja koodiparalleelne omandamisaeg, signaali spektraalse eraldatuse koefitsient GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja E5 AltBOC suhtes ning kõigi nende signaali suhtes koos C/N0 halvenemisega, ja CW, lairiba ja sobitatud J/S, mida jälgitav komponent talub, spektri liigi enda SSC masinavärgist. SAGEDUSALA KOMPROMISS: esimest järku ionosfääriline viivitus ({ "40.3" } TEC/f^{ "2" }), vabaruumi kadu, ulatuse täpsus võrdsel C/N0 korral ja võrdsel EIRP korral ning segaja taluvus. Valikulised KUJUKONTROLLID võrdlevad kavandi spektrit kirjeldatud mõõtmisega (MODELLED kooskõla). VALIDATED: BPSK võimsus ribas ({ "90.3" } % peasagaras) ja Gabori ribalaiuse suletud kujud, ribapiiratud värin, mis taandub õpikupõhisele koherentsele varajase-hilise kujule ja selle Gabori piirile, nihutatud BPSK spektraalse eraldatuse koefitsient selle Parsevali suletud kuju vastu, AltBOC spektri ühikpindala ja maksimaalne LEO Doppler avaldatud Xona Pulsari (32-34 kHz) ja Iridiumi ({ "36" } kHz) arvude vastu. MODELLED: iga kavand, võimsusjaotus, C/N0 ja segaja tase; EFQPSK, CSK ja OFDM spektrid on ligikaudsed.

# text
# c1: scenarios/leo-band-trade.toml
seg-37e5fdff9d4d = Ühe <c1/> käivituse kokkuvõte: stsenaarium leo-signal | { "5" } signaali | mürapõhi -202.0 dBW/Hz | täpseim ulatuse mõõtmine generic-c-wide { "0.022" } m juures { "45.0" } dB-Hz

# text
# c1: presets
# c2: signals
# c3: receiver
# c4: acquisition
# c5: compatibility
# c6: trade
# c7: shape_checks
# c8: psd_points
seg-b538d3ff9fdb = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/leo-band-trade.toml
seg-6aaf62f55e65 = Näide <c1/> määrab muu hulgas:

# text
seg-9fd02351d844 = ms

# text
seg-05e8854de548 = kiip

# text
seg-d12bc1d2b815 = koherentne

# text
seg-0f29946fe4fb = Tulemuse silt (mootori oma): MODELLED: parameetriseeritud madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) signaalikavandid, ribapiiratud oma edastusribalaiusega. Aluseks olevad suletud kujud on VALIDATED (BPSK võimsus ribas ja Gabori ribalaius, ribapiiratud varajase-hilise koodijälgimise värin, mis taandub õpiku

# attr:alt
seg-8bf45b6989d1 = Mootori joonistatud diagramm failile scenarios/leo-band-trade.toml, liik leo-signal

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: siinusintegraal (sine_integral), BPSK-R võimsuse osa kahepoolses ribas suletud kujul (bpsk_power_in_band_closed_form), ribapiiratud BPSK Gabori ribalaius suletud kujul (bpsk_gabor_bandwidth_closed_form_hz

# text
# c1: leo-signal
seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: suurim satelliidi Doppler pea kohalt läbilennul elevatsioonimaskil ringorbiidi jaoks, v R_E cos(el) / (R_E + h) korda f / c, iga eelseade oma kandjast ja orbiidi kõrgusest; liik <c1/> lisab o

# text
# c1: leo-signal
seg-e0a4f53c5a96 = <b>MODELLED</b> Liik <c1/>: parameetriseeritud signaalikavandid (sagedusala, edastusribalaius, ITU jaotus; omandamise-, andme- ja pilootkomponendid BPSK(n), BOC(m,n), MBOC või lamedate spektritega, võimsusosad, FDMA alamkandjad, koodipikkused ja andmekiirused Testid: <a1>leo_signal_reference.rs</a1>.

# text
# c1: spectrum
seg-9ca82c79430e = <b>MODELLED</b> Liik <c1/> laiendatud üle L-riba: sagedusalad, mis on antud eelseadistatud signaalikavandina (joonistatud iga komponendiga, ribapiiratud edastusribalaiusele, C/N0 ja J/S viidatud jälgitavale komponendile) või kohandatud kandja ja modulatsioonina Testid: <a1>leo_signal_reference.rs</a1>.

# text
seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: suurim satelliidi Doppler pea kohalt läbilennul elevatsioonimaskil ringorbiidi jaoks, v R_E cos(el) / (R_E + h) korda f / c,. Oraakel (sõltumatu etalon) (ExternalDataset): Avaldatud arvud: Xona Pulsar X1 maksimaalne Doppler { "32" } kuni { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridiumi Doppler kuni +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Maa pöörlemine on välja jäetud, mis nihutab arvu kuni umbes { "2.3" } kHz võrra; mõlemad avaldatud arvud täidetakse ilma selleta.

# text
# c1: not_modelled[0]
seg-1ab79cdbd269 = täiustatud Feheri QPSK, koodinihkega modulatsiooni ja OFDM täpsed spektrid: asemele astub ristkülikukiibiga BPSK ümbris või lame riba, nagu iga eelseade ütleb (tulemus <c1/>)

# text
# c1: not_modelled[1]
seg-0561c3ed88fb = laotuskoodi joonestruktuur ja koodide vaheline hulgipääsu ristkorrelatsioon (tulemus <c1/>)

# text
# c1: not_modelled[2]
seg-8b4df054a7b3 = edastus- ja vastuvõtufiltrid peale ideaalse telliskivimüüri edastusribalaiusel: ei ole ribavälist kiirgust, ei ole filtri rühmaviivitust (tulemus <c1/>)

# text
# c1: not_modelled[3]
seg-ad5f7cc4a439 = mitmeteelevi, vastuvõtja kvantimine ja automaatne võimenduse reguleerimine (tulemus <c1/>)

# text
# c1: not_modelled[4]
seg-e38fc1a121ab = Maa pöörlemine Doppleri piiris (kuni umbes { "0.46" } km/s vahemaa muutumiskiirust ekvaatoril) (tulemus <c1/>)

# text
# c1: not_modelled[5]
seg-32a132809a9b = ionosfääriline viivitus üle esimese järgu ja elektronsisalduse jaotus LEO satelliidi kohal ja all: kaldne TEC on sisend (tulemus <c1/>)

# text
# c1: not_modelled[6]
seg-8189e06f4a56 = atmosfääri-, vihma- ja polarisatsioonikaod: võrreldakse ainult vabaruumi kadu (vihm loeb C-sagedusalas) (tulemus <c1/>)

# text
# c1: not_modelled[7]
seg-445cecb7370c = omandamine üle ühe viibe valehäire karistusega: ei ole mitme viibega kontrolli loogikat, ühtlane koodifaasi eelinfo, halvim juhtum (tulemus <c1/>)

# text
seg-8eefe4197d7f = <s1>Eelmine</s1>leo-pvt

# text
seg-60423e1ed0ca = <s1>Järgmine</s1>link-budget
