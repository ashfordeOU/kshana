# docs--observatory-results: translations (et)

# text
# c1: docs/observatory/RESULTS.md
seg-69304b8b186b = Allikas: <c1/>

# text
seg-df5b53307f50 = Vaatluskeskuse tulemused: 30 päeva Läänemere tagantjärele kataloog ja tundlikkuse uuring

# text
# c1: kshana-observatory/adsb/v1
# c2: kshana-interference-map/adsb/v2
seg-072bdea11014 = Versioon <c1/> versioonil <c2/> (parameetrid eelregistreeritud põhimeetodis, muutmata). MODELLED: välist sõltumatut etaloni, tegelikku tõde ega põhjuse omistamist ei ole. Halvenenud lahter tähendab, et seal valimisse sattunud õhusõidukite suur osa teatas sel päeval madalast navigatsioonitäpsusest; see ei ütle, miks. Lahter, mis ei ole vaadeldud või puudub, ei olnud hinnatud, mis ei ole sama mis selge.

# text
seg-0d1eeedcab3a = Mida käitati

# text
# c1: v<YYYY>.<MM>.<DD>-planes-readsb-prod-0
# c2: adsblol/globe_history_2026
# c3: scripts/fetch_adsblol_day.sh
# c4: back-catalogue/fetch/<tag>.parts.json
seg-df6ddf801a25 = <b>Allikas:</b> adsb.lol readsb ajalugu (ODbL { "1.0" }), GitHubi väljalase <c1/> repositooriumis <c2/>, toodud skriptiga <c3/> ühe osa kaupa (umbes { "3.4" } GB päevas, { "2" } osa). Avaldaja ei esita kontrollsumme, seega iga osa SHA-256 on salvestatud faili <c4/>.

# text
# c1: scripts/observatory_backcatalogue.sh
seg-9fa2d2319ed3 = <b>Piirkond ja päevad:</b> kast { "53.5" }, { "9.0" }, { "66.0" }, { "31.0" } (lõuna, lääs, põhi, ida: Läänemeri ja selle rannikud), { "30" } UTC päeva alates 2026-09-15 kuni 2026-10-14, { "0.5" } kraadi lahtrid, skriptiga <c1/> (üks päev korraga, toorfailid kustutatakse pärast iga päeva).

# text
# c1: method.scope
seg-8b65d148bbd8 = <b>Avaldamisreeglid:</b> uusim päev (2026-10-14) oli tootmise ajal selle lõpust üle { "24" } h möödas; käsk keeldub muidu. Piirkondlikud käitused arvutavad seadmete lähtetaseme ja päeva tausta ainult kasti teadetest (<c1/>).

# text
# c1: back-catalogue/MANIFEST.json
seg-64581554e84a = <b>Failid:</b> { "120" } tootefaili (GeoJSON, PNG, intsidendi JSON, manifest päeva kohta) <b>ei ole gitis</b>. Iga faili räsi on failis <c1/> ning päeva saab arhiivist uuesti ehitada ja võrrelda.

# text
# c1: manifest.json
seg-c89b88dc3d3b = Näide sellest, mida päev näitab: 2026-09-15 oli arhiivis { "110,619,797" } positsioonirida { "79,826" } jälgfailis; { "103.0" } miljonit olid kastist väljas, { "5.6" } miljonit ei olnud ADS-B, { "1.2" } miljonit olid maapinnal või alla { "5,000" } ft, { "0.6" } miljonit ei kandnud täpsusevälja ja { "212,426" } koondati (<c1/> sisendloendurid).

# text
seg-cc590aa74075 = Kolm päeva (2026-09-18, 2026-09-26, 2026-10-03) toodi arhiivist uuesti ja käitati teist korda: GeoJSON, PNG ja intsidendifail on esimese käitusega <b>baidiidentsed</b> (SHA-256 võrdne), seega on toode deterministlik, kuigi identifikaatori räsisool on käitusepõhiselt juhuslik.

# text
seg-3532be519183 = Tagantjärele kataloogi kokkuvõte

# text
seg-56aae646318e = UTC päev

# text
seg-42784010b115 = avaldatud lahtrid

# text
seg-2672b7f55371 = halvenenud

# text
seg-378ee89e4bd3 = mitte halvenenud

# text
seg-14783d89f2fe = mitte vaadeldud (avaldatud)

# text
seg-711d143678ae = intsidendid

# text
# c1: not_observed
seg-0f1ffe21d381 = { "30" } päeva: kokku { "96" } halvenenud lahtrit, { "28" } päeval { "30" }-st vähemalt üks, { "70" } intsidenti (kokkupuutuvate halvenenud lahtrite klastrid), ühtki päeva päevaulatusliku mõjuga. Mõjutatud õhusõidukite lahtriosa mediaan (päeva taust) on { "29" } päeval { "0" } ja ühel { "0.006" }, seega taustakaitsemeede (lahter peab ületama tausta { "0.15" } võrra) ei muutnud selles piirkonnas kunagi otsust. Halvenenud lahtrite arv päevas ulatub { "0" }-st { "8" }-ni (keskmine { "3.2" }). Umbes kolmandik päevas avaldatud lahtritest on <c1/> (valimisse sattus liiga vähe õhusõidukeid): selle toote piir on katvus, mitte taevas.

