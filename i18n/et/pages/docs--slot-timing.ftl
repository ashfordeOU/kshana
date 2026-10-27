# docs--slot-timing: translations (et)

# text
seg-f917e7fcac09 = Mis see on

# text
seg-adc34608c46b = Klass

# text
seg-3a0e724a8a2b = Aste

# text
seg-fffbeccd4266 = Sümbol

# text
seg-2247a2344710 = Tähendus

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-1ff32b87e030 = Satelliidid

# text
seg-582fd72f1a1a = Otsus

# text
seg-430edd66bda0 = Modelleerimata

# text
# c1: docs/SLOT-TIMING.md
seg-f23c8bd5f203 = Allikas: <c1/>

# text
# c1: slot-timing
seg-1f2727dc4ca4 = Stsenaariumi liik <c1/> vastab kolmele küsimusele kella kohta, mis töötab sünkroniseerimiste vahel vabalt ja peab hoidma liikluse <b>ajaindekseeritud pesa</b> piires: marsruutimis-, ülesandestamis- või kontaktipesa, mille <b>kaitsevahe (guard)</b> on suurim absoluutne ajaviga kummalgi pool, mille korral pesa veel töötab.

# text
seg-6b39d8afeb5d = <b>Millal kaitsevahe katkeb?</b> Sekundid viimasest lahendist, kuni prognoositav ajaviga jõuab kaitsevaheni, iga panustav liige eraldi välja toodud ja domineeriv nimetatud.

# text
seg-60476d723e1a = <b>Kui palju aega on praegu alles?</b> Sama näitaja miinus lahendist möödunud aeg.

# text
seg-84010982db35 = <b>Kui sageli peab kell lahendi võtma?</b> Suurim lahendite vaheline intervall, mis hoiab vea kaitsevahe piires, lahutatud viivitus, enne kui lahend jõustub.

# text
# c1: spoofing
seg-3388d46925f1 = Valikuline jaotis <c1/> lisab ajastuse kaitsetaseme (TPL) orbiidil olevale vastuvõtjale; vt <a1>Orbiidil oleva vastuvõtja spuufimine</a1>.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-2eb266d992b0 = Kaasasolevat näidet saab käivitada käsuga <c1/>.

# text
seg-624e7a70c4f6 = Lühendid: GNSS, ülemaailmne satelliitnavigatsioonisüsteem (Global Navigation Satellite System); TCXO, temperatuuri-kompenseeritud kvartsostsillaator; OCXO, ahjuga stabiliseeritud kvartsostsillaator; RAFS, rubiidiumi aatomsageduse etalon; CSAC, kiibimõõtmes aatomkell; USO, ülistabiilne ostsillaator; DSAC, kaugkosmose aatomkell; ADEV, Alani hälve; FM, sagedusmodulatsioon (siin kella sageduse müra); PM, faasimodulatsioon (selle faasi müra); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, Rahvusvahelise Telekommunikatsiooni Liidu telekommunikatsiooni standardimise sektor; TIE, ajaintervalli viga; MTIE, maksimaalne ajaintervalli viga; TDEV, ajahälve; max|TE|, maksimaalne absoluutne ajaviga; CUSUM, kumulatiivse summa muutuse tuvasti; TPL, ajastuse kaitsetase; LEO, madal Maa orbiit; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (IEEE Transactions); IGS, Rahvusvaheline GNSS-teenistus; GPS, Global Positioning System; Block IIF, GPS Block II Follow-on satelliidid; SHA-256, 256-bitine turvaräsialgoritm (Secure Hash Algorithm); PPS, impulss sekundis.

# text
seg-f2a0c73ef648 = Veamudel

# text
# c1: t
seg-6bc3f9e78346 = Prognoositav ajaviga pärast <c1/> sekundit lahendist libisemist on

# text
seg-3fbb186c716a = kattetegur ({ "3" } on umbes { "99.7" } % Gaussi veast)

# text
seg-883965151598 = lahendi ühe sigma ajaviga

