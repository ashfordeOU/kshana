# docs--observatory-method: translations (et)

# text
seg-0857a94a948e = Piirangud

# text
seg-2247a2344710 = Tähendus

# text
seg-b652b86e6b8e = Olek

# text
# c1: docs/observatory/METHOD.md
seg-7ca62fa39e10 = Allikas: <c1/>

# text
seg-48e063b567d0 = Häirevaatluskeskus: meetodi märkus

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-d0e1d6cadc10 = Versioon <c1/>, ehitatud versioonil <c2/>. Ainult nõuandev: see on kirjeldus sellest, kuidas avaldatud asukohateated minevikupäevadel välja nägid, mitte ühegi vastuvõtja mõõtmine, prognoos, häire kinnitus ega selle põhjuse omistamine.

# text
seg-c5eab49b8d6f = Mida vaatluskeskus avaldab

# text
seg-165ae7646608 = Üks toode UTC päeva ja piirkonna kohta, ühest avatud õhusõidukite asukohaarhiivist. Fikseeritud 0,5-kraadise laius-pikkuskraadi ruudustiku iga lahter on ühes <b>kolmest olekust</b>:

# text
seg-cc07647eb12e = Lahtris valimisse sattunud õhusõidukite suur osa teatas sel päeval madalast navigatsioonitäpsusest, selgelt üle selle päeva tausta.

# text
seg-3e1dd7caaee6 = Õhusõidukeid valiti piisavalt ja osa ei täitnud reeglit.

# text
# c1: insufficient_sample
# c2: no_day_background
# c3: day_wide_effect
seg-8f0d9ad60d62 = Andmed ei võimaldanud otsust langetada. See <b>ei ole</b> „selge“. Iga selline avaldatud lahter kannab andmepõhjust: <c1/>, <c2/> või <c3/>. Lahtrit, millel pole üldse kirjet, nägi alla { "5" } erineva õhusõiduki ja see jäetakse avaldamata.

# text
seg-e49e05b47061 = Midagi muud ei avaldata: ei põhjust, ei osalejat, ei õhusõidukipõhist kirjet. Põhjused kirjeldavad, kas päeva andmeid oli piisavalt, mitte kunagi seda, miks täpsus oli madal.

# text
# c1: kshana interference-map daily
seg-7b251c7860e0 = Kolm faili päevas (<c1/>):

# text
# c1: observatory-adsb-<dataset>-<day>.geojson
# c2: schema
# c3: kshana-observatory-day/1
seg-2008b0ba6ac7 = <c1/>: lahtrid koos <c2/> <c3/>, meetod ja selle eelnevalt registreeritud parameetrid, litsents ja viitamine, avaldamisreegel ning märkus.

# text
# c1: observatory-adsb-<dataset>-<day>.png
seg-7d5b16eac4a3 = <c1/>: samad lahtrid pildina (halvenenud, mitte halvenenud, mitte vaadeldud on viirutatud; tühje lahtreid ei vaadeldud). Faili tekstiosad kordavad märkust ja litsentsi.

# text
# c1: observatory-adsb-<dataset>-<day>.incidents.json
# c2: schema
# c3: kshana-incident-report/1
# c4: cause
# c5: not attributed
seg-b76d2e071b16 = <c1/>: <c2/> <c3/>. Kokkupuutuvad halvenenud lahtrid (diagonaalid kaasa arvatud) moodustavad ühe intsidendi koos piirdekasti ja selle lahtritega. <c4/> on fikseeritud tekst <c5/>. Fail on sisend aruande, kinnituse ja teavitamise tsüklile (lennunduse aruandlustsükkel, mis lõpeb NOTAM-iga); see ei ole kinnitus ega NOTAM.

# text
# c1: .manifest.json
seg-49b7bdae0d6e = ja <c1/> koos kolme faili baidiarvu ja SHA-256-ga, meetodi id, sisendloendurite (loetud ja välja jäetud read) ning andmekogumi plokiga, et toodet saaks kontrollida ja reprodutseerida.

# text
seg-d7bb390fb986 = Avaldamisreeglid (jõustab käsk)

# text
# c1: --delay-hours
seg-87147317f8da = <b>Vähemalt { "24" } h viivitus.</b> Päeva toode avaldatakse mitte varem kui selle UTC päeva lõpp pluss <c1/> ({ "24" } või rohkem; väiksem väärtus lükatakse tagasi). Käsk keeldub päevast, mida ei saa veel avaldada, ja nimetab varaseima aja. Selle lühendamiseks puudub lüliti.

