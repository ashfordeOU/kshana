# docs--maritime-trust: translations (et)

# text
seg-2247a2344710 = Tähendus

# text
seg-6940543aa3c0 = string

# text
seg-abec93a4a488 = string või null

# text
seg-f5e7215e6835 = objekt

# text
seg-b993ef559bd0 = Koodist

# text
seg-c353e7bec219 = Võti

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> või <c4/>

# text
# c1: docs/MARITIME-TRUST.md
seg-2896f449bffb = Allikas: <c1/>

# text
seg-342f34403ac5 = Mereliine usaldus: kas sild võib sellesse lahendisse usaldada?

# text
# c1: kshana receiver-trust
seg-49b609a9655c = <c1/> võib hinnata <b>liikuva laeva</b> jaoks reaalajas 0-100 usaldusnäitaja iga asukohalahendi kohta sellest, mida iga vastuvõtja juba siinile paneb (esmalt NMEA { "0183" }), ja öelda, millised kontrollid seda vähendasid. See on tarkvarakiht, mis asub vastuvõtja kõrval. See ei ole vastuvõtja, see ei asenda ühtki ega muuda lahendit täpsemaks.

# text
seg-3c66739c9250 = <b>Nõuandev tarkvara.</b> Kshana ei ole tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }) ning seda ei ole hinnatud ühegi toimivusstandardi vastu. Selle skoor ja värav on abivahendid navigaatori otsustusvõimele. Laeva ohutu navigeerimise eest ning iga otsuse eest lahendile tugineda või sellele enam mitte tugineda vastutab jätkuvalt operaator.

# text
# c1: RECEIVER-TRUST.md
seg-a9899ca66661 = See leht ütleb, mida kontrollid vaatavad, mida iga neist suudab ja ei suuda tabada, kuidas seda reaalajas käivitada ja mida värav teeb. Skoori kaardistus ja iga vaikeväärtus on failis <a1><c1/></a1>.

# text
seg-05e79b6c5a58 = Mida see loeb

# text
seg-e784fdbe26e6 = Laev deklareeritakse seansifailis, selle piirid sätestatud enne käivitust:

# text
seg-e8e9ee2965cf = Lause

# text
seg-e127f2f26824 = Loetav

# text
seg-5e17bb4156f1 = GGA

# text
seg-b38b8385ddcb = asukoht, lahendi kvaliteet ({ "0" } = lahendit ei ole), kõrgus keskmise merepinna kohal, geoidi eraldus, HDOP

# text
seg-870056f55c30 = RMC

# text
# c1: A
# c2: V
seg-445c02505551 = olek (<c1/> kehtiv, <c2/> mitte), maapealne kiirus ja kurss, kuupäev, režiim

# text
seg-8a259fc7b06d = VTG

# text
seg-eb3e34f58751 = maapealne kiirus ja kurss, kui RMC-l neid ei ole

# text
seg-add66711c27b = HDT, THS

# text
# c1: V
seg-24e36e50b0ad = suund (THS ainult siis, kui selle režiim ei ole <c1/>)

# text
seg-bcfb4cd59951 = VHW, VBW

# text
# c1: A
seg-fa0a0dae1510 = kiirus vee suhtes (VBW ainult siis, kui selle olek on <c1/>)

# text
seg-774d1991fb0b = ZDA

# text
seg-68d981999c72 = aeg

# text
seg-a0cc45088f5f = GSV

# text
seg-0fad368a11cb = satelliidipõhine signaali tugevus (dB-Hz), kõrgusnurk ja asimuut (geomeetria jaoks)

# text
seg-032eafc03b42 = GSA

# text
seg-71334afb8a7d = DOP (täpsuse halvenemise tegur) ja kasutatud satelliidid (geomeetria jaoks, kui GSV ei anna taevast; ja deklareeritud HDOP, mida valvur võrdleb)

# text
# c1: A
# c2: F
# c3: N
seg-305f423d3ead = OSNMA olek, mida vastuvõtja teatas, tõlgitud selleks lauseks adapteri poolt, mis vastuvõtjat loeb: <c1/> autenditud, <c2/> ebaõnnestunud, <c3/> tulemust ei ole

# text
# c1: V
# c2: E
# c3: M
# c4: S
# c5: N
seg-7ce1d69e710e = Epohhe, mille vastuvõtja ise ütleb mitte olevat satelliidilahendus (GGA kvaliteet { "0" } või { "6" } kuni { "8" }: hinnanguline, käsitsi, simulaator; RMC olek <c1/> või režiim <c2/>, <c3/>, <c4/>, <c5/>), ei kasutata asukohakontrollide jaoks ning need ei kanna kummagi suuna tõendeid: vastuvõtja on seda juba öelnud.

# text
# c1: calibration_s
seg-a0ae80781c6e = Esimesed <c1/> sekundit moodustavad lähtetaseme ja neid ei hinnata kunagi. Iga seire vaatab ainult praegust ja varasemaid epohhe, nii et otsus epohhil ei muutu, kui saabuvad hilisemad andmed, ja reaalajas voog annab sama skoori nagu sama tekst failina loetuna.

# text
seg-068593ad0a52 = Mida iga kontroll tabab ja mida mitte

