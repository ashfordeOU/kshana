# docs--leo-navmsg: translations (et)

# text
seg-cc651d9cef3b = Kood

# text
seg-cbf0f9bcd2d8 = Oraakel (sõltumatu etalon)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-35f8f623ea28 = { "30" } s

# text
seg-f63dd3d7aad4 = Allikas

# text
seg-e305279d5b11 = Sisu

# text
seg-4d208b6c0eb8 = päev

# text
seg-a7d59ba6e225 = rad

# text
seg-02dc0d42fb21 = sfu

# text
# c1: docs/LEO-NAVMSG.md
seg-0f2d3faa9934 = Source: <c1/>

# text
# c1: leo-navmsg
seg-d8aaee95aa44 = Stsenaariumi liik <c1/> koostab madala Maa orbiidi (LEO) positsioneerimise, navigatsiooni ja aja (PNT) satelliidi ringhäälestatud efemeriidi- ja kellasõnumi ning vastab küsimustele, mida sõnumi kavandaja esitab: kui kaua võib üks sõnum katta, mida iga lisaparameeter annab, mida kasutaja näeb, kui sõnum muutub läbilennu keskel, ja kui palju bitte kulub selle kandmiseks sentimeetrini.

# text
seg-e61283b1e1a5 = See on süsteemist sõltumatu. Mis tahes orbiit, mis tahes kandelaine ja mis tahes neljast efemeriidimudelist töötab ilma ühegi eelseadistuseta; nimetatud eelseadistused on valikulised andmed (vt <a1>Eelseadistused</a1>).

# text
# c1: kshana example <name>
# c2: kshana scenarios/<name>.toml
# c3: leo-navmsg-fit-interval-trade
# c4: leo-navmsg-model-comparison
# c5: leo-navmsg-midpass-update
# c6: leo-navmsg-encode-decode
# c7: leo-pnt-chain
# c8: leo-focus-data-services
seg-1271cd4ad822 = Väljasta komplekti kuuluv näide käsuga <c1/> (üks nimi korraga) ja käivita see käsuga <c2/>: <c3/>, <c4/>, <c5/> ja <c6/>. Liik on ühtlasi liigi <c7/> sõnumietapp (<a1>LEO-PNT.md</a1>) ja kampaania <c8/> liige, mis koostab nelja sõnumikonfiguratsiooni ja annab aru igaühe kaadri pikkusest ({ "146" }, { "154" }, { "159" } ja { "171" } baiti).

# text
# c1: src/leo_navmsg/
# c2: elements.rs
# c3: truth.rs
# c4: fit.rs
# c5: sisre.rs
# c6: services.rs
# c7: codec.rs
# c8: text.rs
# c9: presets/
# c10: mod.rs
seg-51da9ffaa0ec = Kood: <c1/> — <c2/> (kirjed ja kasutaja algoritm), <c3/> (tõeline orbiit ja kell), <c4/> (sobitaja), <c5/> (signaal-ruumis kaugusviga), <c6/> (ionosfäär ja koordineeritud maailmaaeg (UTC)), <c7/> (binaarvorming), <c8/> (Receiver Independent Exchange Format (RINEX)-laadsed ja komadega eraldatud väärtuste (CSV) eksportfailid), <c9/> (üks fail eelseadistuse kohta), <c10/> (liik).

# text
seg-0505113a62e3 = Mida sõnum kannab

# text
seg-6752521002b2 = Osa

# text
seg-cf6ae60eea4f = Lisaandmed

# text
seg-00eae74cb1e6 = kosmoseaparaadi identifikaator (SVID), andmeväljaanne (IOD), sagedusriba identifikaator, signaali tervisestaatus (Galileo tava: { "0" } OK, { "1" } teenusest väljas, { "2" } pikendatud töö, { "3" } katsetuses)

# text
seg-0bdbdd2c923b = Sünkroniseerimine

# text
# c1: af0 + af1·(t − toc) + af2·(t − toc)²
seg-8120237b02ea = nädalanumber, edastamise nädala aeg (TOW) ja teise astme kellapolünoom <c1/>

# text
seg-b09dc4b322d3 = Efemeriid

# text
seg-bbb3225e1d19 = üks allolevast neljast mudelist

# text
seg-3a835a49b43f = Muud teenused

# text
# c1: ai0, ai1, ai2
# c2: A0, A1, ΔtLS, t0t, WNot, WNLSF, DN, ΔtLSF
seg-2a13461cb60c = Klobuchari ringhäälestatud ionosfäärikomplekt, Galileo NeQuick-G koefitsiendid <c1/> koos viie tormilipuga ning süsteemiaja ja UTC vahelised parameetrid <c2/>

# text
seg-6b899ef63047 = Efemeriidimudelid

# text
seg-60cd077d82a7 = Mudel

# text
seg-2afa300864a9 = Parameetrid

# text
# c1: √A, e, i0, Ω0, ω, M0, Δn, Ω̇, i̇, Cuc, Cus, Crc, Crs, Cic, Cis, toe
seg-3e8a1cf183cc = Galileo avateenuse signaal-ruumis liidese juhtdokumendi (OS SIS ICD) Kepleri komplekt: <c1/>

# text
# c1: a0…
# c2: c0…
# c3: r0…
# c4: τ = tk / tau_s
# c5: tau_s
# c6: rac_degrees
seg-b1416ba3472f = sama, pluss piki-, ristsuunalised ja radiaalsed (RAC) parandupolünoomid <c1/>, <c2/>, <c3/> ühikus <c4/>, koefitsiendid meetrites, <c5/> kahe aste, mis on vähemalt pool sobitusvahemikku (edastatakse), astmed määrab <c6/> (vaikimisi { "7" }, { "5" }, { "6" })

# text
seg-9c0643152bbf = { "16" } + { "21" } vaikimisi, pluss ajaskaala

# text
# c1: ȧ, ṅ, Crs3, Crc3, Crs1, Crc1
seg-e0afd541d64c = Liu, Su, Xie, Zhou ja Qu 22-parameetriline mudel ({ "2025" }, <em>Remote Sensing</em> { "17" }({ "16" }):{ "2894" }, doi <a1>10.3390/rs17162894</a1>): { "16" } pluss <c1/>

# text
# c1: τ = (t − t_ref) / 64 s
seg-a6042071a03f = ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations) „nullkella“ mudel: Maaga seotud (ECEF) polünoom telje kohta muutujas <c1/> (vaikimisi aste { "6" }), kellaliikmeid pole, sest satelliidi kell on juhitud süsteemiajale (<a1>InsideGNSS</a1>)

