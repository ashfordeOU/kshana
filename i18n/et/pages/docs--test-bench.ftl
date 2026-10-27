# docs--test-bench: translations (et)

# text
seg-245fe1f87b08 = Fail

# text
seg-e305279d5b11 = Sisu

# text
# c1: docs/TEST-BENCH.md
seg-292871e5747d = Source: <c1/>

# text
seg-d18a29239225 = Vastuvõtja käitamine eksporditud stsenaariumi vastu

# text
# c1: kshana receiver-trust
seg-aa3498c7cb16 = Vastuvõtjatootja, kellel on laboratoorne GNSS simulaator, saab selle kaudu taasesitada Kshana stsenaariumi sõiduki liikumise, salvestada, mida katsetatav vastuvõtja teeb, ja hinnata seda logi käsuga <c1/> enne käivitust esitatud sündmuste vastu. Kshana annab liikumise, sündmuste ajad ja hindamise. See kirjutab <b>ühtegi signaali ei</b>: miski siin eksporditu ei sünteesi, modelleeri ega edasta raadiosageduslikku ega baasriba lainekuju ning eksporditud sündmus on sildistatud ajavahemik, mitte retsept häire tekitamiseks. Simulaator ja selle operaator annavad signaalid ning operaator vastutab selle eest, et neid käitatakse ainult seal, kus see on lubatud (juhtmega või varjestatult, simulaatori enda ohutusjuhiste järgi).

# text
seg-414c7774d133 = See leht on meetod. See ei avalda tulemusi.

# text
seg-a0ad7b35922f = { "1" }. Eksport

# text
# c1: gnss-ins
# c2: jamming
# c3: gnss-sim
# c4: jamming
# c5: --epoch
# c6: YYYY-MM-DDTHH:MM:SS
# c7: Z
seg-798d75d3b65c = Kehtib liigile <c1/> (sõiduprofiil asendiga; navigatsiooniseisundi katkestused on sündmused) ning liikidele <c2/> ja <c3/> (paigalseisev vastuvõtja stsenaariumi kestuse jooksul; stsenaariumi <c4/> segaja on üks sündmus kogu käivituse jooksul). Teised liigid ütlevad, miks neil sõiduki trajektoori ei ole. <c5/> on liikumise nullaja UTC hetk (vaikimisi 2024-01-01T00:{ "00" }:00Z); stsenaariumidel ei ole sõiduki liikumise jaoks oma kalendrikuupäeva. See peab olema tegelik UTC hetk, <c6/> (lõpetav <c7/> on lubatud), aastaga vahemikus { "2000" } kuni { "2099" } ja iga väli vahemikus; kõik muu lükatakse tagasi. Väljund on sama stsenaariumi ja epohhi korral bait-baidilt identne.

# text
# c1: time_s
# c2: x_m,y_m,z_m
# c3: vx_m_s,vy_m_s,vz_m_s
# c4: lat_deg,lon_deg,h_m
# c5: heading_deg,pitch_deg,roll_deg
# c6: utc
# c7: kshana_row
seg-c153d8ef8735 = üks rida näidise kohta: <c1/>, Maaga seotud <c2/>, <c3/>, geodeetiline <c4/>, <c5/>, <c6/>, <c7/>

# text
seg-fa4c8c0d2b72 = selle CSV epohh, raamistikud, ühikud, veerud ja edasi-tagasi tolerantsid

# text
# c1: GGA
# c2: RMC
seg-8c74ca211e3a = NMEA { "0183" } laused <c1/> ja <c2/> näidise kohta, koos kontrollsummadega

# text
# c1: RESOLUTION: <ms>
# c2: longitude,latitude,altitude
seg-2b0fd541f1dc = <c1/> rida ja siis <c2/> read (kirjutatakse ainult siis, kui iga näidiste intervall on sama täisarv millisekundeid; kui see on välja jäetud, ütleb käsk põhjuse standardveas)

# text
# c1: [[events]]
# c2: receiver-trust
seg-d09d2dab9a17 = samad sündmused <c1/> plokkidena stsenaariumi <c2/> jaoks

