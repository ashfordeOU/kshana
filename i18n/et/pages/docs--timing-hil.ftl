# docs--timing-hil: translations (et)

# text
seg-f8cf777c0caa = Pinnad

# text
seg-f2ce7fc60cdf = Vorming

# text
seg-d00b65801e9b = Samm

# attr:alt
seg-0d580ea8043d = Ajavea kirjest hinnatud holdover-i test, mootori v{ $version } tegelikust käitusest stsenaariumil scenarios/holdover-test-example.toml ({ "601" } valimit iga { "5" } s järel). Operaator eemaldab GNSS-i ajal { "600" } s ja taastab selle ajal { "2400" } s; ajaviga triivib holdover-i lõpuks { "299" } ns-ini, ületab { "100" } ns eelarve pärast { "675" } s ja naaseb { "100" } ns ribasse { "70" } s pärast taastamist. Otsused: lähtetaseme maskid PASS, holdover-i maskid FAIL, holdover-i ümbrik FAIL, taastumine RECOVERED. Mõõdetud maski vastu, mitte kinnitus. Ajad on operaatori väide, mida Kshana ei ole kontrollinud. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# text
# c1: docs/TIMING-HIL.md
seg-7a1246297c82 = Source: <c1/>

# text
seg-6ea3dec83080 = Ajastuse riistvara tsüklis: antenn välja, holdover hinnata

# text
# c1: holdover-test
# c2: scenarios/holdover-test-example.toml
# c3: scenarios/holdover-test-ptp4l.toml
seg-5901f0b26939 = Telekommunikatsiooni- ja energeetikaoperaatorid katsetavad ajastussüsteemi, võttes selle GNSS-i ära ja jälgides, mida kell teeb. Kshana ei tee seda nende eest ega puuduta nende seadmeid. See loeb ajavea salvestust, mille operaatori enda instrumendid tekitasid, jagab selle kaheks operaatori esitatud ajal ja <b>mõõdab iga sammu avalike ITU-T maskide vastu</b>. Stsenaariumi liik on <a1><c1/></a1>; näidisstsenaariumid on <c2/> ja <c3/>.

# text
# c1: HARDWARE-SAFETY.md
seg-daf4b071bad0 = See on riistvaraohutuse <b>aste { "1" }</b>: passiivne, ainult vastuvõtt, Kshanalt puudub RF (<a1><c1/></a1>). Nõuandev tarkvara, mitte tüübikinnitust omav seade. Keegi ei ole seda protseduuri hinnanud, kinnitanud ega üle vaadanud ja see ei ütle midagi selle kohta, kas süsteem täidab mõnda soovitust.

# text
seg-da0c48bbe011 = Protseduur

# text
seg-e753ca7a1c99 = Operaator teeb neli sammu. Kshana ei tee ühtegi neist.

# text
seg-0c338b956741 = Mida operaator teeb

# text
seg-ebd95b343349 = Mida salvestus näitab

# text
seg-03999de98059 = { "1" }. Lähtetase

# text
seg-730f2037d22a = Laseb süsteemil töötada GNSS-iga lukustatult nii kaua, kui katse vajab (ja märgib, mitu päeva see oli enne lukustatud).

# text
seg-f45aae4139bd = Ajaviga distsiplineeritud olekus.

# text
seg-0f050dcede80 = { "2" }. GNSS eemaldatud

# text
seg-50c0df832eda = Eemaldab GNSS-i katsetatavast süsteemist, näiteks antennikaabli vastuvõtjast või labori enda simulaatori väljundi, ja <b>kirjutab aja üles</b>. Kontrollida kõigepealt vastuvõtja tootja kasutusjuhendit: mõned vastuvõtjad toidavad antenni ja mõned vajavad avatud pordil terminaatorit.

# text
seg-e371e7e357e3 = Hetk, mil ajaviga hakkab triivima.

# text
seg-f05dc0acb396 = { "3" }. Holdover

# text
seg-a98186503e0f = Jätab süsteemi planeeritud ajaks tema enda ostsillaatorile.

# text
seg-1da66cdca856 = Süsteemi holdover.

# text
seg-61197c9bad91 = { "4" }. Taastumine

# text
seg-75af1f4fec83 = Taastab GNSS-i ja <b>kirjutab aja üles</b>.

# text
seg-1259d36fc78c = Ajaviga naaseb (või mitte).

# text
seg-c09b1ea8f1a4 = Kaks asja, mida operaator peab tegema, sest Kshana ei saa:

# text
seg-31f6c357864b = Öelda kaks aega.

# text
# c1: gnss_removed_s
# c2: gnss_restored_s
seg-59f9eb10035a = <c1/> ja <c2/> on operaatori väide. Kshana ei tuvasta eemaldamist salvestusest ega kontrolli aegu. Vale aeg nihutab sammude piire ja seega tulemust.