# text
seg-5869d6f65796 = { "22" } vaikimisi

# text
# c1: elements::sat_state
# c2: kepler-rac
# c3: F·e·√A·sin E
# c4: ecef-poly
# c5: −2 r·v / c²
seg-6663aa3eeebc = Kasutaja algoritm (<c1/>) on Galileo ICD järjestus (Kepleri võrrand, teise harmoonilise parandused, Maaga seotud sõlm), millele järgneb liigi <c2/> korral kolm polünoomi piki Kepleri orbiidi enda koordinaatsüsteemi: radiaalne piki arvutatud asukohta, ristsuunaline piki orbiidi normaali parandatud kaldenurgast ja sõlmest, piki-suunaline, mis täiendab kolmiku. Kell lisab ICD relativistliku liikme <c3/>; liigi <c4/> korral on see üldkuju <c5/> polünoomist ja selle tuletisest.

# text
# c1: A = A0 + ȧ·tk
# c2: n = √(μ/A0³) + Δn + ṅ·tk
# c3: ½·ṅ·tk
# c4: ṅ
# c5: Crs1·sin Φ + Crc1·cos Φ + Crs3·sin 3Φ + Crc3·cos 3Φ
# c6: Φ
# c7: ṅ
# c8: ṅ
# c9: nDot
seg-b3935a85a7b2 = Liu jt liikmed järgivad artikli kasutaja algoritmi (jaotis { "2.2" }, valem 1-7): <c1/>, <c2/> (enne { "0.30" } väljaandeid kasutasid Global Positioning Systemi (GPS) tsiviilnavigatsiooni tava <c3/>, seega on nende kirjutatud <c4/> kaks korda artikli väärtus) ja <c5/> liidetud raadiusele, <c6/> on parandamata laiuskraadi argument. Mõõtkava <c7/> tava on üle võetud artikli valemist { "1" }; artikli võrdlus reaalsetel orbiitidel ei sõltu sellest (tegur ½ muutujal <c8/> jätab iga sobitatud näitaja muutumatuks), seega edastatud väärtuse <c9/> tähendus pole seal valideeritud.

# text
seg-9a83292bffcf = Kaks lugemist on Kshana enda omad ja neid esitatakse sellistena:

# text
# c1: τ = tk / tau_s
seg-0e42fd0d5cf9 = RAC koordinaatsüsteem ja <c1/> normaliseerimine. Ükski avalik dokument ei määratle LEO parandussüsteemi ringhäälestatud sõnumi jaoks.

# text
seg-1b8aaed09de8 = Nullkella sõnumi kell on kokku null: juhtsilmuse eeldatakse hoidvat näiva kella, relativistlik liige kaasa arvatud, süsteemiajas.

# text
seg-3472ce139588 = Sobitaja

# text
# c1: truth.rs
# c2: θ(t) = θ0 + Ω̇e·t
# c3: gravity_degree = 0
seg-4404a677d185 = <c1/> integreerib orbiidi fikseeritud sammuga neljanda järgu Runge–Kutta meetodil koordinaatsüsteemis, mis läheb ühe pöörde <c2/> abil Maaga seotud telgedeks, sama ühe pöörde, mida ringhäälestatud kasutaja algoritm rakendab. Gravitatsioon on kahekeha (<c3/>), tsonaalsed harmoonilised J2 kuni J6 ({ "2" } kuni { "6" }) või Earth Gravitational Model { "2008" } (EGM2008) väli astmeni ja järguni { "7" } kuni { "70" }, mille tesseraalsed liikmed kannavad lühiperioodilist signatuuri, mis teeb LEO sobitamise raskeks. Atmosfääripidur on valikuline (staatiline eksponentsiaalne tihedus). Kell on vabalt jooksev (nihe, triiv, triivikiirus ja valge sagedusmüra etteantud ühesekundilise Alani hälbega, pluss perioodiline relativistlik liige) või juhitud (esimese järgu Gauss–Markovi jääk).

# text
# c1: fit.rs
# c2: e·cos ω
# c3: e·sin ω
# c4: λ0 = M0 + ω
# c5: ω
# c6: M0
# c7: toe
# c8: liu22
seg-ae3052e66b2a = <c1/> sobitab Kepleri komplekti Levenbergi–Marquardti meetodil mittesinguljaarsetele elementidele (<c2/>, <c3/>, <c4/>): LEO orbiit on peaaegu ringjooneline, mistõttu <c5/> ja <c6/> üksi on peaaegu eristamatud. See algab oskulatsiooniseisundist ajahetkel <c7/> koos J2 sõlmekiirusega. Nõrgad nullile tsentreeritud eelteadmised piiravad kiirusi ja harmoonilisi, mida lühike kaar ei suuda lahendada; { "1" } cm vaatluskaaluga toimivad need ainult nendes nullsuundades. Sobitus <c8/> kasutab selle asemel artikli jaotise { "2.3" } algust ja hindajat: see algab kõigi parandusliikmetega nullis, eelteadmisi pole (tavaline vähimruutude meetod) ja artikli 100 iteratsiooni ülempiir säilib. See peatub Kshana enda parameetrite koondumise reegli järgi, kui iga parameetri samm on väiksem kui { "1e-3" } selle formaalsest standardhälbest; artikkel peatub hoopis siis, kui RMS muutub vähem kui { "0.1" } mm. RAC polünoomid sobitatakse seejärel piki-/risti-/radiaaljääkidele lineaarsete vähimruutudega ning kellapolünoom tõelisele kellale, millest on lahutatud relativistlik liige, mille kasutaja tagasi lisab.

