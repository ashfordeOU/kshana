> Toto je strojový překlad souboru README.md ve verzi v0.40.0, který dosud nezkontroloval žádný rodilý mluvčí; referenční je anglický README. [English](README.md)

<!-- The images under docs/assets/readme/ are generated from real engine runs by
     tools/gen_readme_assets.py (light and dark variants); regenerate them with
     `python3 tools/gen_readme_assets.py --kshana <path to kshana>` and check with `--check`.
     The Kshana Studio screenshots under docs/assets/readme/studio/ are taken from the
     running Studio by tools/capture_studio_shots.mjs and recorded in studio/SHOTS.json. -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/kshana-logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/kshana-logo-light.svg">
    <img src="docs/assets/readme/kshana-logo-light.svg" alt="Kshana: značka, kompasový záměrný kříž označující přesný okamžik, vedle slovního loga kshana" width="300">
  </picture>
</p>

<p align="center">
  <strong>Kshana · <span lang="sa">क्षण</span> · <em>přesný okamžik</em></strong><br>
  Open-source simulátor odolnosti PNT (určování polohy, navigace a času).
</p>

<p align="center">
  <a href="https://github.com/ashfordeOU/kshana/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/ashfordeOU/kshana/ci.yml?branch=main&event=push&label=CI&style=flat-square&labelColor=0A1226" height="18" alt="Stav průběžné integrace na větvi main"></a>
  <a href="docs/COVERAGE.md"><img src="https://img.shields.io/badge/coverage-~95%25-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="Řádkové pokrytí blízko 95 % adresáře src/, měřené v docs/COVERAGE.md a v průběžné integraci hlídané na 85 %"></a>
  <a href="#evidence"><img src="https://img.shields.io/badge/validated-176%2F401-377D0C?style=flat-square&labelColor=0A1226" height="18" alt="176 ze 401 schopností VALIDATED proti nezávislému vnějšímu orákulu, podle verifikační matice"></a>
  <a href="https://sonarcloud.io/summary/overall?id=ashfordeOU_kshana"><img src="https://img.shields.io/sonar/quality_gate/ashfordeOU_kshana?server=https%3A%2F%2Fsonarcloud.io&label=quality&style=flat-square&labelColor=0A1226" height="18" alt="Stav brány kvality SonarQube Cloud"></a>
  <a href="https://github.com/ashfordeOU/kshana/releases"><img src="https://img.shields.io/badge/release-v0.40.0-066A86?style=flat-square&labelColor=0A1226" height="18" alt="Vydání v0.40.0"></a>
  <a href="docs/i18n.md"><img src="https://img.shields.io/badge/languages-English%20%2B%2017-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Angličtina a 17 dalších jazyků, strojově přeloženo"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/licence-AGPL--3.0-3F4B67?style=flat-square&labelColor=0A1226" height="18" alt="Licence: AGPL-3.0-only"></a>
  <br>
  <a href="https://doi.org/10.5281/zenodo.20528627"><img src="https://img.shields.io/badge/DOI-zenodo.20528627-7E4B00?style=flat-square&labelColor=0A1226" height="18" alt="DOI 10.5281/zenodo.20528627, koncepční záznam Zenodo pro všechna vydání"></a>
  <a href="#editions"><img src="https://img.shields.io/badge/commercial-available-B8288F?style=flat-square&labelColor=0A1226" height="18" alt="Komerční licence je k dispozici od Ashforde® OÜ, viz Edice"></a>
  <a href="https://crates.io/crates/kshana"><img src="https://img.shields.io/crates/v/kshana?label=crates.io&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana na crates.io, aktuální zveřejněná verze"></a>
  <a href="https://pypi.org/project/kshana/"><img src="https://img.shields.io/pypi/v/kshana?label=PyPI&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana na PyPI, aktuální zveřejněná verze"></a>
  <a href="https://www.npmjs.com/package/kshana"><img src="https://img.shields.io/npm/v/kshana?label=npm&color=066A86&cacheSeconds=3600&style=flat-square&labelColor=0A1226" height="18" alt="kshana na npm, aktuální zveřejněná verze"></a>
</p>

<p align="center">
  <a href="https://kshana.dev">Otevřít Kshana Studio</a> ·
  <a href="#install">Instalace</a> ·
  <a href="#capabilities">Schopnosti</a> ·
  <a href="#evidence">Důkazy</a> ·
  <a href="#research">Výzkum</a> ·
  <a href="docs/CONCEPTS.md">Dokumentace</a> ·
  <a href="#cite">Citace</a>
</p>

<p align="center">
  <strong>Jazyky:</strong> <a href="README.md">English</a> ·
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
  <sub>Příkazový řádek, souhrny běhů, grafy a zprávy mluví každým jazykem pomocí <code>--lang &lt;tag&gt;</code>
  (například <code>kshana scenarios/holdover-test-example.toml --lang de</code>), a stejně tak rozhraní Python, WebAssembly a MCP.
  Jde o strojové překlady, které dosud nezkontroloval žádný rodilý mluvčí; referenční je angličtina.
  Viz <a href="docs/i18n.md">Lokalizace</a>.</sub>
</p>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/hero-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/hero-light.svg">
  <img src="docs/assets/readme/hero-light.svg" alt="Nacvičte minutu, kdy GNSS zhasne. Misijní konzole Kshana, vykreslená ze skutečného běhu enginu v0.40.0: řetězená kampaň campaign-jam-spoof-holdover-integrity (seed 20260928, 6 fází, 18 členských běhů během T+01:16:10) a 102 družic systémů GPS, Galileo, BeiDou a GLONASS ze scénáře constellation-multi-gnss-coverage, každá vykreslená na kruhové dráze problému dvou těles získané z pozemní stopy enginu, s poloměry zmenšenými pro zobrazení. Časová chyba hodin vrcholí na 62.7 ns proti ochranné mezi 50 ns, hustota poměru nosné k šumu klesá na -12.2 dB-Hz proti spodní mezi 25 dB-Hz a vertikální ochranná úroveň dosahuje 135.4 m proti výstražné mezi 50 m." width="100%">
</picture>

<details>
<summary><strong>Obsah</strong></summary>