# text
# c1: kshana.test-conditions/1
# c2: receiver-log
# c3: recording.path
# c4: recording.sha256
# c5: receiver.*
# c6: type
seg-866a3c4870af = käivitus dokumendina <a1><c1/></a1> salvestuse <c2/> jaoks: sündmused öeldud tõena, kusjuures <c3/>, <c4/>, <c5/>, iga sündmuse <c6/> ja võimsus jäetakse laboratooriumile täitmiseks

# text
seg-9ea6a94d4586 = Raamistikud ja kokkulepped

# text
# c1: x
# c2: z
# c3: lat_deg
# c4: lon_deg
# c5: h_m
# c6: h_m
seg-8d3b7d2ef815 = <b>Asukoht:</b> WGS { "84" }, Maaga seotud (ECEF: <c1/> läbi ekvaatori peameridiaanil, <c2/> läbi pooluse); <c3/>, <c4/>, <c5/> annavad sama asukoha geodeetiliselt, <c6/> ellipsoidi kohal.

# text
seg-93a2975d2a19 = <b>Kiirus:</b> Maaga seotud teljed, Maa suhtes.

# text
# c1: heading_deg
# c2: pitch_deg
# c3: roll_deg
seg-be05c2278e98 = <c1/> kellaosuti suunas tõelisest põhjast vahemikus [{ "0" }, { "360" }), <c2/> nina üles positiivne, <c3/> parem tiib alla positiivne; kursi-tõusunurga-ristlemise (3-2-1) järjekord kohalikust põhja-ida-alla raamistikust keha telgedeni x ette, y paremale, z alla. Paigalseisev allikas kirjutab nullid. NMEA ja teekonnapunktide tekst asendit ei kanna.

# text
# c1: gnss-ins
# c2: automotive-urban-canyon
# c3: RMC
# c4: atan2(v_east, v_north)
seg-3c3ad1295628 = <b>Kurss on keha pööre ümber vertikaaltelje, mitte liikumissuund.</b> Sõiduprofiilis <c1/> pöörleb keha ruutlainena, samal ajal kui kiirus järgib, nii et kurss ja maapealne liikumissuund võivad erineda kümnete kraadide võrra (kuni umbes { "77" } kraadi kaasasolevas stsenaariumis <c2/>). NMEA <c3/> kurss on maapealne liikumissuund, kiirusvektori suund, seega näevad simulaator, mis loeb kursi liikumisfailist, ja simulaator, mis loeb kursi NMEA failist, erinevaid nurki. CSV maapealne liikumissuund on selle kiiruse <c4/>, pööratud põhja-ida-alla raamistikku.

# text
# c1: gnss-ins
# c2: h_m
# c3: automotive-urban-canyon
seg-224b53995157 = <b>Kõrgus järgib stsenaariumi.</b> Stsenaariumi <c1/> puhul on <c2/> liigi enda puutujatasandil sammutamine selle tõe osas ja seda ei hoita konstantsena (umbes { "7" } m stsenaariumi <c3/> { "180" } s jooksul); see on stsenaariumi liikumine, kirjutatud sellisena, nagu see on.

# text
# c1: GGA
seg-f78a354f96ee = <b>NMEA <c1/> kohatäited.</b> Fiksi kvaliteet ({ "1" }), kasutatud satelliidid ({ "12" }) ja HDOP ({ "1.0" }) kirjutatakse ainult selleks, et lause oleks korrektselt vormistatud. Need ei ütle midagi stsenaariumi geomeetria ega ühegi vastuvõtja oleku kohta.

# text
# c1: time_s
seg-f5cd510aac0c = <c1/> pärast epohhi, UTC, liigsekundeid ei modelleerita.

# text
# c1: GGA
seg-d2a2f655760d = <b>NMEA kõrgused on ellipsoidsed.</b> <c1/> kõrgus sisaldab ellipsoidset kõrgust ja geoidi eraldust kirjutatakse väärtusena { "0.0" }. Simulaator, mis käsitleb kõrgust kui kõrgust keskmisest merepinnast, paigutab sõiduki kohaliku geoidi lainetuse võrra valesti.