# text
# c1: src/celeste_iod.rs
# c2: toe
# c3: toc
seg-020f45edcae1 = Leid, mille vaikeväärtused kodeerivad: pärast vähimruutude Kepleri sobitust on jääk konstruktsiooni järgi see, mida { "16" } parameetrit ei suuda katta, mistõttu see võnkub üle akna (mitu nullkohta igas komponendis), mitte ei triivi. Parandupolünoom eemaldab selle ainult siis, kui selle aste ületab seda, mida Kepleri komplekt juba katab: piki-suunas { "7" }, ristsuunas { "5" } ja radiaalselt { "6" } viivad 15-minutilise jäägi sentimeetritest umbes millimeetrini, samal ajal kui madalamad ristsuunalised astmed ei eemalda peaaegu midagi (ristsuunaline jääk on akna keskme suhtes paaritu). Süsteem, mis tuletab oma Kepleri osa mõnel muul viisil, jätab teistsuguse kujuga jäägi ja vajalikud astmed tulenevad sellest. Celeste eelseadistuse enda paranduspolünoomide astmed (madalamad kui need; need asuvad ainult eelseadistuse failis, <c1/>) käivituvad siin Kshana vähimruutude baasil, mistõttu selle ristsuunalised liikmed annavad selles mootoris vähe: väide Kshana sobitaja kohta, mitte ühegi reaalse süsteemi kohta. <c2/> ja <c3/> on täissekundid, nagu binaarvorming neid kannab.

# text
seg-f3538e6651fa = Iga sõnumit kasutatakse perioodi jooksul, mis on tsentreeritud selle sobitusaknasse (esimene kompromissitabel kasutab kogu akent). Signaal-ruumis kaugusvea (SISRE) näitajad mõõdavad sõnumi <b>esitusviga</b> selle tõelise orbiidi suhtes, mille külge see sobitati, ruutkeskmisena (RMS) ja maksimumina üle ulatuse. Orbiidi määramise ja orbiidi ennustamise viga, mille reaalne maa- või pardasegment lisab, ei ole modelleeritud.

# text
seg-c2b181269367 = Signaal-ruumis kaugusviga

# text
# c1: sisre.rs
seg-63462a1abc95 = <c1/> kasutab Montenbrucki, Steigenbergeri ja Hauschildi globaalkeskmist SISRE-d ({ "2018" }, <em>Advances in Space Research</em> { "61" }({ "12" }):{ "3020" }–{ "3038" }, doi <a1>10.1016/j.asr.2018.03.041</a1>):

# text
# c1: cos² η
# c2: ½ sin² η
# c3: η
seg-c4f654264c42 = Kaalud on keskmised kasutajate üle, kes on ühtlaselt jaotatud nähtavale Maa kupli peal, mille määravad <c1/> ja <c2/>, kus <c3/> on vaatejoone nadiirinurk satelliidil, arvutatud orbiidi enda raadiuse ja kõrgusnurga maski jaoks. { "0" }° maski juures taastab arvutus artikli tabeli keskmise Maa orbiidi jaoks (GPS { "0.98" } ja 1/49, GLONASS 1/45, Galileo 1/61, BeiDou 1/54) ja geostatsionaarse orbiidi jaoks ({ "0.99" } ja 1/126): see on <b>VALIDATED</b> kontroll. LEO-l annab sama keskmistamine

# text
seg-66b488889b10 = Kõrgus

# text
seg-c07128592d7b = horisondi nadiirinurk

# text
seg-a4e04d9a23a5 = { "320" } km

# text
seg-002adc24471f = { "510" } km

# text
seg-fe2f70c29806 = { "550" } km

# text
seg-4dee38ff0811 = { "786" } km

# text
seg-cfc3c6939861 = { "1080" } km

# text
seg-102de0413553 = { "1336" } km

# text
seg-1b11819c8b2f = seega tunneb LEO kasutaja, kes näeb satelliiti nadiirist kaugel, piki- ja ristsuunalisi vigu palju rohkem kui keskmise orbiidi kasutaja.

# text
seg-b7a844ab6135 = Analüüsid

# text
# c1: analysis = [...]
seg-17111fe25e04 = <c1/> valib mis tahes neljast (vaikimisi kõik).

# text
seg-d0c1b335af73 = Sobitusvahemiku kompromiss

# text
# c1: [trade]
# c2: scenarios/leo-navmsg-fit-interval-trade.toml
seg-f65e99c0d8b2 = <c1/> määrab ulatuse, sobitusvahemikud, uuendusperioodid ja mudelid. <c2/> ({ "550" } km, { "97.6" }°, EGM2008 astmeni { "20" } ja atmosfääripidur, { "30" } minutit sõnumeid) annab, kui kasutusperiood on võrdne sobitusvahemikuga:

# text
seg-f1a94c795c18 = Sobitusvahemik

# text
seg-c6b034712788 = SISRE orbiidi RMS

# text
seg-55c287c93940 = SISRE orbiidi maksimum

# text
seg-ad604a608329 = SISRE koos kellaga RMS

# text
seg-28723ab60ae0 = radiaalne / piki- / ristsuunaline RMS

# text
seg-911a62245e80 = { "60" } s

# text
seg-1a35a89c1a34 = { "0.041" } cm

# text
seg-7cf9e6e3178f = { "0.179" } cm

# text
seg-d8a7f4c080dd = { "0.069" } cm

# text
seg-93773d45092a = { "0.09" } / { "0.01" } / { "0.00" } cm

# text
seg-64015edf42d8 = { "120" } s

# text
seg-a1070c338686 = { "0.032" } cm

# text
seg-cdacf90f8ce8 = { "0.160" } cm

# text
seg-29aeee696ad2 = { "0.079" } cm

# text
seg-1d2d7b57af6b = { "0.06" } / { "0.01" } / { "0.01" } cm

# text
seg-8fa4e4ccc5cc = { "180" } s

# text
seg-13182ae6d536 = { "0.093" } cm

# text
seg-fc692062aaa8 = { "0.540" } cm

# text
seg-9ef760f0777c = { "0.134" } cm

# text
seg-9a7db44eb20e = { "0.18" } / { "0.06" } / { "0.00" } cm

# text
seg-bbd4f2685bee = { "300" } s

# text
seg-93410318239b = { "0.310" } cm

# text
seg-4af8f1c977eb = { "1.033" } cm

# text
seg-0921a535896a = { "0.329" } cm

# text
seg-d50195d4cbea = { "0.09" } / { "0.49" } / { "0.02" } cm

# text
seg-8de43db30454 = { "450" } s

# text
seg-ec7f9ca7654b = { "1.690" } cm

# text
seg-1ad55674fab9 = { "7.542" } cm

# text
seg-a022913c956d = { "1.696" } cm

# text
seg-31564c73398d = { "0.72" } / { "2.65" } / { "0.04" } cm

# text
seg-21b0c99fbda4 = { "600" } s

# text
seg-6840aea9ff12 = { "2.875" } cm

# text
seg-798c8c1d0190 = { "10.219" } cm