- [Nacvičte minutu, kdy GNSS zhasne](#rehearse-the-minute-gnss-goes-dark)
- [Co je nového v 0.40](#whats-new-in-040), [Co je nového v 0.39](#whats-new-in-039), [Co je nového v 0.38](#whats-new-in-038) a [0.38 podrobně](#038-in-depth): hodnocení Jammertest, vlastní příznaky přijímače, strojové vstupy, časování a holdover, balíčky norem, LunaNet AFS, laboratorní okruh tam a zpět, kshana-bench, observatoř, exportéry, optika, [navigace kosmických uživatelů](#space-user-navigation-gnss-ssv) a [lunární infrastruktura](#lunar-infrastructure-lunar-infrastructure)
- [Kshana Studio](#kshana-studio) a každá stránka Studia
- [Schopnosti](#capabilities): tabulka oblastí, [každý druh scénáře podle rodiny](#every-scenario-kind-by-family), [každý příkaz](#every-command), [každé rozhraní](#every-surface)
- [Jak probíhá běh](#how-a-run-works), [Mise](#missions)
- [Důkazy](#evidence): registr (ledger), [domény schopností](#capability-domains)
- [Instalace](#install), [Architektura](#architecture) (a [diagramy](#diagrams)), [AI asistent](#ai-assistant)
- [Edice](#editions), [Výzkum](#research), [Citace](#cite), [Licence](#licence)
- [Reference](#reference): použití, formát scénáře, výstup, struktura repozitáře, FAQ, řešení potíží, verzování, plán vývoje, přispívání, dokumentace

</details>

<a id="rehearse-the-minute-gnss-goes-dark"></a>
## Nacvičte minutu, kdy GNSS zhasne

Kshana přehrává rušení (jamming), podvrhování (spoofing) a holdover hodin, když selžou signály GNSS (Global Navigation Satellite
System, globální družicový navigační systém), a říká vám, jak dlouho systém udrží čas a polohu v rámci svého
rozpočtu a které hodiny nebo který senzor přinesou největší rezervu. Je to jeden engine v jazyce Rust. Běží v
terminálu, v notebooku, v IDE (integrované vývojové prostředí), v AI asistentovi (umělá
inteligence) nebo ve vašem prohlížeči.

Každý běh je bit po bitu reprodukovatelný ze scénáře, seedu a verze enginu.
Každá schopnost nese v strojově kontrolovaném registru (ledger) jedno ze tří označení: **VALIDATED** (souhlasí
nezávislé vnější orákulum), **MODELLED** (vnitřně konzistentní, a to otevřeně řečeno)
nebo **PARTNER** (vlastní ji hardwarový partner).

> **Stav: v0.40.0.** Ověřený, reprodukovatelný simulační substrát pro odolnost PNT.
> Časování a holdover jsou na prvním místě, protože tato doména je ověřena nejlépe. Kshana je
> nástroj pro studie a hledání kompromisů: není hardwarovým generátorem rádiového (RF) signálu (nebudí
> žádné rádio a nic nevysílá; jejím výstupem na úrovni signálu jsou soubory vzorků IQ v základním pásmu
> pro softwarové přijímače), není hardwarovým ani certifikovaným přijímačem GNSS (její softwarový přijímač
> je analytický nástroj) a není letovým produktem. Jste v oboru noví? Začněte
> [úvodem v běžném jazyce](docs/CONCEPTS.md) a [slovníkem pojmů](docs/GLOSSARY.md).

<a id="whats-new-in-040"></a>
## Co je nového v 0.40

0.40 přidává rozpočet chyb na úrovni mise, označuje každý obrázek a tabulku jeho úrovní důkazů, čte naměřené logy hodin,
kontroluje příspěvky datových partnerů, odhaduje, kde se může nacházet zdroj interference, a mluví sedmnácti jazyky vedle angličtiny.
Registr má nyní 401 řádků: 176 VALIDATED, 221 MODELLED, 4 PARTNER. Žádný řádek nebyl povýšen na VALIDATED a každé selhání níže je
zafixováno testem.

- **Misijní vlákno.** Druh `mission-thread` řetězí fáze od startu po vstup do atmosféry (`launch-ascent`, `leo-rendezvous`,
  `tli-and-cruise`, `entry` a čtyři lunární druhy) s uvedenými pravidly předávání, rezervou proti uvedeným požadavkům a nejslabším
  článkem; komplexní příklad třídy Artemis přes 11 fází (pozemský a lunární segment), celkem 92 druhů scénářů. Každé číslo je MODELLED. Šíření cislunární dráhy proti veřejné trajektorii Artemis I
  **nedosahuje** svého předregistrovaného prahu (45.3 km a 0.25 m/s proti 5 km a 0.05 m/s; příčinou jsou malé manévry, které model nezahrnuje), a lunární propagátor proti dráze CAPSTONE
  **nedosahuje** prahu (136.8 km proti 25 km na konci jednoho oběhu); srovnání s LRO je splněno. Řádky zůstávají MODELLED
  ([Misijní vlákno](docs/MISSION-THREAD.md), [lunární segment](docs/MISSION-THREAD-LUNAR.md)). Ve Studiu se vlákno čte na `/studio/mission-thread/`.
- **Označení důkazů.** Každý obrázek a tabulka, které běh zapíše, nesou úroveň důkazů a id řádků registru, o které se opírají, načtené z matice.
- **Naměřené hodiny.** Čte se osm formátů logů hodin ([`docs/CLOCK-LOG-FORMATS.md`](docs/CLOCK-LOG-FORMATS.md)) a proložená
  řada může řídit holdover. Proti předregistrovaným prahům proložení **nedosahuje** F1(a) u pěti ze šesti záznamů a F2 u jednoho; oba
  zůstávají MODELLED ([Seznam změn](CHANGELOG.md#0400---2026-10-29)).
- **Datoví partneři.** `kshana partner check` kontroluje formát příspěvku a nic neboduje ([`docs/PARTNER-DATA.md`](docs/PARTNER-DATA.md)).
- **Oblast zdroje.** `kshana interference-map locate` udává oblast a elipsu, nikdy holý bod, z hlášení ADS-B nebo AIS.
  Při jednom srovnání s místy vysílačů Jammertest 2025 je výsledek pro oba zdroje **NOT ASSESSABLE** (příliš málo
  plánovaných sezení v otevřených datech), takže řádek zůstává MODELLED ([Mapa interference](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate)).
- **Benchmark.** Nová kampaň 0.40 splňuje A3, D3 (obě EXPLORATORY), R3 a R4; A2, D1 a R1 zůstávají NOT MET ([Bench](docs/BENCH.md)).
- **Jazyky.** nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja a zh-Hans, jako **strojové překlady, které dosud nezkontroloval žádný rodilý
  mluvčí**; referenční je angličtina a běhy v jiném jazyce než angličtině trvají zhruba dvakrát déle
  ([`docs/i18n.md`](docs/i18n.md)).

<a id="whats-new-in-039"></a>
## Co je nového v 0.39

0.39 nepřidává žádnou funkci a nemění žádný výsledek; výstup enginu je výstupem 0.38. Opravuje jednu věc
na příkazovém řádku, aktualizuje závislosti nástrojů pro křížovou validaci a uvádí verdikty benchmarku
v plném znění.

- **Příkazový řádek.** `kshana kinds | head` (jakýkoli uzavřený standardní výstup) již nezpůsobí paniku: program skončí
  tiše se stavem 141, jak to dělají jiné nástroje při uzavřené rouře. Ostatní chyby zápisu se stále hlásí.
- **Závislosti.** `memmap2` 0.9.11 ve dvou zámcích křížové kontroly ANISE a `pillow` 13.0.0 a
  `certifi` 2026.10.19 v připnutých verzích prostředí orákula, vše pod `xval/`: nic z toho, co se dodává, se nezměnilo.
- **kshana-bench, všechny verdikty.** Proti předregistrovaným prahům jsou tři NOT MET, každý zafixovaný testem:
  A2 (`agc_k_sigma` AUC 0.766 proti nejméně 0.80), D1 (největší mezera 0.0301) a úloha (b) R1 (převzato,
  znovu nespuštěno). Žádný práh nebyl uvolněn ([Bench](docs/BENCH.md)).

<a id="whats-new-in-038"></a>
## Co je nového v 0.38

0.38 činí neutrálního rozhodčího měřitelným: boduje logy přijímačů proti zveřejněnému testovacímu
plánu, čte více přijímačů a senzorů, testuje časovací systémy a dodává benchmark a
observatoř interference. Zůstává poradní: nic zde není certifikováno, žádný výsledek není typovým schválením
a nic nevysílá. Každý řádek uvádí, co pro něj registr obsahuje ([jak se označení získává](#evidence));
stav jmenuje jen to, co bylo zkontrolováno, a řádek registru a odkazovaná stránka říkají, co ne.

| Nové v 0.38 | Co dělá a proč | Stav v registru | Čtení |
|---|---|---|---|
| **Hodnocení Jammertest** | `kshana jammertest import` čte zveřejněný katalog testů NPRA a plán vysílání jako plánovanou pravdu; `jammertest score` boduje log přijímače pro každý test (latence detekce, zmeškané poplachy, falešné poplachy, doba zotavení), jako podepsaný balíček důkazů, pokud dodáte klíč | **MODELLED**: jeden řádek registru. Prahy byly předregistrovány před jakýmkoli bodovaným během; na datech JammerTest 2024 pravidlo minimálních dat v obou bězích selhalo (4 a 7 bodovatelných oken proti 10 požadovaným), takže **žádný práh není posouditelný** a nic se netvrdí | [Jammertest](docs/JAMMERTEST.md) |
| **Vlastní příznaky přijímače** | UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG a NovAtel RXSTATUS načtené do `self_report` pro každou epochu a porovnané s poplachy Kshana (obojí, jen přijímač, jen Kshana, ani jedno); čtečka Septentrio SBF a vstup `--serial` jen pro čtení | **MODELLED**; shoda mezi detektorem přijímače a detektorem Kshana není validace | [Důvěra v přijímač](docs/RECEIVER-TRUST.md) |
| **Více přijímačů a senzorů** | RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0 (z tabulek pyrtcm pod licencí BSD, nikoli z textu RTCM), monitorovací proudy GNSS-SDR, log IMU jako druhý senzor, balíček ROS 2, most `gnss_lib_py` a `imu-fit` pro parametry hybridních senzorů | **MODELLED**: šest řádků registru; pouze vlastnoručně napsané testovací přípravky, nebyl načten žádný záznam ze skutečného přijímače, IMU, běhu GNSS-SDR ani grafu ROS | [Strojové vstupy](docs/MACHINE-INPUTS.md) |
| **Testy časování a holdoveru** | druh `holdover-test` boduje test holdoveru (GNSS odebráno operátorem, holdover, zotavení) z naměřeného záznamu časové chyby proti maskám ITU-T, „měřeno proti masce“; čtečky logů linuxptp a chrony; hardwarové stupně a pole `lab-attestation` | **MODELLED**: dva řádky registru; časy jsou prohlášením operátora, neověřené | [Timing HIL](docs/TIMING-HIL.md), [Bezpečnost hardwaru](docs/HARDWARE-SAFETY.md) |
| **Balíčky norem, LunaNet AFS, laboratorní okruh** | bodované balíčky pro DHS RPCF, IMO MSC.1/Circ.1575 a ICAO Doc 9849 Appendix F proti prahům uvedeným před během, „podporuje důkazy pro“; převodní tabulka NIST IR 8323r1; generátor a kontrola kódů LunaNet AFS; podepsaný balíček, který propojuje scénář laboratorního běhu, testovací podmínky, log přijímače a skóre | **MODELLED** pro balíčky a okruh; kontrola kódů AFS je **VALIDATED** proti svým tištěným kontrolním sloupcům (viz řádky registru) | [Normy](docs/STANDARDS.md), [LunaNet AFS](docs/LUNANET-AFS.md) |
| **kshana-bench a observatoř** | pevné úlohy, rozdělení a metriky pro detekci interference, detekci v IQ, predikci holdoveru a mezeru optimismu, se zapečetěnou holdout sadou a statickým žebříčkem; reprodukovatelný denní produkt o interferenci se zpožděním 24 h, hrubými buňkami a bez přisuzování | nemá vlastní řádek registru: boduje příspěvky a jeho základy jsou ve výsledkových souborech označeny MODELLED; proti předregistrovaným prahům jsou bodovač, C1 až C3 a D2 splněny a tři prahy jsou **NOT MET** (zafixováno testy): A2 (`agc_k_sigma` AUC 0.766 proti nejméně 0.80 na testovacím rozdělení), D1 (největší mezera 0.0301) a úloha (b) R1 (převzato, znovu nespuštěno); viz `xval/bench/RESULTS-v2.md` | [Bench](docs/BENCH.md), [Observatoř](docs/observatory/METHOD.md) |
| **Exportéry** | telemetrie důvěry jako zprávy MQTT discovery a stavu pro Home Assistant (pouze publikace, žádné přihlašovací údaje) vedle Prometheus, CEF, LEEF a OTLP | **MODELLED**: jeden řádek registru | [Telemetrie důvěry](docs/TRUST-TELEMETRY.md) |
| **Rezerva optického spoje v čase** | druh `optical-atmosphere` umí zapsat jednu realizaci počasí lokality se seedem jako řadu rezerv spoje | **MODELLED**: jeden řádek registru; jedno losování z modelu, nikoli klima | [Optická atmosféra](docs/OPTICAL-ATMOSPHERE.md) |

Hlavní body 0.37: [seznam změn](CHANGELOG.md#0370---2026-10-17). Úplný seznam 0.38 je v
[seznamu změn](CHANGELOG.md#0380---2026-10-19).

<a id="038-in-depth"></a>
## 0.38 podrobně

Každá schopnost z tabulky výše v několika řádcích: co dělá, jeden příkaz k jejímu spuštění, jeden
obrázek vykreslený ze skutečného běhu enginu a co pro ni obsahuje registr. Obrázky
zapisuje [`tools/gen_figures_038.py`](tools/gen_figures_038.py) do
[`docs/figures/0.38/`](docs/figures/0.38/) (nikdy nejsou kresleny ručně): `python3 tools/gen_figures_038.py`
je přepíše ze sestaveného enginu a `--check` selže, pokud je některý zastaralý nebo se jeho popisek zde liší.
Kde je vstupem log, jde o vymyšlený log, který skript zapíše, protože skutečné logy třetích stran
se nikdy nepřibalují, a popisek to uvádí. Vše níže má poradní charakter: není certifikováno, není to
typové schválení a nic nevysílá. Stav jmenuje to, co bylo zkontrolováno, a nic víc;
[jak se označení získává](#evidence).

### Hodnocení Jammertest

`kshana jammertest import` převádí zveřejněný katalog testů NPRA a plán vysílání na
plánovanou pravdu a `kshana jammertest score` proti ní boduje log přijímače: pro každý
plánovaný test, zda byl detekován, s jakým zpožděním a jak dlouho trvalo zotavení přijímače, a navíc
falešné poplachy mimo všechny sloty. Katalog se stahuje, nikdy se nepřibaluje.

```sh
xval/jammertest-plan/fetch.sh ../jammertest-plan
kshana jammertest score session.toml --catalog ../jammertest-plan/testcatalog2025.json \
    --plan ../jammertest-plan/plan-tuesday-2025-09-16.json --location 1 --json
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/jammertest-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/jammertest-light.svg">
  <img src="docs/figures/0.38/jammertest-light.svg" alt="Bodování jednoho syntetického logu přijímače proti plánu tří testů, ze skutečného běhu enginu v0.40.0 (`kshana jammertest score`). Log je vymyšlený: 1800 s NMEA s poklesem C/N0 o 20 dB ve dvou intervalech. Plán uvádí tři sloty; prostřední slot nemá v logu žádnou rušičku. Skóre označuje 2 ze 3 testů jako detekované (mediánová latence 0 s) a 1 jako zmeškaný, s 0 sériemi falešných poplachů za 0.25 h čistého času. Nic zde neříká nic o skutečném přijímači. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC 61108, IEC 61162): za navigaci plavidla zůstává odpovědný provozovatel.">
</picture>

**Stav v registru: MODELLED.** Prahy byly stanoveny před jakýmkoli bodovaným během; na datech JammerTest 2024
pravidlo minimálních dat v obou bězích selhalo, takže žádný práh není posouditelný a nic se netvrdí.
[Jammertest](docs/JAMMERTEST.md).

### Vlastní příznaky přijímače

UBX-NAV-STATUS `spoofDetState`, UBX-SEC-SIG a NovAtel RXSTATUS se načítají do `self_report` pro každou
epochu a kladou se vedle poplachů Kshana: obojí, jen přijímač, jen Kshana, nebo ani jedno.
Čtečka Septentrio SBF a vstup `--serial` jen pro čtení napájejí totéž srovnání. Žádná ze stran není
základní pravda.

```sh
kshana receiver-trust session.toml     # [log] format = "ubx", path = "receiver.ubx"
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/receiver-flags-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/receiver-flags-light.svg">
  <img src="docs/figures/0.38/receiver-flags-light.svg" alt="Vlastní příznak spoofingu přijímače postavený proti poplachům Kshana, ze skutečného běhu enginu v0.40.0 na vymyšleném logu UBX (200 epoch při 1 Hz). C/N0 klesá o 20 dB v 80 až 90 s a 120 až 130 s; přijímač hlásí příznak v 120 až 130 s a 160 až 165 s. Ze 140 epoch porovnaných po kalibraci mělo 11 příznak u obou, 6 jen u přijímače, 11 jen u Kshana a 112 u žádného. Žádná ze stran není základní pravda a shoda není validace. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

**Stav v registru: MODELLED.** Shoda mezi detektorem přijímače a detektorem Kshana není
validace. [Důvěra v přijímač](docs/RECEIVER-TRUST.md).

### Více přijímačů a senzorů

RTKLIB `.pos`, NovAtel OEM7, RTCM 3 MSM4/MSM7 C/N0, monitorovací proudy GNSS-SDR, log IMU jako druhý
senzor, balíček ROS 2 a most `gnss_lib_py` končí všechny ve stejné časové ose důvěry v přijímač.
`imu-fit` čte parametry senzoru, které hybridní a fúzní scénáře potřebují, ze stacionárního logu IMU,
takže scénář lze spustit se senzorem, který skutečně máte.

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/machine-inputs-light.svg">
  <img src="docs/figures/0.38/machine-inputs-light.svg" alt="Co `kshana imu-fit` čte ze stacionárního logu IMU, ze skutečného běhu enginu v0.40.0 na vymyšleném logu (20,000 vzorků při 100 Hz, 200 s): náhodná procházka rychlosti akcelerometru q_va = 4.02e-06, náhodná procházka úhlu gyroskopu q_arw = 9e-08, nestabilita biasu 0.00296 a počáteční Allanovy sklony (-0.51 a -0.49; zhruba -0.5 tam, kde převládá bílý šum). Tabulka vedle je TOML, který příkaz vypíše. Odhadovač je kontrolován pouze na syntetických lozích. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

**Stav v registru: MODELLED.** Pouze vlastnoručně napsané testovací přípravky; nebyl načten žádný záznam ze skutečného přijímače, IMU,
běhu GNSS-SDR ani grafu ROS. [Strojové vstupy](docs/MACHINE-INPUTS.md).

### Testy časování a holdoveru

Druh `holdover-test` boduje test holdoveru (GNSS odebráno operátorem, holdover, zotavení)
z naměřeného záznamu časové chyby proti maskám ITU-T a říká to právě těmito slovy: měřeno
proti masce. Napájejí ho čtečky logů linuxptp a chrony; hardwarové stupně a pole
`lab-attestation` říkají, kdo co uvedl.

```sh
kshana scenarios/holdover-test-example.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/timing-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/timing-light.svg">
  <img src="docs/figures/0.38/timing-light.svg" alt="Test holdoveru bodovaný ze záznamu časové chyby, ze skutečného běhu enginu v0.40.0 na scenarios/holdover-test-example.toml (601 vzorků každých 5 s). GNSS je operátorem odebráno v 600 s a obnoveno ve 2400 s; časová chyba se na konci holdoveru odchýlí na 299 ns, rozpočet 100 ns překročí po 675 s a do pásma 100 ns se vrátí 70 s po obnovení. Verdikty: masky základu PASS, masky holdoveru FAIL, obálka holdoveru FAIL, zotavení RECOVERED. Měřeno proti masce, nikoli schválení. Časy jsou prohlášením operátora, Kshana je neověřuje. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

**Stav v registru: MODELLED.** Časy, kdy bylo GNSS odebráno a obnoveno, jsou prohlášením operátora,
neověřené. [Timing HIL](docs/TIMING-HIL.md), [Bezpečnost hardwaru](docs/HARDWARE-SAFETY.md).

### Balíčky norem

Bodované balíčky pro testovací profily DHS Resilient PNT, IMO MSC.1/Circ.1575 a ICAO Doc 9849
Appendix F, plus převodní tabulka NIST IR 8323r1 v `compliance-report`. Každý test spustí přibalený
scénář a porovná pole výsledku s prahem uvedeným před během; test, který potřebuje log přijímače,
je uveden jako vyžadující vstup, nikoli bodován. Formulace zní „podporuje důkazy pro“.

```sh
kshana standards-pack list
kshana standards-pack run imo-circ-1575
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/standards-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/standards-light.svg">
  <img src="docs/figures/0.38/standards-light.svg" alt="Každý test tří bodovaných balíčků norem, ze skutečných běhů enginu v0.40.0 (`kshana standards-pack run`): dhs-rpcf: 6 splněno, 1 nesplněno, 2 potřebují vstup; imo-circ-1575: 1 splněno, 4 nesplněny, 2 potřebují vstup; icao-doc9849-appf: 6 splněno, 0 nesplněno, 2 potřebují vstup. Celkem 13 splněno, 5 nesplněno a 6 potřebuje vstup, který engine nemá (log přijímače nebo dokumentaci zařízení). Každý práh byl uveden před během; nesplnění se ponechává jako nesplnění. Splněný práh říká, že modelovaný scénář splnil uvedený práh, nic o produktu. Balíčky podporují důkazy pro řádky, které citují; nejsou posouzením. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life); nesmí být jediným podkladem pro žádné navigační ani bezpečnostní rozhodnutí.">
</picture>

**Stav v registru: MODELLED.** Splněný práh říká, že modelovaný scénář splnil uvedený práh, nic o
produktu; každé nesplnění se ponechává a je zafixováno testem. [Normy](docs/STANDARDS.md).

### LunaNet AFS

Generátor kódů LunaNet Augmented Forward Signal (Goldovy, Weilovy a terciární kódy, rámec
zprávy a jeho chybové kódování) a kontrola zaznamenaného nebo vygenerovaného proudu symbolů, připnuté k jednomu
vydání specifikace.

```sh
kshana lunanet-afs-check spec
kshana lunanet-afs-check generate --frames 2 --out afs.sym
kshana lunanet-afs-check symbols afs.sym
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunanet-afs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunanet-afs-light.svg">
  <img src="docs/figures/0.38/lunanet-afs-light.svg" alt="Generátor kódů LunaNet AFS zkontrolovaný proti tištěným sloupcům specifikace, ze skutečného běhu enginu v0.40.0 (`kshana lunanet-afs-check spec`, připnuto k LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29. ledna 2025; dokument označuje své tabulky kódů {LSIS-TBC}). 9 z 10 kontrol je splněno; B4 je NOT MET (420 ze 421 shodných). Kontroluje proud symbolů proti jednomu vydání zveřejněné specifikace a neříká nic o žádném uzlu ani službě LunaNet. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life). Kontroluje proud symbolů proti jednomu vydání zveřejněné specifikace a neříká nic o žádném uzlu ani službě LunaNet.">
</picture>

**Stav v registru: VALIDATED** pro kontroly kódů a synchronizace, proti hodnotám, které
specifikace tiskne (a které označuje TBC); jedna kontrola je NOT MET, ponechaná a zafixovaná (jeden tištěný
sloupec terciárního kódu se liší: dokument tiskne stejnou hodnotu pro dvě PRN). Slova LDPC a CRC
podrámců 2 až 4 se nekontrolují. Řádky registru přesně uvádějí které. [LunaNet AFS](docs/LUNANET-AFS.md).

### Laboratorní okruh tam a zpět

`kshana.test-conditions/1` je zveřejněný popis toho, co laboratoř provedla (události, časy,
výkony). `kshana evidence round-trip` propojuje haš scénáře, haš podmínek, haš logu přijímače
a skóre do jednoho podepsaného balíčku a odmítne balíček, jehož podmínky a bodovací scénář
se neshodují v událostech. Kshana nikdy nevytváří ani nepřehrává signál: jak se scénář dostal k
přijímači, je odpovědností operátora.

```sh
kshana evidence --help
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Struktura balíčku důkazů. Log přijímače (NMEA, u-blox UBX, RINEX 3 nebo log Androidu) a časové okno vstupují do kshana receiver-trust evidence, který zapíše sedm souborů: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig a volitelný timestamp.tsr. Manifest zaznamenává SHA-256 celého logu a každého souboru a hašovací řetězec přes soubory; podpis pokrývá manifest. kshana evidence verify kontroluje podpis, haš každého souboru, řetězec a to, že není přítomen žádný neuvedený soubor, a končí s kódem 0 při ověření, 1 když něco selhalo a 3 když podepisující nebyl připnut. Balíček je technický záznam, nikoli právní stanovisko.">
</picture>

Obrázek ukazuje uspořádání balíčku. **Stav v registru: MODELLED.**
[Testovací podmínky](docs/spec/TEST-CONDITIONS.md), [Testovací pracoviště](docs/TEST-BENCH.md).

### kshana-bench

Pevné úlohy, rozdělení a metriky pro detekci interference, detekci v IQ, predikci holdoveru a
mezeru optimismu, se zapečetěnou holdout sadou a statickým žebříčkem. Boduje příspěvky; není to
žebříček přijímačů.

```sh
kshana bench baseline --task d --split test --out results/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/bench-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/bench-light.svg">
  <img src="docs/figures/0.38/bench-light.svg" alt="Vestavěné základy úlohy D kshana-bench (mezera optimismu) na testovacím rozdělení, ze skutečného běhu enginu v0.40.0 (`kshana bench baseline`). Každá dvojice sloupců je plocha pod křivkou ROC na případech uvnitř rozdělení a na posunutých případech; rozdíl mezi nimi je mezera optimismu, proti toleranci 0.05. fused-max-z: 0.998 a 0.983 (mezera 0.015); sqm-imbalance: 0.882 a 0.882 (mezera 0.001); agc-excess: 0.848 a 0.819 (mezera 0.030); raim-parity: 0.682 a 0.672 (mezera 0.010); energy-cn0-drop: 0.595 a 0.565 (mezera 0.030). Štítky jsou štítky generativního modelu syntetického korpusu, nikdy terénní data: MODELLED. Pouze poradní charakter: modelováno nebo měřeno proti uvedeným referencím, nikoli schválení, certifikace ani prohlášení o shodě. Skóre popisuje log nebo korpus, nikdy produkt.">
</picture>

**Stav v registru:** žádný vlastní řádek registru; základy jsou ve výsledkových souborech označeny MODELLED.
Proti předregistrovaným prahům jsou bodovač, C1 až C3 a D2 splněny a tři prahy jsou NOT MET, každý
zafixovaný testem: A2 (`agc_k_sigma` AUC 0.766 proti nejméně 0.80 na testovacím rozdělení), D1 (největší mezera
0.0301) a úloha (b) R1 (převzato z dřívější kampaně, znovu nespuštěno). Čísla jsou v
[`xval/bench/RESULTS-v2.md`](xval/bench/RESULTS-v2.md). [Bench](docs/BENCH.md).

### Observatoř interference

Jeden produkt na den UTC a oblast z otevřeného archivu poloh letadel, na pevné hrubé mřížce:
každá buňka je degradovaná, nedegradovaná, nebo nepozorovaná (což neznamená „čistá“). Zveřejňuje se nejdříve
24 h po skončení dne, s potlačenými malými buňkami a bez přisuzování příčiny.

```sh
kshana interference-map daily /path/to/extracted/2026-09-15 \
    --dataset adsb-lol --day 2026-09-15 --bbox 53.5,9.0,66.0,31.0 --out products/
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dva syntetické dny mapy interference vykreslené z uložených vzorků v examples/interference-map/output, každý s vlastní syntetickou trasou a podíly expozice trasy, které engine hlásí. Vlevo den ADS-B: 1 degradovaná buňka, 6 nedegradovaných, 4 neposouzené (šrafované) a buňky bez záznamu, vykreslené prázdné, které nebyly pozorovány. Trasa má 525 km: 11.5% její délky v degradovaných buňkách, 38.3% nedegradovaných, 9.1% neposouzených a 41.1% nepozorovaných. Vpravo den AIS: buňky označené detektory kruhu a polohy na pevnině, neanomální buňky a prázdné buňky; trasa má 454 km, z toho 10.5% v anomálních buňkách, 21.2% neanomálních, 0.0% neposouzených a 68.3% nepozorovaných. ADS-B a AIS jsou samostatné vrstvy, nikdy se nekombinují. Označená buňka není zjištěním interference a buňka bez barvy nebyla pozorována, což není totéž co čistá. Všechna data jsou vymyšlená, na otevřeném středním Atlantiku, a nejde o měření.">
</picture>

Obrázek ukazuje uložené vzorové dny, nikoli produkt observatoře. **Stav v registru: MODELLED**:
žádné vnější orákulum, žádná základní pravda a žádné přisuzování příčiny; buňka, která není pozorována, nebyla
posouzena, což není totéž co čistá. [Metoda observatoře](docs/observatory/METHOD.md).

### Exportéry

Telemetrie důvěry jako text Prometheus, CEF, LEEF, OTLP a zprávy MQTT discovery a stavu
pro Home Assistant. Příkaz publikuje pouze do cíle, který mu zadáte, a neuchovává žádné přihlašovací údaje.

```sh
kshana trust-telemetry --result session.result.json --print-metrics
kshana trust-telemetry --result session.result.json --print-syslog --format cef
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/exporters-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/exporters-light.svg">
  <img src="docs/figures/0.38/exporters-light.svg" alt="Jeden výsledek důvěry ve třech exportních formátech, ze skutečných běhů enginu v0.40.0 (`kshana trust-telemetry`) na examples/maritime-trust: textová expozice Prometheus (poslední skóre důvěryhodnosti je 5.9 a nastavené je pásmo nedůvěryhodné) a poslední zprávy CEF a LEEF. Příkaz nic nepublikuje, pokud nedostane cíl, neuchovává žádné přihlašovací údaje a nevysílá žádný rádiový signál. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC 61108, IEC 61162): za navigaci plavidla zůstává odpovědný provozovatel.">
</picture>

**Stav v registru: MODELLED.** [Telemetrie důvěry](docs/TRUST-TELEMETRY.md).

### Rezerva optického spoje v čase

Druh `optical-atmosphere` umí zapsat jednu realizaci počasí lokality se seedem jako řadu rezerv
spoje: epizody oblačnosti, sloupec kapalné vody pro každou z nich, jeden vzorek scintilace na krok.
Stránka Optical PNT ve Studiu otevírá scénáře optical-atmosphere.

```sh
kshana scenarios/optical-atmosphere-network.toml
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/optical-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/optical-light.svg">
  <img src="docs/figures/0.38/optical-light.svg" alt="Jedna realizace rezervy spoje lokality 'northern' se seedem během 336 h, ze skutečného běhu enginu v0.40.0 na scenarios/optical-atmosphere-network.toml (seed 37, krok 600 s). Rezerva klesá pod nulu během epizod oblačnosti; v tomto losování je spoj v provozu 40.5 % času, s 27 výpadky a nejdelším výpadkem 30.7 h. Vstupy jsou ilustrativní, řada je jedním losováním z modelu, nikoli klimatem, a od statistické dostupnosti (37.8 %) se liší o výběrovou chybu losování. Pouze poradní analýza: nejde o certifikovaný produkt dostupnosti, integrity ani navigace a nejde o předpověď pro žádnou skutečnou lokalitu, pokud její klimatické vstupy nepocházejí z uvedené datové sady.">
</picture>

**Stav v registru: MODELLED.** Jedno losování z modelu, nikoli klima. [Optická atmosféra](docs/OPTICAL-ATMOSPHERE.md).

### Nová zobrazení ve Studiu

[kshana.dev/studio](https://kshana.dev/studio/) získává přehrávání Bridge (dva běhy vedle sebe na jednom
misijním čase, na [`/studio/replay/`](https://kshana.dev/studio/replay/)), stránku Optical PNT
(`/studio/optical/`), stránku testu holdoveru (`/studio/holdover/`) a prohlížeč observatoře
(`/studio/observatory/`). Spouštějí stejný engine v prohlížeči, nic se nenahrává a nesou
stejné poradní prohlášení. Obrázky výše vykresluje skript z vlastního výstupu enginu;
nejsou to snímky obrazovky těchto stránek.

<a id="space-user-navigation-gnss-ssv"></a>
### Navigace kosmických uživatelů (`gnss-ssv`)

Pro kosmickou loď nad drahami GNSS, kolem nich nebo daleko za nimi: kolik signálů GNSS může využít, jak
silné jsou, jak dobrá je geometrie a co s nimi dokáže palubní filtr. Jeden druh,
čtyři režimy, volené tabulkami scénáře: **shell** (slupka) uživatelů (podíl času s jedním a čtyřmi
signály, pro každou konstelaci), **trajectory** (trajektorie: signály, C/N0, snížení přesnosti a
prostředí paprsků u okraje Země podél dráhy), běh **navigation** (navigace: devítistavový filtr na pseudovzdálenostech, až k
Měsíci) a **formation** (formace: relativní navigace podřízených lodí kolem hlavní). Veřejným zdrojem pro
srovnání dostupnosti je brožura o interoperabilním objemu kosmické služby GNSS (Space Service Volume, UN OOSA
ST/SPACE/75, od International Committee on GNSS), která je sama simulací; stahuje se, nikdy se
nepřibaluje. Celá stránka: [docs/SSV.md](docs/SSV.md).

```sh
kshana scenarios/gnss-ssv-shell.toml            # shell: the upper space service volume, reduced size
kshana scenarios/gnss-ssv-heo.toml              # trajectory: a high Earth orbit, limb medium
kshana scenarios/gnss-ssv-nav-lunar.toml        # navigation: an onboard filter toward the Moon
kshana scenarios/gnss-ssv-formation-heo.toml    # formation: relative navigation
```

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-shell-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-shell-light.svg">
  <img src="docs/figures/0.38/ssv-shell-light.svg" alt="Dostupnost signálu pro uživatele na sféře ve výšce 36000 km s polokulovou anténou, ze skutečného běhu enginu v0.40.0 na scenarios/gnss-ssv-shell.toml (zmenšený běh: 162 uživatelů, 3 dny, kroky 10 min), při prahu 20 dB-Hz. Pro každou konstelaci a pásmo dva sloupce: podíl dvojic (uživatel, epocha) s alespoň jedním signálem a s alespoň čtyřmi. Kombinovaně, L1: 99.4 % alespoň jeden, 73.2 % alespoň čtyři, nejdelší výpadek pod čtyřmi signály 160 min. Kombinovaně, L5: 100.0 % alespoň jeden, 99.9 % alespoň čtyři, nejdelší výpadek pod čtyřmi signály 20 min. MODELLED: modelovaná studie z uvedených vstupů, nikoli měření a nikoli tvrzení o objemu služby pro jakýkoli systém. Zmenšená velikost není srovnáním s brožurou. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-heo-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-heo-light.svg">
  <img src="docs/figures/0.38/ssv-heo-light.svg" alt="Signály podél jedné vysoké oběžné dráhy Země (perigeum 497 km, apogeum 58622 km, perioda 18.8 h), ze skutečného běhu enginu v0.40.0 na scenarios/gnss-ssv-heo.toml, pásmo L1. Nahoře: nejlepší hustota poměru nosné k šumu mezi viditelnými signály, proti prahu 20 dB-Hz. Uprostřed: počet viditelných signálů ze všech konstelací, od 4 do 55 podél vzorkovaných bodů. Z přijatých spojů jich 2252 přišlo hlavním lalokem a 696 postranními laloky, s použitím označeného parametrického náhradního diagramu, nikoli naměřeného diagramu žádného systému. Mediánové PDOP 67, 95. percentil 358. MODELLED: modelovaná studie z uvedených vstupů, nikoli měření a nikoli tvrzení o objemu služby pro jakýkoli systém. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-nav-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-nav-light.svg">
  <img src="docs/figures/0.38/ssv-nav-light.svg" alt="Palubní devítistavový filtr na přeletu z nízké dráhy směrem k Měsíci, ze skutečného běhu enginu v0.40.0 na scenarios/gnss-ssv-nav-lunar.toml (289 epoch, vykresleno 13 bodů). Na logaritmické ose skutečná chyba polohy a vlastní jednosigmová mez filtru v závislosti na čase od začátku. Uvnitř drah GNSS je RMS polohy 1.4 m; nad nimi je 90 m, s konečnou chybou 184 m ve výšce 193,330 km s 1 měřením. Střední normalizovaná kvadratická chyba odhadu za celý běh je 4.4 (zhruba 3 pro konzistentní blok polohy). Pravda i filtr sdílejí své náhrady Slunce a Měsíce. MODELLED: modelovaná studie z uvedených vstupů, nikoli měření a nikoli tvrzení o objemu služby pro jakýkoli systém. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-formation-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-formation-light.svg">
  <img src="docs/figures/0.38/ssv-formation-light.svg" alt="Relativní navigace 2 podřízených lodí kolem hlavní na vysoké dráze, ze skutečného běhu enginu v0.40.0 na scenarios/gnss-ssv-formation-heo.toml (401 epoch). Pro každou podřízenou loď dva sloupce: RMS relativní polohy z odečtení dvou nezávislých absolutních odhadů a z relativního filtru na jednoduše diferencovaných pseudovzdálenostech. Základna 0.8 km: 5.1 m a 1.2 m. Základna 2.0 km: 4.1 m a 2.1 m. Absolutní filtr zde není konzistentní: střední normalizovaná kvadratická chyba odhadu 187 proti zhruba 3 pro konzistentní filtr, takže jeho uváděná nejistota je příliš malá. MODELLED: modelovaná studie z uvedených vstupů, nikoli měření a nikoli tvrzení o objemu služby pro jakýkoli systém. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

**Stav v registru: MODELLED a srovnání s brožurou většinou nedosahuje prahů.** Prahy byly stanoveny před
během. Z osmi jsou splněny jen S0 (inverzní rozpočet spoje, 13 ze 13 hodnot) a S6 (lunární mise).
**S1 až S5 a S7 jsou NOT MET**: geometrie horního a dolního objemu služby (43 z 52 a 48 z 52
buněk), horní objem služby při 15/20/25 dB-Hz, šest misí GEO, mise HEO a
parametrický diagram postranních laloků proti naměřeným diagramům panelů GPS. Téměř každé nesplnění v S1 až S5 se týká
GLONASS a brožura pro něj tiskne dva různé referenční úhly; diagnostická varianta, která používá
druhou dvojici, dovede S1, S2 a S4 ke každé buňce, ale nenahrazuje oficiální běh a žádný řádek není
VALIDATED. Absolutní filtr formačního běhu je navíc příliš sebejistý (střední normalizovaná kvadratická chyba
výrazně nad hodnotou zhruba 3, kterou dává konzistentní filtr).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/ssv-booklet-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/ssv-booklet-light.svg">
  <img src="docs/figures/0.38/ssv-booklet-light.svg" alt="Zaznamenané srovnání modelu dostupnosti pro kosmické uživatele s veřejnou brožurou Space Service Volume, z uložených výsledků předregistrovaného běhu (xval/gnss-ssv/results-run1.json, zapsáno příkladem ssv_booklet_check enginu v0.40.0). Sloupec po sloupci buňky v toleranci: S0 13 ze 13 (MET); S1 43 z 52 (NOT MET); S2 48 z 52 (NOT MET); S3 122 ze 155 (NOT MET); S4 132 ze 156 (NOT MET); S5 18 z 26 (NOT MET); S6 26 z 26 (MET); S7 0 z 20 diagramů panelů (NOT MET). Při předregistrovaném čtení jsou splněny jen S0 a S6. Diagnostická varianta, která používá jiné úhly GLONASS z brožury, dovede S1, S2 a S4 ke každé buňce, ale nenahrazuje oficiální běh. Žádný řádek registru není VALIDATED. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

[Navigace kosmických uživatelů](docs/SSV.md), [co srovnání ukazuje](docs/SSV.md#what-the-comparison-with-the-booklet-shows).

<a id="lunar-infrastructure-lunar-infrastructure"></a>
### Lunární infrastruktura (`lunar-infrastructure`)

Oběžná dráha a povrch Měsíce jako navigační a geodetická infrastruktura, v pěti studiích volených pomocí
`study`: **od-consistency** (palubní určování oběžné dráhy z pozemského GNSS na halo dráze proti
nezávislému pozemnímu), **carrier-phase** (fixace celočíselné nejednoznačnosti mezi povrchovými stanicemi a
orbiterem), **frame-coestimation** (lunární datum z měření vzdálenosti pozemními stanicemi s orbiterovými spoji a bez
nich), **space-tie** (offsety laseru, VLBI a GNSS na jedné kosmické lodi proti chybě lokální vazby) a
**geodesy-sensitivity** (která rodina pozorování vidí Loveova čísla h2, k2 a l2). Model je
omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy. Celá stránka:
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
  <img src="docs/figures/0.38/lunar-od-light.svg" alt="Konzistence palubního určování oběžné dráhy z pozemského GNSS na téměř přímočaré halo dráze s nezávislým pozemním určováním oběžné dráhy, ze skutečných běhů enginu v0.40.0 na scenarios/lunar-infrastructure-od-consistency.toml a varianty s chybou modelu (každý 400 pokusů). Střední normalizovaný rozdíl q je 5.81 bez chyby modelu a 5.95 s vnesenou chybou zrychlení 3e-10 m/s2, proti očekávaným 6: obě řešení dráhy jsou konzistentní (práh C1 MET). Podíl pokusů nad bodem 95 % je 0.040 a 0.052; práh pro detekci vnesené chyby byl alespoň 0.5, takže je NOT MET (C3): palubní řešení je známo zhruba na 352 m proti 23 m u pozemního, takže posun o deset metrů se skryje v jeho kovarianci. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-carrier-light.svg">
  <img src="docs/figures/0.38/lunar-carrier-light.svg" alt="Fixace celočíselné nejednoznačnosti fáze nosné mezi lunárními povrchovými stanicemi a orbiterem, z uloženého výsledku bodovaného běhu enginu v0.40.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 délky oblouku, Monte Carlo po 401 losováních, zapsáno scénářem scenarios/carrier-phase-scored.toml). 1 den: úspěšnost 1.0 % (směrodatná chyba 0.5 %), 134 nejednoznačností, sigma polohy orbiteru 45.6 m plovoucí a 18.5 m fixovaná; 2 dny: úspěšnost 0.5 % (směrodatná chyba 0.4 %), 259 nejednoznačností, sigma polohy orbiteru 21.5 m plovoucí a 8.7 m fixovaná; 3 dny: úspěšnost 2.8 % (směrodatná chyba 0.8 %), 375 nejednoznačností, sigma polohy orbiteru 6.3 m plovoucí a 2.1 m fixovaná. Celočíselné fixace se nedosahuje: úspěšnost zůstává mezi 1 % a 3 % při 25 dBi a při registrovaných 12 dBi nelze úlohu sestavit. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-frame-light.svg">
  <img src="docs/figures/0.38/lunar-frame-light.svg" alt="Přesnost sedmiparametrového lunárního datumu (tři posuny, měřítko a tři rotace) z měření vzdálenosti pozemními stanicemi, s měřeními vzdálenosti mezi orbiterem a povrchovými stanicemi a bez nich, ze skutečného běhu enginu v0.40.0 na scenarios/lunar-infrastructure-frame-coestimation.toml. Cramérova-Raova sigma posunů a rotací s orbiterovými spoji klesá (například t_z z 0.98 m na 0.046 m); nejmenší vlastní číslo informační matice vzroste 111krát a stopa CRLB klesne na 1.0 % (práh F3 MET). Předpokládá se, že dráha je známa v lunárních osách a její chybu nese sigma vzdálenosti orbiteru 1 m. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-tie-light.svg">
  <img src="docs/figures/0.38/lunar-tie-light.svg" alt="Přesnost offsetů mezi polohami z laserového měření vzdálenosti, VLBI a GNSS jedné kosmické lodi, proti chybě pozemní lokální vazby, ze skutečného běhu enginu v0.40.0 na scenarios/lunar-infrastructure-space-tie.toml (jeden oblouk 6.56 dne, sigmy technik GNSS 10 m, VLBI 1 m, laser 0.1 m). S lokální vazbou od 1 mm do 1 m zůstává sigma posunu laser minus GNSS kolem 1.04 m, dokud vazba nedosáhne 1 m: je omezena šumem měření technik, nikoli lokální vazbou. Spodní mez daná samotnou vazbou je odmocnina ze dvou krát její sigma. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/figures/0.38/lunar-geodesy-light.svg">
  <img src="docs/figures/0.38/lunar-geodesy-light.svg" alt="Která rodina pozorování je citlivá na lunární Loveova čísla h2, k2 a l2, ze skutečného běhu enginu v0.40.0 na scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Každá buňka je RMS parciální derivace pozorování dané rodiny podle parametru, ve vlastních jednotkách této rodiny (buňky se tedy porovnávají v rámci řádku, ne sloupce); pomlčka znamená, že rodina nemá žádnou citlivost. laserové měření vzdálenosti: h2 7.6, k2 žádná, l2 9.8. sledování orbiteru: h2 žádná, k2 0.00086, l2 žádná. povrchový gravimetr: h2 2.9e+03, k2 4.3e+03, l2 žádná. povrchové hodiny: h2 2.8e-17, k2 2.8e-17, l2 žádná. Se všemi čtyřmi rodinami je Cramérova-Raova sigma 0.36 % nominálního h2, 0.52 % k2 a 1.16 % l2. Přidání rodiny nikdy nesnížilo nejmenší vlastní číslo (28 z 28 přidání), ale stopa pseudoinverze nebyla větší jen v 16 z 28: tato polovina prahu G3 je NOT MET. Rodina orbiteru vidí integrál zrychlení k2 podél směru pohledu, což je údaj z horní části rozsahu. MODELLED: omezený model tří těles s uvedenými zjednodušeními a ilustrativními vstupy, nikoli měření žádné lunární veličiny. Pouze poradní charakter: analytický výstup výzkumného a inženýrského nástroje, nikoli typově schválené navigační zařízení a nikoli služba pro bezpečnost života (safety-of-life).">
</picture>

**Stav v registru: MODELLED a tři prahy jsou NOT MET.** Numerika je kontrolována proti nezávislým
programům v numpy a scipy; nic se neporovnává s měřením lunární veličiny a nic není
VALIDATED. Splněno: obě řešení dráhy jsou konzistentní (střední q 5.81 proti očekávaným 6) a orbiterové
spoje zvyšují nejmenší vlastní číslo datumu zhruba 111krát, za předpokladu známé dráhy. **Nesplněno**:
vnesená chyba modelu 3e-10 m/s2 **není detekována** (C3: palubní řešení je známo zhruba na 350 m, takže
zhruba deset metrů se skryje v jeho kovarianci); **celočíselné fixace se nedosahuje** (úspěšnost 1 až 3 % při
25 dBi a při registrovaných 12 dBi nelze úlohu sestavit); a polovina G3 týkající se stopy při přidání
rodiny pozorování (stopa vzrostla ve 12 z 28 přidání, pokaždé proto, že rodina zvýšila hodnost).
Každé nesplnění je zafixováno testem. [Lunární infrastruktura](docs/LUNAR-INFRASTRUCTURE.md).

<a id="kshana-studio"></a>
## Kshana Studio

Otevřete [kshana.dev/studio](https://kshana.dev/studio/) a celý engine poběží ve vašem
prohlížeči, zkompilovaný do WebAssembly. Nic se neinstaluje a nic se nenahrává. Studio má
dvě zobrazení téhož enginu a přepínač v záhlaví mezi nimi přechází, přičemž zachová
scénář, zobrazení i jakákoli nastavení, která jste změnili.

**Jednoduché zobrazení** je to, ve kterém se Studio otevírá. Začíná otázkami (kolik družic
vidím, mohu věřit svému určení polohy, jak dlouho udrží hodiny čas, co dělá rušička
s mým přijímačem) a mapou všeho, co engine umí, u každé oblasti s podílem
ověřených metod. Otevřete scénář a odpověď přijde jako první: jedna prostá věta, napsaná pro
to, co daný scénář měří, pak jeho klíčová čísla a graf. Zobrazeno je nejvýše pět nastavení,
těch, která odpověď mění nejvíce; ostatní čekají pod **Pokročilá nastavení**.
**Jak se to počítá** vysvětluje metodu a **Pro výzkumníky** dává vlastní čísla enginu,
soubor scénáře, kód pro jeho spuštění z Pythonu a citaci.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-task-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-task-light.jpg">
  <img src="docs/assets/readme/studio/studio-task-light.jpg" alt="Kshana Studio, jednoduché zobrazení, na přibaleném scénáři integrity-raim, engine v0.40.0 běží lokálně. Otázka: splňuje geometrie výstražné meze (horizontální a vertikální ochranná úroveň)? Nejprve odpověď, označená Živý výsledek: Ano, většinou: po 95.3 % z 12 h. Mez chyby přijímače zůstala pod výstražnými mezemi (40 m horizontálně a 50 m vertikálně) při 344 z 361 kontrol a žádné určení polohy nebylo zavádějící. Klíčová čísla: doba, po kterou lze určení polohy věřit 95.3 %, nejdelší mezera 10 min, typická mez chyby 6.5 / 13 m, zavádějící určení polohy 0. Vedle Zkuste jiná nastavení s pěti z nich (chyba vzdálenosti, dvě výstražné meze, doba trvání a elevační maska) a Spustit znovu, poté sbalené sekce Pokročilá nastavení (13 dalších), Jak se to počítá (8 ověřených, 6 modelovaných) a Pro výzkumníky. Níže zobrazení tohoto výsledku a ochranné úrovně vynesené proti výstražné mezi." width="100%">
</picture>

**Pokročilé zobrazení** je úplný dashboard: knihovna scénářů, pět číslovaných kroků
(Vybrat, Nastavit, Spustit, Číst výsledky, Sdílet nebo exportovat), klíčová čísla se štítky PASS a FAIL
tam, kde běh uvádí práh, a každý panel: přehled, grafy, mapy, přehrávání,
zpráva enginu a exporty. Jedno vyhledávací pole dosáhne na scénáře, domény i pole uvnitř
nich a můžete připnout až čtyři běhy a porovnat je vedle sebe.

<details>
<summary>Úvodní obrazovka jednoduchého zobrazení a pokročilé zobrazení po běhu</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-home-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-home-light.jpg">
  <img src="docs/assets/readme/studio/studio-home-light.jpg" alt="Kshana Studio, jednoduché zobrazení, úvodní obrazovka s nadpisem Co byste chtěli zjistit?, s živým enginem v0.40.0 a v horní liště třemi odkazy: Rozbor výcviku, Mapa interference a Důvěra v přijímač. Čtyři otázky: kolik družic vidím kdekoli na Zemi, mohu věřit svému určení polohy, jak dlouho udrží hodiny čas bez družic a co dělá rušička s mým přijímačem. Pod první z nich její zaznamenaný výsledek: alespoň 22 viditelných družic na každém místě a v průměru 31 s GPS, Galileo, BeiDou a GLONASS dohromady, určení polohy možné ve 100 % míst a časů, na mapě světa s viditelnými družicemi, s tlačítkem Otevřít tento výsledek. Vedle Vše, co Kshana umí: 16 oblastí a 139 scénářů připravených ke spuštění, každá dlaždice s malým grafem ze zaznamenaného běhu a podílem ověřených metod, a 173 ze 350 schopností registru ověřeno." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/studio/studio-advanced-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/studio/studio-advanced-light.jpg">
  <img src="docs/assets/readme/studio/studio-advanced-light.jpg" alt="Kshana Studio, pokročilé zobrazení, po běhu přibaleného scénáře constellation-multi-gnss-coverage (Čtyři konstelace GNSS, jedna mapa), engine v0.40.0 běží lokálně. Vlevo knihovna scénářů, 139 scénářů v 16 doménách. Pět kroků Vybrat, Nastavit, Spustit, Číst výsledky a Sdílet nebo exportovat, aktuální je krok 4. Klíčová čísla: 102 družic, dostupnost 100 % (PASS), mediánové snížení přesnosti polohy (PDOP) 0.95 (PASS), 95. percentil PDOP 1.105 (PASS), v průměru 31.03 viditelných družic a nejméně 22. Níže řada panelů s vybraným Pokrytím, lišta přehrávání, mapa světa se středním PDOP od 0.831 do 1.0853 s vykreslenou každou družicí a globální údaje o pokrytí." width="100%">
</picture>

</details>

Zdrojový kód Studia a poznámky k jeho sestavení jsou v [`web/README.md`](web/README.md).

### Web

Zbytek [kshana.dev](https://kshana.dev) se sestavuje z vlastních souborů tohoto repozitáře a
z běhů enginu: mise, schopnosti, registr důkazů, zveřejněný výzkum a
edice.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/site/site-strip-dark.jpg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/site/site-strip-light.jpg">
  <img src="docs/assets/readme/site/site-strip-light.jpg" alt="Tři stránky kshana.dev vedle sebe. Úvodní část domovské stránky: řádek se jménem Kshana · क्षण · přesný okamžik nad titulkem Nacvičte minutu, kdy GNSS zhasne, s misijní konzolí skutečného běhu enginu v0.40.0 (glóbus a tři živé grafy: časová chyba hodin, hustota poměru nosné k šumu a ochranná úroveň). Důkazy, Zveřejněný výzkum: šest článků na arXiv postavených na otevřeném enginu, nejnovější s obrázkem z enginu. Edice, Kshana Pro, stejný engine, zesílený: Free spustí jeden scénář, Pro odpovídá na otázku programu." width="100%">
</picture>

<a id="capabilities"></a>
## Schopnosti

Jeden engine pokrývá celý řetězec selhání, od první rušené družice po poslední
nanosekundu holdoveru hodin. Engine má 92 druhů scénářů; `kshana kinds` je vypíše
a [`docs/SCENARIOS.md`](docs/SCENARIOS.md) dokumentuje každé pole.

| Schopnost | Na co odpovídá |
|---|---|
| [Spektrum](docs/SPECTRUM.md) | jak rušička zabírá pásmo L GNSS, pásmo po pásmu, sekundu po sekundě |
| [Hodiny a časování](docs/TELECOM-TIMING.md) | jak dlouho které hodiny udrží čas po ztrátě GNSS |
| [Konstelace kolem libovolného tělesa](docs/CONSTELLATION-DESIGN.md) | pokrytí, snížení přesnosti a dostupnost kolem Země, Měsíce nebo Marsu |
| [Sluneční soustava](docs/SOLAR-SYSTEM.md) | kde je každá planeta a doba šíření světla na libovolném spoji |
| [Navigace na nízké oběžné dráze](docs/LEO-PNT.md) | přelet, spoj, navigační zpráva a fúzované určení polohy, stupeň po stupni |
| [Kampaně](docs/CAMPAIGNS.md) | řetězená mise, procházení parametrů nebo soubor Monte Carlo v jednom scénáři |
| [Animace](docs/ANIMATION.md) | časové řady běhu jako animovaná kresba, přehrávač nebo snímky |
| [Zprávy](docs/REPORTS.md) | každé číslo s jednotkou a označením, v HTML (HyperText Markup Language) a JSON (JavaScript Object Notation) |
| [Exporty pro interoperabilitu](docs/INTEROP.md) | dráhy a geometrie pro jiné nástroje: SP3, CCSDS OMM a OEM, CZML, KML, GeoJSON, STK a SigMF |
| [Námořní důvěra](docs/MARITIME-TRUST.md) | může můstek tomuto určení polohy věřit: skóre 0-100 a důvody pro NMEA plavidla, živě nebo z logu (pouze poradní charakter, nikoli typově schválené navigační zařízení) |
| [Výcvikové proudy NMEA](docs/NMEA-TRAINING.md) | syntetické NMEA můstku se skriptovaným rušením a spoofingem a logem instruktora, pro výcvik posádky (pouze text; nikdy pro živé navigační systémy plavidla; pouze poradní charakter, nikoli typově schválené navigační zařízení) |
| [Mapa interference](docs/INTERFERENCE-MAP.md) | kde letadla a lodě hlásila degradovaná navigační data a jak velkou část trasy to zasahuje |
| [Oblast zdroje](docs/INTERFERENCE-MAP.md#emitter-region-interference-map-locate) | kde se za uvedených předpokladů může nacházet zdroj degradovaných hlášení polohy: oblasti s uvedenou spolehlivostí, těžiště s elipsou, nikdy bod (MODELLED; `kshana interference-map locate`) |
| [Balíčky důkazů](docs/EVIDENCE-PACKS.md) | podepsaný, offline ověřitelný technický záznam okna logu plavidla a toho, co z něj engine vypočetl, pro hlášení incidentu (pouze poradní charakter, nikoli typově schválené navigační zařízení) |
| [Telemetrie důvěry](docs/TRUST-TELEMETRY.md) | proud důvěry jako metriky Prometheus, události SIEM a volitelně OpenTelemetry, se vzorovým dashboardem Grafana (`deploy/grafana/kshana-gnss-trust.json`) |
| [Signal K a OpenCPN](docs/MARINE-INTEGRATIONS.md) | skóre důvěryhodnosti na serveru Signal K lodi a v OpenCPN, s referenčním sestavením pro malý počítač vedle přijímače (pouze poradní charakter, nikoli typově schválené navigační zařízení) |
| [Export pro testovací pracoviště](docs/TEST-BENCH.md) | `kshana bench-export`: pohyb vozidla a události scénáře pro laboratorní simulátor GNSS (nezapisuje se žádný signál) a jak potom bodovat log přijímače |
| [Mapování na rámce shody a zpráva](docs/compliance/README.md) | `kshana compliance-report`: pro které řádky veřejných rámců odolnosti sada běhů podporuje důkazy a jaká mezera zbývá |
| [Notebooky](notebooks/README.md) | spustitelné návody: důvěra plavidla a výcvikové proudy, expozice trasy na mapě interference, mapování na rámce shody a testovací pracoviště, kvantové proti klasickému GDOP |
| [Ověřovač Galileo OSNMA](docs/OSNMA.md) | navigační data kterých družic může přijímač kryptograficky autentizovat a proč kontrola selže; Kshana neuděluje žádná práva podle EU OSNMA ICD IPRs (viz NOTICE na stránce) |

Exportní formáty v plném znění: SP3 je Standard Product 3; CCSDS OMM a OEM jsou Orbit
Mean-elements Message a Orbit Ephemeris Message výboru Consultative Committee for Space Data
Systems; CZML a KML jsou Cesium a Keyhole Markup Language; STK je Systems Tool Kit;
SigMF je Signal Metadata Format.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/campaign-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/campaign-timeline-light.svg">
  <img src="docs/assets/readme/campaign-timeline-light.svg" alt="Řetězená kampaň campaign-jam-spoof-holdover-integrity, jeden skutečný běh enginu (seed 20260928): 6 fází (Nominální → Rušení → Spoofing → Holdover → Poplach integrity → Zotavení) a 18 členských běhů na mřížce 10 s během T+01:16:10. Tři pruhy: časová chyba hodin proti ochranné mezi 50 ns (vrchol 62.7 ns), efektivní hustota poměru nosné k šumu proti spodní mezi 25 dB-Hz (minimum -12.2 dB-Hz) a vertikální ochranná úroveň proti výstražné mezi 50 m (vrchol 135.4 m), s událostmi poplachů běhu: T+00:20:00 poplach RF detektoru spoofingu (fúzované monitory konzistence, výkonu a kvality signálu); T+00:26:10 poplach monitoru spoofingu s podporou hodin." width="100%">
</picture>

<details>
<summary>Každá schopnost vykreslená ze skutečného běhu: vodopád pásma L, mapa pokrytí, sluneční soustava a přelet na nízké oběžné dráze</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/lband-waterfall-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/lband-waterfall-light.svg">
  <img src="docs/assets/readme/lband-waterfall-light.svg" alt="Pásmo L GNSS jako jedna spektrální hustota výkonu během 60 s, ze skutečného běhu druhu spectrum (l-band-waterfall-jamming.toml, seed 7, engine v0.40.0): frekvence vodorovně, čas svisle dolů, barva pro výkon nad šumovým dnem -202.0 dBW/Hz. Rušičky: chirpové zařízení typu privacy (chirp, zapnuto v 10 s, vypnuto ve 40 s); CW tón na L1 (cw, zapnuto ve 30 s); úzkopásmový šum na L2 (narrowband, zapnuto ve 45 s). Nejhorší pásmo GPS L1 C/A: minimální efektivní C/N0 3.2 dB-Hz ve 31 s proti spodní mezi sledování 25 dB-Hz. GPS L1 C/A minimum 3.2 dB-Hz; Galileo E1 minimum 4.7 dB-Hz; GPS L2C minimum 36.9 dB-Hz; GPS L5 minimum 44.1 dB-Hz; Galileo E5a minimum 47.0 dB-Hz." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/coverage-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/coverage-map-light.svg">
  <img src="docs/assets/readme/coverage-map-light.svg" alt="Viditelné družice nad celou Zemí během jednoho dne, ze skutečného běhu constellation-design (constellation-multi-gnss-coverage.toml, engine spuštěný tímto generátorem): 102 družic (GPS 24, Galileo 24, BeiDou 30, GLONASS 24). Každá buňka 10 stupňů je vystínována podle středního počtu družic nad maskou 10 stupňů (27.2 až 36.5); body jsou vzorky pozemní stopy z enginu, jeden za hodinu na družici. Globální dostupnost 100.00 % při PDOP nejvýše 6, mediánové PDOP 0.95, průměrně 31.0 a nejméně 22 viditelných družic." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/solar-system-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/solar-system-light.svg">
  <img src="docs/assets/readme/solar-system-light.svg" alt="Sluneční soustava v epoše scénáře 2026-09-28T00:00:00, ze skutečného běhu druhu solar-system (solar-system-tour.toml): Slunce, 9 planet a trpasličí planeta Pluto při pohledu shora nad ekliptikou, vzdálenosti pro zobrazení logaritmicky zmenšené, u každého tělesa jednosměrná doba šíření světla od Země. Merkur 0.47 au, 10.1 světelné minuty, VALIDATED; Venuše 0.73 au, 3.0 světelné minuty, VALIDATED; Mars 1.55 au, 14.0 světelné minuty, VALIDATED; Jupiter 5.30 au, 49.5 světelné minuty, VALIDATED; Saturn 9.44 au, 70.2 světelné minuty, VALIDATED; Uran 19.44 au, 157.4 světelné minuty, MODELLED; Neptun 29.88 au, 240.2 světelné minuty, MODELLED; Pluto 35.61 au, 292.2 světelné minuty, MODELLED. Spoje: Mars–Jupiter jednosměrně 2193.5 s; Saturn–Země jednosměrně 4212.2 s; Europa–Jupiter jednosměrně 2.2 s." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/leo-pass-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/leo-pass-light.svg">
  <img src="docs/assets/readme/leo-pass-light.svg" alt="Jeden přelet na nízké oběžné dráze (LEO) ze skutečného běhu druhu leo-pass (leo-pass-iridium.toml, engine spuštěný tímto generátorem): přelet Iridium ve výšce 781 km, pásmo STL na 1621 MHz, pozorovaný leteckým uživatelem na 50° s. š. 30° z. d. Nad maskou 5° po dobu 750 s, maximální elevace 65.0° ve 444 s. Hustota poměru nosné k šumu vrcholí na 80.5 dB-Hz (medián 71.3), 34.3 dB nad mediánem GNSS 46.2 dB-Hz z 8 viditelných družic GPS (38.2 až 51.1 dB-Hz); Dopplerův posuv dosahuje 35.4 kHz." width="100%">
</picture>

Kterýkoli z nich spustíte příkazem `kshana example <scenario> > s.toml && kshana s.toml`: scénáře
jsou `l-band-waterfall-jamming`, `constellation-multi-gnss-coverage`, `solar-system-tour`
a `leo-pass-iridium`.

</details>

<details>
<summary>Námořní schopnosti a schopnosti pro interferenci, vykreslené z uložených syntetických vstupů: skóre důvěryhodnosti, mapa interference s expozicí trasy, výcvikový proud a balíček důkazů</summary>

<br>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/trust-timeline-light.svg">
  <img src="docs/assets/readme/trust-timeline-light.svg" alt="Skóre důvěryhodnosti během jedné syntetické plavby, ze skutečného běhu enginu v0.40.0 na examples/maritime-trust (vymyšlený log NMEA trajektu na trase Tallinn–Helsinky, 3001 epoch při 1 Hz). Tři pruhy sdílejí jednu časovou osu. Nahoře: vzdálenost mezi polohou, kterou hlásí přijímač, a skutečnou polohou plavidla, která zůstává v řádu několika metrů zhruba do 1576 s, kdy ji skriptovaný odtah polohy v logu odtáhne pryč, zatímco přijímač dál hlásí platné určení polohy. Uprostřed: skóre důvěryhodnosti od 0 do 100, nepočítané během prvních 300 s kalibrace, v nominálním pásmu (alespoň 90) až do odtahu, pak klesající přes degradované pásmo (alespoň 55) do nedůvěryhodného pásma. Dole: pásmo každé epochy jako barevná stuha s názvem. Skóre má poradní charakter. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC 61108, IEC 61162): za navigaci plavidla zůstává odpovědný provozovatel. Log je vymyšlený, aby ukázal formát a monitory; nejde o měření a neříká nic o tom, jak by si vedl jakýkoli přijímač." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/interference-map-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/interference-map-light.svg">
  <img src="docs/assets/readme/interference-map-light.svg" alt="Dva syntetické dny mapy interference vykreslené z uložených vzorků v examples/interference-map/output, každý s vlastní syntetickou trasou a podíly expozice trasy, které engine hlásí. Vlevo den ADS-B: 1 degradovaná buňka, 6 nedegradovaných, 4 neposouzené (šrafované) a buňky bez záznamu, vykreslené prázdné, které nebyly pozorovány. Trasa má 525 km: 11.5% její délky v degradovaných buňkách, 38.3% nedegradovaných, 9.1% neposouzených a 41.1% nepozorovaných. Vpravo den AIS: buňky označené detektory kruhu a polohy na pevnině, neanomální buňky a prázdné buňky; trasa má 454 km, z toho 10.5% v anomálních buňkách, 21.2% neanomálních, 0.0% neposouzených a 68.3% nepozorovaných. ADS-B a AIS jsou samostatné vrstvy, nikdy se nekombinují. Označená buňka není zjištěním interference a buňka bez barvy nebyla pozorována, což není totéž co čistá. Všechna data jsou vymyšlená, na otevřeném středním Atlantiku, a nejde o měření." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/training-track-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/training-track-light.svg">
  <img src="docs/assets/readme/training-track-light.svg" alt="Výcvikový proud ze scénáře coastal-drag-off (engine v0.40.0, seed 22, 25 minut při jednom určení polohy na 10 s logu instruktora). Mapa ukazuje skutečnou trasu plavidla a trasu, kterou hlásí přijímač: shodují se, dokud ve 421 s nezačne skriptovaný odtah polohy, hlášená trasa se pak vzdaluje od skutečné, zatímco přijímač udržuje platné určení polohy, a vrátí se zpět, když událost skončí v 1140 s. Vedle vzdálenost mezi oběma trasami v čase a střední hustota poměru nosné k šumu hlášená přijímačem, která po dobu události vzroste na jednu zvýšenou úroveň. Syntetická výcviková data vytvořená Kshana. Pouze pro výcvik a testování: tento proud nikdy nepřivádějte do živých navigačních systémů plavidla. Pouze poradní charakter, nikoli typově schválené navigační zařízení. Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC 61108, IEC 61162): za navigaci plavidla zůstává odpovědný provozovatel. Polohy, data a trasy jsou vymyšlené." width="100%">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/evidence-pack-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/evidence-pack-light.svg">
  <img src="docs/assets/readme/evidence-pack-light.svg" alt="Struktura balíčku důkazů. Log přijímače (NMEA, u-blox UBX, RINEX 3 nebo log Androidu) a časové okno vstupují do kshana receiver-trust evidence, který zapíše sedm souborů: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig a volitelný timestamp.tsr. Manifest zaznamenává SHA-256 celého logu a každého souboru a hašovací řetězec přes soubory; podpis pokrývá manifest. kshana evidence verify kontroluje podpis, haš každého souboru, řetězec a to, že není přítomen žádný neuvedený soubor, a končí s kódem 0 při ověření, 1 když něco selhalo a 3 když podepisující nebyl připnut. Balíček je technický záznam, nikoli právní stanovisko." width="100%">
</picture>

Všechny čtyři jsou vymyšlená data a mají poradní charakter: ukazují formát a chování softwaru, nikoli to, jak si jakýkoli přijímač nebo systém vede proti interferenci. První spustíte příkazem `kshana receiver-trust examples/maritime-trust/session.toml`, druhý příkazem `kshana route-exposure` na vzorcích v `examples/interference-map/`, třetí příkazem `kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea` (pouze pro výcvik: nikdy jej nepřivádějte do živého navigačního zařízení) a čtvrtý podle [`docs/EVIDENCE-PACKS.md`](docs/EVIDENCE-PACKS.md).

</details>

<details>
<summary>Úplná tabulka schopností, doménu po doméně</summary>

Následuje úplný detail doménu po doméně; registr vyspělosti pro jednotlivé schopnosti viz
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) a [`docs/VALIDATION.md`](docs/VALIDATION.md).

| Doména | Schopnost |
|--------|------------|
| **Dráhy a geometrie** | Šíření SGP4/SDP4 (ověřeno na 4.12 mm proti všem 666 vektorům AIAA 2006-6753); skutečné dvouřádkové elementy (uložený snímek Celestrak `gps-ops` s datem) nebo syntetické konstelace Walker-delta, jejichž střední elementy realizují vzorec `i:T/P/F` s odchylkou pod 1 km během 24 h šíření; viditelnost více konstelací, **snížení přesnosti — geometrické, polohové, horizontální, vertikální a časové (GDOP/PDOP/HDOP/VDOP/TDOP), ověřené na 1e-6 proti gnss_lib_py 1.0.4, Stanford NAV Lab** (Navigation and Autonomous Vehicles Laboratory), a dostupnost GNSS; bezgradientní optimalizátor návrhu konstelací, dimenzování minimálního počtu družic metodou streets-of-coverage, nástroj pro porovnání více konstelací a **procházení návrhů** Walker, které tabeluje pokrytí / PDOP / dobu opakované návštěvy přes mřížku roviny × družice a hlásí Paretovsky optimální návrhy. |
| **Numerický propagátor** | Numerický propagátor **Cowell** (`src/propagator.rs`) doplňující analytickou cestu SGP4/SDP4, s hierarchickým silovým modelem se **sedmi perturbacemi** (`src/forces.rs`): problém dvou těles + úplné **zonální** pole **J2–J6** (zonální harmonické koeficienty zploštění Země J2 až J6; přesný analytický gradient jeho poruchového potenciálu), volitelný **tesserální sféricko-harmonický geopotenciál EGM2008 do stupně/řádu 70** (Earth Gravitational Model 2008; `src/gravity_sh.rs`; skutečné koeficienty NGA — US (United States) National Geospatial-Intelligence Agency —, normalizovaná Legendreova rekurence Holmes–Featherstone, křížově zkontrolovaná proti Legendreovým funkcím v uzavřeném tvaru a analytické identitě ∇V), gravitace **Slunce a Měsíce jako třetích těles řízená epochou** (vestavěné efemeridy nízké přesnosti, bez kernelu DE/SPK — Development Ephemeris / SPICE Spacecraft and Planet Kernel), **tlak slunečního záření** (model dělové koule s kuželovým stínem umbra+penumbra), **atmosférický odpor** (Valladova po částech exponenciální hustota, korotující atmosféra), **post-newtonovská Schwarzschildova relativistická korekce** a člen **strhávání soustavy Lense–Thirring** (IERS — International Earth Rotation and Reference Systems Service — Conventions 2010 §10, lineární v momentu hybnosti Země, ~1–2 řády pod Schwarzschildem) — poháněný volbou ze dvou adaptivních integrátorů (RK4 — Rungeova–Kuttova metoda čtvrtého řádu — se zdvojováním kroku nebo vnořený pár **Dormand–Prince RK5(4)**). **Ověřeno proti Orekit 12.2** (CS GROUP, Apache-2.0) `NumericalPropagator`/`DormandPrince853` — 278 epoch na LEO (nízká oběžná dráha Země) + GTO (geostacionární přechodová dráha), přičemž úrovně konzervativních sil se shodují v nejhorším případě na **\|Δr\| 0.08 m za 24 h** (`tests/numerical_cowell_propagator_reference.rs`); úroveň atmosférického odporu je charakterizována zvlášť (≈ 333 m / 24 h) a absolutní vstupy efemerid Slunce/Měsíce a hustoty zůstávají poctivě **Modelled**. Další interní důkazy (nikoli vnější validace): nerušená dráha je kontrolována proti přesnému Keplerovu řešení s univerzální proměnnou na **méně než metr za 24 h**, energie/moment hybnosti se zachovávají na ~1e-9 a každá perturbace odpovídá ručně odvozené signatuře v uzavřeném tvaru. |
| **Manévry a návrh trajektorií** | Impulzní uzly ΔV s šířením kovariance 6×6 (soustavy chyb provedení ECI — inerciální soustava se středem v Zemi — / LVLH — lokální vertikála, lokální horizontála), integrace konečného zážehu kontrolovaná proti **Ciolkovského** raketové rovnici v uzavřeném tvaru na < 0.01 %, jednootáčkový **Lambertův** řešič **Izzo-2015**, přesný **Keplerův** propagátor s univerzální proměnnou a **porkchop** (start × přílet) procházení C3 (startovní energie) / V∞ při příletu vydané jako konturová mřížka JSON — vrstva výkonové simulace nad GMAT/Orekit, přičemž každý výstup Lamberta prochází okruhem tam a zpět proti pravdě dvou těles a minimum porkchopu je kontrolováno proti analytické Hohmannově spodní mezi. |
| **Časové systémy a referenční soustavy** | Škály IERS s přestupnými sekundami **UTC / TAI / TT / UT1** (koordinovaný světový čas, mezinárodní atomový čas, terestrický čas a čas rotace Země Universal Time 1), API (aplikační programové rozhraní) juliánského data, **úhel rotace Země** (ERA) IAU-2000 (International Astronomical Union), **TEME ↔ ECEF** založené na GMST (Greenwich Mean Sidereal Time) (pravý rovník, střední ekvinokcium ↔ se středem v Zemi, pevně spojená se Zemí) s geodetickými soustavami WGS-84 (World Geodetic System 1984), precese IAU 2006 (Fukushima–Williams), úplná **nutace IAU 2000A/2000B**, **pohyb pólu** IERS a redukce **GCRS↔ITRS IAU 2006/2000A založená na CIO** bez ekvinokcia (CIO = Celestial Intermediate Origin) — vše ověřeno **bit po bitu** proti vektorům SOFA/ERFA a **nezávisle křížově zkontrolováno proti ANISE** (reimplementace NAIF/SPICE v čistém Rustu; NAIF = Navigation and Ancillary Information Facility agentury NASA, US National Aeronautics and Space Administration): GCRS→ITRS z kshana proti ITRF93 (International Terrestrial Reference Frame 1993) z ANISE ze souboru JPL `earth_latest_high_prec.bpc`, se stejnými parametry orientace Země IERS dodanými oběma, se shodují na **≤ 0.86 m na zemi / ≤ 3.6 m na dráze GNSS** (max 0.028″) v osmi epochách 2020–2023. |
| **Inerciální** | Tříosý strapdown INS — kvaternionová orientace, mechanizace WGS-84 NED (sever-východ-dolů), kompenzace coning/sculling a deterministický model chyb IMU (měřítkový faktor, nesouosost, citlivost na g, kvantizace, drift); **akcelerometr na principu interferometru studených atomů z prvních principů** (fáze Mach–Zehnder, kvantový projekční šum, pokles kontrastu, vazba na vibrace), který *odvozuje* koeficient náhodné procházky rychlosti; a **částicový filtr** se sekvenčním vzorkováním podle důležitosti a převzorkováním pro navigaci bez GPS s podporou mapy (s referencí terénu/gravitace). |
| **Alt-PNT (bez GPS)** | **Model měření gravimetru** se studenými atomy, jehož spodní mez bílého šumu (`σ = ASD/√τ`, ASD = amplitudová spektrální hustota) je odvozena z fyziky akcelerometru CAI; plně normalizované **sféricko-harmonické pole tíhových anomálií** nízkého stupně (kontrolované proti Legendreovým funkcím v uzavřeném tvaru a ručně odvozené jednočlenné anomálii) plus syntetické maskony; **syntézní jádro gravitačního funkcionálu** (`gravity_sh::gravity_magnitude` / `gravity_disturbance_mgal`) — „čtečka mapy“, proti které porovnává navigátor s podporou gravitace — je ověřeno proti **standardu normálního tíhového zrychlení GRS80** (Geodetic Reference System 1980), reprodukuje Somiglianovo normální tíhové zrychlení v uzavřeném tvaru a zveřejněné γ_e / γ_p na **3.5e-12** a vytváří fyzikálně omezenou mapu poruch ze skutečného pole **EGM2008** z ICGEM (International Centre for Global Earth Models) (RMS — střední kvadratická hodnota — ≈ 26 mGal, max ≈ 89 mGal při s/ř 70; `tests/icgem_gravity_reference.rs`); a **částicový filtr porovnávání s gravitační mapou**, který obnoví trasu bez GPS z posloupnosti anomálií, kterou prolétá. Rozšiřuje se na **navigaci s referencí terénu** (TERCOM/SITAN — terrain contour matching / Sandia Inertial Terrain-Aided Navigation — proti DEM (digitální model terénu) SRTM (Shuttle Radar Topography Mission) `.hgt`, `src/altpnt/terrain.rs`), **hlavní geomagnetické pole IGRF-14** (14. generace International Geomagnetic Reference Field) do stupně/řádu 13 (`src/igrf.rs`, kontrolované proti uzavřenému tvaru nakloněného dipólu a konečným diferencím ∇V) a **kombinovaný gravitační + magnetický + terénní** navigátor, který fúzuje všechny tři skalární kanály jedním částicovým filtrem (informace je aditivní — žádný kanál určení polohy nezhorší). **60minutový benchmark bez GPS** (výpadek ~700 km / jedna hodina, při kterém se inerciální řešení odchýlí na ~70 km) je hierarchickým porovnávačem od hrubého k jemnému obnoven na **~145 m (< 500 m)** — cíl ESA NAVISP (Navigation Innovation and Support Programme) *Quantum Wayfarer*. |
| **Fúze** | Volně vázaný 15stavový chybový EKF (rozšířený Kalmanův filtr) GNSS/INS se zpětnou vazbou v uzavřené smyčce (balíček `gnss-ins`); **těsně vázaná** aktualizace pseudovzdáleností, která koriguje i s méně než čtyřmi družicemi; vázaný filtr **hodin + polohy**; obecný **unscented (sigma-bodový) Kalmanův** odhadovač pro silně nelineární měření; těsně vázaný **navigátor UKF** GNSS/INS (pseudovzdálenost + Doppler), jehož setrvačný let s orbitálním silovým modelem je kontrolován na vnitřní konzistenci na **0.77 m RMS** během 30minutového zakřiveného přeletu LEO, který zahrnuje 120sekundový výpadek GNSS (údaj o konzistenci filtru, nikoli validace vnějším orákulem — tento navigátor zůstává MODELLED); a úplný **17stavový těsně vázaný UKF GNSS/INS** (poloha, rychlost, chyba orientace, biasy akcelerometru a gyroskopu, bias a drift hodin), jehož **kvantová výpočetní navigace (dead-reckoning) s CAI** překlene 120sekundový výpadek na odvozené náhodné procházce rychlosti akcelerometru se studenými atomy. |
| **Určování oběžné dráhy** | Obnovení orbitálního stavu `[r, v]` z měření vzdálenosti pozemními stanicemi, skládající silový model dvou těles + J2 a integrátor RK4 s **dávkovým Gaussovým–Newtonovým** korektorem (`determine_orbit_batch`, pod metr / mm·s⁻¹ z bezšumových vzdáleností, ~2 m při šumové spodní mezi 5 m) a **sekvenční** variantou s unscented filtrem (`determine_orbit_sequential`). |
| **Pozorovatelnost a teorie odhadu** | Obecná, znovupoužitelná vrstva **Fisherovy informace / Cramérovy–Raovy meze** (`src/fim.rs`): informační matice M = HᵀWH, **Cramérova–Raova dolní mez**, **hodnost a nulový prostor defektu datumu** pro pozorovatelnost (Mooreova–Penroseova pseudoinverze) a skaláry návrhu experimentu **D/A/E/T-optimální** ze symetrického Jacobiho řešiče vlastních čísel. **Ověřeno** — vlastní čísla proti `numpy.linalg.eigh`, kovariance CRLB proti σ²(XᵀX)⁻¹ přes `numpy.linalg.inv` a GNSS DOP z informační matice, vše shodné na **1e-9** (`tests/fim_observability_reference.rs`), a navíc křížově zkontrolováno proti mezím v uzavřeném tvaru **Kay (1993)** s dosažením CRLB metodou Monte Carlo. Je základem enginu DOP, CRLB pasivní geolokace a lunární **věty o pozorovatelnosti** absolutní stanice (níže). |
| **Lunární a cislunární** | Propagátor **kruhového omezeného problému tří těles (CR3BP)** Země–Měsíc v rotující soustavě — zachovávaná Jacobiho konstanta a všech pět Lagrangeových bodů (`src/cr3bp.rs`) — nyní s **maticí přechodu stavu (STM) 6×6 a diferenciálním korektorem s jednoduchou střelbou** (`cr3bp_jacobian`, `propagate_state_stm`, `differential_correct_halo`), který vytváří skutečně periodické dráhy **halo / NRHO** (téměř přímočará halo dráha): STM je ověřena proti konečným diferencím, korigované dráhy se uzavírají na strojovou přesnost a nasazení zveřejněného stavu v apoluniu reprodukuje **jižní 9:2 NRHO kolem L2** (L2 = druhý Lagrangeův bod Země–Měsíc; dráha Gateway) s periodou ≈ 6.57 d / periluniem ≈ 3,250 km, v souladu se zveřejněnými ≈ 6.56 d / ≈ 3,370 km (řešení CR3BP — kruhové, bez Slunce —, **neověřené** proti skutečným efemeridám LANS (Lunar Augmented Navigation Service)/Gateway; selenocentrická transformace MCI/MCMF (inerciální se středem v Měsíci / se středem v Měsíci, pevně spojená s Měsícem) korigované dráhy je navazující práce); plus cislunární geometrie PNT **LunaNet / LNIS** (LunaNet Interoperability Specification) (redukce MCI↔MCMF, selenografické souřadnice) s přeletem **ARAIM nad jižním pólem Měsíce**, který poctivě odhaluje mezeru v integritě: σ_URE (chyba vzdálenosti uživatele) ~30 m žene ochrannou úroveň vysoko nad výstražnou mez 50 m (`src/lunar.rs`, `scenarios/lunanet-araim.toml`); a **rozšíření DOP o povrchové majáky** (`src/lunar_beacon.rs`), které ukazuje, jak několik zaměřených povrchových dálkoměrných majáků dodá řádky směru pohledu s nízkou elevací a širokým azimutem, které sadě složené jen z drah nad hlavou chybějí — čímž se zhroutí špatně podmíněné GDOP nad jižním pólem a, přes rozpočet chyb jako odmocninu ze součtu čtverců, realizovaná přesnost polohy v metrech (s využitím jádra DOP ověřeného proti gnss_lib_py a uzavřeného tvaru viditelnosti horizontu bez atmosféry; analýza snížení přesnosti je popsána v [arXiv:2607.06212](https://arxiv.org/abs/2607.06212)). |
| **Lunární sada PNT** | Lunární/cislunární navigační sada postavená na jádře CR3BP, každá část jako spustitelný `kind`: **Lunar Coordinate Time** (`lunar-time-offset`, `src/lunar_time.rs` — sekulární rychlost LTC/TCL − TT (LTC = Lunar Coordinate Time; TCL = její francouzská podoba, Temps-Coordonnée Lunaire) z rozdílu vlastního potenciálu + kinetického členu, hlášená se zveřejněným pásmem 56–59 µs/den); geodetická pozorovatelná zpoždění **lunární VLBI** (interferometrie s velmi dlouhou základnou) (`lunar-vlbi`, `src/lunar_vlbi.rs` — zpoždění + rychlost v blízkém poli jako rozdíl dvou vzdáleností na pozemské základně, křížově zkontrolované proti rovinné vlně Δ-DOR (delta differential one-way ranging) ze stejného kódu v limitě vzdáleného pole, parciální derivace ověřené konečnými diferencemi); **společný vícetechnický dávkový odhadovač OD + hodin** (`lunar-joint-od-clock`, `src/lunar_combination.rs` — Gaussovo–Newtonovo proložení fúzující VLBI + lunární lokální vzdálenosti + vzdálenosti mezi družicemi), který nese výsledek **pozorovatelnosti z Fisherovy informace**: samotné interní měření vzdáleností ponechává šestistupňový **defekt datumu** tuhého tělesa, takže *absolutní* poloha povrchové stanice je nepozorovatelná, dokud se nepřidá vazba na pozemskou soustavu — zpoždění **VLBI** na pozemské základně pozorovatelnost *obnoví* u řídké konstelace a *zostří* Cramérovu–Raovu mez u bohaté, přičemž absolutní datum se uzavře při **třech** nekolineárních pozemských stanicích (výsledek o pozorovatelnosti popsaný v [arXiv:2607.02566](https://arxiv.org/abs/2607.02566)); **realizace referenční soustavy** (`lunar-frame-realisation`, `src/lunar_frame_realise.rs` — proložení 7parametrového Helmertova datumu + vazba orientace IAU 2015 WGCCRE — WGCCRE = IAU Working Group on Cartographic Coordinates and Rotational Elements); analýza **objemu služby třídy Moonlight/LCNS** (LCNS = Lunar Communications and Navigation Services; `moonlight-service-volume`, `src/lunar_service.rs` — DOP / pokrytí / dostupnost + zobecněná lunární obálka ARAIM HPL/VPL (horizontální/vertikální ochranná úroveň), s využitím jádra DOP ověřeného proti gnss_lib_py a aparátu LunaNet σ_URE≈30 m); **lunární diferenciální PNT** (`lunar-differential-pnt`, `src/lunar_dpnt.rs` — lunární analogie diferenciálního GNSS / systému družicového rozšíření (SBAS): přesné odečtení společného módu hodin + prostorová dekorelace prvního řádu v závislosti na základně, s využitím ochranné úrovně SBAS DO-229E — DO-229E je minimální provozní výkonnostní standard RTCA (dříve Radio Technical Commission for Aeronautics) pro přijímače SBAS); a **export pro interoperabilitu sladěný s LunaNet/IOAG** (IOAG = Interagency Operations Advisory Group; `lunar-interop-export`, `src/lunar_interop.rs` — okruh tam a zpět CCSDS-OEM (Orbit Ephemeris Message) + lunární časové škály v lunární tělesové soustavě IAU 2015, zabalený v obálce KIF). Úrovně důkazů pro jednotlivé části jsou ve [verifikační matici](docs/VERIFICATION-MATRIX.md): Lunar Coordinate Time, společný odhadovač OD + hodin, realizace referenční soustavy a geometrie objemu služby jsou **VALIDATED** (každá proti nezávislému orákulu, které její řádek jmenuje, stejně jako cesta jádra zpoždění VLBI); pozorovatelná VLBI, výsledek o pozorovatelnosti defektu datumu, diferenciální PNT a export pro interoperabilitu jsou **MODELLED**. Parametry jsou **ilustrativní hodnoty z veřejných zdrojů** — **neověřené** proti skutečnému sledování VLBI/Gateway, **bez** přidružení k jakékoli agentuře či jejího schválení, bez tvrzení o TRL (úroveň technologické připravenosti) / heritage. |
| **Hlubokovesmírné a marsovské PNT** | Otevřený **engine radiometrické navigace**: iterativní doba šíření světla + **Shapirovo** relativistické zpoždění, dvou-/jedno-/třícestný **Doppler a vzdálenost** (Moyer, dvě větve), koherentní poměry obratu transpondéru, regenerativní/PN (pseudonáhodný šum) měření vzdálenosti (CCSDS 414, standard měření vzdálenosti pseudonáhodným šumem) a **Δ-DOR** v rovině oblohy (CCSDS 506, standard Delta-DOR), s prostředím sluneční plazmy/troposféry/ionosféry; parsování + vydávání zpráv sledovacích dat **CCSDS-TDM (503)**; **Square-Root Information Filter se sníženou dynamikou** (RTN — radiální, transverzální, normálová — empirická zrychlení + třístavové palubní hodiny + atmosférický odpor Marsu), který v syntetické uzavřené smyčce provádí **určování dráhy na nízké dráze Marsu (LMO) na ≈ 0.2 m**; společný odhadovač **fúze jednocestných + dvoucestných** měření; jádro dynamiky více těles (`Body{μ, re, zonals, gravity, IAU-pole}`, gravitace Marsu GMM-3 (Goddard Mars Model 3), tělesová soustava Marsu IAU, zásuvné rozhraní `EphemerisProvider`, dvoudílná juliánská data + TT↔TDB (barycentrický dynamický čas)); a relay-PNT scénář **`mars-pnt`** (areostacionární reléová konstelace MARCONI) s komplexním **výkonovým simulátorem GSE** (GSE = pozemní podpůrné zařízení) (geometrie → rozpočet spoje → pozorovatelné → SRIF → kovariance). **Ověřeno simulací** (kovarianční údaje / údaje kvality z uzavřené smyčky); dynamika Marsu s centrálním Sluncem je křížově zkontrolována proti JPL **DE440** (137 m @ 1denní oblouk, `xval/anise-mars-od`). Validace na skutečných sledovacích datech DSN/ESTRACK je v plánu vývoje. |
| **Sluneční soustava a PNT kolem libovolného tělesa** | **Efemeridy celé sluneční soustavy** bez kernelů (`src/ephem.rs`, `src/ephem_provider.rs`): každá planeta z **Standishových keplerovských elementů** JPL (Tabulka 1, 1800–2050 n. l.; Tabulky 2a/2b, 3000 př. n. l.–3000 n. l.) se zveřejněnou nominální chybou každé planety, Země a Měsíc rozdělené lunární řadou, a Phobos, Deimos, Io, Europa, Ganymedes, Callisto a Titan ze středních elementů JPL a rotačního modelu IAU (International Astronomical Union); **libovolné těleso vůči libovolnému jinému** v ICRF (International Celestial Reference Frame). `Body` nyní nese **GM (gravitační parametr), poloměry, J2 (druhou zonální harmonickou), kde je zveřejněna, a pól a nultý poledník IAU pro osmnáct těles**. Druh **`solar-system`** hlásí polohy, rychlosti, konstanty, **dobu šíření světla a jedno-/dvoucestnou vzdálenost** mezi libovolnými dvěma tělesy (stávající radiometrický řešič doby šíření světla se slunečním Shapirovým zpožděním) a dráhovou stopu pro každé těleso — dost na vykreslení interaktivní sluneční soustavy; druh **`body-pnt`** určuje polohu orbiteru nebo landeru **kolem libovolného tělesa** (`scenarios/mars-orbit-pnt.toml`, `scenarios/europa-surface-pnt.toml`) s místní konstelací Walker, aparátem snížení přesnosti a Gaussovým–Newtonovým aparátem a hlubokovesmírnou vzdáleností od Země. **Ověřeno** proti JPL Horizons (DE441, JPL Development Ephemeris 441): Merkur–Saturn a Země z Tabulky 1 v rámci dvojnásobku nominální chyby (nejhorší 1.87×), všech osm planet z Tabulek 2a/2b (nejhorší 1.71×) a doba šíření světla Země–Mars/Jupiter. **Modelled**: Uran a Neptun z Tabulky 1 (2.0× a 5.2× uvedené chyby proti DE441), Pluto, měsíce a výsledky navigace `body-pnt`. |
| **Fúzované PNT MEO + LEO** | `src/leo_fusion/`: na systému nezávislé určování polohy, navigace a času v LEO nad libovolnou konstelací (slupky Walker, sady elementů, předvolby GNSS) a libovolným signálem (nosná, čipová rychlost, obálka C/N0, chyba vzdálenosti signálu v prostoru), s volitelnými jednosouborovými předvolbami nesoucími své zdroje (Xona Pulsar X1/X5, Iridium STL, signály příležitosti Starlink, CentiSpace, reprezentativní systém v pásmu C, model efemerid bez hodin ATOMIC). **`leo-pvt`**: dávkové **dopplerovské určování polohy** z rychlosti změny vzdálenosti (jedna i více družic, stavy driftu hodin a rychlosti, geometrie podél/napříč stopou při jednom přeletu a zrcadlové řešení), **společné vážené nejmenší čtverce GNSS + LEO** s mezisystémovými biasy pro každý systém a sigmami pro každý signál dodanými volajícím, DOP v závislosti na počtu družic LEO, **polární a arktické** pokrytí a **přenos času z LEO na UTC** v závislosti na C/N0 a oscilátoru. **`leo-ppp`**: plovoucí PPP (přesné určování polohy bodu) EKF (rozšířený Kalmanův filtr) jen s GNSS a s LEO, jeho doba konvergence a test konzistence NEES chí-kvadrát. **`ntn-positioning`**: určování polohy v nepozemních sítích 5G z Cramérovy-Raovy meze šířky pásma. **Ověřeno**: dopplerovská obálka LEO proti zveřejněným údajům Iridium a Xona. **Modelled**: zbytek, s trendem PPP porovnaným s Li et al. (2019) — viz [`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md). |
| **Integrita** | Snímkový RAIM a RAIM se separací řešení (ve stylu ARAIM) — autonomní monitorování integrity přijímačem — s horizontální/vertikální ochrannou úrovní (HPL/VPL), detekcí a vyloučením poruch a Stanfordskými diagramy integrity; ochranná úroveň s explicitním rozpočtem rizika integrity **separace řešení s více hypotézami (MHSS)**, včetně **režimu poruchy celé konstelace pro dvě/více konstelací** (EU (Evropská unie) ARAIM / DO-316, výkonnostní standard RTCA pro palubní vybavení GPS s rozšířením na bázi letadla), vyzkoušeno na skutečném snímku GPS + Galileo (`scenarios/araim-gps-galileo.toml`). Ochranná úroveň uplatňuje jednostrannou projekci **nominálního biasu** `b_k = Σ_i|s_i|·b_nom` pro každý režim poruchy a sigmu **integrity** σ_URA (přesnost vzdálenosti uživatele; odlišná od přesnostní σ_URE, chyby vzdálenosti uživatele) ze zprávy Integrity Support Message — viz [`docs/ARAIM_REFERENCE.md`](docs/ARAIM_REFERENCE.md). Detekční jádro (prahy χ²/necentrální-χ²/normální a K-multiplikátory) je **vnějšně ověřeno proti SciPy** na 171 případech (`tests/raim_reference.rs`); geometrie využívá jádro DOP ověřené proti gnss_lib_py. Samotné *rozdělení rozpočtu* rizika integrity ARAIM MHSS nemá žádné zveřejněné numerické orákulum a zůstává poctivě Modelled. |
| **Rozšíření (SBAS)** | **Ochranné úrovně SBAS / WAAS** (WAAS = Wide Area Augmentation System) ve tvaru vážených nejmenších čtverců DO-229E (K-faktory pro přesné přiblížení a traťový let) a **dvoufrekvenční bezionosférická** kombinace **L1/L5** (L1 a L5 jsou dvě civilní signálová pásma GPS; IS-GPS-705, specifikace rozhraní GPS pro signál L5, γ₁₅ ≈ 1.793), která je základem DO-316 — `src/sbas.rs`. Algoritmus ochranné úrovně je **vnějšně ověřen proti forku RTKLIB SBAS-PL** (RTKLIB = otevřená knihovna pro určování polohy v reálném čase kinematickou metodou; PL = ochranná úroveň) (`zsiki/rtklib_ws` `waasprotlevels()`, Siki & Takács 2017, DO-229D — předchozí revize DO-229 — App. J) spuštěného na **skutečných datech EGNOS** (European Geostationary Navigation Overlay Service), přičemž reprodukuje jeho HPL na < 2e-3 m (`tests/sbas_reference.rs`); gLAB (sada nástrojů GNSS Laboratory) v6.0.0 potvrdil totožnou konvenci. |
| **Hodiny a časování** | Dvoustavový Kalmanův holdover (kovariance v Josephově tvaru, zdraví konzistence NIS/NEES — normalizovaná kvadratická inovace / normalizovaná kvadratická chyba odhadu); stabilita Allanovy rodiny (ADEV / MDEV / TDEV / HDEV / MTIE — Allanova, modifikovaná Allanova, časová a Hadamardova deviace a maximální chyba časového intervalu) s intervaly spolehlivosti specifickými pro typ šumu a úplným **pětikoeficientovým mocninným proložením IEEE-1139** (IEEE Std 1139, definice metrologie frekvence a času Institute of Electrical and Electronics Engineers) — odhadovače jsou ověřeny na skutečném hardwaru proti **Stable32**: **skutečný cesiový primární etalon 5071A proti vodíkovému maseru** (556,990 fázových vzorků, 16 průměrovacích faktorů, OADEV/OHDEV — překrývající se Allanova/Hadamardova deviace — na 1e-3; `tests/cs5071a_reference.rs`) a **kanonická regresní řada Stable32 PHASE.DAT** (139 průměrovacích faktorů, OADEV/MDEV/TDEV na 1e-3; `tests/phasedat_reference.rs`); odhadovače ADEV/MDEV/TDEV a telekomunikační metrika putování **MTIE** jsou navíc křížově zkontrolovány proti **nezávislé knihovně allantools 2024.06** na **< 1e-9** na řadě NIST SP 1065 (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`); geometrické korekce (Sagnac, GNSS common-view); a provozní metody přenosu — **TWSTFT** (obousměrný družicový přenos času a frekvence) s uzavřeným tvarem Sagnacova jevu BIPM (Mezinárodní úřad pro míry a váhy), **GNSS common-view**, bezionosférický přenos času **PPP** (přesné určování polohy bodu), **optický** spoj volným prostorem se scintilací turbulence a **časová škála souboru hodin (papírová)** s inverzními vahami rozptylu pod nejlepšími přispívajícími hodinami. **Kalkulačka holdoveru hodin bez GNSS** (`src/holdover.rs`) zpřístupňuje růst chyby setrvačného běhu podle van Loana v uzavřeném tvaru jako inverzi *holdoveru do prahu* — jak dlouho hodiny volně běží, než jejich časová chyba překročí rozpočet — napříč reprezentativními třídami klasických a kvantových hodin; **modelled** (křížově zkontrolováno proti vícekrokové rekurzi kovariance `clock_state`) a poctivé v tom, že u velmi stabilních hodin je holdover do těsného prahu dán *předpokládanou* spodní mezí šumu pro dlouhé tau, nikoli citovanou ADEV. **Podmíněná časová ochranná úroveň** (`src/tpl.rs`) rozšiřuje holdover na spoofing: mez *nedetekované* časové chyby, za předpokladu nezávislé křížové kontroly, která skládá spodní mez monitoru k-sigma, rozptyl setrvačného běhu podle van Loana po dobu latence detekce a dobu do poplachu CUSUM (kumulativní součet). Kalibrováno na skutečném zaznamenaném spoofingu (JammerTest 2024) a reprodukovatelné přes `cargo run --example tpl_jammertest`; složení **MODELLED** (bez rozpočtu rizika integrity za hodinu), podmíněné detekcí — neexistuje žádná konečná *nepodmíněná* mez. |
| **Doména měření GNSS** | Dopředná syntéza pseudovzdáleností / Dopplera s ionosférou **Klobuchar** (vysílaná) a **IONEX / mřížka TEC** (IONosphere map EXchange format / celkový obsah elektronů; naměřená) — včetně parseru souborů IONEX, časové interpolace mezi mapami a mapování šikmé obliquity tenké slupky — troposférou **Saastamoinen + Niell** a snímkovým RAIM (HPL/VPL). |
| **Odolnost** | **Rušení** na základě rozpočtu spoje (J/S → efektivní C/N₀ → ztráta zámku — poměr rušení k signálu, poměr nosné k hustotě šumu — s faktorem spektrální separace proti rušení `Q`, který je nyní **odvozen ze skutečných výkonových spekter signálu a rušičky** přes `src/navsignal.rs` — `Q = 1/(R_c·κ)`, v CI křížově kontrolováno proti dřívější reprezentativní konstantě); stochastický **detektor časového spoofingu** (Neymanův–Pearsonův / χ²₁ energetický test s P_fa/P_md v uzavřeném tvaru i metodou Monte Carlo a bezpečnostním ukazatelem kvality (FoM) 1 − P_md); a **vícevrstvý detektor spoofingu** fúzující paritní test konzistence RAIM (se slepou skvrnou společného módu poctivě modelovanou), monitor výkonu RF AGC (automatické řízení zisku) a monitor kvality signálu (SQM — monitorování kvality signálu, early-minus-late); a **rozpočet chyb kvantové inerciální výpočetní navigace** (`QuantumNavBudget`, `src/inertial/quantum_imu.rs`) skládající bílošumovou náhodnou procházku rychlosti interferometru se studenými atomy se zbytkovým biasem (křížově zkontrolováno proti nezávislému integrátoru `AccelModel`) a chybou měřítkového faktoru do údaje o driftu polohy během holdoveru — inerciální dvojče holdoveru hodin. **Engine hodnocení odolnosti sladěný s rámcem** (`src/resilience/`) mapuje simulované chování architektury na dílčí skóre pro jednotlivé dimenze napříč sedmi vlastními kategoriemi odolnosti Kshana (nikoli termíny DHS), sladěné s Resilient PNT Conformance Framework amerického ministerstva vnitřní bezpečnosti (Department of Homeland Security), a pak studuje **stabilitu rozhodnutí** jakéhokoli jednotlivého složeného skóre nebo úrovně vyspělosti při Dirichletově simplexu vah a souboru pěti hrozeb — nestabilita pořadí Kendall-τ, míra změny vítěze na prvním místě a **kolaps diverzity** společného módu (Hill-N2), se zprávou o zajištění chráněnou hašem integrity (35 ručně odvozených testů s orákulem). Reprodukovatelné přes `cargo run --example resilience_report`; syntetické architektury **MODELLED**, sebehodnocení sladěné s RPCF v2.0, **nikoli** certifikace. Viz [`docs/RESILIENCE-CROSSWALK.md`](docs/RESILIENCE-CROSSWALK.md). |
| **Pasivní RF geolokace** | **Geolokace zdroje TDOA/FDOA** (časový/frekvenční rozdíl příchodu; `src/geolocation.rs`) — lokalizace zdroje rušení nebo spoofingu (nebo zdroje příležitosti pro reverzní PNT) z hyperboloidů **časového rozdílu příchodu** napříč sítí přijímačů, řešená Gaussovými–Newtonovými nejmenšími čtverci; přidání **frekvenčního rozdílu příchodu** s pohyblivými přijímači společně obnoví polohu *i* rychlost zdroje, s **Cramérovou–Raovou** mezí kovariance polohy odvozenou z geometrie sítě. **MODELLED** (orákula vnitřní konzistence: okruhy dopředu→zpět, identita J·CRLB = I, monotonie GDOP a odhadovač dosahující vlastní CRLB metodou Monte Carlo) — model bodového zdroje s přímou viditelností, bez členů vícecestného šíření / NLOS (bez přímé viditelnosti), biasu hodin přijímače nebo refrakce. |
| **Navigační signál a sledování kódu** | **Úroveň signálu** mezi rozpočtem spoje a doménou měření (`src/navsignal.rs`): **výkonové spektrální hustoty** (PSD) s jednotkovou plochou pro **BPSK-R(n)** (binární fázové klíčování s obdélníkovými čipy) a **sine-BOC(m,n)** (binary offset carrier); **koeficient spektrální separace** (SSC) κ = ∫ G_s·G_i df, který **odvozuje `Q` proti rušení** používané modelem rušení (`Q = 1/(R_c·κ)`) ze skutečných spekter signálu/rušičky místo reprezentativní konstanty; **RMS (Gaborova) šířka pásma** (BOC > BPSK — míra informace o vzdálenosti / Cramérova–Raova); **tepelný šumový jitter koherentního sledování kódu early–late DLL** (DLL = smyčka zamčeného zpoždění; Kaplan & Hegarty; ~pod metr pro C/A — hrubý/akviziční kód GPS — při 45 dB-Hz); a **obálka chyby vícecestného šíření** (koherentní EML, early-minus-late — potlačení úzkým korelátorem). Ověřeno proti kotvám v uzavřeném tvaru (vlastní SSC BPSK = 2/(3·R_c), PSD s jednotkovou plochou, jitter C/A pod metr). Jde o analýzu **výkonnosti** signálu, **nikoli** o návrh hardwaru antény / RF užitečného zatížení (role partnera pro užitečné zatížení). |
| **Interoperabilita** | Příjem vysílaných efemerid více GNSS ve formátu **RINEX-3** (GPS, Galileo, QZSS — japonský Quasi-Zenith Satellite System —, BeiDou MEO/IGSO — střední oběžná dráha Země / skloněná geosynchronní dráha — přes IS-GPS-200, specifikaci rozhraní GPS; GLONASS, ruský Global Navigation Satellite System, přes PZ-90 — ruský datum Parametry Zemli 1990 — stavový vektor RK4) použitelný jako zdroj konstelace (RINEX dovnitř, geometrie PNT ven); parser pozorování **RINEX-3** (pseudovzdálenost, fáze nosné, Doppler, síla signálu; uspořádání pozorování 4.00 by se mělo dát parsovat, ale není testováno, a navigační soubory RINEX 4 jsou odmítnuty podle názvu, místo aby byly chybně dekódovány), který nyní **napájí řešič určování polohy jednoho bodu (SPP)** (`pvt`) — skutečná kódová pozorování dovnitř, skutečná **poloha přijímače** ven, ověřeno na datech IGS; čtečka/zapisovač přesných efemerid **SP3-c/d** s Lagrangeovou interpolací 9. řádu; export **CCSDS OEM 2.0 + OMM** (Orbit Mean-elements Message) pro nástroje letové dynamiky (GMAT, Orekit, STK — Systems Tool Kit); a parsování + vydávání zpráv sledovacích dat **CCSDS-TDM (503)** pro hlubokovesmírné radiometrické sledování. |
| **Analýza mise (systémové inženýrství)** | Rozpočty návrhu mise prvního řádu, každý jako spustitelný druh: **geometrie startu a výstupu** pro dvě tělesa (`launch-window` — azimut startu `sin Az = cos i/cos lat`, minimální sklon, bonus rotace Země, Δv změny roviny dogleg, denní příležitosti; `src/launch.rs`); **balistický koridor návratu podle Allena–Eggerse** (`reentry` — maximální zpomalení, rychlost/výška při maximálním g, rychlost při maximálním ohřevu; `src/reentry.rs`); **geometrie pokrytí při pozorování Země** (`eo-coverage` — pás záběru / GSD v nadiru (vzdálenost vzorků na zemi) / přístup mimo nadir / opakovaná návštěva přes kosmický trojúhelník SMAD (*Space Mission Analysis and Design*); `src/eo_payload.rs`); **3-DOF rozpočet chyb orientace a zaměření** (tři stupně volnosti; `attitude-budget` — nejhorší moment gravitačního gradientu + rozpočet zaměření RSS (odmocnina ze součtu čtverců); `src/attitude_budget.rs`); **predikce přeletů nad pozemní stanicí** (`passes` — AOS/TCA/LOS, získání signálu / čas největšího přiblížení / ztráta signálu, maximální elevace, doba přístupu; `src/passes.rs`); a **jednosměrný rozpočet spoje** podle rovnice spoje CCSDS 401 / DSN 810-005 (standard CCSDS pro rádiové frekvence a modulaci / příručka návrhu spojů Deep Space Network; `link-budget` — FSPL (útlum volným prostorem), C/N₀, Eb/N₀ (poměr energie na bit k hustotě šumu), rezerva, uzavření; `src/linkbudget.rs`). Analytické rozpočty prvního řádu **MODELLED** — předhardwarová vrstva pod STK/GMAT/Basilisk, nikoli náhrada 6-DoF ani radiometrická. |
| **Rozhodovací analýza a hledání kompromisů (MCDA)** | Úplná sada **vícekriteriální rozhodovací analýzy** (MCDA) (`src/mcda/`) pokrývající všechny čtyři rodiny metod — agregaci hodnot (**WSM**, **WPM**, **WASPAS** — model váženého součtu, model váženého součinu, hodnocení váženého agregovaného součtu a součinu), vzdálenost od ideálu (**TOPSIS**, Technique for Order of Preference by Similarity to Ideal Solution), kompromisní programování (**VIKOR**, ze srbského názvu pro vícekriteriální optimalizaci a kompromisní řešení) a outranking (**PROMETHEE II**, Preference Ranking Organization Method for Enrichment of Evaluations; **ELECTRE I**, z francouzského názvu pro eliminaci a volbu vyjadřující realitu), plus poměrový systém **MOORA** (Multi-Objective Optimization on the basis of Ratio Analysis) a proporcionální **COPRAS** (Complex Proportional Assessment) — s vážením priorit párovým porovnáním **AHP** (Analytic Hierarchy Process) (Consistency Ratio), **Paretovou** nedominovanou frontou, analýzou **citlivosti** vah a víceatributovým hodnocením **užitku**. Devět agregátorů reprodukuje nezávislé knihovny třetích stran **pymcdm** (WSM / WPM / WASPAS / MOORA / TOPSIS / VIKOR / PROMETHEE II) a **pyDecision** (ELECTRE I, COPRAS) na **< 1e-9** a vektor priorit AHP + Consistency Ratio se shodují se Saatyho tabulkou Random-Index a hlavním řešičem vlastních čísel SciPy/LAPACK na < 1e-9 (`tests/mcda_*_reference.rs`). **VALIDATED** — rozhodovací vrstva pod enginem studií kompromisů. |
| **Kosmické prostředí** | **Model prostředí kosmického počasí** (`space-weather`, `src/space_weather.rs`): sluneční (F10.7 / centrovaný 81denní F10.7a — sluneční rádiový tok na 10.7 cm) a geomagnetické (Kp, planetární K-index, s definiční tabulkou Kp↔ap — ap je jeho lineární planetární amplituda) indexy aktivity, exosférická teplota **Jacchia-1971**, kterou řídí (ověřeno proti zveřejněnému slunečnímu minimu/průměru/maximu), a termosférická hustota neutrálů ve výšce s korekcí na aktivitu proti statické — závislost hustoty na slunečním cyklu, kterou statická atmosféra USSA76 (US Standard Atmosphere 1976) vynechává. **MODELLED**: kalibrovaná vazba výškové škály prvního řádu, **nikoli** atmosféra ověřená daty (NRLMSISE — model exosféry US Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar). |
| **Hodnocení AI/ML a kompromisy** | **Testovací prostředí pro hodnocení detekce RF poruch** (`impairment-eval`, `src/impairment_eval.rs`): označený, parametricky podložený **syntetický** korpus (nominální / rušení / časový spoofing / polohový spoofing / vícecestné šíření), na detektoru nezávislý postroj **ROC/AUC** (operační charakteristika přijímače / plocha pod křivkou) bodující jakýkoli detektor (energy \| agc \| sqm \| parity \| fused) s Pd (pravděpodobnost detekce) pro každou třídu při cílové Pfa (pravděpodobnost falešného poplachu) a **mezera optimismu** uvnitř proti mimo rozdělení (režim posunu rozdělení). Plus **kompromis PNT kvantové proti klasickému** (`quantum-trade`, `src/quantum_trade.rs`) kvantifikující přínos holdoveru časování/inerciální navigace kandidátních hodin z křivky **naměřené ADEV** proti klasickému základu, s výhradou o spodní mezi pro dlouhé τ nesenou na artefaktu a obálkou odolnosti v čase bez GNSS. Hodnoticí **metriky** (AUC / matice záměn / Pd-Pmd, Pmd je pravděpodobnost zmeškané detekce) jsou **ověřeny na přesnou shodu proti scikit-learn 1.9.0** — včetně **skutečné telemetrie ESA OPS-SAT** (datová sada pro detekci anomálií OPSSAT-AD, Ruszczak et al. 2025, CC BY 4.0 — Creative Commons Attribution 4.0), kde Mann–Whitneyho ROC AUC z Kshana reprodukuje `roc_auc_score` ze scikit-learn na < 1e-9 na odloženém testovacím rozdělení a transparentní detektor počtu špiček odděluje označené anomálie při AUC ≈ 0.85 (`tests/opssat_ad_reference.rs`) — a numerická **jádra** enginu kompromisů (proložení ADEV NNLS — nezáporné nejmenší čtverce —, pásma konzistence χ², van Loanova matice Q hodin) **proti scipy 1.17.1**; čísla o přínosu zařízení postavená nad tím zůstávají provozními charakteristikami **MODELLED** — nikdy terénní/IQ (vzorky ve fázi/kvadratuře) data, žádný verdikt dobrý/špatný. Na testovacím prostředí staví hlubší **studie mezery optimismu** (`src/impairment_study.rs`, `impairment_ml.rs`, `eval_stats.rs`), která boduje panel **13 detektorů** (energy/AGC/SQM/parity plus detektory se seedem: logistická regrese a MLP — vícevrstvý perceptron — s jednou skrytou vrstvou), prokládá **škálovací zákony** uvnitř proti mimo rozdělení s permutační nulovou hypotézou a učí se **prediktor typu leave-one-out** degradace mimo rozdělení ze statistik uvnitř rozdělení (`cargo run --example optimism_study`). **Front end softwarově definovaného přijímače** (`src/sdr.rs` — surové IQ/IF (mezifrekvence) → odbočky korelátoru early/prompt/late → SQM) a **adaptéry pro příjem skutečných dat** (`src/realdata/` — RINEX, u-blox UBX (binární protokol u-blox), GnssLogger, JammerTest, Yunnan, SatGrid) umožňují stejným detektorům běžet nad lokálně dodanými záznamy (žádné datové sady nejsou uloženy v repozitáři). **Mapa přechodu odolnosti kvantové proti klasickému** při nejistotě parametrů (`src/crossover.rs`; `cargo run --bin crossover_study`) znovu vytváří studie přechodu pro inerciální navigaci a hodiny, na kterých stojí obrázky ve Výsledcích. |
| **Demonstrátor kvantově podporovaného PNT** | Tři spustitelné aplikační oblasti **MODELLED** za otevřeným enginem, každá vydává poctivé `TradeEvidence` + záznam reprezentativnosti / mezer k letu (`src/representativeness.rs`): **důvěryhodný kvantový přenos času** (`quantum-time-transfer`, `src/timetransfer_chain.rs` — komplexní rozpočet optických mřížkových hodin + fotonického spoje proti CSAC (atomové hodiny v čipovém měřítku) + obousměrnému RF, se znovu použitou časovou ochrannou úrovní, bezpečnostním FoM útoku zpožděním/přehráním (1 − P_md) a detekcí anomálií hodin + latencí CUSUM); **kvantová navigace bez GNSS** (`quantum-gnss-free-nav`, `src/quantum_nav_od.rs` — inerciální setrvačný let s interferometrem se studenými atomy proti INS navigační třídy během výpadku GNSS, poctivé v tom, že bez vnějšího určení polohy je bias akcelerometru nepozorovatelný, takže chyba stále roste); a **detekce poruch/anomálií** kvantových systémů (`quantum-anomaly-detect`, `src/quantum_faults.rs` — označený katalog poruch s ROC AUC s bootstrapovým CI (interval spolehlivosti) z vnějšně ověřeného `eval_stats` a minimální detekovatelnou poruchou při pevné míře falešných poplachů). Jsou postaveny na sdílené **knihovně chybových modelů kvantových zařízení** (`src/quantum_devices.rs`) a jednotném **postroji pro kompromis kvantové proti klasickému** (`src/qtrade.rs`). Ověřená jádra, na kterých stojí (hodnoticí metriky proti scikit-learn, jádra kompromisů proti scipy), jsou znovu použita; čísla o přínosu zařízení postavená nad tím zůstávají **MODELLED** — **ilustrativní parametry zařízení/spojů z veřejných zdrojů**, modeluje *třídu*, žádné TRL / letová heritage / certifikace, žádné schválení agenturou. |
| **Úsporné inženýrství a dopad na integritu** | Pohled **ROI na cenu za pokrytí** (návratnost investice) (`src/frugal.rs`) — cena za jednotku dodaného pokrytí pro kompromis architektury — a mapování **zmeškaná detekce → dopad na integritu** (`src/integrity_impact.rs`), které převádí míru zmeškaných detekcí monitoru na jeho příspěvek k riziku integrity. Rozpočty pro podporu rozhodování **MODELLED**, aditivní. |
| **Výměna artefaktů** | **Kshana Interchange Format (KIF)** (`src/interchange.rs`) — verzovaná, samopopisná obálka, která obaluje výsledek scénáře jeho druhem, verzí schématu a označeními MODELLED/VALIDATED, takže uložený artefakt zůstává samodokumentující a starší obálky zůstávají dopředně kompatibilně čitelné. |

Každá schopnost je dostupná jako Rust API, spustitelný scénářový `kind` nebo obojí.
Vyspělost každé schopnosti — *validated*, *runnable* nebo *library* — se sleduje v
[`docs/CAPABILITY.md`](docs/CAPABILITY.md). **Strojově kontrolovaná verifikační matice**
(`src/verification.rs`) vykresluje křížový odkaz požadavek → modul → test → orákulum → stav,
s invarianty poctivosti pokrytými jednotkovými testy, které povolují označení *validated*
pouze tam, kde jej podkládá nezávislé **vnější** orákulum — a které zaznamenávají
hardwarové/PA (zajištění kvality produktu) schopnosti, které Kshana záměrně **neposkytuje**.

</details>

<details>
<summary>Čtyři senzorové balíčky, jak byly poprvé zveřejněny (výsledky)</summary>

### Výsledky

Každý scénář porovnává kvantový senzor s jeho klasickým protějškem během
~1.8 h výpadku GNSS. Čísla jsou reprodukovatelná (`scenario + seed + version`).

<p align="center">
  <img src="docs/assets/figures/scenario-fom.png" alt="Co přinášejí kvantové senzory, když GNSS zmizí, scénář holdoveru hodin: kvantové hodiny udrží 6600 s autonomie proti 2610 s u klasických, s mnohem nižší časovou chybou a dostupností 100% proti 95.6%" width="88%">
  <br><sub>Co přinášejí kvantové senzory, když GNSS zmizí — <code>clock-holdover</code> · seed 42 · vykresleno enginem 0.40.0 a každé číslo výše při každém sestavení znovu zkontrolováno proti aktuálnímu enginu testem <code>tests/published_figures_still_reproduce.rs</code> · <a href="docs/assets/figures/scenario-fom.svg">SVG</a></sub>
</p>

Výhoda **závisí na výpadku a vibracích**, s explicitním bodem zvratu, kde vítězí klasický senzor — poctivě ukázáno napříč žebříčkem technologické připravenosti (údaje optických hodin jsou cíle pozemních demonstrátorů; žádné stronciové optické hodiny dosud neletěly):

<p align="center">
  <img src="paper/crossover/clock.png" alt="Přechod holdoveru hodin kvantové proti klasickým napříč žebříčkem technologické připravenosti, s pásy spolehlivosti" width="62%">
  <br>
  <img src="paper/crossover/inertial.png" alt="Teplotní mapa inerciální výhody kvantového proti klasickému v závislosti na době výpadku a vibracích, s konturou bodu zvratu, kde vítězí klasický senzor" width="96%">
  <br><sub>Přechod odolnosti kvantové proti klasickému — žebříček TRL holdoveru hodin (nahoře) · mapa inerciální výhody s konturou bodu zvratu (dole). Znovu vytvořitelné přes <code>cargo run --release --bin crossover_study</code>.</sub>
</p>

<p align="center">
  <img src="docs/assets/inertial-deadreckoning.svg" alt="Inerciální výpočetní navigace: chyba polohy během výpadku GNSS — kvantový senzor (se studenými atomy) zůstává blízko čáry specifikace, zatímco senzor navigační třídy se rozbíhá na desítky kilometrů" width="80%">
  <br><em>Chyba polohy výpočetní navigace během výpadku GNSS: kvantový senzor (modrý)
  zůstává plochý blízko specifikace; klasický senzor (červený) se rozbíhá na desítky kilometrů.
  Vytvořeno Kshana ze <code>scenarios/imu-deadreckoning.toml</code>.</em>
</p>

| Balíček | Scénář | Kvantový | Klasický |
|------|----------|---------|-----------|
| **1 — Holdover hodin** | `clock-holdover.toml` (specifikace 20 ns) | optické hodiny vydrží celý výpadek | CSAC překročí specifikaci v polovině výpadku |
| **2 — Inerciální výpočetní navigace** | `imu-deadreckoning.toml` (specifikace 100 m) | se studenými atomy: **~41 m**, vydrží celý výpadek | navigační třída: překročí za **~350 s** → desítky km |
| **3 — Přenos času** (optický mezidružicový spoj) | `timetransfer.toml` | optický: měření vzdálenosti **~0.3 mm** | RF (TWSTFT): měření vzdálenosti **~150 mm** |
| **4 — Hybridní fúze** (vrcholný) | `hybrid-pnt.toml` | úplná poloha+časování po celý výpadek | **omezení polohou při ~350 s** |

Vrcholný scénář ukazuje tezi fúze: optický mezidružicový přenos času udrží zamčené i
klasické *hodiny*, čímž izoluje *inerciální* senzor jako slabý článek klasické
sady — tj. kvantová inerciální navigace + optické časování společně.

<p align="center">
  <img src="docs/assets/clock-holdover.svg" alt="Holdover hodin: fázová chyba během výpadku GNSS — optické hodiny zůstávají ve specifikaci 20 ns po celý výpadek, zatímco hodiny v čipovém měřítku ji v polovině výpadku překročí" width="80%">
  <br><em>Holdover hodin během výpadku GNSS: optické hodiny (modré) zůstávají uvnitř
  specifikace 20 ns po celý setrvačný běh; hodiny v čipovém měřítku (červené) ji v průběhu překročí.
  Vytvořeno Kshana ze <code>scenarios/clock-holdover.toml</code>.</em>
</p>

Další scénář, `orbit-gnss-challenged.toml`, odvozuje dostupnost GNSS z
**orbitální geometrie** namísto ručně zadaných oken: kosmická loď uvnitř slupky GNSS
se šíří proti konstelaci Walker podobné GPS a počet viditelných družic
(přímá viditelnost, zákryt Zemí, elevační maska) určuje stav určení polohy v každém
kroku. Během dne má uživatel určení polohy jen ~59% času; kvantové hodiny udrží
časové řešení 5 ns přes každou mezeru (dostupnost **1.0**), hodiny v čipovém měřítku
jen **~0.83**.

<p align="center">
  <img src="docs/assets/orbit-gnss-challenged.svg" alt="Dráha se ztíženým GNSS: časová chyba hodin během dne pro kosmickou loď uvnitř slupky GNSS, kde jsou mezery v pokrytí odvozeny z orbitální geometrie — optické hodiny zůstávají ve specifikaci 5 ns přes mezery, zatímco hodiny v čipovém měřítku ji překročí" width="80%">
  <br><em>Časová chyba během dne s dostupností GNSS odvozenou z orbitální geometrie:
  počet viditelných družic (přímá viditelnost, zákryt Zemí, elevační maska) určuje stav
  určení polohy v každém kroku, takže hodiny musí setrvačně překlenout každou mezeru — optické hodiny udrží
  specifikaci 5 ns, zatímco hodiny v čipovém měřítku ji překročí. Vytvořeno Kshana ze
  <code>scenarios/orbit-gnss-challenged.toml</code>.</em>
</p>

Konstelaci lze zadat i jako skutečné sady dvouřádkových elementů (TLE). *Úplná* TLE
(řádek 1 + řádek 2) se šíří úplným modelem **SGP4/SDP4** — včetně
atmosférického odporu a hlubokovesmírných lunisolárních a 12 h / 24 h rezonančních členů, které
jsou podstatné pro ~12h dráhy GNSS — ověřeno proti oficiálním vektorům AIAA 2006-6753
na nejhorší případ ≈ 4 mm. `scenarios/orbit-sgp4-gps.toml` dodává **skutečný snímek Celestrak
`gps-ops`** provozní konstelace GPS (2021-07-28, 30 družic)
a vyžaduje platné kontrolní součty TLE — sady dvouřádkových elementů jsou otevřená data z katalogu US
Space Force / 18th Space Defense Squadron, redistribuovaná službou Celestrak
(Dr T. S. Kelso, [celestrak.org](https://celestrak.org)); obnovte je pomocí
`scripts/fetch_tles.sh`. Blok jen s řádkem 2 ponechává
analytické šíření dvou těles (`scenarios/orbit-real-tle.toml`); obě formy lze
v jedné konstelaci kombinovat. Konstelaci lze stejně tak sestavit z bloku
záznamů **vysílaných efemerid GPS RINEX-3** — formátu, který přijímač dekóduje —
šířených uživatelským algoritmem IS-GPS-200 a vedených stejnou geometrií
(`scenarios/orbit-rinex.toml`).

</details>

<details>
<summary>Co to je / není, v plném znění</summary>

<a id="what-it-is--is-not"></a>
### Co to je / není

**Je to:** deterministický engine s malým počtem závislostí, pokrývající celý zásobník PNT — orbitální
geometrii, inerciální navigaci, fúzi GNSS/INS, integritu, hodiny a časování.
Spouští scénář (často výpadek GNSS), vyvíjí kalibrované modely chyb senzorů
příslušným odhadovačem a boduje výsledek proti provozním
ukazatelům kvality — a vydává reprodukovatelný výsledek JSON (JavaScript Object Notation) a graf SVG, z
knihovny Rust, rozhraní příkazového řádku (CLI), rozšíření pro Python, modulu WebAssembly v prohlížeči,
**serveru Model Context Protocol (MCP)** pro AI agenty nebo **pluginu pro JetBrains IDE (integrované
vývojové prostředí)**.

**Není to:** letový hardware, návrh kvantového užitečného zatížení, úplný signálový
přijímač GNSS, simulátor rádiového (RF) signálu ani sestava hardware-in-the-loop, ani
certifikovaný avionický produkt — a nenahrazuje MATLAB/Simulink, STK (Systems Tool
Kit) ani Orekit; stojí vedle nich a vyměňuje si s nimi soubory. Věrnost kvantového hardwaru pochází ze
zveřejněných modelů chyb, ne z tohoto nástroje. Podrobná vyspělost každé
schopnosti je zdokumentována v [`docs/CAPABILITY.md`](docs/CAPABILITY.md).

**Není to (zatím):** *úplný* fyzikální engine atomové interferometrie (většina kvantových senzorů
používá zveřejněné Allanovy koeficienty / koeficienty šumového rozpočtu; akcelerometr CAI (interferometr se studenými atomy) má
vrstvu z prvních principů — fáze Mach–Zehnder, projekční šum, pokles kontrastu a
vazba na vibrace, plus systematika Coriolisova jevu a světelného posuvu — ale systematika vlnoplochy a
řešení nejednoznačnosti proužků zůstávají vrstvou plánu vývoje **P2** (fáze 2 plánu vývoje, vrstva kvantové fyziky),
viz [`ROADMAP.md`](ROADMAP.md) a [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md));
certifikovaný nebo hardwarový přijímač GNSS (řeší určení polohy jednoho bodu **PVT** (poloha, rychlost a čas)
ze skutečných kódových pozorování RINEX (Receiver Independent Exchange Format) — ověřeno
na skutečných datech IGS (International GNSS Service) — a jeho vrstva IQ (`kshana iq`, od 0.31.0)
softwarově zachytává a sleduje zaznamenané nebo vygenerované vzorky základního pásma, jako analytický
přijímač: nebudí rádiový hardware ani nevysílá, není certifikovaným přijímačem a neprovádí
určování polohy z fáze nosné (RTK ani PPP)); ani úplná sada pro návrh misí (má stavební bloky Lambert / porkchop /
manévr / určování oběžné dráhy, ale je vrstvou výkonové simulace
*nad* GMAT (General Mission Analysis Tool)/Orekit, nikoli jejich náhradou). Toto vymezení je záměrné. Pokud potřebujete rozpočty chyb
interferometru se studenými atomy z prvních principů (např. na úrovni CARIOQA-PMP — Cold Atom Rubidium Interferometry
in Orbit for Quantum Accelerometry, Pathfinder Mission Preparation — nebo validaci ve stylu X-37B), podívejte se na
plán vývoje P2 a [ozvěte se](#support--professional-services) ke spolupráci.

</details>

### Navigace na nízké oběžné dráze

Družice na nízké oběžné dráze (LEO) přelétají rychle a hlasitě. Druh `leo-pnt-chain` sleduje jeden
systém všemi stupni: signál, přelet a jeho spoj, navigační zprávu a
fúzované určení polohy, rychlosti a času (PVT) a přesné určování polohy bodu (PPP). Každý
stupeň předává svá čísla dalšímu. Viz [`docs/LEO-PNT.md`](docs/LEO-PNT.md).

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-leo-chain-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-leo-chain-light.svg">
  <img src="docs/assets/readme/flow-leo-chain-light.svg" alt="Řetězec PNT v LEO ze skutečného běhu leo-pnt-chain (leo-pnt-end-to-end.toml): stupeň signálu (generic-l na 1191.795 MHz, pilot sledovaný při 10.23 Mchip/s) předává stupni přeletu (1080 km, vrchol sledovaného C/N0 58.2 dB-Hz), který předává navigační zprávě (kepler-rac, proložení 300 s, SISRE reprezentace 0.91 mm RMS, 0.250 m s určováním oběžné dráhy), která napájí fúzované určení polohy (jen GNSS 1.60 m RMS 3D, GNSS plus LEO 0.43 m) a přesné určování polohy bodu (konvergence 11.5 min jen s GNSS, 7.5 min s 240 družicemi LEO). Mezi stupni se předává 11 hodnot." width="100%">
</picture>

<a id="every-scenario-kind-by-family"></a>
### Každý druh scénáře podle rodiny

Druhy scénářů enginu, zařazené do rodin. Každá rodina má stránku s jednou položkou na druh (popis
a pole z enginu, příklad příkazu, hlavní čísla z běhu, řádky
[verifikační matice](docs/VERIFICATION-MATRIX.md), které jej jmenují, a graf, který engine sám zapíše) a
přehledový arch těchto grafů; [`docs/KINDS.md`](docs/KINDS.md) je všechny indexuje. Tabulku zapisuje
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) a stránky
[`tools/gen_kinds_index.py`](tools/gen_kinds_index.py) a oba selžou, pokud engine získá druh, který žádná rodina nejmenuje.

<!-- generated:kind-families -->
| Rodina | Na co odpovídá | Druhy | Spusťte jeden |
|---|---|---|---|
| **[Hodiny, časování a holdover](docs/kinds/clocks-timing-and-holdover.md)** | jak dlouho hodiny udrží čas bez GNSS a jak časovací systém obstojí proti svým maskám | [`clock`](docs/kinds/by-kind/clock.md), [`sweep`](docs/kinds/by-kind/sweep.md), [`sweep-nd`](docs/kinds/by-kind/sweep-nd.md), [`telecom-timing`](docs/kinds/by-kind/telecom-timing.md), [`slot-timing`](docs/kinds/by-kind/slot-timing.md), [`timetransfer`](docs/kinds/by-kind/timetransfer.md), [`time-transfer-budget`](docs/kinds/by-kind/time-transfer-budget.md), [`holdover-test`](docs/kinds/by-kind/holdover-test.md), [`quantum-time-transfer`](docs/kinds/by-kind/quantum-time-transfer.md) | `kshana scenarios/clock-holdover.toml` |
| **[Inerciální, fúzní a kvantové senzory](docs/kinds/inertial-fusion-and-quantum-sensors.md)** | výpočetní navigace a fúze senzorů během výpadku GNSS, s klasickými a kvantovými senzory | [`inertial`](docs/kinds/by-kind/inertial.md), [`hybrid`](docs/kinds/by-kind/hybrid.md), [`fusion`](docs/kinds/by-kind/fusion.md), [`hybrid-ukf`](docs/kinds/by-kind/hybrid-ukf.md), [`gnss-ins`](docs/kinds/by-kind/gnss-ins.md), [`ins-trn-coast`](docs/kinds/by-kind/ins-trn-coast.md), [`quantum-gnss-free-nav`](docs/kinds/by-kind/quantum-gnss-free-nav.md), [`quantum-anomaly-detect`](docs/kinds/by-kind/quantum-anomaly-detect.md), [`quantum-trade`](docs/kinds/by-kind/quantum-trade.md) | `kshana scenarios/gnss-ins.toml` |
| **[Alternativní PNT bez GPS](docs/kinds/gps-denied-alternative-pnt.md)** | navigace podle gravitace, terénu a dalších polí, když GNSS zmizí | [`gravity-map`](docs/kinds/by-kind/gravity-map.md), [`terrain-nav`](docs/kinds/by-kind/terrain-nav.md), [`terrain-slam`](docs/kinds/by-kind/terrain-slam.md), [`combined-altpnt`](docs/kinds/by-kind/combined-altpnt.md), [`conflict-resilience`](docs/kinds/by-kind/conflict-resilience.md) | `kshana scenarios/combined-altpnt.toml` |
| **[Konstelace, pokrytí a geometrie](docs/kinds/constellations-coverage-and-geometry.md)** | kde jsou družice, kdo je vidí a jak dobrá je geometrie, kolem Země, Měsíce nebo Marsu | [`orbit`](docs/kinds/by-kind/orbit.md), [`ephemeris`](docs/kinds/by-kind/ephemeris.md), [`constellation-design`](docs/kinds/by-kind/constellation-design.md), [`solar-system`](docs/kinds/by-kind/solar-system.md), [`body-pnt`](docs/kinds/by-kind/body-pnt.md), [`mars-pnt`](docs/kinds/by-kind/mars-pnt.md), [`passes`](docs/kinds/by-kind/passes.md) | `kshana scenarios/orbit-gnss-challenged.toml` |
| **[Měření GNSS, určování polohy a integrita](docs/kinds/gnss-measurements-positioning-and-integrity.md)** | pseudovzdálenosti, určení polohy, ochranné úrovně a kosmické prostředí | [`integrity`](docs/kinds/by-kind/integrity.md), [`gnss-sim`](docs/kinds/by-kind/gnss-sim.md), [`pvt`](docs/kinds/by-kind/pvt.md), [`araim-reference-check`](docs/kinds/by-kind/araim-reference-check.md), [`space-weather`](docs/kinds/by-kind/space-weather.md), [`realtime-frame-eop`](docs/kinds/by-kind/realtime-frame-eop.md) | `kshana scenarios/integrity-raim.toml` |
| **[Rušení, spoofing a spektrum](docs/kinds/jamming-spoofing-and-the-spectrum.md)** | jak se interference dostane k přijímači a zda je detekována | [`jamming`](docs/kinds/by-kind/jamming.md), [`spoof`](docs/kinds/by-kind/spoof.md), [`spoof-detect`](docs/kinds/by-kind/spoof-detect.md), [`tracking-loop`](docs/kinds/by-kind/tracking-loop.md), [`spectrum`](docs/kinds/by-kind/spectrum.md), [`impairment-eval`](docs/kinds/by-kind/impairment-eval.md) | `kshana scenarios/jamming-demo.toml` |
| **[Navigace na nízké oběžné dráze](docs/kinds/low-earth-orbit-navigation.md)** | přelet, spoj, navigační zpráva a fúzované určení polohy, stupeň po stupni | [`leo-signal`](docs/kinds/by-kind/leo-signal.md), [`leo-pass`](docs/kinds/by-kind/leo-pass.md), [`leo-navmsg`](docs/kinds/by-kind/leo-navmsg.md), [`leo-pvt`](docs/kinds/by-kind/leo-pvt.md), [`leo-ppp`](docs/kinds/by-kind/leo-ppp.md), [`ntn-positioning`](docs/kinds/by-kind/ntn-positioning.md), [`leo-pnt-chain`](docs/kinds/by-kind/leo-pnt-chain.md) | `kshana scenarios/leo-pnt-end-to-end.toml` |
| **[Lunární a cislunární](docs/kinds/lunar-and-cislunar.md)** | navigace, čas, soustavy a geodézie u Měsíce | [`lunar-integrity`](docs/kinds/by-kind/lunar-integrity.md), [`lunar-time-offset`](docs/kinds/by-kind/lunar-time-offset.md), [`lunar-time-budget`](docs/kinds/by-kind/lunar-time-budget.md), [`lunar-ascent`](docs/kinds/by-kind/lunar-ascent.md), [`lunar-surface`](docs/kinds/by-kind/lunar-surface.md), [`lunar-descent`](docs/kinds/by-kind/lunar-descent.md), [`lunar-orbit-rendezvous`](docs/kinds/by-kind/lunar-orbit-rendezvous.md), [`lunar-vlbi`](docs/kinds/by-kind/lunar-vlbi.md), [`lunar-vlbi-fim`](docs/kinds/by-kind/lunar-vlbi-fim.md), [`lunar-joint-od-clock`](docs/kinds/by-kind/lunar-joint-od-clock.md), [`lunar-frame-realisation`](docs/kinds/by-kind/lunar-frame-realisation.md), [`lunar-frame-campaign`](docs/kinds/by-kind/lunar-frame-campaign.md), [`lunar-llr-datum`](docs/kinds/by-kind/lunar-llr-datum.md), [`moonlight-service-volume`](docs/kinds/by-kind/moonlight-service-volume.md), [`lunar-differential-pnt`](docs/kinds/by-kind/lunar-differential-pnt.md), [`lunar-station-coverage`](docs/kinds/by-kind/lunar-station-coverage.md), [`lunar-beacon`](docs/kinds/by-kind/lunar-beacon.md), [`lunar-interop-export`](docs/kinds/by-kind/lunar-interop-export.md), [`cislunar-observability`](docs/kinds/by-kind/cislunar-observability.md), [`cislunar-arc-recovery`](docs/kinds/by-kind/cislunar-arc-recovery.md), [`lunar-attack-surface`](docs/kinds/by-kind/lunar-attack-surface.md), [`lunar-jamming`](docs/kinds/by-kind/lunar-jamming.md), [`earth-gnss-lunar`](docs/kinds/by-kind/earth-gnss-lunar.md), [`lunar-infrastructure`](docs/kinds/by-kind/lunar-infrastructure.md) | `kshana scenarios/lunar-infrastructure-od-consistency.toml` |
| **[Navigace kosmických uživatelů](docs/kinds/space-user-navigation.md)** | signály GNSS pro kosmické lodě nad drahami GNSS, kolem nich a za nimi | [`gnss-ssv`](docs/kinds/by-kind/gnss-ssv.md) | `kshana scenarios/gnss-ssv-shell.toml` |
| **[Optické PNT](docs/kinds/optical-pnt.md)** | optické spoje atmosférou a ukazatele kvality optiky plus RF | [`optical-atmosphere`](docs/kinds/by-kind/optical-atmosphere.md), [`hybrid-optical-rf`](docs/kinds/by-kind/hybrid-optical-rf.md) | `kshana scenarios/optical-atmosphere-network.toml` |
| **[Analýza mise, spoje a kosmický provoz](docs/kinds/mission-analysis-links-and-space-operations.md)** | start, výstup, vstup do atmosféry, orientace, spoje, plánování kontaktů a formáty souborů | [`launch-window`](docs/kinds/by-kind/launch-window.md), [`ascent-losses`](docs/kinds/by-kind/ascent-losses.md), [`reentry`](docs/kinds/by-kind/reentry.md), [`entry-heating`](docs/kinds/by-kind/entry-heating.md), [`eo-coverage`](docs/kinds/by-kind/eo-coverage.md), [`eo-radiometry`](docs/kinds/by-kind/eo-radiometry.md), [`attitude-budget`](docs/kinds/by-kind/attitude-budget.md), [`aocs`](docs/kinds/by-kind/aocs.md), [`link-budget`](docs/kinds/by-kind/link-budget.md), [`acm-link`](docs/kinds/by-kind/acm-link.md), [`contact-schedule`](docs/kinds/by-kind/contact-schedule.md), [`aperture-duty-cycle`](docs/kinds/by-kind/aperture-duty-cycle.md), [`space-packet`](docs/kinds/by-kind/space-packet.md), [`oem-interop`](docs/kinds/by-kind/oem-interop.md) | `kshana scenarios/launch-window.toml` |
| **[Misijní vlákna](docs/kinds/mission-threads.md)** | rozpočet chyb navigace a časování řetězce fází od startu po vstup do atmosféry | [`mission-thread`](docs/kinds/by-kind/mission-thread.md) | `kshana scenarios/mission-thread-artemis-class.toml` |
| **[Kampaně](docs/kinds/campaigns.md)** | řetězené mise, procházení parametrů a soubory sestavené z ostatních druhů | [`campaign`](docs/kinds/by-kind/campaign.md) | `kshana scenarios/campaign-jam-spoof-holdover-integrity.toml` |
<!-- /generated:kind-families -->

<a id="every-command"></a>
### Každý příkaz

`kshana <scenario.toml>` spustí scénář; každý další příkaz je podpříkaz a `kshana --help` vypíše použití
všech z nich. Příkazy jsou `--study`, `--validate`, `kinds`, `example`, `receiver-trust` (s `live` a
`evidence`), `evidence` (`keygen`, `verify`, `attach-timestamp`, `round-trip`), `jammertest` (`import`, `score`),
`trust-telemetry`, `imu-fit`, `nmea-scenario`, `interference-map` (`adsb`, `ais`, `daily`, `sensitivity`,
`fetch-land`), `route-exposure`, `bench` (`spec`, `truth`, `cases`, `score`, `baseline`, `seal`, `reveal-check`,
`manifest`, `verify-manifest`, `validate`, `leaderboard`), `bench-export`, `compliance-report`,
`lunanet-afs-check`, `standards-pack`, `partner` (`check`), `osnma`, `iq` (`scene`, `acquire`, `track`, `sweep`, `labfit`, `campaign`,
`conditions`, `frontend`, `monitor`, `inventory`, `info`, `extract`, `convert`, `decimate`), `sky` a `skyline`.
[`docs/COMMANDS.md`](docs/COMMANDS.md) uvádí účel každého z nich, ověřený příklad a jeho stránku dokumentace.

<a id="every-surface"></a>
### Každé rozhraní

Jeden engine, stejné výsledky všude: příkazový řádek, knihovna Rust, Python, JavaScript a WebAssembly,
server MCP s příkazy a dovednostmi pluginu, Kshana Studio (každá stránka běží v prohlížeči, bez instalace, nic se nenahrává),
integrace ROS 2, Signal K, OpenCPN, GNSS-SDR a `gnss_lib_py`, nasazovací sady systemd, Docker a Grafana a
plugin pro JetBrains. [`docs/ALL-SURFACES.md`](docs/ALL-SURFACES.md) je uvádí i s tím, jak každé získat, a s názvy všech
příkazů a dovedností pluginu a stránek Studia; [`docs/SURFACES.md`](docs/SURFACES.md) pro každý příkaz a druh uvádí,
které rozhraní jej nese a která ne, i s důvodem.

<a id="how-a-run-works"></a>
## Jak probíhá běh

Scénář je soubor TOML (Tom's Obvious, Minimal Language): druh, seed a
parametry. Engine jej spustí a zapíše vedle něj výsledek, graf a zprávu a
exporty, o které požádáte.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-pipeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-pipeline-light.svg">
  <img src="docs/assets/readme/flow-pipeline-light.svg" alt="Jak probíhá běh. Soubor scénáře TOML (druh, seed a jeho parametry) vstupuje do enginu kshana 0.40.0 přes rozcestník api::run_toml nad 92 druhy scénářů, deterministicky ze scénáře, seedu a verze enginu. Engine zapíše result.json, chart.svg, report.html a report.json, table.csv u druhů, které ji definují, a na požádání exporty SP3, CCSDS OMM a OEM, CZML, KML, GeoJSON, STK a SigMF; sada zapíše study.json a study.html. Tyto soubory napájejí Kshana Studio v prohlížeči, AI asistenta přes server kshana-mcp a průběžnou integraci." width="100%">
</picture>

Tento přibalený scénář běží 2 h: 10 min s GNSS, pak zhruba 1.8 h s odepřeným GNSS. Ptá se,
jak dlouho stronciové optické mřížkové hodiny a atomové hodiny v čipovém měřítku (CSAC) každé udrží
čas s přesností 20 ns.

```bash
kshana example clock-holdover > clock-holdover.toml
kshana clock-holdover.toml
```

```text
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote clock-holdover.result.json, clock-holdover.chart.svg, clock-holdover.report.html, and clock-holdover.report.json
```

Optické hodiny udrží rozpočet 20 ns po celý výpadek 6600 s; CSAC jej udrží
2610 s a je v rámci rozpočtu po 95.6% běhu proti 100% u optických hodin.
`kshana example` vypíše všechny přibalené scénáře.

<a id="missions"></a>
## Mise

Deset sektorů klade témuž enginu deset různých otázek. Každý má přibalené scénáře, od kterých
lze začít.

| Sektor | Začněte s |
|---|---|
| Obrana a bezpečnost | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| Kosmos, oběžná dráha Země | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| Měsíc, Mars a hluboký vesmír | `lunar-relay-constellation`, `mars-orbit-pnt` |
| Letectví a drony | `small-uas-jammed-nav`, `araim-gps-galileo` |
| Námořní doprava | `maritime-strait-jamming`, `maritime-port-approach-coast` |
| Silniční doprava | `automotive-urban-canyon` |
| Železnice | `rail-tunnel-coast` |
| Kritická infrastruktura a časování | `clock-holdover`, `clock-ensemble` |
| Telekomunikace a 5G (pátá generace mobilních sítí) | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| Věda a výzkum | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

<details>
<summary>Otázka, kterou klade každý sektor</summary>

<br>

| Sektor | Otázka, kterou klade | Začněte s |
|---|---|---|
| **Obrana a bezpečnost** | Jak dlouho zůstanou naše navigace a časování důvěryhodné při rušení a spoofingu a které vrstvy nás udrží ve specifikaci? | `campaign-jam-spoof-holdover-integrity`, `spoof-meaconing` |
| **Kosmos: oběžná dráha Země** | Vidí moje kosmická loď dost navigačních družic, jak dlouho její hodiny udrží čas mezi určeními polohy a co by přidala navigační vrstva na nízké dráze? | `orbit-gnss-challenged`, `leo-pnt-end-to-end` |
| **Měsíc a hluboký vesmír** | Získá lander, rover nebo orbiter u Měsíce, u Marsu nebo dále důvěryhodnou polohu a čas? | `lunar-relay-constellation`, `mars-orbit-pnt` |
| **Letectví a drony** | Poté, co rušička odebere GNSS, jak dlouho zůstane můj bezpilotní letecký systém (UAS) v rámci rozpočtu polohy a je na mé trase dostupná integrita? | `small-uas-jammed-nav`, `araim-gps-galileo` |
| **Námořní doprava** | Jak daleko přes vodu rušička dosáhne, byl by zachycen posun polohy a jak dlouho může loď setrvačně doplout do přístavu? | `maritime-strait-jamming`, `maritime-spoof-position-push`, `maritime-port-approach-coast` |
| **Silniční a automobilová doprava** | Jak daleko se auto odchýlí pod nadjezdem nebo kolem rušičky u silnice? | `automotive-urban-canyon` |
| **Železnice** | Kolik sekund v tunelu ještě vlak dokáže rozlišit, na které koleji je? | `rail-tunnel-coast` |
| **Kritická infrastruktura a časování** | Pokud se čas GNSS ztratí nebo je podvržen, jak dlouho udrží elektrická síť, obchodní místo nebo datové centrum navázaný čas? | `clock-holdover`, `clock-ensemble` |
| **Telekomunikace a 5G** | Pokud se časová reference GNSS ztratí, zůstanou hodiny mé sítě uvnitř masek ITU-T a jak dlouho? | `telecom-prtc-holdover-24h`, `leo-vertical-5g-network-timing` |
| **Věda a výzkum** | Mohu reprodukovat, rozšířit a citovat výsledek PNT, až po seed? | `sweep-clock-stability`, `quantum-pnt-demonstrator.suite` |

</details>

<a id="evidence"></a>
## Důkazy

<p><a href="docs/SGP4-VALIDATION.md"><img src="https://img.shields.io/badge/SGP4-666%2F666%20AIAA%20vectors%20%C2%B7%20worst%204.12%20mm-377D0C?style=flat-square&labelColor=0A1226" alt="SGP4 zkontrolováno proti všem 666 referenčním vektorům AIAA 2006-6753, nejhorší chyba polohy 4.12 mm"></a></p>

<strong>176 ze 401</strong> schopností je ověřeno proti nezávislým vnějším orákulům; 221 je poctivě označeno jako Modelled.
Každý řádek verifikační matice jmenuje schopnost, orákulum, proti kterému je kontrolována,
test, který kontrolu provádí, a označení, které z toho plyne. Průběžná integrace (CI) znemožňuje
označit schopnost jako VALIDATED bez nezávislého vnějšího orákula.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-verification-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-verification-light.svg">
  <img src="docs/assets/readme/flow-verification-light.svg" alt="Jak schopnost získává své označení. Každý řádek verifikační matice jmenuje schopnost, orákulum, proti kterému je kontrolována, test, který kontrolu provádí v průběžné integraci, a označení, které z toho plyne. Řádek smí být VALIDATED pouze s nezávislým vnějším orákulem; jinak je MODELLED, nebo PARTNER, když jej vlastní hardwarový partner. Příklad: SGP4/SDP4, Cowell 6-DOF + perturbace, dávkové/sekvenční OD, orákulum verifikační vektory SGP4 AIAA 2006-6753, test tests/sgp4_verification.rs, označení VALIDATED. Aktuální počty: 176 VALIDATED, 221 MODELLED, 4 PARTNER ze 401 řádků. Celkem 176 schopností ověřeno proti nezávislým vnějším orákulům; dalších 221 je poctivě označeno MODELLED a 4 vlastní PARTNER." width="100%">
</picture>

| Označení | Řádky | Význam |
|---|---|---|
| VALIDATED | 176 | souhlasí nezávislé vnější orákulum: skutečná data, nezávislá implementace nebo zveřejněné referenční vektory |
| MODELLED | 221 | kontrolováno proti analytické pravdě nebo vnitřní konzistenci simulace, a to otevřeně řečeno |
| PARTNER | 4 | vlastní hardwarový partner; Kshana pro to nemá žádné orákulum |

Několik z kontrol: všech 666 vektorů AIAA (American Institute of Aeronautics and Astronautics)
2006-6753 SGP4 (Simplified General Perturbations 4) na 4.12 mm; Cowellův silový
model na 0.08 m proti Orekit 12.2; Galileo na 0.61 m a Swarm-A na 0.10 m proti skutečným
přesným efemeridám Evropské kosmické agentury (ESA). Testy drží řádkové pokrytí `src/` blízko 95 %,
v CI hlídané na 85 %. Registrem je
[`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), generovaný ze
`src/verification.rs`: [úplná matice o 401 řádcích](docs/VERIFICATION-MATRIX.md) a proč každý
řádek Modelled nemá vnější orákulum, viz [`docs/MODELLED-RATIONALE.md`](docs/MODELLED-RATIONALE.md).

<details>
<summary>Jak funguje validace, vybraná tabulka hlavních bodů a obrázky důkazů</summary>

### Validace, reprodukovatelnost a poctivost

- Každý šumový člen je kalibrován na **zveřejněný, citovaný** údaj a ověřen
  proti standardnímu vztahu (Allanova deviace pro hodiny; Grovesův růst chyby
  výpočetní navigace pro inerciální navigaci; převod časování→vzdálenost pro přenos času). Stav
  každého členu se sleduje v [`docs/VALIDATION.md`](docs/VALIDATION.md) jako `validated` nebo
  `not modeled` — nic není prezentováno jako ověřené, pokud to tak není.
- **Reprodukovatelné z principu:** `scenario + seed + engine version → identical
  bits`. `scripts/check-reproducible.sh` to vynucuje; kvantové a klasické běhy používají
  nezávislé seedy, takže jejich šum je nekorelovaný.
- Vyspělost je uváděna poctivě: údaje optických hodin a optických spojů jsou výsledky *cílů /
  pozemních demonstrátorů*, nikoli letové.

### Označení důkazů na každém obrázku

Každý obrázek a tabulka, které běh zapíše, říkají, nakolik jim věřit a o které řádky registru se to opírá. Výsledný JSON má
klíč `evidence`, graf SVG řádek pod grafem (a prvek `<metadata id="kshana-evidence">`) a tabulka CSV
komentářové řádky `# evidence:` na začátku (čtěte s `comment='#'`). Jmenuje úroveň, `VALIDATED`, `MODELLED` nebo `PARTNER`, a
id (`VM-` a osm šestnáctkových číslic) řádků verifikační matice, které běh použil. Úroveň je nejslabší z těchto
řádků, takže běh, který se opírá o jeden modelovaný řádek, je označen MODELLED bez ohledu na to, kolik ověřených řádků stojí vedle; označení
nikdy nemůže tvrdit víc než registr. Řádky, stavy a id se čtou z matice, nepíší se ručně
([`docs/VERIFICATION-MATRIX.md`](docs/VERIFICATION-MATRIX.md), [`docs/SCHEMA.md`](docs/SCHEMA.md)) a
`tests/evidence_labels_doc_sync.rs` selže, pokud obrázek nemá označení nebo se označení s maticí neshoduje.

### Validace v kostce

Každý řádek je v CI vynucen pojmenovaným testem. Tato tabulka je **vybraný přehled hlavních bodů**;
úplná strojově kontrolovaná matice má **401 řádků — 176 VALIDATED, 221 MODELLED, 4 PARTNER**
(`src/verification.rs`), s úplnými důkazy (a tím, co poctivě *ještě není*
ověřeno) v [`docs/VALIDATION.md`](docs/VALIDATION.md) a v artefaktu pro každé vydání
[`kshana-validation-summary.html`](https://github.com/ashfordeOU/kshana/releases)
(generovaném příkazem `cargo run --bin validation_report`, s atestací SLSA — Supply-chain
Levels for Software Artifacts).

Sloupec **Stav** uvádí *druh* důkazu, v souladu s žebříčkem validace výše: **VALIDATED** = zkontrolováno proti nezávislému vnějšímu orákulu (skutečná data, nezávislá knihovna nebo zveřejněné referenční vektory); **MODELLED** = zkontrolováno proti analytické pravdě nebo vnitřní konzistenci simulace (žádná nezávislá vnější datová sada). VALIDATED popisuje *metodu* kontroly, nikoli úspěch/neúspěch — poctivé nesplnění proti skutečnému vnějšímu orákulu zůstává VALIDATED, zatímco srovnání, které žádný řádek matice nejmenuje jako orákulum (proložení LRO — Lunar Reconnaissance Orbiter — výše), je uvedeno jako MODELLED. Řádky `CI` jsou procesní pojistky, nikoli ukazatele kvality. Několik ostrůvků skutečných dat (naměřené cesiové hodiny, Stable32 PHASE.DAT a kontroly OPS-SAT/ICGEM, kde surové vstupy nemají licenci k redistribuci) je **podmíněno daty**: test vypíše oznámení o přeskočení a zůstane zelený, když vstup chybí, a veřejná referenční čísla jsou uložena v `tests/fixtures/`. Surové vstupy reprodukujete odpovídajícím `scripts/fetch_*.sh`.

| Stav | Schopnost | Shoda | Reference / orákulum |
|--------|------------|-----------|--------------------|
| **VALIDATED** | Šíření SGP4/SDP4 | 666/666 vektorů, nejhorší **4.12 mm** | AIAA 2006-6753 (Vallado `tcppver.out`) + přímé srovnání s nezávislým crate `sgp4` |
| **VALIDATED** | Referenční soustavy — nutace IAU 2000A/B, řetězec CIO IAU 2006/2000A, ERA | **bit po bitu** (X,Y na 1e-14, s na 1e-18, ERA na 1e-12) | ERFA/SOFA `eraXys06a` · `eraC2ixys` · `eraEra00` · `eraNut00a/b` |
| **MODELLED** | GCRS→ITRS proti nezávislému enginu SPICE | max **0.028″** → ≤ 0.86 m na zemi, ≤ 3.6 m na dráze GNSS | ANISE (NAIF/SPICE v čistém Rustu), stejné IERS `finals2000A` EOP, 8 epoch 2020–2023 (porovnáno s touto referencí; žádný řádek verifikační matice ji nejmenuje jako vnější orákulum, proto není označeno VALIDATED) |
| **MODELLED** | Geopotenciál EGM2008 (stupeň/řád 70) | zrychlení = ∇V na **< 1e-6**; zonální redukce na ověřené J2 | koeficienty NGA EGM2008 + analytická identita ∇V |
| **VALIDATED** | Syntéza gravitačního funkcionálu (mapa pro navigaci s podporou gravitace / bez GNSS) | GRS80 Somigliana + γ_e/γ_p na **3.5e-12**; skutečná mapa poruch EGM2008 fyzikálně věrohodná (RMS ≈ 26 mGal, s/ř 70) | Somiglianovo normální tíhové zrychlení GRS80 (Moritz 1980, IAG — International Association of Geodesy) + skutečné ICGEM EGM2008 (`tests/icgem_gravity_reference.rs`) |
| **VALIDATED** | Allanovy odhadovače (ADEV/MDEV/TDEV/HDEV) + pásma spolehlivosti | reprodukují referenční deviace; pásma χ² se shodují | NIST SP 1065 (Riley), 1000bodová Tabulka 31/32 |
| **VALIDATED** | Allanovy odhadovače na **skutečných naměřených cesiových hodinách** | OADEV/OHDEV na **1e-3** (pozorováno ≤ 3e-5), 16 průměrovacích faktorů | Stable32 na skutečném 5071A Cs proti H-maseru, 556,990 bodů (`tests/cs5071a_reference.rs`, podmíněno daty) |
| **VALIDATED** | Allanovy odhadovače na **kanonickém Stable32 PHASE.DAT** | OADEV/MDEV/TDEV na **1e-3** (pozorováno ≤ 5e-5), 139 průměrovacích faktorů | referenční deviace Stable32 pro PHASE.DAT (`tests/phasedat_reference.rs`, podmíněno daty) |
| **MODELLED** | Model chyb IMU — ARW / VRW / nestabilita biasu | obnoveno na **< 5 %** (nestabilita biasu < 15 %) | katalogový list Analog Devices ADIS16465; referenční profil NaveGo |
| **VALIDATED** | Numerický Cowellův propagátor + silový model (konzervativní úrovně) | nejhorší chyba polohy **0.08 m** za 24 h, 278 epoch (LEO + GTO) | Orekit 12.2 `NumericalPropagator`/`DormandPrince853` (CS GROUP), `tests/numerical_cowell_propagator_reference.rs` |
| **MODELLED** | Úroveň odporu v Cowellovi + absolutní vstupy efemerid Slunce/Měsíce a hustoty | úroveň odporu charakterizována ≈ 333 m / 24 h; nerušená dráha odpovídá Keplerovi s univerzální proměnnou pod m, energie/moment ~1e-9 | vestavěné efemeridy nízké přesnosti + analytický Kepler |
| **MODELLED** | Lambert · Ciolkovskij · porkchop | okruh tam a zpět k pravdě dvou těles; ΔV **< 0.01 %** | Izzo 2015 · raketová rovnice · analytická Hohmannova spodní mez |
| **MODELLED** | Určování oběžné dráhy (dávkový Gauss–Newton) | pod m / mm·s⁻¹ bez šumu; ~2 m při šumové spodní mezi 5 m | dvě tělesa + J2 na oblouku RK4 |
| **MODELLED** | Proložení silového modelu proti přesným efemeridám Galileo (celý oblouk) | **0.61 m** 3-D RMS, 24 h, s/ř 70, jen síly | konečná dráha ESA/ESOC `ESA0MGNFIN` (E11), skutečné `finals2000A` EOP (porovnáno s touto referencí; žádný řádek verifikační matice ji nejmenuje jako vnější orákulum, proto není označeno VALIDATED) |
| **MODELLED** | Proložení silového modelu proti přesným efemeridám Swarm-A (snížená dynamika) | **0.10 m** 3-D RMS (mez empirické úrovně, nikoli míra) | přesná dráha ESA `SW_OPER_SP3ACOM_2_` (porovnáno s touto referencí; žádný řádek verifikační matice ji nejmenuje jako vnější orákulum, proto není označeno VALIDATED) |
| **MODELLED** | Proložení silového modelu proti lunárnímu LRO (poctivé nesplnění) | **6.67 m** se sníženou dynamikou, *nad* cílem 5 m | JPL Horizons LRO (NAIF −85) + GRAIL (Gravity Recovery and Interior Laboratory) `GRGM660PRIM` (porovnáno s touto referencí; žádný řádek verifikační matice ji nejmenuje jako vnější orákulum, proto není označeno VALIDATED) |
| **MODELLED** | Hlubokovesmírné OD u Marsu (SRIF se sníženou dynamikou) | **≈ 0.2 m** Mars-LMO (simulační FoM, *nikoli* skutečná mise) | syntetické OD v uzavřené smyčce — validace aparátu odhadovače |
| **MODELLED** | Dynamika Marsu s centrálním Sluncem proti JPL DE440 | **137 m @ 1denní oblouk** (roste s obloukem = nemodelovaná n-tělesa) | JPL DE440 přes ANISE (`xval/anise-mars-od`, podmíněno kernelem) (porovnáno s touto referencí; žádný řádek verifikační matice ji nejmenuje jako vnější orákulum, proto není označeno VALIDATED) |
| **VALIDATED** | Určování polohy jednoho bodu proti zaměřené souřadnici IGS (skutečná pozorování) | **5.7 m** 3-D RMS / **1.1 m** horizontálně, dvoufrekvenční bezionosférické kódové SPP | zaměření stanice IGS ABMF + vysílané efemeridy GPS, 2018-05-13 (`tests/pvt_abmf.rs`) |
| **MODELLED** | Těsně vázaný UKF GNSS/INS | **0.77 m RMS** během 30min přeletu LEO vč. 120 s výpadku | setrvačný let se silovým modelem, ručně odvozeno |
| **MODELLED** | Navigace bez GPS podle gravitační mapy | drift INS ~70 km → obnoveno na **~145 m** | cíl ESA NAVISP *Quantum Wayfarer* |
| **MODELLED** | Navigace s referencí terénu (TERCOM/SITAN) | drift 70 km → **< 500 m** (spodní mez rozlišení mřížky ~140 m) | SRTM `.hgt` DEM; ručně vnesený drift (nekruhová kontrola) |
| **MODELLED** | Hlavní pole IGRF-14 (stupeň/řád 13) | pól ~80.7°N, dipól ~29.7 µT, fyzikální pásmo 22–67 µT | IAGA (International Association of Geomagnetism and Aeronomy) `igrf14coeffs.txt` (Schmidtova seminormalizace) |
| **MODELLED** | Modulace navigačního signálu a sledování kódu | vlastní SSC BPSK = **2/(3·R_c)**; PSD s jednotkovou plochou; jitter C/A DLL **pod metr** @ 45 dB-Hz | kotvy SSC/PSD v uzavřeném tvaru + Kaplanův a Hegartyho vzorec tepelného šumu DLL |
| **MODELLED** | Diferenciální korektor halo/NRHO v CR3BP | STM = konečné diference; dráha se uzavírá na **strojovou přesnost**; L2 9:2 NRHO **≈ 6.57 d / perilunium ≈ 3,250 km** | kontrola STM konečnými diferencemi + zveřejněná jižní 9:2 NRHO kolem L2 (≈ 6.56 d / ≈ 3,370 km) — CR3BP, nikoli skutečné efemeridy Gateway |
| **MODELLED** | Integrita ARAIM pro dvě konstelace | režim poruchy celé konstelace na skutečných GPS + Galileo | EU ARAIM TR (technická zpráva) / DO-316; Celestrak `gps-ops` 2021-07-28 (porovnáno s touto referencí; žádný řádek verifikační matice ji nejmenuje jako vnější orákulum, proto není označeno VALIDATED) |
| **VALIDATED** | Geometrie GNSS / DOP (GDOP/PDOP/HDOP/VDOP/TDOP) | shoda na **1e-6 relativně** v 8 geometriích (dobře podmíněné → téměř singulární) | gnss_lib_py 1.0.4 (Stanford NAV Lab) — nezávislá knihovna (`tests/dop_reference.rs`) |
| **VALIDATED** | Metriky hodnocení ML detektorů (AUC/ROC/matice záměn/Pd-Pmd/přesnost/F1) | **přesné počty + < 1e-9** na 5 datových sadách × 24 prazích | scikit-learn 1.9.0 (Pedregosa et al., JMLR — Journal of Machine Learning Research — 2011) — nezávislá knihovna (`tests/eval_metrics_reference.rs`) |
| **VALIDATED** | ROC AUC detekce anomálií na **skutečné telemetrii ESA OPS-SAT** | AUC reprodukuje scikit-learn na **< 1e-9**; AUC detektoru počtu špiček **≈ 0.85** na označeném testovacím rozdělení | scikit-learn `roc_auc_score` na testovacím rozdělení OPSSAT-AD (Ruszczak et al. 2025, CC BY 4.0) — skutečná telemetrie OPS-SAT (`tests/opssat_ad_reference.rs`) |
| **VALIDATED** | Numerická jádra kvantového kompromisu (proložení ADEV NNLS · pásma konzistence χ² · van Loanova matice Q hodin) | NNLS + Q **přesně**; χ² **< 5e-4** při provozních stupních volnosti ≥ 48 | scipy 1.17.1 — `optimize.nnls` / `stats.chi2.ppf` / `linalg.expm` (`tests/scipy_reference.rs`) |
| **VALIDATED** | Telekomunikační metriky putování MTIE / MDEV / TDEV (ITU-T G.810/G.823/G.8261/G.811 — doporučení Telecommunication Standardization Sector organizace International Telecommunication Union) | MTIE (9 průměrovacích faktorů, bitově přesně) a MDEV + TDEV (8 faktorů, **< 1e-9** relativně) na řadě NIST SP 1065 LCG (lineární kongruenční generátor) | allantools 2024.06 `mtie` / `mdev` / `tdev` — nezávislá knihovna (`tests/mtie_reference.rs`, `tests/mdev_tdev_reference.rs`) |
| **VALIDATED** | Metody studií kompromisů MCDA — všechny čtyři rozhodovací rodiny, devět vnějšně ověřených agregátorů (WSM · WPM · WASPAS · MOORA · COPRAS · TOPSIS · VIKOR · PROMETHEE II · ELECTRE I) plus vážení priorit párovým porovnáním **AHP** | skóre / pořadí / matice konkordance reprodukovány na **< 1e-9** | pymcdm + pyDecision (nezávislé knihovny MCDA třetích stran) + Saaty RI (Random Index) / SciPy-LAPACK eig (`tests/mcda_*_reference.rs`) |
| **VALIDATED** | Dopplerovská obálka LEO z dráhy a nosné | maximum Iridium v rámci **5 %** od zveřejněných ±36 kHz; Xona Pulsar X1 uvnitř zveřejněných **32–34 kHz** | výsledky testů RNTF LEO PNT; Leclère, Marathe & Reid, arXiv:2509.19551 (`tests/leo_doppler_reference.rs`) |
| **MODELLED** | Konvergence PPP s rozšířením LEO | 7.4 → 4.8 / 3.2 / 2.7 / 2.3 min s 60 / 96 / 192 / 288 družicemi LEO, monotónně; NEES filtru uvnitř pásma χ² | trend porovnán s Li et al., J. Geod. 93:749 (2019) (9.6 → 7.0 / 3.2 / 2.1 / 1.3 min); konstelace a šum nereprodukovány |
| **MODELLED** | Podmíněná časová ochranná úroveň (nedetekovaná časová chyba omezená holdoverem při spoofingu) | složení reprodukuje vícekrokovou rekurzi kovariance `clock_state`; kalibrováno na skutečném zaznamenaném spoofingu | skaláry JammerTest 2024 (Zenodo 15911589) + uzavřené tvary van Loan / CUSUM (`examples/tpl_jammertest`) |
| **MODELLED** | Hodnocení odolnosti PNT + nestabilita rozhodnutí | 35 ručně odvozených testů s orákulem; bajtově deterministický artefakt studie (pevný seed) | mapování DHS RPCF v2.0 + uzavřené tvary Dirichlet / Kendall-τ / Hill-N2 — syntetické architektury, nikoli certifikace |
| **MODELLED** | Studie mezery optimismu u RF poruch (škálovací zákony + prediktor leave-one-out) | významnost proti permutační nulové hypotéze; bajtově deterministický artefakt (5 seedů) | syntetický parametricky podložený korpus — hodnoticí *metriky* jsou VALIDATED proti scikit-learn (výše); studie je MODELLED |
| CI | Reprodukovatelnost napříč platformami | bitově identické zlaté vzory vstupu + tvaru na 3 OS (operačních systémech) | matice CI Linux / macOS / Windows, zlaté vzory SHA-256 |
| CI | Pokrytí testy | **~95 % řádků** na `src/` bez `src/*_data.rs` a `src/main.rs`, hlídáno na ≥ 85 % | cargo-tarpaulin (engine LLVM) |

<p align="center">
  <img src="docs/assets/diagrams/validation-provenance.png" alt="Jak schopnost získává své označení: požadavek se mapuje na modul v src, na test v tests, na vnější orákulum (skutečná datová sada, nezávislá referenční implementace nebo zveřejněné vektory), na stav — s pojistkou vynucenou v CI, že žádná schopnost nemůže být Validated bez vnějšího orákula. Aktuální počty: 176 Validated, 221 Modelled, 4 Partner, celkem 401" width="900">
  <br><sub>Jak schopnost získává své označení — invariant vynucený v CI: žádné vnější orákulum ⇒ nemůže být Validated · <a href="docs/assets/diagrams/validation-provenance.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/oracle-kind-stacked.png" alt="Čím je každé tvrzení podloženo: sloupec Validated je z principu 176 ze 176 ExternalDataset (vynuceno v CI); řádky Modelled jsou poctivě označeny InternalConsistency, ReferenceImpl nebo ExternalDataset; řádky Partner nemají žádné orákulum Kshana" width="62%">
  <br>
  <img src="docs/assets/figures/sgp4-regime-bars.png" alt="Nejhorší chyba polohy SGP4/SDP4 proti referenci AIAA 2006-6753 podle režimu, logaritmická stupnice: každý režim je hluboko pod tolerancí AIAA, nejhorší případ 4.12 mm v hlubokovesmírném nerezonančním režimu" width="96%">
  <br><sub>Nahoře: každý řádek Validated je z principu podložen vnější datovou sadou. Dole: SGP4 odpovídá oficiální referenci v každém režimu (nejhorší 4.12 mm). <a href="docs/assets/figures/oracle-kind-stacked.svg">SVG</a> · <a href="docs/assets/figures/sgp4-regime-bars.svg">SVG</a></sub>
</p>

<p align="center">
  <img src="docs/assets/figures/validation-breakdown.png" alt="Stav verifikace všech 401 schopností: 176 Validated (zkontrolováno proti vnějšímu orákulu), 221 Modelled, 4 ve vlastnictví partnera" width="780">
  <br><sub>176 Validated · 221 Modelled · 4 Partner — <a href="docs/assets/figures/validation-breakdown.svg">SVG</a></sub>
</p>

</details>

<a id="capability-domains"></a>
### Domény schopností

Každá schopnost veřejné mapy, podle domény, s označením z registru. Tabulku domén zapisuje
[`tools/gen_readme_blocks.py`](tools/gen_readme_blocks.py) z `web/capabilities.json`, stejného souboru, který
čte mapa všeho ve Studiu.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/figures/domain-coverage-map.svg">
  <img src="docs/assets/figures/domain-coverage-map.svg" alt="Schopnosti Kshana podle domény a vyspělosti: ověřené a modelované veřejné schopnosti v každé doméně, vykreslené z web/capabilities.json nástrojem tools/gen_validation_figures.py" width="900">
</picture>

Úplná tabulka, doménu po doméně s každou schopností a jejím označením, je [`docs/CAPABILITY-DOMAINS.md`](docs/CAPABILITY-DOMAINS.md).

<a id="install"></a>
## Instalace

Nástroj příkazového řádku získáte jedním řádkem: **`cargo install kshana`**. Každý kanál dodává
v0.40.0 ze stejného označeného commitu.

<!-- channels:begin -->
| Kanál | Instalace | Průvodce |
|---|---|---|
| Vyzkoušet v prohlížeči | otevřete https://kshana.dev | [Průvodce Studiem](https://kshana.dev/docs/studio.html) |
| Příkazový řádek (Rust) | `cargo install kshana` | [Použití příkazového řádku](https://kshana.dev/docs/rust.html#usage--cli) |
| Knihovna Rust | `cargo add kshana` | [Reference API na docs.rs](https://docs.rs/kshana) |
| Python | `pip install kshana` | [Průvodce API pro Python](https://kshana.dev/docs/python-api.html) |
| JavaScript a WebAssembly | `npm install kshana` | [Průvodce npm a WebAssembly](https://kshana.dev/docs/npm.html) |
| AI asistent (server MCP, cargo) | `cargo install kshana-mcp` | [Průvodce serverem MCP](https://kshana.dev/docs/mcp.html) |
| Obraz Docker | `docker run --rm -i ghcr.io/ashfordeou/kshana-mcp` | [Průvodce serverem MCP: Docker](https://kshana.dev/docs/mcp.html#install) |
| Rozšíření Claude Desktop | dvakrát klikněte na `.mcpb` pro váš systém: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) · [Linux (x86-64)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-unknown-linux-gnu.mcpb) · [Linux (Arm)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-unknown-linux-gnu.mcpb) | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Cursor (jedním kliknutím) | [Přidat do Cursoru (npx)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Přidat do Cursoru (Docker)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) · `npx -y kshana-mcp@0.40.0` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| VS Code (jedním kliknutím) | [Instalovat ve VS Code (npx)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Instalovat ve VS Code (Docker)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · `npx -y kshana-mcp@0.40.0` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| npx | `npx -y kshana-mcp@0.40.0` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| uvx / pipx | `uvx kshana-mcp==0.40.0` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| winget | `winget install AshfordeOU.KshanaMcp` | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Předsestavená binárka | stáhněte kshana-mcp-<target> z vydání a zkontrolujte ji proti SHA256SUMS | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Oficiální registr MCP | vyhledejte io.github.ashfordeOU/kshana-mcp | [Všechny instalační úryvky MCP](https://github.com/ashfordeOU/kshana/blob/main/docs/MCP-INSTALL.md) |
| Vzdálený (streamable HTTP), vlastní hosting | `kshana-mcp --http 127.0.0.1:8080` | [Průvodce vlastním hostingem](https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md) |
| Tržiště pluginů Claude Code | `/plugin marketplace add ashfordeOU/kshana` | [Použití Kshana z agenta](https://github.com/ashfordeOU/kshana/blob/main/docs/AGENTS.md) |
| Plugin pro JetBrains IDE | Settings → Plugins → Marketplace → vyhledejte "Kshana" (ID pluginu dev.kshana.ide) | [Průvodce pluginem](https://kshana.dev/docs/jetbrains.html) |
| Plugin Signal K | `npm install signalk-kshana-trust` | [Průvodce pluginem Signal K](https://github.com/ashfordeOU/kshana/blob/main/integrations/signalk/README.md) |
| Plugin OpenCPN | stáhněte tarball pluginu z vydání | [Odeslání do katalogu OpenCPN](https://github.com/ashfordeOU/kshana/blob/main/packaging/opencpn/SUBMITTING.md) |
| Dashboard Grafana | importujte kshana-grafana-*.json z vydání | [Zdroj dashboardu](https://github.com/ashfordeOU/kshana/blob/main/deploy/grafana/kshana-gnss-trust.json) |
| Obraz referenčního sestavení | `docker pull ghcr.io/ashfordeou/kshana-reference-build` | [Námořní integrace](https://github.com/ashfordeOU/kshana/blob/main/docs/MARINE-INTEGRATIONS.md) |
<!-- channels:end -->

<p><a href="https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator"><img src="https://img.shields.io/badge/JetBrains-Marketplace-066A86?style=flat-square&labelColor=0A1226" alt="Kshana na JetBrains Marketplace"></a> <a href="Cargo.toml"><img src="https://img.shields.io/badge/rust-1.88%2B-3F4B67?style=flat-square&labelColor=0A1226" alt="Sestavuje se s Rustem 1.88 nebo novějším, rust-version v Cargo.toml"></a></p>

MCP je Model Context Protocol. Vydání připnete příkazem `cargo install kshana --version 0.40.0`,
`pip install kshana==0.40.0` nebo `npm install kshana@0.40.0`. Sestavení ze zdrojového kódu viz
[Instalace a sestavení](#install--build) v části Reference.

<details>
<summary>Spuštění scénáře z Pythonu a z WebAssembly</summary>

<br>

```python
import json, kshana

toml = open("clock-holdover.toml").read()
result = json.loads(kshana.run(toml))
print(kshana.version(), result["quantum"]["fom"]["holdover_s"], result["classical"]["fom"]["holdover_s"])
# 0.40.0 6600.0 2610.0
```

Kromě `run` modul zpřístupňuje `run_full` (JSON, SVG a jednořádkový souhrn najednou),
`run_typed`, `validate_toml`, `list_kinds` / `scenario_kinds` a `error_kind`; viz
[`docs/PYTHON_API.md`](docs/PYTHON_API.md).

Balíček npm je celý engine zkompilovaný do WebAssembly. V Node.js předejte binárku
`initSync`; v prohlížeči ji `await init()` stáhne (viz [`README.npm.md`](README.npm.md)).

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
## Architektura

Uprostřed stojí jeden otevřený engine a každé rozhraní jej spouští: příkazový řádek, knihovna
Rust, Python, WebAssembly a Kshana Studio, server MCP, obraz Docker a
plugin pro JetBrains. Stejný soubor scénáře dává na každém z nich stejné bajty. Kshana Pro stojí
navrchu jako samostatná nadstavba, která na enginu závisí a nikdy jej neforkuje.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/architecture-light.svg">
  <img src="docs/assets/readme/architecture-light.svg" alt="Architektura Kshana: uprostřed jeden otevřený engine, kshana 0.40.0 pod AGPL-3.0, s api::run_toml, typovaným rozcestníkem nad každým druhem, a verifikačním registrem 401 schopností (176 VALIDATED, 221 MODELLED, 4 PARTNER). Kolem něj každé rozhraní spouští stejný engine: Příkazový řádek (cargo install kshana); Knihovna Rust (cargo add kshana); Python (pip install kshana); WebAssembly + Kshana Studio (npm install kshana); Server MCP (cargo install kshana-mcp); Obraz Docker (ghcr.io/ashfordeou/kshana-mcp); Plugin pro JetBrains (Marketplace: &quot;Kshana&quot;). Pod ním Kshana Pro, proprietární nadstavba, která na otevřeném enginu závisí jako na knihovně a nikdy jej neforkuje, a nepřidává žádný fyzikální model." width="100%">
</picture>

<details>
<summary>Uvnitř enginu: doménové vrstvy a verifikační registr</summary>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/flow-architecture-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/flow-architecture-light.svg">
  <img src="docs/assets/readme/flow-architecture-light.svg" alt="Architektura Kshana ve vrstvách. Pět vstupních bran (příkazový řádek, Python, JavaScript a WebAssembly, server MCP a plugin pro JetBrains) dosahuje na jeden api::run_toml, typovaný rozcestník nad 92 druhy. Pod ním leží osm doménových vrstev: čas a soustavy, hodiny a časování, inerciální navigace a fúze, GNSS a integrita, astrodynamika, LEO PNT, Měsíc, Mars a hluboký vesmír a mise a studie, na sdíleném jádru, vše křížově odkazované verifikačním modulem, strojově kontrolovanou maticí 401 schopností, která je jediným zdrojem pravdy pro každé označení." width="100%">
</picture>

**Jeden engine, mnoho vstupních bran.** Jediné jádro v Rustu (`kshana`) spouští každý scénář,
dostupné přes CLI, rozšíření pro Python, modul WebAssembly v prohlížeči, **server
MCP** pro AI agenty a **plugin pro JetBrains IDE** — vše se sbíhá do jednoho
rozcestníku `api::run_toml`. Uvnitř se senzorové balíčky zapojují do společného rozhraní
modelu chyb; vedle nich leží **vrstva referenčních soustav** (precese–nutace IAU 2006/2000A
a redukce GCRS↔ITRS založená na CIO), **astrodynamická/numerická
vrstva** (analytické SGP4/SDP4 **a** numerický Cowellův propagátor s jeho
silovým modelem EGM2008/perturbací, návrhem manévrů a určováním oběžné dráhy),
**vrstva integrity/GNSS** (RAIM/ARAIM, SBAS, doména měření, rušení, cislunární prostor),
**vrstva fúze / alt-PNT** (odhadovače GNSS/INS a porovnávače map
gravitace/terénu/magnetického pole), **hlubokovesmírná a lunární vrstva** (radiometrické Mars-PNT a
lunární sada PNT, s úrovní důkazů každé části v matici — čas LTC, VLBI, společné OD+hodiny, realizace soustavy, objem služby,
diferenciální PNT, interoperabilita), **vrstva analýzy mise** (rozpočty startu / návratu / pokrytí /
zaměření / přeletu / spoje a prostředí kosmického počasí) a otevřená
**studijní vrstva odolnosti a AI/ML** (hodnocení odolnosti RPCF, mezera optimismu u RF
poruch a demonstrátor kvantově podporovaného PNT), jejíž reprodukovatelné artefakty stojí na
ověřených jádrech.

Vedle jádra stojí dva samostatné crate **vyloučené z workspace** — `mcp/kshana-mcp`
(server MCP, postavený na SDK `rmcp` edice 2024) a `xval/anise-frames` (křížová
kontrola soustav ANISE/SPICE, která stahuje závislosti pod MPL-2.0 (Mozilla Public License 2.0)) — držené mimo graf závislostí
zveřejněného crate, `Cargo.lock`, licenční bránu a sestavení MSRV (minimální podporovaná verze Rustu) seznamem `exclude`
v kořenovém `Cargo.toml`. Plugin pro JetBrains (`ide/jetbrains`) je samostatný projekt
v Kotlinu. Úplnou sadu diagramů viz [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

Vykreslené diagramy (tok enginu, mapa modulů, distribuce) jsou v [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md).

</details>

<a id="diagrams"></a>
### Diagramy

Diagramy jsou zdroje Mermaid v [`docs/diagrams/`](docs/diagrams/), vykreslené do SVG a PNG v
[`docs/assets/diagrams/`](docs/assets/diagrams/) (`tools/render-diagram-chromium.sh <name>` na Linuxu, ostatní dva
skripty `render-diagram` jinde) a záznam váže každé PNG na přesné SVG, ze kterého vzniklo. Testy fixují
počty, které uvádějí. Grafy v sekcích výše kreslí nástroje z běhů enginu; tyto ukazují, jak do sebe
části zapadají.

<p align="center">
  <img src="docs/assets/diagrams/system-overview.png" alt="Systém: šest vstupních bran (příkazový řádek, Python, WebAssembly a npm s Kshana Studio, server MCP s pluginy a dovednostmi, plugin pro JetBrains, integrace) volá jeden rozcestník nad každým druhem scénáře, který spouští jeden engine ze sdíleného jádra, senzorových balíčků a soustav a doménových modelů, a zapisuje reprodukovatelný výsledek a graf" width="900"><br>
  <sub>Jeden rozcestník, jeden engine, reprodukovatelný výstup · <a href="docs/assets/diagrams/system-overview.svg">SVG</a> · zdroj <a href="docs/diagrams/system-overview.mmd">system-overview.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/surfaces.png" alt="Rozhraní: jeden deterministický offline engine napájí příkazový řádek, knihovnu Rust, Python, WebAssembly a npm a server MCP; Studio běží na sestavení WebAssembly, příkazy a dovednosti pluginu na serveru MCP, integrace a nasazovací sady na příkazovém řádku a plugin pro JetBrains na knihovně" width="900"><br>
  <sub>Každé rozhraní, ze stejného enginu · <a href="docs/assets/diagrams/surfaces.svg">SVG</a> · zdroj <a href="docs/diagrams/surfaces.mmd">surfaces.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/engine-flow.png" alt="Uvnitř jednoho běhu: soubor scénáře se seedem a časovou osou GNSS napájí engine, který v každém časovém kroku vyvíjí model chyb, spouští odhadovač a boduje ukazatele kvality, a zapisuje reprodukovatelný výsledek a graf" width="900"><br>
  <sub>Vnitřní smyčka běhu · <a href="docs/assets/diagrams/engine-flow.svg">SVG</a> · zdroj <a href="docs/diagrams/engine-flow.mmd">engine-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/trust-flow.png" alt="Důvěra v přijímač: log nebo proud přijímače se načte do pozorovatelných pro každou epochu a vlastních příznaků přijímače, projde monitory a stane se poradním skóre důvěryhodnosti s pásmem a důvody, které napájí Studio, telemetrii, podepsaný balíček důkazů, bodování Jammertest a bench a zprávu o shodě" width="900"><br>
  <sub>Od logu přijímače ke skóre důvěryhodnosti a k tomu, co jej využívá · <a href="docs/assets/diagrams/trust-flow.svg">SVG</a> · zdroj <a href="docs/diagrams/trust-flow.mmd">trust-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/lab-round-trip.png" alt="Laboratorní okruh tam a zpět: scénář se exportuje s událostmi a testovacími podmínkami, operátor mimo Kshana přehraje soubor přes laboratorní simulátor, log přijímače se boduje proti uvedeným událostem a okruh důkazů propojí haše scénáře, podmínek a logu a skóre do podepsaného balíčku" width="420"><br>
  <sub>Od scénáře k podepsanému balíčku; Kshana nikdy nevytváří ani nepřehrává signál · <a href="docs/assets/diagrams/lab-round-trip.svg">SVG</a> · zdroj <a href="docs/diagrams/lab-round-trip.mmd">lab-round-trip.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/studio-flow.png" alt="Kshana Studio: prohlížeč spouští engine zkompilovaný do WebAssembly lokálně, nic se nenahrává, přijímá přibalené scénáře nebo scénář či log, který otevřete, a zobrazuje výsledek v jednoduchém zobrazení, pokročilém zobrazení a na stránkách úloh, s exporty ukládanými uživatelem" width="900"><br>
  <sub>Jak Studio běží, lokálně · <a href="docs/assets/diagrams/studio-flow.svg">SVG</a> · zdroj <a href="docs/diagrams/studio-flow.mmd">studio-flow.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/release-flow.png" alt="Tok testování a vydání: lokální brány (formátování, clippy, kontrola nepřítomnosti atribuce, rohatka pokrytí dokumentace a scripts/gate.sh, který spouští úplnou sadu a opakované běhy a zapisuje potvrzení, které kontroluje hook pre-push) vedou k pull requestu jen pro CI a zelené úplné CI; vlastník převine main rychle vpřed na zelený commit a po kontrole synchronizace verzí na něj dopadne anotovaný tag; workflow vydání ověří úplnou sadu na označeném commitu dříve, než se cokoli zveřejní, sestaví binárky se SBOM, kontrolními součty a provenancí sestavení, zveřejní je na crates.io, PyPI, npm, v registru kontejnerů, v registru MCP a na JetBrains Marketplace, dotazuje se každého registru, dokud nezačne nabízet novou verzi, a z tagu spustí sestavení webu; samostatná cesta jen pro web spouští workflow pages s tagem main a je odmítnuta, pokud se od posledního vydání změnilo cokoli mimo web/ a .github/" width="900"><br>
  <sub>Tok testování a vydání, od lokálních bran k ověřenému vydání a cestě jen pro web · <a href="docs/assets/diagrams/release-flow.svg">SVG</a> · zdroj <a href="docs/diagrams/release-flow.mmd">release-flow.mmd</a> · <a href="docs/RELEASING.md">docs/RELEASING.md</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/module-map.png" alt="Mapa modulů: příkazový řádek, Python, WebAssembly, server MCP a plugin pro JetBrains volají typovaný rozcestník nad každým druhem, který dosahuje na sdílené jádro, čas a soustavy, senzorové balíčky, astrodynamiku, integritu, detekci spoofingu, fúzi, hluboký vesmír a Měsíc, odolnost a moduly rozhodčího a benchmarku, vše podložené verifikační maticí" width="1000"><br>
  <sub>Kde žije kód · <a href="docs/assets/diagrams/module-map.svg">SVG</a> · zdroj <a href="docs/diagrams/module-map.mmd">module-map.mmd</a></sub>
</p>

<p align="center">
  <img src="docs/assets/diagrams/distribution.png" alt="Distribuce: jeden repozitář dodává základní crate, server MCP, plugin pro IDE a crate pro křížové kontroly na crates.io, PyPI, npm, GitHub Releases, hřiště na Pages, registr kontejnerů, registr MCP a JetBrains Marketplace, s archivem na Zenodo" width="900"><br>
  <sub>Co se kam dodává a co to kontroluje · <a href="docs/assets/diagrams/distribution.svg">SVG</a> · zdroj <a href="docs/diagrams/distribution.mmd">distribution.mmd</a></sub>
</p>

<a id="ai-assistant"></a>
## AI asistent

[`kshana-mcp`](mcp/kshana-mcp/) je server MCP: váš asistent spouští skutečný engine a
čte zpět jeho JSON, místo aby matematiku odhadoval. Každý z jeho 49 nástrojů je tenký obal
nad veřejnou funkcí knihovny `kshana`, takže na serveru nežije žádná simulační logika.

### Instalace serveru MCP

> Pouze poradní charakter, nikoli typově schválené navigační zařízení: za navigaci zůstává odpovědný provozovatel.
> Server běží na vašem počítači; nic se neodesílá společnosti Ashforde OÜ.

Vyberte libovolný kanál. Každý odkaz a úryvek se generuje jedním skriptem
(`scripts/gen_mcp_install.py`) a kontroluje v průběžné integraci; úryvky pro Claude Desktop,
Claude Code, Cursor, VS Code, Windsurf, Zed, Goose, Codex CLI, Gemini CLI a Continue jsou v
[`docs/MCP-INSTALL.md`](docs/MCP-INSTALL.md).

<!-- mcp-install:begin -->
| Kanál | Příkaz nebo tlačítko | Vyžaduje | Připnutá podoba |
|---|---|---|---|
| Rozšíření Claude Desktop | dvakrát klikněte na `.mcpb` pro váš systém: [macOS (Apple silicon)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-aarch64-apple-darwin.mcpb) · [macOS (Intel)](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-apple-darwin.mcpb) · [Windows](https://github.com/ashfordeOU/kshana/releases/download/v0.40.0/kshana-mcp-x86_64-pc-windows-msvc.mcpb) | nic | `kshana-mcp-<target>.mcpb` z v0.40.0 |
| Cursor (jedním kliknutím) | [npx (Node)](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoibnB4IiwiYXJncyI6WyIteSIsImtzaGFuYS1tY3BAMC40MC4wIl19) · [Docker](https://cursor.com/en/install-mcp?name=kshana&config=eyJjb21tYW5kIjoiZG9ja2VyIiwiYXJncyI6WyJydW4iLCItaSIsIi0tcm0iLCJnaGNyLmlvL2FzaGZvcmRlb3Uva3NoYW5hLW1jcDowLjQwLjAiXX0%3D) | Node nebo Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| VS Code (jedním kliknutím) | [npx (Node)](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) · [Docker](https://insiders.vscode.dev/redirect?url=vscode%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522docker%2522%252C%2522args%2522%253A%255B%2522run%2522%252C%2522-i%2522%252C%2522--rm%2522%252C%2522ghcr.io%252Fashfordeou%252Fkshana-mcp%253A0.40.0%2522%255D%257D) · [Insiders (npx)](https://insiders.vscode.dev/redirect?url=vscode-insiders%3Amcp%2Finstall%3F%257B%2522name%2522%253A%2522kshana%2522%252C%2522command%2522%253A%2522npx%2522%252C%2522args%2522%253A%255B%2522-y%2522%252C%2522kshana-mcp%25400.40.0%2522%255D%257D) | Node nebo Docker | `kshana-mcp@0.40.0` / `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Claude Code | `claude mcp add kshana -- npx -y kshana-mcp@0.40.0` · plugin: `/plugin marketplace add ashfordeOU/kshana` a pak `/plugin install kshana@ashforde` | Node (nebo Docker) | `kshana-mcp@0.40.0` |
| npx | `npx -y kshana-mcp@0.40.0` | Node 18+ | `kshana-mcp@0.40.0` |
| uvx / pipx | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | Python 3.9+ s uv nebo pipx | `kshana-mcp==0.40.0` |
| Docker | `docker run -i --rm ghcr.io/ashfordeou/kshana-mcp:0.40.0` | Docker | `ghcr.io/ashfordeou/kshana-mcp:0.40.0` |
| Homebrew | `brew install ashfordeOU/tap/kshana-mcp` | brew | formule pro v0.40.0 |
| Scoop | `scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket` a pak `scoop install kshana-mcp` | Scoop (Windows) | manifest pro v0.40.0 |
| winget | `winget install AshfordeOU.KshanaMcp` | winget (Windows) | `--version 0.40.0` |
| cargo | `cargo install kshana-mcp --version 0.40.0` | Rust 1.88+ | `kshana-mcp 0.40.0` |
| Předsestavená binárka | [stránka vydání](https://github.com/ashfordeOU/kshana/releases/tag/v0.40.0): `kshana-mcp` (Linux x86-64), `kshana-mcp-<target>[.exe]`, kontrolované pomocí `SHA256SUMS` a `gh attestation verify` | nic | v0.40.0 |
| Registr MCP | `io.github.ashfordeOU/kshana-mcp` (najdou jej klienti podporující registr) | klient podporující registr | `0.40.0` |
| Vzdálený (streamable HTTP) | `kshana-mcp --http 127.0.0.1:8080`, vlastní hosting: viz [docs/deploy/mcp-http.md](docs/deploy/mcp-http.md) | váš vlastní hostitel | v0.40.0 |
<!-- mcp-install:end -->

<p><a href="https://glama.ai/mcp/servers/ashfordeOU/kshana"><img src="https://glama.ai/mcp/servers/ashfordeOU/kshana/badges/score.svg" alt="kshana-mcp na Glama, skóre kvality jeho serveru MCP"></a></p>

V Claude Code přichází stejný server jako plugin: `/plugin marketplace add ashfordeOU/kshana`, pak
`/plugin install kshana@ashforde`. Plugin přidává lomítkové příkazy nad nástroji: `/kshana-run`,
`/kshana-assess-receiver`, `/kshana-evidence-pack`, `/kshana-interference-map`,
`/kshana-training-scenario`, `/kshana-bench-export`, `/kshana-compliance-report`, `/kshana-iq`,
`/kshana-import-route`, `/kshana-marine-integrations` a `/kshana-jammertest`. Nástroje pro důvěru plavidla napájejí integrace Signal K a
OpenCPN: [`docs/MARINE-INTEGRATIONS.md`](docs/MARINE-INTEGRATIONS.md).

Nastavení pro jednotlivé klienty je v [`docs/integrations.md`](docs/integrations.md). Server je uveden
v oficiálním registru MCP jako `io.github.ashfordeOU/kshana-mcp`.

<details>
<summary>49 nástrojů</summary>

<br>

**Scénáře a zprávy**

| Nástroj | Co dělá |
|---|---|
| `run_scenario` | Spustí scénář z definice TOML (Tom's Obvious, Minimal Language) |
| `list_scenario_kinds` | 92 vestavěných druhů scénářů s popisy + povinnými/volitelnými poli — aby agent mohl sestavit platný scénář |
| `validate_scenario` | Předběžná kontrola: rozparsuje TOML a zjistí jeho druh, bez spuštění |
| `list_example_scenarios` | Přibalené referenční scénáře jako JSON |
| `get_example_scenario` | Text TOML jednoho přibaleného referenčního scénáře, bajt po bajtu soubor pod `scenarios/` |
| `report_scenario` | Spustí scénář a vrátí jeho zprávu |
| `animate_scenario` | Spustí scénář a vrátí jeho časové řady jako animaci |
| `sky_geometry` | Geometrie oblohy pod obzorem závislým na azimutu: viditelné a skryté družice, DOP, kovariance východ-sever-nahoru a horizontální elipsa chyb; nebo předvolba obzoru s jejím původem |

**Export a interoperabilita**

| Nástroj | Co dělá |
|---|---|
| `list_export_formats` | Které formáty interoperability se na scénář vztahují (`czml`, `kml`, `geojson`, `stk`, `sigmf`), důvod, když některý ne, a specifikace, kterou každý zapisovač dodržuje |
| `export_interop` | Exportuje scénář jako CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemeridy STK (Systems Tool Kit) `.e` nebo SigMF (Signal Metadata  |
| `import_route` | Zapíše trasu GeoJSON `LineString` do scénáře, který letí po trase bodů (`terrain-nav`, `terrain-slam`, `gravity-map`, `combined-altpnt`), a vrátí nový TOML |
| `export_sp3` | Exportuje konstelaci scénáře `orbit` jako přesné efemeridy SP3-c (Standard Product 3, revize c) |
| `export_omm` | Exportuje elementy scénáře `orbit` jako katalog CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message) |
| `export_oem` | Exportuje řadu stavů scénáře `orbit` jako efemeridy CCSDS OEM (Orbit Ephemeris Message) 2.0 — polohu TEME (pravý rovník, střední ekvinokcium) *a*  |
| `export_table_csv` | Spustí scénář a vrátí jeho tabulku reprodukovatelnosti jako CSV (hodnoty oddělené čárkami) — bajtově stabilní tabulku, kterou CLI (rozhraní příkazového řádku) zapisuje jako `<scenario>.table.csv` |
| `export_test_bench` | Pohyb vozidla a události scénáře pro laboratorní simulátor GNSS (`kshana bench-export`) |

**Důvěra v přijímač a plavidlo**

| Nástroj | Co dělá |
|---|---|
| `assess_receiver_log` | Posoudí důvěryhodnost logu skutečného přijímače GNSS (globální družicový navigační systém) |
| `assess_vessel_stream` | Boduje omezený výňatek NMEA 0183 (nejvýše 2 MiB a 20,000 epoch |
| `assess_vessel_log` | Log NMEA 0183 plavidla (nejvýše 4 MiB) jako dávkový běh, s TOML sezení uvádějícím limity plavidla |
| `create_evidence_pack` | Podepsaný balíček důkazů pro okno logu plavidla (`kshana receiver-trust evidence`) |
| `attach_evidence_timestamp` | Připojí k balíčku token časového razítka RFC 3161 (base64 bajtů `.tsr`), v paměti (`kshana evidence attach-timestamp`) |
| `verify_evidence_pack` | Ověří balíček (`kshana evidence verify`) |
| `generate_training_nmea` | Syntetické NMEA 0183 můstku pro výcvik posádky z TOML `nmea-scenario` (rušení, odtah polohy, časový spoofing, zpoždění přehrání) s logem instruktora (`kshana-nmea-training/1`) |
| `build_interference_map` | Mapa interference GNSS z hlášení polohy ADS-B nebo AIS jako text CSV (nejvýše 4 MiB) |
| `route_exposure` | Podíl délky trasy v degradovaných, nedegradovaných, neposouzených a nepozorovaných buňkách jedné nebo více map interference, volitelně v rozsahu dat |
| `trust_telemetry` | Proud důvěry (řádky JSON) nebo výsledek `receiver-trust` vykreslený jako text Prometheus, řádky syslog CEF nebo LEEF nebo payload OTLP JSON, pomocí kodérů `kshana trust-telemetry` |
| `jammertest_import` | Načte zveřejněný katalog testů Jammertest a plán vysílání (NPRA/jammertest-plan, MIT) jako plánovanou pravdu (`kshana jammertest import`): sloty jedné testovací oblasti se stanou událostmi receiver-trust s id katalogu a rokem v každém štítku. Plánované sloty, nikoli zaznamenané časy vysílání; žádné kontaktní pole plánu se nečte. MODELLED. Viz [`docs/JAMMERTEST.md`](docs/JAMMERTEST.md). |
| `jammertest_score` | Boduje log přijímače proti tomuto plánu (`kshana jammertest score`): pro každý test latenci detekce, zmeškané poplachy a dobu zotavení a falešné poplachy mimo všechny sloty. Textové logy jako `log`, binární (`ubx`, `sbf`) jako `log_base64`. Podepsaný balíček potřebuje klíč: příkazový řádek. Pouze poradní charakter; MODELLED. |
| `fit_imu_log` | Parametry akcelerometru a gyroskopu scénářů `hybrid` a `fusion` proložené ze stacionárního logu IMU (CSV nebo EuRoC) Allanovou deviací, s tabulkou `[accel_classical]` připravenou ke vložení a SHA-256 logu (`kshana imu-fit`). Text dovnitř, JSON ven; MODELLED. |

**GNSS IQ (soubory v pracovním adresáři; v režimu HTTP vypnuto)**

| Nástroj | Co dělá |
|---|---|
| `iq_signals` | Nastavení vrstvy GNSS IQ |
| `iq_info` | Popíše jeden záznam IQ (ve fázi a kvadratuře) v pracovním adresáři bez jeho zpracování |
| `iq_scene` | Vygeneruje scénu GNSS IQ s více družicemi do pracovního adresáře (`kshana iq scene`) |
| `iq_acquire` | Akvizice FFT (rychlá Fourierova transformace) jednoho nebo více PRN (pseudonáhodné kódy) nad záznamem (`kshana iq acquire`), volitelně za stupni front endu |
| `iq_track` | Akvizice a poté sledování bankou DLL/PLL/FLL (smyčky zamčeného zpoždění, fáze a frekvence) (`kshana iq track`), se smyčkami z `kshana.loop-desig |
| `iq_frontend` | Uplatní DSP (číslicové zpracování signálu) front endu přijímače a potlačení interference |
| `iq_sweep` | Přehraje jeden záznam IQ v pracovním adresáři přes několik návrhů sledovací smyčky (`kshana iq sweep`) |
| `iq_monitor` | Spustí monitory detekce interference a spoofingu nad záznamem IQ v pracovním adresáři (`kshana iq monitor`) |
| `iq_labfit` | Proloží model ztráty zámku sledovací smyčky laboratorními běhy (`kshana iq labfit`) ze scénáře `iq-labfit`, jehož logy jsou vložené (`text` nebo `base64` |
| `iq_test_conditions` | Ověří soubor `kshana.test-conditions/1` zadaný jako text a vrátí rozřešené podmínky s jejich hašem |
| `iq_campaign` | Spustí kampaň laboratorního přehrávání (`kshana iq campaign`) |
| `iq_campaign_status` | Průběh výstupní složky kampaně |

**Mapování na rámce shody**

| Nástroj | Co dělá |
|---|---|
| `compliance_report` | Mapování na veřejné rámce vyplněné z výsledkových dokumentů zadaných jako text (`kshana compliance-report`) |
| `compliance_mapping` | Statické mapovací tabulky (nebo, se `sources`, zdrojové dokumenty, které citují, s verzemi a URL) jako Markdown, uvedené stejným prohlášením |
| `list_standards_packs` | Balíčky norem (`kshana standards-pack list`): bodované sady scénářů pro testovací profily rámce DHS Resilient PNT, IMO MSC.1/Circ.1575 a ICAO Doc 9849 Appendix F |
| `run_standards_pack` | Běh jednoho balíčku proti prahům uvedeným před během: každý test `MET`, `NOT MET` nebo `NEEDS INPUT`; MODELLED, nehodnotí žádný produkt |
| `lunanet_afs_check` | LunaNet Augmented Forward Signal zkontrolovaný proti LNIS V5 AD1 Volume A (LSIS-AFS V1.0): kódy proti tištěným tabulkám nebo proud symbolů proti formátu rámce; LDPC a CRC-24Q podrámců 2 až 4 se neověřují |
| `create_round_trip_pack` | Podepsaný balíček laboratorního okruhu: scénář, dokument `kshana.test-conditions/1`, log přijímače a skóre propojené hašem |

**Benchmark**

| Nástroj | Co dělá |
|---|---|
| `score_benchmark` | Příspěvek kshana-bench bodovaný proti souboru pravdy, oba jako text JSON (`kshana bench score`, `bench/SPEC.md`): výsledkový soubor s verzí specifikace, rozdělením, haši vstupů a metrikami úlohy. MODELLED; popisuje log nebo korpus, nikdy produkt. |
| `render_leaderboard` | Výsledkové soubory kshana-bench vykreslené jako statická stránka žebříčku (text HTML), každý nejprve ověřen. |

</details>

<a id="editions"></a>
## Edice

Celý engine je zdarma. Kshana Pro a studie na zakázku jsou pro programy, které potřebují víc,
a každá placená cesta začíná zprávou: žádné ceny zde nejsou.

| | Free | Kshana Pro | Studie na zakázku |
|---|---|---|---|
| Co to je | celý otevřený engine, všech 92 druhů scénářů, žádné omezení funkcí | proprietární nadstavba nad stejným enginem, na základě smlouvy | studie odolnosti PNT vašeho systému na úrovni MODELLED, provedená za vás |
| Licence | AGPL-3.0 (GNU Affero General Public License, verze 3) nebo komerční licence | proprietární | smlouva |
| Jak začít | [instalace](#install) nebo otevřete [kshana.dev](https://kshana.dev) | [požádat o zkušební verzi Pro](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation) | [požádat o studii](mailto:contact@ashforde.org?subject=Kshana%20custom%20study) |

Co je Pro, slovy [`docs/PRO.md`](docs/PRO.md):

> **Striktní nadmnožina otevřené Kshana.** Pro závisí na otevřeném enginu jako na knihovně a
> nikdy jej neforkuje. Každý otevřený druh scénáře běží v Pro beze změny a otevřený scénář běží
> v Pro zcela bez licence.
>
> **Žádná nová fyzika.** Pro nepřidává žádný fyzikální model a žádný nemění. Každé číslo Pro pochází
> z běhů otevřeného enginu, takže údaj Pro je stejně důvěryhodný jako otevřený druh scénáře,
> ze kterého pochází, a nikdy víc.

Pro odpovídá na další otázky programu: který návrh poslat do letu (optimalizátor návrhu a jeho
Paretova fronta), jak jistá je odpověď (nejistota a citlivost) a zda mise
splňuje své požadavky (misijní dokumentace, sledovatelnost požadavků, studie kompromisů, regresní
kontrola scénářů, digitální dvojčata hodin, dokumentace studie a služba
on-premises). Také hlídá kampaň údajů a nechá selhat pipeline, když se některý zhorší,
testuje kandidátní plány signálů proti otevřeným signálům družicové navigace v obou
směrech (koexistence ve spektru) a řadí studie do fronty ve službě úloh on-premises s
registrem doručení řetězeným hašem. Každá část je popsána, včetně toho, co vytváří a co nedělá, v
[`docs/PRO.md`](docs/PRO.md). Nic, co Pro vytvoří, není certifikací, a ani studie na zakázku
není certifikací.

<details>
<summary>Co Kshana Pro čte z otevřeného enginu a podpora od Ashforde® OÜ</summary>

<br>

**Na čem Kshana Pro staví.** Každá část Pro pracuje z otevřeného enginu a ponechává
jej beze změny:

- **Optimalizátor návrhu, studie nejistoty a misijní dokumentace** spouštějí scénáře
  otevřeného enginu přes veřejné rozhraní enginu a každé číslo počítají z výsledků
  běhů. Každý výstup si ponechává úroveň VALIDATED, MODELLED nebo PARTNER, kterou otevřený engine dal
  každému údaji, nikdy vyšší.
- **Digitální dvojčata hodin** používají model hodin otevřeného enginu a jeho odhadovač
  Allanovy deviace: dvojče je kalibrováno na zveřejněný Allanův rozpočet zařízení a pak zkontrolováno
  odhadem Allanovy deviace dvojčete otevřeným odhadovačem.
- **Studie kompromisů** spouštějí každou variantu architektury jako scénář otevřeného enginu, beze změny,
  a řadí varianty podle ukazatele kvality načteného z výsledku každého běhu.
- **Hlídání kampaně** čte své údaje z výsledků běhů otevřeného enginu nad
  scénáři v balíčku a porovnává je s předchozím úspěšným během.
- **Koexistence ve spektru** čte každé fyzikální číslo z běhů otevřeného enginu
  druhů `leo-signal` a `constellation-design` a přidává jen součet přes viditelné družice
  a pořadí plánů.
- **Služba úloh on-premises** spouští otevřené scénáře i scénáře Pro stejným enginem a
  ukládá každý výsledek tak, jak jej běh vrátil.
- **Balíčky důkazů** zaznamenávají pro každý běh haš scénáře, který otevřený engine razí na
  svůj výsledek, takže údaj v balíčku lze reprodukovat opětovným spuštěním jeho scénáře.
- **Nástroje systémového inženýrství a řízení programu.** Nástroje Kshana Pro pro modelově
  orientované systémové inženýrství (MBSE) a řízení programu kontrolují požadavky programu
  proti běhům otevřeného enginu: importují požadavky jako hodnoty oddělené čárkami
  (CSV) nebo jako zdokumentovanou podmnožinu Requirements Interchange Format (ReqIF) či
  textu Systems Modeling Language verze 2 (SysML v2), vyhodnocují každé kritérium
  přijetí, s jeho jednotkou, proti hodnotám, které běh zapsal, a vytvářejí verifikační
  matici křížových odkazů (VCRM), model SysML v2, zprávu o dopadu změn a offline
  balíček důkazů. Nic znovu nespouštějí ani nepřepočítávají a čtou jen to, co otevřený engine
  zveřejňuje: `result.json` každého běhu (pole, která kritérium jmenuje, jejich jednotky,
  razítko reprodukovatelnosti z haše scénáře, seedu, verze enginu a verze schématu a
  označení běhu a úrovně údajů), jeho `report.json` (druh, záznam reprodukovatelnosti a
  označení schopností), soubor scénáře (jeho haš, druh, seed a parametry),
  schéma jednotek polí (jednotka, původ a úroveň důkazů každého pole) a
  verifikační matici (označení VALIDATED, MODELLED nebo PARTNER každé schopnosti).

<a id="support--professional-services"></a>
### Podpora a profesionální služby

Kshana je zdarma a open source pod AGPL-3.0 a je **profesionálně vyvíjena a
udržována společností Ashforde® OÜ** (Estonsko). Otevřený engine je úplný a použitelný
sám o sobě. Pro organizace, které potřebují víc, nabízí Ashforde® OÜ:

- **Komerční podporu a integraci** — začlenění Kshana do vašeho řetězce nástrojů, scénáře
  na zakázku a prioritní opravy.
- **Modely senzorů na zakázku** — kalibrované na váš hardware, včetně modelů odolnosti
  citlivých z hlediska exportu udržovaných v soukromé nadstavbě.
- **Kshana Pro** — proprietární nástroje pro modelově orientované systémové inženýrství (MBSE) a řízení
  programu, které kontrolují požadavky programu proti běhům otevřeného enginu a
  vytvářejí verifikační matici křížových odkazů (VCRM), model Systems Modeling Language
  verze 2 (SysML v2), zprávu o dopadu změn a offline balíček důkazů. Nic
  znovu nespouštějí a čtou jen zveřejněné výstupy enginu: `result.json`
  a `report.json` každého běhu, soubor scénáře, schéma jednotek polí a označení verifikační
  matice (úplný seznam je v části [Edice](#editions)).
- **Nástroje Kshana Pro pro návrh, nejistotu a mise** — Paretova fronta prostoru
  návrhů, nejistota a citlivost přes tisíce běhů a misijní dokumentace jedním příkazem
  s verifikační maticí a PDF; viz [`docs/PRO.md`](docs/PRO.md).
- **Hlídání kampaně, koexistence ve spektru a služba úloh v Kshana Pro** — pipeline, která
  selže, když se hlídaný údaj zhorší, plány signálů testované proti otevřeným
  signálům družicové navigace v obou směrech a fronta úloh on-premises s
  registrem doručení řetězeným hašem; viz [`docs/PRO.md`](docs/PRO.md).
- **Školení a konzultace** k analýze výkonnosti kvantového/klasického PNT.

Jde o model open-core: engine je a zůstane pod otevřenou licencí; udržitelným
byznysem jsou odbornost, podpora a proprietární rozšíření — nikoli licenční poplatky.
Kontakt **contact@ashforde.org** · [ashforde.org](https://ashforde.org).

</details>

<a id="research"></a>
## Výzkum

Studie postavené na otevřeném enginu se zveřejňují na arXiv. Každá jmenuje příkaz enginu,
který za ní stojí, takže její čísla lze znovu vytvořit z uloženého scénáře nebo příkladu studie.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/assets/readme/research-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="docs/assets/readme/research-light.svg">
  <img src="docs/assets/readme/research-light.svg" alt="Výzkum postavený na otevřeném enginu: šest článků na arXiv, každá karta jmenuje článek, jeho datum a kategorii a příkaz enginu, který znovu vytvoří jeho čísla. Stejných šest článků, s odkazy a příkazy, je v tabulce níže." width="100%">
</picture>

| Článek | Co ukazuje | Příkaz enginu |
|---|---|---|
| [*Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of RF-Impairment Detectors from In-Distribution Statistics*](https://arxiv.org/abs/2606.22054)<br><sub>arXiv:2606.22054 · [doi:10.48550/arXiv.2606.22054](https://doi.org/10.48550/arXiv.2606.22054)</sub> | Pokles skóre detektoru interference GNSS, jakmile se podmínky posunou, lze předpovědět jen ze statistik uvnitř rozdělení, na otevřeném syntetickém testovacím prostředí a poté na otevřených terénních záznamech. | `cargo run --release --example optimism_study -- paper-artifacts/optimism-study.json` |
| [*A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error Under GNSS Spoofing*](https://arxiv.org/abs/2606.24210)<br><sub>arXiv:2606.24210 · [doi:10.48550/arXiv.2606.24210](https://doi.org/10.48550/arXiv.2606.24210)</sub> | Časovací přijímač GNSS při spoofingu nemá žádnou konečnou nepodmíněnou mez nedetekované časové chyby, proto článek uvádí podmíněnou, kalibrovanou na zaznamenaném spoofingu vysílaném éterem z veřejné kampaně JammerTest 2024. | `cargo run --release --example tpl_jammertest` |
| [*How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number Resilience Ratings under Framework-Aligned Weighting*](https://arxiv.org/abs/2607.05415)<br><sub>arXiv:2607.05415 · [doi:10.48550/arXiv.2607.05415](https://doi.org/10.48550/arXiv.2607.05415)</sub> | Jediné složené skóre odolnosti je stabilním základem rozhodnutí jen tam, kde jeden návrh dominuje; kde si návrhy konkurují, může vítěze změnit už samotné převážení. | `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json` |
| [*Earth-baseline VLBI restores the observability of a lunar surface station in joint orbit-and-clock determination*](https://arxiv.org/abs/2607.02566)<br><sub>arXiv:2607.02566 · [doi:10.48550/arXiv.2607.02566](https://doi.org/10.48550/arXiv.2607.02566)</sub> | Měření vzdáleností uvnitř lunární konstelace ponechává absolutní polohu povrchové stanice nepozorovatelnou; zpoždění interferometrie s velmi dlouhou základnou (VLBI) ze Země ji obnoví, když je konstelace řídká, a zostří ji, když je bohatá. | druh `lunar-joint-od-clock`: `kshana example lunar-joint-od-clock > s.toml && kshana s.toml` |
| [*The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient Fix: A Dilution-of-Precision Analysis*](https://arxiv.org/abs/2607.06212)<br><sub>arXiv:2607.06212 · [doi:10.48550/arXiv.2607.06212](https://doi.org/10.48550/arXiv.2607.06212)</sub> | Plánované konstelace čtyř až šesti družic dávají nad jižním pólem Měsíce špatnou geometrii a několik povrchových dálkoměrných majáků ji napraví mnohem levněji než další družice. | druh `lunar-beacon`: `kshana example lunar-beacon > s.toml && kshana s.toml` |
| [*Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever*](https://arxiv.org/abs/2610.23871)<br><sub>arXiv:2610.23871 · [doi:10.48550/arXiv.2610.23871](https://doi.org/10.48550/arXiv.2610.23871)</sub> | Snížení přesnosti není pro cislunární sledování jen podle vzdálenosti definováno, protože rychlost je v jednom snímku nepozorovatelná, proto článek používá gramián pozorovatelnosti na čtyřech rovinných vzdálených retrográdních drahách: samotná vzdálenost má v jednom snímku hodnost 2 ze 4 a potřebuje oblouk zhruba 2.09 h, aby se stala plně pozorovatelnou, přičemž podmíněnost se s prodlužováním oblouku zlepšuje; rychlost změny vzdálenosti (Doppler) dává hodnost 4 okamžitě; a společný odhad stanice se stavy a hodinami družic zůstává o jednu hodnost deficitní, pokud se nepřidá vnější interferometrická pozorovatelná. Požadavky patří do rozpočtů délky oblouku, podmíněnosti a typu měření, nikoli DOP. | druh `cislunar-observability`: `kshana scenarios/cislunar-observability.toml` (jeho sourozenec `cislunar-arc-recovery` testuje práh nezávislým odhadovačem s konečnými diferencemi) |

Tři příklady studií zapisují bajtově deterministické artefakty (pevné seedy), které zaznamenávají
verzi enginu, seedy a haš konfigurace. Tři lunární a cislunární články jsou postaveny na
lunární sadě (úroveň důkazů každé části je ve verifikační matici); jejich tvrzení o geometrii a snížení přesnosti jsou navíc křížově kontrolována
proti samostatným orákulům v `tests/validate_p*.rs`. Více v části
[Reprodukovatelné artefakty studií](#reproducible-study-artifacts) v Referenci.

<a id="cite"></a>
## Citace

Pokud Kshana použijete v akademické nebo technické práci, citujte prosím verzi, kterou jste použili, se
scénářem a seedem. [`CITATION.cff`](CITATION.cff) obsahuje strojově čitelná metadata a
GitHub z nich zobrazuje tlačítko „Cite this repository“. Každé vydání je archivováno na Zenodo;
koncepční DOI (Digital Object Identifier)
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627) vždy odkazuje na
nejnovější verzi.

> Baweja, C. (2026). *Kshana — a PNT-resilience simulator with quantum-sensor performance models*. [Ashforde OÜ](https://ashforde.org). https://doi.org/10.5281/zenodo.20528627

Výše uvedené články:

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
## Licence

Kshana má dvojí licenci: GNU **AGPL-3.0-only** ([`LICENSE`](LICENSE)), nebo
**komerční licenci** od Ashforde® OÜ pro uzavřenou integraci, které AGPL nevyhovuje.
[`LICENSING.md`](LICENSING.md) vysvětluje, která platí. Příspěvky jsou přijímány pod licencí
AGPL a zároveň udělují Ashforde® OÜ právo zahrnout je do komerční
edice; každý commit podepište pomocí `git commit -s` (viz [`CONTRIBUTING.md`](CONTRIBUTING.md)).
„Kshana“ a její značky jsou ochranné známky Ashforde® OÜ: licence pokrývá kód, nikoli
jméno, proto forky prosím přejmenujte.

<a id="reference"></a>
## Reference

Dlouhý materiál, sbalený. Každý dokument je uveden v části [Dokumentace](#documentation).

<details>
<summary>Instalace a sestavení ze zdrojového kódu</summary>

<a id="install--build"></a>
### Instalace a sestavení

Vyžaduje sadu nástrojů Rust (≥ 1.88, `rust-version` v Cargo.toml; vyvíjeno na 1.93).

```bash
git clone https://github.com/ashfordeOU/kshana
cd kshana
cargo build --release
cargo test          # all tests pass
```

</details>

<details>
<summary>Použití: příkazový řádek v plném rozsahu</summary>

### Použití

Spusťte libovolný scénář; CLI se rozhoduje podle pole `kind` scénáře a zapíše
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` a
`<scenario>.report.json` vedle něj — plus `<scenario>.table.csv` u druhů, které
zveřejňují tabulku. Zpráva (stránka HyperText Markup Language (HTML) a dokument JSON
se stejným obsahem) nese manažerské shrnutí, každý vstup s jeho jednotkou,
výsledky a grafy, tabulky procházení parametrů, Monte Carlo nebo řetězu kampaně, časovou osu událostí,
označení VALIDATED / MODELLED / PARTNER a zdroj každé schopnosti, kterou běh použil,
co není modelováno, a záznam reprodukovatelnosti (verze enginu, otisky Secure Hash
Algorithm 256-bit (SHA-256), seed, platforma a přesný příkaz). Z prohlížeče se vytiskne do
čistého souboru PDF (Portable Document Format) na papír A4 nebo Letter;
engine sám žádné PDF nezapisuje. Viz [`docs/REPORTS.md`](docs/REPORTS.md).

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

`--export <czml|kml|geojson|stk|sigmf|all|list>` zapíše vedle scénáře CZML (Cesium Language), KML
(Keyhole Markup Language), GeoJSON (Request for Comments 7946), efemeridy Ansys STK (Systems Tool Kit) `.e`
a záznamy SigMF (Signal Metadata Format) a
`--import-route <route.geojson>` přivede čáru GeoJSON do druhů, které letí po trase. Každý
formát je ověřen proti své zveřejněné specifikaci a scénář, na který se formát
nevztahuje, uvede proč: viz [docs/INTEROP.md](docs/INTEROP.md).

**Další režimy CLI** — kontrola scénáře, přivedení skutečných dat o orientaci Země nebo spuštění celé sady:

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

**Export animace.** `--animate svg|html|frames|all` zapíše `<scenario>.animation.svg`
(klíčové snímky Cascading Style Sheets (CSS), bez skriptu), `<scenario>.animation.html` (přehrát, pozastavit, posouvat, rychlost a
synchronizované panely, bez externích prostředků) a `<scenario>.frames/` (`frame_0000.svg`, … plus
`manifest.json` se snímkovou frekvencí a délkou). Kampaň přehrává své fáze a
poplachy, běh spektra svůj vodopád; motiv se řídí `prefers-color-scheme` a
`prefers-reduced-motion` ukáže hotový obrázek. Vykresluje vlastní vzorky běhu,
při opakovaném běhu bajtově identické, a nepřidává žádné důkazy. Viz [docs/ANIMATION.md](docs/ANIMATION.md).

Manifest **sady** je malý soubor TOML (Tom's Obvious, Minimal Language) — `title` a pole `scenarios = [ … ]`
cest ke scénářům — který engine postupně spouští a každý výsledek (s jeho
označeními MODELLED / VALIDATED) skládá do jednoho samopopisného artefaktu studie. Viz
[`scenarios/quantum-pnt-demonstrator.suite.toml`](scenarios/quantum-pnt-demonstrator.suite.toml).

**Role v interoperabilitě.** Kshana je vrstva *výkonové simulace*, která stojí
vedle řetězce nástrojů pro postprocessing, nikoli jeho náhradou: přiveďte její výstup **RINEX**
do RTKLIB nebo gLAB pro řešení polohy a její výstup **SP3** použijte jako
produkt přesné dráhy pro nástroje jako Ginan — Kshana odpovídá na to, *jakou odolnost daná
architektura PNT přináší*, dříve než máte skutečné signály, ve formátech, které tyto nástroje již
přijímají (`--export-sp3` nebo `export_sp3 = true` ve scénáři `orbit` zapíše
`<scenario>.sp3`). Stejnou dráhu lze zveřejnit jako standardizované střední elementy **CCSDS OMM**
(`--export-omm` nebo `export_omm = true` zapíše `<scenario>.omm`) —
jedna zpráva OMM 502.0 KVN (zápis klíčové slovo = hodnota) na každou družici definovanou TLE, nesoucí skutečné
katalogové číslo NORAD (North American Aerospace Defense Command), mezinárodní označení COSPAR (Committee
on Space Research) a epochu každého objektu, pro jakéhokoli
spotřebitele podporujícího OMM namísto individuální sady dvouřádkových elementů.

Příklad výstupu (holdover hodin — všimněte si, jak se hlásí ukazatele kvality Integrity a Security):

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg, scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

Časová chyba optických hodin na 95. percentilu (p95) je 1.20e-4 ns: souhrn
vypisuje malé hodnoty s platnými číslicemi, místo aby je zaokrouhlil na `0.0`.
`security` zní `n/a (no attack)`, protože tento scénář nekonfiguruje žádný útok, takže
není co detekovat. Výsledek JSON přesto nese analytickou
mez detekovatelnosti spoofingu pro každé hodiny v `fom.security` (0.997 pro optické hodiny, 0.000 pro
atomové hodiny v čipovém měřítku, jejichž vlastní šum během monitorovacího okna překračuje specifikaci
20 ns) a jeho blok `figure_tiers` označuje tento údaj `applicable: false`. Druh scénáře `spoof`
boduje detekci proti vnesenému útoku. `figure_tiers` také každému
hlášenému údaji dává jeho verifikační úroveň — VALIDATED (zkontrolováno proti vnějšímu
orákulu) nebo MODELLED — a řádek verifikační matice, ze kterého se úroveň čte. Orbitální
scénář navíc hlásí blok geometrie — podíl vzorků s určením polohy a
nejlepší/mediánové snížení přesnosti polohy (PDOP) a přesnost polohy — vedle
výsledku hodin.

> **Čtěte tato dvě čísla pozorně.** `security` je *analytická mez detekovatelnosti
> spoofingu* odvozená ze stability každých hodin — má smysl jen proti
> nakonfigurovanému scénáři spoofingu a **není** detektorem RAIM pro více družic. `integrity`
> je zde *vnitřní konzistence* filtru (podíl vzorků výpadku uvnitř jeho vlastní meze k-sigma),
> **nikoli** údaj o integritě HPL/VPL v letectví. Viz
> [`docs/INTEGRITY.md`](docs/INTEGRITY.md).
>
> Pro skutečnou autonomní integritu přijímače spouští **druh scénáře `integrity`**
> (`scenarios/integrity-raim.toml`) skutečný snímkový RAIM a RAIM se separací řešení
> (ve stylu ARAIM) nad šířenou geometrií konstelace: počítá
> horizontální/vertikální **ochranné úrovně (HPL/VPL)** pro každou epochu a hlásí
> podíl epoch, které splňují nakonfigurované výstražné meze, se Stanfordským
> diagramem integrity pro klasifikaci chyba proti PL (ochranná úroveň).

<a id="reproducible-study-artifacts"></a>
#### Reprodukovatelné artefakty studií

Čtyři otevřené studie každá znovu vytvoří bajtově deterministický artefakt (pevný seed) jedním
příkazem — čísla za studiemi přechodu kvantové proti klasickému, mezery optimismu u RF
poruch, hodnocení odolnosti PNT a časové ochranné úrovně:

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

Každý artefakt zaznamenává svou verzi enginu, seedy a haš konfigurace a nese poctivé
označení MODELLED/VALIDATED. Sondy skutečných dat (`*_probe`) spouštějí stejnou pipeline nad
záznamy, které dodáte lokálně; v repozitáři se nedodávají žádné datové sady. Studie mezery
optimismu u RF poruch je popsána v preprintu
[arXiv:2606.22054](https://arxiv.org/abs/2606.22054) a podmíněná časová
ochranná úroveň (`tpl_jammertest` výše) v preprintu
[arXiv:2606.24210](https://arxiv.org/abs/2606.24210) (viz [Citace](#cite)).

Zveřejněné studie lunárního PNT ([arXiv:2607.06212](https://arxiv.org/abs/2607.06212)
DOP s povrchovými majáky, [arXiv:2607.02566](https://arxiv.org/abs/2607.02566) pozorovatelnost
VLBI a [arXiv:2610.23871](https://arxiv.org/abs/2610.23871) cislunární pozorovatelnost v závislosti na délce
oblouku) mají svá tvrzení o geometrii, snížení přesnosti, predikci soustavy v reálném čase /
parametrů orientace Země (EOP), vzdálených retrográdních drahách a měření vzdálenosti v RF
nezávisle křížově zkontrolována v
`tests/validate_p*.rs` proti samostatným orákulům (`scipy.special.j1`, nezávislé řešení DOP
`(HᵀH)⁻¹` v NumPy, nové parsování stejných řádků IERS `finals2000A` v NumPy a
NASA/JPL Three-Body Periodic Orbit Database). Jde o dodatečné regresní kontroly nad
**modelovanou** lunární sadou; nemění počty ve strojově kontrolované matici.

</details>

<details>
<summary>Formát scénáře</summary>

<a id="scenario-format"></a>
### Formát scénáře

Scénáře jsou deklarativní TOML. Pole `kind` na nejvyšší úrovni vybírá balíček — celkem **padesát**
(`clock` je výchozí, pokud je vynecháno): `inertial`, `timetransfer`, `hybrid`, `hybrid-ukf`, `fusion`,
`gnss-ins`, `orbit`, `ephemeris`, `gnss-sim`, `integrity`, `lunar-integrity`, `lunar-time-offset`, `spoof`,
`spoof-detect`, `jamming`, `sweep`, `sweep-nd`, `gravity-map`, `terrain-nav`, `terrain-slam`,
`combined-altpnt`, `pvt`, `mars-pnt`, `impairment-eval` (testovací prostředí AI/ML pro hodnocení detekce RF
poruch — označený syntetický korpus + na detektoru nezávislý postroj ROC/AUC +
mezera optimismu uvnitř/mimo rozdělení), `quantum-trade` (kompromis PNT kvantové proti
klasickému s příjmem naměřené ADEV + obálkou odolnosti bez GNSS; MODELLED),
`space-weather` (sluneční/geomagnetické indexy + exosférická teplota Jacchia-71 +
termosférická hustota řízená aktivitou nad statickou atmosférou; MODELLED),
`oem-interop` (most pro import/okruh tam a zpět CCSDS OEM pro efemeridy GMAT/Orekit/STK;
MODELLED), trojice analýzy mise `launch-window` (azimut startu dvou těles /
změna roviny / příležitosti), `reentry` (balistický koridor návratu podle Allena–Eggerse),
`eo-coverage` (geometrie pásu záběru / GSD / přístupu / opakované návštěvy pro EO), `space-packet` (rámcování
CCSDS 133.0 TM/TC — telemetrie/telepovely — Space Packet — přesné bitové uspořádání, ověřeno okruhem tam a zpět) a
`attitude-budget` (3-DOF moment gravitačního gradientu + rozpočet chyby zaměření RSS),
`passes` (predikce přeletů nad pozemní stanicí s východem/západem — AOS/TCA/LOS, maximální elevace,
přístup) a `link-budget` (jednosměrná rovnice spoje CCSDS/DSN — FSPL / Eb·N₀ /
rezerva / uzavření); `telecom-timing` (časová chyba holdoveru, MTIE a TDEV kontrolované
proti maskám ITU-T); `spectrum` (celé pásmo L GNSS jako jedna spektrální hustota výkonu:
vodopád frekvence v čase pod skriptovanou časovou osou rušičky se spojitou vlnou, úzkopásmové, chirpové nebo
s přizpůsobeným šumem, poměr rušení k signálu pro každé pásmo a efektivní
hustota poměru nosné k šumu z koeficientu spektrální separace, a vstup a výstup záznamů Signal Metadata
Format (SigMF) s Welchovými spektrálními odhady; spektra
signálů VALIDATED proti učebnicovým hodnotám, scénář rušičky MODELLED; viz
[`docs/SPECTRUM.md`](docs/SPECTRUM.md); tentýž druh kreslí panely pásem UHF, S a C s
navrženými signály na nízké oběžné dráze); `leo-signal` (návrhy signálů pro určování polohy, navigaci a
čas na nízké oběžné dráze pro libovolný systém: pásmově omezená spektra, jitter sledování kódu a přesnost
měření vzdálenosti, akviziční vyhledávání a čas, spektrální separace proti GPS a Galileo, tolerance
vůči rušičce a kompromis pásem UHF až C, z veřejných předvoleb jako Xona Pulsar, Iridium,
Starlink a CentiSpace nebo vložených návrhů; uzavřené tvary a doppler LEO VALIDATED,
návrhy MODELLED; viz [`docs/LEO-SIGNAL.md`](docs/LEO-SIGNAL.md)); `solar-system` (Slunce, planety, Pluto, Měsíc a sedm velkých
měsíců v jedné epoše — polohy, konstanty, doby šíření světla a dráhové stopy; polohy planet
VALIDATED proti JPL Horizons) a `body-pnt` (určování polohy kolem libovolného z těchto těles s
místní navigační konstelací a hlubokovesmírným spojem ze Země; MODELLED); `campaign` (stávající druhy složené do řetězené misijní časové osy
se stavem předávaným mezi fázemi, procházení parametrů, soubor Monte Carlo se seedem nebo
několik scénářů za jedné sdílené podmínky; MODELLED, viz
[docs/CAMPAIGNS.md](docs/CAMPAIGNS.md)); `constellation-design` (vzory Walker delta a star,
seznamy elementů a vícevrstvé návrhy s předvolbami GPS, Galileo, BeiDou a GLONASS
a pokrytí a snížení přesnosti nad mřížkou zeměpisné šířky/délky;
generátor a globální DOP GPS VALIDATED proti zveřejněným dokumentům služeb, viz
[`docs/CONSTELLATION-DESIGN.md`](docs/CONSTELLATION-DESIGN.md)); `leo-pass` (přelet družice
pro určování polohy, navigaci a čas (PNT) na nízké oběžné dráze (LEO) a jeho rozpočet spoje pásmo po
pásmu, z libovolné konstelace a libovolného návrhu signálu: úhly pohledu, Doppler a rychlost změny Dopplera,
déšť, plyny, scintilace a útlum vstupu do budovy podle ITU-R, hustota poměru nosné k šumu proti
viditelným družicím MEO GNSS, ionosféra prvního řádu a bezionosférické páry a
rozpočet nízkoenergetického určení polohy, sondování ionosféry z každého páru pásem a monitory spoofingu podle
konzistence Dopplera a geometrie přeletu a podle mezipásmové konzistence; členy ITU-R a
dopplerovská obálka statického uživatele VALIDATED, přelet MODELLED, viz
[`docs/LEO-PASS.md`](docs/LEO-PASS.md)); `leo-navmsg` (vysílaná
zpráva efemerid a hodin družice PNT na nízké oběžné dráze (LEO), pro libovolnou dráhu a
nosnou: proložení integrované pravdivé dráhy keplerovskou sadou Galileo, tato sada
s korekčními polynomy podél stopy, napříč stopou a radiálně, 22parametrový model Liu et al. 2025
nebo polynom ECEF bez hodin ATOMIC; chyba vzdálenosti signálu v prostoru
(SISRE) v závislosti na intervalu proložení a periodě aktualizace, kontrola kontinuity aktualizace uprostřed přeletu,
vlastní zdokumentovaný binární rámec Kshana s cyklickou kontrolou redundance CRC-24Q a kvantizačním rozpočtem a
blok ve stylu RINEX-4 označený jako rozšíření Kshana; váhy SISRE, uživatelský
algoritmus Galileo a CRC-24Q VALIDATED, proložení MODELLED; volitelné předvolby pro Xona Pulsar,
Iridium, Starlink, CentiSpace, reprezentativní systém v pásmu C, ATOMIC a Celeste IOD; viz
[`docs/LEO-NAVMSG.md`](docs/LEO-NAVMSG.md)); trojice **fúzovaného PNT MEO + LEO**
`leo-pvt` (dopplerovské určování polohy z rychlosti změny vzdálenosti na nízké oběžné dráze (LEO), společná
určení polohy z pseudovzdáleností GNSS + LEO s mezisystémovými biasy a DOP v závislosti na počtu družic
LEO, polární a arktické pokrytí a přenos času z LEO na UTC — nad libovolnou konstelací,
s volitelnými předvolbami jako Xona Pulsar, Iridium a signály příležitosti Starlink;
dopplerovská obálka LEO VALIDATED proti zveřejněným údajům Iridium a Xona), `leo-ppp`
(konvergence přesného určování polohy bodu jen s GNSS a s rozšířením LEO, porovnaná
s Li et al. 2019) a `ntn-positioning` (určování polohy v nepozemních sítích 5G z
Cramérovy-Raovy meze šířky pásma signálu), MODELLED kromě zmíněné obálky, viz
[`docs/LEO-PNT-FUSION.md`](docs/LEO-PNT-FUSION.md); `leo-pnt-chain` (jeden systém LEO-PNT od začátku
do konce: návrh `leo-signal` nesený pásmem `leo-pass`, C/N0 přeletu a chyba vzdálenosti
signálu v prostoru z navigační zprávy předané fúzovanému určení polohy `leo-pvt` a konvergenci `leo-ppp`,
s výčtem každého předání; MODELLED, viz
[`docs/LEO-PNT.md`](docs/LEO-PNT.md#end-to-end-leo-pnt-chain), což je zároveň přehled
všech druhů a scénářů LEO-PNT, včetně kampaní odolnosti, jednoho scénáře na každou
oblast zaměření experimentu a jednoho na každé vertikální odvětví koncových uživatelů); **lunární sada PNT** `lunar-vlbi`, `lunar-joint-od-clock`,
`lunar-frame-realisation`, `moonlight-service-volume`, `lunar-differential-pnt`,
`lunar-interop-export`; **demonstrátor kvantově podporovaného PNT**
`quantum-time-transfer`, `quantum-gnss-free-nav`, `quantum-anomaly-detect`; a
výzkumné druhy **bezpečnosti signálu, cislunárního prostoru a vrstvené odolnosti** `lunar-attack-surface`,
`realtime-frame-eop`, `lunar-time-budget`, `hybrid-optical-rf`, `cislunar-observability`,
`conflict-resilience` — trojice analýzy mise i tyto pozdější druhy jsou všechny MODELLED
(každý s ověřeným jádrem v uzavřeném tvaru; viz matici).
Společná pole: `seed`, mřížka `[time]`, časová osa dostupnosti `[gnss]` (hnací prvek
výpadku) a bloky pro jednotlivé senzory s řetězci `provenance`, které citují zdroj každého
údaje. Příklad (clock):

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

Volitelná pole (vypnutá, pokud chybějí): hodiny mohou přidat `flicker_floor` (1/f FM — frekvenční
modulace — Allanova spodní mez); inerciální senzor může přidat `gyro_bias` a `q_arw` (bias gyroskopu a úhlová
náhodná procházka) a `bias_instability` a `q_aa` (Allanova spodní mez nestability biasu a
náhodná procházka zrychlení) — dohromady **jednoosý (1-DOF) rozpočet chyb
akcelerometru** (VRW/ARW — náhodná procházka rychlosti/úhlu — a nestabilita biasu). To je rozpočet chyb, který spouští dodávaný
scénářový *balíček* `inertial`. Odděleně nyní knihovna nese ověřený
**tříosý strapdown navigátor** (`src/inertial/{attitude,mechanization,imu_errors}.rs`):
kvaternionovou orientaci s kompenzací coning/sculling, úplnou mechanizaci NED
(členy rotace Země a přepravní rychlosti, Somiglianova gravitace WGS-84) a
deterministický model chyb IMU, ve kterém jsou **měřítkový faktor, nesouosost,
citlivost na g, kvantizace a rampa rychlosti modelovány** (IEEE Std 952-1997, standard IEEE
pro specifikaci gyroskopů a zkušební postupy, §A.2; Groves 2013 §4.3). Tato tříosá cesta je nyní **zapojena do spustitelného
volně vázaného balíčku GNSS/INS** (`kind = "gnss-ins"`): 15stavový chybový EKF
koriguje strapdown řešení podle zašuměných určení polohy, dokud je GNSS k dispozici, a pak
setrvačně překlene výpadek a hlásí fúzovanou horizontální chybu proti
setrvačnému běhu volného INS v otevřené smyčce. K dispozici je také **těsně vázaná aktualizace
pseudovzdáleností** (tvoří inovaci v doméně vzdáleností, takže koriguje i
s méně než čtyřmi družicemi). Scénář
holdoveru hodin může přidat `runs` (> 1) a spustit **soubor Monte Carlo** — každý
ukazatel kvality se pak hlásí jako průměr s rozptylem 5.–95. percentilu a
graf vystínuje pásmo spolehlivosti chyby (viz `scenarios/clock-ensemble.toml`).

Scénář `fusion` (stejné bloky jako `hybrid`) spouští **dva nezávislé Kalmanovy odhadovače**
— jeden pro stav hodin, jeden pro stav polohy — korigované GNSS a podporované
optickým přenosem času a hlásí kombinovaný FoM holdoveru. Oba bloky nesdílejí žádnou
vzájemnou kovarianci: jde o naskládanou dvojici rozpočtů chyb, **nikoli** o skutečný vázaný
společný filtr hodin+polohy (kovariance mezi bloky je položkou plánu vývoje). Viz
`scenarios/fusion-pnt.toml`.

Scénář `spoof` vnáší časový spoofing — jeden ze čtyř druhů `[attack.shape]`
(`linear_ramp`, `step_jump`, `meaconing`, `replay`; samotné `rate_ns_per_s` je stále
přijímáno jako lineární rampa) — a spouští detektor spoofingu každých hodin. Detektor je
oboustranný **energetický test χ²₁ / Neymanův–Pearsonův test** na statistice monitoru s podporou hodin:
práh se nastavuje z cílového rozpočtu falešných poplachů `target_pfa` a
**pravděpodobnost zmeškané detekce `P_md`** se hlásí jak v uzavřeném tvaru, tak metodou
Monte Carlo (`mc_runs` pokusů na hypotézu — obě se shodují na několik ×1/√N).
**Bezpečnostní ukazatel kvality je `1 − P_md`** při provozně škodlivé (specifikační)
velikosti, takže tiché hodiny, které zachytí spoofing o velikosti specifikace, mají skóre ≈ 1 a zašuměné,
které jej často zmeškají, nižší (viz `scenarios/spoof-attack.toml`,
`scenarios/spoof-meaconing.toml`).

Scénář `gnss-sim` je simulace v **doméně měření**: pro každou viditelnou
družici syntetizuje pseudovzdálenost `ρ = geometric range + c·δt_rx − c·δt_sv +
I + T + noise + multipath` a Doppler na L1, s jednofrekvenční ionosférou **Klobuchar**
(`[iono]`, IS-GPS-200 §20.3.3.5.2.5) a zenitovou troposférou **Saastamoinen**
promítnutou mapovací funkcí **Niell (1996)** (`[tropo]`).
Rezidua napájejí **snímkový RAIM** pro HPL/VPL v každé epoše a pseudovzdálenost,
Doppler, C/N₀ a ionosférické/troposférické korekce každé družice se vydávají v poli JSON
`gnss_measurements`. Jde o dopředný simulátor (generuje měření ze
známé pravdy), nikoli přijímač/řešič — běh bez šumu reprodukuje geometrii plus
korekce na méně než milimetr (viz `scenarios/gnss-sim-raim.toml`).

Scénář `jamming` modeluje RF interferenci jako **rozpočet spoje**: `[jammer]`
(poloha ECEF, vysílací `power_dbw`, typ) zvyšuje poměr rušení k signálu na
`[receiver]`, který sleduje `[constellation]` typu Walker. Z geometrie (útlum volným
prostorem a zisk přijímací antény pro každý směr) vypočte pro každou družici
`J/S`, **efektivní C/N₀** pomocí standardní rovnice odolnosti proti rušení (procesní zisk
rozprostření × faktor spektrální separace `Q`; Kaplan & Hegarty §9.4) a
označí ztrátu zámku pod konfigurovatelným prahem sledování — a hlásí
ukazatel kvality `availability_under_jamming`. Širokopásmová rušička 10 W ve vzdálenosti 1 km
přijímač zcela vyřadí (J/S ≈ 72 dB); stejná rušička ve vzdálenosti 100 km spoje jen
degraduje (viz `scenarios/jamming-demo.toml`).

Scénář `sweep` provádí **studii kompromisů**: mění jeden `parameter` (`threshold_ns`,
`duration_s`, `quantum_q_wf` nebo `classical_q_wf`) od `start` do `stop` v `steps`
bodech na `scale` typu `lin` nebo `log`, zaznamenává `metric` (např. `holdover_s`) pro oboje
hodiny a vykreslí obě křivky. Základní scénář patří pod `[base]` (viz
`scenarios/sweep-clock-stability.toml`).

Scénář `sweep-nd` to zobecňuje na **libovolný balíček a libovolný počet os**:
mění tečkované klíče TOML scénáře `[base]` (libovolného `kind`) přes kartézský
součin `[[axes]]`, znovu spustí každý uzel mřížky a zaznamená `metrics` zadané jako
tečkované cesty JSON do výsledku (např. `classical.fom.holdover_s`). Funguje pro
každý balíček, protože pracuje na hranici TOML/výsledek; nativní běhy vyhodnocují
mřížku paralelně (bez další závislosti, wasm přechází na sekvenční běh) a
výstup je deterministický a uspořádaný po řádcích (viz `scenarios/sweep-nd-inertial.toml`).

Scénář `orbit` odvozuje časovou osu `[gnss]` z geometrie, místo aby se
zadávala ručně — zadejte dráhu `[user]`, `[constellation]`, elevační `mask_deg` a dva
bloky hodin. Hlásí také přesnost polohy z geometrie družic;
volitelné `sigma_uere_m` (1-sigma ekvivalentní chyba vzdálenosti uživatele, výchozí 1 m) převádí
snížení přesnosti polohy na sigmu polohy. Dráhu uživatele lze učinit
**excentrickou** pomocí `eccentricity` a `argp_deg` a `j2 = true` přidá sekulární drift
způsobený zploštěním Země (viz `scenarios/orbit-molniya.toml`). Konstelace může být místo toho
**skutečná**: dejte `[constellation]` blok `tle` se sadami dvouřádkových elementů a
družice se z něj rozparsují (viz `scenarios/orbit-real-tle.toml`). Přidejte jeden nebo více
bloků `[[constellations]]` pro **více GNSS** (např. GPS + Galileo; viz
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

Druhy **alt-PNT bez GPS** navigují zcela bez GNSS, porovnáním naměřené posloupnosti
pole s mapou pomocí částicového filtru. Scénář `gravity-map` letí po trase
polem sféricko-harmonických tíhových anomálií a obnovuje ji ze čtení gravimetru
se studenými atomy (`scenarios/gps-denied-gravity-nav.toml`); scénář `terrain-nav`
dělá totéž proti výškovému DEM SRTM (TERCOM/SITAN, `scenarios/terrain-nav.toml`);
a scénář `combined-altpnt` fúzuje **gravitaci + magnetické pole IGRF + terén** v jednom filtru
(`scenarios/combined-altpnt.toml`).

Scénář `lunar-integrity` vyhodnocuje **cislunární** PNT: provádí přelet ochranné úrovně
ARAIM nad jižním pólem Měsíce proti sadě relé LunaNet/LNIS a poctivě hlásí
mezeru v integritě — lunární σ_URE ~30 m žene ochrannou úroveň vysoko nad výstražnou
mez 50 m, takže služba je podle pravidel integrity ve stylu letectví *nedostupná*
(`scenarios/lunanet-araim.toml`).

Scénář `lunar-time-offset` hlásí **relativistickou rychlost hodin Země–Měsíc** —
základ časové škály Lunar Coordinate Time (LTC/TCL). Post-newtonovská identita
z prvních principů sčítá rozdíl vlastního potenciálu (potenciál geoidu IAU `L_G` minus
povrchový vlastní potenciál Měsíce) a kinetický člen Měsíce (Doppler druhého řádu) na sekulární
rychlost ≈ 57 µs/den, hlášenou se zveřejněným pásmem 56–59 µs/den; udává také
nahromaděný offset LTC−TT za horizont a soubor s inverzními vahami rozptylu (lunární
papírové hodiny). **MODELLED** — hlavní údaj je *závislý na referenci* (geoid Země
proti selenoidu Měsíce, průměrovací okno), a proto se hlásí pásmo, nikoli jediné certifikované
číslo (`scenarios/lunar-time-offset.toml`).

V `scenarios/` najdete alespoň jeden zpracovaný příklad každého druhu (92 druhů, 193 souborů scénářů
`.toml` + 1 manifest sady — několik druhů dodává více než jeden příklad). Ne každý
druh má soubor pojmenovaný po sobě: `lunar-integrity` → `scenarios/lunanet-araim.toml` a
`gravity-map` → `scenarios/gps-denied-gravity-nav.toml` jsou dva z několika takových.
Druhy, na které lze rozcestit, kdykoli vypíšete pomocí chyb `cargo run -- --validate <file>`,
funkce `list_kinds()` v Pythonu nebo nástroje MCP `list_scenario_kinds`.

</details>

<details>
<summary>Výstup</summary>

### Výstup

Výsledný artefakt je verzovaný, samopopisný JSON: časové řady pro každý krok,
bodované ukazatele kvality, aktivní specifikace modelů (s původem), seed,
**haš scénáře** — takže jakýkoli graf lze ze souboru reprodukovat — a pro každé hodiny
`adev_curve` (`[{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}]`): překrývající se
Allanovu deviaci přes průměrovací doby rozložené po oktávách — standardní způsob čtení
stability hodin — nyní s **95% pásmem spolehlivosti specifickým pro typ šumu** v každém bodě (mocninný
typ záznamu se určuje ze sklonu modifikované Allanovy deviace a interval χ² používá
odpovídající efektivní stupně volnosti NIST SP 1065). Hřiště v prohlížeči jej vykresluje jako
log-log graf „Clock stability (ADEV)“. (MDEV, TDEV a HDEV jsou k dispozici jako knihovní
odhadovače; exportovaná výsledná křivka je překrývající se ADEV.) Každé pole, s jednotkami a
odkazem na zdroj, je zdokumentováno v [`docs/SCHEMA.md`](docs/SCHEMA.md).

**Každý graf je samopopisný.** Hřiště v prohlížeči, export `*.chart.svg` z CLI
a výsledková karta HTML (HyperText Markup Language) opatřují každý obrázek grafu patičkou
`Kshana v<version> · scenario <hash> · kshana.dev`. `scenario <hash>` je prvních
12 šestnáctkových znaků **haše scénáře** běhu — otisku SHA-256 (256bitový Secure Hash Algorithm) nad kanonickou definicí
scénáře (seed, prahy, parametry modelu, okna GNSS, …); zprávy integrity a lunární
zprávy, které nenesou vlastní haš, se uchylují k SHA-256 zdroje scénáře.
Je to **stejný otisk**, jaký je uveden v jednořádkovém souhrnu a ve výsledném JSON, takže
uložený nebo vložený graf vždy nese svou verzi, přesný scénář, který jej vytvořil (pro
reprodukci bit po bitu), a zdroj — změňte jakýkoli vstup a haš se změní.

Ukazatele kvality odpovídají standardním provozním ukazatelům kvality PNT:

| Ukazatel kvality | Jak jej Kshana počítá |
|-----------------|------------------------|
| Výkonnost časování (balíčky clock/orbit) | RMS fázové chyby hodin + 95. percentil během výpadku, v **nanosekundách** (`timing_rms_ns`) — metrika časování, nikoli polohy |
| Výkonnost určování polohy (balíčky inertial/hybrid) | RMS chyby polohy 1-DOF + 95. percentil během výpadku, v **metrech** (`pos_rms_m`); jednoosé. Jednotlivý běh je označen `monte_carlo: false`; nastavte `runs = N` pro soubor Monte Carlo, který hlásí průměr, rozptyl a bootstrapový 95% CI (interval spolehlivosti) každé metriky. Stále **nejde** o 2-D CEP/2DRMS (kruhová pravděpodobná chyba / dvojnásobek střední kvadratické vzdálenosti) ani o přesnost váženou DOP (ty potřebují tříosý model — plán vývoje) |
| Autonomie | doba holdoveru — čas ve specifikaci po ztrátě GNSS (kvantováno mřížkou: dolní mez) |
| Odolnost | sklon růstu chyby během výpadku |
| Dostupnost | podíl běhu s řešením ve specifikaci |
| Integrita | **vnitřní konzistence** filtru — podíl vzorků výpadku, jejichž chyba zůstává uvnitř vlastní meze k-sigma Kalmanova filtru. **Nejde** o údaj o integritě HPL/VPL/RAIM v letectví (viz [`docs/INTEGRITY.md`](docs/INTEGRITY.md)) |
| Bezpečnost | **analytická mez *detekovatelnosti* spoofingu** ze stability hodin — jak malý/pomalý časový spoofing by mohl monitor konzistence jedněch hodin označit. Má smysl jen s nakonfigurovaným útokem; **nejde** o detektor RAIM pro více družic |

Jste v těchto pojmech noví? Každý je v běžném jazyce definován ve [slovníku pojmů](docs/GLOSSARY.md).

</details>

<details>
<summary>Struktura repozitáře</summary>

### Struktura repozitáře

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
<summary>FAQ (často kladené otázky)</summary>

### FAQ

**Musím rozumět kvantové fyzice, abych to mohl používat?**
Ne. Pokud umíte spustit příkazový řádek, umíte spustit Kshana. Začněte
[úvodem v běžném jazyce](docs/CONCEPTS.md); pojmy si vyhledejte ve [slovníku pojmů](docs/GLOSSARY.md).

**Jde o návrh kvantového hardwaru nebo letový software?**
Ne. Jde o výkonový *simulátor*. Věrnost kvantového hardwaru pochází ze zveřejněných
modelů chyb, ne z tohoto nástroje. Viz [Co to je / není](#what-it-is--is-not).

**Jsou kvantové výsledky realistické, nebo jde o marketing?**
Každý parametr je citován z katalogového listu nebo článku, každý model je ověřen proti
učebnicovému vztahu a vyspělost je poctivě označena v
[VALIDATION.md](docs/VALIDATION.md) — včetně toho, že žádné stronciové optické hodiny dosud
neletěly. Engine je neutrální: kvantové a klasické jsou stejný kód s jinými
zveřejněnými čísly.

**Mohu věřit, že se dva běhy shodnou?**
Ano — běhy jsou deterministické: `scenario + seed + engine version → bit-identical output`,
vynuceno skriptem `scripts/check-reproducible.sh`.

**Mohu to používat z Pythonu nebo v prohlížeči?**
Ano — viz [Instalace](#install): příklady pro Python a WebAssembly jsou pod ní. Oba volají stejný engine.

**Jak namodeluji vlastní senzor?**
Napište scénář `.toml` se zveřejněnými údaji vašeho senzoru v polích `provenance`.
Viz [Formát scénáře](#scenario-format) a příklady v `scenarios/`.

**Je to zdarma pro komerční použití?**
Ano — pod AGPL-3.0, a to i v komerčním prostředí, pokud dodržíte
copyleft AGPL (zejména: pokud Kshana upravíte a nabízíte ji přes síť, musíte
těmto uživatelům nabídnout svůj upravený zdrojový kód). Pokud vám to nevyhovuje — např. potřebujete
začlenit Kshana do proprietárního produktu nebo provozovat uzavřenou síťovou službu — je k dispozici komerční
licence od Ashforde® OÜ; viz [`LICENSING.md`](LICENSING.md) a
[Podpora](#support--professional-services).

</details>

<details>
<summary>Řešení potíží</summary>

### Řešení potíží

**`cargo build` selhává na staré sadě nástrojů.** Kshana potřebuje Rust ≥ 1.88. Aktualizujte pomocí
`rustup update`.

**Sestavení rozšíření pro Python selhává při linkování na macOS** (`Undefined symbols … _Py…`).
Rozšíření pro Python rozřešuje své symboly v době načtení. `maturin` nastaví správný příznak
linkeru automaticky — použijte `maturin develop --features python` místo holého
`cargo build`.

**Sestavení pro Python si stěžuje, že interpret je novější, než PyO3 zná.** Nastavte
`PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1` (wheely abi3 jsou dopředně kompatibilní napříč
verzemi CPythonu).

**Sestavení WebAssembly nemůže najít cíl.** Nainstalujte jej jednou pomocí
`rustup target add wasm32-unknown-unknown`, pak `wasm-pack build --target web -- --features wasm`.

**Kam se poděl můj výstup?** Každý běh zapíše `<scenario>.result.json`,
`<scenario>.chart.svg`, `<scenario>.report.html` a `<scenario>.report.json` vedle
vstupního `.toml` a
u druhů, které zveřejňují tabulku, také `<scenario>.table.csv`. Všechny jsou
záměrně ignorovány gitem.

</details>

<details>
<summary>Verzování a vydání</summary>

### Verzování a vydání

Kshana se řídí [sémantickým verzováním](https://semver.org). Před verzí 1.0 se veřejné
schéma scénáře/výsledku může ještě měnit; zpětně nekompatibilní změny jsou výslovně uvedeny v
[`CHANGELOG.md`](CHANGELOG.md). Každý výsledek je reprodukovatelný z
`scenario + seed + engine version`.

**Každý tag `vX.Y.Z` automaticky zveřejní všechny kanály, v jednom pořadí** — úplná
testovací sada nejprve běží na označeném commitu, nic se nezveřejní, dokud neprojde, a
poté pipeline kontroluje, že každý registr skutečně nabízí novou verzi
([`docs/RELEASING.md`](docs/RELEASING.md)). Kanály:

| Kanál | Instalace / získání | Obsah |
|---------|---------------|----------|
| [crates.io](https://crates.io/crates/kshana) | `cargo install kshana` · `kshana = "0.35"` | knihovna Rust + CLI |
| [crates.io](https://crates.io/crates/kshana-mcp) | `cargo install kshana-mcp` | server MCP |
| [PyPI (Python Package Index)](https://pypi.org/project/kshana/) | `pip install kshana` | wheely abi3 (Linux/macOS/Windows) + sdist (zdrojová distribuce) |
| [npm](https://www.npmjs.com/package/kshana) | `npm install kshana` | modul WebAssembly + obal v JS |
| [ghcr.io](https://github.com/ashfordeOU/kshana/pkgs/container/kshana-mcp) | `docker run -i ghcr.io/ashfordeou/kshana-mcp` | multiarchitekturní obraz OCI (Open Container Initiative) — není potřeba žádná sada nástrojů |
| [npm](https://www.npmjs.com/package/kshana-mcp) | `npx -y kshana-mcp@0.40.0` | spouštěč: stáhne binárku vydání, ověří `SHA256SUMS` a spustí ji |
| [PyPI](https://pypi.org/project/kshana-mcp/) | `uvx kshana-mcp==0.40.0` · `pipx run kshana-mcp==0.40.0` | stejný spouštěč pro Python |
| Homebrew · Scoop · winget | `brew install ashfordeOU/tap/kshana-mcp` · `scoop install kshana-mcp` · `winget install AshfordeOU.KshanaMcp` | binárka `kshana-mcp`, generovaná z `SHA256SUMS` každého vydání |
| Claude Desktop | dvakrát klikněte na `kshana-mcp-<target>.mcpb` z vydání | rozšíření s binárkou uvnitř |
| oficiální registr MCP | automaticky objeveno klienty MCP | `io.github.ashfordeOU/kshana-mcp` (obraz OCI, balíčky npm a PyPI) |
| [JetBrains Marketplace](https://plugins.jetbrains.com/plugin/32181-kshana--pnt-simulator) | IDE → Plugins → vyhledejte "Kshana" | plugin pro IDE **Kshana — PNT simulator** |
| [GitHub Releases](https://github.com/ashfordeOU/kshana/releases) | stažení | binárka příkazového řádku `kshana` pro Linux x86-64, macOS (Apple silicon a Intel) a Windows x86-64, binárka `kshana-mcp` pro každý z těchto systémů a Linux Arm, rozšíření Claude Desktop `.mcpb` pro každý systém, **SBOM** CycloneDX, provenance sestavení **SLSA**, souhrn validace v HTML a soubor kontrolních součtů `SHA256SUMS` |
| [Zenodo](https://doi.org/10.5281/zenodo.20528627) | DOI | citovatelný archiv každého vydání |
| [kshana.dev](https://kshana.dev) | otevřete v prohlížeči | Kshana Studio, aplikace WebAssembly v prohlížeči, znovu sestavená z každého tagu vydání (takže verze, kterou zobrazuje, je verze, kterou spouští) |

Verze crate / obrazu / registru serveru MCP sleduje engine (přibaluje
knihovnu); plugin pro JetBrains se verzuje nezávisle (volá vaši nainstalovanou
binárku `kshana`).

</details>

<details>
<summary>Plán vývoje</summary>

### Plán vývoje

Viz [`ROADMAP.md`](ROADMAP.md) pro plán vývoje po fázích, [`CHANGELOG.md`](CHANGELOG.md)
pro historii vydání a [`docs/CAPABILITY.md`](docs/CAPABILITY.md) pro
plán vývoje jednotlivých schopností. Pořadí priorit je: **nejprve důkazy o časování a holdoveru pro
kritickou infrastrukturu** (telekomunikační masky, delší holdover se stárnutím a flicker
šum, příjem naměřených dat hodin); **na druhém místě neutrální metoda kompromisu kvantové
proti klasickému** (výsledky označené MODELLED, dokud je nepovýší naměřená data partnera); a
**lunární / cislunární a hlubokovesmírná navigace udržovaná**, nikoli rozšiřovaná jako hlavní směr. **Redukce soustavy s přesností ITRF** je nyní dodána —
úplný řetězec GCRS↔ITRS IAU 2006/2000A založený na CIO (pohyb pólu + nutace pod obloukovou vteřinu),
ověřený bit po bitu proti SOFA/ERFA a nezávisle křížově zkontrolovaný proti ANISE
(SPICE v čistém Rustu) na ≤ 3.6 m na dráze GNSS. Mezi krátkodobé položky patří těsně vázaná fúze fáze nosné a zpřístupnění
volně/těsně vázaného navigátoru GNSS/INS ve více balíčcích; engine **hlubokovesmírné / marsovské
radiometrické navigace** dorazil ve v0.17.0 (ověřeno simulací).
**Vrstva kvantové fyziky** je položkou **P2**: akcelerometr CAI je nyní simulován z
prvních principů (fáze Mach–Zehnder, projekční šum, pokles kontrastu, vazba na
vibrace), zatímco senzory hodin/přenosu času jsou stále řízeny zveřejněnými
Allanovými koeficienty / koeficienty šumového rozpočtu. TEME&harr;ECEF založené na GMST, časové systémy IERS
s přestupnými sekundami (UTC/TAI/TT/UT1), šíření drah SGP4/SDP4 (v0.7.0,
ověřeno proti vektorům AIAA 2006-6753) a spustitelný fúzní balíček `gnss-ins`
byly všechny **dodány** a inerciální rychlost je zpřístupněna dalšímu zpracování. Aktivní
stochastický detektor časového spoofingu (Neymanův–Pearsonův / χ²₁ energetický test s P_fa/P_md
metodou Monte Carlo a bezpečnostním FoM 1−P_md), model rušení na základě rozpočtu spoje (J/S → efektivní
C/N₀ → ztráta zámku), dostupnost více konstelací, jednoosý (1-DOF)
rozpočet chyb IMU, dva nezávislé Kalmanovy odhadovače (hodiny + poloha) hlášené jako
kombinovaný FoM, skutečná geometrie konstelací z TLE, zpráva s výsledkovou kartou v HTML,
dostupnost GNSS odvozená z geometrie
*a* snížení přesnosti z keplerovských drah s excentricitou a driftem J2,
pásma spolehlivosti Monte Carlo, procházení parametrů ve studiích kompromisů, hřiště WebAssembly
v prohlížeči a volitelné vazby pro Python (PyO3) a WebAssembly (wasm-bindgen) dorazily
do `main`.

</details>

<details>
<summary>Přispívání</summary>

### Přispívání

Viz [`CONTRIBUTING.md`](CONTRIBUTING.md). Ve zkratce: testy procházejí (`cargo test`),
dva skripty pojistek procházejí, Conventional Commits a záznam `CHANGELOG.md` `[Unreleased]`
pro každou změnu viditelnou uživateli. Účast se řídí naším
[Kodexem chování](CODE_OF_CONDUCT.md). Chcete-li nahlásit bezpečnostní problém, viz
[Bezpečnostní zásady](SECURITY.md) — pro zranitelnosti prosím neotevírejte veřejný issue.

</details>

<details>
<summary>Dokumentace: každý dokument a pro koho je určen</summary>

<a id="documentation"></a>
### Dokumentace

| Dokument | Pro koho | Co obsahuje |
|----------|----------|--------------|
| [Úvod do pojmů](docs/CONCEPTS.md) | všichni, začněte zde | co Kshana dělá a proč, od nuly po fyziku |
| [Kshana Studio](web/README.md) | všichni | spuštění enginu ve vašem prohlížeči (WebAssembly); poznámky k sestavení a nasazení |
| [Slovník pojmů](docs/GLOSSARY.md) | všichni | definice každého pojmu v běžném jazyce |
| [Druhy scénářů](docs/KINDS.md) | všichni | každý druh, na který engine rozcestí: co dělá, jeho pole, příklad příkazu, jeho řádky registru a graf, který pro něj engine zapíše |
| [Partnerská data](docs/PARTNER-DATA.md) | laboratoře a výrobci s naměřenými daty | které řádky MODELLED by naměřený záznam hodin nebo IMU mohl povýšit, formáty, jak se příspěvek kontroluje (`kshana partner check`), boduje a připisuje |
| [Architektura](docs/ARCHITECTURE.md) | vývojáři / recenzenti | mapa modulů, pipeline enginu, rozcestník a diagramy |
| [Stav validace](docs/VALIDATION.md) | recenzenti / citující | co je `validated` a co `not modeled`, s důkazy |
| [Verifikační matice](docs/VERIFICATION-MATRIX.md) | recenzenti / citující | strojově kontrolovaný registr důkazů — každý řádek schopnosti s jejím stavem, modulem, testem a vnějším orákulem, generovaný ze `src/verification.rs` |
| [Zdůvodnění Modelled](docs/MODELLED-RATIONALE.md) | recenzenti | proč každý řádek **Modelled** nemá vnější orákulum, uvedeno řádek po řádku |
| [Původ](docs/PROVENANCE.md) | recenzenti / citující | každý parametr senzoru, model a datová sada vysledované k jejich zveřejněnému zdroji, v jedné citovatelné tabulce |
| [Reprodukovatelnost a původ](docs/REPRODUCIBILITY.md) | recenzenti / balíčkovatelé | záruky determinismu, fixace zlatých vzorů, SBOM (softwarový kusovník), provenance sestavení |
| [Platformní tagy wheelů](docs/WHEEL_TAGS.md) | balíčkovatelé | matice wheelů abi3 pro Python — který platformní tag `pip install kshana` rozřeší |
| [Pozicování](docs/POSITIONING.md) | hodnotitelé | kde Kshana stojí vůči RTKLIB/gLAB (doplňkově) a úroveň v prohlížeči bez instalace |
| [Kshana Pro](docs/PRO.md) | hodnotitelé / manažeři programů | co proprietární nadstavba Pro přidává nad stejným enginem: optimalizátor návrhu, nejistota a citlivost, misijní dokumentace, hlídání kampaně, koexistence ve spektru, služba úloh on-premises, sledovatelnost požadavků; co každá část vytváří a co nedělá |
| [Technická zpráva](paper/kshana-technical-report.md) · [Článek pro JOSS](paper/paper.md) | recenzenti / citující / hodnotitelé | úplný rozšířený výzkumný článek — architektura, modely jednotlivých domén, validace, případové studie a omezení — plus stručné podání do JOSS (Journal of Open Source Software) |
| [Validace SGP4](docs/SGP4-VALIDATION.md) | recenzenti / citující | shoda s referencí AIAA 2006-6753 (666 stavů, ~4 mm) **a** přímé srovnání s nezávislým crate `sgp4` (shoda pod mikron / 4.12 mm) |
| [Validace silového modelu](docs/AGENCY-ORBIT-VALIDATION.md) | recenzenti / citující | engine s úplnými silami (`src/precise_od.rs`) proložený efemeridami agentur — metodika a ověřená rezidua |
| [Průvodce skutečnými TLE](docs/REAL_TLE_GUIDE.md) | uživatelé | řízení scénářů ze skutečných TLE konstelací z Celestrak / Space-Track (místo přibalené syntetické sady Walker) |
| [FoM integrity](docs/INTEGRITY.md) | hodnotitelé | co znamenají údaje `integrity` / `security` — a čím **nejsou** ve srovnání s HPL/VPL v letectví |
| [Reference ARAIM](docs/ARAIM_REFERENCE.md) | recenzenti / integrátoři | otevřená implementace ochranné úrovně MHSS ARAIM — projekce nominálního biasu `b_k`, σ_URA proti σ_URE a apriorní pravděpodobnosti režimů poruch |
| [Kvantové modely](docs/QUANTUM.md) · [podrobnosti](docs/QUANTUM-MODELS.md) | recenzenti | fyzikální vrstva interferometru se studenými atomy a kde se koeficienty stále vyhledávají |
| [Shoda](docs/COMPLIANCE.md) | hodnotitelé | rozsah algoritmů DO-229E / DO-316 a co **není** tvrzením o shodě |
| [Námořní důvěra](docs/MARITIME-TRUST.md) | námořníci / integrátoři | skóre důvěryhodnosti GNSS 0-100 pro NMEA plavidla, jeho monitory a jeho limity (pouze poradní charakter, nikoli typově schválené navigační zařízení) |
| [Výcvikové proudy NMEA](docs/NMEA-TRAINING.md) | námořní instruktoři | syntetické NMEA můstku se skriptovaným rušením a spoofingem a logem instruktora; pouze text, nikdy pro živou navigaci |
| [Mapa interference](docs/INTERFERENCE-MAP.md) | analytici / námořníci | kde letadla a lodě hlásila degradovaná navigační data a jak velkou část trasy to zasahuje |
| [Balíčky důkazů](docs/EVIDENCE-PACKS.md) | provozovatelé / pojistitelé | podepsané technické záznamy události důvěry a jak je ověřit |
| [Telemetrie důvěry](docs/TRUST-TELEMETRY.md) | provozní / bezpečnostní týmy | proud důvěry jako metriky Prometheus, události SIEM a OpenTelemetry, s dashboardem Grafana |
| [Námořní integrace](docs/MARINE-INTEGRATIONS.md) | majitelé lodí / integrátoři | plugin Signal K, režim brány OpenCPN a referenční sestavení |
| [Testovací pracoviště](docs/TEST-BENCH.md) | výrobci přijímačů | přehrání exportovaného scénáře přes laboratorní simulátor a bodování logu přijímače |
| [Mapování na rámce shody](docs/compliance/README.md) | hodnotitelé | veřejné rámce odolnosti namapované na výstupy Kshana, se zdroji a mezerami; `kshana compliance-report` |
| [Notebooky](notebooks/README.md) | uživatelé | spustitelné návody s vykresleným textem |
| [Normy a interoperabilita](docs/STANDARDS.md) | integrátoři | výměnné formáty GNSS / letové dynamiky / agentur, které Kshana čte a zapisuje (RINEX, SP3, CCSDS OEM/OMM/TDM/Space-Packet, …) |
| [Fúze LEO PNT](docs/LEO-PNT-FUSION.md) | uživatelé / hodnotitelé | fúzované určování polohy, navigace a času MEO + LEO: Doppler, společné pseudovzdálenosti, konvergence PPP, 5G NTN, polární pokrytí a přenos času z LEO nad libovolnou konstelací; volitelné předvolby a jejich veřejné zdroje |
| [Kampaně](docs/CAMPAIGNS.md) | uživatelé / hodnotitelé | skládání scénářů: řetězené misijní časové osy, procházení parametrů, soubory Monte Carlo a běhy se sdílenou podmínkou, s identitami skládání, které testy fixují |
| [Katalog scénářů](docs/SCENARIOS.md) | uživatelé / integrátoři | každý druh, na který lze rozcestit, s povinnými a volitelnými poli TOML — generováno z `api::list_scenario_kinds()` |
| [Schéma výsledku](docs/SCHEMA.md) | integrátoři | každé pole výsledného JSON, s jednotkami a odkazem na zdroj |
| [API pro Python](docs/PYTHON_API.md) | uživatelé Pythonu | rozhraní vazby PyO3 — volání enginu, typy scénáře/výsledku a příklady |
| [Tvrzení vs. realita](docs/CLAIMS-VS-REALITY.md) | recenzenti | registr uzavírání nadsazených tvrzení + pojistka v CI (`tests/no_overclaims.rs`), která jej udržuje vyřešený |
| [Plán vývoje](ROADMAP.md) | všichni | plán vývoje po fázích — co bylo dodáno a co následuje |
| [Server MCP](mcp/kshana-mcp/README.md) · [Plugin pro JetBrains](ide/jetbrains/README.md) | agenti / uživatelé IDE | spuštění Kshana z AI asistenta nebo z JetBrains IDE |
| [Průvodce pro agenty](docs/AGENTS.md) · [Rozhraní](docs/SURFACES.md) | agenti / integrátoři | který nástroj odpovídá na kterou otázku, co si u každé odpovědi ponechat; kde je každá schopnost dostupná (CLI, Rust, Python, WASM, MCP, plugin, JetBrains, notebooky) a proč je buňka N/A |
| [Seznam změn](CHANGELOG.md) | všichni | historie vydání (Keep a Changelog + SemVer, sémantické verzování) |
| [Přispívání](CONTRIBUTING.md) | přispěvatelé | sestavení, pojistky, disciplína testů/citací, DCO (Developer Certificate of Origin) |
| [Správa projektu](GOVERNANCE.md) | přispěvatelé / komunita | jak je Kshana spravována — kdo rozhoduje, jak, a hranice mezi otevřeným a uzavřeným |
| [Kodex chování](CODE_OF_CONDUCT.md) | komunita | očekávané chování (Contributor Covenant) |
| [Bezpečnostní zásady](SECURITY.md) | oznamovatelé | jak nahlásit zranitelnost; poznámka o dvojím užití |

</details>

<details>
<summary>Klíčové reference</summary>

### Klíčové reference

**Validační orákula a normy** — vnější autority, ke kterým jsou kontroly Kshana ukotveny:

- Vallado, Crawford, Hujsak & Kelso — *Revisiting Spacetrack Report #3* ([AIAA 2006-6753](https://doi.org/10.2514/6.2006-6753); [testovací data](https://celestrak.org/publications/AIAA/2006-6753/)): verifikační sada SGP4/SDP4, které Kshana odpovídá na 4.12 mm, a zpracované příklady soustav, proti kterým je kontrolován řetězec TEME→ITRF.
- IAU [SOFA](https://www.iausofa.org/) / [ERFA](https://github.com/liberfa/erfa) — referenční rutiny pro čas a soustavy, proti kterým jsou bit po bitu ověřeny nutace IAU 2000A a redukce GCRS↔ITRS založená na CIO.
- Petit & Luzum (eds.) — *IERS Conventions (2010)*, [IERS TN (Technical Note) 36](https://iers-conventions.obspm.fr/) (normy pro orientaci Země, pohyb pólu a soustavy).
- Riley — *Handbook of Frequency Stability Analysis*, [NIST SP 1065](https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf) (vztahy Allanovy deviace a referenční řada NBS14; NBS = bývalý US National Bureau of Standards).
- Pedregosa et al. — *scikit-learn: Machine Learning in Python*, [JMLR 12 (2011)](https://jmlr.org/papers/v12/pedregosa11a.html): referenční implementace ROC/AUC, matice záměn a přesnosti/úplnosti/F1, se kterými se testovací prostředí pro hodnocení RF poruch přesně shoduje (`tests/eval_metrics_reference.rs`).
- Virtanen et al. — *SciPy 1.0*, [Nature Methods 17 (2020)](https://doi.org/10.1038/s41592-019-0686-2): `optimize.nnls`, `stats.chi2` a `linalg.expm` — referenční rutiny, proti kterým jsou ověřeny proložení NNLS naměřené ADEV v kvantovém kompromisu, pásma konzistence χ² a van Loanova kovariance procesního šumu hodin (`tests/scipy_reference.rs`).
- Knowles, Kanhere, Neamati & Gao — *gnss_lib_py*, [SoftwareX 27 (2024)](https://doi.org/10.1016/j.softx.2024.101811): použito jako otevřený předchozí stav techniky (viz *Srovnání a otevřený předchozí stav techniky* níže) i jako **nezávislé orákulum DOP**, se kterým se výpočet GDOP/PDOP/HDOP/VDOP/TDOP shoduje na 1e-6 (`tests/dop_reference.rs`).
- Montenbruck & Gill — *Satellite Orbits: Models, Methods and Applications* ([Springer](https://doi.org/10.1007/978-3-642-58351-3)): silové modely za proložením silového modelu přesnými efemeridami agentur.
- Howell — *Three-dimensional, periodic, halo orbits*, Celestial Mechanics 32(1) (1984), [doi:10.1007/BF01358403](https://doi.org/10.1007/BF01358403); Zimovan-Spreen, Howell & Davis — *Near rectilinear halo orbits and nearby higher-period dynamical structures*, Astrodynamics 6 (2022), [doi:10.1007/s42064-021-0125-x](https://doi.org/10.1007/s42064-021-0125-x) (rodiny drah halo/NRHO, které diferenciální korektor CR3BP reprodukuje).

**Fyzika zařízení a metod** — citované zdroje za modely senzorů:

- Origlia, Schiller, Bongs et al. — [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) (stronciové optické mřížkové hodiny, cíl orientovaný na vesmír).
- Oelker et al., *Nature Photonics* (2019) — [doi:10.1038/s41566-019-0493-4](https://doi.org/10.1038/s41566-019-0493-4) (laboratorní Sr hodiny, 4.8×10⁻¹⁷).
- Templier et al., *Science Advances* (2022) — [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) (hybridní trojice kvantových akcelerometrů).
- Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation* — [tutoriál IEEE AESS (Aerospace and Electronic Systems Society) (repozitář University College London Discovery)](https://discovery.ucl.ac.uk/id/eprint/1470141/) (růst chyby výpočetní navigace).
- Giorgetta et al., *Nature Photonics* 7, 434 (2013) — [arXiv:1211.4902](https://arxiv.org/abs/1211.4902); Deschênes et al., *Phys. Rev. X* 6, 021016 (2016) — [APS (American Physical Society)](https://journals.aps.org/prx/abstract/10.1103/PhysRevX.6.021016) (optický obousměrný přenos času a frekvence; optický mezidružicový spoj podle nich modeluje svůj rozpočet nereciprocity).
- Betz — *Binary Offset Carrier Modulations for Radionavigation*, NAVIGATION 48(4) (2001), [doi:10.1002/j.2161-4296.2001.tb00247.x](https://doi.org/10.1002/j.2161-4296.2001.tb00247.x) (modulace BOC a teorie spektrální separace za `src/navsignal.rs`).
- Kaplan & Hegarty (eds.) — *Understanding GPS/GNSS: Principles and Applications* (3. vyd., Artech House, 2017): rovnice efektivního C/N₀ odolnosti proti rušení a tepelný šumový jitter sledování kódu early–late DLL, které používají modely navigačního signálu a rušení.

**Srovnání a otevřený předchozí stav techniky** — nástroje a přehledy, vůči kterým je Kshana vymezena:

- Humphreys et al. — [*TEXBAT*](https://radionavlab.ae.utexas.edu/texbat/) (Texas Spoofing Test Battery; ION — Institute of Navigation — GNSS 2012): parametry testovací baterie spoofingu, proti kterým je charakterizován vícevrstvý detektor.
- González et al. — [NaveGo](https://github.com/rodralez/NaveGo) (2017): otevřené, ověřené profily chyb inerciální navigace použité jako klasický základ.
- Iiyama, Casadesús Vila & Gao — [*LuPNT*](https://github.com/Stanford-NavLab/LuPNT) (ION GNSS+ 2023, Stanford NavLab): otevřený simulátor lunárního PNT.
- Knowles, Kanhere, Neamati & Gao — *gnss\_lib\_py*, SoftwareX 27 (2024), [doi:10.1016/j.softx.2024.101811](https://doi.org/10.1016/j.softx.2024.101811): otevřená analýza dat GNSS.
- Li, Zaminpardaz, Kealy & Greentree — *Quantum sensors for enhanced positioning and navigation: a comprehensive review*, GPS Solutions 30(1):62 (2026), [doi:10.1007/s10291-026-02030-y](https://doi.org/10.1007/s10291-026-02030-y).
- Bertone et al. — *Earth and Space Science* 8(6) (2021), [doi:10.1029/2020EA001454](https://doi.org/10.1029/2020EA001454): OD GRAIL se sníženou dynamikou, spodní mez empirického zrychlení, kterou proložení LRO reprodukuje.

</details>