# text
seg-6d0d3186fbe3 = <b>Kasutada salvestuse ja aegade jaoks sama kella.</b> Kellalogi puhul algab ajatelg esimesest lugemist, seega on kaks aega sekundid logi esimesest reast.

# text
seg-bd181a831803 = Mida salvestada

# text
# c1: clock_log
# c2: CLOCK-LOG-FORMATS.md
seg-52758c10be0a = Mis tahes neist, olemasolevate lugejate <c1/> kaudu (<a1><c2/></a1>):

# text
seg-fef0034cb88b = Instrument

# text
seg-ad6f33d70f3f = Kuidas salvestus tehakse

# text
# c1: ptp4l
seg-ef7f547609ad = linuxptp <c1/> (orja- või piirikella servo)

# text
# c1: -m
# c2: ptp4l[time]: master offset N sK freq ...
seg-f548a2ae96e5 = käivitada valikuga <c1/> ja säilitada read <c2/>

# text
# c1: phc2sys
seg-9a3b58be1b0b = linuxptp <c1/>

# text
# c1: phc2sys[time]: CLOCK_REALTIME phc offset N sK ...
seg-77255f8f5fef = read <c1/>

# text
# c1: ts2phc
seg-2cf9256bd790 = linuxptp <c1/>

# text
# c1: ts2phc[time]: /dev/ptpN offset N sK ...
seg-c667a97b92a8 = read <c1/>

# text
# c1: tracking.log
seg-ed305bcea4f8 = chrony <c1/>

# text
# c1: log tracking
# c2: chrony.conf
seg-021b760aae59 = <c1/> failis <c2/>

# text
# c1: statistics.log
seg-a7f2d72a5cb7 = chrony <c1/>

# text
# c1: log statistics
# c2: chrony.conf
seg-a70952a099d5 = <c1/> failis <c2/>

# text
seg-6ad29120ffe7 = TAPR TICC loendur

# text
seg-32f703bfcab7 = ajatempli režiim etaloni suhtes

# text
seg-6862a9ac9a68 = TimeLab ASCII eksport

# text
seg-b5e7e3a272d6 = faas esitatud ühikus

# text
seg-8af4aac4426f = RINEX kellafail

# text
seg-21d5c43719f2 = üks kell

# text
seg-3a82b5295ab1 = mis tahes muu

# text
# c1: samples
# c2: csv_path
seg-6bebda4a3c6c = <c1/> või <c2/>

# text
# c1: time_s,time_error_ns
seg-9a443cc0c444 = <c1/> paari, ühtlaselt diskreetitud

# text
seg-b8d1d45df70b = <b>Oluline on, mida salvestus mõõdab.</b> Servologi (linuxptp, chrony) salvestab nihke, mida deemon mõõtis ja korrigeerib: see on servo juhtimise all järele jääv ajaviga, mitte kella sõltumatu mõõtmine UTC suhtes. Katse holdover-i sammu ajal, mis tõesti eemaldab etaloni, näitab servolog ikkagi seda, mida deemon uskus, mis võib tegelikust veast erineda. TICC või muu loendur sõltumatu etaloni vastu on tugevam salvestus; öelda, millist kasutasite, kui tulemusest teatate.

# text
seg-6d4e25914d1c = Stsenaarium

# text
# c1: budgets
# c2: max_abs_te_ns
# c3: clock = "..."
# c4: [series.clock_log]
seg-ca1244db2387 = Valikulised võtmed: <c1/> (nimi, <c2/>, allikas; puudumisel telekommunikatsiooni ajastuse vaikeväärtused) ja <c3/> võtmes <c4/>, et valida ühe allika logist, mis sisaldab mitut.

# text
seg-38eb634b7f8f = Mida aruanne sisaldab

# text
# c1: steps
seg-6a64755e11d6 = <b><c1/></b>: lähtetaseme, holdover-i ja taastumise kohta algus ja lõpp, näidiste arv ning ajavea keskmine, rms-, suurim ja lõppväärtus.

# text
# c1: masks
seg-cd11d0838c44 = <b><c1/></b>: iga nimetatud mask, mõõdetud sammul, mille tingimus seda nimetab. Lukustatud kella jaoks kirjutatud mask mõõdetakse lähtetasemel; holdover-i või autonoomse kella jaoks kirjutatud mask holdover-il. Igal kontrollil on oma piir, mõõdetud väärtus, varu ja tabel, millest see on ärakirjastatud. Mask, mis vajab pikemat salvestust, kui samm andis, on <b>INCOMPLETE</b>, mitte kunagi ekstrapoleeritud; mask, mida mootor ei saa salvestuse näidisintervalli jaoks hinnata, on <b>NOT-EVALUATED</b> koos põhjusega.

