# docs--nmea-training: translations (et)

# text
seg-2247a2344710 = Tähendus

# text
seg-45425f378b61 = tähendus

# text
seg-6940543aa3c0 = string

# text
seg-f5e7215e6835 = objekt

# text
seg-c5fb6b91dc68 = kraadid

# text
seg-99427ab75a03 = väli

# text
seg-bbcdd898d24d = täisarv

# text
# c1: docs/NMEA-TRAINING.md
seg-ba00d0453fbf = Allikas: <c1/>

# text
# c1: kshana nmea-scenario
seg-738956d0a4b9 = NMEA treeningvoogud: <c1/>

# text
seg-3663955f80c7 = Merendusakadeemiad ja simulaatorikeskused saavad söötta Kshana loodud NMEA { "0183" } laevasimulaatorisse või kaardiplotterisse, et õpetada meeskondi GNSS-i segamist ja spuufimist ära tundma.

# text
# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Ainult treeninguks ja testimiseks.</b> Loodud voogud on sünteetilised. Neid ei tohi kunagi söötta laeva elavatesse navigatsioonisüsteemidesse. Kshana on nõuandev, mitte tüübikinnitust omav navigatsiooniseade. Iga voog algab omaette märgilausega <c1/> ja kordab seda iga kümne sekundi järel; vastuvõtjad ignoreerivad seda; <c2/> eemaldab selle simulaatori jaoks, mis lükkab tundmatud laused tagasi. See kirjutab ainult NMEA <b>teksti</b>: RF-, IQ- ega lainekujuväljundit ei ole ja midagi ei edastata peale teksti aadressile, mille nimetate.

# attr:alt
seg-b66ff9ca2ff4 = Treeningvoog stsenaariumist coastal-drag-off (mootor v{ $version }, algväärtus { "22" }, { "25" } minutit, üks fiks { "10" } s kohta õppejõu logist). Kaart näitab laeva tegelikku rada ja rada, mida vastuvõtja teatab: need langevad kokku, kuni skriptitud asukoha eemaletõmme algab hetkel { "421" } s, teatatud rada kõnnib seejärel tegelikust eemale, kuigi vastuvõtja säilitab kehtiva fiksi, ja astub tagasi, kui sündmus lõpeb hetkel { "1140" } s. Selle kõrval kahe raja vahemaa ajas ning vastuvõtja teatatud keskmine kandja-müra tihedus, mis tõuseb ühele kõrgendatud tasemele, kuni sündmus kestab. Kshana loodud sünteetilised treeningandmed. Ainult treeninguks ja testimiseks: ärge kunagi sööta seda voogu laeva elavatesse navigatsioonisüsteemidesse. Nõuandev, mitte tüübikinnitust omav navigatsiooniseade. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator. Asukohad, kuupäevad ja rajad on väljamõeldud.

# text
# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = Joonis on joonistatud faili <c1/> õppejõu logist.

# text
seg-32b620b3574e = Kasutus

# text
seg-9cbd24964be4 = Valik

# text
# c1: <name>.nmea
seg-aadcf289aed2 = kirjuta voog faili; kui võrguväljundit ei ole, on vaikeväärtus <c1/>

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = kirjuta <c1/> ja <c2/> (vaikimisi: faili kõrvale)

# text
# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> või <c2/>

# text
# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = TCP-server; käitamine algab, kui klient on ühendunud (<c1/>). Üksik port kuulab ainult aadressil <c2/>

# text
# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> või <c2/>

# text
# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, üks lause datagrammi kohta; <c1/> lubab leviaadressi. Üksik port saadab aadressile <c2/>

# text
# c1: --speed 0
seg-8ca50e2a4b8d = voo tempo; <c1/> on nii kiiresti kui võimalik. Võrguväljundi vaikeväärtus on reaalaeg, failidel nii kiiresti kui võimalik

# text
seg-97b82dfe97a7 = asenda stsenaariumi algväärtus

# text
seg-86ac66fd2771 = jäta märgilause välja

# text
seg-f6cc05a6d39a = <b>Autentimist ei ole.</b> TCP-server, millele on antud mittekohalik aadress, serveerib voogu igaühele, kes sellele ligi pääseb, ja UDP saadab ükskõik millisele aadressile, mille nimetate. TCP-klient, mis ei võta oma andmeid kahe sekundi jooksul vastu, jäetakse välja, nii et üks soiku jäänud tarbija ei saa teisi kinni hoida.