# text
# c1: W
# c2: σ_y(W)
seg-b63c0447865f = lahendi hetkel teadaoleva sageduse ühe sigma viga; aknas <c1/> hinnatud sagedus kannab umbes <c2/>

# text
seg-ab28fc69d3ac = valge faasimüra dispersioon: ajavea värin, püsiv põhi

# text
# c1: holdover::coast_phase_variance
seg-8792541a7b6d = valge, juhusliku kõnni ja juhusliku jooksu FM tihedused (väljade <c1/> van Loani liikmed)

# text
seg-5d36b32c4de8 = Alani dispersiooni flicker-FM põhi

# text
seg-65da5a90685f = pärast lahendit alles jääv jääkmurruline sageduse nihe

# text
# c1: ΔT
# c2: c_T
seg-816e427d51f9 = sageduse nihe temperatuurimuutusest <c1/> temperatuuritegurit <c2/> kasutades

# text
seg-e23d0ac960aa = lineaarne vananemiskiirus

# text
# c1: t²·σ_y²(t)
# c2: σ_y²(τ) = 3σ_PM²/τ² + q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20
# c3: t
# c4: E(t) = guard
seg-43e5f75b369c = Iga FM liige võrdub väärtusega <c1/> oma müratüübi jaoks, kusjuures <c2/> (Zucca ja Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Valge, juhusliku kõnni ja juhusliku jooksu FM puhul on see seos täpne. Flicker-FM puhul on see aja prognoosivea tavapärane hinnang (Riley, NIST SP { "1065" }): flicker-FM-il pole suletud kuju ilma madalsageduslõikeni. Sageduse nihked liituvad absoluutväärtuselt, sest nende märgid on teadmata, seega on deterministlik osa halvima juhu hinnang. Iga liige on mittenegatiivne ja kasvab väärtuse <c3/> suhtes mittekahanevalt, seega on funktsioonil <c4/> üks juur, mis leitakse haarates ja poolitades.

# text
seg-f9038fba23e2 = Kust kell pärineb

# text
seg-5c44b2f8d015 = Stsenaariumi võti

# text
seg-cb92ae98c231 = Klassi vaikeväärtus

# text
seg-7594664253f2 = üks viidatud ühesekundiline ADEV ja punase müra põhi, mis on sünteesitud sellest kaks ja neli dekaadi allpool

# text
seg-794e4932b470 = MODELLED: vastuse stabiilse kella jaoks määrab eeldatud põhi

# text
seg-5ea820aaa69f = Andmelehe eelseade

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-c943490619f3 = telekommunikatsiooni ajastuse eelseaded (<c1/>, <c2/>, <c3/>, <c4/>), igaüks nimetatud Microchipi andmeleht

# text
seg-a20353d50011 = MODELLED: andmelehe maksimumide mähisjoon

# text
seg-b543f3dcd11a = Sisseehitatud andmeleht

# text
seg-4983ec096617 = kliendi enda ADEV tabel, vananemine ja temperatuuritegur

# text
seg-b079bca8a611 = MODELLED: antud maksimumide mähisjoon

# text
seg-119d94700cab = Mõõdetud kirje

# text
seg-ae6835f0c3c5 = faasikirje; selle kattuv ADEV sobitatakse kaalutud vähimruutudega

# text
seg-6e1c4702186d = pöördülesanne on VALIDATED suletud reaalse kirje peal (allpool)

# text
seg-f4cc2be238b7 = Versioonis { "0.28.0" } lisatud kolm klassi viitavad igaüks ühele avalikule andmelehele:

# text
seg-47f6ddc3bd02 = Ühesekundiline ADEV

# text
seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, baas-TCXO veerg

# text
seg-becbff195fff = Microchip OX-208 andmeleht, Rev 12-1-2021

# text
seg-19d8d32203f6 = Microchip 8040C Rubidium Frequency Standard andmeleht, DS00003047A

# text
seg-48babc170b93 = EndRuni pika keskmistamisaja read koonduvad selles tabelis ({ "4e-13" } kõigil ostsillaatoritel peale TCXO, { "8e-13" }, kohal { "10 000" } s, ja { "6e-14" } kõigil kohal { "100 000" } s), mis viitab, et need kirjeldavad distsiplineeritud toodet, mitte vabalt töötavat ostsillaatorit, seega neid ei kasutata.

# text
# c1: edf
# c2: 2σ⁴/edf
# c3: √(edf/2)·(model/σ² − 1)
# c4: extrapolated
seg-85c7211bb49b = <b>Kirje sobitus on kaalutud.</b> Alani dispersiooni hinnangul, mille ekvivalentsed vabadusastmed on <c1/>, on dispersioon umbes <c2/>, nii et iga punkt siseneb jäägiga <c3/>. Kaalumata sobitus lasi lühikestel keskmistamisaegadel otsustada pikkade keskmistamisaegade liikmed: valge-FM testkirjel tekitas see võltsi flicker-põhja, mis lühendas { "2 000" } s rikke { "30" } % võrra. Andmeleht või kirje toetab ainult keskmistamisaegu kuni oma pikima punktini; sellest kaugemal olev rike märgitakse <c4/>.

# text
seg-5b61a42c76c2 = Valideerimine: pöördülesanne suletud reaalsel kellal

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: allantools
# c3: tests/cs5071a_reference.rs
seg-2220a1490923 = <c1/> kasutab 5071A tseesiumietaloni { "556" } 990-valimilist kirjet, mõõdetuna vesinikmaseri vastu (A. Wallin, levitatud koos <c2/>; sama kirje, mida kasutab hinnangu oraakel (sõltumatu etalon) <c3/>). Maseriga etalonina on kirje 6,4-päevane vabajooks.

# text
seg-9bae4571f67c = Müramudel sobitatakse ainult kirje <b>esimesele kolmandikule</b>.

# text
seg-15b2cb621db7 = Selle mudeli põhjal prognoositakse libisemisaeg, mil ühe sigma ajaviga jõuab väärtusteni { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } ja { "2.5" } ns.

# text
seg-1bd9ac435bfa = <b>Ülejäänud kahel kolmandikul</b> libistakse sünkroonipunktist iga { "997" } s järel, sagedusega, mis on hinnatud eelnevast kolmandikust, ning mõõdetakse, kus ruutkeskmine libisemisviga jõuab igale lävele.

# text
# c1: scripts/fetch_cs5071a.sh
# c2: realdata-clock
# c3: KSHANA_REQUIRE_REALDATA=1
seg-d7640a2ec444 = Läbimise lävi, mis on kindlaks määratud enne testi esimest käivitust, on iga prognoositud rike mõõdetud riketest teguri { "1.5" } piires. Kontroll, ühesekundiline ADEV, loetud valge FM-ina, peab selle läve ebaõnnestuma, et lävi suudaks eristada head mudelit halvast. Test trükib oma tabeli; mutatsioon, mis poolitab valge-FM taseme, ebaõnnestub. Toorkirje on git-ignoreeritud kolmanda osapoole andmed: <c1/> tõmbab selle alla ja töövoog <c2/> käivitab testi väärtusega <c3/>, nii et puuduv fail ebaõnnestub seal, mitte ei jäeta vahele.

# text
seg-3d11f7c6d4ab = Mida see kinnitab: sobita-ja-pööra tee valge-FM-domineeritud aatomietaloni peal kuni umbes { "50 000" } s libisemiste korral. Mida mitte: andmelehe ja klassi allikaid, deterministlikke liikmeid ja kvartsostsillaatorit (järgmine jaotis).

# text
seg-bfcc5555ed50 = Sama prognoos päris kvartsostsillaatoril: konservatiivne, mitte kinnitatud

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: allantools
# c3: scripts/fetch_ocxo.sh
# c4: fix_frequency_sigma
seg-b77b3f503ca2 = <c1/> kasutab mõõdetud OCXO-d: { "19 982" } ühesekundilist sageduslugemit HP impedantsanalüsaatori { "10" } MHz ostsillaatorist, vesinikmaseri vastu (A. Wallin, { "2015" }, levitatud koos <c2/>; <c3/>). Müramudel ja lineaarne triiv sobitatakse esimesele kolmandikule; iga libisemine ülejäänud kahel kolmandikul algab sagedusest, mis on hinnatud eelneva { "100" } s peale, ja mudel kannab selle hinnangu ebakindlust (<c4/>, mudeli enda Alani hälve { "100" } s juures).

# text
seg-e05821406c28 = Sobitatud

# text
seg-c70aadbd47d4 = Prognoositud ÷ mõõdetud rike, { "0.2" } kuni { "10" } ns

# text
seg-d71582148b20 = Lugemine

# text
seg-dcc3fd23bede = esimene kolmandik (suletud)

# text
seg-f9bb286f5868 = { "0.59" } kuni { "0.70" }

# text
seg-612784f70090 = konservatiivne: mitte kunagi hiljem kui mõõdetud, enamasti väljaspool { "1.5" } lävi

# text
seg-121fa832c30f = hindamislõik ise (diagnostiline)

# text
seg-b4be9afa69ac = { "0.98" } kuni { "1.17" }

# text
seg-75e1515b970a = pöördülesanne on õige; suletud kirje lõhe on ostsillaatori muutumine

# text
seg-c91da69e9c09 = Ostsillaatori müratase poolenes kirje jooksul: esimese kolmandiku Alani hälve tasandub umbes väärtusel { "7.5e-12" }, ülejäänu umbes väärtusel { "3.5e-12" }. Varakult sobitatud mudel ülehindab müra, mis on ohutu suund. <b>Kvartsjuhtum seega ei ole kinnitatud ja jääb MODELLED.</b> Kvartsi puhul tuleb sobitada settinud kirjele ja osa vananedes uuesti sobitada.

# text
# c1: fix_frequency_sigma
seg-6230fed0e164 = <b>Kuidas protokoll valiti, esitatud, sest see ei olnud pime.</b> Esimene uuriv käivitus kasutas tseesiumi protokolli (sagedus eelnevast kolmandikust, sageduse liiget pole) ja prognoosis rikked { "1.4" } kuni { "2.5" } korda hilisemad kui mõõdetud: optimistlik, ohtlik suund. Kvartsi sagedus rändab, nii et mitu tundi enne lahendit hinnatud sagedus on aegunud ning mudelil polnud liiget selle kohta, kui hästi sagedus lahendi hetkel teada on. Liige <c1/> lisati just selle pärast ja see protokoll kinnitati enne testi kirjutamist; läbimise lävi ei liikunud. Test kontrollib ka seda, et ilma selle liikmeta on valimisisene prognoos igal lävel optimistlik, seega kannab liige koormat.

# text
seg-88e01cac525a = Sama prognoos orbiidil olevatel aatomkelladel: { "8" } { "10" }-st, mitte kinnitatud

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-17962966b6d6 = <c1/> kasutab IGS lõplikke kombineeritud kellasid sammuga { "30" } s { "14" } päeva jooksul ({ "17" } kuni { "30" } august { "2025" }; <c2/>, iga fail kinnitatud SHA-256-ga): iga GPS Block IIF satelliidi kell IGS ajaskaala vastu. Protokoll (satelliidikomplekt, tühimiku reegel, sobitusaken, sünkroonimine iga { "3 570" } s järel sagedusega eelnevast tunnist, läved { "1" } kuni { "20" } ns, lävi { "1.5" } ja reegel, et klass läbib ainult siis, kui iga satelliit läbib) kirjutati üles enne, kui ühtegi andmeid alla laaditi.

# text
seg-1b5832633c87 = Prognoositud ÷ mõõdetud rike

# text
seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

# text
seg-9a6fac366156 = { "0.76" } kuni { "1.46" }

# text
seg-c14941cb5537 = läve piires

# text
seg-dbaaf875f1fb = { "1.51" } kuni { "1.99" }

# text
seg-3601e13c39b6 = optimistlik

# text
seg-ea41cf6dbec2 = { "1.20" } kuni { "1.61" }

# text
seg-099fb000bf57 = hindamata

# text
seg-a7699b256ee1 = välistatud tühimiku reegliga (puuduv päev)

# text
seg-eb71202e0b91 = Kaheksa kümnest on kasulik tõend, kuid kahe satelliidi puhul prognoositakse, et need peavad vastu kauem kui tegelikult, mis on ohtlik suund, ja protokoll nõuab, et iga satelliit läbiks. <b>Orbitaaljuhtum jääb seega MODELLED.</b> Block IIF satelliitidel on nii rubiidiumi kui tseesiumi etalonid ja IGS failid ei ütle, milline on aktiivne, seega on tulemus esitatud satelliitide, mitte ühe kellatüübi kohta. Miks G25 ja G30 erinevad, ei ole uuritud.

# text
seg-a9be8a92b6b9 = Bench-käivitus lennuesindusliku osa jaoks (kavandatud, tegemata)

# text
seg-43597df55508 = Avalik OCXO kirje on { "5.5" } tundi pikk, ühest laboriinstrumendist, ostsillaatori veel settides. Kvartsjuhtumi kinnitaks lennuesindusliku OCXO või CSAC pikem mõõdetud vabajooks etaloni vastu:

# text
seg-e2698f00a84a = ajaintervalli loendur, mis võrdleb ostsillaatori { "1" } PPS-i GNSS-iga distsiplineeritud või maseretaloniga, vähemalt { "10" } päeva ühe valimiga sekundis, temperatuur logitud;

# text
seg-c4c902ac028e = sama suletud protokoll: sobitada esimesele kolmandikule, prognoosida rikked, mõõta ülejäänul, sama lävi ja kontrolliga;

# text
seg-0faaa6279195 = kirje ja selle räsi avaldatud testi kõrval, et rida oleks reprodutseeritav.

# text
seg-9b2255563582 = See sõltub juurdepääsust etalonriistvarale ja seda ei lubata.

# text
seg-6cb2dc94d1bf = Millise hälbemõõdiku vastu peaks pesa vastu võtma?

# text
seg-f6d24245dca6 = Ajastusstandardid pakuvad kolme mõõdikuperekonda. Ajaindekseeritud pesa jaoks mõõdab ainult üks neist seda, mis pesa rikub.

# text
seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) on suurim tipust tipuni TIE mis tahes antud pikkusega aknas. See on pime konstantse nihke suhtes: kell, mis on { "1" } µs nihkes, kuid täiesti püsiv, annab MTIE peaaegu nulli ja jätab iga pesa vahele. See mõõdab, kui palju viga <em>muutub</em>, mitte kus see <em>on</em>.