# text
seg-6b3b442069d8 = { "2.866" } cm

# text
seg-8a53398e1999 = { "1.72" } / { "4.42" } / { "0.26" } cm

# text
seg-4dabf1faddfc = { "900" } s

# text
seg-d733d3fdac02 = { "9.345" } cm

# text
seg-3334d120521b = { "34.032" } cm

# text
seg-4d4a2cc180d0 = { "9.349" } cm

# text
seg-7651a43f1f33 = { "6.46" } / { "14.14" } / { "0.91" } cm

# text
seg-f1d733b03f45 = { "0.000" } cm

# text
seg-81a60d921ce9 = { "0.057" } cm

# text
seg-724c7750b1ca = { "0.00" } / { "0.00" } / { "0.00" } cm

# text
seg-c8a720a6f160 = { "0.074" } cm

# text
seg-b13f5539e4b1 = { "0.001" } cm

# text
seg-1c9d3ee30ac7 = { "0.090" } cm

# text
seg-7dd08c671dc7 = { "0.004" } cm

# text
seg-740e69fcd85e = { "0.014" } cm

# text
seg-c0db4312d8a0 = { "0.106" } cm

# text
seg-e971c2fe0bb2 = { "0.00" } / { "0.00" } / { "0.01" } cm

# text
seg-f3bda174cbef = { "0.037" } cm

# text
seg-5a5bb868e8ff = { "0.176" } cm

# text
seg-02b99fcb9fee = { "0.127" } cm

# text
seg-e6c45fda719f = { "0.05" } / { "0.01" } / { "0.04" } cm

# text
seg-ec1e77bc5be9 = { "0.214" } cm

# text
seg-d3c1ed834802 = { "0.643" } cm

# text
seg-23482e7c028f = { "0.229" } cm

# text
seg-8f71690a7139 = { "0.28" } / { "0.09" } / { "0.26" } cm

# text
seg-bfec9407ffae = { "1.015" } cm

# text
seg-f295ad6efcf4 = { "3.695" } cm

# text
seg-2cd92d16edfc = { "1.062" } cm

# text
seg-4626119411c4 = { "1.52" } / { "0.70" } / { "0.91" } cm

# text
seg-4e19f776d1b7 = Ja { "300" } s sobitusega, muutes seda, kui sageli uus sõnum üle võtab:

# text
seg-89810ffbeff3 = Uuendusperiood

# text
seg-d4d1fa05e1a8 = { "0.314" } cm

# text
seg-828b7488993b = { "0.850" } cm

# text
seg-edb934c1419f = { "0.288" } cm

# text
seg-52c8f821a7d2 = { "0.859" } cm

# text
seg-e135107af135 = { "150" } s

# text
seg-e7ce46d74f3e = { "0.219" } cm

# text
seg-3391df1cf909 = { "0.830" } cm

# text
seg-d6eb4f554461 = { "0.009" } cm

# text
seg-22c68874002b = { "0.010" } cm

# text
seg-2172d9ea618e = 16-parameetriline Kepleri komplekt halveneb { "0.04" } cm-lt { "60" } s juures { "9.35" } cm-ni { "900" } s juures: üks Kepleri komplekt kaks korda pöörde kohta harmoonilistega ei suuda järgida LEO kaare kõrgema sagedusega gravitatsiooniliikmeid ja atmosfääripidurdust kauem kui mõni minut ning selle vähimruutude jääk võnkub üle akna. Piki-/risti-/radiaalpolünoomid (astmed { "7" }, { "5" }, { "6" }) neelavad järele jääva: { "1.01" } cm { "900" } s juures, { "0.21" } cm { "600" } s juures. Lühimatel vahemikel on Kepleri näitajad alla millimeetri ega ole enam rangelt järjestatud (sobitust piirab siis konditsioneeritus, mitte mudel).

# text
seg-aca262796570 = Mudelite võrdlus

# text
# c1: scenarios/leo-navmsg-model-comparison.toml
seg-fdf2368d0210 = <c1/> käivitab neli mudelit { "1" }, { "5" } ja { "10" } minutiga samal orbiidil, näidates parameetrite arvu ning efemeriidi ja kella bitte Kshana kodeeringus:

# text
seg-7d3c6c43390d = Efemeriid + kella bitid

# text
seg-f7f60c66d89e = { "0.022" } cm

# text
seg-f7bcb8a44fde = { "0.049" } cm

# text
seg-2972b631701e = { "0.230" } cm

# text
seg-cc42e8dc7238 = { "0.260" } cm

# text
seg-67e50069c6f7 = { "3.061" } cm

# text
seg-780954ab9d7f = { "3.071" } cm

# text
seg-de81d6550264 = { "0.044" } cm

# text
seg-fb171bf75f27 = { "0.005" } cm

# text
seg-c8c067631f7a = { "0.120" } cm

# text
seg-2dc41855c245 = { "0.208" } cm

# text
seg-6ef79938dd22 = { "0.046" } cm

# text
seg-7e96d7e34e63 = { "0.142" } cm

# text
seg-c43199891163 = { "0.258" } cm

# text
seg-f9a9fdebc114 = { "0.290" } cm

# text
# c1: ecef-poly
seg-f157ff5b40b1 = <c1/> (nullkell)

# text
seg-9474a775dc5e = { "28.784" } cm

# text
seg-5098c8b6f813 = { "0.561" } cm

# text
seg-5e7fdc441b03 = { "28.774" } cm

# text
seg-82d3fa2e27ef = Nullkella rida hinnatakse kella vastu, mida juhitakse { "0.24" } m jäägiga (ATOMIC-i näitaja), teisi vabalt jooksva kella vastu, mille külge need sobitati.

# text
seg-769db176020f = <b>Liu jt { "2025" }, SISRE võrreldes kõrgusega (MODELLED).</b> Sama stsenaarium sobitab Kshana 22-parameetrilise mudeli 20-minutilistel kaartel artikli viiel kõrgusel, iga satelliidi kaldenurga juures:

# text
seg-01e587427a7e = Satelliit

# text
seg-f6bbd3d5d75c = Kaldenurk

# text
seg-c54d0bd7d498 = Liu jt { "2025" }

# text
seg-16c489b75f44 = Kshana (ainult orbiidi RMS)

# text
seg-ee4816ca13c1 = suhe

# text
seg-510349500d23 = { "8.88" } cm

# text
seg-a97bde451ec2 = { "4.25" } cm