# text
seg-094b90f0c701 = Suunad lahendite vahel (jälgitav suund, mida kasutab pöördekiiruse kontroll, kahe asukoha poolt viidatud kurss) on nende vahelise kõõlu suund, mis on geodeetilise joone <b>keskmine asimuut</b> lahendite vahel, mitte edasiasimuut esimeses lahendis; need erinevad umbes poole meridiaanide koondumise võrra lahendite vahel ({ "0.001" } kraadi { "260" } m baasjoone korral laiuskraadil { "59.5" } kraadi).

# text
seg-ed3cdfcfbff5 = Võltsitud asukoht peab ühtima laeva füüsika ja laeva teiste sensoritega. Iga kontroll võrdleb lahendit ühega neist. Kontroll on nii sõltumatu kui selle teine allikas: GNSS-kompassi suund või GNSS-ist tuletatud „kiirus vee suhtes“ ei ole testitavast vastuvõtjast sõltumatu ja ei lisa midagi.

# text
seg-9480aabf136e = Kontroll

# text
seg-20e4f746c7e1 = Tabab

# text
seg-e7b2ebe5eabc = Ei suuda

# text
seg-21ad9895f606 = asukohahüpe; jälg, mille liikumist teatatud kiirus ja kurss ei seleta; tuletatud kiirus, kiirendus või pöördekiirus üle sätestatud laevapiiride

# text
seg-dcbc6d4cd17f = nihe, mille teatatud kiirus ja kurss järgivad võltsitud jälge ja jäävad piiridesse (vastuvõtja tuletab need oma lahendist, seega on need omavahel kooskõlas); liiga kõrgeks sätestatud kiiruspiir

# text
seg-3542f83a7988 = jälg, mis kaldub sellest, kuhu laev osutab, rohkem kui sätestatud triivinurk

# text
# c1: min_speed_kn
seg-75f4d659f716 = nihe kursi suunas (kurss ei muutu); sama vastuvõtja või GNSS-kompassi suund; ristvool üle tolerantsi (valehäire); kiirused alla <c1/>

# text
seg-09dde82be447 = nihe, mis muudab maapealset kiirust vee suhtes kiiruse vastu

# text
seg-6ac740e5f51c = logi, mis on GNSS-ist tuletatud; vool üle lubatud määra (valehäire); nihe, mis on lubatud määrast aeglasem

# text
seg-e85d5f0933b7 = kõrgus, mis ei asu seal, kuhu merepind ja sätestatud antenni kõrgus selle panevad

# text
seg-3806e1d46332 = võltsija, kes hoiab kõrguse usutavana; tolerants on lai, sest iseseisev vertikaalviga on suur; geoidi eraldus on registreeritud, aga seda ei kontrollita, sest mootoris puudub geoidi mudel

# text
seg-5b70bd80640e = ühe saatja allkiri: C/N0 satelliitide lõikes kukub koos kokku või tõuseb koos, kalibreerimise lähtetaseme suhtes

# text
seg-e6874a8047b1 = võltsija, kes kujundab võimsust satelliidi kaupa; kõik, kui lähtetase ise on spuufitud; GSV-intervall, mis on jälgimiseks liiga aeglane

# text
seg-371b17ce936a = vastuvõtja aeg astub ebaühtlaselt või jookseb tagurpidi; selle arvuti kella suhtes vastuvõtja aja triiv sellest (ainult reaalajas vood)

# text
seg-026479cb7966 = võltsitud aeg, mis on kooskõlas ja ühtlane; kell, mis on algusest peale vale

# text
seg-906ab911b73d = teatatud OSNMA autentimise ebaõnnestumine

# text
seg-a04757b7ae57 = olekut loetakse, mitte ei kontrollita; võltsijat, kes aruande maha surub, ei märgata

# text
seg-c36c24a337b8 = võimsuse keelamine ja satelliitide kadu, nagu staatilisel juhul

# text
seg-940b39a3988a = need ütlevad, et keskkond on vaenulik, mitte et lahend on vale

# text
seg-9d751e1f5938 = <b>Mida ainult NMEA-põhised seirajad ei suuda.</b> Võltsija, kes taastoodab kogu satelliidikonstellatsiooni ise-kooskõlas asukoha, kiiruse, suunaga ühilduva kursi, usutava satelliidipõhise võimsuse ja sobiva kellaga, on nähtamatu kõigile ülaltoodud kontrollidele: lausetes ei erista miski selle lahendit päriselust. Ei erista ka salvestatud tegelike signaalide kordusesitus. Autentimine (OSNMA või vastuvõtja oma spuufimisvastasusega) ja sõltumatud navigatsioonisensorid on need, mis selle lõhe sulgevad; see kiht saab kasutada ainult nende teatatud olekut. Voog, mida spuufitakse juba lähtetaseme moodustumise ajal, ei oma puhast lähtetaset. Alarmi puudumine ei ole tõend hea lahendi kohta.

# text
seg-e3e09e2412fb = Usaldusskoor