# text
seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) on ehitatud keskmistatud faasi teistest vahedest. See eemaldab konstantse nihke ja konstantse sagedusvea, mis on täpselt need liikmed, mis libisemist domineerivad. See iseloomustab müratüüpi; see ei ole absoluutse ajastuse vastuvõtumõõdik.

# text
seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; G.8271 eelarvemõõdik) on suurim absoluutne ajaviga etalonajaskaala suhtes. See on otse võrreldav kaitsevahega (guard).

# text
# c1: E(t)
# c2: t
# c3: T
# c4: E(T)
# c5: L
seg-7eefc395a118 = <b>Järeldus.</b> Pesa tuleb vastu võtta max|TE| suhtes võrgu etalonajaskaalaga, hinnatuna prognoositud mähisjoonena viimasest lahendist esitatud katteteguril. Just see on <c1/>: kuna iga liige kasvab väärtusega <c2/>, on maksimum pikkusega <c3/> libisemisel <c4/>. MTIE ja TDEV jäävad kasulikuks diagnostikana: TDEV, et tuvastada, millist müraliiget rünnata, MTIE(L), et piirata, kui palju viga pikkusega <c5/> pesa ajal liigub.

# text
seg-51d4ee8484d7 = Kaks täpsustust, mida mõõdiku valik eeldab:

# text
# c1: guard/√2
# c2: guard/2
seg-a52524111ed7 = <b>Kaitsevahe kehtib kahe sõlme suhtelise vea kohta.</b> Kui saatja ja vastuvõtja mõlemad libisevad sõltumatult, liituvad nende stohhastilised vead ruutkeskmiselt ja deterministlikud vead absoluutväärtuselt. Kui stohhastiline osa domineerib, võib igale sõlmele anda <c1/>; kui vananemine või temperatuur domineerib, <c2/>.

# text
seg-073fe7cd8e63 = Kattetegur on kavandi valik, mitte kella omadus.

# text
# c1: k = 3
seg-eb1cbf9fda2d = <c1/> piirab umbes { "99.7" } % Gaussi vigadest ühel ajahetkel, mitte iga pesa üle päevas; marsruutimiskava, millel on päevas palju pesasid, vajab pesapõhist riski, mida see suudab taluda.

# text
seg-04734b8a115b = Orbiidil oleva vastuvõtja spuufimine

# text
# c1: spoofing
# c2: orbital_timing::orbital_timing
seg-9e734bbda345 = Jaotis <c1/> hindab sama kella jaoks <c2/>:

# text
# c1: ρ
# c2: ρ
# c3: ramp_limited_pull_ns
seg-a2f21a643389 = <b>Geomeetria.</b> Maapealne spuuf ulatub LEO satelliidini ainult siis, kui satelliit on selle horisondi kohal: kõrgusel { "550" } km kuni umbes kaksteist minutit ühe ülelennu kohta. Spuuf, mis tõuseb kiirusega <c1/>, saab seega kella tõmmata kuni <c2/> korda selle akna võrra või järgmise sõltumatu kontrollini jääva vahe võrra, kui see on lühem (<c3/>).