# text
seg-b6c1d48847d9 = { "475" } km

# text
seg-f79249e9bd75 = { "6.21" } cm

# text
seg-9b6757a674a5 = { "2.87" } cm

# text
seg-62008169ca69 = { "2.20" } cm

# text
seg-06a4bcde0ea3 = { "966" } km

# text
seg-9e5e06ec23c3 = { "2.11" } cm

# text
seg-41ce80bc0b62 = { "1.25" } cm

# text
seg-c9f63cd8bd07 = { "0.75" } cm

# text
seg-f11a960a1d52 = { "0.51" } cm

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-0376cf5f98f0 = See <b>ei ole</b> valideerimine. Artikkel sobitas nimetatud satelliitide reaalseid täppisteadusorbiite (nende täieliku gravitatsiooni-, atmosfääripidurduse- ja mittegravitatsiooniajalooga); Kshana sobitab oma integreeritud orbiidi, hindab kuut lisaparameetrit ülalkirjeldatud viisil ja kasutab oma SISRE kaalusid. Võrdlus näitab trendi ja suurusjärku. Võrdlus samadel reaalsetel orbiitidel, mida artikkel sobitas, on <c1/> (alates { "0.30" } langeb 22-parameetriline sobitus seal kokku eelregistreeritud teguri { "1.5" } piires, artikli päevadel ja kaheksal suletud päeval).

# text
seg-d82887c766e3 = Läbilennu keskel uuendamine

# text
# c1: [midpass]
# c2: search_s
# c3: update_period_s
# c4: threshold_m
# c5: scenarios/leo-navmsg-midpass-update.toml
seg-d1104b6ea7fa = <c1/> paigutab kasutaja (vaikimisi { "45" }° N, { "10" }° E), leiab kõrgeima läbilennu maski kohal <c2/> piires ning ajastab sõnumid iga <c3/> järel. Igal läbilennusiseses ümberlülitusel annab see aru asukohahüppest, kellahüppest, kasutaja pseudovahemaa hüppest (uus sõnum miinus vana), suurimast hüppest, mida mis tahes nähtav kasutaja võiks näha (suletud kuju üle nadiirikoonuse), kaugusveast enne ja pärast ning PASS või FAIL vastu <c4/>. <c5/> ({ "300" } s sobitused uuendatud iga { "150" } s järel):

# text
seg-7d91304c87e3 = Päeva kõrgeim läbilend ulatub { "43.7" }° ja kestab { "455" } s. Selle ümberlülitused:

# text
seg-289e8da49cc8 = Ümberlülitus

# text
seg-e80d12ee2259 = Kõrgusnurk

# text
seg-b16789d14338 = Asukohahüpe

# text
seg-b3c252609532 = Kellahüpe

# text
seg-8239a390ec71 = Kasutaja kaugushüpe

# text
seg-4153faf7969d = Halvima geomeetria hüpe

# text
seg-14402c7fb332 = IOD { "270" } → { "271" }

# text
seg-7862a97ac55f = { "0.07" } mm

# text
seg-4cfe934c881f = { "0.19" } mm

# text
seg-9e9752920165 = -0.17 mm

# text
seg-4267557786be = { "0.27" } mm

# text
seg-46872e8925b2 = IOD { "271" } → { "272" }

# text
seg-4c803fd2ccc9 = { "0.14" } mm

# text
seg-cc9a8388f6bc = -0.24 mm

# text
seg-0549f7fd0633 = IOD { "272" } → { "273" }

# text
seg-ad1afcf9a466 = -0.22 mm

# text
seg-c1b30171b4f0 = { "0.35" } mm

# text
seg-f93647402fa9 = { "0.48" } mm

# text
seg-69b35182807c = Suurim kasutaja kaugushüpe { "0.35" } mm läve { "5" } cm vastu: <b>PASS</b>.

# text
seg-96dcb456600d = Kodeerimine ja dekodeerimine

# text
# c1: scenarios/leo-navmsg-encode-decode.toml
seg-1b3674a0e041 = <c1/> kodeerib esimese kolmest sõnumist, dekodeerib selle, kontrollib CRC-d ja lükkab tagasi rikutud koopia, väljastab kvantimiseelarve ning kirjutab ja loeb tagasi RINEX-laadse bloki ja CSV tabeli:

# text
# c1: 0x19105F
seg-480eb9ffc333 = kaader: { "171" } baiti ({ "1310" } kasulikku koormusbitti, millest { "1045" } on efemeriid ja kell), 24-bitine tsükliline liiasuskontroll (CRC-24Q) <c1/>;

# text
# c1: af0
seg-0e2a64a063fd = ühegi üksiku välja suurim poolsammu mõju: <c1/>, { "0.545" } mm;

# text
seg-a1875f7088b0 = kogu sõnum pärast kvantimist: asukoht { "1.126" } mm ja kell { "0.185" } mm piires täpsest sõnumist; SISRE { "0.113" } cm täpne, { "0.129" } cm dekodeeritud;

# text
seg-6e818708b695 = kaader ühe ümberläinud bitiga lükatakse tagasi: tõene;

# text
seg-31fe0f6b133d = RINEX-laadne edasi-tagasi teisendus { "5.0e-06" } m piires, CSV edasi-tagasi teisendus { "0.0e+00" } m piires.

# text
seg-405cf34090cc = Platvormist sõltumatus

# text
# c1: libm
# c2: src/portable_math.rs
# c3: leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform
# c4: leo-navmsg
seg-7f2193f6ff06 = Kaader on edastatud täisarvud, seega peavad need olema samad täisarvud igal pool ja igal viisil, kuidas stsenaarium töötab: natiivne binaar igal operatsioonisüsteemil, silumis- või väljalaskeversioon (debug või release) ning brauseris töötav WebAssembly (WASM) versioon. Teel oli kolm takistust. Hosti matemaatikateegi siinus, koosinus, arkustangens ja eksponent ei pea olema korrektselt ümardatud ning erinevad hostide vahel viimases kohas. Optimeeritud versioon macOS-is võtab ühe argumendi siinuse ja koosinuse süsteemi ühisest rutiinist, mis ei tagasta alati üksiku siinuse väärtust, mistõttu erinesid ka silumis- ja väljalaskeversioon. Ja tavaline normaaljaotuse valim kutsub oma harvaesinevates harudes hosti eksponenti ja logaritmi. Sobitus muudab nii väikese erinevuse erinevateks kvantitud väljadeks. Kogu liik (tõeline orbiit ja kell, sobitus, kasutaja algoritm, signaal-ruumis kaugusviga (SISRE), kodek) arvutab seetõttu iga sellise funktsiooni puhta Rusti crate'iga <c1/> kaudu <c2/>, täisarvulised astmed otseste korrutistena ning normaaljaotuse juhuarvud polaarmeetodil generaatori toorväljundist. <c3/> kinnitab allpool oleva kodeerimise ja dekodeerimise stsenaariumi 171-baidise kaadri ja ühe kontrollväärtuse efemeriidimudeli kohta; silumisversioon, väljalaskeversioon ja WASM versioon annavad kõigi viie komplekti kuuluva <c4/> stsenaariumi kohta baidi tasemel identsed tulemusdokumendid.

