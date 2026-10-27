# docs--kind-leo-navmsg: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-1d65b71c5de0 = { "5" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/leo-navmsg.md
seg-648c27220789 = Allikas: <c1/>

# text
# c1: leo-navmsg
seg-087287602b47 = <c1/> (stsenaariumi liik)

# text
seg-49964654d5f4 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Madala Maa orbiidi navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README peatükk Evidence).

# text
seg-867f3e41b5ab = LEO navigatsioonisõnum: madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja satelliidi edastatav efemeriid ja kell, mis tahes orbiidi, kandja ja mudeli jaoks, valikuliste nimetatud eelseadetega (Xona Pulsar, Iridium, Starlink, CentiSpace, esindussüsteem C-sagedusalas, ATOMIC nullkella mudel, Celeste IOD). SISU: lisaandmed (SVID, andmeväljaanne, sagedusala, signaali tervis), sünkroniseerimine (nädal, nädala aeg, teise järgu kellapolünoom af0-af2 ümber toc), efemeriid ühes neljast mudelist -- Galileo OS SIS ICD 16 parameetriga Kepleri komplekt; see komplekt pluss piki-, risti- ja radiaalsuunalised parandpolünoomid; Liu et al. { "2025" } 22 parameetriga mudel; ECEF-polünoom ilma kellaliikmeteta (ATOMIC nullkell) -- ja muud teenused (Klobucharu edastuskomplekt, NeQuick-G ai0-ai2 efektiivse ionisatsioonitasemega ning süsteemiaja ja UTC parameetrid ICD liigsekundi loogikaga). SOBITI: tõeorbiit, mis on integreeritud tsonaalse J2-J6 või EGM2008 gravitatsiooniga valitud astmeni ja takistusega, ning algväärtusega (seed) vaba või juhitud kell; Kepleri komplekti Levenbergi-Marquardti sobitus mitteosutavatel elementidel, seejärel lineaarne vähimruutude parandpolünoomid; kell sobitatud kasutaja lisatud relativistlikku liiget arvestamata. ANALÜÜSID: fit-interval-trade (signaal-ruumis vahemaaviga, SISRE, globaalselt keskmistatud kaaludega orbiidi kõrguse jaoks, sõltuvalt sobitusintervallist ja uuendusperioodist, ainult orbiit ja koos kellaga), model-comparison (neli mudelit, parameetrite arv, kodeeritud bittide arv ja Kshana sobitus Liu et al. kõrgustel avaldatud arvude kõrval), midpass-update (kasutaja kohal kõrgeim läbilend, iga sõnumivahetuse asukoha, kella ja kasutajavahemaa hüpe, halvima geomeetria hüpe, PASS/FAIL pidevuse läve suhtes), encode-decode (Kshana enda dokumenteeritud kahendkaader CRC-24Q-ga, väljapõhine poolsammu kvantimiseelarve, rikutud kaadri kontroll, RINEX-4-laadse kirje eksport ja import, mida nimetatakse Kshana laiendiks, ja CSV-tabel). VALIDATED: SISRE kaalud avaldatud MEO/GEO tabeli vastu (Montenbruck et al. { "2018" }); Galileo kasutajaalgoritm RTKLIB vastu tegelikel Galileo edastatud efemeriididel; CRC-24Q oma kataloogi kontrollväärtuse ja RTCM { "1005" } näitekaadri vastu. MODELLED: iga sobituse ja SISRE arv on esitusviga Kshana integreeritud tõe suhtes (ilma orbiidi määramise või ennustamise veata); Liu et al. võrdlus kasutab teisi orbiite; kodeeringu- ja tekstivormingud on Kshana omad.

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-e5a4f0290e9e = Ühe <c1/> käivituse kokkuvõte: LEO navigatsioonisõnum — { "510" } km, { "97.4" } kraadi, gravitatsiooniaste { "20" }, mudel kepler-rac SISRE kaalud: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } kraadi) encode-decode: kepler-rac mudel, kaader { "152" } baiti ({ "1156" } kasulikku bitti, { "891" } efemeriidi+kella bitti), CRC-24Q 0x58ADF2 kvantimine: suurim asukohamuutus { "0.52" } mm, kell { "0.09" } mm; SISRE täpne { "0.0013" } m, kvantitud { "0.0013" } m rikutud kaader tagasi lükatud: true; RINEX ringkäik { "4.43e-6" } m; CSV ringkäik { "0.00e0" } m sobitusintervalli kompromiss { "1800" } s jooksul (kasutusperiood = sobitusintervall): kepler16 { "60" } s SISRE orbiit RMS { "0.0003" } m max { "0.0015" } m koos kellaga RMS { "0.0006" } m kepler16 { "120" } s SISRE orbiit RMS { "0.0003" } m max { "0.0015" } m koos kellaga RMS { "0.0007" } m kepler16 { "300" } s SISRE orbiit RMS { "0.0036" } m max { "0.0141" } m koos kellaga RMS { "0.0037" } m kepler16 { "600" } s SISRE orbiit RMS { "0.0293" } m max { "0.1023" } m koos kellaga RMS { "0.0293" } m kepler16 { "900" } s SISRE orbiit RMS { "0.1073" } m max { "0.3812" } m koos kellaga RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbiit RMS { "0.0000" } m max { "0.0000" } m koos kellaga RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbiit RMS { "0.0001" } m max { "0.0002" } m koos kellaga RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbiit RMS { "0.0005" } m max { "0.0021" } m koos kellaga RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbiit RMS { "0.0097" } m max { "0.0395" } m koos kellaga RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbiit RMS { "0.0388" } m max { "0.1143" } m koos kellaga RMS { "0.0390" } m 16 parameetriga Kepleri komplekt halveneb väärtuselt { "0.0003" } m juures { "60" } s väärtuseni { "0.1073" } m juures { "900" } s: üks Kepleri komplekt kaks korda pöördel harmoonikutega ei suuda järgida LEO kaare kõrgema sagedusega gravitatsiooniliikmeid ja takistust kauem kui paar minutit, ja selle vähimruutude jääk võngub üle akna. Piki- / risti- / radiaalpolünoomid, mis on kõrgemat astet kui Kepleri komplekt hõlmab, neelavad järelejäänu, andes { "0.0388" } m juures { "900" } s.

