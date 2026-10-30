> Dette er en maskinoversættelse af README.md i v0.40.0, som endnu ikke er gennemgået af en modersmålstalende; den engelske README er referencen. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: mærket, et kompas-trådkors der markerer det præcise øjeblik, ved siden af ordmærket kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>det præcise øjeblik</em></strong><br>
  En open source-simulator til PNT-robusthed (positionering, navigation og tidssynkronisering).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Status for kontinuerlig integration på main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Linjedækning på næsten 95 % af src/, målt i docs/COVERAGE.md og med en grænse på 85 % i kontinuerlig integration"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 af 401 funktioner VALIDATED mod en uafhængig ekstern reference, ifølge verifikationsmatricen"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Status for SonarQube Cloud quality gate"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Udgivelse v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Engelsk og 17 andre sprog, maskinoversat"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licens: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, Zenodo-konceptposten for alle udgivelser"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="En kommerciel licens kan fås fra Ashforde® OÜ, se Udgaver"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på crates.io, den aktuelle udgivne version"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på PyPI, den aktuelle udgivne version"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana på npm, den aktuelle udgivne version"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Åbn Kshana Studio</a> ·
  <a href="#install">Installation</a> ·
  <a href="#capabilities">Funktioner</a> ·
  <a href="#evidence">Evidens</a> ·
  <a href="#research">Forskning</a> ·
  <a href="docs/CONCEPTS.md">Dokumentation</a> ·
  <a href="#cite">Citér</a>
</p>

<p align="center">
  <strong>Sprog:</strong> <a href="README.md">English</a> ·
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
  <sub>Kommandolinjen, kørselsresuméer, diagrammer og rapporter taler hvert sprog med <code>--lang &lt;tag&gt;</code>
  (for eksempel <code>kshana scenarios/holdover-test-example.toml --lang de</code>), og det samme gør Python-, WebAssembly- og MCP-fladerne.
  Det er maskinoversættelser, som endnu ikke er gennemgået af en modersmålstalende; engelsk er referencen.
  Se <a href="docs/i18n.md">Lokalisering</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Øv det minut, hvor GNSS går i sort. Kshanas missionskonsol, tegnet ud fra en rigtig kørsel af motoren v0.40.0: den kædede kampagne campaign-jam-spoof-holdover-integrity (seed 20260928, 6 faser, 18 medlemskørsler over T+01:16:10) og de 102 satellitter fra GPS, Galileo, BeiDou og GLONASS fra constellation-multi-gnss-coverage, hver tegnet på den cirkulære tolegemebane, der er genskabt ud fra motorens jordspor, med radier komprimeret af hensyn til visningen. Urets tidsfejl topper ved 62.7 ns mod en grænse på 50 ns, bærebølge-til-støj-tætheden falder til -12.2 dB-Hz mod et gulv på 25 dB-Hz, og det vertikale beskyttelsesniveau når 135.4 m mod en alarmgrænse på 50 m." width="100%">
</picture>

<details>
<summary><strong>Indhold</strong></summary>