# text
seg-606aed861c95 = Mida see ei ütle: päevad, kus on rohkem halvenenud lahtreid, ei ole „halvemad“ füüsikalises mõttes, püsivat mõjutatud ala alahinnataks (õhusõidukitel, mis lendavad terve päeva ainult selle sees, puudub lähtetase väljaspool seda ja neid ei arvestata) ning siin ei ütle miski, kes või mis põhjustas madala täpsuse.

# text
seg-ef37626a4c47 = Tundlikkuse uuring (kolm päeva)

# text
# c1: kshana interference-map sensitivity
# c2: sensitivity/<day>.json
seg-aacbb761ee19 = <c1/> taasesitab ühe päeva salvestatud teateid registreeritud parameetrite ühekaupa muutmise korral (kaks väärtust kummagi kohta, pluss { "1.0" } kraadi ruudustik). Päevad: 2026-09-18 (kõige rohkem halvenenud lahtreid, { "8" }), 2026-09-26 ({ "1" } halvenenud lahter) ja 2026-10-03 ({ "0" }). Täielikud aruanded: <c2/> ({ "23" } varianti kummagi kohta; taasesitati { "2.2" }, { "1.7" } ja { "1.7" } miljonit rida). Halvenenud lahtrid iga variandi korral (registreeritud väärtus sulgudes; registreeritud tulemus on { "8" }, { "1" } ja { "0" } halvenenud lahtrit):

# text
seg-dfced7e594d2 = parameeter (registreeritud)

# text
seg-2ac3e771679d = väärtus

# text
seg-0953dbfd76db = ruudustik { "0.5" } kraadi

# text
seg-bf5746d1a110 = { "2" } (jämedamad lahtrid)

# text
seg-e4016df2fcd3 = Lugemine ilma võitjat valimata:

# text
seg-81cfcbf0de89 = Otsused on tundlikud täpsuskoodi lävede ja valimireeglite suhtes ning väikesed arvud liiguvad palju.

# text
# c1: low_nic_max
# c2: degraded_share
# c3: min_reports_per_aircraft_in_cell
# c4: low_nic_max
# c5: degraded_share
seg-097ed1aa1504 = <c1/>, <c2/> ja <c3/> muudavad kumbki halvenenud lahtrite arvu iga päeva kohta kaks korda või rohkem; <c4/> lõdvendamine väärtusele { "6" } muudab { "1" } halvenenud lahtri 09-26 puhul { "12" }-ks (Jaccard registreeritud hulgaga { "0.08" }). 09-18 puhul säilitab <c5/> tõstmine väärtusele { "0.4" } { "1" } { "8" }-st (Jaccard { "0.125" }). Lahtri otsus lävede lähedal on sama palju väide lävede kohta kui andmete kohta.

# text
# c1: min_aircraft_sampled
seg-0d0c96099d30 = <b><c1/> liigutab lahtreid peamiselt mitte halvenenud ja mitte vaadeldud vahel</b>: 09-18 puhul jätab see halvenenud arvu väärtusele { "8" }, samal ajal kui { "21" } kuni { "56" } lahtrit muudab olekut.

# text
# c1: background_margin
# c2: min_baseline_good_reports
# c3: day_confound_background
seg-04cc05318a5d = <b>Kolm kaitsemeedet on siin mitteaktiivsed</b>: <c1/>, <c2/> ja <c3/> ei muuda midagi ühelgi kolmest päevast (tausta osa on { "0" }), seega see piirkond ja periood ei ütle midagi selle kohta, kui hästi need töötavad. Need oleksid olulised seal, kus piirkondlik mõju tõstab tausta.

# text
seg-7ba403b84fbd = <b>Jämedam ruudustik ({ "1.0" } kraadi) muudab pilti</b> ({ "2" }, { "3" } ja { "1" } halvenenud lahtrit; avaldatud lahtrid langevad umbes kolmandikuni, 09-18 puhul { "226" } võrreldes { "694" }-ga, sest iga lahter on neli korda suurem): lahtri suurus on meetodi valik ja vaatluskeskus fikseerib selle { "0.5" } kraadile.

# text
# c1: low_nic_max
seg-4db2f5313410 = Päeval, millel puudub registreeritud halvenenud lahter (10-03), on halvenenud lahtreid { "9" } variandi all { "22" }-st mitteruudustikulisest variandist (kuni { "8" } väärtusega <c1/> { "6" }): „ühtki halvenenud lahtrit ei ole“ on samuti lävest sõltuv väide.

# text
seg-a818be844f3a = Ükski variant ei ole valideeritud alternatiiv ja registreeritud reegel jääb selle uuringuga muutmata. Uuring ei ütle, millised parameetrite väärtused on õiged.

# text
seg-98c799bfbc25 = <s1>Eelmine</s1>Häirevaatluskeskus: meetod

# text
seg-5d0c003e73dc = <s1>Järgmine</s1>kshana-bench
