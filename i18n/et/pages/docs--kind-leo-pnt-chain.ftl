# docs--kind-leo-pnt-chain: translations (et)

# text
seg-f42465f7d066 = ns

# text
seg-7f5ad6ab8c23 = GPS

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (liikide kataloog (<c1/>))

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-49964654d5f4 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Madala Maa orbiidi navigatsioon</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README peatükk Evidence).

# text
seg-c5478f572d21 = Perekonna leht: <a1>Madala Maa orbiidi navigatsioon</a1>

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 section { "2.4.1" } sammud { "3" } kuni { "9" } (etalon-sigma suurusest N_wet, efektiivne teepikkus, antenni keskmistamistegur, signaalilanguse sügavus { "0.01" } % kuni { "50" } % ajast. Oraakel (sõltumatu etalon) (ExternalDataset): ITU-R Study Group { "3" } valideerimisnäited (CG-3M3J-13-ValEx-Rev8.3.0) P.618-14 sähvimise jaoks, iga asukoha P.453-14 N_wet samadest näidetest; kinnitatud failis tests/fixtures/leo_link/p618_14_scintillation.csv koos URL-ide ja noppimiskuupäevaga. Märja murdumisnäitaja avaldis temperatuurist ja niiskusest ei ole selle rea poolt kaetud

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Rühmaviivitus { "40.3" } STEC/f^{ "2" } sagedusala kohta; ionosfäärivabad koefitsiendid f1^2/(f1^{ "2" } - f2^{ "2" }) ja -f2^2/(f1^{ "2" } - f2^{ "2" }) ning müra võimendus sqrt(a1^{ "2" } s1^{ "2" } + a2^. Oraakel (sõltumatu etalon) (ExternalDataset): IS-GPS-200 section { "20.3.3.3.3.2" }, mis esitab L1/L2 rühmaviivituse suhte gamma = (77/60)^{ "2" }, mis tuleneb esimest järku 1/f^{ "2" } skaleerimisest, ja Friisi edastusvalem (Proc. IRE, { "1946" }). Valideerib skaleerimisseadused, mitte kaldset TEC

# text
seg-ae15d15bf151 = Teemaleht: <a1>LEO-PASS.md</a1>

# text
# c1: docs/kinds/by-kind/leo-pnt-chain.md
seg-d24f2cccc926 = Allikas: <c1/>

# text
# c1: leo-pnt-chain
seg-3a66efa79aa2 = <c1/> (stsenaariumi liik)

# text
seg-81d1604171a5 = Üks LEO-PNT (positsioneerimine, navigatsioon ja aeg madalalt Maa orbiidilt) süsteem otsast lõpuni, mis tahes konstellatsiooni ja signaali jaoks: signal_design nimetatud leo-signal kavand (avalik eelseade või sisemine [signal] kavand) määrab [pass] sagedusala keskme, ribalaiuse, kiibisageduse ja EIRP jaotuse, leo-pass lingieelarve annab jälgitud C/N0 ja ribapiiratud koodi värina üle läbilennu, sin(elevatsioon) järgi C/N0 sirge ja [navmsg] sõnumi edastatud SISRE (sobitatud läbilennu satelliidi kõrgusel) toidavad iga LEO süsteemi [fusion] leo-pvt ühisfikseeringus ja valikuliselt [ppp] leo-ppp juhtumeid; iga üleandmine on loetletud oma väärtuse ja ühikuga. MODELLED.

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-9dec9cd6fbfc = Ühe <c1/> käivituse kokkuvõte: LEO-PNT otsast lõpuni, üldine { "1080" } km konstellatsioon signaal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), jälgitud piloot sagedusel { "10.230" } Mchip/s, C/N0 nihe -2.57 dB läbilend LEO-1 { "1080" } km: jälgitud C/N0 tipp { "58.2" } dB-Hz, koodi värina mediaan { "0.050" } m; C/N0 sirge { "35.6" } + { "24.3" } sin(el) dB-Hz sõnum kepler-rac { "300" } s sobitus / { "300" } s uuendus: esitus SISRE { "0.907" } mm RMS (orbiit { "0.005" } mm), koos { "0.250" } m orbiidi määramisega: { "0.250" } m edasi antud ühendatud fikseering: ainult GNSS PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP koondumine: ainult GNSS { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } väärtust antud edasi etappide vahel. MODELLED.

# text
# c1: signal_design
# c2: pass
# c3: fusion
seg-21babf07292a = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>

# text
# c1: name
# c2: description
# c3: seed
# c4: signal
# c5: navmsg
# c6: od_sisre_m
# c7: ppp
seg-f7bd59312f9b = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-585a1b0d5950 = Näide <c1/> määrab muu hulgas:

# text
seg-be21370c2446 = ühine

# text
seg-f9c560b3c318 = Galileo

# text
seg-28b34c8ae7c5 = galileo

# text
seg-0093705edf63 = Tulemuse silt (mootori oma): MODELLED — ahel annab iga etapi väljundi järgmisele; etapid säilitavad oma sildid (kontrollimaatriksi read leo-signal, leo-pass, leo-navmsg, leo-pvt ja leo-ppp).

# attr:alt
seg-abe0599498c9 = Mootori joonistatud diagramm failile scenarios/leo-pnt-end-to-end.toml, liik leo-pnt-chain

# text
# c1: leo-pnt-chain
seg-d8b7c2c82566 = <b>MODELLED</b> Liik <c1/>: leo-signal kavand (avalik eelseade või sisemine) määrab leo-pass sagedusala keskme, ribalaiuse, kiibisageduse ja EIRP jaotuse; läbilend annab epohhi kohta jälgitud komponendi C/N0 ja ribapiiratud koodi värina; vähimruutude C/ Testid: <a1>leo_pnt_chain.rs</a1>.

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: siinusintegraal (sine_integral), BPSK-R võimsuse osa kahepoolses ribas suletud kujul (bpsk_power_in_band_closed_form), riba-. Oraakel (sõltumatu etalon) (ExternalDataset): Väliselt kinnitatud: { "90.3" } protsenti peasagara võimsust, koherentne varajase-hilise värin kindlaksmääratud tööpunktis, siinusintegraali tabeliväärtused ja BPSK enda spektraalse eraldatuse koefitsient 2/({ "3" } R_c) nullnihkel. Ainult sisemised ristkontrollid, mitte väline valideerimine: ribapiiratud BPSK Gaboři ribalaiuse suletud kuju ja selle asümptoot ning nihutatud BPSK spektraalse eraldatuse koefitsient nullist erinevatel nihetel, mõlemad

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> Liik <c1/>: parameetriseeritud signaalikavandid (sagedusala, edastusribalaius, ITU jaotus; omandamise-, andme- ja pilootkomponendid BPSK(n), BOC(m,n), MB. Oraakel (sõltumatu etalon) (InternalConsistency): Kahe ülaltoodud rea valideeritud suletud kujud, ruutseaduse valehäire samasus P_d(snr = { "0" }) = P_fa ja Holmesi keskmine omandamisaeg ning taandamine spektri liigi enda SSC ahelale (sama Jammer::ssc kood). Kavandid ise on sisendid: eelseaded, mis on märgitud REPRESENTATIVE või WORKSHOP, ei ole avaldatud spetsifikatsioonid, täiustatud Feheri QPSK, koodinihkega modulatsiooni ja OFDM spektrid on ligikaudsed ning kuju

# text
# c1: limitations[0]
seg-752b6d88fc9c = Positsioneerimisetapp modelleerib C/N0 sirgena elevatsiooni siinuse suhtes maski ja seniidi vahel; ahel sobitab selle sirge läbilennu jälgitud C/N0-ga, nii et läbilennuspetsiifiline kuju (isovoo platoo, kiire serv) taandatakse kaheks arvuks. (tulemus <c1/>)

# text
# c1: limitations[1]
seg-f609a2991c7f = Positsioneerimisetappidele edasi antud SISRE on navigatsioonisõnumi esitusviga Kshana integreeritud tõeorbiidi suhtes pluss stsenaariumi kindlaksmääratud od_sisre_m ruutude summa ruutjuurena; sõnumietapp ise ei modelleeri orbiidi määramist ega ennustamist. (tulemus <c1/>)

# text
# c1: limitations[2]
seg-f75f874cdfaa = Positsioneerimisetapp arvutab oma viivitussilmuse värina edasi antud C/N0-st piiramata ribalaiusega valemiga; läbilend esitab selle kõrval tegeliku kavandi ribapiiratud värina. (tulemus <c1/>)

# text
# c1: limitations[3]
seg-174ce18ade58 = Täpse punktpositsioneerimise etapp võtab sõnumi SISRE LEO orbiidi ja kella veana; selle kood- ja faasimüra jäävad etapi enda sisenditeks. (tulemus <c1/>)

# text
# c1: limitations[4]
seg-0aaff940eacb = Üks satelliit, esimene, mille sagedusala kannab kavandit, esindab kogu LEO süsteemi läbilennu ja sõnumi etappides. (tulemus <c1/>)

# text
# c1: label
seg-65930be43134 = MODELLED — ahel annab iga etapi väljundi järgmisele; etapid säilitavad oma sildid (kontrollimaatriksi read leo-signal, leo-pass, leo-navmsg, leo-pvt ja leo-ppp). (tulemus <c1/>)

# text
seg-bf452e9ae07f = MODELLED: iga etapp säilitab oma sildi; ahel ei lisa füüsikat. (stsenaariumifaili kommentaar, rida { "25" })

# text
seg-0bff72185f12 = <s1>Eelmine</s1>leo-pass

# text
seg-851e55b87d01 = <s1>Järgmine</s1>leo-ppp