# text
seg-ee3a9a3ec84d = <b>Edasi-tagasi tolerantsid</b> (testitud iga faili tagasi lugemisega): CSV asukoht { "0.1" } mm, laius- ja pikkuskraad { "1e-9" } kraadi, kiirus { "0.1" } mm/s, nurgad { "1e-6" } kraadi; NMEA horisontaalne asukoht { "5" } mm, kõrgus { "1" } mm, kiirus { "0.001" } sõlme, kurss { "0.001" } kraadi.

# text
seg-a554992d2694 = Failide laadimine simulaatorisse

# text
seg-757382614413 = Laboratoorsed simulaatorid erinevad ja see hoidla ei reprodutseeri ühegi simulaatori kasutusjuhendit. Kontrollige, milliseid ülaltoodud vorminguid teie oma loeb, ja selle esitatud nõudeid:

# text
# c1: gnss-ins
# c2: [time] step_s
seg-cc49ceccea20 = Paljud liikumisimportijad eeldavad fikseeritud uuendussagedust, tavaliselt { "10" } Hz. Stsenaarium <c1/> sammub { "0.1" } s sammuga; paigalseisva stsenaariumi puhul määrata <c2/> sagedusele, mida teie simulaator soovib.

# text
seg-e98bf4bf6c6e = Mõned importijad jätavad vahele näidised, mis jäävad täissekundite vahele, või ignoreerivad ajaveergu ja kasutavad ridade järjekorda. Alustada liikumist täissekundil ja hoida ruudustik korrapärane.

# text
# c1: run1.motion.csv
# c2: run1.motion.json
seg-3c470262eb15 = CSV importija, mis laseb veerge vastendada, saab lugeda faili <c1/> otse: valida Maaga seotud või geodeetilised veerud ja määrata nende ühikud failist <c2/>. Kümnendkohtade kärpimine tekitab valekiirendust, seega säilitada kirjutatud täpsus.

# text
# c1: run1.events.csv
seg-41a2bfe45b37 = Fail on ainult liikumine. Konstellatsioon, häire ja vastuvõtja esiots seadistatakse simulaatoris ning ajastatakse failis <c1/> olevate sündmustega.

# text
seg-024ab011a2e3 = Kshana ei kirjuta ühtegi tarnija skriptiliidest.

# text
seg-6d67d4e2cdf0 = Kontrollitud ühe avatud lähtekoodiga simulaatori lugejatega

# text
# c1: tests/testbench_gpssdrsim_oracle.rs
# c2: xval/testbench-gpssdrsim/PREREGISTRATION.md
seg-e4ce0597a644 = Programmi gps-sdr-sim (MIT, commit 28ca29a6) liikumislugejatele anti kaheksa kaasasoleva stsenaariumi eksport. Iga lugeja tagastas eksporditud trajektoori (<c1/>, eelregistreeritud failis <c2/>):

# text
seg-3caed3fc2e47 = gps-sdr-sim valik

# text
seg-ad9e78555851 = Anda sellele

# text
seg-4f9be75880d3 = Halvim erinevus CSV-st

# text
# c1: -g
seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

# text
# c1: run1.nmea
seg-e03dd1d45ced = <c1/> nagu kirjutatud

# text
seg-8d28fbcc4c4a = { "1.2" } mm

# text
# c1: -x
seg-fd39660fcb73 = <c1/> (aeg, laius, pikkus, kõrgus)

# text
seg-c4e171cbf0de = { "0.15" } mm

# text
# c1: -u
seg-390b0c0fb695 = <c1/> (aeg, x, y, z)

# text
seg-ff26559a85e8 = täpne

# text
# c1: -u
seg-f4c13a327904 = Ärge andke käsule <c1/> täielikku liikumise CSV-d. Selle lugeja hoiab { "100" } märki rea kohta ja CSV rida on umbes { "160" } märki, nii et iga rida loetakse kahe näidisena. Päiserida loetakse veel üheks näidiseks, milles pole numbreid.