# text
seg-b4abb5a132ba = Sama algväärtus annab ühel platvormil samad baidid ja tempo ei muuda kunagi baite. Platvormide vahel on generaatori enda aritmeetika bitthaaval identne (see kasutab teisaldatavat matemaatikakihti), kuid satelliitide asukohad ja vaatenurgad tulevad mootori funktsioonidest, mis kutsuvad hosti matemaatikateeki, seega võib haruldasel piirjuhul GSV-s ümardatud kõrgusnurga, asimuudi või C/N0 numbrikoht platvormide vahel erineda.

# text
seg-97e31fc7f0d1 = Mida kirjutatakse

# text
# c1: GN
seg-632a4ca26567 = Iga epohh ({ "1" }, { "2" }, { "5" } või { "10" } sekundis) kannab: <b>RMC, GGA, GNS</b> (fiks, asukoht, aeg), <b>GSA</b> (kasutatud satelliidid ja DOP, üks konstellatsiooni kohta), <b>GSV</b> (nähtavad satelliidid koos kõrgusnurga, asimuudi ja SNR-iga dB-Hz-des, üks komplekt konstellatsiooni kohta, NMEA { "4.10" } signaali ID), <b>VTG</b> (kurss ja kiirus maa suhtes), <b>ZDA</b> (aeg ja kuupäev), <b>HDT</b> (güroskoobi suund) ja <b>VBW</b> (vee- ja maakiirus logilt). Talker on <c1/> mitme konstellatsiooni korral, muidu konstellatsiooni enda oma. Read lõpevad CRLF-iga ja on kontrollsumma poolest kehtivad.

# text
seg-942803ad8c49 = HDT ja VBW esindavad sõltumatuid andureid (güroskoopkompass ja Doppleri logi). <b>Ükski sündmus neid ei puuduta</b>, mis on tahtlik: vahe selle vahel, mida GNSS teatab, ja selle vahel, mida güro ja logi ütlevad, on arutelu vihje.

# text
# c1: V
seg-2d9a9ea38dde = Kui fiks kaob, on GGA kvaliteet { "0" }, RMC olek <c1/>, asukohaväljad on tühjad ja ajaväljad jätkuvad (vastuvõtja kell käib edasi), nagu päris vastuvõtjatel.

# text
seg-c1c51ff381e7 = Laev

# text
# c1: [vessel]
# c2: [[waypoint]]
# c3: max_rot_deg_per_min
# c4: max_rot_accel_deg_per_s2
# c5: max_accel_kn_per_min
# c6: speed_kn
# c7: [environment]
# c8: stop_at_end
seg-ada150c912eb = <c1/> ja <c2/> annavad alguspunkti, kiiruse ja punktid, mille kaudu suunata. Laeva suunatakse järgmise teekonnapunkti poole <b>pöördekiiruse piirangu</b> (<c3/>, vaikimisi { "30" }), piirangu all selle kohta, kui kiiresti pöördekiirus kasvab (<c4/>), ja <b>kiiruse muutmise piirangu</b> (<c5/>) all. Lõigu kiirus on teekonnapunkti <c6/>. <c7/> lisab hoovuse, nii et maa suhtes kiirus erineb veekiirusest ja suund erineb kursist maa suhtes, ning magnetilise deklinatsiooni. <c8/> peatab laeva viimasel teekonnapunktil.

# text
seg-4fc2cb8a1388 = Satelliidigeomeetria

# text
# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Satelliidid tulevad mootori enda nominaalsetest konstellatsioonidest (GPS-i pesatabel, Galileo ja BeiDou MEO Walkeri mustrid, GLONASS ICD), levitatuna funktsiooniga <c1/> (kahekeha pluss sekulaarne J2, Maa pöörlemine) ja nähtuna laevalt mootori WGS-84 vaatenurkadega. GSV-s olevad nähtavate arv, kõrgusnurgad ja asimuudid on koha ja kellaaja jaoks usutavad. <b>See on nominaalne taevas, mitte voo kuupäeva efemeriid</b>: PRN-id määratakse pesa järjekorras ja iga konstellatsioon säilitab oma avaldatud pesapaigutuse, levitatuna pidevalt GPS-i pesatabeli epohhist (2016-12-31) J2 all, seega on paigutus terve, kuid selle orientatsioon ei ole päris taeva oma voo kuupäeval. C/N0 järgib kõrgusnurka (nominaalne seniiditase, seatud failis <c2/>), fikseeritud satelliidipõhise nihkega, aeglase tuhmumise ja müraga. Satelliidil alla <c3/> on SNR-väli tühi; alla <c4/> jälgitakse, kuid ei kasutata. Kuni <c5/> (vaikimisi { "12" }, NMEA GGA lagi) kasutatavat satelliiti kasutatakse, valituna geomeetria põhjal (igas { "30" } kraadises asimuudisektoris esmalt kõrgeim satelliit). Vähem kui neli kasutatavat satelliiti kaotab fiksi ja see naaseb pärast <c6/> kasutatavat signaali.

