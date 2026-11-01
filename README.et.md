> See on faili README.md (v0.40.0) masintõlge, mida emakeelne kõneleja pole veel üle vaadanud. Võrdlusallikaks on ingliskeelne README. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: märk, kompassi sihtrist, mis tähistab täpset hetke, sõnamärgi kshana kõrval" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>täpne hetk</em></strong><br>
  Avatud lähtekoodiga simulaator PNT (positsioneerimise, navigeerimise ja ajastuse) vastupidavuse uurimiseks.
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Pideva integratsiooni olek harul main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Ridade kaetus ligikaudu 95 % kataloogist src/, mõõdetud failis docs/COVERAGE.md ja pidevas integratsioonis nõutud vähemalt 85 %"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="401 võimekusest 176 on VALIDATED sõltumatu välise oraakli vastu, kontrollimaatriksi järgi"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="SonarQube Cloudi kvaliteedivärava olek"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Väljalase v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Inglise keel ja veel 17 keelt, masintõlkena"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Litsents: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, iga väljalaske Zenodo kontseptsioonikirje"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Kommertslitsents on saadaval ettevõttelt Ashforde® OÜ, vt Väljaanded"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana crates.io-s, praegune avaldatud versioon"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana PyPI-s, praegune avaldatud versioon"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana npm-is, praegune avaldatud versioon"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Ava Kshana Studio</a> ·
  <a href="#install">Paigaldamine</a> ·
  <a href="#capabilities">Võimekused</a> ·
  <a href="#evidence">Tõendid</a> ·
  <a href="#research">Uurimistöö</a> ·
  <a href="docs/CONCEPTS.md">Dokumentatsioon</a> ·
  <a href="#cite">Viitamine</a>
</p>

<p align="center">
  <strong>Keeled:</strong> <a href="README.md">English</a> ·
  <a href="README.nl.md"><span lang="nl">Nederlands</span></a> ·
  <a href="README.pl.md"><span lang="pl">Polski</span></a> ·
  <a href="README.pt-BR.md"><span lang="pt-BR">Português (Brasil)</span></a> ·
  <a href="README.pt-PT.md"><span lang="pt-PT">Português (Portugal)</span></a> ·
  <a href="README.fi.md"><span lang="fi">Suomi</span></a> ·
  <a href="README.sv.md"><span lang="sv">Svenska</span></a> ·
  <a href="README.da.md"><span lang="da">Dansk</span></a> ·
  <a href="README.nb.md"><span lang="nb">Norsk bokmål</span></a> ·
  <a href="README.cs.md"><span lang="cs">Čeština</span></a> ·
  <a href="README.uk.md"><span lang="uk">Українська</span></a> ·
  <a href="README.ru.md"><span lang="ru">Русский</span></a> ·
  <a href="README.de.md"><span lang="de">Deutsch</span></a> ·
  <a href="README.fr.md"><span lang="fr">Français</span></a> ·
  <a href="README.es.md"><span lang="es">Español</span></a> ·
  <a href="README.et.md"><span lang="et">Eesti</span></a> ·
  <a href="README.ja.md"><span lang="ja">日本語</span></a> ·
  <a href="README.zh-Hans.md"><span lang="zh-Hans">简体中文</span></a><br>
  <sub>Käsurida, käivituste kokkuvõtted, graafikud ja aruanded räägivad iga keelt lipuga <code>--lang &lt;tag&gt;</code>
  (näiteks <code>kshana scenarios/holdover-test-example.toml --lang de</code>), ning sama teevad Pythoni, WebAssembly ja MCP liidesed.
  Need on masintõlked, mida ükski emakeelne kõneleja pole veel üle vaadanud; võrdlusallikaks on inglise keel.
  Vt <a href="docs/i18n.md">Lokaliseerimine</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Harjuta minutit, mil GNSS kustub. Kshana missioonikonsool, joonistatud mootori v0.40.0 tegelikust käivitusest: aheldatud kampaania campaign-jam-spoof-holdover-integrity (seeme 20260928, 6 faasi, 18 liikmeskäivitust ajavahemikus T+01:16:10) ning stsenaariumi constellation-multi-gnss-coverage 102 GPS-i, Galileo, BeiDou ja GLONASSi satelliiti, igaüks joonistatud mootori maapealsest jäljest taastatud ringikujulisele kahe keha orbiidile, raadiused kuvamiseks kokku surutud. Kella ajaviga tõuseb kuni 62.7 ns 50 ns kaitsepiiri vastu, kandja ja müra tiheduse suhe langeb -12.2 dB-Hz-ni 25 dB-Hz alampiiri vastu ning vertikaalne kaitsetase ulatub 135.4 m-ni 50 m häirepiiri vastu." width="100%">
</picture>

<details>
<summary><strong>Sisukord</strong></summary>