# text
seg-1ef00467df17 = Binaarvorming

# text
seg-af2dae9e9e7c = <b>See on Kshana enda dokumenteeritud kodeering.</b> See kannab komponente, mida LEO navigatsioonisõnumite avaldatud kirjeldused nimetavad, modelleeritud Galileo ICD väljakomplekti järgi. See <b>ei ole</b> Celeste'i ega ühegi muu süsteemi bitipaigutus: ükski pole avalik.

# text
# c1: 0xA7
# c2: kepler16
# c3: kepler-rac
# c4: liu22
# c5: ecef-poly
# c6: 0x1864CFB
# c7: 0xCDE703
# c8: 123456789
seg-6a730c01ad1c = Kaader: preambul <c1/> ({ "8" } bitti), versioon { "1" } ({ "4" }), mudel ({ "4" }: { "1" } <c2/>, { "2" } <c3/>, { "3" } <c4/>, { "4" } <c5/>), kasuliku koormuse pikkus baitides ({ "12" }), baidini nullidega täidetud kasulik koormus, CRC-24Q (24-bitine tsükliline liiasuskontroll, { "24" } bitti) üle kõigi eelnevate baitide. CRC-24Q on Radio Technical Commission for Maritime Services standardi RTCM { "10403" } ja Galileo ICD kontroll (polünoom <c6/>, algväärtus { "0" }); kood reprodutseerib kataloogi kontrollväärtuse <c7/> jaoks <c8/> ning RTCM { "10403" } sõnumitüübi { "1005" } näitekaadri kontrollbaidid (<b>VALIDATED</b>).

# text
# c1: Crs
# c2: Cuc
# c3: af0
seg-a31d899eb435 = Galileo ICD sammud valiti keskmise Maa orbiidi jaoks ja need on sentimeetritäpse LEO sõnumi jaoks liiga jämedad: <c1/> sammudega { "2" }⁻⁵ m ({ "3.1" } cm), <c2/> { "2" }⁻²⁹ rad ({ "1.3" } cm LEO raadiusel), nurgad { "2" }⁻³¹ poolringi ({ "1.0" } cm) ja <c3/> { "2" }⁻³⁴ s ({ "1.7" } cm). Kshana säilitab ICD ühikud ja poolringi tava, täpsustab samme nii, et iga välja poolsammuviga jääb 15-minutilise akna jooksul alla { "1" } mm asukoha või kauguse osas, ning laiendab välju, et säilitada LEO sobitusele vajalikud vahemikud:

# text
seg-caddc6f5b9a7 = Plokk

# text
seg-b548b723c201 = Bitid

# text
seg-d00b65801e9b = Samm

# text
seg-2085d172bec3 = lisaandmed ja sünkroniseerimine

# text
seg-7e9018f82811 = nädal

# text
seg-45cbfedb6f0e = kell (lipubitt { "0" })

# text
seg-05d274f5ce99 = s/s^{ "2" }

# text
seg-9d6d5136e12a = Kepleri (mudelid 1-3)

# text
seg-3fb59c8238cb = poolring

# text
seg-d173e8d7026c = m^{ "0.5" }

# text
seg-48c8bfb6e914 = piki-/risti-/radiaalparandused (mudel { "2" })

# text
seg-131652f53721 = Liu jt { "2025" } lisad (mudel { "3" })

# text
seg-fccf37a24fc4 = poolring/s^{ "2" }

# text
seg-ebde561c17ab = ECEF polünoom (mudel { "4" })

# text
seg-822c7482547c = Klobuchar (lipubitt { "1" })

# text
seg-7dd6e8bcaf43 = s/poolring^{ "2" }

# text
seg-09408b08c481 = s/poolring^{ "3" }

# text
seg-734162101b2d = NeQuick-G (lipubitt { "2" })

# text
seg-ddbb363f4593 = sfu/deg^{ "2" }

# text
seg-e2744b31e5d3 = UTC (lipubitt { "3" })

# text
# c1: deltaN
# c2: OmegaDot
# c3: aDot
# c4: nDot
# c5: nDot
# c6: kepler-rac
# c7: quantisation_budget
seg-545755e7b26f = Väärtus väljaspool oma välja vahemikku lükatakse tagasi, mitte ei keerata ümber. Vahemikke kontrolliti, kodeerides sobitusi { "300" } kuni { "2000" } km juures, kaldenurkade { "0" }° kuni { "140" }° ja kuni { "20" } minuti pikkuste sobitusvahemikega: <c1/> ja <c2/> on laiad, sest peaaegu ekvatoriaalsel orbiidil on sõlm halvasti määratletud ja sobitus jagab nende vahel laiuskraadi argumendi J2 triivi, ning <c3/> ja <c4/> seetõttu, et 22-parameetriline sobitus { "20" } minuti jooksul neelab osa pooltelje lühiperioodilisest võnkumisest. Alates { "0.30" } on 22-parameetriline sobitus artikli lihtne vähimruutude meetod ilma eelteadmisteta ning ekvatoriaalne { "800" } km sobitus vajab siis <c5/> väärtust umbes { "6.3e-10" } poolringi/s^{ "2" }, seega läks selle mõõtkava { "2" }^-60-lt { "2" }^-58-le. Liigi <c6/> 7. astme piki-suunalised parandused mahuvad 22-bitisesse koefitsiendivahemikku kuni { "15" } minuti pikkuse sobitusega; pikem sobitus võib seda ületada ja lükatakse siis tagasi. <c7/> annab iga efemeriidi- ja kellaivälja kohta aru suurimast asukoha- ja kaugusmuutusest, mille poolsammu muutus põhjustab kasutusperioodi jooksul, ning kogu sõnumi muutusest pärast kvantimist.