# text
seg-f2be7442bdf2 = Sündmused

# text
# c1: [[event]]
# c2: kind
# c3: start_s
# c4: duration_s
# c5: ramp_s
# c6: recovery_s
# c7: ramp_s
# c8: recovery_s
# c9: 0
seg-db86ed4b40a9 = Igal <c1/> on <c2/>, alguse <c3/>, <c4/> (algusest vabastuse alguseni), alguse tõusuramp <c5/> ja vabastuse ramp <c6/>. Tugevus tõuseb lineaarselt üle <c7/>, püsib, siis langeb üle <c8/>; <c9/> on aste. Kõik mõjud skaleeruvad selle tugevusega. Parameetrid, mis ei kuulu liigile, lükatakse tagasi.

# text
seg-3255e99c7265 = liik

# text
seg-9285a9d699c0 = parameetrid

# text
seg-e83c9db4f9c7 = mõju

# text
# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (vaikimisi { "6" })

# text
# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = iga satelliidi C/N0 langeb kuni <c1/> võrra (satelliidipõhine hajuvus), satelliidid langevad välja madalaimast alates, fiks kaob, kui kasutatavaid on alla nelja, ja taastub pärast vabastust ja <c2/>

# text
# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, üks väärtustest <c2/> (tõene) või <c3/> (kursini <b>alguses</b>, siis hoitud), valikuline <c4/>, <c5/>

# text
# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = vastuvõtja säilitab <b>kehtiva fiksi</b>, mille asukoht kõnnib tõest eemale; SOG ja COG sisaldavad eemaletõmmet. Eemaletõmme järgib ramplitel smoothstepi, seega vale rada algab ja lõpeb ilma kiirusastmeta; selle tipud on <c1/> m/s ja <c2/> m/s ruudus rampi <c3/> s korral üle <c4/> m (mõlemad logitud), ja stsenaarium, mis ületaks <c5/>, lükatakse tagasi. Aste (<c6/>) liigutab asukohta kiirust puudutamata

# text
seg-7da039c3262e = RMC, GGA, GNS ja ZDA aeg nihutatakse tõelisest UTC-st; asukoht jääb tõeseks

# text
# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (vaikimisi true), <c3/>

# text
# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = asukoht, kiirus (ja aeg) on laeval <c1/> tagasi olnud; viivitus järgib tõusude ajal sujuvat astmefunktsiooni (smoothstep) ning teatatud kiirust skaleeritakse teguriga <c2/>, kuni see muutub: lihtsustatud, meaconing-laadne abstraktsioon, mitte levimudel

# text
# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/>: kui drag-off, aja spuufimine või taasesituse viivitus on aktiivne, näitab iga jälgitav satelliit seda üht tõstetud taset, mis on klassikaline tunnus. Peene sündmuse korral, kus säilitatakse tegelik C/N0 muster, jäetakse see ära. Kuni mis tahes võltssündmus on aktiivne, järgib vastuvõtja võltssignaali, mistõttu segamine seda ei katkesta; varasema segamise tõttu kaotatud fiks naaseb võltssignaalil <c2/> pärast (vt <c3/>). Ajamuutus, mille tõttu teatatud aeg seiskuks või jookseks tagurpidi (kiirus { "1" } s sekundis või rohkem), lükatakse tagasi, kui see ei ole samm (<c4/>).

# text
# c1: onset
# c2: start_s
seg-894aceb32c5c = Sündmused võivad kattuda; nende mõjud liituvad (nihked, ajamuutused, viivitused) või kehtib tugevaim (segamine). Ajajoone <c1/> on esimene epohh, mil sündmusel on mõju, üks epohh pärast skriptitud <c2/>, kui sündmus tõuseb järk-järgult.