- [Harjuta minutit, mil GNSS kustub](#rehearse-the-minute-gnss-goes-dark)
- [Mis on uut versioonis 0.40](#whats-new-in-040), [Mis on uut versioonis 0.39](#whats-new-in-039), [Mis on uut versioonis 0.38](#whats-new-in-038) ja [0.38 põhjalikumalt](#038-in-depth): Jammertesti hindamine, vastuvõtja enda lipud, masinsisendid, ajastus ja holdover, standardipaketid, LunaNet AFS, laborite ringreis, kshana-bench, observatoorium, eksportijad, optika, [kosmosekasutaja navigeerimine](#space-user-navigation-gnss-ssv) ja [Kuu infrastruktuur](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) ja iga Studio leht
- [Võimekused](#capabilities): valdkondade tabel, [iga stsenaariumiliik perekonniti](#every-scenario-kind-by-family), [iga käsk](#every-command), [iga liides](#every-surface)
- [Kuidas käivitus toimib](#how-a-run-works), [Missioonid](#missions)
- [Tõendid](#evidence): register (ledger), [võimekuse valdkonnad](#capability-domains)
- [Paigaldamine](#install), [Arhitektuur](#architecture) (ja [diagrammid](#diagrams)), [AI-assistent](#ai-assistant)
- [Väljaanded](#editions), [Uurimistöö](#research), [Viitamine](#cite), [Litsents](#licence)
- [Teatmik](#reference): kasutamine, stsenaariumi vorming, väljund, hoidla ülesehitus, KKK, tõrkeotsing, versioonimine, teekaart, kaasaaitamine, dokumentatsioon

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Harjuta minutit, mil GNSS kustub

Kshana mängib läbi segamise, spuufimise ja kella holdoveri, kui GNSS-i (globaalse
satelliitnavigatsioonisüsteemi) signaalid kaovad, ning ütleb, kui kaua süsteem hoiab aega ja
asukohta oma eelarve piires ja milline kell või andur annab kõige rohkem varu. See on üks
Rusti mootor. See töötab terminalis, märkmikus, IDE-s (integreeritud arenduskeskkonnas),
AI (tehisintellekti) assistendis või sinu brauseris.

Iga käivitus on bitt-biti haaval reprodutseeritav stsenaariumist, seemnest ja mootori versioonist.
Igal võimekusel on masinkontrollitud registris üks kolmest sildist: **VALIDATED** (sõltumatu
väline oraakel on nõus), **MODELLED** (sisemiselt järjepidev, ja see öeldakse välja)
või **PARTNER** (selle omanik on riistvarapartner).

> **Olek: v0.40.0.** Valideeritud, reprodutseeritav simulatsioonialus PNT vastupidavuse jaoks.
> Ajastus ja holdover on esikohal, sest see valdkond on kõige paremini valideeritud. Kshana on
> uurimis- ja kompromissianalüüsi instrument: mitte raadiosagedusliku (RF) signaaligeneraatori
> riistvara (see ei juhi ühtegi raadiot ega edasta midagi; selle signaalitaseme väljund on
> baasriba IQ-näidisfailid tarkvaravastuvõtjatele), mitte riistvaraline ega sertifitseeritud
> GNSS-vastuvõtja (selle tarkvaravastuvõtja on analüüsitööriist) ega lennutoode. Valdkonnas uus?
> Alusta [lihtsas keeles sissejuhatusest](docs/CONCEPTS.md) ja [sõnastikust](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Mis on uut versioonis 0.40

0.40 lisab missioonitaseme veaeelarve, märgistab iga joonise ja tabeli selle tõendustasemega, loeb mõõdetud kellalogisid,
kontrollib andmepartnerite esitusi, hindab, kus häireallikas võib asuda, ning räägib inglise keele kõrval seitseteist keelt.
Registris on nüüd 401 rida: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Ühtegi rida ei tõstetud tasemele VALIDATED ja iga allpool
nimetatud möödalask on testiga fikseeritud.

- **Missiooni lõng.** Liik `mission-thread` aheldab faasid stardist sisenemiseni (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` ja neli Kuu liiki) koos sõnastatud üleandmisreeglite, varuga sõnastatud nõuete suhtes ja nõrgima
  lüliga; otsast lõpuni Artemis-klassi näide üle 11 faasi (Maa ja Kuu segmendid), kokku 92 stsenaariumiliiki. Iga arv on MODELLED. Tsislunaarne levitamine avaliku Artemis I trajektoori vastu
  **jääb alla** oma eelregistreeritud lävele (45.3 km ja 0.25 m/s vs 5 km ja 0.05 m/s; põhjuseks on väikesed manöövrid, mida mudel ei sisalda), ning Kuu levitaja CAPSTONE'i
  orbiidi vastu **jääb alla** (136.8 km vs 25 km ühe tiiru lõpus); LRO võrdlus on täidetud. Read jäävad MODELLED
  ([Missiooni lõng](docs/MISSION-THREAD.md), [Kuu segment](docs/MISSION-THREAD-LUNAR.md)). Studios loetakse lõnga aadressil `/studio/mission-thread/`.
- **Tõendisildid.** Iga käivituse kirjutatud joonis ja tabel kannab tõendustaset ja registriridade id-sid, millele see tugineb, loetuna maatriksist.
- **Mõõdetud kellad.** Loetakse kaheksat kellalogi vormingut ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) ning sobitatud
  aegrida saab juhtida holdoverit. Eelregistreeritud lävede vastu **jääb** sobitus **alla** kriteeriumil F1(a) viiel kuuest salvestusest ja kriteeriumil F2 ühel; mõlemad
  jäävad MODELLED ([Muudatuste logi](CHANGELOG.md#0400---2026-10-29)).
- **Andmepartnerid.** `kshana partner check` kontrollib esituse vormingut ega hinda midagi ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Häireallika piirkond.** `kshana interference-map locate` annab ADS-B või AIS teadetest piirkonna ja ellipsi, mitte kunagi paljast punkti.
  Ühekordselt võrreldes Jammertest 2025 saatjakohtadega on tulemus mõlema allika puhul **NOT ASSESSABLE** (avatud andmetes on liiga vähe
  ajastatud sessioone), seega jääb rida MODELLED ([Häirekaart](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Võrdlustest.** 0.40 korduskampaania täidab A3, D3 (mõlemad EXPLORATORY), R3 ja R4; A2, D1 ja R1 jäävad NOT MET ([Bench](docs/BENCH.md)).
- **Keeled.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja ja zh-Hans, **masintõlgetena, mida ükski emakeelne
  kõneleja pole üle vaadanud**; võrdlusallikaks on inglise keel ning mitte-ingliskeelsed käivitused kestavad umbes kaks korda kauem
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Mis on uut versioonis 0.39

0.39 ei lisa ühtegi funktsiooni ega muuda ühtegi tulemust; mootori väljund on 0.38 väljund. See parandab ühe asja
käsureal, uuendab ristvalideerimise tööriistade sõltuvusi ja esitab võrdlustesti
otsused täies ulatuses.

- **Käsurida.** `kshana kinds | head` (mis tahes suletud standardväljund) ei paanitse enam: programm lõpetab
  vaikselt olekuga 141, nagu teised tööriistad suletud toru korral. Muud kirjutusvead teatavad endast endiselt.
- **Sõltuvused.** `memmap2` 0.9.11 kahes ANISE ristkontrolli lukufailis ning `pillow` 13.0.0 ja
  `certifi` 2026.10.19 oraakli keskkonna kinnitustes, kõik kataloogis `xval/`: miski tarnitav ei muutunud.
- **kshana-bench, kõik otsused.** Eelregistreeritud lävede vastu on kolm NOT MET, igaüks testiga fikseeritud:
  A2 (`agc_k_sigma` AUC 0.766 vähemalt 0.80 vastu), D1 (suurim lõhe 0.0301) ja ülesanne (b) R1 (üle kantud,
  mitte uuesti käivitatud). Ühtegi läve ei lõdvendatud ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Mis on uut versioonis 0.38

0.38 muudab neutraalse kohtuniku mõõdetavaks: see hindab vastuvõtja logisid avaldatud testiajakava
vastu, loeb rohkem vastuvõtjaid ja andureid, testib ajastussüsteeme ning tarnib võrdlustesti ja
häireobservatooriumi. See jääb nõuandvaks: miski siin ei ole sertifitseeritud, ükski tulemus ei ole tüübikinnitus
ja miski ei edasta. Iga rida ütleb, mida register selle kohta sisaldab ([kuidas silt välja teenitakse](#evidence));
olek nimetab ainult seda, mida kontrolliti, ning registririda ja lingitud leht ütlevad, mida ei kontrollitud.

| Uus versioonis 0.38 | Mida see teeb ja miks | Registri olek | Loe |
|---|---|---|---|
| **Jammertesti hindamine** | `kshana jammertest import` loeb avaldatud NPRA testikataloogi ja saateplaani ajastatud tõena; `jammertest score` hindab vastuvõtja logi testi kaupa (tuvastuse latentsus, vahele jäänud häired, valehäired, taastumisaeg), allkirjastatud tõendipaketina, kui annad võtme | **MODELLED**: üks registririda. Läved eelregistreeriti enne ühtegi hinnatud käivitust; JammerTest 2024 andmetel ebaõnnestus minimaalse andmehulga reegel mõlemal käivitusel (4 ja 7 hinnatavat akent nõutud 10 vastu), seega **ükski lävi ei ole hinnatav** ja midagi ei väideta | [Jammertest](docs/JAMMERTEST.md) |
| **Vastuvõtja enda lipud** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG ja NovAtel RXSTATUS loetakse epohhipõhisesse `self_report`-i ja võrreldakse Kshana häiretega (mõlemad, ainult vastuvõtja, ainult Kshana, kumbki mitte); Septentrio SBF lugeja ja ainult lugemiseks mõeldud `--serial` sisend | **MODELLED**; vastuvõtja detektori ja Kshana detektori kokkulangevus ei ole valideerimine | [Vastuvõtja usaldus](docs/RECEIVER-TRUST.md) |
| **Rohkem vastuvõtjaid ja andureid** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (BSD-litsentsiga pyrtcm tabelitest, mitte RTCM tekstist), GNSS-SDR monitorivood, IMU logi teise andurina, ROS 2 pakett, `gnss_lib_py` sild ja `imu-fit` hübriidanduri parameetrite jaoks | **MODELLED**: kuus registririda; ainult ise kirjutatud testiandmed, ühtegi päris vastuvõtja, IMU, GNSS-SDR käivituse ega ROS-graafi salvestust ei loetud | [Masinsisendid](docs/MACHINE-INPUTS.md) |
| **Ajastuse ja holdoveri testid** | liik `holdover-test` hindab holdover-testi (operaator eemaldab GNSS-i, holdover, taastumine) mõõdetud ajaveasalvestusest ITU-T maskide vastu, „mõõdetud maski vastu“; linuxptp ja chrony logilugejad; riistvaraetapid ja väli `lab-attestation` | **MODELLED**: kaks registririda; ajad on operaatori väide, mitte kontrollitud | [Ajastuse HIL](docs/TIMING-HIL.md), [Riistvara ohutus](docs/HARDWARE-SAFETY.md) |
| **Standardipaketid, LunaNet AFS, laborite ringreis** | hinnatud paketid DHS RPCF, IMO MSC.1/Circ.1575 ja ICAO Doc 9849 Appendix F jaoks enne käivitust sõnastatud lävede vastu, „toetab tõendeid“; NIST IR 8323r1 vastavustabel; LunaNet AFS koodigeneraator ja kontrollija; allkirjastatud pakett, mis seob labori käivituse stsenaariumi, katsetingimused, vastuvõtja logi ja hinde | **MODELLED** pakettide ja ringreisi puhul; AFS koodikontroll on **VALIDATED** selle trükitud kontrollveergude vastu (vt registriridu) | [Standardid](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench ja observatoorium** | fikseeritud ülesanded, jaotused ja mõõdikud häirete tuvastamiseks, IQ-tuvastuseks, holdoveri ennustamiseks ja optimismilõhe jaoks, suletud holdout-komplekti ja staatilise edetabeliga; reprodutseeritav igapäevane häireprodukt 24 h viivituse, jämedate lahtrite ja ilma omistamiseta | oma registririda ei ole: see hindab esitusi ning selle lähtetasemed on tulemusfailides märgitud MODELLED; eelregistreeritud lävede vastu on hindaja, C1 kuni C3 ja D2 täidetud ning kolm läve on **NOT MET** (testidega fikseeritud): A2 (`agc_k_sigma` AUC 0.766 vähemalt 0.80 vastu testijaotusel), D1 (suurim lõhe 0.0301) ja ülesanne (b) R1 (üle kantud, mitte uuesti käivitatud); vt `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatoorium](docs/observatory/METHOD.md) |
| **Eksportijad** | usaldustelemeetria Home Assistanti MQTT avastus- ja olekusõnumitena (ainult avaldamine, ilma mandaatideta) Prometheuse, CEF-i, LEEF-i ja OTLP kõrval | **MODELLED**: üks registririda | [Usaldustelemeetria](docs/TRUST-TELEMETRY.md) |
| **Optilise lingi varu ajas** | liik `optical-atmosphere` saab kirjutada ühe seemnega realisatsiooni asukoha ilmast lingivaru aegreana | **MODELLED**: üks registririda; üks valim mudelist, mitte kliima | [Optiline atmosfäär](docs/OPTICAL-ATMOSPHERE.md) |

0.37 esiletõstud: [muudatuste logi](CHANGELOG.md#0370---2026-10-17). Täielik 0.38 loend on
[muudatuste logis](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 põhjalikumalt

Iga ülaltoodud tabeli võimekus mõne reaga: mida see teeb, üks käsk selle käivitamiseks, üks
pilt, mis on joonistatud mootori tegelikust käivitusest, ja mida register selle kohta sisaldab. Pildid
kirjutab [`tools/gen_figures_038.py`](tools/gen_figures_038.py) kataloogi
[`docs/figures/0.38/`](docs/figures/0.38/) (mitte kunagi käsitsi joonistatud): `python3 tools/gen_figures_038.py`
kirjutab need ehitatud mootorist ümber ning `--check` ebaõnnestub, kui mõni on aegunud või selle siinne pealdis erineb.
Kui sisend on logi, on see skripti kirjutatud väljamõeldud logi, sest päris kolmandate osapoolte logisid
ei lisata kunagi hoidlasse, ja pealdis ütleb seda. Kõik allpool on nõuandev: mitte sertifitseeritud, mitte
tüübikinnitus ja miski ei edasta. Olek nimetab seda, mida kontrolliti, ja mitte rohkemat;
[kuidas silt välja teenitakse](#evidence).

### Jammertesti hindamine

`kshana jammertest import` muudab avaldatud NPRA testikataloogi ja saateplaani
ajastatud tõeks ning `kshana jammertest score` hindab vastuvõtja logi selle vastu: iga
ajastatud testi kohta, kas see tuvastati, kui hilja ja kui kaua vastuvõtjal taastumine aega võttis, pluss
valehäired väljaspool kõiki ajapilusid. Kataloog laaditakse alla, seda ei lisata kunagi hoidlasse.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Ühe sünteetilise vastuvõtjalogi hindamine kolmetestilise ajakava vastu, mootori v0.40.0 tegelikust käivitusest (`kshana jammertest score`). Logi on väljamõeldud: 1800 s NMEA-d 20 dB C/N0 langusega kahel intervallil. Ajakava loetleb kolm ajapilu; keskmises ajapilus logis segajat ei ole. Hinne märgib 2 testi 3-st tuvastatuks (mediaanlatentsus 0 s) ja 1 vahele jäänuks, 0 valehäirejadaga 0.25 h puhta aja jooksul. Miski siin ei ütle midagi päris vastuvõtja kohta. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162): laeva navigeerimise eest vastutab jätkuvalt operaator.">
</picture>

**Registri olek: MODELLED.** Läved fikseeriti enne ühtegi hinnatud käivitust; JammerTest 2024 andmetel
ebaõnnestus minimaalse andmehulga reegel mõlemal käivitusel, seega ükski lävi ei ole hinnatav ja midagi ei väideta.
[Jammertest](docs/JAMMERTEST.md).

### Vastuvõtja enda lipud

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG ja NovAtel RXSTATUS loetakse epohhipõhisesse
`self_report`-i ja asetatakse Kshana häirete kõrvale: mõlemad, ainult vastuvõtja, ainult Kshana või kumbki mitte.
Septentrio SBF lugeja ja ainult lugemiseks mõeldud `--serial` sisend toidavad sama võrdlust. Kumbki pool ei ole
tõetaust.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Vastuvõtja enda spuufimislipp Kshana häirete kõrval, mootori v0.40.0 tegelikust käivitusest väljamõeldud UBX logil (200 epohhi sagedusega 1 Hz). C/N0 langeb 20 dB ajavahemikel 80 kuni 90 s ja 120 kuni 130 s; vastuvõtja märgib lipuga 120 kuni 130 s ja 160 kuni 165 s. Pärast kalibreerimist võrreldud 140 epohhist märkisid 11 lipuga mõlemad, 6 ainult vastuvõtja, 11 ainult Kshana ja 112 kumbki mitte. Kumbki pool ei ole tõetaust ja kokkulangevus ei ole valideerimine. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

**Registri olek: MODELLED.** Vastuvõtja detektori ja Kshana detektori kokkulangevus ei ole
valideerimine. [Vastuvõtja usaldus](docs/RECEIVER-TRUST.md).

### Rohkem vastuvõtjaid ja andureid

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, GNSS-SDR monitorivood, IMU logi teise
andurina, ROS 2 pakett ja `gnss_lib_py` sild lõpevad kõik samal vastuvõtja usalduse ajajoonel.
`imu-fit` loeb hübriid- ja fusioonistsenaariumide vajatavad anduriparameetrid paigalseisva IMU
logist, nii et stsenaariumi saab käivitada anduriga, mis sul tegelikult on.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Mida `kshana imu-fit` loeb paigalseisva IMU logist, mootori v0.40.0 tegelikust käivitusest väljamõeldud logil (20,000 näidist sagedusega 100 Hz, 200 s): kiirendusmõõturi kiiruse juhuslik ekslemine q_va = 4.02e-06, güroskoobi nurga juhuslik ekslemine q_arw = 9e-08, nihke ebastabiilsus 0.00296 ning varased Allani tõusud (-0.51 ja -0.49; umbes -0.5 seal, kus domineerib valge müra). Kõrvalolev tabel on TOML, mille käsk välja trükib. Hindajat on kontrollitud ainult sünteetilistel logidel. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

**Registri olek: MODELLED.** Ainult ise kirjutatud testiandmed; ühtegi päris vastuvõtja, IMU,
GNSS-SDR käivituse ega ROS-graafi salvestust ei loetud. [Masinsisendid](docs/MACHINE-INPUTS.md).

### Ajastuse ja holdoveri testid

Liik `holdover-test` hindab holdover-testi (operaator eemaldab GNSS-i, holdover, taastumine)
mõõdetud ajaveasalvestusest ITU-T maskide vastu ja ütleb seda just nende sõnadega: mõõdetud
maski vastu. Seda toidavad linuxptp ja chrony logilugejad; riistvaraetapid ja
väli `lab-attestation` ütlevad, kes mida väitis.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Ajaveasalvestusest hinnatud holdover-test, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/holdover-test-example.toml (601 näidist iga 5 s järel). Operaator eemaldab GNSS-i ajal 600 s ja taastab selle ajal 2400 s; ajaviga triivib holdoveri lõpuks 299 ns-ni, ületab 100 ns eelarve 675 s järel ja naaseb 100 ns ribasse 70 s pärast taastamist. Otsused: lähtetaseme maskid PASS, holdoveri maskid FAIL, holdoveri ümbrik FAIL, taastumine RECOVERED. Mõõdetud maski vastu, mitte heakskiit. Ajad on operaatori väide, Kshana neid ei kontrolli. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

**Registri olek: MODELLED.** Ajad, mil GNSS eemaldati ja taastati, on operaatori väide,
mitte kontrollitud. [Ajastuse HIL](docs/TIMING-HIL.md), [Riistvara ohutus](docs/HARDWARE-SAFETY.md).

### Standardipaketid

Hinnatud paketid DHS Resilient PNT testiprofiilide, IMO MSC.1/Circ.1575 ja ICAO Doc 9849
Appendix F jaoks, lisaks NIST IR 8323r1 vastavustabel käsus `compliance-report`. Iga test käivitab kaasasoleva
stsenaariumi ja võrdleb tulemusvälja enne käivitust sõnastatud lävega; test, mis vajab vastuvõtja
logi, on loetletud sisendit vajavana, mitte hinnatuna. Sõnastus on „toetab tõendeid“.

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Kolme hinnatud standardipaketi kõik testid, mootori v0.40.0 tegelikest käivitustest (`kshana standards-pack run`): dhs-rpcf: 6 täidetud, 1 täitmata, 2 vajavad sisendit; imo-circ-1575: 1 täidetud, 4 täitmata, 2 vajavad sisendit; icao-doc9849-appf: 6 täidetud, 0 täitmata, 2 vajavad sisendit. Kokku 13 täidetud, 5 täitmata ja 6 vajavad sisendit, mida mootoril ei ole (vastuvõtja logi või seadme dokumentatsioon). Iga lävi sõnastati enne käivitust; möödalask jäetakse möödalasuks. Täidetud lävi ütleb, et modelleeritud stsenaarium täitis sõnastatud läve, ega midagi toote kohta. Paketid toetavad tõendeid ridadele, millele nad viitavad; need ei ole hindamine. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus; see ei tohi olla ainus alus ühegi navigatsiooni- ega ohutusotsuse tegemisel.">
</picture>

**Registri olek: MODELLED.** Täidetud lävi ütleb, et modelleeritud stsenaarium täitis sõnastatud läve, ega midagi
toote kohta; iga möödalask säilitatakse ja fikseeritakse testiga. [Standardid](docs/STANDARDS.md).

### LunaNet AFS

LunaNet Augmented Forward Signali koodigeneraator (Goldi, Weili ja tertsiaarsed koodid, sõnumiraam
ja selle veakodeerimine) ning salvestatud või genereeritud sümbolivoo kontrollija, kinnitatud spetsifikatsiooni
ühe väljaande külge.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="LunaNet AFS koodigeneraator kontrollituna spetsifikatsiooni trükitud veergude vastu, mootori v0.40.0 tegelikust käivitusest (`kshana lunanet-afs-check spec`, kinnitatud LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29. jaanuar 2025 külge; dokument märgib oma koodtabelid {LSIS-TBC}). 10 kontrollist 9 on täidetud; B4 on NOT MET (421-st sobis 420). See kontrollib sümbolivoogu avaldatud spetsifikatsiooni ühe väljaande vastu ega ütle midagi ühegi LunaNeti sõlme ega teenuse kohta. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus. See kontrollib sümbolivoogu avaldatud spetsifikatsiooni ühe väljaande vastu ega ütle midagi ühegi LunaNeti sõlme ega teenuse kohta.">
</picture>

**Registri olek: VALIDATED** koodi- ja sünkroniseerimiskontrollide puhul, väärtuste vastu, mille
spetsifikatsioon trükib (ja mille see märgib TBC); üks kontroll on NOT MET, säilitatud ja fikseeritud (üks trükitud
tertsiaarkoodi veerg erineb: dokument trükib kahe PRN-i jaoks sama väärtuse). Alamraamide 2 kuni 4 LDPC- ja CRC-sõnu
ei kontrollita. Registriread ütlevad täpselt, milliseid. [LunaNet AFS](docs/LUNANET-AFS.md).

### Laborite ringreis

`kshana.test-conditions/1` on avaldatud kirjeldus sellest, mida labor tegi (sündmused, ajad,
võimsused). `kshana evidence round-trip` seob stsenaariumi räsi, tingimuste räsi, vastuvõtja logi
räsi ja hinde üheks allkirjastatud paketiks ning keeldub paketist, mille tingimused ja hindamisstsenaarium
on sündmuste osas eri meelt. Kshana ei tooda ega taasesita kunagi signaali: see, kuidas stsenaarium
vastuvõtjani jõudis, on operaatori vastutus.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Tõendipaketi struktuur. Vastuvõtja logi (NMEA, u-blox UBX, RINEX 3 või Androidi logi) ja ajaaken lähevad käsku kshana receiver-trust evidence, mis kirjutab seitse faili: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig ja valikulise timestamp.tsr. Manifest salvestab kogu logi ja iga faili SHA-256 ning räsiahela üle failide; allkiri katab manifesti. kshana evidence verify kontrollib allkirja, iga faili räsi, ahelat ja seda, et loetlemata faile pole, ning lõpetab koodiga 0, kui kontrollitud, 1, kui midagi ebaõnnestus, ja 3, kui allkirjastajat ei olnud kinnitatud. Pakett on tehniline kirje, mitte juriidiline arvamus.">
</picture>

Pilt on paketi ülesehitus. **Registri olek: MODELLED.**
[Katsetingimused](docs/spec/TEST-CONDITIONS.md), [Katsestend](docs/TEST-BENCH.md).

### kshana-bench

Fikseeritud ülesanded, jaotused ja mõõdikud häirete tuvastamiseks, IQ-tuvastuseks, holdoveri ennustamiseks ja
optimismilõhe jaoks, suletud holdout-komplekti ja staatilise edetabeliga. See hindab esitusi; see ei ole
vastuvõtjate pingerida.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="kshana-bench ülesande D (optimismilõhe) sisseehitatud lähtetasemed testijaotusel, mootori v0.40.0 tegelikust käivitusest (`kshana bench baseline`). Iga tulbapaar on ROC-kõvera alune pindala jaotusesisestel juhtudel ja nihutatud juhtudel; nendevaheline lõhe on optimismilõhe, tolerantsi 0.05 vastu. fused-max-z: 0.998 ja 0.983 (lõhe 0.015); sqm-imbalance: 0.882 ja 0.882 (lõhe 0.001); agc-excess: 0.848 ja 0.819 (lõhe 0.030); raim-parity: 0.682 ja 0.672 (lõhe 0.010); energy-cn0-drop: 0.595 ja 0.565 (lõhe 0.030). Sildid on sünteetilise korpuse generatiivse mudeli sildid, mitte kunagi väliandmed: MODELLED. Nõuandev: modelleeritud või mõõdetud sõnastatud etalonide vastu, mitte heakskiit, sertifitseerimine ega vastavusavaldus. Hinne kirjeldab logi või korpust, mitte kunagi toodet.">
</picture>

**Registri olek:** oma registririda ei ole; lähtetasemed on tulemusfailides märgitud MODELLED.
Eelregistreeritud lävede vastu on hindaja, C1 kuni C3 ja D2 täidetud ning kolm läve on NOT MET, igaüks
testiga fikseeritud: A2 (`agc_k_sigma` AUC 0.766 vähemalt 0.80 vastu testijaotusel), D1 (suurim lõhe
0.0301) ja ülesanne (b) R1 (üle kantud varasemast kampaaniast, mitte uuesti käivitatud). Arvud on failis
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Häireobservatoorium

Üks produkt UTC päeva ja piirkonna kohta avatud õhusõidukite asukohaarhiivist, fikseeritud jämedal võrgustikul:
iga lahter on halvenenud, mitte halvenenud või vaatlemata (mis ei tähenda „puhas“). Avaldatakse mitte varem
kui 24 h pärast päeva lõppu, väikesed lahtrid summutatud ja põhjust ei omistata.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Kaks sünteetilist häirekaardi päeva, joonistatud kataloogi examples/interference-map/output lisatud näidistest, kummalgi oma sünteetiline marsruut ja marsruudi kokkupuute osakaalud, mille mootor esitab. Vasakul ADS-B päev: 1 halvenenud lahter, 6 mitte halvenenud, 4 hindamata (viirutatud) ning kirjeta lahtrid, joonistatud tühjana, mida ei vaadeldud. Marsruut on 525 km: 11.5% selle pikkusest halvenenud lahtrites, 38.3% mitte halvenenud, 9.1% hindamata ja 41.1% vaatlemata. Paremal AIS päev: ringi- ja maismaadetektorite märgitud lahtrid, mitteanomaalsed lahtrid ja tühjad lahtrid; marsruut on 454 km, 10.5% anomaalsetes lahtrites, 21.2% mitteanomaalsetes, 0.0% hindamata ja 68.3% vaatlemata. ADS-B ja AIS on eraldi kihid, mida kunagi ei kombineerita. Märgitud lahter ei ole häire tuvastamise järeldus ning värvita lahtrit ei vaadeldud, mis ei ole sama mis puhas. Kõik andmed on väljamõeldud, avatud Atlandi ookeani keskosas, ega ole mõõtmine.">
</picture>

Pilt on lisatud näidispäevad, mitte observatooriumi produkt. **Registri olek: MODELLED**:
välist oraaklit ei ole, tõetausta ei ole ja põhjust ei omistata; vaatlemata lahtrit ei
hinnatud, mis ei ole sama mis puhas. [Observatooriumi meetod](docs/observatory/METHOD.md).

### Eksportijad

Usaldustelemeetria Prometheuse tekstina, CEF-, LEEF-, OTLP- ning Home Assistanti MQTT avastus- ja olekusõnumitena.
Käsk avaldab ainult sulle antud sihtkohta ega hoia mandaate.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Üks usaldustulemus kolmes ekspordivormingus, mootori v0.40.0 tegelikest käivitustest (`kshana trust-telemetry`) näitel examples/maritime-trust: Prometheuse tekstiväljund (viimane usaldusskoor on 5.9 ja seatud on mitteusaldatav vahemik) ning viimased CEF- ja LEEF-sõnumid. Käsk ei avalda midagi, kui sihtkohta ei anta, ei hoia mandaate ega edasta raadiosignaali. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162): laeva navigeerimise eest vastutab jätkuvalt operaator.">
</picture>

**Registri olek: MODELLED.** [Usaldustelemeetria](docs/TRUST-TELEMETRY.md).

### Optilise lingi varu ajas

Liik `optical-atmosphere` saab kirjutada ühe seemnega realisatsiooni asukoha ilmast lingivaru
aegreana: pilveepisoodid, igaühe jaoks vedela vee sammas, üks stsintillatsiooninäidis sammu kohta.
Studio optilise PNT leht avab optical-atmosphere stsenaariumid.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Asukoha 'northern' lingivaru üks seemnega realisatsioon 336 h jooksul, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/optical-atmosphere-network.toml (seeme 37, samm 600 s). Varu langeb pilveepisoodide ajal alla nulli; selles valimis on link üleval 40.5 % ajast, 27 katkestusega ja pikim katkestus kestab 30.7 h. Sisendid on illustratiivsed, aegrida on üks valim mudelist, mitte kliima, ning see erineb statistilisest käideldavusest (37.8 %) valimi juhusliku vea võrra. Ainult nõuandev analüüs: mitte sertifitseeritud käideldavuse, terviklikkuse ega navigatsiooni produkt ega ennustus ühegi päris asukoha kohta, kui selle kliimasisendid ei pärine sõnastatud andmekogumist.">
</picture>

**Registri olek: MODELLED.** Üks valim mudelist, mitte kliima. [Optiline atmosfäär](docs/OPTICAL-ATMOSPHERE.md).

### Uued Studio vaated

[kshana.dev/studio](https://kshana.dev/studio/) saab juurde silla taasesituse (kaks käivitust kõrvuti ühel
missioonikellal, aadressil [`/studio/replay/`](https://kshana.dev/studio/replay/)), optilise PNT lehe
(`/studio/optical/`), holdover-testi lehe (`/studio/holdover/`) ja observatooriumi vaaturi
(`/studio/observatory/`). Need käitavad brauseris sama mootorit, midagi ei laadita üles ja need kannavad
sama nõuandvat märkust. Ülaltoodud pildid on skripti abil joonistatud mootori enda väljundist;
need ei ole nende lehtede ekraanipildid.

<a id="space-user-navigation-gnss-ssv"></a>
### Kosmosekasutaja navigeerimine (`gnss-ssv`)

Kosmoselaevale, mis on GNSS-orbiitidest kõrgemal, nende ümber või neist kaugel: mitu GNSS-signaali see saab kasutada, kui
tugevad need on, kui hea on geomeetria ja mida pardafilter nendega teha suudab. Üks liik,
neli režiimi, valitud stsenaariumi tabelitega: kasutajate **kest** (ajaosa ühe ja nelja
signaaliga, konstellatsiooni kaupa), **trajektoor** (signaalid, C/N0, täpsuse lahjenemine ja
servakiire keskkond piki orbiiti), **navigatsiooni**käivitus (üheksaolekuline filter pseudokaugustel, kuni
Kuuni) ja **formatsioon** (abilaevade suhteline navigeerimine juhtsatelliidi ümber). Käideldavuse võrdluse
avalik allikas on koostalitlusvõimelise GNSS Space Service Volume'i brošüür (UN OOSA
ST/SPACE/75, GNSS-i rahvusvaheliselt komiteelt), mis on ise simulatsioon; see laaditakse alla, seda ei lisata
kunagi hoidlasse. Täielik leht: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Signaalide käideldavus kasutajale 36000 km kõrgusel sfääril poolsfääri antenniga, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/gnss-ssv-shell.toml (vähendatud käivitus: 162 kasutajat, 3 päeva, 10 min sammud), läve 20 dB-Hz juures. Iga konstellatsiooni ja sagedusala kohta kaks tulpa: (kasutaja, epohh) paaride osakaal vähemalt ühe signaaliga ja vähemalt neljaga. Kombineeritult, L1: 99.4 % vähemalt üks, 73.2 % vähemalt neli, pikim katkestus alla nelja signaali 160 min. Kombineeritult, L5: 100.0 % vähemalt üks, 99.9 % vähemalt neli, pikim katkestus alla nelja signaali 20 min. MODELLED: modelleeritud uuring sõnastatud sisenditest, mitte mõõtmine ega teenindusruumi väide ühegi süsteemi kohta. Vähendatud suurus ei ole brošüüriga võrdlus. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signaalid piki ühte kõrget Maa orbiiti (perigee 497 km, apogee 58622 km, periood 18.8 h), mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/gnss-ssv-heo.toml, sagedusala L1. Ülal: parim kandja ja müra tiheduse suhe nähtavate signaalide seas 20 dB-Hz läve vastu. Keskel: kõigi konstellatsioonide nähtavate signaalide arv, 4 kuni 55 valimipunktide lõikes. Vastu võetud linkidest tuli 2252 läbi peakiire ja 696 läbi külgkiirte, kasutades märgistatud parameetrilist asendusmustrit, mitte ühegi süsteemi mõõdetud mustrit. PDOP mediaan 67, 95. protsentiil 358. MODELLED: modelleeritud uuring sõnastatud sisenditest, mitte mõõtmine ega teenindusruumi väide ühegi süsteemi kohta. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Üheksaolekuline pardafilter üleminekul madalalt orbiidilt Kuu suunas, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/gnss-ssv-nav-lunar.toml (289 epohhi, joonistatud 13 punkti). Logaritmteljel tegelik asukohaviga ja filtri enda ühe sigma piir ajas alates algusest. GNSS-orbiitide sees on asukoha RMS 1.4 m; nende kohal 90 m, lõplik viga 184 m kõrgusel 193,330 km 1 mõõtmisega. Keskmine normeeritud hindamisvea ruut üle kogu käivituse on 4.4 (järjepideva asukohaploki puhul umbes 3). Tõde ja filter jagavad oma Päikese ja Kuu asendusmudeleid. MODELLED: modelleeritud uuring sõnastatud sisenditest, mitte mõõtmine ega teenindusruumi väide ühegi süsteemi kohta. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="2 abilaeva suhteline navigeerimine juhtsatelliidi ümber kõrgel orbiidil, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/gnss-ssv-formation-heo.toml (401 epohhi). Iga abilaeva kohta kaks tulpa: suhtelise asukoha RMS kahe sõltumatu absoluutse hinnangu lahutamisel ja suhtelisest filtrist ühekordselt diferentseeritud pseudokaugustel. Baas 0.8 km: 5.1 m ja 1.2 m. Baas 2.0 km: 4.1 m ja 2.1 m. Absoluutne filter ei ole siin järjepidev: keskmine normeeritud hindamisvea ruut 187 vs umbes 3 järjepideva filtri puhul, seega on selle esitatud määramatus kaugelt liiga väike. MODELLED: modelleeritud uuring sõnastatud sisenditest, mitte mõõtmine ega teenindusruumi väide ühegi süsteemi kohta. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

**Registri olek: MODELLED ning võrdlus brošüüriga jääb enamasti alla.** Läved fikseeriti enne
käivitust. Kaheksast on täidetud ainult S0 (pöördlingieelarve, 13 väärtust 13-st) ja S6 (Kuu missioon).
**S1 kuni S5 ja S7 on NOT MET**: ülemise ja alumise teenindusruumi geomeetria (52-st 43 ja 52-st 48
lahtrit), 15/20/25 dB-Hz ülemine teenindusruum, kuus GEO missiooni, HEO missioon ning
parameetriline külgkiirte muster mõõdetud GPS-i paneelimustrite vastu. Peaaegu iga möödalask kriteeriumides S1 kuni S5 puudutab
GLONASSi ning brošüür trükib selle jaoks kaks erinevat tugivinklit; diagnostiline variant, mis kasutab
teist paari, viib S1, S2 ja S4 kõigis lahtrites täitmiseni, kuid see ei asenda ametlikku käivitust ja ükski rida ei ole
VALIDATED. Formatsioonikäivituse absoluutne filter on samuti ülekindel (keskmine normeeritud vea ruut
tunduvalt üle väärtuse umbes 3, mille järjepidev filter annab).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Kosmosekasutaja käideldavusmudeli salvestatud võrdlus avaliku Space Service Volume'i brošüüriga, eelregistreeritud käivituse lisatud tulemustest (xval/gnss-ssv/results-run1.json, kirjutatud mootori v0.40.0 näitega ssv_booklet_check). Tulp tulba haaval tolerantsi piires olevad lahtrid: S0 13-st 13 (MET); S1 52-st 43 (NOT MET); S2 52-st 48 (NOT MET); S3 155-st 122 (NOT MET); S4 156-st 132 (NOT MET); S5 26-st 18 (NOT MET); S6 26-st 26 (MET); S7 20 paneelimustrist 0 (NOT MET). Eelregistreeritud tõlgenduse järgi on täidetud ainult S0 ja S6. Diagnostiline variant, mis kasutab brošüüri teisi GLONASSi nurki, viib S1, S2 ja S4 kõigis lahtrites täitmiseni, kuid ei asenda ametlikku käivitust. Ükski registririda ei ole VALIDATED. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

[Kosmosekasutaja navigeerimine](docs/SSV.md), [mida võrdlus näitab](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Kuu infrastruktuur (`lunar-infrastructure`)

Kuu orbiit ja pind navigatsiooni- ja geodeetilise infrastruktuurina, viies uuringus, mis valitakse väljaga
`study`: **od-consistency** (pardal tehtav Maa GNSS-il põhinev orbiidi määramine haloorbiidil sõltumatu
maapealse vastu), **carrier-phase** (täisarvulise mitmetähenduslikkuse fikseerimine pinnajaamade ja
orbiiteri vahel), **frame-coestimation** (Kuu daatum Maa jaamade kaugusmõõtmisest orbiiteri linkidega ja ilma),
**space-tie** (laseri, VLBI ja GNSS-i nihked ühel kosmoselaeval kohaliku seose vea vastu) ja
**geodesy-sensitivity** (milline vaadeldavate perekond näeb Love'i arve h2, k2 ja l2). Mudel on
piiratud kolme keha mudel sõnastatud lihtsustuste ja illustratiivsete sisenditega. Täielik leht:
[docs/LUNAR-INFRASTRUCTURE.md](docs/LUNAR-INFRASTRUCTURE.md).

```sh
kshana scenarios/lunar-infrastructure-od-consistency.toml
kshana scenarios/lunar-infrastructure-carrier-phase.toml            # quick; the scored run takes about eight minutes
kshana scenarios/lunar-infrastructure-frame-coestimation.toml
kshana scenarios/lunar-infrastructure-space-tie.toml
kshana scenarios/lunar-infrastructure-geodesy-sensitivity.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-od-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-od-light.svg">
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Pardal tehtava Maa GNSS-il põhineva orbiidi määramise järjepidevus peaaegu sirgjoonelisel haloorbiidil sõltumatu maapealse orbiidi määramisega, mootori v0.40.0 tegelikest käivitustest stsenaariumil scenarios/lunar-infrastructure-od-consistency.toml ja mudeliveaga variandil (kumbki 400 katset). Keskmine normeeritud erinevus q on 5.81 ilma mudeliveata ja 5.95 sisestatud kiirendusveaga 3e-10 m/s2, oodatava 6 vastu: kaks orbiidilahendit on järjepidevad (lävi C1 MET). 95 % punktist kõrgemate katsete osakaal on 0.040 ja 0.052; sisestatud vea tuvastamise lävi oli vähemalt 0.5, seega on see NOT MET (C3): pardalahend on teada umbes 352 m täpsusega maapealse 23 m vastu, nii et kümnemeetrine nihe peitub selle kovariatsiooni sisse. MODELLED: piiratud kolme keha mudel sõnastatud lihtsustuste ja illustratiivsete sisenditega, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Kandelaine faasi täisarvulise mitmetähenduslikkuse fikseerimine Kuu pinnajaamade ja orbiiteri vahel, mootori v0.40.0 hinnatud käivituse lisatud tulemusest (tests/fixtures/lunar_infra/phase_full_run.json: 3 kaare pikkust, igaühel 401 valimiga Monte Carlo, kirjutatud stsenaariumiga scenarios/carrier-phase-scored.toml). 1 päev: edukus 1.0 % (standardviga 0.5 %), 134 mitmetähenduslikkust, orbiteri asukoha sigma 45.6 m ujuvana ja 18.5 m fikseerituna; 2 päeva: edukus 0.5 % (standardviga 0.4 %), 259 mitmetähenduslikkust, orbiteri asukoha sigma 21.5 m ujuvana ja 8.7 m fikseerituna; 3 päeva: edukus 2.8 % (standardviga 0.8 %), 375 mitmetähenduslikkust, orbiteri asukoha sigma 6.3 m ujuvana ja 2.1 m fikseerituna. Täisarvulist fikseerimist ei saavutata: edukus jääb 25 dBi juures 1 % ja 3 % vahele ning registreeritud 12 dBi juures ei saa ülesannet moodustada. MODELLED: piiratud kolme keha mudel sõnastatud lihtsustuste ja illustratiivsete sisenditega, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Seitsmeparameetrilise Kuu daatumi (kolm nihet, mastaap ja kolm pööret) täpsus Maa jaamade kaugusmõõtmisest, orbiteri ja pinnajaama vaheliste kaugustega ja ilma, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/lunar-infrastructure-frame-coestimation.toml. Nihete ja pöörete Cramer-Rao sigma langeb orbiteri linkidega (näiteks t_z 0.98 m-lt 0.046 m-le); väikseim informatsiooni omaväärtus tõuseb 111-kordselt ja CRLB jälg langeb 1.0 %-ni (lävi F3 MET). See eeldab, et orbiit on Kuu telgedes teada, selle viga kantud orbiteri kauguse sigmaga 1 m. MODELLED: piiratud kolme keha mudel sõnastatud lihtsustuste ja illustratiivsete sisenditega, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Ühe kosmoselaeva laserkaugusmõõtmise, VLBI ja GNSS-i asukohtade vaheliste nihete täpsus maapealse kohaliku seose vea suhtes, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/lunar-infrastructure-space-tie.toml (üks 6.56-päevane kaar, meetodite sigmad GNSS 10 m, VLBI 1 m, laser 0.1 m). Kohaliku seosega 1 mm kuni 1 m jääb laser-miinus-GNSS nihke sigma umbes 1.04 m juurde, kuni seos jõuab 1 m-ni: seda piirab meetodite mõõtemüra, mitte kohalik seos. Ainuüksi seose seatud alampiir on ruutjuur kahest korda selle sigma. MODELLED: piiratud kolme keha mudel sõnastatud lihtsustuste ja illustratiivsete sisenditega, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Milline vaadeldavate perekond on tundlik Kuu Love'i arvude h2, k2 ja l2 suhtes, mootori v0.40.0 tegelikust käivitusest stsenaariumil scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Iga lahter on perekonna vaatluste RMS osatuletis parameetri järgi, selle perekonna enda ühikutes (seega võrreldakse lahtreid piki rida, mitte piki veergu); kriips tähendab, et perekonnal tundlikkus puudub. laserkaugusmõõtmine: h2 7.6, k2 puudub, l2 9.8. orbiteri jälgimine: h2 puudub, k2 0.00086, l2 puudub. pinnagravimeeter: h2 2.9e+03, k2 4.3e+03, l2 puudub. pinnakell: h2 2.8e-17, k2 2.8e-17, l2 puudub. Kõigi nelja perekonnaga on Cramer-Rao sigma 0.36 % nominaalsest h2-st, 0.52 % k2-st ja 1.16 % l2-st. Perekonna lisamine ei vähendanud kunagi väikseimat omaväärtust (28 lisamist 28-st), kuid pseudopöördmaatriksi jälg ei olnud suurem ainult 16 juhul 28-st: läve G3 see pool on NOT MET. Orbiteri perekond näeb k2 kiirenduse vaatesihi integraali, ülemise otsa arvu. MODELLED: piiratud kolme keha mudel sõnastatud lihtsustuste ja illustratiivsete sisenditega, mitte ühegi Kuu suuruse mõõtmine. Nõuandev: uurimis- ja insenertööriista analüüsiväljund, mitte tüübikinnitust omav navigatsiooniseade ega elutähtis ohutusteenus.">
</picture>

**Registri olek: MODELLED ning kolm läve on NOT MET.** Numbrilisi tulemusi kontrollitakse sõltumatute
numpy ja scipy programmide vastu; midagi ei võrrelda ühegi Kuu suuruse mõõtmisega ja miski ei ole
VALIDATED. Täidetud: kaks orbiidilahendit on järjepidevad (keskmine q 5.81 oodatava 6 vastu) ning orbiteri
lingid tõstavad väikseimat daatumi omaväärtust umbes 111-kordselt, eeldades teadaolevat orbiiti. **Täitmata**:
sisestatud 3e-10 m/s2 mudeliviga **ei tuvastata** (C3: pardalahend on teada umbes 350 m täpsusega, seega
peitub umbes kümme meetrit selle kovariatsiooni sisse); **täisarvulist fikseerimist ei saavutata** (1 kuni 3 % edukus
25 dBi juures ning registreeritud 12 dBi juures ei saa ülesannet moodustada); ning G3 jälje pool vaadeldavate
perekonna lisamisel (jälg tõusis 12 lisamisel 28-st, iga kord seetõttu, et perekond tõstis astakut).
Iga möödalask on testiga fikseeritud. [Kuu infrastruktuur](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Ava [kshana.dev/studio](https://kshana.dev/studio/) ja kogu mootor töötab sinu
brauseris, kompileerituna WebAssemblyks. Midagi ei pea paigaldama ja midagi ei laadita üles. Studios on
sama mootori kaks vaadet ning päises olev lüliti liigub nende vahel, säilitades
stsenaariumi, vaate ja kõik muudetud seaded.

**Lihtne vaade** on see, millega Studio avaneb. See algab küsimustest (mitu satelliiti
ma näen, kas ma saan oma asukohafiksi usaldada, kui kaua kell suudab aega hoida, mida segaja
mu vastuvõtjaga teeb) ja kaardist kõigest, mida mootor teha suudab, iga valdkond koos selle valideeritud
meetodite osakaaluga. Ava stsenaarium ja vastus tuleb esimesena: üks lihtne lause, kirjutatud selle järgi,
mida see stsenaarium mõõdab, seejärel selle põhinäitajad ja graafik. Korraga on näha kõige rohkem viis
seadet, need, mis muudavad vastust kõige enam; ülejäänud ootavad jaotises **Täpsemad seaded**.
**Kuidas see arvutatakse** selgitab meetodit ning **Teadlastele** annab mootori enda
arvud, stsenaariumifaili, koodi selle Pythonist käivitamiseks ja viite.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, lihtne vaade, kaasasoleval stsenaariumil integrity-raim, mootor v0.40.0 töötab kohapeal. Küsimus: kas geomeetria täidab häirepiire (horisontaalne ja vertikaalne kaitsetase)? Kõigepealt vastus, märgitud Reaalajas tulemus: Jah, enamasti: 95.3 % ajast 12 h jooksul. Vastuvõtja veapiir püsis häirepiiridest (40 m horisontaalne ja 50 m vertikaalne) allpool 344 kontrollil 361-st ja ükski fiks ei olnud eksitav. Põhinäitajad: aeg, mil fiksi saab usaldada, 95.3 %, pikim lünk 10 min, tüüpiline veapiir 6.5 / 13 m, eksitavad fiksid 0. Kõrval Proovi teisi seadeid viiega neist (kaugusviga, kaks häirepiiri, kestus ja kõrgusmask) ning Käivita uuesti, seejärel kokku volditud jaotised Täpsemad seaded (13 veel), Kuidas see arvutatakse (8 valideeritud, 6 modelleeritud) ja Teadlastele. Allpool selle tulemuse vaated ja kaitsetasemed joonistatuna häirepiiri suhtes." width="100%">
</picture>

**Täpsem vaade** on täielik juhtpaneel: stsenaariumiteek, viis nummerdatud sammu
(Vali, Seadista, Käivita, Loe tulemusi, Jaga või ekspordi), põhinäitajad PASS ja FAIL märkidega
seal, kus käivitus sõnastab läve, ning iga paneel: ülevaade, graafikud, kaardid, taasesitus,
mootori aruanne ja ekspordid. Üks otsingukast jõuab stsenaariumide, valdkondade ja nende sees olevate
väljadeni ning sa saad kinnitada kuni neli käivitust ja neid kõrvuti võrrelda.

<details>
<summary>Lihtsa vaate avakuva ja täpsem vaade pärast käivitust</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, lihtne vaade, avakuva pealkirjaga Mida soovid teada saada?, mootor v0.40.0 töötab ning ülemisel ribal kolm linki: Treeningu järelanalüüs, Häirekaart ja Vastuvõtja usaldus. Neli küsimust: mitu satelliiti näen ma kõikjal Maal, kas ma saan oma asukohafiksi usaldada, kui kaua suudab kell ilma satelliitideta aega hoida ja mida teeb segaja mu vastuvõtjaga. Esimese all selle salvestatud tulemus: vähemalt 22 satelliiti nähtaval igas kohas ja keskmiselt 31 GPS-i, Galileo, BeiDou ja GLONASSiga koos, fiks võimalik 100 % kohtades ja aegadel, nähtavate satelliitide maailmakaardil, nupuga Ava see tulemus. Kõrval Kõik, mida Kshana suudab: 16 valdkonda ja 139 käivitusvalmis stsenaariumi, igal paanil väike graafik salvestatud käivitusest ja selle valideeritud meetodite osakaal, ning registri 350 võimekusest 173 valideeritud." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, täpsem vaade, pärast kaasasoleva stsenaariumi constellation-multi-gnss-coverage käivitust (Neli GNSS-konstellatsiooni, üks kaart), mootor v0.40.0 töötab kohapeal. Vasakul stsenaariumiteek, 139 stsenaariumi 16 valdkonnas. Viis sammu Vali, Seadista, Käivita, Loe tulemusi ja Jaga või ekspordi, praegu samm 4. Põhinäitajad: 102 satelliiti, käideldavus 100 % (PASS), asukoha täpsuse lahjenemise (PDOP) mediaan 0.95 (PASS), PDOP 95. protsentiil 1.105 (PASS), keskmiselt 31.03 nähtavat satelliiti ja vähemalt 22. Allpool paneelirida, kus on valitud Katvus, taasesitusriba, keskmise PDOP maailmakaart vahemikus 0.831 kuni 1.0853 kõigi satelliitidega joonistatult ja globaalse katvuse arvud." width="100%">
</picture>

</details>

Studio lähtekood ja selle ehitusmärkmed on failis [`web/README.md`](web/README.md).

### Veebisait

Ülejäänud [kshana.dev](https://kshana.dev) on ehitatud selle hoidla enda failidest ja
mootori käivitustest: missioonid, võimekused, tõendiregister, avaldatud uurimistöö ja
väljaanded.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Kolm kshana.dev lehte kõrvuti. Avalehe päis: nimerida Kshana · क्षण · täpne hetk pealkirja Harjuta minutit, mil GNSS kustub, kohal, koos mootori v0.40.0 tegeliku käivituse missioonikonsooliga (gloobus ja kolm reaalajas graafikut: kella ajaviga, kandja ja müra tiheduse suhe ning kaitsetase). Tõendid, Avaldatud uurimistöö: kuus avatud mootorile tuginevat arXivi artiklit, uusim mootori joonisega. Väljaanded, Kshana Pro, sama mootor, võimendatud: Free käivitab ühe stsenaariumi, Pro vastab programmi küsimusele." width="100%">
</picture>

<a id="capabilities"></a>
## Võimekused

Üks mootor katab kogu rikkeahela, alates esimesest segatud satelliidist kuni kella holdoveri viimase
nanosekundini. Mootoril on 92 stsenaariumiliiki; `kshana kinds` loetleb
need ja [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumenteerib iga välja.

| Võimekus | Millele see vastab |
|---|---|
| [Spekter](docs/SPECTRUM.md) | kuidas segaja võtab üle GNSS-i L-sagedusala, ala alalt, sekund sekundilt |
| [Kellad ja ajastus](docs/TELECOM-TIMING.md) | kui kaua iga kell hoiab aega pärast GNSS-i kadumist |
| [Konstellatsioonid mis tahes keha ümber](docs/CONSTELLATION-DESIGN.md) | katvus, täpsuse lahjenemine ja käideldavus Maa, Kuu või Marsi ümber |
| [Päikesesüsteem](docs/SOLAR-SYSTEM.md) | kus iga planeet asub ja mis tahes lingi valguse levimisaeg |
| [Madala Maa orbiidi navigeerimine](docs/LEO-PNT.md) | ülelend, link, navigatsioonisõnum ja ühendatud fiks, etapp etapi haaval |
| [Kampaaniad](docs/CAMPAIGNS.md) | aheldatud missioon, pühkimine või Monte Carlo ansambel ühes stsenaariumis |
| [Animatsioon](docs/ANIMATION.md) | käivituse aegread animeeritud joonisena, mängijana või kaadritena |
| [Aruanded](docs/REPORTS.md) | iga arv koos ühiku ja sildiga, HTML-is (HyperText Markup Language) ja JSON-is (JavaScript Object Notation) |
| [Koostalitlusvõime ekspordid](docs/INTEROP.md) | orbiidid ja geomeetria teistele tööriistadele: SP3, CCSDS OMM ja OEM, CZML, KML, GeoJSON, STK ja SigMF |
| [Mereala usaldus](docs/MARITIME-TRUST.md) | kas sild saab seda fiksi usaldada: 0-100 skoor ja põhjused laeva NMEA kohta, reaalajas või logist (nõuandev, mitte tüübikinnitust omav navigatsiooniseade) |
| [NMEA treeningvood](docs/NMEA-TRAINING.md) | sünteetiline silla NMEA skriptitud segamise ja spuufimise ning instruktori logiga, meeskonna väljaõppeks (ainult tekst; mitte kunagi laeva reaalajas navigatsioonisüsteemide jaoks; nõuandev, mitte tüübikinnitust omav navigatsiooniseade) |
| [Häirekaart](docs/INTERFERENCE-MAP.md) | kus õhusõidukid ja laevad teatasid halvenenud navigatsiooniandmetest ja kui suurt osa marsruudist see puudutab |
| [Häireallika piirkond](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | kus sõnastatud eeldustel võib asuda halvenenud asukohateadete allikas: piirkonnad sõnastatud usaldusnivooga, tsentroid koos ellipsiga, mitte kunagi punkt (MODELLED; `kshana interference-map locate`) |
| [Tõendipaketid](docs/EVIDENCE-PACKS.md) | allkirjastatud, võrguühenduseta kontrollitav tehniline kirje laeva logiaknast ja sellest, mida mootor sellest arvutas, intsidendiaruande jaoks (nõuandev, mitte tüübikinnitust omav navigatsiooniseade) |
| [Usaldustelemeetria](docs/TRUST-TELEMETRY.md) | usaldusvoog Prometheuse mõõdikutena, SIEM-sündmustena ja valikulise OpenTelemetryna, koos Grafana näidisjuhtpaneeliga (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K ja OpenCPN](docs/MARINE-INTEGRATIONS.md) | usaldusskoor paadi Signal K serveris ja OpenCPN-is, koos võrdlusehitusega väikesele arvutile vastuvõtja kõrval (nõuandev, mitte tüübikinnitust omav navigatsiooniseade) |
| [Katsestendi eksport](docs/TEST-BENCH.md) | `kshana bench-export`: stsenaariumi sõiduki liikumine ja sündmused labori GNSS-simulaatorile (signaali ei kirjutata) ja kuidas vastuvõtja logi hiljem hinnata |
| [Vastavuse kaardistus ja aruanne](docs/compliance/README.md) | `kshana compliance-report`: milliste avalike vastupidavusraamistike ridade jaoks käivituste kogum toetab tõendeid ja milline lünk jääb |
| [Märkmikud](notebooks/README.md) | käivitatavad õpetused: laeva usaldus ja treeningvood, häirekaardi marsruudi kokkupuude, vastavuse kaardistus ja katsestend, kvant- vs klassikaline GDOP |
| [Galileo OSNMA kontrollija](docs/OSNMA.md) | milliste satelliitide navigatsiooniandmeid saab vastuvõtja krüptograafiliselt autentida ja miks kontroll ebaõnnestub; Kshana ei anna mingeid õigusi ELi OSNMA ICD IPR-ide alusel (vt lehel olevat NOTICE'it) |

Ekspordivormingud täielikult: SP3 on Standard Product 3; CCSDS OMM ja OEM on Consultative Committee for Space Data
Systemsi Orbit Mean-elements ja Orbit Ephemeris Messages; CZML ja KML on Cesium ja Keyhole Markup Languages;
STK on Systems Tool Kit; SigMF on Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Aheldatud kampaania campaign-jam-spoof-holdover-integrity, mootori üks tegelik käivitus (seeme 20260928): 6 faasi (Nominaalne → Segamine → Spuufimine → Holdover → Terviklikkuse häire → Taastumine) ja 18 liikmeskäivitust 10 s võrgustikul ajavahemikus T+01:16:10. Kolm rada: kella ajaviga 50 ns kaitsepiiri vastu (tipp 62.7 ns), efektiivne kandja ja müra tiheduse suhe 25 dB-Hz alampiiri vastu (miinimum -12.2 dB-Hz) ja vertikaalne kaitsetase 50 m häirepiiri vastu (tipp 135.4 m), koos käivituse häiresündmustega: T+00:20:00 RF spuufimisdetektori häired (ühendatud järjepidevuse, võimsuse ja signaalikvaliteedi monitorid); T+00:26:10 kellaga abistatud spuufimismonitori häired." width="100%">
</picture>

<details>
<summary>Iga võimekus, joonistatud tegelikust käivitusest: L-sagedusala kosk, katvuskaart, päikesesüsteem ja madala Maa orbiidi ülelend</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="GNSS-i L-sagedusala ühe võimsusspektri tihedusena 60 s jooksul, spektri liigi tegelikust käivitusest (l-band-waterfall-jamming.toml, seeme 7, mootor v0.40.0): sagedus horisontaalselt, aeg allapoole, värv näitab võimsust üle -202.0 dBW/Hz mürapõranda. Segajad: chirp-privaatsusseade (chirp, sisse 10 s, välja 40 s); CW-toon L1-l (cw, sisse 30 s); L2 kitsasribamüra (narrowband, sisse 45 s). Halvim sagedusala GPS L1 C/A: minimaalne efektiivne C/N0 3.2 dB-Hz ajal 31 s 25 dB-Hz jälgimispõranda vastu. GPS L1 C/A miinimum 3.2 dB-Hz; Galileo E1 miinimum 4.7 dB-Hz; GPS L2C miinimum 36.9 dB-Hz; GPS L5 miinimum 44.1 dB-Hz; Galileo E5a miinimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Nähtavad satelliidid kogu Maa kohal ühe päeva jooksul, constellation-design liigi tegelikust käivitusest (constellation-multi-gnss-coverage.toml, mootor käivitatud selle generaatori poolt): 102 satelliiti (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Iga 10-kraadine lahter on varjutatud 10-kraadise maski kohal olevate satelliitide keskmise arvu järgi (27.2 kuni 36.5); punktid on mootori maapealse jälje valimid, üks tunnis satelliidi kohta. Globaalne käideldavus 100.00 % PDOP-i juures kuni 6, PDOP mediaan 0.95, keskmiselt 31.0 ja vähemalt 22 nähtavat satelliiti." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Päikesesüsteem stsenaariumi epohhil 2026-09-28T00:00:00, solar-system liigi tegelikust käivitusest (solar-system-tour.toml): Päike, 9 planeeti ja kääbusplaneet Pluuto vaadatuna ekliptika kohalt, kaugused kuvamiseks logaritmiliselt kokku surutud, koos iga keha ühesuunalise valguse levimisajaga Maalt. Merkuur 0.47 au, 10.1 valgusminutit, VALIDATED; Veenus 0.73 au, 3.0 valgusminutit, VALIDATED; Marss 1.55 au, 14.0 valgusminutit, VALIDATED; Jupiter 5.30 au, 49.5 valgusminutit, VALIDATED; Saturn 9.44 au, 70.2 valgusminutit, VALIDATED; Uraan 19.44 au, 157.4 valgusminutit, MODELLED; Neptuun 29.88 au, 240.2 valgusminutit, MODELLED; Pluuto 35.61 au, 292.2 valgusminutit, MODELLED. Lingid: Marss Jupiterini ühesuunaliselt 2193.5 s; Saturn Maani ühesuunaliselt 4212.2 s; Europa Jupiterini ühesuunaliselt 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Üks madala Maa orbiidi (LEO) ülelend leo-pass liigi tegelikust käivitusest (leo-pass-iridium.toml, mootor käivitatud selle generaatori poolt): Iridium-pass 781 km kõrgusel, STL sagedusala 1621 MHz, vaadatuna õhukasutaja poolt asukohas 50° N 30° W. 5° maski kohal 750 s, maksimaalne kõrgusnurk 65.0° ajal 444 s. Kandja ja müra tiheduse suhe saavutab tipu 80.5 dB-Hz (mediaan 71.3), 34.3 dB üle GNSS-i mediaani 46.2 dB-Hz 8 nähtavalt GPS-satelliidilt (38.2 kuni 51.1 dB-Hz); Doppler ulatub 35.4 kHz-ni." width="100%">
</picture>

Käivita ükskõik milline neist käsuga `kshana example <scenario> > s.toml && kshana s.toml`: stsenaariumid
on `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
ja `leo-pass-iridium`.

</details>

<details>
<summary>Mereala ja häirete võimekused, joonistatud lisatud sünteetilistest sisenditest: usaldusskoor, häirekaart koos marsruudi kokkupuutega, treeningvoog ja tõendipakett</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Usaldusskoor ühe sünteetilise reisi jooksul, mootori v0.40.0 tegelikust käivitusest näitel examples/maritime-trust (väljamõeldud NMEA logi parvlaevast Tallinna–Helsingi liinil, 3001 epohhi sagedusega 1 Hz). Kolm rada jagavad ühte ajatelge. Ülal: kaugus vastuvõtja teatatud asukoha ja laeva tegeliku asukoha vahel, mis püsib mõne meetri piires umbes 1576 s-ni, mil logi skriptitud asukoha äravedu selle eemale tõmbab, samal ajal kui vastuvõtja jätkab kehtiva fiksi teatamist. Keskel: usaldusskoor 0 kuni 100, mida esimese 300 s kalibreerimise ajal ei arvutata, nominaalses vahemikus (vähemalt 90) kuni äraveoni, seejärel langedes läbi halvenenud vahemiku (vähemalt 55) mitteusaldatavasse vahemikku. All: iga epohhi vahemik värvilise lindina koos nimega. Skoor on nõuandev. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162): laeva navigeerimise eest vastutab jätkuvalt operaator. Logi on välja mõeldud vormingu ja monitoride näitamiseks; see ei ole mõõtmine ega ütle midagi selle kohta, kuidas mõni vastuvõtja toimiks." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Kaks sünteetilist häirekaardi päeva, joonistatud kataloogi examples/interference-map/output lisatud näidistest, kummalgi oma sünteetiline marsruut ja marsruudi kokkupuute osakaalud, mille mootor esitab. Vasakul ADS-B päev: 1 halvenenud lahter, 6 mitte halvenenud, 4 hindamata (viirutatud) ning kirjeta lahtrid, joonistatud tühjana, mida ei vaadeldud. Marsruut on 525 km: 11.5% selle pikkusest halvenenud lahtrites, 38.3% mitte halvenenud, 9.1% hindamata ja 41.1% vaatlemata. Paremal AIS päev: ringi- ja maismaadetektorite märgitud lahtrid, mitteanomaalsed lahtrid ja tühjad lahtrid; marsruut on 454 km, 10.5% anomaalsetes lahtrites, 21.2% mitteanomaalsetes, 0.0% hindamata ja 68.3% vaatlemata. ADS-B ja AIS on eraldi kihid, mida kunagi ei kombineerita. Märgitud lahter ei ole häire tuvastamise järeldus ning värvita lahtrit ei vaadeldud, mis ei ole sama mis puhas. Kõik andmed on väljamõeldud, avatud Atlandi ookeani keskosas, ega ole mõõtmine." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Treeningvoog stsenaariumist coastal-drag-off (mootor v0.40.0, seeme 22, 25 minutit, üks fiks 10 s kohta instruktori logist). Kaart näitab laeva tegelikku rada ja rada, mida vastuvõtja teatab: need ühtivad, kuni skriptitud asukoha äravedu algab ajal 421 s, seejärel eemaldub teatatud rada tegelikust, samal ajal kui vastuvõtja hoiab kehtivat fiksi, ning naaseb, kui sündmus lõpeb ajal 1140 s. Kõrval kahe raja vaheline kaugus ajas ja vastuvõtja teatatud keskmine kandja ja müra tiheduse suhe, mis tõuseb sündmuse ajaks ühele kõrgemale tasemele. Kshana genereeritud sünteetilised treeningandmed. Ainult väljaõppeks ja testimiseks: ära kunagi suuna seda voogu laeva reaalajas navigatsioonisüsteemidesse. Nõuandev, mitte tüübikinnitust omav navigatsiooniseade. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162): laeva navigeerimise eest vastutab jätkuvalt operaator. Asukohad, kuupäevad ja rajad on välja mõeldud." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Tõendipaketi struktuur. Vastuvõtja logi (NMEA, u-blox UBX, RINEX 3 või Androidi logi) ja ajaaken lähevad käsku kshana receiver-trust evidence, mis kirjutab seitse faili: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig ja valikulise timestamp.tsr. Manifest salvestab kogu logi ja iga faili SHA-256 ning räsiahela üle failide; allkiri katab manifesti. kshana evidence verify kontrollib allkirja, iga faili räsi, ahelat ja seda, et loetlemata faile pole, ning lõpetab koodiga 0, kui kontrollitud, 1, kui midagi ebaõnnestus, ja 3, kui allkirjastajat ei olnud kinnitatud. Pakett on tehniline kirje, mitte juriidiline arvamus." width="100%">
</picture>

Kõik neli on väljamõeldud andmed ja nõuandvad: need näitavad tarkvara vormingut ja käitumist, mitte seda, kuidas mõni vastuvõtja või süsteem häirete korral toimib. Käivita esimene käsuga `kshana receiver-trust examples/maritime-trust/session.toml`, teine käsuga `kshana route-exposure` näidistel kataloogis `examples/interference-map/`, kolmas käsuga `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (ainult väljaõppeks: ära kunagi suuna seda reaalajas navigatsiooniseadmetesse) ja neljas nagu failis [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Täielik võimekuste tabel, valdkond valdkonna haaval</summary>

Järgneb täielik valdkondade kaupa detail; võimekusepõhise küpsusregistri jaoks vt
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) ja [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Valdkond | Võimekus |
|--------|------------|
| **Orbiit ja geomeetria** | SGP4/SDP4 levitamine (valideeritud 4.12 mm täpsusega kõigi 666 AIAA 2006-6753 vektori vastu); päris kaherealised elemendid (lisatud, kuupäevatemplaga Celestraki `gps-ops` hetktõmmis) või sünteetilised Walker-delta konstellatsioonid, mille keskmised elemendid realiseerivad valemi `i:T/P/F` alla 1 km täpsusega 24 h levitamise jooksul; mitme konstellatsiooni nähtavus, **täpsuse lahjenemine — geomeetriline, asukoha, horisontaalne, vertikaalne ja aja (GDOP/PDOP/HDOP/VDOP/TDOP), valideeritud 1e-6 täpsusega gnss_lib_py 1.0.4 vastu, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), ja GNSS-i käideldavus; gradiendivaba konstellatsioonidisaini optimeerija, katvustänavate meetodil minimaalse satelliitide arvu määramine, mitme konstellatsiooni võrdlustööriist ning Walkeri **disainipühkimine**, mis tabuleerib katvuse / PDOP-i / taaskülastusaja tasandite × satelliitide võrgustikul ja esitab Pareto-optimaalsed disainid. |
| **Numbriline levitaja** | **Cowelli** numbriline levitaja (`src/propagator.rs`), mis täiendab analüütilist SGP4/SDP4 teed, hierarhilise **seitsme häiritusega** jõumudeliga (`src/forces.rs`): kahe keha + täielik **J2–J6 tsonaalne** väli (Maa lapikuse tsonaalsed harmoonilised kordajad J2 kuni J6; selle häiriva potentsiaali täpne analüütiline gradient), valikuline **EGM2008 tesseraalne sfääriliste harmoonikute geopotentsiaal kuni astme/järguni 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; päris NGA — US (Ameerika Ühendriikide) National Geospatial-Intelligence Agency — kordajad, Holmesi–Featherstone'i normaliseeritud Legendre'i rekursioon, ristkontrollitud kinnise kujuga Legendre'i funktsioonide ja analüütilise ∇V samasuse vastu), **epohhist juhitud Päikese ja Kuu kolmanda keha** gravitatsioon (sisseehitatud madala täpsusega efemeriid, ilma DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel — tuumata), **päikesekiirguse rõhk** (kahurikuuli mudel koonilise täis- ja poolvarjuga), **atmosfääritakistus** (Vallado tükiti eksponentsiaalne tihedus, kaasa pöörlev atmosfäär), **post-Newtoni Schwarzschildi relativistlik parand** ja **Lense–Thirringi taustsüsteemi kaasavedamise** liige (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, lineaarne Maa impulsimomendi suhtes, ~1–2 suurusjärku Schwarzschildist väiksem) — juhitud kahe adaptiivse integraatori valikuga (RK4 — neljandat järku Runge–Kutta — sammu kahekordistamisega või **Dormand–Prince RK5(4)** põimitud paar). **Valideeritud Orekit 12.2 vastu** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epohhi üle LEO (madal Maa orbiit) + GTO (geostatsionaarne üleminekuorbiit), konservatiivsete jõudude tasemed ühtivad halvimal juhul **\|Δr\| 0.08 m piires 24 h jooksul** (`tests/numerical_cowell_propagator_reference.rs`); atmosfääritakistuse tase on iseloomustatud eraldi (≈ 333 m / 24 h) ning absoluutsed Päikese/Kuu efemeriidi ja tiheduse sisendid jäävad ausalt **modelleerituks**. Täiendav sisemine tõend (mitte väline valideerimine): häirimata orbiiti kontrollitakse täpse universaalmuutuja Kepleri lahendi vastu **alla meetri 24 h jooksul**, energia/impulsimoment säilivad ~1e-9 täpsusega ja iga häiritus vastab käsitsi tuletatud kinnise kujuga signatuurile. |
| **Manöövrid ja trajektoori disain** | Impulsiivsed ΔV sõlmed 6×6 kovariatsiooni levitamisega (ECI — Maa-keskne inertsiaalne — / LVLH — lokaalne vertikaal, lokaalne horisontaal — täitmisvea taustsüsteemid), lõpliku põlemise integreerimine, mida kontrollitakse kinnise kujuga **Tsiolkovski** raketivõrrandi vastu < 0.01 % täpsusega, **Izzo-2015** ühe tiiru **Lamberti** lahendaja, täpne universaalmuutuja **Kepleri** levitaja ja **porkchop** (start × saabumine) C3 (stardienergia) / saabumise V∞ pühkimine, väljastatud JSON-kontuurvõrgustikuna — jõudlussimulatsiooni kiht GMAT-i/Oreki kohal, kus iga Lamberti väljund on ringreisil kontrollitud kahe keha tõe vastu ja porkchopi miinimum on kontrollitud analüütilise Hohmanni alampiiri vastu. |
| **Ajasüsteemid ja tugisüsteemid** | IERS-i liigsekunditega **UTC / TAI / TT / UT1** skaalad (koordineeritud maailmaaeg, rahvusvaheline aatomiaeg, terrestriaalne aeg ja Maa pöörlemisaeg Universal Time 1), Juliuse kuupäeva API (rakendusliides), IAU-2000 (Rahvusvaheline Astronoomiaunioon) **Maa pöördenurk** (ERA), GMST-põhine (Greenwichi keskmine täheaeg) **TEME ↔ ECEF** (tõeline ekvaator, keskmine pööripäev ↔ Maa-keskne, Maaga seotud) WGS-84 (World Geodetic System 1984) geodeetiliste taustsüsteemidega, IAU 2006 pretsessioon (Fukushima–Williams), täielik **IAU 2000A/2000B nutatsioon**, IERS-i **poolusenihe** ja pööripäevavaba **CIO-põhine IAU 2006/2000A GCRS↔ITRS** teisendus (CIO = Celestial Intermediate Origin) — kõik valideeritud **bitt-biti haaval** SOFA/ERFA vektorite vastu ning **sõltumatult ristkontrollitud ANISE vastu** (puhas Rusti NAIF/SPICE taasteostus; NAIF = NASA, USA riikliku aeronautika- ja kosmoseameti Navigation and Ancillary Information Facility): kshana GCRS→ITRS vs ANISE ITRF93 (International Terrestrial Reference Frame 1993) JPL-i failist `earth_latest_high_prec.bpc`, mõlemale antud samad IERS-i Maa orientatsiooni parameetrid, ühtivad **≤ 0.86 m piires maapinnal / ≤ 3.6 m piires GNSS-orbiidil** (max 0.028″) kaheksal epohhil aastatel 2020–2023. |
| **Inertsiaalne** | Kolmeteljeline rihmühendusega INS — kvaterniooniline asend, WGS-84 NED (põhi-ida-alla) mehhaniseerimine, koonuse/sõudmise kompenseerimine ja deterministlik IMU veamudel (mastaabitegur, joondusviga, g-tundlikkus, kvantimine, triiv); **esimestest põhimõtetest lähtuv külma aatomi interferomeetriga kiirendusmõõtur** (Mach–Zehnderi faas, kvantprojektsiooni müra, kontrasti hääbumine, vibratsiooni sidestus), mis *tuletab* kiiruse juhusliku ekslemise kordaja; ning järjestikuse olulisusvalimi taasvalikuga **osakeste filter** kaardiga abistatud (maastiku/gravitatsiooni põhise) GPS-ita navigeerimise jaoks. |
| **Alt-PNT (GPS-ita)** | Külma aatomi **gravimeetri mõõtemudel**, mille valge müra põrand (`σ = ASD/√τ`, ASD = amplituudi spektraaltihedus) on tuletatud CAI kiirendusmõõturi füüsikast; madala astmega, täielikult normaliseeritud **sfääriliste harmoonikute gravitatsioonianomaalia väli** (kontrollitud kinnise kujuga Legendre'i funktsioonide ja käsitsi tuletatud üheliikmelise anomaalia vastu) pluss sünteetilised maskonid; **gravitatsioonifunktsionaali sünteesi tuum** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — „kaardilugeja“, mille vastu gravitatsiooniga abistatud navigaator sobitab — on valideeritud **GRS80 normaalgravitatsiooni standardi** vastu (Geodetic Reference System 1980), taastoodab kinnise kujuga Somigliana normaalgravitatsiooni ja avaldatud γ_e / γ_p täpsusega **3.5e-12** ning annab füüsikaliselt piiratud häirituskaardi päris ICGEM-i (International Centre for Global Earth Models) **EGM2008** väljast (RMS — ruutkeskmine — ≈ 26 mGal, max ≈ 89 mGal astmel/järgul 70; `tests/icgem_gravity_reference.rs`); ning **gravitatsioonikaardi sobitamise osakeste filter**, mis taastab GPS-ita trajektoori anomaaliajadast, millest see läbi lendab. See laieneb **maastikupõhisele navigeerimisele** (TERCOM/SITAN — maastikukontuuri sobitamine / Sandia Inertial Terrain-Aided Navigation — SRTM (Shuttle Radar Topography Mission) `.hgt` DEM-i (digitaalne kõrgusmudel) vastu, `src/altpnt/terrain.rs`), **IGRF-14 geomagnetilisele peaväljale** (14. põlvkonna International Geomagnetic Reference Field) kuni astme/järguni 13 (`src/igrf.rs`, kontrollitud kaldu dipooli kinnise kuju ja ∇V lõplike vahede vastu) ning **kombineeritud gravitatsiooni + magnet- + maastiku** navigaatorile, mis ühendab kõik kolm skalaarkanalit ühe osakeste filtri kaudu (informatsioon on aditiivne — ükski kanal ei tee fiksi halvemaks). **60-minutiline GPS-ita võrdlustest** (~700 km / ühetunnine katkestus, mille jooksul inertsiaalne lahend triivib ~70 km-ni) taastatakse **~145 m (< 500 m)** täpsusega hierarhilise jämedast peeneni sobitajaga — ESA NAVISP (Navigation Innovation and Support Programme) *Quantum Wayfarer* siht. |
| **Fusioon** | Lõdvalt seotud 15-olekuline GNSS/INS veaoleku EKF (laiendatud Kalmani filter) suletud ahelaga tagasisidega (pakett `gnss-ins`); **tihedalt seotud** pseudokauguse uuendus, mis jätkab korrigeerimist vähem kui nelja satelliidiga; seotud **kella + asukoha** filter; üldine **lõhnatu (sigmapunkti) Kalmani** hindaja tugevalt mittelineaarsete mõõtmiste jaoks; tihedalt seotud GNSS/INS **UKF navigaator** (pseudokaugus + Doppler), mille jõumudelil põhinev orbitaalne inertsiperiood on enesejärjepidevuse kontrolliga **0.77 m RMS** täpsusega 30-minutilisel kaarduval LEO ülelennul, mis sisaldab 120-sekundilist GNSS-i katkestust (filtri järjepidevuse arv, mitte välise oraakli valideerimine — see navigaator jääb MODELLED); ning täielik **17-olekuline tihedalt seotud GNSS/INS UKF** (asukoht, kiirus, asendiviga, kiirendusmõõturi ja güroskoobi nihked, kella nihe ja triiv), mille **kvant-CAI surnud arvestus** ületab 120-sekundilise katkestuse külma aatomi kiirendusmõõturi tuletatud kiiruse juhusliku ekslemise põhjal. |
| **Orbiidi määramine** | Orbitaalse oleku `[r, v]` taastamine maajaama kaugusjälgimisest, ühendades kahe keha + J2 jõumudeli ja RK4 integraatori **Gaussi–Newtoni pakett**korrektoriga (`determine_orbit_batch`, alla meetri / mm·s⁻¹ mürata kaugustest, ~2 m 5 m mürapõranda juures) ja **järjestikuse** lõhnatu filtri variandiga (`determine_orbit_sequential`). |
| **Vaadeldavus ja hindamisteooria** | Üldine, korduvkasutatav **Fisheri informatsiooni / Cramér–Rao** kiht (`src/fim.rs`): informatsioonimaatriks M = HᵀWH, **Cramér–Rao alampiir**, vaadeldavuse **astak ja daatumidefekti nullruum** (Moore–Penrose'i pseudopöördmaatriks) ning **D/A/E/T-optimaalsed** katse planeerimise skalaarid sümmeetrilisest Jacobi omaväärtuste lahendajast. **Valideeritud** — omaväärtused vs `numpy.linalg.eigh`, CRLB kovariatsioon vs σ²(XᵀX)⁻¹ läbi `numpy.linalg.inv` ja GNSS DOP informatsioonimaatriksist, kõik ühtivad **1e-9** täpsusega (`tests/fim_observability_reference.rs`), ning lisaks ristkontrollitud **Kay (1993)** kinnise kujuga piiride vastu Monte Carlo CRLB saavutamisega. See on aluseks DOP-mootorile, passiivse geolokatsiooni CRLB-le ja Kuu absoluutse jaama **vaadeldavusteoreemile** (allpool). |
| **Kuu ja tsislunaarne** | Maa–Kuu **ringikujuline piiratud kolme keha (CR3BP)** levitaja pöörlevas taustsüsteemis — säilinud Jacobi konstant ja kõik viis Lagrange'i punkti (`src/cr3bp.rs`) — nüüd **6×6 olekuülemineku maatriksi (STM) ja ühekordse sihtimise diferentsiaalkorrektoriga** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`), mis annab tõeliselt perioodilised **halo / NRHO** (peaaegu sirgjooneline haloorbiit) orbiidid: STM on valideeritud lõplike vahede vastu, korrigeeritud orbiidid sulguvad masinatäpsuseni ning avaldatud apoluuni oleku kasutamine algväärtusena taastoodab **L2 lõunapoolse 9:2 NRHO** (L2 = teine Maa–Kuu Lagrange'i punkt; Gateway orbiit) perioodiga ≈ 6.57 d / periluuniga ≈ 3,250 km, kooskõlas avaldatud ≈ 6.56 d / ≈ 3,370 km-ga (CR3BP — ringikujuline, Päikeseta — lahend, **mitte** valideeritud päris LANS (Lunar Augmented Navigation Service)/Gateway efemeriidi vastu; korrigeeritud orbiidi selenotsentriline MCI/MCMF (Kuu-keskne inertsiaalne / Kuu-keskne, Kuuga seotud) teisendus on järgmine samm); pluss **LunaNet / LNIS** (LunaNet Interoperability Specification) tsislunaarne PNT geomeetria (MCI↔MCMF teisendus, selenograafilised koordinaadid) koos **Kuu lõunapooluse ARAIM** läbimisega, mis ausalt toob esile terviklikkuse lünga: ~30 m σ_URE (kasutaja kaugusviga) viib kaitsetaseme tunduvalt üle 50 m häirepiiri (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); ning **pinnamajakate DOP-täiendus** (`src/lunar_beacon.rs`), mis näitab, kuidas mõni mõõdistatud pinnal asuv kaugusmõõtmise majakas annab madala kõrgusnurga ja laia asimuudiga vaatesihi read, mis puuduvad ainult pea kohal olevate orbiitide kogumil — kukutades halvasti tingitud lõunapolaarse GDOP-i ja ruutsumma veaeelarve kaudu realiseeritud asukohatäpsuse meetrites (kasutades uuesti gnss_lib_py-ga valideeritud DOP-tuuma ja õhuta horisondi nähtavuse kinnist kuju; täpsuse lahjenemise analüüs on kirjeldatud artiklis [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Kuu PNT komplekt** | Kuu/tsislunaarne navigatsioonikomplekt CR3BP tuuma peal, igaüks käivitatav `kind`: **Kuu koordinaataeg** (`lunar-time-offset`, `src/lunar_time.rs` — sekulaarne LTC/TCL − TT kiirus (LTC = Lunar Coordinate Time; TCL = selle prantsuskeelne vorm, Temps-Coordonnée Lunaire) omapotentsiaalide vahest + kineetilisest liikmest, esitatud koos avaldatud 56–59 µs/päevas vahemikuga); geodeetiline **Kuu VLBI** (väga pika baasiga interferomeetria) viivituse vaadeldav (`lunar-vlbi`, `src/lunar_vlbi.rs` — Maa baasiga lähivälja kahe kauguse vahe viivitus + kiirus, ristkontrollitud sama koodibaasi tasalaine Δ-DOR-i (delta differential one-way ranging) vastu kaugvälja piirjuhul, osatuletised lõplike vahedega kontrollitud); **ühine mitme meetodi OD + kella** pakethindaja (`lunar-joint-od-clock`, `src/lunar_combination.rs` — Gaussi–Newtoni sobitus, mis ühendab VLBI + Kuu kohalikud kaugused + satelliitidevahelised kaugused), millel on **Fisheri informatsiooni vaadeldavuse** tulemus: sisemine kaugusmõõtmine üksi jätab kuue vabadusastmega jäiga keha **daatumidefekti**, nii et pinnajaama *absoluutne* asukoht on vaadeldamatu, kuni lisatakse Maa taustsüsteemi seos — Maa baasiga **VLBI** viivitus *taastab* vaadeldavuse hõreda konstellatsiooni puhul ja *teravdab* Cramér–Rao piiri rikka puhul, absoluutne daatum sulgub **kolme** mittekollineaarse Maa jaamaga (vaadeldavuse tulemus on kirjeldatud artiklis [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **tugisüsteemi realiseerimine** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — 7-parameetriline Helmerti daatumi sobitus + IAU 2015 WGCCRE orientatsiooniseos — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements); **Moonlight/LCNS-klassi teenindusruumi** analüüs (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / katvus / käideldavus + üldistatud Kuu ARAIM HPL/VPL (horisontaalse/vertikaalse kaitsetaseme) ümbrik, kasutades uuesti gnss_lib_py-ga valideeritud DOP-tuuma ja LunaNeti σ_URE≈30 m masinavärki); **Kuu diferentsiaalne PNT** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — Kuu diferentsiaalse GNSS-i / satelliitpõhise täiendussüsteemi (SBAS) analoog: täpne ühisrežiimi kella kustutamine + esimest järku ruumiline dekorrelatsioon baasi suhtes, kasutades uuesti DO-229E SBAS kaitsetaset — DO-229E on RTCA (endine Radio Technical Commission for Aeronautics) minimaalne talitlusnõuete standard SBAS-vastuvõtjatele); ning **LunaNet/IOAG-ga joondatud koostalitlusvõime eksport** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + Kuu ajaskaala ringreis IAU 2015 Kuu kehataustsüsteemis, mähitud KIF-ümbrikusse). Iga osa tõendustasemed on [kontrollimaatriksis](docs/VERIFICATION-MATRIX.md): Kuu koordinaataeg, ühine OD + kella hindaja, tugisüsteemi realiseerimine ja teenindusruumi geomeetria on **VALIDATED** (igaüks oma reas nimetatud sõltumatu oraakli vastu, nagu ka VLBI viivituse tuuma tee); VLBI vaadeldav, daatumidefekti vaadeldavuse tulemus, diferentsiaalne PNT ja koostalitlusvõime eksport on **MODELLED**. Parameetrid on **illustratiivsed avalike allikate** väärtused — **mitte** valideeritud päris VLBI/Gateway jälgimise vastu, **mitte** seotud ühegi agentuuriga ega selle poolt heaks kiidetud, puudub TRL-i (tehnoloogilise valmiduse tase) / pärandi väide. |
| **Süvakosmos ja Marsi PNT** | Avatud **radiomeetrilise navigeerimise mootor**: iteratiivne valguse levimisaeg + **Shapiro** relativistlik viivitus, kahe-/ühe-/kolmesuunaline **Doppler ja kaugus** (Moyeri kaheharuline), koherentse transponderi pöördesuhted, regeneratiivne/PN (pseudomüra) kaugusmõõtmine (CCSDS 414, pseudomüra kaugusmõõtmise standard) ja **Δ-DOR** taevatasand (CCSDS 506, Delta-DOR standard), päikeseplasma/tropo/iono keskkondadega; **CCSDS-TDM (503)** jälgimisandmete sõnumi parsimine + väljastamine; **taandatud dünaamikaga ruutjuurinformatsiooni filter** (RTN — radiaalne, transversaalne, normaalne — empiirilised kiirendused + 3-olekuline pardakell + Marsi atmosfääritakistus), mis teeb sünteetilises suletud ahelas **Marsi LMO orbiidi määramise ≈ 0.2 m täpsusega**; ühine **ühe- + kahesuunalise fusiooni** hindaja; mitme keha dünaamika tuum (`Body{μ, re, zonals, gravity, IAU-pole}`, Mars GMM-3 (Goddard Mars Model 3) gravitatsioon, IAU kehaga seotud Marsi taustsüsteem, ühendatav `EphemerisProvider` liides, kaheosalised Juliuse kuupäevad + TT↔TDB (barütsentriline dünaamiline aeg)); ning **`mars-pnt`** releepõhine PNT stsenaarium (MARCONI areostatsionaarne releekonstellatsioon) otsast lõpuni **GSE jõudlussimulaatoriga** (GSE = maapealsed tugiseadmed) (geomeetria → lingieelarve → vaadeldavad → SRIF → kovariatsioon). **Simulatsiooniga valideeritud** (kovariatsiooni / suletud ahela kvaliteedinäitajad); Päikese-keskne Marsi dünaamika on ristkontrollitud JPL **DE440** vastu (137 m 1-päevase kaare juures, `xval/anise-mars-od`). Päris DSN/ESTRACK jälgimisandmete valideerimine on teekaardil. |
| **Päikesesüsteem ja mis tahes keha PNT** | Tuumavaba **kogu päikesesüsteemi efemeriid** (`src/ephem.rs`, `src/ephem_provider.rs`): iga planeet JPL-i **Standishi Kepleri elementidest** (Table 1, 1800–2050 pKr; Tables 2a/2b, 3000 eKr–3000 pKr) koos iga planeedi avaldatud nominaalveaga, Maa ja Kuu eraldatud Kuu ridade abil ning Phobos, Deimos, Io, Europa, Ganymedes, Callisto ja Titan JPL-i keskmistest elementidest ja IAU (Rahvusvaheline Astronoomiaunioon) pöörlemismudelist; **mis tahes keha mis tahes teise suhtes** ICRF-is (International Celestial Reference Frame). `Body` kannab nüüd **GM-i (gravitatsiooniparameeter), raadiusi, J2 (teine tsonaalne harmoonik), kus see on avaldatud, ning IAU poolust ja nullmeridiaani kaheksateistkümne keha jaoks**. Liik **`solar-system`** esitab asukohad, kiirused, konstandid, **valguse levimisaja ja ühe-/kahesuunalise kauguse** mis tahes kahe keha vahel (olemasolev radiomeetriline valguse levimisaja lahendaja koos Päikese Shapiro viivitusega) ja orbiidirajad keha kohta — piisav interaktiivse päikesesüsteemi joonistamiseks; liik **`body-pnt`** paigutab orbiteri või maanduri **mis tahes keha ümber** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) kohaliku Walkeri konstellatsiooni, täpsuse lahjenemise ja Gaussi–Newtoni masinavärgi ning süvakosmose kaugusega Maalt. **Valideeritud** JPL Horizonsi vastu (DE441, JPL Development Ephemeris 441): Merkuur–Saturn ja Maa Table 1-st kahekordse nominaalvea piires (halvim 1.87×), kõik kaheksa planeeti Tables 2a/2b-st (halvim 1.71×) ning Maa–Marsi/Jupiteri valguse levimisaeg. **Modelleeritud**: Uraan ja Neptuun Table 1-st (2.0× ja 5.2× esitatud viga DE441 vastu), Pluuto, kuud ja `body-pnt` navigatsioonitulemused. |
| **Ühendatud MEO + LEO PNT** | `src/leo_fusion/`: süsteemist sõltumatu LEO positsioneerimine, navigeerimine ja ajastus mis tahes konstellatsiooni (Walkeri kestad, elemendikogumid, GNSS-i eelseaded) ja mis tahes signaali (kandja, kiibikiirus, C/N0 ümbrik, signaali ruumis kaugusviga) üle, valikuliste ühefailiste eelseadetega, mis kannavad oma allikaid (Xona Pulsar X1/X5, Iridium STL, Starlinki juhusignaalid, CentiSpace, esinduslik C-sagedusala süsteem, ATOMIC nullkella efemeriidimudel). **`leo-pvt`**: pakett**Doppleri positsioneerimine** kaugusmuutuse kiirusest (üks ja mitu satelliiti, kella triivi ja kiiruse olekud, ühe ülelennu piki-/ristirajaline geomeetria ja peegellahend), **ühine GNSS + LEO kaalutud vähimruutude meetod** süsteemipõhiste süsteemidevaheliste nihete ja kutsuja antud signaalipõhiste sigmadega, DOP LEO-satelliitide arvu suhtes, **polaar- ja Arktika** katvus ning **LEO ajaülekanne UTC-sse** C/N0 ja ostsillaatori suhtes. **`leo-ppp`**: ujuv PPP (täppis-punktpositsioneerimine) EKF (laiendatud Kalmani filter) ainult GNSS-iga ja LEO-ga, selle koondumisaeg ja hii-ruut NEES järjepidevustest. **`ntn-positioning`**: 5G mittemaapealse võrgu positsioneerimine ribalaiuse Cramér-Rao piirist. **Valideeritud**: LEO Doppleri ümbrik avaldatud Iridiumi ja Xona arvude vastu. **Modelleeritud**: ülejäänu, PPP trend võrreldud tööga Li et al. (2019) — vt [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Terviklikkus** | Hetktõmmise ja lahendite eraldamise (ARAIM-stiilis) RAIM — vastuvõtja autonoomne terviklikkuse seire — horisontaalsete/vertikaalsete kaitsetasemetega (HPL/VPL), rikke tuvastamise ja välistamisega ning Stanfordi terviklikkusdiagrammidega; selgesõnalise terviklikkusriski eelarvega **mitme hüpoteesi lahendite eraldamise (MHSS)** kaitsetase, sealhulgas **kahe/mitme konstellatsiooni konstellatsiooniülene rikkerežiim** (EL-i (Euroopa Liit) ARAIM / DO-316, RTCA jõudlusstandard õhusõidukipõhise täiendusega GPS-i pardaseadmetele), läbi mängitud päris GPS + Galileo hetktõmmisel (`scenarios/araim-gps-galileo.toml`). Kaitsetase rakendab rikkerežiimi kohta ühepoolset **nominaalse nihke** projektsiooni `b_k = Σ_i|s_i|·b_nom` ja Integrity Support Message'i **terviklikkuse** sigmat σ_URA (kasutaja kauguse täpsus; erinev täpsuse σ_URE-st, kasutaja kaugusviga) — vt [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Tuvastustuum (χ²/mittetsentraalse χ²/normaaljaotuse läved ja K-kordajad) on **väliselt valideeritud SciPy vastu** 171 juhul (`tests/raim_reference.rs`); geomeetria kasutab uuesti gnss_lib_py-ga valideeritud DOP-tuuma. ARAIM MHSS terviklikkusriski *eelarve jaotusel* endal avaldatud numbrilist oraaklit ei ole ja see jääb ausalt modelleerituks. |
| **Täiendus (SBAS)** | **SBAS / WAAS kaitsetasemed** (WAAS = Wide Area Augmentation System) DO-229E kaalutud vähimruutude kujul (täppislähenemise ja marsruudi K-tegurid) ja **L1/L5 kahesageduslik ionosfäärivaba** kombinatsioon (L1 ja L5 on kaks GPS-i tsiviilsignaali sagedusala; IS-GPS-705, GPS-i liidesespetsifikatsioon L5 signaalile, γ₁₅ ≈ 1.793), mis on DO-316 aluseks — `src/sbas.rs`. Kaitsetaseme algoritm on **väliselt valideeritud RTKLIB SBAS-PL haru vastu** (RTKLIB = avatud reaalajas kinemaatilise positsioneerimise teek; PL = kaitsetase) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — DO-229 eelmine redaktsioon — App. J), käivitatud **päris EGNOS-i andmetel** (European Geostationary Navigation Overlay Service), taastootes selle HPL-i < 2e-3 m täpsusega (`tests/sbas_reference.rs`); gLAB (GNSS Laboratory tööriistakomplekt) v6.0.0 kinnitas identse konventsiooni. |
| **Kell ja ajastus** | Kaheolekuline Kalmani holdover (Josephi kujul kovariatsioon, NIS/NEES — normeeritud innovatsiooni ruut / normeeritud hindamisvea ruut — järjepidevuse tervis); Allani perekonna stabiilsus (ADEV / MDEV / TDEV / HDEV / MTIE — Allani, modifitseeritud Allani, aja- ja Hadamardi hälve ning maksimaalne ajaintervalli viga) mürätüübipõhiste usaldusvahemike ja täieliku **IEEE-1139 viie kordajaga astmeseaduse sobitusega** (IEEE Std 1139, Institute of Electrical and Electronics Engineersi sageduse ja aja metroloogia definitsioonid) — hindajad on valideeritud päris riistvaral **Stable32** vastu: **päris 5071A tseesiumi primaarstandard vs vesinikmaser** (556,990 faasinäidist, 16 keskmistamistegurit, OADEV/OHDEV — kattuv Allani/Hadamardi hälve — 1e-3 täpsusega; `tests/cs5071a_reference.rs`) ja **kanooniline Stable32 PHASE.DAT** regressiooniseeria (139 keskmistamistegurit, OADEV/MDEV/TDEV 1e-3 täpsusega; `tests/phasedat_reference.rs`); ADEV/MDEV/TDEV hindajad ja telekommunikatsiooni **MTIE** ekslemismõõdik on lisaks ristkontrollitud **sõltumatu allantools 2024.06** teegi vastu **< 1e-9** täpsusega NIST SP 1065 seerial (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geomeetrilised parandid (Sagnac, GNSS-i ühisvaade); ning operatiivsed ülekandemeetodid — **TWSTFT** (kahesuunaline satelliitaja ja -sageduse ülekanne) BIPM-i (Rahvusvaheline Kaalude ja Mõõtude Büroo) Sagnaci kinnise kujuga, **GNSS-i ühisvaade**, **PPP** (täppis-punktpositsioneerimine) ionosfäärivaba ajaülekanne, vaba ruumi **optiline** link turbulentse stsintillatsiooniga ning pöördvariatsiooniga kaalutud **kellaansambli (paber-) ajaskaala**, mis on parimast panustavast kellast parem. **GNSS-ita kella holdoveri kalkulaator** (`src/holdover.rs`) esitab kinnise kujuga van Loani inertsivea kasvu *holdoverina lävini* pöördena — kui kaua kell vabalt töötab, enne kui selle ajastusviga eelarve ületab — esinduslike klassikaliste ja kvantkellade klasside lõikes; **modelleeritud** (ristkontrollitud mitmesammulise `clock_state` kovariatsiooni rekursiooni vastu) ning aus selles, et väga stabiilse kella puhul määrab holdoveri range lävini *eeldatud* pika tau mürapõrand, mitte viidatud ADEV. **Tingimuslik ajastuse kaitsetase** (`src/tpl.rs`) laiendab holdoveri spuufimisele: piir *tuvastamata* ajaveale sõltumatu ristkontrolli olemasolul, mis koosneb k-sigma monitori põrandast, van Loani inertsivariatsioonist tuvastuslatentsuse jooksul ja CUSUM-i (kumulatiivse summa) häireni kuluvast ajast. Kalibreeritud päris salvestatud spuufimisel (JammerTest 2024) ja reprodutseeritav käsuga `cargo run --example tpl_jammertest`; **MODELLED** koosseis (puudub terviklikkusriski tunnieelarve), tingimuslik tuvastamise suhtes — lõplikku *tingimusteta* piiri ei ole. |
| **GNSS-i mõõtevaldkond** | Pseudokauguse / Doppleri päripidi süntees **Klobuchari** (edastatav) ja **IONEX / TEC-võrgustiku** (IONosphere map EXchange vorming / elektronide koguhulk; mõõdetud) ionosfääriga — sealhulgas IONEX-faili parser, kaartidevaheline ajainterpolatsioon ja õhukese kihi kaldkaardistus — **Saastamoineni + Nielli** troposfäär ja hetktõmmise RAIM (HPL/VPL). |
| **Vastupidavus** | Lingieelarvepõhine **segamine** (J/S → efektiivne C/N₀ → luku kadu — segaja ja signaali suhe, kandja ja müra tiheduse suhe — kus segamisvastane spektraalse eraldatuse tegur `Q` on nüüd **tuletatud tegelikest signaali ja segaja võimsusspektritest** läbi `src/navsignal.rs` — `Q = 1/(R_c·κ)`, CI-s ristkontrollitud varasema esindusliku konstandi vastu); stohhastiline **ajaspuufimise detektor** (Neymani–Pearsoni / χ²₁ energiatest kinnise kuju ja Monte Carlo P_fa/P_md-ga ning turvalisuse kvaliteedinäitajaga (FoM) 1 − P_md); ja **mitmekihiline spuufimisdetektor**, mis ühendab RAIM-i järjepidevuse paarsustesti (ühisrežiimi pimeala ausalt modelleeritud), RF AGC-võimsuse (automaatne võimendusreguleerimine) monitori ja signaalikvaliteedi (SQM — signaalikvaliteedi seire, varajane-miinus-hiline) monitori; ning **kvant-inertsiaalse surnud arvestuse veaeelarve** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`), mis liidab külma aatomi interferomeetri valge müra kiiruse juhusliku ekslemise jääknihkega (ristkontrollitud sõltumatu `AccelModel` integraatori vastu) ja mastaabiteguri veaga asukohatriivi arvuks holdoveri jooksul — kella holdoveri inertsiaalne kaksik. **Raamistikuga joondatud vastupidavuse hindamismootor** (`src/resilience/`) seab arhitektuuri simuleeritud käitumise vastavusse mõõtmekaupa alamhinnetega Kshana enda seitsme vastupidavuskategooria lõikes (mitte DHS-i terminid), joondatud USA Sisejulgeolekuministeeriumi Resilient PNT Conformance Frameworkiga, ning uurib seejärel mis tahes üksiku koondhinde või küpsustaseme **otsuse stabiilsust** Dirichlet' kaalumissimpleksi ja viie ohu ansambli all — Kendalli τ järjestuse ebastabiilsus, esikoha võitja vahetumise määr ja ühisrežiimi **mitmekesisuse kollaps** (Hill-N2), koos terviklikkusräsiga kindlustusaruandega (35 käsitsi tuletatud oraaklitesti). Reprodutseeritav käsuga `cargo run --example resilience_report`; **MODELLED** sünteetilised arhitektuurid, RPCF v2.0-ga joondatud enesehinnang, **mitte** sertifitseerimine. Vt [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Passiivne RF geolokatsioon** | **TDOA/FDOA kiirgaja geolokatsioon** (saabumise aja/sageduse vahe; `src/geolocation.rs`) — segaja või spuufija (või pöörd-PNT jaoks juhusliku allika) asukoha määramine **saabumisaja vahe** hüperboloididest üle vastuvõtjate võrgu, lahendatud Gaussi–Newtoni vähimruutude meetodiga; **saabumissageduse vahe** lisamine liikuvate vastuvõtjatega taastab ühiselt kiirgaja asukoha *ja* kiiruse, kusjuures asukoha kovariatsiooni **Cramér–Rao** piir on tuletatud võrgu geomeetriast. **MODELLED** (sisemise järjepidevuse oraaklid: päri→pöörd ringreisid, J·CRLB = I samasus, GDOP-i monotoonsus ja hindaja, mis saavutab Monte Carlo all oma CRLB) — punktallika otsenähtavuse mudel, ilma mitmeteelevi / NLOS (mitteotsenähtavus), vastuvõtja kellanihke või murdumise liikmeteta. |
| **Navigatsioonisignaal ja koodijälgimine** | **Signaalitase** lingieelarve ja mõõtevaldkonna vahel (`src/navsignal.rs`): ühikpindalaga **võimsusspektri tihedused** (PSD) **BPSK-R(n)** (kahendfaasinihkemodulatsioon ristkülikukujuliste kiipidega) ja **sine-BOC(m,n)** (binaarne nihkekandja) jaoks; **spektraalse eraldatuse kordaja** (SSC) κ = ∫ G_s·G_i df, mis **tuletab segamisvastase `Q`**, mida segamismudel kasutab (`Q = 1/(R_c·κ)`), tegelikest signaali/segaja spektritest esindusliku konstandi asemel; **RMS (Gabori) ribalaius** (BOC > BPSK — kaugusinformatsiooni / Cramér–Rao mõõt); **koherentse varajane–hiline DLL koodijälgimise termilise müra värin** (DLL = viivituslukustusega ahel; Kaplan & Hegarty; ~alla meetri C/A — GPS-i jäme/omandamiskood — jaoks 45 dB-Hz juures); ning **mitmeteelevi vea ümbrik** (koherentne EML, varajane-miinus-hiline — kitsa korrelaatori summutus). Valideeritud kinnise kuju ankrute vastu (BPSK enese-SSC = 2/(3·R_c), ühikpindalaga PSD-d, alla meetri C/A värin). See on signaali**jõudluse** analüüs, **mitte** antenni / RF-kasuliku koormuse riistvara disain (kasuliku koormuse partneri roll). |
| **Koostalitlusvõime** | **RINEX-3** mitme GNSS-i edastatava efemeriidi sisselugemine (GPS, Galileo, QZSS — Jaapani kvaasiseniidi satelliitsüsteem —, BeiDou MEO/IGSO — keskmine Maa orbiit / kaldega geosünkroonne orbiit — läbi IS-GPS-200, GPS-i liidesespetsifikatsiooni; GLONASS, Venemaa globaalne satelliitnavigatsioonisüsteem, läbi PZ-90 — Venemaa Parametry Zemli 1990 daatum — olekuvektori RK4), kasutatav konstellatsiooni allikana (RINEX sisse, PNT geomeetria välja); **RINEX-3** vaatlusparser (pseudokaugus, kandelaine faas, Doppler, signaalitugevus; 4.00 vaatluse ülesehitus peaks parsima, kuid on testimata, ning RINEX 4 navigatsioonifailidest keeldutakse nime järgi, mitte ei dekodeerita valesti), mis nüüd **toidab üksikpunkt-positsioneerimise (SPP) lahendajat** (`pvt`) — päris koodivaatlused sisse, päris **vastuvõtja asukoht** välja, valideeritud IGS-i andmetel; **SP3-c/d** täppisefemeriidi lugeja/kirjutaja 9. järku Lagrange'i interpolatsiooniga; ning **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) eksport lennudünaamika tööriistadele (GMAT, Orekit, STK — Systems Tool Kit); ja **CCSDS-TDM (503)** jälgimisandmete sõnumi parsimine + väljastamine süvakosmose radiomeetrilise jälgimise jaoks. |
| **Missioonianalüüs (süsteemitehnika)** | Esimest järku missioonidisaini eelarved, igaüks käivitatav liik: kahe keha **stardi ja tõusu geomeetria** (`launch-window` — stardiasimuut `sin Az = cos i/cos lat`, minimaalne inklinatsioon, Maa pöörlemise boonus, koerajala tasandimuutuse Δv, igapäevased võimalused; `src/launch.rs`); **Alleni–Eggersi ballistilise taassisenemise koridor** (`reentry` — maksimaalne aeglustus, maksimaalse g kiirus/kõrgus, maksimaalse kuumenemise kiirus; `src/reentry.rs`); **Maa vaatluse katvuse geomeetria** (`eo-coverage` — ribalaius / nadiiri GSD (maapinna valimikaugus) / nadiirist kõrvale juurdepääs / taaskülastus SMAD-i (*Space Mission Analysis and Design*) kosmosekolmnurga kaudu; `src/eo_payload.rs`); **3-DOF asendi ja suunamise veaeelarve** (kolm vabadusastet; `attitude-budget` — halvima juhu gravitatsioonigradiendi moment + RSS (ruutsumma) suunamiseelarve; `src/attitude_budget.rs`); **maajaama ülelendude ennustamine** (`passes` — AOS/TCA/LOS, signaali omandamine / lähima möödumise aeg / signaali kadu, maksimaalne kõrgusnurk, juurdepääsuaeg; `src/passes.rs`); ning **ühesuunaline lingieelarve** CCSDS 401 / DSN 810-005 lingivõrrandi järgi (CCSDS raadiosageduse ja modulatsiooni standard / Deep Space Networki lingidisaini käsiraamat; `link-budget` — FSPL (vaba ruumi leviku kadu), C/N₀, Eb/N₀ (energia biti kohta ja müra tiheduse suhe), varu, sulgumine; `src/linkbudget.rs`). **MODELLED** esimest järku analüütilised eelarved — riistvaraeelne kiht STK/GMAT/Basiliski all, mitte 6-DoF ega radiomeetriline asendus. |
| **Otsuseanalüüs ja kompromissid (MCDA)** | Täielik **mitmekriteeriumilise otsuseanalüüsi** (MCDA) komplekt (`src/mcda/`), mis hõlmab kõiki nelja meetodiperekonda — väärtuste agregeerimine (**WSM**, **WPM**, **WASPAS** — kaalutud summa mudel, kaalutud korrutise mudel, kaalutud agregeeritud summa-korrutise hindamine), kaugus ideaalist (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), kompromissprogrammeerimine (**VIKOR**, serbiakeelsest mitmekriteeriumilise optimeerimise ja kompromisslahendi nimetusest) ja ülejärjestamine (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, prantsuskeelsest reaalsust väljendava elimineerimise ja valiku nimetusest), lisaks suhtesüsteemi **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) ja proportsionaalne **COPRAS** (Complex Proportional Assessment) — koos **AHP** (Analytic Hierarchy Process) paarisvõrdluse prioriteedikaalumisega (Consistency Ratio), **Pareto** mittedomineeritud fronti, kaalude **tundlikkuse** analüüsi ja mitmeatribuudilise **kasulikkuse** hindamisega. Üheksa agregaatorit taastoodavad sõltumatuid kolmandate osapoolte teeke **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) ja **pyDecision** (ELECTRE I, COPRAS) **< 1e-9** täpsusega ning AHP prioriteedivektor + Consistency Ratio vastavad Saaty Random-Index tabelile ja SciPy/LAPACK peamisele omaväärtuste lahendajale < 1e-9 täpsusega (`tests/mcda_*_reference.rs`). **VALIDATED** — otsusekiht kompromissuuringu mootori all. |
| **Kosmosekeskkond** | **Kosmoseilma keskkonnamudel** (`space-weather`, `src/space_weather.rs`): päikese (F10.7 / tsentreeritud 81-päevane F10.7a — 10.7 cm päikese raadiovoog) ja geomagnetilise (Kp, planetaarne K-indeks, definitsioonilise Kp↔ap tabeliga — ap on selle lineaarne planetaarne amplituud) aktiivsuse indeksid, nende juhitud **Jacchia-1971** eksosfääri temperatuur (valideeritud avaldatud päikese min/keskmise/max vastu) ning aktiivsusega korrigeeritud vs staatiline termosfääri neutraalne tihedus kõrgusel — päikesetsükli tiheduse sõltuvus, mille staatiline USSA76 (US Standard Atmosphere 1976) atmosfäär välja jätab. **MODELLED**: kalibreeritud esimest järku skaalakõrguse sidestus, **mitte** andmetega valideeritud (NRLMSISE — USA mereväe uurimislabori Mass Spectrometer and Incoherent Scatter Radar Exosphere mudel) atmosfäär. |
| **AI/ML hindamine ja kompromissid** | **RF-häiringute tuvastamise hindamise katsekeskkond** (`impairment-eval`, `src/impairment_eval.rs`): märgistatud, parameetritel põhinev **sünteetiline** korpus (nominaalne / segamine / ajaspuufimine / asukohaspuufimine / mitmeteelevi), detektorist sõltumatu **ROC/AUC** (vastuvõtja tööomadus / kõveraalune pindala) raamistik, mis hindab mis tahes detektorit (energy \| agc \| sqm \| parity \| fused) klassipõhise Pd-ga (tuvastamise tõenäosus) siht-Pfa juures (valehäire tõenäosus), ning jaotusesisene vs jaotusväline **optimismilõhe** (jaotuse nihke režiim). Lisaks **kvant- vs klassikalise PNT kompromiss** (`quantum-trade`, `src/quantum_trade.rs`), mis kvantifitseerib kandidaatkella ajastuse/inertsiaalse holdoveri kasu **mõõdetud ADEV** kõverast klassikalise lähtetaseme suhtes, kusjuures pika τ põranda hoiatus on artefaktil kaasas, ja GNSS-ita vastupidavuse ümbrik ajas. Hindamise **mõõdikud** (AUC / segadusmaatriks / Pd-Pmd, kus Pmd on vahelejäämise tõenäosus) on **valideeritud täpse vastavusega scikit-learn 1.9.0 vastu** — sealhulgas **päris ESA OPS-SAT telemeetrial** (OPSSAT-AD anomaaliatuvastuse andmekogum, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), kus Kshana Manni–Whitney ROC AUC taastoodab scikit-learni `roc_auc_score`-i < 1e-9 täpsusega kõrvale jäetud testijaotusel ning läbipaistev tipuloenduse detektor eraldab märgistatud anomaaliad AUC ≈ 0.85 juures (`tests/opssat_ad_reference.rs`) — ning kompromissimootori numbrilised **tuumad** (ADEV NNLS — mittenegatiivsed vähimruudud — sobitus, χ² järjepidevusribad, van Loani kella Q) **scipy 1.17.1 vastu**; nende peale ehitatud seadme kasu arvud jäävad **MODELLED** tööomadusteks — mitte kunagi väli-/IQ (sünfaasilise/kvadratuurse näidise) andmed, ei mingit hea/halb otsust. Katsekeskkonnale tuginedes hindab sügavam **optimismilõhe uuring** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) **13 detektoriga** paneeli (energy/AGC/SQM/parity pluss seemnega logistilise regressiooni ja ühe peidetud kihiga MLP — mitmekihiline pertseptron — detektorid), sobitab jaotusesisesed vs jaotusvälised **skaleerumisseadused** permutatsioonilise nullhüpoteesiga ja õpib **jäta-üks-välja ennustaja** jaotusvälise halvenemise jaoks jaotusesisestest statistikutest (`cargo run --example optimism_study`). **Tarkvaralise vastuvõtja esiosa** (`src/sdr.rs` — toores IQ/IF (vahesagedus) → korrelaatori varajane/õigeaegne/hiline haru → SQM) ja **päris andmete sisselugemise adapterid** (`src/realdata/` — RINEX, u-blox UBX (u-bloxi binaarprotokoll), GnssLogger, JammerTest, Yunnan, SatGrid) lasevad samadel detektoritel töötada kohapeal antud salvestustel (andmekogumeid hoidlasse ei lisata). **Kvant- vs klassikalise vastupidavuse ristumiskaart** parameetrite määramatuse korral (`src/crossover.rs`; `cargo run --bin crossover_study`) taasgenereerib Tulemuste jooniste taga olevad inertsiaalse ja kella ristumisuuringud. |
| **Kvantvõimekusega PNT demonstraator** | Kolm käivitatavat, **MODELLED** rakendusvaldkonda avatud mootori taga, igaüks väljastab ausa `TradeEvidence` + esinduslikkuse / lennuni jäänud lünkade kirje (`src/representativeness.rs`): **usaldatav kvantajaülekanne** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — otsast lõpuni optilise võre kell + fotoonlink vs CSAC (kiibimõõdus aatomkell) + RF kahesuunaline eelarve, korduvkasutatud ajastuse kaitsetaseme, viivituse/taasesituse rünnaku turvalisuse FoM-i (1 − P_md) ning kellaanomaaliate tuvastamise + CUSUM-i latentsusega); **GNSS-ita kvantnavigeerimine** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — külma aatomi interferomeetri inertsiaalne inertsiperiood vs navigatsiooniklassi INS GNSS-i katkestuse ajal, aus selles, et välise fiksita on kiirendusmõõturi nihe vaadeldamatu, seega viga ikkagi kasvab); ning kvantsüsteemi **rikete/anomaaliate tuvastamine** (`quantum-anomaly-detect`, `src/quantum_faults.rs` — märgistatud rikkekataloog bootstrap-CI (usaldusvahemiku) ROC AUC-ga väliselt valideeritud `eval_stats`-ist ja minimaalse tuvastatava rikkega fikseeritud valehäire määra juures). Nende aluseks on ühine **kvantseadmete veamudelite teek** (`src/quantum_devices.rs`) ja ühtne **kvant- vs klassikalise kompromissi raamistik** (`src/qtrade.rs`). Valideeritud tuumad, millele need tuginevad (hindamismõõdikud vs scikit-learn, kompromissituumad vs scipy), on korduvkasutatud; nende peale ehitatud seadme kasu arvud jäävad **MODELLED** — **illustratiivsed avalike allikate** seadme/lingi parameetrid, modelleerib *klassi*, puudub TRL / lennupärand / sertifitseerimine, puudub agentuuri heakskiit. |
| **Kokkuhoidlik insenertöö ja mõju terviklikkusele** | **Katvuse hinna ROI** (investeeringutasuvus) vaatenurk (`src/frugal.rs`) — hind tarnitud katvuse ühiku kohta arhitektuuri kompromissi jaoks — ning **tuvastuse vahelejäämise → terviklikkuse mõju** kaardistus (`src/integrity_impact.rs`), mis muudab monitori vahelejäämise määra selle panuseks terviklikkusriski. **MODELLED** otsusetoe eelarved, aditiivsed. |
| **Artefaktide vahetus** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — versioonitud, iseennast kirjeldav ümbrik, mis mähib stsenaariumi tulemuse koos selle liigi, skeemi versiooni ja MODELLED/VALIDATED siltidega, nii et salvestatud artefakt jääb iseennast dokumenteerivaks ja vanemad ümbrikud jäävad edasiühilduvalt loetavaks. |

Iga võimekus on kättesaadav Rusti API-na, käivitatava stsenaariumi `kind`-ina või mõlemana.
Võimekusepõhist küpsust — *valideeritud*, *käivitatav* või *teek* — jälgitakse failis
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). **Masinkontrollitud kontrollimaatriks**
(`src/verification.rs`) esitab ristviite nõue → moodul → test → oraakel → olek,
ühiktestitud aususe invariantidega, mis lubavad *valideeritud* sildi
ainult seal, kus seda toetab sõltumatu **väline** oraakel — ja mis registreerivad
riistvara/PA (tootekindluse) võimekused, mida Kshana teadlikult **ei** paku.

</details>

<details>
<summary>Neli andurite paketti, nagu esmakordselt avaldatud (tulemused)</summary>

### Tulemused

Iga stsenaarium võrdleb kvantandurit selle klassikalise vastega
~1.8 h pikkuse GNSS-i katkestuse jooksul. Arvud on reprodutseeritavad (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Mida kvantandurid annavad, kui GNSS on kadunud, kella holdoveri stsenaarium: kvant hoiab 6600 s autonoomiat vs klassikalise 2610 s, palju väiksem ajastusviga ning käideldavus 100% vs 95.6%" width="88%">
  <br><sub>Mida kvantandurid annavad, kui GNSS on kadunud — <code>clock-holdover</code> · seeme 42 · joonistatud mootoriga 0.40.0 ning iga ülaltoodud arv kontrollitakse igal ehitusel praeguse mootori vastu uuesti testiga <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Eelis **sõltub katkestusest ja vibratsioonist**, selgesõnalise tasuvuspunktiga, kus klassikaline võidab — näidatud ausalt kogu tehnoloogilise valmiduse redeli ulatuses (optilise kella arvud on maapealse demonstraatori sihtväärtused; ükski strontsiumi optiline kell ei ole lennanud):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Kvant- vs klassikalise kella holdoveri ristumine kogu tehnoloogilise valmiduse redeli ulatuses, usaldusribadega" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Kvant- vs klassikalise inertsiaalse eelise soojuskaart katkestuse kestuse ja vibratsiooni lõikes, tasuvuspunkti kontuuriga, kus klassikaline võidab" width="96%">
  <br><sub>Kvant- vs klassikalise vastupidavuse ristumine — kella holdoveri TRL-redel (ülal) · inertsiaalse eelise kaart tasuvuskontuuriga (all). Taasgenereeritav käsuga <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Inertsiaalne surnud arvestus: asukohaviga GNSS-i katkestuse ajal — kvant- (külma aatomi) andur püsib spetsifikatsioonijoone lähedal, samal ajal kui navigatsiooniklassi andur hajub kümnete kilomeetriteni" width="80%">
  <br><em>Surnud arvestuse asukohaviga GNSS-i katkestuse ajal: kvantandur (sinine)
  püsib tasasena spetsifikatsiooni lähedal; klassikaline andur (punane) hajub kümnete kilomeetriteni.
  Kshana genereeritud stsenaariumist <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Pakett | Stsenaarium | Kvant | Klassikaline |
|------|----------|---------|-----------|
| **1 — Kella holdover** | `clock-holdover.toml` (20 ns spetsifikatsioon) | optiline kell peab vastu kogu katkestuse | CSAC ületab spetsifikatsiooni katkestuse keskel |
| **2 — Inertsiaalne surnud arvestus** | `imu-deadreckoning.toml` (100 m spetsifikatsioon) | külm aatom: **~41 m**, peab vastu kogu katkestuse | navigatsiooniklass: ületab **~350 s** järel → kümned km |
| **3 — Ajaülekanne** (optiline satelliitidevaheline link) | `timetransfer.toml` | optiline: **~0.3 mm** kaugusmõõtmine | RF (TWSTFT): **~150 mm** kaugusmõõtmine |
| **4 — Hübriidfusioon** (kokkuvõttev) | `hybrid-pnt.toml` | täielik asukoht + ajastus kogu katkestuse vältel | **asukohaga piiratud ~350 s juures** |

Kokkuvõttev pakett näitab fusiooni teesi: optiline satelliitidevaheline ajaülekanne hoiab isegi
klassikalise *kella* lukus, eraldades *inertsiaalse* anduri klassikalise komplekti
nõrgima lülina — st kvant-inertsiaal + optiline ajastus koos.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Kella holdover: faasiviga GNSS-i katkestuse ajal — optiline kell püsib kogu katkestuse vältel 20 ns spetsifikatsiooni piires, samal ajal kui kiibimõõdus kell ületab selle katkestuse keskel" width="80%">
  <br><em>Kella holdover GNSS-i katkestuse ajal: optiline kell (sinine) püsib kogu inertsiperioodi vältel
  20 ns spetsifikatsiooni piires; kiibimõõdus kell (punane) ületab selle poolel teel.
  Kshana genereeritud stsenaariumist <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Veel üks stsenaarium, `orbit-gnss-challenged.toml`, tuletab GNSS-i käideldavuse
**orbitaalgeomeetriast**, mitte käsitsi koostatud akendest: GNSS-i kesta sees olevat
kosmoselaeva levitatakse GPS-i sarnase Walkeri konstellatsiooni suhtes ning nähtavate satelliitide
arv (otsenähtavus, Maa varjutus, kõrgusmask) määrab igal sammul fiksi oleku.
Ööpäeva jooksul on kasutajal fiks ainult ~59% ajast; kvantkell hoiab
5 ns ajastuslahendit läbi iga lünga (käideldavus **1.0**), kiibimõõdus kell
ainult **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="GNSS-i suhtes raskendatud orbiit: kella ajastusviga ööpäeva jooksul GNSS-i kesta sees olevale kosmoselaevale, kus katvuse lüngad on tuletatud orbitaalgeomeetriast — optiline kell püsib lünkade ajal 5 ns spetsifikatsiooni piires, samal ajal kui kiibimõõdus kell selle ületab" width="80%">
  <br><em>Ajastusviga ööpäeva jooksul, GNSS-i käideldavus tuletatud orbitaalgeomeetriast:
  nähtavate satelliitide arv (otsenähtavus, Maa varjutus, kõrgusmask) määrab igal sammul fiksi
  oleku, nii et kell peab üle elama iga lünga — optiline kell hoiab 5 ns
  spetsifikatsiooni, samal ajal kui kiibimõõdus kell selle ületab. Kshana genereeritud stsenaariumist
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Konstellatsiooni saab anda ka päris kaherealiste elemendikogumitena (TLE). *Täielikku* TLE-d
(rida 1 + rida 2) levitatakse täieliku **SGP4/SDP4** mudeliga — sealhulgas
atmosfääritakistus ning süvakosmose Kuu-Päikese ja 12 h / 24 h resonantsiliikmed, mis
on olulised ~12 h GNSS-orbiitide jaoks — valideeritud ametlike AIAA 2006-6753 vektorite vastu
halvimal juhul ≈ 4 mm täpsusega. `scenarios/orbit-sgp4-gps.toml` sisaldab operatiivse GPS-i
konstellatsiooni **päris Celestraki `gps-ops` hetktõmmist** (2021-07-28, 30 satelliiti)
ja nõuab kehtivaid TLE kontrollsummasid — kaherealised elemendikogumid on avatud andmed USA
kosmosejõudude / 18th Space Defense Squadroni kataloogist, levitatud Celestraki poolt
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); värskenda skriptiga
`scripts/fetch_tles.sh`. Ainult rida-2 plokk säilitab
analüütilise kahe keha levitamise (`scenarios/orbit-real-tle.toml`); kahte vormi saab
ühes konstellatsioonis segada. Konstellatsiooni saab samamoodi ehitada
**RINEX-3 GPS-i edastatava efemeriidi** kirjete plokist — vorming, mida vastuvõtja dekodeerib —,
levitatuna IS-GPS-200 kasutajaalgoritmiga ja juhituna läbi sama geomeetria
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Mis see on / ei ole, täielikult</summary>

<a id="what-it-is--is-not"></a>
### Mis see on / ei ole

**See on:** deterministlik, vähese sõltuvusega mootor, mis hõlmab kogu PNT pinu — orbiidi
geomeetria, inertsiaalnavigatsioon, GNSS/INS fusioon, terviklikkus, kellad ja ajastus. See
käivitab stsenaariumi (sageli GNSS-i katkestuse), arendab kalibreeritud anduriveamudeleid
sobiva hindaja kaudu ja hindab tulemust operatiivsete
kvaliteedinäitajate vastu — väljastades reprodutseeritava JSON (JavaScript Object Notation) tulemuse ja SVG-graafiku,
Rusti teegist, käsurealiidesest (CLI), Pythoni laiendusest, brauserisisesest WebAssembly moodulist,
**Model Context Protocoli (MCP) serverist** AI-agentidele või **JetBrainsi IDE (integreeritud
arenduskeskkonna) pistikprogrammist**.

**See ei ole:** lennuriistvara, kvantkasuliku koormuse disain, täielik GNSS-signaali
vastuvõtja, raadiosagedusliku (RF) signaali simulaator ega riistvara-ahelas (HIL) stend ega
sertifitseeritud avioonikatoode — ning see ei asenda MATLAB/Simulinki, STK-d (Systems Tool
Kit) ega Oreki; see asub nende kõrval ja vahetab nendega faile. Kvantriistvara tõetruudus pärineb
avaldatud veamudelitest, mitte sellest tööriistast. Iga võimekuse detailne küpsus
on dokumenteeritud failis [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**See ei ole (veel):** *täielik* aatominterferomeetria füüsikamootor (enamik kvantandureid
kasutab avaldatud Allani/müraeelarve kordajaid; CAI (külma aatomi interferomeetri) kiirendusmõõturil on
esimestest põhimõtetest lähtuv kiht — Mach–Zehnderi faas, projektsioonimüra, kontrasti hääbumine ja
vibratsiooni sidestus, pluss Coriolise ja valgusnihke süstemaatika —, kuid lainefrondi süstemaatika ja
interferentsiribade mitmetähenduslikkuse lahendamine jäävad **P2** (teekaardi faas 2, kvantfüüsika kiht)
teekaardi kihiks, vt [`ROADMAP.md`](ROADMAP.md) ja [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
sertifitseeritud ega riistvaraline GNSS-vastuvõtja (see lahendab üksikpunkti **PVT** (asukoht, kiirus ja aeg) asukohafiksi
päris RINEX (Receiver Independent Exchange Format) koodivaatlustest — valideeritud
päris IGS (International GNSS Service) andmetel — ning selle IQ-kiht (`kshana iq`, alates 0.31.0)
omandab ja jälgib salvestatud või genereeritud baasriba näidiseid tarkvaras, analüüsivastuvõtjana:
see ei juhi raadioriistvara ega edasta, ei ole sertifitseeritud vastuvõtja ega tee
kandelaine faasi positsioneerimist (RTK või PPP)); ega täielik missioonidisaini komplekt (sellel on Lamberti / porkchopi /
manöövri / orbiidi määramise ehitusplokid, kuid see on jõudlussimulatsiooni kiht
GMAT-i (General Mission Analysis Tool)/Oreki *kohal*, mitte asendus). Selle ulatuse omamine on teadlik. Kui vajad esimestest põhimõtetest lähtuvaid külma aatomi
interferomeetri veaeelarveid (nt CARIOQA-PMP-taseme — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — või X-37B-stiilis valideerimist), vt
P2 teekaarti ja [võta ühendust](#support--professional-services), et koostööd teha.

</details>

### Madala Maa orbiidi navigeerimine

Madala Maa orbiidi (LEO) satelliidid mööduvad kiiresti ja valjult. Liik `leo-pnt-chain` jälgib ühte
süsteemi läbi iga etapi: signaal, ülelend ja selle link, navigatsioonisõnum ning
ühendatud asukoha, kiiruse ja aja (PVT) fiks ja täppis-punktpositsioneerimine (PPP). Iga
etapp annab oma arvud järgmisele edasi. Vt [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="LEO PNT ahel leo-pnt-chain liigi tegelikust käivitusest (leo-pnt-end-to-end.toml): signaalietapp (generic-l sagedusel 1191.795 MHz, pilootsignaal jälgitud kiirusel 10.23 Mchip/s) annab edasi ülelennu etapile (1080 km, jälgitud C/N0 tipp 58.2 dB-Hz), mis annab edasi navigatsioonisõnumile (kepler-rac, 300 s sobitus, esituse SISRE 0.91 mm RMS, orbiidi määramisega 0.250 m), mis toidab ühendatud fiksi (ainult GNSS 1.60 m RMS 3D, GNSS pluss LEO 0.43 m) ja täppis-punktpositsioneerimist (koondumine 11.5 min ainult GNSS-iga, 7.5 min 240 LEO-satelliidiga). Etappide vahel antakse edasi 11 väärtust." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Iga stsenaariumiliik perekonniti

Mootori stsenaariumiliigid, perekondadesse jaotatuna. Igal perekonnal on leht, kus on üks kirje liigi kohta
(mootori kirjeldus ja väljad, näitekäsk, käivituse peamised arvud,
[kontrollimaatriksi](docs/VERIFICATION-MATRIX.md) read, mis seda nimetavad, ja graafik, mille mootor ise kirjutab), ning
nende graafikute kontaktleht; [`docs/KINDS.md`](docs/KINDS.md) indekseerib need kõik. Tabeli kirjutab
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) ja lehed
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py) ning mõlemad ebaõnnestuvad, kui mootor saab liigi, mida ükski perekond ei nimeta.

<!-- generated:kind-families -->
| Perekond | Millele see vastab | Liigid | Käivita üks |
|---|---|---|---|
| **[Kellad, ajastus ja holdover](docs/kinds/clocks-timing-and-holdover.md)** | kui kaua kell hoiab aega ilma GNSS-ita ja kuidas ajastussüsteem oma maskide vastu vastu peab | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Inertsiaal-, fusiooni- ja kvantandurid](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | surnud arvestus ja andurite fusioon GNSS-i katkestuse ajal, klassikaliste ja kvantanduritega | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[GPS-ita alternatiivne PNT](docs/kinds/gps-denied-alternative-pnt.md)** | navigeerimine gravitatsiooni, maastiku ja muude väljade järgi, kui GNSS on kadunud | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstellatsioonid, katvus ja geomeetria](docs/kinds/constellations-coverage-and-geometry.md)** | kus satelliidid asuvad, kes neid näeb ja kui hea on geomeetria, Maa, Kuu või Marsi ümber | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS-i mõõtmised, positsioneerimine ja terviklikkus](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudokaugused, asukohafiksid, kaitsetasemed ja kosmosekeskkond | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Segamine, spuufimine ja spekter](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | kuidas häire vastuvõtjani jõuab ja kas see tuvastatakse | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Madala Maa orbiidi navigeerimine](docs/kinds/low-earth-orbit-navigation.md)** | ülelend, link, navigatsioonisõnum ja ühendatud fiks, etapp etapi haaval | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Kuu ja tsislunaarne](docs/kinds/lunar-and-cislunar.md)** | navigeerimine, aeg, tugisüsteemid ja geodeesia Kuu juures | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Kosmosekasutaja navigeerimine](docs/kinds/space-user-navigation.md)** | GNSS-signaalid kosmoselaevadele GNSS-orbiitidest kõrgemal, nende ümber ja neist kaugemal | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optiline PNT](docs/kinds/optical-pnt.md)** | optilised lingid läbi atmosfääri ning optilise pluss RF kvaliteedinäitajad | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Missioonianalüüs, lingid ja kosmoseoperatsioonid](docs/kinds/mission-analysis-links-and-space-operations.md)** | start, tõus, sisenemine, asend, lingid, kontaktide planeerimine ja failivormingud | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Missiooni lõngad](docs/kinds/mission-threads.md)** | stardist sisenemiseni ulatuva faasiahela navigatsiooni- ja ajastuse veaeelarve | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampaaniad](docs/kinds/campaigns.md)** | aheldatud missioonid, pühkimised ja ansamblid, ehitatud teistest liikidest | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Iga käsk

`kshana <scenario.toml>` käivitab stsenaariumi; iga teine käsk on alamkäsk ning `kshana --help` trükib
kõigi nende kasutuse. Käsud on `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (koos `live` ja
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` ja `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) annab igaühe eesmärgi, kontrollitud näite ja dokumentatsioonilehe.

<a id="every-surface"></a>
### Iga liides

Üks mootor, samad tulemused kõikjal: käsurida, Rusti teek, Python, JavaScript ja WebAssembly,
MCP server koos oma pistikprogrammi käskude ja oskustega, Kshana Studio (iga leht töötab brauseris, paigaldust pole vaja, midagi ei laadita üles),
ROS 2, Signal K, OpenCPN, GNSS-SDR ja `gnss_lib_py` integratsioonid, systemd, Docker ja Grafana juurutuskomplektid ning
JetBrainsi pistikprogramm. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) loetleb need koos sellega, kuidas igaüht hankida, ning kõigi
pistikprogrammi käskude, oskuste ja Studio lehtede nimed; [`docs/SURFACES.md`](docs/SURFACES.md) ütleb iga käsu ja liigi kohta,
milline liides seda kannab ja milline mitte, koos põhjusega.

<a id="how-a-run-works"></a>
## Kuidas käivitus toimib

Stsenaarium on TOML (Tom's Obvious, Minimal Language) fail: liik, seeme ja
parameetrid. Mootor käivitab selle ja kirjutab selle kõrvale tulemuse, graafiku ja aruande ning
sinu soovitud ekspordid.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Kuidas käivitus kulgeb. Stsenaariumi TOML-fail (liik, seeme ja selle parameetrid) läheb mootorisse kshana 0.40.0, läbi api::run_toml jaotuse 92 stsenaariumiliigi vahel, deterministlik stsenaariumist, seemnest ja mootori versioonist. Mootor kirjutab failid result.json, chart.svg, report.html ja report.json, table.csv nende liikide puhul, mis selle määratlevad, ning soovi korral SP3, CCSDS OMM ja OEM, CZML, KML, GeoJSON, STK ja SigMF ekspordid; komplekt kirjutab study.json ja study.html. Need failid toidavad Kshana Studiot brauseris, AI-assistenti kshana-mcp serveri kaudu ja pidevat integratsiooni." width="100%">
</picture>

See kaasasolev stsenaarium kestab 2 h: 10 min GNSS-iga, seejärel umbes 1.8 h ilma GNSS-ita. See küsib,
kui kaua strontsiumi optilise võre kell ja kiibimõõdus aatomkell (CSAC) kumbki hoiavad
aega 20 ns piires.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Optiline kell hoiab 20 ns eelarvet kogu 6600 s katkestuse vältel; CSAC hoiab seda
2610 s ning on eelarve piires 95.6% käivitusest, optilise kella 100% vastu.
`kshana example` loetleb kõik kaasasolevad stsenaariumid.

<a id="missions"></a>
## Missioonid

Kümme sektorit esitavad samale mootorile kümme erinevat küsimust. Igaühel on kaasasolevad stsenaariumid,
millest alustada.

| Sektor | Alusta |
|---|---|
| Kaitse ja julgeolek | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Kosmos, Maa orbiit | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Kuu, Marss ja süvakosmos | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Lennundus ja droonid | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Mereala | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Maantee | `automotive-urban-canyon` |
| Raudtee | `rail-tunnel-coast` |
| Elutähtis infrastruktuur ja ajastus | `clock-holdover`, `clock-ensemble` |
| Telekommunikatsioon ja 5G (mobiilsidevõrkude viies põlvkond) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Teadus ja uurimistöö | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Küsimus, mida iga sektor esitab</summary>

<br>

| Sektor | Küsimus, mida see esitab | Alusta |
|---|---|---|
| **Kaitse ja julgeolek** | Kui kaua jäävad meie navigeerimine ja ajastus segamise ja spuufimise all usaldusväärseks ning millised kihid hoiavad meid spetsifikatsiooni piires? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Kosmos: Maa orbiit** | Kas mu kosmoselaev näeb piisavalt navigatsioonisatelliite, kui kaua hoiab selle kell aega fikside vahel ja mida lisaks madala orbiidi navigatsioonikiht? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Kuu ja süvakosmos** | Kas maandur, kulgur või orbiter Kuu juures, Marsi juures või kaugemal saab usaldusväärse asukoha ja aja? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Lennundus ja droonid** | Kui segaja on GNSS-i ära võtnud, kui kaua püsib mu mehitamata õhusõidukisüsteem (UAS) oma asukohaeelarve piires ja kas terviklikkus on mu marsruudil käideldav? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Mereala** | Kui kaugele üle vee segaja ulatub, kas asukoha nihutamine tabataks ja kui kaua suudab laev ilma GNSS-ita sadamasse jõuda? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Maantee ja autotööstus** | Kui kaugele triivib auto viadukti all või teeäärsest segajast möödudes? | `automotive-urban-canyon` |
| **Raudtee** | Mitu sekundit tunnelisse sisenemise järel suudab rong veel öelda, millisel rööbasteel see on? | `rail-tunnel-coast` |
| **Elutähtis infrastruktuur ja ajastus** | Kui GNSS-i aeg kaob või seda spuufitakse, kui kaua hoiavad elektrivõrk, kauplemiskoht või andmekeskus jälgitavat aega? | `clock-holdover`, `clock-ensemble` |
| **Telekommunikatsioon ja 5G** | Kui GNSS-i ajaetalon kaob, kas mu võrgukell püsib ITU-T maskide piires ja kui kaua? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Teadus ja uurimistöö** | Kas ma saan PNT tulemust reprodutseerida, laiendada ja tsiteerida, kuni seemneni välja? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Tõendid

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 kontrollitud kõigi 666 AIAA 2006-6753 etalonvektori vastu, halvim asukohaviga 4.12 mm"></a></p>

<strong>401-st 176</strong> võimekust on valideeritud sõltumatute väliste oraaklite vastu; 221 on ausalt märgitud modelleerituks.
Kontrollimaatriksi iga rida nimetab võimekuse, oraakli, mille vastu seda kontrollitakse,
testi, mis kontrolli käivitab, ja sellest tuleneva sildi. Pidev integratsioon (CI) teeb
võimatuks nimetada võimekust VALIDATED ilma sõltumatu välise oraaklita.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Kuidas võimekus oma sildi välja teenib. Kontrollimaatriksi iga rida nimetab võimekuse, oraakli, mille vastu seda kontrollitakse, testi, mis kontrolli pidevas integratsioonis käivitab, ja sellest tuleneva sildi. Rida võib olla VALIDATED ainult sõltumatu välise oraakliga; muidu on see MODELLED või PARTNER, kui selle omanik on riistvarapartner. Näide: SGP4/SDP4, Cowell 6-DOF + häiritused, pakett-/järjestikune OD, oraakel AIAA 2006-6753 SGP4 kontrollvektorid, test tests/sgp4_verification.rs, silt VALIDATED. Reaalajas arvud: 401 reast 176 VALIDATED, 221 MODELLED, 4 PARTNER. Kokku on 176 võimekust valideeritud sõltumatute väliste oraaklite vastu; veel 221 on ausalt märgitud MODELLED ja 4 kuuluvad PARTNERile." width="100%">
</picture>

| Silt | Read | Tähendus |
|---|---|---|
| VALIDATED | 176 | sõltumatu väline oraakel on nõus: päris andmed, sõltumatu teostus või avaldatud etalonvektorid |
| MODELLED | 221 | kontrollitud analüütilise tõe või simulatsiooni enesejärjepidevuse vastu, ja see öeldakse välja |
| PARTNER | 4 | omanik on riistvarapartner; Kshanal ei ole selle jaoks oraaklit |

Mõned kontrollid: kõik 666 AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 SGP4 (Simplified General Perturbations 4) vektorit 4.12 mm täpsusega; Cowelli jõumudel
0.08 m täpsusega Orekit 12.2 vastu; Galileo 0.61 m ja Swarm-A 0.10 m täpsusega Euroopa Kosmoseagentuuri (ESA)
päris täppisefemeriidide vastu. Testid hoiavad kataloogi `src/` ridade kaetust ligikaudu 95 % juures,
CI-s nõutud vähemalt 85 %. Register on
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), genereeritud failist
`src/verification.rs`: [täielik 401-realine maatriks](docs/VERIFICATION-MATRIX.md) ning see, miks igal
modelleeritud real puudub väline oraakel, failis [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Kuidas valideerimine toimib, kureeritud esiletõstude tabel ja tõendijoonised</summary>

### Valideerimine, reprodutseeritavus ja ausus

- Iga müraliige on kalibreeritud **avaldatud, viidatud** arvule ja valideeritud
  standardse seose vastu (kellade puhul Allani hälve; inertsiaalse puhul Grovesi surnud arvestuse
  vea kasv; ajaülekande puhul ajastus→kaugus teisendus). Liikmepõhist olekut
  jälgitakse failis [`docs/VALIDATION.md`](docs/VALIDATION.md) kui `validated` või
  `not modeled` — midagi ei esitata valideerituna, mis seda ei ole.
- **Reprodutseeritav ülesehituselt:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` jõustab selle; kvant- ja klassikalised käivitused kasutavad
  sõltumatuid seemneid, nii et nende müra on korreleerimata.
- Küpsus on esitatud ausalt: optilise kella ja optilise lingi arvud on *sihtväärtused /
  maapealse demonstraatori* tulemused, mitte lennanud.

### Tõendisilt igal joonisel

Iga käivituse kirjutatud joonis ja tabel ütleb, kui palju seda usaldada ja millistele registriridadele see tugineb. Tulemuse JSON-il on
võti `evidence`, graafiku SVG-l rida joonise all (ja element `<metadata id="kshana-evidence">`) ning CSV-tabelil
ees kommentaariread `# evidence:` (loe valikuga `comment='#'`). See nimetab tõendustaseme, `VALIDATED`, `MODELLED` või `PARTNER`, ning
nende kontrollimaatriksi ridade id-d (`VM-` ja kaheksa kuueteistkümnendnumbrit), mida käivitus kasutas. Tõendustase on nendest
ridadest nõrgim, nii et käivitus, mis toetub ühele modelleeritud reale, märgitakse MODELLED, ükskõik kui palju valideeritud ridu selle kõrval on; silt
ei saa kunagi väita rohkem kui register. Read, olekud ja id-d loetakse maatriksist, neid ei trükita käsitsi
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), ning
`tests/evidence_labels_doc_sync.rs` ebaõnnestub, kui joonisel pole silti või silt on maatriksiga vastuolus.

### Valideerimine ühe pilguga

Iga rida jõustatakse CI-s nimetatud testiga. See tabel on **kureeritud esiletõst**;
täielik masinkontrollitud maatriks on **401 rida — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), koos täielike tõenditega (ja sellega, mis on ausalt *veel*
valideerimata) failis [`docs/VALIDATION.md`](docs/VALIDATION.md) ja väljalaskepõhises
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
artefaktis (genereeritud käsuga `cargo run --bin validation_report`, SLSA-atesteeritud — Supply-chain
Levels for Software Artifacts).

Veerg **Olek** esitab tõendi *liigi*, vastavalt ülaltoodud valideerimisredelile: **VALIDATED** = kontrollitud sõltumatu välise oraakli vastu (päris andmed, sõltumatu teek või avaldatud etalonvektorid); **MODELLED** = kontrollitud analüütilise tõe või simulatsiooni enesejärjepidevuse vastu (sõltumatut välist andmekogumit pole). VALIDATED kirjeldab kontrollimise *meetodit*, mitte läbimist/läbikukkumist — aus möödalask päris välise oraakli vastu jääb VALIDATED, samal ajal kui võrdlust, mida ükski maatriksi rida oraaklina ei nimeta (LRO — Lunar Reconnaissance Orbiter — sobitus allpool), näidatakse MODELLED. `CI` read on protsessikaitsed, mitte kvaliteedinäitajad. Mõned päris andmete saared (mõõdetud tseesiumkell, Stable32 PHASE.DAT ning OPS-SAT/ICGEM kontrollid, kus toorsisenditel puudub edasilevitamise litsents) on **andmetest sõltuvad**: test trükib vahelejätmise teate ja jääb roheliseks, kui sisend puudub, ning avalikud etalonarvud on lisatud kataloogi `tests/fixtures/`. Taasta toorsisendid vastava skriptiga `scripts/fetch_*.sh`.

| Olek | Võimekus | Kokkulangevus | Etalon / oraakel |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4 levitamine | 666/666 vektorit, halvim **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + otsevõrdlus sõltumatu `sgp4` crate'iga |
| **VALIDATED** | Tugisüsteemid — IAU 2000A/B nutatsioon, IAU 2006/2000A CIO ahel, ERA | **bitt-biti haaval** (X,Y 1e-14, s 1e-18, ERA 1e-12 täpsusega) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS vs sõltumatu SPICE mootor | max **0.028″** → ≤ 0.86 m maapinnal, ≤ 3.6 m GNSS-orbiidil | ANISE (puhas Rusti NAIF/SPICE), sama IERS `finals2000A` EOP, 8 epohhi 2020–2023 (võrreldud selle etaloniga; ükski kontrollimaatriksi rida ei nimeta seda välise oraaklina, seega ei ole see märgitud VALIDATED) |
| **MODELLED** | EGM2008 geopotentsiaal (aste/järk 70) | kiirendus = ∇V **< 1e-6** täpsusega; tsonaalne taandumine valideeritud J2-ks | NGA EGM2008 kordajad + analüütiline ∇V samasus |
| **VALIDATED** | Gravitatsioonifunktsionaali süntees (gravitatsiooniga abistatud / GNSS-ita navigatsioonikaart) | GRS80 Somigliana + γ_e/γ_p **3.5e-12** täpsusega; päris EGM2008 häirituskaart füüsikaline (RMS ≈ 26 mGal, a/j 70) | GRS80 (Moritz 1980, IAG — International Association of Geodesy) Somigliana normaalgravitatsioon + päris ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allani hindajad (ADEV/MDEV/TDEV/HDEV) + usaldusribad | taastoodavad etalonhälbed; χ² ribad ühtivad | NIST SP 1065 (Riley), 1000-punktiline Table 31/32 |
| **VALIDATED** | Allani hindajad **päris mõõdetud tseesiumkellal** | OADEV/OHDEV **1e-3** täpsusega (täheldatud ≤ 3e-5), 16 keskmistamistegurit | Stable32 päris 5071A Cs vs H-maser, 556,990 punkti (`tests/cs5071a_reference.rs`, andmetest sõltuv) |
| **VALIDATED** | Allani hindajad **kanoonilisel Stable32 PHASE.DAT-il** | OADEV/MDEV/TDEV **1e-3** täpsusega (täheldatud ≤ 5e-5), 139 keskmistamistegurit | Stable32 etalonhälbed PHASE.DAT jaoks (`tests/phasedat_reference.rs`, andmetest sõltuv) |
| **MODELLED** | IMU veamudel — ARW / VRW / nihke ebastabiilsus | taastatud **< 5 %** täpsusega (nihke ebastabiilsus < 15 %) | Analog Devices ADIS16465 andmeleht; NaveGo etalonprofiil |
| **VALIDATED** | Numbriline Cowelli levitaja + jõumudel (konservatiivsed tasemed) | halvim asukohaviga **0.08 m** 24 h jooksul, 278 epohhi (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowelli takistuse tase + absoluutsed Päikese/Kuu efemeriidi ja tiheduse sisendid | takistuse tase iseloomustatud ≈ 333 m / 24 h; häirimata ühtib universaalmuutuja Kepleriga alla m, energia/impulss ~1e-9 | sisseehitatud madala täpsusega efemeriid + analüütiline Kepler |
| **MODELLED** | Lambert · Tsiolkovski · porkchop | ringreis kahe keha tõeni; ΔV **< 0.01 %** | Izzo 2015 · raketivõrrand · analüütiline Hohmanni alampiir |
| **MODELLED** | Orbiidi määramine (Gaussi–Newtoni pakett) | alla m / mm·s⁻¹ mürata; ~2 m 5 m mürapõranda juures | kahe keha + J2 üle RK4 kaare |
| **MODELLED** | Jõumudeli sobitus vs Galileo täppisefemeriid (kogu kaar) | **0.61 m** 3-D RMS, 24 h, a/j-70, ainult jõud | ESA/ESOC `ESA0MGNFIN` lõplik orbiit (E11), päris `finals2000A` EOP (võrreldud selle etaloniga; ükski kontrollimaatriksi rida ei nimeta seda välise oraaklina, seega ei ole see märgitud VALIDATED) |
| **MODELLED** | Jõumudeli sobitus vs Swarm-A täppisefemeriid (taandatud dünaamika) | **0.10 m** 3-D RMS (empiirilise taseme piir, mitte mõõt) | ESA `SW_OPER_SP3ACOM_2_` täppisorbiit (võrreldud selle etaloniga; ükski kontrollimaatriksi rida ei nimeta seda välise oraaklina, seega ei ole see märgitud VALIDATED) |
| **MODELLED** | Jõumudeli sobitus vs LRO Kuu juures (aus möödalask) | **6.67 m** taandatud dünaamikaga, 5 m sihist *kõrgemal* | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (võrreldud selle etaloniga; ükski kontrollimaatriksi rida ei nimeta seda välise oraaklina, seega ei ole see märgitud VALIDATED) |
| **MODELLED** | Süvakosmose Marsi OD (taandatud dünaamikaga SRIF) | **≈ 0.2 m** Marsi LMO (simulatsiooni FoM, *mitte* päris missioon) | sünteetiline suletud ahela OD — hindaja masinavärgi valideerimine |
| **MODELLED** | Päikese-keskne Marsi dünaamika vs JPL DE440 | **137 m 1-päevase kaare juures** (kasvab kaarega = modelleerimata n-keha) | JPL DE440 läbi ANISE (`xval/anise-mars-od`, tuumast sõltuv) (võrreldud selle etaloniga; ükski kontrollimaatriksi rida ei nimeta seda välise oraaklina, seega ei ole see märgitud VALIDATED) |
| **VALIDATED** | Üksikpunkt-positsioneerimine vs mõõdistatud IGS-i koordinaat (päris vaatlused) | **5.7 m** 3-D RMS / **1.1 m** horisontaalselt, kahesageduslik ionosfäärivaba koodi SPP | IGS-i jaama ABMF mõõdistus + GPS-i edastatav efemeriid, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Tihedalt seotud GNSS/INS UKF | **0.77 m RMS** 30-min LEO ülelennul, sh 120 s katkestus | jõumudeli inertsiperiood, käsitsi tuletatud |
| **MODELLED** | GPS-ita gravitatsioonikaardi navigeerimine | ~70 km INS-i triiv → taastatud **~145 m** | ESA NAVISP *Quantum Wayfarer* siht |
| **MODELLED** | Maastikupõhine navigeerimine (TERCOM/SITAN) | 70 km triiv → **< 500 m** (võrgustiku lahutuse põrand ~140 m) | SRTM `.hgt` DEM; käsitsi sisestatud triiv (mitteringne kontroll) |
| **MODELLED** | IGRF-14 peaväli (aste/järk 13) | poolus ~80.7°N, dipool ~29.7 µT, füüsikaline 22–67 µT vahemik | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidti poolnormaliseeritud) |
| **MODELLED** | Navigatsioonisignaali modulatsioon ja koodijälgimine | BPSK enese-SSC = **2/(3·R_c)**; ühikpindalaga PSD-d; **alla meetri** C/A DLL värin 45 dB-Hz juures | Kinnise kuju SSC/PSD ankrud + Kaplani & Hegarty DLL termilise müra valem |
| **MODELLED** | CR3BP halo/NRHO diferentsiaalkorrektor | STM = lõplikud vahed; orbiit sulgub **masinatäpsuseni**; L2 9:2 NRHO **≈ 6.57 d / periluun ≈ 3,250 km** | lõplike vahede STM kontroll + avaldatud L2 lõunapoolne 9:2 NRHO (≈ 6.56 d / ≈ 3,370 km) — CR3BP, mitte päris Gateway efemeriid |
| **MODELLED** | ARAIM kahe konstellatsiooni terviklikkus | konstellatsiooniülene rikkerežiim päris GPS + Galileo peal | EU ARAIM TR (tehniline aruanne) / DO-316; Celestrak `gps-ops` 2021-07-28 (võrreldud selle etaloniga; ükski kontrollimaatriksi rida ei nimeta seda välise oraaklina, seega ei ole see märgitud VALIDATED) |
| **VALIDATED** | GNSS-i geomeetria / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | ühtib **1e-6 suhtelise** täpsusega 8 geomeetria lõikes (hästi tingitud → peaaegu singulaarne) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — sõltumatu teek (`tests/dop_reference.rs`) |
| **VALIDATED** | ML detektorite hindamismõõdikud (AUC/ROC/segadusmaatriks/Pd-Pmd/täpsus/F1) | **täpsed loendid + < 1e-9** 5 andmekogumi × 24 läve lõikes | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — sõltumatu teek (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | Anomaaliatuvastuse ROC AUC **päris ESA OPS-SAT telemeetrial** | AUC taastoodab scikit-learni **< 1e-9** täpsusega; tipuloenduse detektori AUC **≈ 0.85** märgistatud testijaotusel | scikit-learn `roc_auc_score` OPSSAT-AD testijaotusel (Ruszczak et al. 2025, CC BY 4.0) — päris OPS-SAT telemeetria (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Kvantkompromissi numbrilised tuumad (ADEV NNLS sobitus · χ² järjepidevusribad · van Loani kella Q) | NNLS + Q **täpne**; χ² **< 5e-4** tööpiirkonna dof ≥ 48 juures | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | MTIE / MDEV / TDEV telekommunikatsiooni ekslemismõõdikud (ITU-T G.810/G.823/G.8261/G.811 — Rahvusvahelise Telekommunikatsiooni Liidu telekommunikatsiooni standardimissektori soovitused) | MTIE (9 keskmistamistegurit, bititäpne) ning MDEV + TDEV (8 tegurit, **< 1e-9** suhteline) NIST SP 1065 LCG (lineaarne kongruentne generaator) seerial | allantools 2024.06 `mtie` / `mdev` / `tdev` — sõltumatu teek (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | MCDA kompromissuuringu meetodid — kõik neli otsuseperekonda, üheksa väliselt valideeritud agregaatorit (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) pluss **AHP** paarisvõrdluse prioriteedikaalumine | hinded / järjestused / konkordantsimaatriksid taastoodetud **< 1e-9** täpsusega | pymcdm + pyDecision (sõltumatud kolmandate osapoolte MCDA teegid) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | LEO Doppleri ümbrik orbiidist ja kandjast | Iridiumi maksimum avaldatud ±36 kHz-st **5 %** piires; Xona Pulsar X1 avaldatud **32–34 kHz** sees | RNTF LEO PNT testitulemused; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | PPP koondumine LEO täiendusega | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min 60 / 96 / 192 / 288 LEO-satelliidiga, monotoonne; filtri NEES χ² riba sees | trend võrreldud tööga Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); konstellatsioone ja müra ei taastoodetud |
| **MODELLED** | Tingimuslik ajastuse kaitsetase (holdoveriga piiratud tuvastamata ajaviga spuufimise all) | koosseis taastoodab mitmesammulise `clock_state` kovariatsiooni rekursiooni; kalibreeritud päris salvestatud spuufimisel | JammerTest 2024 (Zenodo 15911589) skalaarid + van Loani / CUSUM-i kinnised kujud (`examples/tpl_jammertest`) |
| **MODELLED** | PNT vastupidavuse hindamine + otsuse ebastabiilsus | 35 käsitsi tuletatud oraaklitesti; baidikaupa deterministlik uuringu artefakt (fikseeritud seeme) | DHS RPCF v2.0 vastavus + Dirichlet' / Kendalli τ / Hill-N2 kinnised kujud — sünteetilised arhitektuurid, mitte sertifitseerimine |
| **MODELLED** | RF-häiringute optimismilõhe uuring (skaleerumisseadused + jäta-üks-välja ennustaja) | permutatsioonilise nullhüpoteesi olulisus; baidikaupa deterministlik artefakt (5 seemet) | sünteetiline parameetritel põhinev korpus — hindamise *mõõdikud* on VALIDATED scikit-learni vastu (ülal); uuring on MODELLED |
| CI | Platvormideülene reprodutseeritavus | bititäpselt identne sisend + kuju võrdlusväärtused 3 OS-il (operatsioonisüsteemil) | Linux / macOS / Windows CI maatriks, SHA-256 võrdlusväärtused |
| CI | Testide kaetus | **~95 % ridadest** kataloogis `src/`, välja arvatud `src/*_data.rs` ja `src/main.rs`, nõutud ≥ 85 % | cargo-tarpaulin (LLVM mootor) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Kuidas võimekus oma sildi välja teenib: nõue seotakse mooduliga kataloogis src, testiga kataloogis tests, välise oraakliga (päris andmekogum, sõltumatu etalonteostus või avaldatud vektorid) ja olekuga — CI-s jõustatud kaitsega, et ükski võimekus ei saa olla valideeritud ilma välise oraaklita. Reaalajas arvud: 176 valideeritud, 221 modelleeritud, 4 partneri, kokku 401" width="900">
  <br><sub>Kuidas võimekus oma sildi välja teenib — CI-s jõustatud invariant: välist oraaklit pole ⇒ ei saa olla valideeritud · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Kuidas iga väide on toetatud: valideeritud veerg on ülesehituselt 176-st 176 ExternalDataset (CI-s jõustatud); modelleeritud read on ausalt märgistatud InternalConsistency, ReferenceImpl või ExternalDataset; partneri ridadel ei ole Kshana oraaklit" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="SGP4/SDP4 halvima juhu asukohaviga AIAA 2006-6753 etaloni suhtes režiimide kaupa, logaritmskaalal: iga režiim on AIAA tolerantsist tunduvalt allpool, halvim juht 4.12 mm süvakosmose mitteresonantses režiimis" width="96%">
  <br><sub>Ülal: iga valideeritud rida on ülesehituselt toetatud välise andmekogumiga. All: SGP4 ühtib ametliku etaloniga igas režiimis (halvim 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Kontrolli olek kõigi 401 võimekuse lõikes: 176 valideeritud (kontrollitud välise oraakli vastu), 221 modelleeritud, 4 partneri omanduses" width="780">
  <br><sub>176 valideeritud · 221 modelleeritud · 4 partneri — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Võimekuse valdkonnad

Avaliku kaardi iga võimekus, valdkondade kaupa, koos registri sildiga. Valdkondade tabeli kirjutab
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) failist `web/capabilities.json`, samast failist, mida
Studio kõige kaart loeb.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Kshana võimekused valdkonna ja küpsuse järgi: valideeritud ja modelleeritud avalikud võimekused valdkonna kohta, joonistatud failist web/capabilities.json tööriistaga tools/gen_validation_figures.py" width="900">
</picture>

Täielik tabel, valdkond valdkonna haaval iga võimekuse ja selle sildiga, on failis [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Paigaldamine

Üks rida annab käsurea tööriista: **`cargo install kshana`**. Iga kanal tarnib
v0.40.0 samast sildistatud commit'ist.

<!-- channels:begin -->
| Kanal | Paigaldamine | Juhend |
|---|---|---|
| Proovi brauseris | ava https://kshana.dev | [Studio juhend](https://kshana.dev/docs/studio.html) |
| Käsurida (Rust) | `cargo install kshana` | [Käsurea kasutamine](https://kshana.dev/docs/rust.html#usage--cli) |
| Rusti teek | `cargo add kshana` | [API teatmik docs.rs-is](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Pythoni API juhend](https://kshana.dev/docs/python-api.html) |
| JavaScript ja WebAssembly | `npm install kshana` | [npm-i ja WebAssembly juhend](https://kshana.dev/docs/npm.html) |
| AI-assistent (MCP server, cargo) | `cargo install kshana-mcp` | [MCP serveri juhend](https://kshana.dev/docs/mcp.html) |
| Docker-tõmmis | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [MCP serveri juhend: Docker](https://kshana.dev/docs/mcp.html#install) |
| Claude Desktopi laiendus | tee topeltklõps oma süsteemi `.mcpb` failil: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (üks klõps) | [Lisa Cursorisse (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Lisa Cursorisse (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (üks klõps) | [Paigalda VS Code'i (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Paigalda VS Code'i (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Eelehitatud binaarfail | laadi väljalaskest alla kshana-mcp-<target> ja kontrolli seda SHA256SUMS vastu | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Ametlik MCP register | otsi io.github.ashfordeOU/kshana-mcp | [Kõik MCP paigaldusnäited](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Kaug (voogedastatav HTTP), isehostitud | `kshana-mcp --http 127.0.0.1:8080` | [Isehostimise juhend](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Claude Code'i pistikprogrammide turg | `/plugin marketplace add ashfordeOU/kshana` | [Kshana kasutamine agendist](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| JetBrainsi IDE pistikprogramm | Settings → Plugins → Marketplace → otsi "Kshana" (pistikprogrammi ID dev.kshana.ide) | [Pistikprogrammi juhend](https://kshana.dev/docs/jetbrains.html) |
| Signal K pistikprogramm | `npm install signalk-kshana-trust` | [Signal K pistikprogrammi juhend](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN pistikprogramm | laadi väljalaskest alla pistikprogrammi tarball | [OpenCPN kataloogi esitamine](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana juhtpaneel | impordi väljalaskest kshana-grafana-*.json | [Juhtpaneeli lähtekood](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Võrdlusehituse tõmmis | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Merendusintegratsioonid](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana JetBrains Marketplace'is"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Ehitub Rust 1.88 või uuemaga, rust-version failis Cargo.toml"></a></p>

MCP on Model Context Protocol. Kinnita väljalase käsuga `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` või `npm install kshana@0.40.0`. Lähtekoodist ehitamiseks vt
jaotist [Paigaldamine ja ehitamine](#install--build) Teatmiku all.

<details>
<summary>Käivita stsenaarium Pythonist ja WebAssemblyst</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Lisaks funktsioonile `run` pakub moodul funktsioone `run_full` (JSON, SVG ja üherealine kokkuvõte korraga),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` ja `error_kind`; vt
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

npm-i pakett on kogu mootor, kompileeritud WebAssemblyks. Node.js-is anna binaarfail funktsioonile
`initSync`; brauseris laadib `await init()` selle alla (vt [`README.npm.md`](README.npm.md)).

```js
import { readFileSync } from "node:fs";
import { createRequire } from "node:module";
import { initSync, run, summary, version } from "kshana";

const wasm = createRequire(import.meta.url).resolve("kshana/kshana_bg.wasm");
initSync({ module: readFileSync(wasm) });

const toml = readFileSync("clock-holdover.toml", "utf8");
const result = JSON.parse(run(toml));
console.log(version(), result.quantum.fom.holdover_s, result.classical.fom.holdover_s);
// 0.40.0 6600 2610
console.log(summary(toml));
```

</details>

<a id="architecture"></a>
## Arhitektuur

Keskel asub üks avatud mootor ja iga liides käitab seda: käsurida, Rusti
teek, Python, WebAssembly ja Kshana Studio, MCP server, Docker-tõmmis ja
JetBrainsi pistikprogramm. Sama stsenaariumifail annab igaühel samad baidid. Kshana Pro asub
peal eraldi kihina, mis sõltub mootorist ega hargne sellest kunagi.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Kshana arhitektuur: keskel üks avatud mootor, kshana 0.40.0 litsentsi AGPL-3.0 all, koos api::run_toml-iga, tüübitud jaotusega iga liigi üle, ja 401 võimekuse kontrolliregistriga (176 VALIDATED, 221 MODELLED, 4 PARTNER). Selle ümber käitab iga liides sama mootorit: Käsurida (cargo install kshana); Rusti teek (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); MCP server (cargo install kshana-mcp); Docker-tõmmis (ghcr.io/ashfordeou/kshana-mcp); JetBrainsi pistikprogramm (Marketplace: &quot;Kshana&quot;). Selle all Kshana Pro, omandkiht, mis sõltub avatud mootorist teegina ega hargne sellest kunagi ning ei lisa ühtegi füüsikalist mudelit." width="100%">
</picture>

<details>
<summary>Mootori sees: valdkonnakihid ja kontrolliregister</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Kshana arhitektuur kihtidena. Viis välisust (käsurida, Python, JavaScript ja WebAssembly, MCP server ja JetBrainsi pistikprogramm) jõuavad ühe api::run_toml-ini, tüübitud jaotuseni 92 liigi üle. Selle all on kaheksa valdkonnakihti: aeg ja tugisüsteemid, kellad ja ajastus, inertsiaalne ja fusioon, GNSS ja terviklikkus, astrodünaamika, LEO PNT, Kuu, Marss ja süvakosmos ning missioonid ja uuringud, ühisel tuumal, kõik ristviidatud kontrollimooduli kaudu, mis on 401 võimekuse masinkontrollitud maatriks ja iga sildi ainus tõeallikas." width="100%">
</picture>

**Üks mootor, palju välisuksi.** Üks Rusti tuum (`kshana`) käivitab iga stsenaariumi,
kättesaadav CLI, Pythoni laienduse, brauserisisese WebAssembly mooduli, **MCP
serveri** kaudu AI-agentidele ja **JetBrainsi IDE pistikprogrammi** kaudu — kõik koonduvad ühte
`api::run_toml` jaotusse. Sees ühenduvad andurite paketid ühise veamudeli
liidesega; nende kõrval on **tugisüsteemide kiht** (IAU 2006/2000A
pretsessioon–nutatsioon ja CIO-põhine GCRS↔ITRS teisendus), **astrodünaamika/numbriline
kiht** (analüütiline SGP4/SDP4 **ja** numbriline Cowelli levitaja koos oma
EGM2008/häirituste jõumudeli, manöövrite disaini ja orbiidi määramisega),
**terviklikkuse/GNSS-i kiht** (RAIM/ARAIM, SBAS, mõõtevaldkond, segamine, tsislunaarne),
**fusiooni / alt-PNT kiht** (GNSS/INS hindajad ja gravitatsiooni/maastiku/magnetvälja
kaardisobitajad), **süvakosmose ja Kuu kiht** (radiomeetriline Marsi PNT ja
Kuu PNT komplekt, iga osa tõendustase maatriksis — LTC aeg, VLBI, ühine OD+kell, tugisüsteemi realiseerimine, teenindusruum,
diferentsiaalne PNT, koostalitlus), **missioonianalüüsi kiht** (stardi / taassisenemise / katvuse /
suunamise / ülelendude / lingi eelarved ja kosmoseilma keskkond) ning avatud
**vastupidavuse ja AI/ML uuringute kiht** (RPCF vastupidavuse hindamine, RF-häiringute optimismilõhe
ja kvantvõimekusega PNT demonstraator), mille reprodutseeritavad artefaktid toetuvad
valideeritud tuumadele.

Tuuma kõrval on kaks iseseisvat, **tööruumist välja jäetud** crate'i — `mcp/kshana-mcp`
(MCP server, ehitatud edition-2024 `rmcp` SDK-le) ja `xval/anise-frames`
(ANISE/SPICE tugisüsteemide ristkontroll, mis toob kaasa MPL-2.0 (Mozilla Public License 2.0) sõltuvused) — hoitud avaldatud
crate'i sõltuvusgraafist, `Cargo.lock`-ist, litsentsiväravast ja MSRV (minimaalne toetatud Rusti versioon) ehitusest eemal juurfaili
`Cargo.toml` `exclude` loendiga. JetBrainsi pistikprogramm (`ide/jetbrains`) on eraldi Kotlini
projekt. Täieliku diagrammide komplekti leiad failist [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

Renderdatud diagrammid (mootori voog, moodulite kaart, levitamine) on failis [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagrammid

Diagrammid on Mermaidi lähtefailid kataloogis [`docs/diagrams/`](docs/diagrams/), renderdatud SVG-ks ja PNG-ks kataloogi
[`docs/assets/diagrams/`](docs/assets/diagrams/) (Linuxis `tools/render-diagram-chromium.sh <name>`, mujal ülejäänud kaks
`render-diagram` skripti), ning kirje seob iga PNG täpselt selle SVG-ga, millest see tehti. Testid fikseerivad
arvud, mida need esitavad. Ülaltoodud jaotiste graafikud joonistavad tööriistad mootori käivitustest; need näitavad, kuidas
osad kokku sobivad.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Süsteem: kuus välisust (käsurida, Python, WebAssembly ja npm koos Kshana Studioga, MCP server koos pistikprogrammide ja oskustega, JetBrainsi pistikprogramm, integratsioonid) kutsuvad kõik ühte jaotust iga stsenaariumiliigi üle, mis käitab üht mootorit, mis koosneb ühisest tuumast, andurite pakettidest ja tugisüsteemidest ning valdkonnamudelitest, ja kirjutab reprodutseeritava tulemuse ja graafiku" width="900"><br>
  <sub>Üks jaotus, üks mootor, reprodutseeritav väljund · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · lähtefail <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Liidesed: üks deterministlik võrguühenduseta mootor toidab käsurida, Rusti teeki, Pythonit, WebAssemblyt ja npm-i ning MCP serverit; Studio töötab WebAssembly ehitusel, pistikprogrammi käsud ja oskused MCP serveril, integratsioonid ja juurutuskomplektid käsureal ning JetBrainsi pistikprogramm teegil" width="900"><br>
  <sub>Iga liides, samast mootorist · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · lähtefail <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Ühe käivituse sees: stsenaariumifail koos seemne ja GNSS-i ajajoonega toidab mootorit, mis igal ajasammul arendab veamudelit, käivitab hindaja ja hindab kvaliteedinäitajaid ning kirjutab reprodutseeritava tulemuse ja graafiku" width="900"><br>
  <sub>Käivituse sisemine tsükkel · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · lähtefail <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Vastuvõtja usaldus: vastuvõtja logi või voog loetakse sisse epohhipõhisteks vaadeldavateks ja vastuvõtja enda lippudeks, läbib monitorid ning muutub nõuandvaks usaldusskooriks koos vahemiku ja põhjustega, mis toidab Studiot, telemeetriat, allkirjastatud tõendipaketti, Jammertesti ja bench'i hindamist ning vastavusaruannet" width="900"><br>
  <sub>Vastuvõtja logist usaldusskoorini ja sellest, mis seda kasutab · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · lähtefail <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Laborite ringreis: stsenaarium eksporditakse koos sündmuste ja katsetingimustega, operaator väljaspool Kshanat taasesitab faili labori simulaatori kaudu, vastuvõtja logi hinnatakse sõnastatud sündmuste vastu ning tõendite ringreis seob stsenaariumi, tingimuste ja logi räsid ning hinde allkirjastatud paketiks" width="420"><br>
  <sub>Stsenaariumist allkirjastatud paketini; Kshana ei tooda ega taasesita kunagi signaali · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · lähtefail <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: brauser käitab WebAssemblyks kompileeritud mootorit kohapeal, midagi üles laadimata, võtab kaasasolevad stsenaariumid või sinu avatud stsenaariumi või logi ning näitab tulemust lihtsas vaates, täpsemas vaates ja ülesandelehtedel, kasutaja salvestatud eksportidega" width="900"><br>
  <sub>Kuidas Studio kohapeal töötab · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · lähtefail <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Testimise ja väljalaske voog: kohalikud väravad (vormindus, clippy, omistamiseta kontroll, dokumentatsiooni kaetuse põrk ja scripts/gate.sh, mis käivitab täieliku komplekti ja korduskäivitused ning kirjutab kviitungi, mida pre-push konks kontrollib) viivad ainult CI-ga tõmbetaotluseni ja rohelise täieliku CI-ni; omanik kerib main-haru edasi rohelise commit'ini ja annoteeritud silt maandub sellele pärast versioonide sünkroonsuse kontrolli; väljalaske töövoog kontrollib täielikku komplekti sildistatud commit'il enne, kui midagi avaldatakse, ehitab binaarfailid koos SBOM-i, kontrollsummade ja ehituse päritoluga, avaldab crates.io-sse, PyPI-sse, npm-i, konteineriregistrisse, MCP registrisse ja JetBrains Marketplace'i, küsitleb iga registrit, kuni see serveerib uut versiooni, ning käivitab sildilt saidi ehituse; eraldi ainult saidi tee käivitab pages-töövoo sildiga main ja sellest keeldutakse, kui pärast viimast väljalaset on muutunud midagi väljaspool katalooge web/ ja .github/" width="900"><br>
  <sub>Testimise ja väljalaske voog, kohalikest väravatest kontrollitud väljalaskeni ja ainult saidi tee · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · lähtefail <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Moodulite kaart: käsurida, Python, WebAssembly, MCP server ja JetBrainsi pistikprogramm kutsuvad tüübitud jaotust iga liigi üle, mis jõuab ühise tuuma, aja ja tugisüsteemide, andurite pakettide, astrodünaamika, terviklikkuse, spuufimise tuvastamise, fusiooni, süvakosmose ja Kuu, vastupidavuse ning kohtuniku ja võrdlustesti mooduliteni, mida kõiki toetab kontrollimaatriks" width="1000"><br>
  <sub>Kus kood asub · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · lähtefail <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Levitamine: üks hoidla tarnib tuuma crate'i, MCP serveri, IDE pistikprogrammi ja ristkontrolli crate'id crates.io-sse, PyPI-sse, npm-i, GitHub Releases'i, Pages'i katsekeskkonda, konteineriregistrisse, MCP registrisse ja JetBrains Marketplace'i, koos Zenodo arhiiviga" width="900"><br>
  <sub>Mis kuhu tarnitakse ja mis seda kontrollib · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · lähtefail <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI-assistent

[`kshana-mcp`](mcp/kshana-mcp/) on MCP server: sinu assistent käivitab tegeliku mootori ja
loeb tagasi selle JSON-i, selle asemel et matemaatikat arvata. Iga selle 49 tööriistast on õhuke ümbris
`kshana` teegi avaliku funktsiooni ümber, nii et serveris ei ole simulatsiooniloogikat.

### MCP serveri paigaldamine

> Nõuandev, mitte tüübikinnitust omav navigatsiooniseade: navigeerimise eest vastutab jätkuvalt operaator.
> Server töötab sinu arvutis; midagi ei saadeta ettevõttele Ashforde OÜ.

Vali ükskõik milline kanal. Iga link ja näide on genereeritud ühest skriptist
(`scripts/gen_mcp_install.py`) ja kontrollitud pidevas integratsioonis; näited Claude Desktopi,
Claude Code'i, Cursori, VS Code'i, Windsurfi, Zedi, Goose'i, Codex CLI, Gemini CLI ja Continue jaoks on failis
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanal | Käsk või nupp | Nõuab | Kinnitatud vorm |
|---|---|---|---|
| Claude Desktopi laiendus | tee topeltklõps oma süsteemi `.mcpb` failil: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | mitte midagi | v0.40.0 `kshana-mcp-<target>.mcpb` |
| Cursor (üks klõps) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node või Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (üks klõps) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node või Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · pistikprogramm: `/plugin marketplace add ashfordeOU/kshana`, seejärel `/plugin install kshana@ashforde` | Node (või Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ koos uv või pipx-iga | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | valem versioonile v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket`, seejärel `scoop install kshana-mcp` | Scoop (Windows) | manifest versioonile v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Eelehitatud binaarfail | [väljalaske leht](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, kontrollitud `SHA256SUMS`-i ja `gh attestation verify` abil | mitte midagi | v0.40.0 |
| MCP register | `io.github.ashfordeOU/kshana-mcp` (leiavad registrit tundvad kliendid) | registrit tundev klient | `0.40.0` |
| Kaug (voogedastatav HTTP) | `kshana-mcp --http 127.0.0.1:8080`, isehostitud: vt [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | sinu enda host | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp Glamas, selle MCP serveri kvaliteediskoor"></a></p>

Claude Code'is saabub sama server pistikprogrammina: `/plugin marketplace add ashfordeOU/kshana`, seejärel
`/plugin install kshana@ashforde`. Pistikprogramm lisab tööriistade peale kaldkriipsukäsud: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` ja `/kshana-jammertest`. Laeva usalduse tööriistad toidavad Signal K ja
OpenCPN-i integratsioone: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Kliendipõhine seadistus on failis [`docs/integrations.md`](docs/integrations.md). Server on loetletud
ametlikus MCP registris kui `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>49 tööriista</summary>

<br>

**Stsenaariumid ja aruanded**

| Tööriist | Mida see teeb |
|---|---|
| `run_scenario` | Käivita stsenaarium TOML (Tom's Obvious, Minimal Language) definitsioonist |
| `list_scenario_kinds` | 92 sisseehitatud stsenaariumiliiki koos kirjelduste + kohustuslike/valikuliste väljadega — et agent saaks koostada kehtiva stsenaariumi |
| `validate_scenario` | Eelkontroll: parsi TOML ja tuvasta selle liik, ilma käivitamata |
| `list_example_scenarios` | Kaasasolevad etalonstsenaariumid JSON-ina |
| `get_example_scenario` | Ühe kaasasoleva etalonstsenaariumi TOML-tekst, baidi haaval kataloogis `scenarios/` olev fail |
| `report_scenario` | Käivita stsenaarium ja tagasta selle aruanne |
| `animate_scenario` | Käivita stsenaarium ja tagasta selle aegread animatsioonina |
| `sky_geometry` | Taeva geomeetria asimuudist sõltuva siluetijoone all: nähtavad ja varjatud satelliidid, DOP, ida-põhi-üles kovariatsioon ja horisontaalne veaellips; või siluetijoone eelseade koos päritoluga |

**Eksport ja koostalitlusvõime**

| Tööriist | Mida see teeb |
|---|---|
| `list_export_formats` | Millised koostalitlusvormingud kehtivad stsenaariumile (`czml`, `kml`, `geojson`, `stk`, `sigmf`), põhjus, kui mõni ei kehti, ja spetsifikatsioon, mida iga kirjutaja järgib |
| `export_interop` | Ekspordi stsenaarium CZML-ina (Cesium Language), KML-ina (Keyhole Markup Language), GeoJSON-ina, STK (Systems Tool Kit) efemeriidina `.e` või SigMF-ina (Signal Metadata  |
| `import_route` | Kirjuta GeoJSON `LineString` marsruut stsenaariumisse, mis lendab teekonnapunktide rada (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`), ja tagasta uus TOML |
| `export_sp3` | Ekspordi `orbit` stsenaariumi konstellatsioon SP3-c (Standard Product 3, redaktsioon c) täppisefemeriidina |
| `export_omm` | Ekspordi `orbit` stsenaariumi elemendid CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) kataloogina |
| `export_oem` | Ekspordi `orbit` stsenaariumi olekuseeria CCSDS OEM (Orbit Ephemeris Message) 2.0 efemeriidina — TEME (tõeline ekvaator, keskmine pööripäev) asukoht *ja*  |
| `export_table_csv` | Käivita stsenaarium ja tagasta selle reprodutseeritavuse tabel CSV-na (komaga eraldatud väärtused) — baidikaupa stabiilne tabel, mille CLI (käsurealiides) kirjutab kui `<scenario>.table.csv` |
| `export_test_bench` | Stsenaariumi sõiduki liikumine ja sündmused labori GNSS-simulaatorile (`kshana bench-export`) |

**Vastuvõtja ja laeva usaldus**

| Tööriist | Mida see teeb |
|---|---|
| `assess_receiver_log` | Hinda päris GNSS-i (globaalse satelliitnavigatsioonisüsteemi) vastuvõtja logi usaldusväärsust |
| `assess_vessel_stream` | Hinda piiratud NMEA 0183 väljavõtet (kõige rohkem 2 MiB ja 20,000 epohhi |
| `assess_vessel_log` | Laeva NMEA 0183 logi (kõige rohkem 4 MiB) paketkäivitusena, seansi TOML-iga, mis sõnastab laeva piirid |
| `create_evidence_pack` | Allkirjastatud tõendipakett laeva logi aknale (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Seo RFC 3161 ajatempli token (`.tsr` baitide base64) paketiga, mälus (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Kontrolli paketti (`kshana evidence verify`) |
| `generate_training_nmea` | Sünteetiline silla NMEA 0183 meeskonna väljaõppeks `nmea-scenario` TOML-ist (segamine, asukoha äravedu, ajaspuufimine, taasesituse viivitus) koos instruktori logiga (`kshana-nmea-training/1`) |
| `build_interference_map` | GNSS-i häirekaart ADS-B või AIS asukohateadetest CSV-tekstina (kõige rohkem 4 MiB) |
| `route_exposure` | Marsruudi pikkuse osakaal ühe või mitme häirekaardi halvenenud, mitte halvenenud, hindamata ja vaatlemata lahtrites, valikuliselt kuupäevavahemiku piires |
| `trust_telemetry` | Usaldusvoog (JSON-read) või `receiver-trust` tulemus, esitatud Prometheuse tekstina, CEF või LEEF syslogi ridadena või OTLP JSON-koormana, `kshana trust-telemetry` kodeerijatega |
| `jammertest_import` | Loe avaldatud Jammertesti testikataloogi ja saateplaani (NPRA/jammertest-plan, MIT) ajastatud tõena (`kshana jammertest import`): ühe testiala ajapilud muutuvad vastuvõtja usalduse sündmusteks, igas sildis kataloogi id ja aasta. Planeeritud ajapilud, mitte salvestatud eetriajad; plaani ühtegi kontaktivälja ei loeta. MODELLED. Vt [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Hinda vastuvõtja logi selle ajakava vastu (`kshana jammertest score`): iga testi kohta tuvastuslatentsus, vahele jäänud häired ja taastumisaeg ning valehäired väljaspool kõiki ajapilusid. Tekstilogid kui `log`, binaarsed (`ubx`, `sbf`) kui `log_base64`. Allkirjastatud pakett vajab võtit: käsurida. Ainult nõuandev; MODELLED. |
| `fit_imu_log` | `hybrid` ja `fusion` stsenaariumide kiirendusmõõturi ja güroskoobi parameetrid, sobitatud paigalseisva IMU logist (CSV või EuRoC) Allani hälbe abil, koos kleepimisvalmis `[accel_classical]` tabeli ja logi SHA-256-ga (`kshana imu-fit`). Tekst sisse, JSON välja; MODELLED. |

**GNSS IQ (töökataloogi failid; HTTP-režiimis väljas)**

| Tööriist | Mida see teeb |
|---|---|
| `iq_signals` | GNSS IQ kihi seadistus |
| `iq_info` | Kirjelda ühte IQ (sünfaasilist ja kvadratuurset) salvestust töökataloogis seda töötlemata |
| `iq_scene` | Genereeri töökataloogi mitme satelliidiga GNSS IQ stseen (`kshana iq scene`) |
| `iq_acquire` | Ühe või mitme PRN-i (pseudojuhuslike mürakoodide) FFT (kiire Fourier' teisendus) omandamine üle salvestuse (`kshana iq acquire`), valikuliselt esiosa etappide taga |
| `iq_track` | Omanda, seejärel jälgi DLL/PLL/FLL (viivitus-, faasi- ja sageduslukustusega ahelate) pangaga (`kshana iq track`), ahelad failist `kshana.loop-desig |
| `iq_frontend` | Rakenda vastuvõtja esiosa ja häirete leevendamise DSP-d (digitaalne signaalitöötlus |
| `iq_sweep` | Taasesita ühte töökataloogis olevat IQ salvestust mitme jälgimisahela disaini lõikes (`kshana iq sweep`) |
| `iq_monitor` | Käivita häirete ja spuufimise tuvastamise monitorid töökataloogis oleval IQ salvestusel (`kshana iq monitor`) |
| `iq_labfit` | Sobita jälgimisahela luku kao mudel laborikäivitustele (`kshana iq labfit`) `iq-labfit` stsenaariumist, mille logid on reasisesed (`text` või `base64` |
| `iq_test_conditions` | Valideeri tekstina antud `kshana.test-conditions/1` fail ja tagasta lahendatud tingimused koos räsiga |
| `iq_campaign` | Käivita labori taasesituse kampaania (`kshana iq campaign`) |
| `iq_campaign_status` | Kampaania väljundkausta edenemine |

**Vastavuse kaardistus**

| Tööriist | Mida see teeb |
|---|---|
| `compliance_report` | Avalike raamistike vastavustabel, täidetud tekstina antud tulemusdokumentidest (`kshana compliance-report`) |
| `compliance_mapping` | Staatilised vastavustabelid (või valikuga `sources` lähtedokumendid, millele need viitavad, koos versioonide ja URL-idega) Markdownina, sama avaldusega alguses |
| `list_standards_packs` | Standardipaketid (`kshana standards-pack list`): hinnatud stsenaariumikogumid DHS Resilient PNT raamistiku testiprofiilide, IMO MSC.1/Circ.1575 ja ICAO Doc 9849 Appendix F jaoks |
| `run_standards_pack` | Ühe paketi käivitus enne käivitust sõnastatud lävede vastu: iga test `MET`, `NOT MET` või `NEEDS INPUT`; MODELLED, ei hinda ühtegi toodet |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal kontrollitud LNIS V5 AD1 Volume A (LSIS-AFS V1.0) vastu: koodid trükitud tabelite vastu või sümbolivoog raami vormingu vastu; alamraamide 2 kuni 4 LDPC-d ja CRC-24Q-d ei kontrollita |
| `create_round_trip_pack` | Allkirjastatud laborite ringreisi pakett: stsenaarium, `kshana.test-conditions/1` dokument, vastuvõtja logi ja hinne, seotud räsi kaudu |

**Võrdlustest**

| Tööriist | Mida see teeb |
|---|---|
| `score_benchmark` | kshana-bench esitus, hinnatud tõefaili vastu, mõlemad JSON-tekstina (`kshana bench score`, `bench/SPEC.md`): tulemusfail spetsifikatsiooni versiooni, jaotuse, sisendite räside ja ülesande mõõdikutega. MODELLED; kirjeldab logi või korpust, mitte kunagi toodet. |
| `render_leaderboard` | kshana-bench tulemusfailid, esitatud staatilise edetabeli lehena (HTML-tekst), igaüks kõigepealt valideeritud. |

</details>

<a id="editions"></a>
## Väljaanded

Kogu mootor on tasuta. Kshana Pro ja eritellimusel uuringud on programmidele, mis vajavad rohkem,
ja iga tasuline tee algab sõnumiga: siin hindu ei ole.

| | Tasuta | Kshana Pro | Eritellimusel uuring |
|---|---|---|---|
| Mis see on | kogu avatud mootor, kõik 92 stsenaariumiliiki, ilma funktsioonipiiranguteta | omandkiht sama mootori peal, lepingu alusel | sinu süsteemi MODELLED PNT vastupidavuse uuring, sinu eest tehtud |
| Litsents | AGPL-3.0 (GNU Affero General Public License, versioon 3) või kommertslitsents | omandlitsents | leping |
| Kuidas alustada | [paigalda](#install) või ava [kshana.dev](https://kshana.dev) | [taotle Pro hindamisversiooni](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [taotle uuringut](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Mis on Pro, faili [`docs/PRO.md`](docs/PRO.md) sõnadega:

> **Avatud Kshana range ülemhulk.** Pro sõltub avatud mootorist kui teegist ega
> hargne sellest kunagi. Iga avatud stsenaariumiliik töötab Pros muutmata kujul ning avatud stsenaarium töötab
> Pros üldse ilma litsentsita.
>
> **Uut füüsikat ei ole.** Pro ei lisa ühtegi füüsikalist mudelit ega muuda ühtegi. Iga Pro arv pärineb
> avatud mootori käivitustest, nii et Pro arv on täpselt sama usaldusväärne kui avatud stsenaariumiliik,
> millest see pärineb, ja mitte kunagi rohkem.

Pro vastab programmi järgmistele küsimustele: millise disainiga lennata (disainioptimeerija ja selle
Pareto front), kui kindel on vastus (määramatus ja tundlikkus) ning kas missioon
täidab oma nõudeid (missiooni toimik, nõuete jälgitavus, kompromissuuringud,
stsenaariumide regressioonikontroll, kellade digitaalsed kaksikud, uuringu toimik ja kohapealne
teenus). See jälgib ka arvude kampaaniat ja nurjab konveieri, kui mõni neist halveneb,
testib kandidaatsignaaliplaane avatud satelliitnavigatsiooni signaalide vastu mõlemas
suunas (spektri kooseksisteerimine) ning paneb uuringud järjekorda kohapealses tööteenuses
räsiahelaga tarneregistriga. Igaüht on kirjeldatud koos sellega, mida see toodab ja mida see ei tee, failis
[`docs/PRO.md`](docs/PRO.md). Miski, mida Pro toodab, ei ole sertifitseerimine, ja eritellimusel uuring ei ole
samuti sertifitseerimine.

<details>
<summary>Mida Kshana Pro avatud mootorist loeb ja tugi ettevõttelt Ashforde® OÜ</summary>

<br>

**Millele Kshana Pro tugineb.** Iga Pro osa töötab avatud mootorist ja jätab
selle muutmata:

- **Disainioptimeerija, määramatuse uuring ja missiooni toimik** käivitavad avatud mootori
  stsenaariume mootori avaliku liidese kaudu ja arvutavad iga arvu käivituste
  tulemustest. Iga väljund säilitab VALIDATED, MODELLED või PARTNER tõendustaseme, mille avatud mootor
  igale arvule andis, mitte kunagi kõrgemat.
- **Kellade digitaalsed kaksikud** kasutavad avatud mootori kellamudelit ja selle Allani hälbe
  hindajat: kaksik kalibreeritakse seadme avaldatud Allani eelarvele ja seejärel kontrollitakse,
  hinnates kaksiku Allani hälvet avatud hindajaga.
- **Kompromissuuringud** käivitavad iga arhitektuurivaliku avatud mootori stsenaariumina, muutmata kujul,
  ja järjestavad valikud kvaliteedinäitaja järgi, mis loetakse iga käivituse tulemusest.
- **Kampaania jälgimine** loeb oma arvud paketi stsenaariumide avatud mootori käivituste tulemustest
  ja võrdleb neid eelmise läbinud käivitusega.
- **Spektri kooseksisteerimine** loeb iga füüsikalise arvu avatud mootori käivitustest
  liikidega `leo-signal` ja `constellation-design` ning lisab ainult summa nähtavate satelliitide
  üle ja plaanide järjestuse.
- **Kohapealne tööteenus** käivitab avatud ja Pro stsenaariumid läbi sama mootori ja
  salvestab iga tulemuse nii, nagu käivitus selle tagastas.
- **Tõendipaketid** registreerivad iga käivituse kohta stsenaariumi räsi, mille avatud mootor
  oma tulemusele templiks lööb, nii et paketis olevat arvu saab reprodutseerida selle stsenaariumi uuesti käivitamisega.
- **Süsteemitehnika ja programmi tööriistad.** Kshana Pro mudelipõhise
  süsteemitehnika (MBSE) ja programmi tööriistad kontrollivad programmi nõudeid
  avatud mootori käivituste vastu: need impordivad nõuded komaga eraldatud väärtustena
  (CSV) või Requirements Interchange Formati (ReqIF) või
  Systems Modeling Language versioon 2 (SysML v2) teksti dokumenteeritud alamhulgana, hindavad iga
  vastuvõtukriteeriumi koos selle ühikuga väärtuste vastu, mille käivitus kirjutas, ning toodavad kontrolli
  ristviidete maatriksi (VCRM), SysML v2 mudeli, muudatuse mõju aruande ja võrguühenduseta
  tõendipaketi. Need ei käivita ega arvuta midagi uuesti ning loevad ainult seda, mida avatud mootor
  avaldab: iga käivituse `result.json` (väljad, mida kriteerium nimetab, nende ühikud,
  stsenaariumi räsi, seemne, mootori versiooni ja skeemi versiooni reprodutseeritavuse tempel ning
  käivituse silt ja arvude tõendustasemed), selle `report.json` (liik, reprodutseeritavuse kirje ja
  võimekuste sildid), stsenaariumifail (selle räsi, liik, seeme ja parameetrid),
  väljade ühikute skeem (iga välja ühik, päritolu ja tõendustase) ning
  kontrollimaatriks (iga võimekuse VALIDATED, MODELLED või PARTNER silt).

<a id="support--professional-services"></a>
### Tugi ja professionaalsed teenused

Kshana on tasuta ja avatud lähtekoodiga litsentsi AGPL-3.0 all ning **professionaalselt arendatud ja
hooldatud ettevõtte Ashforde® OÜ** (Eesti) poolt. Avatud mootor on täielik ja iseseisvalt
kasutatav. Organisatsioonidele, kes vajavad rohkem, pakub Ashforde® OÜ:

- **Kommertstugi ja integreerimine** — Kshana põimimine sinu tööriistaahelasse, eritellimusel
  stsenaariumid ja prioriteetsed parandused.
- **Eritellimusel andurimudelid** — kalibreeritud sinu riistvarale, sealhulgas ekspordi suhtes tundlikud
  vastupidavusmudelid, mida hoitakse privaatses kihis.
- **Kshana Pro** — omandlikud mudelipõhise süsteemitehnika (MBSE) ja programmi
  tööriistad, mis kontrollivad programmi nõudeid avatud mootori käivituste vastu ning
  toodavad kontrolli ristviidete maatriksi (VCRM), Systems Modeling Language
  versioon 2 (SysML v2) mudeli, muudatuse mõju aruande ja võrguühenduseta tõendipaketi. Need
  ei käivita midagi uuesti ja loevad ainult mootori avaldatud väljundeid: iga käivituse `result.json`
  ja `report.json`, stsenaariumifaili, väljade ühikute skeemi ja kontrollimaatriksi
  silte (täielik loend on jaotises [Väljaanded](#editions)).
- **Kshana Pro disaini-, määramatuse- ja missioonitööriistad** — disainiruumi Pareto front,
  määramatus ja tundlikkus tuhandete käivituste üle ning ühe käsuga missiooni
  toimik koos kontrollimaatriksi ja PDF-iga; vt [`docs/PRO.md`](docs/PRO.md).
- **Kshana Pro kampaania jälgimine, spektri kooseksisteerimine ja tööteenus** — konveier, mis
  nurjub, kui jälgitav arv halveneb, signaaliplaanid, mida testitakse avatud
  satelliitnavigatsiooni signaalide vastu mõlemas suunas, ning kohapealne tööjärjekord
  räsiahelaga tarneregistriga; vt [`docs/PRO.md`](docs/PRO.md).
- **Koolitus ja nõustamine** kvant-/klassikalise PNT jõudlusanalüüsi alal.

See on avatud tuuma mudel: mootor on avatud litsentsiga ja jääb selleks; äri
toetavad asjatundlikkus, tugi ja omandlikud laiendused — mitte litsentsitasud.
Kontakt **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Uurimistöö

Avatud mootorile tuginevad uuringud avaldatakse arXivis. Igaüks nimetab selle taga oleva mootori käsu,
nii et selle arvud saab taasgenereerida lisatud stsenaariumist või uuringunäitest.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Avatud mootorile tuginev uurimistöö: kuus artiklit arXivis, iga kaart nimetab artikli, selle kuupäeva ja kategooria ning mootori käsu, mis selle arvud taasgenereerib. Samad kuus artiklit koos linkide ja käskudega on allolevas tabelis." width="100%">
</picture>

| Artikkel | Mida see näitab | Mootori käsk |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | GNSS-i häiredetektori skoori langust tingimuste nihkumisel saab ennustada ainuüksi jaotusesisestest statistikutest, avatud sünteetilises katsekeskkonnas ja seejärel avatud välisalvestustel. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Spuufimise all oleval GNSS-i ajastusvastuvõtjal ei ole tuvastamata ajaveale lõplikku tingimusteta piiri, seega annab artikkel tingimusliku piiri, kalibreeritud avaliku JammerTest 2024 kampaania salvestatud eetrispuufimisel. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Üksik koondvastupidavusskoor on otsuse stabiilne alus ainult seal, kus üks disain domineerib; kus disainid konkureerivad, võib ainuüksi ümberkaalumine võitjat muuta. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Kaugusmõõtmine Kuu konstellatsiooni sees jätab pinnajaama absoluutse asukoha vaadeldamatuks; väga pika baasiga interferomeetria (VLBI) viivitus Maalt taastab selle, kui konstellatsioon on hõre, ja teravdab seda, kui see on rikas. | liik `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Planeeritud nelja kuni kuue satelliidiga konstellatsioonid annavad Kuu lõunapoolusel halva geomeetria ning mõni pinnal asuv kaugusmõõtmise majakas parandab selle palju odavamalt kui lisasatelliidid. | liik `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Täpsuse lahjenemine on ainult kaugustel põhineva tsislunaarse jälgimise puhul määratlemata, sest kiirus on hetktõmmises vaadeldamatu, seega kasutab artikkel vaadeldavuse Grami maatriksit neljal tasapinnalisel kaugel retrograadsel orbiidil: ainult kaugus annab hetktõmmises astaku 2 neljast ja vajab täielikuks vaadeldavuseks umbes 2.09 h pikkust kaart, kusjuures tingitus paraneb kaare pikenedes; kaugusmuutuse kiirus (Doppler) annab kohe astaku 4; ning jaama ühine hindamine koos satelliitide olekute ja kelladega jääb astakult ühe võrra puudulikuks, kui ei lisata välist interferomeetrilist vaadeldavat. Nõuded kuuluvad kaare pikkuse, tingituse ja mõõtmistüübi eelarvetesse, mitte DOP-i. | liik `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (selle sõsar `cislunar-arc-recovery` testib läve sõltumatu lõplike vahede hindajaga) |

Kolm uuringunäidet kirjutavad baidikaupa deterministlikke artefakte (fikseeritud seemned), mis salvestavad
oma mootori versiooni, seemned ja konfiguratsiooni räsi. Kolm Kuu ja tsislunaarset artiklit tuginevad
Kuu komplektile (iga osa tõendustase on kontrollimaatriksis); nende geomeetria ja täpsuse lahjenemise väited on lisaks ristkontrollitud
eraldi oraaklite vastu failides `tests/validate_p*.rs`. Rohkem jaotises
[Reprodutseeritavad uuringuartefaktid](#reproducible-study-artifacts) Teatmiku all.

<a id="cite"></a>
## Viitamine

Kui kasutad Kshanat akadeemilises või tehnilises töös, viita palun kasutatud versioonile koos
stsenaariumi ja seemnega. [`CITATION.cff`](CITATION.cff) sisaldab masinloetavaid metaandmeid ning
GitHub näitab selle põhjal nuppu "Cite this repository". Iga väljalase arhiveeritakse Zenodos;
kontseptsiooni DOI (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) viitab alati
uusimale versioonile.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Ülaltoodud artiklid:

> Baweja, C. (2026). *Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*. arXiv:2606.22054. https://doi.org/10.48550/arXiv.2606.22054
>
> Baweja, C. (2026). *A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*. arXiv:2606.24210. https://doi.org/10.48550/arXiv.2606.24210
>
> Baweja, C. (2026). *How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*. arXiv:2607.05415. https://doi.org/10.48550/arXiv.2607.05415
>
> Baweja, C. (2026). *Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*. arXiv:2607.02566. https://doi.org/10.48550/arXiv.2607.02566
>
> Baweja, C. (2026). *The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*. arXiv:2607.06212. https://doi.org/10.48550/arXiv.2607.06212
>
> Baweja, C. (2026). *Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*. arXiv:2610.23871. https://doi.org/10.48550/arXiv.2610.23871

<a id="licence"></a>
## Litsents

Kshanal on kaks litsentsi: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)) või
ettevõtte Ashforde® OÜ **kommertslitsents** suletud integratsiooniks, millele AGPL ei sobi.
[`LICENSING.md`](LICENSING.md) selgitab, milline kehtib. Kaastööd litsentsitakse sissetulevalt
AGPL-i alusel ning annavad ühtlasi ettevõttele Ashforde® OÜ õiguse lisada need
kommertsväljaandesse; allkirjasta iga commit käsuga `git commit -s` (vt [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" ja selle märgid on ettevõtte Ashforde® OÜ kaubamärgid: litsents hõlmab koodi, mitte
nime, seega nimeta palun harud ümber.

<a id="reference"></a>
## Teatmik

Pikk materjal, kokku volditud. Iga dokument on loetletud jaotises [Dokumentatsioon](#documentation).

<details>
<summary>Paigaldamine ja ehitamine lähtekoodist</summary>

<a id="install--build"></a>
### Paigaldamine ja ehitamine

Nõuab Rusti tööriistaahelat (≥ 1.88, `rust-version` failis Cargo.toml; arendatud versioonil 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Kasutamine: käsurida täielikult</summary>

### Kasutamine

Käivita ükskõik milline stsenaarium; CLI jaotab stsenaariumi välja `kind` järgi ja kirjutab selle kõrvale
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` ja
`<scenario>.report.json` — lisaks `<scenario>.table.csv` nende liikide jaoks, mis
avaldavad tabeli. Aruanne (HyperText Markup Language (HTML) leht ja JSON-dokument
sama sisuga) sisaldab juhtkonna kokkuvõtet, iga sisendit koos ühikuga, tulemusi
ja graafikuid, kampaania pühkimise, Monte Carlo või ahela tabeleid, sündmuste ajajoont,
iga käivituse kasutatud võimekuse VALIDATED / MODELLED / PARTNER silti ja allikat,
seda, mida ei modelleerita, ning reprodutseeritavuse kirjet (mootori versioon, Secure Hash
Algorithm 256-bit (SHA-256) räsid, seeme, platvorm ja täpne käsk). See trükitakse brauserist
puhtaks PDF-failiks (Portable Document Format) A4 või Letter paberil; mootor ise
PDF-i ei kirjuta. Vt [`docs/REPORTS.md`](docs/REPORTS.md).

```bash
cargo run -- scenarios/clock-holdover.toml
cargo run -- scenarios/imu-deadreckoning.toml
cargo run -- scenarios/timetransfer.toml
cargo run -- scenarios/hybrid-pnt.toml
cargo run -- scenarios/orbit-gnss-challenged.toml
cargo run -- scenarios/orbit-sgp4-gps.toml
cargo run -- scenarios/orbit-rinex.toml
cargo run -- scenarios/integrity-raim.toml

# Export a propagated constellation to an SP3-c precise-ephemeris file:
cargo run -- scenarios/orbit-sgp4-gps.toml --export-sp3 gps.sp3

# Export the constellation's mean elements to a CCSDS OMM catalogue (one OMM
# message per TLE-defined satellite, with its real NORAD id / COSPAR designator):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-omm gps.omm

# Export the velocity-carrying state to a CCSDS OEM 2.0 ephemeris (GMAT/Orekit/STK):
cargo run -- scenarios/orbit-sgp4-gps.toml --export-oem gps.oem

# Export the geometry for a globe, a map or a mission-analysis tool: CZML, KML,
# GeoJSON, STK .e, or SigMF for the spectrum kind (every format that applies):
cargo run -- scenarios/jamming-demo.toml --export all
```

`--export <czml|kml|geojson|stk|sigmf|all|list>` kirjutab stsenaariumi kõrvale CZML (Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), Ansys STK (Systems Tool Kit) `.e`
efemeriidid ja SigMF (Signal Metadata Format) salvestused ning
`--import-route <route.geojson>` toidab GeoJSON-joone rada lendavatesse liikidesse. Iga
vorming on valideeritud oma avaldatud spetsifikatsiooni vastu ning stsenaarium, millele vorming
ei kehti, ütleb, miks: vt [docs/INTEROP.md](docs/INTEROP.md).

**Muud CLI režiimid** — lindi stsenaariumi, anna päris Maa orientatsiooni andmed või käivita terve komplekt:

```bash
# Lint a scenario without running it (checks the kind + required fields):
cargo run -- --validate scenarios/integrity-raim.toml

# Feed a real IERS Earth-orientation file (finals2000A) for frame precision:
cargo run -- scenarios/orbit-sgp4-gps.toml --eop tests/fixtures/agency/eop/finals2000A_2022001.txt

# Run a SUITE of scenarios into one aggregated, stamped study artifact
# (writes <suite>.study.json + <suite>.study.html next to the manifest):
cargo run -- --study scenarios/quantum-pnt-demonstrator.suite.toml

# Animate a run's time series: an animated SVG, a self-contained HTML player, and a
# numbered SVG frame sequence with manifest.json (see docs/ANIMATION.md):
cargo run -- scenarios/campaign-jam-spoof-holdover-integrity.toml --animate all
```

**Animatsiooni eksport.** `--animate svg|html|frames|all` kirjutab `<scenario>.animation.svg`
(Cascading Style Sheets (CSS) võtmekaadrid, skriptita), `<scenario>.animation.html` (esitamine, paus, kerimine, kiirus ja
sünkroniseeritud paneelid, ilma välise varata) ja `<scenario>.frames/` (`frame_0000.svg`, … pluss
`manifest.json` kaadrisageduse ja kestusega). Kampaania esitab oma faasid ja
häired, spektrikäivitus oma kose; teema järgib `prefers-color-scheme`-i ning
`prefers-reduced-motion` näitab valmis pilti. See renderdab käivituse enda näidiseid,
korduskäivitusel baidikaupa identselt, ega lisa tõendeid. Vt [docs/ANIMATION.md](docs/ANIMATION.md).

**Komplekti** manifest on väike TOML (Tom's Obvious, Minimal Language) fail — `title` ja stsenaariumide teede massiiv `scenarios = [ … ]` —,
mida mootor järjest käivitab, koondades iga tulemuse (koos selle
MODELLED / VALIDATED siltidega) üheks iseennast kirjeldavaks uuringuartefaktiks. Vt
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Roll koostalitluses.** Kshana on *jõudlussimulatsiooni* kiht, mis asub
järeltöötluse tööriistaahela kõrval, mitte selle asendus: suuna selle **RINEX**
väljund RTKLIB-i või gLAB-i asukohalahendi saamiseks ja kasuta selle **SP3** väljundit
täppisorbiidi produktina tööriistades nagu Ginan — Kshana vastab küsimusele, *millise vastupidavuse antud
PNT arhitektuur annab*, enne kui sul on päris signaalid, vormingutes, mida need tööriistad juba
sisse loevad (`--export-sp3` või `export_sp3 = true` stsenaariumis `orbit` kirjutab
`<scenario>.sp3`). Sama orbiidi saab avaldada standardirajal olevate **CCSDS OMM**
keskmiste elementidena (`--export-omm` või `export_omm = true` kirjutab `<scenario>.omm`) —
üks OMM 502.0 KVN (võtmesõna = väärtus notatsioon) sõnum TLE-ga määratud satelliidi kohta, kandes iga objekti päris
NORAD-i (North American Aerospace Defense Command) katalooginumbrit, COSPAR-i (Committee
on Space Research) rahvusvahelist tähist ja epohhi, mis tahes
OMM-i mõistvale tarbijale eritellimusel kaherealise elemendikogumi asemel.

Näiteväljund (kella holdover — pane tähele, kuidas terviklikkuse ja turvalisuse kvaliteedinäitajad esitatakse):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Optilise kella 95. protsentiili (p95) ajastusviga on 1.20e-4 ns: kokkuvõte
trükib väikesed väärtused tüvenumbritega, mitte ei ümarda neid väärtuseks `0.0`.
`security` näitab `n/a (no attack)`, sest see stsenaarium ei seadista ühtegi rünnakut, seega
pole midagi tuvastada. JSON-tulemus kannab siiski iga kella analüütilist
spuufimise tuvastatavuse piiri väljas `fom.security` (optilise kella puhul 0.997, kiibimõõdus
aatomkella puhul 0.000, mille enda müra seireakna jooksul ületab 20 ns
spetsifikatsiooni), ning selle plokk `figure_tiers` märgib selle arvu `applicable: false`. Stsenaariumiliik `spoof`
hindab tuvastamist sisestatud rünnaku vastu. `figure_tiers` annab ka
igale esitatud arvule selle kontrollitaseme — VALIDATED (kontrollitud välise
oraakli vastu) või MODELLED — ja kontrollimaatriksi rea, millest tase loetakse.
Orbiidistsenaarium esitab lisaks geomeetriaploki — fiksiga näidiste osakaal ning
parim/mediaanne asukoha täpsuse lahjenemine (PDOP) ja asukohatäpsus — kella
tulemuse kõrval.

> **Loe neid kahte arvu hoolikalt.** `security` on *analüütiline spuufimise tuvastatavuse
> piir*, mis on tuletatud iga kella stabiilsusest — see on tähenduslik ainult
> seadistatud spuufimisstsenaariumi vastu ega ole **mitte** mitme satelliidi RAIM-detektor. `integrity`
> on siin filtri *enesejärjepidevus* (katkestuse näidiste osakaal selle enda k-sigma
> piiri sees), **mitte** lennunduse HPL/VPL terviklikkuse arv. Vt
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Tõelise vastuvõtja autonoomse terviklikkuse jaoks käivitab **stsenaariumiliik `integrity`**
> (`scenarios/integrity-raim.toml`) päris hetktõmmise ja lahendite eraldamise
> (ARAIM-stiilis) RAIM-i levitatud konstellatsiooni geomeetria üle: see arvutab
> igal epohhil horisontaalsed/vertikaalsed **kaitsetasemed (HPL/VPL)** ja esitab
> seadistatud häirepiire täitvate epohhide osakaalu, koos Stanfordi
> terviklikkusdiagrammiga vea vs PL-i (kaitsetaseme) klassifitseerimiseks.

<a id="reproducible-study-artifacts"></a>
#### Reprodutseeritavad uuringuartefaktid

Neli avatud uuringut taasgenereerivad igaüks baidikaupa deterministliku artefakti (fikseeritud seeme) ühe
käsuga — arvud kvant- vs klassikalise ristumise, RF-häiringute
optimismilõhe, PNT vastupidavuse hindamise ja ajastuse kaitsetaseme uuringute taga:

```bash
# Quantum-vs-classical resilience crossover map (writes paper/crossover/*.json):
cargo run --release --bin crossover_study -- paper/crossover

# RF-impairment optimism-gap study (13-detector panel, scaling laws, LOO predictor):
cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json

# Framework-aligned PNT-resilience scoring + decision-instability study:
cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json

# Conditional Timing Protection Level, calibrated on a real recorded spoof:
cargo run --release --example tpl_jammertest
```

Iga artefakt salvestab oma mootori versiooni, seemned ja konfiguratsiooni räsi ning kannab ausat
MODELLED/VALIDATED silti. Päris andmete sondid (`*_probe`) käitavad sama konveierit
salvestustel, mille sa kohapeal annad; hoidlas andmekogumeid ei tarnita. RF-häiringute
optimismilõhe uuring on kirjeldatud eeltrükis
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054) ning tingimuslik ajastuse
kaitsetase (`tpl_jammertest` ülal) eeltrükis
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (vt [Viitamine](#cite)).

Avaldatud Kuu PNT uuringute ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
pinnamajakate DOP, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) VLBI
vaadeldavus ja [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) tsislunaarse kaare pikkuse
vaadeldavus) geomeetria, täpsuse lahjenemise, reaalajas tugisüsteemi /
Maa orientatsiooni parameetrite (EOP) ennustuse, kauge retrograadse orbiidi ja RF-kaugusmõõtmise
väited on sõltumatult ristkontrollitud failides
`tests/validate_p*.rs` eraldi oraaklite vastu (`scipy.special.j1`, sõltumatu NumPy
`(HᵀH)⁻¹` DOP-lahend, samade IERS `finals2000A` ridade NumPy uuesti parsimine ja
NASA/JPL Three-Body Periodic Orbit Database). Need on täiendavad regressioonikontrollid
**modelleeritud** Kuu komplekti üle; need ei muuda masinkontrollitud maatriksi arvu.

</details>

<details>
<summary>Stsenaariumi vorming</summary>

<a id="scenario-format"></a>
### Stsenaariumi vorming

Stsenaariumid on deklaratiivne TOML. Ülemise taseme `kind` valib paketi — kokku **viiskümmend**
(`clock` on vaikimisi, kui see puudub): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (AI/ML RF-häiringute tuvastamise
hindamise katsekeskkond — märgistatud sünteetiline korpus + detektorist sõltumatu ROC/AUC raamistik +
jaotusesisene/-väline optimismilõhe), `quantum-trade` (kvant- vs klassikalise PNT
kompromiss mõõdetud ADEV-i sisselugemisega + GNSS-ita vastupidavuse ümbrik; MODELLED),
`space-weather` (päikese/geomagnetilised indeksid + Jacchia-71 eksosfääri temperatuur +
aktiivsusest juhitud termosfääri tihedus staatilise atmosfääri asemel; MODELLED),
`oem-interop` (CCSDS OEM impordi/ringreisi sild GMAT/Orekit/STK efemeriididele;
MODELLED), missioonianalüüsi kolmik `launch-window` (kahe keha stardiasimuut /
tasandimuutus / võimalused), `reentry` (Alleni-Eggersi ballistilise taassisenemise koridor),
`eo-coverage` (EO ribalaius / GSD / juurdepääs / taaskülastuse geomeetria), `space-packet` (CCSDS
133.0 TM/TC — telemeetria/telekäsklus — Space Packet raamistamine — täpne bitipaigutus, ringreisiga kontrollitud) ja
`attitude-budget` (3-DOF gravitatsioonigradiendi moment + RSS suunamisvea eelarve),
`passes` (maajaama tõusu/loojangu ülelendude ennustamine — AOS/TCA/LOS, maksimaalne kõrgusnurk,
juurdepääs) ja `link-budget` (ühesuunaline CCSDS/DSN lingivõrrand — FSPL / Eb·N₀ /
varu / sulgumine); `telecom-timing` (holdoveri ajaviga, MTIE ja TDEV kontrollitud
ITU-T maskide vastu); `spectrum` (kogu GNSS-i L-sagedusala ühe võimsusspektri tihedusena:
sageduse-aja kosk skriptitud pidevlaine, kitsasriba, chirp- või
sobitatud müra segaja ajajoone all, sagedusalapõhine segaja ja signaali suhe ning efektiivne
kandja ja müra tiheduse suhe spektraalse eraldatuse kordajast, ning Signal Metadata
Formati (SigMF) salvestuste sisend ja väljund Welchi spektrihinnangutega; signaalispektrid
VALIDATED õpikuväärtuste vastu, segaja stsenaarium MODELLED; vt
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); sama liik joonistab UHF-, S- ja C-sagedusala paneelid
disainitud madala Maa orbiidi signaalidega); `leo-signal` (madala Maa orbiidi positsioneerimise, navigeerimise ja
ajastuse signaalidisainid mis tahes süsteemile: ribapiiratud spektrid, koodijälgimise värin ja kaugusmõõtmise
täpsus, omandamise otsing ja aeg, spektraalne eraldatus GPS-i ja Galileo suhtes, segaja
taluvus ning UHF–C-sagedusala kompromiss, avalikest eelseadetest nagu Xona Pulsar, Iridium,
Starlink ja CentiSpace või reasisestest disainidest; kinnised kujud ja LEO Doppler VALIDATED,
disainid MODELLED; vt [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (Päike, planeedid, Pluuto, Kuu ja seitse suuremat
kuud ühel epohhil — asukohad, konstandid, valguse levimisajad ja orbiidirajad; planeetide asukohad
VALIDATED JPL Horizonsi vastu) ja `body-pnt` (positsioneerimine mis tahes nende kehade ümber
kohaliku navigatsioonikonstellatsiooni ja süvakosmose lingiga Maalt; MODELLED); `campaign` (olemasolevad liigid, ühendatud aheldatud missiooni ajajooneks,
kus olek antakse faaside vahel edasi, parameetrite pühkimiseks, seemnega Monte Carlo ansambliks või
mitmeks stsenaariumiks ühise tingimuse all; MODELLED, vt
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (Walkeri delta- ja tähemustrid,
elemendiloendid ja mitme kestaga disainid GPS-i, Galileo, BeiDou ja GLONASSi
eelseadetega ning katvus ja täpsuse lahjenemine laius-/pikkuskraadi võrgustikul;
generaator ja GPS-i globaalne DOP VALIDATED avaldatud teenusedokumentide vastu, vt
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (madala Maa
orbiidi (LEO) positsioneerimise, navigeerimise ja ajastuse (PNT) satelliidi ülelend ja selle lingieelarve sagedusala
haaval, mis tahes konstellatsioonist ja mis tahes signaalidisainist: vaatenurgad, Doppler ja Doppleri muutumiskiirus,
ITU-R vihma-, gaasi-, stsintillatsiooni- ja hoonesse sisenemise kadu, kandja ja müra tiheduse suhe
nähtavate MEO GNSS-satelliitide suhtes, esimest järku ionosfäär ja ionosfäärivabad paarid ning
madala energiaga fiksi eelarve, ionosfääri sondeerimine igast sagedusalapaarist ning spuufimismonitorid
Doppleri ja ülelennu geomeetria järjepidevuse ning sagedusalade vahelise järjepidevuse kaudu; ITU-R liikmed ja
paigal oleva kasutaja Doppleri ümbrik VALIDATED, ülelend MODELLED, vt
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (madala Maa orbiidi (LEO) PNT satelliidi edastatav
efemeriidi- ja kellasõnum mis tahes orbiidi ja
kandja jaoks: sobitaja integreeritud tõeorbiidilt Galileo Kepleri kogumile, see kogum
piki-, risti- ja radiaalsuunaliste parandpolünoomidega, Liu et al. 2025
22-parameetriline mudel või ATOMIC nullkella ECEF-polünoom; signaali ruumis kaugusviga
(SISRE) vs sobitusintervall ja uuendusperiood, ülelennu keskel toimuva uuenduse pidevuse kontroll,
Kshana enda dokumenteeritud binaarraam CRC-24Q tsüklilise liiaskoodikontrolli ja kvantimiseelarvega ning
RINEX-4-stiilis plokk, märgitud Kshana laienduseks; SISRE kaalud, Galileo kasutajaalgoritm
ja CRC-24Q VALIDATED, sobitused MODELLED; valikulised eelseaded Xona Pulsari,
Iridiumi, Starlinki, CentiSpace'i, esindusliku C-sagedusala süsteemi, ATOMIC-u ja Celeste IOD jaoks; vt
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); **ühendatud MEO + LEO
PNT** kolmik `leo-pvt` (Doppleri positsioneerimine madala Maa orbiidi (LEO) kaugusmuutuse kiirusest, ühised
GNSS + LEO pseudokauguse fiksid süsteemidevaheliste nihetega ja DOP LEO-satelliitide
arvu suhtes, polaar- ja Arktika katvus ning LEO ajaülekanne UTC-sse — mis tahes konstellatsiooni üle,
valikuliste eelseadetega nagu Xona Pulsar, Iridium ja Starlinki juhusignaalid;
LEO Doppleri ümbrik VALIDATED avaldatud Iridiumi ja Xona arvude vastu), `leo-ppp`
(täppis-punktpositsioneerimise koondumine ainult GNSS-iga ja LEO täiendusega, võrreldud
tööga Li et al. 2019) ja `ntn-positioning` (5G mittemaapealse võrgu positsioneerimine
signaali ribalaiuse Cramér-Rao piirist), MODELLED peale selle ümbriku, vt
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (üks LEO-PNT süsteem otsast
lõpuni: `leo-signal` disain, mida kannab `leo-pass` sagedusala, ülelennu C/N0 ja navigatsioonisõnumi
signaali ruumis kaugusviga, mis antakse edasi ühendatud `leo-pvt` fiksile ja `leo-ppp`
koondumisele, iga üleandmine loetletud; MODELLED, vt
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), mis on ka ülevaade
igast LEO-PNT liigist ja stsenaariumist, sealhulgas vastupidavuskampaaniad, üks stsenaarium
eksperimendi fookusvaldkonna kohta ja üks lõppkasutaja vertikaali kohta); **Kuu PNT komplekt** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **kvantvõimekusega PNT demonstraator**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; ning
**signaaliturbe, tsislunaarse ja kihilise vastupidavuse** uurimisliigid `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — missioonianalüüsi kolmik ja need hilisemad liigid on kõik MODELLED
(igaühel valideeritud kinnise kujuga tuum; vt maatriksit).
Ühised väljad: `seed`, `[time]` võrgustik, `[gnss]` käideldavuse ajajoon (katkestuse
juht) ning andurikaupa plokid `provenance` stringidega, mis viitavad iga arvu
allikale. Näide (kell):

```toml
seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 7200.0
[gnss]
windows = [
  { t0 = 0.0,   t1 = 600.0,  state = "nominal" },  # 10 min GNSS sync
  { t0 = 600.0, t1 = 7200.0, state = "denied"  },  # ~1.8 h outage
]
[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (arXiv:1503.08457)"
y0 = 5.0e-17
q_wf = 1.0e-30   # white FM:  q_wf = sigma_y(1s)^2
q_rw = 0.0       # random-walk FM
drift = 0.0      # linear aging (per second)
[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA65 / SA.45s CSAC datasheet sigma_y(1s)=3e-10"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
```

Valikulised väljad (puudumisel väljas): kell võib lisada `flicker_floor` (1/f FM — sagedusmodulatsioon
— Allani põrand); inertsiaalandur võib lisada `gyro_bias` ja `q_arw` (güroskoobi nihe ja nurga
juhuslik ekslemine) ning `bias_instability` ja `q_aa` (Allani nihke ebastabiilsuse põrand ja
kiirenduse juhuslik ekslemine) — koos **üheteljeline (1-DOF) kiirendusmõõturi
veaeelarve** (VRW/ARW — kiiruse/nurga juhuslik ekslemine — ja nihke ebastabiilsus). See on veaeelarve, mida tarnitud
`inertial` stsenaariumi*pakett* käivitab. Eraldi sisaldab teek nüüd kontrollitud
**3-teljelist rihmühendusega navigaatorit** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
kvaterniooniline asend koonuse/sõudmise kompenseerimisega, täielik NED mehhaniseerimine
(Maa pöörlemise ja transpordikiiruse liikmed, WGS-84 Somigliana gravitatsioon) ning
deterministlik IMU veamudel, milles **mastaabitegur, joondusviga,
g-tundlikkus, kvantimine ja kiiruse kaldtõus on modelleeritud** (IEEE Std 952-1997, IEEE
güroskoobi spetsifikatsiooni ja katseprotseduuri standard, §A.2; Groves 2013 §4.3). See 3-teljeline tee on nüüd **ühendatud käivitatavasse
lõdvalt seotud GNSS/INS paketti** (`kind = "gnss-ins"`): 15-olekuline veaoleku EKF
distsiplineerib rihmühenduse lahendit mürarikaste fikside vastu, kuni GNSS on olemas, seejärel
liigub inertsiga läbi katkestuse, esitades ühendatud horisontaalvea avatud ahela
vaba INS-i inertsiperioodi suhtes. Saadaval on ka **tihedalt seotud pseudokauguse** uuendus
(see moodustab innovatsiooni kaugusvaldkonnas, seega jätkab korrigeerimist
vähem kui nelja satelliidiga). Kella
holdoveri stsenaarium võib lisada `runs` (> 1), et käivitada **Monte Carlo ansambel** — iga
kvaliteedinäitaja esitatakse siis keskmisena koos 5.–95. protsentiili hajuvusega ning
graafik varjutab vea usaldusriba (vt `scenarios/clock-ensemble.toml`).

`fusion` stsenaarium (samad plokid kui `hybrid`) käivitab **kaks sõltumatut Kalmani hindajat**
— üks kella oleku, teine asukoha oleku jaoks —, mida distsiplineerib GNSS ja abistab
optiline ajaülekanne, ning esitab kombineeritud holdoveri FoM-i. Kahel plokil puudub
ristkovariatsioon: see on kahe veaeelarve virn, **mitte** tõeline seotud
kella+asukoha ühisfilter (plokkidevaheline kovariatsioon on teekaardi punkt). Vt
`scenarios/fusion-pnt.toml`.

`spoof` stsenaarium sisestab ajaspuufimise — ühe neljast `[attack.shape]` liigist
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; paljas `rate_ns_per_s` on endiselt
aktsepteeritud lineaarse kaldena) — ja käivitab iga kella spuufimisdetektori. Detektor on
kahepoolne **χ²₁ energia / Neymani–Pearsoni test** kellaga abistatud monitori statistikul:
lävi seatakse siht-valehäire eelarvest `target_pfa` ning
**vahelejäämise tõenäosus `P_md`** esitatakse nii kinnisel kujul kui ka
Monte Carlo abil (`mc_runs` katset hüpoteesi kohta — need kaks ühtivad mõne ×1/√N piires).
**Turvalisuse kvaliteedinäitaja on `1 − P_md`** operatiivselt kahjuliku (spetsifikatsiooni)
suurusega juures, nii et vaikne kell, mis tabab spetsifikatsiooni suuruse spuufimise, saab ≈ 1 ja mürarikas
kell, mis sageli sellest mööda laseb, saab madalama skoori (vt `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

`gnss-sim` stsenaarium on **mõõtevaldkonna** simulatsioon: iga nähtava
satelliidi jaoks sünteesib see pseudokauguse `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` ja L1 Doppleri, **Klobuchari** ühesagedusliku
ionosfääriga (`[iono]`, IS-GPS-200 §20.3.3.5.2.5) ja **Saastamoineni** seniidi
troposfääriga, projitseerituna **Nielli (1996)** kaardistusfunktsiooniga (`[tropo]`).
Jäägid toidavad **hetktõmmise RAIM-i** epohhipõhise HPL/VPL jaoks ning iga satelliidi
pseudokaugus, Doppler, C/N₀ ja iono/tropo parandid väljastatakse JSON-massiivis
`gnss_measurements`. See on päripidine simulaator (see genereerib mõõtmised
teadaolevast tõest), mitte vastuvõtja/lahendaja — mürata käivitus taastoodab geomeetria pluss
parandid alla millimeetri täpsusega (vt `scenarios/gnss-sim-raim.toml`).

`jamming` stsenaarium modelleerib RF-häiret **lingieelarvena**: `[jammer]`
(ECEF asukoht, saatevõimsus `power_dbw`, tüüp) tõstab segaja ja signaali suhet
`[receiver]` juures, mis jälgib Walkeri `[constellation]`-it. Geomeetriast (vaba ruumi
leviku kadu ja suunapõhine vastuvõtuantenni võimendus) arvutab see iga satelliidi
`J/S`, **efektiivse C/N₀** standardse segamisvastase võrrandi kaudu (laiendamise
protsessivõimendus × spektraalse eraldatuse tegur `Q`; Kaplan & Hegarty §9.4) ning
märgib luku kao seadistatava jälgimisläve all — esitades kvaliteedinäitaja
`availability_under_jamming`. 10 W lairibasegaja 1 km kaugusel
võtab vastuvõtjalt kõik (J/S ≈ 72 dB); sama segaja 100 km kaugusel ainult
halvendab linke (vt `scenarios/jamming-demo.toml`).

`sweep` stsenaarium käivitab **kompromissuuringu**: see muudab ühte parameetrit `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` või `classical_q_wf`) väärtusest `start` väärtuseni `stop` üle `steps`
punkti `lin` või `log` skaalal `scale`, salvestab mõlema kella jaoks mõõdiku `metric` (nt `holdover_s`)
ja joonistab kaks kõverat. Põhistsenaarium läheb ploki `[base]` alla (vt
`scenarios/sweep-clock-stability.toml`).

`sweep-nd` stsenaarium üldistab selle **mis tahes paketile ja mis tahes arvule telgedele**: see
muudab `[base]` stsenaariumi (mis tahes `kind`-iga) punktidega TOML-võtmeid üle `[[axes]]`
Descartes'i korrutise, käivitab iga võrgusõlme uuesti ja salvestab `metrics`, mis on antud
punktidega JSON-teedena tulemusse (nt `classical.fom.holdover_s`). See töötab
iga paketi jaoks, sest toimib TOML-i/tulemuse piiril; natiivsed käivitused hindavad
võrgustikku paralleelselt (ilma lisasõltuvuseta, wasm langeb tagasi järjestikusele) ning
väljund on deterministlik ja reakaupa järjestatud (vt `scenarios/sweep-nd-inertial.toml`).

`orbit` stsenaarium tuletab `[gnss]` ajajoone geomeetriast, selle asemel et seda käsitsi
koostada — anna `[user]` orbiit, `[constellation]`, kõrgusmask `mask_deg` ja kaks
kellaplokki. See esitab ka satelliitide geomeetriast tuleneva asukohatäpsuse; valikuline
`sigma_uere_m` (1-sigma kasutaja ekvivalentne kaugusviga, vaikimisi 1 m) skaleerib
asukoha täpsuse lahjenemise asukoha sigmaks. Kasutaja orbiidi saab muuta
**ekstsentriliseks** väljadega `eccentricity` ja `argp_deg` ning `j2 = true` lisab Maa lapikusest tuleneva
sekulaarse triivi (vt `scenarios/orbit-molniya.toml`). Konstellatsioon võib selle asemel olla
**päris**: anna `[constellation]`-ile `tle` plokk kaherealistest elemendikogumitest ja
satelliidid parsitakse sellest (vt `scenarios/orbit-real-tle.toml`). Lisa üks või mitu
`[[constellations]]` plokki **mitme GNSS-i** jaoks (nt GPS + Galileo; vt
`scenarios/orbit-multignss.toml`):

```toml
kind = "orbit"
seed = 7
threshold_ns = 5.0
mask_deg = 10.0
sigma_uere_m = 1.0           # optional; position sigma = position-DOP * this
[time]
step_s = 60.0
duration_s = 86400.0
[user]                       # spacecraft (altitude in km, angles in deg)
altitude_km = 8000.0
inclination_deg = 0.0
[constellation]              # Walker-delta GNSS (GPS-like)
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0
[clock_quantum]  # ... as above
[clock_classical]  # ... as above
```

**GPS-ita alt-PNT** liigid navigeerivad üldse ilma GNSS-ita, sobitades mõõdetud välja
jada kaardiga osakeste filtri kaudu. `gravity-map` stsenaarium lendab raja
läbi sfääriliste harmoonikute gravitatsioonianomaalia välja ja taastab selle külma aatomi
gravimeetri näidust (`scenarios/gps-denied-gravity-nav.toml`); `terrain-nav` stsenaarium
teeb sama SRTM kõrgusmudeli DEM-i vastu (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
ning `combined-altpnt` stsenaarium ühendab **gravitatsiooni + IGRF magnetvälja + maastiku** ühes filtris
(`scenarios/combined-altpnt.toml`).

`lunar-integrity` stsenaarium hindab **tsislunaarset** PNT-d: see käivitab Kuu lõunapooluse
ARAIM kaitsetaseme läbimise LunaNet/LNIS releekogumi vastu ja esitab ausalt
terviklikkuse lünga — ~30 m Kuu σ_URE viib kaitsetaseme tunduvalt üle 50 m häirepiiri,
nii et teenus on lennundusstiilis terviklikkusreeglite järgi *kättesaamatu*
(`scenarios/lunanet-araim.toml`).

`lunar-time-offset` stsenaarium esitab **relativistliku Maa–Kuu kellakiiruse** — Kuu
koordinaataja skaala (LTC/TCL) alus. Esimestest põhimõtetest lähtuv post-Newtoni
samasus summeerib omapotentsiaalide vahe (IAU `L_G` geoidi potentsiaal miinus Kuu
pinna omapotentsiaal) ja Kuu kineetilise (teist järku Doppleri) liikme sekulaarseks
kiiruseks ≈ 57 µs/päevas, esitatuna koos avaldatud 56–59 µs/päevas vahemikuga; see annab ka
kogunenud LTC−TT nihke üle horisondi ja pöördvariatsiooniga ansambli (Kuu
paberkell). **MODELLED** — peamine arv on *etalonist sõltuv* (Maa geoid
vs Kuu selenoid, keskmistamisaken), mistõttu esitatakse vahemik, mitte üksik sertifitseeritud
arv (`scenarios/lunar-time-offset.toml`).

Vaata kataloogi `scenarios/`, kus on vähemalt üks läbitöötatud näide igast liigist (92 liiki, 193 stsenaariumi
`.toml` faili + 1 komplekti manifest — mitu liiki tarnivad rohkem kui ühe näite). Mitte igal
liigil pole selle järgi nimetatud faili: `lunar-integrity` → `scenarios/lunanet-araim.toml` ja
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` on kaks mitmest sellisest.
Loetle jaotatavad liigid igal ajal käsu `cargo run -- --validate <file>`
vigade, Pythoni `list_kinds()` või MCP tööriista `list_scenario_kinds` abil.

</details>

<details>
<summary>Väljund</summary>

### Väljund

Tulemusartefakt on versioonitud, iseennast kirjeldav JSON: sammupõhised aegread,
hinnatud kvaliteedinäitajad, aktiivsete mudelite spetsifikatsioonid (koos päritoluga), seeme,
**stsenaariumi räsi** — nii et iga graafiku saab failist reprodutseerida — ning iga kella kohta
`adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): kattuv
Allani hälve oktaavide kaupa paigutatud keskmistamisaegadel — standardne viis kella
stabiilsuse lugemiseks — nüüd **mürätüübipõhise 95% usaldusribaga** iga punkti kohta (kirje
astmeseaduse tüüp tuvastatakse selle modifitseeritud Allani tõusust ning χ² intervall kasutab
vastavaid NIST SP 1065 efektiivseid vabadusastmeid). Brauseri katsekeskkond esitab selle
log-log graafikuna „Clock stability (ADEV)“. (MDEV, TDEV ja HDEV on saadaval teegi
hindajatena; eksporditud tulemuskõver on kattuv ADEV.) Iga väli koos ühikute ja
allikaviitega on dokumenteeritud failis [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Iga graafik kirjeldab ennast.** Brauseri katsekeskkond, CLI `*.chart.svg`
eksport ja HTML (HyperText Markup Language) hindekaart märgivad kõik iga graafikupildi jaluse tekstiga
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` on käivituse
**stsenaariumi räsi** esimesed 12 kuueteistkümnendmärki — SHA-256 (256-bitine Secure Hash Algorithm) räsi kanoonilise stsenaariumi
definitsiooni üle (seeme, läved, mudeli parameetrid, GNSS-i aknad, …); terviklikkuse ja Kuu
aruanded, millel oma räsi pole, kasutavad selle asemel stsenaariumi lähteteksti SHA-256-t.
See on **sama sõrmejälg**, mida näidatakse üherealises kokkuvõttes ja tulemuse JSON-is, nii et
salvestatud või kleebitud graafik kannab alati oma versiooni, täpset stsenaariumi, mis selle tootis (bitt-biti
haaval reprodutseerimiseks), ja allikat — muuda ükskõik millist sisendit ja räsi muutub.

Kvaliteedinäitajad järgivad standardseid operatiivseid PNT kvaliteedinäitajaid:

| Kvaliteedinäitaja | Kuidas Kshana seda arvutab |
|-----------------|------------------------|
| Ajastuse jõudlus (kella/orbiidi paketid) | kella faasivea RMS + 95. protsentiil katkestuse jooksul, **nanosekundites** (`timing_rms_ns`) — ajastuse mõõdik, mitte asukoht |
| Positsioneerimise jõudlus (inertsiaalsed/hübriidpaketid) | 1-DOF asukohavea RMS + 95. protsentiil katkestuse jooksul, **meetrites** (`pos_rms_m`); üks telg. Üksik käivitus on märgitud `monte_carlo: false`; määra `runs = N` Monte Carlo ansambli jaoks, mis esitab iga mõõdiku keskmise, hajuvuse ja bootstrap 95% CI (usaldusvahemiku). Endiselt **mitte** 2-D CEP/2DRMS (ringvea tõenäosus / kahekordne ruutkeskmine kaugus) ega DOP-iga kaalutud täpsus (need vajavad 3-teljelist mudelit — teekaart) |
| Autonoomia | holdoveri kestus — spetsifikatsiooni piires olemise aeg pärast GNSS-i kadu (võrgustikuga kvantitud: alampiir) |
| Vastupidavus | vea kasvu tõus katkestuse ajal |
| Käideldavus | käivituse osa, mil lahend on spetsifikatsiooni piires |
| Terviklikkus | filtri **enesejärjepidevus** — katkestuse näidiste osakaal, mille viga jääb Kalmani filtri enda k-sigma piiri sisse. **Mitte** lennunduse HPL/VPL/RAIM terviklikkuse arv (vt [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Turvalisus | **analüütiline spuufimise *tuvastatavuse* piir** kella stabiilsusest — kui väikest/aeglast ajaspuufimist suudaks ühe kella järjepidevusmonitor märgata. Tähenduslik ainult seadistatud rünnakuga; **mitte** mitme satelliidi RAIM-detektor |

Need terminid on uued? Igaüks on lihtsas keeles defineeritud [sõnastikus](docs/GLOSSARY.md).

</details>

<details>
<summary>Hoidla ülesehitus</summary>

### Hoidla ülesehitus
```
kshana/
├── src/                                       # the kshana core crate (library + CLI)
│   ├── api.rs · main.rs · lib.rs              # typed dispatch (92 kinds) + CLI + crate root
│   ├── python.rs · wasm.rs                    # optional PyO3 / wasm-bindgen bindings
│   ├── types.rs · scenario.rs · allan.rs      # shared core (time grid, GNSS timeline, Allan)
│   │
│   ├── models.rs · estimator.rs · kalman.rs   # Pack 1 — clock holdover + integrity
│   ├── security.rs · detection.rs · spoof.rs · spoof_monitors.rs  # spoof detection
│   ├── filter_health.rs · fom.rs · fom_label.rs · report.rs · chart.rs · run.rs  # health · FoM scoring + labelling · output
│   ├── suite.rs · study.rs                     # scenario suites + aggregated multi-scenario study artifacts (`--study`)
│   ├── inertial/                              # Pack 2 — strapdown INS (attitude · mechanization · imu_errors · quantum_imu)
│   ├── timetransfer.rs · timetransfer_adv.rs · timegeo.rs  # Pack 3 — TWSTFT/CV/PPP/optical, Sagnac
│   ├── hybrid.rs · ensemble.rs · sweep.rs     # Pack 4 — fused PNT, Monte-Carlo, trade sweeps
│   │
│   ├── timescales.rs · jd2.rs · ephem.rs      # time systems, two-part JD, Sun/Moon ephemeris
│   ├── precession.rs · nutation.rs · cio.rs   # IAU 2006/2000A precession-nutation + CIO GCRS↔ITRS
│   ├── frames.rs · *_data.rs                  # TEME↔ECEF + generated nutation/CIO/EGM2008/IGRF tables
│   │
│   ├── orbit.rs · sgp4.rs · tle.rs · walker.rs   # geometry, SGP4/SDP4, TLE, Walker design
│   ├── propagator.rs · forces.rs · gravity_sh.rs · integrator.rs  # Cowell + perturbations (EGM2008 d/o70, GR) + RK4/DOPRI
│   ├── maneuver.rs · batch_ls.rs · orbit_determination.rs  # burns/Lambert/porkchop, Gauss-Newton, OD
│   ├── cr3bp.rs · lunar.rs · lunar_frame.rs · lunar_od.rs  # Earth–Moon CR3BP + halo/NRHO STM corrector, cislunar/LunaNet ARAIM, MCI↔MCMF, lunar OD
│   ├── lunar_time.rs · lunar_vlbi.rs · lunar_combination.rs · lunar_frame_realise.rs · lunar_service.rs · lunar_dpnt.rs · lunar_interop.rs  # tiers per piece in the matrix lunar PNT suite — LTC time · geodetic VLBI · joint OD+clock · frame realisation · Moonlight service-volume · differential PNT · LunaNet/IOAG interop export
│   ├── body.rs · mars_frame.rs · ephem_provider.rs · radiometric.rs · ccsds_tdm.rs  # deep-space: multi-body · Mars frame · ephemeris seam · radiometric obs + CCSDS-TDM
│   ├── deepspace_od.rs · clock_state.rs · mars_atmos.rs · mars_pnt.rs · linkbudget.rs · gse_sim.rs  # SRIF OD · onboard clock · Mars drag · relay-PNT · link budget · GSE sim
│   │
│   ├── fusion/                                # GNSS/INS — EKF · UKF · tightly_coupled(17) · coupled · closed_loop
│   ├── raim.rs · sbas.rs                      # RAIM/ARAIM HPL/VPL, SBAS DO-229E PLs + L1/L5 iono-free
│   ├── gnss_sim.rs · ionex.rs · pvt.rs · jamming.rs  # measurement domain · ionosphere maps · single-point positioning · jamming
│   ├── navsignal.rs                            # nav-signal PSD (BPSK-R/BOC) · spectral-separation → anti-jam Q · DLL code-tracking jitter · multipath envelope
│   ├── gravimeter.rs · igrf.rs · mapmatch.rs · particle_filter.rs · altpnt/  # gravity/magnetic/terrain alt-PNT
│   ├── rinex.rs · rinex_obs.rs · glonass.rs · sp3.rs · oem.rs · omm.rs · permalink.rs  # interop formats
│   ├── launch.rs · reentry.rs · eo_payload.rs · attitude_budget.rs · passes.rs · space_packet.rs  # mission-analysis budgets + CCSDS Space Packet
│   ├── space_weather.rs · holdover.rs · tpl.rs   # space-weather environment · GNSS-denied clock-holdover calculator · conditional Timing Protection Level (under spoofing)
│   ├── resilience/                              # framework-aligned PNT-resilience scoring + decision-instability study (RPCF · Dirichlet · Kendall-τ · diversity collapse · assurance report)
│   ├── impairment_eval.rs · impairment_study.rs · impairment_ml.rs · eval_stats.rs  # AI/ML RF-impairment eval testbed · optimism-gap study · LR/MLP detectors · bootstrap/DeLong/Spearman stats
│   ├── sdr.rs · realdata/                       # software-defined-receiver front end (IQ/IF → E/P/L taps → SQM) + real-data ingest adapters (RINEX · UBX · GnssLogger · JammerTest · Yunnan · SatGrid)
│   ├── crossover.rs · quantum_trade.rs · frugal.rs · integrity_impact.rs  # quantum-vs-classical crossover map · PNT trade · cost-per-coverage ROI · integrity impact
│   ├── quantum_devices.rs · quantum_faults.rs · quantum_nav_od.rs · qtrade.rs · timetransfer_chain.rs · representativeness.rs  # Quantum-Enabled PNT demonstrator — device error models · fault catalogue · GNSS-free quantum OD · unified trade harness · quantum time-transfer chain · representativeness / gaps-to-flight ledger
│   ├── interchange.rs · verification.rs          # KIF artifact envelope · machine-checked verification matrix
│   └── bin/crossover_study.rs · bin/validation_report.rs  # crossover-study artifact generator · release validation-summary HTML
│
├── mcp/kshana-mcp/        # standalone, workspace-EXCLUDED crate — the MCP server (+ Dockerfile, server.json)
├── ide/jetbrains/         # standalone Kotlin/Gradle IntelliJ-Platform plugin
├── xval/                  # standalone, workspace-EXCLUDED external cross-checks: anise-{frames,lunar-od,mars-od,service-geometry} (Rust ANISE/SPICE DE440) + orekit-passes (Java Orekit)
│
├── examples/            # reproducible study generators: tpl_jammertest · resilience_report · optimism_study + real-data probes (jammertest_probe · yunnan_probe · satgrid_probe · texbat_probe · ingest_realdata)
├── paper-artifacts/     # byte-deterministic study artifacts, regenerable from examples/ (optimism-study.json · resilience-study.json); raw datasets stay out
├── scenarios/            # one cited .toml per kind + geometry-driven + GPS-denied
├── scripts/              # reproducibility + repo-hygiene + SBOM guards
├── docs/                 # CONCEPTS, ARCHITECTURE, CAPABILITY, VALIDATION, PROVENANCE, GLOSSARY, …
├── web/                  # the WebAssembly playground + kshana.dev site
├── tools/                # table generators (EGM2008 · IGRF · nutation · CIO) + fetch_tles.sh
├── .github/workflows/    # ci · release · publish · wheels · pages · mcp-publish · jetbrains-plugin · frame-xval
├── pyproject.toml        # Python packaging (maturin)
├── CHANGELOG.md          # Keep a Changelog + SemVer
└── CITATION.cff · ROADMAP.md · CONTRIBUTING.md · SECURITY.md
```

</details>

<details>
<summary>KKK (korduma kippuvad küsimused)</summary>

### KKK

**Kas ma pean selle kasutamiseks kvantfüüsikat mõistma?**
Ei. Kui suudad käivitada käsurea, suudad käivitada Kshana. Alusta
[lihtsas keeles sissejuhatusest](docs/CONCEPTS.md); otsi termineid [sõnastikust](docs/GLOSSARY.md).

**Kas see on kvantriistvara disain või lennutarkvara?**
Ei. See on jõudluse *simulaator*. Kvantriistvara tõetruudus pärineb avaldatud
veamudelitest, mitte sellest tööriistast. Vt [Mis see on / ei ole](#what-it-is--is-not).

**Kas kvanttulemused on realistlikud või turundus?**
Iga parameeter on viidatud andmelehele või artiklile, iga mudel on valideeritud
õpikuseose vastu ning küpsus on ausalt märgistatud failis
[VALIDATION.md](docs/VALIDATION.md) — sealhulgas see, et ükski strontsiumi optiline kell ei ole
lennanud. Mootor on neutraalne: kvant ja klassikaline on sama kood erinevate
avaldatud arvudega.

**Kas võin usaldada, et kaks käivitust ühtivad?**
Jah — käivitused on deterministlikud: `scenario + seed + engine version → bit-identical output`,
jõustatud skriptiga `scripts/check-reproducible.sh`.

**Kas ma saan seda kasutada Pythonist või brauseris?**
Jah — vt [Paigaldamine](#install): Pythoni ja WebAssembly näited on selle all. Mõlemad kutsuvad sama mootorit.

**Kuidas modelleerida oma andurit?**
Kirjuta stsenaariumi `.toml` oma anduri avaldatud arvudega väljadel `provenance`.
Vt [Stsenaariumi vorming](#scenario-format) ja näiteid kataloogis `scenarios/`.

**Kas see on kommertskasutuseks tasuta?**
Jah — AGPL-3.0 alusel, sealhulgas kommertskeskkonnas, tingimusel et järgid
AGPL-i copylefti (eelkõige: kui muudad Kshanat ja pakud seda võrgu kaudu, pead
pakkuma neile kasutajatele oma muudetud lähtekoodi). Kui see sulle ei sobi — nt pead
põimima Kshana omandtootesse või käitama suletud võrguteenust —, on
ettevõttelt Ashforde® OÜ saadaval kommertslitsents; vt [`LICENSING.md`](LICENSING.md) ja
[Tugi](#support--professional-services).

</details>

<details>
<summary>Tõrkeotsing</summary>

### Tõrkeotsing

**`cargo build` ebaõnnestub vana tööriistaahelaga.** Kshana vajab Rust ≥ 1.88. Uuenda käsuga
`rustup update`.

**Pythoni laienduse ehitamine ebaõnnestub macOS-is linkimisel** (`Undefined symbols … _Py…`).
Pythoni laiendus lahendab oma sümbolid laadimise ajal. `maturin` seab õige linkeri
lipu automaatselt — kasuta käsku `maturin develop --features python`, mitte paljast
`cargo build`-i.

**Pythoni ehitus kaebab, et interpretaator on uuem, kui PyO3 teab.** Sea
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (abi3 wheel'id on CPythoni versioonide lõikes
edasiühilduvad).

**WebAssembly ehitus ei leia sihtmärki.** Paigalda see üks kord käsuga
`rustup target add wasm32-unknown-unknown`, seejärel `wasm-pack build --target web -- --features wasm`.

**Kuhu mu väljund läks?** Iga käivitus kirjutab `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` ja `<scenario>.report.json`
sisendfaili `.toml` kõrvale ning
nende liikide puhul, mis avaldavad tabeli, ka `<scenario>.table.csv`. Kõik need on
teadlikult git-ignoreeritud.

</details>

<details>
<summary>Versioonimine ja väljalasked</summary>

### Versioonimine ja väljalasked

Kshana järgib [semantilist versioonimist](https://semver.org). Enne versiooni 1.0 võib avalik
stsenaariumi/tulemuse skeem veel muutuda; ühilduvust rikkuvad muudatused tuuakse selgesõnaliselt välja
failis [`CHANGELOG.md`](CHANGELOG.md). Iga tulemus on reprodutseeritav kombinatsioonist
`scenario + seed + engine version`.

**Iga `vX.Y.Z` silt avaldab kõik kanalid automaatselt, ühes järjekorras** — täielik
testikomplekt käivitatakse kõigepealt sildistatud commit'il, midagi ei avaldata enne, kui see läbib, ning
seejärel kontrollib konveier, et iga register tõesti serveerib uut versiooni
([`docs/RELEASING.md`](docs/RELEASING.md)). Kanalid:

| Kanal | Paigalda / hangi | Sisu |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rusti teek + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | MCP server |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | abi3 wheel'id (Linux/macOS/Windows) + sdist (lähtekoodi distributsioon) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly moodul + JS-ümbris |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | mitme arhitektuuri OCI (Open Container Initiative) tõmmis — tööriistaahelat pole vaja |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | käivitaja: laadib alla väljalaske binaarfaili, kontrollib `SHA256SUMS`-i, käivitab selle |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | sama käivitaja Pythoni jaoks |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | `kshana-mcp` binaarfail, genereeritud iga väljalaske `SHA256SUMS`-ist |
| Claude Desktop | tee topeltklõps väljalaske failil `kshana-mcp-<target>.mcpb` | laiendus, binaarfail sees |
| ametlik MCP register | MCP kliendid avastavad automaatselt | `io.github.ashfordeOU/kshana-mcp` (OCI tõmmis, npm- ja PyPI-paketid) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → otsi "Kshana" | IDE pistikprogramm **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | allalaadimine | `kshana` käsurea binaarfail Linux x86-64, macOS (Apple silicon ja Intel) ja Windows x86-64 jaoks, `kshana-mcp` binaarfail igaühe nende süsteemide ja Linux Armi jaoks, süsteemipõhine `.mcpb` Claude Desktopi laiendus, CycloneDX **SBOM**, **SLSA** ehituse päritolu, HTML valideerimise kokkuvõte ja `SHA256SUMS` kontrollsummafail |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | iga väljalaske viidatav arhiiv |
| [kshana.dev](https://kshana.dev) | ava brauseris | Kshana Studio, brauserisisene WebAssembly rakendus, ehitatud uuesti iga väljalaske sildilt (nii et selle näidatav versioon on versioon, mida see käitab) |

MCP serveri crate'i / tõmmise / registri versioon järgib mootorit (see sisaldab
teeki); JetBrainsi pistikprogrammi versioonitakse sõltumatult (see kutsub välja sinu paigaldatud
`kshana` binaarfaili).

</details>

<details>
<summary>Teekaart</summary>

### Teekaart

Vt [`ROADMAP.md`](ROADMAP.md) etapiviisilise teekaardi kohta, [`CHANGELOG.md`](CHANGELOG.md)
avaldatud ajaloo kohta ja [`docs/CAPABILITY.md`](docs/CAPABILITY.md)
võimekusepõhise teekaardi kohta. Prioriteetide järjekord on: **esiteks ajastuse ja holdoveri tõendid
elutähtsale infrastruktuurile** (telekommunikatsiooni maskid, pikem holdover vananemise ja flicker-müraga,
mõõdetud kellaandmete sisselugemine); **teiseks neutraalne kvant- vs klassikalise kompromissi meetod**
(tulemused märgitud MODELLED, kuni partneri mõõdetud andmed need edutavad); ning
**Kuu / tsislunaarset ja süvakosmose navigeerimist hoitakse alal**, mitte ei laiendata juhtvaldkonnana. **ITRF-täpne tugisüsteemi teisendus** on nüüd tarnitud —
täielik CIO-põhine IAU 2006/2000A GCRS↔ITRS ahel (poolusenihe + alla kaaresekundi nutatsioon),
valideeritud bitt-biti haaval SOFA/ERFA vastu ja sõltumatult ristkontrollitud ANISE
(puhas Rusti SPICE) vastu ≤ 3.6 m täpsusega GNSS-orbiidil. Lähiaja punktide hulka kuuluvad tihedalt seotud kandelaine faasi fusioon ning
lõdvalt/tihedalt seotud GNSS/INS navigaatori toomine rohkematesse pakettidesse; **süvakosmose / Marsi
radiomeetrilise navigeerimise** mootor saabus versioonis v0.17.0 (simulatsiooniga valideeritud).
**Kvantfüüsika kiht** on **P2** punkt: CAI kiirendusmõõturit simuleeritakse nüüd
esimestest põhimõtetest (Mach–Zehnderi faas, projektsioonimüra, kontrasti hääbumine, vibratsiooni
sidestus), samal ajal kui kella/ajaülekande andureid juhivad endiselt avaldatud
Allani/müraeelarve kordajad. GMST-põhine TEME&harr;ECEF, IERS-i
liigsekunditega ajasüsteemid (UTC/TAI/TT/UT1), SGP4/SDP4 orbiidi levitamine (v0.7.0,
valideeritud AIAA 2006-6753 vektorite vastu) ja käivitatav `gnss-ins` fusioonipakett
on kõik **tarnitud** ning inertsiaalkiirus on allavoolu kättesaadav. Aktiivne
stohhastiline ajaspuufimise detektor (Neymani–Pearsoni / χ²₁ energiatest Monte Carlo
P_fa/P_md-ga ja turvalisuse FoM-iga 1−P_md), lingieelarvepõhine segamismudel (J/S → efektiivne
C/N₀ → luku kadu), mitme konstellatsiooni käideldavus, üheteljeline (1-DOF)
IMU veaeelarve, kaks sõltumatut (kella + asukoha) Kalmani hindajat, mida esitatakse
kombineeritud FoM-ina, päris konstellatsiooni geomeetria TLE-dest, HTML hindekaardi aruanne,
geomeetriast tuletatud GNSS-i käideldavus
*ja* täpsuse lahjenemine Kepleri orbiitidest ekstsentrilisuse ja J2 triiviga,
Monte Carlo usaldusribad, kompromissuuringute parameetrite pühkimised, brauserisisene WebAssembly
katsekeskkond ning valikulised Pythoni (PyO3) ja WebAssembly (wasm-bindgen) sidumid on
jõudnud harusse `main`.

</details>

<details>
<summary>Kaasaaitamine</summary>

### Kaasaaitamine

Vt [`CONTRIBUTING.md`](CONTRIBUTING.md). Lühidalt: testid läbivad (`cargo test`), kaks
kaitseskripti läbivad, Conventional Commits ning `CHANGELOG.md` `[Unreleased]`
kirje iga kasutajale nähtava muudatuse kohta. Osalemist reguleerib meie
[käitumisjuhend](CODE_OF_CONDUCT.md). Turvaprobleemist teatamiseks vt
[turvapoliitikat](SECURITY.md) — palun ära ava haavatavuste kohta avalikku probleemiteadet.

</details>

<details>
<summary>Dokumentatsioon: iga dokument ja kellele see on mõeldud</summary>

<a id="documentation"></a>
### Dokumentatsioon

| Dokument | Kellele | Mis seal on |
|----------|----------|--------------|
| [Mõistete sissejuhatus](docs/CONCEPTS.md) | kõigile, alusta siit | mida Kshana teeb ja miks, nullist kuni füüsikani |
| [Kshana Studio](web/README.md) | kõigile | käivita mootor oma brauseris (WebAssembly); ehitus- ja juurutusmärkmed |
| [Sõnastik](docs/GLOSSARY.md) | kõigile | iga termini lihtsas keeles definitsioonid |
| [Stsenaariumiliigid](docs/KINDS.md) | kõigile | iga liik, mida mootor jaotab: mida see teeb, selle väljad, näitekäsk, selle registriread ja graafik, mille mootor selle jaoks kirjutab |
| [Partneri andmed](docs/PARTNER-DATA.md) | mõõdetud andmeid omavad laborid ja tootjad | milliseid MODELLED ridu võiks mõõdetud kella või IMU kirje edutada, vormingud, kuidas esitust kontrollitakse (`kshana partner check`), hinnatakse ja tunnustatakse |
| [Arhitektuur](docs/ARCHITECTURE.md) | arendajad / ülevaatajad | moodulite kaart, mootori konveier, jaotus ja diagrammid |
| [Valideerimise olek](docs/VALIDATION.md) | ülevaatajad / viitajad | mis on `validated` vs `not modeled`, koos tõenditega |
| [Kontrollimaatriks](docs/VERIFICATION-MATRIX.md) | ülevaatajad / viitajad | masinkontrollitud tõendiregister — iga võimekuse rida koos oleku, mooduli, testi ja välise oraakliga, genereeritud failist `src/verification.rs` |
| [Modelleerimise põhjendus](docs/MODELLED-RATIONALE.md) | ülevaatajad | miks igal **modelleeritud** real puudub väline oraakel, rea kaupa esitatuna |
| [Päritolu](docs/PROVENANCE.md) | ülevaatajad / viitajad | iga anduriparameeter, mudel ja andmekogum, jälgitud selle avaldatud allikani, ühes viidatavas tabelis |
| [Reprodutseeritavus ja päritolu](docs/REPRODUCIBILITY.md) | ülevaatajad / pakendajad | determinismi garantiid, võrdlusväärtuste kinnitamine, SBOM (tarkvara komponentide loend), ehituse päritolu |
| [Wheel'i platvormisildid](docs/WHEEL_TAGS.md) | pakendajad | abi3 Pythoni wheel'ide maatriks — milline platvormisilt `pip install kshana` lahendab |
| [Positsioneerimine](docs/POSITIONING.md) | hindajad | kus Kshana asub RTKLIB-i/gLAB-i suhtes (täiendav) ja paigalduseta brauseritase |
| [Kshana Pro](docs/PRO.md) | hindajad / programmijuhid | mida omandlik Pro kiht sama mootori peale lisab: disainioptimeerija, määramatus ja tundlikkus, missiooni toimik, kampaania jälgimine, spektri kooseksisteerimine, kohapealne tööteenus, nõuete jälgitavus; mida igaüks toodab ja mida see ei tee |
| [Tehniline aruanne](paper/kshana-technical-report.md) · [JOSS-i artikkel](paper/paper.md) | ülevaatajad / viitajad / hindajad | täielik laiendatud uurimisartikkel — arhitektuur, valdkonnapõhised mudelid, valideerimine, juhtumiuuringud ja piirangud — pluss lühike JOSS (Journal of Open Source Software) esitus |
| [SGP4 valideerimine](docs/SGP4-VALIDATION.md) | ülevaatajad / viitajad | kokkulangevus AIAA 2006-6753 etaloniga (666 olekut, ~4 mm) **ja** otsevõrdlus sõltumatu `sgp4` crate'iga (ühtivad alla mikroni / 4.12 mm) |
| [Jõumudeli valideerimine](docs/AGENCY-ORBIT-VALIDATION.md) | ülevaatajad / viitajad | täisjõudude mootori (`src/precise_od.rs`) sobitus agentuuride efemeriididele — metoodika ja valideeritud jäägid |
| [Päris TLE juhend](docs/REAL_TLE_GUIDE.md) | kasutajad | stsenaariumide juhtimine päris Celestraki / Space-Tracki konstellatsiooni TLE-dega (vs kaasasolev sünteetiline Walkeri kogum) |
| [Terviklikkuse FoM](docs/INTEGRITY.md) | hindajad | mida `integrity` / `security` arvud tähendavad — ja mida need lennunduse HPL/VPL-iga võrreldes **ei** ole |
| [ARAIM-i teatmik](docs/ARAIM_REFERENCE.md) | ülevaatajad / integraatorid | avatud MHSS ARAIM kaitsetaseme teostus — `b_k` nominaalse nihke projektsioon, σ_URA vs σ_URE ja rikkerežiimide eeltõenäosused |
| [Kvantmudelid](docs/QUANTUM.md) · [üksikasjad](docs/QUANTUM-MODELS.md) | ülevaatajad | külma aatomi interferomeetri füüsikakiht ja see, kus kordajaid endiselt tabelist võetakse |
| [Vastavus](docs/COMPLIANCE.md) | hindajad | DO-229E / DO-316 algoritmide ulatus ja see, mis **ei** ole vastavusväide |
| [Mereala usaldus](docs/MARITIME-TRUST.md) | meremehed / integraatorid | 0-100 GNSS-i usaldusskoor laeva NMEA jaoks, selle monitorid ja piirangud (nõuandev, mitte tüübikinnitust omav navigatsiooniseade) |
| [NMEA treeningvood](docs/NMEA-TRAINING.md) | merenduse koolitajad | sünteetiline silla NMEA skriptitud segamise ja spuufimise ning instruktori logiga; ainult tekst, mitte kunagi reaalajas navigeerimiseks |
| [Häirekaart](docs/INTERFERENCE-MAP.md) | analüütikud / meremehed | kus õhusõidukid ja laevad teatasid halvenenud navigatsiooniandmetest ja kui suurt osa marsruudist see puudutab |
| [Tõendipaketid](docs/EVIDENCE-PACKS.md) | operaatorid / kindlustajad | allkirjastatud tehnilised kirjed usaldussündmusest ja kuidas neid kontrollida |
| [Usaldustelemeetria](docs/TRUST-TELEMETRY.md) | operatsiooni- / turvameeskonnad | usaldusvoog Prometheuse mõõdikute, SIEM-sündmuste ja OpenTelemetryna, koos Grafana juhtpaneeliga |
| [Merendusintegratsioonid](docs/MARINE-INTEGRATIONS.md) | paadiomanikud / integraatorid | Signal K pistikprogramm, OpenCPN-i väravarežiim ja võrdlusehitus |
| [Katsestend](docs/TEST-BENCH.md) | vastuvõtjate tootjad | eksporditud stsenaariumi taasesitamine labori simulaatori kaudu ja vastuvõtja logi hindamine |
| [Vastavuse kaardistus](docs/compliance/README.md) | hindajad | avalikud vastupidavusraamistikud, kaardistatud Kshana väljunditele, koos allikate ja lünkadega; `kshana compliance-report` |
| [Märkmikud](notebooks/README.md) | kasutajad | käivitatavad õpetused koos nende renderdatud tekstiga |
| [Standardid ja koostalitlusvõime](docs/STANDARDS.md) | integraatorid | GNSS-i / lennudünaamika / agentuuride vahetusvormingud, mida Kshana loeb ja kirjutab (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [LEO PNT fusioon](docs/LEO-PNT-FUSION.md) | kasutajad / hindajad | ühendatud MEO + LEO positsioneerimine, navigeerimine ja ajastus: Doppler, ühine pseudokaugus, PPP koondumine, 5G NTN, polaarkatvus ja LEO ajaülekanne mis tahes konstellatsiooni üle; valikulised eelseaded ja nende avalikud allikad |
| [Kampaaniad](docs/CAMPAIGNS.md) | kasutajad / hindajad | stsenaariumide koostamine: aheldatud missioonide ajajooned, parameetrite pühkimised, Monte Carlo ansamblid ja ühise tingimusega käivitused, koos koostamise samasustega, mida testid fikseerivad |
| [Stsenaariumide kataloog](docs/SCENARIOS.md) | kasutajad / integraatorid | iga jaotatav liik koos kohustuslike ja valikuliste TOML-väljadega — genereeritud funktsioonist `api::list_scenario_kinds()` |
| [Tulemuse skeem](docs/SCHEMA.md) | integraatorid | tulemuse JSON-i iga väli koos ühikute ja allikaviitega |
| [Pythoni API](docs/PYTHON_API.md) | Pythoni kasutajad | PyO3 sidumi liides — mootori kutsumine, stsenaariumi/tulemuse tüübid ja näited |
| [Väited vs tegelikkus](docs/CLAIMS-VS-REALITY.md) | ülevaatajad | liialdatud väidete sulgemise register + CI kaitse (`tests/no_overclaims.rs`), mis hoiab selle lahendatuna |
| [Teekaart](ROADMAP.md) | kõigile | etapiviisiline teekaart — mis on tarnitud ja mis tuleb järgmisena |
| [MCP server](mcp/kshana-mcp/README.md) · [JetBrainsi pistikprogramm](ide/jetbrains/README.md) | agendid / IDE kasutajad | käivita Kshana AI-assistendist või JetBrainsi IDE-st |
| [Agendi juhend](docs/AGENTS.md) · [Liidesed](docs/SURFACES.md) | agendid / integraatorid | milline tööriist vastab millisele küsimusele, mida iga vastusega kaasas hoida; kus iga võimekus on kättesaadav (CLI, Rust, Python, WASM, MCP, pistikprogramm, JetBrains, märkmikud) ja miks lahter on N/A |
| [Muudatuste logi](CHANGELOG.md) | kõigile | avaldatud ajalugu (Keep a Changelog + SemVer, semantiline versioonimine) |
| [Kaasaaitamine](CONTRIBUTING.md) | kaasaaitajad | ehitus, kaitsed, testimise/viitamise distsipliin, DCO (Developer Certificate of Origin) |
| [Juhtimine](GOVERNANCE.md) | kaasaaitajad / kogukond | kuidas Kshanat juhitakse — kes otsustab, kuidas, ning avatud/suletud piir |
| [Käitumisjuhend](CODE_OF_CONDUCT.md) | kogukond | oodatav käitumine (Contributor Covenant) |
| [Turvapoliitika](SECURITY.md) | teatajad | kuidas haavatavusest teatada; kahese kasutuse märkus |

</details>

<details>
<summary>Peamised viited</summary>

### Peamised viited

**Valideerimise oraaklid ja standardid** — välised autoriteedid, millele Kshana kontrollid on ankurdatud:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [testiandmed](https://celestrak.org/publications/AIAA/2006-6753/)): SGP4/SDP4 kontrollkogum, millega Kshana ühtib 4.12 mm täpsusega, ning läbitöötatud tugisüsteemide näited, mille vastu TEME→ITRF ahelat kontrollitakse.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — aja ja tugisüsteemide etalonrutiinid, mille vastu IAU 2000A nutatsioon ja CIO GCRS↔ITRS teisendus on valideeritud bitt-biti haaval.
- Petit & Luzum (toim.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (Maa orientatsiooni, poolusenihke ja tugisüsteemide standardid).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (Allani hälbe seosed ja NBS14 etaloniseeria; NBS = endine USA National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): ROC/AUC, segadusmaatriksi ja täpsuse/saagise/F1 etalonteostused, millega RF-häiringute hindamise katsekeskkond täpselt ühtib (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` ja `linalg.expm` — etalonrutiinid, mille vastu on valideeritud kvantkompromissi mõõdetud ADEV-i NNLS sobitus, χ² järjepidevusribad ja van Loani kella protsessimüra kovariatsioon (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): kasutatud nii avatud varasema tööna (vt allpool *Võrdlus ja avatud varasem töö*) kui ka **sõltumatu DOP-oraaklina**, millega GDOP/PDOP/HDOP/VDOP/TDOP arvutus ühtib 1e-6 täpsusega (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): jõumudelid, mis on agentuuride täppisefemeriididele tehtud jõumudeli sobituse taga.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (halo/NRHO perekonnad, mida CR3BP diferentsiaalkorrektor taastoodab).

**Seadmete ja meetodite füüsika** — anduri mudelite taga olevad viidatud allikad:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (strontsiumi optilise võre kell, kosmosele suunatud eesmärk).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (laboratoorne Sr kell, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hübriidne kvantkiirendusmõõturite kolmik).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [IEEE AESS (Aerospace and Electronic Systems Society) õpetus (University College Londoni Discovery hoidla)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (surnud arvestuse vea kasv).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optiline kahesuunaline aja-sageduse ülekanne; optiline satelliitidevaheline link modelleerib oma mittepöörduvuse eelarve nende järgi).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (BOC modulatsiooni ja spektraalse eraldatuse teooria, mis on faili `src/navsignal.rs` taga).
- Kaplan & Hegarty (toim.) — *Understanding GPS/GNSS: Principles and Applications* (3. tr, Artech House, 2017): segamisvastane efektiivse C/N₀ võrrand ja varajane–hiline DLL koodijälgimise termilise müra värin, mida navigatsioonisignaali ja segamise mudelid kasutavad.

**Võrdlus ja avatud varasem töö** — tööriistad ja ülevaated, mille suhtes Kshana on positsioneeritud:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): spuufimise testikomplekti parameetrid, mille vastu mitmekihilist detektorit iseloomustatakse.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): avatud, valideeritud inertsiaalnavigatsiooni veaprofiilid, mida kasutatakse klassikalise lähtetasemena.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): avatud Kuu PNT simulaator.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): avatud GNSS-andmete analüüs.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): GRAIL-i taandatud dünaamikaga OD, empiirilise kiirenduse põrand, mida LRO sobitus taastoodab.

</details>