# text
# c1: holdover
seg-cb54e67ca4eb = <b><c1/></b>: murdosaline sagedusnihe, mida süsteem hoidis (vähimruutude sirge tõus läbi holdover-i ajavea, ns/s, mis on miljardikosad), jääk selle sirge ümber, suurim absoluutne ajaviga ja selle esinemise aeg ning samm eemaldamise hetkel.

# text
# c1: holdover_envelope
# c2: locked_duration_days
seg-daa40ac07396 = <b><c1/></b>: ITU-T G.8272.1 tabeli { "3" } ePRTC-A holdover-i ümbris failist <c2/>, koos ajaga, millal see esimest korda ületatakse.

# text
# c1: budgets
seg-cd480a1bf901 = <b><c1/></b>: aeg pärast eemaldamist, millal iga ajavea eelarve esimest korda ületatakse.

# text
# c1: recovery
# c2: |TE|
seg-007a0393cb39 = <b><c1/></b>: kas <c2/> jõudis vahemikku ja püsis seal viibimisaja, kui kaua pärast GNSS-i naasmist see algas, tipp pärast taastamist ning suurim samm järjestikuste näidiste vahel taastumise ajal.

# text
# c1: curves
seg-199497dfcc09 = <b><c1/></b>: lähtetaseme ja holdover-i sammude MTIE ja TDEV.

# text
# c1: verdicts
seg-ce00a41a322f = <b><c1/></b>: ühesõnaline kokkuvõte iga sammu kohta.

# text
# c1: units
seg-c09fc305ead1 = Iga arv kannab oma ühikut ja allikat aruande plokis <c1/>.

# text
seg-5d87a772c132 = Sõnad ja piirid

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-0810b24c6f3e = Tulemus on <b>mõõdetud maski suhtes</b>. Maskid on ärakirjastatud vabalt allalaaditavatest ITU-T soovitustest (samad tabelid mis liigil <c1/>, loetletud failis <a1><c2/></a1>) ning iga kirje, mille soovitused jätavad „for further study“ (edasiseks uurimiseks), puudub, seda ei ole täidetud. Kshana ei väida, et kell või süsteem täidab soovitust või on selle suhtes heaks kiidetud, ning aruanne ei väida seda samuti.

# text
seg-527189cf37c6 = <b>MODELLED.</b> Sammuloogikat, sirge sobitust ja taastumisreeglit kontrollitakse salvestustel, mis on ehitatud valemitest, mille vastused on enne käivitust teada; ühtegi laboratoorset holdover-it ei ole hinnatud välise oraakli (sõltumatu etalon) vastu ning ükski partner ega laboratoorium ei ole millegagi nõustunud. Enne kui mõnda kellaklassi kohta käivat arvu saaks ülendada, oleks vaja ajastuse laboratooriumi.

# text
seg-ad8160fbed46 = <b>Mida ei kata</b>, esitatud igas aruandes: kas GNSS tõesti eemaldati ja taastati esitatud aegadel; iga samm, mida operaator ei salvestanud; maskid, mis on defineeritud { "0.1" } Hz filtri kaudu, salvestuse jaoks, mida diskreetiti harvem kui kord sekundis; instrumendi enda mõõtemääramatus; ning iga soovituse protseduur, mis ületab ajavea salvestust (temperatuuriprofiilid, pakettvõrgu koormus).

# text
seg-cf681db42f05 = <b>Taastumisvahemik on katse enda valik.</b> Vaikeväärtus { "100" } ns on PRTC-A suurim absoluutne ajaviga (ITU-T G.8272); see on mugav joon, mitte ühegi soovituse nõue taastumisele.

# text
seg-4ce2f2052df4 = <b>Edastusteed ei ole.</b> Kshana loeb faile. See ei genereeri signaali ning GNSS-i eemaldamine laboris tehakse labori enda seadmetega ja selle enda loa all.

# text
# c1: holdover-test
# c2: kshana <scenario.toml>
# c3: kshana::api::run_toml
# c4: kshana.run
# c5: samples
# c6: clock_log.text
# c7: run_scenario
# c8: kshana example holdover-test-example
seg-0cff831a8444 = <c1/> on stsenaariumi liik, seega töötab see kõikjal, kus liigid töötavad: <c2/>, Rust API (<c3/>), Pythoni sidumine (<c4/>), WebAssembly ja npm ehitus (sisemine <c5/> või <c6/>; failivõtmed pole seal saadaval), MCP server (<c7/>, ainult sisemine sisu) ja Kshana Studio stsenaariumi käitaja. Kaks stsenaariumifaili on kaasas (<c8/>).

# text
seg-432c07a8e6f5 = <s1>Eelmine</s1>Petetud aeg

# text
seg-8499ae539222 = <s1>Järgmine</s1>Kellalogi vormingud