# text
seg-09e311ade9e6 = Instruktori logi

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Voo kõrval annavad <c1/> ja <c2/>:

# text
seg-51930977a6fe = sündmused sellisena, nagu need süstiti, lihtsas keeles koos iga parameetriga, ja nende UTC algusaeg;

# text
# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = ajajoone: algus, täielik mõju, taastumise algus, taastumine ning vastuvõtja enda <c1/> ja <c2/>;

# text
# c1: log_interval_s
seg-af2eb88f14d0 = tõelise raja teatatuga võrreldes <c1/> sammuga: tõene ja teatatud asukoht, kiirus ja kurss, asukohaviga meetrites, ajanihe, kasutatud ja jälgitud satelliidid, keskmine C/N0 ning millised sündmused olid aktiivsed;

# text
seg-303f5fbe0351 = tõelise ja teatatud raja tippkiirus ja -kiirendus;

# text
# c1: trainer_note
seg-593a4a1ef296 = stsenaariumi <c1/>.

# text
seg-8c4aebcd0eff = Näita logi alles lõppanalüüsil.

# text
# c1: kshana-nmea-training/1
seg-dd1780910af7 = JSON-väljad (skeem <c1/>)

# text
seg-60b5b11cdc0b = tüüp, ühik

# text
seg-f4963d090155 = ainult koolituseks mõeldud väide

# text
seg-7ad14e03d9e4 = stsenaariumist

# text
seg-fac0fb50b31b = kasutatud algväärtus (seed)

# text
seg-f05d18516bd8 = ISO { "8601" } UTC

# text
seg-8752c09baa6a = käitamise algus

# text
seg-f0d8bb5aafef = käitamise kestus

# text
seg-0989e14f1e51 = sõlme

# text
seg-b657b979a455 = suurim tõene ja teatatud kiirus maa suhtes

# text
seg-24e947df31ae = m/s ruudus

# text
seg-a1ca3847c8d8 = kiiruse suurim muutus sekundis, tõene ja järjestikuste teatatud fikside vahel

# text
seg-e1daadeb7d48 = üks iga skriptitud sündmuse kohta

# text
# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = 1-põhine; kasutavad <c1/> ja <c2/>

# text
seg-6bbb9db14f7b = lihtsas keeles kirjeldus koos parameetritega

# text
seg-2f3eac27a997 = skriptitud algus

# text
# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = sündmus täpselt nii, nagu see on kirjutatud (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> ja liigi enda parameetrid; puuduvad jäetakse välja)

# text
seg-88db26711d77 = kraadi tõene või null

# text
seg-2f30c3d8b17b = drag-off: rakendatud suund (suhteline suunanurk lahendatakse alguses)

# text
seg-55d6dd667365 = m/s, m/s ruudus või null

# text
seg-021df000164f = drag-off: tipud, mille nihe võltsrajale lisab

# text
seg-d3a2c65ebcd4 = hetked lõppanalüüsi jaoks, ajalises järjekorras

# text
seg-b2b72301c1c9 = s algusest, ISO { "8601" } UTC

# text
seg-34e24e21ac7e = millal (tõene aeg)

# text
seg-cf29ba5ed968 = täisarv või null

# text
seg-8dbc5e7239be = sündmuse id; null vastuvõtja oleku muutuste korral

# text
# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (sündmused); <c5/>, <c6/> (vastuvõtja)

# text
seg-cd7c4057601b = selgitus

# text
# c1: log_interval_s
seg-90e65cbe1a59 = üks rida iga <c1/> kohta

# text
seg-a57e27a3c470 = s, ISO { "8601" } UTC

# text
seg-24376fe24496 = tõene asukoht

# text
seg-f23b251a0e33 = sõlme, kraadi tõene

# text
seg-242c1f2ccbd3 = tõene kiirus ja kurss maa suhtes ning güroskoobi suund

# text
seg-696dd61f8bbb = tõeväärtus

# text
seg-ea264ef0395c = vastuvõtja teatas fiksist

# text
seg-b073b87a813e = kraadid, sõlmed, kraadi tõene või null

# text
seg-b56345697092 = mida vastuvõtja teatas; null, kuni fiks on kadunud

# text
seg-c4a33c03d9da = m või null

# text
seg-463f6fc42ae5 = horisontaalne kaugus tõelisest teatatud asukohani

# text
seg-b68dfce8d81d = teatatud UTC miinus tõene UTC