# text
seg-43960c3f9b6c = Jämedad lahtrid.

# text
# c1: --cell-deg
seg-1a5ff10e5240 = <c1/> alla { "0.5" } lükatakse tagasi.

# text
# c1: null
seg-e70d8d7f9980 = <b>Allasurumine.</b> Lahtrit, mida nägi alla { "5" } erineva õhusõiduki, ei avaldata; arv alla { "5" } on <c1/> (null kaasa arvatud), nagu põhimeetodis.

# text
seg-ab75582c5032 = <b>Omistamist ei ole.</b> Olekute ja põhjuste sõnavaral puudub põhjus; seda kinnitab test.

# text
seg-0e7d76d7efd0 = <b>Allikad.</b> Ainult adsb.lol (ODbL { "1.0" }) või kasutaja andmekogum oma litsentsiga. <b>OpenSky Network andmed lükatakse tagasi</b> (selle litsents ei luba tuletatud kaartide kommertskasutust ega levitamist). ADS-B-d ja AIS-i ei kombineerita kunagi.

# text
seg-dc28848046ac = <b>Toote litsents.</b> adsb.lol-ist tehtud lahtripõhine ADS-B fail on tuletatud andmebaas (Derived Database) ning kannab failis ODbL { "1.0" } ja adsb.lol viidet. Kshana kood jääb AGPL-3.0 alla.

# text
seg-9eeba6648fec = Vaadeldav suurus ja põhimeetod

# text
# c1: kshana-interference-map/adsb/v2
# c2: docs/INTERFERENCE-MAP.md
seg-7334dc45eb2f = ADS-B õhusõiduk teatab, kui täpseks ta oma GNSS-i asukohta peab: <b>NACp</b> (Navigation Accuracy Category for Position, { "95" } % horisontaalne piir vahemikus { "10" } NM kuni alla { "3" } m) ja <b>NIC</b> (Navigation Integrity Category, sisalduvusraadius). Põhimeetod (<c1/>, <c2/>) loendab lahtri ja päeva kohta nende <b>erinevate õhusõidukite</b> osa, kelle lahtrisisesed teated olid enamasti madala täpsusega, kaitsemeetmetega: ainult kõrgus üle { "5,000" } ft; õhusõidukit arvestatakse ainult siis, kui see teatas samal päeval mujal head täpsust (seadmete lähtetase); lahtri osa peab ületama päeva mediaanlahtri osa marginaaliga; päev, mille mediaan ise on kõrge, märgitakse segaseks ja ühtegi lahtrit ei kuulutata halvenenuks. Parameetrid fikseeriti väljade definitsioonidest ja privaatsusreeglist enne ühegi andme uurimist ning need on kirjutatud igasse väljundfaili. Vaatluskeskus lisab kolmeseisundilise sõnavara, avaldamisreeglid ja ülaltoodud failid ega muuda ühtegi parameetrit.

# text
# c1: --bbox
# c2: method.scope
seg-96cf298985c6 = <b>Piirkondlikud käitused.</b> Võtmega <c1/> loetakse ainult kasti sees olevaid teateid. Seadmete lähtetase ja päeva taust arvutatakse siis ainult kasti teadetest ning fail ütleb seda (<c2/>). Piirkondlik toode on seega selle piirkonna andmete toode, mitte globaalse toote väljalõige.

# text
seg-2e7007b56a44 = Seos NACp ja almanahhi HDOP-i meetodiga

# text
seg-4892485e534b = Pleninger, Topkova ja Steiner, „GNSS interference detection: Methodology utilising ADS-B NACp indicator and GPS almanac data“, The Aeronautical Journal { "129" } ({ "1331" }), { "206" } kuni { "223" } ({ "2025" }), doi 10.1017/aer.2024.67, võrdlevad õhusõiduki NACp-st tulenevat asukohaviga GPS-i konstellatsiooni HDOP-iga (horisontaalne täpsuse halvenemise tegur), mis on saadud almanahhi andmetest, ning märgivad õhusõiduki mõjutatuks, kui need kaks lahknevad; artikkel hindab meetodit tahtlike GPS-i segamiskatsete põhjal.

