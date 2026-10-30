> Tämä on konekäännös tiedostosta README.md versiossa v0.40.0, eikä äidinkielinen puhuja ole vielä tarkistanut sitä. Viitteenä on englanninkielinen README. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: tunnus, täsmällistä hetkeä merkitsevä kompassin tähtäinristikko, sanamerkin kshana vieressä" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>täsmällinen hetki</em></strong><br>
  Avoimen lähdekoodin simulaattori PNT-järjestelmien (paikannus, navigointi ja ajoitus) häiriönsietokyvylle.
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Jatkuvan integraation tila main-haarassa"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Rivikattavuus lähes 95 % hakemistosta src/, mitattu tiedostossa docs/COVERAGE.md ja vaadittu vähintään 85 % jatkuvassa integraatiossa"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 / 401 ominaisuutta VALIDATED riippumatonta ulkoista oraakkelia vasten, varmennusmatriisin mukaan"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="SonarQube Cloudin laatuportin tila"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Julkaisu v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Englanti ja 17 muuta kieltä konekäännöksinä"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Lisenssi: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, jokaisen julkaisun Zenodo-konseptitietue"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Kaupallinen lisenssi on saatavilla Ashforde® OÜ:lta, katso Versiot"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana crates.io-palvelussa, nykyinen julkaistu versio"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana PyPI-palvelussa, nykyinen julkaistu versio"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana npm-palvelussa, nykyinen julkaistu versio"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Avaa Kshana Studio</a> ·
  <a href="#install">Asennus</a> ·
  <a href="#capabilities">Ominaisuudet</a> ·
  <a href="#evidence">Todisteet</a> ·
  <a href="#research">Tutkimus</a> ·
  <a href="docs/CONCEPTS.md">Dokumentaatio</a> ·
  <a href="#cite">Viittaaminen</a>
</p>

<p align="center">
  <strong>Kielet:</strong> <a href="README.md">English</a> ·
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
  <sub>Komentorivi, ajojen yhteenvedot, kaaviot ja raportit puhuvat kutakin kieltä valitsimella <code>--lang &lt;tag&gt;</code>
  (esimerkiksi <code>kshana scenarios/holdover-test-example.toml --lang de</code>), ja samoin Python-, WebAssembly- ja MCP-rajapinnat.
  Nämä ovat konekäännöksiä, joita äidinkielinen puhuja ei ole vielä tarkistanut; viitteenä on englanti.
  Katso <a href="docs/i18n.md">Lokalisointi</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Harjoittele minuuttia, jona GNSS pimenee. Kshanan tehtäväkonsoli, piirretty moottorin v0.40.0 todellisesta ajosta: ketjutettu kampanja campaign-jam-spoof-holdover-integrity (siemen 20260928, 6 vaihetta, 18 jäsenajoa ajassa T+01:16:10) sekä skenaarion constellation-multi-gnss-coverage GPS-, Galileo-, BeiDou- ja GLONASS-järjestelmien 102 satelliittia, kukin piirrettynä moottorin maajäljestä palautetulle ympyränmuotoiselle kahden kappaleen radalle, säteet näyttöä varten tiivistettyinä. Kellon aikavirhe huipentuu arvoon 62.7 ns 50 ns:n suojarajaa vasten, kantoaalto-kohinatiheys laskee arvoon -12.2 dB-Hz 25 dB-Hz:n alarajaa vasten, ja pystysuuntainen suojaustaso nousee arvoon 135.4 m 50 m:n hälytysrajaa vasten." width="100%">
</picture>

<details>
<summary><strong>Sisältö</strong></summary>