# text
seg-1ad17f3d3643 = Tekstieksport

# text
# c1: text.rs
# c2: > EPH
# c3: D19.12
# c4: L
# c5: KP16
# c6: KRAC
# c7: LU22
# c8: APOL
seg-81fb376aa1e1 = <b>RINEX { "4.02" } ei määratle ühtki LEO navigatsioonikirjet</b> (selle süsteemitähed on G, R, E, J, C, I ja S; <a1>International Global Navigation Satellite System (GNSS) Service (IGS) RINEX { "4.02" }</a1>). Blokk, mille <c1/> kirjutab, laenab RINEX { "4" } kuju — <c2/> kirjepäis, satelliidi- ja epohhirida kolme kelliliikmega, ringhäälestatud orbiidi read nelja <c3/> väljaga — ja on <b>dokumenteeritud Kshana laiendus</b>: süsteemitäht <c4/>, kirjetüübid <c5/>, <c6/>, <c7/>, <c8/> ja kolm päisekommentaari, mis seda ütlevad. Varasem töö LEO orbiitide kohta RINEX-4-laadsetes navigatsioonikirjetes: <a2>arXiv { "2401.17767" }</a2>.

# text
# c1: kepler16
# c2: kepler-rac
# c3: SVID, IOD, Band, WeekNumber, ToW, Health, toc, af0, af1, af2, toe, M0, sqrtA, e, deltaN, Omega0, OmegaDot, iDot, i0, omega, Crc, Crs, Cic, Cis, Cuc, Cus, a0…, c0…, r0…, racTau
# c4: csv_schema
seg-9a3016441bce = CSV tabel kannab <c1/> ja <c2/> sõnumeid, üks rea kohta. Vaikimisi veerud kasutavad Galileo ICD nimesid (<c3/>); <c4/> valib selle asemel eelseadistuse kirjapildi. Mõlemad vormingud loetakse tagasi.

# text
seg-4a26902d2771 = Ionosfäär ja UTC

# text
# c1: gnss_sim::klobuchar_delay_m
# c2: (f_L1 / f)²
seg-c4d4dd2bac45 = <b>Klobuchar</b>: mootori L1 mudel (<c1/>, kontrollitud RTKLIB-i vastu), skaleeritud kandelainele esimese järgu seaduse <c2/> järgi.

# text
# c1: effective_ionisation_level
# c2: Az = ai0 + ai1·μ + ai2·μ²
# c3: μ
# c4: Az
seg-0d3973f04ee5 = <b>NeQuick-G</b>: koefitsiendid liiguvad sõnumis ja <c1/> tagastab <c2/> modifitseeritud kaldelaiuskraadi <c3/> jaoks, algoritmi reeglitega (kõik-null koefitsiendid annavad { "63.7" } päikesevoo ühikut, sfu; tulemus piiratakse vahemikku [{ "0" }, { "400" }] sfu). NeQuick elektrontiheduse mudelit ja selle kaldintegreerimist, mis muudavad <c4/> viivituseks, <b>ei ole</b> teostatud.

# text
seg-66dbd447dfeb = Mõnesaja kilomeetri kõrgusel olev satelliit lendab ionosfääri sees. Kumbki ringhäälestatud mudel ei arvesta satelliidi kohal olevat elektronsisaldust ning selle jaoks ei rakendata parandust.

# text
# c1: system_to_utc
seg-7befd59b2ac6 = <b>UTC</b>: <c1/> rakendab Galileo ICD §{ "5.1.7" } kolme juhtu (enne lisasekundi sündmust, kuue tunni jooksul sellest ja pärast seda); lisatud sekund loetakse { "86400" }.

# text
seg-2b0d77219437 = Eelseadistused

# text
# c1: src/leo_navmsg/presets/
seg-d2908020db08 = Eelseadistused on andmed, üks fail igaühe kohta kataloogis <c1/>, koos nende allikatega. Mootor ja iga komplekti kuuluv stsenaarium peale Celeste'i oma töötavad ilma nendeta.

# text
seg-c353e7bec219 = Võti

# text
seg-5566e1d71a4f = Orbiit

# text
seg-33f4c7af9c53 = Kandelaine

# text
seg-f4510e898031 = Sõnumimudel

# text
seg-125aac68d94f = PUBLIC, <a1>arXiv { "2509.19551" }</a1>

# text
seg-890aa92157e4 = { "1080" } km, { "53" }°

# text
seg-1eca13ba2309 = X1 { "1593.3225" } MHz

# text
seg-ee9947222a30 = avaldamata

# text
seg-77af616c1f6e = PUBLIC, arXiv { "2509.19551" }

# text
seg-f016786d7755 = { "520" } km, { "97" }°

# text
seg-780e931bf88d = PUBLIC, <a1>RNTF-i aruanne</a1>, konstellatsiooni kirjeldus

# text
seg-d5df094a5f89 = { "781" } km, { "86.4" }°

# text
seg-94bc78cee128 = { "1621" } MHz ({ "1616" }–{ "1626" } MHz riba)

# text
seg-3f5de7f74502 = ringhäälestatud sõnumit pole

# text
seg-4944294c230f = PUBLIC, <a1>NAVIGATION { "72" }({ "1" })</a1>, konstellatsiooni kirjeldus

# text
seg-c2a2761f73b1 = { "550" } km, { "53" }°

# text
seg-2ef501f97eff = Ku-riba, riba keskmine väärtus (esinduslik)

# text
seg-567fab40bd24 = puudub (oportunistlikud signaalid)

# text
seg-a76527ba66b6 = PUBLIC, <a1>Sensors { "2023" }</a1>, <a2>Satellite Navigation { "2026" }</a2>

# text
seg-f5dd5086eedd = { "700" } km, { "55" }°

# text
seg-5fa6b60f66b4 = B1 lähedal (allikas varjatud; asendajana L1)

# text
seg-5ebbf0042d7c = REPRESENTATIVE

# text
seg-4f3e5a683682 = { "600" } km, { "97.8" }°

# text
seg-c06f62ca5173 = { "5020" } MHz (RNSS C-riba keskpunkt)

# text
seg-884c81e55e79 = PUBLIC, <a1>InsideGNSS</a1>

# text
seg-3b1fd041f9ba = { "500" } km (esinduslik)

# text
seg-522c85402d84 = L1 (esinduslik)

