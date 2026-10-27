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