# text
# c1: name
# c2: description
# c3: seed
# c4: analysis
# c5: preset
# c6: orbit
# c7: clock
# c8: message
# c9: trade
# c10: comparison
# c11: midpass
seg-3f299f6b20c8 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/leo-navmsg-celeste-iod.toml
seg-3adfcd7e275c = Näide <c1/> määrab muu hulgas:

# text
seg-8243db187e2f = [encode-decode, fit-interval-trade]

# text
seg-e866d042aab8 = Celeste IOD sõnum (töötoa eelseade)

# text
seg-c42f5a1ed964 = [kepler16, kepler-rac]

# text
seg-549a6103e711 = bitt

# text
seg-fb689f03361c = bait

# text
seg-c60901596100 = Tulemuse silt (mootori oma): MIXED — VALIDATED ehituskivid, MODELLED tulemused. SISRE kaalud reprodutseerivad avaldatud MEO/GEO tabeli (Montenbruck et al. { "2018" }), Galileo ICD kasutajaalgoritm reprodutseerib RTKLIB-i tegelikel Galileo edastatud efemeriididel ja CRC-24Q reprodutseerib oma kataloogi kontrollväärtuse ning RTCM { "1005" } näitekaadri f

# attr:alt
seg-35e92abc6a23 = Mootori joonistatud diagramm failile scenarios/leo-navmsg-celeste-iod.toml, liik leo-navmsg