- [Harjoittele minuuttia, jona GNSS pimenee](#rehearse-the-minute-gnss-goes-dark)
- [Uutta versiossa 0.40](#whats-new-in-040), [Uutta versiossa 0.39](#whats-new-in-039), [Uutta versiossa 0.38](#whats-new-in-038) ja [0.38 syvemmin](#038-in-depth): Jammertest-pisteytys, vastaanottimen omat liput, konesyötteet, ajoitus ja holdover, standardipaketit, LunaNet AFS, laboratorion edestakainen kierros, kshana-bench, observatorio, viejät, optiikka, [avaruuskäyttäjän navigointi](#space-user-navigation-gnss-ssv) ja [kuun infrastruktuuri](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) ja jokainen Studion sivu
- [Ominaisuudet](#capabilities): alueiden taulukko, [jokainen skenaariolaji perheittäin](#every-scenario-kind-by-family), [jokainen komento](#every-command), [jokainen rajapinta](#every-surface)
- [Miten ajo toimii](#how-a-run-works), [Tehtävät](#missions)
- [Todisteet](#evidence): kirjanpito (ledger), [ominaisuusalueet](#capability-domains)
- [Asennus](#install), [Arkkitehtuuri](#architecture) (ja [kaaviot](#diagrams)), [Tekoälyavustaja](#ai-assistant)
- [Versiot](#editions), [Tutkimus](#research), [Viittaaminen](#cite), [Lisenssi](#licence)
- [Viiteosa](#reference): käyttö, skenaarioformaatti, tulosteet, tietovaraston rakenne, UKK, vianmääritys, versiointi, tiekartta, osallistuminen, dokumentaatio

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Harjoittele minuuttia, jona GNSS pimenee

Kshana toistaa häirinnän (jamming), harhautuksen (spoofing) ja kellon holdover-tilan, kun GNSS-signaalit (Global Navigation Satellite
System) katoavat, ja kertoo, kuinka kauan järjestelmä pitää ajan ja sijainnin virhebudjettinsa
sisällä ja mikä kello tai anturi tuo eniten marginaalia. Se on yksi Rust-moottori. Se toimii
päätteessä, muistikirjassa, IDE:ssä (integroitu kehitysympäristö), tekoälyavustajassa (AI,
artificial intelligence) tai selaimessasi.

Jokainen ajo on toistettavissa bitti bitiltä skenaariosta, siemenestä ja moottorin versiosta.
Jokaisella ominaisuudella on yksi kolmesta merkinnästä koneellisesti tarkistetussa kirjanpidossa (ledger): **VALIDATED** (riippumaton
ulkoinen oraakkeli on samaa mieltä), **MODELLED** (sisäisesti johdonmukainen, ja tämä sanotaan ääneen)
tai **PARTNER** (laitteistokumppani vastaa siitä).

> **Tila: v0.40.0.** Validoitu, toistettava simulointialusta PNT-järjestelmien häiriönsietokyvylle.
> Ajoitus ja holdover ovat etusijalla, koska se alue on parhaiten validoitu. Kshana on
> tutkimus- ja kompromissianalyysin väline: ei radiotaajuista (RF) signaaligeneraattorilaitteistoa (se
> ei ohjaa radiota eikä lähetä mitään; sen signaalitason tuloste on kantataajuisia IQ-näytetiedostoja
> ohjelmistovastaanottimille), ei laitteisto- eikä sertifioitu GNSS-vastaanotin (sen ohjelmistovastaanotin
> on analyysityökalu) eikä lentotuote. Onko ala uusi? Aloita
> [selkokielisestä johdannosta](docs/CONCEPTS.md) ja [sanastosta](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Uutta versiossa 0.40

0.40 lisää tehtävätason virhebudjetin, merkitsee jokaisen kuvan ja taulukon todistetasollaan, lukee mitattuja kellolokeja,
tarkistaa datakumppanien toimitukset, arvioi, missä häiriölähde voi olla, ja puhuu englannin lisäksi seitsemäätoista kieltä.
Kirjanpidossa on nyt 401 riviä: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Yhtäkään riviä ei nostettu tasolle VALIDATED, ja jokainen alla mainittu
kynnyksen alitus on kiinnitetty testillä.

- **Tehtäväketju.** Laji `mission-thread` ketjuttaa vaiheet laukaisusta paluuseen (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` ja neljä kuulajia) määritellyin luovutussäännöin, marginaalilla määriteltyjä vaatimuksia vasten ja heikoimmalla
  lenkillä; päästä päähän -esimerkki Artemis-luokan tehtävästä 11 vaiheessa (Maan ja Kuun segmentit), yhteensä 92 skenaariolajia. Jokainen luku on MODELLED. Cislunaarinen eteneminen julkista Artemis I -rataa vasten
  **alittaa** ennalta asetetun kynnyksensä (45.3 km ja 0.25 m/s, kun kynnys on 5 km ja 0.05 m/s; syynä ovat pienet ratamuutokset, joita malli ei sisällä), ja kuun ratapropagaattori CAPSTONE-rataa
  vasten **alittaa** kynnyksen (136.8 km, kun kynnys on 25 km yhden kierroksen lopussa); LRO-vertailu saavuttaa kynnyksen. Rivit pysyvät tasolla MODELLED
  ([Tehtäväketju](docs/MISSION-THREAD.md), [kuun segmentti](docs/MISSION-THREAD-LUNAR.md)). Studiossa ketju luetaan osoitteessa `/studio/mission-thread/`.
- **Todistemerkinnät.** Jokainen ajon kirjoittama kuva ja taulukko kantaa todistetason ja ne kirjanpidon rivitunnukset, joihin se perustuu, matriisista luettuina.
- **Mitatut kellot.** Kahdeksan kellolokiformaattia luetaan ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)), ja sovitettu
  sarja voi ohjata holdover-tilaa. Ennalta asetettuja kynnyksiä vasten sovitus **alittaa** kynnyksen F1(a) viidessä kuudesta tietueesta ja kynnyksen F2 yhdessä; molemmat
  pysyvät tasolla MODELLED ([Muutosloki](CHANGELOG.md#0400---2026-10-29)).
- **Datakumppanit.** `kshana partner check` tarkistaa toimituksen formaatin eikä pisteytä mitään ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Lähettimen alue.** `kshana interference-map locate` antaa alueen ja ellipsin, ei koskaan pelkkää pistettä, ADS-B- tai AIS-
  ilmoituksista. Kerran Jammertest 2025 -lähetinpaikkoihin verrattuna tulos on **NOT ASSESSABLE** molemmille lähteille (liian vähän
  aikataulutettuja istuntoja avoimessa datassa), joten rivi pysyy tasolla MODELLED ([Häiriökartta](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Vertailuarviointi.** Version 0.40 uusintakampanja saavuttaa kynnykset A3, D3 (molemmat EXPLORATORY), R3 ja R4; A2, D1 ja R1 pysyvät tilassa NOT MET ([Bench](docs/BENCH.md)).
- **Kielet.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja ja zh-Hans, **konekäännöksinä, joita äidinkielinen
  puhuja ei ole tarkistanut**; viitteenä on englanti, ja muunkieliset ajot kestävät noin kaksi kertaa kauemmin
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Uutta versiossa 0.39

0.39 ei lisää ominaisuuksia eikä muuta tuloksia; moottorin tuloste on version 0.38 tuloste. Se korjaa yhden asian
komentorivillä, päivittää ristiinvalidointityökalujen riippuvuuksia ja ilmoittaa vertailuarvioinnin
tuomiot kokonaisuudessaan.

- **Komentorivi.** `kshana kinds | head` (mikä tahansa suljettu vakiotuloste) ei enää kaadu (panic): ohjelma päättyy
  hiljaa tilakoodilla 141, kuten muutkin työkalut suljetun putken kohdalla. Muut kirjoitusvirheet raportoidaan edelleen.
- **Riippuvuudet.** `memmap2` 0.9.11 kahdessa ANISE-ristiintarkistuksen lukitustiedostossa sekä `pillow` 13.0.0 ja
  `certifi` 2026.10.19 oraakkeliympäristön kiinnityksissä, kaikki hakemistossa `xval/`: mikään toimitettava ei muuttunut.
- **kshana-bench, kaikki tuomiot.** Ennalta asetetuista kynnyksistä kolme on tilassa NOT MET, kukin kiinnitetty testillä:
  A2 (`agc_k_sigma` AUC 0.766, kun vaatimus on vähintään 0.80), D1 (suurin ero 0.0301) ja tehtävän (b) R1 (siirretty,
  ei ajettu uudelleen). Yhtäkään kynnystä ei löysätty ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Uutta versiossa 0.38

0.38 tekee puolueettomasta erotuomarista mitattavan: se pisteyttää vastaanotinlokeja julkaistua testiaikataulua
vasten, lukee useampia vastaanottimia ja antureita, testaa ajoitusjärjestelmiä ja toimittaa vertailuarvioinnin sekä
häiriöobservatorion. Se pysyy ohjeellisena: mitään tässä ei ole sertifioitu, mikään tulos ei ole tyyppihyväksyntä,
eikä mikään lähetä. Jokainen rivi kertoo, mitä kirjanpito sisältää siitä ([miten merkintä ansaitaan](#evidence));
tila nimeää vain sen, mitä tarkistettiin, ja kirjanpidon rivi sekä linkitetty sivu kertovat, mitä ei tarkistettu.

| Uutta versiossa 0.38 | Mitä se tekee ja miksi | Tila kirjanpidossa | Lue |
|---|---|---|---|
| **Jammertest-pisteytys** | `kshana jammertest import` lukee julkaistun NPRA-testiluettelon ja lähetyssuunnitelman aikataulutettuna totuutena; `jammertest score` pisteyttää vastaanotinlokin testikohtaisesti (havaitsemisviive, puuttuvat hälytykset, väärät hälytykset, palautumisaika), allekirjoitettuna todistepakettina, jos annat avaimen | **MODELLED**: yksi kirjanpidon rivi. Kynnykset ennakkorekisteröitiin ennen yhtäkään pisteytettyä ajoa; JammerTest 2024 -datalla vähimmäisdatasääntö ei täyttynyt kummassakaan ajossa (4 ja 7 pisteytettävää ikkunaa, kun vaaditaan 10), joten **mitään kynnystä ei voida arvioida** eikä mitään väitetä | [Jammertest](docs/JAMMERTEST.md) |
| **Vastaanottimen omat liput** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG ja NovAtel RXSTATUS luetaan epookkikohtaiseen `self_report`-tietueeseen ja verrataan Kshanan hälytyksiin (molemmat, vain vastaanotin, vain Kshana, ei kumpikaan); Septentrio SBF -lukija ja vain luku -tilainen `--serial`-syöte | **MODELLED**; vastaanottimen ilmaisimen ja Kshanan välinen yksimielisyys ei ole validointia | [Vastaanottimen luotettavuus](docs/RECEIVER-TRUST.md) |
| **Lisää vastaanottimia ja antureita** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (BSD-lisensoiduista pyrtcm-taulukoista, ei RTCM-tekstistä), GNSS-SDR-valvontavirrat, IMU-loki toisena anturina, ROS 2 -paketti, `gnss_lib_py`-silta sekä `imu-fit` hybridianturin parametreille | **MODELLED**: kuusi kirjanpidon riviä; vain itse kirjoitettuja testiaineistoja, yhtäkään tallennetta todellisesta vastaanottimesta, IMU:sta, GNSS-SDR-ajosta tai ROS-graafista ei luettu | [Konesyötteet](docs/MACHINE-INPUTS.md) |
| **Ajoitus- ja holdover-testit** | laji `holdover-test` pisteyttää holdover-testin (operaattori poistaa GNSS:n, holdover, palautuminen) mitatusta aikavirhetietueesta ITU-T-maskeja vasten, "mitattu maskia vasten"; linuxptp- ja chrony-lokien lukijat; laitteistovaiheet ja kenttä `lab-attestation` | **MODELLED**: kaksi kirjanpidon riviä; ajat ovat operaattorin ilmoitus, niitä ei ole varmennettu | [Ajoitus-HIL](docs/TIMING-HIL.md), [Laitteistoturvallisuus](docs/HARDWARE-SAFETY.md) |
| **Standardipaketit, LunaNet AFS, laboratorion edestakainen kierros** | pisteytetyt paketit standardeille DHS RPCF, IMO MSC.1/Circ.1575 ja ICAO Doc 9849 Appendix F ennen ajoa ilmoitettuja kynnyksiä vasten, "tukee todisteita seuraavalle"; NIST IR 8323r1 -vastaavuustaulukko; LunaNet AFS -koodigeneraattori ja -tarkistin; allekirjoitettu paketti, joka linkittää laboratorioajon skenaarion, testiolosuhteet, vastaanotinlokin ja pisteet | **MODELLED** paketeille ja edestakaiselle kierrokselle; AFS-koodin tarkistus on **VALIDATED** painettuja tarkistussarakkeitaan vasten (katso kirjanpidon rivit) | [Standardit](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench ja observatorio** | kiinteät tehtävät, jaot ja mittarit häiriöiden havaitsemiselle, IQ-havaitsemiselle, holdover-ennusteelle ja optimismivajeelle, sinetöidyllä holdout-aineistolla ja staattisella tulostaululla; toistettava päivittäinen häiriötuote 24 h:n viiveellä, karkeilla soluilla ja ilman alkuperän osoittamista | ei omaa kirjanpidon riviä: se pisteyttää toimituksia, ja sen lähtötasot on merkitty tulostiedostoissa MODELLED; ennalta asetetuista kynnyksistä pisteyttäjä, C1–C3 ja D2 saavutetaan ja kolme kynnystä on **NOT MET** (kiinnitetty testeillä): A2 (`agc_k_sigma` AUC 0.766, kun vaatimus on vähintään 0.80 testijaolla), D1 (suurin ero 0.0301) ja tehtävän (b) R1 (siirretty, ei ajettu uudelleen); katso `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatorio](docs/observatory/METHOD.md) |
| **Viejät** | luottamustelemetria Home Assistantin MQTT discovery- ja tilaviesteinä (vain julkaisu, ei tunnuksia) Prometheuksen, CEF:n, LEEF:n ja OTLP:n rinnalla | **MODELLED**: yksi kirjanpidon rivi | [Luottamustelemetria](docs/TRUST-TELEMETRY.md) |
| **Optisen linkin marginaali ajan funktiona** | laji `optical-atmosphere` voi kirjoittaa yhden siemennetyn toteutuman paikan säästä linkkimarginaalisarjana | **MODELLED**: yksi kirjanpidon rivi; yksi otos mallista, ei ilmasto | [Optinen ilmakehä](docs/OPTICAL-ATMOSPHERE.md) |

Version 0.37 kohokohdat: [muutosloki](CHANGELOG.md#0370---2026-10-17). Version 0.38 täydellinen luettelo on
[muutoslokissa](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 syvemmin

Jokainen yllä olevan taulukon ominaisuus muutamalla rivillä: mitä se tekee, yksi komento sen ajamiseen, yksi
kuva moottorin todellisesta ajosta ja mitä kirjanpito sisältää siitä. Kuvat
kirjoittaa [`tools/gen_figures_038.py`](tools/gen_figures_038.py) hakemistoon
[`docs/figures/0.38/`](docs/figures/0.38/) (niitä ei koskaan piirretä käsin): `python3 tools/gen_figures_038.py`
kirjoittaa ne uudelleen käännetystä moottorista, ja `--check` epäonnistuu, jos jokin on vanhentunut tai sen kuvateksti tässä poikkeaa.
Kun syöte on loki, se on skriptin kirjoittama keksitty loki, koska todellisia kolmansien osapuolten lokeja
ei koskaan sisällytetä tietovarastoon, ja kuvateksti sanoo sen. Kaikki alla oleva on ohjeellista: ei sertifioitu, ei
tyyppihyväksyntä, eikä mikään lähetä. Tila nimeää sen, mitä tarkistettiin, eikä mitään muuta;
[miten merkintä ansaitaan](#evidence).

### Jammertest-pisteytys

`kshana jammertest import` muuntaa julkaistun NPRA-testiluettelon ja lähetyssuunnitelman
aikataulutetuksi totuudeksi, ja `kshana jammertest score` pisteyttää vastaanotinlokin sitä vasten: kunkin
aikataulutetun testin osalta, havaittiinko se, kuinka myöhään ja kuinka kauan vastaanottimen palautuminen kesti, sekä
väärät hälytykset kaikkien aikavälien ulkopuolella. Luettelo haetaan, sitä ei koskaan sisällytetä tietovarastoon.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Yhden synteettisen vastaanotinlokin pisteytys kolmen testin aikataulua vasten, moottorin v0.40.0 todellisesta ajosta (`kshana jammertest score`). Loki on keksitty: 1800 s NMEA-dataa, jossa C/N0 putoaa 20 dB kahdella välillä. Aikataulussa on kolme aikaväliä; keskimmäisessä ei lokissa ole häiritsintä. Pisteytys merkitsee 2 / 3 testiä havaituiksi (mediaaniviive 0 s) ja 1 puuttuneeksi, 0 väärän hälytyksen jaksoa 0.25 h:n puhtaana aikana. Mikään tässä ei kerro mitään todellisesta vastaanottimesta. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC 61108, IEC 61162): käyttäjä vastaa edelleen aluksen navigoinnista.">
</picture>

**Tila kirjanpidossa: MODELLED.** Kynnykset kiinnitettiin ennen yhtäkään pisteytettyä ajoa; JammerTest 2024 -datalla
vähimmäisdatasääntö ei täyttynyt kummassakaan ajossa, joten mitään kynnystä ei voida arvioida eikä mitään väitetä.
[Jammertest](docs/JAMMERTEST.md).

### Vastaanottimen omat liput

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG ja NovAtel RXSTATUS luetaan epookkikohtaiseen
`self_report`-tietueeseen ja asetetaan Kshanan hälytysten rinnalle: molemmat, vain vastaanotin, vain Kshana tai ei kumpikaan.
Septentrio SBF -lukija ja vain luku -tilainen `--serial`-syöte syöttävät samaan vertailuun. Kumpikaan puoli ei ole
todellinen totuus.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Vastaanottimen oma harhautuslippu Kshanan hälytysten rinnalla, moottorin v0.40.0 todellisesta ajosta keksityllä UBX-lokilla (200 epookkia taajuudella 1 Hz). C/N0 putoaa 20 dB välillä 80–90 s ja 120–130 s; vastaanotin liputtaa välit 120–130 s ja 160–165 s. Kalibroinnin jälkeen verratuista 140 epookista 11:ssä liputtivat molemmat, 6:ssa vain vastaanotin, 11:ssä vain Kshana ja 112:ssa ei kumpikaan. Kumpikaan puoli ei ole todellinen totuus, eikä yksimielisyys ole validointia. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

**Tila kirjanpidossa: MODELLED.** Vastaanottimen ilmaisimen ja Kshanan välinen yksimielisyys ei ole
validointia. [Vastaanottimen luotettavuus](docs/RECEIVER-TRUST.md).

### Lisää vastaanottimia ja antureita

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, GNSS-SDR-valvontavirrat, IMU-loki toisena
anturina, ROS 2 -paketti ja `gnss_lib_py`-silta päätyvät kaikki samalle vastaanottimen luotettavuuden aikajanalle.
`imu-fit` lukee hybridi- ja fuusioskenaarioiden tarvitsemat anturiparametrit paikallaan olevan IMU:n
lokista, joten skenaarion voi ajaa sillä anturilla, joka sinulla todella on.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Mitä `kshana imu-fit` lukee paikallaan olevan IMU:n lokista, moottorin v0.40.0 todellisesta ajosta keksityllä lokilla (20,000 näytettä taajuudella 100 Hz, 200 s): kiihtyvyysanturin nopeuden satunnaiskulku q_va = 4.02e-06, gyroskoopin kulman satunnaiskulku q_arw = 9e-08, biaksen epävakaus 0.00296 ja varhaiset Allan-kulmakertoimet (-0.51 ja -0.49; noin -0.5, kun valkoinen kohina hallitsee). Vieressä oleva taulukko on komennon tulostama TOML. Estimaattori on tarkistettu vain synteettisillä lokeilla. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

**Tila kirjanpidossa: MODELLED.** Vain itse kirjoitettuja testiaineistoja; yhtäkään tallennetta todellisesta vastaanottimesta, IMU:sta,
GNSS-SDR-ajosta tai ROS-graafista ei luettu. [Konesyötteet](docs/MACHINE-INPUTS.md).

### Ajoitus- ja holdover-testit

Laji `holdover-test` pisteyttää holdover-testin (operaattori poistaa GNSS:n, holdover, palautuminen)
mitatusta aikavirhetietueesta ITU-T-maskeja vasten ja sanoo sen juuri näillä sanoilla: mitattu
maskia vasten. linuxptp- ja chrony-lokien lukijat syöttävät sitä; laitteistovaiheet ja
kenttä `lab-attestation` kertovat, kuka ilmoitti mitäkin.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Aikavirhetietueesta pisteytetty holdover-testi, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/holdover-test-example.toml (601 näytettä 5 s:n välein). Operaattori poistaa GNSS:n hetkellä 600 s ja palauttaa sen hetkellä 2400 s; aikavirhe ajautuu arvoon 299 ns holdoverin lopussa, ylittää 100 ns:n budjetin 675 s:n jälkeen ja palaa 100 ns:n kaistan sisään 70 s palautuksen jälkeen. Tuomiot: lähtötason maskit PASS, holdover-maskit FAIL, holdover-verhokäyrä FAIL, palautuminen RECOVERED. Mitattu maskia vasten, ei hyväksyntä. Ajat ovat operaattorin ilmoitus, Kshana ei ole varmentanut niitä. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

**Tila kirjanpidossa: MODELLED.** Ajat, jolloin GNSS poistettiin ja palautettiin, ovat operaattorin ilmoitus,
niitä ei ole varmennettu. [Ajoitus-HIL](docs/TIMING-HIL.md), [Laitteistoturvallisuus](docs/HARDWARE-SAFETY.md).

### Standardipaketit

Pisteytetyt paketit DHS Resilient PNT -testiprofiileille, standardeille IMO MSC.1/Circ.1575 ja ICAO Doc 9849
Appendix F sekä NIST IR 8323r1 -vastaavuustaulukko komennossa `compliance-report`. Jokainen testi ajaa mukana tulevan
skenaarion ja vertaa tuloskenttää ennen ajoa ilmoitettuun kynnykseen; testi, joka tarvitsee vastaanotinlokin,
luetellaan syötettä tarvitsevaksi, eikä sitä pisteytetä. Sanamuoto on "tukee todisteita seuraavalle".

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Kolmen pisteytetyn standardipaketin jokainen testi, moottorin v0.40.0 todellisista ajoista (`kshana standards-pack run`): dhs-rpcf: 6 saavutettu, 1 ei saavutettu, 2 tarvitsee syötteen; imo-circ-1575: 1 saavutettu, 4 ei saavutettu, 2 tarvitsee syötteen; icao-doc9849-appf: 6 saavutettu, 0 ei saavutettu, 2 tarvitsee syötteen. Yhteensä 13 saavutettu, 5 ei saavutettu ja 6 tarvitsee syötteen, jota moottorilla ei ole (vastaanotinloki tai laitteiston dokumentaatio). Jokainen kynnys ilmoitettiin ennen ajoa; alitus säilytetään alituksena. Saavutettu kynnys kertoo, että mallinnettu skenaario saavutti ilmoitetun kynnyksen, ei mitään tuotteesta. Paketit tukevat todisteita riveille, joihin ne viittaavat; ne eivät ole arviointi. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu; sitä ei saa käyttää minkään navigointi- tai turvallisuuspäätöksen ainoana perustana.">
</picture>

**Tila kirjanpidossa: MODELLED.** Saavutettu kynnys kertoo, että mallinnettu skenaario saavutti ilmoitetun kynnyksen, ei mitään
tuotteesta; jokainen alitus säilytetään ja kiinnitetään testillä. [Standardit](docs/STANDARDS.md).
### LunaNet AFS

LunaNet Augmented Forward Signal -koodigeneraattori (Gold-, Weil- ja tertiäärikoodit, viestin
kehys ja sen virheenkorjauskoodaus) sekä tarkistin tallennetulle tai generoidulle symbolivirralle, kiinnitettynä
spesifikaation yhteen painokseen.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="LunaNet AFS -koodigeneraattori tarkistettuna spesifikaation painettuja sarakkeita vasten, moottorin v0.40.0 todellisesta ajosta (`kshana lunanet-afs-check spec`, kiinnitetty versioon LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29. tammikuuta 2025; asiakirja merkitsee kooditaulukkonsa {LSIS-TBC}). 9 / 10 tarkistusta saavutetaan; B4 on NOT MET (420 / 421 täsmäsi). Se tarkistaa symbolivirran julkaistun spesifikaation yhtä painosta vasten eikä sano mitään yhdestäkään LunaNet-solmusta tai -palvelusta. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu. Se tarkistaa symbolivirran julkaistun spesifikaation yhtä painosta vasten eikä sano mitään yhdestäkään LunaNet-solmusta tai -palvelusta.">
</picture>

**Tila kirjanpidossa: VALIDATED** koodi- ja synkronointitarkistuksille, spesifikaation painamia arvoja vasten
(jotka se merkitsee TBC); yksi tarkistus on NOT MET, säilytetty ja kiinnitetty (yksi painettu
tertiäärikoodin sarake poikkeaa: asiakirja painaa saman arvon kahdelle PRN:lle). Alikehysten 2–4 LDPC- ja CRC-sanoja
ei tarkisteta. Kirjanpidon rivit kertovat tarkalleen, mitkä. [LunaNet AFS](docs/LUNANET-AFS.md).

### Laboratorion edestakainen kierros

`kshana.test-conditions/1` on julkaistu kuvaus siitä, mitä laboratorio teki (tapahtumat, ajat,
tehot). `kshana evidence round-trip` linkittää skenaarion tiivisteen, olosuhteiden tiivisteen, vastaanotinlokin
tiivisteen ja pisteet yhdeksi allekirjoitetuksi paketiksi ja hylkää paketin, jonka olosuhteet ja pisteytysskenaario
ovat eri mieltä tapahtumista. Kshana ei koskaan tuota eikä toista signaalia: se, miten skenaario päätyi
vastaanottimeen, on operaattorin vastuulla.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Todistepaketin rakenne. Vastaanotinloki (NMEA, u-blox UBX, RINEX 3 tai Android-loki) ja aikaikkuna menevät komentoon kshana receiver-trust evidence, joka kirjoittaa seitsemän tiedostoa: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig ja valinnainen timestamp.tsr. Manifesti tallentaa koko lokin ja jokaisen tiedoston SHA-256-tiivisteen sekä tiedostojen yli kulkevan tiivisteketjun; allekirjoitus kattaa manifestin. kshana evidence verify tarkistaa allekirjoituksen, jokaisen tiedoston tiivisteen, ketjun ja sen, ettei luettelon ulkopuolisia tiedostoja ole, ja päättyy koodilla 0, kun varmennus onnistui, 1, kun jokin epäonnistui, ja 3, kun allekirjoittajaa ei ollut kiinnitetty. Paketti on tekninen tallenne, ei oikeudellinen lausunto.">
</picture>

Kuva on paketin rakenne. **Tila kirjanpidossa: MODELLED.**
[Testiolosuhteet](docs/spec/TEST-CONDITIONS.md), [Testipenkki](docs/TEST-BENCH.md).

### kshana-bench

Kiinteät tehtävät, jaot ja mittarit häiriöiden havaitsemiselle, IQ-havaitsemiselle, holdover-ennusteelle ja
optimismivajeelle, sinetöidyllä holdout-aineistolla ja staattisella tulostaululla. Se pisteyttää toimituksia; se ei ole
vastaanottimien paremmuusjärjestys.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="kshana-benchin tehtävän D (optimismivaje) sisäänrakennetut lähtötasot testijaolla, moottorin v0.40.0 todellisesta ajosta (`kshana bench baseline`). Kukin palkkipari on ROC-käyrän alle jäävä pinta-ala jakauman sisäisillä tapauksilla ja siirretyillä tapauksilla; niiden välinen ero on optimismivaje, toleranssina 0.05. fused-max-z: 0.998 ja 0.983 (ero 0.015); sqm-imbalance: 0.882 ja 0.882 (ero 0.001); agc-excess: 0.848 ja 0.819 (ero 0.030); raim-parity: 0.682 ja 0.672 (ero 0.010); energy-cn0-drop: 0.595 ja 0.565 (ero 0.030). Merkinnät ovat synteettisen aineiston generatiivisen mallin merkintöjä, eivät koskaan kenttädataa: MODELLED. Ohjeellinen: mallinnettu tai mitattu ilmoitettuja viitteitä vasten, ei hyväksyntä, sertifiointi eikä vaatimustenmukaisuuslausunto. Pisteet kuvaavat lokia tai aineistoa, eivät koskaan tuotetta.">
</picture>

**Tila kirjanpidossa:** ei omaa kirjanpidon riviä; lähtötasot on merkitty tulostiedostoissa MODELLED.
Ennalta asetetuista kynnyksistä pisteyttäjä, C1–C3 ja D2 saavutetaan ja kolme kynnystä on NOT MET, kukin
kiinnitetty testillä: A2 (`agc_k_sigma` AUC 0.766, kun vaatimus on vähintään 0.80 testijaolla), D1 (suurin ero
0.0301) ja tehtävän (b) R1 (siirretty aiemmasta kampanjasta, ei ajettu uudelleen). Luvut ovat tiedostossa
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Häiriöobservatorio

Yksi tuote UTC-vuorokautta ja aluetta kohden avoimesta ilma-alusten sijaintiarkistosta, kiinteällä karkealla ruudukolla:
kukin solu on heikentynyt, ei heikentynyt tai havaitsematon (mikä ei tarkoita "selkeä"). Julkaistaan aikaisintaan
24 h vuorokauden päättymisen jälkeen, pienet solut piilotettuina ja ilman syyn osoittamista.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Kaksi synteettistä häiriökarttapäivää, piirretty tietovarastoon tallennetuista näytteistä hakemistossa examples/interference-map/output, kummallakin oma synteettinen reittinsä ja moottorin raportoimat reitin altistumisosuudet. Vasemmalla ADS-B-päivä: 1 heikentynyt solu, 6 ei heikentynyttä, 4 arvioimatonta (vinoviivoitettu) ja solut ilman merkintää, piirretty tyhjinä, joita ei havaittu. Reitti on 525 km: pituudestaan 11.5% heikentyneissä soluissa, 38.3% ei heikentyneissä, 9.1% arvioimattomissa ja 41.1% havaitsemattomissa. Oikealla AIS-päivä: ympyrä- ja maallaolo-ilmaisimien liputtamat solut, ei-poikkeavat solut ja tyhjät solut; reitti on 454 km, josta 10.5% poikkeavissa soluissa, 21.2% ei poikkeavissa, 0.0% arvioimattomissa ja 68.3% havaitsemattomissa. ADS-B ja AIS ovat erilliset kerrokset, joita ei koskaan yhdistetä. Liputettu solu ei ole havainto häiriöstä, ja solua ilman väriä ei havaittu, mikä ei ole sama asia kuin selkeä. Kaikki data on keksittyä, avoimella keski-Atlantilla, eikä se ole mittaus.">
</picture>

Kuva esittää tietovarastoon tallennettuja näytepäiviä, ei observatorion tuotetta. **Tila kirjanpidossa: MODELLED**:
ei ulkoista oraakkelia, ei todellista totuutta eikä syyn osoittamista; solua, jota ei havaittu, ei ole
arvioitu, mikä ei ole sama asia kuin selkeä. [Observatorion menetelmä](docs/observatory/METHOD.md).

### Viejät

Luottamustelemetria Prometheus-tekstinä, CEF-, LEEF- ja OTLP-muodossa sekä Home Assistantin MQTT discovery- ja tila-
viesteinä. Komento julkaisee vain antamaasi kohteeseen eikä säilytä tunnuksia.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Yksi luottamustulos kolmessa vientiformaatissa, moottorin v0.40.0 todellisista ajoista (`kshana trust-telemetry`) aineistolla examples/maritime-trust: Prometheuksen tekstiesitys (viimeisin luottamuspistemäärä on 5.9, ja epäluotettava kaista on asetettu), sekä viimeiset CEF- ja LEEF-viestit. Komento ei julkaise mitään ilman kohdetta, ei säilytä tunnuksia eikä lähetä radiosignaalia. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC 61108, IEC 61162): käyttäjä vastaa edelleen aluksen navigoinnista.">
</picture>

**Tila kirjanpidossa: MODELLED.** [Luottamustelemetria](docs/TRUST-TELEMETRY.md).

### Optisen linkin marginaali ajan funktiona

Laji `optical-atmosphere` voi kirjoittaa yhden siemennetyn toteutuman paikan säästä linkkimarginaali-
sarjana: pilvijaksot, kullekin nestemäisen veden pylväs, yksi tuikenäyte askelta kohden. Studion
Optinen PNT -sivu avaa optical-atmosphere-skenaariot.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Yksi siemennetty toteutuma paikan 'northern' linkkimarginaalista 336 h:n ajalta, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/optical-atmosphere-network.toml (siemen 37, askel 600 s). Marginaali putoaa alle nollan pilvijaksojen aikana; tässä otoksessa linkki on käytössä 40.5 % ajasta, 27 katkoa ja pisin katko 30.7 h. Syötteet ovat havainnollistavia, sarja on yksi otos mallista eikä ilmasto, ja se poikkeaa tilastollisesta käytettävyydestä (37.8 %) otoksen otantavirheen verran. Vain ohjeellinen analyysi: ei sertifioitu käytettävyys-, eheys- tai navigointituote eikä ennuste millekään todelliselle paikalle, ellei sen ilmastosyötteet tule ilmoitetusta aineistosta.">
</picture>

**Tila kirjanpidossa: MODELLED.** Yksi otos mallista, ei ilmasto. [Optinen ilmakehä](docs/OPTICAL-ATMOSPHERE.md).

### Uudet Studio-näkymät

[kshana.dev/studio](https://kshana.dev/studio/) saa Bridge-toiston (kaksi ajoa rinnakkain yhdellä
tehtäväkellolla, osoitteessa [`/studio/replay/`](https://kshana.dev/studio/replay/)), Optinen PNT -sivun
(`/studio/optical/`), Holdover-testisivun (`/studio/holdover/`) ja observatorion katseluohjelman
(`/studio/observatory/`). Ne ajavat samaa moottoria selaimessa, mitään ei ladata palvelimelle, ja niissä on
sama ohjeellisuuslausuma. Yllä olevat kuvat on piirretty skriptillä moottorin omasta tulosteesta;
ne eivät ole kuvakaappauksia näistä sivuista.

<a id="space-user-navigation-gnss-ssv"></a>
### Avaruuskäyttäjän navigointi (`gnss-ssv`)

Avaruusalukselle GNSS-ratojen yläpuolella, ympärillä tai kaukana niiden takana: kuinka montaa GNSS-signaalia se voi käyttää, kuinka
voimakkaita ne ovat, kuinka hyvä geometria on ja mitä aluksen oma suodatin voi niillä tehdä. Yksi laji,
neljä tilaa, jotka valitaan skenaarion taulukoilla: käyttäjien **kuori** (shell; ajan osuus, jolloin on yksi ja neljä
signaalia, konstellaatioittain), **lentorata** (trajectory; signaalit, C/N0, tarkkuuden heikkenemiskerroin ja
reunasäteen väliaine radan varrella), **navigointiajo** (navigation; yhdeksän tilan suodatin pseudoetäisyyksillä Kuuhun
asti) ja **muodostelma** (formation; sivualusten suhteellinen navigointi pääaluksen ympärillä). Käytettävyysvertailun
julkinen lähde on yhteentoimivan GNSS Space Service Volume -järjestelmän kirjanen (UN OOSA
ST/SPACE/75, International Committee on GNSS), joka on itsekin simulaatio; se haetaan, sitä ei koskaan
sisällytetä tietovarastoon. Koko sivu: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Signaalien käytettävyys käyttäjälle pallopinnalla 36000 km:n korkeudessa puolipallo-antennilla, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/gnss-ssv-shell.toml (supistettu ajo: 162 käyttäjää, 3 vuorokautta, 10 min:n askeleet), 20 dB-Hz:n kynnyksellä. Kullekin konstellaatiolle ja kaistalle kaksi palkkia: niiden (käyttäjä, epookki) -parien osuus, joilla on vähintään yksi signaali ja vähintään neljä. Yhdistetty, L1: 99.4 % vähintään yksi, 73.2 % vähintään neljä, pisin alle neljän signaalin katko 160 min. Yhdistetty, L5: 100.0 % vähintään yksi, 99.9 % vähintään neljä, pisin alle neljän signaalin katko 20 min. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä palvelutilavuusväite mistään järjestelmästä. Supistettu koko ei ole kirjasvertailu. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signaalit yhden korkean Maan kiertoradan varrella (perigeum 497 km, apogeum 58622 km, jakso 18.8 h), moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/gnss-ssv-heo.toml, kaista L1. Ylhäällä: näkyvissä olevien signaalien paras kantoaalto-kohinatiheys 20 dB-Hz:n kynnystä vasten. Keskellä: näkyvissä olevien signaalien määrä kaikista konstellaatioista, 4–55 näytepisteiden varrella. Vastaanotetuista linkeistä 2252 tuli pääkeilan kautta ja 696 sivukeilojen kautta, käyttäen merkittyä parametrista sijaiskuviota, ei minkään järjestelmän mitattua kuviota. PDOP:n mediaani 67, 95. persentiili 358. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä palvelutilavuusväite mistään järjestelmästä. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Aluksen oma yhdeksän tilan suodatin siirtoradalla matalalta radalta kohti Kuuta, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/gnss-ssv-nav-lunar.toml (289 epookkia, 13 pistettä piirretty). Logaritmisella akselilla todellinen paikkavirhe ja suodattimen oma yhden sigman raja alusta kuluneen ajan funktiona. GNSS-ratojen sisäpuolella paikan RMS on 1.4 m; niiden yläpuolella se on 90 m, ja lopullinen virhe on 184 m 193,330 km:n korkeudessa 1 mittauksella. Normalisoidun estimointivirheen neliön keskiarvo koko ajon yli on 4.4 (noin 3 johdonmukaiselle paikkalohkolle). Totuus ja suodatin käyttävät samoja Auringon ja Kuun sijaismalleja. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä palvelutilavuusväite mistään järjestelmästä. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="2 sivualuksen suhteellinen navigointi pääaluksen ympärillä korkealla radalla, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/gnss-ssv-formation-heo.toml (401 epookkia). Kullekin sivualukselle kaksi palkkia: suhteellisen paikan RMS kahden riippumattoman absoluuttisen estimaatin erotuksesta sekä suhteellisesta suodattimesta yksinkertaisesti differoiduilla pseudoetäisyyksillä. Perusviiva 0.8 km: 5.1 m ja 1.2 m. Perusviiva 2.0 km: 4.1 m ja 2.1 m. Absoluuttinen suodatin ei ole tässä johdonmukainen: normalisoidun estimointivirheen neliön keskiarvo 187, kun johdonmukaisella suodattimella se on noin 3, joten sen ilmoittama epävarmuus on aivan liian pieni. MODELLED: mallinnettu tutkimus ilmoitetuista syötteistä, ei mittaus eikä palvelutilavuusväite mistään järjestelmästä. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

**Tila kirjanpidossa: MODELLED, ja vertailu kirjaseen jää enimmäkseen kynnyksen alle.** Kynnykset kiinnitettiin ennen
ajoa. Kahdeksasta vain S0 (käänteinen linkkibudjetti, 13 / 13 arvoa) ja S6 (kuutehtävä)
saavutetaan. **S1–S5 ja S7 ovat NOT MET**: ylemmän ja alemman palvelutilavuuden geometria (43 / 52 ja 48 / 52
solua), ylemmän palvelutilavuuden 15/20/25 dB-Hz, kuusi GEO-tehtävää, HEO-tehtävä sekä
parametrinen sivukeilakuvio mitattuja GPS-paneelikuvioita vasten. Lähes jokainen alitus kynnyksissä S1–S5 liittyy
GLONASSiin, ja kirjanen painaa sille kaksi eri viitekulmaa; diagnostinen muunnelma, joka käyttää
toista paria, vie S1:n, S2:n ja S4:n jokaiseen soluun, mutta se ei korvaa virallista ajoa, eikä yksikään rivi ole
VALIDATED. Muodostelma-ajon absoluuttinen suodatin on myös liian itsevarma (normalisoidun virheen neliön keskiarvo
selvästi yli sen noin 3:n arvon, jonka johdonmukainen suodatin antaa).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Avaruuskäyttäjän käytettävyysmallin tallennettu vertailu julkiseen Space Service Volume -kirjaseen, ennakkorekisteröidyn ajon tietovarastoon tallennetuista tuloksista (xval/gnss-ssv/results-run1.json, kirjoittanut moottorin v0.40.0 esimerkki ssv_booklet_check). Palkki palkilta toleranssin sisällä olevat solut: S0 13 / 13 (MET); S1 43 / 52 (NOT MET); S2 48 / 52 (NOT MET); S3 122 / 155 (NOT MET); S4 132 / 156 (NOT MET); S5 18 / 26 (NOT MET); S6 26 / 26 (MET); S7 0 / 20 paneelikuviota (NOT MET). Vain S0 ja S6 saavutetaan ennakkorekisteröidyllä tulkinnalla. Diagnostinen muunnelma, joka käyttää kirjasen toisia GLONASS-kulmia, vie S1:n, S2:n ja S4:n jokaiseen soluun, mutta ei korvaa virallista ajoa. Yksikään kirjanpidon rivi ei ole VALIDATED. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

[Avaruuskäyttäjän navigointi](docs/SSV.md), [mitä vertailu osoittaa](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Kuun infrastruktuuri (`lunar-infrastructure`)

Kuun rata ja pinta navigointi- ja geodeettisena infrastruktuurina viidessä tutkimuksessa, jotka valitaan kentällä
`study`: **od-consistency** (aluksen oma Maan GNSS:ään perustuva radanmääritys halo-radalla verrattuna
riippumattomaan maa-asemien radanmääritykseen), **carrier-phase** (kokonaislukuepävarmuuden ratkaisu pinta-asemien ja
kiertolaisen välillä), **frame-coestimation** (kuun datumi maa-asemien etäisyysmittauksista kiertolaisen linkkien
kanssa ja ilman), **space-tie** (laser-, VLBI- ja GNSS-poikkeamat yhdessä avaruusaluksessa paikallisen sidoksen virhettä vasten) ja
**geodesy-sensitivity** (mikä havaintosuureperhe näkee Love-luvut h2, k2 ja l2). Malli on
rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein. Koko sivu:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Aluksen oman Maan GNSS:ään perustuvan radanmäärityksen johdonmukaisuus lähes suoraviivaisella halo-radalla verrattuna riippumattomaan maa-asemien radanmääritykseen, moottorin v0.40.0 todellisista ajoista skenaariolla scenarios/lunar-infrastructure-od-consistency.toml ja mallivirhemuunnelmalla (kumpikin 400 koetta). Normalisoidun erotuksen q keskiarvo on 5.81 ilman mallivirhettä ja 5.95 lisätyllä kiihtyvyysvirheellä 3e-10 m/s2, kun odotusarvo on 6: kaksi ratkaisua ovat johdonmukaisia (kynnys C1 MET). 95 %:n pisteen ylittävien kokeiden osuus on 0.040 ja 0.052; lisätyn virheen havaitsemisen kynnys oli vähintään 0.5, joten se on NOT MET (C3): aluksen oma ratkaisu tunnetaan noin 352 m:n tarkkuudella ja maa-asemien ratkaisu 23 m:n, joten kymmenen metrin siirtymä piiloutuu sen kovarianssiin. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuusuureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Kantoaallon vaiheen kokonaislukuepävarmuuden ratkaisu kuun pinta-asemien ja kiertolaisen välillä, moottorin v0.40.0 pisteytetyn ajon tietovarastoon tallennetusta tuloksesta (tests/fixtures/lunar_infra/phase_full_run.json: 3 kaaren pituutta, kullekin 401 otoksen Monte Carlo, kirjoittanut scenarios/carrier-phase-scored.toml). 1 vrk: onnistuminen 1.0 % (keskivirhe 0.5 %), 134 epävarmuutta, kiertolaisen paikan sigma 45.6 m liukuluku- ja 18.5 m kiinnitetyssä ratkaisussa; 2 vrk: onnistuminen 0.5 % (keskivirhe 0.4 %), 259 epävarmuutta, kiertolaisen paikan sigma 21.5 m liukuluku- ja 8.7 m kiinnitetyssä ratkaisussa; 3 vrk: onnistuminen 2.8 % (keskivirhe 0.8 %), 375 epävarmuutta, kiertolaisen paikan sigma 6.3 m liukuluku- ja 2.1 m kiinnitetyssä ratkaisussa. Kokonaislukujen kiinnitystä ei saavuteta: onnistuminen pysyy välillä 1 % – 3 % arvolla 25 dBi, ja rekisteröidyllä arvolla 12 dBi ongelmaa ei voida muodostaa. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuusuureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Seitsemän parametrin kuun datumin (kolme siirtoa, mittakaava ja kolme kiertoa) tarkkuus maa-asemien etäisyysmittauksista, kiertolaisen ja pinta-asemien välisten etäisyyksien kanssa ja ilman, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/lunar-infrastructure-frame-coestimation.toml. Siirtojen ja kiertojen Cramer-Rao-sigma pienenee kiertolaisen linkkien myötä (esimerkiksi t_z arvosta 0.98 m arvoon 0.046 m); pienin informaation ominaisarvo kasvaa 111-kertaiseksi ja CRLB:n jälki putoaa 1.0 %:iin (kynnys F3 MET). Tämä olettaa, että rata tunnetaan kuun akseleissa ja sen virhe sisältyy kiertolaisen etäisyyden 1 m:n sigmaan. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuusuureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Yhden avaruusaluksen laseretäisyysmittaus-, VLBI- ja GNSS-paikkojen välisten poikkeamien tarkkuus maassa tehdyn paikallisen sidoksen virhettä vasten, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/lunar-infrastructure-space-tie.toml (yksi 6.56 vuorokauden kaari, tekniikoiden sigmat GNSS 10 m, VLBI 1 m, laser 0.1 m). Paikallisen sidoksen ollessa 1 mm – 1 m laser miinus GNSS -siirron sigma pysyy lähellä arvoa 1.04 m, kunnes sidos saavuttaa 1 m: sitä rajoittaa tekniikoiden mittauskohina, ei paikallinen sidos. Pelkän sidoksen asettama alaraja on kahden neliöjuuri kertaa sen sigma. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuusuureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Mikä havaintosuureperhe on herkkä kuun Love-luvuille h2, k2 ja l2, moottorin v0.40.0 todellisesta ajosta skenaariolla scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Kukin solu on perheen havaintojen osittaisderivaatan RMS parametrin suhteen, perheen omissa yksiköissä (joten soluja verrataan rivin suuntaisesti, ei sarakkeen); viiva tarkoittaa, ettei perheellä ole herkkyyttä. laseretäisyysmittaus: h2 7.6, k2 ei mitään, l2 9.8. kiertolaisen seuranta: h2 ei mitään, k2 0.00086, l2 ei mitään. pintagravimetri: h2 2.9e+03, k2 4.3e+03, l2 ei mitään. pintakello: h2 2.8e-17, k2 2.8e-17, l2 ei mitään. Kaikilla neljällä perheellä Cramer-Rao-sigma on 0.36 % nimellisestä h2:sta, 0.52 % k2:sta ja 1.16 % l2:sta. Perheen lisääminen ei koskaan pienentänyt pienintä ominaisarvoa (28 / 28 lisäystä), mutta pseudoinverssin jälki ei kasvanut vain 16:ssa 28:sta: tämä kynnyksen G3 puolisko on NOT MET. Kiertolaisperhe näkee k2-kiihtyvyyden näkösäteen suuntaisen integraalin, yläpään arvio. MODELLED: rajoitettu kolmen kappaleen malli ilmoitetuin yksinkertaistuksin ja havainnollistavin syöttein, ei minkään kuusuureen mittaus. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysituloste, ei tyyppihyväksytty navigointilaite eikä turvallisuuskriittinen (safety-of-life) palvelu.">
</picture>

**Tila kirjanpidossa: MODELLED, ja kolme kynnystä on NOT MET.** Numeriikka on tarkistettu riippumattomia
numpy- ja scipy-ohjelmia vasten; mitään ei verrata kuusuureen mittaukseen, eikä mikään ole
VALIDATED. Saavutettu: kaksi ratkaisua ovat johdonmukaisia (q:n keskiarvo 5.81, kun odotusarvo on 6), ja kiertolaisen
linkit kasvattavat pienintä datumin ominaisarvoa noin 111-kertaiseksi, olettaen tunnetun radan. **Ei saavutettu**:
lisättyä 3e-10 m/s2:n mallivirhettä **ei havaita** (C3: aluksen oma ratkaisu tunnetaan noin 350 m:n tarkkuudella, joten
noin kymmenen metriä piiloutuu sen kovarianssiin); **kokonaislukujen kiinnitystä ei saavuteta** (1–3 %:n onnistuminen arvolla
25 dBi, ja rekisteröidyllä arvolla 12 dBi ongelmaa ei voida muodostaa); ja G3:n jälkipuolisko havaintosuureperheen
lisäämiselle (jälki kasvoi 12:ssa 28 lisäyksestä, joka kerta koska perhe nosti astetta).
Jokainen alitus on kiinnitetty testillä. [Kuun infrastruktuuri](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Avaa [kshana.dev/studio](https://kshana.dev/studio/), niin koko moottori toimii
selaimessasi WebAssemblyksi käännettynä. Ei mitään asennettavaa, eikä mitään ladata palvelimelle. Studiossa on
kaksi näkymää samaan moottoriin, ja otsakkeen kytkin vaihtaa niiden välillä säilyttäen
skenaarion, näkymän ja kaikki muuttamasi asetukset.

**Yksinkertainen näkymä** on se, johon Studio avautuu. Se lähtee kysymyksistä (kuinka monta satelliittia
näen, voinko luottaa paikannukseeni, kuinka kauan kello pitää ajan, mitä häiritsin tekee
vastaanottimelleni) ja kartasta kaikesta, mitä moottori osaa, kullakin alueella sen osuus
validoiduista menetelmistä. Avaa skenaario, niin vastaus tulee ensin: yksi selkeä lause, kirjoitettu sen mukaan,
mitä skenaario mittaa, sitten sen keskeiset luvut ja kaavio. Enintään viisi asetusta on
näkyvissä, ne jotka muuttavat vastausta eniten; loput odottavat kohdassa **Lisäasetukset**.
**Miten tämä lasketaan** selittää menetelmän, ja **Tutkijoille** antaa moottorin omat
luvut, skenaariotiedoston, koodin sen ajamiseen Pythonista ja viittauksen.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, Yksinkertainen näkymä, mukana tulevalla skenaariolla integrity-raim, moottori v0.40.0 toimii paikallisesti. Kysymys: täyttääkö geometria hälytysrajat (vaakasuuntainen ja pystysuuntainen suojaustaso)? Vastaus ensin, merkittynä Live-tulos: Kyllä, enimmäkseen: 95.3 %:lle 12 h:sta. Vastaanottimen virheraja pysyi hälytysrajojen alla (40 m vaaka ja 50 m pysty) 344:ssä 361 tarkistuksesta, eikä yksikään paikannus ollut harhaanjohtava. Keskeiset luvut: aika, jolloin paikannukseen voi luottaa 95.3 %, pisin aukko 10 min, tyypillinen virheraja 6.5 / 13 m, harhaanjohtavat paikannukset 0. Vieressä Kokeile muita asetuksia, joista viisi (etäisyysvirhe, kaksi hälytysrajaa, kesto ja korkeuskulmamaski), ja Aja uudelleen, sitten taitetut osiot Lisäasetukset (13 lisää), Miten tämä lasketaan (8 validoitua, 6 mallinnettua) ja Tutkijoille. Alla tämän tuloksen näkymät ja suojaustasot piirrettynä hälytysrajaa vasten." width="100%">
</picture>

**Edistynyt näkymä** on täysi kojelauta: skenaariokirjasto, viisi numeroitua vaihetta
(Valitse, Aseta, Aja, Lue tulokset, Jaa tai vie), keskeiset luvut PASS- ja FAIL-merkein
silloin, kun ajo ilmoittaa kynnyksen, sekä jokainen paneeli: yleiskatsaus, kaaviot, kartat, toisto, moottorin
raportti ja viennit. Yksi hakukenttä tavoittaa skenaariot, alueet ja niiden sisällä olevat
kentät, ja voit kiinnittää enintään neljä ajoa ja verrata niitä rinnakkain.

<details>
<summary>Yksinkertaisen näkymän aloitusnäyttö ja Edistynyt näkymä ajon jälkeen</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, Yksinkertainen näkymä, aloitusnäyttö otsikolla Mitä haluaisit selvittää?, moottori v0.40.0 käynnissä ja yläpalkissa kolme linkkiä: Koulutuksen jälkipuinti, Häiriökartta ja Vastaanottimen luotettavuus. Neljä kysymystä: kuinka monta satelliittia näen missä tahansa Maan päällä, voinko luottaa paikannukseeni, kuinka kauan kello pitää ajan ilman satelliitteja ja mitä häiritsin tekee vastaanottimelleni. Ensimmäisen alla sen tallennettu tulos: vähintään 22 satelliittia näkyvissä joka paikassa ja keskimäärin 31, kun GPS, Galileo, BeiDou ja GLONASS ovat yhdessä, paikannus mahdollinen 100 %:ssa paikoista ja ajoista, maailmankartalla näkyvissä olevista satelliiteista, ja painike Avaa tämä tulos. Vieressä Kaikki, mitä Kshana osaa: 16 aluetta ja 139 valmista skenaariota, kussakin ruudussa pieni kaavio tallennetusta ajosta ja sen osuus validoiduista menetelmistä, sekä kirjanpidon 173 / 350 validoitua ominaisuutta." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, Edistynyt näkymä, mukana tulevan skenaarion constellation-multi-gnss-coverage (Neljä GNSS-konstellaatiota, yksi kartta) ajon jälkeen, moottori v0.40.0 toimii paikallisesti. Vasemmalla skenaariokirjasto, 139 skenaariota 16 alueella. Viisi vaihetta Valitse, Aseta, Aja, Lue tulokset ja Jaa tai vie, vaihe 4 nykyisenä. Keskeiset luvut: 102 satelliittia, käytettävyys 100 % (PASS), paikan tarkkuuden heikkenemiskertoimen (PDOP) mediaani 0.95 (PASS), PDOP:n 95. persentiili 1.105 (PASS), keskimäärin 31.03 satelliittia näkyvissä ja vähimmillään 22. Alla paneelirivi, jossa Kattavuus on valittuna, toistopalkki, maailmankartta keskimääräisestä PDOP:sta välillä 0.831–1.0853 kaikki satelliitit piirrettyinä sekä maailmanlaajuiset kattavuusluvut." width="100%">
</picture>

</details>

Studion lähdekoodi ja käännösohjeet ovat tiedostossa [`web/README.md`](web/README.md).

### Sivusto

Muu osa sivustosta [kshana.dev](https://kshana.dev) rakennetaan tämän tietovaraston omista tiedostoista ja
moottorin ajoista: tehtävät, ominaisuudet, todistekirjanpito, julkaistu tutkimus ja
versiot.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Kolme kshana.dev-sivuston sivua rinnakkain. Etusivun pääosio: nimirivi Kshana · क्षण · täsmällinen hetki otsikon Harjoittele minuuttia, jona GNSS pimenee yläpuolella, moottorin v0.40.0 todellisen ajon tehtäväkonsolilla (maapallo ja kolme live-kaaviota: kellon aikavirhe, kantoaalto-kohinatiheys ja suojaustaso). Todisteet, Julkaistu tutkimus: kuusi avoimeen moottoriin perustuvaa arXiv-artikkelia, uusin moottorin kuvan kera. Versiot, Kshana Pro, sama moottori vahvistettuna: Free ajaa yhden skenaarion, Pro vastaa ohjelman kysymykseen." width="100%">
</picture>

<a id="capabilities"></a>
## Ominaisuudet

Yksi moottori kattaa koko vikaketjun ensimmäisestä häiritystä satelliitista kellon holdoverin viimeiseen
nanosekuntiin. Moottorissa on 92 skenaariolajia; `kshana kinds` luettelee
ne, ja [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumentoi jokaisen kentän.

| Ominaisuus | Mihin se vastaa |
|---|---|
| [Spektri](docs/SPECTRUM.md) | miten häiritsin valtaa GNSS:n L-kaistan, kaista kaistalta, sekunti sekunnilta |
| [Kellot ja ajoitus](docs/TELECOM-TIMING.md) | kuinka kauan kukin kello pitää ajan GNSS:n menettämisen jälkeen |
| [Konstellaatiot minkä tahansa kappaleen ympärillä](docs/CONSTELLATION-DESIGN.md) | kattavuus, tarkkuuden heikkenemiskerroin ja käytettävyys Maan, Kuun tai Marsin ympärillä |
| [Aurinkokunta](docs/SOLAR-SYSTEM.md) | missä kukin planeetta on, ja minkä tahansa linkin valon kulkuaika |
| [Matalan Maan kiertoradan navigointi](docs/LEO-PNT.md) | ylilento, linkki, navigointiviesti ja yhdistetty paikannus, vaihe vaiheelta |
| [Kampanjat](docs/CAMPAIGNS.md) | ketjutettu tehtävä, parametripyyhkäisy tai Monte Carlo -joukko yhdessä skenaariossa |
| [Animaatio](docs/ANIMATION.md) | ajon aikasarja animoituna piirroksena, soittimena tai kehyksinä |
| [Raportit](docs/REPORTS.md) | jokainen luku yksikköineen ja merkintöineen, HTML- (HyperText Markup Language) ja JSON-muodossa (JavaScript Object Notation) |
| [Yhteentoimivuusviennit](docs/INTEROP.md) | radat ja geometria muille työkaluille: SP3, CCSDS OMM ja OEM, CZML, KML, GeoJSON, STK ja SigMF |
| [Merenkulun luotettavuus](docs/MARITIME-TRUST.md) | voiko komentosilta luottaa tähän paikannukseen: 0–100-pistemäärä ja syyt aluksen NMEA-datalle, reaaliajassa tai lokista (ohjeellinen, ei tyyppihyväksytty navigointilaite) |
| [NMEA-koulutusvirrat](docs/NMEA-TRAINING.md) | synteettistä komentosillan NMEA-dataa käsikirjoitetulla häirinnällä ja harhautuksella sekä kouluttajan lokilla, miehistön koulutukseen (vain tekstiä; ei koskaan aluksen käytössä oleviin navigointijärjestelmiin; ohjeellinen, ei tyyppihyväksytty navigointilaite) |
| [Häiriökartta](docs/INTERFERENCE-MAP.md) | missä ilma-alukset ja laivat ilmoittivat heikentynyttä navigointidataa, ja kuinka suuren osan reitistä se koskettaa |
| [Lähettimen alue](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | missä ilmoitetuin oletuksin heikentyneiden paikkailmoitusten lähde voi olla: alueet ilmoitetulla luottamustasolla, keskipiste ellipseineen, ei koskaan piste (MODELLED; `kshana interference-map locate`) |
| [Todistepaketit](docs/EVIDENCE-PACKS.md) | allekirjoitettu, offline-tilassa varmennettava tekninen tallenne aluksen lokin aikaikkunasta ja siitä, mitä moottori laski sen perusteella, poikkeamaraporttia varten (ohjeellinen, ei tyyppihyväksytty navigointilaite) |
| [Luottamustelemetria](docs/TRUST-TELEMETRY.md) | luottamusvirta Prometheus-mittareina, SIEM-tapahtumina ja valinnaisesti OpenTelemetryna, esimerkki-Grafana-kojelaudan kera (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K ja OpenCPN](docs/MARINE-INTEGRATIONS.md) | luottamuspistemäärä veneen Signal K -palvelimella ja OpenCPN:ssä, viitekokoonpanolla pienelle tietokoneelle vastaanottimen viereen (ohjeellinen, ei tyyppihyväksytty navigointilaite) |
| [Testipenkkivienti](docs/TEST-BENCH.md) | `kshana bench-export`: skenaarion ajoneuvon liike ja tapahtumat laboratorion GNSS-simulaattorille (signaalia ei kirjoiteta), ja miten vastaanottimen loki pisteytetään jälkikäteen |
| [Vaatimustenmukaisuuden vastaavuus ja raportti](docs/compliance/README.md) | `kshana compliance-report`: mille julkisten häiriönsietokehysten riveille joukko ajoja tukee todisteita, ja mikä aukko jää |
| [Muistikirjat](notebooks/README.md) | ajettavat opetusohjelmat: aluksen luotettavuus ja koulutusvirrat, häiriökartan reittialtistus, vaatimustenmukaisuuden vastaavuus ja testipenkki, kvantti vastaan klassinen GDOP |
| [Galileo OSNMA -varmentaja](docs/OSNMA.md) | minkä satelliittien navigointidatan vastaanotin voi todentaa kryptografisesti, ja miksi tarkistus epäonnistuu; Kshana ei myönnä mitään oikeuksia EU:n OSNMA ICD:n immateriaalioikeuksien nojalla (katso sivun NOTICE) |

Vientiformaatit kokonaisuudessaan: SP3 on Standard Product 3; CCSDS OMM ja OEM ovat Consultative Committee for Space Data
Systems -komitean Orbit Mean-elements- ja Orbit Ephemeris Messages -viestit; CZML ja KML ovat Cesium- ja Keyhole Markup Language -kielet;
STK on Systems Tool Kit; SigMF on Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Ketjutettu kampanja campaign-jam-spoof-holdover-integrity, yksi moottorin todellinen ajo (siemen 20260928): 6 vaihetta (Normaali → Häirintä → Harhautus → Holdover → Eheyshälytys → Palautuminen) ja 18 jäsenajoa 10 s:n ruudukolla ajassa T+01:16:10. Kolme kaistaa: kellon aikavirhe 50 ns:n suojarajaa vasten (huippu 62.7 ns), efektiivinen kantoaalto-kohinatiheys 25 dB-Hz:n alarajaa vasten (minimi -12.2 dB-Hz) ja pystysuuntainen suojaustaso 50 m:n hälytysrajaa vasten (huippu 135.4 m), ajon hälytystapahtumineen: T+00:20:00 RF-harhautusilmaisin hälyttää (yhdistetyt johdonmukaisuus-, teho- ja signaalinlaatuvalvonnat); T+00:26:10 kelloavusteinen harhautusvalvonta hälyttää." width="100%">
</picture>

<details>
<summary>Kukin ominaisuus todellisesta ajosta piirrettynä: L-kaistan vesiputous, kattavuuskartta, aurinkokunta ja matalan Maan kiertoradan ylilento</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="GNSS:n L-kaista yhtenä tehospektritiheytenä 60 s:n ajalta, spektrilajin todellisesta ajosta (l-band-waterfall-jamming.toml, siemen 7, moottori v0.40.0): taajuus vaakasuunnassa, aika alaspäin, väri teholle -202.0 dBW/Hz:n kohinatason yläpuolella. Häiritsimet: chirp-yksityisyyslaite (chirp, päälle 10 s, pois 40 s); CW-sävy L1:llä (cw, päälle 30 s); L2:n kapeakaistainen kohina (narrowband, päälle 45 s). Pahin kaista GPS L1 C/A: pienin efektiivinen C/N0 3.2 dB-Hz hetkellä 31 s, kun seurannan alaraja on 25 dB-Hz. GPS L1 C/A minimi 3.2 dB-Hz; Galileo E1 minimi 4.7 dB-Hz; GPS L2C minimi 36.9 dB-Hz; GPS L5 minimi 44.1 dB-Hz; Galileo E5a minimi 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Näkyvissä olevat satelliitit koko Maan yllä yhden vuorokauden ajan, constellation-design-lajin todellisesta ajosta (constellation-multi-gnss-coverage.toml, moottorin ajanut tämä generaattori): 102 satelliittia (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Kukin 10 asteen solu on varjostettu 10 asteen maskin yläpuolella olevien satelliittien keskimääräisen määrän mukaan (27.2–36.5); pisteet ovat moottorin maajälkinäytteitä, yksi tunnissa satelliittia kohden. Maailmanlaajuinen käytettävyys 100.00 %, kun PDOP on enintään 6, PDOP:n mediaani 0.95, keskimäärin 31.0 ja vähintään 22 satelliittia näkyvissä." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Aurinkokunta skenaarion epookkina 2026-09-28T00:00:00, solar-system-lajin todellisesta ajosta (solar-system-tour.toml): Aurinko, 9 planeettaa ja kääpiöplaneetta Pluto ekliptikan yläpuolelta nähtyinä, etäisyydet logaritmisesti tiivistettyinä näyttöä varten, kunkin kappaleen yksisuuntainen valon kulkuaika Maasta. Merkurius 0.47 au, 10.1 valominuuttia, VALIDATED; Venus 0.73 au, 3.0 valominuuttia, VALIDATED; Mars 1.55 au, 14.0 valominuuttia, VALIDATED; Jupiter 5.30 au, 49.5 valominuuttia, VALIDATED; Saturnus 9.44 au, 70.2 valominuuttia, VALIDATED; Uranus 19.44 au, 157.4 valominuuttia, MODELLED; Neptunus 29.88 au, 240.2 valominuuttia, MODELLED; Pluto 35.61 au, 292.2 valominuuttia, MODELLED. Linkit: Mars–Jupiter yksisuuntainen 2193.5 s; Saturnus–Maa yksisuuntainen 4212.2 s; Europa–Jupiter yksisuuntainen 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Yksi matalan Maan kiertoradan (LEO) ylilento leo-pass-lajin todellisesta ajosta (leo-pass-iridium.toml, moottorin ajanut tämä generaattori): Iridium-ylilento 781 km:ssä, STL-kaista 1621 MHz:ssä, ilmassa olevan käyttäjän näkemänä kohdassa 50° N 30° W. 5°:n maskin yläpuolella 750 s, suurin korkeuskulma 65.0° hetkellä 444 s. Kantoaalto-kohinatiheys huipentuu arvoon 80.5 dB-Hz (mediaani 71.3), 34.3 dB yli GNSS:n mediaanin 46.2 dB-Hz 8 näkyvissä olevasta GPS-satelliitista (38.2–51.1 dB-Hz); Doppler nousee 35.4 kHz:iin." width="100%">
</picture>

Aja mikä tahansa niistä komennolla `kshana example <scenario> > s.toml && kshana s.toml`: skenaariot
ovat `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
ja `leo-pass-iridium`.

</details>

<details>
<summary>Merenkulun ja häiriöiden ominaisuudet tietovarastoon tallennetuista synteettisistä syötteistä piirrettyinä: luottamuspistemäärä, häiriökartta reittialtistuksineen, koulutusvirta ja todistepaketti</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Luottamuspistemäärä yhden synteettisen matkan aikana, moottorin v0.40.0 todellisesta ajosta aineistolla examples/maritime-trust (keksitty NMEA-loki lautasta reitillä Tallinna–Helsinki, 3001 epookkia taajuudella 1 Hz). Kolme kaistaa jakaa yhden aika-akselin. Ylhäällä: vastaanottimen ilmoittaman paikan ja aluksen todellisen paikan välinen etäisyys, joka pysyy muutaman metrin sisällä noin hetkeen 1576 s asti, jolloin lokin käsikirjoitettu paikan poisveto (drag-off) vetää sen sivuun samalla, kun vastaanotin ilmoittaa edelleen kelvollisen paikannuksen. Keskellä: luottamuspistemäärä 0–100, jota ei lasketa kalibroinnin ensimmäisten 300 s:n aikana, normaalilla kaistalla (vähintään 90) poisvetoon asti, sitten laskien heikentyneen kaistan (vähintään 55) läpi epäluotettavalle kaistalle. Alhaalla: kunkin epookin kaista värillisenä nauhana nimineen. Pistemäärä on ohjeellinen. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC 61108, IEC 61162): käyttäjä vastaa edelleen aluksen navigoinnista. Loki on keksitty formaatin ja valvontojen esittelyyn; se ei ole mittaus eikä kerro mitään siitä, miten mikään vastaanotin toimisi." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Kaksi synteettistä häiriökarttapäivää, piirretty tietovarastoon tallennetuista näytteistä hakemistossa examples/interference-map/output, kummallakin oma synteettinen reittinsä ja moottorin raportoimat reitin altistumisosuudet. Vasemmalla ADS-B-päivä: 1 heikentynyt solu, 6 ei heikentynyttä, 4 arvioimatonta (vinoviivoitettu) ja solut ilman merkintää, piirretty tyhjinä, joita ei havaittu. Reitti on 525 km: pituudestaan 11.5% heikentyneissä soluissa, 38.3% ei heikentyneissä, 9.1% arvioimattomissa ja 41.1% havaitsemattomissa. Oikealla AIS-päivä: ympyrä- ja maallaolo-ilmaisimien liputtamat solut, ei-poikkeavat solut ja tyhjät solut; reitti on 454 km, josta 10.5% poikkeavissa soluissa, 21.2% ei poikkeavissa, 0.0% arvioimattomissa ja 68.3% havaitsemattomissa. ADS-B ja AIS ovat erilliset kerrokset, joita ei koskaan yhdistetä. Liputettu solu ei ole havainto häiriöstä, ja solua ilman väriä ei havaittu, mikä ei ole sama asia kuin selkeä. Kaikki data on keksittyä, avoimella keski-Atlantilla, eikä se ole mittaus." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Koulutusvirta skenaariosta coastal-drag-off (moottori v0.40.0, siemen 22, 25 minuuttia, kouluttajan lokissa yksi paikannus 10 s:n välein). Kartta näyttää aluksen todellisen reitin ja vastaanottimen ilmoittaman reitin: ne ovat yhtäpitäviä, kunnes käsikirjoitettu paikan poisveto alkaa hetkellä 421 s, jolloin ilmoitettu reitti erkanee todellisesta samalla, kun vastaanottimella on edelleen kelvollinen paikannus, ja se palaa takaisin tapahtuman päättyessä hetkellä 1140 s. Vieressä kahden reitin välinen etäisyys ajan funktiona sekä vastaanottimen ilmoittama keskimääräinen kantoaalto-kohinatiheys, joka nousee yhdelle korotetulle tasolle tapahtuman ajaksi. Kshanan tuottamaa synteettistä koulutusdataa. Vain koulutukseen ja testaukseen: älä koskaan syötä tätä virtaa aluksen käytössä oleviin navigointijärjestelmiin. Ohjeellinen, ei tyyppihyväksytty navigointilaite. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC 61108, IEC 61162): käyttäjä vastaa edelleen aluksen navigoinnista. Paikat, päivämäärät ja reitit ovat keksittyjä." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Todistepaketin rakenne. Vastaanotinloki (NMEA, u-blox UBX, RINEX 3 tai Android-loki) ja aikaikkuna menevät komentoon kshana receiver-trust evidence, joka kirjoittaa seitsemän tiedostoa: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig ja valinnainen timestamp.tsr. Manifesti tallentaa koko lokin ja jokaisen tiedoston SHA-256-tiivisteen sekä tiedostojen yli kulkevan tiivisteketjun; allekirjoitus kattaa manifestin. kshana evidence verify tarkistaa allekirjoituksen, jokaisen tiedoston tiivisteen, ketjun ja sen, ettei luettelon ulkopuolisia tiedostoja ole, ja päättyy koodilla 0, kun varmennus onnistui, 1, kun jokin epäonnistui, ja 3, kun allekirjoittajaa ei ollut kiinnitetty. Paketti on tekninen tallenne, ei oikeudellinen lausunto." width="100%">
</picture>

Kaikki neljä ovat keksittyä dataa ja ohjeellisia: ne näyttävät ohjelmiston formaatin ja toiminnan, eivät sitä, miten mikään vastaanotin tai järjestelmä suoriutuu häiriöitä vastaan. Aja ensimmäinen komennolla `kshana receiver-trust examples/maritime-trust/session.toml`, toinen komennolla `kshana route-exposure` hakemiston `examples/interference-map/` näytteillä, kolmas komennolla `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (vain koulutuskäyttöön: älä koskaan syötä sitä käytössä oleviin navigointilaitteisiin) ja neljäs kuten tiedostossa [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Koko ominaisuustaulukko alue alueelta</summary>

Koko alue alueelta -erittely seuraa; ominaisuuskohtainen kypsyyskirjanpito on tiedostoissa
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) ja [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Alue | Ominaisuus |
|--------|------------|
| **Rata ja geometria** | SGP4/SDP4-propagointi (validoitu 4.12 mm:n tarkkuuteen kaikkia 666 AIAA 2006-6753 -vektoria vasten); todelliset kaksirivielementit (tietovarastoon tallennettu, päivätty Celestrak `gps-ops` -tilannevedos) tai synteettiset Walker-delta-konstellaatiot, joiden keskielementit toteuttavat kaavan `i:T/P/F` alle 1 km:n tarkkuudella 24 h:n propagoinnissa; usean konstellaation näkyvyys, **tarkkuuden heikkenemiskerroin — geometrinen, paikka, vaaka, pysty ja aika (GDOP/PDOP/HDOP/VDOP/TDOP), validoitu tarkkuuteen 1e-6 kirjastoa gnss_lib_py 1.0.4, Stanford NAV Lab, vasten** (Navigation and Autonomous Vehicles Laboratory), sekä GNSS-käytettävyys; gradientiton konstellaatiosuunnittelun optimoija, streets-of-coverage-menetelmän satelliittien vähimmäismäärän mitoitus, usean konstellaation vertailutyökalu sekä Walker-**suunnittelupyyhkäisy**, joka taulukoi kattavuuden / PDOP:n / uudelleenkäyntiajan ratatasot × satelliitit -ruudukossa ja raportoi Pareto-optimaaliset suunnitelmat. |
| **Numeerinen propagaattori** | **Cowell**-tyyppinen numeerinen propagaattori (`src/propagator.rs`) analyyttisen SGP4/SDP4-polun täydennyksenä, hierarkkisella **seitsemän häiriön** voimamallilla (`src/forces.rs`): kahden kappaleen malli + koko **J2–J6-vyöhykekenttä** (Maan litistyneisyyden vyöhykeharmoniset kertoimet J2–J6; sen häiriöpotentiaalin tarkka analyyttinen gradientti), valinnainen **EGM2008-tesseraalinen palloharmoninen geopotentiaali asteeseen/kertalukuun 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; todelliset NGA:n — Yhdysvaltojen (US, United States) National Geospatial-Intelligence Agency — kertoimet, Holmes–Featherstonen normalisoitu Legendre-rekursio, ristiintarkistettu suljetun muodon Legendre-funktioita ja analyyttistä ∇V-identiteettiä vasten), **epookkiohjattu Auringon ja Kuun kolmannen kappaleen** painovoima (sisäänrakennettu matalan tarkkuuden efemeridi, ei DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel — -kerneliä), **säteilypaine** (kanuunankuulamalli kartiomaisella umbra+penumbra-varjolla), **ilmanvastus** (Valladon paloittain eksponentiaalinen tiheys, mukana pyörivä ilmakehä), **post-newtonilainen Schwarzschildin relativistinen korjaus** sekä **Lense–Thirring-kehyksenraahaus**-termi (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, lineaarinen Maan pyörimismäärän suhteen, ~1–2 kertaluokkaa Schwarzschildin alapuolella) — ohjattuna kahden adaptiivisen integraattorin valinnalla (RK4 — neljännen kertaluvun Runge–Kutta — askeleen kaksinkertaistuksella tai **Dormand–Prince RK5(4)** -upotettu pari). **Validoitu Orekit 12.2:ta vasten** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epookkia LEO- (matala Maan kiertorata) + GTO-radoilla (geostationaarinen siirtorata), konservatiivisten voimien tasot yhtäpitäviä pahimmillaan **\|Δr\| 0.08 m 24 h:n aikana** (`tests/numerical_cowell_propagator_reference.rs`); ilmanvastustaso karakterisoidaan erikseen (≈ 333 m / 24 h), ja absoluuttiset Auringon/Kuun efemeridi- ja tiheyssyötteet pysyvät rehellisesti **Modelled**-tasolla. Lisää sisäistä näyttöä (ei ulkoista validointia): häiriötön rata tarkistetaan tarkkaa universaalimuuttujaista Kepler-ratkaisua vasten **alle metrin tarkkuudella 24 h:n aikana**, energia/pyörimismäärä säilyvät tarkkuudella ~1e-9, ja kukin häiriö vastaa käsin johdettua suljetun muodon tunnusmerkkiä. |
| **Liikkeet ja lentoradan suunnittelu** | Impulsiiviset ΔV-solmut 6×6-kovarianssin propagoinnilla (ECI — Maakeskinen inertiaalinen — / LVLH — paikallinen pystysuora, paikallinen vaakasuora — toteutusvirheen koordinaatistot), äärellisen polton integrointi tarkistettuna suljetun muodon **Tsiolkovskin** rakettiyhtälöä vasten tarkkuudella < 0.01 %, **Izzo-2015**-tyyppinen yhden kierroksen **Lambert**-ratkaisija, tarkka universaalimuuttujainen **Kepler**-propagaattori sekä **porkchop**-pyyhkäisy (laukaisu × saapuminen) C3:lle (laukaisuenergia) / saapumisen V∞:lle JSON-muotoisena ääriviivaruudukkona — suorituskykysimuloinnin kerros GMAT/Orekitin yläpuolella, jossa jokainen Lambert-tulos kierrätetään kahden kappaleen totuutta vasten ja porkchopin minimi tarkistetaan analyyttistä Hohmannin alarajaa vasten. |
| **Aikajärjestelmät ja koordinaatistot** | IERS-karkaussekuntien **UTC / TAI / TT / UT1** -aika-asteikot (Coordinated Universal Time, International Atomic Time, Terrestrial Time sekä Maan pyörimiseen perustuva Universal Time 1), juliaanisen päivämäärän API (sovellusrajapinta), IAU-2000:n (International Astronomical Union) **Maan pyörimiskulma** (ERA), GMST-pohjainen (Greenwich Mean Sidereal Time) **TEME ↔ ECEF** (todellinen ekvaattori, keskimääräinen päiväntasaus ↔ Maakeskinen, Maahan kiinnitetty) WGS-84:n (World Geodetic System 1984) geodeettisin koordinaatistoin, IAU 2006 -prekessio (Fukushima–Williams), täysi **IAU 2000A/2000B -nutaatio**, IERS-**napaliike** sekä päiväntasauksesta riippumaton **CIO-pohjainen IAU 2006/2000A GCRS↔ITRS** -muunnos (CIO = Celestial Intermediate Origin) — kaikki validoitu **bitti bitiltä** SOFA/ERFA-vektoreita vasten ja **riippumattomasti ristiintarkistettu ANISEa vasten** (puhdas Rust-uudelleentoteutus NAIF/SPICEsta; NAIF = NASAn, Yhdysvaltain National Aeronautics and Space Administrationin, Navigation and Ancillary Information Facility): kshanan GCRS→ITRS ja ANISEn ITRF93 (International Terrestrial Reference Frame 1993) JPL:n tiedostosta `earth_latest_high_prec.bpc`, samat IERS:n Maan orientaatioparametrit syötettyinä molemmille, ovat yhtäpitäviä tarkkuudella **≤ 0.86 m maan pinnalla / ≤ 3.6 m GNSS-radalla** (enintään 0.028″) kahdeksassa epookissa 2020–2023. |
| **Inertia** | Kolmiakselinen strapdown-INS — kvaternioasento, WGS-84 NED (pohjoinen-itä-alas) -mekanisointi, coning/sculling-kompensointi sekä deterministinen IMU-virhemalli (skaalauskerroin, kohdistusvirhe, g-herkkyys, kvantisointi, ryömintä); **ensimmäisistä periaatteista lähtevä kylmien atomien interferometrikiihtyvyysanturi** (Mach–Zehnder-vaihe, kvanttiprojektiokohina, kontrastin heikkeneminen, värähtelykytkentä), joka *johtaa* nopeuden satunnaiskulun kertoimen; sekä sekventiaalisen tärkeysuudelleenotannan **partikkelisuodatin** kartta-avusteiseen (maasto-/painovoimaviitteiseen) GPS-vapaaseen navigointiin. |
| **Vaihtoehtoinen PNT (GPS-vapaa)** | Kylmien atomien **gravimetrin mittausmalli**, jonka valkoisen kohinan alaraja (`σ = ASD/√τ`, ASD = amplitudispektritiheys) johdetaan CAI-kiihtyvyysanturin fysiikasta; matala-asteinen, täysin normalisoitu **palloharmoninen painovoima-anomaliakenttä** (tarkistettu suljetun muodon Legendre-funktioita ja käsin johdettua yksitermistä anomaliaa vasten) sekä synteettiset maskonit; **painovoimafunktionaalien synteesiydin** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — "kartanlukija", jota vasten painovoima-avusteinen navigaattori sovittaa — on validoitu **GRS80:n normaalipainovoimastandardia** vasten (Geodetic Reference System 1980), toistaen suljetun muodon Somiglianan normaalipainovoiman ja julkaistut γ_e / γ_p tarkkuudella **3.5e-12** ja tuottaen fysikaalisesti rajatun häiriökartan todellisesta ICGEM:n (International Centre for Global Earth Models) **EGM2008**-kentästä (RMS — neliöllinen keskiarvo — ≈ 26 mGal, enintään ≈ 89 mGal asteella/kertaluvulla 70; `tests/icgem_gravity_reference.rs`); sekä **painovoimakartan sovituksen partikkelisuodatin**, joka palauttaa GPS-vapaan reitin läpilennetystä anomaliasarjasta. Se ulottuu **maastoviitteiseen navigointiin** (TERCOM/SITAN — maaston ääriviivasovitus / Sandia Inertial Terrain-Aided Navigation — SRTM:n (Shuttle Radar Topography Mission) `.hgt`-korkeusmallia (DEM) vasten, `src/altpnt/terrain.rs`), **IGRF-14-geomagneettiseen päämagneettikenttään** (14. sukupolven International Geomagnetic Reference Field) asteeseen/kertalukuun 13 (`src/igrf.rs`, tarkistettu kallistetun dipolin suljettua muotoa ja ∇V-differenssejä vasten) sekä **yhdistettyyn painovoima + magneetti + maasto** -navigaattoriin, joka yhdistää kaikki kolme skalaarikanavaa yhden partikkelisuodattimen kautta (informaatio on additiivista — mikään kanava ei huononna paikannusta). **60 minuutin GPS-vapaa vertailutesti** (~700 km / tunnin katko, jonka aikana inertiaratkaisu ajautuu ~70 km:iin) palautetaan **~145 m:iin (< 500 m)** hierarkkisella karkeasta hienoon -sovittajalla — ESA NAVISP:n (Navigation Innovation and Support Programme) *Quantum Wayfarer* -tavoite. |
| **Fuusio** | Löyhästi kytketty 15 tilan GNSS/INS-virhetila-EKF (laajennettu Kalman-suodatin) suljetun silmukan takaisinkytkennällä (`gnss-ins`-paketti); **tiukasti kytketty** pseudoetäisyyspäivitys, joka jatkaa korjaamista alle neljällä satelliitilla; kytketty **kello + paikka** -suodatin; yleinen **unscented (sigmapiste) Kalman** -estimaattori voimakkaasti epälineaarisille mittauksille; tiukasti kytketty GNSS/INS-**UKF-navigaattori** (pseudoetäisyys + Doppler), jonka voimamallipohjainen ratakulku on itsejohdonmukaisuustarkistettu tarkkuuteen **0.77 m RMS** 30 minuutin kaartuvalla LEO-ylilennolla, joka sisältää 120 sekunnin GNSS-katkon (suodattimen johdonmukaisuusluku, ei validointi ulkoista oraakkelia vasten — tämä navigaattori pysyy MODELLED-tasolla); sekä täysi **17 tilan tiukasti kytketty GNSS/INS-UKF** (paikka, nopeus, asentovirhe, kiihtyvyysanturin ja gyroskoopin biakset, kellon biasi ja ryömintä), jonka **kvantti-CAI-merkintälasku** kantaa 120 sekunnin katkon yli kylmien atomien kiihtyvyysanturin johdetulla nopeuden satunnaiskululla. |
| **Radanmääritys** | Ratatilan `[r, v]` palautus maa-asemien etäisyysseurannasta, yhdistäen kahden kappaleen + J2-voimamallin ja RK4-integraattorin **Gauss–Newton-erä**korjaimeen (`determine_orbit_batch`, alle metrin / mm·s⁻¹ kohinattomista etäisyyksistä, ~2 m 5 m:n kohinatasolla) sekä **sekventiaaliseen** unscented-suodatinmuunnelmaan (`determine_orbit_sequential`). |
| **Havaittavuus ja estimointiteoria** | Yleinen, uudelleenkäytettävä **Fisher-informaatio / Cramér–Rao** -kerros (`src/fim.rs`): informaatiomatriisi M = HᵀWH, **Cramér–Raon alaraja**, havaittavuuden **aste ja datumivajeen nolla-avaruus** (Moore–Penrosen pseudoinverssi) sekä **D/A/E/T-optimaaliset** koesuunnittelun skalaarit symmetrisestä Jacobi-ominaisarvoratkaisijasta. **Validoitu** — ominaisarvot vs `numpy.linalg.eigh`, CRLB-kovarianssi vs σ²(XᵀX)⁻¹ funktiolla `numpy.linalg.inv` sekä GNSS DOP informaatiomatriisista, kaikki yhtäpitäviä tarkkuudella **1e-9** (`tests/fim_observability_reference.rs`), ja lisäksi ristiintarkistettu **Kayn (1993)** suljetun muodon rajoja vasten Monte Carlo -CRLB:n saavuttamisella. Se on DOP-moottorin, passiivisen paikannuksen CRLB:n ja kuun absoluuttisen aseman **havaittavuuslauseen** (alla) perusta. |
| **Kuu ja cislunaarinen avaruus** | Maa–Kuu-järjestelmän **ympyrämäinen rajoitettu kolmen kappaleen (CR3BP)** propagaattori pyörivässä koordinaatistossa — säilyvä Jacobin vakio ja kaikki viisi Lagrangen pistettä (`src/cr3bp.rs`) — nyt **6×6-tilansiirtomatriisilla (STM) ja yhden ammunnan differentiaalikorjaimella** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`), joka tuottaa aidosti jaksollisia **halo / NRHO** -ratoja (lähes suoraviivainen halo-rata): STM on validoitu differenssejä vasten, korjatut radat sulkeutuvat konetarkkuuteen, ja julkaistun apoluna-tilan käyttäminen alkuarvona toistaa **L2:n eteläisen 9:2 NRHO:n** (L2 = Maa–Kuu-järjestelmän toinen Lagrangen piste; Gateway-rata) jaksolla ≈ 6.57 d / periluna ≈ 3,250 km, yhtäpitävästi julkaistujen arvojen ≈ 6.56 d / ≈ 3,370 km kanssa (CR3BP — ympyrämäinen, ilman Aurinkoa — -ratkaisu, **ei** validoitu todellista LANS:n (Lunar Augmented Navigation Service)/Gatewayn efemeridiä vasten; korjatun radan selenosentrinen MCI/MCMF-muunnos (kuukeskinen inertiaalinen / kuukeskinen, Kuuhun kiinnitetty) on jatkotyö); lisäksi **LunaNet / LNIS** (LunaNet Interoperability Specification) -cislunaarinen PNT-geometria (MCI↔MCMF-muunnos, selenografiset koordinaatit) **kuun etelänavan ARAIM**-ylilennolla, joka tuo rehellisesti esiin eheysvajeen: ~30 m:n σ_URE (käyttäjän etäisyysvirhe) nostaa suojaustason selvästi yli 50 m:n hälytysrajan (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); sekä **pintamajakoiden DOP-täydennys** (`src/lunar_beacon.rs`), joka osoittaa, miten muutama mitattu pinnan etäisyysmittausmajakka tuottaa ne matalan korkeuskulman ja laajan atsimuutin näkösäderivit, jotka pelkästään yläpuolisista ratakappaleista koostuvasta joukosta puuttuvat — romauttaen huonosti ehdollistetun etelänavan GDOP:n ja root-sum-square-virhebudjetin kautta toteutuneen paikkatarkkuuden metreinä (käyttäen uudelleen gnss_lib_py:llä validoitua DOP-ydintä ja ilmattoman horisontin näkyvyyden suljettua muotoa; tarkkuuden heikkenemiskertoimen analyysi on julkaistu artikkelissa [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Kuun PNT-kokonaisuus** | CR3BP-ytimen päälle rakennettu kuun/cislunaarisen avaruuden navigointikokonaisuus, kukin ajettava `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — sekulaarinen LTC/TCL − TT -nopeus (LTC = Lunar Coordinate Time; TCL = sen ranskankielinen muoto, Temps-Coordonnée Lunaire) omapotentiaalien erotuksesta + kineettisestä termistä, raportoituna julkaistun 56–59 µs/vrk -kaistan kanssa); geodeettinen **kuun VLBI**-viivehavaintosuure (very-long-baseline interferometry) (`lunar-vlbi`, `src/lunar_vlbi.rs` — Maan perusviivan lähikentän kahden etäisyyden erotuksen viive + nopeus, ristiintarkistettu saman koodikannan tasoaalto-Δ-DOR:ia (delta differential one-way ranging) vasten kaukokentän rajalla, osittaisderivaatat differensseillä varmennettu); **yhdistetty monitekniikkainen OD + kello** -eräestimaattori (`lunar-joint-od-clock`, `src/lunar_combination.rs` — Gauss–Newton-sovitus, joka yhdistää VLBI:n + kuun paikalliset etäisyydet + satelliittien väliset etäisyydet), jonka tuloksena on **Fisher-informaatioon perustuva havaittavuus**tulos: pelkkä sisäinen etäisyysmittaus jättää kuuden vapausasteen jäykän kappaleen **datumivajeen**, joten pinta-aseman *absoluuttinen* paikka on havaitsematon, kunnes lisätään sidos Maan koordinaatistoon — Maan perusviivan **VLBI**-viive *palauttaa* havaittavuuden harvalle konstellaatiolle ja *terävöittää* Cramér–Raon rajaa runsaalle, absoluuttisen datumin sulkeutuessa **kolmella** ei-kollineaarisella maa-asemalla (havaittavuustulos on julkaistu artikkelissa [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **koordinaatiston realisointi** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — 7-parametrinen Helmert-datumisovitus + IAU 2015 WGCCRE -orientaatiosidos — WGCCRE = IAU:n Working Group on Cartographic Coordinates and Rotational Elements); **Moonlight/LCNS-luokan palvelutilavuus**analyysi (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / kattavuus / käytettävyys + yleistetty kuun ARAIM HPL/VPL -verhokäyrä (vaaka-/pystysuuntainen suojaustaso), käyttäen uudelleen gnss_lib_py:llä validoitua DOP-ydintä ja LunaNetin σ_URE≈30 m -koneistoa); **kuun differentiaalinen PNT** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — kuun vastine differentiaaliselle GNSS:lle / satelliittipohjaiselle tukijärjestelmälle (SBAS): tarkka yhteismuotoisen kellovirheen kumoutuminen + ensimmäisen kertaluvun spatiaalinen dekorrelaatio perusviivan funktiona, käyttäen uudelleen DO-229E:n SBAS-suojaustasoa — DO-229E on RTCA:n (aiemmin Radio Technical Commission for Aeronautics) SBAS-vastaanottimien toiminnallisen vähimmäissuorituskyvyn standardi); sekä **LunaNet/IOAG-linjattu yhteentoimivuusvienti** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + kuun aika-asteikon edestakainen muunnos IAU 2015 -kuukoordinaatistossa, KIF-kääreeseen pakattuna). Osakohtaiset todistetasot ovat [varmennusmatriisissa](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, yhdistetty OD + kello -estimaattori, koordinaatiston realisointi ja palvelutilavuuden geometria ovat **VALIDATED** (kukin rivillään nimettyä riippumatonta oraakkelia vasten, kuten myös VLBI-viiveen ydinpolku); VLBI-havaintosuure, datumivajeen havaittavuustulos, differentiaalinen PNT ja yhteentoimivuusvienti ovat **MODELLED**. Parametrit ovat **havainnollistavia julkisista lähteistä peräisin olevia** arvoja — **ei** validoitu todellista VLBI-/Gateway-seurantaa vasten, **ei** sidoksissa mihinkään virastoon eikä minkään viraston hyväksymä, ei TRL- (teknologian valmiustaso) / heritage-väitettä. |
| **Syvä avaruus ja Marsin PNT** | Avoin **radiometrinen navigointimoottori**: iteratiivinen valon kulkuaika + **Shapiron** relativistinen viive, kaksi-/yksi-/kolmisuuntainen **Doppler ja etäisyys** (Moyerin kaksiosainen), koherentin transponderin käännössuhteet, regeneratiivinen/PN (pseudokohina) -etäisyysmittaus (CCSDS 414, pseudokohinaetäisyysmittauksen standardi) ja **Δ-DOR** taivaan tasossa (CCSDS 506, Delta-DOR-standardi), aurinkoplasma-/troposfääri-/ionosfääriväliaineineen; **CCSDS-TDM (503)** -seurantadataviestin jäsennys + tuottaminen; **reduced-dynamic neliöjuuri-informaatiosuodatin** (RTN — radiaalinen, poikittainen, normaali — empiiriset kiihtyvyydet + 3 tilan aluksen kello + Marsin ilmanvastus), joka tekee **Marsin matalan kiertoradan (LMO) radanmäärityksen tarkkuuteen ≈ 0.2 m** synteettisessä suljetussa silmukassa; yhdistetty **yksi- + kaksisuuntainen fuusio**estimaattori; monen kappaleen dynamiikkaydin (`Body{μ, re, zonals, gravity, IAU-pole}`, Marsin GMM-3-painovoima (Goddard Mars Model 3), IAU:n Marsiin kiinnitetty koordinaatisto, vaihdettava `EphemerisProvider`-rajapinta, kaksiosaiset juliaaniset päivämäärät + TT↔TDB (Barycentric Dynamical Time)); sekä **`mars-pnt`**-välitys-PNT-skenaario (MARCONI-areostationaarinen välityskonstellaatio) päästä päähän -**GSE-suorituskykysimulaattorilla** (GSE = maatukilaitteisto) (geometria → linkkibudjetti → havaintosuureet → SRIF → kovarianssi). **Simulaatiolla validoitu** (kovarianssi- / suljetun silmukan hyvyysluvut); Aurinko-keskinen Marsin dynamiikka on ristiintarkistettu JPL:n **DE440**:tä vasten (137 m @ 1 vrk:n kaari, `xval/anise-mars-od`). Validointi todellisella DSN/ESTRACK-seurantadatalla on tiekartalla. |
| **Aurinkokunta ja minkä tahansa kappaleen PNT** | Kernelitön **koko aurinkokunnan efemeridi** (`src/ephem.rs`, `src/ephem_provider.rs`): jokainen planeetta JPL:n **Standishin Kepler-elementeistä** (Taulukko 1, 1800–2050 jaa.; Taulukot 2a/2b, 3000 eaa.–3000 jaa.) kunkin planeetan julkaistulla nimellisvirheellä, Maa ja Kuu erotettuina kuusarjalla, sekä Phobos, Deimos, Io, Europa, Ganymedes, Kallisto ja Titan JPL:n keskielementeistä ja IAU:n (International Astronomical Union) pyörimismallista; **mikä tahansa kappale minkä tahansa toisen suhteen** ICRF:ssä (International Celestial Reference Frame). `Body` sisältää nyt **GM:n (gravitaatioparametri), säteet, J2:n (toinen vyöhykeharmoninen) silloin kun se on julkaistu sekä IAU:n navan ja nollameridiaanin kahdeksalletoista kappaleelle**. Laji **`solar-system`** raportoi paikat, nopeudet, vakiot, **valon kulkuajan ja yksi-/kaksisuuntaisen etäisyyden** minkä tahansa kahden kappaleen välillä (olemassa oleva radiometrinen valon kulkuajan ratkaisija Auringon Shapiro-viiveellä) sekä kunkin kappaleen ratajäljen — riittävästi interaktiivisen aurinkokunnan piirtämiseen; laji **`body-pnt`** paikantaa kiertolaisen tai laskeutujan **minkä tahansa kappaleen ympärillä** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) paikallisella Walker-konstellaatiolla, tarkkuuden heikkenemiskertoimen ja Gauss–Newton-koneiston avulla sekä syvän avaruuden etäisyydellä Maasta. **Validoitu** JPL Horizonsia vasten (DE441, JPL Development Ephemeris 441): Merkurius–Saturnus ja Maa taulukosta 1 kahden nimellisvirheen sisällä (pahin 1.87×), kaikki kahdeksan planeettaa taulukoista 2a/2b (pahin 1.71×) sekä Maa–Mars/Jupiter-valon kulkuaika. **Mallinnettu**: Uranus ja Neptunus taulukosta 1 (2.0× ja 5.2× ilmoitettu virhe DE441:tä vasten), Pluto, kuut ja `body-pnt`-navigointitulokset. |
| **Yhdistetty MEO + LEO PNT** | `src/leo_fusion/`: järjestelmäriippumaton LEO-paikannus, -navigointi ja -ajoitus minkä tahansa konstellaation (Walker-kuoret, elementtijoukot, GNSS-esiasetukset) ja minkä tahansa signaalin (kantoaalto, chip-nopeus, C/N0-verhokäyrä, signaalin etäisyysvirhe avaruudessa) yli, valinnaisin yhden tiedoston esiasetuksin lähteineen (Xona Pulsar X1/X5, Iridium STL, Starlinkin opportunistiset signaalit, CentiSpace, edustava C-kaistan järjestelmä, ATOMIC-nollakelloefemeridimalli). **`leo-pvt`**: erämuotoinen **Doppler-paikannus** etäisyyden muutosnopeudesta (yhden ja usean satelliitin, kellon ryöminnän ja nopeuden tilat, yhden ylilennon radan suuntainen/poikittainen geometria ja peilikuvaratkaisu), **yhdistetty GNSS + LEO -painotettu pienimmän neliösumman menetelmä** järjestelmäkohtaisin järjestelmien välisin biaksin ja kutsujan antamin signaalikohtaisin sigmoin, DOP LEO-satelliittien määrän funktiona, **napa- ja arktinen** kattavuus sekä **LEO-aikasiirto UTC:hen** C/N0:n ja oskillaattorin funktiona. **`leo-ppp`**: liukulukuinen PPP-EKF (tarkka pistepaikannus; laajennettu Kalman-suodatin) pelkällä GNSS:llä ja LEO:n kanssa, sen konvergenssiaika ja khiin neliön NEES-johdonmukaisuustesti. **`ntn-positioning`**: 5G:n ei-maanpäällisen verkon paikannus kaistanleveyden Cramér-Rao-rajasta. **Validoitu**: LEO:n Doppler-verhokäyrä julkaistuja Iridium- ja Xona-lukuja vasten. **Mallinnettu**: loput, PPP-trendi verrattuna lähteeseen Li et al. (2019) — katso [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Eheys** | Snapshot- ja ratkaisujen erotteluun perustuva (ARAIM-tyylinen) RAIM — vastaanottimen autonominen eheysvalvonta — vaaka-/pystysuuntaisin suojaustasoin (HPL/VPL), vian havaitseminen ja poissulkeminen sekä Stanfordin eheyskaaviot; eksplisiittinen eheysriskibudjettiin perustuva **monihypoteesinen ratkaisujen erottelu (MHSS)** -suojaustaso, mukaan lukien **kaksi-/monikonstellaatioinen koko konstellaation vikatila** (EU:n (Euroopan unioni) ARAIM / DO-316, RTCA:n suorituskykystandardi ilma-alusperusteisella tuella varustetuille GPS-ilmailulaitteille), sovellettuna todelliseen GPS + Galileo -snapshotiin (`scenarios/araim-gps-galileo.toml`). Suojaustaso soveltaa yksipuolista **nimellisbiaksen** projektiota `b_k = Σ_i|s_i|·b_nom` vikatilaa kohden sekä **eheys**sigmaa σ_URA (käyttäjän etäisyystarkkuus; eri asia kuin tarkkuussigma σ_URE, käyttäjän etäisyysvirhe) Integrity Support Messagesta — katso [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Havaitsemisydin (χ²/epäkeskinen-χ²/normaalijakauman kynnykset ja K-kertoimet) on **ulkoisesti validoitu SciPyä vasten** 171 tapauksessa (`tests/raim_reference.rs`); geometria käyttää uudelleen gnss_lib_py:llä validoitua DOP-ydintä. ARAIM MHSS:n eheysriskin *budjetin jakamiselle* itselleen ei ole julkaistua numeerista oraakkelia, ja se pysyy rehellisesti mallinnettuna. |
| **Tukijärjestelmät (SBAS)** | **SBAS / WAAS -suojaustasot** (WAAS = Wide Area Augmentation System) DO-229E:n painotetun pienimmän neliösumman muodossa (tarkkuuslähestymisen ja reittilennon K-kertoimet) sekä **L1/L5-kaksitaajuinen ionosfäärivapaa** yhdistelmä (L1 ja L5 ovat kaksi GPS:n siviilisignaalikaistaa; IS-GPS-705, GPS:n L5-signaalin rajapintaspesifikaatio, γ₁₅ ≈ 1.793), joka on DO-316:n perusta — `src/sbas.rs`. Suojaustasoalgoritmi on **ulkoisesti validoitu RTKLIB SBAS-PL -haaraa vasten** (RTKLIB = avoin reaaliaikaisen kinemaattisen paikannuksen kirjasto; PL = suojaustaso) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — DO-229:n edellinen versio — App. J) ajettuna **todellisella EGNOS-datalla** (European Geostationary Navigation Overlay Service), toistaen sen HPL:n tarkkuudella < 2e-3 m (`tests/sbas_reference.rs`); gLAB (GNSS Laboratory -työkalukokonaisuus) v6.0.0 vahvisti identtisen konvention. |
| **Kello ja ajoitus** | Kahden tilan Kalman-holdover (Josephin muodon kovarianssi, NIS/NEES — normalisoidun innovaation neliö / normalisoidun estimointivirheen neliö — johdonmukaisuuden terveys); Allan-perheen stabiilius (ADEV / MDEV / TDEV / HDEV / MTIE — Allan-, modifioitu Allan-, aika- ja Hadamard-hajonta sekä suurin aikavälivirhe) kohinatyyppikohtaisin luottamusvälein ja täysi **IEEE-1139:n viiden kertoimen potenssilakisovitus** (IEEE Std 1139, Institute of Electrical and Electronics Engineersin taajuus- ja aikametrologian määritelmät) — estimaattorit on validoitu todellisella laitteistolla **Stable32:ta** vasten: **todellinen 5071A-cesium-primäärinormaali vs vetymaser** (556,990 vaihenäytettä, 16 keskiarvostuskerrointa, OADEV/OHDEV — limittäinen Allan-/Hadamard-hajonta — tarkkuuteen 1e-3; `tests/cs5071a_reference.rs`) sekä **kanoninen Stable32 PHASE.DAT** -regressiosarja (139 keskiarvostuskerrointa, OADEV/MDEV/TDEV tarkkuuteen 1e-3; `tests/phasedat_reference.rs`); ADEV/MDEV/TDEV-estimaattorit ja tietoliikenteen **MTIE**-vaellusmittari on lisäksi ristiintarkistettu **riippumatonta allantools 2024.06** -kirjastoa vasten tarkkuuteen **< 1e-9** NIST SP 1065 -sarjalla (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geometriset korjaukset (Sagnac, GNSS common-view); sekä operatiiviset siirtomenetelmät — **TWSTFT** (kaksisuuntainen satelliittiaika- ja taajuussiirto) BIPM:n (International Bureau of Weights and Measures) Sagnac-suljetulla muodolla, **GNSS common-view**, **PPP**-perusteinen (tarkka pistepaikannus) ionosfäärivapaa aikasiirto, vapaan tilan **optinen** linkki turbulenssin tuikkeineen sekä käänteisvarianssipainotettu **kelloryhmän (paperi)aikaskaala** parhaan osallistuvan kellon alapuolella. **GNSS-vapaan kellon holdover-laskin** (`src/holdover.rs`) esittää suljetun muodon van Loan -kulkuvirheen kasvun *holdover kynnykseen* -inversiona — kuinka kauan kello käy vapaasti ennen kuin sen ajoitusvirhe ylittää budjetin — edustavissa klassisissa ja kvanttikelloluokissa; **mallinnettu** (ristiintarkistettu monivaiheista `clock_state`-kovarianssirekursiota vasten), ja rehellinen siitä, että hyvin stabiilille kellolle holdover tiukkaan kynnykseen määräytyy *oletetusta* pitkän tau:n kohinatasosta, ei mainitusta ADEV:sta. **Ehdollinen ajoituksen suojaustaso** (`src/tpl.rs`) laajentaa holdoverin harhautukseen: raja *havaitsemattomalle* aikavirheelle riippumattoman ristiintarkistuksen ollessa käytössä, koostuen k-sigma-valvonnan alarajasta, van Loan -kulkuvarianssista havaitsemisviiveen yli ja CUSUM-pohjaisesta (kumulatiivinen summa) hälytysajasta. Kalibroitu todellisella tallennetulla harhautuksella (JammerTest 2024) ja toistettavissa komennolla `cargo run --example tpl_jammertest`; **MODELLED**-koostumus (ei tuntikohtaista eheysriskibudjettia), ehdollinen havaitsemiselle — äärellistä *ehdotonta* rajaa ei ole. |
| **GNSS-mittausalue** | Eteenpäin suuntautuva pseudoetäisyys- / Doppler-synteesi **Klobuchar**- (yleislähetys) ja **IONEX / TEC-ruudukko** -ionosfäärillä (IONosphere map EXchange -formaatti / elektronien kokonaismäärä; mitattu) — mukaan lukien IONEX-tiedostojen jäsennin, aikainterpolointi karttojen välillä ja ohuen kuoren vinousmuunnos — **Saastamoinen + Niell** -troposfääri sekä snapshot-RAIM (HPL/VPL). |
| **Häiriönsietokyky** | Linkkibudjettiin perustuva **häirintä** (J/S → efektiivinen C/N₀ → lukituksen menetys — häiritsin-signaali-suhde, kantoaalto-kohinatiheyssuhde — häirinnänestokyvyn spektrierottelukertoimen `Q` ollessa nyt **johdettu todellisista signaalin ja häiritsimen tehospektreistä** moduulin `src/navsignal.rs` kautta — `Q = 1/(R_c·κ)`, ristiintarkistettu CI:ssä aiempaa edustavaa vakiota vasten); stokastinen **aikaharhautuksen ilmaisin** (Neyman–Pearson / χ²₁-energiatesti suljetun muodon ja Monte Carlo -P_fa/P_md:n kera sekä turvallisuuden hyvyysluku (FoM) 1 − P_md); **monikerroksinen harhautusilmaisin**, joka yhdistää RAIM-johdonmukaisuuden pariteettitestin (yhteismuotoinen sokea piste rehellisesti mallinnettuna), RF:n AGC-tehovalvonnan (automaattinen vahvistuksen säätö) ja signaalinlaatuvalvonnan (SQM — signaalinlaadun valvonta, early-minus-late); sekä **kvantti-inertiaalisen merkintälaskun virhebudjetti** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`), joka yhdistää kylmien atomien interferometrin valkoisen kohinan nopeuden satunnaiskulun jäännösbiakseen (ristiintarkistettu riippumatonta `AccelModel`-integraattoria vasten) ja skaalauskerroinvirheeseen paikan ryömintäluvuksi holdoverin aikana — kellon holdoverin inertiaalinen vastine. **Viitekehykseen linjattu häiriönsietokyvyn pisteytysmoottori** (`src/resilience/`) kuvaa arkkitehtuurin simuloidun käyttäytymisen ulottuvuuskohtaisiksi osapisteiksi Kshanan omissa seitsemässä häiriönsietokyvyn luokassa (ei DHS:n termejä), linjattuna Yhdysvaltain sisäisen turvallisuuden ministeriön Resilient PNT Conformance Frameworkiin, ja tutkii sitten minkä tahansa yksittäisen yhdistelmäpistemäärän tai kypsyystason **päätösvakautta** Dirichlet-painotussimpleksin ja viiden uhan joukon alla — Kendallin τ -järjestyksen epävakaus, parhaan vaihtumistiheys ja yhteismuotoinen **monimuotoisuuden romahdus** (Hill-N2), eheystiivisteellä varustetun varmuusraportin kera (35 käsin johdettua oraakkelitestiä). Toistettavissa komennolla `cargo run --example resilience_report`; **MODELLED** synteettiset arkkitehtuurit, RPCF v2.0:aan linjattu itsearviointi, **ei** sertifiointi. Katso [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Passiivinen RF-paikannus** | **TDOA/FDOA-lähettimen paikannus** (saapumisajan/-taajuuden erotus; `src/geolocation.rs`) — häiritsimen tai harhauttimen (tai käänteisen PNT:n opportunistisen lähteen) paikantaminen vastaanotinverkon **saapumisaikaeron** hyperboloideista Gauss–Newtonin pienimmän neliösumman menetelmällä ratkaistuna; **saapumistaajuuseron** lisääminen liikkuvilla vastaanottimilla palauttaa yhdessä lähettimen paikan *ja* nopeuden, paikan kovarianssin **Cramér–Rao**-rajan ollessa johdettu verkon geometriasta. **MODELLED** (sisäisen johdonmukaisuuden oraakkelit: eteenpäin→käänteinen-edestakaiset muunnokset, J·CRLB = I -identiteetti, GDOP:n monotonisuus ja estimaattorin oman CRLB:nsä saavuttaminen Monte Carlossa) — pistelähteen näköyhteysmalli, ei monitie- / NLOS- (ei näköyhteyttä), vastaanottimen kellobias- eikä taittumistermejä. |
| **Navigointisignaali ja koodinseuranta** | **Signaalitaso** linkkibudjetin ja mittausalueen välissä (`src/navsignal.rs`): yksikköpinta-alaiset **tehospektritiheydet** (PSD) **BPSK-R(n)**:lle (binäärinen vaiheavainnus suorakulmaisin chipein) ja **sine-BOC(m,n)**:lle (binary offset carrier); **spektrierottelukerroin** (SSC) κ = ∫ G_s·G_i df, joka **johtaa häirintämallin käyttämän häirinnänestokyvyn `Q`:n** (`Q = 1/(R_c·κ)`) todellisista signaalin/häiritsimen spektreistä edustavan vakion sijaan; **RMS- (Gabor-) kaistanleveys** (BOC > BPSK — etäisyysinformaation / Cramér–Raon mitta); **koherentin early–late-DLL:n koodinseurannan lämpökohinavärinä** (DLL = viivelukittu silmukka; Kaplan & Hegarty; ~alle metrin C/A:lle — GPS:n karkea/hankintakoodi — arvolla 45 dB-Hz); sekä **monitievirheen verhokäyrä** (koherentti EML, early-minus-late — kapean korrelaattorin vaimennus). Validoitu suljetun muodon ankkureita vasten (BPSK:n oma SSC = 2/(3·R_c), yksikköpinta-alaiset PSD:t, alle metrin C/A-värinä). Tämä on signaalin **suorituskyvyn** analyysia, **ei** antenni- / RF-hyötykuormalaitteiston suunnittelua (hyötykuormakumppanin tehtävä). |
| **Yhteentoimivuus** | **RINEX-3**-monijärjestelmäisen GNSS:n yleislähetysefemeridien sisäänluku (GPS, Galileo, QZSS — Japanin Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — keskikorkea Maan kiertorata / kalteva geosynkroninen rata — IS-GPS-200:n, GPS:n rajapintaspesifikaation, kautta; GLONASS, Venäjän Global Navigation Satellite System, PZ-90:n — venäläinen Parametry Zemli 1990 -datumi — tilavektori-RK4:llä) käytettävissä konstellaatiolähteenä (RINEX sisään, PNT-geometria ulos); **RINEX-3**-havaintojäsennin (pseudoetäisyys, kantoaallon vaihe, Doppler, signaalin voimakkuus; 4.00-havaintorakenteen odotetaan jäsentyvän mutta sitä ei ole testattu, ja RINEX 4 -navigointitiedostot hylätään nimeltä sen sijaan, että ne dekoodattaisiin väärin), joka nyt **syöttää yhden pisteen paikannuksen (SPP) ratkaisijaa** (`pvt`) — todelliset koodihavainnot sisään, todellinen **vastaanottimen paikka** ulos, validoitu IGS-datalla; **SP3-c/d**-tarkkaefemeridien lukija/kirjoittaja 9. asteen Lagrange-interpoloinnilla; **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) -vienti lentodynamiikkatyökaluille (GMAT, Orekit, STK — Systems Tool Kit); sekä **CCSDS-TDM (503)** -seurantadataviestin jäsennys + tuottaminen syvän avaruuden radiometriseen seurantaan. |
| **Tehtäväanalyysi (järjestelmäsuunnittelu)** | Ensimmäisen kertaluvun tehtäväsuunnittelun budjetit, kukin ajettava laji: kahden kappaleen **laukaisun ja nousun geometria** (`launch-window` — laukaisuatsimuutti `sin Az = cos i/cos lat`, pienin inklinaatio, Maan pyörimisen tuoma etu, dogleg-ratatason muutoksen Δv, päivittäiset laukaisumahdollisuudet; `src/launch.rs`); **Allen–Eggersin ballistinen paluukäytävä** (`reentry` — suurin hidastuvuus, suurimman g:n nopeus/korkeus, suurimman kuumenemisen nopeus; `src/reentry.rs`); **Maan havainnoinnin kattavuusgeometria** (`eo-coverage` — keilan leveys / nadiirin GSD (maanäytteen etäisyys) / nadiirista poikkeava pääsy / uudelleenkäynti SMAD:n (*Space Mission Analysis and Design*) avaruuskolmion kautta; `src/eo_payload.rs`); **3-DOF-asento- ja osoitusvirhebudjetti** (kolme vapausastetta; `attitude-budget` — pahimman tapauksen gravitaatiogradienttimomentti + RSS- (neliösumman neliöjuuri) osoitusbudjetti; `src/attitude_budget.rs`); **maa-asemaylilentojen ennustus** (`passes` — AOS/TCA/LOS, signaalin saanti / lähimmän ohituksen hetki / signaalin menetys, suurin korkeuskulma, yhteysaika; `src/passes.rs`); sekä **yksisuuntainen linkkibudjetti** CCSDS 401 / DSN 810-005 -linkkiyhtälön mukaan (CCSDS:n radiotaajuus- ja modulaatiostandardi / Deep Space Networkin linkkisuunnittelun käsikirja; `link-budget` — FSPL (vapaan tilan vaimennus), C/N₀, Eb/N₀ (bittienergian ja kohinatiheyden suhde), marginaali, linkin sulkeutuminen; `src/linkbudget.rs`). **MODELLED** ensimmäisen kertaluvun analyyttiset budjetit — laitteistoa edeltävä kerros STK/GMAT/Basiliskin alapuolella, ei 6-DoF- eikä radiometrinen korvike. |
| **Päätösanalyysi ja kompromissit (MCDA)** | Täysi **monitavoitteisen päätösanalyysin** (MCDA) kokonaisuus (`src/mcda/`), joka kattaa kaikki neljä menetelmäperhettä — arvojen aggregointi (**WSM**, **WPM**, **WASPAS** — painotettu summamalli, painotettu tulomalli, painotettu aggregoitu summa-tuloarviointi), etäisyys ideaaliin (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), kompromissiohjelmointi (**VIKOR**, serbiankielisestä nimestä monitavoiteoptimoinnille ja kompromissiratkaisulle) ja etusijamenetelmät (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, ranskankielisestä nimestä todellisuutta ilmaisevalle eliminoinnille ja valinnalle), sekä suhdejärjestelmä **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) ja suhteellinen **COPRAS** (Complex Proportional Assessment) — **AHP**:n (Analytic Hierarchy Process) parivertailuun perustuvalla prioriteettipainotuksella (Consistency Ratio), **Pareto**-ei-dominoidulla rintamalla, painojen **herkkyys**analyysilla ja moniattribuuttisella **hyöty**pisteytyksellä. Yhdeksän aggregoijaa toistavat riippumattomat kolmannen osapuolen kirjastot **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) ja **pyDecision** (ELECTRE I, COPRAS) tarkkuudella **< 1e-9**, ja AHP:n prioriteettivektori + Consistency Ratio vastaavat Saatyn Random-Index-taulukkoa ja SciPy/LAPACK-pääominaisarvoratkaisijaa tarkkuudella < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — kompromissitutkimusmoottorin alla oleva päätöskerros. |
| **Avaruusympäristö** | **Avaruussään ympäristömalli** (`space-weather`, `src/space_weather.rs`): auringon (F10.7 / keskitetty 81 vuorokauden F10.7a — 10.7 cm:n auringon radiovuo) ja geomagneettiset (Kp, planetaarinen K-indeksi, määritelmänmukaisella Kp↔ap-taulukolla — ap on sen lineaarinen planetaarinen amplitudi) aktiivisuusindeksit, niiden ohjaama **Jacchia-1971**-eksosfäärilämpötila (validoitu julkaistuja auringon minimi-/keski-/maksimiarvoja vasten) sekä aktiivisuuskorjattu vs staattinen termosfäärin neutraalitiheys korkeudella — auringon syklin tiheysriippuvuus, jonka staattinen USSA76-ilmakehä (US Standard Atmosphere 1976) jättää pois. **MODELLED**: kalibroitu ensimmäisen kertaluvun skaalakorkeuskytkentä, **ei** datalla validoitu (NRLMSISE — US Naval Research Laboratoryn Mass Spectrometer and Incoherent Scatter Radar Exosphere -malli) ilmakehä. |
| **Tekoäly/ML-arviointi ja kompromissit** | **RF-heikennysten havaitsemisen arviointitestialusta** (`impairment-eval`, `src/impairment_eval.rs`): merkitty, parametreihin perustuva **synteettinen** aineisto (normaali / häirintä / ajan harhautus / paikan harhautus / monitie), ilmaisimesta riippumaton **ROC/AUC** (receiver operating characteristic / käyrän alle jäävä pinta-ala) -kehys, joka pisteyttää minkä tahansa ilmaisimen (energy \| agc \| sqm \| parity \| fused) luokkakohtaisella Pd:llä (havaitsemistodennäköisyys) tavoite-Pfa:lla (väärän hälytyksen todennäköisyys), sekä jakauman sisäinen vs ulkoinen **optimismivaje** (jakaumasiirtymätila). Lisäksi **kvantti- vs klassinen PNT -kompromissi** (`quantum-trade`, `src/quantum_trade.rs`), joka kvantifioi ehdokaskellon ajoitus-/inertiaalisen holdover-hyödyn **mitatusta ADEV**-käyrästä klassista lähtötasoa vasten, pitkän τ:n alarajan varauman kulkiessa artefaktin mukana, sekä GNSS-vapaan häiriönsietokyvyn aikaverhokäyrä. Arvioinnin **mittarit** (AUC / sekaannus / Pd-Pmd, Pmd on havaitsematta jäämisen todennäköisyys) on **validoitu täsmälleen vastaaviksi scikit-learn 1.9.0:aa vasten** — myös **todellisella ESA OPS-SAT -telemetrialla** (OPSSAT-AD-poikkeamanhavaitsemisaineisto, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), jossa Kshanan Mann–Whitney ROC AUC toistaa scikit-learnin `roc_auc_score`-arvon tarkkuudella < 1e-9 erillisellä testijaolla ja läpinäkyvä huippujen laskentaan perustuva ilmaisin erottaa merkityt poikkeamat AUC-arvolla ≈ 0.85 (`tests/opssat_ad_reference.rs`) — ja kompromissimoottorin numeeriset **ytimet** (ADEV NNLS — ei-negatiivinen pienimmän neliösumman — sovitus, χ²-johdonmukaisuuskaistat, van Loan -kellon Q) **scipy 1.17.1:tä vasten**; niiden päälle rakennetut laitehyötyluvut pysyvät **MODELLED**-toimintaominaisuuksina — eivät koskaan kenttä-/IQ-dataa (samanvaihe-/kvadratuurinäytteet), ei hyvä/huono-tuomiota. Testialustan pohjalta syvempi **optimismivajetutkimus** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) pisteyttää **13 ilmaisimen** paneelin (energy/AGC/SQM/parity sekä siemennetyt logistinen regressio- ja yhden piilokerroksen MLP- — monikerroksinen perseptroni — ilmaisimet), sovittaa jakauman sisäiset vs ulkoiset **skaalauslait** permutaationollahypoteesilla ja oppii **leave-one-out-ennustimen** jakauman ulkoiselle heikkenemiselle jakauman sisäisistä tilastoista (`cargo run --example optimism_study`). **Ohjelmistoradiovastaanottimen etupää** (`src/sdr.rs` — raaka IQ/IF (välitaajuus) → korrelaattorin early/prompt/late-haarat → SQM) ja **todellisen datan sisäänlukusovittimet** (`src/realdata/` — RINEX, u-blox UBX (u-bloxin binääriprotokolla), GnssLogger, JammerTest, Yunnan, SatGrid) antavat samojen ilmaisimien toimia paikallisesti toimitetuilla tallenteilla (aineistoja ei ole tallennettu tietovarastoon). **Kvantti- vs klassinen häiriönsietokyvyn risteyskartta** parametriepävarmuuden alla (`src/crossover.rs`; `cargo run --bin crossover_study`) tuottaa uudelleen Tulokset-kuvien taustalla olevat inertia- ja kelloristeystutkimukset. |
| **Kvanttipohjaisen PNT:n demonstraattori** | Kolme ajettavaa, **MODELLED**-tason sovellusaluetta avoimen moottorin takana, kukin tuottaen rehellisen `TradeEvidence`-tietueen + edustavuus- / lentoon-puuttuvat-aukot-tietueen (`src/representativeness.rs`): **luotettu kvanttiaikasiirto** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — päästä päähän -budjetti optisen hilakellon + fotonisen linkin vs CSAC:n (sirukokoinen atomikello) + RF:n kaksisuuntaisen siirron välillä, uudelleenkäytetyllä ajoituksen suojaustasolla, viive-/toistohyökkäyksen turvallisuus-FoM:lla (1 − P_md) sekä kellopoikkeamien havaitsemisella + CUSUM-viiveellä); **GNSS-vapaa kvanttinavigointi** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — kylmien atomien interferometrin inertiaalinen kulku vs navigointiluokan INS GNSS-katkon yli, rehellinen siitä, että ilman ulkoista paikannusta kiihtyvyysanturin biasi on havaitsematon, joten virhe kasvaa silti); sekä kvanttijärjestelmän **vikojen/poikkeamien havaitseminen** (`quantum-anomaly-detect`, `src/quantum_faults.rs` — merkitty vikaluettelo bootstrap-CI- (luottamusväli) ROC AUC:lla ulkoisesti validoidusta `eval_stats`-moduulista sekä pienin havaittava vika kiinteällä väärien hälytysten tasolla). Yhteinen **kvanttilaitteiden virhemallikirjasto** (`src/quantum_devices.rs`) ja yhtenäinen **kvantti- vs klassinen kompromissikehys** (`src/qtrade.rs`) ovat niiden perusta. Niiden käyttämät validoidut ytimet (arviointimittarit vs scikit-learn, kompromissiytimet vs scipy) käytetään uudelleen; niiden päälle rakennetut laitehyötyluvut pysyvät **MODELLED**-tasolla — **havainnollistavat julkisista lähteistä peräisin olevat** laite-/linkkiparametrit, mallintaa *luokkaa*, ei TRL- / lentoheritage- / sertifiointiväitettä, ei viraston hyväksyntää. |
| **Säästeliäs suunnittelu ja eheysvaikutus** | **Kattavuuskohtaisen kustannuksen ROI**-näkökulma (sijoitetun pääoman tuotto) (`src/frugal.rs`) — kustannus toimitettua kattavuusyksikköä kohden arkkitehtuurivertailussa — sekä **havaitsematta jäänti → eheysvaikutus** -kuvaus (`src/integrity_impact.rs`), joka muuntaa valvonnan havaitsematta jäämisen tason sen eheysriskiosuudeksi. **MODELLED** päätöksenteon tuen budjetit, additiivisia. |
| **Artefaktien vaihto** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — versioitu, itsensä kuvaava kääre, joka sisältää skenaarion tuloksen lajeineen, skeemaversioineen ja MODELLED/VALIDATED-merkintöineen, jotta tallennettu artefakti pysyy itsedokumentoivana ja vanhemmat kääreet pysyvät eteenpäin yhteensopivasti luettavina. |

Kukin ominaisuus on käytettävissä Rust-rajapintana, ajettavana skenaarion `kind`-lajina tai molempina.
Ominaisuuskohtainen kypsyys — *validated*, *runnable* tai *library* — seurataan tiedostossa
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). **Koneellisesti tarkistettu varmennusmatriisi**
(`src/verification.rs`) tuottaa vaatimus → moduuli → testi → oraakkeli → tila
-ristiviittauksen yksikkötestatuin rehellisyysinvariantein, jotka sallivat *validated*-merkinnän
vain silloin, kun riippumaton **ulkoinen** oraakkeli tukee sitä — ja jotka kirjaavat
ne laitteisto-/PA- (tuotevarmistus) ominaisuudet, joita Kshana tarkoituksella **ei** tarjoa.

</details>

<details>
<summary>Neljä anturipakettia, sellaisina kuin ne ensin julkaistiin (tulokset)</summary>

### Tulokset

Kukin skenaario vertaa kvanttianturia sen klassiseen vastineeseen
~1.8 h:n GNSS-katkon läpi. Luvut ovat toistettavia (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Mitä kvanttianturit tuovat, kun GNSS on poissa, kellon holdover -skenaario: kvantti pitää 6600 s autonomiaa vs 2610 s klassinen, paljon pienempi ajoitusvirhe sekä käytettävyys 100% vs 95.6%" width="88%">
  <br><sub>Mitä kvanttianturit tuovat, kun GNSS on poissa — <code>clock-holdover</code> · siemen 42 · piirretty moottorilla 0.40.0, ja jokainen yllä oleva luku tarkistetaan uudelleen nykyistä moottoria vasten jokaisessa käännöksessä testillä <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Etu **riippuu katkosta ja värähtelystä**, ja siinä on eksplisiittinen tasapistee, jossa klassinen voittaa — esitetty rehellisesti koko teknologisen valmiuden portaikon yli (optisen kellon luvut ovat maassa toimivien demonstraattoreiden tavoitteita; yksikään strontium-optinen kello ei ole lentänyt):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Kvantti- vs klassisen kellon holdoverin risteys teknologisen valmiuden portaikon yli luottamuskaistoineen" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Kvantti- vs klassisen inertian edun lämpökartta katkon keston ja värähtelyn funktiona, tasapistekäyrällä, jossa klassinen voittaa" width="96%">
  <br><sub>Kvantti- vs klassinen häiriönsietokyvyn risteys — kellon holdoverin TRL-portaikko (ylhäällä) · inertiaedun kartta tasapistekäyrineen (alhaalla). Tuotettavissa uudelleen komennolla <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Inertiaalinen merkintälasku: paikkavirhe GNSS-katkon aikana — kvanttianturi (kylmät atomit) pysyy lähellä spesifikaatioviivaa, kun taas navigointiluokan anturi erkanee kymmeniin kilometreihin" width="80%">
  <br><em>Merkintälaskun paikkavirhe GNSS-katkon aikana: kvanttianturi (sininen)
  pysyy tasaisena lähellä spesifikaatiota; klassinen anturi (punainen) erkanee kymmeniin kilometreihin.
  Kshanan tuottama skenaariosta <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Paketti | Skenaario | Kvantti | Klassinen |
|------|----------|---------|-----------|
| **1 — Kellon holdover** | `clock-holdover.toml` (20 ns:n spesifikaatio) | optinen kello kestää koko katkon | CSAC ylittää spesifikaation kesken katkon |
| **2 — Inertiaalinen merkintälasku** | `imu-deadreckoning.toml` (100 m:n spesifikaatio) | kylmät atomit: **~41 m**, kestää koko katkon | navigointiluokka: ylittää **~350 s:ssa** → kymmeniä km |
| **3 — Aikasiirto** (optinen satelliittien välinen linkki) | `timetransfer.toml` | optinen: **~0.3 mm** etäisyysmittaus | RF (TWSTFT): **~150 mm** etäisyysmittaus |
| **4 — Hybridifuusio** (huipennus) | `hybrid-pnt.toml` | täysi paikka+ajoitus koko katkon ajan | **paikka rajoittuu ~350 s:ssa** |

Huipennus osoittaa fuusiotesin: optinen satelliittien välinen aikasiirto pitää jopa
klassisen *kellon* lukittuna, jolloin *inertia*anturi erottuu klassisen kokonaisuuden
heikoimmaksi lenkiksi — eli kvantti-inertia + optinen ajoitus yhdessä.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Kellon holdover: vaihevirhe GNSS-katkon aikana — optinen kello pysyy 20 ns:n spesifikaation sisällä koko katkon ajan, kun taas sirukokoinen kello ylittää sen kesken katkon" width="80%">
  <br><em>Kellon holdover GNSS-katkon läpi: optinen kello (sininen) pysyy
  20 ns:n spesifikaation sisällä koko kulun ajan; sirukokoinen kello (punainen) ylittää sen puolivälissä.
  Kshanan tuottama skenaariosta <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Lisäskenaario, `orbit-gnss-challenged.toml`, johtaa GNSS-käytettävyyden
**ratageometriasta** käsin laadittujen ikkunoiden sijaan: GNSS-kuoren sisällä oleva
avaruusalus propagoidaan GPS:n kaltaista Walker-konstellaatiota vasten, ja näkyvien satelliittien
määrä (näköyhteys, Maan peittävyys, korkeuskulmamaski) määrää paikannuksen tilan kullakin
askeleella. Vuorokauden aikana käyttäjällä on paikannus vain ~59% ajasta; kvanttikello pitää
5 ns:n ajoitusratkaisun jokaisen aukon yli (käytettävyys **1.0**), sirukokoinen kello
vain **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="GNSS-haasteellinen rata: kellon ajoitusvirhe vuorokauden aikana GNSS-kuoren sisällä olevalle avaruusalukselle, jossa kattavuusaukot johdetaan ratageometriasta — optinen kello pysyy 5 ns:n spesifikaation sisällä aukkojen yli, kun taas sirukokoinen kello ylittää sen" width="80%">
  <br><em>Ajoitusvirhe vuorokauden aikana, GNSS-käytettävyys johdettuna ratageometriasta:
  näkyvien satelliittien määrä (näköyhteys, Maan peittävyys, korkeuskulmamaski) määrää paikannuksen
  tilan kullakin askeleella, joten kellon on kuljettava jokaisen aukon yli — optinen kello pitää 5 ns:n
  spesifikaation, kun taas sirukokoinen kello ylittää sen. Kshanan tuottama skenaariosta
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Konstellaatio voidaan antaa myös todellisina kaksirivielementteinä (TLE). *Täysi* TLE
(rivi 1 + rivi 2) propagoidaan täydellä **SGP4/SDP4**-mallilla — mukaan lukien
ilmanvastus sekä syvän avaruuden kuu-aurinkotermit ja 12 h / 24 h -resonanssitermit, joilla
on merkitystä ~12 h:n GNSS-radoille — validoitu virallisia AIAA 2006-6753 -vektoreita vasten
pahimmillaan ≈ 4 mm:n tarkkuuteen. `scenarios/orbit-sgp4-gps.toml` sisältää **todellisen Celestrak
`gps-ops` -tilannevedoksen** operatiivisesta GPS-konstellaatiosta (2021-07-28, 30 satelliittia)
ja vaatii kelvolliset TLE-tarkistussummat — kaksirivielementit ovat avointa dataa Yhdysvaltain
Space Forcen / 18th Space Defense Squadronin luettelosta, Celestrakin edelleen jakamina
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); päivitä komennolla
`scripts/fetch_tles.sh`. Pelkän rivin 2 sisältävä lohko säilyttää
analyyttisen kahden kappaleen propagoinnin (`scenarios/orbit-real-tle.toml`); kahta muotoa voi
yhdistellä samassa konstellaatiossa. Konstellaation voi yhtä hyvin rakentaa
**RINEX-3 GPS -yleislähetysefemeridi**tietueiden lohkosta — formaatista, jonka vastaanotin dekoodaa —
propagoituna IS-GPS-200:n käyttäjäalgoritmilla ja syötettynä saman geometrian läpi
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Mitä se on / mitä se ei ole, kokonaisuudessaan</summary>

<a id="what-it-is--is-not"></a>
### Mitä se on / mitä se ei ole

**Se on:** deterministinen, vähäriippuvuuksinen moottori, joka kattaa PNT-pinon — ratojen
geometrian, inertianavigoinnin, GNSS/INS-fuusion, eheyden, kellot ja ajoituksen. Se
ajaa skenaarion (usein GNSS-katkon), kehittää kalibroituja anturivirhemalleja
sopivan estimaattorin läpi ja pisteyttää tuloksen operatiivisia
hyvyyslukuja vasten — tuottaen toistettavan JSON-tuloksen (JavaScript Object Notation) ja SVG-kaavion
Rust-kirjastosta, komentorivikäyttöliittymästä (CLI), Python-laajennuksesta, selaimen WebAssembly-moduulista,
tekoälyagenteille tarkoitetusta **Model Context Protocol (MCP) -palvelimesta** tai **JetBrains IDE (integroitu
kehitysympäristö) -liitännäisestä**.

**Se ei ole:** lentolaitteisto, kvanttihyötykuorman suunnitelma, täysi GNSS-signaali-
vastaanotin, radiotaajuinen (RF) signaalisimulaattori tai hardware-in-the-loop-laitteisto eikä
sertifioitu avioniikkatuote — eikä se korvaa MATLAB/Simulinkia, STK:ta (Systems Tool
Kit) tai Orekitia; se toimii niiden rinnalla ja vaihtaa tiedostoja niiden kanssa. Kvanttilaitteiston tarkkuus tulee
julkaistuista virhemalleista, ei tästä työkalusta. Kunkin ominaisuuden yksityiskohtainen kypsyys
on dokumentoitu tiedostossa [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Se ei ole (vielä):** *täysi* atomi-interferometrian fysiikkamoottori (useimmat kvanttianturit
käyttävät julkaistuja Allan-/kohinabudjettikertoimia; CAI-kiihtyvyysanturilla (kylmien atomien interferometri) on
ensimmäisistä periaatteista lähtevä kerros — Mach–Zehnder-vaihe, projektiokohina, kontrastin heikkeneminen ja
värähtelykytkentä sekä Coriolis- ja valosiirtymäsystematiikka — mutta aaltorintamasystematiikka ja
interferenssiraitojen moniselitteisyyden ratkaisu jäävät **P2**-tiekarttakerrokseksi (tiekartan vaihe 2, kvanttifysiikan kerros),
katso [`ROADMAP.md`](ROADMAP.md) ja [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
sertifioitu tai laitteistopohjainen GNSS-vastaanotin (se ratkaisee yhden pisteen **PVT**-paikannuksen (paikka, nopeus ja aika)
todellisista RINEX-koodihavainnoista (Receiver Independent Exchange Format) — validoitu
todellisella IGS-datalla (International GNSS Service) — ja sen IQ-kerros (`kshana iq`, versiosta 0.31.0 lähtien)
hankkii ja seuraa tallennettuja tai generoituja kantataajuisia näytteitä ohjelmistossa analyysi-
vastaanottimena: se ei ohjaa radiolaitteistoa eikä lähetä, ei ole sertifioitu vastaanotin eikä tee
kantoaallon vaiheeseen perustuvaa paikannusta (RTK tai PPP)); eikä täysi tehtäväsuunnittelukokonaisuus (siinä on Lambert- / porkchop- /
ratamuutos- / radanmäärityksen rakennuspalikoita, mutta se on suorituskykysimuloinnin kerros
GMAT:n (General Mission Analysis Tool)/Orekitin *yläpuolella*, ei korvike). Tämän rajauksen omistaminen on tarkoituksellista. Jos tarvitset ensimmäisistä periaatteista lähteviä kylmien atomien
interferometrin virhebudjetteja (esim. CARIOQA-PMP-tasoisia — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — tai X-37B-tyylistä validointia), katso
P2-tiekartta ja [ota yhteyttä](#support--professional-services) yhteistyötä varten.

</details>

### Matalan Maan kiertoradan navigointi

Matalan Maan kiertoradan (LEO) satelliitit ylittävät taivaan nopeasti ja voimakkain signaalein. Laji `leo-pnt-chain` seuraa yhtä
järjestelmää jokaisen vaiheen läpi: signaali, ylilento ja sen linkki, navigointiviesti sekä
yhdistetty paikan, nopeuden ja ajan (PVT) paikannus ja tarkka pistepaikannus (PPP). Kukin
vaihe luovuttaa lukunsa seuraavalle. Katso [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="LEO PNT -ketju lajin leo-pnt-chain todellisesta ajosta (leo-pnt-end-to-end.toml): signaalivaihe (generic-l taajuudella 1191.795 MHz, pilotti seurattuna nopeudella 10.23 Mchip/s) luovuttaa ylilentovaiheelle (1080 km, seurattu C/N0-huippu 58.2 dB-Hz), joka luovuttaa navigointiviestille (kepler-rac, 300 s:n sovitus, esitys-SISRE 0.91 mm RMS, 0.250 m radanmäärityksen kanssa), joka syöttää yhdistettyä paikannusta (pelkkä GNSS 1.60 m RMS 3D, GNSS ja LEO 0.43 m) ja tarkkaa pistepaikannusta (konvergenssi 11.5 min pelkällä GNSS:llä, 7.5 min 240 LEO-satelliitilla). Vaiheiden välillä luovutetaan 11 arvoa." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Jokainen skenaariolaji perheittäin

Moottorin skenaariolajit perheisiin jaoteltuina. Kullakin perheellä on sivu, jossa on yksi merkintä lajia kohden (moottorin
kuvaus ja kentät, esimerkkikomento, ajon pääluvut, lajin nimeävät
[varmennusmatriisin](docs/VERIFICATION-MATRIX.md) rivit sekä moottorin itse kirjoittama kaavio), ja
näiden kaavioiden kuva-arkki; [`docs/KINDS.md`](docs/KINDS.md) luetteloi ne kaikki. Taulukon kirjoittaa
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) ja sivut
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), ja molemmat epäonnistuvat, jos moottoriin tulee laji, jota mikään perhe ei nimeä.

<!-- generated:kind-families -->
| Perhe | Mihin se vastaa | Lajit | Aja yksi |
|---|---|---|---|
| **[Kellot, ajoitus ja holdover](docs/kinds/clocks-timing-and-holdover.md)** | kuinka kauan kello pitää ajan ilman GNSS:ää, ja miten ajoitusjärjestelmä pärjää maskejaan vasten | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Inertia, fuusio ja kvanttianturit](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | merkintälasku ja anturifuusio GNSS-katkon läpi klassisilla ja kvanttiantureilla | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[GPS-vapaa vaihtoehtoinen PNT](docs/kinds/gps-denied-alternative-pnt.md)** | navigointi painovoiman, maaston ja muiden kenttien avulla, kun GNSS on poissa | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstellaatiot, kattavuus ja geometria](docs/kinds/constellations-coverage-and-geometry.md)** | missä satelliitit ovat, kuka ne näkee ja kuinka hyvä geometria on, Maan, Kuun tai Marsin ympärillä | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS-mittaukset, paikannus ja eheys](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudoetäisyydet, paikannukset, suojaustasot ja avaruusympäristö | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Häirintä, harhautus ja spektri](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | miten häiriö saavuttaa vastaanottimen ja havaitaanko se | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Matalan Maan kiertoradan navigointi](docs/kinds/low-earth-orbit-navigation.md)** | ylilento, linkki, navigointiviesti ja yhdistetty paikannus, vaihe vaiheelta | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Kuu ja cislunaarinen avaruus](docs/kinds/lunar-and-cislunar.md)** | navigointi, aika, koordinaatistot ja geodesia Kuussa | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Avaruuskäyttäjän navigointi](docs/kinds/space-user-navigation.md)** | GNSS-signaalit avaruusaluksille GNSS-ratojen yläpuolella, ympärillä ja niiden takana | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optinen PNT](docs/kinds/optical-pnt.md)** | optiset linkit ilmakehän läpi ja optisen ja RF:n yhdistelmän hyvyysluvut | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Tehtäväanalyysi, linkit ja avaruusoperaatiot](docs/kinds/mission-analysis-links-and-space-operations.md)** | laukaisu, nousu, paluu, asento, linkit, yhteyksien suunnittelu ja tiedostoformaatit | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Tehtäväketjut](docs/kinds/mission-threads.md)** | vaiheketjun navigointi- ja ajoitusvirhebudjetti laukaisusta paluuseen | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampanjat](docs/kinds/campaigns.md)** | muista lajeista rakennetut ketjutetut tehtävät, pyyhkäisyt ja joukot | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Jokainen komento

`kshana <scenario.toml>` ajaa skenaarion; jokainen muu komento on alikomento, ja `kshana --help` tulostaa
niiden kaikkien käyttöohjeen. Komennot ovat `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (alikomennoin `live` ja
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` ja `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) antaa kunkin tarkoituksen, varmennetun esimerkin ja dokumentaatiosivun.

<a id="every-surface"></a>
### Jokainen rajapinta

Yksi moottori, samat tulokset kaikkialla: komentorivi, Rust-kirjasto, Python, JavaScript ja WebAssembly,
MCP-palvelin liitännäiskomentoineen ja taitoineen, Kshana Studio (jokainen sivu toimii selaimessa, ei asennusta, mitään ei ladata palvelimelle),
ROS 2-, Signal K-, OpenCPN-, GNSS-SDR- ja `gnss_lib_py`-integraatiot, systemd-, Docker- ja Grafana-käyttöönottopaketit sekä
JetBrains-liitännäinen. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) luettelee ne ja kertoo, miten kunkin saa, sekä kaikkien
liitännäiskomentojen, taitojen ja Studio-sivujen nimet; [`docs/SURFACES.md`](docs/SURFACES.md) kertoo jokaisen komennon ja lajin osalta,
mikä rajapinta sen sisältää ja mitkä eivät, syineen.

<a id="how-a-run-works"></a>
## Miten ajo toimii

Skenaario on TOML-tiedosto (Tom's Obvious, Minimal Language): laji, siemen ja
parametrit. Moottori ajaa sen ja kirjoittaa tuloksen, kaavion ja raportin sen viereen sekä
pyytämäsi viennit.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Miten ajo etenee. Skenaarion TOML-tiedosto (laji, siemen ja sen parametrit) menee moottoriin, kshana 0.40.0, api::run_toml-välityksen kautta 92 skenaariolajin yli, deterministisesti skenaariosta, siemenestä ja moottorin versiosta. Moottori kirjoittaa tiedostot result.json, chart.svg, report.html ja report.json, table.csv:n niille lajeille, jotka sellaisen määrittelevät, sekä pyynnöstä SP3-, CCSDS OMM- ja OEM-, CZML-, KML-, GeoJSON-, STK- ja SigMF-viennit; sarja kirjoittaa tiedostot study.json ja study.html. Nämä tiedostot syöttävät Kshana Studiota selaimessa, tekoälyavustajaa kshana-mcp-palvelimen kautta sekä jatkuvaa integraatiota." width="100%">
</picture>

Tämä mukana tuleva skenaario kestää 2 h: 10 min GNSS:ää, sitten noin 1.8 h ilman GNSS:ää. Se kysyy,
kuinka kauan strontium-optinen hilakello ja sirukokoinen atomikello (CSAC) kumpikin pitävät
ajan 20 ns:n tarkkuudella.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Optinen kello pitää 20 ns:n budjetin koko 6600 s:n katkon ajan; CSAC pitää sen
2610 s ja on budjetin sisällä 95.6% ajosta, kun optinen kello on 100%.
`kshana example` luettelee jokaisen mukana tulevan skenaarion.

<a id="missions"></a>
## Tehtävät

Kymmenen toimialaa kysyy samalta moottorilta kymmenen eri kysymystä. Kullakin on mukana tulevia skenaarioita
lähtökohdaksi.

| Toimiala | Aloita näistä |
|---|---|
| Puolustus ja turvallisuus | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Avaruus, Maan kiertorata | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Kuu, Mars ja syvä avaruus | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Ilmailu ja droonit | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Merenkulku | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Tieliikenne | `automotive-urban-canyon` |
| Raideliikenne | `rail-tunnel-coast` |
| Kriittinen infrastruktuuri ja ajoitus | `clock-holdover`, `clock-ensemble` |
| Tietoliikenne ja 5G (matkaviestinverkkojen viides sukupolvi) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Tiede ja tutkimus | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Kunkin toimialan kysymys</summary>

<br>

| Toimiala | Sen kysymys | Aloita näistä |
|---|---|---|
| **Puolustus ja turvallisuus** | Kuinka kauan navigointimme ja ajoituksemme pysyvät luotettavina häirinnän ja harhautuksen alla, ja mitkä kerrokset pitävät meidät spesifikaatiossa? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Avaruus: Maan kiertorata** | Näkeekö avaruusalukseni tarpeeksi navigointisatelliitteja, kuinka kauan sen kello pitää ajan paikannusten välillä, ja mitä matalan radan navigointikerros toisi lisää? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Kuu ja syvä avaruus** | Saako laskeutuja, mönkijä tai kiertolainen Kuussa, Marsissa tai kauempana luotettavan paikan ja ajan? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Ilmailu ja droonit** | Kun häiritsin vie GNSS:n, kuinka kauan miehittämätön ilma-alusjärjestelmäni (UAS) pysyy paikkabudjettinsa sisällä, ja onko eheys käytettävissä reitilläni? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Merenkulku** | Kuinka kauas veden yli häiritsin ulottuu, havaittaisiinko paikan siirto, ja kuinka kauan laiva voi kulkea satamaan ilman paikannusta? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Tieliikenne ja autoala** | Kuinka paljon auto ajautuu ylikulkusillan alla tai tienvarren häiritsimen ohi? | `automotive-urban-canyon` |
| **Raideliikenne** | Kuinka monta sekuntia tunneliin juna pystyy vielä kertomaan, millä raiteella se on? | `rail-tunnel-coast` |
| **Kriittinen infrastruktuuri ja ajoitus** | Jos GNSS-aika menetetään tai harhautetaan, kuinka kauan sähköverkko, kauppapaikka tai datakeskus pitää jäljitettävän ajan? | `clock-holdover`, `clock-ensemble` |
| **Tietoliikenne ja 5G** | Jos GNSS-aikareferenssi menetetään, pysyykö verkkoni kello ITU-T-maskien sisällä, ja kuinka kauan? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Tiede ja tutkimus** | Voinko toistaa, laajentaa ja viitata PNT-tulokseen siementä myöten? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Todisteet

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 tarkistettu kaikkia 666 AIAA 2006-6753 -viitevektoria vasten, pahin paikkavirhe 4.12 mm"></a></p>

<strong>176 / 401</strong> ominaisuutta validoitu riippumattomia ulkoisia oraakkeleita vasten; 221 rehellisesti merkitty Modelled.
Varmennusmatriisin kukin rivi nimeää ominaisuuden, oraakkelin, jota vasten se tarkistetaan,
tarkistuksen ajavan testin ja siitä seuraavan merkinnän. Jatkuva integraatio (CI) tekee
mahdottomaksi kutsua ominaisuutta VALIDATED ilman riippumatonta ulkoista oraakkelia.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Miten ominaisuus ansaitsee merkintänsä. Varmennusmatriisin kukin rivi nimeää ominaisuuden, oraakkelin, jota vasten se tarkistetaan, tarkistuksen jatkuvassa integraatiossa ajavan testin ja siitä seuraavan merkinnän. Rivi voi olla VALIDATED vain riippumattoman ulkoisen oraakkelin kanssa; muuten se on MODELLED, tai PARTNER, kun laitteistokumppani vastaa siitä. Esimerkki: SGP4/SDP4, Cowell 6-DOF + häiriöt, erä-/sekventiaalinen OD, oraakkeli AIAA 2006-6753 SGP4 -varmennusvektorit, testi tests/sgp4_verification.rs, merkintä VALIDATED. Ajantasaiset määrät: 176 VALIDATED, 221 MODELLED, 4 PARTNER 401 rivistä. Kaikkiaan 176 ominaisuutta validoitu riippumattomia ulkoisia oraakkeleita vasten; 221 muuta on rehellisesti merkitty MODELLED ja 4 ovat PARTNER-vastuulla." width="100%">
</picture>

| Merkintä | Rivejä | Merkitys |
|---|---|---|
| VALIDATED | 176 | riippumaton ulkoinen oraakkeli on samaa mieltä: todellinen data, riippumaton toteutus tai julkaistut viitevektorit |
| MODELLED | 221 | tarkistettu analyyttistä totuutta tai simulaation itsejohdonmukaisuutta vasten, ja tämä sanotaan ääneen |
| PARTNER | 4 | laitteistokumppanin vastuulla; Kshanalla ei ole sille oraakkelia |

Muutama tarkistuksista: kaikki 666 AIAA:n (American Institute of Aeronautics and Astronautics)
2006-6753 SGP4 (Simplified General Perturbations 4) -vektoria 4.12 mm:n tarkkuuteen; Cowellin voima-
malli 0.08 m:n tarkkuuteen Orekit 12.2:ta vasten; Galileo 0.61 m:n ja Swarm-A 0.10 m:n tarkkuuteen Euroopan avaruusjärjestön (ESA)
todellisia tarkkoja efemeridejä vasten. Testit pitävät rivikattavuuden lähellä 95 %:a hakemistossa
`src/`, ja CI vaatii vähintään 85 %. Kirjanpito on
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), joka tuotetaan tiedostosta
`src/verification.rs`: [koko 401 rivin matriisi](docs/VERIFICATION-MATRIX.md), ja syy, miksi kullakin
Modelled-rivillä ei ole ulkoista oraakkelia, on tiedostossa [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Miten validointi toimii, valikoitu kohokohtataulukko ja todistekuvat</summary>

### Validointi, toistettavuus ja rehellisyys

- Jokainen kohinatermi on kalibroitu **julkaistuun, lähteeseen viitattuun** lukuun ja validoitu
  vakiorelaatiota vasten (Allan-hajonta kelloille; Grovesin merkintälaskun
  virheen kasvu inertialle; ajoitus→etäisyys-muunnos aikasiirrolle). Kunkin termin tila
  seurataan tiedostossa [`docs/VALIDATION.md`](docs/VALIDATION.md) arvona `validated` tai
  `not modeled` — mitään ei esitetä validoituna, mikä ei sitä ole.
- **Toistettava rakenteeltaan:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` valvoo sitä; kvantti- ja klassiset ajot käyttävät
  riippumattomia siemeniä, joten niiden kohina on korreloimatonta.
- Kypsyys ilmoitetaan rehellisesti: optisen kellon ja optisen linkin luvut ovat *tavoitteita /
  maassa toimivan demonstraattorin* tuloksia, eivät lentäneitä.

### Todistemerkintä jokaisessa kuvassa

Jokainen ajon kirjoittama kuva ja taulukko kertoo, kuinka pitkälle siihen voi luottaa ja mihin kirjanpidon riveihin se perustuu. Tulos-JSON:ssa on
`evidence`-avain, kaavio-SVG:ssä rivi kuvaajan alla (ja `<metadata id="kshana-evidence">`-elementti) ja CSV-taulukossa
`# evidence:`-kommenttirivit alussa (luetaan asetuksella `comment='#'`). Se nimeää tason, `VALIDATED`, `MODELLED` tai `PARTNER`, sekä
niiden varmennusmatriisin rivien tunnukset (`VM-` ja kahdeksan heksanumeroa), joita ajo käytti. Taso on heikoin näistä
riveistä, joten ajo, joka nojaa yhteen mallinnettuun riviin, merkitään MODELLED riippumatta siitä, kuinka monta validoitua riviä sen vieressä on; merkintä
ei voi koskaan väittää enempää kuin kirjanpito. Rivit, tilat ja tunnukset luetaan matriisista, niitä ei kirjoiteta käsin
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), ja
`tests/evidence_labels_doc_sync.rs` epäonnistuu, jos kuvalta puuttuu merkintä tai merkintä on ristiriidassa matriisin kanssa.

### Validointi yhdellä silmäyksellä

Jokaista riviä valvoo nimetty testi CI:ssä. Tämä taulukko on **valikoitu kohokohtakooste**;
koko koneellisesti tarkistettu matriisi on **401 riviä — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), ja täydelliset todisteet (sekä se, mitä rehellisesti *ei* ole vielä
validoitu) ovat tiedostossa [`docs/VALIDATION.md`](docs/VALIDATION.md) ja julkaisukohtaisessa
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
-artefaktissa (tuottaa `cargo run --bin validation_report`, SLSA-attestoitu — Supply-chain
Levels for Software Artifacts).

**Tila**-sarake kertoo todisteen *lajin* yllä olevan validointiportaikon mukaisesti: **VALIDATED** = tarkistettu riippumatonta ulkoista oraakkelia vasten (todellinen data, riippumaton kirjasto tai julkaistut viitevektorit); **MODELLED** = tarkistettu analyyttistä totuutta tai simulaation itsejohdonmukaisuutta vasten (ei riippumatonta ulkoista aineistoa). VALIDATED kuvaa tarkistuksen *menetelmää*, ei hyväksyttyä/hylättyä — rehellinen alitus todellista ulkoista oraakkelia vasten pysyy VALIDATED-tasolla, kun taas vertailu, jota mikään matriisin rivi ei nimeä oraakkeliksi (yllä mainittu LRO — Lunar Reconnaissance Orbiter — -sovitus), esitetään MODELLED-tasolla. `CI`-rivit ovat prosessin vartijoita, eivät hyvyyslukuja. Muutama todellisen datan saareke (mitattu cesium-kello, Stable32 PHASE.DAT sekä OPS-SAT/ICGEM-tarkistukset, joiden raakasyötteillä ei ole uudelleenjakelulisenssiä) on **datasta riippuvaisia**: testi tulostaa ohitusilmoituksen ja pysyy vihreänä, kun syöte puuttuu, ja julkiset viiteluvut on tallennettu hakemistoon `tests/fixtures/`. Tuota raakasyötteet uudelleen vastaavalla skriptillä `scripts/fetch_*.sh`.

| Tila | Ominaisuus | Yhtäpitävyys | Viite / oraakkeli |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4-propagointi | 666/666 vektoria, pahin **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + suora vertailu riippumattomaan `sgp4`-crateen |
| **VALIDATED** | Koordinaatistot — IAU 2000A/B -nutaatio, IAU 2006/2000A CIO-ketju, ERA | **bitti bitiltä** (X,Y tarkkuuteen 1e-14, s tarkkuuteen 1e-18, ERA tarkkuuteen 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS vs riippumaton SPICE-moottori | enintään **0.028″** → ≤ 0.86 m maassa, ≤ 3.6 m GNSS-radalla | ANISE (puhdas Rust NAIF/SPICE), sama IERS `finals2000A` EOP, 8 epookkia 2020–2023 (verrattu tähän viitteeseen; mikään varmennusmatriisin rivi ei nimeä sitä ulkoiseksi oraakkeliksi, joten sitä ei merkitä VALIDATED) |
| **MODELLED** | EGM2008-geopotentiaali (aste/kertaluku 70) | kiihtyvyys = ∇V tarkkuudella **< 1e-6**; vyöhykeosan supistuminen validoituun J2:een | NGA EGM2008 -kertoimet + analyyttinen ∇V-identiteetti |
| **VALIDATED** | Painovoimafunktionaalien synteesi (painovoima-avusteisen / GNSS-vapaan navigoinnin kartta) | GRS80 Somigliana + γ_e/γ_p tarkkuuteen **3.5e-12**; todellinen EGM2008-häiriökartta fysikaalinen (RMS ≈ 26 mGal, a/k 70) | GRS80 (Moritz 1980, IAG — International Association of Geodesy) Somiglianan normaalipainovoima + todellinen ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allan-estimaattorit (ADEV/MDEV/TDEV/HDEV) + luottamuskaistat | toistavat viitehajonnat; χ²-kaistat täsmäävät | NIST SP 1065 (Riley), 1000 pisteen taulukko 31/32 |
| **VALIDATED** | Allan-estimaattorit **todellisella mitatulla cesium-kellolla** | OADEV/OHDEV tarkkuuteen **1e-3** (havaittu ≤ 3e-5), 16 keskiarvostuskerrointa | Stable32 todellisella 5071A Cs vs H-maser, 556,990 pistettä (`tests/cs5071a_reference.rs`, datasta riippuvainen) |
| **VALIDATED** | Allan-estimaattorit **kanonisella Stable32 PHASE.DAT** -sarjalla | OADEV/MDEV/TDEV tarkkuuteen **1e-3** (havaittu ≤ 5e-5), 139 keskiarvostuskerrointa | Stable32:n viitehajonnat PHASE.DAT:lle (`tests/phasedat_reference.rs`, datasta riippuvainen) |
| **MODELLED** | IMU-virhemalli — ARW / VRW / biaksen epävakaus | palautettu tarkkuuteen **< 5 %** (biaksen epävakaus < 15 %) | Analog Devices ADIS16465 -datalehti; NaveGo-viiteprofiili |
| **VALIDATED** | Numeerinen Cowell-propagaattori + voimamalli (konservatiiviset tasot) | pahin paikkavirhe **0.08 m** 24 h:n aikana, 278 epookkia (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowellin ilmanvastustaso + absoluuttiset Auringon/Kuun efemeridi- ja tiheyssyötteet | ilmanvastustaso karakterisoitu ≈ 333 m / 24 h; häiriötön vastaa universaalimuuttujaista Kepleriä alle metrin, energia/liikemäärä ~1e-9 | sisäänrakennettu matalan tarkkuuden efemeridi + analyyttinen Kepler |
| **MODELLED** | Lambert · Tsiolkovski · porkchop | edestakainen muunnos kahden kappaleen totuuteen; ΔV **< 0.01 %** | Izzo 2015 · rakettiyhtälö · analyyttinen Hohmannin alaraja |
| **MODELLED** | Radanmääritys (Gauss–Newton-erä) | alle m / mm·s⁻¹ kohinattomana; ~2 m 5 m:n kohinatasolla | kahden kappaleen malli + J2 RK4-kaaren yli |
| **MODELLED** | Voimamallin sovitus Galileon tarkkaan efemeridiin (koko kaari) | **0.61 m** 3-D RMS, 24 h, a/k 70, pelkkä voimamalli | ESA/ESOC `ESA0MGNFIN` lopullinen rata (E11), todellinen `finals2000A` EOP (verrattu tähän viitteeseen; mikään varmennusmatriisin rivi ei nimeä sitä ulkoiseksi oraakkeliksi, joten sitä ei merkitä VALIDATED) |
| **MODELLED** | Voimamallin sovitus Swarm-A:n tarkkaan efemeridiin (reduced-dynamic) | **0.10 m** 3-D RMS (empiirisen tason raja, ei mittaus) | ESA `SW_OPER_SP3ACOM_2_` tarkka rata (verrattu tähän viitteeseen; mikään varmennusmatriisin rivi ei nimeä sitä ulkoiseksi oraakkeliksi, joten sitä ei merkitä VALIDATED) |
| **MODELLED** | Voimamallin sovitus LRO:n kuurataan (rehellinen alitus) | **6.67 m** reduced-dynamic, 5 m:n tavoitteen *yläpuolella* | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (verrattu tähän viitteeseen; mikään varmennusmatriisin rivi ei nimeä sitä ulkoiseksi oraakkeliksi, joten sitä ei merkitä VALIDATED) |
| **MODELLED** | Syvän avaruuden Mars-OD (reduced-dynamic SRIF) | **≈ 0.2 m** Mars-LMO (simulaation FoM, *ei* todellinen tehtävä) | synteettinen suljetun silmukan OD — estimaattorikoneiston validointi |
| **MODELLED** | Aurinko-keskinen Marsin dynamiikka vs JPL DE440 | **137 m @ 1 vrk:n kaari** (kasvaa kaaren mukana = mallintamaton n-kappaleen vaikutus) | JPL DE440 ANISEn kautta (`xval/anise-mars-od`, kernelistä riippuvainen) (verrattu tähän viitteeseen; mikään varmennusmatriisin rivi ei nimeä sitä ulkoiseksi oraakkeliksi, joten sitä ei merkitä VALIDATED) |
| **VALIDATED** | Yhden pisteen paikannus vs mitattu IGS-koordinaatti (todelliset havainnot) | **5.7 m** 3-D RMS / **1.1 m** vaaka, kaksitaajuinen ionosfäärivapaa koodi-SPP | IGS-aseman ABMF mittaus + GPS-yleislähetysefemeridi, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Tiukasti kytketty GNSS/INS-UKF | **0.77 m RMS** 30 min:n LEO-ylilennolla, sis. 120 s:n katkon | voimamallipohjainen kulku, käsin johdettu |
| **MODELLED** | GPS-vapaa painovoimakarttanavigointi | ~70 km:n INS-ryömintä → **~145 m** palautettuna | ESA NAVISP *Quantum Wayfarer* -tavoite |
| **MODELLED** | Maastoviitteinen navigointi (TERCOM/SITAN) | 70 km:n ryömintä → **< 500 m** (ruudukon resoluution alaraja ~140 m) | SRTM `.hgt` DEM; käsin lisätty ryömintä (ei-kehämäinen tarkistus) |
| **MODELLED** | IGRF-14-päämagneettikenttä (aste/kertaluku 13) | napa ~80.7°N, dipoli ~29.7 µT, fysikaalinen 22–67 µT -kaista | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidt-puolinormalisoitu) |
| **MODELLED** | Navigointisignaalin modulaatio ja koodinseuranta | BPSK:n oma SSC = **2/(3·R_c)**; yksikköpinta-alaiset PSD:t; **alle metrin** C/A-DLL-värinä @ 45 dB-Hz | Suljetun muodon SSC/PSD-ankkurit + Kaplanin & Hegartyn DLL-lämpökohinakaava |
| **MODELLED** | CR3BP halo/NRHO -differentiaalikorjain | STM = differenssit; rata sulkeutuu **konetarkkuuteen**; L2 9:2 NRHO **≈ 6.57 d / periluna ≈ 3,250 km** | differenssi-STM-tarkistus + julkaistu L2:n eteläinen 9:2 NRHO (≈ 6.56 d / ≈ 3,370 km) — CR3BP, ei todellinen Gatewayn efemeridi |
| **MODELLED** | ARAIM-kaksikonstellaatioeheys | koko konstellaation vikatila todellisella GPS + Galileo -datalla | EU ARAIM TR (tekninen raportti) / DO-316; Celestrak `gps-ops` 2021-07-28 (verrattu tähän viitteeseen; mikään varmennusmatriisin rivi ei nimeä sitä ulkoiseksi oraakkeliksi, joten sitä ei merkitä VALIDATED) |
| **VALIDATED** | GNSS-geometria / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | täsmää tarkkuuteen **1e-6 suhteellinen** 8 geometriassa (hyvin ehdollistetusta lähes singulaariseen) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — riippumaton kirjasto (`tests/dop_reference.rs`) |
| **VALIDATED** | ML-ilmaisimien arviointimittarit (AUC/ROC/sekaannus/Pd-Pmd/tarkkuus/F1) | **täsmälliset lukumäärät + < 1e-9** 5 aineistolla × 24 kynnyksellä | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — riippumaton kirjasto (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | Poikkeamanhavaitsemisen ROC AUC **todellisella ESA OPS-SAT -telemetrialla** | AUC toistaa scikit-learnin tarkkuudella **< 1e-9**; huippujen laskentaan perustuvan ilmaisimen AUC **≈ 0.85** merkityllä testijaolla | scikit-learn `roc_auc_score` OPSSAT-AD-testijaolla (Ruszczak et al. 2025, CC BY 4.0) — todellinen OPS-SAT-telemetria (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Kvanttikompromissin numeeriset ytimet (ADEV NNLS -sovitus · χ²-johdonmukaisuuskaistat · van Loan -kellon Q) | NNLS + Q **täsmälliset**; χ² **< 5e-4** käyttövapausasteilla ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | MTIE / MDEV / TDEV -tietoliikenteen vaellusmittarit (ITU-T G.810/G.823/G.8261/G.811 — International Telecommunication Unionin standardointisektorin suositukset) | MTIE (9 keskiarvostuskerrointa, bittitarkka) ja MDEV + TDEV (8 kerrointa, **< 1e-9** suhteellinen) NIST SP 1065 LCG -sarjalla (lineaarinen kongruenssigeneraattori) | allantools 2024.06 `mtie` / `mdev` / `tdev` — riippumaton kirjasto (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | MCDA-kompromissitutkimuksen menetelmät — kaikki neljä päätösperhettä, yhdeksän ulkoisesti validoitua aggregoijaa (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) sekä **AHP**:n parivertailuun perustuva prioriteettipainotus | pisteet / järjestykset / konkordanssimatriisit toistettu tarkkuudella **< 1e-9** | pymcdm + pyDecision (riippumattomat kolmannen osapuolen MCDA-kirjastot) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | LEO:n Doppler-verhokäyrä radasta ja kantoaallosta | Iridiumin maksimi **5 %:n** sisällä julkaistusta ±36 kHz:stä; Xona Pulsar X1 julkaistun **32–34 kHz** -välin sisällä | RNTF:n LEO PNT -testitulokset; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | PPP:n konvergenssi LEO-täydennyksellä | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min 60 / 96 / 192 / 288 LEO-satelliitilla, monotoninen; suodattimen NEES χ²-kaistan sisällä | trendiä verrattu lähteeseen Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); konstellaatioita ja kohinaa ei toistettu |
| **MODELLED** | Ehdollinen ajoituksen suojaustaso (holdoverin rajoittama havaitsematon aikavirhe harhautuksen alla) | koostumus toistaa monivaiheisen `clock_state`-kovarianssirekursion; kalibroitu todellisella tallennetulla harhautuksella | JammerTest 2024 (Zenodo 15911589) -skalaarit + van Loan / CUSUM -suljetut muodot (`examples/tpl_jammertest`) |
| **MODELLED** | PNT-häiriönsietokyvyn pisteytys + päätösepävakaus | 35 käsin johdettua oraakkelitestiä; tavutasolla deterministinen tutkimusartefakti (kiinteä siemen) | DHS RPCF v2.0 -vastaavuus + Dirichlet / Kendall-τ / Hill-N2 -suljetut muodot — synteettiset arkkitehtuurit, ei sertifiointi |
| **MODELLED** | RF-heikennysten optimismivajetutkimus (skaalauslait + leave-one-out-ennustin) | permutaationollahypoteesin merkitsevyys; tavutasolla deterministinen artefakti (5 siementä) | synteettinen parametreihin perustuva aineisto — arvioinnin *mittarit* ovat VALIDATED scikit-learnia vasten (yllä); tutkimus on MODELLED |
| CI | Alustariippumaton toistettavuus | bitti-identtiset syöte- + muotoreferenssit 3 käyttöjärjestelmällä (OS) | Linux / macOS / Windows CI-matriisi, SHA-256-referenssit |
| CI | Testikattavuus | **~95 % riveistä** hakemistossa `src/` pois lukien `src/*_data.rs` ja `src/main.rs`, vaatimus ≥ 85 % | cargo-tarpaulin (LLVM-moottori) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Miten ominaisuus ansaitsee merkintänsä: Vaatimus kuvautuu moduuliksi hakemistossa src, testiksi hakemistossa tests, ulkoiseksi oraakkeliksi (todellinen aineisto, riippumaton viitetoteutus tai julkaistut vektorit) ja tilaksi — CI:n valvomalla vartijalla, jonka mukaan mikään ominaisuus ei voi olla Validated ilman ulkoista oraakkelia. Ajantasaiset määrät: 176 Validated, 221 Modelled, 4 Partner, yhteensä 401" width="900">
  <br><sub>Miten ominaisuus ansaitsee merkintänsä — CI:n valvoma invariantti: ei ulkoista oraakkelia ⇒ ei voi olla Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Miten kukin väite on tuettu: Validated-sarake on rakenteeltaan 176 / 176 ExternalDataset (CI:n valvoma); Modelled-rivit on rehellisesti merkitty InternalConsistency, ReferenceImpl tai ExternalDataset; Partner-riveillä ei ole Kshanan oraakkelia" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="SGP4/SDP4:n pahimman tapauksen paikkavirhe AIAA 2006-6753 -viitteeseen nähden ratatyypeittäin, logaritminen asteikko: jokainen ratatyyppi on selvästi AIAA:n toleranssin alapuolella, pahin tapaus 4.12 mm syvän avaruuden ei-resonanssisessa ratatyypissä" width="96%">
  <br><sub>Ylhäällä: jokainen Validated-rivi on rakenteeltaan ulkoisen aineiston tukema. Alhaalla: SGP4 vastaa virallista viitettä jokaisessa ratatyypissä (pahin 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Varmennuksen tila kaikissa 401 ominaisuudessa: 176 Validated (tarkistettu ulkoista oraakkelia vasten), 221 Modelled, 4 Partner-vastuulla" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Ominaisuusalueet

Jokainen julkisen kartan ominaisuus alueittain, kirjanpidon merkintöineen. Aluetaulukon kirjoittaa
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) tiedostosta `web/capabilities.json`, samasta tiedostosta, jonka
Studion kaiken kattava kartta lukee.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Kshanan ominaisuudet alueittain ja kypsyyksittäin: validoidut ja mallinnetut julkiset ominaisuudet alueittain, piirretty tiedostosta web/capabilities.json työkalulla tools/gen_validation_figures.py" width="900">
</picture>

Koko taulukko alue alueelta jokaisen ominaisuuden ja sen merkinnän kera on tiedostossa [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Asennus

Yksi rivi tuo komentorivityökalun: **`cargo install kshana`**. Jokainen kanava toimittaa
version v0.40.0 samasta tagatusta commitista.

<!-- channels:begin -->
| Kanava | Asennus | Opas |
|---|---|---|
| Kokeile selaimessa | avaa https://kshana.dev | [Studion opas](https://kshana.dev/docs/studio.html) |
| Komentorivi (Rust) | `cargo install kshana` | [Komentorivin käyttö](https://kshana.dev/docs/rust.html#usage--cli) |
| Rust-kirjasto | `cargo add kshana` | [API-viite docs.rs-palvelussa](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Python API -opas](https://kshana.dev/docs/python-api.html) |
| JavaScript ja WebAssembly | `npm install kshana` | [npm- ja WebAssembly-opas](https://kshana.dev/docs/npm.html) |
| Tekoälyavustaja (MCP-palvelin, cargo) | `cargo install kshana-mcp` | [MCP-palvelimen opas](https://kshana.dev/docs/mcp.html) |
| Docker-levykuva | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [MCP-palvelimen opas: Docker](https://kshana.dev/docs/mcp.html#install) |
| Claude Desktop -laajennus | kaksoisnapsauta järjestelmäsi `.mcpb`-tiedostoa: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (yhdellä napsautuksella) | [Lisää Cursoriin (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Lisää Cursoriin (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (yhdellä napsautuksella) | [Asenna VS Codeen (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Asenna VS Codeen (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Valmiiksi käännetty binääri | lataa kshana-mcp-<target> julkaisusta ja tarkista se SHA256SUMS-tiedostoa vasten | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Virallinen MCP-rekisteri | hae io.github.ashfordeOU/kshana-mcp | [Kaikki MCP-asennuskatkelmat](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Etä (streamable HTTP), itse ylläpidetty | `kshana-mcp --http 127.0.0.1:8080` | [Itse ylläpidon opas](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Claude Coden liitännäiskauppa | `/plugin marketplace add ashfordeOU/kshana` | [Kshanan käyttö agentista](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| JetBrains IDE -liitännäinen | Settings → Plugins → Marketplace → hae "Kshana" (liitännäisen ID dev.kshana.ide) | [Liitännäisen opas](https://kshana.dev/docs/jetbrains.html) |
| Signal K -liitännäinen | `npm install signalk-kshana-trust` | [Signal K -liitännäisen opas](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN-liitännäinen | lataa liitännäisen tarball julkaisusta | [OpenCPN-luettelon lähetys](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana-kojelauta | tuo kshana-grafana-*.json julkaisusta | [Kojelaudan lähde](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Viitekokoonpanon levykuva | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Merenkulun integraatiot](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana JetBrains Marketplacessa"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Kääntyy Rust 1.88:lla tai uudemmalla, tiedoston Cargo.toml rust-version"></a></p>

MCP on Model Context Protocol. Kiinnitä julkaisu komennolla `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` tai `npm install kshana@0.40.0`. Lähdekoodista kääntäminen: katso
[Asennus ja kääntäminen](#install--build) Viiteosassa.

<details>
<summary>Aja skenaario Pythonista ja WebAssemblysta</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

`run`-funktion lisäksi moduuli tarjoaa funktiot `run_full` (JSON, SVG ja yhden rivin yhteenveto kerralla),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` ja `error_kind`; katso
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

npm-paketti on koko moottori WebAssemblyksi käännettynä. Node.js:ssä anna binääri funktiolle
`initSync`; selaimessa `await init()` hakee sen (katso [`README.npm.md`](README.npm.md)).

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
## Arkkitehtuuri

Keskellä on yksi avoin moottori, ja jokainen rajapinta ajaa sitä: komentorivi, Rust-
kirjasto, Python, WebAssembly ja Kshana Studio, MCP-palvelin, Docker-levykuva ja
JetBrains-liitännäinen. Sama skenaariotiedosto tuottaa samat tavut kaikissa. Kshana Pro on
päällä erillisenä kerroksena, joka riippuu moottorista eikä koskaan haaroita sitä.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Kshanan arkkitehtuuri: keskellä yksi avoin moottori, kshana 0.40.0 AGPL-3.0-lisenssillä, jossa api::run_toml, tyypitetty välitys jokaisen lajin yli, sekä 401 ominaisuuden varmennuskirjanpito (176 VALIDATED, 221 MODELLED, 4 PARTNER). Sen ympärillä jokainen rajapinta ajaa samaa moottoria: Komentorivi (cargo install kshana); Rust-kirjasto (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); MCP-palvelin (cargo install kshana-mcp); Docker-levykuva (ghcr.io/ashfordeou/kshana-mcp); JetBrains-liitännäinen (Marketplace: &quot;Kshana&quot;). Sen alla Kshana Pro, suljettu kerros, joka riippuu avoimesta moottorista kirjastona eikä koskaan haaroita sitä, eikä lisää yhtään fysikaalista mallia." width="100%">
</picture>

<details>
<summary>Moottorin sisällä: aluekerrokset ja varmennuskirjanpito</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Kshanan arkkitehtuuri kerroksittain. Viisi sisäänkäyntiä (komentorivi, Python, JavaScript ja WebAssembly, MCP-palvelin ja JetBrains-liitännäinen) johtavat yhteen api::run_toml-funktioon, tyypitettyyn välitykseen 92 lajin yli. Sen alla on kahdeksan aluekerrosta: aika ja koordinaatistot, kellot ja ajoitus, inertia ja fuusio, GNSS ja eheys, astrodynamiikka, LEO PNT, Kuu, Mars ja syvä avaruus sekä tehtävät ja tutkimukset, yhteisen ytimen päällä, ja kaikki ristiviitattuina varmennusmoduulin kautta: koneellisesti tarkistettu 401 ominaisuuden matriisi, joka on jokaisen merkinnän ainoa totuuden lähde." width="100%">
</picture>

**Yksi moottori, monta sisäänkäyntiä.** Yksi Rust-ydin (`kshana`) ajaa jokaisen skenaarion,
ja siihen päästään CLI:n, Python-laajennuksen, selaimen WebAssembly-moduulin, tekoälyagenteille tarkoitetun **MCP-
palvelimen** ja **JetBrains IDE -liitännäisen** kautta — kaikki päätyvät yhteen
`api::run_toml`-välitykseen. Sisällä anturipaketit liittyvät yhteiseen virhemalli-
rajapintaan; niiden rinnalla ovat **koordinaatistokerros** (IAU 2006/2000A
-prekessio–nutaatio ja CIO-pohjainen GCRS↔ITRS-muunnos), **astrodynamiikka-/numeerinen
kerros** (analyyttinen SGP4/SDP4 **ja** numeerinen Cowell-propagaattori
EGM2008-/häiriövoimamalleineen, ratamuutosten suunnittelu ja radanmääritys),
**eheys-/GNSS-kerros** (RAIM/ARAIM, SBAS, mittausalue, häirintä, cislunaarinen),
**fuusio- / vaihtoehtoisen PNT:n kerros** (GNSS/INS-estimaattorit ja painovoima-/maasto-/magneetti-
karttasovittimet), **syvän avaruuden ja kuun kerros** (radiometrinen Mars-PNT ja
kuun PNT-kokonaisuus, osakohtaiset todistetasot matriisissa — LTC-aika, VLBI, yhdistetty OD+kello, koordinaatiston realisointi, palvelutilavuus,
differentiaalinen PNT, yhteentoimivuus), **tehtäväanalyysikerros** (laukaisu / paluu / kattavuus /
osoitus / ylilento / linkkibudjetit ja avaruussääympäristö) sekä avoin
**häiriönsietokyvyn ja tekoäly/ML-tutkimuksen kerros** (RPCF-häiriönsietokyvyn pisteytys, RF-heikennysten optimismi-
vaje ja kvanttipohjaisen PNT:n demonstraattori), jonka toistettavat artefaktit nojaavat
validoituihin ytimiin.

Kaksi erillistä, **työtilasta poissuljettua** cratea on ytimen rinnalla — `mcp/kshana-mcp`
(MCP-palvelin, rakennettu edition-2024 `rmcp` SDK:n päälle) ja `xval/anise-frames`
(ANISE/SPICE-koordinaatistojen ristiintarkistus, joka tuo MPL-2.0-lisensoituja (Mozilla Public License 2.0) riippuvuuksia) — ja ne pidetään julkaistun
craten riippuvuusgraafin, `Cargo.lock`-tiedoston, lisenssiportin ja MSRV-käännöksen (pienin tuettu Rust-versio) ulkopuolella juuren
`Cargo.toml`-tiedoston `exclude`-listalla. JetBrains-liitännäinen (`ide/jetbrains`) on erillinen Kotlin-
projekti. Katso kaikki kaaviot tiedostosta [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

Renderöidyt kaaviot (moottorin kulku, moduulikartta, jakelu) ovat tiedostossa [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Kaaviot

Kaaviot ovat Mermaid-lähteitä hakemistossa [`docs/diagrams/`](docs/diagrams/), renderöityinä SVG- ja PNG-muotoon hakemistoon
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` Linuxissa, kaksi muuta
`render-diagram`-skriptiä muualla), ja tietue sitoo kunkin PNG:n täsmälleen siihen SVG:hen, josta se tuli. Testit kiinnittävät
ilmoittamansa määrät. Yllä olevien osioiden kaaviot piirretään työkaluilla moottorin ajoista; nämä näyttävät, miten
osat sopivat yhteen.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Järjestelmä: kuusi sisäänkäyntiä (komentorivi, Python, WebAssembly ja npm Kshana Studion kera, MCP-palvelin liitännäisineen ja taitoineen, JetBrains-liitännäinen, integraatiot) kutsuvat kaikki yhtä välitystä jokaisen skenaariolajin yli, joka ajaa yhtä moottoria, jossa on yhteinen ydin, anturipaketit ja koordinaatistot sekä aluemallit, ja kirjoittaa toistettavan tuloksen ja kaavion" width="900"><br>
  <sub>Yksi välitys, yksi moottori, toistettava tuloste · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · lähde <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Rajapinnat: yksi deterministinen offline-moottori syöttää komentoriviä, Rust-kirjastoa, Pythonia, WebAssemblya ja npm:ää sekä MCP-palvelinta; Studio toimii WebAssembly-käännöksen päällä, liitännäiskomennot ja taidot MCP-palvelimen päällä, integraatiot ja käyttöönottopaketit komentorivin päällä ja JetBrains-liitännäinen kirjaston päällä" width="900"><br>
  <sub>Jokainen rajapinta samasta moottorista · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · lähde <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Yhden ajon sisällä: skenaariotiedosto siemenineen ja GNSS-aikajanoineen syöttää moottoria, joka kullakin aika-askeleella kehittää virhemallia, ajaa estimaattorin ja pisteyttää hyvyysluvut sekä kirjoittaa toistettavan tuloksen ja kaavion" width="900"><br>
  <sub>Ajon sisäsilmukka · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · lähde <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Vastaanottimen luotettavuus: vastaanotinloki tai -virta luetaan epookkikohtaisiksi havaintosuureiksi ja vastaanottimen omiksi lipuiksi, kulkee valvontojen läpi ja muuttuu ohjeelliseksi luottamuspistemääräksi kaistoineen ja syineen, joka syöttää Studiota, telemetriaa, allekirjoitettua todistepakettia, Jammertest- ja bench-pisteytystä sekä vaatimustenmukaisuusraporttia" width="900"><br>
  <sub>Vastaanotinlokista luottamuspistemäärään ja siihen, mikä sitä käyttää · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · lähde <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Laboratorion edestakainen kierros: skenaario viedään tapahtumineen ja testiolosuhteineen, Kshanan ulkopuolinen operaattori toistaa tiedoston laboratoriosimulaattorin kautta, vastaanotinloki pisteytetään ilmoitettuja tapahtumia vasten, ja todisteiden edestakainen kierros linkittää skenaarion, olosuhteiden ja lokin tiivisteet sekä pisteet allekirjoitetuksi paketiksi" width="420"><br>
  <sub>Skenaariosta allekirjoitettuun pakettiin; Kshana ei koskaan tuota eikä toista signaalia · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · lähde <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: selain ajaa WebAssemblyksi käännettyä moottoria paikallisesti lataamatta mitään palvelimelle, ottaa mukana tulevat skenaariot tai avaamasi skenaarion tai lokin ja näyttää tuloksen Yksinkertaisessa näkymässä, Edistyneessä näkymässä ja tehtäväsivuilla, käyttäjän tallentamien vientien kera" width="900"><br>
  <sub>Miten Studio toimii, paikallisesti · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · lähde <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Testaus- ja julkaisuprosessi: paikalliset portit (muotoilu, clippy, attribuution puuttumisen tarkistus, dokumentaatiokattavuuden räikkä sekä scripts/gate.sh, joka ajaa koko testisarjan ja toistoajot ja kirjoittaa kuitin, jonka pre-push-koukku tarkistaa) johtavat vain CI:tä varten tehtyyn pull requestiin ja vihreään täyteen CI:hin; omistaja siirtää mainin pikakelauksella vihreään committiin, ja annotoitu tagi asetetaan siihen versiosynkronoinnin tarkistuksen jälkeen; julkaisutyönkulku varmentaa koko testisarjan tagatussa commitissa ennen kuin mitään julkaistaan, kääntää binäärit SBOM:n, tarkistussummien ja käännösalkuperän kera, julkaisee crates.io:hon, PyPI:hin, npm:ään, konttirekisteriin, MCP-rekisteriin ja JetBrains Marketplaceen, kyselee jokaista rekisteriä, kunnes se tarjoaa uuden version, ja käynnistää sivuston käännöksen tagista; erillinen vain sivustoa koskeva polku käynnistää pages-työnkulun tagilla main, ja se hylätään, ellei mikään hakemistojen web/ ja .github/ ulkopuolella ole muuttunut viimeisimmän julkaisun jälkeen" width="900"><br>
  <sub>Testaus- ja julkaisuprosessi paikallisista porteista varmennettuun julkaisuun sekä vain sivustoa koskeva polku · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · lähde <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Moduulikartta: komentorivi, Python, WebAssembly, MCP-palvelin ja JetBrains-liitännäinen kutsuvat tyypitettyä välitystä jokaisen lajin yli, joka tavoittaa yhteisen ytimen, ajan ja koordinaatistot, anturipaketit, astrodynamiikan, eheyden, harhautuksen havaitsemisen, fuusion, syvän avaruuden ja Kuun, häiriönsietokyvyn sekä erotuomari- ja vertailuarviointimoduulit, kaikki varmennusmatriisin takaamina" width="1000"><br>
  <sub>Missä koodi sijaitsee · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · lähde <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Jakelu: yksi tietovarasto toimittaa ydin-craten, MCP-palvelimen, IDE-liitännäisen ja ristiintarkistuscratet crates.io:hon, PyPI:hin, npm:ään, GitHub Releasesiin, Pages-kokeiluympäristöön, konttirekisteriin, MCP-rekisteriin ja JetBrains Marketplaceen, Zenodo-arkiston kera" width="900"><br>
  <sub>Mitä toimitetaan minne, ja mikä sen tarkistaa · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · lähde <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## Tekoälyavustaja

[`kshana-mcp`](mcp/kshana-mcp/) on MCP-palvelin: avustajasi ajaa varsinaista moottoria ja
lukee takaisin sen JSON-tulosteen sen sijaan, että arvaisi laskut. Kukin sen 49 työkalusta on ohut kääre
`kshana`-kirjaston julkisen funktion ympärillä, joten palvelimessa ei ole simulointilogiikkaa.

### Asenna MCP-palvelin

> Ohjeellinen, ei tyyppihyväksytty navigointilaite: käyttäjä vastaa edelleen navigoinnista.
> Palvelin toimii tietokoneellasi; mitään ei lähetetä Ashforde OÜ:lle.

Valitse mikä tahansa kanava. Jokainen linkki ja katkelma tuotetaan yhdellä skriptillä
(`scripts/gen_mcp_install.py`) ja tarkistetaan jatkuvassa integraatiossa; katkelmat sovelluksille Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI ja Continue ovat tiedostossa
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanava | Komento tai painike | Vaatii | Kiinnitetty muoto |
|---|---|---|---|
| Claude Desktop -laajennus | kaksoisnapsauta järjestelmäsi `.mcpb`-tiedostoa: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | ei mitään | version v0.40.0 `kshana-mcp-<target>.mcpb` |
| Cursor (yhdellä napsautuksella) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node tai Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (yhdellä napsautuksella) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node tai Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · liitännäinen: `/plugin marketplace add ashfordeOU/kshana` ja sitten `/plugin install kshana@ashforde` | Node (tai Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ ja uv tai pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formula versiolle v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` ja sitten `scoop install kshana-mcp` | Scoop (Windows) | manifesti versiolle v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Valmiiksi käännetty binääri | [julkaisusivu](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, tarkistettuna tiedostolla `SHA256SUMS` ja komennolla `gh attestation verify` | ei mitään | v0.40.0 |
| MCP-rekisteri | `io.github.ashfordeOU/kshana-mcp` (rekisteriä tukevat asiakasohjelmat löytävät sen) | rekisteriä tukeva asiakasohjelma | `0.40.0` |
| Etä (streamable HTTP) | `kshana-mcp --http 127.0.0.1:8080`, itse ylläpidetty: katso [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | oma palvelimesi | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp Glamassa, sen MCP-palvelimen laatupistemäärä"></a></p>

Claude Codessa sama palvelin tulee liitännäisenä: `/plugin marketplace add ashfordeOU/kshana`, sitten
`/plugin install kshana@ashforde`. Liitännäinen lisää työkalujen päälle vinoviivakomennot: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` ja `/kshana-jammertest`. Aluksen luotettavuuden työkalut syöttävät Signal K- ja
OpenCPN-integraatioita: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Asiakasohjelmakohtaiset asetukset ovat tiedostossa [`docs/integrations.md`](docs/integrations.md). Palvelin on listattu
virallisessa MCP-rekisterissä nimellä `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>49 työkalua</summary>

<br>

**Skenaariot ja raportit**

| Työkalu | Mitä se tekee |
|---|---|
| `run_scenario` | Ajaa skenaarion TOML-määrittelystä (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | 92 sisäänrakennettua skenaariolajia kuvauksineen + pakolliset/valinnaiset kentät — jotta agentti voi rakentaa kelvollisen skenaarion |
| `validate_scenario` | Ennakkotarkistus: jäsentää TOML:n ja tunnistaa sen lajin ajamatta |
| `list_example_scenarios` | Mukana tulevat viiteskenaariot JSON-muodossa |
| `get_example_scenario` | Yhden mukana tulevan viiteskenaarion TOML-teksti, tavu tavulta hakemiston `scenarios/` tiedosto |
| `report_scenario` | Ajaa skenaarion ja palauttaa sen raportin |
| `animate_scenario` | Ajaa skenaarion ja palauttaa sen aikasarjan animaationa |
| `sky_geometry` | Taivaan geometria atsimuutista riippuvan horisonttiprofiilin alla: näkyvät ja piilossa olevat satelliitit, DOP, itä-pohjoinen-ylös-kovarianssi ja vaakasuuntainen virhe-ellipsi; tai horisonttiprofiilin esiasetus alkuperätietoineen |

**Vienti ja yhteentoimivuus**

| Työkalu | Mitä se tekee |
|---|---|
| `list_export_formats` | Mitkä yhteentoimivuusformaatit soveltuvat skenaarioon (`czml`, `kml`, `geojson`, `stk`, `sigmf`), syy silloin, kun jokin ei sovellu, sekä spesifikaatio, jota kukin kirjoittaja noudattaa |
| `export_interop` | Vie skenaarion CZML- (Cesium Language), KML- (Keyhole Markup Language), GeoJSON-, STK- (Systems Tool Kit) efemeridi `.e`- tai SigMF-muotoon (Signal Metadata  |
| `import_route` | Kirjoittaa GeoJSON-`LineString`-reitin skenaarioon, joka lentää reittipisteiden jäljen (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`), ja palauttaa uuden TOML:n |
| `export_sp3` | Vie `orbit`-skenaarion konstellaation SP3-c-tarkkaefemeridinä (Standard Product 3, revisio c) |
| `export_omm` | Vie `orbit`-skenaarion elementit CCSDS:n (Consultative Committee for Space Data Systems) 502.0-B-2 OMM -luettelona (Orbit Mean-elements Message) |
| `export_oem` | Vie `orbit`-skenaarion tilasarjan CCSDS OEM (Orbit Ephemeris Message) 2.0 -efemeridinä — TEME-paikka (todellinen ekvaattori, keskimääräinen päiväntasaus) *ja*  |
| `export_table_csv` | Ajaa skenaarion ja palauttaa sen toistettavuustaulukon CSV-muodossa (pilkuin erotetut arvot) — tavuvakaa taulukko, jonka CLI (komentorivikäyttöliittymä) kirjoittaa tiedostoon `<scenario>.table.csv` |
| `export_test_bench` | Skenaarion ajoneuvon liike ja tapahtumat laboratorion GNSS-simulaattorille (`kshana bench-export`) |

**Vastaanottimen ja aluksen luotettavuus**

| Työkalu | Mitä se tekee |
|---|---|
| `assess_receiver_log` | Arvioi todellisen GNSS-vastaanottimen (maailmanlaajuinen satelliittinavigointijärjestelmä) lokin luotettavuuden |
| `assess_vessel_stream` | Pisteyttää rajatun NMEA 0183 -otteen (enintään 2 MiB ja 20,000 epookkia |
| `assess_vessel_log` | Aluksen NMEA 0183 -loki (enintään 4 MiB) eräajona, istunnon TOML:n ilmoittaessa aluksen rajat |
| `create_evidence_pack` | Allekirjoitettu todistepaketti aluksen lokin aikaikkunasta (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Sitoo RFC 3161 -aikaleimatunnisteen (`.tsr`-tavujen base64) pakettiin muistissa (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Varmentaa paketin (`kshana evidence verify`) |
| `generate_training_nmea` | Synteettistä komentosillan NMEA 0183 -dataa miehistön koulutukseen `nmea-scenario`-TOML:sta (häirintä, paikan poisveto, ajan harhautus, toistoviive) kouluttajan lokin kera (`kshana-nmea-training/1`) |
| `build_interference_map` | GNSS-häiriökartta ADS-B- tai AIS-paikkailmoituksista CSV-tekstinä (enintään 4 MiB) |
| `route_exposure` | Reitin pituuden osuus yhden tai useamman häiriökartan heikentyneissä, ei heikentyneissä, arvioimattomissa ja havaitsemattomissa soluissa, valinnaisesti päivämäärävälin sisällä |
| `trust_telemetry` | Luottamusvirta (JSON-rivit) tai `receiver-trust`-tulos esitettynä Prometheus-tekstinä, CEF- tai LEEF-syslog-riveinä tai OTLP JSON -hyötykuormana `kshana trust-telemetry` -koodaimilla |
| `jammertest_import` | Lukee julkaistun Jammertest-testiluettelon ja lähetyssuunnitelman (NPRA/jammertest-plan, MIT) aikataulutettuna totuutena (`kshana jammertest import`): yhden testialueen aikavälit muuttuvat vastaanottimen luotettavuuden tapahtumiksi, joiden kunkin merkinnässä on luettelotunnus ja vuosi. Suunniteltuja aikavälejä, ei tallennettuja lähetysaikoja; suunnitelman yhteystietokenttiä ei lueta. MODELLED. Katso [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Pisteyttää vastaanotinlokin tätä aikataulua vasten (`kshana jammertest score`): testikohtaisesti havaitsemisviive, puuttuvat hälytykset ja palautumisaika sekä väärät hälytykset kaikkien aikavälien ulkopuolella. Tekstilokit `log`-kenttänä, binääriset (`ubx`, `sbf`) `log_base64`-kenttänä. Allekirjoitettu paketti tarvitsee avaimen: komentorivi. Vain ohjeellinen; MODELLED. |
| `fit_imu_log` | `hybrid`- ja `fusion`-skenaarioiden kiihtyvyysanturi- ja gyroskooppiparametrit sovitettuna paikallaan olevan IMU:n lokista (CSV tai EuRoC) Allan-hajonnalla, valmiiksi liitettävän `[accel_classical]`-taulukon ja lokin SHA-256-tiivisteen kera (`kshana imu-fit`). Teksti sisään, JSON ulos; MODELLED. |

**GNSS IQ (työhakemiston tiedostot; pois päältä HTTP-tilassa)**

| Työkalu | Mitä se tekee |
|---|---|
| `iq_signals` | GNSS IQ -kerroksen asetukset |
| `iq_info` | Kuvaa yhden IQ-tallenteen (samanvaihe ja kvadratuuri) työhakemistossa käsittelemättä sitä |
| `iq_scene` | Generoi usean satelliitin GNSS IQ -näkymän työhakemistoon (`kshana iq scene`) |
| `iq_acquire` | Yhden tai useamman PRN:n (pseudosatunnaiskohinakoodit) FFT-hankinta (nopea Fourier-muunnos) tallenteen yli (`kshana iq acquire`), valinnaisesti etupäävaiheiden takana |
| `iq_track` | Hankkii ja sitten seuraa DLL/PLL/FLL-silmukkapankilla (viive-, vaihe- ja taajuuslukitut silmukat) (`kshana iq track`), silmukoiden tullessa `kshana.loop-desig |
| `iq_frontend` | Soveltaa vastaanottimen etupään ja häiriöiden vaimennuksen DSP:tä (digitaalinen signaalinkäsittely |
| `iq_sweep` | Toistaa yhden työhakemiston IQ-tallenteen useilla seurantasilmukkasuunnitelmilla (`kshana iq sweep`) |
| `iq_monitor` | Ajaa häiriöiden ja harhautuksen havaitsemisvalvonnat IQ-tallenteen yli työhakemistossa (`kshana iq monitor`) |
| `iq_labfit` | Sovittaa seurantasilmukan lukituksen menetyksen mallin laboratorioajoihin (`kshana iq labfit`) `iq-labfit`-skenaariosta, jonka lokit ovat sisäisiä (`text` tai `base64` |
| `iq_test_conditions` | Validoi tekstinä annetun `kshana.test-conditions/1`-tiedoston ja palauttaa ratkaistut olosuhteet tiivisteineen |
| `iq_campaign` | Ajaa laboratoriotoistokampanjan (`kshana iq campaign`) |
| `iq_campaign_status` | Kampanjan tulostekansion edistyminen |

**Vaatimustenmukaisuuden vastaavuus**

| Työkalu | Mitä se tekee |
|---|---|
| `compliance_report` | Julkisten viitekehysten vastaavuus täytettynä tekstinä annetuista tulosdokumenteista (`kshana compliance-report`) |
| `compliance_mapping` | Staattiset vastaavuustaulukot (tai `sources`-valinnalla niiden lähteinä mainitut dokumentit versioineen ja URL-osoitteineen) Markdown-muodossa, saman lausuman johdattamina |
| `list_standards_packs` | Standardipaketit (`kshana standards-pack list`): pisteytetyt skenaariojoukot DHS Resilient PNT -viitekehyksen testiprofiileille, standardeille IMO MSC.1/Circ.1575 ja ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Yhden paketin ajo ennen ajoa ilmoitettuja kynnyksiä vasten: kukin testi `MET`, `NOT MET` tai `NEEDS INPUT`; MODELLED, ei arvioi yhtäkään tuotetta |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal tarkistettuna LNIS V5 AD1 Volume A:ta (LSIS-AFS V1.0) vasten: koodit painettuja taulukoita vasten tai symbolivirta kehysformaattia vasten; alikehysten 2–4 LDPC:tä ja CRC-24Q:ta ei varmenneta |
| `create_round_trip_pack` | Allekirjoitettu laboratorion edestakaisen kierroksen paketti: skenaario, `kshana.test-conditions/1`-dokumentti, vastaanotinloki ja pisteet tiivisteillä linkitettyinä |

**Vertailuarviointi**

| Työkalu | Mitä se tekee |
|---|---|
| `score_benchmark` | kshana-bench-toimitus pisteytettynä totuustiedostoa vasten, molemmat JSON-tekstinä (`kshana bench score`, `bench/SPEC.md`): tulostiedosto spesifikaatioversioineen, jakoineen, syötetiivisteineen ja tehtävän mittareineen. MODELLED; kuvaa lokia tai aineistoa, ei koskaan tuotetta. |
| `render_leaderboard` | kshana-benchin tulostiedostot esitettyinä staattisena tulostaulusivuna (HTML-teksti), kukin ensin validoituna. |

</details>

<a id="editions"></a>
## Versiot

Koko moottori on ilmainen. Kshana Pro ja räätälöidyt tutkimukset ovat ohjelmille, jotka tarvitsevat enemmän,
ja jokainen maksullinen reitti alkaa viestillä: hintoja ei ole tässä.
| | Free | Kshana Pro | Räätälöity tutkimus |
|---|---|---|---|
| Mikä se on | koko avoin moottori, kaikki 92 skenaariolajia, ei ominaisuusrajoituksia | suljettu kerros saman moottorin päällä, sopimuksella | järjestelmäsi MODELLED-tason PNT-häiriönsietokyvyn tutkimus, tehtynä puolestasi |
| Lisenssi | AGPL-3.0 (GNU Affero General Public License, versio 3) tai kaupallinen lisenssi | suljettu | sopimus |
| Miten aloittaa | [asenna](#install) tai avaa [kshana.dev](https://kshana.dev) | [pyydä Pro-arviointia](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [pyydä tutkimusta](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Mikä Pro on, tiedoston [`docs/PRO.md`](docs/PRO.md) sanoin:

> **Avoimen Kshanan tiukka ylijoukko.** Pro riippuu avoimesta moottorista kirjastona eikä
> koskaan haaroita sitä. Jokainen avoin skenaariolaji toimii Prossa muuttamattomana, ja avoin skenaario toimii
> Prossa ilman lisenssiä lainkaan.
>
> **Ei uutta fysiikkaa.** Pro ei lisää yhtään fysikaalista mallia eikä muuta yhtäkään. Jokainen Pron luku tulee
> avoimen moottorin ajoista, joten Pron luku on yhtä luotettava kuin se avoin skenaariolaji,
> josta se tuli, eikä koskaan enempää.

Pro vastaa ohjelman seuraaviin kysymyksiin: minkä suunnitelman kanssa lentää (suunnitteluoptimoija ja sen
Pareto-rintama), kuinka varma vastaus on (epävarmuus ja herkkyys) ja täyttääkö tehtävä
vaatimuksensa (tehtäväasiakirja, vaatimusten jäljitettävyys, kompromissitutkimukset,
skenaarioiden regressiotarkistus, kellojen digitaaliset kaksoset, tutkimusasiakirja ja paikallisesti ylläpidetty
palvelu). Se myös valvoo lukujen kampanjaa ja hylkää putken, kun jokin luku huononee,
testaa ehdokassignaalisuunnitelmia avoimia satelliittinavigointisignaaleja vasten molempiin
suuntiin (spektrin yhteiselo) ja jonouttaa tutkimuksia paikallisesti ylläpidettyyn työpalveluun
tiivisteketjutetun toimituskirjanpidon kera. Kukin kuvataan, sen tuotoksineen ja sen kera, mitä se ei tee, tiedostossa
[`docs/PRO.md`](docs/PRO.md). Mikään Pron tuottama ei ole sertifiointi, eikä räätälöity tutkimus
ole myöskään sertifiointi.

<details>
<summary>Mitä Kshana Pro lukee avoimesta moottorista, ja tuki Ashforde® OÜ:lta</summary>

<br>

**Minkä varaan Kshana Pro rakentuu.** Jokainen Pron osa toimii avoimesta moottorista ja jättää
sen muuttamattomaksi:

- **Suunnitteluoptimoija, epävarmuustutkimus ja tehtäväasiakirja** ajavat avoimen moottorin
  skenaarioita moottorin julkisen rajapinnan kautta ja laskevat jokaisen luvun ajojen
  tuloksista. Kukin tuotos säilyttää sen VALIDATED-, MODELLED- tai PARTNER-tason, jonka avoin moottori antoi
  kullekin luvulle, eikä koskaan korkeampaa.
- **Kellojen digitaaliset kaksoset** käyttävät avoimen moottorin kellomallia ja sen Allan-hajonnan
  estimaattoria: kaksonen kalibroidaan laitteen julkaistuun Allan-budjettiin ja tarkistetaan sitten
  estimoimalla kaksosen Allan-hajonta avoimella estimaattorilla.
- **Kompromissitutkimukset** ajavat jokaisen arkkitehtuurivaihtoehdon avoimen moottorin skenaariona muuttamattomana
  ja asettavat vaihtoehdot järjestykseen kunkin ajon tuloksesta luetun hyvyysluvun perusteella.
- **Kampanjan valvonta** lukee lukunsa paketin skenaarioiden avoimen moottorin ajojen
  tuloksista ja vertaa niitä edelliseen hyväksyttyyn ajoon.
- **Spektrin yhteiselo** lukee jokaisen fysikaalisen luvun lajien `leo-signal` ja
  `constellation-design` avoimen moottorin ajoista ja lisää vain summan näkyvissä olevien satelliittien
  yli sekä suunnitelmien järjestyksen.
- **Paikallisesti ylläpidetty työpalvelu** ajaa avoimia ja Pro-skenaarioita saman moottorin läpi ja
  tallentaa kunkin tuloksen sellaisena kuin ajo sen palautti.
- **Todistepaketit** tallentavat kustakin ajosta skenaarion tiivisteen, jonka avoin moottori leimaa
  tulokseensa, joten paketin luku voidaan toistaa ajamalla sen skenaario uudelleen.
- **Järjestelmäsuunnittelun ja ohjelman työkalut.** Kshana Pron mallipohjaisen
  järjestelmäsuunnittelun (MBSE) ja ohjelman työkalut tarkistavat ohjelman vaatimukset
  avoimen moottorin ajoja vasten: ne tuovat vaatimukset pilkuin erotettuina arvoina
  (CSV) tai Requirements Interchange Formatin (ReqIF) tai
  Systems Modeling Language -version 2 (SysML v2) tekstin dokumentoituna osajoukkona, arvioivat kunkin hyväksymis-
  kriteerin yksikköineen ajon kirjoittamia arvoja vasten ja tuottavat varmennuksen
  ristiviittausmatriisin (VCRM), SysML v2 -mallin, muutosvaikutusraportin ja offline-
  todistepaketin. Ne eivät aja uudelleen eivätkä laske uudelleen mitään, ja ne lukevat vain sen, mitä avoin moottori
  julkaisee: kunkin ajon `result.json`-tiedoston (kriteerin nimeämät kentät, niiden yksiköt,
  skenaarion tiivisteen, siemenen, moottorin version ja skeemaversion toistettavuusleiman sekä
  ajon merkinnän ja lukujen tasot), sen `report.json`-tiedoston (laji, toistettavuustietue ja
  ominaisuusmerkinnät), skenaariotiedoston (sen tiiviste, laji, siemen ja parametrit),
  kenttäyksikköjen skeeman (kunkin kentän yksikkö, alkuperä ja todistetaso) sekä
  varmennusmatriisin (kunkin ominaisuuden VALIDATED-, MODELLED- tai PARTNER-merkintä).

<a id="support--professional-services"></a>
### Tuki ja ammattipalvelut

Kshana on ilmainen ja avointa lähdekoodia AGPL-3.0-lisenssillä, ja sen **ammattimaisesti kehittää ja
ylläpitää Ashforde® OÜ** (Viro). Avoin moottori on täydellinen ja käyttökelpoinen
sellaisenaan. Organisaatioille, jotka tarvitsevat enemmän, Ashforde® OÜ tarjoaa:

- **Kaupallinen tuki ja integrointi** — Kshanan upottaminen työkaluketjuusi, räätälöidyt
  skenaariot ja etusijaiset korjaukset.
- **Räätälöidyt anturimallit** — kalibroituina laitteistoosi, mukaan lukien vientirajoitusten alaiset
  häiriönsietokyvyn mallit, joita ylläpidetään yksityisessä kerroksessa.
- **Kshana Pro** — suljetut mallipohjaisen järjestelmäsuunnittelun (MBSE) ja ohjelman
  työkalut, jotka tarkistavat ohjelman vaatimukset avoimen moottorin ajoja vasten ja
  tuottavat varmennuksen ristiviittausmatriisin (VCRM), Systems Modeling Language
  -version 2 (SysML v2) mallin, muutosvaikutusraportin ja offline-todistepaketin. Ne
  eivät aja mitään uudelleen ja lukevat vain moottorin julkaisemat tulosteet: kunkin ajon `result.json`-
  ja `report.json`-tiedostot, skenaariotiedoston, kenttäyksikköjen skeeman ja varmennus-
  matriisin merkinnät (koko luettelo on kohdassa [Versiot](#editions)).
- **Kshana Pron suunnittelu-, epävarmuus- ja tehtävätyökalut** — suunnitteluavaruuden Pareto-rintama,
  epävarmuus ja herkkyys tuhansien ajojen yli sekä yhdellä komennolla tuotettava tehtävä-
  asiakirja varmennusmatriiseineen ja PDF:ineen; katso [`docs/PRO.md`](docs/PRO.md).
- **Kshana Pron kampanjan valvonta, spektrin yhteiselo ja työpalvelu** — putki, joka
  epäonnistuu, kun valvottu luku huononee, signaalisuunnitelmat testattuina avoimia
  satelliittinavigointisignaaleja vasten molempiin suuntiin sekä paikallisesti ylläpidetty työjono
  tiivisteketjutetun toimituskirjanpidon kera; katso [`docs/PRO.md`](docs/PRO.md).
- **Koulutus ja konsultointi** kvantti-/klassisen PNT:n suorituskykyanalyysissa.

Tämä on open-core-malli: moottori on ja pysyy avoimesti lisensoituna; liiketoimintaa
ylläpitävät asiantuntemus, tuki ja suljetut laajennukset — eivät lisenssimaksut.
Yhteystiedot **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Tutkimus

Avoimen moottorin varaan rakennetut tutkimukset julkaistaan arXivissa. Kukin nimeää taustalla olevan moottorin
komennon, joten sen luvut voidaan tuottaa uudelleen tietovarastoon tallennetusta skenaariosta tai tutkimusesimerkistä.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Avoimen moottorin varaan rakennettu tutkimus: kuusi artikkelia arXivissa, kukin kortti nimeää artikkelin, sen päivämäärän ja kategorian sekä moottorin komennon, joka tuottaa sen luvut uudelleen. Samat kuusi artikkelia linkkeineen ja komentoineen ovat alla olevassa taulukossa." width="100%">
</picture>

| Artikkeli | Mitä se osoittaa | Moottorin komento |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | GNSS-häiriöilmaisimen pistemäärän pudotus olosuhteiden muuttuessa voidaan ennustaa pelkistä jakauman sisäisistä tilastoista, avoimella synteettisellä testialustalla ja sitten avoimilla kenttätallenteilla. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Harhautuksen alaisella GNSS-ajoitusvastaanottimella ei ole äärellistä ehdotonta rajaa havaitsemattomalle aikavirheelle, joten artikkeli antaa ehdollisen rajan, kalibroituna julkisen JammerTest 2024 -kampanjan tallennetulla ilmateitse tehdyllä harhautuksella. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Yksittäinen yhdistetty häiriönsietokyvyn pistemäärä on vakaa päätöksen perusta vain silloin, kun yksi suunnitelma dominoi; kun suunnitelmat kilpailevat, pelkkä uudelleenpainotus voi vaihtaa voittajan. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Etäisyysmittaus kuukonstellaation sisällä jättää pinta-aseman absoluuttisen paikan havaitsemattomaksi; Maasta mitattu erittäin pitkän perusviivan interferometrian (VLBI) viive palauttaa sen, kun konstellaatio on harva, ja terävöittää sitä, kun se on runsas. | laji `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Suunnitellut neljän–kuuden satelliitin konstellaatiot antavat huonon geometrian kuun etelänavalla, ja muutama pinnan etäisyysmittausmajakka korjaa sen paljon halvemmalla kuin lisäsatelliitit. | laji `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Tarkkuuden heikkenemiskerroin on määrittelemätön pelkkään etäisyyteen perustuvalle cislunaariselle seurannalle, koska nopeus on havaitsematon yksittäisellä hetkellä, joten artikkeli käyttää havaittavuuden Gramin matriisia neljällä tasomaisella kaukaisella retrogradisella radalla: pelkkä etäisyys on yksittäisellä hetkellä asteeltaan 2 / 4 ja tarvitsee noin 2.09 h:n kaaren tullakseen täysin havaittavaksi, ehdollisuuden parantuessa kaaren pidentyessä; etäisyyden muutosnopeus (Doppler) antaa asteen 4 välittömästi; ja aseman yhteisestimointi satelliittien tilojen ja kellojen kanssa jää asteeltaan yhden vajaaksi, ellei lisätä ulkoista interferometristä havaintosuuretta. Vaatimukset kuuluvat kaaren pituuden, ehdollisuuden ja mittaustyypin budjetteihin, eivät DOP:hen. | laji `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (sen sisarlaji `cislunar-arc-recovery` testaa kynnyksen riippumattomalla differenssiestimaattorilla) |

Kolme tutkimusesimerkkiä kirjoittavat tavutasolla deterministisiä artefakteja (kiinteät siemenet), jotka tallentavat
moottorin versionsa, siemenensä ja konfiguraation tiivisteen. Kolme kuuta ja cislunaarista avaruutta koskevaa artikkelia perustuvat
kuun kokonaisuuteen (kunkin osan todistetaso on varmennusmatriisissa); niiden geometria- ja tarkkuuden heikkenemiskerroinväitteet on myös ristiintarkistettu
erillisiä oraakkeleita vasten tiedostoissa `tests/validate_p*.rs`. Lisää kohdassa
[Toistettavat tutkimusartefaktit](#reproducible-study-artifacts) Viiteosassa.

<a id="cite"></a>
## Viittaaminen

Jos käytät Kshanaa akateemisessa tai teknisessä työssä, viittaa käyttämääsi versioon
skenaarion ja siemenen kera. [`CITATION.cff`](CITATION.cff) sisältää koneluettavat metatiedot, ja
GitHub näyttää sen perusteella "Cite this repository" -painikkeen. Jokainen julkaisu arkistoidaan Zenodoon;
konsepti-DOI (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) viittaa aina
uusimpaan versioon.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Yllä mainitut artikkelit:

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
## Lisenssi

Kshanalla on kaksoislisenssi: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)) tai Ashforde® OÜ:n
**kaupallinen lisenssi** suljettuun integrointiin, johon AGPL ei sovi.
[`LICENSING.md`](LICENSING.md) selittää, kumpi pätee. Kontribuutiot lisensoidaan sisään
AGPL:n alaisina, ja ne antavat lisäksi Ashforde® OÜ:lle oikeuden sisällyttää ne kaupalliseen
versioon; allekirjoita jokainen commit komennolla `git commit -s` (katso [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" ja sen merkit ovat Ashforde® OÜ:n tavaramerkkejä: lisenssi kattaa koodin, ei
nimeä, joten nimeä haarat uudelleen.

<a id="reference"></a>
## Viiteosa

Pitkä aineisto, taitettuna. Jokainen dokumentti on lueteltu kohdassa [Dokumentaatio](#documentation).

<details>
<summary>Asennus ja kääntäminen lähdekoodista</summary>

<a id="install--build"></a>
### Asennus ja kääntäminen

Vaatii Rust-työkaluketjun (≥ 1.88, Cargo.toml-tiedoston `rust-version`; kehitetty versiolla 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Käyttö: komentorivi kokonaisuudessaan</summary>

### Käyttö

Aja mikä tahansa skenaario; CLI valitsee toiminnon skenaarion `kind`-kentän perusteella ja kirjoittaa
tiedostot `<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` ja
`<scenario>.report.json` sen viereen — sekä `<scenario>.table.csv` niille lajeille, jotka
julkaisevat taulukon. Raportti (HyperText Markup Language (HTML) -sivu ja JSON-dokumentti
samalla sisällöllä) sisältää tiivistelmän, jokaisen syötteen yksikköineen, tulokset
ja kaaviot, kampanjan pyyhkäisy-, Monte Carlo- tai ketjutaulukot, tapahtumien aikajanan,
jokaisen ajon käyttämän ominaisuuden VALIDATED / MODELLED / PARTNER -merkinnän ja lähteen,
sen, mitä ei ole mallinnettu, sekä toistettavuustietueen (moottorin versio, Secure Hash
Algorithm 256-bit (SHA-256) -tiivisteet, siemen, alusta ja tarkka komento). Sen voi tulostaa
siistiksi PDF-tiedostoksi (Portable Document Format) selaimesta A4- tai Letter-paperille; moottori
ei itse kirjoita PDF:ää. Katso [`docs/REPORTS.md`](docs/REPORTS.md).

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

`--export <czml|kml|geojson|stk|sigmf|all|list>` kirjoittaa CZML- (Cesium Language), KML-
(Keyhole Markup Language), GeoJSON- (Request for Comments 7946), Ansys STK (Systems Tool Kit) `.e`
-efemeridit ja SigMF-tallenteet (Signal Metadata Format) skenaarion viereen, ja
`--import-route <route.geojson>` syöttää GeoJSON-viivan reittiä lentäviin lajeihin. Kukin
formaatti validoidaan julkaistua spesifikaatiotaan vasten, ja skenaario, johon formaatti
ei sovellu, kertoo syyn: katso [docs/INTEROP.md](docs/INTEROP.md).

**Muut CLI-tilat** — tarkista skenaario, syötä todellista Maan orientaatiodataa tai aja kokonainen sarja:

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

**Animaatiovienti.** `--animate svg|html|frames|all` kirjoittaa tiedoston `<scenario>.animation.svg`
(Cascading Style Sheets (CSS) -avainkehykset, ei skriptiä), tiedoston `<scenario>.animation.html` (toisto, tauko, selaus, nopeus ja
synkronoidut paneelit, ilman ulkoisia resursseja) ja hakemiston `<scenario>.frames/` (`frame_0000.svg`, … sekä
`manifest.json` kehysnopeuksineen ja kestoineen). Kampanja toistaa vaiheensa ja
hälytyksensä, spektriajo vesiputouksensa; teema seuraa asetusta `prefers-color-scheme`, ja
`prefers-reduced-motion` näyttää valmiin kuvan. Se renderöi ajon omat näytteet,
tavu-identtisinä uudelleenajossa, eikä lisää todisteita. Katso [docs/ANIMATION.md](docs/ANIMATION.md).

**Sarjan** manifesti on pieni TOML-tiedosto (Tom's Obvious, Minimal Language) — `title` ja skenaariopolkujen `scenarios = [ … ]` -taulukko
—, jonka skenaariot moottori ajaa vuorotellen ja kokoaa jokaisen tuloksen (MODELLED / VALIDATED
-merkintöineen) yhdeksi itsensä kuvaavaksi tutkimusartefaktiksi. Katso
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Rooli yhteentoimivuudessa.** Kshana on *suorituskykysimuloinnin* kerros, joka toimii
jälkikäsittelyn työkaluketjun rinnalla, ei sen korvikkeena: syötä sen **RINEX**-
tuloste RTKLIBiin tai gLABiin paikkaratkaisua varten ja käytä sen **SP3**-tulostetta
tarkkana ratatuotteena Ginanin kaltaisille työkaluille — Kshana vastaa siihen, *minkä häiriönsietokyvyn tietty
PNT-arkkitehtuuri tuo*, ennen kuin sinulla on todellisia signaaleja, formaateissa, joita nämä työkalut jo
lukevat (`--export-sp3` tai `export_sp3 = true` `orbit`-skenaariossa kirjoittaa
tiedoston `<scenario>.sp3`). Saman radan voi julkaista standardiraiteen **CCSDS OMM**
-keskielementteinä (`--export-omm` tai `export_omm = true` kirjoittaa tiedoston `<scenario>.omm`) —
yksi OMM 502.0 KVN -viesti (avainsana = arvo -notaatio) TLE:llä määriteltyä satelliittia kohden, sisältäen kunkin kohteen todellisen
NORAD-luettelonumeron (North American Aerospace Defense Command), COSPAR-kansainvälisen tunnuksen (Committee
on Space Research) ja epookin, mille tahansa
OMM:ää ymmärtävälle kuluttajalle räätälöidyn kaksirivielementtijoukon sijaan.

Esimerkkituloste (kellon holdover — huomaa, miten eheyden ja turvallisuuden hyvyysluvut raportoidaan):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Optisen kellon 95. persentiilin (p95) ajoitusvirhe on 1.20e-4 ns: yhteenveto
tulostaa pienet arvot merkitsevin numeroin sen sijaan, että pyöristäisi ne arvoon `0.0`.
`security` näyttää `n/a (no attack)`, koska tämä skenaario ei määrittele hyökkäystä, joten
havaittavaa ei ole. JSON-tulos sisältää silti kunkin kellon analyyttisen
harhautuksen havaittavuusrajan kentässä `fom.security` (0.997 optiselle kellolle, 0.000
sirukokoiselle atomikellolle, jonka oma kohina valvontaikkunan aikana ylittää 20 ns:n
spesifikaation), ja sen `figure_tiers`-lohko merkitsee tämän luvun `applicable: false`. `spoof`-
skenaariolaji pisteyttää havaitsemisen lisättyä hyökkäystä vasten. `figure_tiers` antaa myös
jokaiselle raportoidulle luvulle sen varmennustason — VALIDATED (tarkistettu ulkoista
oraakkelia vasten) tai MODELLED — sekä varmennusmatriisin rivin, josta taso luetaan. Rata-
skenaario raportoi lisäksi geometrialohkon — paikannuksen sisältävien näytteiden osuuden sekä
paikan tarkkuuden heikkenemiskertoimen (PDOP) ja paikkatarkkuuden parhaan/mediaanin — kellotuloksen
rinnalla.

> **Lue nämä kaksi lukua huolellisesti.** `security` on kunkin kellon stabiiliudesta johdettu *analyyttinen harhautuksen havaittavuus-
> raja* — sillä on merkitystä vain määriteltyä harhautusskenaariota vasten, eikä se
> **ole** monisatelliittinen RAIM-ilmaisin. `integrity`
> tässä on suodattimen *itsejohdonmukaisuus* (niiden katkonäytteiden osuus, jotka ovat sen oman k-sigma-
> rajan sisällä), **ei** ilmailun HPL/VPL-eheysluku. Katso
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Aitoa vastaanottimen autonomista eheyttä varten **`integrity`-skenaariolaji**
> (`scenarios/integrity-raim.toml`) ajaa todellisen snapshot- ja ratkaisujen erotteluun perustuvan
> (ARAIM-tyylisen) RAIM:n propagoidun konstellaatiogeometrian yli: se laskee
> vaaka-/pystysuuntaiset **suojaustasot (HPL/VPL)** epookeittain ja raportoi niiden
> epookkien osuuden, jotka täyttävät määritellyt hälytysrajat, Stanfordin
> eheyskaavion kera virhe vs PL (suojaustaso) -luokittelua varten.

<a id="reproducible-study-artifacts"></a>
#### Toistettavat tutkimusartefaktit

Neljä avointa tutkimusta tuottaa kukin uudelleen tavutasolla deterministisen artefaktin (kiinteä siemen) yhdellä
komennolla — luvut, jotka ovat kvantti- vs klassinen -risteyksen, RF-heikennysten
optimismivajeen, PNT-häiriönsietokyvyn pisteytyksen ja ajoituksen suojaustason tutkimusten taustalla:

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

Kukin artefakti tallentaa moottorin versionsa, siemenensä ja konfiguraation tiivisteen ja kantaa rehellistä
MODELLED/VALIDATED-merkintää. Todellisen datan koettimet (`*_probe`) ajavat saman putken
paikallisesti toimittamiesi tallenteiden yli; tietovarastossa ei toimiteta aineistoja. RF-heikennysten
optimismivajetutkimus on julkaistu esipainoksena
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), ja ehdollinen ajoituksen
suojaustaso (`tpl_jammertest` yllä) esipainoksena
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (katso [Viittaaminen](#cite)).

Julkaistujen kuun PNT-tutkimusten ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
pintamajakoiden DOP, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) VLBI-
havaittavuus ja [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) cislunaarisen kaaren pituuden
havaittavuus) geometria-, tarkkuuden heikkenemiskerroin-, reaaliaikaisen koordinaatiston /
Maan orientaatioparametrien (EOP) ennuste-, kaukaisen retrogradisen radan ja RF-etäisyysmittauksen
väitteet on riippumattomasti ristiintarkistettu tiedostoissa
`tests/validate_p*.rs` erillisiä oraakkeleita vasten (`scipy.special.j1`, riippumaton NumPy
`(HᵀH)⁻¹` -DOP-ratkaisu, samojen IERS `finals2000A` -rivien NumPy-uudelleenjäsennys sekä
NASA/JPL:n Three-Body Periodic Orbit Database). Nämä ovat lisäregressiotarkistuksia
**mallinnetun** kuukokonaisuuden päällä; ne eivät muuta koneellisesti tarkistetun matriisin määriä.

</details>

<details>
<summary>Skenaarioformaatti</summary>

<a id="scenario-format"></a>
### Skenaarioformaatti
Skenaariot ovat deklaratiivista TOML:ää. Ylimmän tason `kind` valitsee paketin — yhteensä **viisikymmentä**
(`clock` on oletus, jos se jätetään pois): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (tekoäly/ML-pohjaisen RF-heikennysten havaitsemisen
arviointitestialusta — merkitty synteettinen aineisto + ilmaisimesta riippumaton ROC/AUC-kehys +
jakauman sisäinen/ulkoinen optimismivaje), `quantum-trade` (kvantti- vs klassinen PNT
-kompromissi mitatun ADEV:n sisäänluvulla + GNSS-vapaan häiriönsietokyvyn verhokäyrä; MODELLED),
`space-weather` (auringon/geomagneettiset indeksit + Jacchia-71-eksosfäärilämpötila +
aktiivisuuden ohjaama termosfäärin tiheys staattisen ilmakehän päällä; MODELLED),
`oem-interop` (CCSDS OEM -tuonti/edestakainen silta GMAT/Orekit/STK-efemerideille;
MODELLED), tehtäväanalyysin kolmikko `launch-window` (kahden kappaleen laukaisuatsimuutti /
ratatason muutos / mahdollisuudet), `reentry` (Allen-Eggersin ballistinen paluukäytävä),
`eo-coverage` (EO-keilan leveys / GSD / pääsy / uudelleenkäyntigeometria), `space-packet` (CCSDS
133.0 TM/TC — telemetria/telekomento — Space Packet -kehystys — tarkka bittirakenne, edestakaisesti varmennettu) ja
`attitude-budget` (3-DOF-gravitaatiogradienttimomentti + RSS-osoitusvirhebudjetti),
`passes` (maa-asemaylilentojen nousu-/laskuennustus — AOS/TCA/LOS, suurin korkeuskulma,
yhteysaika) ja `link-budget` (yksisuuntainen CCSDS/DSN-linkkiyhtälö — FSPL / Eb·N₀ /
marginaali / sulkeutuminen); `telecom-timing` (holdoverin aikavirhe, MTIE ja TDEV tarkistettuina
ITU-T-maskeja vasten); `spectrum` (koko GNSS:n L-kaista yhtenä tehospektritiheytenä:
taajuus-aika-vesiputous käsikirjoitetun jatkuvan aallon, kapeakaistaisen, chirp- tai
sovitetun kohinan häiritsimen aikajanan alla, kaistakohtainen häiritsin-signaali-suhde ja efektiivinen
kantoaalto-kohinatiheys spektrierottelukertoimesta sekä Signal Metadata
Format (SigMF) -tallenteiden syöte ja tuloste Welch-spektriestimaatein; signaali-
spektrit VALIDATED oppikirja-arvoja vasten, häiritsinskenaario MODELLED; katso
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); sama laji piirtää UHF-, S- ja C-kaistan paneelit
suunnitelluilla matalan Maan kiertoradan signaaleilla); `leo-signal` (matalan Maan kiertoradan paikannus-, navigointi- ja
ajoitussignaalien suunnitelmat mille tahansa järjestelmälle: kaistarajoitetut spektrit, koodinseurannan värinä ja etäisyysmittauksen
tarkkuus, hankinnan haku ja aika, spektrierottelu GPS:ää ja Galileota vasten, häiritsimen
sieto ja UHF–C-kaistakompromissi, julkisista esiasetuksista kuten Xona Pulsar, Iridium,
Starlink ja CentiSpace tai sisäisistä suunnitelmista; suljetut muodot ja LEO:n Doppler VALIDATED,
suunnitelmat MODELLED; katso [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (Aurinko, planeetat, Pluto, Kuu ja seitsemän suurta
kuuta yhtenä epookkina — paikat, vakiot, valon kulkuajat ja ratajäljet; planeettojen paikat
VALIDATED JPL Horizonsia vasten) ja `body-pnt` (paikannus minkä tahansa näiden kappaleiden ympärillä
paikallisella navigointikonstellaatiolla ja syvän avaruuden linkillä Maasta; MODELLED); `campaign` (olemassa olevat lajit koottuina ketjutetuksi tehtävän aikajanaksi
vaiheiden välillä luovutettavalla tilalla, parametripyyhkäisyksi, siemennetyksi Monte Carlo -joukoksi tai
useaksi skenaarioksi yhden yhteisen ehdon alla; MODELLED, katso
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (Walker-delta- ja tähti-
kuviot, elementtiluettelot ja monikuoriset suunnitelmat GPS-, Galileo-, BeiDou- ja GLONASS-
esiasetuksin sekä kattavuus ja tarkkuuden heikkenemiskerroin leveys-/pituusasteruudukolla;
generaattori ja GPS:n maailmanlaajuinen DOP VALIDATED julkaistuja palveludokumentteja vasten, katso
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (matalan Maan
kiertoradan (LEO) paikannus-, navigointi- ja ajoitussatelliitin (PNT) ylilento ja sen linkkibudjetti kaista
kaistalta, mistä tahansa konstellaatiosta ja mistä tahansa signaalisuunnitelmasta: katselukulmat, Doppler ja Dopplerin muutosnopeus,
ITU-R-sade, kaasut, tuike ja rakennukseen tunkeutumisen vaimennus, kantoaalto-kohinatiheys verrattuna
näkyvissä oleviin MEO-GNSS-satelliitteihin, ensimmäisen kertaluvun ionosfääri ja ionosfäärivapaat parit sekä
matalaenerginen paikannusbudjetti, ionosfääriluotaus jokaisesta kaistaparista sekä harhautusvalvonnat
Dopplerin ja ylilentogeometrian johdonmukaisuuden ja kaistojen välisen johdonmukaisuuden perusteella; ITU-R-termit ja
paikallaan olevan käyttäjän Doppler-verhokäyrä VALIDATED, ylilento MODELLED, katso
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (matalan Maan kiertoradan (LEO) PNT-satelliitin
yleislähetetty efemeridi- ja kelloviesti mille tahansa radalle ja
kantoaallolle: sovittaja integroidusta totuusradasta Galileon Kepler-joukkoon, tämä joukko
radan suuntaisilla, poikittaisilla ja radiaalisilla korjauspolynomeilla, Liu et al. 2025
-22-parametrinen malli tai ATOMIC-nollakellon ECEF-polynomi; signaalin etäisyysvirhe avaruudessa
(SISRE) sovitusvälin ja päivitysjakson funktiona, ylilennon keskellä tapahtuvan päivityksen jatkuvuustarkistus,
Kshanan oma dokumentoitu binäärikehys CRC-24Q-syklisellä tarkistussummalla ja kvantisointibudjetilla sekä
RINEX-4-tyylinen lohko, joka on merkitty Kshanan laajennukseksi; SISRE-painot, Galileon käyttäjä-
algoritmi ja CRC-24Q VALIDATED, sovitukset MODELLED; valinnaiset esiasetukset Xona Pulsarille,
Iridiumille, Starlinkille, CentiSpacelle, edustavalle C-kaistan järjestelmälle, ATOMICille ja Celeste IOD:lle; katso
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); **yhdistetyn MEO + LEO
PNT:n** kolmikko `leo-pvt` (Doppler-paikannus matalan Maan kiertoradan (LEO) etäisyyden muutosnopeudesta, yhdistetyt
GNSS + LEO -pseudoetäisyyspaikannukset järjestelmien välisin biaksin ja DOP LEO-satelliittien
määrän funktiona, napa- ja arktinen kattavuus sekä LEO-aikasiirto UTC:hen — minkä tahansa konstellaation yli,
valinnaisin esiasetuksin kuten Xona Pulsar, Iridium ja Starlinkin opportunistiset signaalit;
LEO:n Doppler-verhokäyrä VALIDATED julkaistuja Iridium- ja Xona-lukuja vasten), `leo-ppp`
(tarkan pistepaikannuksen konvergenssi pelkällä GNSS:llä ja LEO-täydennyksellä, verrattuna
lähteeseen Li et al. 2019) ja `ntn-positioning` (5G:n ei-maanpäällisen verkon paikannus
signaalin kaistanleveyden Cramér-Rao-rajasta), MODELLED kyseistä verhokäyrää lukuun ottamatta, katso
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (yksi LEO-PNT-järjestelmä päästä
päähän: `leo-signal`-suunnitelma `leo-pass`-kaistan kantamana, ylilennon C/N0 ja navigointi-
viestin signaalin etäisyysvirhe avaruudessa luovutettuna yhdistetylle `leo-pvt`-paikannukselle ja `leo-ppp`-
konvergenssille, jokainen luovutus lueteltuna; MODELLED, katso
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), joka on myös yleiskatsaus
jokaisesta LEO-PNT-lajista ja -skenaariosta, mukaan lukien häiriönsietokampanjat, yksi skenaario
kutakin koealuetta kohden ja yksi kutakin loppukäyttäjän toimialaa kohden); **kuun PNT-kokonaisuus** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **kvanttipohjaisen PNT:n demonstraattori**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; sekä
**signaaliturvallisuuden, cislunaarisen avaruuden ja kerroksellisen häiriönsietokyvyn** tutkimuslajit `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — tehtäväanalyysin kolmikko ja nämä myöhemmät lajit kaikki MODELLED
(kullakin validoitu suljetun muodon ydin; katso matriisi).
Yhteiset kentät: `seed`, `[time]`-ruudukko, `[gnss]`-käytettävyysaikajana (katkon
ohjain) sekä anturikohtaiset lohkot `provenance`-merkkijonoineen, jotka mainitsevat jokaisen
luvun lähteen. Esimerkki (kello):

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

Valinnaiset kentät (pois päältä, kun puuttuvat): kello voi lisätä kentän `flicker_floor` (1/f FM — taajuus-
modulaatio — Allan-alaraja); inertia-anturi voi lisätä kentät `gyro_bias` ja `q_arw` (gyroskoopin biasi ja kulman
satunnaiskulku) sekä `bias_instability` ja `q_aa` (Allan-biaksen epävakauden alaraja ja
kiihtyvyyden satunnaiskulku) — yhdessä **yksiakselinen (1-DOF) kiihtyvyysanturin virhe-
budjetti** (VRW/ARW — nopeuden/kulman satunnaiskulku — ja biaksen epävakaus). Tämä on virhebudjetti, jota toimitettu
`inertial`-skenaario*paketti* ajaa. Erikseen kirjastossa on nyt varmennettu
**3-akselinen strapdown-navigaattori** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
kvaternioasento coning/sculling-kompensoinnilla, täysi NED-mekanisointi
(Maan pyörimis- ja kuljetusnopeustermit, WGS-84 Somigliana -painovoima) sekä
deterministinen IMU-virhemalli, jossa **skaalauskerroin, kohdistusvirhe,
g-herkkyys, kvantisointi ja nopeusramppi on mallinnettu** (IEEE Std 952-1997, IEEE:n
gyroskooppien spesifikaatio- ja testimenettelystandardi, §A.2; Groves 2013 §4.3). Tämä 3-akselinen polku on nyt **kytketty ajettavaan
löyhästi kytkettyyn GNSS/INS-pakettiin** (`kind = "gnss-ins"`): 15 tilan virhetila-EKF
ohjaa strapdown-ratkaisua kohinaisia paikannuksia vasten GNSS:n ollessa käytössä ja
kulkee sitten katkon läpi, raportoiden yhdistetyn vaakavirheen verrattuna
avoimen silmukan vapaaseen INS-kulkuun. **Tiukasti kytketty pseudoetäisyys**päivitys on myös
käytettävissä (se muodostaa innovaation etäisyysalueessa, joten se jatkaa korjaamista
alle neljällä satelliitilla). Kellon
holdover-skenaario voi lisätä kentän `runs` (> 1) ajaakseen **Monte Carlo -joukon** — kukin
hyvyysluku raportoidaan tällöin keskiarvona 5.–95. persentiilin hajonnan kera, ja
kaavio varjostaa virheen luottamuskaistan (katso `scenarios/clock-ensemble.toml`).

`fusion`-skenaario (samat lohkot kuin `hybrid`) ajaa **kaksi riippumatonta Kalman-estimaattoria**
— yhden kellon tilalle, yhden paikan tilalle — GNSS:n ohjaamina ja
optisen aikasiirron avustamina, ja raportoi yhdistetyn holdover-FoM:n. Kahdella lohkolla ei ole yhteistä
ristikovarianssia: tämä on pinottu virhebudjettien pari, **ei** aito kytketty
kello+paikka-yhteissuodatin (lohkojen välinen kovarianssi on tiekartalla). Katso
`scenarios/fusion-pnt.toml`.

`spoof`-skenaario lisää ajan harhautuksen — yhden neljästä `[attack.shape]`-lajista
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; pelkkä `rate_ns_per_s` hyväksytään edelleen
lineaarisena ramppina) — ja ajaa kunkin kellon harhautusilmaisimen. Ilmaisin on
kaksipuolinen **χ²₁-energia- / Neyman–Pearson-testi** kelloavusteisen valvonnan tunnusluvulle:
kynnys asetetaan väärien hälytysten tavoitebudjetista `target_pfa`, ja
**havaitsematta jäämisen todennäköisyys `P_md`** raportoidaan sekä suljetussa muodossa että
Monte Carlolla (`mc_runs` koetta hypoteesia kohden — molemmat ovat yhtäpitäviä muutaman ×1/√N:n tarkkuudella).
**Turvallisuuden hyvyysluku on `1 − P_md`** operatiivisesti haitallisella (spesifikaation)
suuruudella, joten hiljainen kello, joka havaitsee spesifikaation kokoisen harhautuksen, saa pisteet ≈ 1, ja kohinainen
kello, joka usein ei havaitse sitä, saa vähemmän (katso `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

`gnss-sim`-skenaario on **mittausalueen** simulaatio: kullekin näkyvälle
satelliitille se syntetisoi pseudoetäisyyden `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` ja L1-Dopplerin, **Klobuchar**-yksitaajuus-
ionosfäärillä (`[iono]`, IS-GPS-200 §20.3.3.5.2.5) ja **Saastamoisen** zeniittisellä
troposfäärillä, joka projisoidaan **Niellin (1996)** kuvausfunktiolla (`[tropo]`). Jäännökset
syöttävät **snapshot-RAIM:ia** epookkikohtaista HPL/VPL:ää varten, ja jokaisen satelliitin
pseudoetäisyys, Doppler, C/N₀ ja iono-/troposfäärikorjaukset tuotetaan JSON-
taulukossa `gnss_measurements`. Se on eteenpäin suuntautuva simulaattori (se tuottaa mittauksia
tunnetusta totuudesta), ei vastaanotin/ratkaisija — kohinaton ajo toistaa geometrian sekä
korjaukset alle millimetrin tarkkuudella (katso `scenarios/gnss-sim-raim.toml`).

`jamming`-skenaario mallintaa RF-häiriön **linkkibudjettina**: `[jammer]`
(ECEF-paikka, lähetysteho `power_dbw`, tyyppi) nostaa häiritsin-signaali-suhdetta
`[receiver]`-vastaanottimessa, joka seuraa Walker-`[constellation]`-konstellaatiota. Geometriasta (vapaan tilan
vaimennus ja suuntakohtainen vastaanottoantennin vahvistus) se laskee kunkin satelliitin
`J/S`:n, **efektiivisen C/N₀:n** standardin häirinnänestoyhtälön kautta (hajotuksen purun
prosessointivahvistus × spektrierottelukerroin `Q`; Kaplan & Hegarty §9.4) ja
liputtaa lukituksen menetyksen määriteltävän seurantakynnyksen alapuolella — raportoiden
`availability_under_jamming`-hyvyysluvun. 10 W:n laajakaistainen häiritsin 1 km:n päässä
estää vastaanottimen kokonaan (J/S ≈ 72 dB); sama häiritsin 100 km:n päässä vain
heikentää linkkejä (katso `scenarios/jamming-demo.toml`).

`sweep`-skenaario ajaa **kompromissitutkimuksen**: se muuttaa yhtä `parameter`-arvoa (`threshold_ns`,
`duration_s`, `quantum_q_wf` tai `classical_q_wf`) arvosta `start` arvoon `stop` `steps`
pisteessä `lin`- tai `log`-asteikolla (`scale`), tallentaa `metric`-arvon (esim. `holdover_s`) molemmille
kelloille ja piirtää kaksi käyrää. Perusskenaario sijoitetaan kohtaan `[base]` (katso
`scenarios/sweep-clock-stability.toml`).

`sweep-nd`-skenaario yleistää tämän **mihin tahansa pakettiin ja mihin tahansa akselimäärään**: se
muuttaa `[base]`-skenaarion (minkä tahansa `kind`-lajin) pisteellä erotettuja TOML-avaimia
`[[axes]]`-akseleiden karteesisen tulon yli, ajaa jokaisen ruudukon solmun uudelleen ja tallentaa `metrics`-arvot,
jotka annetaan pisteellä erotettuina JSON-polkuina tulokseen (esim. `classical.fom.holdover_s`). Se toimii
jokaiselle paketille, koska se toimii TOML/tulos-rajapinnassa; natiivit ajot laskevat
ruudukon rinnakkain (ei lisäriippuvuutta, wasm palaa sekventiaaliseen) ja
tuloste on deterministinen ja rivijärjestyksinen (katso `scenarios/sweep-nd-inertial.toml`).

`orbit`-skenaario johtaa `[gnss]`-aikajanan geometriasta sen käsin kirjoittamisen sijaan
— anna `[user]`-rata, `[constellation]`, korkeuskulmamaski `mask_deg` ja kaksi
kellolohkoa. Se raportoi myös paikkatarkkuuden satelliittigeometriasta; valinnainen
`sigma_uere_m` (1-sigman käyttäjäekvivalentti etäisyysvirhe, oletus 1 m) skaalaa
paikan tarkkuuden heikkenemiskertoimen paikan sigmaksi. Käyttäjän rata voidaan tehdä
**eksentriseksi** kentillä `eccentricity` ja `argp_deg`, ja `j2 = true` lisää Maan litistyneisyyden
sekulaarisen ryöminnän (katso `scenarios/orbit-molniya.toml`). Konstellaatio voi sen sijaan olla
**todellinen**: anna `[constellation]`-lohkolle `tle`-lohko kaksirivielementtejä, niin
satelliitit jäsennetään siitä (katso `scenarios/orbit-real-tle.toml`). Lisää yksi tai useampi
`[[constellations]]`-lohko **monijärjestelmäistä GNSS:ää** varten (esim. GPS + Galileo; katso
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

**GPS-vapaat vaihtoehtoisen PNT:n** lajit navigoivat ilman GNSS:ää lainkaan, sovittaen mitattua kenttä-
sarjaa karttaan partikkelisuodattimen avulla. `gravity-map`-skenaario lentää reitin
palloharmonisen painovoima-anomaliakentän läpi ja palauttaa sen kylmien atomien
gravimetrin lukemasta (`scenarios/gps-denied-gravity-nav.toml`); `terrain-nav`-skenaario
tekee saman SRTM-korkeusmallia (DEM) vasten (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
ja `combined-altpnt`-skenaario yhdistää **painovoiman + IGRF-magneettikentän + maaston** yhdessä suodattimessa
(`scenarios/combined-altpnt.toml`).

`lunar-integrity`-skenaario arvioi **cislunaarista** PNT:tä: se ajaa kuun etelänavan
ARAIM-suojaustasoylilennon LunaNet/LNIS-välitysjoukkoa vasten ja raportoi rehellisesti
eheysvajeen — ~30 m:n kuun σ_URE nostaa suojaustason selvästi yli 50 m:n hälytys-
rajan, joten palvelu on *käyttökelvoton* ilmailutyyppisten eheyssääntöjen mukaan
(`scenarios/lunanet-araim.toml`).

`lunar-time-offset`-skenaario raportoi **relativistisen Maa–Kuu-kellonopeuden** —
Lunar Coordinate Time -aika-asteikon (LTC/TCL) perustan. Ensimmäisistä periaatteista lähtevä post-newtonilainen
identiteetti summaa omapotentiaalien erotuksen (IAU:n `L_G`-geoidipotentiaali miinus Kuun
pinnan omapotentiaali) ja Kuun kineettisen (toisen kertaluvun Doppler-) termin sekulaariseksi
nopeudeksi ≈ 57 µs/vrk, raportoituna julkaistun 56–59 µs/vrk -kaistan kanssa; se antaa myös
kertyneen LTC−TT-poikkeaman aikahorisontin yli sekä käänteisvarianssipainotetun joukon (kuun
paperikello). **MODELLED** — pääluku on *viitteestä riippuvainen* (Maan geoidi
vs kuun selenoidi, keskiarvostusikkuna), minkä vuoksi raportoidaan kaista eikä yksittäinen sertifioitu
luku (`scenarios/lunar-time-offset.toml`).

Hakemistossa `scenarios/` on vähintään yksi työstetty esimerkki jokaisesta lajista (92 lajia, 193 skenaarion
`.toml`-tiedostoa + 1 sarjan manifesti — useilla lajeilla on enemmän kuin yksi esimerkki). Jokaisella
lajilla ei ole sen mukaan nimettyä tiedostoa: `lunar-integrity` → `scenarios/lunanet-araim.toml` ja
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` ovat kaksi useista tällaisista.
Luettele välitettävät lajit milloin tahansa komennon `cargo run -- --validate <file>`
virheilmoituksista, Pythonin funktiolla `list_kinds()` tai MCP-työkalulla `list_scenario_kinds`.

</details>

<details>
<summary>Tulosteet</summary>

### Tulosteet

Tulosartefakti on versioitua, itsensä kuvaavaa JSON:ia: askelkohtaiset aikasarjat,
pisteytetyt hyvyysluvut, aktiiviset mallispesifikaatiot (alkuperätietoineen), siemen,
**skenaarion tiiviste** — joten minkä tahansa kaavion voi toistaa tiedostosta — sekä kullekin kellolle
`adev_curve`-kenttä (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): limittäinen
Allan-hajonta oktaaveittain jaetuilla keskiarvostusajoilla — vakiotapa lukea kellon
stabiilius — nyt **kohinatyyppikohtaisella 95%:n luottamuskaistalla** kullekin pisteelle (tietueen
potenssilain tyyppi tunnistetaan sen modifioidun Allan-hajonnan kulmakertoimesta, ja χ²-väli käyttää
vastaavia NIST SP 1065 -efektiivisiä vapausasteita). Selaimen kokeiluympäristö esittää sen
log-log-kaaviona "Clock stability (ADEV)". (MDEV, TDEV ja HDEV ovat käytettävissä kirjaston
estimaattoreina; viety tuloskäyrä on limittäinen ADEV.) Jokainen kenttä yksikköineen ja
lähdeviitteineen on dokumentoitu tiedostossa [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Jokainen kaavio kuvaa itsensä.** Selaimen kokeiluympäristö, CLI:n `*.chart.svg`-
vienti ja HTML-tuloskortti (HyperText Markup Language) leimaavat kaikki jokaiseen kaaviokuvaan alatunnisteen
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` on ajon **skenaarion tiivisteen**
12 ensimmäistä heksamerkkiä — SHA-256-tiiviste (256-bittinen Secure Hash Algorithm) kanonisesta skenaarion
määrittelystä (siemen, kynnykset, malliparametrit, GNSS-ikkunat, …); eheys- ja kuu-
raportit, joilla ei ole omaa tiivistettä, käyttävät sen sijaan skenaarion lähdetekstin SHA-256-tiivistettä.
Se on **sama sormenjälki**, joka näkyy yhden rivin yhteenvedossa ja tulos-JSON:ssa, joten
tallennettu tai liitetty kaavio kantaa aina versionsa, sen tuottaneen tarkan skenaarion (bitti
bitiltä -toistoa varten) ja lähteen — muuta mitä tahansa syötettä, niin tiiviste muuttuu.

Hyvyysluvut noudattavat operatiivisen PNT:n vakiohyvyyslukuja:

| Hyvyysluku | Miten Kshana laskee sen |
|-----------------|------------------------|
| Ajoitussuorituskyky (kello-/ratapaketit) | kellon vaihevirheen RMS + 95. persentiili katkon yli, **nanosekunteina** (`timing_rms_ns`) — ajoitusmittari, ei paikka |
| Paikannussuorituskyky (inertia-/hybridipaketit) | 1-DOF-paikkavirheen RMS + 95. persentiili katkon yli, **metreinä** (`pos_rms_m`); yksiakselinen. Yksittäinen ajo merkitään `monte_carlo: false`; aseta `runs = N` Monte Carlo -joukolle, joka raportoi kunkin mittarin keskiarvon, hajonnan ja bootstrap-95%:n CI:n (luottamusväli). Edelleen **ei** 2-D CEP/2DRMS (ympyrävirhetodennäköisyys / kaksinkertainen neliöllinen keskietäisyys) eikä DOP-painotettu tarkkuus (ne vaativat 3-akselisen mallin — tiekartalla) |
| Autonomia | holdoverin kesto — aika spesifikaation sisällä GNSS:n menettämisen jälkeen (ruudukkoon kvantisoitu: alaraja) |
| Häiriönsietokyky | virheen kasvun kulmakerroin katkon aikana |
| Käytettävyys | ajon osuus, jolla on spesifikaation sisällä oleva ratkaisu |
| Eheys | suodattimen **itsejohdonmukaisuus** — niiden katkonäytteiden osuus, joiden virhe pysyy Kalman-suodattimen oman k-sigma-rajan sisällä. **Ei** ilmailun HPL/VPL/RAIM-eheysluku (katso [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Turvallisuus | **analyyttinen harhautuksen *havaittavuus*raja** kellon stabiiliudesta — kuinka pienen/hitaan ajan harhautuksen yhden kellon johdonmukaisuusvalvonta voisi liputtaa. Merkityksellinen vain määritellyn hyökkäyksen kanssa; **ei** monisatelliittinen RAIM-ilmaisin |

Ovatko termit uusia? Kukin on määritelty selkokielellä [sanastossa](docs/GLOSSARY.md).

</details>

<details>
<summary>Tietovaraston rakenne</summary>

### Tietovaraston rakenne

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
<summary>UKK (usein kysytyt kysymykset)</summary>

### UKK

**Täytyykö minun ymmärtää kvanttifysiikkaa käyttääkseni tätä?**
Ei. Jos osaat käyttää komentoriviä, osaat ajaa Kshanaa. Aloita
[selkokielisestä johdannosta](docs/CONCEPTS.md); etsi termejä [sanastosta](docs/GLOSSARY.md).

**Onko tämä kvanttilaitteiston suunnitelma tai lento-ohjelmisto?**
Ei. Se on suorituskyvyn *simulaattori*. Kvanttilaitteiston tarkkuus tulee julkaistuista
virhemalleista, ei tästä työkalusta. Katso [Mitä se on / mitä se ei ole](#what-it-is--is-not).

**Ovatko kvanttitulokset realistisia vai markkinointia?**
Jokainen parametri on viitattu datalehteen tai artikkeliin, jokainen malli on validoitu
oppikirjan relaatiota vasten, ja kypsyys on merkitty rehellisesti tiedostossa
[VALIDATION.md](docs/VALIDATION.md) — mukaan lukien se, ettei yksikään strontium-optinen kello ole
lentänyt. Moottori on puolueeton: kvantti ja klassinen ovat samaa koodia eri
julkaistuilla luvuilla.

**Voinko luottaa siihen, että kaksi ajoa ovat yhtäpitäviä?**
Kyllä — ajot ovat deterministisiä: `scenario + seed + engine version → bit-identical output`,
valvojana `scripts/check-reproducible.sh`.

**Voinko käyttää sitä Pythonista tai selaimessa?**
Kyllä — katso [Asennus](#install): Python- ja WebAssembly-esimerkit ovat sen alla. Molemmat kutsuvat samaa moottoria.

**Miten mallinnan oman anturini?**
Kirjoita skenaario-`.toml` anturisi julkaistuilla luvuilla `provenance`-
kentissä. Katso [Skenaarioformaatti](#scenario-format) ja esimerkit hakemistossa `scenarios/`.

**Onko se ilmainen kaupalliseen käyttöön?**
Kyllä — AGPL-3.0:n alaisena, myös kaupallisissa yhteyksissä, kunhan noudatat
AGPL:n copyleft-ehtoja (erityisesti: jos muokkaat Kshanaa ja tarjoat sitä verkon yli, sinun on
tarjottava näille käyttäjille muokattu lähdekoodisi). Jos tämä ei sovi sinulle — esim. sinun täytyy
upottaa Kshana suljettuun tuotteeseen tai ajaa suljettua verkkopalvelua — kaupallinen
lisenssi on saatavilla Ashforde® OÜ:lta; katso [`LICENSING.md`](LICENSING.md) ja
[Tuki](#support--professional-services).

</details>

<details>
<summary>Vianmääritys</summary>

### Vianmääritys

**`cargo build` epäonnistuu vanhalla työkaluketjulla.** Kshana tarvitsee Rustin ≥ 1.88. Päivitä komennolla
`rustup update`.

**Python-laajennuksen kääntäminen epäonnistuu linkitysvaiheessa macOS:ssä** (`Undefined symbols … _Py…`).
Python-laajennus ratkaisee symbolinsa latausaikana. `maturin` asettaa oikean linkkerin
lipun automaattisesti — käytä komentoa `maturin develop --features python` pelkän
`cargo build` -komennon sijaan.

**Python-käännös valittaa, että tulkki on uudempi kuin PyO3 tuntee.** Aseta
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (abi3-wheelit ovat eteenpäin yhteensopivia
CPython-versioiden välillä).

**WebAssembly-käännös ei löydä kohdetta.** Asenna se kerran komennolla
`rustup target add wasm32-unknown-unknown`, sitten `wasm-pack build --target web -- --features wasm`.

**Mihin tulosteeni meni?** Kukin ajo kirjoittaa tiedostot `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` ja `<scenario>.report.json`
syöte-`.toml`-tiedoston viereen, sekä
`<scenario>.table.csv` niille lajeille, jotka julkaisevat taulukon. Ne kaikki ovat
tarkoituksella gitin ohittamia.

</details>

<details>
<summary>Versiointi ja julkaisut</summary>

### Versiointi ja julkaisut

Kshana noudattaa [semanttista versiointia](https://semver.org). Ennen versiota 1.0 julkinen
skenaario-/tulosskeema voi vielä muuttua; rikkovat muutokset mainitaan erikseen
tiedostossa [`CHANGELOG.md`](CHANGELOG.md). Jokainen tulos on toistettavissa kolmikosta
`scenario + seed + engine version`.

**Jokainen `vX.Y.Z`-tagi julkaisee kaikki kanavat automaattisesti, yhdessä järjestyksessä** — koko
testisarja ajetaan ensin tagatussa commitissa, mitään ei julkaista ennen kuin se menee läpi, ja
sen jälkeen putki tarkistaa, että kukin rekisteri todella tarjoaa uuden version
([`docs/RELEASING.md`](docs/RELEASING.md)). Kanavat:

| Kanava | Asennus / nouto | Sisältö |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rust-kirjasto + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | MCP-palvelin |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | abi3-wheelit (Linux/macOS/Windows) + sdist (lähdejakelu) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly-moduuli + JS-kääre |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | moniarkkitehtuurinen OCI-levykuva (Open Container Initiative) — työkaluketjua ei tarvita |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | käynnistin: lataa julkaisun binäärin, varmentaa `SHA256SUMS`-tiedoston ja ajaa sen |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | sama käynnistin Pythonille |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | `kshana-mcp`-binääri, tuotettu kunkin julkaisun `SHA256SUMS`-tiedostosta |
| Claude Desktop | kaksoisnapsauta julkaisun `kshana-mcp-<target>.mcpb`-tiedostoa | laajennus, binääri sisällä |
| virallinen MCP-rekisteri | MCP-asiakasohjelmat löytävät automaattisesti | `io.github.ashfordeOU/kshana-mcp` (OCI-levykuva, npm- ja PyPI-paketit) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → hae "Kshana" | IDE-liitännäinen **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | lataus | `kshana`-komentorivibinääri Linux x86-64:lle, macOS:lle (Apple silicon ja Intel) ja Windows x86-64:lle, `kshana-mcp`-binääri kullekin näistä järjestelmistä sekä Linux Armille, `.mcpb`-Claude Desktop -laajennus järjestelmää kohden, CycloneDX-**SBOM**, **SLSA**-käännösalkuperä, HTML-validointiyhteenveto ja `SHA256SUMS`-tarkistussummatiedosto |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | viitattava arkisto jokaisesta julkaisusta |
| [kshana.dev](https://kshana.dev) | avaa selaimessa | Kshana Studio, selaimessa toimiva WebAssembly-sovellus, käännettynä uudelleen jokaisesta julkaisutagista (joten sen näyttämä versio on se versio, jota se ajaa) |

MCP-palvelimen crate- / levykuva- / rekisteriversio seuraa moottoria (se sisältää
kirjaston); JetBrains-liitännäisellä on oma versiointinsa (se kutsuu asentamaasi
`kshana`-binääriä).

</details>

<details>
<summary>Tiekartta</summary>

### Tiekartta

Katso vaiheistettu tiekartta tiedostosta [`ROADMAP.md`](ROADMAP.md), julkaisuhistoria tiedostosta [`CHANGELOG.md`](CHANGELOG.md)
ja ominaisuuskohtainen tiekartta tiedostosta [`docs/CAPABILITY.md`](docs/CAPABILITY.md). Prioriteettijärjestys on: **ensin ajoituksen ja holdoverin todisteet
kriittiselle infrastruktuurille** (tietoliikenteen maskit, pidempi holdover vanhenemisen ja flicker-
kohinan kanssa, mitatun kellodatan sisäänluku); **toisena puolueeton kvantti- vs klassinen -kompromissimenetelmä**
(tulokset merkitään MODELLED, kunnes kumppanin mitattu data nostaa ne); ja
**kuun / cislunaarisen avaruuden ja syvän avaruuden navigointia ylläpidetään**, mutta sitä ei laajenneta pääalueena. **ITRF-tarkka koordinaatistomuunnos** on nyt toimitettu — koko
CIO-pohjainen IAU 2006/2000A GCRS↔ITRS -ketju (napaliike + alle kaarisekunnin nutaatio),
validoitu bitti bitiltä SOFA/ERFAa vasten ja riippumattomasti ristiintarkistettu ANISEa
(puhdas Rust SPICE) vasten tarkkuuteen ≤ 3.6 m GNSS-radalla. Lähiajan kohteita ovat tiukasti kytketty kantoaallon vaiheen fuusio ja
löyhästi/tiukasti kytketyn GNSS/INS-navigaattorin tuominen useampiin paketteihin; **syvän avaruuden / Marsin
radiometrisen navigoinnin** moottori tuli versiossa v0.17.0 (simulaatiolla validoitu).
**Kvanttifysiikan kerros** on **P2**-kohde: CAI-kiihtyvyysanturi simuloidaan nyt
ensimmäisistä periaatteista (Mach–Zehnder-vaihe, projektiokohina, kontrastin heikkeneminen, värähtely-
kytkentä), kun taas kello-/aikasiirtoanturit ovat edelleen julkaistujen
Allan-/kohinabudjettikertoimien ohjaamia. GMST-pohjainen TEME&harr;ECEF, IERS-
karkaussekuntien aikajärjestelmät (UTC/TAI/TT/UT1), SGP4/SDP4-ratapropagointi (v0.7.0,
validoitu AIAA 2006-6753 -vektoreita vasten) ja ajettava `gnss-ins`-fuusio-
paketti on kaikki **toimitettu**, ja inertianopeus on käytettävissä jatkokäsittelyssä. Aktiivinen
stokastinen ajan harhautuksen ilmaisin (Neyman–Pearson / χ²₁-energiatesti Monte Carlo
-P_fa/P_md:llä ja turvallisuus-FoM:lla 1−P_md), linkkibudjettiin perustuva häirintämalli (J/S → efektiivinen
C/N₀ → lukituksen menetys), usean konstellaation käytettävyys, yksiakselinen (1-DOF)
IMU-virhebudjetti, kaksi riippumatonta (kello + paikka) Kalman-estimaattoria raportoituna
yhdistettynä FoM:na, todellinen konstellaatiogeometria TLE:istä, HTML-tuloskorttiraportti,
geometriasta johdettu GNSS-käytettävyys
*ja* tarkkuuden heikkenemiskerroin Kepler-radoista eksentrisyyden ja J2-ryöminnän kera,
Monte Carlo -luottamuskaistat, kompromissitutkimusten parametripyyhkäisyt, selaimessa toimiva WebAssembly-
kokeiluympäristö sekä valinnaiset Python- (PyO3) ja WebAssembly- (wasm-bindgen) sidonnat ovat
päätyneet `main`-haaraan.

</details>

<details>
<summary>Osallistuminen</summary>

### Osallistuminen

Katso [`CONTRIBUTING.md`](CONTRIBUTING.md). Lyhyesti: testit menevät läpi (`cargo test`),
kaksi vartijaskriptiä menee läpi, Conventional Commits, ja `CHANGELOG.md`-tiedoston `[Unreleased]`-
merkintä jokaisesta käyttäjälle näkyvästä muutoksesta. Osallistumista ohjaa
[toimintaohjeemme](CODE_OF_CONDUCT.md). Tietoturvaongelman ilmoittamisesta katso
[tietoturvakäytäntö](SECURITY.md) — älä avaa julkista issueta haavoittuvuuksista.

</details>

<details>
<summary>Dokumentaatio: jokainen dokumentti, ja kenelle se on tarkoitettu</summary>

<a id="documentation"></a>
### Dokumentaatio

| Dokumentti | Kenelle | Mitä se sisältää |
|----------|----------|--------------|
| [Käsitteiden johdanto](docs/CONCEPTS.md) | kaikille, aloita tästä | mitä Kshana tekee ja miksi, nollasta fysiikkaan |
| [Kshana Studio](web/README.md) | kaikille | moottorin ajaminen selaimessa (WebAssembly); käännös- ja käyttöönotto-ohjeet |
| [Sanasto](docs/GLOSSARY.md) | kaikille | jokaisen termin selkokieliset määritelmät |
| [Skenaariolajit](docs/KINDS.md) | kaikille | jokainen moottorin välittämä laji: mitä se tekee, sen kentät, esimerkkikomento, sen kirjanpidon rivit ja moottorin sille kirjoittama kaavio |
| [Kumppanidata](docs/PARTNER-DATA.md) | mitattua dataa omaavat laboratoriot ja valmistajat | mitkä MODELLED-rivit mitattu kello- tai IMU-tietue voisi nostaa, formaatit, miten toimitus tarkistetaan (`kshana partner check`), pisteytetään ja hyvitetään |
| [Arkkitehtuuri](docs/ARCHITECTURE.md) | kehittäjät / arvioijat | moduulikartta, moottorin putki, välitys ja kaaviot |
| [Validoinnin tila](docs/VALIDATION.md) | arvioijat / viittaajat | mikä on `validated` ja mikä `not modeled`, todisteineen |
| [Varmennusmatriisi](docs/VERIFICATION-MATRIX.md) | arvioijat / viittaajat | koneellisesti tarkistettu todistekirjanpito — jokainen ominaisuusrivi tiloineen, moduuleineen, testeineen ja ulkoisine oraakkeleineen, tuotettu tiedostosta `src/verification.rs` |
| [Modelled-perustelut](docs/MODELLED-RATIONALE.md) | arvioijat | miksi kullakin **Modelled**-rivillä ei ole ulkoista oraakkelia, rivi riviltä |
| [Alkuperä](docs/PROVENANCE.md) | arvioijat / viittaajat | jokainen anturiparametri, malli ja aineisto jäljitettynä julkaistuun lähteeseensä yhdessä viitattavassa taulukossa |
| [Toistettavuus ja alkuperä](docs/REPRODUCIBILITY.md) | arvioijat / paketoijat | determinismitakuut, referenssien kiinnitys, SBOM (ohjelmiston osaluettelo), käännösalkuperä |
| [Wheel-alustatagit](docs/WHEEL_TAGS.md) | paketoijat | abi3-Python-wheel-matriisi — mihin alustatagiin `pip install kshana` ratkeaa |
| [Asemointi](docs/POSITIONING.md) | arvioijat | missä Kshana on suhteessa RTKLIBiin/gLABiin (täydentävä), ja asennukseton selaintaso |
| [Kshana Pro](docs/PRO.md) | arvioijat / ohjelmapäälliköt | mitä suljettu Pro-kerros lisää saman moottorin päälle: suunnitteluoptimoija, epävarmuus ja herkkyys, tehtäväasiakirja, kampanjan valvonta, spektrin yhteiselo, paikallinen työpalvelu, vaatimusten jäljitettävyys; mitä kukin tuottaa ja mitä se ei tee |
| [Tekninen raportti](paper/kshana-technical-report.md) · [JOSS-artikkeli](paper/paper.md) | arvioijat / viittaajat / arvioitsijat | koko laajennettu tutkimusartikkeli — arkkitehtuuri, aluekohtaiset mallit, validointi, tapaustutkimukset ja rajoitukset — sekä tiivis JOSS-lähetys (Journal of Open Source Software) |
| [SGP4-validointi](docs/SGP4-VALIDATION.md) | arvioijat / viittaajat | yhtäpitävyys AIAA 2006-6753 -viitteen kanssa (666 tilaa, ~4 mm) **ja** suora vertailu riippumattomaan `sgp4`-crateen (yhtäpitävä alle mikronin / 4.12 mm) |
| [Voimamallin validointi](docs/AGENCY-ORBIT-VALIDATION.md) | arvioijat / viittaajat | täyden voimamallin moottori (`src/precise_od.rs`) sovitettuna virastojen efemerideihin — menetelmä ja validoidut jäännökset |
| [Todellisten TLE:iden opas](docs/REAL_TLE_GUIDE.md) | käyttäjät | skenaarioiden ajaminen todellisilla Celestrak- / Space-Track-konstellaatioiden TLE:illä (vs mukana tuleva synteettinen Walker-joukko) |
| [Eheyden FoM](docs/INTEGRITY.md) | arvioijat | mitä `integrity`- / `security`-luvut tarkoittavat — ja mitä ne **eivät** ole verrattuna ilmailun HPL/VPL:ään |
| [ARAIM-viite](docs/ARAIM_REFERENCE.md) | arvioijat / integroijat | avoin MHSS ARAIM -suojaustasototeutus — `b_k`-nimellisbiaksen projektio, σ_URA vs σ_URE ja vikatilojen priorit |
| [Kvanttimallit](docs/QUANTUM.md) · [yksityiskohdat](docs/QUANTUM-MODELS.md) | arvioijat | kylmien atomien interferometrin fysiikkakerros, ja missä kertoimia vielä haetaan taulukoista |
| [Vaatimustenmukaisuus](docs/COMPLIANCE.md) | arvioijat | DO-229E / DO-316 -algoritmien laajuus, ja mikä **ei** ole vaatimustenmukaisuusväite |
| [Merenkulun luotettavuus](docs/MARITIME-TRUST.md) | merenkulkijat / integroijat | 0–100-GNSS-luottamuspistemäärä aluksen NMEA-datalle, sen valvonnat ja rajoitukset (ohjeellinen, ei tyyppihyväksytty navigointilaite) |
| [NMEA-koulutusvirrat](docs/NMEA-TRAINING.md) | merenkulun kouluttajat | synteettistä komentosillan NMEA-dataa käsikirjoitetulla häirinnällä ja harhautuksella sekä kouluttajan lokilla; vain tekstiä, ei koskaan käytössä olevaan navigointiin |
| [Häiriökartta](docs/INTERFERENCE-MAP.md) | analyytikot / merenkulkijat | missä ilma-alukset ja laivat ilmoittivat heikentynyttä navigointidataa, ja kuinka suuren osan reitistä se koskettaa |
| [Todistepaketit](docs/EVIDENCE-PACKS.md) | operaattorit / vakuuttajat | allekirjoitetut tekniset tallenteet luottamustapahtumasta ja miten sellainen varmennetaan |
| [Luottamustelemetria](docs/TRUST-TELEMETRY.md) | operatiiviset / tietoturvatiimit | luottamusvirta Prometheus-mittareina, SIEM-tapahtumina ja OpenTelemetryna Grafana-kojelaudan kera |
| [Merenkulun integraatiot](docs/MARINE-INTEGRATIONS.md) | veneilijät / integroijat | Signal K -liitännäinen, OpenCPN:n porttitila ja viitekokoonpano |
| [Testipenkki](docs/TEST-BENCH.md) | vastaanotinvalmistajat | viedyn skenaarion toistaminen laboratoriosimulaattorin kautta ja vastaanottimen lokin pisteyttäminen |
| [Vaatimustenmukaisuuden vastaavuus](docs/compliance/README.md) | arvioijat | julkiset häiriönsietokehykset kuvattuina Kshanan tulosteisiin, lähteineen ja aukkoineen; `kshana compliance-report` |
| [Muistikirjat](notebooks/README.md) | käyttäjät | ajettavat opetusohjelmat renderöityine teksteineen |
| [Standardit ja yhteentoimivuus](docs/STANDARDS.md) | integroijat | GNSS- / lentodynamiikka- / virastojen vaihtoformaatit, joita Kshana lukee ja kirjoittaa (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [LEO PNT -fuusio](docs/LEO-PNT-FUSION.md) | käyttäjät / arvioijat | yhdistetty MEO + LEO -paikannus, -navigointi ja -ajoitus: Doppler, yhdistetty pseudoetäisyys, PPP-konvergenssi, 5G NTN, napakattavuus ja LEO-aikasiirto minkä tahansa konstellaation yli; valinnaiset esiasetukset ja niiden julkiset lähteet |
| [Kampanjat](docs/CAMPAIGNS.md) | käyttäjät / arvioijat | skenaarioiden yhdistäminen: ketjutetut tehtävien aikajanat, parametripyyhkäisyt, Monte Carlo -joukot ja yhteisen ehdon ajot, testien kiinnittämine koostumusidentiteetteineen |
| [Skenaarioluettelo](docs/SCENARIOS.md) | käyttäjät / integroijat | jokainen välitettävä laji pakollisine ja valinnaisine TOML-kenttineen — tuotettu funktiosta `api::list_scenario_kinds()` |
| [Tulosskeema](docs/SCHEMA.md) | integroijat | tulos-JSON:n jokainen kenttä yksikköineen ja lähdeviitteineen |
| [Python API](docs/PYTHON_API.md) | Python-käyttäjät | PyO3-sidontarajapinta — moottorin kutsuminen, skenaario-/tulostyypit ja esimerkit |
| [Väitteet vs todellisuus](docs/CLAIMS-VS-REALITY.md) | arvioijat | liioiteltujen väitteiden sulkemiskirjanpito + CI-vartija (`tests/no_overclaims.rs`), joka pitää sen ratkaistuna |
| [Tiekartta](ROADMAP.md) | kaikille | vaiheistettu tiekartta — mitä on toimitettu ja mitä on tulossa |
| [MCP-palvelin](mcp/kshana-mcp/README.md) · [JetBrains-liitännäinen](ide/jetbrains/README.md) | agentit / IDE-käyttäjät | Kshanan ajaminen tekoälyavustajasta tai JetBrains IDE:stä |
| [Agenttiopas](docs/AGENTS.md) · [Rajapinnat](docs/SURFACES.md) | agentit / integroijat | mikä työkalu vastaa mihinkin kysymykseen, mitä kunkin vastauksen kanssa säilytetään; missä kukin ominaisuus on saatavilla (CLI, Rust, Python, WASM, MCP, liitännäinen, JetBrains, muistikirjat) ja miksi solu on N/A |
| [Muutosloki](CHANGELOG.md) | kaikille | julkaisuhistoria (Keep a Changelog + SemVer, semanttinen versiointi) |
| [Osallistuminen](CONTRIBUTING.md) | osallistujat | käännös, vartijat, testi-/viittauskuri, DCO (Developer Certificate of Origin) |
| [Hallinto](GOVERNANCE.md) | osallistujat / yhteisö | miten Kshanaa hallitaan — kuka päättää, miten, ja avoimen/suljetun raja |
| [Toimintaohje](CODE_OF_CONDUCT.md) | yhteisö | odotettu käytös (Contributor Covenant) |
| [Tietoturvakäytäntö](SECURITY.md) | ilmoittajat | miten haavoittuvuus ilmoitetaan; kaksikäyttöhuomautus |

</details>

<details>
<summary>Keskeiset lähteet</summary>

### Keskeiset lähteet

**Validointioraakkelit ja standardit** — ulkoiset auktoriteetit, joihin Kshanan tarkistukset on ankkuroitu:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [testidata](https://celestrak.org/publications/AIAA/2006-6753/)): SGP4/SDP4-varmennusjoukko, jonka Kshana toistaa 4.12 mm:n tarkkuudella, sekä työstetyt koordinaatistoesimerkit, joita vasten TEME→ITRF-ketju tarkistetaan.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — viiteaika- ja koordinaatistorutiinit, joita vasten IAU 2000A -nutaatio ja CIO GCRS↔ITRS -muunnos validoidaan bitti bitiltä.
- Petit & Luzum (toim.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (Maan orientaatio-, napaliike- ja koordinaatistostandardit).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (Allan-hajonnan relaatiot ja NBS14-viitesarja; NBS = entinen Yhdysvaltain National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): ROC/AUC-, sekaannusmatriisi- ja tarkkuus/saanti/F1-viitetoteutukset, joihin RF-heikennysten arviointitestialusta täsmää tarkasti (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` ja `linalg.expm` — viiterutiinit, joita vasten kvanttikompromissin mitatun ADEV:n NNLS-sovitus, χ²-johdonmukaisuuskaistat ja van Loan -kellon prosessikohinan kovarianssi validoidaan (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): käytetty sekä avoimena aiempana työnä (katso *Vertailu ja avoin aiempi työ* alla) että **riippumattomana DOP-oraakkelina**, johon GDOP/PDOP/HDOP/VDOP/TDOP-laskenta täsmää tarkkuudella 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): voimamallit virastojen tarkkoihin efemerideihin tehdyn voimamallisovituksen taustalla.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (halo/NRHO-perheet, jotka CR3BP-differentiaalikorjain toistaa).

**Laitteiden ja menetelmien fysiikka** — anturimallien taustalla olevat lähteet:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (strontium-optinen hilakello, avaruuteen suunnattu tavoite).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (laboratorion Sr-kello, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybridi kvanttikiihtyvyysanturikolmikko).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [IEEE AESS:n (Aerospace and Electronic Systems Society) opetusartikkeli (University College Londonin Discovery-arkisto)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (merkintälaskun virheen kasvu).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optinen kaksisuuntainen aika-taajuussiirto; optinen satelliittien välinen linkki mallintaa epäsymmetriabudjettinsa näiden mukaan).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (BOC-modulaation ja spektrierottelun teoria moduulin `src/navsignal.rs` taustalla).
- Kaplan & Hegarty (toim.) — *Understanding GPS/GNSS: Principles and Applications* (3. painos, Artech House, 2017): häirinnänestokyvyn efektiivisen C/N₀:n yhtälö ja early–late-DLL:n koodinseurannan lämpökohinavärinä, joita navigointisignaali- ja häirintämallit käyttävät.

**Vertailu ja avoin aiempi työ** — työkalut ja katsaukset, joihin Kshana asemoituu:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): harhautustestipatterin parametrit, joita vasten monikerroksinen ilmaisin karakterisoidaan.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): avoimet, validoidut inertianavigoinnin virheprofiilit, joita käytetään klassisena lähtötasona.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): avoin kuun PNT-simulaattori.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): avoin GNSS-data-analyysi.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): GRAIL reduced-dynamic OD, empiirisen kiihtyvyyden alaraja, jonka LRO-sovitus toistaa.

</details>