# text
# c1: nominal
# c2: degraded
# c3: untrusted
# c4: RECEIVER-TRUST.md
seg-a1c05079de2f = Iga epohh pärast kalibreerimist saab skoori vahemikus { "0" } kuni { "100" } ja põhjused, miks see ei ole { "100" }: millised kontrollid maha arvasid, nende statistik läve suhtes ja nende punktid. Ribad (servad sätestatud seansis): <c1/> alates { "90" }, <c2/> alates { "55" }, <c3/> sellest allpool. Kaardistus, iga kaal ja selle põhjus on failis <a1><c4/></a1>; see on deterministlik ja fikseeritud enne logi hindamist, ilma õppimiseta ja ilma, et midagi oleks sündmustele sobitatud.

# text
# c1: advisory
# c2: #
# c3: <desc>
# c4: session.result.json
# c5: session.trust.csv
# c6: score
# c7: score_reasons
# c8: session.trust.svg
seg-d56822e82e3d = Iga laevaväljund kannab nõuandvat avaldust: tulemuse JSON-i ja iga reaalajas rea võti <c1/>, CSV esimene <c2/>-kommentaaririda (lugejad jätavad selle vahele oma kommentaarivalikuga), <c3/> ja SVG jalus. Pakkjooksu väljundid: <c4/> (koos skoorimudeli ja iga epohhi mahaarvamistega), <c5/> (koos veergudega <c6/> ja <c7/>) ja <c8/>, mis laeva puhul on vastuvõtja teatatud jälg usaldusribade järgi värvitud, skoori kohal aja jooksul.

# text
seg-918516588036 = Sünteetiline demo

# text
# c1: examples/maritime-trust/
# c2: session.toml
seg-e6717d346ca6 = <c1/> sisaldab väljamõeldud NMEA logi praamist Tallinna–Helsingi liinil (50-minutiline väljavõte, umbes { "17" } kn, { "1" } Hz: GGA, RMC, VTG, güroskoobi suund, kiiruslogi, GSV usutava taevaga), milles asukoha nihutamine tõmbab <em>teatatud</em> asukoha laeva tegelikust eemale alates { "1500" } s. Vastuvõtja teatab kogu aeg <b>kehtivat</b> lahendit; skoor on see, mis langeb, läbi degraded riba untrusted ribasse. <c2/> sätestab iga läve, laeva piirid ja iga skoori kaalu enne käivitust.

# text
# c1: cargo run --example gen_maritime_trust_demo
# c2: tests/receiver_trust_maritime_demo.rs
seg-b2f24e5091d0 = Logi on <b>faili kirjutatud tekst</b>, mille loob <c1/>: see ei modelleeri ühtki raadiosignaali ega edasta midagi. See ei ole mõõtmine ja marsruut on illustratiivne, mitte merekaart. <c2/> fikseerib logi ja oodatava väljundi regressioonikaitsetena sünteetilistel andmetel; need ei ütle midagi selle kohta, kuidas ükski seire tegelike häirete korral hakkama saab.

# attr:alt
seg-26ab8544afba = Usaldusskoor ühe sünteetilise reisi vältel, mootori v{ $version } tegelikust käivitusest andmetel examples/maritime-trust (väljamõeldud NMEA logi praamist Tallinna–Helsingi liinil, { "3001" } epohhi sagedusel { "1" } Hz). Kolm rada jagavad ühte ajatelge. Ülal: kaugus vastuvõtja teatatud asukoha ja laeva tegeliku asukoha vahel, mis püsib mõne meetri piires kuni umbes { "1576" } s, kui logi stsenaariumipärane asukoha nihutamine selle eemale tõmbab, samal ajal kui vastuvõtja jätkab kehtiva lahendi teatamist. Keskel: usaldusskoor vahemikus { "0" } kuni { "100" }, mida ei arvutata kalibreerimise esimese { "300" } s jooksul, nominal ribas (vähemalt { "90" }) kuni nihutamiseni, seejärel langemas läbi degraded riba (vähemalt { "55" }) untrusted ribasse. All: iga epohhi riba värvilise lindina koos selle nimega. Skoor on nõuandev. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator. Logi on välja mõeldud vormingu ja seirajate näitamiseks; see ei ole mõõtmine ega ütle midagi selle kohta, kuidas ükski vastuvõtja toimiks.

# text
# c1: tools/gen_readme_assets.py
# c2: kshana receiver-trust examples/maritime-trust/session.toml
seg-ed183c325c7e = Joonise joonistab <c1/> selle demo tegelikust käivitusest (<c2/>); skoor on nõuandev ja logi on välja mõeldud.

# text
seg-8badaf0d8586 = Studio vaate spetsifikatsioon

# text
seg-588092535a89 = Neile, kes ehitavad laevakäivituse Studio vaadet. Selle jaotise sisust ei ole Studios veel midagi realiseeritud; mootoripool (allolevad andmed) on.

# text
seg-5c34f31acf1d = <b>Sisendid.</b> Kumbki neist:

# text
# c1: kshana receiver-trust <session.toml>
# c2: receiver_trust(toml)
# c3: score_model
# c4: monitors_run
# c5: states
# c6: epochs[]
# c7: t_s
# c8: state
# c9: alarms
# c10: score.{score,band,deductions[]}
# c11: marine.{position:[lat,lon], stats, ratios}
# c12: geometry
# c13: class
# c14: geometry_model
# c15: geometry_summary
seg-57ca6d9000b1 = pakkjooksu tulemuse JSON (<c1/> või sama käsu <c2/> kaudu WebAssembly paketis, logi sisseehitatult): <c3/> (riba servad, rampi, tõendi hoidmine, iga kaal), <c4/>, <c5/> ja <c6/>, igaühel <c7/>, <c8/>, <c9/>, <c10/>, <c11/> ning versioonist { "0.36" } <c12/> ja iga mahaarvamise <c13/>, koos <c14/> ja <c15/> ülataseme juures; või