# text
seg-ec28faa1efcc = täisarvud

# text
seg-2bf397f77392 = fiksis kasutatud ja jälgitud satelliidid

# text
seg-96b87348e90e = dB-Hz või null

# text
seg-40f30b4a88cf = jälgitud satelliitide keskmine C/N0

# text
seg-3671c8aa3c1a = sündmuste id-d, millel on sel hetkel mõju

# text
# c1: /2
seg-8401fa92aae1 = Välja lisamine ei muuda skeemi silti. Välja ümbernimetamine või eemaldamine või välja tähenduse või ühiku muutmine suurendab numbrit (<c1/>).

# text
seg-656ee92a3130 = Stsenaariumiteek

# text
# c1: scenarios/training/
seg-82a888587138 = <c1/>, kumbki mõne minuti pikkune reis koos treeneri märkusega oma TOML-is:

# text
seg-665b9b46b49b = fail

# text
seg-11ed1f85d4be = mida see näitab

# text
seg-50ffa85a1128 = C/N0 langeb koos, satelliidid kaovad, fiks läheb kaduma ja naaseb

# text
seg-10bc30b9c57b = kehtiv, terve väljanägemisega fiks nihkub { "1.4" } km kalda poole; ühtlaselt tõstetud C/N0

# text
seg-f141692988e4 = asukoht õige, UTC triivib aeglase sadamasse sisenemise ajal { "45" } s ette

# text
seg-ce06a5ebdd42 = segamine, seejärel võltssignaali ülevõtt koos drag-off-i ja ajanihkega, seejärel taasesituse viivitus

# text
# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = blokeeritud taevas, mitte häire: fjordi kaljuseinad (REPRESENTATIVE <c1/> horisondijoone eelseadistus) varjavad satelliite idas ja läänes, seejärel kanal avaneb taas (sündmus <c2/>, koos <c3/> tabeliga)

# text
seg-5462f6b21fae = Asukohad, kuupäevad ja rajad on väljamõeldud; teek ei sisalda ühtki tegelikku laeva, operaatorit ega salvestist. See ei väida midagi selle kohta, kuidas ükski vastuvõtja või süsteem häire korral toimiks.

# text
seg-9831ab537b36 = Modelleerimisvalikud

# text
# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = Generaator on koolitusvahend, millel puudub väline sõltumatu etalon, ja selle arvud on modelleerimisvalikud, mitte ühegi vastuvõtja mõõtmised. Need on valitud nii, et need näeksid välja nagu tavalise vastuvõtja logi: C/N0 kalle { "14" } dB seniidist horisondini alla seniiditaseme (vaikimisi { "47" } dB-Hz) ja satelliidipõhine nihe +/-1,5 dB, aeglane hajumine { "0.8" } dB { "97" } s jooksul ja { "0.5" } dB { "31" } s jooksul, { "0.3" } dB värin; jälgimise ({ "20" } dB-Hz) ja kasutamise ({ "28" } dB-Hz) läved; asukohamüra ({ "1.5" } m HDOP-i { "1" } korral, korreleeritud { "30" } s jooksul, vertikaalselt kaks korda suurem); { "0.05" } kraadi güroskoobi müra ja { "0.03" } kn triivimüra; { "20" } s roolimise ajakonstant ja laeva mudeli teekonnapunktide saabumisraadiused; ning asimuudisektori põhine satelliidivalik. Vaikeväärtused asuvad <c1/> ja <c2/> ning neid kõiki saab stsenaariumis muuta.

# text
seg-84913be532a0 = Tagasilugemine

# text
# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> oskab neid faile sisse lugeda (<c2/>). Testid kontrollivad iga teegi stsenaariumi iga lauset selle enda väljade arvu ja kontrollsumma reeglite vastu ning käitavad failid läbi selle lugeja, mis tõlgendab GGA, RMC ja GSV lauseid ning laseb teised tüübid läbi, jätmata ühtki vahele. Testid fikseerivad stsenaariumi kohta kuldse väljavõtte (<c3/>); pärast kavatsetud muutust genereeritakse uuesti käsuga <c4/>.

# text
seg-b94fbc3b1dd3 = <s1>Eelmine</s1>Mereliikluse usaldus

# text
seg-ecdf748cb63d = <s1>Järgmine</s1>Häirekaart ja marsruudi mõjutatus

# text
seg-24ad8471ff2a = JSON-väljad (skeem kshana-nmea-training/1)