# text
seg-ff59489b08b8 = <b>Dünaamika.</b> Ühine ajatõmme nihutab iga pseudovahemaad võrdselt ja neeldub kella nihkesse, mitte positsiooni, nii et orbiidilevitaja positsioonikontroll ei loe ajastuse ristkontrolliks.

# text
# c1: tpl
seg-4302cc49b91f = <b>Ristkontrollid.</b> Satelliidil on harva teine sõltumatu ajastusvastuvõtja. Tal on oma kella libisemine (väljade <c1/> seire), kahesuunaline aja edastamine maajaamaga kontaktide ajal ja ajavõrdlused satelliitidevaheliste linkide kaudu. Ristlink on sõltumatu ühest maapealsest spuufist ainult siis, kui naaber on samal hetkel selle spuufi jalajäljest väljas, mida aruanne kontrollib satelliitide arvust tasandi kohta.

# text
# c1: tpl::timing_protection_level_ns
seg-16c15664a51c = <b>Tingimuslik piir.</b> Seirepõhi pluss kella libisemine CUSUM tuvastusviivituse jooksul, taandudes täpselt väärtuseks <c1/>, kui kellal pole flicker-, valge faasi ega juhusliku jooksu liiget. Nagu see piir, kehtib see ainult tuvastamise korral.

# text
# c1: DECEIVED-TIME.md
seg-f7678693be22 = Kõik see on MODELLED: sfääriline, mittepöörlev Maa, ülelend otse pea kohal, üks maapealne spuuf esitatud maksimaalse tõusukiirusega. Signaalide saabumissuund zeniiti suunatud antennis on tegelik ristkontroll, mis vajab antennimustrit ja ei ole modelleeritud. <a1><c1/></a1> selgitab, miks allkirjastatud juhtsõnum seda ohtu ei kõrvalda.

# text
# c1: fix_sigma_ns
seg-070a4e72b5ea = Sageduse hüpped, kiirguse mõjud ja relativistlikud sageduse nihked; termiline mudel (temperatuurimuutus on lahendi hetkel samm); sünkroonimisprotokoll ise (lahend lähtestab vea väärtusele <c1/>).

# text
seg-a2766c0f19d0 = <s1>Eelmine</s1>Optilised lingid läbi atmosfääri

# text
seg-85ad3eb72a80 = <s1>Järgmine</s1>Telekommunikatsiooni ajastus