# text
seg-74ec1aca8a22 = <b>Mida kasutasime.</b> Ainult avaldatud kokkuvõtet ja bibliograafilist kirjet. Täistekst ei olnud meile kättesaadav (tasuline), seega me ei tea ei selle NACp-st veahinnanguni viivat vastendust, selle HDOP-i arvutust ega selle lävesid ning me ei väida, et neid reprodutseerime.

# text
seg-4f8471649a07 = <b>Mida vaatluskeskus selle asemel teeb.</b> Küsimus, millele almanahhi võrdlus vastab, on „kas ainuüksi konstellatsiooni geomeetria võiks seda madalat täpsust selgitada?“. Põhimeetod vastab sellega seotud küsimusele ilma almanahhita: madal osa peab silma paistma sama päeva taustast kogu piirkonnas ja õhusõiduki enda headest teadetest mujal. See on teistsugune ja nõrgem asendus: see ei saa öelda, et rahuliku geomeetriaga tund oli halvenenud, kui päeva taust on samuti madal. Almanahhi-HDOP-i hindajat <b>ei ole realiseeritud</b>. See on lahtine ülesanne, mis tuleb ehitada artikli täisteksti ja avaliku GPS-i almanahhi põhjal ning eelregistreerida enne käitamist; seni on seda viidatud, mitte väidetud.

# text
seg-e9b9902633af = Toote reprodutseerimine

# text
seg-95e48f0286d9 = Torujuhe on deterministlik kõiges, mida see avaldab (käitusepõhine identifikaatorisool muudab ainult sisemisi räsisid, mida kunagi ei kirjutata). Manifesti SHA-256 väärtused võimaldavad teist käitust võrrelda bait baidi haaval.

# text
seg-65236a42e316 = Tundlikkuse uuring

# text
# c1: kshana interference-map sensitivity <input> --dataset adsb-lol --day <day> --out report.json
# c2: docs/observatory/RESULTS.md
seg-0c843e799b8f = <c1/> taasesitab ühe päeva teateid iga eelregistreeritud parameetri ühekaupa muutmise korral (kaks väärtust kummagi kohta, pluss { "1.0" } kraadi ruudustik) ja teatab iga variandi kohta halvenenud, mitte halvenenud ja mitte vaadeldud lahtrite arvu, halvenenud hulga Jaccardi indeksi registreeritud hulgaga, lahtrid, mille olek muutus, ning halvenenud pindala. See ei muuda registreeritud reeglis midagi: variant ei ole valideeritud alternatiiv ja suur muutus parameetri all näitab, kui palju otsus sellest parameetrist sõltub, mitte seda, milline väärtus on õige. Tagantjärele kataloogi tulemused on failis <c2/>.

# text
# c1: not_observed
seg-cc57d45c4b0a = <b>Katvus.</b> adsb.lol järgib vabatahtlike vastuvõtjaid; avameri ja hõredalt kaetud õhuruum on hõredad ning <c1/> on seal tavaline. Kaart näitab oma allika katvust.

# text
seg-e3921e1eb177 = <b>Mida madal täpsus tähendab.</b> NACp ja NIC langevad muudel põhjustel kui häire: satelliidi või täiendussüsteemi katkestused, kosmoseilm, vastuvõtja või transponderi rikked ja geomeetria. Ükski olek ei viita põhjusele.

# text
seg-e5ad0dc456c0 = <b>Õhusõidukitel, mis püsivad mõjutatud piirkonnas terve päeva,</b> puudub lähtetase väljaspool seda ja neid ei arvestata, seega meetod alahindab püsivat piirkondlikku mõju. Tundlikkuse uuring näitab lähtetaseme kaitsemeetme mõju.

# text
seg-a2d41becc19b = <b>Päevapiirid</b> on UTC; keskööd ületav sündmus jagatakse kahe päeva vahel.

# text
seg-436af9f16feb = <b>Tegelik tõde puudub.</b> Vaatluskeskusel ei ole välist sõltumatut etaloni: iga arv on MODELLED ja ükski kontrollimaatriksi rida sellele ei toetu.

# text
seg-5c4966f0166d = <b>Teema tundlikkus.</b> Seda liiki kaardid on poliitilised. Vaatluskeskus esitab meetodi, viivituse ja sõnavara ning midagi muud; see ei nimeta riike ega osalejaid ja ei avalda reaalajas.

# text
seg-874f46a80c8b = <s1>Eelmine</s1>Vastuvõtja protokollid loetud

# text
seg-3137b7595e59 = <s1>Järgmine</s1>Häirevaatluskeskus: tulemused