- [Øv det minut, hvor GNSS går i sort](#rehearse-the-minute-gnss-goes-dark)
- [Nyt i 0.40](#whats-new-in-040), [Nyt i 0.39](#whats-new-in-039), [Nyt i 0.38](#whats-new-in-038) og [0.38 i dybden](#038-in-depth): jammertest-scoring, modtagerens egne flag, maskininput, tidssynkronisering og holdover, standardpakker, LunaNet AFS, laboratoriets rundtur, kshana-bench, observatoriet, eksportører, optisk, [navigation for rumbrugere](#space-user-navigation-gnss-ssv) og [måneinfrastruktur](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) og alle Studio-sider
- [Funktioner](#capabilities): oversigten over områder, [alle scenarietyper efter familie](#every-scenario-kind-by-family), [alle kommandoer](#every-command), [alle flader](#every-surface)
- [Sådan forløber en kørsel](#how-a-run-works), [Missioner](#missions)
- [Evidens](#evidence): registret, [funktionsdomæner](#capability-domains)
- [Installation](#install), [Arkitektur](#architecture) (og [diagrammerne](#diagrams)), [AI-assistent](#ai-assistant)
- [Udgaver](#editions), [Forskning](#research), [Citér](#cite), [Licens](#licence)
- [Reference](#reference): brug, scenarieformat, output, repositoriets opbygning, FAQ, fejlfinding, versionering, køreplan, bidrag, dokumentation

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Øv det minut, hvor GNSS går i sort

Kshana afspiller jamming, spoofing og ur-holdover, når GNSS-signaler (Global Navigation Satellite
System) svigter, og fortæller dig, hvor længe et system holder tid og position inden for sit
budget, og hvilket ur eller hvilken sensor der giver mest margin. Det er én Rust-motor. Den kører i en
terminal, en notebook, en IDE (integreret udviklingsmiljø), en AI-assistent (kunstig
intelligens) eller i din browser.

Hver kørsel kan gengives bit for bit ud fra scenariet, seedet og motorens version.
Hver funktion bærer én af tre betegnelser i et maskinkontrolleret register: **VALIDATED** (en
uafhængig ekstern reference er enig), **MODELLED** (internt konsistent, og det siges højt)
eller **PARTNER** (en hardwarepartner ejer den).

> **Status: v0.40.0.** Et valideret, reproducerbart simuleringsgrundlag for PNT-robusthed.
> Tidssynkronisering og holdover kommer først, fordi det domæne er det bedst validerede. Kshana er et
> instrument til studier og afvejninger: ikke hardware til radiofrekvens-signalgenerering (RF) (den
> styrer ingen radio og udsender intet; dens output på signalniveau er IQ-sampelfiler i basisbånd
> til softwaremodtagere), ikke en hardware- eller certificeret GNSS-modtager (dens softwaremodtager
> er et analyseværktøj) og ikke et produkt til flyvning. Ny på området? Start med
> [introduktionen i almindeligt sprog](docs/CONCEPTS.md) og [ordlisten](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Nyt i 0.40

0.40 tilføjer et fejlbudget på missionsniveau, mærker hver figur og tabel med sit evidensniveau, læser målte urlogs,
kontrollerer indsendelser fra datapartnere, estimerer hvor en interferenskilde kan befinde sig og taler sytten sprog ud over engelsk.
Registret har nu 401 rækker: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Ingen række blev forfremmet til VALIDATED, og hver forfejlelse nedenfor er
fastlåst af en test.

- **Missionstråd.** Typen `mission-thread` kæder faser sammen fra opsendelse til indtræden (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` og fire månetyper) med angivne overdragelsesregler, en margin mod angivne krav og det svageste
  led; et Artemis-lignende eksempel fra ende til ende over 11 faser (Jord- og månesegmenter), 92 scenarietyper i alt. Hvert tal er MODELLED. Den cislunare propagering mod den offentlige Artemis I-bane
  **misser** sin præregistrerede tærskel (45.3 km og 0.25 m/s mod 5 km og 0.05 m/s; årsagen er små manøvrer, som modellen ikke medtager), og månepropagatoren mod CAPSTONE-
  banen **misser** (136.8 km mod 25 km ved slutningen af ét omløb); LRO-sammenligningen er opfyldt. Rækkerne forbliver MODELLED
  ([Missionstråd](docs/MISSION-THREAD.md), [månesegment](docs/MISSION-THREAD-LUNAR.md)). I Studio læses tråden på `/studio/mission-thread/`.
- **Evidensmærker.** Hver figur og tabel, en kørsel skriver, bærer det niveau og de registerrække-id'er, den hviler på, læst fra matricen.
- **Målte ure.** Otte urlogformater læses ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)), og en tilpasset
  serie kan drive holdoveren. Mod præregistrerede tærskler **misser** tilpasningen F1(a) på fem af seks optegnelser og F2 på én; begge
  forbliver MODELLED ([Ændringslog](CHANGELOG.md#0400---2026-10-29)).
- **Datapartnere.** `kshana partner check` kontrollerer formatet af en indsendelse og scorer intet ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Kildeområde.** `kshana interference-map locate` giver et område og en ellipse, aldrig et enkelt punkt, ud fra ADS-B- eller AIS-
  rapporter. Sammenlignet én gang med senderstederne fra Jammertest 2025 er resultatet **NOT ASSESSABLE** for begge kilder (for få
  planlagte sessioner i de åbne data), så rækken forbliver MODELLED ([Interferenskort](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** Genkampagnen i 0.40 opfylder A3, D3 (begge EXPLORATORY), R3 og R4; A2, D1 og R1 forbliver NOT MET ([Bench](docs/BENCH.md)).
- **Sprog.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja og zh-Hans, som **maskinoversættelser, som ingen modersmåls-
  talende har gennemgået**; engelsk er referencen, og kørsler på andre sprog end engelsk tager omtrent dobbelt så lang tid
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Nyt i 0.39

0.39 tilføjer ingen funktion og ændrer intet resultat; motorens output er output fra 0.38. Den retter én ting
på kommandolinjen, opdaterer afhængigheder i krydsvalideringsværktøjerne og angiver benchmarkens
afgørelser i fuld længde.

- **Kommandolinje.** `kshana kinds | head` (enhver lukket standard output) går ikke længere i panik: programmet afslutter
  stille med status 141, som andre værktøjer gør ved et lukket rør. Andre skrivefejl rapporterer stadig sig selv.
- **Afhængigheder.** `memmap2` 0.9.11 i de to ANISE-krydskontrollåse samt `pillow` 13.0.0 og
  `certifi` 2026.10.19 i fastlåsningerne for reference-miljøet, alle under `xval/`: intet, der leveres, er ændret.
- **kshana-bench, alle afgørelser.** Mod de præregistrerede tærskler er tre NOT MET, hver fastlåst af en test:
  A2 (`agc_k_sigma` AUC 0.766 mod mindst 0.80), D1 (største afvigelse 0.0301) og opgave (b) R1 (overført,
  ikke kørt igen). Ingen tærskel blev lempet ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Nyt i 0.38

0.38 gør den neutrale dommer målbar: den scorer modtagerlogs mod en offentliggjort test-
plan, læser flere modtagere og sensorer, tester tidssynkroniseringssystemer og leverer en benchmark og et
interferensobservatorium. Den forbliver vejledende: intet her er certificeret, intet resultat er en typegodkendelse,
og intet udsender. Hver række angiver, hvad registret indeholder for den ([hvordan en betegnelse opnås](#evidence));
en status nævner kun det, der blev kontrolleret, og registerrækken og den linkede side siger, hvad der ikke blev.

| Nyt i 0.38 | Hvad den gør, og hvorfor | Registerstatus | Læs |
|---|---|---|---|
| **Jammertest-scoring** | `kshana jammertest import` læser NPRA's offentliggjorte testkatalog og sendeplan som planlagt sandhed; `jammertest score` scorer en modtagerlog pr. test (detektionsforsinkelse, missede alarmer, falske alarmer, tid til genopretning), som en signeret bevispakke, hvis du angiver en nøgle | **MODELLED**: én registerrække. Tærsklerne blev præregistreret før nogen scoret kørsel; på JammerTest 2024-dataene fejlede minimumsdatareglen i begge kørsler (4 og 7 scorbare vinduer mod 10 krævede), så **ingen tærskel kan vurderes**, og intet påstås | [Jammertest](docs/JAMMERTEST.md) |
| **Modtagerens egne flag** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG og NovAtel RXSTATUS læst ind i en `self_report` pr. epoke og sammenlignet med Kshanas alarmer (begge, kun modtageren, kun Kshana, ingen); en Septentrio SBF-læser og skrivebeskyttet `--serial`-input | **MODELLED**; enighed mellem en modtagers detektor og Kshanas er ikke validering | [Modtagertillid](docs/RECEIVER-TRUST.md) |
| **Flere modtagere og sensorer** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (fra de BSD-licenserede pyrtcm-tabeller, ikke RTCM-teksten), GNSS-SDR-monitorstrømme, en IMU-log som anden sensor, en ROS 2-pakke, en `gnss_lib_py`-bro og `imu-fit` til parametre for hybride sensorer | **MODELLED**: seks registerrækker; kun selvskrevne testdata, ingen optagelse fra en rigtig modtager, IMU, GNSS-SDR-kørsel eller ROS-graf blev læst | [Maskininput](docs/MACHINE-INPUTS.md) |
| **Test af tidssynkronisering og holdover** | typen `holdover-test` scorer en holdover-test (GNSS fjernet af operatøren, holdover, genopretning) ud fra en målt tidsfejlsoptegnelse mod ITU-T-masker, "målt mod masken"; læsere til linuxptp- og chrony-logs; hardwaretrinnene og feltet `lab-attestation` | **MODELLED**: to registerrækker; tidspunkterne er operatørens udsagn, ikke verificeret | [Timing HIL](docs/TIMING-HIL.md), [Hardwaresikkerhed](docs/HARDWARE-SAFETY.md) |
| **Standardpakker, LunaNet AFS, laboratoriets rundtur** | scorede pakker for DHS RPCF, IMO MSC.1/Circ.1575 og ICAO Doc 9849 Appendix F mod tærskler angivet før kørslen, "understøtter evidens for"; en NIST IR 8323r1-krydsreference; en kodegenerator og kontrol for LunaNet AFS; en signeret pakke, der forbinder et laboratorieforsøgs scenarie, testbetingelser, modtagerlog og score | **MODELLED** for pakkerne og rundturen; AFS-kodekontrollen er **VALIDATED** mod sine trykte kontrolkolonner (se registerrækkerne) | [Standarder](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench og observatoriet** | faste opgaver, opdelinger og målinger for interferensdetektion, IQ-detektion, holdover-forudsigelse og optimismegabet, med et forseglet tilbageholdt datasæt og en statisk rangliste; et reproducerbart dagligt interferensprodukt med 24 h forsinkelse, grove celler og ingen tilskrivning | ingen egen registerrække: den scorer indsendelser, og dens baselines er mærket MODELLED i resultatfilerne; mod de præregistrerede tærskler er scoreren, C1 til C3 og D2 opfyldt, og tre tærskler er **NOT MET** (fastlåst af tests): A2 (`agc_k_sigma` AUC 0.766 mod mindst 0.80 på testopdelingen), D1 (største afvigelse 0.0301) og opgave (b) R1 (overført, ikke kørt igen); se `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatorium](docs/observatory/METHOD.md) |
| **Eksportører** | tillidstelemetri som Home Assistant MQTT-discovery- og tilstandsmeddelelser (kun udgivelse, ingen legitimationsoplysninger) ved siden af Prometheus, CEF, LEEF og OTLP | **MODELLED**: én registerrække | [Tillidstelemetri](docs/TRUST-TELEMETRY.md) |
| **Optisk linkmargin over tid** | typen `optical-atmosphere` kan skrive én seedet realisering af et steds vejr som en linkmarginserie | **MODELLED**: én registerrække; én trækning fra modellen, ikke klimaet | [Optisk atmosfære](docs/OPTICAL-ATMOSPHERE.md) |

Højdepunkter fra 0.37: [ændringslog](CHANGELOG.md#0370---2026-10-17). Den fulde liste for 0.38 står i
[ændringsloggen](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 i dybden

Hver funktion fra tabellen ovenfor, på få linjer: hvad den gør, én kommando til at køre den, ét
billede tegnet ud fra en rigtig kørsel af motoren, og hvad registret indeholder for den. Billederne
skrives af [`tools/gen_figures_038.py`](tools/gen_figures_038.py) ind i
[`docs/figures/0.38/`](docs/figures/0.38/) (aldrig tegnet i hånden): `python3 tools/gen_figures_038.py`
genskriver dem ud fra en bygget motor, og `--check` fejler, hvis ét er forældet, eller dets billedtekst her afviger.
Hvor et input er en log, er det en opdigtet log, som scriptet skriver, fordi de rigtige logs fra tredjeparter
aldrig medleveres, og billedteksten siger det. Alt nedenfor er vejledende: ikke certificeret, ikke en
typegodkendelse, og intet udsender. En status nævner det, der blev kontrolleret, og intet mere;
[hvordan en betegnelse opnås](#evidence).

### Jammertest-scoring

`kshana jammertest import` omdanner NPRA's offentliggjorte testkatalog og sendeplan til
planlagt sandhed, og `kshana jammertest score` scorer en modtagerlog mod den: for hver
planlagt test, om den blev detekteret, hvor sent, og hvor lang tid modtageren tog om at genoprette sig, plus
falske alarmer uden for alle tidsrum. Kataloget hentes, det medleveres aldrig.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Scoring af én syntetisk modtagerlog mod en plan med tre tests, fra en rigtig kørsel af motoren v0.40.0 (`kshana jammertest score`). Loggen er opdigtet: 1800 s NMEA med et fald i C/N0 på 20 dB over to intervaller. Planen oplister tre tidsrum; i det midterste tidsrum er der ingen jammer i loggen. Scoren markerer 2 af 3 tests som detekteret (median forsinkelse 0 s) og 1 som misset, med 0 forløb med falsk alarm over 0.25 h ren tid. Intet her siger noget om en rigtig modtager. Vejledende software, ikke typegodkendt navigationsudstyr (IEC 61108, IEC 61162): operatøren er fortsat ansvarlig for fartøjets navigation.">
</picture>

**Registerstatus: MODELLED.** Tærsklerne blev fastlagt før nogen scoret kørsel; på JammerTest 2024-dataene
fejlede minimumsdatareglen i begge kørsler, så ingen tærskel kan vurderes, og intet påstås.
[Jammertest](docs/JAMMERTEST.md).

### Modtagerens egne flag

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG og NovAtel RXSTATUS læses ind i en `self_report`
pr. epoke og stilles ved siden af Kshanas alarmer: begge, kun modtageren, kun Kshana eller ingen. En
Septentrio SBF-læser og et skrivebeskyttet `--serial`-input fodrer den samme sammenligning. Ingen af siderne er
den sande tilstand.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Modtagerens eget spoofing-flag stillet op mod Kshanas alarmer, fra en rigtig kørsel af motoren v0.40.0 på en opdigtet UBX-log (200 epoker ved 1 Hz). C/N0 falder 20 dB ved 80 til 90 s og 120 til 130 s; modtageren flager 120 til 130 s og 160 til 165 s. Af 140 epoker sammenlignet efter kalibrering havde 11 flag fra begge, 6 kun fra modtageren, 11 kun fra Kshana og 112 fra ingen. Ingen af siderne er den sande tilstand, og enighed er ikke validering. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

**Registerstatus: MODELLED.** Enighed mellem en modtagers detektor og Kshanas er ikke
validering. [Modtagertillid](docs/RECEIVER-TRUST.md).

### Flere modtagere og sensorer

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, GNSS-SDR-monitorstrømme, en IMU-log som anden
sensor, en ROS 2-pakke og en `gnss_lib_py`-bro ender alle i den samme tidslinje for modtagertillid.
`imu-fit` aflæser de sensorparametre, som hybrid- og fusionsscenarierne har brug for, fra en stationær IMU-
log, så et scenarie kan køres med den sensor, du faktisk har.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Hvad `kshana imu-fit` aflæser fra en stationær IMU-log, fra en rigtig kørsel af motoren v0.40.0 på en opdigtet log (20,000 samples ved 100 Hz, 200 s): accelerometerets hastigheds-random-walk q_va = 4.02e-06, gyroens vinkel-random-walk q_arw = 9e-08, biasinstabiliteten 0.00296 og de tidlige Allan-hældninger (-0.51 og -0.49; omkring -0.5 hvor hvid støj dominerer). Tabellen ved siden af er den TOML, kommandoen udskriver. Estimatoren er kun kontrolleret på syntetiske logs. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

**Registerstatus: MODELLED.** Kun selvskrevne testdata; ingen optagelse fra en rigtig modtager, IMU,
GNSS-SDR-kørsel eller ROS-graf blev læst. [Maskininput](docs/MACHINE-INPUTS.md).

### Test af tidssynkronisering og holdover

Typen `holdover-test` scorer en holdover-test (GNSS fjernet af operatøren, holdover, genopretning)
ud fra en målt tidsfejlsoptegnelse mod ITU-T-masker og siger det med de ord: målt
mod masken. Læsere til linuxptp- og chrony-logs fodrer den; hardwaretrinnene og
feltet `lab-attestation` siger, hvem der har udtalt hvad.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="En holdover-test scoret ud fra en tidsfejlsoptegnelse, fra en rigtig kørsel af motoren v0.40.0 på scenarios/holdover-test-example.toml (601 samples hvert 5. s). GNSS fjernes af operatøren ved 600 s og genetableres ved 2400 s; tidsfejlen driver til 299 ns ved slutningen af holdover, over budgettet på 100 ns efter 675 s, og vender tilbage inden for båndet på 100 ns 70 s efter genetableringen. Afgørelser: baseline-masker PASS, holdover-masker FAIL, holdover-kurve FAIL, genopretning RECOVERED. Målt mod masken, ikke en godkendelse. Tidspunkterne er operatørens udsagn, ikke verificeret af Kshana. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

**Registerstatus: MODELLED.** Tidspunkterne, hvor GNSS blev fjernet og genetableret, er operatørens udsagn,
ikke verificeret. [Timing HIL](docs/TIMING-HIL.md), [Hardwaresikkerhed](docs/HARDWARE-SAFETY.md).

### Standardpakker

Scorede pakker for DHS' testprofiler for robust PNT, IMO MSC.1/Circ.1575 og ICAO Doc 9849
Appendix F, plus en NIST IR 8323r1-krydsreference i `compliance-report`. Hver test kører et medfølgende
scenarie og sammenligner et resultatfelt med en tærskel angivet før kørslen; en test, der kræver en modtager-
log, opføres som en, der mangler et input, og scores ikke. Formuleringen er "understøtter evidens for".

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Hver test i de tre scorede standardpakker, fra rigtige kørsler af motoren v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 opfyldt, 1 ikke opfyldt, 2 mangler et input; imo-circ-1575: 1 opfyldt, 4 ikke opfyldt, 2 mangler et input; icao-doc9849-appf: 6 opfyldt, 0 ikke opfyldt, 2 mangler et input. I alt 13 opfyldt, 5 ikke opfyldt og 6 mangler et input, som motoren ikke har (en modtagerlog eller udstyrsdokumentation). Hver tærskel blev angivet før kørslen; en forfejlelse bevares som en forfejlelse. En opfyldt tærskel siger, at et modelleret scenarie opfyldte en angivet tærskel, intet om et produkt. Pakkerne understøtter evidens for de rækker, de citerer; de er ikke en vurdering. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life); det må ikke være det eneste grundlag for nogen navigations- eller sikkerhedsbeslutning.">
</picture>

**Registerstatus: MODELLED.** En opfyldt tærskel siger, at et modelleret scenarie opfyldte en angivet tærskel, intet om et
produkt; hver forfejlelse bevares og fastlåses af en test. [Standarder](docs/STANDARDS.md).

### LunaNet AFS

Kodegeneratoren til LunaNet Augmented Forward Signal (Gold-, Weil- og tertiære koder, meddelelses-
rammen og dens fejlkodning) og en kontrol for en optaget eller genereret symbolstrøm, fastlåst til én
udgave af specifikationen.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Kodegeneratoren til LunaNet AFS kontrolleret mod specifikationens trykte kolonner, fra en rigtig kørsel af motoren v0.40.0 (`kshana lunanet-afs-check spec`, fastlåst til LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29. januar 2025; dokumentet markerer sine kodetabeller {LSIS-TBC}). 9 af 10 kontroller er opfyldt; B4 er NOT MET (420 af 421 stemte overens). Den kontrollerer en symbolstrøm mod én udgave af en offentliggjort specifikation og siger intet om nogen LunaNet-knude eller -tjeneste. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Den kontrollerer en symbolstrøm mod én udgave af en offentliggjort specifikation og siger intet om nogen LunaNet-knude eller -tjeneste.">
</picture>

**Registerstatus: VALIDATED** for kode- og synkroniseringskontrollerne, mod de værdier, som
specifikationen trykker (og som den markerer TBC); én kontrol er NOT MET, bevaret og fastlåst (én trykt
kolonne for tertiærkoder afviger: dokumentet trykker den samme værdi for to PRN'er). LDPC- og CRC-ordene
i delrammerne 2 til 4 kontrolleres ikke. Registerrækkerne siger præcis hvilke. [LunaNet AFS](docs/LUNANET-AFS.md).

### Laboratoriets rundtur

`kshana.test-conditions/1` er en offentliggjort beskrivelse af, hvad et laboratorium gjorde (hændelser, tidspunkter,
effekter). `kshana evidence round-trip` forbinder scenariets hash, betingelsernes hash, modtagerloggens
hash og scoren i én signeret pakke og afviser en pakke, hvis betingelser og scoringsscenarie
er uenige om hændelserne. Kshana producerer eller afspiller aldrig et signal: hvordan et scenarie nåede en
modtager, er operatørens ansvar.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Opbygningen af en bevispakke. En modtagerlog (NMEA, u-blox UBX, RINEX 3 eller en Android-log) og et tidsvindue går ind i kshana receiver-trust evidence, som skriver syv filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig og en valgfri timestamp.tsr. Manifestet registrerer SHA-256 for hele loggen og for hver fil samt en hashkæde over filerne; signaturen dækker manifestet. kshana evidence verify kontrollerer signaturen, hver fils hash, kæden og at ingen ikke-opført fil er til stede, og afslutter med 0 ved verificeret, 1 når noget fejlede og 3 når underskriveren ikke var fastlåst. En pakke er en teknisk optegnelse, ikke en juridisk udtalelse.">
</picture>

Billedet viser opbygningen af en pakke. **Registerstatus: MODELLED.**
[Testbetingelser](docs/spec/TEST-CONDITIONS.md), [Testbænk](docs/TEST-BENCH.md).

### kshana-bench

Faste opgaver, opdelinger og målinger for interferensdetektion, IQ-detektion, holdover-forudsigelse og
optimismegabet, med et forseglet tilbageholdt datasæt og en statisk rangliste. Den scorer indsendelser; den er ikke
en rangordning af modtagere.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="De indbyggede baselines for kshana-bench opgave D (optimismegabet) på testopdelingen, fra en rigtig kørsel af motoren v0.40.0 (`kshana bench baseline`). Hvert søjlepar er arealet under ROC-kurven på tilfældene inden for fordelingen og på de forskudte tilfælde; afstanden mellem dem er optimismegabet, mod en tolerance på 0.05. fused-max-z: 0.998 og 0.983 (gab 0.015); sqm-imbalance: 0.882 og 0.882 (gab 0.001); agc-excess: 0.848 og 0.819 (gab 0.030); raim-parity: 0.682 og 0.672 (gab 0.010); energy-cn0-drop: 0.595 og 0.565 (gab 0.030). Mærkerne er mærker fra en generativ model over et syntetisk korpus, aldrig feltdata: MODELLED. Vejledende: modelleret eller målt mod angivne referencer, ikke en godkendelse, certificering eller overensstemmelseserklæring. En score beskriver en log eller et korpus, aldrig et produkt.">
</picture>

**Registerstatus:** ingen egen registerrække; baselines er mærket MODELLED i resultatfilerne.
Mod de præregistrerede tærskler er scoreren, C1 til C3 og D2 opfyldt, og tre tærskler er NOT MET, hver
fastlåst af en test: A2 (`agc_k_sigma` AUC 0.766 mod mindst 0.80 på testopdelingen), D1 (største afvigelse
0.0301) og opgave (b) R1 (overført fra den tidligere kampagne, ikke kørt igen). Tallene står i
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Interferensobservatorium

Ét produkt pr. UTC-døgn og region ud fra et åbent arkiv over flypositioner, på et fast groft gitter:
hver celle er forringet, ikke forringet eller ikke observeret (hvilket ikke er "fri"). Frigives tidligst
24 h efter døgnets afslutning, med små celler undertrykt og ingen tilskrivning af årsag.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="To syntetiske interferenskortdøgn tegnet ud fra de indcheckede eksempler i examples/interference-map/output, hver med sin egen syntetiske rute og de andele af ruteeksponering, som motoren rapporterer. Til venstre et ADS-B-døgn: 1 forringet celle, 6 ikke forringede, 4 ikke vurderede (skraverede) og celler uden post, tegnet tomme, som ikke blev observeret. Ruten er 525 km: 11.5% af dens længde i forringede celler, 38.3% ikke forringet, 9.1% ikke vurderet og 41.1% ikke observeret. Til højre et AIS-døgn: celler markeret af cirkel- og på-land-detektorerne, ikke-anomale celler og tomme celler; ruten er 454 km med 10.5% i anomale celler, 21.2% ikke anomal, 0.0% ikke vurderet og 68.3% ikke observeret. ADS-B og AIS er separate lag, som aldrig kombineres. En markeret celle er ikke et fund af interferens, og en celle uden farve blev ikke observeret, hvilket ikke er det samme som fri. Alle data er opdigtede, i det åbne midtatlantiske område, og ikke en måling.">
</picture>

Billedet viser de indcheckede eksempeldøgn, ikke et observatorieprodukt. **Registerstatus: MODELLED**:
ingen ekstern reference, ingen sand tilstand og ingen tilskrivning af årsag; en celle, der ikke er observeret, blev ikke
vurderet, hvilket ikke er det samme som fri. [Observatoriets metode](docs/observatory/METHOD.md).

### Eksportører

Tillidstelemetri som Prometheus-tekst, CEF, LEEF, OTLP samt Home Assistant MQTT-discovery- og tilstands-
meddelelser. Kommandoen udgiver kun til en destination, du angiver, og indeholder ingen legitimationsoplysninger.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Ét tillidsresultat i tre eksportformater, fra rigtige kørsler af motoren v0.40.0 (`kshana trust-telemetry`) på examples/maritime-trust: Prometheus-teksteksponering (den seneste tillidsscore er 5.9, og båndet for ikke-tillid er det, der er sat) samt de sidste CEF- og LEEF-meddelelser. Kommandoen udgiver intet, medmindre den får en destination, indeholder ingen legitimationsoplysninger og udsender intet radiosignal. Vejledende software, ikke typegodkendt navigationsudstyr (IEC 61108, IEC 61162): operatøren er fortsat ansvarlig for fartøjets navigation.">
</picture>

**Registerstatus: MODELLED.** [Tillidstelemetri](docs/TRUST-TELEMETRY.md).

### Optisk linkmargin over tid

Typen `optical-atmosphere` kan skrive én seedet realisering af et steds vejr som en linkmargin-
serie: skyepisoder, en flydende vandsøjle for hver, én scintillationsprøve pr. trin. Studios
side Optisk PNT åbner optical-atmosphere-scenarierne.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Én seedet realisering af linkmarginen for stedet 'northern' over 336 h, fra en rigtig kørsel af motoren v0.40.0 på scenarios/optical-atmosphere-network.toml (seed 37, et trin på 600 s). Marginen falder under nul under skyepisoder; i denne trækning er linket oppe 40.5 % af tiden, med 27 udfald og et længste udfald på 30.7 h. Inputtene er illustrative, serien er én trækning fra modellen og ikke klimaet, og den afviger fra den statistiske tilgængelighed (37.8 %) med trækningens stikprøvefejl. Kun vejledende analyse: ikke et certificeret produkt for tilgængelighed, integritet eller navigation og ikke en forudsigelse for noget rigtigt sted, medmindre dets klimainput kommer fra et angivet datasæt.">
</picture>

**Registerstatus: MODELLED.** Én trækning fra modellen, ikke klimaet. [Optisk atmosfære](docs/OPTICAL-ATMOSPHERE.md).

### Nye Studio-visninger

[kshana.dev/studio](https://kshana.dev/studio/) får en Bridge-genafspilning (to kørsler side om side på ét
missionsur, på [`/studio/replay/`](https://kshana.dev/studio/replay/)), en side for Optisk PNT
(`/studio/optical/`), en side for holdover-test (`/studio/holdover/`) og en observatorieviser
(`/studio/observatory/`). De kører den samme motor i browseren, intet uploades, og de bærer
den samme vejledende erklæring. Billederne ovenfor er tegnet ud fra motorens eget output af et script;
de er ikke skærmbilleder af disse sider.

<a id="space-user-navigation-gnss-ssv"></a>
### Navigation for rumbrugere (`gnss-ssv`)

For et rumfartøj over, omkring eller langt forbi GNSS-banerne: hvor mange GNSS-signaler det kan bruge, hvor
stærke de er, hvor god geometrien er, og hvad et filter om bord kan gøre med dem. Én type,
fire tilstande, valgt ud fra scenariets tabeller: en **skal** af brugere (andelen af tid med ét og fire
signaler, pr. konstellation), en **bane** (signaler, C/N0, præcisionsforringelse (DOP) og
mediet langs randstrålen langs en bane), en **navigations**kørsel (et filter med ni tilstande på pseudoafstande, til
Månen) og en **formation** (relativ navigation af følgefartøjer omkring et hovedfartøj). Den offentlige kilde til
sammenligningen af tilgængelighed er hæftet om det interoperable GNSS Space Service Volume (UN OOSA
ST/SPACE/75, fra International Committee on GNSS), som selv er en simulering; det hentes, det medleveres
aldrig. Fuld side: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Signaltilgængelighed for en bruger på en kugleskal i 36000 km højde med en halvkugleantenne, fra en rigtig kørsel af motoren v0.40.0 på scenarios/gnss-ssv-shell.toml (en reduceret kørsel: 162 brugere, 3 døgn, trin på 10 min), ved en tærskel på 20 dB-Hz. For hver konstellation og hvert bånd to søjler: andelen af par (bruger, epoke) med mindst ét signal og med mindst fire. Samlet, L1: 99.4 % mindst ét, 73.2 % mindst fire, længste udfald under fire signaler 160 min. Samlet, L5: 100.0 % mindst ét, 99.9 % mindst fire, længste udfald under fire signaler 20 min. MODELLED: et modelleret studie ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Den reducerede størrelse er ikke sammenligningen med hæftet. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signaler langs én høj jordbane (perigæum 497 km, apogæum 58622 km, periode 18.8 h), fra en rigtig kørsel af motoren v0.40.0 på scenarios/gnss-ssv-heo.toml, bånd L1. Øverst: den bedste bærebølge-til-støj-tæthed blandt de synlige signaler, mod tærsklen på 20 dB-Hz. I midten: antallet af synlige signaler fra alle konstellationer, fra 4 til 55 langs de samplede punkter. Af de modtagne forbindelser kom 2252 gennem en hovedlap og 696 gennem sidelapper, med et mærket parametrisk stedfortræderdiagram, ikke noget systems målte diagram. Median PDOP 67, 95. percentil 358. MODELLED: et modelleret studie ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Et filter om bord med ni tilstande på en overførsel fra lav bane mod Månen, fra en rigtig kørsel af motoren v0.40.0 på scenarios/gnss-ssv-nav-lunar.toml (289 epoker, 13 punkter tegnet). På en logaritmisk akse den sande positionsfejl og filterets egen én-sigma-grænse mod tiden siden start. Inden for GNSS-banerne er positionens RMS 1.4 m; over dem er den 90 m, med en slutfejl på 184 m i 193,330 km højde med 1 måling. Middelværdien af den normaliserede kvadrerede estimeringsfejl over hele kørslen er 4.4 (omkring 3 for en konsistent positionsblok). Sandhed og filter deler deres stedfortrædere for Sol og Måne. MODELLED: et modelleret studie ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Relativ navigation af 2 følgefartøjer omkring et hovedfartøj i en høj bane, fra en rigtig kørsel af motoren v0.40.0 på scenarios/gnss-ssv-formation-heo.toml (401 epoker). For hvert følgefartøj to søjler: RMS for den relative position ved at trække de to uafhængige absolutte estimater fra hinanden, og fra det relative filter på enkeltdifferentierede pseudoafstande. Basislinje 0.8 km: 5.1 m og 1.2 m. Basislinje 2.0 km: 4.1 m og 2.1 m. Det absolutte filter er ikke konsistent her: middelværdien af den normaliserede kvadrerede estimeringsfejl er 187 mod omkring 3 for et konsistent filter, så dets angivne usikkerhed er alt for lille. MODELLED: et modelleret studie ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

**Registerstatus: MODELLED, og sammenligningen med hæftet misser for det meste.** Tærsklerne blev fastlagt før
kørslen. Af otte er kun S0 (det inverse linkbudget, 13 af 13 værdier) og S6 (månemissionen)
opfyldt. **S1 til S5 og S7 er NOT MET**: geometrien i det øvre og nedre servicevolumen (43 af 52 og 48 af 52
celler), det øvre servicevolumen ved 15/20/25 dB-Hz, de seks GEO-missioner, HEO-missionen og det
parametriske sidelapdiagram mod målte GPS-paneldiagrammer. Næsten hver forfejlelse i S1 til S5 involverer
GLONASS, og hæftet trykker to forskellige referencevinkler for det; en diagnostisk variant, der bruger det
andet par, bringer S1, S2 og S4 op på alle celler, men den erstatter ikke den officielle kørsel, og ingen række er
VALIDATED. Formationskørslens absolutte filter er også overmodigt (middelværdien af den normaliserede kvadrerede fejl
langt over værdien på omkring 3, som et konsistent filter giver).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Den registrerede sammenligning af tilgængelighedsmodellen for rumbrugere med det offentlige hæfte om Space Service Volume, fra de indcheckede resultater af den præregistrerede kørsel (xval/gnss-ssv/results-run1.json, skrevet af eksemplet ssv_booklet_check i motoren v0.40.0). Søjle for søjle, cellerne inden for tolerancen: S0 13 af 13 (MET); S1 43 af 52 (NOT MET); S2 48 af 52 (NOT MET); S3 122 af 155 (NOT MET); S4 132 af 156 (NOT MET); S5 18 af 26 (NOT MET); S6 26 af 26 (MET); S7 0 af 20 paneldiagrammer (NOT MET). Kun S0 og S6 er opfyldt under den præregistrerede læsning. En diagnostisk variant, der bruger hæftets andre GLONASS-vinkler, bringer S1, S2 og S4 op på alle celler, men erstatter ikke den officielle kørsel. Ingen registerrække er VALIDATED. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

[Navigation for rumbrugere](docs/SSV.md), [hvad sammenligningen viser](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Måneinfrastruktur (`lunar-infrastructure`)

Månens bane og overflade som navigations- og geodætisk infrastruktur, i fem studier valgt med
`study`: **od-consistency** (en banebestemmelse om bord med Jord-GNSS i en halobane mod en
uafhængig fra jorden), **carrier-phase** (fastlæggelse af heltalsmultiplicitet mellem overfladestationer og en
orbiter), **frame-coestimation** (månedatummet ud fra afstandsmåling fra jordstationer med og uden orbiter-
forbindelser), **space-tie** (laser-, VLBI- og GNSS-forskydninger på ét rumfartøj mod fejlen i den lokale binding) og
**geodesy-sensitivity** (hvilken observabelfamilie der ser Love-tallene h2, k2 og l2). Modellen er en
begrænset trelegememodel med angivne forenklinger og illustrative input. Fuld side:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Konsistens mellem en banebestemmelse om bord med Jord-GNSS i en næsten retlinet halobane og en uafhængig banebestemmelse fra jorden, fra rigtige kørsler af motoren v0.40.0 på scenarios/lunar-infrastructure-od-consistency.toml og varianten med modelfejl (400 forsøg hver). Den gennemsnitlige normaliserede forskel q er 5.81 uden modelfejl og 5.95 med en indført accelerationsfejl på 3e-10 m/s2, mod forventet 6: de to baneløsninger er konsistente (tærskel C1 MET). Andelen af forsøg over 95 %-punktet er 0.040 og 0.052; tærsklen for at detektere den indførte fejl var mindst 0.5, så den er NOT MET (C3): løsningen om bord kendes til omkring 352 m mod 23 m for den fra jorden, så en forskydning på ti meter skjuler sig i dens kovarians. MODELLED: en begrænset trelegememodel med angivne forenklinger og illustrative input, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Fastlæggelse af heltalsmultiplicitet i bærebølgefasen mellem overfladestationer på Månen og en orbiter, fra det indcheckede resultat af den scorede kørsel af motoren v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 buelængder, en Monte Carlo med 401 trækninger hver, skrevet af scenarios/carrier-phase-scored.toml). 1 døgn: succes 1.0 % (standardfejl 0.5 %), 134 multipliciteter, orbiterens positionssigma 45.6 m flydende og 18.5 m fastlagt; 2 døgn: succes 0.5 % (standardfejl 0.4 %), 259 multipliciteter, orbiterens positionssigma 21.5 m flydende og 8.7 m fastlagt; 3 døgn: succes 2.8 % (standardfejl 0.8 %), 375 multipliciteter, orbiterens positionssigma 6.3 m flydende og 2.1 m fastlagt. Heltalsfastlæggelse opnås ikke: succesen ligger mellem 1 % og 3 % ved 25 dBi, og ved de registrerede 12 dBi kan problemet ikke opstilles. MODELLED: en begrænset trelegememodel med angivne forenklinger og illustrative input, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Præcisionen af månedatummet med syv parametre (tre translationer, en skala og tre rotationer) ud fra afstandsmåling fra jordstationer, med og uden afstande fra orbiter til overfladestation, fra en rigtig kørsel af motoren v0.40.0 på scenarios/lunar-infrastructure-frame-coestimation.toml. Cramer-Rao-sigmaen for translationerne og rotationerne falder med orbiterforbindelserne (for eksempel t_z fra 0.98 m til 0.046 m); den mindste informationsegenværdi stiger 111 gange, og CRLB-sporet falder til 1.0 % (tærskel F3 MET). Dette forudsætter, at banen er kendt i måneakserne, med dens fejl båret af orbiterens afstandssigma på 1 m. MODELLED: en begrænset trelegememodel med angivne forenklinger og illustrative input, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Præcisionen af forskydningerne mellem laserafstandsmåling, VLBI og GNSS-positioner for ét rumfartøj, mod fejlen i den lokale binding på jorden, fra en rigtig kørsel af motoren v0.40.0 på scenarios/lunar-infrastructure-space-tie.toml (én bue på 6.56 døgn, teknikkernes sigma GNSS 10 m, VLBI 1 m, laser 0.1 m). Med en lokal binding fra 1 mm til 1 m forbliver sigmaen for translationen laser minus GNSS nær 1.04 m, indtil bindingen når 1 m: den er begrænset af teknikkernes målestøj, ikke af den lokale binding. Gulvet, der sættes af bindingen alene, er kvadratroden af to gange dens sigma. MODELLED: en begrænset trelegememodel med angivne forenklinger og illustrative input, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Hvilken observabelfamilie der er følsom over for Månens Love-tal h2, k2 og l2, fra en rigtig kørsel af motoren v0.40.0 på scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Hver celle er RMS af den partielle afledte af en families observationer med hensyn til en parameter, i familiens egne enheder (så celler sammenlignes langs en række, ikke ned ad en kolonne); en tankestreg betyder, at familien ikke har nogen følsomhed. laserafstandsmåling: h2 7.6, k2 ingen, l2 9.8. orbitersporing: h2 ingen, k2 0.00086, l2 ingen. overfladegravimeter: h2 2.9e+03, k2 4.3e+03, l2 ingen. overfladeur: h2 2.8e-17, k2 2.8e-17, l2 ingen. Med alle fire familier er Cramer-Rao-sigmaen 0.36 % af nominel h2, 0.52 % af k2 og 1.16 % af l2. At tilføje en familie sænkede aldrig den mindste egenværdi (28 af 28 tilføjelser), men sporet af pseudo-inversen var kun ikke større i 16 af 28: den halvdel af tærskel G3 er NOT MET. Orbiterfamilien ser sigtelinjeintegralet af k2-accelerationen, et tal i den høje ende. MODELLED: en begrænset trelegememodel med angivne forenklinger og illustrative input, ikke en måling af nogen månestørrelse. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life).">
</picture>

**Registerstatus: MODELLED, og tre tærskler er NOT MET.** Numerikken kontrolleres mod uafhængige
numpy- og scipy-programmer; intet sammenlignes med en måling af en månestørrelse, og intet er
VALIDATED. Opfyldt: de to baneløsninger er konsistente (middel q 5.81 mod forventet 6), og orbiter-
forbindelser hæver den mindste datum-egenværdi omkring 111 gange, forudsat en kendt bane. **Ikke opfyldt**: den
indførte modelfejl på 3e-10 m/s2 **detekteres ikke** (C3: løsningen om bord kendes til omkring 350 m, så
omkring ti meter skjuler sig i dens kovarians); **heltalsfastlæggelse opnås ikke** (1 til 3 % succes ved
25 dBi, og ved de registrerede 12 dBi kan problemet ikke opstilles); og sporhalvdelen af G3 for at tilføje en
observabelfamilie (sporet steg i 12 af 28 tilføjelser, hver gang fordi familien hævede rangen).
Hver forfejlelse er fastlåst af en test. [Måneinfrastruktur](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Åbn [kshana.dev/studio](https://kshana.dev/studio/), og hele motoren kører i din
browser, kompileret til WebAssembly. Intet at installere, og intet uploades. Studio har
to visninger af den samme motor, og en kontakt i sidehovedet skifter mellem dem og bevarer
scenariet, visningen og de indstillinger, du har ændret.

**Den enkle visning** er der, hvor Studio åbner. Den tager udgangspunkt i spørgsmål (hvor mange satellitter
kan jeg se, kan jeg stole på min positionsbestemmelse, hvor længe kan et ur holde tiden, hvad gør en jammer
ved min modtager) og i et kort over alt, hvad motoren kan, hvert område med sin andel af
validerede metoder. Åbn et scenarie, og svaret kommer først: én enkel sætning, skrevet til
det, scenariet måler, derefter dets nøgletal og et diagram. Højst fem indstillinger er
synlige, dem der ændrer svaret mest; resten venter under **Avancerede indstillinger**.
**Sådan beregnes dette** forklarer metoden, og **For forskere** giver motorens egne
tal, scenariefilen, koden til at køre det fra Python og citationen.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, enkel visning, på det medfølgende scenarie integrity-raim, motoren v0.40.0 kører lokalt. Spørgsmålet: opfylder geometrien alarmgrænserne (horisontalt og vertikalt beskyttelsesniveau)? Svaret først, markeret Live-resultat: Ja, for det meste: i 95.3 % af de 12 h. Modtagerens fejlgrænse holdt sig under alarmgrænserne (40 m horisontalt og 50 m vertikalt) ved 344 af 361 kontroller, og ingen positionsbestemmelse var vildledende. Nøgletal: tid hvor positionsbestemmelsen kan stoles på 95.3 %, længste hul 10 min, typisk fejlgrænse 6.5 / 13 m, vildledende positionsbestemmelser 0. Ved siden af Prøv andre indstillinger med fem af dem (afstandsfejlen, de to alarmgrænser, varigheden og elevationsmasken) og Kør igen, derefter de sammenfoldede afsnit Avancerede indstillinger (13 flere), Sådan beregnes dette (8 validerede, 6 modellerede) og For forskere. Nedenfor visningerne af dette resultat og beskyttelsesniveauerne plottet mod alarmgrænsen." width="100%">
</picture>

**Den avancerede visning** er det fulde dashboard: scenariebiblioteket, fem nummererede trin
(Vælg, Indstil, Kør, Læs resultater, Del eller eksportér), nøgletallene med PASS- og FAIL-mærker,
hvor kørslen angiver en tærskel, og hvert panel: oversigt, diagrammer, kort, genafspilning,
motorens rapport og eksporter. Ét søgefelt når scenarier, domæner og felterne i
dem, og du kan fastgøre op til fire kørsler og sammenligne dem side om side.

<details>
<summary>Den enkle visnings startskærm og den avancerede visning efter en kørsel</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, enkel visning, startskærm med titlen Hvad vil du gerne finde ud af?, med motoren v0.40.0 live og i topbjælken tre links: Træningsdebriefing, Interferenskort og Modtagertillid. Fire spørgsmål: hvor mange satellitter kan jeg se overalt på Jorden, kan jeg stole på min positionsbestemmelse, hvor længe kan et ur holde tiden uden satellitter, og hvad gør en jammer ved min modtager. Under det første dets optagede resultat: mindst 22 synlige satellitter alle steder og 31 i gennemsnit med GPS, Galileo, BeiDou og GLONASS tilsammen, en positionsbestemmelse mulig 100 % af stederne og tiderne, på et verdenskort over synlige satellitter, med en knap Åbn dette resultat. Ved siden af Alt hvad Kshana kan: 16 områder og 139 kørselsklare scenarier, hver flise med et lille diagram fra en optaget kørsel og dens andel af validerede metoder, og registrets 173 af 350 funktioner valideret." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, avanceret visning, efter en kørsel af det medfølgende scenarie constellation-multi-gnss-coverage (Fire GNSS-konstellationer, ét kort), motoren v0.40.0 kører lokalt. Til venstre scenariebiblioteket, 139 scenarier i 16 domæner. De fem trin Vælg, Indstil, Kør, Læs resultater og Del eller eksportér, med trin 4 aktivt. Nøgletal: 102 satellitter, tilgængelighed 100 % (PASS), median præcisionsforringelse for position (PDOP) 0.95 (PASS), PDOP 95. percentil 1.105 (PASS), 31.03 synlige satellitter i gennemsnit og 22 som det mindste. Nedenfor panelrækken med Dækning valgt, genafspilningsbjælken, et verdenskort over middel-PDOP fra 0.831 til 1.0853 med hver satellit tegnet og de globale dækningstal." width="100%">
</picture>

</details>

Studios kildekode og byggenoter står i [`web/README.md`](web/README.md).

### Websitet

Resten af [kshana.dev](https://kshana.dev) er bygget ud fra dette repositories egne filer og
motorkørsler: missioner, funktioner, evidensregistret, den offentliggjorte forskning og
udgaverne.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Tre sider af kshana.dev side om side. Forsidens hero: navnelinjen Kshana · क्षण · det præcise øjeblik over overskriften Øv det minut, hvor GNSS går i sort, med missionskonsollen fra en rigtig kørsel af motoren v0.40.0 (en globus og tre live-diagrammer: urets tidsfejl, bærebølge-til-støj-tæthed og beskyttelsesniveau). Evidens, Offentliggjort forskning: de seks arXiv-artikler bygget på den åbne motor, den nyeste med en figur fra motoren. Udgaver, Kshana Pro, den samme motor, forstærket: Free kører ét scenarie, Pro besvarer programmets spørgsmål." width="100%">
</picture>

<a id="capabilities"></a>
## Funktioner

Én motor dækker hele fejlkæden, fra den første jammede satellit til det sidste
nanosekund af ur-holdover. Motoren har 92 scenarietyper; `kshana kinds` oplister
dem, og [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumenterer hvert felt.

| Funktion | Hvad den besvarer |
|---|---|
| [Spektrum](docs/SPECTRUM.md) | hvordan en jammer indtager GNSS' L-bånd, bånd for bånd, sekund for sekund |
| [Ure og tidssynkronisering](docs/TELECOM-TIMING.md) | hvor længe hvert ur holder tiden, efter at GNSS er tabt |
| [Konstellationer omkring ethvert legeme](docs/CONSTELLATION-DESIGN.md) | dækning, præcisionsforringelse og tilgængelighed omkring Jorden, Månen eller Mars |
| [Solsystemet](docs/SOLAR-SYSTEM.md) | hvor hver planet er, og lystiden for enhver forbindelse |
| [Navigation i lav jordbane](docs/LEO-PNT.md) | en passage, en forbindelse, en navigationsmeddelelse og en fusioneret positionsbestemmelse, trin for trin |
| [Kampagner](docs/CAMPAIGNS.md) | en kædet mission, en parametergennemløb eller et Monte Carlo-ensemble i ét scenarie |
| [Animation](docs/ANIMATION.md) | en kørsels tidsserie som en animeret tegning, en afspiller eller enkeltbilleder |
| [Rapporter](docs/REPORTS.md) | hvert tal med sin enhed og sin betegnelse, i HTML (HyperText Markup Language) og JSON (JavaScript Object Notation) |
| [Eksporter til interoperabilitet](docs/INTEROP.md) | baner og geometri til andre værktøjer: SP3, CCSDS OMM og OEM, CZML, KML, GeoJSON, STK og SigMF |
| [Maritim tillid](docs/MARITIME-TRUST.md) | kan broen stole på denne positionsbestemmelse: en score fra 0-100 og begrundelser for et fartøjs NMEA, live eller fra en log (vejledende, ikke typegodkendt navigationsudstyr) |
| [NMEA-træningsstrømme](docs/NMEA-TRAINING.md) | syntetisk bro-NMEA med scriptet jamming og spoofing og en instruktørlog, til træning af besætningen (kun tekst; aldrig til et fartøjs aktive navigationssystemer; vejledende, ikke typegodkendt navigationsudstyr) |
| [Interferenskort](docs/INTERFERENCE-MAP.md) | hvor fly og skibe rapporterede forringede navigationsdata, og hvor meget af en rute det berører |
| [Kildeområde](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | hvor en kilde til forringede positionsrapporter kan befinde sig under angivne antagelser: områder med angivet konfidens, et tyngdepunkt med sin ellipse, aldrig et punkt (MODELLED; `kshana interference-map locate`) |
| [Bevispakker](docs/EVIDENCE-PACKS.md) | en signeret teknisk optegnelse, der kan verificeres offline, af et fartøjs logvindue og hvad motoren beregnede ud fra det, til en hændelsesrapport (vejledende, ikke typegodkendt navigationsudstyr) |
| [Tillidstelemetri](docs/TRUST-TELEMETRY.md) | tillidsstrømmen som Prometheus-målinger, SIEM-hændelser og valgfri OpenTelemetry, med et eksempel på et Grafana-dashboard (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K og OpenCPN](docs/MARINE-INTEGRATIONS.md) | tillidsscoren på en båds Signal K-server og i OpenCPN, med en referenceopbygning til en lille computer ved siden af modtageren (vejledende, ikke typegodkendt navigationsudstyr) |
| [Eksport til testbænk](docs/TEST-BENCH.md) | `kshana bench-export`: et scenaries køretøjsbevægelse og hændelser til en GNSS-laboratoriesimulator (intet signal skrives), og hvordan modtagerens log scores bagefter |
| [Compliance-kortlægning og -rapport](docs/compliance/README.md) | `kshana compliance-report`: hvilke rækker i offentlige robusthedsrammeværker et sæt kørsler understøtter evidens for, og det hul, der er tilbage |
| [Notebooks](notebooks/README.md) | kørbare vejledninger: fartøjstillid og træningsstrømme, ruteeksponering på et interferenskort, compliance-kortlægning og testbænken, kvante- mod klassisk GDOP |
| [Galileo OSNMA-verifikator](docs/OSNMA.md) | hvilke satellitters navigationsdata en modtager kan autentificere kryptografisk, og hvorfor en kontrol fejler; Kshana giver ingen rettigheder under EU's OSNMA ICD IPRs (se NOTICE på siden) |

Eksportformaterne fuldt udskrevet: SP3 er Standard Product 3; CCSDS OMM og OEM er Orbit
Mean-elements og Orbit Ephemeris Messages fra Consultative Committee for Space Data
Systems; CZML og KML er Cesium og Keyhole Markup Languages; STK er Systems Tool Kit;
SigMF er Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Den kædede kampagne campaign-jam-spoof-holdover-integrity, én rigtig kørsel af motoren (seed 20260928): 6 faser (Nominel → Jamming → Spoofing → Holdover → Integritetsalarm → Genopretning) og 18 medlemskørsler på et gitter på 10 s over T+01:16:10. Tre baner: urets tidsfejl mod en grænse på 50 ns (top 62.7 ns), effektiv bærebølge-til-støj-tæthed mod et gulv på 25 dB-Hz (minimum -12.2 dB-Hz) og vertikalt beskyttelsesniveau mod en alarmgrænse på 50 m (top 135.4 m), med kørslens alarmhændelser: T+00:20:00 RF-spoofingdetektoren alarmerer (fusionerede monitorer for konsistens, effekt og signalkvalitet); T+00:26:10 den urstøttede spoofingmonitor alarmerer." width="100%">
</picture>

<details>
<summary>Hver funktion, tegnet ud fra en rigtig kørsel: L-båndets vandfaldsdiagram, dækningskortet, solsystemet og en passage i lav jordbane</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="GNSS' L-bånd som én effektspektraltæthed over 60 s, fra en rigtig kørsel af typen spectrum (l-band-waterfall-jamming.toml, seed 7, motoren v0.40.0): frekvens på tværs, tid nedad, farve for effekt over støjgulvet på -202.0 dBW/Hz. Jammere: chirp-privatlivsenhed (chirp, tændt ved 10 s, slukket ved 40 s); CW-tone på L1 (cw, tændt ved 30 s); smalbåndsstøj på L2 (narrowband, tændt ved 45 s). Værste bånd GPS L1 C/A: minimal effektiv C/N0 3.2 dB-Hz ved 31 s mod et sporingsgulv på 25 dB-Hz. GPS L1 C/A minimum 3.2 dB-Hz; Galileo E1 minimum 4.7 dB-Hz; GPS L2C minimum 36.9 dB-Hz; GPS L5 minimum 44.1 dB-Hz; Galileo E5a minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Synlige satellitter over hele Jorden i ét døgn, fra en rigtig kørsel af constellation-design (constellation-multi-gnss-coverage.toml, motoren kørt af denne generator): 102 satellitter (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Hver celle på 10 grader er skraveret efter det gennemsnitlige antal satellitter over masken på 10 grader (27.2 til 36.5); prikkerne er motorens jordsporsprøver, én pr. time pr. satellit. Global tilgængelighed 100.00 % ved PDOP på højst 6, median PDOP 0.95, gennemsnit 31.0 og minimum 22 synlige satellitter." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Solsystemet ved scenariets epoke 2026-09-28T00:00:00, fra en rigtig kørsel af typen solar-system (solar-system-tour.toml): Solen, 9 planeter og dværgplaneten Pluto set ovenfra ekliptika, afstande komprimeret logaritmisk af hensyn til visningen, med hvert legemes envejs-lystid fra Jorden. Merkur 0.47 au, 10.1 lysminutter, VALIDATED; Venus 0.73 au, 3.0 lysminutter, VALIDATED; Mars 1.55 au, 14.0 lysminutter, VALIDATED; Jupiter 5.30 au, 49.5 lysminutter, VALIDATED; Saturn 9.44 au, 70.2 lysminutter, VALIDATED; Uranus 19.44 au, 157.4 lysminutter, MODELLED; Neptun 29.88 au, 240.2 lysminutter, MODELLED; Pluto 35.61 au, 292.2 lysminutter, MODELLED. Forbindelser: Mars til Jupiter envejs 2193.5 s; Saturn til Jorden envejs 4212.2 s; Europa til Jupiter envejs 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Én passage i lav jordbane (LEO) fra en rigtig kørsel af typen leo-pass (leo-pass-iridium.toml, motoren kørt af denne generator): Iridium-pass i 781 km, STL-bånd ved 1621 MHz, set af en luftbruger ved 50° N 30° V. Over masken på 5° i 750 s, maksimal elevation 65.0° ved 444 s. Bærebølge-til-støj-tætheden topper ved 80.5 dB-Hz (median 71.3), 34.3 dB over GNSS-medianen på 46.2 dB-Hz fra 8 synlige GPS-satellitter (38.2 til 51.1 dB-Hz); Doppler når 35.4 kHz." width="100%">
</picture>

Kør en hvilken som helst af dem med `kshana example <scenario> > s.toml && kshana s.toml`: scenarierne
er `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
og `leo-pass-iridium`.

</details>

<details>
<summary>De maritime og interferensrelaterede funktioner, tegnet ud fra indcheckede syntetiske input: en tillidsscore, et interferenskort med ruteeksponering, en træningsstrøm og en bevispakke</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Tillidsscore over én syntetisk overfart, fra en rigtig kørsel af motoren v0.40.0 på examples/maritime-trust (en opdigtet NMEA-log fra en færge på en rute fra Tallinn til Helsinki, 3001 epoker ved 1 Hz). Tre baner deler én tidsakse. Øverst: afstanden mellem den position, modtageren rapporterer, og fartøjets virkelige position, som holder sig inden for få meter indtil omkring 1576 s, hvor loggens scriptede positionsforskydning trækker den væk, mens modtageren fortsat rapporterer en gyldig positionsbestemmelse. I midten: tillidsscoren fra 0 til 100, ikke beregnet i de første 300 s med kalibrering, i det nominelle bånd (mindst 90) indtil forskydningen, derefter faldende gennem det forringede bånd (mindst 55) ind i båndet for ikke-tillid. Nederst: hver epokes bånd som et farvet bånd med sit navn. Scoren er vejledende. Vejledende software, ikke typegodkendt navigationsudstyr (IEC 61108, IEC 61162): operatøren er fortsat ansvarlig for fartøjets navigation. Loggen er opdigtet for at vise formatet og monitorerne; den er ikke en måling og siger intet om, hvordan nogen modtager ville præstere." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="To syntetiske interferenskortdøgn tegnet ud fra de indcheckede eksempler i examples/interference-map/output, hver med sin egen syntetiske rute og de andele af ruteeksponering, som motoren rapporterer. Til venstre et ADS-B-døgn: 1 forringet celle, 6 ikke forringede, 4 ikke vurderede (skraverede) og celler uden post, tegnet tomme, som ikke blev observeret. Ruten er 525 km: 11.5% af dens længde i forringede celler, 38.3% ikke forringet, 9.1% ikke vurderet og 41.1% ikke observeret. Til højre et AIS-døgn: celler markeret af cirkel- og på-land-detektorerne, ikke-anomale celler og tomme celler; ruten er 454 km med 10.5% i anomale celler, 21.2% ikke anomal, 0.0% ikke vurderet og 68.3% ikke observeret. ADS-B og AIS er separate lag, som aldrig kombineres. En markeret celle er ikke et fund af interferens, og en celle uden farve blev ikke observeret, hvilket ikke er det samme som fri. Alle data er opdigtede, i det åbne midtatlantiske område, og ikke en måling." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Træningsstrøm fra scenariet coastal-drag-off (motoren v0.40.0, seed 22, 25 minutter med én positionsbestemmelse pr. 10 s i instruktørloggen). Et kort viser fartøjets sande spor og det spor, modtageren rapporterer: de stemmer overens, indtil en scriptet positionsforskydning begynder ved 421 s, hvorefter det rapporterede spor vandrer væk fra det sande, mens modtageren bevarer en gyldig positionsbestemmelse, og det springer tilbage, når hændelsen slutter ved 1140 s. Ved siden af afstanden mellem de to spor over tid og den gennemsnitlige bærebølge-til-støj-tæthed, modtageren rapporterer, som stiger til ét forhøjet niveau, mens hændelsen varer. Syntetiske træningsdata genereret af Kshana. Kun til træning og test: før aldrig denne strøm ind i et fartøjs aktive navigationssystemer. Vejledende, ikke typegodkendt navigationsudstyr. Vejledende software, ikke typegodkendt navigationsudstyr (IEC 61108, IEC 61162): operatøren er fortsat ansvarlig for fartøjets navigation. Positioner, datoer og spor er opdigtede." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Opbygningen af en bevispakke. En modtagerlog (NMEA, u-blox UBX, RINEX 3 eller en Android-log) og et tidsvindue går ind i kshana receiver-trust evidence, som skriver syv filer: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig og en valgfri timestamp.tsr. Manifestet registrerer SHA-256 for hele loggen og for hver fil samt en hashkæde over filerne; signaturen dækker manifestet. kshana evidence verify kontrollerer signaturen, hver fils hash, kæden og at ingen ikke-opført fil er til stede, og afslutter med 0 ved verificeret, 1 når noget fejlede og 3 når underskriveren ikke var fastlåst. En pakke er en teknisk optegnelse, ikke en juridisk udtalelse." width="100%">
</picture>

Alle fire er opdigtede data og vejledende: de viser softwarens format og adfærd, ikke hvordan nogen modtager eller noget system præsterer mod interferens. Kør den første med `kshana receiver-trust examples/maritime-trust/session.toml`, den anden med `kshana route-exposure` på eksemplerne i `examples/interference-map/`, den tredje med `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (kun til træningsbrug: før den aldrig ind i aktivt navigationsudstyr) og den fjerde som i [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Den fulde funktionstabel, domæne for domæne</summary>

Den fulde gennemgang domæne for domæne følger; for et modenhedsregister pr. funktion se
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) og [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Domæne | Funktion |
|--------|------------|
| **Bane og geometri** | SGP4/SDP4-propagering (valideret til 4.12 mm mod alle 666 AIAA 2006-6753-vektorer); rigtige to-linje-elementer (et indchecket, datostemplet Celestrak `gps-ops`-øjebliksbillede) eller syntetiske Walker-delta-konstellationer, hvis middelelementer realiserer formlen `i:T/P/F` til under 1 km over en propagering på 24 h; synlighed for flere konstellationer, **præcisionsforringelse — geometrisk, position, horisontal, vertikal og tid (GDOP/PDOP/HDOP/VDOP/TDOP), valideret til 1e-6 mod gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), og GNSS-tilgængelighed; en gradientfri optimering af konstellationsdesign, dimensionering af minimumsantal satellitter efter streets-of-coverage, et sammenligningsværktøj for flere konstellationer og et Walker-**designgennemløb**, der tabellerer dækning / PDOP / genbesøgstid over et gitter af baneplaner × satellitter og rapporterer de Pareto-optimale design. |
| **Numerisk propagator** | En numerisk **Cowell**-propagator (`src/propagator.rs`), der supplerer den analytiske SGP4/SDP4-vej, med en hierarkisk kraftmodel med **syv forstyrrelser** (`src/forces.rs`): tolegeme + det fulde **J2–J6-zonalfelt** (zonale harmoniske koefficienter for Jordens afplatning J2 til J6; den eksakte analytiske gradient af dets forstyrrende potential), et valgfrit **EGM2008 tesseralt sfærisk-harmonisk geopotential til grad/orden 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; rigtige koefficienter fra NGA — US (United States) National Geospatial-Intelligence Agency —, Holmes–Featherstone-rekursion for normaliserede Legendre-funktioner, krydskontrolleret mod Legendre-funktionerne på lukket form og den analytiske ∇V-identitet), **epokedrevet tredjelegeme-tyngdekraft fra Sol og Måne** (en indbygget efemeride med lav præcision, ingen DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel — kerne), **solstrålingstryk** (kanonkuglemodel med en konisk umbra+penumbra-skygge), **atmosfærisk modstand** (Vallados stykvist eksponentielle tæthed, medroterende atmosfære), den **post-newtonske relativistiske Schwarzschild-korrektion** og **Lense–Thirring-frame-dragging**-leddet (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, lineært i Jordens impulsmoment, ~1–2 størrelsesordener under Schwarzschild) — drevet af et valg mellem to adaptive integratorer (RK4 — fjerdeordens Runge–Kutta — med skridtfordobling eller det indlejrede **Dormand–Prince RK5(4)**-par). **Valideret mod Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epoker på tværs af LEO (lav jordbane) + GTO (geostationær overføringsbane), hvor niveauerne med konservative kræfter stemmer overens til i værste fald **\|Δr\| 0.08 m over 24 h** (`tests/numerical_cowell_propagator_reference.rs`); niveauet med atmosfærisk modstand karakteriseres separat (≈ 333 m / 24 h), og de absolutte input for Sol/Måne-efemeride og tæthed forbliver ærligt **Modelled**. Yderligere intern evidens (ikke ekstern validering): den uforstyrrede bane kontrolleres mod den eksakte Kepler-løsning med universelle variable til **under en meter over 24 h**, energi/impulsmoment bevares til ~1e-9, og hver forstyrrelse stemmer overens med en håndudledt signatur på lukket form. |
| **Manøvrer og banedesign** | Impulsive ΔV-knuder med propagering af 6×6-kovarians (ECI — jordcentreret inertial — / LVLH — lokal vertikal, lokal horisontal — referencesystemer for udførelsesfejl), integration af endelige brænd kontrolleret mod **Tsiolkovskys** raketligning på lukket form til < 0.01 %, en **Lambert**-løser for ét omløb efter **Izzo-2015**, en eksakt **Kepler**-propagator med universelle variable og et **porkchop**-gennemløb (opsendelse × ankomst) af C3 (opsendelsesenergi) / ankomst-V∞ udskrevet som et JSON-konturgitter — ydelsessimuleringslaget over GMAT/Orekit, hvor hvert Lambert-output kontrolleres i rundtur mod tolegemesandhed, og porkchop-minimum kontrolleres mod den analytiske Hohmann-nedre grænse. |
| **Tidssystemer og referencesystemer** | IERS-skudsekund-skalaerne **UTC / TAI / TT / UT1** (Coordinated Universal Time, International Atomic Time, Terrestrial Time og Jordens rotationstid Universal Time 1), en API (programmeringsgrænseflade) for julianske datoer, IAU-2000 (International Astronomical Union) **Earth Rotation Angle** (ERA), GMST-baseret (Greenwich Mean Sidereal Time) **TEME ↔ ECEF** (sand ækvator, middel-jævndøgn ↔ jordcentreret, jordfast) med geodætiske WGS-84-systemer (World Geodetic System 1984), IAU 2006-præcession (Fukushima–Williams), fuld **IAU 2000A/2000B-nutation**, IERS-**polbevægelse** og den jævndøgnsfri **CIO-baserede IAU 2006/2000A GCRS↔ITRS**-reduktion (CIO = Celestial Intermediate Origin) — alt valideret **bit for bit** mod SOFA/ERFA-vektorerne og **uafhængigt krydskontrolleret mod ANISE** (den rene Rust-genimplementering af NAIF/SPICE; NAIF = Navigation and Ancillary Information Facility hos NASA, US National Aeronautics and Space Administration): kshanas GCRS→ITRS mod ANISE's ITRF93 (International Terrestrial Reference Frame 1993) fra JPL's `earth_latest_high_prec.bpc`, med de samme IERS-jordorienteringsparametre givet til begge, stemmer overens til **≤ 0.86 m på jorden / ≤ 3.6 m i GNSS-bane** (maks. 0.028″) over otte epoker 2020–2023. |
| **Inertial** | Treakset strapdown-INS — kvaternionattitude, WGS-84 NED-mekanisering (nord-øst-ned), coning/sculling-kompensation og en deterministisk IMU-fejlmodel (skalafaktor, fejljustering, g-følsomhed, kvantisering, drift); et **accelerometer baseret på koldatom-interferometri ud fra grundprincipper** (Mach–Zehnder-fase, kvanteprojektionsstøj, kontrastforfald, vibrationskobling), der *udleder* koefficienten for hastigheds-random-walk; og et **partikelfilter** med sekventiel importance-resampling til kortstøttet (terræn-/tyngdekraftsrefereret) GPS-fri navigation. |
| **Alt-PNT (uden GPS)** | En **målemodel for koldatom-gravimeter**, hvis hvid-støj-gulv (`σ = ASD/√τ`, ASD = amplitudespektraltæthed) er udledt af CAI-accelerometerets fysik; et fuldt normaliseret **sfærisk-harmonisk tyngdeanomalifelt** af lav grad (kontrolleret mod Legendre-funktionerne på lukket form og en håndudledt anomali med ét led) plus syntetiske masconer; **syntesekernen for tyngdefunktionaler** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — den "kortlæser", som en tyngdestøttet navigator matcher mod — er valideret mod **GRS80-normaltyngdestandarden** (Geodetic Reference System 1980), gengiver Somiglianas normaltyngde på lukket form og de offentliggjorte γ_e / γ_p til **3.5e-12** og producerer et fysisk afgrænset forstyrrelseskort ud fra det rigtige **EGM2008**-felt fra ICGEM (International Centre for Global Earth Models) (RMS — kvadratisk middelværdi — ≈ 26 mGal, maks. ≈ 89 mGal ved g/o 70; `tests/icgem_gravity_reference.rs`); og et **partikelfilter til tyngdekortmatchning**, der genskaber et GPS-frit spor ud fra den anomalisekvens, det flyver igennem. Det udvides til **terrænrefereret navigation** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — mod en SRTM (Shuttle Radar Topography Mission) `.hgt` DEM (digital højdemodel), `src/altpnt/terrain.rs`), et **IGRF-14 geomagnetisk hovedfelt** (14. generation af International Geomagnetic Reference Field) til grad/orden 13 (`src/igrf.rs`, kontrolleret mod den skrå dipols lukkede form og ∇V-endelige differenser) og en **kombineret tyngde- + magnet- + terræn**-navigator, der fusionerer alle tre skalare kanaler gennem ét partikelfilter (information er additiv — ingen kanal gør positionsbestemmelsen dårligere). En **60-minutters GPS-fri benchmark** (et udfald på ~700 km / én time, hvor den inertielle løsning driver til ~70 km) genskabes til **~145 m (< 500 m)** af en hierarkisk grov-til-fin matcher — målet for ESA NAVISP (Navigation Innovation and Support Programme) *Quantum Wayfarer*. |
| **Fusion** | Løst koblet GNSS/INS-fejltilstands-EKF (udvidet Kalman-filter) med 15 tilstande og lukket-sløjfe-tilbagekobling (pakken `gnss-ins`); en **tæt koblet** pseudoafstandsopdatering, der fortsætter med at korrigere med færre end fire satellitter; et koblet **ur + position**-filter; en generel **unscented (sigma-punkt) Kalman**-estimator til stærkt ikke-lineære målinger; en tæt koblet GNSS/INS-**UKF-navigator** (pseudoafstand + Doppler), hvis kraftmodelbaserede baneglidning er selvkonsistenskontrolleret til **0.77 m RMS** over en 30-minutters krummende LEO-passage, der omfatter et 120-sekunders GNSS-udfald (et tal for filterkonsistens, ikke en validering mod ekstern reference — denne navigator forbliver MODELLED); og en fuld **tæt koblet GNSS/INS-UKF med 17 tilstande** (position, hastighed, attitudefejl, accelerometer- og gyrobias, urbias og -drift), hvis **kvante-CAI-dødregning** glider gennem et 120-sekunders udfald på koldatom-accelerometerets udledte hastigheds-random-walk. |
| **Banebestemmelse** | Genskabelse af en banetilstand `[r, v]` ud fra afstandssporing fra jordstationer, der sammensætter tolegeme- + J2-kraftmodellen og RK4-integratoren med en **Gauss–Newton-batch**-korrektor (`determine_orbit_batch`, under en meter / mm·s⁻¹ fra støjfrie afstande, ~2 m ved et støjgulv på 5 m) og en **sekventiel** unscented-filtervariant (`determine_orbit_sequential`). |
| **Observerbarhed og estimationsteori** | Et generelt, genbrugeligt **Fisher-information / Cramér–Rao**-lag (`src/fim.rs`): informationsmatricen M = HᵀWH, **Cramér–Rao-nedre grænse**, observerbarhedens **rang og datumdefektens nulrum** (Moore–Penrose-pseudo-invers) og **D/A/E/T-optimale** skalarer for forsøgsdesign fra en symmetrisk Jacobi-egenværdiløser. **Valideret** — egenværdier mod `numpy.linalg.eigh`, CRLB-kovariansen mod σ²(XᵀX)⁻¹ via `numpy.linalg.inv` og GNSS-DOP fra informationsmatricen, alt i overensstemmelse til **1e-9** (`tests/fim_observability_reference.rs`), og desuden krydskontrolleret mod grænserne på lukket form fra **Kay (1993)** med Monte Carlo-opnåelse af CRLB. Det understøtter DOP-motoren, CRLB for passiv geolokalisering og **observerbarhedssætningen** for absolutte månestationer (nedenfor). |
| **Måne og cislunar** | En propagator for Jord–Måne-**cirkulært begrænset trelegemeproblem (CR3BP)** i det roterende system — bevaret Jacobi-konstant og alle fem Lagrange-punkter (`src/cr3bp.rs`) — nu med en **6×6-tilstandsovergangsmatrix (STM) og en differentialkorrektor med enkeltskydning** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`), der producerer ægte periodiske **halo- / NRHO**-baner (næsten retlinet halobane): STM'en er valideret mod endelige differenser, korrigerede baner lukker til maskinpræcision, og at seede den offentliggjorte apolunium-tilstand gengiver **L2 sydlig 9:2 NRHO** (L2 = det andet Jord–Måne-Lagrange-punkt; Gateway-banen) med periode ≈ 6.57 d / perilunium ≈ 3,250 km, i overensstemmelse med de offentliggjorte ≈ 6.56 d / ≈ 3,370 km (en CR3BP-løsning — cirkulær, uden Sol —, **ikke** valideret mod en rigtig LANS (Lunar Augmented Navigation Service)/Gateway-efemeride; den selenocentriske MCI/MCMF-transformation (månecentreret inertial / månecentreret, månefast) af den korrigerede bane er et opfølgende arbejde); plus cislunar PNT-geometri efter **LunaNet / LNIS** (LunaNet Interoperability Specification) (MCI↔MCMF-reduktion, selenografiske koordinater) med en **ARAIM-passage ved Månens sydpol**, der ærligt viser integritetshullet: en σ_URE (brugerafstandsfejl) på ~30 m driver beskyttelsesniveauet et godt stykke over en alarmgrænse på 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); og en **DOP-forstærkning med overfladefyr** (`src/lunar_beacon.rs`), der viser, hvordan nogle få opmålte afstandsfyr på overfladen leverer de sigtelinjerækker med lav elevation og bred azimut, som et sæt med kun baner lige over hovedet mangler — og dermed kollapser den dårligt konditionerede GDOP ved sydpolen og, via et fejlbudget med kvadratsum, den realiserede positionsnøjagtighed i meter (med genbrug af den gnss_lib_py-validerede DOP-kerne og synlighedens lukkede form for en luftløs horisont; analysen af præcisionsforringelse er beskrevet i [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Måne-PNT-pakke** | En navigationspakke for Måne/cislunar lagt oven på CR3BP-kernen, hver en kørbar `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — den sekulære rate LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = dens franske form, Temps-Coordonnée Lunaire) ud fra forskellen i egenpotential + kinetisk led, rapporteret med det offentliggjorte bånd på 56–59 µs/døgn); en geodætisk **måne-VLBI**-forsinkelsesobservabel (very-long-baseline interferometry) (`lunar-vlbi`, `src/lunar_vlbi.rs` — en nærfelts-forsinkelse + rate som to afstandsforskelle over en jordbasislinje, krydskontrolleret mod plan-bølge-Δ-DOR (delta differential one-way ranging) i samme kodebase i fjernfeltsgrænsen, partielle afledte verificeret med endelige differenser); en **fælles multiteknik-OD + ur**-batchestimator (`lunar-joint-od-clock`, `src/lunar_combination.rs` — en Gauss–Newton-tilpasning, der fusionerer VLBI + lokale måneafstande + afstande mellem satellitter) med et resultat om **Fisher-informationsobserverbarhed**: intern afstandsmåling alene efterlader en **datumdefekt** for et stift legeme med seks frihedsgrader, så en overfladestations *absolutte* position er uobserverbar, indtil en binding til Jordens system tilføjes — en **VLBI**-forsinkelse over en jordbasislinje *genopretter* observerbarheden for en sparsom konstellation og *skærper* Cramér–Rao-grænsen for en rig, hvor det absolutte datum lukker ved **tre** ikke-kollineære jordstationer (observerbarhedsresultatet beskrevet i [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realisering af referencesystem** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — en Helmert-datumtilpasning med 7 parametre + IAU 2015 WGCCRE-orienteringsbinding — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements); en analyse af **servicevolumen af Moonlight/LCNS-klassen** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / dækning / tilgængelighed + en generaliseret måne-ARAIM HPL/VPL-kurve (horisontalt/vertikalt beskyttelsesniveau), med genbrug af den gnss_lib_py-validerede DOP-kerne og LunaNet-maskineriet med σ_URE≈30 m); **differentiel måne-PNT** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — en måneanalog til differentiel GNSS / satellitbaseret forstærkningssystem (SBAS): eksakt udligning af fælles urfejl + første ordens rumlig dekorrelation mod basislinje, med genbrug af SBAS-beskyttelsesniveauet efter DO-229E — DO-229E er RTCA's (tidligere Radio Technical Commission for Aeronautics) standard for minimum operationel ydelse for SBAS-modtagere); og en **interoperabilitetseksport tilpasset LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — CCSDS-OEM (Orbit Ephemeris Message) + rundtur for månetidsskala i IAU 2015-månelegemesystemet, pakket i KIF-konvolutten). Evidensniveauer pr. del står i [verifikationsmatricen](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, den fælles OD + ur-estimator, realisering af referencesystem og servicevolumengeometrien er **VALIDATED** (hver mod den uafhængige reference, dens række nævner, ligesom VLBI-forsinkelsens kernevej); VLBI-observablen, datumdefektens observerbarhedsresultat, differentiel PNT og interoperabilitetseksporten er **MODELLED**. Parametrene er **illustrative værdier fra offentlige kilder** — **ikke** valideret mod rigtig VLBI-/Gateway-sporing, **ikke** tilknyttet eller godkendt af noget agentur, ingen påstand om TRL (teknologisk modenhedsniveau) / heritage. |
| **Dybt rum og Mars-PNT** | En åben **radiometrisk navigationsmotor**: iterativ lystid + **Shapiro**-relativistisk forsinkelse, to-/en-/trevejs **Doppler og afstand** (Moyer to-ben), kohærente transponder-vendeforhold, regenerativ/PN-afstandsmåling (pseudostøj) (CCSDS 414, standarden for pseudostøj-afstandsmåling) og **Δ-DOR** i himmelplanet (CCSDS 506, Delta-DOR-standarden), med solplasma-/tropo-/ionomedier; **CCSDS-TDM (503)**-parsing + udskrivning af sporingsdatameddelelser; et **reduceret-dynamisk Square-Root Information Filter** (RTN — radial, transversal, normal — empiriske accelerationer + et ur om bord med 3 tilstande + atmosfærisk modstand på Mars), der udfører **Mars-LMO-banebestemmelse til ≈ 0.2 m** i en syntetisk lukket sløjfe; en fælles **envejs + tovejs fusions**-estimator; en dynamikkerne for flere legemer (`Body{μ, re, zonals, gravity, IAU-pole}`, Mars GMM-3 (Goddard Mars Model 3) tyngdefelt, et IAU-legemefast Mars-system, en udskiftelig `EphemerisProvider`-søm, todelte julianske datoer + TT↔TDB (Barycentric Dynamical Time)); og **`mars-pnt`**-relæ-PNT-scenariet (en MARCONI-konstellation af areostationære relæer) med en **GSE-ydelsessimulator** fra ende til ende (GSE = jordstøtteudstyr) (geometri → linkbudget → observabler → SRIF → kovarians). **Simuleringsvalideret** (kovarians / kvalitetsmål i lukket sløjfe); den solcentrerede Mars-dynamik er krydskontrolleret mod JPL **DE440** (137 m ved en bue på 1 døgn, `xval/anise-mars-od`). Validering mod rigtige sporingsdata fra DSN/ESTRACK står på køreplanen. |
| **Solsystem og PNT omkring ethvert legeme** | En kernefri **efemeride for hele solsystemet** (`src/ephem.rs`, `src/ephem_provider.rs`): hver planet ud fra JPL's **Standish-Kepler-elementer** (Tabel 1, 1800–2050 e.Kr.; Tabel 2a/2b, 3000 f.Kr.–3000 e.Kr.) med hver planets offentliggjorte nominelle fejl, Jorden og Månen adskilt med måneserien, og Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan ud fra JPL's middelelementer og IAU-rotationsmodellen (International Astronomical Union); **ethvert legeme i forhold til ethvert andet** i ICRF (International Celestial Reference Frame). `Body` bærer nu **GM (gravitationsparameter), radier, J2 (den anden zonale harmoniske) hvor offentliggjort samt IAU-pol og nulmeridian for atten legemer**. Typen **`solar-system`** rapporterer positioner, hastigheder, konstanter, **lystid og en-/tovejsafstand** mellem to vilkårlige legemer (den eksisterende radiometriske lystidsløser, med Solens Shapiro-forsinkelse) og et banespor pr. legeme — nok til at tegne et interaktivt solsystem; typen **`body-pnt`** positionerer en orbiter eller en lander **omkring ethvert legeme** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) med en lokal Walker-konstellation, maskineriet for præcisionsforringelse og Gauss–Newton samt en dybrumsafstand fra Jorden. **Valideret** mod JPL Horizons (DE441, JPL Development Ephemeris 441): Merkur–Saturn og Jorden fra Tabel 1 inden for to gange den nominelle fejl (værst 1.87×), alle otte planeter fra Tabel 2a/2b (værst 1.71×) og lystiden Jorden–Mars/Jupiter. **Modelled**: Uranus og Neptun fra Tabel 1 (2.0× og 5.2× den angivne fejl mod DE441), Pluto, månerne og navigationsresultaterne fra `body-pnt`. |
| **Fusioneret MEO + LEO PNT** | `src/leo_fusion/`: systemuafhængig positionering, navigation og tidssynkronisering i LEO over enhver konstellation (Walker-skaller, elementsæt, GNSS-forvalg) og ethvert signal (bærebølge, chiprate, C/N0-kurve, afstandsfejl for signal-in-space), med valgfri forvalg i én fil, der bærer deres kilder (Xona Pulsar X1/X5, Iridium STL, Starlink-lejlighedssignaler, CentiSpace, et repræsentativt C-båndssystem, ATOMIC-efemeridemodellen uden ur). **`leo-pvt`**: batch-**Doppler-positionering** ud fra afstandsrate (en og flere satellitter, urdrift- og hastighedstilstande, geometri langs/på tværs af sporet for én passage og spejlløsningen), **fælles GNSS + LEO vægtede mindste kvadrater** med bias mellem systemer pr. system og sigmaer pr. signal angivet af kalderen, DOP mod antallet af LEO-satellitter, **polar og arktisk** dækning og **LEO-tidsoverførsel til UTC** mod C/N0 og oscillatoren. **`leo-ppp`**: et flydende PPP-EKF (precise point positioning; udvidet Kalman-filter) med kun GNSS og med LEO, dets konvergenstid og en chi-i-anden NEES-konsistenstest. **`ntn-positioning`**: positionering i 5G-ikke-terrestriske netværk ud fra båndbreddens Cramér-Rao-grænse. **Valideret**: LEO-Doppler-kurven mod de offentliggjorte Iridium- og Xona-tal. **Modelled**: resten, med PPP-tendensen sammenlignet med Li et al. (2019) — se [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integritet** | Øjebliksbillede- og løsningsadskillelses-RAIM (ARAIM-stil) — receiver autonomous integrity monitoring — med horisontale/vertikale beskyttelsesniveauer (HPL/VPL), fejldetektion og -udelukkelse samt Stanford-integritetsdiagrammer; et eksplicit beskyttelsesniveau med integritetsrisikobudget efter **multiple-hypothesis solution separation (MHSS)**, inklusive **konstellationsdækkende fejltilstand for to/flere konstellationer** (EU (Den Europæiske Union) ARAIM / DO-316, RTCA's ydelsesstandard for luftbåret GPS-udstyr med flybaseret forstærkning), afprøvet på et rigtigt GPS + Galileo-øjebliksbillede (`scenarios/araim-gps-galileo.toml`). Beskyttelsesniveauet anvender den ensidede **nominelle bias**-projektion `b_k = Σ_i|s_i|·b_nom` pr. fejltilstand og **integritets**-sigmaen σ_URA (brugerafstandsnøjagtighed; forskellig fra nøjagtigheden σ_URE, brugerafstandsfejl) fra Integrity Support Message — se [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Detektionskernen (χ²/ikke-central-χ²/normal-tærskler og K-multiplikatorer) er **eksternt valideret mod SciPy** over 171 tilfælde (`tests/raim_reference.rs`); geometrien genbruger den gnss_lib_py-validerede DOP-kerne. Selve ARAIM MHSS-*fordelingen af integritetsrisikobudgettet* har ingen offentliggjort numerisk reference og forbliver ærligt Modelled. |
| **Forstærkning (SBAS)** | **SBAS / WAAS-beskyttelsesniveauer** (WAAS = Wide Area Augmentation System) i DO-229E's form med vægtede mindste kvadrater (K-faktorer for præcisionsindflyvning og en route) og den **ionosfærefri L1/L5-tofrekvenskombination** (L1 og L5 er to civile GPS-signalbånd; IS-GPS-705, GPS-grænsefladespecifikationen for L5-signalet, γ₁₅ ≈ 1.793), der understøtter DO-316 — `src/sbas.rs`. Algoritmen for beskyttelsesniveau er **eksternt valideret mod RTKLIB SBAS-PL-forken** (RTKLIB = det åbne bibliotek til realtidskinematisk positionering; PL = beskyttelsesniveau) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — den forrige revision af DO-229 — App. J) kørt på **rigtige EGNOS-data** (European Geostationary Navigation Overlay Service) og gengiver dens HPL til < 2e-3 m (`tests/sbas_reference.rs`); gLAB (GNSS Laboratory-værktøjspakken) v6.0.0 bekræftede den identiske konvention. |
| **Ur og tidssynkronisering** | Kalman-holdover med to tilstande (kovarians på Joseph-form, NIS/NEES — normaliseret innovation i anden / normaliseret estimeringsfejl i anden — konsistenssundhed); stabilitet i Allan-familien (ADEV / MDEV / TDEV / HDEV / MTIE — Allan-, modificeret Allan-, tids- og Hadamard-afvigelse samt maksimal tidsintervalfejl) med konfidensintervaller specifikke for støjtype og en fuld **IEEE-1139-potenslovstilpasning med fem koefficienter** (IEEE Std 1139, Institute of Electrical and Electronics Engineers' definitioner for frekvens- og tidsmetrologi) — estimatorerne er valideret på rigtig hardware mod **Stable32**: en **rigtig 5071A cæsium-primærstandard mod en hydrogenmaser** (556,990 fasesamples, 16 midlingsfaktorer, OADEV/OHDEV — overlappende Allan-/Hadamard-afvigelse — til 1e-3; `tests/cs5071a_reference.rs`) og den **kanoniske Stable32 PHASE.DAT**-regressionsserie (139 midlingsfaktorer, OADEV/MDEV/TDEV til 1e-3; `tests/phasedat_reference.rs`); ADEV/MDEV/TDEV-estimatorerne og telekom-vandringsmålet **MTIE** er desuden krydskontrolleret mod det **uafhængige allantools 2024.06**-bibliotek til **< 1e-9** på NIST SP 1065-serien (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geometriske korrektioner (Sagnac, GNSS common-view); og de operationelle overførselsmetoder — **TWSTFT** (tovejs satellitbaseret tids- og frekvensoverførsel) med BIPM's (International Bureau of Weights and Measures) Sagnac-udtryk på lukket form, **GNSS common-view**, ionosfærefri **PPP**-tidsoverførsel (precise point positioning), en **optisk** fririmsforbindelse med turbulensscintillation og en **urensemble-tidsskala (papirtidsskala)** med invers varians under det bedste bidragende ur. En **beregner for ur-holdover uden GNSS** (`src/holdover.rs`) udstiller van-Loans vækst i glidefejl på lukket form som en *holdover-til-tærskel*-inversion — hvor længe et ur kører frit, før dets tidsfejl overskrider budgettet — over repræsentative klasser af klassiske ure og kvanteure; **modelleret** (krydskontrolleret mod flertrins-kovariansrekursionen i `clock_state`) og ærlig om, at for et meget stabilt ur bestemmes holdover til en stram tærskel af det *antagede* støjgulv ved lang tau, ikke den citerede ADEV. Et **betinget Timing Protection Level** (`src/tpl.rs`) udvider holdover til spoofing: en grænse for den *ikke-detekterede* tidsfejl, givet en uafhængig krydskontrol, der sammensætter et k-sigma-monitorgulv, van-Loans glidevarians over detektionsforsinkelsen og en CUSUM-tid til alarm (kumulativ sum). Kalibreret på en rigtig optaget spoofing (JammerTest 2024) og reproducerbar via `cargo run --example tpl_jammertest`; **MODELLED** sammensætning (intet budget for integritetsrisiko pr. time), betinget af detektion — der findes ingen endelig *ubetinget* grænse. |
| **GNSS-målingsdomæne** | Fremadrettet syntese af pseudoafstand / Doppler med **Klobuchar**- (udsendt) og **IONEX / TEC-gitter**-ionosfære (IONosphere map EXchange-format / samlet elektronindhold; målt) — inklusive en IONEX-filparser, tidsinterpolation mellem kort og tyndskals-skråhedsafbildningen — **Saastamoinen + Niell**-troposfære og øjebliksbillede-RAIM (HPL/VPL). |
| **Robusthed** | Linkbudget-**jamming** (J/S → effektiv C/N₀ → tab af låsning — jammer-til-signal-forhold, bærebølge-til-støjtæthedsforhold — med anti-jam-faktoren for spektral adskillelse `Q` nu **udledt af de faktiske effektspektre for signal og jammer** via `src/navsignal.rs` — `Q = 1/(R_c·κ)`, krydskontrolleret i CI mod den tidligere repræsentative konstant); en stokastisk **tidsspoofing-detektor** (Neyman–Pearson / χ²₁-energitest med P_fa/P_md på lukket form og ved Monte Carlo og et sikkerhedskvalitetsmål (FoM) på 1 − P_md); og en **spoofingdetektor i flere lag**, der fusionerer en RAIM-konsistens-paritetstest (med den fælles blinde vinkel modelleret ærligt), en RF-AGC-effektmonitor (automatisk forstærkningsregulering) og en signalkvalitetsmonitor (SQM — signalkvalitetsovervågning, early-minus-late); og et **fejlbudget for kvante-inertiel dødregning** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`), der sammensætter koldatom-interferometerets hvid-støj-hastigheds-random-walk med resterende bias (krydskontrolleret mod den uafhængige `AccelModel`-integrator) og skalafaktorfejl til et tal for positionsdrift over holdover — den inertielle tvilling til ur-holdover. En **rammeværkstilpasset robusthedsscoringsmotor** (`src/resilience/`) afbilder en arkitekturs simulerede adfærd til delscorer pr. dimension på tværs af Kshanas egne syv robusthedskategorier (ikke DHS-termer), tilpasset US Department of Homeland Security Resilient PNT Conformance Framework, og undersøger derefter **beslutningsstabiliteten** af enhver enkelt sammensat score eller modenhedsniveau under et Dirichlet-vægtsimpleks og et ensemble af fem trusler — Kendall-τ-rangustabilitet, hyppighed af skift af top-1-vinder og fælles **diversitetskollaps** (Hill-N2), med en integritetshashet sikringsrapport (35 håndudledte referencetests). Reproducerbar via `cargo run --example resilience_report`; **MODELLED** syntetiske arkitekturer, en selvvurdering tilpasset RPCF v2.0, **ikke** en certificering. Se [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Passiv RF-geolokalisering** | **TDOA/FDOA-geolokalisering af kilder** (tids-/frekvensforskel ved ankomst; `src/geolocation.rs`) — lokaliser en jammer eller spoofer (eller en lejlighedskilde til omvendt PNT) ud fra **tidsforskel ved ankomst**-hyperboloider på tværs af et modtagernetværk, løst med Gauss–Newton mindste kvadrater; at tilføje **frekvensforskel ved ankomst** med bevægelige modtagere genskaber samtidig kildens position *og* hastighed, med **Cramér–Rao**-grænsen for positionskovariansen udledt af netværksgeometrien. **MODELLED** (interne konsistensreferencer: rundture frem→invers, identiteten J·CRLB = I, GDOP-monotoni og at estimatoren opnår sin egen CRLB under Monte Carlo) — en punktkildemodel med fri sigtelinje, uden flervejs / NLOS (ikke-fri sigtelinje), modtagerurbias eller brydningsled. |
| **Navigationssignal og kodesporing** | **Signalniveauet** mellem linkbudgettet og målingsdomænet (`src/navsignal.rs`): **effektspektraltætheder** (PSD'er) med enhedsareal for **BPSK-R(n)** (binær faseskiftmodulation med rektangulære chips) og **sine-BOC(m,n)** (binary offset carrier); **koefficienten for spektral adskillelse** (SSC) κ = ∫ G_s·G_i df, som **udleder anti-jam-`Q`**, som jammingmodellen bruger (`Q = 1/(R_c·κ)`), ud fra de faktiske signal-/jammerspektre i stedet for en repræsentativ konstant; **RMS-båndbredden (Gabor)** (BOC > BPSK — målet for afstandsinformation / Cramér–Rao); **termisk støjjitter i kohærent early–late DLL-kodesporing** (DLL = delay-lock loop; Kaplan & Hegarty; ~under en meter for C/A — GPS' coarse/acquisition-kode — ved 45 dB-Hz); og **flervejsfejlkurven** (kohærent EML, early-minus-late — undertrykkelse med smal korrelator). Valideret mod ankre på lukket form (BPSK-selv-SSC = 2/(3·R_c), PSD'er med enhedsareal, C/A-jitter under en meter). Dette er analyse af signal**ydelse**, **ikke** hardwaredesign af antenne / RF-nyttelast (en nyttelastpartners rolle). |
| **Interoperabilitet** | Indlæsning af udsendte efemerider for flere GNSS fra **RINEX-3** (GPS, Galileo, QZSS — Japans Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — mellemhøj jordbane / skrå geosynkron bane — via IS-GPS-200, GPS-grænsefladespecifikationen; GLONASS, Ruslands Global Navigation Satellite System, via PZ-90 — det russiske datum Parametry Zemli 1990 — tilstandsvektor-RK4), anvendelig som konstellationskilde (RINEX ind, PNT-geometri ud); en **RINEX-3**-observationsparser (pseudoafstand, bærebølgefase, Doppler, signalstyrke; observationslayoutet 4.00 forventes at kunne parses, men er utestet, og RINEX 4-navigationsfiler afvises ved navn i stedet for at blive fejlafkodet), der nu **fodrer en enkeltpunktspositioneringsløser (SPP)** (`pvt`) — rigtige kodeobservationer ind, en rigtig **modtagerposition** ud, valideret på IGS-data; en **SP3-c/d**-læser/-skriver for præcise efemerider med Lagrange-interpolation af 9. orden; og **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message)-eksport til flydynamikværktøjer (GMAT, Orekit, STK — Systems Tool Kit); og **CCSDS-TDM (503)**-parsing + udskrivning af sporingsdatameddelelser til radiometrisk sporing i det dybe rum. |
| **Missionsanalyse (systemudvikling)** | Missionsdesignbudgetter af første orden, hver en kørbar type: tolegeme-**geometri for opsendelse og opstigning** (`launch-window` — opsendelsesazimut `sin Az = cos i/cos lat`, minimal inklination, bonus fra Jordens rotation, dogleg-planskifte-Δv, daglige muligheder; `src/launch.rs`); en **Allen–Eggers-korridor for ballistisk genindtræden** (`reentry` — maksimal deceleration, hastighed/højde ved maksimal g, hastighed ved maksimal opvarmning; `src/reentry.rs`); **dækningsgeometri for jordobservation** (`eo-coverage` — skår / nadir-GSD (jordsampleafstand) / adgang uden for nadir / genbesøg via SMAD-rumtrekanten (*Space Mission Analysis and Design*); `src/eo_payload.rs`); et **3-DOF-fejlbudget for attitude og pegning** (tre frihedsgrader; `attitude-budget` — værste tilfælde af tyngdegradientmoment + RSS-pegebudget (kvadratsum); `src/attitude_budget.rs`); **forudsigelse af passager over jordstationer** (`passes` — AOS/TCA/LOS, signalerhvervelse / tidspunkt for nærmeste tilnærmelse / signaltab, maksimal elevation, adgangstid; `src/passes.rs`); og et **envejs-linkbudget** over linkligningen i CCSDS 401 / DSN 810-005 (CCSDS' standard for radiofrekvens og modulation / Deep Space Networks håndbog for linkdesign; `link-budget` — FSPL (fririmstab), C/N₀, Eb/N₀ (energi pr. bit til støjtæthedsforhold), margin, lukning; `src/linkbudget.rs`). **MODELLED** analytiske budgetter af første orden — laget før hardware under STK/GMAT/Basilisk, ikke en erstatning for 6-DoF eller radiometri. |
| **Beslutningsanalyse og afvejning (MCDA)** | En fuld pakke til **multikriterie-beslutningsanalyse** (MCDA) (`src/mcda/`), der spænder over alle fire metodefamilier — værdiaggregering (**WSM**, **WPM**, **WASPAS** — weighted sum model, weighted product model, weighted aggregated sum product assessment), afstand til ideal (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), kompromisprogrammering (**VIKOR**, fra serbisk for multikriterieoptimering og kompromisløsning) og outranking (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, fra fransk for eliminering og valg, der udtrykker virkeligheden), plus forholdssystemet **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) og proportional **COPRAS** (Complex Proportional Assessment) — med **AHP** (Analytic Hierarchy Process) prioritetsvægtning ved parvise sammenligninger (Consistency Ratio), en **Pareto**-front af ikke-dominerede løsninger, vægt-**følsomheds**analyse og multiattribut-**nytte**scoring. De ni aggregatorer gengiver de uafhængige tredjepartsbiblioteker **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) og **pyDecision** (ELECTRE I, COPRAS) til **< 1e-9**, og AHP-prioritetsvektoren + Consistency Ratio stemmer overens med Saatys Random-Index-tabel og SciPy/LAPACK's principale egenværdiløser til < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — beslutningslaget under afvejningsstudiemotoren. |
| **Rummiljø** | En **miljømodel for rumvejr** (`space-weather`, `src/space_weather.rs`): sol- (F10.7 / centreret 81-døgns F10.7a — solens radiofluks ved 10.7 cm) og geomagnetiske (Kp, det planetariske K-indeks, med den definitoriske Kp↔ap-tabel — ap er dets lineære planetariske amplitude) aktivitetsindekser, den exosfæriske temperatur efter **Jacchia-1971**, som de driver (valideret mod offentliggjort solminimum/-middel/-maksimum), og den aktivitetskorrigerede mod den statiske termosfæriske neutrale tæthed i højden — solcyklussens tæthedsafhængighed, som den statiske USSA76-atmosfære (US Standard Atmosphere 1976) udelader. **MODELLED**: en kalibreret skalahøjdekobling af første orden, **ikke** en datavalideret atmosfære (NRLMSISE — US Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Exosphere-modellen). |
| **AI/ML-evaluering og afvejning** | Et **testmiljø til evaluering af detektion af RF-forringelser** (`impairment-eval`, `src/impairment_eval.rs`): et mærket, parameterforankret **syntetisk** korpus (nominel / jamming / tidsspoofing / positionsspoofing / flervejs), en detektoruafhængig **ROC/AUC**-ramme (receiver operating characteristic / arealet under kurven), der scorer enhver detektor (energy \| agc \| sqm \| parity \| fused) med Pd (detektionssandsynlighed) pr. klasse ved en mål-Pfa (sandsynlighed for falsk alarm), og **optimismegabet** inden for mod uden for fordelingen (tilstand med fordelingsskift). Plus en **kvante- mod klassisk PNT-afvejning** (`quantum-trade`, `src/quantum_trade.rs`), der kvantificerer et kandidaturs fordel i tids-/inertiel holdover ud fra en kurve med **målt ADEV** mod en klassisk baseline, med forbeholdet om gulvet ved lang τ båret på artefaktet og en kurve for robusthed mod tid uden GNSS. Evaluerings**målene** (AUC / forvekslingsmatrix / Pd-Pmd, hvor Pmd er sandsynligheden for misset detektion) er **valideret til eksakt overensstemmelse mod scikit-learn 1.9.0** — inklusive på **rigtig ESA OPS-SAT-telemetri** (OPSSAT-AD-datasættet til anomalidetektion, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), hvor Kshanas Mann–Whitney ROC AUC gengiver scikit-learns `roc_auc_score` til < 1e-9 på den tilbageholdte testopdeling, og en gennemsigtig topoptællingsdetektor adskiller de mærkede anomalier ved AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — og afvejningsmotorens numeriske **kerner** (ADEV NNLS — ikke-negative mindste kvadrater — tilpasning, χ²-konsistensbånd, van-Loan ur-Q) **mod scipy 1.17.1**; enhedsfordelstallene bygget ovenpå forbliver **MODELLED** driftskarakteristikker — aldrig felt-/IQ-data (in-phase/quadrature-samples), ingen god/dårlig-afgørelse. Med testmiljøet som grundlag scorer et dybere **studie af optimismegabet** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`) et panel på **13 detektorer** (energi/AGC/SQM/paritet plus seedede detektorer med logistisk regression og MLP med ét skjult lag — flerlags-perceptron), tilpasser **skaleringslove** inden for mod uden for fordelingen med en permutations-nulhypotese og lærer en **leave-one-out-forudsiger** af forringelse uden for fordelingen ud fra statistik inden for fordelingen (`cargo run --example optimism_study`). En **frontend til softwaredefineret modtager** (`src/sdr.rs` — rå IQ/IF (mellemfrekvens) → korrelatorens early/prompt/late-udtag → SQM) og **adaptere til indlæsning af rigtige data** (`src/realdata/` — RINEX, u-blox UBX (u-blox' binære protokol), GnssLogger, JammerTest, Yunnan, SatGrid) lader de samme detektorer køre over lokalt leverede optagelser (ingen datasæt er indcheckede). **Krydsningskortet for robusthed mellem kvante og klassisk** under parameterusikkerhed (`src/crossover.rs`; `cargo run --bin crossover_study`) genskaber de inertielle og urbaserede krydsningsstudier bag figurerne i Results. |
| **Demonstrator for kvanteaktiveret PNT** | Tre kørbare **MODELLED** anvendelsesområder bag den åbne motor, som hver udsender ærlig `TradeEvidence` + en optegnelse om repræsentativitet / huller til flyvning (`src/representativeness.rs`): **betroet kvantetidsoverførsel** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — et budget fra ende til ende for optisk gitterur + fotonisk forbindelse mod CSAC (atomur i chipstørrelse) + RF tovejs, med et genbrugt timing protection level, et sikkerheds-FoM mod forsinkelses-/genafspilningsangreb (1 − P_md) og detektion af uranomalier + CUSUM-forsinkelse); **kvantenavigation uden GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — en inertiel glidning med koldatom-interferometer mod et INS af navigationsklasse over et GNSS-udfald, ærlig om, at uden ekstern positionsbestemmelse er accelerometerets bias uobserverbar, så fejlen stadig vokser); og **fejl-/anomalidetektion** i kvantesystemer (`quantum-anomaly-detect`, `src/quantum_faults.rs` — et mærket fejlkatalog med en ROC AUC med bootstrap-CI (konfidensinterval) fra den eksternt validerede `eval_stats` og en mindste detekterbar fejl ved en fast rate for falsk alarm). Et fælles **bibliotek af fejlmodeller for kvanteenheder** (`src/quantum_devices.rs`) og en samlet **afvejningsramme for kvante mod klassisk** (`src/qtrade.rs`) understøtter dem. De validerede kerner, de bygger på (evalueringsmål mod scikit-learn, afvejningskerner mod scipy), genbruges; enhedsfordelstallene bygget ovenpå forbliver **MODELLED** — **illustrative enheds-/linkparametre fra offentlige kilder**, modellerer *klassen*, ingen TRL / flyvehistorik / certificering, ingen godkendelse fra agenturer. |
| **Frugal engineering og integritetspåvirkning** | En **ROI-linse for omkostning pr. dækning** (afkast af investering) (`src/frugal.rs`) — omkostning pr. enhed leveret dækning for en arkitekturafvejning — og en afbildning **misset detektion → integritetspåvirkning** (`src/integrity_impact.rs`), der omsætter en monitors rate for misset detektion til dens bidrag til integritetsrisikoen. **MODELLED** beslutningsstøttebudgetter, additive. |
| **Udveksling af artefakter** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — en versioneret, selvbeskrivende konvolut, der pakker et scenarieresultat med dets type, skemaversion og MODELLED/VALIDATED-betegnelser, så et gemt artefakt forbliver selvdokumenterende, og ældre konvolutter forbliver læsbare med fremadkompatibilitet. |

Hver funktion kan nås som en Rust-API, en kørbar scenarie-`kind` eller begge.
Modenhed pr. funktion — *validated*, *runnable* eller *library* — spores i
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). En **maskinkontrolleret verifikationsmatrix**
(`src/verification.rs`) gengiver krydsreferencen krav → modul → test → reference → status,
med enhedstestede ærlighedsinvarianter, der kun tillader betegnelsen *validated*,
hvor en uafhængig **ekstern** reference understøtter den — og som registrerer de
hardware-/PA-funktioner (produktsikring), som Kshana bevidst **ikke** leverer.

</details>

<details>
<summary>De fire sensorpakker, som de først blev offentliggjort (resultater)</summary>

### Resultater

Hvert scenarie sammenligner en kvantesensor med dens klassiske modstykke gennem et
GNSS-udfald på ~1.8 h. Tallene kan gengives (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Hvad kvantesensorer giver, når GNSS er væk, scenarie for ur-holdover: kvante holder 6600 s autonomi mod 2610 s klassisk, langt lavere tidsfejl og 100% mod 95.6% tilgængelighed" width="88%">
  <br><sub>Hvad kvantesensorer giver, når GNSS er væk — <code>clock-holdover</code> · seed 42 · tegnet med motoren 0.40.0, og hvert tal ovenfor genkontrolleres mod den aktuelle motor ved hvert byg af <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Fordelen **afhænger af udfald og vibration**, med et eksplicit break-even-punkt, hvor klassisk vinder — vist ærligt på tværs af stigen for teknologisk modenhed (tal for optiske ure er mål for demonstratorer på jorden; intet optisk strontiumur har fløjet):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Krydsning mellem kvante og klassisk for ur-holdover på tværs af stigen for teknologisk modenhed, med konfidensbånd" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Varmekort over den inertielle fordel for kvante mod klassisk over udfaldsvarighed og vibration, med en break-even-kontur, hvor klassisk vinder" width="96%">
  <br><sub>Krydsning af robusthed mellem kvante og klassisk — TRL-stige for ur-holdover (øverst) · kort over inertiel fordel med break-even-kontur (nederst). Kan genskabes via <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Inertiel dødregning: positionsfejl under et GNSS-udfald — kvantesensoren (koldatom) holder sig nær specifikationslinjen, mens sensoren af navigationsklasse divergerer til titusinder af kilometer" width="80%">
  <br><em>Positionsfejl ved dødregning under et GNSS-udfald: kvantesensoren (blå)
  forbliver flad nær specifikationen; den klassiske sensor (rød) divergerer til titusinder af kilometer.
  Genereret af Kshana ud fra <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Pakke | Scenarie | Kvante | Klassisk |
|------|----------|---------|-----------|
| **1 — Ur-holdover** | `clock-holdover.toml` (specifikation 20 ns) | optisk ur holder hele udfaldet | CSAC overskrider specifikationen midt i udfaldet |
| **2 — Inertiel dødregning** | `imu-deadreckoning.toml` (specifikation 100 m) | koldatom: **~41 m**, holder hele udfaldet | navigationsklasse: overskrider efter **~350 s** → titusinder af km |
| **3 — Tidsoverførsel** (optisk forbindelse mellem satellitter) | `timetransfer.toml` | optisk: **~0.3 mm** afstandsmåling | RF (TWSTFT): **~150 mm** afstandsmåling |
| **4 — Hybrid fusion** (afsluttende) | `hybrid-pnt.toml` | fuld position+tid for hele udfaldet | **positionsbegrænset ved ~350 s** |

Det afsluttende scenarie viser fusionstesen: optisk tidsoverførsel mellem satellitter holder selv
et klassisk *ur* låst og isolerer den *inertielle* sensor som det klassiske sæts
svage led — dvs. kvante-inertial + optisk tidssynkronisering sammen.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Ur-holdover: fasefejl under et GNSS-udfald — det optiske ur holder sig inden for specifikationen på 20 ns under hele udfaldet, mens uret i chipstørrelse overskrider den midt i udfaldet" width="80%">
  <br><em>Ur-holdover gennem et GNSS-udfald: det optiske ur (blå) holder sig inden for
  specifikationen på 20 ns under hele glidningen; uret i chipstørrelse (rød) overskrider den undervejs.
  Genereret af Kshana ud fra <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Et yderligere scenarie, `orbit-gnss-challenged.toml`, udleder GNSS-tilgængelighed ud fra
**banegeometri** i stedet for håndskrevne vinduer: et rumfartøj inden for GNSS-
skallen propageres mod en GPS-lignende Walker-konstellation, og antallet af synlige satellitter
(fri sigtelinje, jordokkultation, elevationsmaske) bestemmer positionsbestemmelsens tilstand ved hvert
trin. Over et døgn har brugeren kun positionsbestemmelse ~59% af tiden; kvanteuret holder en
tidsløsning på 5 ns gennem hvert hul (tilgængelighed **1.0**), uret i chipstørrelse
kun **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Bane med udfordret GNSS: urets tidsfejl over et døgn for et rumfartøj inden for GNSS-skallen, hvor dækningshullerne er udledt af banegeometrien — det optiske ur holder sig inden for specifikationen på 5 ns gennem hullerne, mens uret i chipstørrelse overskrider den" width="80%">
  <br><em>Tidsfejl over et døgn med GNSS-tilgængelighed udledt af banegeometri:
  antallet af synlige satellitter (fri sigtelinje, jordokkultation, elevationsmaske) bestemmer positions-
  bestemmelsens tilstand ved hvert trin, så uret må glide gennem hvert hul — det optiske ur holder specifikationen på 5 ns,
  mens uret i chipstørrelse overskrider den. Genereret af Kshana ud fra
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Konstellationen kan også angives som rigtige to-linje-elementsæt (TLE'er). En *fuld* TLE
(linje 1 + linje 2) propageres med den fulde **SGP4/SDP4**-model — inklusive
atmosfærisk modstand og de dybrums-måne-sol- og 12 h / 24 h-resonansled, der
har betydning for GNSS-baner på ~12 h — valideret mod de officielle AIAA 2006-6753-vektorer
til i værste fald ≈ 4 mm. `scenarios/orbit-sgp4-gps.toml` leverer et **rigtigt Celestrak
`gps-ops`-øjebliksbillede** af den operationelle GPS-konstellation (2021-07-28, 30 satellitter)
og kræver gyldige TLE-kontrolsummer — to-linje-elementsæt er åbne data fra kataloget hos US
Space Force / 18th Space Defense Squadron, videredistribueret af Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); opdatér med
`scripts/fetch_tles.sh`. En blok med kun linje 2 bevarer
den analytiske tolegeme-propagering (`scenarios/orbit-real-tle.toml`); de to former kan
blandes i én konstellation. En konstellation kan lige så vel bygges ud fra en blok af
**RINEX-3 GPS-udsendte efemeride**-poster — det format, en modtager afkoder —
propageret af brugeralgoritmen i IS-GPS-200 og ført gennem den samme geometri
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Hvad det er / ikke er, i fuld længde</summary>

<a id="what-it-is--is-not"></a>
### Hvad det er / ikke er

**Det er:** en deterministisk motor med få afhængigheder, der spænder over PNT-stakken — bane-
geometri, inertiel navigation, GNSS/INS-fusion, integritet, ure og tidssynkronisering. Den
kører et scenarie (ofte et GNSS-udfald), udvikler kalibrerede sensorfejlmodeller
gennem den passende estimator og scorer resultatet mod de operationelle
kvalitetsmål — og udskriver et reproducerbart JSON-resultat (JavaScript Object Notation) og et SVG-diagram, fra et
Rust-bibliotek, en kommandolinjegrænseflade (CLI), en Python-udvidelse, et WebAssembly-modul i browseren, en
**Model Context Protocol (MCP)-server** til AI-agenter eller et **JetBrains IDE-plugin (integreret
udviklingsmiljø)**.

**Det er ikke:** flyvehardware, et design af kvantenyttelast, en fuld GNSS-signal-
modtager, en radiofrekvens-signalsimulator (RF) eller hardware-in-the-loop-opstilling eller et
certificeret avionikprodukt — og det erstatter ikke MATLAB/Simulink, STK (Systems Tool
Kit) eller Orekit; det står ved siden af dem og udveksler filer med dem. Kvantehardwarens nøjagtighed kommer fra
offentliggjorte fejlmodeller, ikke fra dette værktøj. Den detaljerede modenhed for hver
funktion er dokumenteret i [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Det er (endnu) ikke:** en *fuld* fysikmotor for atominterferometri (de fleste kvantesensorer
bruger offentliggjorte Allan-/støjbudgetkoefficienter; CAI-accelerometeret (koldatom-interferometer) har et
lag ud fra grundprincipper — Mach–Zehnder-fase, projektionsstøj, kontrastforfald og
vibrationskobling, plus Coriolis- og lysskift-systematik — men bølgefrontsystematik og
opløsning af frynsetvetydighed forbliver et **P2**-lag (køreplanens fase 2, kvantefysiklaget)
på køreplanen, se [`ROADMAP.md`](ROADMAP.md) og [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
en certificeret GNSS-modtager eller en hardwaremodtager (den løser en enkeltpunkts-**PVT**-positionsbestemmelse (position, hastighed og tid)
ud fra rigtige RINEX-kodeobservationer (Receiver Independent Exchange Format) — valideret
på rigtige IGS-data (International GNSS Service) — og dens IQ-lag (`kshana iq`, siden 0.31.0)
erhverver og sporer optagede eller genererede basisbåndssamples i software, som en analyse-
modtager: den styrer ikke radiohardware og udsender ikke, er ikke en certificeret modtager og udfører
ingen bærebølgefasepositionering (RTK eller PPP)); eller en fuld pakke til missionsdesign (den har byggeklodser til Lambert / porkchop /
manøvrer / banebestemmelse, men er ydelsessimuleringslaget
*over* GMAT (General Mission Analysis Tool)/Orekit, ikke en erstatning). Denne afgrænsning er bevidst. Hvis du har brug for fejlbudgetter for koldatom-
interferometre ud fra grundprincipper (f.eks. af CARIOQA-PMP-klasse — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — eller validering i stil med X-37B), se
P2-køreplanen og [tag kontakt](#support--professional-services) for at samarbejde.

</details>

### Navigation i lav jordbane

Satellitter i lav jordbane (LEO) passerer hurtigt og med kraftigt signal. Typen `leo-pnt-chain` følger ét
system gennem hvert trin: signalet, passagen og dens forbindelse, navigationsmeddelelsen og
den fusionerede positionsbestemmelse for position, hastighed og tid (PVT) samt præcis punktpositionering (PPP). Hvert
trin giver sine tal videre til det næste. Se [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="LEO-PNT-kæden fra en rigtig kørsel af leo-pnt-chain (leo-pnt-end-to-end.toml): signaltrinnet (generic-l ved 1191.795 MHz, pilot sporet ved 10.23 Mchip/s) giver videre til passagetrinnet (1080 km, sporet C/N0-top 58.2 dB-Hz), som giver videre til navigationsmeddelelsen (kepler-rac, tilpasning over 300 s, repræsentations-SISRE 0.91 mm RMS, 0.250 m med banebestemmelse), som fodrer den fusionerede positionsbestemmelse (kun GNSS 1.60 m RMS 3D, GNSS plus LEO 0.43 m) og præcis punktpositionering (konvergens 11.5 min kun GNSS, 7.5 min med 240 LEO-satellitter). 11 værdier gives videre mellem trinnene." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Alle scenarietyper efter familie

Motorens scenarietyper, ordnet i familier. Hver familie har en side med ét afsnit pr. type (motorens
beskrivelse og felter, en eksempelkommando, hovedtal fra en kørsel, de rækker i
[verifikationsmatricen](docs/VERIFICATION-MATRIX.md), der nævner den, og det diagram, motoren selv skriver) og en
kontaktark over disse diagrammer; [`docs/KINDS.md`](docs/KINDS.md) indekserer dem alle. Tabellen skrives af
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) og siderne af
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py), og begge fejler, hvis motoren får en type, som ingen familie nævner.

<!-- generated:kind-families -->
| Familie | Hvad den besvarer | Typer | Kør én |
|---|---|---|---|
| **[Ure, tidssynkronisering og holdover](docs/kinds/clocks-timing-and-holdover.md)** | hvor længe et ur holder tiden uden GNSS, og hvordan et tidssynkroniseringssystem klarer sig mod sine masker | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Inertiale sensorer, fusion og kvantesensorer](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | dødregning og sensorfusion gennem et GNSS-udfald, med klassiske sensorer og kvantesensorer | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Alternativ PNT uden GPS](docs/kinds/gps-denied-alternative-pnt.md)** | navigation ud fra tyngdefelt, terræn og andre felter, når GNSS er væk | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstellationer, dækning og geometri](docs/kinds/constellations-coverage-and-geometry.md)** | hvor satellitterne er, hvem der ser dem, og hvor god geometrien er, omkring Jorden, Månen eller Mars | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[GNSS-målinger, positionering og integritet](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudoafstande, positionsbestemmelser, beskyttelsesniveauer og rummiljøet | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Jamming, spoofing og spektret](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | hvordan interferens når en modtager, og om den detekteres | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navigation i lav jordbane](docs/kinds/low-earth-orbit-navigation.md)** | en passage, en forbindelse, en navigationsmeddelelse og en fusioneret positionsbestemmelse, trin for trin | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Måne og cislunar](docs/kinds/lunar-and-cislunar.md)** | navigation, tid, referencesystemer og geodæsi ved Månen | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navigation for rumbrugere](docs/kinds/space-user-navigation.md)** | GNSS-signaler for rumfartøjer over, omkring og ud over GNSS-banerne | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optisk PNT](docs/kinds/optical-pnt.md)** | optiske forbindelser gennem atmosfæren og kvalitetsmål for optisk plus RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Missionsanalyse, forbindelser og rumoperationer](docs/kinds/mission-analysis-links-and-space-operations.md)** | opsendelse, opstigning, indtræden, attitude, forbindelser, kontaktplanlægning og filformater | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Missionstråde](docs/kinds/mission-threads.md)** | fejlbudgettet for navigation og tidssynkronisering i en kæde af faser fra opsendelse til indtræden | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampagner](docs/kinds/campaigns.md)** | kædede missioner, gennemløb og ensembler bygget ud fra de andre typer | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Alle kommandoer

`kshana <scenario.toml>` kører et scenarie; alle andre kommandoer er underkommandoer, og `kshana --help` udskriver brugen
af dem alle. Kommandoerne er `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (med `live` og
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` og `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) giver hver enkelts formål, et verificeret eksempel og dens dokumentationsside.

<a id="every-surface"></a>
### Alle flader

Én motor, de samme resultater overalt: kommandolinjen, Rust-biblioteket, Python, JavaScript og WebAssembly,
MCP-serveren med dens plugin-kommandoer og skills, Kshana Studio (hver side kører i browseren, ingen installation, intet uploades),
integrationerne til ROS 2, Signal K, OpenCPN, GNSS-SDR og `gnss_lib_py`, udrulningssættene til systemd, Docker og Grafana samt
JetBrains-pluginet. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) oplister dem med, hvordan man får hver enkelt, og navnene på alle
plugin-kommandoer, skills og Studio-sider; [`docs/SURFACES.md`](docs/SURFACES.md) angiver for hver kommando og type,
hvilken flade der bærer den, og hvilke der ikke gør, med begrundelsen.

<a id="how-a-run-works"></a>
## Sådan forløber en kørsel

Et scenarie er en TOML-fil (Tom's Obvious, Minimal Language): en type, et seed og
parametrene. Motoren kører det og skriver resultatet, et diagram og en rapport ved siden af, samt
de eksporter, du beder om.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Sådan forløber en kørsel. En scenarie-TOML-fil (en type, et seed og dens parametre) går ind i motoren, kshana 0.40.0, gennem api::run_toml-fordelingen over 92 scenarietyper, deterministisk ud fra scenarie, seed og motorversion. Motoren skriver result.json, chart.svg, report.html og report.json, en table.csv for de typer, der definerer en, og efter anmodning SP3-, CCSDS OMM- og OEM-, CZML-, KML-, GeoJSON-, STK- og SigMF-eksporter; en suite skriver study.json og study.html. Disse filer fodrer Kshana Studio i browseren, en AI-assistent gennem kshana-mcp-serveren og kontinuerlig integration." width="100%">
</picture>

Dette medfølgende scenarie kører 2 h: 10 min med GNSS, derefter omkring 1.8 h uden GNSS. Det spørger,
hvor længe et optisk strontium-gitterur og et atomur i chipstørrelse (CSAC) hver især holder
tiden inden for 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Det optiske ur holder budgettet på 20 ns under hele udfaldet på 6600 s; CSAC holder det i
2610 s og er inden for budgettet i 95.6% af kørslen mod 100% for det optiske ur.
`kshana example` oplister alle medfølgende scenarier.

<a id="missions"></a>
## Missioner

Ti sektorer stiller ti forskellige spørgsmål til den samme motor. Hver har medfølgende scenarier at
starte fra.

| Sektor | Start med |
|---|---|
| Forsvar og sikkerhed | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Rummet, jordbane | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Månen, Mars og det dybe rum | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Luftfart og droner | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Maritim | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Vej | `automotive-urban-canyon` |
| Jernbane | `rail-tunnel-coast` |
| Kritisk infrastruktur og tidssynkronisering | `clock-holdover`, `clock-ensemble` |
| Telekom og 5G (femte generation af mobilnet) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Videnskab og forskning | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Spørgsmålet, hver sektor stiller</summary>

<br>

| Sektor | Spørgsmålet, den stiller | Start med |
|---|---|---|
| **Forsvar og sikkerhed** | Hvor længe forbliver vores navigation og tidssynkronisering pålidelig under jamming og spoofing, og hvilke lag holder os inden for specifikationen? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Rummet: jordbane** | Ser mit rumfartøj nok navigationssatellitter, hvor længe holder dets ur tiden mellem positionsbestemmelser, og hvad ville et navigationslag i lav bane tilføje? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Månen og det dybe rum** | Vil en lander, rover eller orbiter ved Månen, ved Mars eller længere ude få en pålidelig position og tid? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Luftfart og droner** | Efter at en jammer har fjernet GNSS, hvor længe holder mit ubemandede luftfartøjssystem (UAS) sig inden for sit positionsbudget, og er integritet tilgængelig på min rute? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Maritim** | Hvor langt hen over vandet rækker en jammer, ville et positionsskub blive opdaget, og hvor længe kan et skib glide ind i havn? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Vej og bil** | Hvor langt driver en bil under en overkørsel eller forbi en jammer ved vejkanten? | `automotive-urban-canyon` |
| **Jernbane** | Hvor mange sekunder inde i en tunnel kan et tog stadig afgøre, hvilket spor det er på? | `rail-tunnel-coast` |
| **Kritisk infrastruktur og tidssynkronisering** | Hvis GNSS-tiden tabes eller spoofes, hvor længe holder et elnet, en handelsplads eller et datacenter sporbar tid? | `clock-holdover`, `clock-ensemble` |
| **Telekom og 5G** | Hvis GNSS-tidsreferencen tabes, holder mit netværksur sig så inden for ITU-T-maskerne, og hvor længe? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Videnskab og forskning** | Kan jeg gengive, udvide og citere et PNT-resultat, helt ned til seedet? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Evidens

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 kontrolleret mod alle 666 AIAA 2006-6753-referencevektorer, største positionsfejl 4.12 mm"></a></p>

<strong>176 af 401</strong> funktioner valideret mod uafhængige eksterne referencer; 221 ærligt mærket Modelled.
Hver række i verifikationsmatricen nævner en funktion, den reference, den kontrolleres mod,
den test, der kører kontrollen, og den betegnelse, der følger. Kontinuerlig integration (CI) gør
det umuligt at kalde en funktion VALIDATED uden en uafhængig ekstern reference.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Hvordan en funktion opnår sin betegnelse. Hver række i verifikationsmatricen nævner en funktion, den reference, den kontrolleres mod, den test, der kører kontrollen i kontinuerlig integration, og den betegnelse, der følger. En række kan kun være VALIDATED med en uafhængig ekstern reference; ellers er den MODELLED, eller PARTNER når en hardwarepartner ejer den. Eksempel: SGP4/SDP4, Cowell 6-DOF + forstyrrelser, batch/sekventiel OD, reference AIAA 2006-6753 SGP4-verifikationsvektorer, test tests/sgp4_verification.rs, betegnelse VALIDATED. Aktuelle antal: 176 VALIDATED, 221 MODELLED, 4 PARTNER af 401 rækker. I alt 176 funktioner valideret mod uafhængige eksterne referencer; 221 flere er ærligt mærket MODELLED og 4 ejes af en PARTNER." width="100%">
</picture>

| Betegnelse | Rækker | Betydning |
|---|---|---|
| VALIDATED | 176 | en uafhængig ekstern reference er enig: rigtige data, en uafhængig implementering eller offentliggjorte referencevektorer |
| MODELLED | 221 | kontrolleret mod analytisk sandhed eller simuleringens selvkonsistens, og det siges højt |
| PARTNER | 4 | ejes af en hardwarepartner; Kshana har ingen reference for den |

Nogle af kontrollerne: alle 666 AIAA-vektorer (American Institute of Aeronautics and Astronautics)
2006-6753 for SGP4 (Simplified General Perturbations 4) til 4.12 mm; Cowell-kraft-
modellen til 0.08 m mod Orekit 12.2; Galileo til 0.61 m og Swarm-A til 0.10 m mod rigtige
præcise efemerider fra Den Europæiske Rumorganisation (ESA). Tests holder linjedækningen nær 95 % af
`src/`, med en grænse på 85 % i CI. Registret er
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), genereret ud fra
`src/verification.rs`: den [fulde matrix med 401 rækker](docs/VERIFICATION-MATRIX.md), og hvorfor hver
Modelled-række ikke har nogen ekstern reference i [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Hvordan validering fungerer, den udvalgte oversigtstabel og evidensfigurerne</summary>

### Validering, reproducerbarhed og ærlighed

- Hvert støjled er kalibreret til et **offentliggjort, citeret** tal og valideret
  mod den standardrelation (Allan-afvigelse for ure; Groves' vækst i dødregnings-
  fejl for inertial; omregningen tid→afstand for tidsoverførsel). Status
  pr. led spores i [`docs/VALIDATION.md`](docs/VALIDATION.md) som `validated` eller
  `not modeled` — intet præsenteres som valideret, som ikke er det.
- **Reproducerbar i kraft af opbygningen:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` håndhæver det; kvante- og klassiske kørsler bruger
  uafhængige seeds, så deres støj er ukorreleret.
- Modenheden angives ærligt: tal for optiske ure og optiske forbindelser er *mål /
  resultater fra demonstratorer på jorden*, ikke fløjet.

### Evidensmærket på hver figur

Hver figur og tabel, en kørsel skriver, siger, hvor meget man kan stole på den, og hvilke registerrækker det hviler på. Resultat-JSON'en har en
`evidence`-nøgle, diagram-SVG'en en linje under plottet (og et `<metadata id="kshana-evidence">`-element), og CSV-tabellen
`# evidence:`-kommentarlinjer forrest (læs med `comment='#'`). Det nævner et niveau, `VALIDATED`, `MODELLED` eller `PARTNER`, og
id'erne (`VM-` og otte hex-cifre) for de rækker i verifikationsmatricen, som kørslen udøvede. Niveauet er den svageste af disse
rækker, så en kørsel, der hviler på én modelleret række, mærkes MODELLED, uanset hvor mange validerede rækker der står ved siden af; mærket
kan aldrig påstå mere, end registret gør. Rækker, statusser og id'er læses fra matricen, de tastes ikke ind
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)), og
`tests/evidence_labels_doc_sync.rs` fejler, hvis en figur ikke har noget mærke, eller et mærke er uenigt med matricen.

### Validering i overblik

Hver række håndhæves af en navngiven test i CI. Denne tabel er et **udvalgt overblik**;
den fulde maskinkontrollerede matrix er **401 rækker — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), med den fuldstændige evidens (og hvad der ærligt *ikke* endnu er
valideret) i [`docs/VALIDATION.md`](docs/VALIDATION.md) og artefaktet
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases) for hver udgivelse
(genereret af `cargo run --bin validation_report`, SLSA-attesteret — Supply-chain
Levels for Software Artifacts).

Kolonnen **Status** angiver evidensens *art*, i overensstemmelse med valideringsstigen ovenfor: **VALIDATED** = kontrolleret mod en uafhængig ekstern reference (rigtige data, et uafhængigt bibliotek eller offentliggjorte referencevektorer); **MODELLED** = kontrolleret mod analytisk sandhed eller simuleringens selvkonsistens (intet uafhængigt eksternt datasæt). VALIDATED beskriver kontrollens *metode*, ikke bestået/ikke bestået — en ærlig forfejlelse mod en rigtig ekstern reference forbliver VALIDATED, mens en sammenligning, som ingen matrixrække nævner som reference (LRO-tilpasningen — Lunar Reconnaissance Orbiter — ovenfor), vises som MODELLED. `CI`-rækker er procesværn, ikke kvalitetsmål. Nogle få øer med rigtige data (det målte cæsiumur, Stable32 PHASE.DAT og OPS-SAT/ICGEM-kontrollerne, hvor de rå input ikke har nogen licens til videredistribution) er **databetingede**: testen udskriver en meddelelse om at springe over og forbliver grøn, når inputtet mangler, og de offentlige referencetal er indcheckede under `tests/fixtures/`. Genskab de rå input med den tilsvarende `scripts/fetch_*.sh`.

| Status | Funktion | Overensstemmelse | Reference |
|--------|------------|-----------|--------------------|
| **VALIDATED** | SGP4/SDP4-propagering | 666/666 vektorer, værst **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + direkte sammenligning mod den uafhængige `sgp4`-crate |
| **VALIDATED** | Referencesystemer — IAU 2000A/B-nutation, IAU 2006/2000A CIO-kæde, ERA | **bit for bit** (X,Y til 1e-14, s til 1e-18, ERA til 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS mod en uafhængig SPICE-motor | maks. **0.028″** → ≤ 0.86 m på jorden, ≤ 3.6 m i GNSS-bane | ANISE (ren Rust NAIF/SPICE), samme IERS `finals2000A` EOP, 8 epoker 2020–2023 (sammenlignet mod denne reference; ingen række i verifikationsmatricen nævner den som ekstern reference, så den er ikke mærket VALIDATED) |
| **MODELLED** | EGM2008-geopotential (grad/orden 70) | acceleration = ∇V til **< 1e-6**; zonal reduktion til valideret J2 | NGA EGM2008-koefficienter + analytisk ∇V-identitet |
| **VALIDATED** | Syntese af tyngdefunktionaler (kort til tyngdestøttet / GNSS-fri navigation) | GRS80 Somigliana + γ_e/γ_p til **3.5e-12**; rigtigt EGM2008-forstyrrelseskort fysisk (RMS ≈ 26 mGal, g/o 70) | GRS80 (Moritz 1980, IAG — International Association of Geodesy) Somigliana-normaltyngde + rigtig ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allan-estimatorer (ADEV/MDEV/TDEV/HDEV) + konfidensbånd | gengiver referenceafvigelser; χ²-bånd stemmer overens | NIST SP 1065 (Riley), 1000-punkts Tabel 31/32 |
| **VALIDATED** | Allan-estimatorer på et **rigtigt målt cæsiumur** | OADEV/OHDEV til **1e-3** (observeret ≤ 3e-5), 16 midlingsfaktorer | Stable32 på et rigtigt 5071A Cs mod H-maser, 556,990 punkter (`tests/cs5071a_reference.rs`, databetinget) |
| **VALIDATED** | Allan-estimatorer på den **kanoniske Stable32 PHASE.DAT** | OADEV/MDEV/TDEV til **1e-3** (observeret ≤ 5e-5), 139 midlingsfaktorer | Stable32-referenceafvigelser for PHASE.DAT (`tests/phasedat_reference.rs`, databetinget) |
| **MODELLED** | IMU-fejlmodel — ARW / VRW / biasinstabilitet | genskabt til **< 5 %** (biasinstabilitet < 15 %) | Analog Devices ADIS16465-datablad; NaveGo-referenceprofil |
| **VALIDATED** | Numerisk Cowell-propagator + kraftmodel (konservative niveauer) | største positionsfejl **0.08 m** over 24 h, 278 epoker (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Cowells modstandsniveau + absolutte input for Sol/Måne-efemeride og tæthed | modstandsniveau karakteriseret ≈ 333 m / 24 h; uforstyrret stemmer med Kepler med universelle variable under en meter, energi/impulsmoment ~1e-9 | indbygget efemeride med lav præcision + analytisk Kepler |
| **MODELLED** | Lambert · Tsiolkovsky · porkchop | rundtur til tolegemesandhed; ΔV **< 0.01 %** | Izzo 2015 · raketligningen · analytisk Hohmann-nedre grænse |
| **MODELLED** | Banebestemmelse (Gauss–Newton-batch) | under en meter / mm·s⁻¹ uden støj; ~2 m ved et støjgulv på 5 m | tolegeme + J2 over en RK4-bue |
| **MODELLED** | Kraftmodeltilpasning mod Galileos præcise efemeride (hel bue) | **0.61 m** 3-D RMS, 24 h, g/o-70, kun kræfter | ESA/ESOC `ESA0MGNFIN` endelig bane (E11), rigtig `finals2000A` EOP (sammenlignet mod denne reference; ingen række i verifikationsmatricen nævner den som ekstern reference, så den er ikke mærket VALIDATED) |
| **MODELLED** | Kraftmodeltilpasning mod Swarm-A's præcise efemeride (reduceret-dynamisk) | **0.10 m** 3-D RMS (grænse for det empiriske niveau, ikke et mål) | ESA `SW_OPER_SP3ACOM_2_` præcis bane (sammenlignet mod denne reference; ingen række i verifikationsmatricen nævner den som ekstern reference, så den er ikke mærket VALIDATED) |
| **MODELLED** | Kraftmodeltilpasning mod LRO ved Månen (ærlig forfejlelse) | **6.67 m** reduceret-dynamisk, *over* målet på 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (sammenlignet mod denne reference; ingen række i verifikationsmatricen nævner den som ekstern reference, så den er ikke mærket VALIDATED) |
| **MODELLED** | Mars-OD i det dybe rum (reduceret-dynamisk SRIF) | **≈ 0.2 m** Mars-LMO (simulerings-FoM, *ikke* rigtig mission) | syntetisk OD i lukket sløjfe — validering af estimatormaskineriet |
| **MODELLED** | Solcentreret Mars-dynamik mod JPL DE440 | **137 m ved en bue på 1 døgn** (vokser med buen = umodelleret n-legeme) | JPL DE440 via ANISE (`xval/anise-mars-od`, kernebetinget) (sammenlignet mod denne reference; ingen række i verifikationsmatricen nævner den som ekstern reference, så den er ikke mærket VALIDATED) |
| **VALIDATED** | Enkeltpunktspositionering mod en opmålt IGS-koordinat (rigtige observationer) | **5.7 m** 3-D RMS / **1.1 m** horisontalt, ionosfærefri tofrekvens-kode-SPP | IGS-stationen ABMF's opmåling + GPS-udsendt efemeride, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Tæt koblet GNSS/INS-UKF | **0.77 m RMS** over en 30-min LEO-passage inkl. et udfald på 120 s | kraftmodelglidning, håndudledt |
| **MODELLED** | Tyngdekortnavigation uden GPS | ~70 km INS-drift → **~145 m** genskabt | ESA NAVISP *Quantum Wayfarer*-mål |
| **MODELLED** | Terrænrefereret navigation (TERCOM/SITAN) | 70 km drift → **< 500 m** (gitteropløsningsgulv ~140 m) | SRTM `.hgt` DEM; håndindført drift (ikke-cirkulær kontrol) |
| **MODELLED** | IGRF-14-hovedfelt (grad/orden 13) | pol ~80.7°N, dipol ~29.7 µT, fysisk bånd 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidt-seminormaliseret) |
| **MODELLED** | Navigationssignalmodulation og kodesporing | BPSK-selv-SSC = **2/(3·R_c)**; PSD'er med enhedsareal; C/A DLL-jitter **under en meter** ved 45 dB-Hz | SSC/PSD-ankre på lukket form + Kaplan & Hegartys DLL-formel for termisk støj |
| **MODELLED** | CR3BP-differentialkorrektor for halo/NRHO | STM = endelige differenser; banen lukker til **maskinpræcision**; L2 9:2 NRHO **≈ 6.57 d / perilunium ≈ 3,250 km** | STM-kontrol med endelige differenser + offentliggjort L2 sydlig 9:2 NRHO (≈ 6.56 d / ≈ 3,370 km) — CR3BP, ikke en rigtig Gateway-efemeride |
| **MODELLED** | ARAIM-integritet med to konstellationer | konstellationsdækkende fejltilstand på rigtig GPS + Galileo | EU ARAIM TR (teknisk rapport) / DO-316; Celestrak `gps-ops` 2021-07-28 (sammenlignet mod denne reference; ingen række i verifikationsmatricen nævner den som ekstern reference, så den er ikke mærket VALIDATED) |
| **VALIDATED** | GNSS-geometri / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | overensstemmelse til **1e-6 relativt** over 8 geometrier (velkonditioneret → næsten singulær) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — uafhængigt bibliotek (`tests/dop_reference.rs`) |
| **VALIDATED** | ML-mål for detektorevaluering (AUC/ROC/forvekslingsmatrix/Pd-Pmd/præcision/F1) | **eksakte tællinger + < 1e-9** over 5 datasæt × 24 tærskler | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — uafhængigt bibliotek (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC for anomalidetektion på **rigtig ESA OPS-SAT-telemetri** | AUC gengiver scikit-learn til **< 1e-9**; topoptællingsdetektorens AUC **≈ 0.85** på den mærkede testopdeling | scikit-learn `roc_auc_score` på OPSSAT-AD-testopdelingen (Ruszczak et al. 2025, CC BY 4.0) — rigtig OPS-SAT-telemetri (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Numeriske kerner til kvanteafvejning (ADEV NNLS-tilpasning · χ²-konsistensbånd · van-Loan ur-Q) | NNLS + Q **eksakt**; χ² **< 5e-4** ved driftsfrihedsgrader ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | MTIE / MDEV / TDEV-telekomvandringsmål (ITU-T G.810/G.823/G.8261/G.811 — anbefalinger fra International Telecommunication Unions Telecommunication Standardization Sector) | MTIE (9 midlingsfaktorer, bit-eksakt) og MDEV + TDEV (8 faktorer, **< 1e-9** relativt) på NIST SP 1065 LCG-serien (lineær kongruensgenerator) | allantools 2024.06 `mtie` / `mdev` / `tdev` — uafhængigt bibliotek (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | MCDA-metoder til afvejningsstudier — alle fire beslutningsfamilier, ni eksternt validerede aggregatorer (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) plus **AHP**-prioritetsvægtning ved parvise sammenligninger | scorer / rangordninger / konkordansmatricer gengivet til **< 1e-9** | pymcdm + pyDecision (uafhængige MCDA-biblioteker fra tredjeparter) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | LEO-Doppler-kurve ud fra bane og bærebølge | Iridiums maksimum inden for **5 %** af de offentliggjorte ±36 kHz; Xona Pulsar X1 inden for de offentliggjorte **32–34 kHz** | RNTF's testresultater for LEO PNT; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | PPP-konvergens med LEO-forstærkning | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min med 60 / 96 / 192 / 288 LEO-satellitter, monoton; filterets NEES inden for χ²-båndet | tendens sammenlignet med Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); konstellationer og støj ikke gengivet |
| **MODELLED** | Betinget Timing Protection Level (holdover-begrænset ikke-detekteret tidsfejl under spoofing) | sammensætningen gengiver flertrins-kovariansrekursionen i `clock_state`; kalibreret på en rigtig optaget spoofing | JammerTest 2024 (Zenodo 15911589)-skalarer + van-Loan / CUSUM på lukket form (`examples/tpl_jammertest`) |
| **MODELLED** | Scoring af PNT-robusthed + beslutningsustabilitet | 35 håndudledte referencetests; byte-deterministisk studieartefakt (fast seed) | DHS RPCF v2.0-afbildning + Dirichlet / Kendall-τ / Hill-N2 på lukket form — syntetiske arkitekturer, ikke en certificering |
| **MODELLED** | Studie af optimismegabet for RF-forringelser (skaleringslove + leave-one-out-forudsiger) | signifikans mod permutations-nulhypotese; byte-deterministisk artefakt (5 seeds) | syntetisk parameterforankret korpus — evaluerings*målene* er VALIDATED mod scikit-learn (ovenfor); studiet er MODELLED |
| CI | Reproducerbarhed på tværs af platforme | bit-identiske input + formguldstandarder på 3 OS'er (styresystemer) | CI-matrix for Linux / macOS / Windows, SHA-256-guldstandarder |
| CI | Testdækning | **~95 % linjer** på `src/` eksklusive `src/*_data.rs` og `src/main.rs`, med grænse ≥ 85 % | cargo-tarpaulin (LLVM-motor) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Hvordan en funktion opnår sin betegnelse: Krav afbildes til et modul i src, til en test i tests, til en ekstern reference (rigtigt datasæt, uafhængig referenceimplementering eller offentliggjorte vektorer), til en status — med et værn håndhævet af CI om, at ingen funktion kan være Validated uden en ekstern reference. Aktuelle antal: 176 Validated, 221 Modelled, 4 Partner, 401 i alt" width="900">
  <br><sub>Hvordan en funktion opnår sin betegnelse — invarianten håndhævet af CI: ingen ekstern reference ⇒ kan ikke være Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Hvordan hver påstand understøttes: Validated-kolonnen er 176 af 176 ExternalDataset i kraft af opbygningen (håndhævet af CI); Modelled-rækker er ærligt mærket InternalConsistency, ReferenceImpl eller ExternalDataset; Partner-rækker har ingen Kshana-reference" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Største positionsfejl for SGP4/SDP4 mod AIAA 2006-6753-referencen efter regime, logaritmisk skala: hvert regime ligger langt under AIAA-tolerancen, værste tilfælde 4.12 mm i det ikke-resonante dybrumsregime" width="96%">
  <br><sub>Øverst: hver Validated-række understøttes af et eksternt datasæt i kraft af opbygningen. Nederst: SGP4 stemmer overens med den officielle reference i hvert regime (værst 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Verifikationsstatus over alle 401 funktioner: 176 Validated (kontrolleret mod ekstern reference), 221 Modelled, 4 ejet af en Partner" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Funktionsdomæner

Hver funktion på det offentlige kort, efter domæne, med sin registerbetegnelse. Domænetabellen skrives af
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) ud fra `web/capabilities.json`, den samme fil, som
Studios kort over alt læser.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Kshanas funktioner efter domæne og modenhed: validerede og modellerede offentlige funktioner pr. domæne, tegnet ud fra web/capabilities.json af tools/gen_validation_figures.py" width="900">
</picture>

Den fulde tabel, domæne for domæne med hver funktion og dens betegnelse, er [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Installation

Én linje giver kommandolinjeværktøjet: **`cargo install kshana`**. Hver kanal leverer
v0.40.0 fra det samme taggede commit.

<!-- channels:begin -->
| Kanal | Installation | Vejledning |
|---|---|---|
| Prøv i browseren | åbn https://kshana.dev | [Studio-vejledning](https://kshana.dev/docs/studio.html) |
| Kommandolinje (Rust) | `cargo install kshana` | [Brug af kommandolinjen](https://kshana.dev/docs/rust.html#usage--cli) |
| Rust-bibliotek | `cargo add kshana` | [API-reference på docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Vejledning til Python-API](https://kshana.dev/docs/python-api.html) |
| JavaScript og WebAssembly | `npm install kshana` | [Vejledning til npm og WebAssembly](https://kshana.dev/docs/npm.html) |
| AI-assistent (MCP-server, cargo) | `cargo install kshana-mcp` | [Vejledning til MCP-server](https://kshana.dev/docs/mcp.html) |
| Docker-image | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Vejledning til MCP-server: Docker](https://kshana.dev/docs/mcp.html#install) |
| Claude Desktop-udvidelse | dobbeltklik på `.mcpb` for dit system: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (ét klik) | [Tilføj til Cursor (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Tilføj til Cursor (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (ét klik) | [Installér i VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Installér i VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Forudbygget binærfil | download kshana-mcp-<target> fra udgivelsen og kontrollér den mod SHA256SUMS | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Officielt MCP-register | søg efter io.github.ashfordeOU/kshana-mcp | [Alle MCP-installationsuddrag](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Fjern (streamable HTTP), selvhostet | `kshana-mcp --http 127.0.0.1:8080` | [Vejledning til selvhosting](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Claude Code-plugin-markedsplads | `/plugin marketplace add ashfordeOU/kshana` | [Brug af Kshana fra en agent](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| JetBrains IDE-plugin | Settings → Plugins → Marketplace → søg efter "Kshana" (plugin-ID dev.kshana.ide) | [Plugin-vejledning](https://kshana.dev/docs/jetbrains.html) |
| Signal K-plugin | `npm install signalk-kshana-trust` | [Vejledning til Signal K-plugin](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| OpenCPN-plugin | download plugin-tarballen fra udgivelsen | [Indsendelse til OpenCPN-kataloget](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Grafana-dashboard | importér kshana-grafana-*.json fra udgivelsen | [Dashboardets kilde](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Image til referenceopbygning | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Maritime integrationer](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana på JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Bygger med Rust 1.88 eller nyere, rust-version i Cargo.toml"></a></p>

MCP er Model Context Protocol. Fastlås en udgivelse med `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` eller `npm install kshana@0.40.0`. For at bygge fra kildekode, se
[Installation og bygning](#install--build) under Reference.

<details>
<summary>Kør et scenarie fra Python og fra WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Ud over `run` udstiller modulet `run_full` (JSON, SVG og resuméet på én linje på én gang),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` og `error_kind`; se
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

npm-pakken er hele motoren kompileret til WebAssembly. I Node.js giver du binærfilen til
`initSync`; i en browser henter `await init()` den (se [`README.npm.md`](README.npm.md)).

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
## Arkitektur

Én åben motor står i centrum, og hver flade kører den: kommandolinjen, Rust-
biblioteket, Python, WebAssembly og Kshana Studio, MCP-serveren, Docker-imaget og
JetBrains-pluginet. Den samme scenariefil giver de samme bytes på hver af dem. Kshana Pro ligger
ovenpå som et separat lag, der afhænger af motoren og aldrig forgrener den.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Kshanas arkitektur: én åben motor i centrum, kshana 0.40.0 under AGPL-3.0, med api::run_toml, en typet fordeling over hver type, og verifikationsregistret med 401 funktioner (176 VALIDATED, 221 MODELLED, 4 PARTNER). Omkring den kører hver flade den samme motor: Kommandolinje (cargo install kshana); Rust-bibliotek (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); MCP-server (cargo install kshana-mcp); Docker-image (ghcr.io/ashfordeou/kshana-mcp); JetBrains-plugin (Marketplace: &quot;Kshana&quot;). Under den Kshana Pro, et proprietært lag, der afhænger af den åbne motor som et bibliotek og aldrig forgrener den, og som ikke tilføjer nogen fysisk model." width="100%">
</picture>

<details>
<summary>Inde i motoren: domænelagene og verifikationsregistret</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Kshanas arkitektur i lag. Fem indgange (kommandolinje, Python, JavaScript og WebAssembly, MCP-serveren og JetBrains-pluginet) når én api::run_toml, en typet fordeling over 92 typer. Under den ligger otte domænelag: tid og referencesystemer, ure og tidssynkronisering, inertial og fusion, GNSS og integritet, astrodynamik, LEO PNT, Måne, Mars og det dybe rum samt missioner og studier, på en fælles kerne, alle krydsrefereret af verifikationsmodulet, den maskinkontrollerede matrix med 401 funktioner, som er den eneste sandhedskilde for hver betegnelse." width="100%">
</picture>

**Én motor, mange indgange.** En enkelt Rust-kerne (`kshana`) kører hvert scenarie,
nået gennem en CLI, en Python-udvidelse, et WebAssembly-modul i browseren, en **MCP-
server** til AI-agenter og et **JetBrains IDE-plugin** — som alle samles i én
`api::run_toml`-fordeling. Indeni tilsluttes sensorpakkerne en fælles fejlmodel-
grænseflade; ved siden af dem ligger et **referencesystemlag** (IAU 2006/2000A
præcession–nutation og den CIO-baserede GCRS↔ITRS-reduktion), et **astrodynamisk/numerisk
lag** (analytisk SGP4/SDP4 **og** en numerisk Cowell-propagator med dens
EGM2008-/forstyrrelseskraftmodel, manøvredesign og banebestemmelse), et
**integritets-/GNSS-lag** (RAIM/ARAIM, SBAS, målingsdomænet, jamming, cislunar),
et **fusions-/alt-PNT-lag** (GNSS/INS-estimatorerne og tyngde-/terræn-/magnetkort-
matcherne), et **lag for det dybe rum og Månen** (radiometrisk Mars-PNT og
måne-PNT-pakken, dens evidensniveau pr. del i matricen — LTC-tid, VLBI, fælles OD+ur, realisering af referencesystem, servicevolumen,
differentiel PNT, interop), et **missionsanalyselag** (budgetter for opsendelse / genindtræden / dækning /
pegning / passage / forbindelse og rumvejrsmiljøet) og det åbne
**studielag for robusthed og AI/ML** (RPCF-robusthedsscoring, optimismegabet for RF-forringelser
og demonstratoren for kvanteaktiveret PNT), hvis reproducerbare artefakter bygger på de
validerede kerner.

To selvstændige crates, **udeladt af workspacet**, står ved siden af kernen — `mcp/kshana-mcp`
(MCP-serveren, bygget på `rmcp`-SDK'et i edition 2024) og `xval/anise-frames` (krydskontrollen
af ANISE/SPICE-referencesystemer, som trækker MPL-2.0-afhængigheder (Mozilla Public License 2.0) ind) — holdt uden for den udgivne
crates afhængighedsgraf, `Cargo.lock`, licensværn og MSRV-bygning (mindste understøttede Rust-version) af rodens
`Cargo.toml` `exclude`-liste. JetBrains-pluginet (`ide/jetbrains`) er et separat Kotlin-
projekt. Se [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) for det fulde sæt diagrammer.

De gengivne diagrammer (motorens flow, modulkort, distribution) står i [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagrammer

Diagrammerne er Mermaid-kilder i [`docs/diagrams/`](docs/diagrams/), gengivet til SVG og PNG i
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` på Linux, de to andre
`render-diagram`-scripts andre steder), og en optegnelse binder hver PNG til den nøjagtige SVG, den kom fra. Tests fastlåser de
antal, de angiver. Diagrammerne i afsnittene ovenfor er tegnet af værktøjer ud fra motorkørsler; disse viser, hvordan
delene passer sammen.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Systemet: seks indgange (kommandolinje, Python, WebAssembly og npm med Kshana Studio, MCP-server med plugins og skills, JetBrains-plugin, integrationer) kalder alle én fordeling over hver scenarietype, som kører én motor af fælles kerne, sensorpakker og referencesystemer samt domænemodeller, og skriver et reproducerbart resultat og diagram" width="900"><br>
  <sub>Én fordeling, én motor, reproducerbart output · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · kilde <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Fladerne: én deterministisk offline-motor fodrer kommandolinjen, Rust-biblioteket, Python, WebAssembly og npm samt MCP-serveren; Studio kører på WebAssembly-bygget, plugin-kommandoer og skills på MCP-serveren, integrationer og udrulningssæt på kommandolinjen og JetBrains-pluginet på biblioteket" width="900"><br>
  <sub>Hver flade, fra den samme motor · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · kilde <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Inde i én kørsel: en scenariefil med sit seed og sin GNSS-tidslinje fodrer motoren, som for hvert tidstrin udvikler fejlmodellen, kører estimatoren og scorer kvalitetsmålene og skriver et reproducerbart resultat og diagram" width="900"><br>
  <sub>Den indre sløjfe i en kørsel · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · kilde <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Modtagertillid: en modtagerlog eller -strøm indlæses i observabler pr. epoke og modtagerens egne flag, passerer monitorerne og bliver til en vejledende tillidsscore med et bånd og begrundelser, som fodrer Studio, telemetri, en signeret bevispakke, Jammertest- og bench-scoring og compliance-rapporten" width="900"><br>
  <sub>Fra en modtagerlog til en tillidsscore og det, der bruger den · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · kilde <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Laboratoriets rundtur: et scenarie eksporteres med sine hændelser og testbetingelser, en operatør uden for Kshana afspiller en fil gennem en laboratoriesimulator, modtagerloggen scores mod de angivne hændelser, og evidensrundturen forbinder hashene for scenarie, betingelser og log samt scoren i en signeret pakke" width="420"><br>
  <sub>Fra scenarie til signeret pakke; Kshana producerer eller afspiller aldrig et signal · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · kilde <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: browseren kører motoren kompileret til WebAssembly lokalt, uden at noget uploades, tager medfølgende scenarier eller et scenarie eller en log, du åbner, og viser resultatet i den enkle visning, den avancerede visning og opgavesiderne, med eksporter gemt af brugeren" width="900"><br>
  <sub>Hvordan Studio kører, lokalt · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · kilde <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Test- og udgivelsesflowet: lokale værn (formatering, clippy, kontrollen for ingen tilskrivning, skralden for dokumentationsdækning og scripts/gate.sh, som kører hele suiten og gentagne kørsler og skriver den kvittering, pre-push-hooken kontrollerer) fører til en pull request kun med CI og en grøn fuld CI; ejeren spoler main frem til det grønne commit, og et annoteret tag lander på det efter kontrollen af versionssynkronisering; udgivelsesworkflowet verificerer hele suiten på det taggede commit, før noget udgives, bygger binærfilerne med en SBOM, kontrolsummer og byggeproveniens, udgiver til crates.io, PyPI, npm, containerregistret, MCP-registret og JetBrains Marketplace, poller hvert register, indtil det leverer den nye version, og sender websitebygget afsted fra tagget; en separat vej kun for websitet sender pages-workflowet afsted med tagget main og afvises, medmindre intet uden for web/ og .github/ er ændret siden seneste udgivelse" width="900"><br>
  <sub>Test- og udgivelsesflow, fra lokale værn til en verificeret udgivelse og vejen kun for websitet · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · kilde <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Modulkortet: kommandolinjen, Python, WebAssembly, MCP-serveren og JetBrains-pluginet kalder den typede fordeling over hver type, som når den fælles kerne, tid og referencesystemer, sensorpakker, astrodynamik, integritet, spoofingdetektion, fusion, det dybe rum og Månen, robusthed samt dommer- og benchmarkmodulerne, alt understøttet af verifikationsmatricen" width="1000"><br>
  <sub>Hvor koden bor · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · kilde <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distribution: ét repository leverer kerne-crate, MCP-server, IDE-plugin og krydskontrol-crates til crates.io, PyPI, npm, GitHub Releases, Pages-legepladsen, containerregistret, MCP-registret og JetBrains Marketplace, med et Zenodo-arkiv" width="900"><br>
  <sub>Hvad der leveres hvorhen, og hvad der kontrollerer det · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · kilde <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI-assistent

[`kshana-mcp`](mcp/kshana-mcp/) er en MCP-server: din assistent kører den faktiske motor og
læser dens JSON tilbage i stedet for at gætte på matematikken. Hvert af dens 49 værktøjer er en tynd indpakning
om en offentlig funktion i `kshana`-biblioteket, så ingen simuleringslogik bor i serveren.

### Installér MCP-serveren

> Vejledende, ikke typegodkendt navigationsudstyr: operatøren er fortsat ansvarlig for navigationen.
> Serveren kører på din computer; intet sendes til Ashforde OÜ.

Vælg en hvilken som helst kanal. Hvert link og uddrag genereres af ét script
(`scripts/gen_mcp_install.py`) og kontrolleres i kontinuerlig integration; uddrag til Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI og Continue står i
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanal | Kommando eller knap | Kræver | Fastlåst form |
|---|---|---|---|
| Claude Desktop-udvidelse | dobbeltklik på `.mcpb` for dit system: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | intet | `kshana-mcp-<target>.mcpb` af v0.40.0 |
| Cursor (ét klik) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node eller Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (ét klik) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node eller Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · plugin: `/plugin marketplace add ashfordeOU/kshana` og derefter `/plugin install kshana@ashforde` | Node (eller Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ med uv eller pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formel for v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` og derefter `scoop install kshana-mcp` | Scoop (Windows) | manifest for v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Forudbygget binærfil | [udgivelsessiden](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, kontrolleret med `SHA256SUMS` og `gh attestation verify` | intet | v0.40.0 |
| MCP-register | `io.github.ashfordeOU/kshana-mcp` (findes af registerbevidste klienter) | en registerbevidst klient | `0.40.0` |
| Fjern (streamable HTTP) | `kshana-mcp --http 127.0.0.1:8080`, selvhostet: se [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | din egen vært | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp på Glama, kvalitetsscoren for dens MCP-server"></a></p>

I Claude Code kommer den samme server som et plugin: `/plugin marketplace add ashfordeOU/kshana`, derefter
`/plugin install kshana@ashforde`. Pluginet tilføjer skråstregskommandoer oven på værktøjerne: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` og `/kshana-jammertest`. Værktøjerne til fartøjstillid fodrer Signal K- og
OpenCPN-integrationerne: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Opsætning pr. klient står i [`docs/integrations.md`](docs/integrations.md). Serveren er opført
i det officielle MCP-register som `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>De 49 værktøjer</summary>

<br>

**Scenarier og rapporter**

| Værktøj | Hvad det gør |
|---|---|
| `run_scenario` | Kør et scenarie ud fra en TOML-definition (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | De 92 indbyggede scenarietyper med beskrivelser + påkrævede/valgfri felter — så agenten kan opbygge et gyldigt scenarie |
| `validate_scenario` | Forudgående kontrol: parse TOML'en og afgør dens type, uden at køre |
| `list_example_scenarios` | De medfølgende referencescenarier som JSON |
| `get_example_scenario` | TOML-teksten for ét medfølgende referencescenarie, byte for byte filen under `scenarios/` |
| `report_scenario` | Kør et scenarie og returnér dets rapport |
| `animate_scenario` | Kør et scenarie og returnér dets tidsserie som en animation |
| `sky_geometry` | Himmelgeometri under en azimutafhængig horisontprofil: de synlige og skjulte satellitter, DOP, øst-nord-op-kovariansen og den horisontale fejlellipse; eller et forvalg af horisontprofil med dets proveniens |

**Eksport og interoperabilitet**

| Værktøj | Hvad det gør |
|---|---|
| `list_export_formats` | Hvilke interoperabilitetsformater der gælder for et scenarie (`czml`, `kml`, `geojson`, `stk`, `sigmf`), begrundelsen når ét ikke gør, og den specifikation, hver skriver følger |
| `export_interop` | Eksportér et scenarie som CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeride (Systems Tool Kit) `.e` eller SigMF (Signal Metadata  |
| `import_route` | Skriv en GeoJSON-`LineString`-rute ind i et scenarie, der flyver et waypoint-spor (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`), og returnér den nye TOML |
| `export_sp3` | Eksportér et `orbit`-scenaries konstellation som SP3-c-præcis efemeride (Standard Product 3, revision c) |
| `export_omm` | Eksportér et `orbit`-scenaries elementer som et CCSDS-katalog (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) |
| `export_oem` | Eksportér et `orbit`-scenaries tilstandsserie som CCSDS OEM-efemeride (Orbit Ephemeris Message) 2.0 — TEME-positionen (sand ækvator, middel-jævndøgn) *og*  |
| `export_table_csv` | Kør et scenarie og returnér dets reproducerbarhedstabel som CSV (kommaseparerede værdier) — den bytestabile tabel, som CLI'en (kommandolinjegrænsefladen) skriver som `<scenario>.table.csv` |
| `export_test_bench` | Et scenaries køretøjsbevægelse og hændelser til en GNSS-laboratoriesimulator (`kshana bench-export`) |

**Modtager- og fartøjstillid**

| Værktøj | Hvad det gør |
|---|---|
| `assess_receiver_log` | Vurdér tilliden til en rigtig GNSS-modtagerlog (globalt navigationssatellitsystem) |
| `assess_vessel_stream` | Scor et afgrænset NMEA 0183-uddrag (højst 2 MiB og 20,000 epoker |
| `assess_vessel_log` | Et fartøjs NMEA 0183-log (højst 4 MiB) som en batchkørsel, med session-TOML'en, der angiver fartøjets grænser |
| `create_evidence_pack` | En signeret bevispakke for et vindue af et fartøjs log (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Bind et RFC 3161-tidsstempeltoken (base64 af `.tsr`-bytes) til en pakke, i hukommelsen (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Verificér en pakke (`kshana evidence verify`) |
| `generate_training_nmea` | Syntetisk bro-NMEA 0183 til træning af besætningen ud fra en `nmea-scenario`-TOML (jamming, positionsforskydning, tidsspoofing, genafspilningsforsinkelse) med instruktørloggen (`kshana-nmea-training/1`) |
| `build_interference_map` | Et GNSS-interferenskort ud fra ADS-B- eller AIS-positionsrapporter som CSV-tekst (højst 4 MiB) |
| `route_exposure` | Andelen af en rutes længde i forringede, ikke-forringede, ikke-vurderede og ikke-observerede celler på et eller flere interferenskort, eventuelt inden for et datointerval |
| `trust_telemetry` | En tillidsstrøm (JSON-linjer) eller et `receiver-trust`-resultat gengivet som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP JSON-nyttelast, med `kshana trust-telemetry`-koderne |
| `jammertest_import` | Læs det offentliggjorte Jammertest-testkatalog og sendeplanen (NPRA/jammertest-plan, MIT) som planlagt sandhed (`kshana jammertest import`): ét testområdes tidsrum bliver til receiver-trust-hændelser med katalog-id og år i hver betegnelse. Planlagte tidsrum, ikke optagede sendetider; intet kontaktfelt i planen læses. MODELLED. Se [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Scor en modtagerlog mod den plan (`kshana jammertest score`): pr. test detektionsforsinkelsen, missede alarmer og tid til genopretning, samt de falske alarmer uden for alle tidsrum. Tekstlogs som `log`, binære (`ubx`, `sbf`) som `log_base64`. En signeret pakke kræver en nøgle: kommandolinje. Kun vejledende; MODELLED. |
| `fit_imu_log` | Accelerometer- og gyroparametre for `hybrid`- og `fusion`-scenarierne tilpasset ud fra en stationær IMU-log (CSV eller EuRoC) ved Allan-afvigelse, med en `[accel_classical]`-tabel klar til indsættelse og loggens SHA-256 (`kshana imu-fit`). Tekst ind, JSON ud; MODELLED. |

**GNSS IQ (filer i arbejdsmappen; slået fra i HTTP-tilstand)**

| Værktøj | Hvad det gør |
|---|---|
| `iq_signals` | GNSS IQ-lagets opsætning |
| `iq_info` | Beskriv én IQ-optagelse (in-phase og quadrature) i arbejdsmappen uden at behandle den |
| `iq_scene` | Generér en GNSS IQ-scene med flere satellitter i arbejdsmappen (`kshana iq scene`) |
| `iq_acquire` | FFT-erhvervelse (hurtig Fourier-transformation) af en eller flere PRN'er (pseudotilfældige støjkoder) over en optagelse (`kshana iq acquire`), eventuelt efter frontend-trin |
| `iq_track` | Erhverv og spor derefter med DLL/PLL/FLL-banken (forsinkelses-, fase- og frekvenslåst sløjfe) (`kshana iq track`), med sløjferne fra en `kshana.loop-desig |
| `iq_frontend` | Anvend modtagerens frontend- og interferensdæmpnings-DSP (digital signalbehandling |
| `iq_sweep` | Afspil én IQ-optagelse i arbejdsmappen igen på tværs af flere design af sporingssløjfer (`kshana iq sweep`) |
| `iq_monitor` | Kør monitorerne til detektion af interferens og spoofing over en IQ-optagelse i arbejdsmappen (`kshana iq monitor`) |
| `iq_labfit` | Tilpas sporingssløjfens model for tab af låsning til laboratoriekørsler (`kshana iq labfit`) ud fra et `iq-labfit`-scenarie, hvis logs er indlejrede (`text` eller `base64` |
| `iq_test_conditions` | Validér en `kshana.test-conditions/1`-fil givet som tekst og returnér de opløste betingelser med deres hash |
| `iq_campaign` | Kør en kampagne med laboratoriegenafspilning (`kshana iq campaign`) |
| `iq_campaign_status` | Fremdriften for en kampagnes outputmappe |

**Compliance-kortlægning**

| Værktøj | Hvad det gør |
|---|---|
| `compliance_report` | Kortlægningen til offentlige rammeværker udfyldt ud fra resultatdokumenter givet som tekst (`kshana compliance-report`) |
| `compliance_mapping` | De statiske kortlægningstabeller (eller, med `sources`, de kildedokumenter, de citerer, med versioner og URL'er) som Markdown, indledt af den samme erklæring |
| `list_standards_packs` | Standardpakkerne (`kshana standards-pack list`): scorede scenariesæt for testprofilerne i DHS' rammeværk for robust PNT, IMO MSC.1/Circ.1575 og ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Én pakke kørt mod tærskler angivet før kørslen: hver test `MET`, `NOT MET` eller `NEEDS INPUT`; MODELLED, bedømmer intet produkt |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal kontrolleret mod LNIS V5 AD1 Volume A (LSIS-AFS V1.0): koderne mod de trykte tabeller eller en symbolstrøm mod rammeformatet; LDPC og CRC-24Q i delrammerne 2 til 4 verificeres ikke |
| `create_round_trip_pack` | Den signerede pakke for laboratoriets rundtur: scenarie, `kshana.test-conditions/1`-dokument, modtagerlog og score forbundet med hash |

**Benchmark**

| Værktøj | Hvad det gør |
|---|---|
| `score_benchmark` | En kshana-bench-indsendelse scoret mod en sandhedsfil, begge som JSON-tekst (`kshana bench score`, `bench/SPEC.md`): resultatfilen med specifikationsversion, opdeling, inputhashes og opgavens mål. MODELLED; beskriver en log eller et korpus, aldrig et produkt. |
| `render_leaderboard` | kshana-bench-resultatfiler gengivet som den statiske ranglisteside (HTML-tekst), hver valideret først. |

</details>

<a id="editions"></a>
## Udgaver

Hele motoren er gratis. Kshana Pro og skræddersyede studier er til programmer, der har brug for mere,
og hver betalt vej starter med en besked: der er ingen priser her.

| | Free | Kshana Pro | Skræddersyet studie |
|---|---|---|---|
| Hvad det er | hele den åbne motor, alle 92 scenarietyper, ingen funktionsspærre | et proprietært lag oven på den samme motor, under kontrakt | et MODELLED studie af PNT-robusthed for dit system, udført for dig |
| Licens | AGPL-3.0 (GNU Affero General Public License, version 3) eller en kommerciel licens | proprietær | kontrakt |
| Sådan kommer du i gang | [installér](#install) eller åbn [kshana.dev](https://kshana.dev) | [anmod om en Pro-evaluering](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [anmod om et studie](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Hvad Pro er, med ordene fra [`docs/PRO.md`](docs/PRO.md):

> **En streng overmængde af åben Kshana.** Pro afhænger af den åbne motor som et bibliotek og
> forgrener den aldrig. Hver åben scenarietype kører uændret i Pro, og et åbent scenarie kører
> i Pro helt uden licens.
>
> **Ingen ny fysik.** Pro tilføjer ingen fysisk model og ændrer ingen. Hvert Pro-tal kommer
> fra kørsler af den åbne motor, så et Pro-tal er lige så troværdigt som den åbne scenarietype,
> det kom fra, og aldrig mere.

Pro besvarer et programs næste spørgsmål: hvilket design der skal flyves (en designoptimering og dens
Pareto-front), hvor sikkert svaret er (usikkerhed og følsomhed), og om missionen
opfylder sine krav (et missionsdossier, sporbarhed af krav, afvejningsstudier, en
regressionskontrol af scenarier, digitale tvillinger af ure, et studiedossier og en lokal
tjeneste). Den overvåger også en kampagne af tal og får en pipeline til at fejle, når ét bliver dårligere,
tester kandidatsignalplaner mod de åbne satellitnavigationssignaler i begge
retninger (spektral sameksistens) og sætter studier i kø i en lokal jobtjeneste med et
hashkædet leveringsregister. Hver er beskrevet, med hvad den producerer, og hvad den ikke gør, i
[`docs/PRO.md`](docs/PRO.md). Intet, Pro producerer, er en certificering, og et skræddersyet studie er
heller ikke en certificering.

<details>
<summary>Hvad Kshana Pro læser fra den åbne motor, og support fra Ashforde® OÜ</summary>

<br>

**Hvad Kshana Pro bygger på.** Hver del af Pro arbejder ud fra den åbne motor og lader
den være uændret:

- **Designoptimeringen, usikkerhedsstudiet og missionsdossieret** kører scenarier i den åbne
  motor gennem motorens offentlige grænseflade og beregner hvert tal ud fra kørslernes
  resultater. Hvert output bevarer det VALIDATED-, MODELLED- eller PARTNER-niveau, som den åbne motor gav
  hvert tal, aldrig et højere.
- **Digitale tvillinger af ure** bruger den åbne motors urmodel og dens Allan-afvigelses-
  estimator: en tvilling kalibreres til enhedens offentliggjorte Allan-budget og kontrolleres derefter ved
  at estimere tvillingens Allan-afvigelse med den åbne estimator.
- **Afvejningsstudier** kører hver arkitekturmulighed som et scenarie i den åbne motor, uændret,
  og rangordner mulighederne efter et kvalitetsmål læst fra hver kørsels resultat.
- **Kampagneovervågning** læser sine tal fra resultaterne af kørsler i den åbne motor af
  scenarierne i en pakke og sammenligner dem med den forrige beståede kørsel.
- **Spektral sameksistens** læser hvert fysisk tal fra kørsler i den åbne motor af typerne
  `leo-signal` og `constellation-design` og tilføjer kun summen over de synlige
  satellitter og rangordningen af planerne.
- **Den lokale jobtjeneste** kører åbne scenarier og Pro-scenarier gennem den samme motor og
  gemmer hvert resultat, som kørslen returnerede det.
- **Bevispakker** registrerer for hver kørsel den scenariehash, som den åbne motor stempler på
  sit resultat, så et tal i en pakke kan gengives ved at køre dets scenarie igen.
- **Systemudviklings- og programværktøjer.** Kshana Pros værktøjer til modelbaseret
  systemudvikling (MBSE) og programmer kontrollerer et programs krav
  mod kørsler af den åbne motor: de importerer krav som kommaseparerede værdier
  (CSV) eller som en dokumenteret delmængde af Requirements Interchange Format (ReqIF) eller af
  tekst i Systems Modeling Language version 2 (SysML v2), evaluerer hvert accept-
  kriterium, med dets enhed, mod de værdier, en kørsel skrev, og producerer en verifikations-
  krydsreferencematrix (VCRM), en SysML v2-model, en rapport om ændringspåvirkning og en offline-
  bevispakke. De kører intet igen og genberegner intet og læser kun det, den åbne motor
  offentliggør: hver kørsels `result.json` (de felter, et kriterium nævner, deres enheder,
  reproducerbarhedsstemplet med scenariehash, seed, motorversion og skemaversion samt
  kørslens betegnelse og tallenes niveauer), dens `report.json` (type, reproducerbarhedsoptegnelse og
  funktionsbetegnelser), scenariefilen (dens hash, type, seed og parametre),
  feltenhedsskemaet (hvert felts enhed, proveniens og evidensniveau) og
  verifikationsmatricen (hver funktions VALIDATED-, MODELLED- eller PARTNER-betegnelse).

<a id="support--professional-services"></a>
### Support og professionelle tjenester

Kshana er gratis og open source under AGPL-3.0 og **professionelt udviklet og
vedligeholdt af Ashforde® OÜ** (Estland). Den åbne motor er komplet og brugbar i sig
selv. Til organisationer, der har brug for mere, tilbyder Ashforde® OÜ:

- **Kommerciel support og integration** — indlejring af Kshana i din værktøjskæde, skræddersyede
  scenarier og prioriterede rettelser.
- **Skræddersyede sensormodeller** — kalibreret til din hardware, inklusive eksportfølsomme
  robusthedsmodeller vedligeholdt i et privat lag.
- **Kshana Pro** — proprietære værktøjer til modelbaseret systemudvikling (MBSE) og programmer,
  der kontrollerer et programs krav mod kørsler af den åbne motor og
  producerer en verifikationskrydsreferencematrix (VCRM), en model i Systems Modeling Language
  version 2 (SysML v2), en rapport om ændringspåvirkning og en offline-bevispakke. De
  kører intet igen og læser kun motorens offentliggjorte output: hver kørsels `result.json`
  og `report.json`, scenariefilen, feltenhedsskemaet og verifikations-
  matricens betegnelser (den fulde liste står under [Udgaver](#editions)).
- **Kshana Pros værktøjer til design, usikkerhed og missioner** — Pareto-fronten for et design-
  rum, usikkerhed og følsomhed over tusindvis af kørsler og et missionsdossier med én kommando
  med en verifikationsmatrix og en PDF; se [`docs/PRO.md`](docs/PRO.md).
- **Kshana Pros kampagneovervågning, spektrale sameksistens og jobtjeneste** — en pipeline, der
  fejler, når et overvåget tal bliver dårligere, signalplaner testet mod de åbne
  satellitnavigationssignaler i begge retninger og en lokal jobkø med et
  hashkædet leveringsregister; se [`docs/PRO.md`](docs/PRO.md).
- **Træning og rådgivning** i ydelsesanalyse af kvante-/klassisk PNT.

Dette er open core-modellen: motoren er, og forbliver, åbent licenseret; den bærende
forretning er ekspertise, support og de proprietære udvidelser — ikke licensgebyrer.
Kontakt **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Forskning

Studier bygget på den åbne motor offentliggøres på arXiv. Hvert nævner den motorkommando,
der ligger bag, så dets tal kan genskabes ud fra et indchecket scenarie eller studieeksempel.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Forskning bygget på den åbne motor: seks artikler på arXiv, hvert kort med artiklens navn, dens dato og kategori samt den motorkommando, der genskaber dens tal. De samme seks artikler, med links og kommandoer, står i tabellen nedenfor." width="100%">
</picture>

| Artikel | Hvad den viser | Motorkommando |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | Faldet i en GNSS-interferensdetektors score, når forholdene skifter, kan forudsiges alene ud fra statistik inden for fordelingen, på et åbent syntetisk testmiljø og derefter på åbne feltoptagelser. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | En GNSS-tidsmodtager under spoofing har ingen endelig ubetinget grænse for ikke-detekteret tidsfejl, så artiklen giver en betinget, kalibreret på en optaget spoofing via luften fra den offentlige JammerTest 2024-kampagne. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | En enkelt sammensat robusthedsscore er kun et stabilt grundlag for en beslutning, hvor ét design dominerer; hvor design konkurrerer, kan omvægtning alene ændre vinderen. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Afstandsmåling inden for en månekonstellation efterlader en overfladestations absolutte position uobserverbar; en VLBI-forsinkelse (very-long-baseline interferometry) fra Jorden genopretter den, når konstellationen er sparsom, og skærper den, når den er rig. | typen `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Planlagte konstellationer på fire til seks satellitter giver dårlig geometri ved Månens sydpol, og nogle få afstandsfyr på overfladen afhjælper det langt billigere end flere satellitter. | typen `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Præcisionsforringelse er udefineret for cislunar sporing med kun afstand, fordi hastigheden er uobserverbar i et øjebliksbillede, så artiklen bruger observerbarheds-Gramian'en på fire plane fjerne retrograde baner: kun afstand har rang 2 af 4 i et øjebliksbillede og kræver en bue på omkring 2.09 h for at blive fuldt observerbar, med konditionering, der forbedres, efterhånden som buen forlænges; afstandsrate (Doppler) giver rang 4 med det samme; og samtidig estimering af en station med satellittilstande og ure forbliver rangdefekt med én, medmindre en ekstern interferometrisk observabel tilføjes. Krav hører hjemme i budgetter for buelængde, konditionering og målingstype, ikke DOP. | typen `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (dens søskende `cislunar-arc-recovery` tester tærsklen med en uafhængig estimator med endelige differenser) |

De tre studieeksempler skriver byte-deterministiske artefakter (faste seeds), der registrerer deres
motorversion, seeds og en konfigurationshash. De tre artikler om Måne og cislunar er bygget på
månepakken (hver dels evidensniveau står i verifikationsmatricen); deres påstande om geometri og præcisionsforringelse er også krydskontrolleret
mod separate referencer i `tests/validate_p*.rs`. Mere i
[Reproducerbare studieartefakter](#reproducible-study-artifacts) under Reference.

<a id="cite"></a>
## Citér

Hvis du bruger Kshana i akademisk eller teknisk arbejde, så citér venligst den version, du brugte, med
scenariet og seedet. [`CITATION.cff`](CITATION.cff) indeholder de maskinlæsbare metadata, og
GitHub viser en "Cite this repository"-knap ud fra den. Hver udgivelse arkiveres på Zenodo;
koncept-DOI'en (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) peger altid på den
seneste version.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Artiklerne ovenfor:

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
## Licens

Kshana har dobbelt licens: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)) eller en
**kommerciel licens** fra Ashforde® OÜ til lukket integration, som AGPL ikke passer til.
[`LICENSING.md`](LICENSING.md) forklarer, hvilken der gælder. Bidrag licenseres indgående
under AGPL og giver også Ashforde® OÜ ret til at medtage dem i den kommercielle
udgave; underskriv hvert commit med `git commit -s` (se [`CONTRIBUTING.md`](CONTRIBUTING.md)).
"Kshana" og dets mærker er varemærker tilhørende Ashforde® OÜ: licensen dækker koden, ikke
navnet, så omdøb venligst forks.

<a id="reference"></a>
## Reference

Det lange materiale, sammenfoldet. Hvert dokument er oplistet under [Dokumentation](#documentation).

<details>
<summary>Installation og bygning fra kildekode</summary>

<a id="install--build"></a>
### Installation og bygning

Kræver en Rust-værktøjskæde (≥ 1.88, `rust-version` i Cargo.toml; udviklet på 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Brug: kommandolinjen i fuld længde</summary>

### Brug

Kør et hvilket som helst scenarie; CLI'en fordeler efter scenariets `kind`-felt og skriver
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` og
`<scenario>.report.json` ved siden af det — plus `<scenario>.table.csv` for de typer, der
offentliggør en tabel. Rapporten (en HTML-side (HyperText Markup Language) og et JSON-dokument
med det samme indhold) indeholder et ledelsesresumé, hvert input med sin enhed,
resultaterne og diagrammerne, en kampagnes gennemløbs-, Monte Carlo- eller kædetabeller, en hændelsestidslinje,
VALIDATED- / MODELLED- / PARTNER-betegnelsen og kilden for hver funktion, kørslen brugte,
hvad der ikke er modelleret, og en reproducerbarhedsoptegnelse (motorversion, Secure Hash
Algorithm 256-bit-digests (SHA-256), seed, platform og den nøjagtige kommando). Den udskrives til
en ren PDF-fil (Portable Document Format) fra browseren på A4- eller Letter-papir;
motoren skriver ikke selv nogen PDF. Se [`docs/REPORTS.md`](docs/REPORTS.md).

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

`--export <czml|kml|geojson|stk|sigmf|all|list>` skriver CZML (Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), Ansys STK-efemerider (Systems Tool Kit) `.e`
og SigMF-optagelser (Signal Metadata Format) ved siden af scenariet, og
`--import-route <route.geojson>` fører en GeoJSON-linje ind i de typer, der flyver et spor. Hvert
format valideres mod sin offentliggjorte specifikation, og et scenarie, som et format ikke
gælder for, siger hvorfor: se [docs/INTEROP.md](docs/INTEROP.md).

**Andre CLI-tilstande** — lint et scenarie, før rigtige jordorienteringsdata ind, eller kør en hel suite:

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

**Animationseksport.** `--animate svg|html|frames|all` skriver `<scenario>.animation.svg`
(keyframes i Cascading Style Sheets (CSS), intet script), `<scenario>.animation.html` (afspil, pause, spol, hastighed og
synkroniserede paneler, uden eksterne ressourcer) og `<scenario>.frames/` (`frame_0000.svg`, … plus
`manifest.json` med billeder pr. sekund og varighed). En kampagne afspiller sine faser og
alarmer, en spektrumkørsel sit vandfaldsdiagram; temaet følger `prefers-color-scheme`, og
`prefers-reduced-motion` viser det færdige billede. Den gengiver kørslens egne samples,
byte-identiske ved en ny kørsel, og tilføjer ingen evidens. Se [docs/ANIMATION.md](docs/ANIMATION.md).

Et **suite**-manifest er en lille TOML-fil (Tom's Obvious, Minimal Language) — en `title` og et `scenarios = [ … ]`-array af
scenariestier — som motoren kører efter tur og folder hvert resultat (med dets
MODELLED- / VALIDATED-betegnelser) ind i ét selvbeskrivende studieartefakt. Se
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Rolle i interoperabilitet.** Kshana er det *ydelsessimulerings*lag, der står
ved siden af efterbehandlingsværktøjerne, ikke en erstatning for dem: før dens **RINEX**-
output ind i RTKLIB eller gLAB for en positionsløsning, og brug dens **SP3**-output som et
præcist baneprodukt til værktøjer som Ginan — Kshana besvarer, *hvilken robusthed en given
PNT-arkitektur giver*, før du har rigtige signaler, i formater, som disse værktøjer allerede
indlæser (`--export-sp3`, eller `export_sp3 = true` i et `orbit`-scenarie, skriver
`<scenario>.sp3`). Den samme bane kan offentliggøres som **CCSDS OMM**-middelelementer på standardsporet
(`--export-omm`, eller `export_omm = true`, skriver `<scenario>.omm`) —
én OMM 502.0 KVN-meddelelse (nøgleord = værdi-notation) pr. TLE-defineret satellit, som bærer hvert objekts rigtige
NORAD-katalognummer (North American Aerospace Defense Command), COSPAR-internationale betegnelse (Committee
on Space Research) og epoke, til enhver
OMM-bevidst forbruger i stedet for et skræddersyet to-linje-elementsæt.

Eksempeloutput (ur-holdover — bemærk, hvordan kvalitetsmålene Integrity og Security rapporteres):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Det optiske urs tidsfejl ved 95. percentil (p95) er 1.20e-4 ns: resuméet
udskriver små værdier med betydende cifre i stedet for at runde dem til `0.0`.
`security` viser `n/a (no attack)`, fordi dette scenarie ikke konfigurerer noget angreb, så der
er intet at detektere. JSON-resultatet bærer stadig hvert urs analytiske
grænse for spoofing-detekterbarhed i `fom.security` (0.997 for det optiske ur, 0.000 for
atomuret i chipstørrelse, hvis egen støj over overvågningsvinduet overstiger specifikationen på 20 ns),
og dets `figure_tiers`-blok markerer det tal `applicable: false`. Scenarietypen `spoof`
scorer detektion mod et indført angreb. `figure_tiers` giver også
hvert rapporteret tal dets verifikationsniveau — VALIDATED (kontrolleret mod en ekstern
reference) eller MODELLED — og den række i verifikationsmatricen, niveauet læses fra. Bane-
scenariet rapporterer desuden en geometriblok — andelen af samples med positionsbestemmelse samt
bedste/median præcisionsforringelse for position (PDOP) og positionsnøjagtighed — ved siden af
urresultatet.

> **Læs disse to tal omhyggeligt.** `security` er en *analytisk grænse for spoofing-
> detekterbarhed* udledt af hvert urs stabilitet — den er kun meningsfuld mod et
> konfigureret spoofingscenarie og er **ikke** en RAIM-detektor for flere satellitter. `integrity`
> er her filterets *selvkonsistens* (andelen af udfaldssamples inden for dets egen k-sigma-
> grænse), **ikke** et integritetstal for HPL/VPL i luftfart. Se
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> For ægte receiver-autonomous integrity kører **scenarietypen `integrity`**
> (`scenarios/integrity-raim.toml`) rigtig øjebliksbillede- og løsningsadskillelses-
> RAIM (ARAIM-stil) over den propagerede konstellationsgeometri: den beregner
> horisontale/vertikale **beskyttelsesniveauer (HPL/VPL)** pr. epoke og rapporterer
> andelen af epoker, der opfylder de konfigurerede alarmgrænser, med et Stanford-
> integritetsdiagram til klassifikation af fejl mod PL (beskyttelsesniveau).

<a id="reproducible-study-artifacts"></a>
#### Reproducerbare studieartefakter

Fire åbne studier genskaber hver et byte-deterministisk artefakt (fast seed) ud fra én
kommando — tallene bag studierne af krydsningen mellem kvante og klassisk, optimismegabet for RF-
forringelser, scoring af PNT-robusthed og timing protection level:

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

Hvert artefakt registrerer sin motorversion, seeds og en konfigurationshash og bærer en ærlig
MODELLED-/VALIDATED-betegnelse. Proberne til rigtige data (`*_probe`) kører den samme pipeline over
optagelser, du selv leverer lokalt; ingen datasæt leveres i repositoriet. Studiet af optimismegabet
for RF-forringelser er beskrevet i preprintet
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054), og det betingede timing
protection level (`tpl_jammertest` ovenfor) i preprintet
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (se [Citér](#cite)).

De offentliggjorte måne-PNT-studier ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP med overfladefyr, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) VLBI-
observerbarhed og [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) cislunar buelængde-
observerbarhed) har deres påstande om geometri, præcisionsforringelse, realtidsforudsigelse af referencesystem /
jordorienteringsparametre (EOP), fjerne retrograde baner og RF-afstandsmåling
uafhængigt krydskontrolleret i
`tests/validate_p*.rs` mod separate referencer (`scipy.special.j1`, en uafhængig NumPy-
`(HᵀH)⁻¹`-DOP-løsning, en NumPy-genparsing af de samme IERS `finals2000A`-rækker og
NASA/JPL Three-Body Periodic Orbit Database). Det er yderligere regressionskontroller over
den **modellerede** månepakke; de ændrer ikke antallet i den maskinkontrollerede matrix.

</details>

<details>
<summary>Scenarieformat</summary>

<a id="scenario-format"></a>
### Scenarieformat

Scenarier er deklarativ TOML. En `kind` på øverste niveau vælger pakken — **halvtreds** i
alt (`clock` er standard, hvis den udelades): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (AI/ML-testmiljø til evaluering af detektion af RF-
forringelser — mærket syntetisk korpus + detektoruafhængig ROC/AUC-ramme +
optimismegab inden for/uden for fordelingen), `quantum-trade` (kvante- mod klassisk PNT-
afvejning med indlæsning af målt ADEV + robusthedskurve uden GNSS; MODELLED),
`space-weather` (sol-/geomagnetiske indekser + exosfærisk temperatur efter Jacchia-71 +
aktivitetsdrevet termosfærisk tæthed over den statiske atmosfære; MODELLED),
`oem-interop` (CCSDS OEM-import/rundtursbro for efemerider fra GMAT/Orekit/STK;
MODELLED), missionsanalysetrioen `launch-window` (tolegeme-opsendelsesazimut /
planskifte / muligheder), `reentry` (Allen-Eggers-korridor for ballistisk genindtræden),
`eo-coverage` (EO-geometri for skår / GSD / adgang / genbesøg), `space-packet` (CCSDS
133.0 TM/TC — telemetri/telekommando — Space Packet-indramning — nøjagtigt bitlayout, verificeret i rundtur) og
`attitude-budget` (3-DOF-tyngdegradientmoment + RSS-fejlbudget for pegning),
`passes` (forudsigelse af opgang/nedgang for passager over jordstationer — AOS/TCA/LOS, maksimal elevation,
adgang) og `link-budget` (envejs CCSDS/DSN-linkligning — FSPL / Eb·N₀ /
margin / lukning); `telecom-timing` (holdover-tidsfejl, MTIE og TDEV kontrolleret
mod ITU-T-masker); `spectrum` (hele GNSS' L-bånd som én effektspektraltæthed:
et vandfaldsdiagram over frekvens og tid under en scriptet tidslinje for jammere med kontinuerlig bølge, smalbånd, chirp eller
tilpasset støj, jammer-til-signal-forhold pr. bånd og effektiv
bærebølge-til-støj-tæthed ud fra koefficienten for spektral adskillelse samt input og output af
optagelser i Signal Metadata Format (SigMF) med Welch-spektralestimater; signal-
spektrene VALIDATED mod lærebogsværdier, jammerscenariet MODELLED; se
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); den samme type tegner paneler for UHF-, S- og C-bånd med
designede signaler i lav jordbane); `leo-signal` (signaldesign for positionering, navigation og
tidssynkronisering i lav jordbane for ethvert system: båndbegrænsede spektre, jitter i kodesporing og afstands-
nøjagtighed, erhvervelsessøgning og -tid, spektral adskillelse mod GPS og Galileo, jammer-
tolerance og en afvejning fra UHF- til C-bånd, ud fra offentlige forvalg som Xona Pulsar, Iridium,
Starlink og CentiSpace eller indlejrede design; de lukkede former og LEO-Doppler VALIDATED,
designene MODELLED; se [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (Solen, planeterne, Pluto, Månen og syv store
måner ved én epoke — positioner, konstanter, lystider og banespor; planetpositioner
VALIDATED mod JPL Horizons) og `body-pnt` (positionering omkring ethvert af disse legemer med en
lokal navigationskonstellation og en dybrumsforbindelse fra Jorden; MODELLED); `campaign` (eksisterende typer sammensat til en kædet missionstidslinje
med tilstand overdraget mellem faser, et parametergennemløb, et seedet Monte Carlo-ensemble eller
flere scenarier under én fælles betingelse; MODELLED, se
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (Walker-delta- og stjerne-
mønstre, elementlister og design med flere skaller med forvalg for GPS, Galileo, BeiDou og GLONASS
samt dækning og præcisionsforringelse over et bredde-/længdegradsgitter;
generatoren og GPS' globale DOP VALIDATED mod de offentliggjorte tjenestedokumenter, se
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (en satellitpassage for
positionering, navigation og tidssynkronisering (PNT) i lav jordbane (LEO) og dens linkbudget bånd for
bånd, fra enhver konstellation og ethvert signaldesign: sigtevinkler, Doppler og Doppler-rate,
ITU-R-regn-, gas-, scintillations- og bygningsindtrængningstab, bærebølge-til-støj-tæthed mod de
synlige MEO-GNSS-satellitter, første ordens ionosfære og ionosfærefri par samt et
positionsbestemmelsesbudget med lav energi, ionosfæresondering fra hvert båndpar og spoofingmonitorer efter
Doppler- og passagegeometrikonsistens og efter konsistens på tværs af bånd; ITU-R-leddene og
Doppler-kurven for en stationær bruger VALIDATED, passagen MODELLED, se
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (den udsendte
efemeride- og urmeddelelse fra en LEO-PNT-satellit (lav jordbane) for enhver bane og
bærebølge: en tilpasning fra en integreret sand bane til Galileos Kepler-sæt, det sæt
med korrektionspolynomier langs sporet, på tværs af sporet og radialt, Liu et al. 2025-modellen med
22 parametre eller ATOMIC's ECEF-polynomium uden ur; afstandsfejl for signal-in-space
(SISRE) mod tilpasningsinterval og opdateringsperiode, en kontinuitetskontrol ved opdatering midt i passagen,
Kshanas egen dokumenterede binære ramme med en CRC-24Q cyklisk redundanskontrol og et kvantiseringsbudget samt en
blok i RINEX-4-stil mærket som en Kshana-udvidelse; SISRE-vægtene, Galileos bruger-
algoritme og CRC-24Q VALIDATED, tilpasningerne MODELLED; valgfri forvalg for Xona Pulsar,
Iridium, Starlink, CentiSpace, et repræsentativt C-båndssystem, ATOMIC og Celeste IOD; se
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); trioen for **fusioneret MEO + LEO
PNT** `leo-pvt` (Doppler-positionering ud fra afstandsrate i lav jordbane (LEO), fælles
GNSS + LEO-pseudoafstandsbestemmelser med bias mellem systemer og DOP mod antallet af LEO-
satellitter, polar og arktisk dækning og LEO-tidsoverførsel til UTC — over enhver konstellation,
med valgfri forvalg som Xona Pulsar, Iridium og Starlink-lejlighedssignaler;
LEO-Doppler-kurven VALIDATED mod offentliggjorte Iridium- og Xona-tal), `leo-ppp`
(konvergens for præcis punktpositionering med kun GNSS og med LEO-forstærkning, sammenlignet
med Li et al. 2019) og `ntn-positioning` (positionering i 5G-ikke-terrestriske netværk ud fra
signalbåndbreddens Cramér-Rao-grænse), MODELLED bortset fra den kurve, se
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (ét LEO-PNT-system fra ende til
ende: et `leo-signal`-design båret af et `leo-pass`-bånd, passagens C/N0 og navigations-
meddelelsens afstandsfejl for signal-in-space overdraget til en fusioneret `leo-pvt`-positionsbestemmelse og `leo-ppp`-
konvergens, hver overdragelse oplistet; MODELLED, se
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), som også er oversigten over
alle LEO-PNT-typer og -scenarier, inklusive robusthedskampagnerne, ét scenarie pr.
forsøgsfokusområde og ét pr. slutbrugersegment); **måne-PNT-pakken** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **demonstratoren for kvanteaktiveret PNT**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; og
forskningstyperne for **signalsikkerhed, cislunar og lagdelt robusthed** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — missionsanalysetrioen og disse senere typer alle MODELLED
(hver med en valideret kerne på lukket form; se matricen).
Fælles felter: `seed`, et `[time]`-gitter, en `[gnss]`-tilgængelighedstidslinje (det, der driver
udfaldet), og blokke pr. sensor med `provenance`-strenge, der citerer kilden til hvert
tal. Eksempel (ur):

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

Valgfri felter (slået fra, når de mangler): et ur kan tilføje `flicker_floor` (1/f FM — frekvens-
modulation — Allan-gulv); en inertiel sensor kan tilføje `gyro_bias` og `q_arw` (gyrobias og vinkel-
random-walk) samt `bias_instability` og `q_aa` (Allan-gulvet for biasinstabilitet og
accelerations-random-walk) — tilsammen et **fejlbudget for et enkeltakset (1-DOF) accelerometer**
(VRW/ARW — hastigheds-/vinkel-random-walk — og biasinstabilitet). Dette er det fejlbudget, som den leverede
`inertial`-scenarie*pakke* kører. Separat indeholder biblioteket nu en verificeret
**treakset strapdown-navigator** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
kvaternionattitude med coning/sculling-kompensation, en fuld NED-mekanisering
(led for jordrotation og transportrate, WGS-84 Somigliana-tyngde) og en
deterministisk IMU-fejlmodel, hvor **skalafaktor, fejljustering,
g-følsomhed, kvantisering og rate-rampe er modelleret** (IEEE Std 952-1997, IEEE's
standard for gyrospecifikation og testprocedure, §A.2; Groves 2013 §4.3). Den treaksede vej er nu **koblet ind i en kørbar
løst koblet GNSS/INS-pakke** (`kind = "gnss-ins"`): et fejltilstands-EKF med 15 tilstande
disciplinerer strapdown-løsningen mod støjfyldte positionsbestemmelser, mens GNSS er oppe, og
glider derefter gennem udfaldet og rapporterer den fusionerede horisontale fejl mod den
åbne sløjfes frie INS-glidning. En **tæt koblet pseudoafstands**opdatering er også
tilgængelig (den danner innovationen i afstandsdomænet, så den fortsætter med at korrigere
med færre end fire satellitter). Et
ur-holdover-scenarie kan tilføje `runs` (> 1) for at køre et **Monte Carlo-ensemble** — hvert
kvalitetsmål rapporteres da som et middelværdi med en spredning fra 5. til 95. percentil, og
diagrammet skraverer fejlens konfidensbånd (se `scenarios/clock-ensemble.toml`).

Et `fusion`-scenarie (samme blokke som `hybrid`) kører **to uafhængige Kalman-estimatorer**
— én for urtilstanden, én for positionstilstanden — disciplineret af GNSS og støttet af
optisk tidsoverførsel og rapporterer et samlet holdover-FoM. De to blokke deler ingen
krydskovarians: dette er et stablet par fejlbudgetter, **ikke** et ægte koblet
fælles filter for ur+position (krydskovarians mellem blokke står på køreplanen). Se
`scenarios/fusion-pnt.toml`.

Et `spoof`-scenarie indfører en tidsspoofing — én af fire `[attack.shape]`-typer
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; en bar `rate_ns_per_s` accepteres stadig
som en lineær rampe) — og kører hvert urs spoofingdetektor. Detektoren er en
tosidet **χ²₁-energi- / Neyman–Pearson-test** på den urstøttede monitorstatistik:
tærsklen sættes ud fra et budget for falske alarmer `target_pfa`, og
**sandsynligheden for misset detektion `P_md`** rapporteres både på lukket form og ved
Monte Carlo (`mc_runs` forsøg pr. hypotese — de to stemmer overens til få ×1/√N). Sikkerheds-
**kvalitetsmålet er `1 − P_md`** ved den operationelt skadelige størrelse (specifikationen),
så et roligt ur, der fanger en spoofing af specifikationsstørrelse, scorer ≈ 1, og et støjende
ur, der ofte misser den, scorer lavere (se `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Et `gnss-sim`-scenarie er en simulering i **målingsdomænet**: for hver synlig
satellit syntetiserer den pseudoafstanden `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` og L1-Doppler, med **Klobuchar**-enkeltfrekvens-
ionosfæren (`[iono]`, IS-GPS-200 §20.3.3.5.2.5) og **Saastamoinen**-zenit-
troposfæren projiceret med afbildningsfunktionen efter **Niell (1996)** (`[tropo]`). Residualerne
fodrer **øjebliksbillede-RAIM** for HPL/VPL pr. epoke, og hver satellits
pseudoafstand, Doppler, C/N₀ og iono-/tropokorrektioner udskrives i JSON-
arrayet `gnss_measurements`. Det er en fremadrettet simulator (den genererer målinger ud fra
en kendt sandhed), ikke en modtager/løser — en kørsel uden støj gengiver geometri plus
korrektionerne til under en millimeter (se `scenarios/gnss-sim-raim.toml`).

Et `jamming`-scenarie modellerer RF-interferens som et **linkbudget**: en `[jammer]`
(ECEF-position, sendeeffekt `power_dbw`, type) hæver jammer-til-signal-forholdet ved en
`[receiver]`, der følger en Walker-`[constellation]`. Ud fra geometrien (fririms-
tab og modtageantennens forstærkning pr. retning) beregner den hver satellits
`J/S`, den **effektive C/N₀** via den gængse anti-jam-ligning (behandlingsforstærkning ved
despreading × faktoren for spektral adskillelse `Q`; Kaplan & Hegarty §9.4) og
markerer tab af låsning under en konfigurerbar sporingstærskel — og rapporterer et
kvalitetsmål `availability_under_jamming`. En bredbåndsjammer på 10 W i 1 km afstand
nægter modtageren fuldstændigt (J/S ≈ 72 dB); den samme jammer i 100 km afstand
forringer kun forbindelserne (se `scenarios/jamming-demo.toml`).

Et `sweep`-scenarie kører et **afvejningsstudie**: det varierer én `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` eller `classical_q_wf`) fra `start` til `stop` over `steps`
punkter på en `lin`- eller `log`-`scale`, registrerer en `metric` (f.eks. `holdover_s`) for begge
ure og tegner de to kurver. Basisscenariet placeres under `[base]` (se
`scenarios/sweep-clock-stability.toml`).

Et `sweep-nd`-scenarie generaliserer dette til **enhver pakke og ethvert antal akser**: det
varierer punktnotationsnøgler i TOML for et `[base]`-scenarie (af enhver `kind`) over det kartesiske
produkt af `[[axes]]`, kører hver gitterknude igen og registrerer `metrics` angivet som
JSON-stier med punktnotation ind i resultatet (f.eks. `classical.fom.holdover_s`). Det virker for
hver pakke, fordi det arbejder ved grænsen mellem TOML og resultat; native kørsler evaluerer
gitteret parallelt (ingen ekstra afhængighed, wasm falder tilbage til sekventiel), og
outputtet er deterministisk og rækkeordnet (se `scenarios/sweep-nd-inertial.toml`).

Et `orbit`-scenarie udleder `[gnss]`-tidslinjen ud fra geometri i stedet for at skrive
den i hånden — angiv en `[user]`-bane, en `[constellation]`, en elevations-`mask_deg` og de to
urblokke. Det rapporterer også positionsnøjagtighed ud fra satellitgeometrien; den
valgfri `sigma_uere_m` (1-sigma brugerækvivalent afstandsfejl, standard 1 m) skalerer
præcisionsforringelsen for position til en positionssigma. Brugerbanen kan gøres
**excentrisk** med `eccentricity` og `argp_deg`, og `j2 = true` tilføjer sekulær drift fra Jordens afplatning
(se `scenarios/orbit-molniya.toml`). Konstellationen kan i stedet være en
**rigtig**: giv `[constellation]` en `tle`-blok med to-linje-elementsæt, og
satellitterne parses ud fra den (se `scenarios/orbit-real-tle.toml`). Tilføj en eller flere
`[[constellations]]`-blokke for **flere GNSS** (f.eks. GPS + Galileo; se
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

Typerne for **alt-PNT uden GPS** navigerer helt uden GNSS ved at matche en målt felt-
sekvens mod et kort gennem et partikelfilter. Et `gravity-map`-scenarie flyver et spor
gennem et sfærisk-harmonisk tyngdeanomalifelt og genskaber det ud fra et koldatom-
gravimeters aflæsning (`scenarios/gps-denied-gravity-nav.toml`); et `terrain-nav`-scenarie
gør det samme mod en SRTM-højdemodel (DEM) (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
og et `combined-altpnt`-scenarie fusionerer **tyngde + IGRF-magnetfelt + terræn** i ét filter
(`scenarios/combined-altpnt.toml`).

Et `lunar-integrity`-scenarie evaluerer **cislunar** PNT: det kører en ARAIM-passage for beskyttelses-
niveau ved Månens sydpol mod et LunaNet/LNIS-relæsæt og rapporterer ærligt
integritetshullet — en σ_URE på ~30 m ved Månen driver beskyttelsesniveauet et godt stykke over en alarm-
grænse på 50 m, så tjenesten er *utilgængelig* under integritetsregler i luftfartsstil
(`scenarios/lunanet-araim.toml`).

Et `lunar-time-offset`-scenarie rapporterer den **relativistiske urrate mellem Jord og Måne** —
grundlaget for en tidsskala i Lunar Coordinate Time (LTC/TCL). En post-newtonsk identitet ud fra
grundprincipper summerer forskellen i egenpotential (IAU's `L_G`-geoidepotential minus Månens
overflade-egenpotential) og Månens kinetiske led (anden ordens Doppler) til en sekulær
rate på ≈ 57 µs/døgn, rapporteret med det offentliggjorte bånd på 56–59 µs/døgn; det giver også den
akkumulerede LTC−TT-forskydning over en horisont og et ensemble med invers varians (et måne-
papirur). **MODELLED** — hovedtallet er *referenceafhængigt* (Jordens geoide
mod Månens selenoide, midlingsvindue), hvilket er grunden til, at der rapporteres et bånd, ikke et enkelt certificeret
tal (`scenarios/lunar-time-offset.toml`).

Se `scenarios/` for mindst ét gennemarbejdet eksempel på hver type (92 typer, 193 scenarie-
`.toml`-filer + 1 suitemanifest — flere typer leveres med mere end ét eksempel). Ikke hver
type har en fil opkaldt efter sig: `lunar-integrity` → `scenarios/lunanet-araim.toml` og
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` er to af flere sådanne.
Oplist de typer, der kan fordeles til, når som helst med fejlene fra `cargo run -- --validate <file>`,
Pythons `list_kinds()` eller MCP-værktøjet `list_scenario_kinds`.

</details>

<details>
<summary>Output</summary>

### Output

Resultatartefaktet er versioneret, selvbeskrivende JSON: tidsserier pr. trin, de
scorede kvalitetsmål, de aktive modelspecifikationer (med proveniens), seedet, en
**scenariehash** — så ethvert diagram kan gengives ud fra filen — og for hvert ur
en `adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): den overlappende
Allan-afvigelse over oktavfordelte midlingstider — standardmåden at aflæse et urs
stabilitet på — nu med et **95%-konfidensbånd specifikt for støjtype** pr. punkt (optegnelsens
potenslovstype identificeres ud fra dens modificerede Allan-hældning, og χ²-intervallet bruger
de tilsvarende effektive frihedsgrader fra NIST SP 1065). Browserens legeplads gengiver det som et
log-log-diagram "Clock stability (ADEV)". (MDEV, TDEV og HDEV er tilgængelige som biblioteks-
estimatorer; den eksporterede resultatkurve er den overlappende ADEV.) Hvert felt, med enheder og en
kildehenvisning, er dokumenteret i [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Hvert diagram er selvbeskrivende.** Browserens legeplads, CLI'ens `*.chart.svg`-
eksport og HTML-scorekortet (HyperText Markup Language) stempler alle hvert diagrambillede med en sidefod, der lyder
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` er de første
12 hex-tegn af kørslens **scenariehash** — en SHA-256-digest (256-bit Secure Hash Algorithm) over den kanoniske scenarie-
definition (seed, tærskler, modelparametre, GNSS-vinduer, …); integritets- og måne-
rapporterne, som ikke bærer nogen egen hash, falder tilbage til en SHA-256 af scenariekilden.
Det er det **samme fingeraftryk**, der vises i resuméet på én linje og i resultat-JSON'en, så et
gemt eller indsat diagram altid bærer sin version, det nøjagtige scenarie, der producerede det (til
gengivelse bit for bit), og kilden — ændr et hvilket som helst input, og hashen ændres.

Kvalitetsmålene følger de gængse operationelle kvalitetsmål for PNT:

| Kvalitetsmål | Hvordan Kshana beregner det |
|-----------------|------------------------|
| Tidsydelse (ur-/banepakker) | RMS af urets fasefejl + 95. percentil over udfaldet, i **nanosekunder** (`timing_rms_ns`) — et tidsmål, ikke position |
| Positioneringsydelse (inertial-/hybridpakker) | 1-DOF RMS af positionsfejl + 95. percentil over udfaldet, i **meter** (`pos_rms_m`); enkeltakset. En enkelt kørsel markeres `monte_carlo: false`; sæt `runs = N` for et Monte Carlo-ensemble, der rapporterer hvert måls middelværdi, spredning og bootstrap-95%-CI (konfidensinterval). Stadig **ikke** en 2-D CEP/2DRMS (circular error probable / to gange afstandens kvadratiske middelværdi) eller DOP-vægtet nøjagtighed (de kræver den treaksede model — køreplan) |
| Autonomi | holdover-varighed — tid inden for specifikationen efter tab af GNSS (kvantiseret efter gitteret: en nedre grænse) |
| Robusthed | hældning af fejlvæksten under udfaldet |
| Tilgængelighed | andelen af kørslen med en løsning inden for specifikationen |
| Integritet | filterets **selvkonsistens** — andelen af udfaldssamples, hvis fejl holder sig inden for Kalman-filterets egen k-sigma-grænse. **Ikke** et integritetstal for HPL/VPL/RAIM i luftfart (se [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Sikkerhed | **analytisk grænse for spoofing-*detekterbarhed*** ud fra urstabilitet — hvor lille/langsom en tidsspoofing en konsistensmonitor med ét ur kunne markere. Kun meningsfuld med et konfigureret angreb; **ikke** en RAIM-detektor for flere satellitter |

Ny med disse begreber? Hvert er defineret i almindeligt sprog i [ordlisten](docs/GLOSSARY.md).

</details>

<details>
<summary>Repositoriets opbygning</summary>

### Repositoriets opbygning

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
<summary>FAQ (ofte stillede spørgsmål)</summary>

### FAQ

**Skal jeg forstå kvantefysik for at bruge dette?**
Nej. Hvis du kan køre en kommandolinje, kan du køre Kshana. Start med
[introduktionen i almindeligt sprog](docs/CONCEPTS.md); slå begreber op i [ordlisten](docs/GLOSSARY.md).

**Er dette et design af kvantehardware eller flysoftware?**
Nej. Det er en ydelses*simulator*. Kvantehardwarens nøjagtighed kommer fra offentliggjorte
fejlmodeller, ikke fra dette værktøj. Se [Hvad det er / ikke er](#what-it-is--is-not).

**Er kvanteresultaterne realistiske, eller er det markedsføring?**
Hver parameter er citeret fra et datablad eller en artikel, hver model er valideret mod en
lærebogsrelation, og modenheden er ærligt mærket i
[VALIDATION.md](docs/VALIDATION.md) — inklusive at intet optisk strontiumur har
fløjet. Motoren er neutral: kvante og klassisk er den samme kode med forskellige
offentliggjorte tal.

**Kan jeg stole på, at to kørsler stemmer overens?**
Ja — kørsler er deterministiske: `scenario + seed + engine version → bit-identical output`,
håndhævet af `scripts/check-reproducible.sh`.

**Kan jeg bruge det fra Python eller i en browser?**
Ja — se [Installation](#install): Python- og WebAssembly-eksemplerne står under den. Begge kalder den samme motor.

**Hvordan modellerer jeg min egen sensor?**
Skriv et scenarie som `.toml` med din sensors offentliggjorte tal i `provenance`-
felterne. Se [Scenarieformat](#scenario-format) og eksemplerne i `scenarios/`.

**Er det gratis til kommerciel brug?**
Ja — under AGPL-3.0, også i kommercielle sammenhænge, så længe du overholder
AGPL's copyleft (især: hvis du ændrer Kshana og tilbyder det over et netværk, skal du
tilbyde disse brugere din ændrede kildekode). Hvis det ikke passer dig — f.eks. hvis du har brug for at
indlejre Kshana i et proprietært produkt eller køre en lukket netværkstjeneste — kan en kommerciel
licens fås fra Ashforde® OÜ; se [`LICENSING.md`](LICENSING.md) og
[Support](#support--professional-services).

</details>

<details>
<summary>Fejlfinding</summary>

### Fejlfinding

**`cargo build` fejler på en gammel værktøjskæde.** Kshana kræver Rust ≥ 1.88. Opdatér med
`rustup update`.

**Bygningen af Python-udvidelsen fejler ved linkning på macOS** (`Undefined symbols … _Py…`).
En Python-udvidelse opløser sine symboler ved indlæsning. `maturin` sætter automatisk det rigtige linker-
flag — brug `maturin develop --features python` i stedet for en bar
`cargo build`.

**Python-bygningen klager over, at fortolkeren er nyere, end PyO3 kender.** Sæt
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (abi3-wheels er fremadkompatible på tværs af
CPython-versioner).

**WebAssembly-bygningen kan ikke finde målet.** Installér det én gang med
`rustup target add wasm32-unknown-unknown`, og kør derefter `wasm-pack build --target web -- --features wasm`.

**Hvor blev mit output af?** Hver kørsel skriver `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` og `<scenario>.report.json` ved siden af
input-`.toml`'en, og
også `<scenario>.table.csv` for de typer, der offentliggør en tabel. De ignoreres alle
af git med vilje.

</details>

<details>
<summary>Versionering og udgivelser</summary>

### Versionering og udgivelser

Kshana følger [Semantic Versioning](https://semver.org). Før 1.0 kan det offentlige
scenarie-/resultatskema stadig ændres; bagudinkompatible ændringer nævnes eksplicit i
[`CHANGELOG.md`](CHANGELOG.md). Hvert resultat kan gengives ud fra
`scenario + seed + engine version`.

**Hvert `vX.Y.Z`-tag udgiver alle kanaler automatisk, i én rækkefølge** — den fulde
testsuite kører først på det taggede commit, intet udgives, før den består, og
bagefter kontrollerer pipelinen, at hvert register faktisk leverer den nye version
([`docs/RELEASING.md`](docs/RELEASING.md)). Kanalerne:

| Kanal | Installation / hentning | Indhold |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | Rust-bibliotek + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | MCP-serveren |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | abi3-wheels (Linux/macOS/Windows) + sdist (kildedistribution) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | WebAssembly-modul + JS-indpakning |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | OCI-image til flere arkitekturer (Open Container Initiative) — ingen værktøjskæde nødvendig |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | starter: henter udgivelsens binærfil, verificerer `SHA256SUMS`, kører den |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | den samme starter til Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | `kshana-mcp`-binærfilen, genereret ud fra hver udgivelses `SHA256SUMS` |
| Claude Desktop | dobbeltklik på `kshana-mcp-<target>.mcpb` fra udgivelsen | udvidelsen, med binærfilen indeni |
| officielt MCP-register | opdages automatisk af MCP-klienter | `io.github.ashfordeOU/kshana-mcp` (OCI-image, npm- og PyPI-pakker) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → søg efter "Kshana" | IDE-pluginet **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | download | kommandolinjebinærfilen `kshana` til Linux x86-64, macOS (Apple silicon og Intel) og Windows x86-64, `kshana-mcp`-binærfilen til hvert af disse systemer og Linux Arm, en `.mcpb`-udvidelse til Claude Desktop pr. system, en CycloneDX-**SBOM**, **SLSA**-byggeproveniens, et HTML-valideringsresumé og en `SHA256SUMS`-kontrolsumfil |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | et citerbart arkiv af hver udgivelse |
| [kshana.dev](https://kshana.dev) | åbn i en browser | Kshana Studio, WebAssembly-appen i browseren, genbygget fra hvert udgivelsestag (så den version, den viser, er den version, den kører) |

MCP-serverens crate-/image-/registerversion følger motoren (den indeholder
biblioteket); JetBrains-pluginet versioneres uafhængigt (det kalder din installerede
`kshana`-binærfil).

</details>

<details>
<summary>Køreplan</summary>

### Køreplan

Se [`ROADMAP.md`](ROADMAP.md) for den faseopdelte køreplan, [`CHANGELOG.md`](CHANGELOG.md)
for udgivet historik og [`docs/CAPABILITY.md`](docs/CAPABILITY.md) for
køreplanen pr. funktion. Prioriteringsrækkefølgen er: **evidens for tidssynkronisering og holdover til
kritisk infrastruktur først** (telekommasker, længere holdover med ældning og flicker-
støj, indlæsning af målte urdata); **den neutrale metode til afvejning mellem kvante og klassisk
som nummer to** (resultater mærket MODELLED, indtil en partners målte data forfremmer dem); og
**navigation for Måne / cislunar og det dybe rum vedligeholdt**, ikke udvidet som hovedspor. Den **ITRF-præcise reduktion af referencesystem** er nu leveret — den
fulde CIO-baserede IAU 2006/2000A GCRS↔ITRS-kæde (polbevægelse + nutation under et buesekund),
valideret bit for bit mod SOFA/ERFA og uafhængigt krydskontrolleret mod ANISE
(ren Rust SPICE) til ≤ 3.6 m i GNSS-bane. Punkter på kort sigt omfatter tæt koblet bærebølgefasefusion og at gøre den
løst/tæt koblede GNSS/INS-navigator tilgængelig i flere pakker; motoren til **radiometrisk navigation i det dybe rum / ved Mars**
kom med i v0.17.0 (simuleringsvalideret).
**Kvantefysiklaget** er et **P2**-punkt: CAI-accelerometeret simuleres nu ud fra
grundprincipper (Mach–Zehnder-fase, projektionsstøj, kontrastforfald, vibrations-
kobling), mens ur-/tidsoverførselssensorerne stadig drives af offentliggjorte
Allan-/støjbudgetkoefficienter. GMST-baseret TEME&harr;ECEF, IERS'
tidssystemer med skudsekunder (UTC/TAI/TT/UT1), SGP4/SDP4-banepropagering (v0.7.0,
valideret mod AIAA 2006-6753-vektorerne) og den kørbare `gnss-ins`-fusions-
pakke er alle **leveret**, og den inertielle hastighed er gjort tilgængelig videre i kæden. En aktiv
stokastisk tidsspoofing-detektor (Neyman–Pearson / χ²₁-energitest med Monte Carlo-
P_fa/P_md og et sikkerheds-FoM på 1−P_md), en linkbudgetmodel for jamming (J/S → effektiv
C/N₀ → tab af låsning), tilgængelighed for flere konstellationer, et enkeltakset (1-DOF)
IMU-fejlbudget, to uafhængige Kalman-estimatorer (ur + position) rapporteret som et
samlet FoM, rigtig konstellationsgeometri fra TLE'er, en HTML-scorekortrapport,
geometriudledt GNSS-tilgængelighed
*og* præcisionsforringelse ud fra Kepler-baner med excentricitet og J2-drift,
Monte Carlo-konfidensbånd, parametergennemløb til afvejningsstudier, en WebAssembly-
legeplads i browseren og valgfri Python- (PyO3) og WebAssembly-bindinger (wasm-bindgen) er
landet på `main`.

</details>

<details>
<summary>Bidrag</summary>

### Bidrag

Se [`CONTRIBUTING.md`](CONTRIBUTING.md). Kort sagt: tests består (`cargo test`), de
to værnscripts består, Conventional Commits og en `CHANGELOG.md` `[Unreleased]`-
post for hver ændring, der er synlig for brugeren. Deltagelse er underlagt vores
[Adfærdskodeks](CODE_OF_CONDUCT.md). For at rapportere et sikkerhedsproblem, se
[sikkerhedspolitikken](SECURITY.md) — åbn venligst ikke en offentlig issue for sårbarheder.

</details>

<details>
<summary>Dokumentation: hvert dokument, og hvem det er til</summary>

<a id="documentation"></a>
### Dokumentation

| Dokument | Til hvem | Hvad det indeholder |
|----------|----------|--------------|
| [Introduktion til begreberne](docs/CONCEPTS.md) | alle, start her | hvad Kshana gør og hvorfor, fra nul til fysikken |
| [Kshana Studio](web/README.md) | alle | kør motoren i din browser (WebAssembly); noter om bygning og udrulning |
| [Ordliste](docs/GLOSSARY.md) | alle | definitioner i almindeligt sprog af hvert begreb |
| [Scenarietyper](docs/KINDS.md) | alle | hver type, motoren fordeler til: hvad den gør, dens felter, en eksempelkommando, dens registerrækker og det diagram, motoren skriver for den |
| [Partnerdata](docs/PARTNER-DATA.md) | laboratorier og producenter med målte data | hvilke MODELLED-rækker en målt ur- eller IMU-optegnelse kunne forfremme, formaterne, hvordan en indsendelse kontrolleres (`kshana partner check`), scores og krediteres |
| [Arkitektur](docs/ARCHITECTURE.md) | udviklere / bedømmere | modulkort, motorens pipeline, fordeling og diagrammer |
| [Valideringsstatus](docs/VALIDATION.md) | bedømmere / citerende | hvad der er `validated` mod `not modeled`, med evidens |
| [Verifikationsmatrix](docs/VERIFICATION-MATRIX.md) | bedømmere / citerende | det maskinkontrollerede evidensregister — hver funktionsrække med sin status, modul, test og eksterne reference, genereret ud fra `src/verification.rs` |
| [Begrundelse for Modelled](docs/MODELLED-RATIONALE.md) | bedømmere | hvorfor hver **Modelled**-række ikke har nogen ekstern reference, angivet række for række |
| [Proveniens](docs/PROVENANCE.md) | bedømmere / citerende | hver sensorparameter, model og datasæt sporet til sin offentliggjorte kilde, i én citerbar tabel |
| [Reproducerbarhed og proveniens](docs/REPRODUCIBILITY.md) | bedømmere / pakkere | garantier for determinisme, fastlåsning af guldstandarder, SBOM (software bill of materials), byggeproveniens |
| [Platformstags for wheels](docs/WHEEL_TAGS.md) | pakkere | abi3-matricen for Python-wheels — hvilket platformstag `pip install kshana` opløser |
| [Positionering](docs/POSITIONING.md) | evaluatorer | hvor Kshana står i forhold til RTKLIB/gLAB (komplementært), og browserniveauet uden installation |
| [Kshana Pro](docs/PRO.md) | evaluatorer / programledere | hvad det proprietære Pro-lag tilføjer oven på den samme motor: designoptimering, usikkerhed og følsomhed, missionsdossier, kampagneovervågning, spektral sameksistens, lokal jobtjeneste, sporbarhed af krav; hvad hver producerer, og hvad den ikke gør |
| [Teknisk rapport](paper/kshana-technical-report.md) · [JOSS-artikel](paper/paper.md) | bedømmere / citerende / evaluatorer | den fulde udvidede forskningsartikel — arkitektur, modeller pr. domæne, validering, casestudier og begrænsninger — plus den koncise indsendelse til JOSS (Journal of Open Source Software) |
| [SGP4-validering](docs/SGP4-VALIDATION.md) | bedømmere / citerende | overensstemmelse med AIAA 2006-6753-referencen (666 tilstande, ~4 mm) **og** en direkte sammenligning mod den uafhængige `sgp4`-crate (enige til under en mikrometer / 4.12 mm) |
| [Validering af kraftmodel](docs/AGENCY-ORBIT-VALIDATION.md) | bedømmere / citerende | motoren med fulde kræfter (`src/precise_od.rs`) tilpasset agenturers efemerider — metode og validerede residualer |
| [Vejledning til rigtige TLE'er](docs/REAL_TLE_GUIDE.md) | brugere | at drive scenarier ud fra rigtige konstellations-TLE'er fra Celestrak / Space-Track (mod det medfølgende syntetiske Walker-sæt) |
| [Integritets-FoM](docs/INTEGRITY.md) | evaluatorer | hvad tallene `integrity` / `security` betyder — og hvad de **ikke** er i forhold til HPL/VPL i luftfart |
| [ARAIM-reference](docs/ARAIM_REFERENCE.md) | bedømmere / integratorer | den åbne implementering af MHSS ARAIM-beskyttelsesniveau — projektionen af nominel bias `b_k`, σ_URA mod σ_URE og a priori-sandsynlighederne for fejltilstande |
| [Kvantemodeller](docs/QUANTUM.md) · [detaljer](docs/QUANTUM-MODELS.md) | bedømmere | fysiklaget for koldatom-interferometeret, og hvor koefficienter stadig slås op |
| [Compliance](docs/COMPLIANCE.md) | evaluatorer | algoritmeomfanget for DO-229E / DO-316, og hvad der **ikke** er en påstand om overensstemmelse |
| [Maritim tillid](docs/MARITIME-TRUST.md) | søfarende / integratorer | GNSS-tillidsscoren fra 0-100 for et fartøjs NMEA, dens monitorer og dens grænser (vejledende, ikke typegodkendt navigationsudstyr) |
| [NMEA-træningsstrømme](docs/NMEA-TRAINING.md) | maritime instruktører | syntetisk bro-NMEA med scriptet jamming og spoofing og en instruktørlog; kun tekst, aldrig til aktiv navigation |
| [Interferenskort](docs/INTERFERENCE-MAP.md) | analytikere / søfarende | hvor fly og skibe rapporterede forringede navigationsdata, og hvor meget af en rute det berører |
| [Bevispakker](docs/EVIDENCE-PACKS.md) | operatører / forsikringsselskaber | signerede tekniske optegnelser af en tillidshændelse, og hvordan man verificerer en |
| [Tillidstelemetri](docs/TRUST-TELEMETRY.md) | drifts- / sikkerhedsteams | tillidsstrømmen som Prometheus-målinger, SIEM-hændelser og OpenTelemetry, med et Grafana-dashboard |
| [Maritime integrationer](docs/MARINE-INTEGRATIONS.md) | bådejere / integratorer | Signal K-pluginet, OpenCPN's gate-tilstand og referenceopbygningen |
| [Testbænk](docs/TEST-BENCH.md) | modtagerproducenter | afspilning af et eksporteret scenarie gennem en laboratoriesimulator og scoring af modtagerens log |
| [Compliance-kortlægning](docs/compliance/README.md) | evaluatorer | offentlige robusthedsrammeværker afbildet til Kshanas output, med kilder og huller; `kshana compliance-report` |
| [Notebooks](notebooks/README.md) | brugere | kørbare vejledninger med deres gengivne tekst |
| [Standarder og interoperabilitet](docs/STANDARDS.md) | integratorer | de GNSS-, flydynamik- og agenturudvekslingsformater, Kshana læser og skriver (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [LEO PNT-fusion](docs/LEO-PNT-FUSION.md) | brugere / evaluatorer | fusioneret MEO + LEO positionering, navigation og tidssynkronisering: Doppler, fælles pseudoafstand, PPP-konvergens, 5G NTN, polar dækning og LEO-tidsoverførsel over enhver konstellation; de valgfri forvalg og deres offentlige kilder |
| [Kampagner](docs/CAMPAIGNS.md) | brugere / evaluatorer | sammensætning af scenarier: kædede missionstidslinjer, parametergennemløb, Monte Carlo-ensembler og kørsler med fælles betingelse, med de sammensætningsidentiteter, testene fastlåser |
| [Scenariekatalog](docs/SCENARIOS.md) | brugere / integratorer | hver type, der kan fordeles til, med dens påkrævede og valgfri TOML-felter — genereret ud fra `api::list_scenario_kinds()` |
| [Resultatskema](docs/SCHEMA.md) | integratorer | hvert felt i resultat-JSON'en, med enheder og en kildehenvisning |
| [Python-API](docs/PYTHON_API.md) | Python-brugere | PyO3-bindingens flade — kald af motoren, scenarie-/resultattyperne og eksempler |
| [Påstande mod virkelighed](docs/CLAIMS-VS-REALITY.md) | bedømmere | registret over lukkede overdrevne påstande + CI-værnet (`tests/no_overclaims.rs`), der holder det løst |
| [Køreplan](ROADMAP.md) | alle | den faseopdelte køreplan — hvad der er leveret, og hvad der kommer næste |
| [MCP-server](mcp/kshana-mcp/README.md) · [JetBrains-plugin](ide/jetbrains/README.md) | agenter / IDE-brugere | kør Kshana fra en AI-assistent eller en JetBrains-IDE |
| [Agentvejledning](docs/AGENTS.md) · [Flader](docs/SURFACES.md) | agenter / integratorer | hvilket værktøj der besvarer hvilket spørgsmål, hvad der skal bevares med hvert svar; hvor hver funktion kan nås (CLI, Rust, Python, WASM, MCP, plugin, JetBrains, notebooks), og hvorfor en celle er N/A |
| [Ændringslog](CHANGELOG.md) | alle | udgivet historik (Keep a Changelog + SemVer, Semantic Versioning) |
| [Bidrag](CONTRIBUTING.md) | bidragydere | bygning, værn, disciplin for test/citation, DCO (Developer Certificate of Origin) |
| [Styring](GOVERNANCE.md) | bidragydere / fællesskab | hvordan Kshana styres — hvem der beslutter, hvordan, og grænsen mellem åbent og lukket |
| [Adfærdskodeks](CODE_OF_CONDUCT.md) | fællesskab | forventet adfærd (Contributor Covenant) |
| [Sikkerhedspolitik](SECURITY.md) | rapportører | hvordan man rapporterer en sårbarhed; note om dobbelt anvendelse |

</details>

<details>
<summary>Vigtige referencer</summary>

### Vigtige referencer

**Valideringsreferencer og standarder** — de eksterne autoriteter, Kshanas kontroller er forankret i:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [testdata](https://celestrak.org/publications/AIAA/2006-6753/)): SGP4/SDP4-verifikationssættet, som Kshana stemmer overens med til 4.12 mm, og de gennemregnede eksempler på referencesystemer, som TEME→ITRF-kæden kontrolleres mod.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — referencerutinerne for tid og referencesystemer, som IAU 2000A-nutationen og CIO GCRS↔ITRS-reduktionen er valideret bit for bit mod.
- Petit & Luzum (red.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (standarder for jordorientering, polbevægelse og referencesystemer).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (Allan-afvigelsesrelationer og NBS14-referenceserien; NBS = det tidligere US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): referenceimplementeringerne af ROC/AUC, forvekslingsmatrix og præcision/genkaldelse/F1, som testmiljøet til evaluering af RF-forringelser stemmer nøjagtigt overens med (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` og `linalg.expm` — referencerutinerne, som kvanteafvejningens NNLS-tilpasning af målt ADEV, χ²-konsistensbåndene og van-Loans kovarians for urets processtøj er valideret mod (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): brugt både som åben tidligere teknik (se *Sammenligning og åben tidligere teknik* nedenfor) og som den **uafhængige DOP-reference**, som beregningen af GDOP/PDOP/HDOP/VDOP/TDOP stemmer overens med til 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): kraftmodellerne bag kraftmodeltilpasningen til agenturers præcise efemerider.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (de halo-/NRHO-familier, som CR3BP-differentialkorrektoren gengiver).

**Enheds- og metodefysik** — de citerede kilder bag sensormodellerne:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (optisk strontium-gitterur, rumorienteret mål).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (Sr-ur i laboratoriet, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybrid kvanteaccelerometertriade).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [IEEE AESS-vejledning (Aerospace and Electronic Systems Society) (University College London Discovery-repositoriet)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (vækst i dødregningsfejl).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optisk tovejs tids- og frekvensoverførsel; den optiske forbindelse mellem satellitter modellerer sit budget for ikke-reciprocitet efter disse).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (BOC-modulationen og teorien om spektral adskillelse bag `src/navsignal.rs`).
- Kaplan & Hegarty (red.) — *Understanding GPS/GNSS: Principles and Applications* (3. udg., Artech House, 2017): anti-jam-ligningen for effektiv C/N₀ og den termiske støjjitter i early–late DLL-kodesporing, som navigationssignal- og jammingmodellerne bruger.

**Sammenligning og åben tidligere teknik** — de værktøjer og oversigter, Kshana positioneres i forhold til:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): parametrene i spoofing-testbatteriet, som detektoren i flere lag karakteriseres mod.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): de åbne, validerede fejlprofiler for inertiel navigation, der bruges som klassisk baseline.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): åben simulator til måne-PNT.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): åben GNSS-dataanalyse.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): GRAIL reduceret-dynamisk OD, gulvet for empirisk acceleration, som LRO-tilpasningen gengiver.

</details>