# text
# c1: position
seg-bfab64386b6c = reaalajas JSON-read (skeem ülal), üks objekt epohhi kohta, lisatuna voo käivitudes. Iga rida kannab vastuvõtja teatatud <c1/> (skeem { "1.1" }).

# text
# c1: examples/maritime-trust/
# c2: session.toml
# c3: tallinn-helsinki.nmea
# c4: tallinn-helsinki.truth.csv
# c5: t_s,true_lat_deg,true_lon_deg
seg-f7c7462d315e = Demokomplekt on <c1/>: <c2/>, <c3/> (logi) ja <c4/> (<c5/>: kus laev tegelikult oli, mida ühelgi päris logil ei ole). Vaade peaks seansi käivitama ja tõefaili kõrvuti lugema.

# text
seg-c015c26cf30a = Mida joonistada.

# text
seg-92f452bdbed6 = <em>Jälg</em>, põhi üleval, üks mõõtkava mõlemal teljel: vastuvõtja teatatud asukohad joonena, mis on värvitud epohhi riba järgi (hall calibrating, roheline nominal, merevaigukollane degraded, punane untrusted), algus ja lõpp märgitud, mõõtkavariba. Demo jaoks tegelik jälg õhukese neutraalse joonena selle all, nii et nihutamine paistab kahe eralduvana; lüliti tegeliku jälje jaoks ja nihke meetrites näit kursori ajal.

# text
# c1: nominal_min
# c2: degraded_min
# c3: score_model
seg-3ba328e2188c = <em>Skoori ajajoon</em>: skoor vahemikus { "0" } kuni { "100" } aja vastu, riba servad (<c1/>, <c2/> väljast <c3/>) katkendjoontena, riba ribana selle all ja iga sätestatud sündmuse algus markerina. Ajatelg on jälgega jagatud.

# text
# c1: score_model.weights
# c2: monitors_run
# c3: geometry
# c4: score_model.weights
# c5: geometry_model.cap_in_force
seg-33447da1d56d = <em>Põhjused</em>: kursoriaja epohhi jaoks mahaarvamised (seire, suhe läve vastu, punktid) horisontaalsete ribadena, suurim esimesena, koos kaaluga, mille iga seire väljalt <c1/> kannab; seired, mis töötasid ja midagi ei maksnud, nõrgalt näidatud; seired, mis ei töötanud (ei ole väljas <c2/>), loetletud kui „ei töötanud“, mitte kunagi kui läbivad. Seirel <c3/> ei ole kirjet <c4/>: selle ülempiir on <c5/>.

# text
# c1: monitors_run
seg-d0379b68ea67 = <em>Seireribad</em>: üks õhuke riba iga seire kohta väljas <c1/>, mis näitab selle suhet aja jooksul (alarm väärtusel { "1" }), nii et lugeja näeb, milline kontroll liikus esimesena.

# text
# c1: gate
# c2: off
# c3: passed
# c4: withheld
# c5: $PKSHT
seg-83d881ce6ab0 = <em>Värava olek</em>: reaalajas vaates iga epohhi <c1/> (<c2/>, <c3/>, <c4/>) ribana riba all ja viimane <c5/>. Pakkvaates on epohhid, mille värav oleks kinni hoidnud, need, mille riba on untrusted, rakendatud vabastushoidmisega.

# text
# c1: geometry.status
# c2: class
# c3: geometry_summary
# c4: geometry.note
# c5: n_used
# c6: source
# c7: age_s
# c8: reported_derived_mismatch
# c9: unknown
# c10: [geometry]
# c11: geometry_model
seg-b96652af3a03 = <em>Geomeetriarada</em> ({ "0.36" }): riba riba all, värvitud välja <c1/> järgi (roheline hea, merevaigukollane degraded, hall viirutatud unknown), värvipere, mis erineb vastuolu ja keskkonna radadest, legendiga „geomeetria: taevas, mitte signaal“. Mahaarvamised, mis on värvitud välja <c2/> järgi (geomeetria, keskkond, vastuolu) põhjuste paneelis ja seireribadel, ning epohhide arv klassi kohta väljast <c3/> riba arvude kõrval. Kursoriaja epohhi jaoks: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> ja lipp, kui <c8/> on seatud (geomeetria mahaarvamine on siis vastuolu). <c9/> näidatakse kui „geomeetria teadmata: logis puudub GSV või GSA“, mitte kunagi kui hea. Läved <c10/> ja nende päritolu väljast <c11/> asuvad skoori seadete kõrval. Nõuandev märkus jääb.

# text
seg-c48906d03f90 = <em>Vastuvõtja teatatud lahend</em>: demo vastuvõtja teatab kogu aeg kehtivat lahendit (GGA kvaliteet { "1" }, RMC olek A); öelge seda legendis, sest see on vaate mõte.