# text
# c1: gnss-ins
# c2: gnss-ins-maritime
seg-43cc6f9c50b2 = gps-sdr-sim hoiab kuni { "3000" } näidist, { "300" } s selle fikseeritud { "10" } Hz juures, ja ignoreerib ajaveergu. Eksport <c1/> sammub täpselt { "0.1" } s sammuga. Pikemad stsenaariumid, näiteks 20-minutiline <c2/>, loetakse ainult nende esimese { "300" } s ulatuses.

# text
seg-500243b6e402 = See kontrollib, et failid loetakse sellisena, nagu need on kirjutatud. See ei kontrolli stsenaariumi füüsikat ega midagi, mida simulaator edastab.

# text
seg-a4c4514276e9 = { "2" }. Öelda enne käivitust, mida hinnata

# text
# c1: run1.events.toml
# c2: receiver-trust
seg-3a3e2be36c65 = Sündmuste fail annab stsenaariumi defineeritud intervallid. Kopeerida <c1/> stsenaariumisse <c2/>, lisada kõik prognoosid, mida soovite kontrollida, ning fikseerida monitooride läved ja tolerantsid <b>enne</b> vastuvõtja käivitamist. Neid ei tohi pärast logi nägemist kohandada; stsenaarium, läved ja logi SHA-256 on kõik tulemuse räsis.

# text
# c1: jamming
# c2: jamming
# c3: other
# c4: kind
seg-d07b9ad8cfa9 = Eksporditud sündmused kannavad stsenaariumi enda liiki: stsenaariumi <c1/> segaja on <c2/>; navigatsiooniseisundi katkestus on <c3/>, sest stsenaarium väidab, et GNSS ei olnud saadaval, mitte kuidas. Muuta stsenaariumi <c4/>-id vastavaks sellele, mida simulaatoris seadistate.

# text
seg-faa87b3ba315 = { "3" }. Käivitada vastuvõtja

# text
seg-0a3b63cf5615 = Käivitada vastuvõtja ja selle logija, käivitada simulaatori stsenaarium liikumisfailiga ning lasta käivitusel katta kalibreerimisintervall, iga sündmus ja varu pärast viimast. Hoida vastuvõtja enda logi alles (UBX, RINEX { "3" } vaatlused, Androidi logija CSV või NMEA satelliidi olekulausetega). Logi, milles pole satelliidipõhist signaali tugevust, saab siiski hinnata vastuvõtja enda asukoha alusel, kuid kandja ja müra suhte monitoorid vajavad seda.

# text
seg-fbbc12dfeb3f = { "4" }. Joondada kellad

# text
# c1: receiver-trust
# c2: d
# c3: d
# c4: onset_s
# c5: end_s
# c6: name
seg-5828311af3d4 = <c1/> loeb sündmuste aegu vastuvõtja logi esimesest epohhist; liikumisfail loeb oma esimesest näidisest. Kui logi algab <c2/> sekundit enne liikumise esimest näidist, lisada <c3/> igale <c4/> ja <c5/>. Salvestada nihe ja kuidas seda mõõdeti ning märkida see stsenaariumi <c6/> või kommentaari, sest vale nihe liigutab iga hinnet. Ainult sündmuste ajad ei ütle nihet; kasutada simulaatori stsenaariumi alguse märki või vastuvõtja enda ajatempleid.

# text
seg-22f7b68c445b = { "5" }. Hindamine

# text
# c1: bench-session.result.json
# c2: .trust.csv
# c3: .trust.svg
# c4: detected
# c5: late
# c6: missed
# c7: not-evaluable
seg-e024186a2874 = kirjutab <c1/>, <c2/> ja <c3/>. Iga sündmuse kohta annab tulemus valehäired enne algust, esimese häire ja selle monitoorid, latentsuse ning tulemuse (<c4/>, <c5/>, <c6/>, <c7/>), pluss prognoositud ja vaadeldud kandja ja müra suhte languse, kui te prognoosi esitasite. Lahknevust raporteeritakse, seda ei häälestata kunagi ära. Vt <a1>RECEIVER-TRUST.md</a1>.