# text
seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: radiaalkaal w_R ja ruuttransversaalkaal w_AC^{ "2" } kui cos^{ "2" } ja poole sin^{ "2" } keskmised vaatejoone nadiirinurgast kasutajate üle, kes on ühtlaselt jaotunud nähtaval Maa kupliosal üle elevatsiooni

# text
seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD Kepleri arvutus (Kepleri võrrand, teise harmoonilise paranded, Maaga seotud sõlm), kirjutatud eraldi mootori RINEX-i hindajast, tagastades asukoha argumendiga Testid: <a1>leo_navmsg_reference.rs</a1>.

# text
seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generaatorpolünoom 0x1864CFB, algväärtus { "0" }, ilma peegeldamiseta, ilma lõpliku XOR-ita, kontroll, mida Kshana LEO kaader kannab üle iga eelneva baidi

# text
# c1: leo-navmsg
seg-2b24c2669c23 = <b>VALIDATED</b> Liigi <c1/> sobitaja ja kompromiss: tõeorbiit, mis on integreeritud tsonaalse J2-J6 või EGM2008 gravitatsiooniga valitud astmeni ja takistusega, ning algväärtusega (seed) vaba või juhitud kell; Galileo Kepleri komplekti Levenbergi-Marquardti sobitus mitteosutavatel

# text
seg-ddb27b07b9af = ja veel { "7" } maatriksis.

# text
seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: radiaalkaal w_R ja ruuttransversaalkaal w_AC^{ "2" } kui cos^{ "2" } ja poole sin^{ "2" } keskmised vaatejoone nadiiri . Oraakel (sõltumatu etalon) (ExternalDataset): Montenbrucki, Steigenbergeri ja Hauschildi ({ "2018" }) avaldatud SISRE kaalutegurite tabel, Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } ja 1/49, GLONASS { "0.98" } ja 1/45, Galileo { "0.98" } ja 1/61, BeiDou MEO { "0.98" } ja 1/54, BeiDou IGSO/GEO { "0.99" } ja 1/126. Sama LEO raadiustel hinnatud keskmine annab

# text
seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: Galileo OS SIS ICD Kepleri arvutus (Kepleri võrrand, teise harmoonilise paranded, Maaga seotud sõlm), kirjutatud eraldi. Oraakel (sõltumatu etalon) (ExternalDataset): RTKLIB 2.4.2-p13 eph2pos ECEF asukohad (sama ICD algoritmi sõltumatu teostus) tegelike BKG/IGS edastatud kirjete jaoks kuupäevast 2024-09-10, mõlemad kinnitatud päritoluga kataloogis tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). See valideerib Kepleri kasutajaalgoritmi; sellele lisatud piki- / risti- / radiaalsuunalised paranded on kaetud oma ridadega ja Liu liikmed b

# text
seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generaatorpolünoom 0x1864CFB, algväärtus { "0" }, ilma peegeldamiseta, ilma lõpliku XOR-ita, kontroll, mida Kshana LEO kaader kannab üle iga eelneva. Oraakel (sõltumatu etalon) (ExternalDataset): CRC kataloogi kontrollväärtus nende parameetrite jaoks (reveng.sourceforge.io CRC catalogue, CRC-24/LTE-A: width { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), mis on RTCM { "10403" } ja Galileo OS SIS ICD CRC-24Q parameetrid, ning sõnumitüübi { "1005" } näitekaader, mis on trükitud dokumendis RTCM { "10403" }

# text
# c1: leo-navmsg
seg-6e2719a28884 = <b>VALIDATED</b> Liigi <c1/> sobitaja ja kompromiss: tõeorbiit, mis on integreeritud tsonaalse J2-J6 või EGM2008 gravitatsiooniga valitud astmeni ja takistusega, ning algväärtusega (seed) vaba või juhitud. Oraakel (sõltumatu etalon) (ExternalDataset): Tegelikud täppisteadusorbiidid tõena (TU Graz IfG/ITSG operatiivsed redutseeritud dünaamikaga orbiidid, vabalt kasutatavad tunnustusega; SHA-256 väärtused fikstuuri NOTICE-is) sobitatud 16 parameetri komplektiga { "20" } ja { "30" } min kaartel, võrrelduna statistikaga, mille Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) avaldavad samade satelliitide ja päevade kohta: piki-, risti- ja radiaal-RMS kõik 1.5x piires (mõõdetud { "0.804" } kuni { "1.087" }), SISR