# text
seg-869c8a92e2cf = <b>Interaktsioonid.</b> Üks ajakursor, mida jagavad kõik paneelid (lohistamine, nooleklahvid ja esitusnupp, mis kordab kiirusega 1x kuni 60x); jälje või mis tahes riba kohal hõljutamine liigutab seda. Mahaarvamisele klõpsamine tõstab esile epohhid, milles see seire oli üle oma algusläve. Ribafilter (näita ainult degraded ja untrusted epohhe) ning hüpe esimese mahaarvamise ja esimese untrusted epohhi juurde. Hõljutamise tekst iga seire nimel, mis annab ühe rea kirjelduse sellelt lehelt. Seansi läved ja kaalud näidatakse ainult lugemiseks diagrammi kõrval, nii et see, mida skoor kasutas, on ekraanil.

# text
seg-1f97fe8ea2f1 = <b>Hoitav sõnastus.</b> Leht peab ütlema, et see on nõuandev tarkvara ja mitte tüübikinnitust omav navigatsiooniseade, et demo on sünteetiline tekst väljamõeldud nihutamisega ning et lahend ilma alarmita ei ole sellega hea lahend (vt ülalolevaid piiranguid). Ükski leheküljel olev arv ei tohiks lugeda kui mõõt selle kohta, kuidas kontrollid tegelike häirete korral hakkama saavad.

# text
# c1: kshana::receiver_trust::assess
seg-079ce44fd53e = Kutsujatele, kes hoiavad seanssi ja baite mälus (ilma failideta, kellata, soklitega; WebAssembly jaoks ohutu), on moodulil <c1/>:

# text
# c1: assess_vessel_log(session_toml, log_bytes) -> Result<ReceiverTrustResult, String>
# c2: kshana receiver-trust <session.toml>
# c3: score_model
# c4: monitors_run
# c5: epochs[]
seg-e8c3172d72b8 = <c1/>: terve logi, hinnatud pakkjooksuna; sama tulemus kui käsul <c2/>, mis serialiseerub tulemuse JSON-iks (<c3/>, <c4/>, <c5/> skooride ja mahaarvamistega).

# text
# c1: assess_stream_excerpt(session_toml, excerpt_bytes) -> Result<ExcerptAssessment, String>
# c2: epochs[]
# c3: $PKSHT
seg-0302b7c35fd3 = <c1/>: piiratud tükk voost (kuni { "2" } MiB ja { "20,000" } epohhi, ning piisavalt pikk kalibreerimisaknaks), hinnatud nii, nagu reaalajarežiim hindab, ja tagastatud reaalajas JSON-ridade skeemis (<c2/>, viimane <c3/>, riba arvude, madalaima ja lõppskoori ning esimese untrusted aja kokkuvõte). Vastuvõtja aega ei võrrelda hostikellaga. Pikaajaline reaalajarežiim (sokklid, lisatav fail, värav) kuulub binaarfailile.

# text
# c1: [platform] kind = "vessel"
# c2: [log]
seg-d971dae93784 = Mõlemad vajavad seanssi koos <c1/>; selle tabel <c2/> on valikuline.

# text
seg-870fece8026e = Käivita reaalajas

# text
# c1: session.toml
# c2: [platform]
# c3: kind = "vessel"
# c4: [log]
# c5: stty
# c6: cat
seg-c132d449414f = Seanss on sama <c1/> nagu pakkjooksul, koos tabeliga <c2/>, mis deklareerib <c3/>; selle tabelit <c4/> ei ole vaja. Jadaporte ei avata veel otse: lugege porti tööriistaga, mida te juba kasutate (<c5/> ja <c6/>, terminaliserver, multiplekser) ja suunake või edastage see. Otsene jadasisend võib tulla hiljem.

# text
seg-13a043c1ce60 = Iga lõpetatud epohh kirjutab standardväljundisse ühe JSON-rea:

# text
# c1: state
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: [score]
# c7: score
# c8: deductions
seg-b1f0c563c94d = <c1/> on <c2/>, <c3/>, <c4/> või <c5/> (skoori riba, servadega seansi tabelis <c6/>); <c7/> puudub kalibreerimise ajal; <c8/> loetleb, millised kontrollid võtsid punkte maha ja kui palju, suurim esimesena.

# text
seg-9b21238a7dc1 = JSON-ridade skeem (versioon { "1.1" })

# text
seg-79306ff2d878 = Üks JSON-objekt lõpetatud epohhi kohta, võtmed selles järjekorras:

# text
seg-a129b9e613d0 = Tüüp

# text
seg-bbcdd898d24d = täisarv

# text
seg-96958263575f = teatatud epohhide arv, alates { "1" }

# text
seg-16022703e1c0 = arv

# text
seg-95dde7698840 = sekundid voo esimesest epohhist

# text
# c1: hh:mm:ss.mmm UTC (date not in log)
seg-dee4f7b91079 = epohhi aeg nii, nagu voog seda väidab (ISO-8601 UTC koos kuupäevaga, kui RMC on nähtud, muidu <c1/>)

# text
seg-0361f40a8e59 = arv või null

# text
# c1: note
seg-c2418289d966 = { "0" } kuni { "100" }, üks komakoht; null kalibreerimise ajal või kui <c1/> ütleb, miks ühtki ei saanud toota

# text
seg-00575e5df2e1 = massiiv