# text
# c1: ecef-poly
seg-064b03765e4d = <c1/>, aste { "6" }, { "60" } s, värskendatud iga { "30" } s järel, nullkell, { "0.24" } m juhtimisjääk

# text
seg-5619bc61b958 = WORKSHOP ja PUBLIC

# text
seg-20572d7e348d = { "510" } km, { "97.4" }°

# text
seg-a17f4b4f7fb5 = { "1191.795" } MHz

# text
# c1: kepler-rac
seg-fad0950a2d67 = <c1/>, astmed ja kirjete vahe eelseadistuse failis

# text
seg-e881ffc4e14b = RNSS on raadionavigatsiooni-satelliitteenus; RNTF on Resilient Navigation and Timing Foundation.

# text
# c1: navmsg
# c2: src/celeste_iod.rs
# c3: scenarios/leo-navmsg-celeste-iod.toml
# c4: src/celeste_iod.rs
# c5: build.rs
# c6: scenarios/*celeste-iod*.toml
seg-e9524c71636d = <b>Celeste IOD.</b> Euroopa Kosmoseagentuuri (ESA) Celeste'i orbiidil demonstreerimise (IOD) eelseadistus on ainus, mis kasutab ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT töötoas { "2026" } esitatud materjali: sõnumi struktuuri (Galileo Kepleri komplekt pluss piki-/risti-/radiaalparandupolünoomid, kellapolünoom, SVID, tervis, IOD, ionosfääri- ja UTC-parameetrid), kirjete vahet ja CSV veergude nimesid. Orbiit ({ "510" } km, peaaegu polaarne päikesesünkroonne) ja kandelaine pärinevad failis viidatud avalikest allikatest. Celeste'i bitipaigutus ei ole avalik ja seda ei reprodutseerita; hilisemad Celeste'i faasid ja Euroopa Liidu (EL) LEO-PNT süsteem võivad erineda. Iga töötoast pärinev väärtus asub faili <c2/> moodulis <c1/>, mida kasutab <c3/>. Kuidas eelseadistust tagasi hoitakse: iga mootori töötoast pärinev arv asub ühes failis, <c4/>, mille <c5/> kompileerib sisse ainult siis, kui see olemas on, ja ainult hoidlas olevates stsenaariumides <c6/>. Selle faili ja nende stsenaariumide kustutamine hoiab eelseadistuse tagasi ilma lähtekoodi muutmata; iga muu test, sõltumatu etalon ja stsenaarium töötab ilma selleta ning README stsenaariumifailide arv loeb tagasi hoitud failid ikka sisse.

# text
seg-906da2752f76 = Kontrollimine

# text
seg-7338b6210228 = Rida

# text
seg-c5ce76c91ff7 = Silt

# text
seg-cfe0d596296e = SISRE kaalud

# text
seg-3e0059048a0d = Montenbrucki jt { "2018" } tabel (GPS, GLONASS, Galileo, BeiDou, geostatsionaarne)

# text
seg-0f5e73171fe0 = Galileo ICD kasutaja algoritm

# text
# c1: eph2pos
# c2: tests/leo_navmsg_reference.rs
seg-29ad977ef423 = RTKLIB <c1/> nelja reaalse Galileo ringhäälestatud efemeriidi puhul, { "1" } mm telje kohta (<c2/>)

# text
# c1: 0xCDE703
seg-ecec254e8219 = kataloogi kontrollväärtus <c1/>; RTCM { "10403" } { "1005" } näitekaader

# text
seg-388633e4e785 = Sobitaja ja SISRE kompromiss

# text
seg-8b85c3277e66 = kahekeha tõeline seisund taastatud { "1" } mm täpsusega; parandatud J2–J6 sobitus { "1" } mm täpsusega; monotoonne kasv vahemikuga

# text
seg-4de7f2b173c5 = Läbilennu keskel uuenduse pidevus

# text
seg-bdbd2771c7f5 = hüppe samasus; suletud kujuga koonuse ülempiir valimi vastu

# text
seg-468a92a2caf7 = Binaarvorming ja eelarve

# text
seg-ba26f5f63172 = edasi-tagasi teisendused; iga välja poolsamm alla { "1" } mm

# text
seg-9be43cbef131 = RINEX-laadne ja CSV

# text
seg-a7748156fd6e = edasi-tagasi teisendused

# text
seg-88b5cda10923 = Liu jt { "2025" } 22-parameetriline mudel ja sobitus

# text
# c1: tests/leo_navmsg_fit_real_orbit_oracle.rs
seg-7272ebdc1fec = TU Graz ITSG täppisorbiidid nelja satelliidi kohta artikli tabelite { "4" }, { "5" }, { "6" } ja { "8" } vastu: piki-, risti-, radiaal- ja SISRE suhted { "0.755" } kuni { "1.138" } artikli päevadel ja { "0.683" } kuni { "1.186" } kaheksal suletud päeval, 1.5x piires (<c1/>)

# text
seg-94066142a642 = ATOMIC nullkella polünoom ja viie kõrguse tabel

# text
seg-205cdc6a3696 = ATOMIC faktid InsideGNSS-ist; avaldatud Liu tabel trükitud Kshana integreeritud orbiidi sobituse kõrvale, kinnitamata

# text
seg-8c00ed11609c = ICD suletud kujuga valemid; RTKLIB-iga kontrollitud Klobuchari mudel

# text
seg-d5653e0958b5 = SISRE on ainult esitusviga: orbiidi määramise või ennustamise viga puudub.

# text
seg-4968d9fcbc19 = Tõeline orbiit on Kshana integreerimine (kolmandat keha, päikesekiirguse survet ega looded arvestamata), mitte reaalse satelliidi täppisorbiit.

# text
seg-6a4a1bf21b50 = Binaarvorming ja RINEX-laadne blokk on Kshana enda omad.

# text
seg-26c0a2693081 = NeQuick-G kantakse, kuid seda ei integreerita viivituseks; ionosfääri sees oleva satelliidi jaoks parandust pole.

# text
seg-2a0c8190c38e = Liu jt võrdlus erineb orbiitide, parameetrite lugemise ja kaalude poolest.

# text
seg-4abe216f987a = <s1>Eelmine</s1>LEO läbilend ja sidelingi eelarve

# text
seg-59d9bf4735d8 = <s1>Järgmine</s1>Liidetud MEO ja LEO positsioneerimine