# text
# c1: limitations[0]
seg-0c26ec09bf16 = SISRE on sõnumi esitusviga selle tõe suhtes, mille põhjal see sobitati; orbiidi määramise ja orbiidi ennustamise viga ei ole modelleeritud. (tulemus <c1/>)

# text
# c1: limitations[1]
seg-3762de39de07 = Tõeorbiit on Kshana numbriline integreerimine (tsonaalne või EGM2008 gravitatsioon, staatiline eksponentsiaalne takistus), mitte tegeliku satelliidi täppisorbiit; kolmanda keha, päikesekiirguse rõhu ega loodeid ei ole. (tulemus <c1/>)

# text
# c1: limitations[2]
seg-4486dd350b57 = Kahendvorming on Kshana enda dokumenteeritud kodeering, mis on modelleeritud avaldatud sõnumikomponentide järgi; see ei ole Celeste'i ega ühegi teise süsteemi bitipaigutus (ükski ei ole avalik). (tulemus <c1/>)

# text
# c1: limitations[3]
seg-2a5c1bce8320 = RINEX-laadne plokk on dokumenteeritud Kshana laiend; RINEX { "4.02" } ei määratle LEO navigatsioonikirjeid. (tulemus <c1/>)

# text
# c1: limitations[4]
seg-642d8f4d60e7 = NeQuick-G koefitsiendid on kaasas ja efektiivne ionisatsioonitase arvutatakse, kuid NeQuicki elektrontiheduse integreerimist, mis muudab selle viiteks, ei ole rakendatud; Klobucharu viide on, skaleeritud kandjale teguriga 1/f^{ "2" } ilma paranduseta ionosfääri sees lendava satelliidi jaoks. (tulemus <c1/>)

# text
# c1: limitations[5]
seg-8ba04a3147bd = Liu et al. { "2025" } 22 parameetriga liikmed järgivad artikli kasutajaalgoritmi (Eq. 1-7) ja sobitusstrateegiat (Section { "2.3" }); selle SISRE-kõrguse arvud kasutasid tegelikke täppisorbiite, nii et see võrdlus Kshana integreeritud orbiidil on MODELLED, mitte VALIDATED (tegeliku orbiidi võrdlus on tests/leo_navmsg_fit_real_orbit_oracle.rs). (tulemus <c1/>)

# text
# c1: label
seg-b3585c7feb4e = MIXED — VALIDATED ehituskivid, MODELLED tulemused. SISRE kaalud reprodutseerivad avaldatud MEO/GEO tabeli (Montenbruck et al. { "2018" }), Galileo ICD kasutajaalgoritm reprodutseerib RTKLIB-i tegelikel Galileo edastatud efemeriididel ja CRC-24Q reprodutseerib oma kataloogi kontrollväärtuse ning RTCM { "1005" } näitekaadri. Iga sobituse, SISRE, pidevuse ja kvantimise arv on MODELLED: sõnumi esitusviga vastu a (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-d6e412aab1b4 = MODELLED: iga sobituse ja SISRE arv on esitusviga Kshana integreeritud tõe suhtes (ilma orbiidi määramise või ennustamise veata); Liu et al. (liikide kataloog (<c1/>))

# text
seg-c5478f572d21 = Perekonna leht: <a1>Madala Maa orbiidi navigatsioon</a1>

# text
seg-d9257241d523 = Teemaleht: <a1>LEO-NAVMSG.md</a1>

# text
seg-b0dcad22aed6 = <s1>Eelmine</s1>launch-window

# text
seg-2984c4c69850 = <s1>Järgmine</s1>leo-pass