# text
# c1: {"monitor": string, "ratio": number, "points": number, "class": string}
# c2: ratio
# c3: class
# c4: geometry
# c5: environment
# c6: inconsistency
seg-54c1f879643b = <c1/>, suurimad punktid esimesena; <c2/> on statistik läve kohal (alarm väärtusel { "1" } või rohkem); loetletud on ainult seired, mis punkte maksid; <c3/> <em>(lisatud versioonis { "1.3" })</em> on <c4/>, <c5/> või <c6/>

# text
seg-24d178dfb34f = sõnede massiiv

# text
seg-30948e769405 = seired, mis on oma läve tasemel või kohal

# text
# c1: off
# c2: passed
# c3: withheld
seg-fb08af60656f = <c1/>, <c2/> või <c3/>

# text
seg-495aa49df7e2 = miks skoori ei toodetud (näiteks deklareeritud suunasensor puudub)

# text
seg-3dabfd59cf4b = objekt või null

# text
# c1: {"lat_deg", "lon_deg", "height_m"}
seg-9395d2543ac0 = <em>(lisatud versioonis { "1.1" })</em> asukoht, mille vastuvõtja sellel epohhil teatas, <c1/> (kõrgus ellipsoidaalne, kui lause annab geoidi eraldumise, muidu keskmise merepinna kohal); null, kui vastuvõtja ei andnud ühtki, sealhulgas kalibreerimisepohhidel ilma lahendita

# text
seg-3af4806d7d74 = <em>(lisatud versioonis { "1.2" })</em> mis see tarkvara on ja mis mitte: nõuandev, mitte tüübikinnitust omav navigatsiooniseade, operaator jääb vastutavaks

# text
# c1: status
# c2: good
# c3: degraded
# c4: unknown
# c5: reasons
# c6: few-satellites
# c7: high-pdop
# c8: high-hdop
# c9: sky-blocked
# c10: source
# c11: derived
# c12: reported
# c13: none
# c14: n_used
# c15: hdop
# c16: pdop
# c17: vdop
# c18: open_fraction
# c19: max_azimuth_gap_deg
# c20: age_s
# c21: reported_hdop
# c22: reported_derived_mismatch
# c23: note
# c24: in_view
# c25: signal_loss
# c26: environment
# c27: label
# c28: good
# c29: fair
# c30: poor
# c31: unknown
# c32: poor
# c33: RECEIVER-TRUST.md
seg-79adcc5ee873 = <em>(lisatud versioonis { "1.3" })</em> satelliidigeomeetria: <c1/> (<c2/>, <c3/>, <c4/>, kui voos puuduvad GSV kõrgusnurgad ja asimuudid ning GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satelliidid vaateväljas, kuid mitte jälgitud, kui vaatevälja DOP on hea: geomeetria mahaarvamine on siis <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: alati teatatud, mitte kunagi hinnatud; skoor arvab maha ainult väärtuse <c32/> eest) (vt <a1><c33/></a1>)