# text
seg-5fa1e4890f91 = Et näha, milliseid avalikke raamistiku ridu seanss toetab tõendeid (supports evidence for):

# text
seg-abc6aaf44c95 = Vt <a1>compliance/README.md</a1>. See aruanne kirjeldab tõendeid käivitustes, mille te sellele annate; see ei tee ühtegi järeldust vastuvõtja ega ühegi raamistiku kohta.

# text
seg-69fa39640c2d = { "6" }. Edasi-tagasi tsükli sidumine ühes allkirjastatud paketis

# text
# c1: kshana evidence round-trip
# c2: run1.conditions.json
seg-f24e2dd64c47 = Pärast hindamist seob <c1/> neli kirjet kokku: eksporditud stsenaarium, laboratooriumi <a1>katsetingimused</a1>, vastuvõtja logi ja hinne. Täita <c2/> (logi tee ja SHA-256, katsetatav vastuvõtja, iga sündmuse tüüp ja esitatud võimsus), seejärel:

# text
# c1: round-trip-pack/config.json
# c2: round_trip
# c3: kshana.round-trip/1
# c4: scenario_sha256
# c5: conditions_hash
# c6: log_sha256
seg-78bed55de550 = <c1/> kannab plokki <c2/> (<c3/>) koos <c4/>, <c5/>, <c6/> ja hindega (tuvastatud sündmused hinnatavatest, esimene häire), mida katavad manifesti räsid ja allkiri. Käsk lükkab tagasi paketi, mille tingimused ja hindamissündmused lähevad vastuollu või mille esitatud logi räsi ei ole logi oma. Nagu iga tõendipakett, on see tehniline kirje, mitte õiguslik arvamus.

# text
seg-5fe6548911da = Läbitöötatud näide: gps-sdr-sim kirjutab faili

# text
seg-eeccc823e109 = See näide kasutab avatud lähtekoodiga simulaatorit gps-sdr-sim ainult selleks, et <b>kirjutada baasriba fail</b> eksporditud liikumisest. Kshana ei edasta ning miski sellel lehel ei automatiseeri selle faili taasesitamist raadio kaudu. Kui teie laboratoorium esitab sellise faili vastuvõtjale, on see teie operaatori vastutus ja seda tehakse ainult seal, kus see on lubatud (kaabliga või varjestatult, simulaatori ja raadio enda ohutusjuhiseid järgides), ning Kshana seda ei dokumenteeri ega mähi.

# text
# c1: run1.iq
# c2: tests/round_trip_pack.rs
seg-db81fdadfd19 = Mida laboratoorium siis ka failiga <c1/> ei teeks, toimub väljaspool Kshanat. Vastuvõtja enda logi, olenemata sellest, kuidas see saadi, on see, mida samm { "5" } hindab ja samm { "6" } seob. Kshana enda eksportide failid ja kontrollid on testitud ainult sünteetilistel andmetel (<c2/>); siin ei väideta ühtegi laboratoorset käivitust.

# text
seg-dffcbdb8e6c3 = Mida see meetod ei tee

# text
seg-d0b62c238953 = See ei tekita signaali ega ütle, millist häiret simulaator peaks genereerima. Sündmused ütlevad, millal, mitte mida.

# text
seg-3aa11bed60c8 = Üks seanss on üks andmepunkt. Tulemus kirjeldab seda logi selle konfiguratsiooni all ega ütle midagi teiste vastuvõtjate, püsivara, antennide ega tegeliku häire kohta.

# text
seg-b156403456e4 = Kõrguseid, kiirusi ja ajajoondust peab operaator simulaatori suhtes kontrollima; eksport esitab oma kokkulepped ja tolerantsid ega rohkemat.

# text
seg-337ff53bc890 = <s1>Eelmine</s1>kshana-bench

# text
seg-87be81f5e600 = <s1>Järgmine</s1>Compliance-vastendus