# text
# c1: cn0-drop
# c2: agc
# c3: jam-ind
# c4: loss-of-lock
# c5: position-jump
# c6: raim
# c7: clock
# c8: solve-failure
# c9: kinematic
# c10: heading-course
# c11: speed-log
# c12: sea-level
# c13: cn0-spread
# c14: cn0-rise
# c15: time-consistency
# c16: osnma
# c17: geometry
# c18: $PKSHT
# c19: position
# c20: advisory
# c21: geometry
# c22: class
seg-fc212411bf3c = Seirete nimed (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> ja versioonist { "1.3" } <c17/>. Hilisemates versioonides võidakse lisada uusi nimesid; tarbijad peaksid tundmatut seirenime käsitama seirena. Allpool olev <c18/> paigutus kannab oma esimeses väljas vormingu versiooni; see JSON-skeem on versioon { "1.3" }: { "1.1" } lisas <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> lõppu ja <c22/> igasse mahaarvamisse, ning see muutub ainult võtmete lisamisega lõppu.

# text
seg-0019bf7fbfcd = Autentimissisend

# text
# c1: osnma
# c2: MarineObs::sat_auth
# c3: (satellite, status)
# c4: Authenticated
# c5: Failed
# c6: Unavailable
# c7: MarineObs::osnma
# c8: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c9: $PKSOS,A,E11:A,E19:F
seg-39b3dfbd97cc = Seire <c1/> võtab satelliidipõhise autentimisoleku autentimisallikalt väljas <c2/> (loetelu <c3/>, olek <c4/>, <c5/> või <c6/>), üldise <c7/> kõrval. NMEA poolel kannab sama <c8/>, näiteks <c9/>. Iga ebaõnnestumine, üldine või ühel satelliidil, annab seirele alarmi ja maksab selle kogu kaalu (sellele antakse suhe { "1.5" }); edu ei ole tõend. Kshana ei kontrolli siin midagi: allikas, mis seda teeb, vastutab oma teatatud oleku eest.

# text
# c1: [live] idle_flush_s
# c2: calibration_s
# c3: time-consistency
# c4: calibration_s
seg-8ffc94901796 = Epohh on lõpetatud, kui saabub järgmine ajastatud lause; aeglasemate või sünkroniseerimata instrumentide laused (güroskoop mõni kümnendiksekund vastuvõtjast maas), mis saabuvad enne seda, kuuluvad sellele. Kui voog seisab <c1/> (vaikimisi { "1.5" } s, seadke see pikima vahe kohale teie vastuvõtja ajastatud lausete vahel), lõpetatakse epohh sellisena, nagu see on. Voo esimesed <c2/> sekundit moodustavad lähtetaseme ja neid ei hinnata kunagi, nii et <b>voog, mida spuufitakse juba esmakordsel ühendamisel, ei oma puhast lähtetaset</b>: käivitage kiht enne reisi või kui lahend on teadaolevalt hea. Kalibreerimisaken sulgub üks kord, saabumise järgi: epohh, mille aeg on varasem juba nähtud ajast (tagasikerimine, voo alguse kordusesitus), ei ole kunagi kalibreerimine, mida iganes selle aeg ütleb; seda hinnatakse täieliku <c3/> mahaarvamisega, mis on untrusted. Reaalajamootor hindab iga epohhi kalibreerimisepohhide ja voo viimase minuti või umbes üle, seega selle maksumus epohhi kohta kasvab väärtusega <c4/> korrutatuna epohhisagedusega; hoidke aken kiire vastuvõtja korral lühike. Selle puhvrid on piiratud (ajastatud lauseta ridade üleujutus lõpetatakse iga { "5,000" } rea järel, kalibreerimine ja ajalugu on piiratud { "20,000" } epohhiga).

# text
# c1: --replay
# c2: --file
# c3: --follow
# c4: --file ... --follow
seg-2ef5aad7c750 = Vastuvõtja aega võrreldakse ka selle arvuti monotoonse kellaga, mis tähendab midagi ainult reaalajas saabuva voo puhul. Salvestatud logi, mida söödetakse täiskiirusel läbi stdin-i, TCP või UDP, vallandab selle kontrolli konstruktsiooni tõttu: andke <c1/>. (<c2/> ilma <c3/> eeldab seda juba.) <c4/> loetakse kordusesitusena, kuni see on loetud lõpuni, ja hostikell kaasatakse sellest alates, nii et mahajäämus ei loeta kellaveaks; kontroll vajab siis kalibreerimisakent veel avatuna (muidu puudub tal lähtetase ja see ei tööta).

# text
# c1: --udp <port>
# c2: --udp <addr>:<port>
seg-a06e58b2cfc8 = Voo lõpud ja rikked: stdin ja fail, mis loetakse lõpuni, lõpevad tavapäraselt (väljumiskood { "0" }). TCP ühendus, mille partner sulgeb, ei ole tavapärane lõpp voole, mis peaks jätkuma: kiht väljub nullist erineva koodiga pärast kõige saadud hindamist ja kirjutamist ning ei ühendu uuesti, seega käivitage see järelevaataja all, mis selle taaskäivitab. UDP datagrammid, mis lause poolitavad, ühendatakse; stdin-i, faili ja TCP lugejaid toetab piiratud järjekord, mis surub saatjale tagasi (midagi ei lähe kaotsi), samas kui UDP, mis ei saa tagasi suruda, jätab maha datagrammid, mida mootor vastu võtta ei suuda, ja ütleb seda stderr-is. <c1/> seob loopback-aadressi; andke <c2/> mujal kuulamiseks (prinditakse hoiatus).

# text
# c1: $PKSHT
seg-0a0ed5e74ea4 = <c1/>: omandiõigusega lause

# text
# c1: --pksht <path|->
seg-71ccf4a80c99 = Iga epohh toodab ka ühe NMEA { "0183" } lause kehtiva kontrollsummaga, mille <c1/> kirjutab faili või stdout-i ja mille värav sisestab edastatavasse voogu:

# text
# c1: 1
seg-df9382f4b055 = <c1/>: vormingu versioon

# text
# c1: hhmmss.ss
seg-6986879f86fb = epohhi UTC-aeg, <c1/>; tühi, kui voog ei andnud ühtki

# text
seg-34418696f9d2 = usaldusskoor { "0" } kuni { "100" }, üks komakoht; tühi kalibreerimise ajal või kui ühtki ei saanud toota

# text
# c1: C
# c2: N
# c3: D
# c4: U
seg-0b249ba73868 = riba: <c1/> calibrating, <c2/> nominal, <c3/> degraded, <c4/> untrusted

# text
# c1: -
# c2: P
# c3: W
seg-281aba68405a = värav: <c1/> off, <c2/> passed, <c3/> withheld (lahend märgiti edastatud tsüklis kehtetuks)

# text
# c1: monitor:points
# c2: /
seg-f306c3f54a48 = kuni kaks põhjust, <c1/> ühendatud märgiga <c2/>; tühi, kui midagi ei arvatud maha

# text
# c1: P
# c2: KSH
# c3: T
# c4: $PKSHT
seg-4bee29dfe578 = Aadress on <c1/> + tootja mnemoonika <c2/> + <c3/>. Seade, mis omandiõigusega lauset ei tunne, ignoreerib seda. Kshana ignoreerib sisendis oma <c4/>.

# text
seg-d75c9da94f37 = Värava režiim

# text
# c1: --gate
seg-30c1f4a5706c = <c1/> paneb Kshana vastuvõtja ja seadme vahele, mis selle lahendit kasutab (kaardisüsteem, kursijuhtimissüsteem). NMEA voog läheb sisse, tuleb välja stdout-is ja on:

# text
# c1: $PKSHT
seg-aa0692146620 = <b>muutmata läbi lastud</b>, kuni epohh ei ole untrusted (ja kalibreerimise ajal), koos <c1/> iga lausetsükli järel; ja

# text
# c1: 0
# c2: V
# c3: N
# c4: V
# c5: N
# c6: V
# c7: N
# c8: N
seg-bbdd68edbb17 = <b>märgitud kehtetuks</b>, kuni see on untrusted: GGA kvaliteet <c1/>; RMC olek <c2/> (ja selle režiiminäidik <c3/> ning navigatsiooniolek <c4/>, kus see on olemas); GNS-i režiim <c5/> igas positsioonis; GLL-i olek <c6/> ja režiim <c7/>; VTG režiim <c8/>, kus see on. Asukohaväljad jäetakse sellisteks, nagu need olid: mõte on selles, et seade näeb vastuvõtjat ennast lahendit kehtetuks kuulutamas ja tõstab oma alarmi. Iga ümber kirjutatud lause kontrollsumma arvutatakse uuesti.

# text
# c1: [live] gate_release_s
# c2: --json <path>
seg-23ee46747297 = Kord kinni hoitud lahend vabastatakse alles pärast seda, kui epohhid on olnud untrusted ribast väljas <c1/> (vaikimisi { "30" } s), nii et riba servas olev skoor ei saa lahendit värelema panna. JSON-read lähevad ainult sinna, kuhu <c2/> ütleb (vaikimisi mitte kuhugi, sest voog kasutab stdout-i).

# text
seg-6b7b557a4909 = Et lasta kaardiplotteril otse ühenduda, teenindage väravdatud voogu stdout-i asemel TCP kaudu:

# text
# c1: --listen tcp:<port>
# c2: tcp:<addr>:<port>
# c3: --listen
# c4: --gate
# c5: --json -
seg-96ff51df9abe = <c1/> kuulab loopback-aadressil; <c2/> kuulab mujal (prinditakse hoiatus, sest igaüks, kes aadressini ulatub, saab voogu lugeda). Ühenduda võib suvaline arv kliente; igaüks saab sama voo alates ühendumise hetkest ja kliendid ainult loevad. Igal kliendil on oma piiratud järjekord ja kirjutaja, nii et klient, kes sammu ei pea, visatakse välja (ühendus suletakse, rida stderr-is) ega viivita kunagi teisi ega sisendit. <c3/> vajab <c4/>; stdout ei kanna siis midagi voost, seega <c5/> on vaba.

# text
seg-960e0abb0466 = Mida värav ei tee ja mida enne kasutamist teada:

# text
# c1: --gate
seg-ee3f18efa84c = See on <b>nõusolekupõhine</b>. Miski ei märgi lahendit kehtetuks, kui ei ole antud <c1/>.

# text
# c1: idle_flush_s
seg-9cd8243cb437 = See <b>lisab latentsust</b>: tsüklit hoitakse, kuni selle epohh on hinnatud, mis on aeg järgmise ajastatud lauseni (umbes üks tsükkel: sekund { "1" } Hz vastuvõtja korral) või <c1/> pärast viimast, kui voog seisab. Seade, mis vajab lauset mõne kümne millisekundi jooksul vastuvõtja väljundist, ei tohi selle taga asuda.

# text
seg-ec63f8f3230b = See on <b>ahela üksik punkt</b>: kui see peatub, peatub voog. Käivitage see järelevalve all ja otsustage ette, mida järgnev seade teeb ilma vooguta.

# text
# c1: note
seg-536e41a6a5e7 = See <b>ebaõnnestub suletuna oma rikete korral</b>: kui seired ei suuda pärast kalibreerimist skoori toota (deklareeritud suunasensor, mis ei saada midagi, liiga vähe kalibreerimisepohhe), on epohh untrusted, kannab välja <c1/> ja hoitakse kinni; vabastushoidmist ajastatakse selle arvuti kellaga, mitte vastuvõtja ajaga, mida võltsija kontrollib (kordusesituse korral on ainult vastuvõtja aeg).

# text
seg-5dd62cd853c6 = See võib <b>hea lahendi kinni hoida</b> (valehäire) nagu ka võltsitud lahendi läbi lasta (tuvastamata jäänud sündmus). Seirajad kontrollivad lahendit laeva füüsika ja selle teiste sensorite vastu; võltsingut, mis on kõigiga kooskõlas, ei märgata (vt allpool olevaid piiranguid).

# text
# c1: $PKSHT
seg-a284a3ec9dfe = See eeldab <b>puhast NMEA { "0183" } tekstivoogu</b>. Voogu segatud binaarkaadrid edastatakse muutmata, kuid <c1/> võib siis sattuda kaadri baitide vahele.

# text
seg-0c919698fa92 = See ei ole <b>tüübikinnitust omav</b> ja midagi selles ei ole hinnatud standardi IEC { "61108" } või IEC { "61162" } vastu. Laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
seg-9e3ea39c38cf = <s1>Eelmine</s1>Vastuvõtja usaldus

# text
seg-136da5c10b2d = <s1>Järgmine</s1>NMEA treeningvood

# text
seg-990a49527516 = $PKSHT: omandiõigusega lause
